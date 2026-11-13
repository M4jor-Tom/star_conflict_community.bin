-- ----------------------------------------------------------------------------
--
-- Workfile: UiDefs.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- Basic UI definitions
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI =
{	
	-- базовый UI
	base	= SystemGetGlobalObject( "UiManager" );
	drawer	= SystemGetGlobalObject( "UiDrawer" );

	-- идентификаторы callack-функций
   	F_Init						    = 0, 
   	F_Shutdown					    = 1, 
   	F_DrawLayer					    = 2, 
   	F_OnKeyboardKeyDown			    = 3, 
   	F_OnKeyboardKeyUp			    = 4, 
   	F_OnMouseLButtonDown		    = 5, 
   	F_OnMouseLButtonUp			    = 6, 
   	F_OnMouseMButtonDown		    = 7, 
   	F_OnMouseMButtonUp			    = 8, 
   	F_OnMouseRButtonDown		    = 9, 
   	F_OnMouseRButtonUp			    = 10,
   	F_OnMouseLButtonClick		    = 11,
   	F_OnMouseMButtonClick		    = 12,
   	F_OnMouseRButtonClick		    = 13,
   	F_OnMouseLButtonDblClick	    = 14,
   	F_OnMouseMButtonDblClick	    = 15,
   	F_OnMouseRButtonDblClick	    = 16,
   	F_OnMouseMove				    = 17,
   	F_OnMouseWheel				    = 18,
   	F_OnJoystickKeyDown			    = 19,
   	F_OnJoystickKeyDown_1			= 20,
   	F_OnJoystickKeyDown_2			= 21,
   	F_OnJoystickKeyUp			    = 22,
   	F_OnJoystickKeyUp_1			    = 23,
   	F_OnJoystickKeyUp_2			    = 24,
   	F_OnJoystickMove			    = 25,
   	F_OnJoystickMove_1			    = 26,
   	F_OnJoystickMove_2			    = 27,
   	F_OnObtainKeyboardFocus		    = 28,
   	F_OnLostKeyboardFocus		    = 29,
   	F_OnCaptureMouse			    = 30,
   	F_OnReleaseMouseCapture		    = 31,
   	F_OnMouseIn					    = 32,
   	F_OnMouseOut				    = 33,
   	F_OnBeforeAddChild			    = 34,
   	F_OnAfterAddChild			    = 35,
   	F_OnBeforeRemoveChild		    = 36,
   	F_OnAfterRemoveChild		    = 37,
   	F_OnBeforeShowOnScreen		    = 38,
   	F_OnAfterShowOnScreen		    = 39,
   	F_OnBeforeHideFromScreen	    = 40,
   	F_OnAfterHideFromScreen		    = 41,
   	F_SubscribeOnEvents			    = 42,
   	F_UnsubscribeFromEvents         = 43,
   	F_PostLoad					    = 44,
   	F_RecalcLayot				    = 45,
   	F_OnBeforeResetDevice			= 46,
   	F_OnResetDevice				    = 47,
   	F_OnBeforeAddToParent		    = 48,
   	F_OnAfterAddToParent		    = 49,
   	F_OnBeforeRemoveFromParent	    = 50,
   	F_OnAfterRemoveFromParent	    = 51,
   	F_MeasureItem 				    = 52,
   	F_DrawItem					    = 53,
   	F_DeleteItem				    = 54,
   	F_OnChangeSelectedItem		    = 55,
   	F_OnChangeOverroledItem		    = 56,
	F_UpdateAppearance				= 57,
	F_CanUnlinkNow					= 58,
	F_OnScreenPosChanged			= 59,
	F_OnSizeChanged					= 60,
	F_Draw							= 61,
	F_DrawEText						= 62,
	F_OnCheckStateChanged			= 63,
	F_OnBeforeMsgBoxReturn			= 64,
	F_OnBeforeCopyTextToClipboard	= 65,
	F_OnBeforePasteTextFromClipboard= 66,

   	F_EVENT_START					= 67,
   
   	F_OnNewFrame				    = 67,
   	F_OnEventWndShown			    = 68,
   	F_OnEventWndHided			    = 69,
   	F_OnEventSaveUiState		    = 70,
   	F_OnEventRestoreUiState         = 71,
   	F_OnEventBeforeReloadResource	= 72,
   	F_OnEventAfterReloadResource	= 73,
	F_OnEventKbKeyDown				= 74,
	F_OnEventKbKeyUp				= 75,
	F_OnEventJoyKeyDown				= 76,
	F_OnEventJoyKeyUp				= 77,	
	F_OnEventMouseButtonDown		= 78,
	F_OnEventMouseButtonUp			= 79,
	F_OnEventMouseMove				= 80,
	F_OnEventMouseWheel				= 81,
   	F_OnEventMsgBoxRet				= 82,
   	F_OnEventAnimationStop			= 83,
   	F_OnEventAfterAnimationStop		= 84,
   	F_OnEventBtnCheck				= 85,
   	F_OnEventBtnRadioCheck			= 86,
   	F_OnEventHScrollChange			= 87,
   	F_OnEventVScrollChange			= 88,
   	F_OnEventListItemOverroled		= 89,
   	F_OnEventListItemSelected		= 90,
   	F_OnEventListItemActivated		= 91,
   	F_OnEventComboOpen				= 92,
   	F_OnEventComboItemActivated		= 93,
   	F_OnEventSliderChange			= 94,
   	F_OnEventEditChange				= 95,
   	F_OnEventEditInvalidInput		= 96,
   	F_OnEventEditTextLimit			= 97,
   	F_OnEventCursorPosChange		= 98,

	-- стороны
   	LEFT  	= 0,
   	TOP		= 1,
   	RIGHT	= 2,
   	BOTTOM	= 3,

	-- событи€
   	EV_NEW_FRAME					= 5,
   	EV_WND_SHOWN					= 6,
   	EV_WND_HIDED					= 7,
   	EV_SAVE_UI_STATE				= 8,
   	EV_RESTORE_UI_STATE				= 9,
   	EV_BEFORE_RELOAD_RESOURCE		= 10,
   	EV_AFTER_RELOAD_RESOURCE		= 11,
	EV_KB_KEY_DOWN					= 12,
	EV_KB_KEY_UP					= 13,
	EV_JOY_KEY_DOWN					= 14,
	EV_JOY_KEY_UP					= 15,
	EV_MOUSE_BUTTON_DOWN			= 16,
	EV_MOUSE_BUTTON_UP				= 17,
	EV_MOUSE_MOVE					= 18,
	EV_MOUSE_WHEEL					= 19,
   	EV_MSGBOX_RET					= 20,
   	EV_ANIMATION_STOP				= 21,
   	EV_AFTER_ANIMATION_STOP			= 22,
   	EV_BTN_CHECK					= 23,
   	EV_BTN_RADIO_CHECK				= 24,
   	EV_HSCROLL_CHANGE				= 25,
   	EV_VSCROLL_CHANGE				= 26,
   	EV_LIST_ITEM_OVERROLED			= 27,
   	EV_LIST_ITEM_SELECTED			= 28,
   	EV_LIST_ITEM_ACTIVATED			= 29,
   	EV_COMBO_OPEN					= 30,
   	EV_COMBO_ITEM_ACTIVATED			= 31,
   	EV_SLIDER_CHANGE				= 32,
   	EV_EDIT_CHANGE					= 33, 
   	EV_EDIT_INVALID_INPUT			= 34,
   	EV_EDIT_TEXT_LIMIT				= 35,
	EV_EDIT_CURSOR_POS_CHANGE		= 36,
	EV_EDIT_SEL_CHANGE				= 37,
   	
   	EV_USER							= 38,
	NUM_EVENTS						= 150,
	
	-- стили окна
   	WS_NOT_DRAW							= 0x00000001,
   	WS_NOT_MOUSE_REACT					= 0x00000002,
	WS_NOT_KB_REACT						= 0x00000004,
   	WS_GRAYED							= 0x00000008,
   	WS_UPDATE_IF_VISIBLE				= 0x00000010,
   	WS_REDIRECT_ACTIVATION_TO_CHILDREN	= 0x00000020,
   	WS_ACTIVATE_ON_LMOUSE_CLICK			= 0x00000040,
   	WS_ACTIVATE_ON_RMOUSE_CLICK			= 0x00000080,
   	WS_ACTIVATE_ON_MMOUSE_CLICK			= 0x00000100,
	WS_UPDATE_IF_ANIMATED				= 0x00000200,
	WS_CHANGE_ACTIVE_BY_LR				= 0x00000400,
	WS_CHANGE_ACTIVE_BY_UD				= 0x00000800,
	WS_CHANGE_ACTIVE_CYCLED				= 0x00001000, 
	WS_ENABLE_APPEARANCES				= 0x00002000,
	WS_DISABLE							= 14,
	
	-- стили окна сообщени€
   	MBS_OK							= 1,
   	MBS_YES_NO						= 2,
   	MBS_YES_NO_CANCEL				= 4,
   	MBS_DEF_BUTTON_1				= 8,
   	MBS_DEF_BUTTON_2				= 16,
   	MBS_DEF_BUTTON_3				= 32,

	-- возвращаемое значение окна сообщени€
   	MBRET_OK						= 0,
   	MBRET_YES						= 1,
   	MBRET_NO						= 2,
   	MBRET_CANCEL					= 3, 

	-- предопределенные id окон
   	OBJ_ID_ROOT_WND					= 0,
   	OBJ_ID_TOOLTIP					= 1,
   	OBJ_ID_USER						= 2,
   	NUM_OBJ_IDS						= 64,

	-- идентификаторы наборов слоев класса Wnd
   	WA_NORMAL						= 0,
   	WA_FOCUSED						= 1,
   	WA_GRAYED						= 2,

	-- идентификаторы наборов слоев класса ButtonWnd
   	BA_NORMAL						= 0,
   	BA_NORMAL_FOCUSED				= 1,
   	BA_OVERROLED					= 2,
   	BA_OVERROLED_FOCUSED			= 3,
   	BA_PRESSED						= 4,
   	BA_PRESSED_FOCUSED				= 5,
   	BA_GRAYED						= 6, 

	-- идентификаторы наборов слоев класса CheckButtonWnd
   	CBA_NORMAL_UNCHECKED			= 0,
   	CBA_NORMAL_CHECKED				= 1,
   	CBA_NORMAL_FOCUSED_UNCHECKED	= 2,
   	CBA_NORMAL_FOCUSED_CHECKED		= 3,
   	CBA_OVERROLED_UNCHECKED			= 4,
   	CBA_OVERROLED_CHECKED			= 5,
   	CBA_OVERROLED_FOCUSED_UNCHECKED	= 6,
   	CBA_OVERROLED_FOCUSED_CHECKED	= 7,
   	CBA_PRESSED_UNCHECKED			= 8,
   	CBA_PRESSED_CHECKED				= 9,
   	CBA_PRESSED_FOCUSED_UNCHECKED	= 10,
   	CBA_PRESSED_FOCUSED_CHECKED		= 11,
   	CBA_GRAYED_UNCHECKED			= 12,
   	CBA_GRAYED_CHECKED				= 13,

	-- состо€ние мыши относительно кнопки
   	MOUSE_OUT						= 0,
   	MOUSE_IN						= 1,
   	MOUSE_DOWN						= 2, 

	-- типы слоев
   	LAYER_TEXTURE					= 1,
   	LAYER_MASK						= 2,
   	LAYER_FRAME						= 4,
   	LAYER_TEXT						= 8,
   	LAYER_VERTEX_STREAM				= 16,
	LAYER_PACKET					= 32,
	LAYER_EFFECT					= 64,
	LAYER_ETEXT						= 128,
	LAYER_ALL						= 255,
   	LAYER_INVALID					= -1,

	-- стили слоев
   	WLS_RESIZABLE					= 1,
   	WLS_CENTERED					= 2,
   	WLS_FIX_LEFT					= 4,
   	WLS_FIX_TOP						= 8,
   	WLS_FIX_RIGHT					= 16,
   	WLS_FIX_BOTTOM					= 32, 
	WLS_OWNERDRAW					= 64,
	WLS_TEXT_PICKER_TRANSPARENT		= 128,

	-- типы анимации
   	ANIMATION_ON_HIDE				= 0,
   	ANIMATION_ON_SHOW				= 1,
   	ANIMATION_USER					= 2,

	-- стили полосы прокрутки
   	SWS_VERTICAL					= 1,
   	SWS_HORIZONTAL					= 2,	
   	SWS_THUMB_RESIZABLE				= 4,
	SWS_ALLOW_DISABLE_BTNS			= 8,
	SWS_STEPWISE_THUMB_MOVEMENT		= 16,

	-- элементы полосы прокрутки, которые €вл€ютс€ источником событий
   	SCROLL_SRC_UNKNOWN				= -1,
   	SCROLL_SRC_LEFT_BTN				= 0,
   	SCROLL_SRC_RIGHT_BTN			= 1,
   	SCROLL_SRC_UP_BTN				= 2,
   	SCROLL_SRC_DOWN_BTN				= 3,
   	SCROLL_SRC_LEFT_PAGE			= 4,
   	SCROLL_SRC_RIGHT_PAGE			= 5,
   	SCROLL_SRC_UP_PAGE				= 6,
   	SCROLL_SRC_DOWN_PAGE			= 7,
   	SCROLL_SRC_THUMB				= 8,
   	SCROLL_SRC_WHEEL				= 9,
   	SCROLL_SRC_KEYBOARD				= 10,

	-- стили окна-списка
   	LS_VERTICAL							= 1,
   	LS_HORIZONTAL						= 2,
   	LS_HIDE_SCROLLBARS_WHEN_NO_SCROLL	= 4,
   	LS_CHANGE_SELECTION_BY_WHEEL		= 8,
   	LS_SORTED							= 16,
   	LS_DELETE_ITEMS_ON_REMOVING			= 32,
   	LS_SELECT_BY_MOUSE_MOVE				= 64,
   	LS_ACTIVATE_ITEM_BY_SINGLE_CLICK	= 128,

	-- источник сообщени€
   	EVENT_SRC_UNKNOWN 				= -1,
   	EVENT_SRC_KEYBOARD				= 0,
   	EVENT_SRC_MOUSE					= 1,
   	EVENT_SRC_WHEEL					= 2,
   	EVENT_SRC_JOYSTICK				= 3,

	-- состо€ние элемента списка строк
   	ITEM_STATE_NORMAL				= 0,
   	ITEM_STATE_SELECTED				= 1,
   	ITEM_STATE_OVERROLED			= 2,
   	ITEM_STATE_SELECTED_OVERROLED	= 3,
   	ITEM_STATE_ALL					= 4,

	-- типы ресурсов
   	RES_INVALID			= -1,
   	RES_STRING			= 1,
   	RES_TEXTURE			= 2,
   	RES_WND_FRAME		= 4,
   	RES_OBJ				= 8,
   	RES_MOUSE_CURSOR	= 16,
   	RES_SCRIPT			= 32,
   	RES_PROTOTYPE		= 64,
   	RES_COLOR			= 128,
   	RES_SOUND			= 256,
   	RES_DYN_TEXTURE		= 512,
   	RES_EFFECT			= 1024,
   	RES_DEFAULT_STRING	= 2048,
   	RES_ALL				= 4095,

	-- стили окна ввода
   	ES_AUTOSCROLL		= 1,
   	ES_SELECT_ON_FOCUS	= 2,
	ES_PASS				= 4,
	ES_NUM				= 8,
	ES_MULTILINED		= 16,
	ES_READ_ONLY		= 32,

	-- стили окна скроллируемого текста
	TBS_HIDE_SCROLLBAR_WHEN_NO_SCROLL = 1,

	-- стили прогресс бара
   	PBS_LEFT_TO_RIGHT	= 1,
   	PBS_RIGHT_TO_LEFT	= 2,
   	PBS_TOP_TO_BOTTOM	= 4,
   	PBS_BOTTOM_TO_TOP	= 8,
   	PBS_TEXTURE_CLAMP	= 16,
   	PBS_TEXTURE_REPEAT	= 32,
   	PBS_TEXTURE_STRETCH	= 64,

	-- стили кнопок
   	BS_ENTER_AS_CLICK	= 1,
   	BS_SPACE_AS_CLICK	= 2,
   	BS_JOY_OK_AS_CLICK	= 4,

	-- стили чекбоксов
  	CHS_CHECK_ON_MOUSE_DOWN	= 1,
  	CHS_CHECK_ON_MOUSE_UP	= 2,
  	CHS_CHECK_ON_SPACE_DOWN	= 4,
  	CHS_CHECK_ON_SPACE_UP	= 8,
  	CHS_CHECK_ON_ENTER_DOWN	= 16,
  	CHS_CHECK_ON_ENTER_UP	= 32,
  	CHS_CHECK_ON_JOY_OK_DOWN= 64,
  	CHS_CHECK_ON_JOY_OK_UP	= 128,

	-- типы доставки сообщений
	DELIVER_THIS_FRAME	= 0,
	DELIVER_NEXT_FRAME	= 1,
	DELIVER_IMMEDIATE	= 2,

	-- невалидные значени€
	INVALID_UI_HANDLE		= -1,
	INVALID_RESOURCE_HANDLE	= -1,

	-- типы геймпада
	GAMEPAD_TYPE_XINPUT		= 0,
	GAMEPAD_TYPE_PS3		= 1,
	GAMEPAD_TYPE_OTHER		= 2,
	GAMEPAD_TYPE_MOVE		= 3,

	-- идентификаторы клавиш
	Keys =
	{
		KEY_BACKSPACE = 0x00,
    KEY_TAB = 0x01,
    KEY_CLEAR = 0x02,
    KEY_ENTER = 0x03,
    KEY_SHIFT = 0x04,
    KEY_CONTROL = 0x05,
    KEY_ALT = 0x06,
    KEY_PAUSE = 0x07,
    KEY_CAPSLOCK = 0x08,
    KEY_NUMLOCK = 0x09,
    KEY_SCROLL = 0x0A,
    KEY_ESCAPE = 0x0B,
    KEY_SPACE = 0x0C,
    KEY_PAGEUP = 0x0D,
    KEY_PAGEDOWN = 0x0E,
    KEY_END = 0x0F,
    KEY_HOME = 0x10,
    KEY_LEFT = 0x11,
    KEY_UP = 0x12,
    KEY_RIGHT = 0x13,
    KEY_DOWN = 0x14,
    KEY_INSERT = 0x15,
    KEY_DELETE = 0x16,
    KEY_PRINTSCREEN = 0x17,

    KEY_0 = 0x20,
    KEY_1 = 0x21,
    KEY_2 = 0x22,
    KEY_3 = 0x23,
    KEY_4 = 0x24,
    KEY_5 = 0x25,
    KEY_6 = 0x26,
    KEY_7 = 0x27,
    KEY_8 = 0x28,
    KEY_9 = 0x29,

    KEY_A = 0x30,
    KEY_B = 0x31,
    KEY_C = 0x32,
    KEY_D = 0x33,
    KEY_E = 0x34,
    KEY_F = 0x35,
    KEY_G = 0x36,
    KEY_H = 0x37,
    KEY_I = 0x38,
    KEY_J = 0x39,
    KEY_K = 0x3A,
    KEY_L = 0x3B,
    KEY_M = 0x3C,
    KEY_N = 0x3D,
    KEY_O = 0x3E,
    KEY_P = 0x3F,
    KEY_Q = 0x40,
    KEY_R = 0x41,
    KEY_S = 0x42,
    KEY_T = 0x43,
    KEY_U = 0x44,
    KEY_V = 0x45,
    KEY_W = 0x46,
    KEY_X = 0x47,
    KEY_Y = 0x48,
    KEY_Z = 0x49,

    KEY_LWIN = 0x50,
    KEY_RWIN = 0x51,
    KEY_APPS = 0x52,
    KEY_SLEEP = 0x53,

    KEY_NUMPAD0 = 0x60,
    KEY_NUMPAD1 = 0x61,
    KEY_NUMPAD2 = 0x62,
    KEY_NUMPAD3 = 0x63,
    KEY_NUMPAD4 = 0x64,
    KEY_NUMPAD5 = 0x65,
    KEY_NUMPAD6 = 0x66,
    KEY_NUMPAD7 = 0x67,
    KEY_NUMPAD8 = 0x68,
    KEY_NUMPAD9 = 0x69,
    KEY_MULTIPLY = 0x6A,
    KEY_ADD = 0x6B,
    KEY_SUBTRACT = 0x6C,
    KEY_DECIMAL = 0x6D,
    KEY_DIVIDE = 0x6E,

    KEY_F1 = 0x70,
    KEY_F2 = 0x71,
    KEY_F3 = 0x72,
    KEY_F4 = 0x73,
    KEY_F5 = 0x74,
    KEY_F6 = 0x75,
    KEY_F7 = 0x76,
    KEY_F8 = 0x77,
    KEY_F9 = 0x78,
    KEY_F10 = 0x79,
    KEY_F11 = 0x7A,
    KEY_F12 = 0x7B,
    KEY_F13 = 0x7C,
    KEY_F14 = 0x7D,
    KEY_F15 = 0x7E,
    KEY_F16 = 0x7F,
    KEY_F17 = 0x80,
    KEY_F18 = 0x81,
    KEY_F19 = 0x82,
    KEY_F20 = 0x83,
    KEY_F21 = 0x84,
    KEY_F22 = 0x85,
    KEY_F23 = 0x86,
    KEY_F24 = 0x87,

    KEY_BROWSER_BACK = 0x90,
    KEY_BROWSER_FORWARD = 0x91,
    KEY_BROWSER_REFRESH = 0x92,
    KEY_BROWSER_STOP = 0x93,
    KEY_BROWSER_SEARCH = 0x94,
    KEY_BROWSER_FAVORITES = 0x95,
    KEY_BROWSER_HOME = 0x96,
    KEY_VOLUME_MUTE = 0x97,
    KEY_VOLUME_DOWN = 0x98,
    KEY_VOLUME_UP = 0x99,
    KEY_MEDIA_NEXT_TRACK = 0x9A,
    KEY_MEDIA_PREV_TRACK = 0x9B,
    KEY_MEDIA_STOP = 0x9C,
    KEY_MEDIA_PLAY_PAUSE = 0x9D,
    KEY_LAUNCH_MAIL = 0x9E,
    KEY_LAUNCH_MEDIA_SELECT = 0x9F,
    KEY_LAUNCH_APP1 = 0xA0,
    KEY_LAUNCH_APP2 = 0xA1,

    KEY_SEMICOLON = 0xB0,
    KEY_PLUS = 0xB1,
    KEY_COMMA = 0xB2,
    KEY_MINUS = 0xB3,
    KEY_DOT = 0xB4,
    KEY_QUESTION = 0xB5,
    KEY_TILDE = 0xB6,
    KEY_LBRACKET = 0xB7,
    KEY_RBRACKET = 0xB8,
    KEY_BACKSLASH = 0xB9,
    KEY_APOSTROPHE = 0xBA,

    KEY_MOUSE_BUTTON1 = 0x100,
	KEY_MOUSE_BUTTON2 = 0x101,
	KEY_MOUSE_BUTTON3 = 0x102,
	KEY_MOUSE_BUTTON4 = 0x103,
	KEY_MOUSE_BUTTON5 = 0x104,
	KEY_MOUSE_BUTTON6 = 0x105,
	KEY_MOUSE_BUTTON7 = 0x106,
	KEY_MOUSE_BUTTON8 = 0x107,
	KEY_MOUSE_BUTTON9 = 0x108,

	KEY_MOUSE_WHEELUP = 0x10A,
	KEY_MOUSE_WHEELDOWN = 0x10B,

    KEY_XINPUT_BEGIN_KEYS = 0x110,
    KEY_XINPUT_DPAD_UP = 0x110,
    KEY_XINPUT_DPAD_DOWN = 0x111,
    KEY_XINPUT_DPAD_LEFT = 0x112,
    KEY_XINPUT_DPAD_RIGHT = 0x113,
    KEY_XINPUT_START = 0x114,
    KEY_XINPUT_BACK = 0x115,
    KEY_XINPUT_LEFT_THUMB = 0x116,
    KEY_XINPUT_RIGHT_THUMB = 0x117,
    KEY_XINPUT_LEFT_SHOULDER = 0x118,
    KEY_XINPUT_RIGHT_SHOULDER = 0x119,
    KEY_XINPUT_LEFT_TRIGGER = 0x11A,
    KEY_XINPUT_RIGHT_TRIGGER = 0x11B,
    KEY_XINPUT_A = 0x11C,
    KEY_XINPUT_B = 0x11D,
    KEY_XINPUT_X = 0x11E,
    KEY_XINPUT_Y = 0x11F,
    KEY_XINPUT_END_KEYS = 0x11F,

    KEY_CELL_BEGIN_KEYS = 0x130,
    KEY_CELL_DPAD_UP = 0x130,
    KEY_CELL_DPAD_DOWN = 0x131,
    KEY_CELL_DPAD_LEFT = 0x132,
    KEY_CELL_DPAD_RIGHT = 0x133,
    KEY_CELL_SELECT = 0x134,
    KEY_CELL_START = 0x135,
    KEY_CELL_L1 = 0x136,
    KEY_CELL_L2 = 0x137,
    KEY_CELL_L3 = 0x138,
    KEY_CELL_R1 = 0x139,
    KEY_CELL_R2 = 0x13A,
    KEY_CELL_R3 = 0x13B,
    KEY_CELL_SQUARE = 0x13C,
    KEY_CELL_CROSS = 0x13D,
    KEY_CELL_CIRCLE = 0x13E,
    KEY_CELL_TRIANGLE = 0x13F,
    KEY_CELL_END_KEYS = 0x13F,

    KEY_MOVE_BEGIN_KEYS = 0x150,
    KEY_MOVE_SQUARE = 0x150,
    KEY_MOVE_CROSS = 0x151,
    KEY_MOVE_CIRCLE = 0x152,
    KEY_MOVE_TRIANGLE = 0x153,
    KEY_MOVE_SELECT = 0x154,
    KEY_MOVE_START = 0x155,
    KEY_MOVE_MOVE = 0x156,
    KEY_MOVE_ANALOG = 0x157,
    KEY_MOVE_END_KEYS = 0x157,

    KEY_JOY_BEGIN_KEYS = 0x160,
    KEY_JOY_00 = 0x160,
    KEY_JOY_01 = 0x161,
    KEY_JOY_02 = 0x162,
    KEY_JOY_03 = 0x163,
    KEY_JOY_04 = 0x164,
    KEY_JOY_05 = 0x165,
    KEY_JOY_06 = 0x166,
    KEY_JOY_07 = 0x167,
    KEY_JOY_08 = 0x168,
    KEY_JOY_09 = 0x169,
    KEY_JOY_10 = 0x16A,
    KEY_JOY_11 = 0x16B,
    KEY_JOY_12 = 0x16C,
    KEY_JOY_13 = 0x16D,
    KEY_JOY_14 = 0x16E,
    KEY_JOY_15 = 0x16F,
    KEY_JOY_16 = 0x170,
    KEY_JOY_17 = 0x171,
    KEY_JOY_18 = 0x172,
    KEY_JOY_19 = 0x173,
    KEY_JOY_20 = 0x174,
    KEY_JOY_21 = 0x175,
    KEY_JOY_22 = 0x176,
    KEY_JOY_23 = 0x177,
    KEY_JOY_24 = 0x178,
    KEY_JOY_25 = 0x179,
    KEY_JOY_26 = 0x17A,
    KEY_JOY_27 = 0x17B,
    KEY_JOY_28 = 0x17C,
    KEY_JOY_29 = 0x17D,
    KEY_JOY_30 = 0x17E,
    KEY_JOY_31 = 0x17F,
    KEY_JOY_UP = 0x180,
    KEY_JOY_DOWN = 0x181,
    KEY_JOY_LEFT = 0x182,
    KEY_JOY_RIGHT = 0x183,
    KEY_JOY_END_KEYS = 0x183,

    KEY_UNDEFINED = 0x184,


		-- нет в коде
		EX_START		= 0x1000,

		KEY_LT						= 0x1000,
		KEY_RT						= 0x1001,
		KEY_LB						= 0x1002,
		KEY_RB						= 0x1003,

		KEY_LT1						= 0x1004,
		KEY_RT1						= 0x1005,
		KEY_LB1						= 0x1006,
		KEY_RB1						= 0x1007,

		EX_XINPUT_START				= 0x1008,
		EX_XINPUT_START_0			= 0x1008,

		KEY_XINPUT_STICK1_UP		= 0x1008,
		KEY_XINPUT_STICK1_DOWN		= 0x1009,
		KEY_XINPUT_STICK1_LEFT		= 0x100A,
		KEY_XINPUT_STICK1_RIGHT		= 0x100B,

		KEY_XINPUT_STICK2_UP		= 0x100C,
		KEY_XINPUT_STICK2_DOWN		= 0x100D,
		KEY_XINPUT_STICK2_LEFT		= 0x100E,
		KEY_XINPUT_STICK2_RIGHT		= 0x100F,

		EX_XINPUT_END_0				= 0x100F,

		EX_XINPUT_START_1			= 0x1010,

		KEY_XINPUT1_STICK1_UP		= 0x1010,
		KEY_XINPUT1_STICK1_DOWN		= 0x1011,
		KEY_XINPUT1_STICK1_LEFT		= 0x1012,
		KEY_XINPUT1_STICK1_RIGHT	= 0x1013,

		KEY_XINPUT1_STICK2_UP		= 0x1014,
		KEY_XINPUT1_STICK2_DOWN		= 0x1015,
		KEY_XINPUT1_STICK2_LEFT		= 0x1016,
		KEY_XINPUT1_STICK2_RIGHT	= 0x1017,

		EX_XINPUT_END_1				= 0x1017,

		EX_XINPUT_START_2			= 0x1018,

		KEY_XINPUT2_STICK1_UP		= 0x1018,
		KEY_XINPUT2_STICK1_DOWN		= 0x1019,
		KEY_XINPUT2_STICK1_LEFT		= 0x101a,
		KEY_XINPUT2_STICK1_RIGHT	= 0x101b,

		KEY_XINPUT2_STICK2_UP		= 0x101c,
		KEY_XINPUT2_STICK2_DOWN		= 0x101d,
		KEY_XINPUT2_STICK2_LEFT		= 0x101e,
		KEY_XINPUT2_STICK2_RIGHT	= 0x101f,

		EX_XINPUT_END_2				= 0x101f,
		EX_XINPUT_END				= 0x101f,

		EX_PS3_START				= 0x1020,
		EX_PS3_START_0				= 0x1020,

		KEY_CELL_STICK1_UP			= 0x1020,
		KEY_CELL_STICK1_DOWN		= 0x1021,
		KEY_CELL_STICK1_LEFT		= 0x1022,
		KEY_CELL_STICK1_RIGHT		= 0x1023,

		KEY_CELL_STICK2_UP			= 0x1024,
		KEY_CELL_STICK2_DOWN		= 0x1025,
		KEY_CELL_STICK2_LEFT		= 0x1026,
		KEY_CELL_STICK2_RIGHT		= 0x1027,

		EX_PS3_END_0				= 0x1027,

		EX_PS3_START_1				= 0x1028,

		KEY_CELL1_STICK1_UP			= 0x1028,
		KEY_CELL1_STICK1_DOWN		= 0x1029,
		KEY_CELL1_STICK1_LEFT		= 0x102a,
		KEY_CELL1_STICK1_RIGHT		= 0x102b,

		KEY_CELL1_STICK2_UP			= 0x102c,
		KEY_CELL1_STICK2_DOWN		= 0x102d,
		KEY_CELL1_STICK2_LEFT		= 0x102e,
		KEY_CELL1_STICK2_RIGHT		= 0x102f,

		EX_PS3_END_1				= 0x102f,

		EX_PS3_START_2				= 0x1030,

		KEY_CELL2_STICK1_UP			= 0x1030,
		KEY_CELL2_STICK1_DOWN		= 0x1031,
		KEY_CELL2_STICK1_LEFT		= 0x1032,
		KEY_CELL2_STICK1_RIGHT		= 0x1033,

		KEY_CELL2_STICK2_UP			= 0x1034,
		KEY_CELL2_STICK2_DOWN		= 0x1035,
		KEY_CELL2_STICK2_LEFT		= 0x1036,
		KEY_CELL2_STICK2_RIGHT		= 0x1037,

		EX_PS3_END_2				= 0x1037,
		EX_PS3_END					= 0x1037,
	
		EX_END						= 0x1037,
	}, 

	-- максимальные значени€, которые может принимать позици€ джойстика
    JOY_POS_MIN			= -1000,
    JOY_POS_MAX			= 1000,
	JOY_XINPUT_POS_MIN	= -32767,
	JOY_XINPUT_POS_MAX	= 32767,

	-- значени€, которые принимает контрол направлени€ джойстика
	JOY_POV_FW			= 0,
	JOY_POV_FW_RIGHT	= 4500,
	JOY_POV_RIGHT		= 9000,
	JOY_POV_BW_RIGHT	= 13500,
	JOY_POV_BW			= 18000,
	JOY_POV_BW_LEFT		= 22500,
	JOY_POV_LEFT		= 27000,
	JOY_POV_FW_LEFT		= 31500,


	-- типы параметров анимации
   	APARAM_WND_LEFT		= 0,
   	APARAM_WND_TOP		= 1,
   	APARAM_WND_WIDTH	= 2,
   	APARAM_WND_HEIGHT	= 3,
   	APARAM_LAYER_LEFT	= 4,
   	APARAM_LAYER_TOP	= 5,
   	APARAM_LAYER_WIDTH	= 6,
   	APARAM_LAYER_HEIGHT	= 7,
   	APARAM_LAYER_ALPHA	= 8,
   	APARAM_LAYER_COLOR	= 9,
   	APARAM_LAYER_U0		= 10,
   	APARAM_LAYER_V0		= 11,
   	APARAM_LAYER_U1		= 12,
   	APARAM_LAYER_V1		= 13,
   	APARAM_USER			= 14,

	-- типы интерпол€ции при анимации
	AINTERPOLATION_LINEAR	= 0,
	AINTERPOLATION_COLOR	= 1,
	AINTERPOLATION_NONE		= 2,

	-- blend modes
   	BM_NONE				= 0,
   	BM_COLOR			= 1,
   	BM_ALPHA			= 2,
	BM_COLOR_MODULATE	= 4,
	BM_SCREEN			= 13,

	-- enum TexWrap
	TW_WRAP_REPEAT		= 0,	-- repeating
	TW_WRAP_CLAMP		= 1,	-- clamping
	TW_WRAP_MIRROR		= 2,	-- mirroring
	TW_WRAP_BORDER		= 3,	-- black border
}

UI.EffectAnimParams =
{
	VISIBILITY		= 1,
	POS				= 2,
	SIZE			= 4,
	ALPHA			= 8,
	COLOR			= 16,
	ALIGNMENT		= 32,
	BLEND			= 64,
	FONT			= 128,
	BACK_COLOR		= 256,

	ALL				= 0xffffff,
}

UI.EffectObjAlignment =
{
	ALIGNMENT_LEFT		= 1,
	ALIGNMENT_HCENTER	= 2,
	ALIGNMENT_RIGHT		= 4,
	ALIGNMENT_HFULL		= 8,
	ALIGNMENT_TOP		= 16,
	ALIGNMENT_VCENTER	= 32,
	ALIGNMENT_BOTTOM	= 64,
}

-- aka virtual keys
UI.VKeys =
{
	ENTER		= 1,
	ESCAPE		= 2,
	SPACE		= 3,
	TAB			= 4,
	LEFT		= 5,
	RIGHT		= 6,
	UP			= 7,
	DOWN		= 8,
	HOME		= 9,
	END			= 10,
	DELETE		= 11,
	PAGEUP		= 12,
	PAGEDOWN	= 13,
	NUMPAD4		= 14,	-- left
	NUMPAD6		= 15,	-- right
	NUMPAD8		= 16,	-- up
	NUMPAD2		= 17,	-- down
	F1			= 18,
	LT			= 19,
	RT			= 20,
	LB			= 21,
	RB			= 22,
}

UI.VKeysHandlers =
{
    [ UI.VKeys.ENTER ]		= "OnEnter",
    [ UI.VKeys.ESCAPE ]		= "OnEscape",
    [ UI.VKeys.SPACE ]		= "OnSpace",
    [ UI.VKeys.TAB ]		= "OnTab",
    [ UI.VKeys.LEFT ]		= "OnLeft",
    [ UI.VKeys.RIGHT ]		= "OnRight",
    [ UI.VKeys.UP ]			= "OnUp",
    [ UI.VKeys.DOWN	]		= "OnDown",
    [ UI.VKeys.HOME	]		= "OnHome",
    [ UI.VKeys.END	]		= "OnEnd",
    [ UI.VKeys.DELETE ]		= "OnDelete",
    [ UI.VKeys.PAGEUP	]	= "OnPageUp",
    [ UI.VKeys.PAGEDOWN ]	= "OnPageDown",
    [ UI.VKeys.NUMPAD4 ]	= "OnNumpadLeft",
    [ UI.VKeys.NUMPAD6 ]	= "OnNumpadRight",
    [ UI.VKeys.NUMPAD8 ]	= "OnNumpadUp",
    [ UI.VKeys.NUMPAD2 ]	= "OnNumpadDown",
    [ UI.VKeys.F1 ]			= "OnF1",
	[ UI.VKeys.LT ]			= "OnLeftUp",
	[ UI.VKeys.RT ]			= "OnRightUp",
	[ UI.VKeys.LB ]			= "OnLeftDown",
	[ UI.VKeys.RB ]			= "OnRightDown",
}

-- map from real keys on various input devices to virtual keys
UI.key2VKey =
{
    [ UI.Keys.KEY_ENTER ]				= UI.VKeys.ENTER,
    [ UI.Keys.KEY_JOY_00 ]				= UI.VKeys.ENTER,
    [ UI.Keys.KEY_XINPUT_A ]			= UI.VKeys.ENTER,
	[ UI.Keys.KEY_CELL_CROSS ]			= UI.VKeys.ENTER,
	
    [ UI.Keys.KEY_ESCAPE ]				= UI.VKeys.ESCAPE,
    [ UI.Keys.KEY_JOY_02 ]				= UI.VKeys.ESCAPE,
    [ UI.Keys.KEY_XINPUT_B ]			= UI.VKeys.ESCAPE,
	[ UI.Keys.KEY_CELL_CIRCLE ]			= UI.VKeys.ESCAPE,

    [ UI.Keys.KEY_SPACE ]				= UI.VKeys.SPACE,
    [ UI.Keys.KEY_JOY_01 ]				= UI.VKeys.SPACE,
    [ UI.Keys.KEY_XINPUT_X ]			= UI.VKeys.SPACE,
	[ UI.Keys.KEY_CELL_SQUARE ]			= UI.VKeys.SPACE,

    [ UI.Keys.KEY_TAB ]					= UI.VKeys.TAB,
    [ UI.Keys.KEY_JOY_03 ]				= UI.VKeys.TAB,
    [ UI.Keys.KEY_XINPUT_Y ]			= UI.VKeys.TAB,
	[ UI.Keys.KEY_CELL_TRIANGLE ]		= UI.VKeys.TAB,

    [ UI.Keys.KEY_LEFT ]				= UI.VKeys.LEFT,
    [ UI.Keys.KEY_JOY_LEFT ]			= UI.VKeys.LEFT,
    [ UI.Keys.KEY_XINPUT_DPAD_LEFT ]	= UI.VKeys.LEFT,
	[ UI.Keys.KEY_CELL_DPAD_LEFT ]		= UI.VKeys.LEFT,
	[ UI.Keys.KEY_XINPUT_STICK1_LEFT ]	= UI.VKeys.LEFT,
	[ UI.Keys.KEY_CELL_STICK1_LEFT ]	= UI.VKeys.LEFT,

    [ UI.Keys.KEY_RIGHT ]				= UI.VKeys.RIGHT,
    [ UI.Keys.KEY_JOY_RIGHT ]			= UI.VKeys.RIGHT,
    [ UI.Keys.KEY_XINPUT_DPAD_RIGHT ]	= UI.VKeys.RIGHT,
	[ UI.Keys.KEY_CELL_DPAD_RIGHT ]		= UI.VKeys.RIGHT,
	[ UI.Keys.KEY_XINPUT_STICK1_RIGHT ]	= UI.VKeys.RIGHT,
	[ UI.Keys.KEY_CELL_STICK1_RIGHT ]	= UI.VKeys.RIGHT,

    [ UI.Keys.KEY_UP ]					= UI.VKeys.UP,
	[ UI.Keys.KEY_JOY_UP ]			= UI.VKeys.UP,
    [ UI.Keys.KEY_XINPUT_DPAD_UP ]		= UI.VKeys.UP,
	[ UI.Keys.KEY_CELL_DPAD_UP ]		= UI.VKeys.UP,
	[ UI.Keys.KEY_XINPUT_STICK1_UP ]	= UI.VKeys.UP,
	[ UI.Keys.KEY_CELL_STICK1_UP ]		= UI.VKeys.UP,

    [ UI.Keys.KEY_DOWN ]				= UI.VKeys.DOWN,
	[ UI.Keys.KEY_JOY_DOWN ]		= UI.VKeys.DOWN,
    [ UI.Keys.KEY_XINPUT_DPAD_DOWN ]	= UI.VKeys.DOWN,
	[ UI.Keys.KEY_CELL_DPAD_DOWN ]		= UI.VKeys.DOWN,
	[ UI.Keys.KEY_XINPUT_STICK1_DOWN ]	= UI.VKeys.DOWN,
	[ UI.Keys.KEY_CELL_STICK1_DOWN ]	= UI.VKeys.DOWN,

    [ UI.Keys.KEY_HOME ]				= UI.VKeys.HOME,

    [ UI.Keys.KEY_END ]					= UI.VKeys.END,

    [ UI.Keys.KEY_DELETE ]				= UI.VKeys.DELETE,

    [ UI.Keys.KEY_PAGEUP ]				= UI.VKeys.PAGEUP,
	[ UI.Keys.KEY_XINPUT_LEFT_SHOULDER ]	= UI.VKeys.PAGEUP,
	[ UI.Keys.KEY_CELL_L1 ] 			= UI.VKeys.PAGEUP,

    [ UI.Keys.KEY_PAGEDOWN ]			= UI.VKeys.PAGEDOWN,
	[ UI.Keys.KEY_XINPUT_RIGHT_SHOULDER ]= UI.VKeys.PAGEDOWN,
	[ UI.Keys.KEY_CELL_R1 ] 			= UI.VKeys.PAGEDOWN,

    [ UI.Keys.KEY_NUMPAD4 ]				= UI.VKeys.NUMPAD4,

    [ UI.Keys.KEY_NUMPAD6 ]				= UI.VKeys.NUMPAD6,

    [ UI.Keys.KEY_NUMPAD8 ]				= UI.VKeys.NUMPAD8,

    [ UI.Keys.KEY_NUMPAD2 ]				= UI.VKeys.NUMPAD2,

    [ UI.Keys.KEY_F1 ]					= UI.VKeys.F1,	

	[ UI.Keys.KEY_LT ]					= UI.VKeys.LT,
	[ UI.Keys.KEY_RT ]					= UI.VKeys.RT,
	[ UI.Keys.KEY_LB ]					= UI.VKeys.LB,
	[ UI.Keys.KEY_RB ]					= UI.VKeys.RB,	
}

UI.XINPUT_DEADZONE		= 7849
UI.PS3_DEADZONE			= 40


UI.engineEvents =
{
	-- событи€, которые не используютс€ в игре - закоментированны (см. функцию UI:SubscribeOnEngineEvents() в UiGameFuncs.lua)
	
	EVENT_START_LEVEL					= 50001,
	EVENT_END_LEVEL						= 50002,
	EVENT_OBJECTS_CLEARED				= 50003,
	EVENT_LOADING_SCREEN				= 50004,
	EVENT_PRECACHE_UI_LEVEL_DATA		= 50005,
	EVENT_END_SLIDESHOW					= 50006,

	EVENT_PLAYER_CONNECTED				= 50007,
	EVENT_PLAYER_DISCONNECTED			= 50008,
	EVENT_REMOTE_PLAYER_DISCONNECTED	= 50009,
	EVENT_PLAYER_READY					= 50010,
	EVENT_START_GAME_FAILED				= 50011,

	--EVENT_PLAYER_MODE_CHANGED			= 50012,
	EVENT_CREDITS_FINISHED				= 50013,
	--EVENT_PLAYER_DEAD					= 50014,

	EVENT_CINEMATIC_START				= 50015,
	EVENT_CINEMATIC_STOP				= 50016,
	EVENT_CINEMATIC_PHRASE				= 50017,
	EVENT_CINEMATIC_FADE				= 50018,
	EVENT_HUD_MSG						= 50019,
	
	EVENT_ON_ADD_PLAYER					= 50020,
	EVENT_ON_REMOVE_PLAYER				= 50021,
	EVENT_PLAYER_INFO_CHANGED			= 50022,
	EVENT_GAME_SETTING_CHANGED			= 50023,

	EVENT_PROFILE_CHANGED				= 50024,

	EVENT_SAVING						= 50025,
	EVENT_LIVE_SERVICES_RESULT			= 50026,
	EVENT_PROFILE_LOADED				= 50027,
	EVENT_PROFILE_START_SAVING			= 50028,
	EVENT_CONTENT_LOADED				= 50029,
	EVENT_CONTENT_UNLOADED				= 50030,

	EVENT_NETWORK_DISCONNECT			= 50031,

	EVENT_VIDEO_END						= 50032,
	EVENT_LEADERBOARD_RESULT			= 50033,
	EVENT_MP_SERVER_STOP				= 50034,
	
	--EVENT_CAMERA_ATTACHED				= 50035,
	--EVENT_CAMERA_DEATTACHED			= 50036,
	--EVENT_MOVE_ATTACHED				= 50037,
	--EVENT_MOVE_DEATTACHED				= 50038,
	--EVENT_MOVE_CALIBRATING_SUCCES		= 50039,
	--EVENT_MOVE_CALIBRATING_FAIL		= 50040,
	--EVENT_MOVE_NEED_RECALIBRATE		= 50041,
	
	EVENT_MASTER_SERVER_CONNECTED		= 50042,
	EVENT_MASTER_SERVER_DISCONNECTED	= 50043,

	--EVENT_MASTER_SERVER_JOIN_GAME		= 50044,
	
	EVENT_GAMEPLAY_RULES_INITIALIZED	= 50046,
	EVENT_PLAYER_STATUS_CHANGED			= 50047,

}
