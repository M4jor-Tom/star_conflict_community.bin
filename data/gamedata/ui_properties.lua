DailyRewardIco = 
{
	"credits_SmallCreditPack",
	"credits_MediumCreditPack",
	"credits_BigCreditPack",
	"credits_HudgeCreditPack",
	"mail_attachment_loyalty",
}

PlayerStatusSortOrder = 
{
	"USER_STATE_ONLINE",
	"USER_STATE_NOT_AVAILABLE",
	"USER_STATE_OFFLINE",
}

GameplaySortOrder = 
{
	{
		name = "PVP_category",
		"SECTOR_CAPTURE",
	},
	{
		name = "TRAINING_category",
		"TRAINING",
		ignore = true,
	},
	{
		name = "ARCADE_category",
		"ARCADE",
	},
	{
		name = "PVE_category",
		"PVE",
		ignore = true,
	},
	{
		name = "FREE_SPACE_category",
		"FREE_SPACE",
	},
	-- fake for SINGLE gameplay (it never visible on gameplay wnd)
	{
		name = "IGNORE",
		"SINGLE",
		"FOREFRONT",
		ignore = true,
	},
}

mmValueToRankRange = {
	[ 14 ] = { 1, 3 },
	[ 15 ] = { 1, 3 },
	[ 16 ] = { 1, 3 },
	[ 17 ] = { 1, 3 },
	[ 18 ] = { 1, 3 },
	[ 19 ] = { 1, 3 },
	[ 20 ] = { 1, 3 },
	[ 21 ] = { 1, 3 },
	[ 22 ] = { 4, 6 },
	[ 23 ] = { 4, 6 },
	[ 24 ] = { 4, 6 },
	[ 25 ] = { 4, 6 },
	[ 26 ] = { 4, 6 },
	[ 27 ] = { 4, 6 },
	[ 28 ] = { 4, 6 },
	[ 29 ] = { 7, 9 },
	[ 30 ] = { 7, 9 },
	[ 31 ] = { 7, 9 },
	[ 32 ] = { 7, 9 },
	[ 33 ] = { 7, 9 },
	[ 34 ] = { 7, 9 },
	[ 35 ] = { 7, 9 },
	[ 36 ] = { 10, 12 },
	[ 37 ] = { 10, 12 },
	[ 38 ] = { 10, 12 },
	[ 39 ] = { 10, 12 },
	[ 40 ] = { 10, 12 },
	[ 41 ] = { 10, 12 },
	[ 42 ] = { 10, 12 },
	[ 43 ] = { 13, 15 },
	[ 44 ] = { 13, 15 },
	[ 45 ] = { 13, 15 },
	[ 46 ] = { 13, 15 },
	[ 47 ] = { 13, 15 },
	[ 48 ] = { 13, 15 },
	[ 49 ] = { 13, 15 },
	[ 50 ] = { 13, 15 },
	[ 51 ] = { 13, 15 },
	[ 52 ] = { 13, 15 },
	[ 53 ] = { 13, 15 },
	[ 54 ] = { 13, 15 },
	[ 55 ] = { 13, 15 },
	[ 56 ] = { 13, 15 },
}

maxShipRank = 17

PlayerLeaderboardList = 
{
    {
        name = "rating_weekly",
        -- highlight = true,
        subCategories =
        {
            { name = "player_eff_rating_weekly", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, reward = true },
            { name = "player_pvp_eff_max_weekly", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, reward = true },
            { name = "player_kills_weekly", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, reward = true },
            { name = "player_pve_win_weekly", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, reward = true },
        },
    },
    {
        name = "rating_player",
		highlight = true,
        subCategories =
        {
            { name = "player_prestige", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_pvp_effectiveness", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_pve_effectiveness", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_battles", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_wins", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_kills", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_karma_good", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_karma_bad", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_goals", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_hunger", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, },
            { name = "player_pressure", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
			--{ name = "player_april_win", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, highlight = true },
			{ name = "player_zm_win_humans", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER,  },
			{ name = "player_zm_win_zombies", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER,  },
			--{ name = "autogen_dm", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, highlight = true },
			{ name = "three_teams_dm_kills", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER,  },
			{ name = "aprilcontrolgwin", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER,  },
			{ name = "player_cd_win", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER,  },
			{ name = "player_kills_marathon", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, },
			{ name = "one_against_all_boss_win", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, highlight = true },
			{ name = "one_against_all_hunter_eff", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER, highlight = true },
        },
    },
    {
        name = "player_time_pve_raid_categorie",
        subCategories =
        {
            { name = "player_time_pve_raid", type="time", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_time_pve_raid_waterharvest_t3", type="time", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_time_pve_raid_waterharvest_t4", type="time", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_time_pve_raid_waterharvest_t5", type="time", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "player_time_pve_planetoidraid", type="time", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
        },
    },
    {
        name = "player_unlim_pve",
        subCategories =
        {
            { name = "player_wavePve_wave", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "unlim_pve_level_planet_war_waves_T1", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "unlim_pve_level_rescue_pirates_base", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "unlim_pve_level_magnificent_seven", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
			{ name = "unlim_pve_level_stealth", entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
        },
    },
    {
        name = "rating_cls",
        subCategories =
        {
            { name = "CLS_PVP_RATING", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
            { name = "CLS_PVE_RATING", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
            { name = "CLS_WAR_DAMAGE", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
            { name = "CLS_ZONE_CAPTURE", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
            { name = "CLS_WAR_RATING", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
            { name = "CLS_WAR_RATING_MAX", entityType = MasterServer.LeaderboardEntityType.LET_CLAN },
        },
    },
    {
        name = "event_faction_war",
        subCategories =
        {
            { name = "event_faction_war_empire",  entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "event_faction_war_federation",  entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "event_faction_war_jericho",  entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
            { name = "event_faction_war_pirate",  entityType = MasterServer.LeaderboardEntityType.LET_PLAYER },
        },
    },
}

ClanMemberLeaderboardsList = 
{
    { name = "cm_pvp_effectiveness", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
    { name = "cm_pve_effectiveness", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
    { name = "cm_pressure", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
    { name = "cm_military_rank", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
    { name = "cm_war_damage", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
    { name = "cm_war_losses", entityType = MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER },
}

PveMissionsList = 
{
	"s1550_pve_bigship_building",
	"s1347_geostation",
	"s1550_pve_capture_repairbase",
	"s1515_piratebay",
	"s1550_pve_asteroid_building",
	"pve_jericho_base",
	"pve_frozen_station",
	"pve_desttown",
}

GameplaysInfoList =
{
	ai.Gameplay.TDM,
	ai.Gameplay.CONTROL,
	ai.Gameplay.SENTINEL,
	ai.Gameplay.KING_OF_THE_HILL,
	ai.Gameplay.BOMB_THE_BASE,
	ai.Gameplay.CAPTURE_THE_BASE,
}

ShipClassToRoles =
{
    [ ai.ShipClass.SMALL ] = { ai.ShipRoles.ECM, ai.ShipRoles.SCOUT, ai.ShipRoles.RECON },
    [ ai.ShipClass.MEDIUM ] = { ai.ShipRoles.ATTACK, ai.ShipRoles.COMMAND, ai.ShipRoles.TACKLER },
    [ ai.ShipClass.LARGE ] = { ai.ShipRoles.SNIPER, ai.ShipRoles.GUARD, ai.ShipRoles.ENGINEER },
	[ ai.ShipClass.HUGE ] = { ai.ShipRoles.OVERSEER },
}

DLCList = 
{
    {
        name 			= "Merc1",
        steam_url 		= "http://store.steampowered.com/app/222280/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=4201",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=4201",
        arc_bundle 		= "Bundle_Arc_DLC_Merc1",
        steam_appId 	= 222280,
        yuplay_guid_ru 	= "C3850D90-AAB2-4FE6-AC06-19C94BBD449F",
        yuplay_guid 	= "056B6F28-535E-43E5-9E3F-08A22308DFA4",
    },
    {
        name 			= "Merc2",
        steam_url 		= "http://store.steampowered.com/app/222281/",
        --yuplay_url_ru = "http://online.gaijinent.com/story.php?id=4206",
        --yuplay_url 	= "http://online.gaijinent.com/story.php?id=4206",
        yuplay_url_ru 	= "http://store.gaijin.net/story.php?title=Galaxy-Explorer-bundle",
        yuplay_url 		= "http://store.gaijin.net/story.php?title=Galaxy-Explorer-bundle",
        arc_bundle 		= "Bundle_Arc_DLC_Merc2",
        steam_appId 	= 222281,
        yuplay_guid_ru 	= "FD6A177A-DF0E-46DD-9110-8F61EB7C1F51",
        yuplay_guid 	= "AE3927D7-2E1D-40D9-AD93-1A4C397F88C3",
		hidden 			= true,
    },
    {
        name 			= "Merc3",
        steam_url 		= "http://store.steampowered.com/app/222282/",
        --yuplay_url_ru = "http://online.gaijinent.com/story.php?id=4204",
        --yuplay_url 	= "http://online.gaijinent.com/story.php?id=4204",
        yuplay_url_ru 	= "http://store.gaijin.net/story.php?title=Elite-Pilot-bundle",
        yuplay_url 		= "http://store.gaijin.net/story.php?title=Elite-Pilot-bundle",
        arc_bundle 		= "Bundle_Arc_DLC_Merc3",
        steam_appId 	= 222282,
        yuplay_guid_ru 	= "E1E3598F-F2D1-40A2-A35D-30CA7E2DFA1A",
        yuplay_guid 	= "E82F66B4-359F-42DD-AC73-DDC20FB7782A",
		hidden 			= true,
    },
    {
        name 			= "Pirate1",
        steam_url 		= "http://store.steampowered.com/app/222283/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=4195",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=4195",
        arc_bundle 		= "Bundle_Arc_DLC_Pirate1",
        steam_appId 	= 222283,
        yuplay_guid_ru 	= "59299992-7235-4FB6-9254-008ED85D9F40",
        yuplay_guid 	= "D62848D1-2FE6-43FB-A34A-18C073733C18",
		hidden 			= true,
    },
    {
        name 			= "Pirate2",
        steam_url		= "http://store.steampowered.com/app/222284/",
        yuplay_url_ru 	= "http://store.gaijin.net/story.php?title=Jolly-Roger-bundle",
        yuplay_url 		= "http://store.gaijin.net/story.php?title=Jolly-Roger-bundle",
        arc_bundle 		= "Bundle_Arc_DLC_Pirate2",
        steam_appId		= 222284,
        yuplay_guid_ru 	= "C9C39A1A-9576-4AEC-BA34-010F65A8C453",
        yuplay_guid 	= "5B9ADAB1-0303-4FAB-8A51-C7A3ECED7404",
		hidden 			= true,
    },
    {
        name 			= "Pirate3",
        steam_url 		= "http://store.steampowered.com/app/222285/",
        yuplay_url_ru 	= "http://store.gaijin.net/story.php?title=Dead-mans-chest-bundle",
        yuplay_url 		= "http://store.gaijin.net/story.php?title=Dead-mans-chest-bundle",
        arc_bundle	 	= "Bundle_Arc_DLC_Pirate3",
        steam_appId 	= 222285,
        yuplay_guid_ru 	= "AD6D5A37-1998-421A-99C0-EA6B8D3E6490",
        yuplay_guid 	= "4A246300-53D0-48EF-AD2A-5EDA7484BB45",
		hidden 			= true,
    },
    {
        -- Loki
        name 			= "Fleet1",
        steam_url 		= "http://store.steampowered.com/app/397120/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5033",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5033",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet1",
        steam_appId 	= 397120,
        yuplay_guid_ru 	= "EFC3C501-1911-49CF-8C04-5C6FF43BA8BA",
        yuplay_guid 	= "8BB4FA66-8C5A-4375-85F8-9C2C1F21479E",
        hidden 			= true,
    },
    {
        -- Razor
        name 			= "Fleet2",
        steam_url 		= "http://store.steampowered.com/app/397121/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5032",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5032",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet2",
        steam_appId 	= 397121,
        yuplay_guid_ru 	= "D65BF4BE-092F-4200-81AD-602F3A8788D2",
        yuplay_guid 	= "C47DB451-C61C-47E4-BB36-74A3A59468BB",
        hidden 			= true,
    },
    {
        -- Blood Tormentor
        name 			= "Fleet3",
        steam_url 		= "http://store.steampowered.com/app/397122/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5031",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5031",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet3",
        steam_appId 	= 397122,
        yuplay_guid_ru 	= "FD1782D4-6B24-4748-9B90-4C4ADF618ADA",
        yuplay_guid 	= "2B8F06DD-32A1-4D52-9349-EA5E2F32B1C9",
        hidden 			= true,
    },
    {
        -- Sawtooth
        name 			= "Fleet4",
        steam_url 		= "http://store.steampowered.com/app/397123/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5030",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5030",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet4",
        steam_appId 	= 397123,
        yuplay_guid_ru 	= "D6356A3B-9638-4295-A940-FB19864DA25B",
        yuplay_guid 	= "B09EDB2E-263B-48ED-82A0-3CADFC2EEF02",
        hidden 			= true,
    },
    {
        -- Cutter
        name 			= "Fleet5",
        steam_url 		= "http://store.steampowered.com/app/397124/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5029",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5029",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet5",
        steam_appId 	= 397124,
        yuplay_guid_ru 	= "7E56D674-F713-420E-80C0-6CCD486BDC29",
        yuplay_guid 	= "05B9900C-0CF7-4240-AC73-4B47E787678D",
        hidden 			= true,
    },
    {
        -- Mauler
        name 			= "Fleet6",
        steam_url 		= "http://store.steampowered.com/app/397125/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5034",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5034",
        arc_bundle 		= "Bundle_Arc_DLC_Fleet6",
        steam_appId 	= 397125,
        yuplay_guid_ru 	= "BFA186BE-F4DD-4674-8247-DC494B2175FB",
        yuplay_guid 	= "CB464C95-C498-40E1-8A35-418C3056303D",
        hidden 			= true,
    },
    {
        -- Nyx
        name 			= "Dogs1",
        steam_url 		= "http://store.steampowered.com/app/397126/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=5035",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=5035",
        arc_bundle 		= "Bundle_Arc_DLC_Dogs1",
        steam_appId 	= 397126,
        yuplay_guid_ru 	= "AE703951-7B4A-422C-B60D-F76577D0EC0D",
        yuplay_guid 	= "5EB5E3ED-3D5D-436E-844B-58B156CA1CDD",
        hidden 			= true,
    },
    {
        -- UFO
        name 			= "Ufo1",
        steam_url 		= "http://store.steampowered.com/app/797150/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6043",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6043",
        arc_bundle 		= "Bundle_Arc_DLC_Ufo1",
        steam_appId 	= 797150,
        yuplay_guid_ru 	= "84F2FEFB-6B94-4730-81F0-BCC5F7E84D1D",
        yuplay_guid 	= "84F2FEFB-6B94-4730-81F0-BCC5F7E84D1D",
        hidden 			= true,
    },
    {
        -- Эсминец Эволюции. Стартовый набор
        name 			= "Evo1",
        steam_url 		= "http://store.steampowered.com/app/991773/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6581",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6581",
        steam_appId 	= 991773,
        yuplay_guid_ru 	= "90C25E12-B9F2-41CA-87BC-254174956571",
        yuplay_guid 	= "90C25E12-B9F2-41CA-87BC-254174956571",
        hidden 			= true,
    },
    {
        -- Эсминец Эволюции. ViP
        name 			= "Evo2",
        steam_url 		= "http://store.steampowered.com/app/991774/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6582",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6582",
        steam_appId 	= 991774,
        yuplay_guid_ru 	= "2F2B05B4-A547-42A2-ACE6-42E3596458B7",
        yuplay_guid 	= "2F2B05B4-A547-42A2-ACE6-42E3596458B7",
        hidden 			= true,
    },
    {
        -- Sirius
        name 			= "Sirius",
        steam_url 		= "https://store.steampowered.com/app/1092693",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6886",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6886",
        steam_appId 	= 1092693,
        yuplay_guid_ru 	= "2361F7FD-8267-4D85-A078-9E704E613583",
        yuplay_guid 	= "2361F7FD-8267-4D85-A078-9E704E613583",
        hidden 			= true,
    },
    {
        -- Vigilant
        name 			= "Vigilant",
        steam_url 		= "https://store.steampowered.com/app/1092695",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6888",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6888",
        steam_appId 	= 1092695,
        yuplay_guid_ru 	= "D88DA551-A078-4B08-AD88-8FA53E8CF594",
        yuplay_guid 	= "D88DA551-A078-4B08-AD88-8FA53E8CF594",
        hidden 			= true,
    },
    {
        -- Tyrant
        name 			= "Tyrant",
        steam_url 		= "https://store.steampowered.com/app/1092694",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6887",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6887",
        steam_appId 	= 1092694,
        yuplay_guid_ru 	= "F79FB313-2728-466F-8461-C8B56278A01E",
        yuplay_guid 	= "F79FB313-2728-466F-8461-C8B56278A01E",
        hidden 			= true,
    },
    {
        -- Invincible
        name 			= "Invincible",
        steam_url 		= "https://store.steampowered.com/app/1092690",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6890",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6890",
        steam_appId 	= 1092690,
        yuplay_guid_ru 	= "B2D54CB4-EA72-4865-85C5-3A6E3337AF36",
        yuplay_guid 	= "B2D54CB4-EA72-4865-85C5-3A6E3337AF36",
        hidden 			= true,
    },
    {
        -- Procyon
        name 			= "Procyon",
        steam_url 		= "https://store.steampowered.com/app/1092692",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6891",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6891",
        steam_appId 	= 1092692,
        yuplay_guid_ru 	= "C0A44577-FC0E-4692-A0A2-8AA4B7AFC72A",
        yuplay_guid 	= "C0A44577-FC0E-4692-A0A2-8AA4B7AFC72A",
        hidden 			= true,
    },
    {
        -- Archon
        name 			= "Archon",
        steam_url 		= "https://store.steampowered.com/app/1092691",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6889",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6889",
        steam_appId 	= 1092691,
        yuplay_guid_ru 	= "FBB819A5-E481-4586-ACAC-ECED9218C03B",
        yuplay_guid 	= "FBB819A5-E481-4586-ACAC-ECED9218C03B",
        hidden 			= true,
    },
    {
        -- Thar'Ga DeLuxe
        name 			= "ThargaDeluxe",
        steam_url		= "https://store.steampowered.com/app/1040040",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6749",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6749",
        steam_appId 	= 1040040,
        yuplay_guid_ru 	= "D7C715F4-C272-4BD8-8E41-7FB9664A0DC5",
        yuplay_guid 	= "D7C715F4-C272-4BD8-8E41-7FB9664A0DC5",
        hidden 			= true,
    },
    {
        -- Pilgrim
        name 			= "Pilgrim",
        steam_url 		= "https://store.steampowered.com/app/1049650",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6779",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6779",
        steam_appId 	= 1049650,
        yuplay_guid_ru 	= "20ACF02A-82EB-4E91-A84B-96A1A278B346",
        yuplay_guid 	= "20ACF02A-82EB-4E91-A84B-96A1A278B346",
        hidden 			= true,
    },
    {
        -- Tai'Kin DeLuxe
        name 			= "TaiKinDeluxe",
        steam_url 		= "https://store.steampowered.com/app/1040041",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6750",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6750",
        steam_appId 	= 1040041,
        yuplay_guid_ru 	= "92DCF985-767E-4061-84A8-82A9C96CAA02",
        yuplay_guid 	= "92DCF985-767E-4061-84A8-82A9C96CAA02",
        hidden 			= true,
    },
    {
        -- Waz'Got DeLuxe
        name 			= "WazGotDeLuxe",
        steam_url 		= "https://store.steampowered.com/app/1040042",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=6751",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=6751",
        steam_appId 	= 1040042,
        yuplay_guid_ru 	= "2276178E-9B48-472F-B7B6-FFED77861B83",
        yuplay_guid 	= "2276178E-9B48-472F-B7B6-FFED77861B83",
        hidden 			= true,
    },
    {
        -- Halloween
        name 			= "Halloween",
        steam_url 		= "https://store.steampowered.com/app/1176740",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7073",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7073",
        steam_appId 	= 1176740,
        yuplay_guid_ru 	= "1262EA4B-0741-4871-A31B-A56FB4F5D8BC",
        yuplay_guid 	= "1262EA4B-0741-4871-A31B-A56FB4F5D8BC",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 1 день
        name 			= "DailyLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7109",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7109",
        yuplay_guid_ru 	= "DADF97F1-4D9B-4456-9329-61401D2CBCD6",
        yuplay_guid 	= "DADF97F1-4D9B-4456-9329-61401D2CBCD6",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 3 дня
        name 			= "ThreeDayLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7110",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7110",
        yuplay_guid_ru 	= "0B84F382-8046-4D10-8B6D-2970FA88137B",
        yuplay_guid 	= "0B84F382-8046-4D10-8B6D-2970FA88137B",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 7 дней
        name 			= "WeeklyLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7111",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7111",
        yuplay_guid_ru 	= "E4C24E78-55DB-4075-8FE8-1CBB47BB1C9E",
        yuplay_guid 	= "E4C24E78-55DB-4075-8FE8-1CBB47BB1C9E",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 30 дней
        name 			= "MonthlyLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7112",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7112",
        yuplay_guid_ru 	= "4D4756C6-8D6B-4CC6-A4BD-D3DD4B302F3C",
        yuplay_guid 	= "4D4756C6-8D6B-4CC6-A4BD-D3DD4B302F3C",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 90 дней
        name 			= "HalfAnnualLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7113",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7113",
        yuplay_guid_ru 	= "4989D7A7-9DFC-4E79-B3FC-B49F523B23D1",
        yuplay_guid 	= "4989D7A7-9DFC-4E79-B3FC-B49F523B23D1",
        hidden 			= true,
    },
    {
        -- премиум-лицензия на 180 дней
        name 			= "AnnualLicenseCard",
		steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7114",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7114",
        yuplay_guid_ru 	= "65469A14-819E-4D88-8B7A-6FE312149CFC",
        yuplay_guid 	= "65469A14-819E-4D88-8B7A-6FE312149CFC",
        hidden 			= true,
    },
    {
        -- Battle pass
        name 			= "BattlePass",
        steam_url 		= "https://store.steampowered.com/app/1174360",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7163",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7163",
        steam_appId 	= 1174360,
        yuplay_guid_ru 	= "B2E4C74E-2590-42B2-8B39-04EE3DDB2001",
        yuplay_guid 	= "B2E4C74E-2590-42B2-8B39-04EE3DDB2001",
        hidden 			= true,
    },
    {
        -- Battle pass vip
        name 			= "BattlePassVip",
        steam_url 		= "https://store.steampowered.com/app/1174520",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7164",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7164",
        steam_appId 	= 1174520,
        yuplay_guid_ru 	= "6B0B3628-ACBC-4A65-AD39-197DD55E3CA7",
        yuplay_guid 	= "6B0B3628-ACBC-4A65-AD39-197DD55E3CA7",
        hidden 			= true,
    },
    {
        -- Кустодиан 1200р
        name 			= "Custodian",
        steam_url 		= "https://store.steampowered.com/app/1158800",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7096",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7096",
        steam_appId 	= 1158800,
        yuplay_guid_ru 	= "FC64199E-996B-43E3-A6D2-23BB621BF93F",
        yuplay_guid 	= "FC64199E-996B-43E3-A6D2-23BB621BF93F",
        hidden 			= true,
    },
	{
        -- Кустодиан Delux
        name 			= "Custodian_Delux",
        steam_url 		= "https://store.steampowered.com/app/1454630",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9581",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9581",
        steam_appId 	= 1454630,
        yuplay_guid_ru 	= "F3061FE1-75CA-44C7-B0E8-7612248754D3",
        yuplay_guid 	= "F3061FE1-75CA-44C7-B0E8-7612248754D3",
        hidden 			= true,
    },
    {
        -- Ze'ta DeLuxe
        name = "ZetaDeluxe",
        steam_url 		= "https://store.steampowered.com/app/1194500",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=7249",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=7249",
        steam_appId 	= 1194500,
        yuplay_guid_ru 	= "BD0836B5-9A60-420C-86D3-CBB3E673DAF2",
        yuplay_guid 	= "BD0836B5-9A60-420C-86D3-CBB3E673DAF2",
        hidden 			= true,
    },
    {
        -- Сцилла DeLuxe 3899р
        name 			= "Scylla",
        steam_url 		= "https://store.steampowered.com/app/1258240",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8306",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8306",
        steam_appId 	= 1258240,
        yuplay_guid_ru 	= "20A54EDD-8AD4-4CD3-9F95-83586B3E3338",
        yuplay_guid 	= "20A54EDD-8AD4-4CD3-9F95-83586B3E3338",
        hidden 			= true,
    },
    {
        -- April / Papa Crab
        name = "PapaCrab",
        steam_url 		= "https://store.steampowered.com/app/1237200",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8201",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8201",
        steam_appId 	= 1237200,
        yuplay_guid_ru 	= "5BFDEED0-6AB8-4D18-B951-CC2DD31352A7",
        yuplay_guid 	= "5BFDEED0-6AB8-4D18-B951-CC2DD31352A7",
        hidden 			= true,
    },
	{
        -- April / Papa Crab Deluxe
        name 			= "PapaCrab_Deluxe",
        steam_url 		= "https://store.steampowered.com/app/1564910",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9833",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9833",
        steam_appId 	= 1564910,
        yuplay_guid_ru 	= "D580197F-3270-4F2A-9D07-6A834903A502",
        yuplay_guid 	= "D580197F-3270-4F2A-9D07-6A834903A502",
        hidden 			= true,
    },
    {
        -- Guardians S / SC-113428 Длц из серебряных кораблей: диверсант федерации
        name 			= "GuardiansS",
		steam_url 		= "https://store.steampowered.com/app/1531392",
		steam_appId 	= 1531392,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8411",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8411",
        yuplay_guid_ru 	= "23F3D2F5-3DAB-4108-9AA3-17E4DABAB2C4",
        yuplay_guid 	= "23F3D2F5-3DAB-4108-9AA3-17E4DABAB2C4",
        hidden 			= true,
    },
    {
        -- Guardians M / SC-113427 ДЛЦ из серебряных кораблей: Ударка Империи
        name 			= "GuardiansM",
		steam_url 		= "https://store.steampowered.com/app/1531391",
		steam_appId 	= 1531391,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8410",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8410",
        yuplay_guid_ru 	= "6944836A-980E-4A80-81B5-C55A3EF5BE9F",
        yuplay_guid 	= "6944836A-980E-4A80-81B5-C55A3EF5BE9F",
        hidden 			= true,
    },
    {
        -- Guardians L / SC-113426 ДЛЦ из серебряных кораблей: Снайпер Иерихона
        name 			= "GuardiansL",
		steam_url 		= "https://store.steampowered.com/app/1531393",
		steam_appId 	= 1531393,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8409",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8409",
        yuplay_guid_ru 	= "6A5E72EB-E93E-4DE2-BB26-B01DB03C3E9D",
        yuplay_guid 	= "6A5E72EB-E93E-4DE2-BB26-B01DB03C3E9D",
        hidden 			= true,
    },
    {
        -- Gungnir DeLuxe
        name 			= "Gungnir",
        steam_url 		= "https://store.steampowered.com/app/1297051",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8413",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8413",
        steam_appId 	= 1297051,
        yuplay_guid_ru 	= "AAF79B8D-FC96-4B55-B098-F9F7850C904E",
        yuplay_guid 	= "AAF79B8D-FC96-4B55-B098-F9F7850C904E",
        hidden 			= true,
    },
    {
        -- Сцилла Базовый
        name 			= "Scylla_Base",
        steam_url 		= "https://store.steampowered.com/app/1268120",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8366",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8366",
        steam_appId 	= 1268120,
        yuplay_guid_ru 	= "85F58716-ABC6-43EE-9BEA-016791326FBF",
        yuplay_guid 	= "85F58716-ABC6-43EE-9BEA-016791326FBF",
        hidden 			= true,
    },
    {
        -- Gungnir Базовый
        name 			= "Gungnir_Base",
        steam_url 		= "https://store.steampowered.com/app/1297050",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8412",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8412",
        steam_appId 	= 1297050,
        yuplay_guid_ru 	= "E6725721-A3B1-4040-B9C5-90F114BF14D9",
        yuplay_guid 	= "E6725721-A3B1-4040-B9C5-90F114BF14D9",
        hidden 			= true,
    },
    {
        -- Battle pass 2020 1
        name 			= "BattlePass_2020_1",
        steam_url 		= "https://store.steampowered.com/app/1323940",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8512",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8512",
        steam_appId 	= 1323940,
        yuplay_guid_ru 	= "2C33B160-827B-498E-A624-5D50260A8BDA",
        yuplay_guid 	= "2C33B160-827B-498E-A624-5D50260A8BDA",
        hidden 			= true,
    },
    {
        -- Battle pass 2020 1 vip
        name 			= "BattlePassVip_2020_1",
        steam_url 		= "https://store.steampowered.com/app/1323941",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=8513",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=8513",
        steam_appId 	= 1323941,
        yuplay_guid_ru 	= "0109F559-A8A8-433D-8476-01E4A808E5D5",
        yuplay_guid 	= "0109F559-A8A8-433D-8476-01E4A808E5D5",
        hidden 			= true,
    },
    {
        -- Battle pass 2020 2
        name 			= "BattlePass_2020_2",
        steam_url 		= "https://store.steampowered.com/app/1364050",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9252",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9252",
        steam_appId 	= 1364050,
        yuplay_guid_ru 	= "68588152-0A32-4C5F-BD6A-7C21CA61C66B",
        yuplay_guid 	= "68588152-0A32-4C5F-BD6A-7C21CA61C66B",
        hidden 			= true,
    },
    {
        -- Battle pass 2020 2 vip
        name 			= "BattlePassVip_2020_2",
        steam_url 		= "https://store.steampowered.com/app/1364051",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9253",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9253",
        steam_appId 	= 1364051,
        yuplay_guid_ru 	= "3C62B961-831B-4A68-B6B5-A6FCFF948214",
        yuplay_guid 	= "3C62B961-831B-4A68-B6B5-A6FCFF948214",
        hidden 			= true,
    },
	{
        -- Battle pass NY2021 1
        name 			= "BattlePass_NY2021_1",
        steam_url 		= "https://store.steampowered.com/app/1477670",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9705",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9705",
        steam_appId 	= 1477670,
        yuplay_guid_ru 	= "E61DDB56-4C91-4FB7-875F-55C14F7C668E",
        yuplay_guid 	= "E61DDB56-4C91-4FB7-875F-55C14F7C668E",
        hidden 			= true,
    },
    {
        -- Battle pass NY2021 1 vip
        name 			= "BattlePassVip_NY2021_1",
        steam_url 		= "https://store.steampowered.com/app/1477671",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9706",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9706",
        steam_appId 	= 1477671,
        yuplay_guid_ru 	= "CEC35A8A-9E9D-43DA-B363-AC9652CD3489",
        yuplay_guid 	= "CEC35A8A-9E9D-43DA-B363-AC9652CD3489",
        hidden 			= true,
    },
	    {
        -- Battle pass NY2021 1 +level
        name 			= "BattlePassLvl_NY2021_1",
        steam_url 		= "https://store.steampowered.com/app/1477672",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9707",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9707",
        steam_appId 	= 1477672,
        yuplay_guid_ru 	= "3202620A-5A1D-452C-B062-898BD00FA3F7",
        yuplay_guid 	= "3202620A-5A1D-452C-B062-898BD00FA3F7",
        hidden 			= true,
    },
	{
        -- Battle pass NY2021 2
        name 			= "BattlePass_NY2021_2",
        steam_url 		= "https://store.steampowered.com/app/1511151",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9766",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9766",
        steam_appId 	= 1511151,
        yuplay_guid_ru 	= "D6A2E264-5804-4B40-9499-55E32B4836B1",
        yuplay_guid 	= "D6A2E264-5804-4B40-9499-55E32B4836B1",
        hidden 			= true,
    },
    {
        -- Battle pass NY2021 2 vip
        name 			= "BattlePassVip_NY2021_2",
        steam_url 		= "https://store.steampowered.com/app/1511150",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9767",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9767",
        steam_appId 	= 1511150,
        yuplay_guid_ru 	= "63AA5336-313D-4895-B7D5-5B41747503ED",
        yuplay_guid 	= "63AA5336-313D-4895-B7D5-5B41747503ED",
        hidden 			= true,
    },
	{
        -- dlc Star Conflict: Dyrnwyn. Элитный
        name 			= "Dyrnwyn",
        steam_url 		= "https://store.steampowered.com/app/1393591",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9481",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9481",
        steam_appId 	= 1393591,
        yuplay_guid_ru 	= "A402FD00-CD1D-4A14-B088-B6F17E2DB3CE",
        yuplay_guid 	= "A402FD00-CD1D-4A14-B088-B6F17E2DB3CE",
        hidden 			= true,
    },
	{
        -- dlc Star Conflict: Dyrnwyn. Простой
        name 			= "Dyrnwyn_Base",
        steam_url 		= "https://store.steampowered.com/app/1393590",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9480",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9480",
        steam_appId 	= 1393590,
        yuplay_guid_ru	= "6F6D1B44-C417-4DB6-A91D-D4993C9CA11A",
        yuplay_guid		= "6F6D1B44-C417-4DB6-A91D-D4993C9CA11A",
        hidden 			= true,
    },
	{
        -- dlc Star Conflict: Raven. Элитный
        name 			= "Raven",
        steam_url 		= "https://store.steampowered.com/app/1408511",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9498",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9498",
        steam_appId 	= 1408511,
        yuplay_guid_ru	= "A7ABD208-64FE-47DD-9956-523E87B61CFC",
        yuplay_guid		= "A7ABD208-64FE-47DD-9956-523E87B61CFC",
        hidden 			= true,
    },
	{
        -- dlc Star Conflict: Raven. Простой
        name 			= "Raven_Base",
        steam_url 		= "https://store.steampowered.com/app/1408510",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9497",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9497",
        steam_appId 	= 1408510,
        yuplay_guid_ru	= "3CEA11B0-78B8-4D0C-85AC-67C4A5B52276",
        yuplay_guid		= "3CEA11B0-78B8-4D0C-85AC-67C4A5B52276",
        hidden 			= true,
    },
	{
        -- Halloween2020
        name 			= "Halloween2020",
        steam_url 		= "https://store.steampowered.com/app/1426750",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9531",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9531",
        steam_appId 	= 1426750,
        yuplay_guid_ru 	= "F4B2E771-08B5-4522-AAD8-56CEC858C87D",
        yuplay_guid 	= "F4B2E771-08B5-4522-AAD8-56CEC858C87D",
        hidden 			= true,
    },
	{
        -- dlc Dainsleif
        name 			= "Dainsleif",
		steam_url 		= "https://store.steampowered.com/app/1442281",
		steam_appId 	= 1442281,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9548",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9548",
        yuplay_guid_ru	= "6BD7F2EB-FB72-4A86-BA1B-D7D201831F97",
        yuplay_guid		= "6BD7F2EB-FB72-4A86-BA1B-D7D201831F97",
        hidden 			= true,
    },
	{
        -- dlc Pterosaur
        name 			= "Pterosaur",
		steam_url 		= "https://store.steampowered.com/app/1442280",
		steam_appId 	= 1442280,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9547",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9547",
        yuplay_guid_ru	= "3FD9185D-FC71-4645-B4E5-CD9655F00A02",
        yuplay_guid		= "3FD9185D-FC71-4645-B4E5-CD9655F00A02",
        hidden 			= true,
    },
	{
        -- dlc Чумной доктор. Elite
        name 			= "PlagueDoctor",
		steam_url 		= "https://store.steampowered.com/app/1445561",
		steam_appId 	= 1445561,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9566",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9566",
        yuplay_guid_ru	= "924DDFC9-D827-4B39-85C1-00A55E4F5901",
        yuplay_guid		= "924DDFC9-D827-4B39-85C1-00A55E4F5901",
        hidden 			= true,
    },
	{
        -- dlc Чумной доктор
        name 			= "PlagueDoctor_Base",
		steam_url 		= "https://store.steampowered.com/app/1445560",
		steam_appId 	= 1445560,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9565",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9565",
        yuplay_guid_ru	= "004B5077-E083-4A65-BD8D-85E2DB0AC433",
        yuplay_guid		= "004B5077-E083-4A65-BD8D-85E2DB0AC433",
        hidden 			= true,
    },
	{
        -- dlc Tornado. Elite
        name 			= "Tornado",
		steam_url 		= "https://store.steampowered.com/app/1478750",
		steam_appId 	= 1478750,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9711",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9711",
        yuplay_guid_ru	= "F1553D3F-B722-423D-B8BF-7891E51A5881",
        yuplay_guid		= "F1553D3F-B722-423D-B8BF-7891E51A5881",
        hidden 			= true,
    },
	{
        -- dlc Tornado
        name 			= "Tornado_Base",
		steam_url 		= "https://store.steampowered.com/app/1478751",
		steam_appId 	= 1478751,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9710",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9710",
        yuplay_guid_ru	= "D3542AB9-763E-455A-A03B-71024993856C",
        yuplay_guid		= "D3542AB9-763E-455A-A03B-71024993856C",
        hidden 			= true,
    },
    {
        -- Polar Bear
        name			= "PolarBear",
        steam_url		= "https://store.steampowered.com/app/1483490",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9722",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9722",
        steam_appId		= 1483490,
        yuplay_guid_ru	= "151910B3-B928-42CB-893B-F9FF59A35EBF",
        yuplay_guid		= "151910B3-B928-42CB-893B-F9FF59A35EBF",
        hidden			= true,
    },
	{
        -- Polar Bear Deluxe
        name			= "PolarBear_Deluxe",
        steam_url		= "https://store.steampowered.com/app/1483491",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9723",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9723",
        steam_appId		= 1483491,
        yuplay_guid_ru 	= "4DA4AA47-EE8D-4916-98C3-2212AF7B7EAE",
        yuplay_guid 	= "4DA4AA47-EE8D-4916-98C3-2212AF7B7EAE",
        hidden			= true,
    },
	{
        -- Relic
        name			= "Relic_Base",
        steam_url		= "https://store.steampowered.com/app/1522210",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9770",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9770",
        steam_appId		= 1522210,
        yuplay_guid_ru	= "3F68117C-8257-44E1-A90A-E5385F0B7303",
        yuplay_guid		= "3F68117C-8257-44E1-A90A-E5385F0B7303",
        hidden			= true,
    },
	{
        -- Relic Elite
        name			= "Relic",
        steam_url		= "https://store.steampowered.com/app/1522211",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9771",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9771",
        steam_appId		= 1522211,
        yuplay_guid_ru 	= "827CF1C8-1FA1-49AF-9FFB-1DEE3A6E2DFC",
        yuplay_guid 	= "827CF1C8-1FA1-49AF-9FFB-1DEE3A6E2DFC",
        hidden			= true,
    },
	{
        -- Salut-ST
        name			= "SalutST",
        steam_url		= "https://store.steampowered.com/app/1574640",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=9859",
        yuplay_url		= "https://store.gaijin.net/story.php?id=9859",
        steam_appId		= 1574640,
        yuplay_guid_ru	= "17FB5DCB-84E6-4C00-AD4D-3B795E48DB9B",
        yuplay_guid		= "17FB5DCB-84E6-4C00-AD4D-3B795E48DB9B",
        hidden			= true,
    },
	{
        -- Salut-ST Элитный набор
        name			= "SalutST_Deluxe",
        steam_url		= "https://store.steampowered.com/app/1574641",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=9860",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=9860",
        steam_appId		= 1574641,
        yuplay_guid_ru 	= "F7F3B740-3EAF-4225-9772-01D2F334BA94",
        yuplay_guid 	= "F7F3B740-3EAF-4225-9772-01D2F334BA94",
        hidden			= true,
    },
	{
        -- Mole
        name			= "Mole",
        steam_url		= "https://store.steampowered.com/app/1607211",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10077",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10077",
        steam_appId		= 1607211,
        yuplay_guid_ru	= "C380CD10-9467-4769-A160-A919FD853189",
        yuplay_guid		= "C380CD10-9467-4769-A160-A919FD853189",
        --hidden			= true,
    },
	{
        -- Mole Элитный набор
        name			= "Mole_Deluxe",
        steam_url		= "https://store.steampowered.com/app/1607210",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10078",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10078",
        steam_appId		= 1607210,
        yuplay_guid_ru 	= "E497A987-6EB5-4272-A557-8CF80F1598CA",
        yuplay_guid 	= "E497A987-6EB5-4272-A557-8CF80F1598CA",
        hidden			= true,
    },
	{
        -- лицензия Майнера на 10 дней + 50% опыта и кредитов на 30 боев
        name			= "Asteroid_Сonqueror10",
        steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10079",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10079",
        yuplay_guid_ru 	= "DAC9556D-3295-4171-B714-9EAD4FFB80C3",
        yuplay_guid 	= "DAC9556D-3295-4171-B714-9EAD4FFB80C3",
        hidden			= true,
    },
	{
        -- лицензия Майнера на 30 дней + 50% опыта и кредитов на 100 боев
        name			= "Asteroid_Сonqueror30",
        steam_force_yuplay = true,
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10080",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10080",
        yuplay_guid_ru 	= "B367FF0E-05EB-459F-AC94-08D05C351D16",
        yuplay_guid 	= "B367FF0E-05EB-459F-AC94-08D05C351D16",
        hidden			= true,
    },
	{
        -- Battle pass SUM2021 1
        name 			= "BattlePass_SUM2021_1",
        steam_url 		= "https://store.steampowered.com/app/1636290",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10120",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10120",
        steam_appId		= 1636290,
        yuplay_guid_ru 	= "E45D6063-AD9A-43A9-853C-5D7B8E8D72AD",
        yuplay_guid 	= "E45D6063-AD9A-43A9-853C-5D7B8E8D72AD",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2021 1 vip
        name = "BattlePassVip_SUM2021_1",
        steam_url 		= "https://store.steampowered.com/app/1636291",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10121",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10121",
        steam_appId 	= 1636291,
        yuplay_guid_ru 	= "72F95DCF-E627-495E-AF13-AAFCD34DB386",
        yuplay_guid 	= "72F95DCF-E627-495E-AF13-AAFCD34DB386",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2021 1 +level
        name 			= "BattlePassLvl_SUM2021_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10122",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10122",
        yuplay_guid_ru 	= "61BCEE42-66B8-474F-8795-6EC2371D279B",
        yuplay_guid 	= "61BCEE42-66B8-474F-8795-6EC2371D279B",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2021 2
        name 			= "BattlePass_SUM2021_2",
        steam_url 		= "https://store.steampowered.com/app/1636292",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10123",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10123",
        steam_appId 	= 1636292,
        yuplay_guid_ru 	= "027F8197-017C-414F-ADEE-426E874913B6",
        yuplay_guid 	= "027F8197-017C-414F-ADEE-426E874913B6",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2021 2 vip
        name 			= "BattlePassVip_SUM2021_2",
        steam_url 		= "https://store.steampowered.com/app/1636293",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10124",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10124",
        steam_appId 	= 1636293,
        yuplay_guid_ru 	= "ADED8FBC-9CD1-4067-9663-BDBC25D2F8F3",
        yuplay_guid 	= "ADED8FBC-9CD1-4067-9663-BDBC25D2F8F3",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2021 2 +level
        name 			= "BattlePassLvl_SUM2021_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10339",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10339",
        yuplay_guid_ru 	= "4D724FEE-9EE3-4113-87E9-25F2EE5D3600",
        yuplay_guid 	= "4D724FEE-9EE3-4113-87E9-25F2EE5D3600",
        hidden 			= true,
    },
	{
        -- Элитный набор Object NY18
        name 			= "Object_NY18_Deluxe",
        steam_url 		= "http://store.steampowered.com/app/1636294/",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10126",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10126",
        steam_appId 	= 1636294,
        yuplay_guid_ru 	= "E62430E4-314F-4683-8AA3-813CE1C5AE5D",
        yuplay_guid 	= "E62430E4-314F-4683-8AA3-813CE1C5AE5D",
        hidden 			= true,
    },
	{
        -- Emperor
        name			= "Emperor_Base",
        steam_url		= "https://store.steampowered.com/app/1681270",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10320",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10320",
        steam_appId		= 1681270,
        yuplay_guid_ru	= "4B3230A6-540F-41FE-A668-E2BB401C9294",
        yuplay_guid		= "4B3230A6-540F-41FE-A668-E2BB401C9294",
        hidden			= true,
    },
	{
        -- Emperor Elite
        name			= "Emperor",
        steam_url		= "https://store.steampowered.com/app/1681271",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10321",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10321",
        steam_appId		= 1681271,
        yuplay_guid_ru 	= "746B55EF-2F54-4464-A468-0B1A5BF9829B",
        yuplay_guid 	= "746B55EF-2F54-4464-A468-0B1A5BF9829B",
        hidden			= true,
    },
	
	{
        -- Shark
        name			= "Shark",
        steam_url		= "https://store.steampowered.com/app/1695361",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10338",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10338",
        steam_appId		= 1695361,
        yuplay_guid_ru	= "FAB7540A-38F6-4907-A67B-12B3A6DF7993",
        yuplay_guid		= "FAB7540A-38F6-4907-A67B-12B3A6DF7993",
        hidden			= true,
    },
	{
        -- Shark Base
        name			= "Shark_Base",
        steam_url		= "https://store.steampowered.com/app/499484",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10337",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10337",
        steam_appId		= 499484,
        yuplay_guid_ru	= "659DEBBF-6C58-4707-9E1C-52E606CF2E13",
        yuplay_guid		= "659DEBBF-6C58-4707-9E1C-52E606CF2E13",
        hidden			= true,
    },
	
	{
        -- Protazan
        name			= "Protazan",
        steam_url		= "https://store.steampowered.com/app/1695351",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10336",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10336",
        steam_appId		= 1695351,
        yuplay_guid_ru	= "73EE6751-27BA-4101-A36B-CB62590B24B3",
        yuplay_guid		= "73EE6751-27BA-4101-A36B-CB62590B24B3",
        hidden			= true,
    },
	{
        -- Protazan Base
        name			= "Protazan_Base",
        steam_url		= "https://store.steampowered.com/app/1695350",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10335",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10335",
        steam_appId		= 1695350,
        yuplay_guid_ru	= "9629C871-0E1C-46B5-9217-780CC431DBA8",
        yuplay_guid		= "9629C871-0E1C-46B5-9217-780CC431DBA8",
        hidden			= true,
    },
	
	{
        -- Naglfar Base
        name			= "Naglfar_Base",
        steam_url		= "https://store.steampowered.com/app/1758840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10538",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10538",
        steam_appId		= 1758840,
        yuplay_guid_ru	= "683BA6FB-3FB7-49A6-96D9-B0CA9BF0C2E6",
        yuplay_guid		= "683BA6FB-3FB7-49A6-96D9-B0CA9BF0C2E6",
        hidden			= true,
    },
	{
        -- Naglfar Elit
        name			= "Naglfar",
        steam_url		= "https://store.steampowered.com/app/1758841",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10539",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10539",
        steam_appId		= 1758841,
        yuplay_guid_ru	= "333ABEDD-2B56-4937-8B8C-15DE92F3DD74",
        yuplay_guid		= "333ABEDD-2B56-4937-8B8C-15DE92F3DD74",
        hidden			= true,
    },
	
	{
        -- Joker Base
        name			= "Joker_Base",
        steam_url		= "https://store.steampowered.com/app/1798250",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10629",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10629",
        steam_appId		= 1798250,
        yuplay_guid_ru	= "EA0B3418-6014-493B-991B-FA159D51CF81",
        yuplay_guid		= "EA0B3418-6014-493B-991B-FA159D51CF81",
        hidden			= true,
    },
	{
        -- Joker Elit
        name			= "Joker",
        steam_url		= "https://store.steampowered.com/app/1798251",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10630",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10630",
        steam_appId		= 1798251,
        yuplay_guid_ru	= "8E918129-DD1C-43B3-AF0E-9A3AAD99436B",
        yuplay_guid		= "8E918129-DD1C-43B3-AF0E-9A3AAD99436B",
        hidden			= true,
    },
	{
        -- Battle pass NY2022 1
        name 			= "BattlePass_NY2022_1",
        steam_url 		= "https://store.steampowered.com/app/1818130",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10656",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10656",
        steam_appId 	= 1818130,
        yuplay_guid_ru 	= "E47935C1-D5EA-47DB-90FD-ABEE7DCFB98C",
        yuplay_guid 	= "E47935C1-D5EA-47DB-90FD-ABEE7DCFB98C",
        hidden 			= true,
    },
    {
        -- Battle pass NY2022 1 vip
        name 			= "BattlePassVip_NY2022_1",
        steam_url 		= "https://store.steampowered.com/app/1818131",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10657",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10657",
        steam_appId 	= 1818131,
        yuplay_guid_ru 	= "E71ED35A-7030-4B15-9507-58ED5AC1CBBF",
        yuplay_guid 	= "E71ED35A-7030-4B15-9507-58ED5AC1CBBF",
        hidden 			= true,
    },
	{
        -- Battle pass NY2022 1 +level
        name 			= "BattlePassLvl_NY2022_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10660",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10660",
        yuplay_guid_ru 	= "BCA2BE77-F8FD-491C-B922-267D6568359F",
        yuplay_guid 	= "BCA2BE77-F8FD-491C-B922-267D6568359F",
        hidden 			= true,
    },
	{
        -- Battle pass NY2022 2
        name 			= "BattlePass_NY2022_2",
        steam_url 		= "https://store.steampowered.com/app/1818132",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10658",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10658",
        steam_appId 	= 1818132,
        yuplay_guid_ru 	= "1BB78059-8653-41D3-8659-5FF242FC46DB",
        yuplay_guid 	= "1BB78059-8653-41D3-8659-5FF242FC46DB",
        hidden 			= true,
    },
    {
        -- Battle pass NY2022 2 vip
        name 			= "BattlePassVip_NY2022_2",
        steam_url 		= "https://store.steampowered.com/app/1818133",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10659",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10659",
        steam_appId 	= 1818133,
        yuplay_guid_ru 	= "DD34B58A-D0CB-4CDF-A70B-8FA3834541A6",
        yuplay_guid 	= "DD34B58A-D0CB-4CDF-A70B-8FA3834541A6",
        hidden 			= true,
    },
	{
        -- Battle pass NY2022 2 +level
        name 			= "BattlePassLvl_NY2022_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10661",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10661",
        yuplay_guid_ru 	= "1BAE5E52-1CB1-4C85-A5AD-DE663A3114CD",
        yuplay_guid 	= "1BAE5E52-1CB1-4C85-A5AD-DE663A3114CD",
        hidden 			= true,
    },
	
	{
        -- Thor Base
        name			= "Thor_Base",
        steam_url		= "https://store.steampowered.com/app/1819030",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10667",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10667",
        steam_appId		= 1819030,
        yuplay_guid_ru	= "3F2C8F06-8B21-4C32-9578-83FA4228400D",
        yuplay_guid		= "3F2C8F06-8B21-4C32-9578-83FA4228400D",
        hidden			= true,
    },
	{
        -- Thor Elite
        name			= "Thor",
        steam_url		= "https://store.steampowered.com/app/1819031",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10668",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10668",
        steam_appId		= 1819031,
        yuplay_guid_ru	= "58135F5C-03BE-4AED-BE6F-6054ED38AC7C",
        yuplay_guid		= "58135F5C-03BE-4AED-BE6F-6054ED38AC7C",
        hidden			= true,
    },
	
	{
        -- Albireo Base
        name			= "Albireo_Base",
        steam_url		= "https://store.steampowered.com/app/1818136",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10665",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10665",
        steam_appId		= 1818136,
        yuplay_guid_ru	= "2ACFDA18-4167-48F2-BFDE-209129FC4854",
        yuplay_guid		= "2ACFDA18-4167-48F2-BFDE-209129FC4854",
        --hidden			= true,
    },
	{
        -- Albireo Elite
        name			= "Albireo",
        steam_url		= "https://store.steampowered.com/app/1818137",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10666",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10666",
        steam_appId		= 1818137,
        yuplay_guid_ru	= "F212242A-8507-422A-AB8E-2F18001E24A6",
        yuplay_guid		= "F212242A-8507-422A-AB8E-2F18001E24A6",
        hidden			= true,
    },
	
	{
        -- Razor Base
        name			= "Razor_Base",
        steam_url		= "https://store.steampowered.com/app/1818134",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10663",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10663",
        steam_appId		= 1818134,
        yuplay_guid_ru	= "ADC09274-72CC-4861-9677-F022AED4A53F",
        yuplay_guid		= "ADC09274-72CC-4861-9677-F022AED4A53F",
        hidden			= true,
    },
	{
        -- Razor Elite
        name			= "Razor",
        steam_url		= "https://store.steampowered.com/app/1818135",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10664",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10664",
        steam_appId		= 1818135,
        yuplay_guid_ru	= "09731CE3-7C34-4B1F-A25B-B9F98C9116F0",
        yuplay_guid		= "09731CE3-7C34-4B1F-A25B-B9F98C9116F0",
        hidden			= true,
    },
	
	{
        -- Sawtooth Base
        name			= "Sawtooth_Base",
        steam_url		= "https://store.steampowered.com/app/1894490",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10854",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10854",
        steam_appId		= 1894490,
        yuplay_guid_ru	= "2372A967-8024-4D26-8B6A-5E24282BF3F3",
        yuplay_guid		= "2372A967-8024-4D26-8B6A-5E24282BF3F3",
        hidden			= true,
    },
	{
        -- Sawtooth Elite
        name			= "Sawtooth",
        steam_url		= "https://store.steampowered.com/app/1894491",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10855",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10855",
        steam_appId		= 1894491,
        yuplay_guid_ru	= "D0F7B630-84CE-44EA-801D-2FD92A00E37B",
        yuplay_guid		= "D0F7B630-84CE-44EA-801D-2FD92A00E37B",
        hidden			= true,
    },
	
	{
        -- Battle pass SPR2022 1
        name 			= "BattlePass_SPR2022_1",
        steam_url 		= "https://store.steampowered.com/app/1905850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10966",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10966",
        steam_appId		= 1905850,
        yuplay_guid_ru 	= "A27C5999-0AB6-43AC-B623-7DD3F983E3E3",
        yuplay_guid 	= "A27C5999-0AB6-43AC-B623-7DD3F983E3E3",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2022 1 vip
        name 			= "BattlePassVip_SPR2022_1",
        steam_url 		= "https://store.steampowered.com/app/1905851",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10967",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10967",
        steam_appId 	= 1905851,
        yuplay_guid_ru 	= "63FEA9DE-AF0C-4699-B954-481736CB757D",
        yuplay_guid 	= "63FEA9DE-AF0C-4699-B954-481736CB757D",
        hidden = true,
    },
	{
        -- Battle pass SPR2022 2
        name 			= "BattlePass_SPR2022_2",
        steam_url 		= "https://store.steampowered.com/app/1905852",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=10968",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=10968",
        steam_appId 	= 1905852,
        yuplay_guid_ru 	= "208C120F-2266-4C49-BA15-7B2C346AAE65",
        yuplay_guid 	= "208C120F-2266-4C49-BA15-7B2C346AAE65",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2022 2 vip
        name 			= "BattlePassVip_SPR2022_2",
        steam_url 		= "https://store.steampowered.com/app/1905853",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10969",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10969",
        steam_appId		= 1905853,
        yuplay_guid_ru 	= "39E72800-023E-4B3B-A200-8433AE4E110D",
        yuplay_guid 	= "39E72800-023E-4B3B-A200-8433AE4E110D",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2022 1 +level
        name 			= "BattlePassLvl_SPR2022_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10970",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10970",
        yuplay_guid_ru 	= "EFBB465D-3C51-4940-9CE7-A4E5C8A6B5DB",
        yuplay_guid 	= "EFBB465D-3C51-4940-9CE7-A4E5C8A6B5DB",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2022 2 +level
        name 			= "BattlePassLvl_SPR2022_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=10971",
        yuplay_url		= "https://store.gaijin.net/story.php?id=10971",
        yuplay_guid_ru 	= "41145542-68B7-491A-A621-6B93B68ACFD7",
        yuplay_guid 	= "41145542-68B7-491A-A621-6B93B68ACFD7",
        hidden 			= true,
    },
	
	{
        -- Blood Tormentor Base
        name			= "BloodTormentor_Base",
        steam_url		= "https://store.steampowered.com/app/1935020",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11014",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11014",
        steam_appId		= 1935020,
        yuplay_guid_ru	= "9FD93DBD-D7D6-4DF2-9E68-2A3D975EE5FD",
        yuplay_guid		= "9FD93DBD-D7D6-4DF2-9E68-2A3D975EE5FD",
        --hidden			= true,
    },
	{
        -- Blood Tormentor Elite
        name			= "BloodTormentor",
        steam_url		= "https://store.steampowered.com/app/1935021",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11015",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11015",
        steam_appId		= 1935021,
        yuplay_guid_ru	= "5633AA38-04A1-4D2E-8C8C-52AD2765B9AD",
        yuplay_guid		= "5633AA38-04A1-4D2E-8C8C-52AD2765B9AD",
        hidden			= true,
    },
	
	{
        -- Phoenix Base
        name			= "Phoenix_Base",
        steam_url		= "https://store.steampowered.com/app/1941830",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11023",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11023",
        steam_appId		= 1941830,
        yuplay_guid_ru	= "A039465D-76F7-4354-B064-75B49EA59F97",
        yuplay_guid		= "A039465D-76F7-4354-B064-75B49EA59F97",
        --hidden			= true,
    },
	{
        -- Phoenix Elite
        name			= "Phoenix",
        steam_url		= "https://store.steampowered.com/app/1941831",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11024",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11024",
        steam_appId		= 1941831,
        yuplay_guid_ru	= "00BB320C-EC1A-4669-AC96-9E4B2337485A",
        yuplay_guid		= "00BB320C-EC1A-4669-AC96-9E4B2337485A",
        hidden			= true,
    },
	
	{
        -- Kirishima Base
        name			= "Kirishima_Base",
        steam_url		= "https://store.steampowered.com/app/1941120",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11021",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11021",
        steam_appId		= 1941120,
        yuplay_guid_ru	= "68813D47-29B5-4709-9C7D-86126605FE6B",
        yuplay_guid		= "68813D47-29B5-4709-9C7D-86126605FE6B",
        --hidden			= true,
    },
	{
        -- Kirishima Elite
        name			= "Kirishima",
        steam_url		= "https://store.steampowered.com/app/1941121",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11022",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11022",
        steam_appId		= 1941121,
        yuplay_guid_ru	= "4516E104-4D78-4850-B0D8-A20179CE4C2A",
        yuplay_guid		= "4516E104-4D78-4850-B0D8-A20179CE4C2A",
        hidden			= true,
    },
	
	{
        -- Battle pass SUM2022 1
        name 			= "BattlePass_SUM2022_1",
        steam_url 		= "https://store.steampowered.com/app/1985440",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11160",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11160",
        steam_appId		= 1985440,
        yuplay_guid_ru 	= "C09134F8-700B-40DF-AC72-D7CB92E6F69C",
        yuplay_guid 	= "C09134F8-700B-40DF-AC72-D7CB92E6F69C",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2022 1 vip
        name 			= "BattlePassVip_SUM2022_1",
        steam_url 		= "https://store.steampowered.com/app/1985441",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11161",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11161",
        steam_appId 	= 1985441,
        yuplay_guid_ru 	= "1EE914EE-09E1-4960-9F79-07341573D7FB",
        yuplay_guid 	= "1EE914EE-09E1-4960-9F79-07341573D7FB",
        hidden = true,
    },
	{
        -- Battle pass SUM2022 2
        name 			= "BattlePass_SUM2022_2",
        steam_url 		= "https://store.steampowered.com/app/1985442",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11162",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11162",
        steam_appId 	= 1985442,
        yuplay_guid_ru 	= "507A2773-6512-4882-95F5-A03829A19F02",
        yuplay_guid 	= "507A2773-6512-4882-95F5-A03829A19F02",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2022 2 vip
        name 			= "BattlePassVip_SUM2022_2",
        steam_url 		= "https://store.steampowered.com/app/1985443",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11163",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11163",
        steam_appId		= 1985443,
        yuplay_guid_ru 	= "A59B94EC-64D1-4FB7-A9F7-65D56CCAAADE",
        yuplay_guid 	= "A59B94EC-64D1-4FB7-A9F7-65D56CCAAADE",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2022 1 +level
        name 			= "BattlePassLvl_SUM2022_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11164",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11164",
        yuplay_guid_ru 	= "CD3D9F14-D556-4953-91E6-F90CB35A210D",
        yuplay_guid 	= "CD3D9F14-D556-4953-91E6-F90CB35A210D",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2022 2 +level
        name 			= "BattlePassLvl_SUM2022_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11165",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11165",
        yuplay_guid_ru 	= "A99C3B3D-6BDE-482A-9243-7032406B517E",
        yuplay_guid 	= "A99C3B3D-6BDE-482A-9243-7032406B517E",
        hidden 			= true,
    },
	
	{
        -- Cutter Base
        name			= "Cutter_Base",
        steam_url		= "https://store.steampowered.com/app/1985444",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11167",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11167",
        steam_appId		= 1985444,
        yuplay_guid_ru	= "7308E9AA-9F44-4C6F-8920-9BB018CEE141",
        yuplay_guid		= "7308E9AA-9F44-4C6F-8920-9BB018CEE141",
        hidden			= true,
    },
	{
        -- Cutter Elite
        name			= "Cutter",
        steam_url		= "https://store.steampowered.com/app/1985445",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11168",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11168",
        steam_appId		= 1985445,
        yuplay_guid_ru	= "29E53616-5BA4-405C-9A15-B71C801E8AED",
        yuplay_guid		= "29E53616-5BA4-405C-9A15-B71C801E8AED",
        --hidden			= true,
    },
	
	{
        -- Kusarigama Base
        name			= "Kusarigama_Base",
        steam_url		= "https://store.steampowered.com/app/2061380",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11258",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11258",
        steam_appId		= 2061380,
        yuplay_guid_ru	= "E7EC21C9-580E-43AC-9F55-F7A15D226297",
        yuplay_guid		= "E7EC21C9-580E-43AC-9F55-F7A15D226297",
        hidden			= true,
    },
	{
        -- Kusarigama Elite
        name			= "Kusarigama",
        steam_url		= "https://store.steampowered.com/app/2061381",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11259",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11259",
        steam_appId		= 2061381,
        yuplay_guid_ru	= "93241BEF-8490-4ACD-9AB3-A1799F8E7453",
        yuplay_guid		= "93241BEF-8490-4ACD-9AB3-A1799F8E7453",
        --hidden			= true,
    },
	
	{
        -- Battle pass AUT2022 1
        name 			= "BattlePass_AUT2022_1",
        steam_url 		= "https://store.steampowered.com/app/2094450",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11316",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11316",
        steam_appId		= 2094450,
        yuplay_guid_ru 	= "60FDBA44-1DD2-4770-BFED-10902B6C25BE",
        yuplay_guid 	= "60FDBA44-1DD2-4770-BFED-10902B6C25BE",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2022 1 vip
        name 			= "BattlePassVip_AUT2022_1",
        steam_url 		= "https://store.steampowered.com/app/2094451",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11317",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11317",
        steam_appId 	= 2094451,
        yuplay_guid_ru 	= "CCFB7DE8-4026-4BE0-9794-702AA98DBEE3",
        yuplay_guid 	= "CCFB7DE8-4026-4BE0-9794-702AA98DBEE3",
        hidden = true,
    },
	{
        -- Battle pass AUT2022 2
        name 			= "BattlePass_AUT2022_2",
        steam_url 		= "https://store.steampowered.com/app/2094452",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11318",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11318",
        steam_appId 	= 2094452,
        yuplay_guid_ru 	= "C2702720-8503-446C-8F83-7F41E01EC249",
        yuplay_guid 	= "C2702720-8503-446C-8F83-7F41E01EC249",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2022 2 vip
        name 			= "BattlePassVip_AUT2022_2",
        steam_url 		= "https://store.steampowered.com/app/2094453",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11319",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11319",
        steam_appId		= 2094453,
        yuplay_guid_ru 	= "8B5995A9-4CAA-47B8-8AAB-477A4F88210F",
        yuplay_guid 	= "8B5995A9-4CAA-47B8-8AAB-477A4F88210F",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2022 1 +level
        name 			= "BattlePassLvl_AUT2022_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11320",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11320",
        yuplay_guid_ru 	= "672850EA-3B1C-4D24-AD42-807F82A6B992",
        yuplay_guid 	= "672850EA-3B1C-4D24-AD42-807F82A6B992",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2022 2 +level
        name 			= "BattlePassLvl_AUT2022_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11321",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11321",
        yuplay_guid_ru 	= "2B2309E0-D66B-4569-87D6-4FECDA39E026",
        yuplay_guid 	= "2B2309E0-D66B-4569-87D6-4FECDA39E026",
        hidden 			= true,
    },
	
	{
        -- Reaper Base
        name			= "Reaper_Base",
        steam_url		= "https://store.steampowered.com/app/2072790",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11290",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11290",
        steam_appId		= 2072790,
        yuplay_guid_ru	= "74D7EA0B-F53A-4874-B61D-D5C432AE7E92",
        yuplay_guid		= "74D7EA0B-F53A-4874-B61D-D5C432AE7E92",
        hidden			= true,
    },
	{
        -- Reaper Elite
        name			= "Reaper",
        steam_url		= "https://store.steampowered.com/app/2072791",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11289",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11289",
        steam_appId		= 2072791,
        yuplay_guid_ru	= "2277B1CA-17E7-4866-92D3-2037879D2BE2",
        yuplay_guid		= "2277B1CA-17E7-4866-92D3-2037879D2BE2",
        --hidden			= true,
    },
	
	{
        -- Thrasher Base
        name			= "Thrasher_Base",
        steam_url		= "https://store.steampowered.com/app/2177270",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11504",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11504",
        steam_appId		= 2177270,
        yuplay_guid_ru	= "B6500DDB-3273-40DF-A02E-9BA17728BAD0",
        yuplay_guid		= "B6500DDB-3273-40DF-A02E-9BA17728BAD0",
        hidden			= true,
    },
	{
        -- Thrasher Elite
        name			= "Thrasher",
        steam_url		= "https://store.steampowered.com/app/2177271",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11505",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11505",
        steam_appId		= 2177271,
        yuplay_guid_ru	= "04769604-099C-4C56-B574-2C3E7329EED9",
        yuplay_guid		= "04769604-099C-4C56-B574-2C3E7329EED9",
        hidden			= true,
    },
	
	{
        -- Irbis Base
        name			= "Irbis_Base",
        steam_url		= "https://store.steampowered.com/app/2162840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11461",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11461",
        steam_appId		= 2162840,
        yuplay_guid_ru	= "674DD2A8-66B3-46EE-A268-94A7A6D880A1",
        yuplay_guid		= "674DD2A8-66B3-46EE-A268-94A7A6D880A1",
        hidden			= true,
    },
	{
        -- Irbis Elite
        name			= "Irbis",
        steam_url		= "https://store.steampowered.com/app/2162841",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11462",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11462",
        steam_appId		= 2162841,
        yuplay_guid_ru	= "787D3B39-23D1-4FFB-A953-8BF00DBA3E34",
        yuplay_guid		= "787D3B39-23D1-4FFB-A953-8BF00DBA3E34",
        hidden			= true,
    },
	
	{
        -- Bear Base
        name			= "Bear_Base",
        steam_url		= "https://store.steampowered.com/app/2162850",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11463",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11463",
        steam_appId		= 2162850,
        yuplay_guid_ru	= "1E97F71D-1C40-4984-9468-D5AB7B68E0BB",
        yuplay_guid		= "1E97F71D-1C40-4984-9468-D5AB7B68E0BB",
        hidden			= true,
    },
	{
        -- Bear Elite
        name			= "Bear",
        steam_url		= "https://store.steampowered.com/app/2162851",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11464",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11464",
        steam_appId		= 2162851,
        yuplay_guid_ru	= "1408168E-E79F-416A-A49E-A45D715A497C",
        yuplay_guid		= "1408168E-E79F-416A-A49E-A45D715A497C",
        hidden			= true,
    },
	
	{
        -- Battle pass NY2023 1
        name 			= "BattlePass_NY2023_1",
        steam_url 		= "https://store.steampowered.com/app/2220670",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11659",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11659",
        steam_appId		= 2220670,
        yuplay_guid_ru 	= "271CABBA-9721-499C-8301-A7559C434650",
        yuplay_guid 	= "271CABBA-9721-499C-8301-A7559C434650",
        hidden 			= true,
    },
    {
        -- Battle pass NY2023 1 vip
        name 			= "BattlePassVip_NY2023_1",
        steam_url 		= "https://store.steampowered.com/app/2220671",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11660",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11660",
        steam_appId 	= 2220671,
        yuplay_guid_ru 	= "2B2BE523-CEA8-4DA5-B941-A5CCF84C24F5",
        yuplay_guid 	= "2B2BE523-CEA8-4DA5-B941-A5CCF84C24F5",
        hidden = true,
    },
	{
        -- Battle pass NY2023 2
        name 			= "BattlePass_NY2023_2",
        steam_url 		= "https://store.steampowered.com/app/2220672",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11663",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11663",
        steam_appId 	= 2220672,
        yuplay_guid_ru 	= "86095434-6907-493A-96D1-EBA5BA6F08DA",
        yuplay_guid 	= "86095434-6907-493A-96D1-EBA5BA6F08DA",
        hidden 			= true,
    },
    {
        -- Battle pass NY2023 2 vip
        name 			= "BattlePassVip_NY2023_2",
        steam_url 		= "https://store.steampowered.com/app/2220673",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11664",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11664",
        steam_appId		= 2220673,
        yuplay_guid_ru 	= "C19F8A32-EB4D-4FF1-AC70-A6B958260D67",
        yuplay_guid 	= "C19F8A32-EB4D-4FF1-AC70-A6B958260D67",
        hidden 			= true,
    },
	{
        -- Battle pass NY2023 1 +level
        name 			= "BattlePassLvl_NY2023_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11662",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11662",
        yuplay_guid_ru 	= "3DF55081-4D80-4D5D-AC4A-29E9E3C16775",
        yuplay_guid 	= "3DF55081-4D80-4D5D-AC4A-29E9E3C16775",
        hidden 			= true,
    },
	{
        -- Battle pass NY2023 2 +level
        name 			= "BattlePassLvl_NY2023_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11665",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11665",
        yuplay_guid_ru 	= "493FC98A-A638-40F2-B285-C7236EB90DD9",
        yuplay_guid 	= "493FC98A-A638-40F2-B285-C7236EB90DD9",
        hidden 			= true,
    },
	
	{
        -- Nordstorm Base
        name			= "Nordstorm_Base",
        steam_url		= "https://store.steampowered.com/app/2221880",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11674",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11674",
        steam_appId		= 2221880,
        yuplay_guid_ru	= "A1C4D68A-1D24-486A-841A-DBCDB3D30C65",
        yuplay_guid		= "A1C4D68A-1D24-486A-841A-DBCDB3D30C65",
        hidden			= true,
    },
	{
        -- Nordstorm Elite
        name			= "Nordstorm",
        steam_url		= "https://store.steampowered.com/app/2221881",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11675",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11675",
        steam_appId		= 2221881,
        yuplay_guid_ru	= "2355D906-A024-41DB-BF23-3084E269EF83",
        yuplay_guid		= "2355D906-A024-41DB-BF23-3084E269EF83",
        hidden			= true,
    },
	
	{
        -- Typhon Base
        name			= "Typhon_Base",
        steam_url		= "https://store.steampowered.com/app/2261461",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11866",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11866",
        steam_appId		= 2261461,
        yuplay_guid_ru	= "B2C10B2A-408C-4B61-B320-5550B8956FAC",
        yuplay_guid		= "B2C10B2A-408C-4B61-B320-5550B8956FAC",
        hidden			= true,
    },
	{
        -- Typhon Elite
        name			= "Typhon",
        steam_url		= "https://store.steampowered.com/app/2261462",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11865",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11865",
        steam_appId		= 2261462,
        yuplay_guid_ru	= "A4B09206-BB7E-434A-85D1-441639491953",
        yuplay_guid		= "A4B09206-BB7E-434A-85D1-441639491953",
        hidden			= true,
    },
	
	{
        -- Dragonfly Base
        name			= "Dragonfly_Base",
        steam_url		= "https://store.steampowered.com/app/2221882",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11676",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11676",
        steam_appId		= 2221882,
        yuplay_guid_ru	= "6916AD8A-EC1D-47E2-9E19-19498BADE97F",
        yuplay_guid		= "6916AD8A-EC1D-47E2-9E19-19498BADE97F",
        hidden			= true,
    },
	{
        -- Dragonfly Elite
        name			= "Dragonfly",
        steam_url		= "https://store.steampowered.com/app/2221883",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11677",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11677",
        steam_appId		= 2221883,
        yuplay_guid_ru	= "8D364C22-C7A2-4E32-A279-A4A64D36E811",
        yuplay_guid		= "8D364C22-C7A2-4E32-A279-A4A64D36E811",
        hidden			= true,
    },
	{
        -- Wasp простой
        name			= "Wasp",
        steam_url		= "https://store.steampowered.com/app/2261450",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11864",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11864",
        steam_appId		= 2261450,
        yuplay_guid_ru	= "2341054C-BF12-482D-B6E5-1780CBCC607D",
        yuplay_guid		= "2341054C-BF12-482D-B6E5-1780CBCC607D",
        hidden			= true,
    },	
	{
        -- Wasp Элитный
        name			= "Wasp_Elite",
        steam_url		= "https://store.steampowered.com/app/2261460",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11867",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11867",
        steam_appId		= 2261460,
        yuplay_guid_ru	= "176BC9F9-35B1-4413-8C69-EAF9A90C1961",
        yuplay_guid		= "176BC9F9-35B1-4413-8C69-EAF9A90C1961",
        hidden			= true,
    },	
	
	{
        -- Battle pass SPR2023 1
        name 			= "BattlePass_SPR2023_1",
        steam_url 		= "https://store.steampowered.com/app/2299830",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11890",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11890",
        steam_appId		= 2299830,
        yuplay_guid_ru 	= "70A67F82-4C1C-4411-9551-837B7FAA9C1C",
        yuplay_guid 	= "70A67F82-4C1C-4411-9551-837B7FAA9C1C",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2023 1 vip
        name 			= "BattlePassVip_SPR2023_1",
        steam_url 		= "https://store.steampowered.com/app/2299831",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11891",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11891",
        steam_appId 	= 2299831,
        yuplay_guid_ru 	= "CC19D34D-8259-4046-8D82-24EA48D3D3F4",
        yuplay_guid 	= "CC19D34D-8259-4046-8D82-24EA48D3D3F4",
        hidden = true,
    },
	{
        -- Battle pass SPR2023 2
        name 			= "BattlePass_SPR2023_2",
        steam_url 		= "https://store.steampowered.com/app/2299832",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=11892",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=11892",
        steam_appId 	= 2299832,
        yuplay_guid_ru 	= "FA519256-AE61-45AE-B896-C911DCEAC0BE",
        yuplay_guid 	= "FA519256-AE61-45AE-B896-C911DCEAC0BE",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2023 2 vip
        name 			= "BattlePassVip_SPR2023_2",
        steam_url 		= "https://store.steampowered.com/app/2299833",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11893",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11893",
        steam_appId		= 2299833,
        yuplay_guid_ru 	= "0B7605DD-9869-4B52-8FBF-6DB084435F1E",
        yuplay_guid 	= "0B7605DD-9869-4B52-8FBF-6DB084435F1E",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2023 1 +level
        name 			= "BattlePassLvl_SPR2023_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11887",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11887",
        yuplay_guid_ru 	= "77E01AEC-FB9A-4B58-9D31-A1393C96B8C8",
        yuplay_guid 	= "77E01AEC-FB9A-4B58-9D31-A1393C96B8C8",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2023 2 +level
        name 			= "BattlePassLvl_SPR2023_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=11888",
        yuplay_url		= "https://store.gaijin.net/story.php?id=11888",
        yuplay_guid_ru 	= "1F49BEE2-6B7E-4D92-B8A5-843441F6C710",
        yuplay_guid 	= "1F49BEE2-6B7E-4D92-B8A5-843441F6C710",
        hidden 			= true,
    },
	{
        -- Nyx простой
        name			= "Nyx",
        steam_url		= "https://store.steampowered.com/app/2337380",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12041",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12041",
        steam_appId		= 2337380,
        yuplay_guid_ru	= "18484AFB-2EEF-4197-AA0F-039E6BA22E2B",
        yuplay_guid		= "18484AFB-2EEF-4197-AA0F-039E6BA22E2B",
        hidden			= true,
    },	
	{
        -- Nyx Элитный
        name			= "Nyx_Elite",
        steam_url		= "https://store.steampowered.com/app/2337381",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12042",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12042",
        steam_appId		= 2337381,
        yuplay_guid_ru	= "3F4EEBCA-EAE5-4A71-BFDD-29BAFDE7F451",
        yuplay_guid		= "3F4EEBCA-EAE5-4A71-BFDD-29BAFDE7F451",
        hidden			= true,
    },
	{
        -- Sai простой
        name			= "Sai",
        steam_url		= "https://store.steampowered.com/app/2367430",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12112",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12112",
        steam_appId		= 2367430,
        yuplay_guid_ru	= "D270BB5F-48B9-43DD-BC57-4D650658E291",
        yuplay_guid		= "D270BB5F-48B9-43DD-BC57-4D650658E291",
        hidden			= true,
    },	
	{
        -- Sai Элитный
        name			= "Sai_Elite",
        steam_url		= "https://store.steampowered.com/app/2367431",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12113",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12113",
        steam_appId		= 2367431,
        yuplay_guid_ru	= "0E78B53C-210B-474A-BD75-617CC32ED900",
        yuplay_guid		= "0E78B53C-210B-474A-BD75-617CC32ED900",
        hidden			= true,
    },	
	{
        -- Palom простой
        name			= "Palom",
        steam_url		= "https://store.steampowered.com/app/2430780",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12388",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12388",
        steam_appId		= 2430780,
        yuplay_guid_ru	= "A4F87620-11F6-4927-ABF5-2C40032F0657",
        yuplay_guid		= "A4F87620-11F6-4927-ABF5-2C40032F0657",
        hidden			= true,
    },	
	{
        -- Palom Элитный
        name			= "Palom_Elite",
        steam_url		= "https://store.steampowered.com/app/2430781",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12387",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12387",
        steam_appId		= 2430781,
        yuplay_guid_ru	= "5409ACE0-DC48-48B9-8686-DCDDE8EB4212",
        yuplay_guid		= "5409ACE0-DC48-48B9-8686-DCDDE8EB4212",
        hidden			= true,
    },
	--------- SC-117388 DLC корабли 15 ранг
	{
        -- Cyning 
        name			= "Cyning",
        steam_url		= "https://store.steampowered.com/app/2321570",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12025",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12025",
        steam_appId		= 2321570,
        yuplay_guid_ru	= "4DE3141A-B4B0-44F5-B794-34F5CD60F92D",
        yuplay_guid		= "4DE3141A-B4B0-44F5-B794-34F5CD60F92D",
        hidden			= true,
    },	
	{
        -- Mjolnir 
        name			= "Mjolnir",
        steam_url		= "https://store.steampowered.com/app/2321571",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12028",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12028",
        steam_appId		= 2321571,
        yuplay_guid_ru	= "0F742BA0-144E-48D9-962F-0CC816A1EB2B",
        yuplay_guid		= "0F742BA0-144E-48D9-962F-0CC816A1EB2B",
        hidden			= true,
    },	
	{
        -- Kraken 
        name			= "Kraken",
        steam_url		= "https://store.steampowered.com/app/2321572",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12027",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12027",
        steam_appId		= 2321572,
        yuplay_guid_ru	= "BF09A8C0-D23A-483F-8ABF-CCB7EC8F409E",
        yuplay_guid		= "BF09A8C0-D23A-483F-8ABF-CCB7EC8F409E",
        hidden			= true,
    },	
	{
        -- Peregrine 
        name			= "Peregrine",
        steam_url		= "https://store.steampowered.com/app/2321573",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12030",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12030",
        steam_appId		= 2321573,
        yuplay_guid_ru	= "54A0239B-A9D9-4E86-A233-CCC2E22B4B4B",
        yuplay_guid		= "54A0239B-A9D9-4E86-A233-CCC2E22B4B4B",
        hidden			= true,
    },	
	{
        -- Jaguar 
        name			= "Jaguar",
        steam_url		= "https://store.steampowered.com/app/2321574",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12026",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12026",
        steam_appId		= 2321574,
        yuplay_guid_ru	= "F0ED4AC9-F30A-4063-9202-D8B7E20D6391",
        yuplay_guid		= "F0ED4AC9-F30A-4063-9202-D8B7E20D6391",
        hidden			= true,
    },	
	{
        -- Octopus 
        name			= "Octopus",
        steam_url		= "https://store.steampowered.com/app/2321575",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12029",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12029",
        steam_appId		= 2321575,
        yuplay_guid_ru	= "AA360667-4342-4657-8C3F-8E8E8D92B057",
        yuplay_guid		= "AA360667-4342-4657-8C3F-8E8E8D92B057",
        hidden			= true,
    },	
	{
        -- Caltrop 
        name			= "Caltrop",
        steam_url		= "https://store.steampowered.com/app/2321576",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12024",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12024",
        steam_appId		= 2321576,
        yuplay_guid_ru	= "D5E371BF-D7AE-48FD-B777-1258CC8AC803",
        yuplay_guid		= "D5E371BF-D7AE-48FD-B777-1258CC8AC803",
        hidden			= true,
    },	
	{
        -- Saw One
        name			= "Saw_One",
        steam_url		= "https://store.steampowered.com/app/2321577",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12032",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12032",
        steam_appId		= 2321577,
        yuplay_guid_ru	= "65DB724D-331C-4EFF-91CB-7C5709C0C3ED",
        yuplay_guid		= "65DB724D-331C-4EFF-91CB-7C5709C0C3ED",
        hidden			= true,
    },	
	{
        -- Ronin 
        name			= "Ronin",
        steam_url		= "https://store.steampowered.com/app/2321578",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12031",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12031",
        steam_appId		= 2321578,
        yuplay_guid_ru	= "8A64EBFA-903A-4850-81B5-CA72F8BDB00D",
        yuplay_guid		= "8A64EBFA-903A-4850-81B5-CA72F8BDB00D",
        hidden			= true,
    },	
	------------------------------------------------------
	{
        -- Confessor простой
        name			= "Confessor",
        steam_url		= "https://store.steampowered.com/app/2366010",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12098",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12098",
        steam_appId		= 2366010,
        yuplay_guid_ru	= "4289CE44-1238-435E-BBA0-8292BB9AF4C2",
        yuplay_guid		= "4289CE44-1238-435E-BBA0-8292BB9AF4C2",
        hidden			= true,
    },	
	{
        -- Confessor Элитный
        name			= "Confessor_Elite",
        steam_url		= "https://store.steampowered.com/app/2366011",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12099",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12099",
        steam_appId		= 2366011,
        yuplay_guid_ru	= "87A4ABAE-3D45-49CA-B3EF-D4623087B04B",
        yuplay_guid		= "87A4ABAE-3D45-49CA-B3EF-D4623087B04B",
        hidden			= true,
    },		
	
	{
        -- Battle pass SUM2023 1
        name 			= "BattlePass_SUM2023_1",
        steam_url 		= "https://store.steampowered.com/app/2412770",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12353",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12353",
        steam_appId		= 2412770,
        yuplay_guid_ru 	= "19D1AC0C-AB16-4B44-B4DE-D74B4E8A95BF",
        yuplay_guid 	= "19D1AC0C-AB16-4B44-B4DE-D74B4E8A95BF",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2023 1 vip
        name 			= "BattlePassVip_SUM2023_1",
        steam_url 		= "https://store.steampowered.com/app/2412771",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12354",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12354",
        steam_appId 	= 2412771,
        yuplay_guid_ru 	= "8B02D28A-7247-4776-A3B9-65F3A9858265",
        yuplay_guid 	= "8B02D28A-7247-4776-A3B9-65F3A9858265",
        hidden = true,
    },
	{
        -- Battle pass SUM2023 2
        name 			= "BattlePass_SUM2023_2",
        steam_url 		= "https://store.steampowered.com/app/2412772",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12355",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12355",
        steam_appId 	= 2412772,
        yuplay_guid_ru 	= "E4FB378C-78A1-4427-9875-647E3CA3F245",
        yuplay_guid 	= "E4FB378C-78A1-4427-9875-647E3CA3F245",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2023 2 vip
        name 			= "BattlePassVip_SUM2023_2",
        steam_url 		= "https://store.steampowered.com/app/2412773",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12356",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12356",
        steam_appId		= 2412773,
        yuplay_guid_ru 	= "6BBE3343-D6B7-426B-BCA2-91B8F754A92A",
        yuplay_guid 	= "6BBE3343-D6B7-426B-BCA2-91B8F754A92A",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2023 3
        name 			= "BattlePass_SUM2023_3",
        steam_url 		= "https://store.steampowered.com/app/2485320",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12638",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12638",
        steam_appId 	= 2485320,
        yuplay_guid_ru 	= "42239A0B-E32B-4402-B543-E3E8D691FD7D",
        yuplay_guid 	= "42239A0B-E32B-4402-B543-E3E8D691FD7D",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2023 3 vip
        name 			= "BattlePassVip_SUM2023_3",
        steam_url 		= "https://store.steampowered.com/app/2485321",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12639",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12639",
        steam_appId		= 2485321,
        yuplay_guid_ru 	= "63898F34-B7CD-466E-B082-837BC96C7613",
        yuplay_guid 	= "63898F34-B7CD-466E-B082-837BC96C7613",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2023 1 +level
        name 			= "BattlePassLvl_SUM2023_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12350",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12350",
        yuplay_guid_ru 	= "742D2ED5-F3ED-4A91-9B7D-77120D5F2E06",
        yuplay_guid 	= "742D2ED5-F3ED-4A91-9B7D-77120D5F2E06",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2023 2 +level
        name 			= "BattlePassLvl_SUM2023_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12351",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12351",
        yuplay_guid_ru 	= "059C6A8A-7E9E-49A9-9098-5E574E0997FD",
        yuplay_guid 	= "059C6A8A-7E9E-49A9-9098-5E574E0997FD",
        hidden 			= true,
    },
	   -- Battle pass SUM2023 3 +level = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
		
	----- SC-117941 DLC с кораблем Seeress простой и элитный
	{
        -- Seeress простой
        name			= "Seeress",
        steam_url		= "https://store.steampowered.com/app/2482392",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12621",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12621",
        steam_appId		= 2482392,
        yuplay_guid_ru	= "D32C9D51-8BD5-4F73-824B-E004FF7A7AD2",
        yuplay_guid		= "D32C9D51-8BD5-4F73-824B-E004FF7A7AD2",
        hidden			= true,
    },	
	{
        -- Seeress Элитный
        name			= "Seeress_Elite",
        steam_url		= "https://store.steampowered.com/app/2482393",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12622",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12622",
        steam_appId		= 2482393,
        yuplay_guid_ru	= "26746FA0-128F-4A8E-BC78-49BFE5F33ED6",
        yuplay_guid		= "26746FA0-128F-4A8E-BC78-49BFE5F33ED6",
        hidden			= true,
    },		
	
	----- SC-117951 DLC с кораблем Grim простой и элитный
	{
        -- Grim простой
        name			= "Grim",
        steam_url		= "https://store.steampowered.com/app/2482750",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12625",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12625",
        steam_appId		= 2482750,
        yuplay_guid_ru	= "458A6021-BF86-4AF7-B433-54DCC40BAB64",
        yuplay_guid		= "458A6021-BF86-4AF7-B433-54DCC40BAB64",
        hidden			= true,
    },	
	{
        -- Grim Элитный
        name			= "Grim_Elite",
        steam_url		= "https://store.steampowered.com/app/2482751",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12626",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12626",
        steam_appId		= 2482751,
        yuplay_guid_ru	= "89B1CB71-3BA2-4427-95F0-7B1C433E6B6E",
        yuplay_guid		= "89B1CB71-3BA2-4427-95F0-7B1C433E6B6E",
        hidden			= true,
    },

	----- SC-117856 DLC с уникальным кораблем "Helicon" простой и элитный. Головной
	{
        -- Helicon простой
        name			= "Helicon",
        steam_url		= "https://store.steampowered.com/app/2464200",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12564",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12564",
        steam_appId		= 2464200,
        yuplay_guid_ru	= "05AF7C78-238E-41AC-A9C5-644AB65C0DDE",
        yuplay_guid		= "05AF7C78-238E-41AC-A9C5-644AB65C0DDE",
        hidden			= true,
    },	
	{
        -- Helicon Элитный
        name			= "Helicon_Elite",
        steam_url		= "https://store.steampowered.com/app/2464201",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12563",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12563",
        steam_appId		= 2464201,
        yuplay_guid_ru	= "BD5D7764-A7F4-407F-A909-9F5578D27278",
        yuplay_guid		= "BD5D7764-A7F4-407F-A909-9F5578D27278",
        hidden			= true,
    },

	----- SC-117943 DLC с уникальным кораблем "Sirius" простой и элитный. Головной
	{
        -- Sirius простой
        name			= "Sirius_New",
        steam_url		= "https://store.steampowered.com/app/2482390",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12623",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12623",
        steam_appId		= 2482390,
        yuplay_guid_ru	= "9D062F9B-1936-4A15-98D9-A779C2E11BB6",
        yuplay_guid		= "9D062F9B-1936-4A15-98D9-A779C2E11BB6",
        hidden			= true,
    },	
	{
        -- Sirius Элитный
        name			= "Sirius_New_Elite",
        steam_url		= "https://store.steampowered.com/app/2482391",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12624",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12624",
        steam_appId		= 2482391,
        yuplay_guid_ru	= "B37DA622-2275-4EE4-B08A-11597120EDF4",
        yuplay_guid		= "B37DA622-2275-4EE4-B08A-11597120EDF4",
        hidden			= true,
    },		
	
	{
        -- Battle pass AUT2023 1 "Древний инстинкт" 
        name 			= "BattlePass_AUT2023_1",
        steam_url 		= "https://store.steampowered.com/app/2525070",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12681",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12681",
        steam_appId		= 2525070,
        yuplay_guid_ru 	= "C2FC8486-C87F-44CE-ABD9-0B45858186C5",
        yuplay_guid 	= "C2FC8486-C87F-44CE-ABD9-0B45858186C5",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2023 1 vip "Древний инстинкт" 
        name 			= "BattlePassVip_AUT2023_1",
        steam_url 		= "https://store.steampowered.com/app/2525080",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12682",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12682",
        steam_appId 	= 2525080,
        yuplay_guid_ru 	= "1651C2FD-DD67-495A-95A5-C60DEDA88195",
        yuplay_guid 	= "1651C2FD-DD67-495A-95A5-C60DEDA88195",
        hidden = true,
    },
	{
        -- Battle pass AUT2023 2 "Древний инстинкт" 
        name 			= "BattlePass_AUT2023_2",
        steam_url 		= "https://store.steampowered.com/app/2525090",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12683",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12683",
        steam_appId 	= 2525090,
        yuplay_guid_ru 	= "B2AFFA56-403B-400A-A16E-C272299B593E",
        yuplay_guid 	= "B2AFFA56-403B-400A-A16E-C272299B593E",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2023 2 vip "Древний инстинкт"
        name 			= "BattlePassVip_AUT2023_2",
        steam_url 		= "https://store.steampowered.com/app/2525100",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12684",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12684",
        steam_appId		= 2525100,
        yuplay_guid_ru 	= "6AB6FF80-C02B-4BE4-9126-1951E976E91E",
        yuplay_guid 	= "6AB6FF80-C02B-4BE4-9126-1951E976E91E",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2023 2 vip_Hidden "Древний инстинкт" !!! Gaijin ONLY !!! Скрытый пропуск для прошежших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_AUT2023_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2023 3 "Выживание"
        name 			= "BattlePass_AUT2023_3",
        steam_url 		= "https://store.steampowered.com/app/2525060",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12685",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12685",
        steam_appId 	= 2525060,
        yuplay_guid_ru 	= "B5A9EC73-21DB-4595-8CFB-7C778312BE9D",
        yuplay_guid 	= "B5A9EC73-21DB-4595-8CFB-7C778312BE9D",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2023 3 vip "Выживание"
        name 			= "BattlePassVip_AUT2023_3",
        steam_url 		= "https://store.steampowered.com/app/2525050",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12686",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12686",
        steam_appId		= 2525050,
        yuplay_guid_ru 	= "EBB2C9A1-6788-4F50-990C-9041B1CB7B98",
        yuplay_guid 	= "EBB2C9A1-6788-4F50-990C-9041B1CB7B98",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2023 1 +level "Древний инстинкт"
        name 			= "BattlePassLvl_AUT2023_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12678",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12678",
        yuplay_guid_ru 	= "385B10AE-189C-4FDD-BA3B-8741737D307B",
        yuplay_guid 	= "385B10AE-189C-4FDD-BA3B-8741737D307B",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2023 2 +level "Древний инстинкт"
        name 			= "BattlePassLvl_AUT2023_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12679",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12679",
        yuplay_guid_ru 	= "AA075557-B44F-402B-BCD8-EFC9A028D903",
        yuplay_guid 	= "AA075557-B44F-402B-BCD8-EFC9A028D903",
        hidden 			= true,
    },
	   -- Battle pass AUT2023 3 +level "Выживание" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	
	----- SC-117980 DLC Mauler простой и элитный
	{
        -- Mauler простой
        name			= "Mauler",
        steam_url		= "https://store.steampowered.com/app/2506320",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12655",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12655",
        steam_appId		= 2506320,
        yuplay_guid_ru	= "44437934-8A7D-42FD-945C-544477101A27",
        yuplay_guid		= "44437934-8A7D-42FD-945C-544477101A27",
        hidden			= true,
    },	
	{
        -- Mauler Элитный
        name			= "Mauler_Elite",
        steam_url		= "https://store.steampowered.com/app/2506330",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12654",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12654",
        steam_appId		= 2506330,
        yuplay_guid_ru	= "A80085C9-A9A8-4E9F-90AC-CED9AC9171E8",
        yuplay_guid		= "A80085C9-A9A8-4E9F-90AC-CED9AC9171E8",
        hidden			= true,
    },			

	----- SC-118245 DLC Hadrian простой и элитный
	{
        -- Hadrian простой
        name			= "Hadrian",
        steam_url		= "https://store.steampowered.com/app/2613290",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12836",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12836",
        steam_appId		= 2613290,
        yuplay_guid_ru	= "31871DFA-498E-4B0D-9B67-182AD38E09D9",
        yuplay_guid		= "31871DFA-498E-4B0D-9B67-182AD38E09D9",
        hidden			= true,
    },	
	{
        -- Hadrian Элитный
        name			= "Hadrian_Elite",
        steam_url		= "https://store.steampowered.com/app/2613300",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12835",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12835",
        steam_appId		= 2613300,
        yuplay_guid_ru	= "FBC7205D-BB84-4B17-B233-42BF5ABE8BB1",
        yuplay_guid		= "FBC7205D-BB84-4B17-B233-42BF5ABE8BB1",
        hidden			= true,
    },			

	----- SC-118249 DLC Baphomet простой и элитный
	{
        -- Baphomet простой
        name			= "Baphomet",
        steam_url		= "https://store.steampowered.com/app/2613270",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12834",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12834",
        steam_appId		= 2613270,
        yuplay_guid_ru	= "5CEA884F-24D2-4C70-A801-511F69EE7E9E",
        yuplay_guid		= "5CEA884F-24D2-4C70-A801-511F69EE7E9E",
        hidden			= true,
    },	
	{
        -- Baphomet Элитный
        name			= "Baphomet_Elite",
        steam_url		= "https://store.steampowered.com/app/2613280",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12833",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12833",
        steam_appId		= 2613280,
        yuplay_guid_ru	= "0202A324-8668-4CD2-98FD-D38FEFD538C2",
        yuplay_guid		= "0202A324-8668-4CD2-98FD-D38FEFD538C2",
        hidden			= true,
    },
	
		----- SC-118255 DLC Loki простой и элитный
	{
        -- Loki простой
        name			= "Loki",
        steam_url		= "https://store.steampowered.com/app/2639300",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12889",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12889",
        steam_appId		= 2639300,
        yuplay_guid_ru	= "83100928-86A3-41C0-B292-21FFF8EB6BAD",
        yuplay_guid		= "83100928-86A3-41C0-B292-21FFF8EB6BAD",
        hidden			= true,
    },	
	{
        -- Loki Элитный
        name			= "Loki_Elite",
        steam_url		= "https://store.steampowered.com/app/2639310",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12890",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12890",
        steam_appId		= 2639310,
        yuplay_guid_ru	= "C389C9E3-BD30-484B-BF72-FC854FEEF0A5",
        yuplay_guid		= "C389C9E3-BD30-484B-BF72-FC854FEEF0A5",
        hidden			= true,
    },			
	
	{
        -- Battle pass NY2024 1 "Секреты предтечей" 
        name 			= "BattlePass_NY2024_1",
        steam_url 		= "https://store.steampowered.com/app/2679180",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12923",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12923",
        steam_appId		= 2679180,
        yuplay_guid_ru 	= "71CA3AFC-C84F-4BC9-8B61-75F696FB1631",
        yuplay_guid 	= "71CA3AFC-C84F-4BC9-8B61-75F696FB1631",
        hidden 			= true,
    },
    {
        -- Battle pass NY2024 1 vip "Секреты предтечей" 
        name 			= "BattlePassVip_NY2024_1",
        steam_url 		= "https://store.steampowered.com/app/2679170",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12922",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12922",
        steam_appId 	= 2679170,
        yuplay_guid_ru 	= "30D46004-AE0D-4261-BFDB-72318A4B8A55",
        yuplay_guid 	= "30D46004-AE0D-4261-BFDB-72318A4B8A55",
        hidden = true,
    },
	{
        -- Battle pass NY2024 2 "Секреты предтечей" 
        name 			= "BattlePass_NY2024_2",
        steam_url 		= "https://store.steampowered.com/app/2679160",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12921",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12921",
        steam_appId 	= 2679160,
        yuplay_guid_ru 	= "5B70BDA4-C8EC-484D-B82F-55778F6D7474",
        yuplay_guid 	= "5B70BDA4-C8EC-484D-B82F-55778F6D7474",
        hidden 			= true,
    },
    {
        -- Battle pass NY2024 2 vip "Секреты предтечей"
        name 			= "BattlePassVip_NY2024_2",
        steam_url 		= "https://store.steampowered.com/app/2679150",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12920",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12920",
        steam_appId		= 2679150,
        yuplay_guid_ru 	= "6F108C89-181B-443D-B0D0-162F4327A4FE",
        yuplay_guid 	= "6F108C89-181B-443D-B0D0-162F4327A4FE",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass NY2024 2 vip_Hidden "Секреты предтечей" !!! Gaijin ONLY !!! Скрытый пропуск для прошежших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_NY2024_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	{
        -- Battle pass NY2024 3 "Зимнепраздник"
        name 			= "BattlePass_NY2024_3",
        steam_url 		= "https://store.steampowered.com/app/2688810",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=12924",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=12924",
        steam_appId 	= 2688810,
        yuplay_guid_ru 	= "0356A7D5-A980-4E1B-B322-06855C8ED64F",
        yuplay_guid 	= "0356A7D5-A980-4E1B-B322-06855C8ED64F",
        hidden 			= true,
    },
    {
        -- Battle pass NY2024 3 vip "Зимнепраздник"
        name 			= "BattlePassVip_NY2024_3",
        steam_url 		= "https://store.steampowered.com/app/2688820",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12925",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12925",
        steam_appId		= 2688820,
        yuplay_guid_ru 	= "46A5AC8F-8AAB-48AA-8EEF-F55FA9928C37",
        yuplay_guid 	= "46A5AC8F-8AAB-48AA-8EEF-F55FA9928C37",
        hidden 			= true,
    },
	{
        -- Battle pass NY2024 1 +level "Секреты предтечей"
        name 			= "BattlePassLvl_NY2024_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12919",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12919",
        yuplay_guid_ru 	= "04C0650F-CB14-4037-B195-34A16A2E2714",
        yuplay_guid 	= "04C0650F-CB14-4037-B195-34A16A2E2714",
        hidden 			= true,
    },
	{
        -- Battle pass NY2024 2 +level "Секреты предтечей"
        name 			= "BattlePassLvl_NY2024_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12918",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12918",
        yuplay_guid_ru 	= "26801640-180A-46D8-8D55-53216C5C7E6B",
        yuplay_guid 	= "26801640-180A-46D8-8D55-53216C5C7E6B",
        hidden 			= true,
    },
	
	   -- Battle pass NY2024 3 +level "Зимнепраздник" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
	{
        -- Battle pass NY2024_4 "Огонь любви"
        name 			= "BattlePass_NY2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789080",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13150",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13150",
        steam_appId 	= 2789080,
        yuplay_guid_ru 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        yuplay_guid 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        hidden 			= true,
    },
    {
        -- Battle pass NY2024_4 vip "Огонь любви"
        name 			= "BattlePassVip_NY2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789090",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13151",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13151",
        steam_appId		= 2789090,
        yuplay_guid_ru 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        yuplay_guid 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        hidden 			= true,
    },

	   -- Battle pass NY2024_4 +level "Огонь любви" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
	   ----- SC-118314 DLC Manul простой и элитный
	{
        -- Manul простой
        name			= "Manul",
        steam_url		= "https://store.steampowered.com/app/2688830",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12927",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12927",
        steam_appId		= 2688830,
        yuplay_guid_ru	= "434A0541-5994-40F6-92DA-500909DA465A",
        yuplay_guid		= "434A0541-5994-40F6-92DA-500909DA465A",
        hidden			= true,
    },	
	{
        -- Manul Элитный
        name			= "Manul_Elite",
        steam_url		= "https://store.steampowered.com/app/2688840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12926",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12926",
        steam_appId		= 2688840,
        yuplay_guid_ru	= "7365BB90-8B79-46CF-AF98-31C5DD89AE8C",
        yuplay_guid		= "7365BB90-8B79-46CF-AF98-31C5DD89AE8C",
        hidden			= true,
    },			

	----- SC-118528 Dlc с кораблем Salamander простой и элитный
	{
        -- Salamander простой
        name			= "Salamander",
        steam_url		= "https://store.steampowered.com/app/2761680",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13141",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13141",
        steam_appId		= 2761680,
        yuplay_guid_ru	= "471C3B7D-1593-40E8-AA48-DAFE8B59718A",
        yuplay_guid		= "471C3B7D-1593-40E8-AA48-DAFE8B59718A",
        hidden			= true,
    },	
	{
        -- Salamander Элитный
        name			= "Salamander_Elite",
        steam_url		= "https://store.steampowered.com/app/2761690",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13142",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13142",
        steam_appId		= 2761690,
        yuplay_guid_ru	= "841286EB-5DD0-4501-849E-50F8CF4CEC14",
        yuplay_guid		= "841286EB-5DD0-4501-849E-50F8CF4CEC14",
        hidden			= true,
    },			

	----- SC-118542 Перевыпуск корабля Procyon эсминец 8 ранг с 15 февраля 2024 простой и элитный
	{
        -- Procyon простой
        name			= "Procyon",
        steam_url		= "https://store.steampowered.com/app/2782790",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13144",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13144",
        steam_appId		= 2782790,
        yuplay_guid_ru	= "6E75BA78-DFFE-454F-BA93-2AF27BEA7FFE",
        yuplay_guid		= "6E75BA78-DFFE-454F-BA93-2AF27BEA7FFE",
        hidden			= true,
    },	
	{
        -- Procyon Элитный
        name			= "Procyon_Elite",
        steam_url		= "https://store.steampowered.com/app/2782800",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13145",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13145",
        steam_appId		= 2782800,
        yuplay_guid_ru	= "776732B0-10C9-4C27-9897-991C0B388FF3",
        yuplay_guid		= "776732B0-10C9-4C27-9897-991C0B388FF3",
        hidden			= true,
    },
	
	----- SC-118548 DLC на новый корабль CorVulnus простой и элитный
	{
        -- CorVulnus простой
        name			= "CorVulnus",
        steam_url		= "https://store.steampowered.com/app/2789100",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13148",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13148",
        steam_appId		= 2789100,
        yuplay_guid_ru	= "DCCC6A96-4D69-4AF8-AE51-F6BCBC007D7D",
        yuplay_guid		= "DCCC6A96-4D69-4AF8-AE51-F6BCBC007D7D",
        hidden			= true,
    },	
	{
        -- CorVulnus Элитный
        name			= "CorVulnus_Elite",
        steam_url		= "https://store.steampowered.com/app/2789110",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13149",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13149",
        steam_appId		= 2789110,
        yuplay_guid_ru	= "32DB24A8-740E-4A65-830F-70AB9E6E60FB",
        yuplay_guid		= "32DB24A8-740E-4A65-830F-70AB9E6E60FB",
        hidden			= true,
    },			

-- PR-119134 Старконфликт. Сводный тикет. БП весна 24 Star Conflict 1.12.3 Скачок в бездну 
	
	{
        -- Battle pass SPR2024 1 "Скачок в бездну" 
        name 			= "BattlePass_SPR2024_1",
        steam_url 		= "https://store.steampowered.com/app/2812640",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13173",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13173",
        steam_appId		= 2812640,
        yuplay_guid_ru 	= "149D82EC-9D7D-4AC2-9FFA-6F582DB4C31F",
        yuplay_guid 	= "149D82EC-9D7D-4AC2-9FFA-6F582DB4C31F",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2024 1 vip "Скачок в бездну" 
        name 			= "BattlePassVip_SPR2024_1",
        steam_url 		= "https://store.steampowered.com/app/2812630",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13175",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13175",
        steam_appId 	= 2812630,
        yuplay_guid_ru 	= "71E308CD-8CC0-495D-9D12-66E9BEC6049B",
        yuplay_guid 	= "71E308CD-8CC0-495D-9D12-66E9BEC6049B",
        hidden = true,
    },
	{
        -- Battle pass SPR2024 2 "Скачок в бездну" 
        name 			= "BattlePass_SPR2024_2",
        steam_url 		= "https://store.steampowered.com/app/2812620",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13176",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13176",
        steam_appId 	= 2812620,
        yuplay_guid_ru 	= "B5DAA0E3-3B93-4358-BE3A-F63F63FDAF21",
        yuplay_guid 	= "B5DAA0E3-3B93-4358-BE3A-F63F63FDAF21",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2024 2 vip "Скачок в бездну"
        name 			= "BattlePassVip_SPR2024_2",
        steam_url 		= "https://store.steampowered.com/app/2812600",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13178",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13178",
        steam_appId		= 2812600,
        yuplay_guid_ru 	= "AD506F3F-EA9D-4A34-85E8-82943C4B130A",
        yuplay_guid 	= "AD506F3F-EA9D-4A34-85E8-82943C4B130A",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass SPR2024 2 vip_Hidden "Скачок в бездну" !!! Gaijin ONLY !!! Скрытый пропуск для прошежших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_SPR2024_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ (РАСКОММЕНТИРОВАНЫ)
        -- Battle pass SPR2024 3 "Забытые сражения" 
        name 			= "BattlePass_SPR2024_3",
        steam_url 		= "https://store.steampowered.com/app/2932360",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13395",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13395",
        steam_appId 	= 2932360,
        yuplay_guid_ru 	= "90F7D1F2-C7EB-441A-9106-89CBB0F257C7",
        yuplay_guid 	= "90F7D1F2-C7EB-441A-9106-89CBB0F257C7",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2024 3 vip "Забытые сражения"
        name 			= "BattlePassVip_SPR2024_3",
        steam_url 		= "https://store.steampowered.com/app/2932370",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13396",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13396",
        steam_appId		= 2932370,
        yuplay_guid_ru 	= "F951DB9F-C425-4127-B951-7D7491E62082",
        yuplay_guid 	= "F951DB9F-C425-4127-B951-7D7491E62082",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2024 1 +level "Скачок в бездну"
        name 			= "BattlePassLvl_SPR2024_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13174",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13174",
        yuplay_guid_ru 	= "33D2A26E-E2B1-440D-8760-66C82C967A2E",
        yuplay_guid 	= "33D2A26E-E2B1-440D-8760-66C82C967A2E",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2024 2 +level "Скачок в бездну"
        name 			= "BattlePassLvl_SPR2024_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13177",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13177",
        yuplay_guid_ru 	= "274DB336-26B9-4C33-85FD-AD7CF5E815A0",
        yuplay_guid 	= "274DB336-26B9-4C33-85FD-AD7CF5E815A0",
        hidden 			= true,
    },
	
	   -- Battle pass SPR2024 3 +level "Забытые сражения" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass SPR2024_4 "Огонь любви" 
        name 			= "BattlePass_SPR2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789080",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13150",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13150",
        steam_appId 	= 2789080,
        yuplay_guid_ru 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        yuplay_guid 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2024_4 vip "Огонь любви"
        name 			= "BattlePassVip_SPR2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789090",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13151",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13151",
        steam_appId		= 2789090,
        yuplay_guid_ru 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        yuplay_guid 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        hidden 			= true,
    },]]

	   -- Battle pass SPR2024_4 +level "Огонь любви" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   				

	   ----- SC-118731 DLC Перевыпуск Vigilant простой и элитный. 
	{
        -- Vigilant Простой
        name			= "Vigilant",
        steam_url		= "https://store.steampowered.com/app/2887380",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13354",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13354",
        steam_appId		= 2887380,
        yuplay_guid_ru	= "295C848A-0C54-449C-A18F-42ACEA36D18B",
        yuplay_guid		= "295C848A-0C54-449C-A18F-42ACEA36D18B",
        hidden			= true,
    },	
	{
        -- Vigilant Элитный
        name			= "Vigilant_Elite",
        steam_url		= "https://store.steampowered.com/app/2887390",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13355",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13355",
        steam_appId		= 2887390,
        yuplay_guid_ru	= "9E5F2CD2-329C-42E1-BECC-080CF7031FA0",
        yuplay_guid		= "9E5F2CD2-329C-42E1-BECC-080CF7031FA0",
        hidden			= true,
    },		

	----- SC-118822 DLC IL-2 (Bark) простой и элитный
	{
        -- Bark Простой
        name			= "Bark",
        steam_url		= "https://store.steampowered.com/app/2932340",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13393",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13393",
        steam_appId		= 2932340,
        yuplay_guid_ru	= "A82E1A92-B66D-4556-ADE5-4FFBC371529C",
        yuplay_guid		= "A82E1A92-B66D-4556-ADE5-4FFBC371529C",
        hidden			= true,
    },	
	{
        -- Bark Элитный
        name			= "Bark_Elite",
        steam_url		= "https://store.steampowered.com/app/2932350",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13394",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13394",
        steam_appId		= 2932350,
        yuplay_guid_ru	= "D256226C-03AE-4374-A44C-5EADFFDBAD72",
        yuplay_guid		= "D256226C-03AE-4374-A44C-5EADFFDBAD72",
        hidden			= true,
    },

	----- SC-118767 DLC Yith'Mor простой и элитный (Cтартовый и VIP)
	{
        -- Yith'Mor Стартовый набор
        name			= "YithMor",
        steam_url		= "https://store.steampowered.com/app/2893690",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13366",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13366",
        steam_appId		= 2893690,
        yuplay_guid_ru	= "29B37273-ACA3-4369-BEBF-0A03F79F93C6",
        yuplay_guid		= "29B37273-ACA3-4369-BEBF-0A03F79F93C6",
        hidden			= true,
    },	
	{
        -- Yith'Mor VIP набор
        name			= "YithMor_Elite",
        steam_url		= "https://store.steampowered.com/app/2893700",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13367",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13367",
        steam_appId		= 2893700,
        yuplay_guid_ru	= "4D82BE9C-07DE-4E35-9DC8-D8BC7BC5DCBD",
        yuplay_guid		= "4D82BE9C-07DE-4E35-9DC8-D8BC7BC5DCBD",
        hidden			= true,
    },	

-- PR-119759 Старконфликт. БП Неведомые горизонты. Лето 2024 (BP16 / SUM24). Сводный тикет. Star Conflict 1.12.7 - 1.12.8 
	
	{
        -- Battle pass SUM2024 1 "Неведомые горизонты" 
        name 			= "BattlePass_SUM2024_1",
        steam_url 		= "https://store.steampowered.com/app/2993830",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13484",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13484",
        steam_appId		= 2993830,
        yuplay_guid_ru 	= "22C54DCD-79EA-437E-BF2B-683C805ACF12",
        yuplay_guid 	= "22C54DCD-79EA-437E-BF2B-683C805ACF12",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2024 1 vip "Неведомые горизонты" 
        name 			= "BattlePassVip_SUM2024_1",
        steam_url 		= "https://store.steampowered.com/app/2993840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13486",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13486",
        steam_appId 	= 2993840,
        yuplay_guid_ru 	= "3C5487CB-56B5-4666-8D47-D531449C0CA6",
        yuplay_guid 	= "3C5487CB-56B5-4666-8D47-D531449C0CA6",
        hidden = true,
    },
	{
        -- Battle pass SUM2024 2 "Неведомые горизонты" 
        name 			= "BattlePass_SUM2024_2",
        steam_url 		= "https://store.steampowered.com/app/2993850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13487",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13487",
        steam_appId 	= 2993850,
        yuplay_guid_ru 	= "BC430AD9-6CEC-4C03-A421-0380208BA163",
        yuplay_guid 	= "BC430AD9-6CEC-4C03-A421-0380208BA163",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2024 2 vip "Неведомые горизонты"
        name 			= "BattlePassVip_SUM2024_2",
        steam_url 		= "https://store.steampowered.com/app/2993860",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13489",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13489",
        steam_appId		= 2993860,
        yuplay_guid_ru 	= "334C118A-69F5-4588-B8DA-27F71DFE9B92",
        yuplay_guid 	= "334C118A-69F5-4588-B8DA-27F71DFE9B92",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass SUM2024 2 vip_Hidden "Неведомые горизонты" !!! Gaijin ONLY !!! Скрытый пропуск для прошежших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_SUM2024_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ (РАСКОММЕНТИРОВАНО)
        -- Battle pass SUM2024 3 "Эхо Империй" 
        name 			= "BattlePass_SUM2024_3",
        steam_url 		= "https://store.steampowered.com/app/3054850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13576",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13576",
        steam_appId 	= 3054850,
        yuplay_guid_ru 	= "C8BD83F8-E207-47F5-AFA1-5ACE6EB7139D",
        yuplay_guid 	= "C8BD83F8-E207-47F5-AFA1-5ACE6EB7139D",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2024 3 vip "Эхо Империй"
        name 			= "BattlePassVip_SUM2024_3",
        steam_url 		= "https://store.steampowered.com/app/3054860",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13577",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13577",
        steam_appId		= 3054860,
        yuplay_guid_ru 	= "F9C86C9C-6638-4176-B982-50326945E3F4",
        yuplay_guid 	= "F9C86C9C-6638-4176-B982-50326945E3F4",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2024 1 +level "Неведомые горизонты"
        name 			= "BattlePassLvl_SUM2024_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13485",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13485",
        yuplay_guid_ru 	= "9D6E8997-9C48-49F3-9360-F82167B23C9F",
        yuplay_guid 	= "9D6E8997-9C48-49F3-9360-F82167B23C9F",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2024 2 +level "Неведомые горизонты"
        name 			= "BattlePassLvl_SUM2024_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13488",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13488",
        yuplay_guid_ru 	= "E4C26107-9CBA-401F-998A-F0D5FF53787B",
        yuplay_guid 	= "E4C26107-9CBA-401F-998A-F0D5FF53787B",
        hidden 			= true,
    },
	
	   -- Battle pass SUM2024 3 +level "Эхо Империй" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass SUM2024_4 "Огонь любви" 
        name 			= "BattlePass_SUM2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789080",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13150",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13150",
        steam_appId 	= 2789080,
        yuplay_guid_ru 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        yuplay_guid 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2024_4 vip "Огонь любви"
        name 			= "BattlePassVip_SUM2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789090",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13151",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13151",
        steam_appId		= 2789090,
        yuplay_guid_ru 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        yuplay_guid 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        hidden 			= true,
    },]]

	   -- Battle pass SUM2024_4 +level "Огонь любви" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

	----- SC-119033 DLC. Корабль Shrike простой и элитный
	{
        -- Shrike Простой
        name			= "Shrike",
        steam_url		= "https://store.steampowered.com/app/3054890",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13578",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13578",
        steam_appId		= 3054890,
        yuplay_guid_ru	= "8BA4B666-2AC6-4B84-9D2A-C4F7CC40B167",
        yuplay_guid		= "8BA4B666-2AC6-4B84-9D2A-C4F7CC40B167",
        hidden			= true,
    },	
	{
        -- Shrike Элитный
        name			= "Shrike_Elite",
        steam_url		= "https://store.steampowered.com/app/3054900",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13579",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13579",
        steam_appId		= 3054900,
        yuplay_guid_ru	= "1C6BFEE4-B5D6-4C0A-8710-1DB59FFD74B9",
        yuplay_guid		= "1C6BFEE4-B5D6-4C0A-8710-1DB59FFD74B9",
        hidden			= true,
    },

	----- SC-119035 DLC Корабль Pilum простой и элитный (для BP16_3 / SUM24_3). Лето 2024.
	{
        -- Pilum Простой
        name			= "Pilum",
        steam_url		= "https://store.steampowered.com/app/3054870",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13580",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13580",
        steam_appId		= 3054870,
        yuplay_guid_ru	= "7C55DAF1-020E-492F-AC5D-DDB6F3285C35",
        yuplay_guid		= "7C55DAF1-020E-492F-AC5D-DDB6F3285C35",
        hidden			= true,
    },	
	{
        -- Pilum Элитный
        name			= "Pilum_Elite",
        steam_url		= "https://store.steampowered.com/app/3054880",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13581",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13581",
        steam_appId		= 3054880,
        yuplay_guid_ru	= "DA662939-3219-4567-ACC1-A8A83D5AD8CA",
        yuplay_guid		= "DA662939-3219-4567-ACC1-A8A83D5AD8CA",
        hidden			= true,
    },	


-- СЕЗОН BP17 / AUT24. Осень 2024 (все фазы). Боевой пропуск "Сердце тьмы" + Ивентпасс "Архивы ЕЦН: Зов неизведанного". PR-120290 + ... 
	
	{
        -- Battle pass AUT2024 1 "Сердце тьмы" 
        name 			= "BattlePass_AUT2024_1",
        steam_url 		= "https://store.steampowered.com/app/3153300",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13618",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13618",
        steam_appId		= 3153300,
        yuplay_guid_ru 	= "3BEA7674-1A8C-4425-9C6B-F43FA0EBD12F",
        yuplay_guid 	= "3BEA7674-1A8C-4425-9C6B-F43FA0EBD12F",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2024 1 vip "Сердце тьмы" 
        name 			= "BattlePassVip_AUT2024_1",
        steam_url 		= "https://store.steampowered.com/app/3153310",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13620",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13620",
        steam_appId 	= 3153310,
        yuplay_guid_ru 	= "038616C0-D59E-4D59-9189-A7C1AF66CCE9",
        yuplay_guid 	= "038616C0-D59E-4D59-9189-A7C1AF66CCE9",
        hidden = true,
    },
	{
        -- Battle pass AUT2024 2 "Сердце тьмы" 
        name 			= "BattlePass_AUT2024_2",
        steam_url 		= "https://store.steampowered.com/app/3153320",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13621",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13621",
        steam_appId 	= 3153320,
        yuplay_guid_ru 	= "1C134664-36B0-44E1-94F5-45C5A56F9DBC",
        yuplay_guid 	= "1C134664-36B0-44E1-94F5-45C5A56F9DBC",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2024 2 vip "Сердце тьмы"
        name 			= "BattlePassVip_AUT2024_2",
        steam_url 		= "https://store.steampowered.com/app/3153330",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13623",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13623",
        steam_appId		= 3153330,
        yuplay_guid_ru 	= "28D69B3A-C4AC-4DAD-8314-CAB4764FD79E",
        yuplay_guid 	= "28D69B3A-C4AC-4DAD-8314-CAB4764FD79E",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass AUT2024 2 vip_Hidden "Сердце тьмы" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_AUT2024_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass AUT2024 3 "Зов Неизведанного" 
        name 			= "BattlePass_AUT2024_3",
        steam_url 		= "https://store.steampowered.com/app/3212080",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13725",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13725",
        steam_appId 	= 3212080,
        yuplay_guid_ru 	= "BC0489B0-6399-4D21-A0BE-26CA4167E51B",
        yuplay_guid 	= "BC0489B0-6399-4D21-A0BE-26CA4167E51B",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2024 3 vip "Зов Неизведанного"
        name 			= "BattlePassVip_AUT2024_3",
        steam_url 		= "https://store.steampowered.com/app/3212090",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13726",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13726",
        steam_appId		= 3212090,
        yuplay_guid_ru 	= "6142E562-BF93-4BC6-BD3E-F83E0B998543",
        yuplay_guid 	= "6142E562-BF93-4BC6-BD3E-F83E0B998543",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2024 1 +level "Сердце тьмы"
        name 			= "BattlePassLvl_AUT2024_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13619",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13619",
        yuplay_guid_ru 	= "64016C5C-0D6E-4ADC-93DF-8667C6F83C9C",
        yuplay_guid 	= "64016C5C-0D6E-4ADC-93DF-8667C6F83C9C",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2024 2 +level "Сердце тьмы"
        name 			= "BattlePassLvl_AUT2024_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13622",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13622",
        yuplay_guid_ru 	= "50232D2E-2144-4D89-841D-2EB283DA949B",
        yuplay_guid 	= "50232D2E-2144-4D89-841D-2EB283DA949B",
        hidden 			= true,
    },
	
	   -- Battle pass AUT2024 3 +level "Зов Неизведанного" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass AUT2024_4 "Огонь любви" 
        name 			= "BattlePass_AUT2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789080",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13150",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13150",
        steam_appId 	= 2789080,
        yuplay_guid_ru 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        yuplay_guid 	= "AAF995B5-8644-4ECC-B863-8F617AC5EFFA",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2024_4 vip "Огонь любви"
        name 			= "BattlePassVip_AUT2024_4",
        steam_url 		= "https://store.steampowered.com/app/2789090",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13151",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13151",
        steam_appId		= 2789090,
        yuplay_guid_ru 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        yuplay_guid 	= "189E06B4-D848-4B79-9007-3340202F2CB7",
        hidden 			= true,
    },]]

	   -- Battle pass AUT2024_4 +level "Огонь любви" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

	----- SC-119209 DLC Yith'Mor. Элитный (Deluxe) набор (не путать с SC-118767 DLC Yith'Mor простой и элитный (Cтартовый и VIP))

	{
        -- Yith'Mor Элитный
        name			= "YithMor_Deluxe",
        steam_url		= "https://store.steampowered.com/app/3173820",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13649",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13649",
        steam_appId		= 3173820,
        yuplay_guid_ru	= "0B3457E9-5C92-41BD-8F37-566F2ACA4BE4",
        yuplay_guid		= "0B3457E9-5C92-41BD-8F37-566F2ACA4BE4",
        hidden			= true,
    },

	----- SC-119202 DLC Корабль Helios простой и элитный (для BP17 / AUT24). Осень 2024.
	{
        -- Helios Простой
        name			= "Helios",
        steam_url		= "https://store.steampowered.com/app/3212060",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13727",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13727",
        steam_appId		= 3212060,
        yuplay_guid_ru	= "D1B3FAA0-48DB-422C-B860-0363BE95815E",
        yuplay_guid		= "D1B3FAA0-48DB-422C-B860-0363BE95815E",
        hidden			= true,
    },	
	{
        -- Helios Элитный
        name			= "Helios_Elite",
        steam_url		= "https://store.steampowered.com/app/3212070",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13728",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13728",
        steam_appId		= 3212070,
        yuplay_guid_ru	= "E729039F-CB9F-4713-B524-C69B73A247F5",
        yuplay_guid		= "E729039F-CB9F-4713-B524-C69B73A247F5",
        hidden			= true,
    },

	----- SC-119205 DLC Корабль Psiloi простой и элитный (для EP17_3 / AUT24_3). Осень 2024.
	{
        -- Psiloi Простой
        name			= "Psiloi",
        steam_url		= "https://store.steampowered.com/app/3265650",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13763",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13763",
        steam_appId		= 3265650,
        yuplay_guid_ru	= "3D94A4E5-1A0D-40BB-9B3C-02BFEA580CAB",
        yuplay_guid		= "3D94A4E5-1A0D-40BB-9B3C-02BFEA580CAB",
        hidden			= true,
    },	
	{
        -- Psiloi Элитный
        name			= "Psiloi_Elite",
        steam_url		= "https://store.steampowered.com/app/3265640",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13764",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13764",
        steam_appId		= 3265640,
        yuplay_guid_ru	= "C64FCDD5-5776-4D99-B7EE-46088BCC886C",
        yuplay_guid		= "C64FCDD5-5776-4D99-B7EE-46088BCC886C",
        hidden			= true,
    },	
	
-- СЕЗОН BP18 / NY25. Зима 2025 (все фазы). "Забытые звезды" BP18_1(2) / NY25_1(2) . + "Архивы ЕЦН: Призрачный фронтир". (SC-119366 + SC-119472  + SC-119389 + SC-119473) НАЧАЛО БЛОКА
	
	{
        -- Battle pass NY2025 1 "Забытые звезды" 
        name 			= "BattlePass_NY2025_1",
        steam_url 		= "https://store.steampowered.com/app/3353990",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13890",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13890",
        steam_appId		= 3353990,
        yuplay_guid_ru 	= "EB722098-2CC0-42B8-B0C1-851B0DA1C484",
        yuplay_guid 	= "EB722098-2CC0-42B8-B0C1-851B0DA1C484",
        hidden 			= true,
    },
    {
        -- Battle pass NY2025 1 vip "Забытые звезды" 
        name 			= "BattlePassVip_NY2025_1",
        steam_url 		= "https://store.steampowered.com/app/3354000",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13892",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13892",
        steam_appId 	= 3354000,
        yuplay_guid_ru 	= "1B79146B-CBD6-4BD7-A0B7-1449DF0F29A9",
        yuplay_guid 	= "1B79146B-CBD6-4BD7-A0B7-1449DF0F29A9",
        hidden = true,
    },
	{
        -- Battle pass NY2025 2 "Забытые звезды" 
        name 			= "BattlePass_NY2025_2",
        steam_url 		= "https://store.steampowered.com/app/3353950",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=13893",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13893",
        steam_appId 	= 3353950,
        yuplay_guid_ru 	= "085C7CC5-A96E-44EA-A616-EC78AE9EBFD2",
        yuplay_guid 	= "085C7CC5-A96E-44EA-A616-EC78AE9EBFD2",
        hidden 			= true,
    },
    {
        -- Battle pass NY2025 2 vip "Забытые звезды"
        name 			= "BattlePassVip_NY2025_2",
        steam_url 		= "https://store.steampowered.com/app/3353960",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13895",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13895",
        steam_appId		= 3353960,
        yuplay_guid_ru 	= "B85A26C1-D383-4C68-AB9A-58826444481D",
        yuplay_guid 	= "B85A26C1-D383-4C68-AB9A-58826444481D",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass NY2025 2 vip_Hidden "Забытые звезды" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_NY2025_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass NY2025 3 "Призрачный фронтир" 
        name 			= "BattlePass_NY2025_3",
        steam_url 		= "https://store.steampowered.com/app/3353970",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13901",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=13901",
        steam_appId 	= 3353970,
        yuplay_guid_ru 	= "D8AD9E0B-149F-4312-A9F5-14E38F8CE8BB",
        yuplay_guid 	= "D8AD9E0B-149F-4312-A9F5-14E38F8CE8BB",
        hidden 			= true,
    },
    {
        -- Battle pass NY2025 3 vip "Призрачный фронтир"
        name 			= "BattlePassVip_NY2025_3",
        steam_url 		= "https://store.steampowered.com/app/3353980",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13902",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13902",
        steam_appId		= 3353980,
        yuplay_guid_ru 	= "35BD4EA6-4780-4C5C-B13E-A8B21B3C450F",
        yuplay_guid 	= "35BD4EA6-4780-4C5C-B13E-A8B21B3C450F",
        hidden 			= true,
    },
	{
        -- Battle pass NY2025 1 +level "Забытые звезды"
        name 			= "BattlePassLvl_NY2025_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13891",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13891",
        yuplay_guid_ru 	= "2441F55D-D7FE-4EB8-9DFA-342008692B21",
        yuplay_guid 	= "2441F55D-D7FE-4EB8-9DFA-342008692B21",
        hidden 			= true,
    },
	{
        -- Battle pass NY2025 2 +level "Забытые звезды"
        name 			= "BattlePassLvl_NY2025_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13894",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13894",
        yuplay_guid_ru 	= "D2DA9529-B00B-4E0E-8EE4-C59F6E73D445",
        yuplay_guid 	= "D2DA9529-B00B-4E0E-8EE4-C59F6E73D445",
        hidden 			= true,
    },
	
	   -- Battle pass NY2025 3 +level "Призрачный фронтир" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass NY2025_4 "Огонь любви / Искры чувств" 
        name 			= "BattlePass_NY2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14135",
        steam_appId 	= 3498850,
        yuplay_guid_ru 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        yuplay_guid 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        hidden 			= true,
    },
    {
        -- Battle pass NY2025_4 vip "Огонь любви / Искры чувств"
        name 			= "BattlePassVip_NY2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14136",
        steam_appId		= 3498840,
        yuplay_guid_ru 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        yuplay_guid 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        hidden 			= true,
    },]]

	   -- Battle pass NY2025_4 +level "Огонь любви / Искры чувств" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- СЕЗОН BP18 / NY25. Зима 2025 (все фазы). "Забытые звезды" BP18_1(2) / NY25_1(2) . + "Архивы ЕЦН: Призрачный фронтир". (SC-119366 + ...  + SC-119389) КОНЕЦ БЛОКА

	----- SC-119390 DLC Корабль "Persei-8" простой и элитный (для EP18_3 / NY24_3). Зима 2024.
	{
        -- Persei Простой
        name			= "Persei",
        steam_url		= "https://store.steampowered.com/app/3353910",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13897",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13897",
        steam_appId		= 3353910,
        yuplay_guid_ru	= "4DE55DEC-1F35-4F9C-8E76-022790A4B87F",
        yuplay_guid		= "4DE55DEC-1F35-4F9C-8E76-022790A4B87F",
        hidden			= true,
    },	
	{
        -- Persei Элитный
        name			= "Persei_Elite",
        steam_url		= "https://store.steampowered.com/app/3353920",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13898",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13898",
        steam_appId		= 3353920,
        yuplay_guid_ru	= "82D36512-A599-496A-BB28-5943D499EEA9",
        yuplay_guid		= "82D36512-A599-496A-BB28-5943D499EEA9",
        hidden			= true,
    },	
	
----- SC-119474 DLC Корабль "Bashe" простой и элитный (для BP18 / NY25). Зима 2025.
	{
        -- Bashe Простой
        name			= "Bashe",
        steam_url		= "https://store.steampowered.com/app/3353930",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13888",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13888",
        steam_appId		= 3353930,
        yuplay_guid_ru	= "B093CDE9-BD89-43D8-96E6-15C73BF296AB",
        yuplay_guid		= "B093CDE9-BD89-43D8-96E6-15C73BF296AB",
        hidden			= true,
    },	
	{
        -- Bashe Элитный
        name			= "Bashe_Elite",
        steam_url		= "https://store.steampowered.com/app/3353940",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=13889",
        yuplay_url		= "https://store.gaijin.net/story.php?id=13889",
        steam_appId		= 3353940,
        yuplay_guid_ru	= "111A7EFE-816C-4257-BD1E-8023A316CA9B",
        yuplay_guid		= "111A7EFE-816C-4257-BD1E-8023A316CA9B",
        hidden			= true,
    },	
	
-- СЕЗОН BP19 / SPR25. Весна 2025 (все фазы). "Союзники и соперники" BP19_1(2) / SPR25_1(2) . + "Архивы ЕЦН: Хроники последних дней". Star Conflict 1.13.2 (SC-119539 + SC-119540  + SC-119541 + SC-119672) НАЧАЛО БЛОКА
	
	{
        -- Battle pass SPR2025 1 "Союзники и соперники" 
        name 			= "BattlePass_SPR2025_1",
        steam_url 		= "https://store.steampowered.com/app/3508350",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14151",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14151",
        steam_appId		= 3508350,
        yuplay_guid_ru 	= "A74C9E88-367F-428E-8065-D9872E385891",
        yuplay_guid 	= "A74C9E88-367F-428E-8065-D9872E385891",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2025 1 vip "Союзники и соперники" 
        name 			= "BattlePassVip_SPR2025_1",
        steam_url 		= "https://store.steampowered.com/app/3508370",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14153",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14153",
        steam_appId 	= 3508370,
        yuplay_guid_ru 	= "F41B606D-1E43-4876-9E97-97AA1B29B7CA",
        yuplay_guid 	= "F41B606D-1E43-4876-9E97-97AA1B29B7CA",
        hidden = true,
    },
	{
        -- Battle pass SPR2025 2 "Союзники и соперники" 
        name 			= "BattlePass_SPR2025_2",
        steam_url 		= "https://store.steampowered.com/app/3508380",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14154",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14154",
        steam_appId 	= 3508380,
        yuplay_guid_ru 	= "DE46A50D-E821-4E25-AD62-EC739C612DBD",
        yuplay_guid 	= "DE46A50D-E821-4E25-AD62-EC739C612DBD",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2025 2 vip "Союзники и соперники"
        name 			= "BattlePassVip_SPR2025_2",
        steam_url 		= "https://store.steampowered.com/app/3508390",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14156",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14156",
        steam_appId		= 3508390,
        yuplay_guid_ru 	= "770483E9-D5B2-47CB-8C16-FAC3355AE807",
        yuplay_guid 	= "770483E9-D5B2-47CB-8C16-FAC3355AE807",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass SPR2025 2 vip_Hidden "Союзники и соперники" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_SPR2025_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass SPR2025 3 "Хроники последних дней" 
        name 			= "BattlePass_SPR2025_3",
        steam_url 		= "https://store.steampowered.com/app/3642590",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14349",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14349",
        steam_appId 	= 3642590,
        yuplay_guid_ru 	= "0423D103-BCEF-4E11-8EC0-D0CE32279A75",
        yuplay_guid 	= "0423D103-BCEF-4E11-8EC0-D0CE32279A75",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2025 3 vip "Хроники последних дней"
        name 			= "BattlePassVip_SPR2025_3",
        steam_url 		= "https://store.steampowered.com/app/3642580",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14350",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14350",
        steam_appId		= 3642580,
        yuplay_guid_ru 	= "394CB22C-80A3-4A8D-8B20-F684B4698E4D",
        yuplay_guid 	= "394CB22C-80A3-4A8D-8B20-F684B4698E4D",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2025 1 +level "Союзники и соперники"
        name 			= "BattlePassLvl_SPR2025_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14152",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14152",
        yuplay_guid_ru 	= "D867F091-B9EC-46BD-9FA6-E16413B1AC5E",
        yuplay_guid 	= "D867F091-B9EC-46BD-9FA6-E16413B1AC5E",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2025 2 +level "Союзники и соперники"
        name 			= "BattlePassLvl_SPR2025_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14155",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14155",
        yuplay_guid_ru 	= "9AC7A0E1-E1E9-472A-A125-0EE2CA216468",
        yuplay_guid 	= "9AC7A0E1-E1E9-472A-A125-0EE2CA216468",
        hidden 			= true,
    },
	
	   -- Battle pass SPR2025 3 +level "Хроники последних дней" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass SPR2025_4 "Огонь любви / Искры чувств" 
        name 			= "BattlePass_SPR2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14135",
        steam_appId 	= 3498850,
        yuplay_guid_ru 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        yuplay_guid 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2025_4 vip "Огонь любви / Искры чувств"
        name 			= "BattlePassVip_SPR2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14136",
        steam_appId		= 3498840,
        yuplay_guid_ru 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        yuplay_guid 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        hidden 			= true,
    },]]

	   -- Battle pass SPR2025_4 +level "Огонь любви / Искры чувств" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- СЕЗОН BP19 / SPR25. Весна 2025 (все фазы). "Союзники и соперники" BP19_1(2) / SPR25_1(2) . + "Архивы ЕЦН: Хроники последних дней". Star Conflict 1.13.2 (SC-119539 + SC-119540  + SC-119541 + SC-119672) КОНЕЦ БЛОКА

----- SC-119670 DLC Корабль "Drag'thir" простой и элитный (для BP19 / SPR25). Весна 2025.
	{
        -- Drag'thir Стартовый
        name			= "DragThir",
        steam_url		= "https://store.steampowered.com/app/3642630",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14351",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14351",
        steam_appId		= 3642630,
        yuplay_guid_ru	= "4F7C79E2-D7F7-40A8-B78B-9862F4027030",
        yuplay_guid		= "4F7C79E2-D7F7-40A8-B78B-9862F4027030",
        hidden			= true,
    },	
	{
        -- Drag'thir VIP
        name			= "DragThir_Elite",
        steam_url		= "https://store.steampowered.com/app/3642640",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14352",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14352",
        steam_appId		= 3642640,
        yuplay_guid_ru	= "4BFCC7D5-338A-4ECC-AC81-DC50DBC2E039",
        yuplay_guid		= "4BFCC7D5-338A-4ECC-AC81-DC50DBC2E039",
        hidden			= true,
    },	
	
----- SC-119673 DLC Корабль "MPRS Hellas" простой и элитный (для EP19_3 / SPR25_3). Весна 2025
	{
        -- Hellas Простой
        name			= "Hellas",
        steam_url		= "https://store.steampowered.com/app/3642620",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14154",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14154",
        steam_appId		= 3642620,
        yuplay_guid_ru	= "E2D33205-392B-4ECA-BE9C-434065D7D9E8",
        yuplay_guid		= "E2D33205-392B-4ECA-BE9C-434065D7D9E8",
        hidden			= true,
    },	
	{
        -- Hellas Элитный
        name			= "Hellas_Elite",
        steam_url		= "https://store.steampowered.com/app/3642610",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14353",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14353",
        steam_appId		= 3642610,
        yuplay_guid_ru	= "5B962E4D-A93E-4960-902D-220DE61A0CAF",
        yuplay_guid		= "5B962E4D-A93E-4960-902D-220DE61A0CAF",
        hidden			= true,
    },	
	
-- СЕЗОН BP20 / SUM25. Лето 2025 (все фазы). "Предания древних" BP20_1(2) / SUM25_1(2) . + "Архивы ЕЦН: Сезон штормов". Star Conflict 1.13.7 (SC-119771 + .. + ...) НАЧАЛО БЛОКА
	
	{
        -- Battle pass SUM2025 1 "Предания древних" 
        name 			= "BattlePass_SUM2025_1",
        steam_url 		= "https://store.steampowered.com/app/3745680",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14416",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14416",
        steam_appId		= 3745680,
        yuplay_guid_ru 	= "69414E85-2849-4E30-B9DC-0C96C008FB97",
        yuplay_guid 	= "69414E85-2849-4E30-B9DC-0C96C008FB97",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2025 1 vip "Предания древних" 
        name 			= "BattlePassVip_SUM2025_1",
        steam_url 		= "https://store.steampowered.com/app/3745690",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14418",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14418",
        steam_appId 	= 3745690,
        yuplay_guid_ru 	= "3B1D27E0-09E8-4B50-98C5-D1D8B3C6804A",
        yuplay_guid 	= "3B1D27E0-09E8-4B50-98C5-D1D8B3C6804A",
        hidden = true,
    },
	{
        -- Battle pass SUM2025 2 "Предания древних" 
        name 			= "BattlePass_SUM2025_2",
        steam_url 		= "https://store.steampowered.com/app/3745700",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14419",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14419",
        steam_appId 	= 3745700,
        yuplay_guid_ru 	= "5676B317-A795-4BDB-B6B5-43EB6E08BB07",
        yuplay_guid 	= "5676B317-A795-4BDB-B6B5-43EB6E08BB07",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2025 2 vip "Предания древних"
        name 			= "BattlePassVip_SUM2025_2",
        steam_url 		= "https://store.steampowered.com/app/3745710",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14421",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14421",
        steam_appId		= 3745710,
        yuplay_guid_ru 	= "1286AFBD-E6F4-45A8-8E7D-AF62A668851C",
        yuplay_guid 	= "1286AFBD-E6F4-45A8-8E7D-AF62A668851C",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass SUM2025 2 vip_Hidden "Предания древних" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_SUM2025_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass SUM2025 3 "Сезон штормов" 
        name 			= "BattlePass_SUM2025_3",
        steam_url 		= "https://store.steampowered.com/app/3745780",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14414",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14414",
        steam_appId 	= 3745780,
        yuplay_guid_ru 	= "FDEE5DF0-3518-4A15-B37C-B18C7D515342",
        yuplay_guid 	= "FDEE5DF0-3518-4A15-B37C-B18C7D515342",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2025 3 vip "Сезон штормов"
        name 			= "BattlePassVip_SUM2025_3",
        steam_url 		= "https://store.steampowered.com/app/3745790",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14415",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14415",
        steam_appId		= 3745790,
        yuplay_guid_ru 	= "668653B7-4780-4BF0-8B40-43944B5E94F7",
        yuplay_guid 	= "668653B7-4780-4BF0-8B40-43944B5E94F7",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2025 1 +level "Предания древних"
        name 			= "BattlePassLvl_SUM2025_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14417",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14417",
        yuplay_guid_ru 	= "184915EE-A754-49E5-A86F-39025F6433C9",
        yuplay_guid 	= "184915EE-A754-49E5-A86F-39025F6433C9E",
        hidden 			= true,
    },
	{
        -- Battle pass SUM2025 2 +level "Предания древних"
        name 			= "BattlePassLvl_SUM2025_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14420",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14420",
        yuplay_guid_ru 	= "EEDCDB87-6B8E-4644-AB63-02AED6DFA062",
        yuplay_guid 	= "EEDCDB87-6B8E-4644-AB63-02AED6DFA062",
        hidden 			= true,
    },
	
	   -- Battle pass SUM2025 3 +level "Сезон штормов" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass SUM2025_4 "Огонь любви / Искры чувств" 
        name 			= "BattlePass_SUM2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14135",
        steam_appId 	= 3498850,
        yuplay_guid_ru 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        yuplay_guid 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        hidden 			= true,
    },
    {
        -- Battle pass SUM2025_4 vip "Огонь любви / Искры чувств"
        name 			= "BattlePassVip_SUM2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14136",
        steam_appId		= 3498840,
        yuplay_guid_ru 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        yuplay_guid 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        hidden 			= true,
    },]]

	   -- Battle pass SUM2025_4 +level "Огонь любви / Искры чувств" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- -- СЕЗОН BP20 / SUM25. Лето 2025 (все фазы). "Предания древних" BP20_1(2) / SUM25_1(2) . + "Архивы ЕЦН: Сезон штормов". Star Conflict 1.13.7 (SC-119771 + .. + ...) КОНЕЦ БЛОКА		

----- SC-119846 DLC Корабль "Amber" простой и элитный (для BP20 / SUM25). Лето 2025.
	{
        -- Amber Простой
        name			= "Amber",
        steam_url		= "https://store.steampowered.com/app/3745730",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14409",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14409",
        steam_appId		= 3745730,
        yuplay_guid_ru	= "767D1D46-6730-4A11-A099-19AC250AB32F",
        yuplay_guid		= "767D1D46-6730-4A11-A099-19AC250AB32F",
        hidden			= true,
    },	
	{
        -- Amber Элитный
        name			= "Amber_Elite",
        steam_url		= "https://store.steampowered.com/app/3745750",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14410",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14410",
        steam_appId		= 3745750,
        yuplay_guid_ru	= "7F7A40D6-E025-4EEF-B1C7-323B1AC6964C",
        yuplay_guid		= "7F7A40D6-E025-4EEF-B1C7-323B1AC6964C",
        hidden			= true,
    },	
	
----- SC-119894 DLC Корабль "Cinquedea" простой и элитный (для BP20_3 / SUM25). Лето 2025.
	{
        -- Cinquedea Простой
        name			= "Cinquedea",
        steam_url		= "https://store.steampowered.com/app/3875170",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14624",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14624",
        steam_appId		= 3875170,
        yuplay_guid_ru	= "75184D80-7B01-4A4B-AC4F-DD00E53D41C0",
        yuplay_guid		= "75184D80-7B01-4A4B-AC4F-DD00E53D41C0",
        hidden			= true,
    },	
	{
        -- Cinquedea Элитный
        name			= "Cinquedea_Elite",
        steam_url		= "https://store.steampowered.com/app/3875160",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14625",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14625",
        steam_appId		= 3875160,
        yuplay_guid_ru	= "BDCB7444-6131-453E-A472-D22CF645E638",
        yuplay_guid		= "BDCB7444-6131-453E-A472-D22CF645E638",
        hidden			= true,
    },		
	
-- СЕЗОН BP21 / AUT25. Осень 2025 (все фазы). "Опустошенные миры" BP21_1(2) / AUT25_1(2) . + "Архивы ЕЦН: Шепот во мраке". Star Conflict 1.13.10 (SC-119975 + .. + ...) НАЧАЛО БЛОКА
	
	{
        -- Battle pass AUT2025 1 "Опустошенные миры" 
        name 			= "BattlePass_AUT2025_1",
        steam_url 		= "https://store.steampowered.com/app/3969460",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14731",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14731",
        steam_appId		= 3969460,
        yuplay_guid_ru 	= "B691491F-D5C0-4E1E-9E08-4E8E96DEB6BF",
        yuplay_guid 	= "B691491F-D5C0-4E1E-9E08-4E8E96DEB6BF",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2025 1 vip "Опустошенные миры" 
        name 			= "BattlePassVip_AUT2025_1",
        steam_url 		= "https://store.steampowered.com/app/3969450",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14733",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14733",
        steam_appId 	= 3969450,
        yuplay_guid_ru 	= "83B2EDE7-75D2-46FE-A452-727F50A43372",
        yuplay_guid 	= "83B2EDE7-75D2-46FE-A452-727F50A43372",
        hidden = true,
    },
	{
        -- Battle pass AUT2025 2 "Опустошенные миры" 
        name 			= "BattlePass_AUT2025_2",
        steam_url 		= "https://store.steampowered.com/app/3969480",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14734",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14734",
        steam_appId 	= 3969480,
        yuplay_guid_ru 	= "A68EEC27-995D-4BF5-8997-DB6FEFD8DDD5",
        yuplay_guid 	= "A68EEC27-995D-4BF5-8997-DB6FEFD8DDD5",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2025 2 vip "Опустошенные миры"
        name 			= "BattlePassVip_AUT2025_2",
        steam_url 		= "https://store.steampowered.com/app/3969470",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14736",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14736",
        steam_appId		= 3969470,
        yuplay_guid_ru 	= "A0C42BB8-3FA2-451A-BE45-439FFF216E7E",
        yuplay_guid 	= "A0C42BB8-3FA2-451A-BE45-439FFF216E7E",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass AUT2025 2 vip_Hidden "Опустошенные миры" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_AUT2025_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass AUT2025 3 "Шепот во мраке" 
        name 			= "BattlePass_AUT2025_3",
        steam_url 		= "https://store.steampowered.com/app/3969440",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14738",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14738",
        steam_appId 	= 3969440,
        yuplay_guid_ru 	= "6654A337-ACF8-4F04-9BEE-358A88C292C6",
        yuplay_guid 	= "6654A337-ACF8-4F04-9BEE-358A88C292C6",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2025 3 vip "Шепот во мраке"
        name 			= "BattlePassVip_AUT2025_3",
        steam_url 		= "https://store.steampowered.com/app/3969430",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14739",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14739",
        steam_appId		= 3969430,
        yuplay_guid_ru 	= "CEC2882D-0E12-4503-8FA2-F0249C6698ED",
        yuplay_guid 	= "CEC2882D-0E12-4503-8FA2-F0249C6698ED",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2025 1 +level "Опустошенные миры"
        name 			= "BattlePassLvl_AUT2025_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14732",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14732",
        yuplay_guid_ru 	= "6E41B905-7CD4-4986-8B86-AF7738DBC8EA",
        yuplay_guid 	= "6E41B905-7CD4-4986-8B86-AF7738DBC8EA",
        hidden 			= true,
    },
	{
        -- Battle pass AUT2025 2 +level "Опустошенные миры"
        name 			= "BattlePassLvl_AUT2025_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14735",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14735",
        yuplay_guid_ru 	= "214987E8-6283-4DAB-8AF4-C610D3951960",
        yuplay_guid 	= "214987E8-6283-4DAB-8AF4-C610D3951960",
        hidden 			= true,
    },
	
	   -- Battle pass AUT2025 3 +level "Шепот во мраке" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass AUT2025_4 "Огонь любви / Искры чувств" 
        name 			= "BattlePass_AUT2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498850",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14135",
        steam_appId 	= 3498850,
        yuplay_guid_ru 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        yuplay_guid 	= "AE371FA1-A32A-46B2-93B0-F13F5D247782",
        hidden 			= true,
    },
    {
        -- Battle pass AUT2025_4 vip "Огонь любви / Искры чувств"
        name 			= "BattlePassVip_AUT2025_4",
        steam_url 		= "https://store.steampowered.com/app/3498840",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14136",
        steam_appId		= 3498840,
        yuplay_guid_ru 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        yuplay_guid 	= "3CAED526-D282-47E7-A27A-E181297ED9FC",
        hidden 			= true,
    },]]

	   -- Battle pass AUT2025_4 +level "Огонь любви / Искры чувств" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- -- СЕЗОН BP21 / AUT25. Осень 2025 (все фазы). "Опустошенные миры" BP21_1(2) / AUT25_1(2) . + "Архивы ЕЦН: Шепот во мраке". Star Conflict 1.13.10 (SC-119975 + .. + ...) КОНЕЦ БЛОКА

	----- SC-120017 SC. DLC Drag'thir Элитный (Deluxe) набор (не путать с SC-119670 DLC Корабль "Drag'thir" простой и VIP...)

	{
        -- Drag'thir Элитный
        name			= "DragThir_Deluxe",
        steam_url		= "https://store.steampowered.com/app/4002620",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14748",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14748",
        steam_appId		= 4002620,
        yuplay_guid_ru	= "A0016AC2-B614-4EA2-A4FC-A655A45A6119",
        yuplay_guid		= "A0016AC2-B614-4EA2-A4FC-A655A45A6119",
        hidden			= true,
    },	
	
----- SC-120083 DLC Корабль "Ace" простой и элитный (для BP21_3 / AUT25). Осень 2025.
	{
        -- Ace Простой
        name			= "Ace",
        steam_url		= "https://store.steampowered.com/app/4080670",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14875",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14875",
        steam_appId		= 4080670,
        yuplay_guid_ru	= "54C8F32C-A1A6-41B2-BBD4-79DB44173298",
        yuplay_guid		= "54C8F32C-A1A6-41B2-BBD4-79DB44173298",
        hidden			= true,
    },	
	{
        -- Ace Элитный
        name			= "Ace_Elite",
        steam_url		= "https://store.steampowered.com/app/4080680",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14876",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14876",
        steam_appId		= 4080680,
        yuplay_guid_ru	= "9B31E78E-396A-4230-AC9A-FB737BFD325B",
        yuplay_guid		= "9B31E78E-396A-4230-AC9A-FB737BFD325B",
        hidden			= true,
    },	
	
----- SC-120164 DLC Корабль "Carolingian" простой и элитный (для BP21_2 / AUT25). Осень 2025.
	{
        -- Carolingian Простой
        name			= "Carolingian",
        steam_url		= "https://store.steampowered.com/app/4002640",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14746",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14746",
        steam_appId		= 4002640,
        yuplay_guid_ru	= "809300AF-DDF9-49D6-8491-150B53CB028E",
        yuplay_guid		= "809300AF-DDF9-49D6-8491-150B53CB028E",
        hidden			= true,
    },	
	{
        -- Carolingian Элитный
        name			= "Carolingian_Elite",
        steam_url		= "https://store.steampowered.com/app/4002630",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14747",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14747",
        steam_appId		= 4002630,
        yuplay_guid_ru	= "9EEC8C85-3A9C-4FDD-85BF-241F90B123D5",
        yuplay_guid		= "9EEC8C85-3A9C-4FDD-85BF-241F90B123D5",
        hidden			= true,
    },		
	
-- СЕЗОН BP22 / NY26. Зима 2026 (все фазы). "Перекрёсток галактик" BP22_1(2) / NY26_1(2) . + "Архивы ЕЦН: Утраченные созвездия". Star Conflict 1.14.01 (SC-120197 + SC-120199 + ...) НАЧАЛО БЛОКА
	
	{
        -- Battle pass NY2026 1 "Перекрёсток галактик" 
        name 			= "BattlePass_NY2026_1",
        steam_url 		= "https://store.steampowered.com/app/4193410",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14988",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14988",
        steam_appId		= 4193410,
        yuplay_guid_ru 	= "C524D8B4-5C65-49D5-80E0-5F64A601AF5B",
        yuplay_guid 	= "C524D8B4-5C65-49D5-80E0-5F64A601AF5B",
        hidden 			= true,
    },
    {
        -- Battle pass NY2026 1 vip "Перекрёсток галактик" 
        name 			= "BattlePassVip_NY2026_1",
        steam_url 		= "https://store.steampowered.com/app/4193420",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14984",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14984",
        steam_appId 	= 4193420,
        yuplay_guid_ru 	= "CD4B9786-EC40-40AA-9E24-984A0A410331",
        yuplay_guid 	= "CD4B9786-EC40-40AA-9E24-984A0A410331",
        hidden = true,
    },
	{
        -- Battle pass NY2026 2 "Перекрёсток галактик" 
        name 			= "BattlePass_NY2026_2",
        steam_url 		= "https://store.steampowered.com/app/4193430",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=14985",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14985",
        steam_appId 	= 4193430,
        yuplay_guid_ru 	= "4F2E6A84-F3FE-42AE-9613-1A456DA5D214",
        yuplay_guid 	= "4F2E6A84-F3FE-42AE-9613-1A456DA5D214",
        hidden 			= true,
    },
    {
        -- Battle pass NY2026 2 vip "Перекрёсток галактик"
        name 			= "BattlePassVip_NY2026_2",
        steam_url 		= "https://store.steampowered.com/app/4193440",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14987",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14987",
        steam_appId		= 4193440,
        yuplay_guid_ru 	= "EECCABB0-D15F-4E5A-AC95-53F598FFB899",
        yuplay_guid 	= "EECCABB0-D15F-4E5A-AC95-53F598FFB899",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass NY2026 2 vip_Hidden "Перекрёсток галактик" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_NY2026_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass NY2026 3 "Утраченные созвездия" 
        name 			= "BattlePass_NY2026_3",
        steam_url 		= "https://store.steampowered.com/app/4193450",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14989",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=14989",
        steam_appId 	= 4193450,
        yuplay_guid_ru 	= "789B1418-3B01-4152-9863-0CF94DE9295C",
        yuplay_guid 	= "789B1418-3B01-4152-9863-0CF94DE9295C",
        hidden 			= true,
    },
    {
        -- Battle pass NY2026 3 vip "Утраченные созвездия"
        name 			= "BattlePassVip_NY2026_3",
        steam_url 		= "https://store.steampowered.com/app/4193460",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14990",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14990",
        steam_appId		= 4193460,
        yuplay_guid_ru 	= "B7C46983-E101-4DFC-A2BF-9ECA008C327C",
        yuplay_guid 	= "B7C46983-E101-4DFC-A2BF-9ECA008C327C",
        hidden 			= true,
    },
	{
        -- Battle pass NY2026 1 +level "Перекрёсток галактик"
        name 			= "BattlePassLvl_NY2026_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14983",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14983",
        yuplay_guid_ru 	= "2D2D9E7E-0F50-4629-8C2F-55619C388968",
        yuplay_guid 	= "2D2D9E7E-0F50-4629-8C2F-55619C388968",
        hidden 			= true,
    },
	{
        -- Battle pass NY2026 2 +level "Перекрёсток галактик"
        name 			= "BattlePassLvl_NY2026_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14986",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14986",
        yuplay_guid_ru 	= "20E29240-7A2E-4A85-AFEA-BD021E454DA6",
        yuplay_guid 	= "20E29240-7A2E-4A85-AFEA-BD021E454DA6",
        hidden 			= true,
    },
	
	   -- Battle pass NY2026 3 +level "Утраченные созвездия" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass NY2026_4 "Огонь любви / Искры чувств / Потерянный контакт" 
        name 			= "BattlePass_NY2026_4",
        steam_url 		= "https://store.steampowered.com/app/4337780",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=15135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=15135",
        steam_appId 	= 4337780,
        yuplay_guid_ru 	= "A63A27C5-F390-42F6-A69F-BAF6DD363E38",
        yuplay_guid 	= "A63A27C5-F390-42F6-A69F-BAF6DD363E38",
        hidden 			= true,
    },
    {
        -- Battle pass NY2026_4 vip "Огонь любви / Искры чувств / Потерянный контакт"
        name 			= "BattlePassVip_NY2026_4",
        steam_url 		= "https://store.steampowered.com/app/4337760",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15136",
        steam_appId		= 4337760,
        yuplay_guid_ru 	= "07D9F4F2-8152-4F83-A667-DF58F4A3D1FD",
        yuplay_guid 	= "07D9F4F2-8152-4F83-A667-DF58F4A3D1FD",
        hidden 			= true,
    },

	   -- Battle pass NY2026_4 +level "Огонь любви / Искры чувств / Потерянный контакт" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- СЕЗОН BP22 / NY26. Зима 2026 (все фазы). "Перекрёсток галактик" BP22_1(2) / NY26_1(2) . + "Архивы ЕЦН: Утраченные созвездия". Star Conflict 1.14.01 (SC-120197 + SC-120199 + ...) КОНЕЦ БЛОКА
	
----- SC-120200 DLC Корабль "Apeiron" простой и элитный (для EP22_3 / NY26_3). Зима 2025-26.
	{
        -- Apeiron Простой
        name			= "Apeiron",
        steam_url		= "https://store.steampowered.com/app/4193470",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14980",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14980",
        steam_appId		= 4193470,
        yuplay_guid_ru	= "4666BF90-FA81-443B-9709-C8FC058F3C45",
        yuplay_guid		= "4666BF90-FA81-443B-9709-C8FC058F3C45",
        hidden			= true,
    },	
	{
        -- Apeiron Элитный
        name			= "Apeiron_Elite",
        steam_url		= "https://store.steampowered.com/app/4193480",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14981",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14981",
        steam_appId		= 4193480,
        yuplay_guid_ru	= "9E73BAAD-5C5A-4EDF-AE1F-69F8921DA907",
        yuplay_guid		= "9E73BAAD-5C5A-4EDF-AE1F-69F8921DA907",
        hidden			= true,
    },	

----- SC-120295 Star Conflict 1.14.03. DLC. Корабль "Saturn" простой и элитный (для BP22 / NY26). Зима 2026.
	{
        -- Saturn Простой
        name			= "Saturn",
        steam_url		= "https://store.steampowered.com/app/4193490",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14991",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14991",
        steam_appId		= 4193490,
        yuplay_guid_ru	= "50FE1AB1-4684-42CF-A09C-7CC0DB62EF2E",
        yuplay_guid		= "50FE1AB1-4684-42CF-A09C-7CC0DB62EF2E",
        hidden			= true,
    },	
	{
        -- Saturn Элитный
        name			= "Saturn_Elite",
        steam_url		= "https://store.steampowered.com/app/4193500",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=14992",
        yuplay_url		= "https://store.gaijin.net/story.php?id=14992",
        steam_appId		= 4193500,
        yuplay_guid_ru	= "D697EE95-374A-4550-BB7D-D9D334992ECE",
        yuplay_guid		= "D697EE95-374A-4550-BB7D-D9D334992ECE",
        hidden			= true,
    },		

----- SC-120352 DLC Корабль "Cor Legibus" простой и элитный (для EP22_4 / NY26_4). Зима 2025-26.
	{
        -- Cor Legibus Простой
        name			= "CorLegibus",
        steam_url		= "https://store.steampowered.com/app/4391020",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15138",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15138",
        steam_appId		= 4391020,
        yuplay_guid_ru	= "BB27383B-D964-4D68-AF67-619110364F18",
        yuplay_guid		= "BB27383B-D964-4D68-AF67-619110364F18",
        hidden			= true,
    },	
	{
        -- Cor Legibus Элитный
        name			= "CorLegibus_Elite",
        steam_url		= "https://store.steampowered.com/app/4391030",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15136",
        steam_appId		= 4391030,
        yuplay_guid_ru	= "56C84198-BA4D-4F4B-BC60-3571AAE07322",
        yuplay_guid		= "56C84198-BA4D-4F4B-BC60-3571AAE07322",
        hidden			= true,
    },			
	
-- СЕЗОН BP23 / SPR26. Весна 2026 (все фазы). БП "Раскол альянсов" BP23_1(2) / SPR26_1(2). + ИП "Кровь Фронтира" BP23_3 / SPR26_3. Star Conflict 1.14.05 (SC-120380 + ... + ...) НАЧАЛО БЛОКА
	
	{
        -- Battle pass SPR2026 1 "Раскол Альянсов" 
        name 			= "BattlePass_SPR2026_1",
        steam_url 		= "https://store.steampowered.com/app/4417280",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=15255",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=15255",
        steam_appId		= 4417280,
        yuplay_guid_ru 	= "B4A70169-B87E-4F3E-85F0-014355D412AF",
        yuplay_guid 	= "B4A70169-B87E-4F3E-85F0-014355D412AF",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2026 1 vip "Раскол Альянсов" 
        name 			= "BattlePassVip_SPR2026_1",
        steam_url 		= "https://store.steampowered.com/app/4417220",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15257",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15257",
        steam_appId 	= 4417220,
        yuplay_guid_ru 	= "50B41A79-B51A-45C3-AE80-28BDFCA80774",
        yuplay_guid 	= "50B41A79-B51A-45C3-AE80-28BDFCA80774",
        hidden = true,
    },
	{
        -- Battle pass SPR2026 2 "Раскол Альянсов" 
        name 			= "BattlePass_SPR2026_2",
        steam_url 		= "https://store.steampowered.com/app/4417210",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=15258",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=15258",
        steam_appId 	= 4417210,
        yuplay_guid_ru 	= "E865A66E-8B16-41D8-8AC2-955BC132CF5D",
        yuplay_guid 	= "E865A66E-8B16-41D8-8AC2-955BC132CF5D",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2026 2 vip "Раскол Альянсов"
        name 			= "BattlePassVip_SPR2026_2",
        steam_url 		= "https://store.steampowered.com/app/4417200",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15260",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15260",
        steam_appId		= 4417200,
        yuplay_guid_ru 	= "EAE044DE-324B-44DE-9C13-7FDDC5B19CB4",
        yuplay_guid 	= "EAE044DE-324B-44DE-9C13-7FDDC5B19CB4",
        hidden 			= true,
    },
--[[     { -- РАСКОММЕНТИРОВАТЬ БЛОК, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ ПО ДАННОМУ ОФФЕРУ - ПО АНАЛОГИИ С SC-118299
        -- Battle pass SPR2026 2 vip_Hidden "Раскол Альянсов" !!! Gaijin ONLY !!! Скрытый пропуск для прошедших БП с дисконтом 50%
        name 			= "BattlePassVipHidden_SPR2026_2",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=12837",
        yuplay_url		= "https://store.gaijin.net/story.php?id=12837",
        yuplay_guid_ru 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        yuplay_guid 	= "8C3DB5DF-47A9-4CB4-9CBF-67A905B3B9D8",
        hidden 			= true,
    },]]
	
	{ 
        -- Battle pass SPR2026 3 "Кровь Фронтира" 
        name 			= "BattlePass_SPR2026_3",
        steam_url 		= "https://store.steampowered.com/app/4417190",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15251",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=15251",
        steam_appId 	= 4417190,
        yuplay_guid_ru 	= "9A4BEC76-2A12-47B4-A89F-C8FE66058B5F",
        yuplay_guid 	= "9A4BEC76-2A12-47B4-A89F-C8FE66058B5F",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2026 3 vip "Кровь Фронтира"
        name 			= "BattlePassVip_SPR2026_3",
        steam_url 		= "https://store.steampowered.com/app/4417180",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15252",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15252",
        steam_appId		= 4417180,
        yuplay_guid_ru 	= "19858E5F-94BA-43B7-B706-5BE7291AF9D5",
        yuplay_guid 	= "19858E5F-94BA-43B7-B706-5BE7291AF9D5",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2026 1 +level "Раскол Альянсов"
        name 			= "BattlePassLvl_SPR2026_1",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15256",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15256",
        yuplay_guid_ru 	= "B4AFC5D9-D847-4CA8-9F80-3C1D8B4B5327",
        yuplay_guid 	= "B4AFC5D9-D847-4CA8-9F80-3C1D8B4B5327",
        hidden 			= true,
    },
	{
        -- Battle pass SPR2026 2 +level "Раскол Альянсов"
        name 			= "BattlePassLvl_SPR2026_2",
        steam_force_yuplay = true,
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15259",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15259",
        yuplay_guid_ru 	= "BE57F844-F736-44E3-957D-40A59E82974C",
        yuplay_guid 	= "BE57F844-F736-44E3-957D-40A59E82974C",
        hidden 			= true,
    },
	
	   -- Battle pass SPR2026 3 +level "Кровь Фронтира" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА
	   
--[[	{ -- РАСКОММЕНТИРОВАТЬ БЛОКИ, КОГДА (И ЕСЛИ) БУДУТ ДАННЕ 4му ЭТАПУ 
        -- Battle pass SPR2026_4 "Огонь любви / Искры чувств / Потерянный контакт" 
        name 			= "BattlePass_SPR2026_4",
        steam_url 		= "https://store.steampowered.com/app/4337780",
        yuplay_url_ru 	= "https://store.gaijin.net/story.php?id=15135",
        yuplay_url 		= "https://store.gaijin.net/story.php?id=15135",
        steam_appId 	= 4337780,
        yuplay_guid_ru 	= "A63A27C5-F390-42F6-A69F-BAF6DD363E38",
        yuplay_guid 	= "A63A27C5-F390-42F6-A69F-BAF6DD363E38",
        hidden 			= true,
    },
    {
        -- Battle pass SPR2026_4 vip "Огонь любви / Искры чувств / Потерянный контакт"
        name 			= "BattlePassVip_SPR2026_4",
        steam_url 		= "https://store.steampowered.com/app/4337760",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15136",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15136",
        steam_appId		= 4337760,
        yuplay_guid_ru 	= "07D9F4F2-8152-4F83-A667-DF58F4A3D1FD",
        yuplay_guid 	= "07D9F4F2-8152-4F83-A667-DF58F4A3D1FD",
        hidden 			= true,
    },]]

	   -- Battle pass SPR2026_4 +level "Огонь любви / Искры чувств / Потерянный контакт" = ОТСУТСТВУЕТ, ПО ЗАДУМКЕ РАЗРАБОТЧИКА

-- СЕЗОН BP23 / SPR26. Весна 2026 (все фазы). БП "Раскол альянсов" BP23_1(2) / SPR26_1(2). + ИП "Кровь Фронтира" BP23_3 / SPR26_3. Star Conflict 1.14.05 (SC-120380 + ... + ...) КОНЕЦ БЛОКА

----- SC-120459 Star Conflict 1.14.08. DLC. Корабль "Tau’kita" простой и элитный (для BP23 / SPR26). Весна 2026.
	{
        -- Tau’kita Простой
        name			= "TauKita",
        steam_url		= "https://store.steampowered.com/app/4417150",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15262",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15262",
        steam_appId		= 4417150,
        yuplay_guid_ru	= "560E710C-AC7E-4DC9-AFCE-AADD8D40580F",
        yuplay_guid		= "560E710C-AC7E-4DC9-AFCE-AADD8D40580F",
        hidden			= true,
    },	
	{
        -- Tau’kita Элитный - сейчас это именно "Элитный" ("полный фарш", по аналогии с DragThir_Deluxe) а нe традиционный "VIP" 
        name			= "TauKita_Deluxe",
        steam_url		= "https://store.steampowered.com/app/4417130",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15261",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15261",
        steam_appId		= 4417130,
        yuplay_guid_ru	= "64E81BA3-3041-4FC7-B33B-14CEB32ECD7A",
        yuplay_guid		= "64E81BA3-3041-4FC7-B33B-14CEB32ECD7A",
        hidden			= true,
    },		

----- SC-120480 Star Conflict 1.14.09. DLC Корабль "Chaos" простой и элитный (для EP23 / SPR26). Весна 2026.
	{
        -- Chaos Простой
        name			= "Chaos",
        steam_url		= "https://store.steampowered.com/app/4663860",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15436",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15436",
        steam_appId		= 4663860,
        yuplay_guid_ru	= "F9162EDD-0AA8-4FA7-A085-50C07305EB4B",
        yuplay_guid		= "F9162EDD-0AA8-4FA7-A085-50C07305EB4B",
        hidden			= true,
    },	
	{
        -- Chaos Элитный
        name			= "Chaos_Elite",
        steam_url		= "https://store.steampowered.com/app/4663850",
        yuplay_url_ru	= "https://store.gaijin.net/story.php?id=15437",
        yuplay_url		= "https://store.gaijin.net/story.php?id=15437",
        steam_appId		= 4663850,
        yuplay_guid_ru	= "7CE9A622-A996-49D4-A590-424910036FDA",
        yuplay_guid		= "7CE9A622-A996-49D4-A590-424910036FDA",
        hidden			= true,
    },			

}	
--таблица расположения звезд перенесена в zones.lua

PvpMapsLayout =
{
	10,
	10,
	10,
	10, 
	8,
}

PveMapsLayout =
{
	5,
	4,
	2,
}

ShipLootRank = {
    3,
	5,
	7,
    8,
    10,
    11,
    13,
	15,
}

quest_characters = 
{
	{ name	= "eventgirl", change_race = true, },
    { name	= "snowgirl",  change_race = true, },
	{ name	= "halloween", change_race = true, },
	{ name	= "broker", change_race = true, },
	{ name	= "ellidium_girl", change_race = true, },
	{ name	= "emp_captain", race = ai.Race.EMPIRE, change_race = true, }, -- Empire contracts
	{ name	= "federation_officer", race = ai.Race.FEDERATION, change_race = true, }, -- Federation contracts
	{ name	= "jericho_officer", race = ai.Race.JERICHO, change_race = true, }, -- Jericho contracts
	{ name	= "scientist", race = ai.Race.CRYSTAL, change_race = true, },
	{ name	= "general", change_race = true, },
	{ name	= "mercenary", change_race = true, },
	{ name	= "emp_major", race = ai.Race.CRYSTAL, change_race = true, },
	{ name	= "empire_leader", race = ai.Race.EMPIRE, change_race = true, },
	{ name	= "emp_engineer", race = ai.Race.EMPIRE, change_race = true, }, -- Empire OS quests
	{ name	= "nemoff", race = ai.Race.EMPIRE, change_race = true, }, -- Empire OS quests
	{ name	= "fed_major", race = ai.Race.FEDERATION, change_race = true, }, -- Federation OS quests
	{ name	= "fed_captain", race = ai.Race.FEDERATION, change_race = true, }, -- Federation OS quests
	{ name	= "fed_engineer", race = ai.Race.FEDERATION, change_race = true, },
	{ name	= "jer_major", race = ai.Race.JERICHO, change_race = true, },
	{ name	= "jer_captain", race = ai.Race.JERICHO, change_race = true, },
	{ name	= "jer_engineer", race = ai.Race.JERICHO, change_race = true, }, -- Jericho OS quests
	{ name	= "sch_jerico", race = ai.Race.JERICHO, change_race = true, }, -- Jericho OS quests
	{ name	= "general_soldier", change_race = true, },
	{ name	= "lamarr", change_race = true, },
	{ name	= "default", change_race = true, },
	{ name	= "cult_leader", change_race = true, },
	{ name	= "RoP2025", change_race = true, },

	--Дальше идёт список персонажей, которые должны использоваться исключительно в пве сценариях как сайд-таск-гиверы (у них отсутствует тело)
	{ name	= "pve_coordinator", change_race = true, },
	{ name	= "pve_briggs", change_race = true, },
	{ name	= "pve_lang", change_race = true, },
	{ name	= "sch_crystallid", change_race = true, },
	{ name	= "umc_dispatch", change_race = true, },
	{ name	= "pve_irodr", change_race = true, },
	{ name	= "sch_jackson", change_race = true, },
	
}



ship_roles =
{
    "ECM",
    "SCOUT",
    "RECON",
    "ATTACK",
    "COMMAND",
    "TACKLER",
    "SNIPER",
    "GUARD",
    "ENGINEER",
    "OVERSEER",
}

yuplay_dlc_link = "https://store.gaijin.net/storefront.php?category=StarConflict"
budget_bundle_link = "Bundle_Vessel_Equipment_Parts_T5"


SummerEvent2016 =
{
    "2016-06-02T03:00:00Z",
    "2016-06-20T00:00:00Z",
    "2016-07-11T00:00:00Z",
    "2016-07-25T00:00:00Z",
    "2016-08-08T00:00:00Z",
    "2016-10-10T00:00:00Z",
    "2016-10-24T01:00:00Z",
}



ShipProgressBarMaxValue =
{
    hull_health = {
        [ ai.ShipRoles.ECM ]		= 9000,
        [ ai.ShipRoles.SCOUT ]		= 9000,
        [ ai.ShipRoles.RECON ]		= 9000,
        [ ai.ShipRoles.ATTACK ]		= 16000,
        [ ai.ShipRoles.COMMAND ]	= 16000,
        [ ai.ShipRoles.TACKLER ]	= 16000,
        [ ai.ShipRoles.SNIPER ]		= 20000,
        [ ai.ShipRoles.GUARD ]		= 30000,
        [ ai.ShipRoles.ENGINEER ]	= 25000,
        [ ai.ShipRoles.OVERSEER ]	= 150000,
    },

    shield_max = {
        [ ai.ShipRoles.ECM ]		= 9000,
        [ ai.ShipRoles.SCOUT ]		= 9000,
        [ ai.ShipRoles.RECON ]		= 9000,
        [ ai.ShipRoles.ATTACK ]		= 16000,
        [ ai.ShipRoles.COMMAND ]	= 16000,
        [ ai.ShipRoles.TACKLER ]	= 16000,
        [ ai.ShipRoles.SNIPER ]		= 20000,
        [ ai.ShipRoles.GUARD ]		= 30000,
        [ ai.ShipRoles.ENGINEER ]	= 25000,
        [ ai.ShipRoles.OVERSEER ]	= 45000,
    },

    energy_max = {
        [ ai.ShipRoles.ECM ]		= 750,
        [ ai.ShipRoles.SCOUT ]		= 750,
        [ ai.ShipRoles.RECON ]		= 750,
        [ ai.ShipRoles.ATTACK ]		= 1500,
        [ ai.ShipRoles.COMMAND ]	= 1500,
        [ ai.ShipRoles.TACKLER ]	= 1500,
        [ ai.ShipRoles.SNIPER ]		= 3000,
        [ ai.ShipRoles.GUARD ]		= 3000,
        [ ai.ShipRoles.ENGINEER ]	= 3000,
        [ ai.ShipRoles.OVERSEER ]	= 6000,
    },

    max_speed = {
        [ ai.ShipRoles.ECM ]		= 425,
        [ ai.ShipRoles.SCOUT ]		= 425,
        [ ai.ShipRoles.RECON ]		= 425,
        [ ai.ShipRoles.ATTACK ]		= 350,
        [ ai.ShipRoles.COMMAND ]	= 350,
        [ ai.ShipRoles.TACKLER ]	= 350,
        [ ai.ShipRoles.SNIPER ]		= 325,
        [ ai.ShipRoles.GUARD ]		= 325,
        [ ai.ShipRoles.ENGINEER ]	= 325,
        [ ai.ShipRoles.OVERSEER ]	= 200,
    },
}

ShipRoleToClass = {
    [ ai.ShipRoles.ECM ]		= ai.ShipClass.SMALL,
    [ ai.ShipRoles.SCOUT ]		= ai.ShipClass.SMALL,
    [ ai.ShipRoles.RECON ]		= ai.ShipClass.SMALL,
    [ ai.ShipRoles.ATTACK ]		= ai.ShipClass.MEDIUM,
    [ ai.ShipRoles.COMMAND ]	= ai.ShipClass.MEDIUM,
    [ ai.ShipRoles.TACKLER ]	= ai.ShipClass.MEDIUM,
    [ ai.ShipRoles.SNIPER ]		= ai.ShipClass.LARGE,
    [ ai.ShipRoles.GUARD ]		= ai.ShipClass.LARGE,
    [ ai.ShipRoles.ENGINEER ]	= ai.ShipClass.LARGE,
    [ ai.ShipRoles.OVERSEER ]	= ai.ShipClass.HUGE,
}

GameMsgData = {}

GameMsgData[ ai.UiGameWowMsgName.LOCATION_STRING_ID ] = { priority = 1, }
GameMsgData[ ai.UiGameWowMsgName.SPELL_DEF_WARNING ] = { priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CLAN_SHIP_TICKET ] = { priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.DOCK_TO_STATION ] = { name = "Interaction_DockToStation", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_TO_ZONE_CIVILIAN ] = { name = "Interaction_JumpToZoneCivilian", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_TO_ZONE_DANGEROUS ] = { name = "Interaction_JumpToZoneDangerous", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.NOT_BOUND ] = { name = "Interaction_NotBound", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.CARGO_SHIP ] = { name = "Interaction_CargoShip", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_EXPLOSION_ALLY ] = { name = "ClanShipBombExplosion_Ally", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_EXPLOSION_ENEMY ] = { name = "ClanShipBombExplosion_Enemy", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_LOST_ALLY ] = { name = "ClanShipBombLost_Ally", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_TIME_ALLY ] = { name = "ClanShipBombTime_Ally", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_TIME_ENEMY ] = { name = "ClanShipBombTime_Enemy", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.TAKE_BOMB ] = { name = "Interaction_TakeBomb", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.DROP_BOMB ] = { name = "Interaction_DropBomb", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.LOOT_CRATE ] = { name = "Interaction_LootCrate", priority = 12, }
GameMsgData[ ai.UiGameWowMsgName.LOOT_MAILER ] = { name = "Interaction_LootMailer", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.QUEST_OBJECT ] = { name = "Interaction_QuestObject", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.ADVENTURE_OBJECT ] = { name = "Interaction_AdventureObject", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.ADVENTURE_GIVER ] = { name = "Interaction_AdventureGiver", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.QUEST_TRIGGER ] = { name = "Interaction_QuestTrigger", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.SHIP_WRECK ] = { name = "Interaction_ShipWreck", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BATTLEFIELD_LEAVE ] = { name = "FreeSpaceBattlefieldLeaveMsg", priority = 2, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_DOCK_AGGRESSOR ] = { name = "FreeSpaceJumpDockAggressor", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.DOCK_CRIMINAL ] = { name = "FreeSpaceDockCriminal", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_SHIP_RANK ] = { name = "FreeSpaceJumpShipRank", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_ACCOUNT_RANK ] = { name = "FreeSpaceJumpAccountRank", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_ZONE_BLOCK ] = { name = "FreeSpaceJumpZoneBlock", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_NOT_IN_CLAN ] = { name = "FreeSpaceJumpNotInClan", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_NO_CLAN_SHIP ] = { name = "FreeSpaceJumpNoClanShip", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.JUMP_WARP_DISABLED ] = { name = "FreeSpaceJumpWarpDisabled", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.RESURRECTION_BEACON ] = { name = "Interaction_ResurrectionBeacon", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.REANIMATION ] = { name = "Interaction_Reanimation", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.APPROACH_TO_BEACON ] = { name = "TutorialWowMsg_ApproachToBeacon", priority = 100, }
GameMsgData[ ai.UiGameWowMsgName.KILL_BEACON_DRONES ] = { name = "TutorialWowMsg_KillBeaconDrones", priority = 100, }
GameMsgData[ ai.UiGameWowMsgName.CAPTURE_BEACON ] = { name = "TutorialWowMsg_CaptureBeacon", priority = 100, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_SPAWN_TIME ] = { name = "ClanShipBombSpawn_Time", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.BOMB_SPAWN_NOW ] = { name = "ClanShipBombSpawn_Now", priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.AUTOMATIC_QUEST ] = { name = "FreeSpaceAutomaticQuest", priority = 15, }
GameMsgData[ ai.UiGameWowMsgName.INVASION_RETREAT ] = { name = "FreeSpaceInvasionRetreat", priority = 15, }
GameMsgData[ ai.UiGameWowMsgName.INVASION_START ] = { name = "FreeSpaceInvasionStart", priority = 15, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_INFLICTOR_PLAYER ] = { name = "FreeSpaceCivilianInflictorPlayer", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_VICTIM_PLAYER ] = { name = "FreeSpaceCivilianVictimPlayer", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_VICTIM_TARGET ] = { name = "FreeSpaceCivilianVictimTarget", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_SQUAD_ENABLED ] = { name = "FreeSpaceCivilianSquadEnabled", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_SQUAD_DISABLED ] = { name = "FreeSpaceCivilianSquadDisabled", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.DAMAGE_INCREASE_COEFFICIENT ] = { name = "DisintegratorIncreaseCoefficient", priority = 100, }
GameMsgData[ ai.UiGameWowMsgName.BATTLE_STATION_BUILDING ] = { name = "BattleStationUpgradeDesc", priority = 20, }
GameMsgData[ ai.UiGameWowMsgName.REMOTE_DISINTEGRATOR_READY ] = { name = "RemoteDisintegratorReady", priority = 20, }
GameMsgData[ ai.UiGameWowMsgName.FOOTBALL_COUNTDOWN ] = { priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.FOOTBALL_PLAYER_SCORED_GOAL ] = { priority = 5, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_ZONE_ENABLED ] = { name = "FreeSpaceCivilianZoneEnabled", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.CIVILIAN_ZONE_DISABLED ] = { name = "FreeSpaceCivilianZoneDisabled", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.LAND_ON_SHIP ] = { name = "Interaction_LandOnShip", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.TAKE_OFF_FROM_SHIP ] = { name = "Interaction_TakeOffFromShip", priority = 10, }
GameMsgData[ ai.UiGameWowMsgName.SPELL_CRATE ] = { name = "Interaction_SpellCrate", priority = 12, }
GameMsgData[ ai.UiGameWowMsgName.INTERACTIVE_OBJECT ] = { name = "Interaction_InteractiveObject", priority = 12, }
GameMsgData[ ai.UiGameWowMsgName.FACTORY_MODULE ] = { name = "Interaction_FactoryModule", priority = 12, }


SquadSearchAct =
{
    Other = 1,
    PVP = 2,
    PVE = 3,
    Conquest = 4,
    Tournament = 5,
    Raid = 6,
    Space = 7,
}

InfluenceTypeColor =
{
    REPAIR_HULL = 0xff29661e,
    REPAIR_SHIELD = 0xff1c5e66,
    BUFF_ABILITY = 0xff333333,
    BUFF_STAT = 0xff333333,
    BUFF_DAMAGE = 0xffa14c0f,  -- оранж
    BUFF_RESIST_HULL = 0xff29661e,
    BUFF_RESIST_SHIELD = 0xff1c5e66,
    DEBUFF_STAT = 0xff413056,   --фиолет
    DEBUFF_ABILITY = 0xff333333,
    DEBUFF_DAMAGE = 0xff413056,
    DEBUFF_RESIST_HULL = 0xff413056,
    DEBUFF_RESIST_SHIELD = 0xff413056,
    DAMAGE_TERMAL = 0xff711a11,
    DAMAGE_KINETIC = 0xff938108,
    DAMAGE_PLASMA = 0xff16387c,
}

AuraTypeColor = {
	{ aura = ai.Aura.ANTI_RADAR, 					isBuff = false, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.SPELL_ON_MODULE_ACTIVATION, 	isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.HEAL_HULL_PERCENT_PERIODIC, 	isBuff = true, color = InfluenceTypeColor.REPAIR_HULL },
	{ aura = ai.Aura.VISION_RADIUS_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.VISION_RADIUS_MOD, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.HEAL_HULL_SCALED_PERIODIC, 	isBuff = true, color = InfluenceTypeColor.REPAIR_HULL },
	{ aura = ai.Aura.FORCE_BOOST, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.REDUCE_COOLING, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DAMAGE_THERMAL_PERIODIC, 		isBuff = false, color = InfluenceTypeColor.DAMAGE_TERMAL },
	{ aura = ai.Aura.DAMAGE_THERMAL_PERIODIC_REDUCE_HEAL, isBuff = false, color = InfluenceTypeColor.DAMAGE_TERMAL },
	{ aura = ai.Aura.BURN_ENERGY_PERIODIC, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DAMAGE_REFLECT, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.SPY_DRONE, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.OVERCHARGE, 					isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.FORTIFICATION,					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.FORTIFICATION,					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.CRIT_CHANCE, 					isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.STEALTH, 						isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.SNIPER_PROJECTILE_SPELL, 		isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.COLLISION_IMMUNE, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.DEBUFF_IMMUNE, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.MODULE_RANGE_MOD, 				isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.MODULE_RANGE_MOD, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.RESIST_ALL, 					isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.SLOW_MANEUVER, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.CONTROL_IMMUNE_DEFERRED, 		isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.REDUCE_ENERGY_REGEN, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.CHARGE_SPELL, 					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.UNTOUCHABLE, 					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.EMERGENCY_SPELL, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.HULL_BURN_PERIODIC, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.SPY_DRONE_REDUCE_HEAL, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.EMERGENCY_BARRIER, 			isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.ADDITIONAL_DAMAGE_THERMAL_SCALED, isBuff = false, color = InfluenceTypeColor.DAMAGE_TERMAL },
	{ aura = ai.Aura.HULL_RESIST_KINETIC_DEC, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_RESIST_HULL },
	{ aura = ai.Aura.DAMAGE_DEC, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.DISABLED_WEAPON, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.HACKED_WEAPON, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	-- { aura = ai.Aura.SNIPER_DEFENCE_IMMUNE, 		isBuff = false, color = InfluenceTypeColor.BUFF },
	{ aura = ai.Aura.ENERGY_SHIELD, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.ENERGY_VAMPIRE_PERIODIC, 		isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.ENERGY_VAMPIRE_PERIODIC, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.ADD_ENERGY_PERIODIC, 			isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.REDUCE_MAX_SPEED, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.PERSONAL_WEAKNESS, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	-- { aura = ai.Aura.CONFUSION, 					isBuff = false, color = InfluenceTypeColor.BUFF },
	{ aura = ai.Aura.CHARGE, 						isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.PRIMARY_WEAPON_RANGE_MOD, 		isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.RESIST_ALL_DEC, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.STASIS, 						isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.PROJECTILE_SPEED_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.DAMAGE_TO_HEAL,				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.HULL_RESIST_EMP_DEC, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_RESIST_HULL },
	-- { aura = ai.Aura.WEAPON_AUTO_AIM, 				isBuff = false, color = InfluenceTypeColor.BUFF },
	{ aura = ai.Aura.FORCE_TARGET_LOCK, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.MODULE_DAMAGE_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.MODULE_DAMAGE_MOD, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.SHIELD_RESIST_KINETIC, 		isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_SHIELD },
	{ aura = ai.Aura.HEAL_ON_HIT_SCALED, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.DISABLE_LOCK, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.HEAL_SHIELD_SCALED_PERIODIC, 	isBuff = true, color = InfluenceTypeColor.REPAIR_SHIELD },
	{ aura = ai.Aura.ENGINE_MOD, 					isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.ENGINE_MOD, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.CAPTURE_SPEED_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.STUN, 							isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.HEALING_MOD, 					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.HEALING_MOD, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.FAST_MANEUVER, 				isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.SHIELD_REGEN_MOD, 				isBuff = true, color = InfluenceTypeColor.REPAIR_SHIELD },
	-- { aura = ai.Aura.CAST_SPELL_IN_THE_END, 		isBuff = false, color = InfluenceTypeColor.BUFF },
	{ aura = ai.Aura.DISABLE_HEAT, 					isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	-- { aura = ai.Aura.CAST_SPELL_PERIODIC, 			isBuff = false, color = InfluenceTypeColor.BUFF },
	{ aura = ai.Aura.BROKEN_WEAPON, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.SNIPER_SPEED, 					isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.EMP_ABSORB_TO_SHIELD, 			isBuff = true, color = InfluenceTypeColor.REPAIR_SHIELD },
	{ aura = ai.Aura.SHIELD_RESIST_THERMAL, 		isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_SHIELD },
	{ aura = ai.Aura.SPELL_ON_DEATH_SOMEONE, 		isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE, 	isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.SHIELD_LINK, 					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.DAMAGE_EMP_SCALED, 			isBuff = false, color = InfluenceTypeColor.DAMAGE_PLASMA },
	{ aura = ai.Aura.FAST_MOVEMENT, 				isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.SHIP_ATTRACTION, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.SHIP_ATTRACTION, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.DISABLE_MODULES, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, isBuff = false, color = InfluenceTypeColor.DAMAGE_KINETIC },
	{ aura = ai.Aura.HULL_RESIST_KINETIC, 			isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_HULL },
	{ aura = ai.Aura.SHIELD_BURN_PERIODIC, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.INVULNERABILITY, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.HEAT_MUL, 						isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.HEAT_MUL, 						isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.SHIELD_RESIST_EMP, 			isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_SHIELD },
	{ aura = ai.Aura.HULL_RESIST_ALL_DEC, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_RESIST_HULL },
	{ aura = ai.Aura.DISABLE_ENERGY_REGEN, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DAMAGE_MOD, 					isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.DAMAGE_MOD, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.WEAPON_HIT_TRANSMIT_SPELL, 	isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.HULL_RESIST_EMP, 				isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_HULL },
	{ aura = ai.Aura.SHIELD_VAMPIRE_PERIODIC, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.HEAL_HULL_PERIODIC, 			isBuff = true, color = InfluenceTypeColor.REPAIR_HULL },
	{ aura = ai.Aura.HEALTH_MOD, 					isBuff = true, color = InfluenceTypeColor.REPAIR_HULL },
	{ aura = ai.Aura.HEAL_SHIELD_PERIODIC, 			isBuff = true, color = InfluenceTypeColor.REPAIR_SHIELD },
	{ aura = ai.Aura.REDUCE_ROT_SPEED, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DAMAGE_KINETIC_SCALED, 		isBuff = false, color = InfluenceTypeColor.DAMAGE_KINETIC },
	{ aura = ai.Aura.SLOW_MOVEMENT, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DISABLE_WARP, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.ENERGY_BURN_IMMUNE, 			isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.DAMAGE_THERMAL_SCALED, 		isBuff = false, color = InfluenceTypeColor.DAMAGE_TERMAL },
	{ aura = ai.Aura.DAMAGE_EMP_PERIODIC, 			isBuff = false, color = InfluenceTypeColor.DAMAGE_PLASMA },
	{ aura = ai.Aura.SHIELD_RESIST_ALL, 			isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_SHIELD },
	{ aura = ai.Aura.HULL_RESIST_ALL, 				isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_HULL },
	{ aura = ai.Aura.SECONDARY_DAMAGE_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.SECONDARY_DAMAGE_MOD, 			isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.SNIPER_OVERLOAD, 				isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.DIRECTION_DEPEND_FAST_MOVEMENT, isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.ENERGY_HARVESTER, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.FIRE_RATE_MOD, 				isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
	{ aura = ai.Aura.FIRE_RATE_MOD, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_DAMAGE },
	{ aura = ai.Aura.COOLDOWN_MOD, 					isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.COOLDOWN_MOD, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.DEATH_ROCKET, 					isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.DAMAGE_KINETIC_PERIODIC, 		isBuff = false, color = InfluenceTypeColor.DAMAGE_KINETIC },
	{ aura = ai.Aura.HULL_RESIST_THERMAL_DEC, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_RESIST_HULL },
	{ aura = ai.Aura.HULL_RESIST_THERMAL, 			isBuff = true, color = InfluenceTypeColor.BUFF_RESIST_HULL },
	{ aura = ai.Aura.DISABLE_BOOST, 				isBuff = false, color = InfluenceTypeColor.DEBUFF_ABILITY },
	{ aura = ai.Aura.SILENCE, 						isBuff = false, color = InfluenceTypeColor.DEBUFF_STAT },
	{ aura = ai.Aura.HULL_TRANSFER, 				isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.SHIELD_RESIST_ALL_DEC, 		isBuff = false, color = InfluenceTypeColor.DEBUFF_RESIST_SHIELD },
	{ aura = ai.Aura.SLOW_IMMUNE, 					isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.CAMO_MOD, 						isBuff = true, color = InfluenceTypeColor.BUFF_ABILITY },
	{ aura = ai.Aura.REDUCE_MIN_SPEED,				isBuff = true, color = InfluenceTypeColor.BUFF_STAT },
	{ aura = ai.Aura.DAMAGE_ONE_SHOT_MOD, 			isBuff = true, color = InfluenceTypeColor.BUFF_DAMAGE },
}

-- список премиум-лицензий, который показывается в окне лицензий
PremiumLicenses =
{	
	{
		licenseName	= "DailyLicenseCard",	-- licenseName сейчас используется для получения иконки, теоретически от него можно избавиться и использовать только dlcName
		dlcName		= "DailyLicenseCard",
	},
	
	{
		licenseName = "ThreeDayLicenseCard",
		dlcName		= "ThreeDayLicenseCard",
	},
	
	{
		licenseName = "WeeklyLicenseCard",
		dlcName		= "WeeklyLicenseCard",
	},
	
	{
		licenseName = "MonthlyLicenseCard",
		dlcName		= "MonthlyLicenseCard",
	},
	
	{
		licenseName = "HalfAnnualLicenseCard",
		dlcName		= "HalfAnnualLicenseCard",
	},
	
	{
		licenseName = "AnnualLicenseCard",
		dlcName		= "AnnualLicenseCard",
	},
}

PvpMapsArray = {
	"s1338_devilsjaw",
	"s1338_pandora_anomaly",
	"s1338_pandora_dreadnwreck",
	"s1340_thar_aliendebris13",
	"s1340_thar_gasgiant",
	"s1420_ceres3_asteroidcity",
	"s1420_ceres3_northmsite",
	"s8256_thar_barrierdebris",
	"s8256_thar_lavastone",
	"s8256_thar_threshold",
	"s1347_livestation",
	"s8256_thar_concourse",
	"s8256_thar_ancientcomplex",
	"da_prototype",
	"s1340_thar_alienruins",
	"desttown",
	"sirus_debrissite",
	"lumen_constructionsite",
	"alnifan_gate_carib",
	"da_deathstar",
	"planet_war_7",
	"pvp_omega",
	"pvp_transstance",
	"allidium_yard",
}

BfsSectorColor =
{
	[ ai.Race.EMPIRE ]		= 0xffbbbb00,	-- желтый
	[ ai.Race.FEDERATION ]	= 0xff4aadff,	-- синий
	[ ai.Race.JERICHO ]		= 0xff83211d,	-- красный
	[ ai.Race.CRYSTAL ]		= 0xff44bb00,	-- зелёный
	[ ai.Race.SPECIAL ]		= 0xffbbbbbb,	-- серый
}
