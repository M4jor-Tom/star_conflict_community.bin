-- ----------------------------------------------------------------------------
--
-- Workfile: UiGameDefs.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- Basic UI definitions
--
-- ----------------------------------------------------------------------------
--  $Id: uigamedefs.lua 3128 2011-05-27 13:19:30Z $
-- ----------------------------------------------------------------------------

-- #0083817 - хак - надо убрать это из UI
UI.INACTIVITY_LOGOUT_TIME	= 90*60		-- [сек] если в течение этого времени в ангаре нет инпута от игрока, то производится принудительный разлогин
 	
-- игровые события
UI.EV_KEY_TIP						= UI.EV_USER + 0
UI.EV_GAME_START					= UI.EV_USER + 1
UI.EV_EXIT_UI_FULL_SCREEN			= UI.EV_USER + 2 
UI.EV_OPTIONS_CHANGED				= UI.EV_USER + 3 
UI.EV_SET_RESOLUTION				= UI.EV_USER + 4 
UI.EV_LIST_SELECT_RECORD			= UI.EV_USER + 5 
UI.EV_LIST_ACTIVATE_RECORD			= UI.EV_USER + 6 
UI.EV_LIST_START_SCROLL				= UI.EV_USER + 7 
UI.EV_LIST_STOP_SCROLL				= UI.EV_USER + 8 
UI.EV_SERVER_REPLY					= UI.EV_USER + 9 
UI.EV_TIMER							= UI.EV_USER + 10
UI.EV_TIMER_ACTIVE					= UI.EV_USER + 11                                                   
UI.EV_COMBO_SELECT_RECORD			= UI.EV_USER + 12
UI.EV_SLIDER_CHANGED				= UI.EV_USER + 13
UI.EV_INV_ITEMS_CHANGED				= UI.EV_USER + 14
UI.EV_START_WAITING_REQUESTS		= UI.EV_USER + 15
UI.EV_STOP_WAITING_REQUESTS			= UI.EV_USER + 16
UI.EV_VISIBLE_RANGE_CHANGED			= UI.EV_USER + 17
UI.EV_RELOAD_RESOURCES				= UI.EV_USER + 18
UI.EV_HUD_MODE_CHANGED				= UI.EV_USER + 19
UI.EV_HANGAR_TAB_CHANGED			= UI.EV_USER + 20
UI.EV_NOTIFICATIONS_ADD				= UI.EV_USER + 21
UI.EV_NOTIFICATIONS_ADD_TOTAL		= UI.EV_USER + 22
UI.EV_NOTIFICATIONS_CLEAR			= UI.EV_USER + 23
UI.EV_NOTIFICATIONS_ALLOWED_CHANGED	= UI.EV_USER + 24
UI.EV_CHAT_CLEAR					= UI.EV_USER + 25
UI.EV_CHAT_MSG						= UI.EV_USER + 26
UI.EV_MASTER_SERVER_DISCONNECTED_SYNC= UI.EV_USER + 27
UI.EV_TUTORIAL_START				= UI.EV_USER + 28
UI.EV_TUTORIAL_STOP					= UI.EV_USER + 29
UI.EV_OCULUS_ENABLE					= UI.EV_USER + 30
UI.EV_ARENA_CHANGED					= UI.EV_USER + 31
UI.EV_ARENA_STATS_CHANGED			= UI.EV_USER + 32
UI.EV_ARENA_MAJOR_CHANGED			= UI.EV_USER + 33
UI.EV_GOLD_REWARD_STATE_CHANGED		= UI.EV_USER + 34
UI.EV_HUD_CARGO_MODE_CHANGED		= UI.EV_USER + 35

UI.EV_GAME_ENGINE_EVENT_START		= UI.EV_USER + 36

UI.EV_START_LEVEL					= UI.engineEvents.EVENT_START_LEVEL					- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_END_LEVEL						= UI.engineEvents.EVENT_END_LEVEL					- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_OBJECTS_CLEARED				= UI.engineEvents.EVENT_OBJECTS_CLEARED				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_LOADING_SCREEN				= UI.engineEvents.EVENT_LOADING_SCREEN				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PRECACHE_UI_LEVEL_DATA		= UI.engineEvents.EVENT_PRECACHE_UI_LEVEL_DATA		- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PLAYER_CONNECTED				= UI.engineEvents.EVENT_PLAYER_CONNECTED			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PLAYER_DISCONNECTED			= UI.engineEvents.EVENT_PLAYER_DISCONNECTED			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PLAYER_READY					= UI.engineEvents.EVENT_PLAYER_READY				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_GAME_SETTING_CHANGED			= UI.engineEvents.EVENT_GAME_SETTING_CHANGED		- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PROFILE_CHANGED				= UI.engineEvents.EVENT_PROFILE_CHANGED				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_SAVING						= UI.engineEvents.EVENT_SAVING						- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_LIVE_SERVICES_RESULT			= UI.engineEvents.EVENT_LIVE_SERVICES_RESULT		- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PROFILE_LOADED				= UI.engineEvents.EVENT_PROFILE_LOADED				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PROFILE_START_SAVING			= UI.engineEvents.EVENT_PROFILE_START_SAVING		- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_CONTENT_LOADED				= UI.engineEvents.EVENT_CONTENT_LOADED				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_CONTENT_UNLOADED				= UI.engineEvents.EVENT_CONTENT_UNLOADED			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_VIDEO_END						= UI.engineEvents.EVENT_VIDEO_END					- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_MP_SERVER_STOP				= UI.engineEvents.EVENT_MP_SERVER_STOP				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_LEADERBOARD_RESULT			= UI.engineEvents.EVENT_LEADERBOARD_RESULT			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_NETWORK_DISCONNECT 			= UI.engineEvents.EVENT_NETWORK_DISCONNECT			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_ON_ADD_PLAYER					= UI.engineEvents.EVENT_ON_ADD_PLAYER				- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_ON_REMOVE_PLAYER				= UI.engineEvents.EVENT_ON_REMOVE_PLAYER			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_REMOTE_PLAYER_DISCONNECTED	= UI.engineEvents.EVENT_REMOTE_PLAYER_DISCONNECTED	- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PLAYER_INFO_CHANGED			= UI.engineEvents.EVENT_PLAYER_INFO_CHANGED			- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_MASTER_SERVER_CONNECTED		= UI.engineEvents.EVENT_MASTER_SERVER_CONNECTED		- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_GAMEPLAY_RULES_INITIALIZED	= UI.engineEvents.EVENT_GAMEPLAY_RULES_INITIALIZED	- 50000 + UI.EV_GAME_ENGINE_EVENT_START
UI.EV_PLAYER_STATUS_CHANGED			= UI.engineEvents.EVENT_PLAYER_STATUS_CHANGED		- 50000 + UI.EV_GAME_ENGINE_EVENT_START

UI.msgBoxProto = "MsgBox"

UI.inputTypes =
{
	KB			= 1,
	XINPUT		= 2,
	PS3			= 3,
	JOY			= 4,
	MOVE		= 5,
}

UI.lowResFonts =
{
}

UI.launchModes =
{
	CLIENT			= 1,
}

UI.sounds =
{
	showScreen		= "sound/ui/showScreen",
	msgBoxClose		= "sound/ui/MsgHide",
	locked			= "sound/ui/invalid",
	btnMouseOver	= "sound/ui/btnMouseOver",
	btnClick		= "sound/ui/btnClick",
	checkBox		= "sound/ui/btnClick",
	print			= "sound/ui/print",
	invalid			= "sound/ui/invalid",
}

-- ai
UI.ShipControlModes =
{
	FOLLOWING		= 0,
	COMBINED		= 1,
	LOCAL_TURRET	= 2,
	REMOTE_TURRET	= 3,
	WOW				= 4,
	ROCKET			= 5,
	OBSERVER		= 6,

	NUM_MODES		= 7,
}

UI.MAX_AMMO_SLOTS	= 3

--
UI.wndMusicTypes =
{
	PLAY			= 1,		-- играть специфический трек
	NONE			= 2,		-- остановить текущую музыку
	PAUSE			= 3,		-- поставить на паузу текущую музыку
	UNPAUSE			= 4,		-- снять с паузы текущую музыку
	GAME			= 5,		-- сбросить внутреннюю переменную трэка в ui, с самой музыкой ничего не делать
	PAUSE_GAME     	= 6,		-- поставить на паузу текущую музыку, сбросить внутреннюю переменную трэка в ui
	UNPAUSE_GAME	= 7,			-- снять с паузы текущую музыку, сбросить внутреннюю переменную трэка в ui
	DONT_CARE		= 8,		-- ничего не делать с музыкой
}

UI.defaultMusicTheme = "MenuMusic"

UI.invItemTypes =
{
	SHIP		= 1,
	MODULE		= 2,
	AMMO		= 3,
	RESOURCE	= 4,
	BLUEPRINT	= 5,
}

UI.INVALID_U64_ID = u64( 0, 0 )

UI.OWNED_VESSELS_REQUEST_ID			= -1
UI.VESSEL_EQUIPMENT_REQUEST_ID		= -2
UI.VESSELS_EQUIPMENT_REQUEST_ID		= -3
UI.BATTLE_SLOTS_REQUEST_ID			= -4
UI.INVENTORY_REQUEST_ID				= -5
UI.PLAYER_CREDITS_REQUEST_ID		= -6
UI.RESOURCES_REQUEST_ID				= -7

UI.MAX_WAITING_REQUEST_TIME_OUT		= 30

UI.LookMode =
{
	LOOK_DEFAULT	= 0,
	LOOK_AROUND		= 1,
	LOOK_BACK		= 2,
	LOOK_WORLD		= 3,
}

UI.MAX_REPUTATIONS = 2

UI.WHITE_COLOR				= 0xffffffff
UI.TEXT_BASE_COLOR			= UI.WHITE_COLOR
UI.TEXT_SEL_COLOR			= 0xFFE1CB9C
UI.PARAM_DELTA_PLUS_COLOR	= 0xff00ff00
UI.PARAM_DELTA_MINUS_COLOR	= 0xffff0000
UI.LOCK_COLOR				= 0xff888888
UI.GOLD_COLOR				= 0xffffcf00
UI.FRIEND_COLOR				= 0xff5487f3
UI.ENEMY_COLOR				= 0xfff32400
UI.ALIEN_COLOR				= 0xffbd25e5
UI.FREE_COLOR				= 0xff0099ff		-- голубой, для бесплатной цены
UI.GREEN_COLOR				= UI.PARAM_DELTA_PLUS_COLOR
UI.RED_COLOR				= UI.PARAM_DELTA_MINUS_COLOR
UI.AUTOGEN_AFFIX_COLOR		= 0xff92aacf

UI.tutorialEnabled = true


UI.MOUSE_SENS_MIN = -4
UI.MOUSE_SENS_MAX = 4

UI.LOW_DURABILITY_THRESHOLD = 0.5

UI.TOOLTIP_DELAY			= 0.5
UI.TOOLTIP_MOUSE_THRESHOLD	= 5		-- в пределах смещения мыши на это расстояние тултип не скрывается
UI.TOOLTIP_SPACE_X	= 0
UI.TOOLTIP_SPACE_Y	= 5

UI.tooltipPlacementRules =
{
	ALIGNMENT_DATA		= 1,
	ALIGNMENT_FUNCTION	= 2,
	DEFAULT				= 3,
	DONT_TOUCH			= 4,
}

UI.hAlignments =
{
	LEFT	= 1,
	RIGHT	= 2,
	CENTER	= 3,
}

UI.vAlignments =
{
	TOP		= 1,
	BOTTOM	= 2,
	CENTER	= 3,
}

UI.tooltipTypes =
{
	TEXT_LARGE			= 1,
	TEXT_SMALL			= 2,
	ITEM				= 3,
	MODULE				= 4,
	TALENT				= 5,
	SHIP				= 6,
	JUNK				= 7,
	UPGRADE_ITEM		= 8,
	TOKEN_ITEM			= 9,
	PRESTIGE			= 10,
	RESOURCE			= 11,
	MAP_ZONE 			= 12,
	PRICE				= 13,
	CUSTOMIZATION		= 14,
	SPEC_MODULE_PARTS	= 15,
	SHIP_NODE			= 16,
}

UI.defaultTooltipNames =
{
	[ UI.tooltipTypes.TEXT_LARGE ]			= "TooltipWnd_shared",
	[ UI.tooltipTypes.TEXT_SMALL ]			= "TooltipSmallWnd",
	[ UI.tooltipTypes.MODULE ]				= "ModuleTooltipWnd_shared",
	[ UI.tooltipTypes.TALENT ]				= "TalentTooltipWnd_shared",
	[ UI.tooltipTypes.SHIP ]				= "ShipTooltipWnd_shared",
	[ UI.tooltipTypes.JUNK ]				= "JunkTooltipWnd_shared",
	[ UI.tooltipTypes.UPGRADE_ITEM ]		= "UpgradeItemTooltipWnd_shared",	
	[ UI.tooltipTypes.TOKEN_ITEM ]			= "TokenItemTooltipWnd_shared",	
	[ UI.tooltipTypes.PRESTIGE ]			= "PrestigeTooltipWnd",	
	[ UI.tooltipTypes.RESOURCE ]			= "ResourceTooltipWnd_shared",
	[ UI.tooltipTypes.MAP_ZONE ]			= "MapZoneTooltipWnd_shared",
	[ UI.tooltipTypes.PRICE ]				= "PriceTooltipWnd_shared",
	[ UI.tooltipTypes.CUSTOMIZATION ]		= "ShipCustomizationTooltipWnd",
	[ UI.tooltipTypes.SPEC_MODULE_PARTS ]	= "SpecModulePartsTooltipWnd",
	[ UI.tooltipTypes.SHIP_NODE ]			= "ShipNodeTooltipWnd",
}

UI.SHIP_COLOR_ID				= -2
UI.ALIEN_SHIP_COLOR_ID			= -3
UI.CRAFT_SHIP_COLOR_ID			= -4
UI.RESOURCE_COLOR_ID			= -5
UI.RESOURCE_SPECIAL_COLOR_ID	= -6
UI.CLAN_SHIP_PART_COLOR_ID		= -7
UI.SPEC_MODULE_PARTS_COLOR_ID	= -8 

UI.itemsColors =
{
	-- индексы совпадают со значением поля mark в дефинишенах
	-- качество вещи у андрея михалыча находится не в порядке марка, хотя и имеет однозначное соответствие
	-- цвет sel используется в нотификациях при наведении мыши на ссылку

	[ 0 ]	= { base = 0xffa8a8a8,	sel = 0xffd3d3d3 },	-- mk0,			серый
	[ 1 ]	= { base = 0xffffffff,	sel = 0xffd2d2d2 },	-- mk1,			белый
	[ 2 ]	= { base = 0xffffffff,	sel = 0xffd2d2d2 },	-- mk2,			белый
	[ 4 ]	= { base = 0xffffd200, 	sel = 0xffffe775 },	-- Premium,		желтый
	[ 6 ]	= { base = 0xff7cdb43, 	sel = 0xff5ffe00 },	-- Rare,		зеленый
	[ 3 ]	= { base = 0xff357cff,	sel = 0xff91b8ff },	-- mk3,			синий
	[ 7 ]	= { base = 0xffd65bfe, 	sel = 0xffebafff },	-- Epic,		фиолетовый
	[ 5 ]	= { base = 0xffff6000, 	sel = 0xffff914e },	-- Relic,		оранжевый

	-- у некоторых типов предметов нет поля mark, для них свои цвета

	[ UI.SHIP_COLOR_ID ]				= { base = 0xffffffff, sel = 0xffd2d2d2, alt = 0xff00ddff },	-- белый/голубой(alt)
	[ UI.ALIEN_SHIP_COLOR_ID ]			= { base = 0xff27e41b, sel = 0xff0fff00 },	-- зеленый
	[ UI.CRAFT_SHIP_COLOR_ID ]			= { base = 0xffb87aff, sel = 0xffc88aff },	-- сиреневый
	[ UI.RESOURCE_COLOR_ID ]			= { base = 0xffa1c2ff, sel = 0xffc2d7ff },	-- голубой
	[ UI.RESOURCE_SPECIAL_COLOR_ID ]	= { base = 0xff00ffff, sel = 0xff00d2d2 },	-- бирюзовый
	[ UI.CLAN_SHIP_PART_COLOR_ID ]		= { base = 0xffffffff, sel = 0xffd2d2d2 },	-- белый
	[ UI.SPEC_MODULE_PARTS_COLOR_ID ]	= { base = 0xffffffff, sel = 0xffd2d2d2 },	-- белый
}

-- в зависимости от ранга
UI.autogenAffixColors =
{
	[ 1  ]	= 0xffa8a8a8,
	[ 2  ]	= 0xffffffff,
	[ 3  ]	= 0xff7cdb43,
	[ 4  ]	= 0xff357cff,
	[ 5  ]	= 0xffd65bfe,
	[ 6  ]	= 0xffff6000,
}

UI.MK1_QUALITY		= 1
UI.RELIC_QUALITY	= 5
UI.PREMIUM_QUALITY	= 4


UI.ContextMenuType = 
{
	PLAYER_COMMON	= 1,	-- общие социальные штуки
	PLAYER_SQUAD	= 2,	-- сквадовые штуки
	PLAYER_CLAN		= 4,	-- клановые штуки
	PLAYER_RENAME	= 8,	-- переименовать игрока
	COMPLAINT_CHAT	= 16,	-- пожаловаться на кого-то
	LOBBY			= 32,	-- управление лобби
	CLAN 			= 64, 	-- кланы
	PLAYER_ARENA	= 128,	-- команды для арены (кроме приглашения)
	PLAYER_TRADING	= 256,	-- торговля
	PLAYER_USER_NOTE= 512,	-- можно добавлять заметки
}

UI.paramSrcTypes =
{
	MODULE		= 1,
	SPELL		= 2,
	SHIP		= 3,
	SHIP_NODE	= 4,
}

UI.shipTooltipModes =
{
	BRIEF	= 1,
	FULL	= 2,
}

UI.DEFAULT_SHIP_TOOLTIP_MODE = UI.shipTooltipModes.BRIEF

UI.NUM_RANKS_PER_TIER	= 3
UI.MAX_PROJECTED_RANK	= 15
UI.MAX_ZONE_TIER		= 5		-- #0091878: хотя есть ранги кораблей 16 и 17, зон тира 6 нет, этим кораблям разрешено играть в зонах 5-го тира


UI.popUpMenuSlotTypes =
{
	BATTLE_SLOT					= 1,
	SHIP_PREVIEW				= 2,
	REMOVE_EQUIPPED_ITEM		= 3,
	SELL_ITEM					= 4,
	REFILL_AMMO_FROM_INVENTORY	= 5,
	REFILL_AMMO_FROM_SHOP		= 6,
	BUY_ITEM					= 7,
	BUY_AND_EQUIP_ITEM			= 8, 
	EQUIP_ITEM					= 9, 
	SALVAGE_ITEM				= 10,
	SHIP_STRIP_EQUIPMENT		= 11,
	UPGRADE_ITEM				= 12,
	SHIP_SELL					= 13,
	CRAFTED_SHIP_SELL			= 14,
	DROP_LOOT_ITEM				= 15,
	CRAFT_ITEM					= 16,
	SHIP_REMOVE_FROM_QUEST_SLOT	= 17,
	GO_TO_SHIP_QUEST			= 18,
	SHIP_RECRAFT				= 19,
	SHIP_UPGRADE				= 20,
	SHOW_SHIP_EQUIPMENT			= 21,
	SHOW_EQUIPPED_MODULE		= 22,
	SHOW_ATLAS					= 23,
	SHIP_TEST_DRIVE				= 24,
	TRADING_ITEM				= 25,
	TRADING_MY_ADVERT_CANCEL	= 26,
	REMOVE_EQUIPPED_ITEM_HUD	= 27,
	SHIP_UPGRADE_ITEMS			= 28,
	AUTOGEN_DESTROY				= 29,
}


UI.popUpMenuTypes =
{
	SHIP			= 1,
	ITEM			= 2,
	LOOT			= 3,
}

-- Внимание! Не добавлять новые моды в середину, т.к. сохраненная в профиле настройка скривеет (там хранится число)
UI.hudOnCircleMarksModes =
{
	ALL				= 1,
	SPECIAL			= 2,
	NONE			= 3,
	NOT_FRIENDLY	= 4,
}

UI.hudOnCircleMarksModesOrder =
{
    UI.hudOnCircleMarksModes.ALL,
    UI.hudOnCircleMarksModes.NOT_FRIENDLY,
    UI.hudOnCircleMarksModes.SPECIAL,
    UI.hudOnCircleMarksModes.NONE
}

UI.hudArrowsAreaTypes =
{
    CIRCLE			= 1,
    MOUSE_RADIUS	= 2,
    SCREEN_RECT		= 3,
}

UI.hudArrowsAreaTypesOrder =
{
	UI.hudArrowsAreaTypes.CIRCLE,
	UI.hudArrowsAreaTypes.MOUSE_RADIUS,
	UI.hudArrowsAreaTypes.SCREEN_RECT,
}

UI.MAX_NICKNAME_LEN			= 16
UI.MAX_NICKNAME_EDIT_LEN	= 20


--
UI.mailAttachmentTypes =
{	
	ITEM			= 1,
	CREDITS			= 2,
	GOLD			= 3,
	LOYALTY_LEGACY	= 4,
	RACE_REP		= 5,
	TOKENS			= 6,
	SYNERGY_FREE	= 7,
	SYNERGY_SHIP	= 8,
	PREMIUM			= 9,
	TITLE			= 10,
	TALENT_SET		= 11,
	ACCOUNT_AURA	= 12,
	EVENT_CREDITS	= 13,
	AUTOGEN			= 14,
	CUSTOM_ELEMENT	= 15,
	AVATAR			= 16,
	MOTTO			= 17,
}

if UI.showDefNames == nil then
	UI.showDefNames	= false
end

UI.gameObjColorSchemes =
{
	FRIEND		= 1,
	ENEMY		= 2,
	NEUTRAL		= 3,
	SQUAD		= 4,
	ME			= 5,
	AGGRESSIVE	= 6,
	ALIEN		= 7,
}

UI.gameObjColors =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= 0xff00ddff,
	[ UI.gameObjColorSchemes.ENEMY ]		= 0xffff2800,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= 0xff999999,
	[ UI.gameObjColorSchemes.SQUAD ]		= 0xff08ff00,
	[ UI.gameObjColorSchemes.ME ]			= 0xff84f0a8,	-- светло-зеленый
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= 0xffff9a00,
	[ UI.gameObjColorSchemes.ALIEN ]		= 0xffbd25e5,
}

UI.MINOR_OBJECTS_DIST	= 1000 / 10	-- расстояние, на котором начинают показываться объекты типа MINOR


UI.junkPriceTypes =
{
	NONE		= -1,
	CREDITS		= 1,
	TOKENS		= 2,
}

UI.CURSOR_CIRCLE_WIDTH = 1.3	-- в абсолютных пикселах

UI.shopItemActions =
{
	NEW		= 1,
	HOT		= 2,
	SALE	= 3,
}

UI.questRewardTypes =
{
	GOLD			= 1,
	CREDITS			= 2,
	ITEM			= 3,
	TOKENS			= 4,	-- иридиум для игрока
	SYNERGY			= 5,
	CLAN_IRIDIUM	= 6,	-- иридиум для клана
	ACCOUNT_AURA	= 7,
	EVENT_CREDITS	= 8,
	FREE_SYNERGY	= 9,
}

UI.resourceIngredientTypes =
{
	RESOURCE	= 1,
	MODULE		= 2,
	CREDITS		= 3,
	GOLD		= 4,
	TOKENS		= 5,
}

UI.MAX_TALENT_SETS	= 4

UI.questTypes =
{
	REGULAR			= 1,
	SHIP			= 2,
	PVE_EVENT		= 3,
	CUSTOM			= 4,	-- это фейковый "квест", нужен для совместимости с уже сделанной системой, используется при произвольной постановке иконки на маркер
	SCRIPTED		= 5,
}

UI.questIcoTypes =
{
	YELLOW	= 1,
	BLUE	= 2,
}

-- нумерация соответствует приоритету
UI.questIcoStates =
{
	CAN_BE_COMPLETED_REGULAR	= 1,
	CAN_BE_COMPLETED_SHIP		= 2,
	NEW_REGULAR_MAIN			= 3,
	NEW_SHIP					= 4,
	NEW_REGULAR_AUTO			= 5,
}

-- значения не должны пересекаться с _G.GameStore.CreditsType
UI.exPriceTypes =
{
	CLAN_IRIDIUM		= -100,
	SYNERGY				= -101,
	FREE_SYNERGY		= -102,
	SHIP_PARTS			= -103,
	SPEC_MODULE_PARTS	= -104,
}

-- ( GameStore.CreditsType во время загрузки этого файла еще нет, поэтому через ключи строки)
UI.priceColors =
{
	CT_CREDITS			= 0xff92aacf,
	CT_EVENT			= 0xff6da6c1,
	CT_GOLD				= 0xffe4d17f,
	CT_TOKENS			= 0xff5dbd9f,	--это иридиум
	CLAN_IRIDIUM		= 0xff5dbd9f,
	SYNERGY				= 0xffffffff,
	FREE_SYNERGY		= 0xffa27daf,
	SHIP_PARTS			= 0xffffffff,
	SPEC_MODULE_PARTS	= 0xffffffff,
}

UI.rankLocks =
{
	pve						= 4, -- #91037 #91512
	pve_missions			= 4, -- #106360
	coop_vs_ai				= 1,
	talents					= 3,
	openWorldStart			= 2, -- #58347 #54556
	openWorldMap			= 2, -- #58347 #54556
	quests					= 3,
	unlimPveBuffs			= 4,
	pvp						= 3, -- #107063
	brawl					= 5,
	custom					= 5,
	tournament				= 6,
	itemCraft				= 6, -- #82716 Ускорение зеленого дерева --#97739 
	inGameShipsInfo			= 6, -- #98557 - в бою не отображаются тултипы кораблей
	randomBfs				= 7,
	raid					= 7,
	arena					= 10,
	shipPresets				= 15,

	shipsByRace =
	{
		EMPIRE		= -1,
		FEDERATION	= 6, -- #0106449
		JERICHO		= 7,
		CRYSTAL		= 9, --#0097264
		SPECIAL		= 8,
	}
}

UI.arenaPlaceIcoRanges =
{
	1,
	2,
	3,
	4,
	17,
	51,
	101,
	201,
	501,
}

UI.arenaMajorPlaceIcoRanges =
{
	1,
	2,
	3,
	4,
	5,
	7,
	9,
	11,
	13,
}

UI.MAX_SHIP_LEVEL = 10

UI.MIN_RANK_UP_SHOW = 16

-- ---------------------------------------------------------
-- опции
-- ---------------------------------------------------------

UI.defaultUpgradeItemTooltipAllLevels	= true

UI.defaultMarksElements =
{
	brief =
	{
		name		= false,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= false,
		dist		= false,
		frame		= true,
	},

	full =
	{
		name		= true,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= true,
		dist		= true,
		frame		= true,
	},

	lock =
	{
		name		= true,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= true,
		dist		= true,
		frame		= true,
	},

	brief_ally =
	{
		name		= false,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= false,
		dist		= false,
		frame		= true,
	},

	full_ally =
	{
		name		= true,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= true,
		dist		= true,
		frame		= true,
	},

	lock_ally =
	{
		name		= true,
		role		= true,
		specIco		= true,
		rank		= false,
		shipName	= false,
		hpShield	= true,
		dist		= true,
		frame		= true,
	},
}

UI.gameCursorTypes =
{
	{ name = "1", effect = "hud_cursor_dispersion",	animation = "idle",		isCircle = true	 },
	{ name = "2", effect = "hud_cursor_dispersion",	animation = "idle_2",	isCircle = true	 },
	{ name = "4", effect = "hud_cursor_dispersion",	animation = "idle_2",	isCircle = false },
}

UI.gameCursorCrossTypes =
{
	{ name = "none",		effect = "hud_cursor_cross",	animation = "empty" },
	{ name = "smallCross",	effect = "hud_cursor_cross",	animation = "cross" },
	{ name = "bigCross",	effect = "hud_cursor_cross",	animation = "cross_big" },
	{ name = "dot",			effect = "hud_cursor_cross",	animation = "point" },
}

UI.gameCursorColors =
{
    { color = 0xffff0000, name = "red" },		-- красный
    { color = 0xffffffff, name = "white" }, 	-- белый
    { color = 0xff00ffb4, name = "cyan" }, 		-- бирюзовый
    { color = 0xfffc00ff, name = "magenta" }, 	-- розовый
    { color = 0xff5aff00, name = "green" }, 	-- зеленый
    { color = 0xffffe400, name = "yellow" }, 	-- желтый
    { color = 0xff00c6ff, name = "blue" }, 		-- голубой
    { color = 0xffae5eff, name = "purple" }, 	-- фиолетовый 
}

UI.predictionColors =
{
    { color = 0xffff0000, name = "red" },		-- красный
    { color = 0xffffffff, name = "white" }, 	-- белый
    { color = 0xff00ffb4, name = "cyan" }, 		-- бирюзовый
    { color = 0xfffc00ff, name = "magenta" }, 	-- розовый
    { color = 0xff5aff00, name = "green" }, 	-- зеленый
    { color = 0xffffe400, name = "yellow" }, 	-- желтый
    { color = 0xff00c6ff, name = "blue" }, 		-- голубой
    { color = 0xffae5eff, name = "purple" }, 	-- фиолетовый 
}

UI.minimapModes =
{
	RADAR	= 1,
	MAP		= 2,
}
UI.defaultMinimapMode = UI.minimapModes.MAP

UI.itemRankModes =
{
	MAX		= 1,
	RANGE	= 2,	
}
UI.defaultItemRankMode = UI.itemRankModes.MAX
UI.defaultShowCyberSport = false

UI.hudOptionsDefaultVals =
{
	onCircleMarksMode				= UI.hudOnCircleMarksModes.ALL,
	hudArrowsAreaType				= UI.hudArrowsAreaTypes.MOUSE_RADIUS,
	allowDamageDir					= true,
	hudPlayerShipInfoAlpha			= 255,
	showIncomingStates				= true,
	cursorTypes						= 1,
	cursorCrossTypes				= 4,
	cursorColors					= 2, -- белый
	predictionColors				= 2, -- белый
	adaptiveMarksSize				= true,
	marksFadeOnDist					= false,
	hideMarksFramesOutOfShot		= false,
	marksTransparentBehindObstacle	= false,
	vpHpAlways						= true,
	showPredictionUnderMouse		= true,
	scalableHealthBars				= true,
	showGameplayInfo				= true,
	showQuestTracker				= true,
}

-- ---------------------------------------------------------
-- конец опций
-- ---------------------------------------------------------

UI.shipNodePriceTypes =
{
	CREDITS	= 1,
	TOKENS 	= 2,
	SYNERGY = 3,
	ITEM	= 4,
}

UI.shipSlotTypes =
{
	WEAPON			= 1,
	ACTIVE			= 2, 
	ENGINE_MOD		= 3,
	CAPACITOR_MOD	= 4, 
	SHIELD_MOD		= 5,
	ARMOR_MOD		= 6,
	CPU_MOD			= 7,
	AMMO_PRIMARY	= 8,
	AMMO_SECONDARY	= 9,
	SPECIAL			= 10,
	AUTOGEN			= 11,
}

UI.firstFightParams =
{
	mapName		= "s1347_smallstation",
	gameplay	= "PRACTICE",
	numBots		= 7,
}

UI.testDriveParams =
{
	mapName		= "pvp_fed_test_map",
	gameplay	= "TDM",
	numBots		= 7,
}

UI.scriptedChatMsgTypes =
{
	REWARD	= 1,
	EVENT	= 2,
}

UI.SHIP_PRESET_MAX_PRESETS_PER_SHIP	= 4
UI.SHIP_PRESET_MAX_NAME_LENGTH		= 32	-- в символах

UI.autogenDefaultDefName = "Module_Autogen_Default"

UI.autogenQualities =
{
	1, -- mk1 белый
	6, -- Rare зеленый
	3, -- mk3 синий
	7, -- Epic фиолетовый
	5, -- Relic оранжевый
}

UI.AUTOGEN_MAX_UPGRADE_LEVEL = #UI.autogenQualities -- отсчет с 1

UI.passiveModulesEditEnabled = false -- SC-111991