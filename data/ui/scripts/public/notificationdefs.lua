-- ----------------------------------------------------------------------------
--
-- Workfile: notifications.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- Список нотификаций, которые отображаются в ui.-- 
-- Если название нотификации совпадает с одним из энума _G.MasterServer.ServerNotification, значит это сервеная нотификация (через коллбэек UI:MasterServer_OnNotification()),
-- в противном случае - это чисто ui-шная нотификация
-- -----------------------------------------------------------------------------------------------------------------------

UI.Notifications.types =
{
	-- нотификации-прямые аналоги _G.MasterServer.ServerNotification, только со своим id

	SN_VESSELS_AUTO_REPAIRED			= 1, 
	SN_VESSELS_AUTO_REPAIR_FAILED		= 2, 
	SN_VESSEL_REPAIRED					= 3, 
	SN_VESSELS_AUTO_REFILLED			= 4, 
	SN_VESSELS_AUTO_REFILL_FAILED		= 5, 
	SN_VESSEL_REFILLED					= 6, 
	SN_ITEM_PURCHASED					= 7, 
	SN_CREDITS_PURCHASED				= 8, 
	SN_PREMIUM_TIME_PURCHASED			= 9, 
	SN_INVENTORY_EXT_PURCHASED			= 10,
	SN_ITEM_SOLD						= 11,
	SN_VESSEL_LEVELUP					= 12,
	SN_BATTLE_SLOT_AVAILABLE			= 13,
	SN_MODULE_EQUIPPED					= 14,
	SN_MODULE_UNEQUIPPED				= 15, 
	SN_MODULE_UNEQUIPPED_MULTI			= 16,
	SN_BATTLE_SLOT_VESSEL_INSTALLED		= 17,
	SN_BATTLE_SLOT_VESSEL_REMOVED		= 18,
	SN_GAME_REWARDED					= 19, 
	SN_YUP_PURCHASE						= 20, 
	SN_STRIPPED_UNAVAILABLE_ITEMS		= 21, 
	SN_MAINTENANCE_COUNTDOWN			= 22, 
	SN_STEAM_PURCHASE					= 23, 
	SN_VESSEL_CUSTOM_ELEMENTS_CHANGED	= 24,
	SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED	= 25,
	SN_WELCOME_MSG						= 26, 
	SN_ITEM_ADVERT						= 27, 
	SN_GOLD_POOL_ADVERT					= 28,
	SN_NEW_LETTER						= 29,
	SN_STEAM_GROUP_PROMO				= 30,
	SN_TITLE_ACQUIRED					= 31,
	SN_STEAM_PRIVATE_PROFILE			= 32,
	SN_PRESTIGE_CHANGED					= 33,
	SN_MOTD								= 34,
	SN_MUNITION_EQUIPPED				= 35,
	SN_MUNITION_UNEQUIPPED				= 36,
	SN_CRAFT_RESULT						= 37,
	SN_ARC_PURCHASE						= 38,
	SN_ITEM_SALVAGED					= 39,
	SN_ACHIEVEMENT_UNLOCKED				= 40,
	SN_GAME_REWARDED_PREMIUM			= 41,
	SN_FB_GROUP_REWARD_PROMO			= 42,
	SN_VK_GROUP_REWARD_PROMO			= 43,
	SN_SHIP_QUEST_STARTED				= 44,
	SN_TOURNAMENT_REWARDS				= 45,
	SN_BONUS_BUNDLE						= 46,
	SN_ZONE_OWNER_CHANGED				= 47,
	SN_CLANSHIP_BUILDING_FINISHED		= 48,
	SN_QUEST_ACCEPTED					= 49,
	SN_QUEST_COMPLETED					= 50,
	SN_MASSIVE_SALE						= 51,
	SN_MASSIVE_RESOURCE_SALE			= 52,
	SN_LETTER_PAYMENT					= 53,
	SN_LETTER_REJECTED					= 54,
	SN_LETTER_EXPIRED					= 55,
	SN_LETTER_GOODS						= 56,
	SN_LETTER_ITEMS						= 57,
	SN_ITEM_BURNED						= 58,
	SN_UPGRADE_RESULT					= 59,
	SN_IMAGINARY_QUEST_REWARD			= 60,
	SN_AUTOGEN_DESTROYED				= 61,
	SN_AUTOGEN_DISMANTLED				= 62,
	SN_AUTOGEN_INVENTORY_EXT_PURCHASED	= 63,
	SN_DLC_PURCHASED					= 64,
	SN_ADVENTURE_FINAL					= 65,
	
	-- нотификации, которым нет прямого аналога в _G.MasterServer.ServerNotification

	SQUAD_REMOTE_PLAYER_JOINED			= 1000,
	SQUAD_REMOTE_PLAYER_LEFT			= 1001,
	SQUAD_LOCAL_PLAYER_JOINED			= 1002,
	SQUAD_LOCAL_PLAYER_LEFT				= 1003,
	SQUAD_LOCAL_PLAYER_KICKED			= 1004,
	SQUAD_REMOTE_PLAYER_KICKED      	= 1005,
	SQUAD_AUTOWIN						= 1006,
	SOCIAL_ADD_FRIEND					= 1007,
	SOCIAL_DELETE_FRIEND				= 1008,
	RACE_RANK							= 1009,
	CLAN_UNIVERSE_BATTLE_REWARD 		= 1010,
	VESSEL_CUSTOM_ELEMENTS_NEW_FREE		= 1011,
	TEACH_ADD_TEACHER					= 1012,
	TEACH_ADD_STUDENT					= 1013,
	TEACH_DELETE_TEACHER				= 1014,
	TEACH_DELETE_STUDENT				= 1015,
	TEACH_BACAME_TEACHER				= 1016,
	TEACH_NO_LONGER_STUDENT				= 1017,
	TEACH_STUDENT_GROWS_UP				= 1018,
	TEACH_EXP_REWARD					= 1019,
	TALENT_BUY_SET						= 1020,
	SHIP_QUEST_COMPLETED				= 1021,
	SHIP_QUEST_ABORTED					= 1022,
	BUNDLE_GOT							= 1023,
	ARENA_LOCAL_PLAYER_JOINED			= 1024,
	ARENA_REMOTE_PLAYER_JOINED			= 1025,
	ARENA_LOCAL_PLAYER_LEFT				= 1026,
	ARENA_REMOTE_PLAYER_LEFT			= 1027,
	ARENA_LOCAL_PLAYER_KICKED			= 1028,
	ARENA_REMOTE_PLAYER_KICKED      	= 1029,
	ARENA_TEAM_DISBAND					= 1030,
	MOTD_IMPORTANT						= 1031,
	ITEM_CONVERTED						= 1032,
	UNLIM_PVE_MISSION_LEVEL_UP			= 1033,
}

-- -----------------------------------------------------------------------------------------------------------------------
-- Группы нотификаций.
-- На одну группу может приходится несколько нотификаций. В опциях показваются имеено группы, а не отдельные нотификации.

-- ВНИМАНИЕ! Не менять id уже существующих групп при добавлении/удалении.
-- Это сломает запомненные настройки нотификаций в профиле (они туда записваются по id)
-- -----------------------------------------------------------------------------------------------------------------------

UI.Notifications.groups =
{
	WELCOME						= 1, 
	REPAIR						= 2, 
	REFILL						= 3, 
	TRADE						= 4, 
	VESSEL_LEVELUP				= 9, 
	BATTLE_SLOT_AVAILABLE		= 10,
	MODULE_CHANGED				= 11,
	BATTLE_SLOT_VESSEL_CHANGED	= 12,
	GAME_REWARDED				= 13,
	RANK						= 14,
	STRIPPED_UNAVAILABLE_ITEMS	= 15,
	MAINTENANCE_COUNTDOWN		= 16,
	SQUAD						= 18,
	SOCIAL_FRIENDS_CHANGED		= 19,
	CUSTOMIZATION				= 20,
	ADVERT						= 21,
	MAIL						= 22,
	TITLE						= 23,
	OBLIGATORY					= 24,
	FORBIDDEN					= 25,
	PRESTIGE					= 26,
	CLAN 						= 27,
	TEACH						= 28,
	ACHIEVEMENT					= 29,
	TALENTS						= 30,
	BFS							= 31,
	ARENA						= 32,
	QUESTS						= 33,
}
	
-- -----------------------------------------------------------------------------------------------------------------------
-- Свойства групп.
-- bShowInOptions - показывать или нет в опциях;
-- bAllowedDefault - включен показ нотификаций данной группы по умолчанию или нет.
-- -----------------------------------------------------------------------------------------------------------------------

UI.Notifications.groupsInfo =
{
	[ UI.Notifications.groups.REPAIR ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.REFILL ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.TRADE ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.VESSEL_LEVELUP ]				= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.BATTLE_SLOT_AVAILABLE ]		= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.MODULE_CHANGED ]				= { bAllowedDefault = false,	bShowInOptions = true },
	[ UI.Notifications.groups.BATTLE_SLOT_VESSEL_CHANGED ]	= { bAllowedDefault = false,	bShowInOptions = true },
	[ UI.Notifications.groups.GAME_REWARDED ]				= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.RANK ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.STRIPPED_UNAVAILABLE_ITEMS ]	= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.WELCOME ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.SQUAD ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.SOCIAL_FRIENDS_CHANGED ]		= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.CUSTOMIZATION ]				= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.ADVERT ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.MAIL ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.TITLE ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.PRESTIGE ]					= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.CLAN ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.TEACH ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.ACHIEVEMENT ]					= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.TALENTS ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.BFS ]							= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.ARENA ]						= { bAllowedDefault = true,		bShowInOptions = true },
	[ UI.Notifications.groups.QUESTS ]						= { bAllowedDefault = true,		bShowInOptions = true },

	-- специальные группы
	[ UI.Notifications.groups.OBLIGATORY ]					= { bAllowedDefault = true,		bShowInOptions = false },	-- показывается всегда, через опции не регулируется
	[ UI.Notifications.groups.FORBIDDEN ]					= { bAllowedDefault = false,	bShowInOptions = false },	-- не показывается никогда, через опции не регулируется
}

-- -----------------------------------------------------------------------------------------------------------------------
-- Разные параметры для отображения
-- -----------------------------------------------------------------------------------------------------------------------

-- цвет подложки
UI.Notifications.severities =
{
	WHITE		= 1,
	RED			= 2,
	ORANGE		= 3,
	BLUE		= 4,
	BLACK		= 5,
	GREEN		= 6,
}

-- цвет текста
UI.Notifications.textColors =
{
	WHITE	= 1,
	RED		= 2,
	YELLOW	= 3,
}

-- тип подложки - простая или картинка
UI.Notifications.modes =
{
	CLASSIC	= 1,
	BANNER	= 2,
}

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- Свойства нотификаций.
-- Если какой-то параметр для нотификации не прописан, значит он либо дефолтный,
-- либо он обрабатыввается вручную для данной нотификации (в UI.NotificationsSlotWnd).
-- ---------------------------------------------------------------------------------------------------------------------------------------

UI.Notifications.notificationsInfo =
{
	[ UI.Notifications.types.SN_VESSELS_AUTO_REPAIRED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLUE,
		ico			= "notice_repair",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.REPAIR,
	},

	[ UI.Notifications.types.SN_VESSELS_AUTO_REPAIR_FAILED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.RED,
		ico			= "notice_repair_fail",
		color		= UI.Notifications.textColors.RED,
		group		= UI.Notifications.groups.REPAIR,
	},

	[ UI.Notifications.types.SN_VESSEL_REPAIRED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLUE,
		ico			= "notice_repair",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.REPAIR,
	},

	[ UI.Notifications.types.SN_VESSELS_AUTO_REFILLED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLUE,
		ico			= "notice_reload",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.REFILL,
	},

	[ UI.Notifications.types.SN_VESSELS_AUTO_REFILL_FAILED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.RED,
		ico			= "notice_reload_fail",
		color		= UI.Notifications.textColors.RED,
		group		= UI.Notifications.groups.REFILL,
	},

	[ UI.Notifications.types.SN_VESSEL_REFILLED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLUE,
		ico			= "notice_reload",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.REFILL,
	},

	[ UI.Notifications.types.SN_ITEM_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_CREDITS_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_shop_gold",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_PREMIUM_TIME_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_shop_gold",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_INVENTORY_EXT_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},
	
	[ UI.Notifications.types.SN_AUTOGEN_INVENTORY_EXT_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_ITEM_SOLD ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_VESSEL_LEVELUP ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "synergy_up",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.VESSEL_LEVELUP,
	},

	[ UI.Notifications.types.SN_BATTLE_SLOT_AVAILABLE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_slot_buy",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.BATTLE_SLOT_AVAILABLE,
	},

	[ UI.Notifications.types.SN_MODULE_EQUIPPED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_module_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_MODULE_UNEQUIPPED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_module_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_MODULE_UNEQUIPPED_MULTI ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_module_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_MUNITION_EQUIPPED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_module_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_MUNITION_UNEQUIPPED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_module_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_BATTLE_SLOT_VESSEL_INSTALLED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_ship_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.BATTLE_SLOT_VESSEL_CHANGED,
	},

	[ UI.Notifications.types.SN_BATTLE_SLOT_VESSEL_REMOVED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_ship_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.BATTLE_SLOT_VESSEL_CHANGED,
	},

	[ UI.Notifications.types.SN_GAME_REWARDED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLACK,
		ico			= "notice_battle",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.GAME_REWARDED,
	},

	[ UI.Notifications.types.SN_GAME_REWARDED_PREMIUM ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLACK,
		ico			= "notice_battle",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.GAME_REWARDED,
	},

	[ UI.Notifications.types.RACE_RANK ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.FORBIDDEN,
	},

	[ UI.Notifications.types.SN_YUP_PURCHASE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_shop_gold",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_DLC_PURCHASED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_SN_DLC_PURCHASED",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_STRIPPED_UNAVAILABLE_ITEMS ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.RED,
		ico			= "notice_warning",
		color		= UI.Notifications.textColors.RED,
		group		= UI.Notifications.groups.STRIPPED_UNAVAILABLE_ITEMS,
	},	

	[ UI.Notifications.types.SN_MAINTENANCE_COUNTDOWN ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.RED,
		ico			= "notice_warning",
		color		= UI.Notifications.textColors.RED,
		group		= UI.Notifications.groups.OBLIGATORY,
	},	

	[ UI.Notifications.types.SN_WELCOME_MSG ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_launch",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.WELCOME,
	},

	[ UI.Notifications.types.SN_MOTD ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_launch",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.WELCOME,
	},

	[ UI.Notifications.types.MOTD_IMPORTANT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_launch_important",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SQUAD_REMOTE_PLAYER_JOINED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SQUAD_REMOTE_PLAYER_LEFT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SQUAD_LOCAL_PLAYER_JOINED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SQUAD_LOCAL_PLAYER_LEFT ] =
	{
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SQUAD_LOCAL_PLAYER_KICKED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SQUAD_REMOTE_PLAYER_KICKED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_squad_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SQUAD,
	},

	[ UI.Notifications.types.SOCIAL_ADD_FRIEND ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SOCIAL_FRIENDS_CHANGED,
	},

	[ UI.Notifications.types.SOCIAL_DELETE_FRIEND ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.SOCIAL_FRIENDS_CHANGED,
	},

	[ UI.Notifications.types.SN_STEAM_PURCHASE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_shop_gold",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_ARC_PURCHASE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_shop_gold",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_VESSEL_CUSTOM_ELEMENTS_CHANGED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.CUSTOMIZATION,
	},

	[ UI.Notifications.types.SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_token_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.CUSTOMIZATION,
	},

	[ UI.Notifications.types.VESSEL_CUSTOM_ELEMENTS_NEW_FREE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.CUSTOMIZATION,
	},

	[ UI.Notifications.types.SN_ITEM_ADVERT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_default",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ADVERT,
	},

	[ UI.Notifications.types.SN_GOLD_POOL_ADVERT ] =
	{
		mode		= UI.Notifications.modes.BANNER,
		texture		= "notice_goldAdvert",
		group		= UI.Notifications.groups.ADVERT,
	},

	[ UI.Notifications.types.SN_NEW_LETTER ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_mail",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MAIL,
	},

	[ UI.Notifications.types.SN_STEAM_GROUP_PROMO ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_SN_STEAM_GROUP_PROMO",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_FB_GROUP_REWARD_PROMO ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_SN_FB_GROUP_REWARD_PROMO",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_VK_GROUP_REWARD_PROMO ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_SN_VK_GROUP_REWARD_PROMO",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_TITLE_ACQUIRED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_title",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TITLE,
	},

	[ UI.Notifications.types.SN_STEAM_PRIVATE_PROFILE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_SN_STEAM_PRIVATE_PROFILE",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_PRESTIGE_CHANGED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_SN_PRESTIGE_CHANGED",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.PRESTIGE,
	},

	[ UI.Notifications.types.CLAN_UNIVERSE_BATTLE_REWARD ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_clan",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.CLAN,
	},

	[ UI.Notifications.types.TEACH_ADD_TEACHER ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_ADD_STUDENT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_DELETE_TEACHER ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_DELETE_STUDENT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_friend_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_BACAME_TEACHER ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_teach_became_teacher",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_NO_LONGER_STUDENT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_teach_no_longer_student",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_STUDENT_GROWS_UP ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_teach_student_grows_up",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.TEACH_EXP_REWARD ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_teach_exp_reward",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TEACH,
	},

	[ UI.Notifications.types.SN_CRAFT_RESULT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_ITEM_SALVAGED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_salvage",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_ACHIEVEMENT_UNLOCKED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ACHIEVEMENT,
	},

	[ UI.Notifications.types.TALENT_BUY_SET ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TALENTS,
	},

	[ UI.Notifications.types.SN_SHIP_QUEST_STARTED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},

	[ UI.Notifications.types.SHIP_QUEST_COMPLETED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
		text		= "ntf_SHIP_QUEST_COMPLETED_WIN"
	},

	[ UI.Notifications.types.SHIP_QUEST_ABORTED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},

	[ UI.Notifications.types.SQUAD_AUTOWIN ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLACK,
		ico			= "notice_autowin",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.GAME_REWARDED,
	},

	[ UI.Notifications.types.SN_TOURNAMENT_REWARDS ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.BLACK,
		ico			= "notice_tourReward",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.BUNDLE_GOT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_bundleGot",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_BONUS_BUNDLE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_bundleGot",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
		text		= "ntf_BUNDLE_GOT"
	},

	[ UI.Notifications.types.SN_ZONE_OWNER_CHANGED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_zoneOwnerChanged",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.BFS,
	},

	[ UI.Notifications.types.SN_CLANSHIP_BUILDING_FINISHED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_clanShipFinished",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.BFS,
	},

	[ UI.Notifications.types.ARENA_LOCAL_PLAYER_JOINED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_REMOTE_PLAYER_JOINED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_add",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_LOCAL_PLAYER_LEFT ] =
	{
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_REMOTE_PLAYER_LEFT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_LOCAL_PLAYER_KICKED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_REMOTE_PLAYER_KICKED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.ARENA_TEAM_DISBAND ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_arena_delete",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.ARENA,
	},

	[ UI.Notifications.types.SN_QUEST_ACCEPTED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},

	[ UI.Notifications.types.SN_QUEST_COMPLETED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},

	[ UI.Notifications.types.SN_MASSIVE_SALE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_MASSIVE_RESOURCE_SALE ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "note_shop_silver",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},

	[ UI.Notifications.types.SN_LETTER_PAYMENT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_letterPayment",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_LETTER_REJECTED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_letterRejected",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_LETTER_EXPIRED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_letterExpired",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_LETTER_GOODS ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.ORANGE,
		ico			= "notice_letterGoods",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_LETTER_ITEMS ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_letterItems",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_ITEM_BURNED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.RED,
		ico			= "notice_itemBurned",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},

	[ UI.Notifications.types.SN_UPGRADE_RESULT ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.TRADE,
	},
	
	[ UI.Notifications.types.ITEM_CONVERTED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_itemConverted",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},
	
	[ UI.Notifications.types.UNLIM_PVE_MISSION_LEVEL_UP ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_unlimPveMissionLevelUp",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.OBLIGATORY,
	},
	
	[ UI.Notifications.types.SN_IMAGINARY_QUEST_REWARD ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_IMAGINARY_QUEST_REWARD",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},
	
	[ UI.Notifications.types.SN_AUTOGEN_DESTROYED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_autogen_destroyed",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},
	
	[ UI.Notifications.types.SN_AUTOGEN_DISMANTLED ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_autogen_dismantled",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.MODULE_CHANGED,
	},

	[ UI.Notifications.types.SN_ADVENTURE_FINAL ] =
	{
		mode		= UI.Notifications.modes.CLASSIC,
		severity	= UI.Notifications.severities.WHITE,
		ico			= "notice_shipQuest",
		color		= UI.Notifications.textColors.WHITE,
		group		= UI.Notifications.groups.QUESTS,
	},
}