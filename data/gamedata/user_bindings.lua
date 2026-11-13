--[[
этот файл описывает пользовательские бинды/команды.
те команды которые могут быть изменены пользователем (например в окне биндов)
и какие клавиши по умолчанию на них назначены

бинды которые не могут быть изменены пользователем следует, как и раньше, писать в config.lua
]]

local CONTROL_MODE_INTERFACE = 2
local CONTROL_MODE_INTERFACE_GAME = 4096

local CONTROL_MODE_FOLLOWING = 4			-- управление кораблем из-за кормы ("1 режим")
local CONTROL_MODE_GAMEPLAY = CONTROL_MODE_FOLLOWING  -- оба режима камеры
local CONTROL_MODE_ALL = 0xffff


--
UserBindings =
{
	{ name = "HEADER_SHIP_CONTROL" },
	{ name = "speedMax",			keys = { "w", },									cmd = "+ship_maxSpeed",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedBack",			keys = { "s", },									cmd = "+ship_backSpeed",			controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "strafeLeft",			keys = { "a", },									cmd = "+ship_strafeLeft",			controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "strafeRight",			keys = { "d", },									cmd = "+ship_strafeRight",			controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "strafeUp",			keys = { "space", },								cmd = "+ship_strafeUp",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "strafeDown",			keys = { "alt", },									cmd = "+ship_strafeDown",			controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "rollLeft",			keys = { "q", },									cmd = "+ship_rollLeft",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "rollRight",			keys = { "e", },									cmd = "+ship_rollRight",			controlMode = CONTROL_MODE_FOLLOWING, },

	{ name = "HEADER_SPEED_CONTROL" },
	{ name = "speedInc",			keys = { "plus", },									cmd = "ship_speedInc",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedDec",			keys = { "minus", },								cmd = "ship_speedDec",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedUp",																	cmd = "+ship_speedUp",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedDown",																cmd = "+ship_speedDown",			controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedSetZero",		keys = { "mul", },									cmd = "ship_speed 0.0",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "speedSetOne",			keys = { "div", },									cmd = "ship_speed 1.0",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "boost",				keys = { "shift", },								cmd = "+ship_boost",				controlMode = CONTROL_MODE_FOLLOWING, },
	{ name = "boostToggle",			keys = {},											cmd = "toggle ship_boostToggle",	controlMode = CONTROL_MODE_FOLLOWING, },	-- #0097462

	{ name = "HEADER_WEAPON" },
	{ name = "primaryFire",			keys = { "mouse1", },								cmd = "+ship_fire",					controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "secondaryFire",		keys = { "mouse2", },								cmd = "ship_launchRocket",			controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "module0",				keys = { "1", }, 									cmd = "+ship_activateModule 0",		controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "module1",				keys = { "2", }, 									cmd = "+ship_activateModule 1",		controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "module2",				keys = { "3", }, 									cmd = "+ship_activateModule 2",		controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "module3",				keys = { "4", },									cmd = "+ship_activateModule 3",		controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "activateSpecial",		keys = { "f", },									cmd = "+ship_activateSpecial",		controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "interact",			keys = { "c", }, 									cmd = "ship_interact",				controlMode = CONTROL_MODE_GAMEPLAY, },

	{ name = "HEADER_TARGET" },
	{ name = "lock",				keys = { "r", "mouse3", },							cmd = "ship_lock",					controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "lockEnemy",			keys = { "t", }, 									cmd = "ship_lockEnemy",				controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "lockLocker",																cmd = "ship_lockLocker",			controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "lockAssist",																cmd = "ship_lockAssist",			controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "lockCancel",																cmd = "ship_lockCancel",			controlMode = CONTROL_MODE_GAMEPLAY, },

	{ name = "HEADER_VIEW" },
	{ name = "tacticView",			keys = { "tab", },									cmd = "ScriptRun 'UI:OnToggleGlobalMapBind()'",		controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "tacticViewHold",															cmd = "+ship_lookWorld",							controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "lookBack",																cmd = "+ship_lookBack",								controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "lookAround",			keys = { "ctrl", },									cmd = "+ship_lookAround",							controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "zoomToggle",			keys = { "b", },									cmd = "ship_zoom",									controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "zoomHold",																cmd = "+ship_zoomHold",								controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "camCloser",			keys = { "mwheelup", },								cmd = "cam_shipCloser",								controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "camFarther",			keys = { "mwheeldown", },							cmd = "cam_shipFarther",							controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "showNames",			keys = { "v" },										cmd = "+showNames",									controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "toggleNames",			keys = {},											cmd = "ScriptRun 'UI:OnToggleMarksNamesBind()'",	controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "freeMouse",																cmd = "+freeMouse",									controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "moveIgnoreMouse",															cmd = "+ship_ctrlIgnoreMouse",						controlMode = CONTROL_MODE_GAMEPLAY, },
	{ name = "toggleMap",			keys = { "m", },									cmd = "ScriptRun 'UI:OnToggleMapBind()'",			controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "toggleCargoMode",		keys = { "i", },									cmd = "ScriptRun 'UI:OnToggleCargoModeBind()'",		controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME, },
	{ name = "scanSpace",			keys = { "x", }, 									cmd = "ship_scanSpace",								controlMode = CONTROL_MODE_GAMEPLAY, },

	{ name = "HEADER_CHAT" },
	{ name = "chatActivateSlash",	keys = { "?", }, 									cmd = "ScriptRun 'UI:OnChatSlashBind()'",			controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE + CONTROL_MODE_INTERFACE_GAME },
	{ name = "chatPageUp",			keys = { "pgup", }, 								cmd = "ScriptRun 'UI:OnChatPageUpBind()'",			controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE + CONTROL_MODE_INTERFACE_GAME },
	{ name = "chatPageDown",		keys = { "pgdn", }, 								cmd = "ScriptRun 'UI:OnChatPageDownBind()'",		controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE + CONTROL_MODE_INTERFACE_GAME },

	{ name = "HEADER_CHAT_COMMAND" },
	{ name = "tcs_target",			keys = { "num3", },									cmd = "tcs_target",									controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME },
	{ name = "voicechat_talk",		keys = { "y", },									cmd = "+voicechat_talk",							controlMode = CONTROL_MODE_GAMEPLAY + CONTROL_MODE_INTERFACE_GAME },

	{ name = "HEADER_HANGAR" },
	{ name = "hangarTabShips",		keys = { "t" },									cmd = "ScriptRun 'UI:OnHangarTabShipsBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarTabSkills",		keys = { "i" },									cmd = "ScriptRun 'UI:OnHangarTabSkillsBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarTabShop",		keys = { "w" },									cmd = "ScriptRun 'UI:OnHangarTabShopBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarTabItemCraft",	keys = { "c" },									cmd = "ScriptRun 'UI:OnHangarTabItemCraftBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarTabLeaderboards",		keys = { "l" },							cmd = "ScriptRun 'UI:OnHangarTabLeaderboardsBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarTabHelp",		keys = { "f1" },									cmd = "ScriptRun 'UI:OnHangarTabHelpBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarProfile",		keys = { "p" },										cmd = "ScriptRun 'UI:OnHangarProfileBind()'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarClan",			keys = { "g" },										cmd = "ScriptRun 'UI:OnHangarClanBind()'",			controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarSlot1",			keys = { "1", }, 									cmd = "ScriptRun 'UI:OnHangarSlotBind( 1 )'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarSlot2",			keys = { "2", }, 									cmd = "ScriptRun 'UI:OnHangarSlotBind( 2 )'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarSlot3",			keys = { "3", }, 									cmd = "ScriptRun 'UI:OnHangarSlotBind( 3 )'",		controlMode = CONTROL_MODE_INTERFACE },
	{ name = "hangarSlot4",			keys = { "4", }, 									cmd = "ScriptRun 'UI:OnHangarSlotBind( 4 )'",		controlMode = CONTROL_MODE_INTERFACE },

	{ name = "HEADER_GENERAL" },
	{ name = "contextHelp",			keys = { "f10", }, 									cmd = "ScriptRun 'UI:OnControlsBind()'",			controlMode = CONTROL_MODE_ALL },
	{ name = "showFps",				keys = { "f11", }, 									cmd = "ScriptRun 'UI:OnClientStatsToggleBind()'",	controlMode = CONTROL_MODE_ALL },
	{ name = "screenshot",			keys = { "f12", "printscreen", },					cmd = "g_screenshot 1",								controlMode = CONTROL_MODE_ALL },
	{ name = "screenshotTGA",															cmd = "g_screenshot 0",								controlMode = CONTROL_MODE_ALL },

	{ name = "toggleOculus",			keys = { "scroll", },							cmd = "toggle g_oculusVR",							controlMode = CONTROL_MODE_ALL, },
	{ name = "resetOculus",				keys = { "home", },								cmd = "g_resetOculus",								controlMode = CONTROL_MODE_ALL, },

	-- shipControlMode = { key = { "ctrl", },									cmd = "ship_toggleControlMode", 	controlMode = CONTROL_MODE_GAMEPLAY, },
	-- screenshot		= { key = { "printscreen", },	,					cmd = "g_screenshot",				controlMode = CONTROL_MODE_ALL, },
	-- showFps			= { key = { "f12", },								cmd = "toggle g_showFpsStats",		controlMode = CONTROL_MODE_ALL, },
	-- toggleHud		= { key = { "alt+z", },									cmd = "ScriptRun 'UI:OnToggleHudBind()'",	controlMode = CONTROL_MODE_GAMEPLAY, },
}


--[[
	Автоматическое сбрасывание некоторых cvar'ов, в случае если у клиента слишком старая версия.

	Если хотите чтобы в "следующей" версии какой-то cvar сбросился в дефолтное значение надо
		- увеличить значение CURRENT_VERSION
		- прописать в табличке cvar'а поле reset_in_version в значение равное новому CURRENT_VERSION
]]

CvarsAutoReset =
{
	CURRENT_VERSION = 4,
	ui_widgetsResolutionScale = { reset_in_version = 2, },
	g_drawShadows = { reset_in_version = 4, },
	r_shadersQuality = { reset_in_version = 4, },
	g_softParticles = { reset_in_version = 4, },
	g_drawDepthTex = { reset_in_version = 4, },
	pe_dof = { reset_in_version = 4, },
}
