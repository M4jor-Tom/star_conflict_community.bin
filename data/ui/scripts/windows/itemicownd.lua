-- ----------------------------------------------------------------------------
--
-- Workfile: itemicownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.ItemIcoWnd = {}
local ii = UI.ItemIcoWnd

ii.layers =
{
    MAIN_EFFECT							= 0, 
    BG_EFFECT							= 1, 
    ICO_MAIN_EFFECT						= 2,
    BIG_BG_EFFECT               		= 3, 
	SPEC_MODULE_ARROW_EFFECT			= 4, 
	INFLUENCE_COLOR_EFFECT				= 5, 
	COLOR_BG_EFFECT         			= 6, 
	COLOR_ENCHANTMENT_EFFECT			= 7,
	ICO_EFFECT							= 8,
	CUSTOMIZATION_PRESET_COLORS_EFFECT	= 9, 
	CUSTOMIZATION_PRESET_COLOR_1_EFFECT	= 10,
	CUSTOMIZATION_PRESET_COLOR_2_EFFECT	= 11,
	CUSTOMIZATION_PRESET_COLOR_3_EFFECT	= 12,
	AUTOGEN_EFFECT						= 13,
	AUTOGEN_AFFIX_1_EFFECT				= 14,
	AUTOGEN_AFFIX_2_EFFECT				= 15,
	UPGRADE_ARROW_EFFECT_2				= 16,
    RANKS_EFFECT						= 17, 
    RANKS								= 18,
    EQUIP_SHIP_EFFECT					= 19,
    COUNT_INVENTORY_EFFECT				= 20,
    COUNT_INVENTORY_VAL					= 21,
    COUNT_AMMO_EFFECT					= 22,
    COUNT_AMMO_VAL						= 23,
	COUNT_RESOURCES_EFFECT				= 24,
	COUNT_RESOURCES_VAL					= 25,
	NEW_EFFECT							= 26,
	NEW_TEXT							= 27,
	KEY_EFFECT							= 28,
	KEY_TEXT							= 29,
	CYBER_SPORT							= 30,
	LOCK_EFFECT							= 31,
	ENCHANTMENT_FRAME_EFFECT			= 32,
	COLOR2_FRAME_EFFECT					= 33,
	BLINK_EFFECT						= 34,
	ENCHANTMENT2_EFFECT					= 35,
	UPGRADE_ARROW_EFFECT				= 36,
	EMPTY_SLOT_EFFECT					= 37,
	EMPTY_SLOT_EFFECT_2					= 38,
	CLICKABLE_EFFECT					= 39,
	CHECKMARK_EFFECT					= 40,
	CHAIN_LEFT_ARROW_EFFECT				= 41,
	SELECT_EFFECT						= 42,
	SELECT2_EFFECT						= 43,
	NO_AMMO_EFFECT						= 44,
	DARKENING_EFFECT					= 45,
	INACTIVE_NODE_TEXT					= 46,
	IN_BATTLE_EFFECT					= 47,
	IN_BATTLE_TEXT						= 48,
	ON_SHIP_QUEST_EFFECT				= 49,
	MOUSE_OVER_EFFECT					= 50,
    BIG_MOUSE_OVER_EFFECT				= 51,
	UPGRADE_WOW_EFFECT					= 52,
}

-- ----------------------------------------
-- window definition
-- ----------------------------------------

UI.ItemIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ItemIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = ii.layers.IN_BATTLE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "itemIco_main",
				defaultAnimation	= "active",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico_frame",	
						layer		= "UI.ItemIcoWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "prod_icon",	
						layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "slot_lock",	
						layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "slot_select",	
						layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "slot_select",	
						layer		= "UI.ItemIcoWnd.layers.SELECT2_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "blackout",	
						layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "blackout",	
						layer		= "UI.ItemIcoWnd.layers.NO_AMMO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "in_battle",	
						layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "in_battle",	
						layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gold",	
						layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "upd_arrow",	
						layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "empty",	
						layer		= "UI.ItemIcoWnd.layers.EMPTY_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "add",	
						layer		= "UI.ItemIcoWnd.layers.EMPTY_SLOT_EFFECT_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "frame",	
						layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "qu_star",	
						layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "blink",	
						layer		= "UI.ItemIcoWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "mark_clickable",	
						layer		= "UI.ItemIcoWnd.layers.CLICKABLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "blink_flash",	
						layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "off_text",	
						layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "exclamatory1",	
						layer		= "UI.ItemIcoWnd.layers.CHECKMARK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "hierarchy",	
						layer		= "UI.ItemIcoWnd.layers.CHAIN_LEFT_ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
					
					{
						objName		= "bg_2",
						layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_bg",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_ico",
				defaultAnimation	= "inactive",

				links =
				{
					{
						objName		= "tier",	
						layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ship_ico",	
						layer		= "UI.ItemIcoWnd.layers.EQUIP_SHIP_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count_1",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_INVENTORY_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count_2",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_AMMO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count_3",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_RESOURCES_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "buff_icon",	
						layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "color_slot",
						layer		= "UI.ItemIcoWnd.layers.CUSTOMIZATION_PRESET_COLORS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "over",	
						layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "new",	
						layer		= "UI.ItemIcoWnd.layers.NEW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "key",	
						layer		= "UI.ItemIcoWnd.layers.KEY_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "marker",	
						layer		= "UI.ItemIcoWnd.layers.COLOR_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "marker_2",	
						layer		= "UI.ItemIcoWnd.layers.COLOR_ENCHANTMENT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg",	
						layer		= "UI.ItemIcoWnd.layers.BIG_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg",	
						layer		= "UI.ItemIcoWnd.layers.SPEC_MODULE_ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over_big",	
						layer		= "UI.ItemIcoWnd.layers.BIG_MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "ks",
						layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "agen_icon",
						layer		= "UI.ItemIcoWnd.layers.AUTOGEN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- BIG_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_bigBg",
				defaultAnimation	= "idle",
			}}
		},   
		
		-- SPEC_MODULE_ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_bigBg",
				defaultAnimation	= "idle",
			}}
		},
		
		-- INFLUENCE_COLOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			
			effects =
			{{
				defName 			= "itemIco_influenceColor",
				defaultAnimation	= "active",
			}}
		},
		
		-- COLOR_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_colorBg",
				defaultAnimation	= "idle",
			}}
		},   

		-- COLOR_ENCHANTMENT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_colorEnchantment",
				defaultAnimation	= "idle",
			}}
		},   

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "spellIco",
				defaultAnimation	= "color",
			}}
		},

		-- CUSTOMIZATION_PRESET_COLORS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_presetColors",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "color_1",
						layer		= "UI.ItemIcoWnd.layers.CUSTOMIZATION_PRESET_COLOR_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "color_2",
						layer		= "UI.ItemIcoWnd.layers.CUSTOMIZATION_PRESET_COLOR_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "color_3",
						layer		= "UI.ItemIcoWnd.layers.CUSTOMIZATION_PRESET_COLOR_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CUSTOMIZATION_PRESET_COLOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_presetColor1",
				defaultAnimation	= "idle",
			}}
		},

		-- CUSTOMIZATION_PRESET_COLOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_presetColor2",
				defaultAnimation	= "idle",
			}}
		},

		-- CUSTOMIZATION_PRESET_COLOR_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_presetColor3",
				defaultAnimation	= "idle",
			}}
		},
		
		-- AUTOGEN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_autogenMain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "icon_1",
						layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon_2",
						layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- AUTOGEN_AFFIX_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_autogen_affix1",
				defaultAnimation	= "idle",
			}}
		},
		
		-- AUTOGEN_AFFIX_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_autogen_affix2",
				defaultAnimation	= "idle",
			}}
		},
		
		-- UPGRADE_ARROW_EFFECT_2
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- RANKS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_shopTypeTier",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.ItemIcoWnd.layers.RANKS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- RANKS
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- EQUIP_SHIP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_equipShip",
				defaultAnimation	= "idle",
			}}
		},

		-- COUNT_INVENTORY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_countInventory",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_INVENTORY_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				} 
			}}
		}, 

		-- COUNT_INVENTORY_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- COUNT_AMMO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_countAmmo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_AMMO_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				} 
			}}
		}, 

		-- COUNT_AMMO_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- COUNT_RESOURCES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_countResources",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ItemIcoWnd.layers.COUNT_RESOURCES_VAL",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},
				} 
			}}
		}, 

		-- COUNT_RESOURCES_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_new",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ItemIcoWnd.layers.NEW_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NEW_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_new"
		},

		-- KEY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_key",
				defaultAnimation	= "select",

				links =
				{
					{
						objName		= "number",	
						layer		= "UI.ItemIcoWnd.layers.KEY_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- KEY_TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_new"
		},   
		
		-- CYBER_SPORT
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "itemIco_cyberSport" ),
		},

		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_lock",
				defaultAnimation	= "idle",
			}}
		},

		-- ENCHANTMENT_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_enchantmentFrame",
				defaultAnimation	= "active",
			}}
		},	

		-- COLOR2_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_color2Frame",
				defaultAnimation	= "active",
			}}
		},	

		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_blink",
				defaultAnimation	= "idle",
			}}
		},	

		-- ENCHANTMENT2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_enchantment2",
				defaultAnimation	= "active",
			}}
		},

		-- UPGRADE_ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_upgradeArrow",
				defaultAnimation	= "idle",
			}}
		},

		-- EMPTY_SLOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_emptySlot",
				defaultAnimation	= "idle",
			}}
		},

		-- EMPTY_SLOT_EFFECT_2
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_emptySlot2",
				defaultAnimation	= "idle",
			}}
		},

		-- CLICKABLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_clickable",
				defaultAnimation	= "idle",
			}}
		},	

		-- CHECKMARK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_checkmark",
				defaultAnimation	= "tick",
			}}
		},

		-- CHAIN_LEFT_ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_chainLeftArrow",
				defaultAnimation	= "active",
			}}
		},

		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_select",
				defaultAnimation	= "idle",
			}}
		},

		-- SELECT2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_select",
				defaultAnimation	= "idle_2",
			}}
		},

		-- NO_AMMO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_noAmmo",
				defaultAnimation	= "cross",
			}}
		},

		-- DARKENING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_darkening",
				defaultAnimation	= "inactive",
			}}
		},

		-- INACTIVE_NODE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_inBattle",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_buy",	
						layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- IN_BATTLE_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^inBattle"
		},    

		-- ON_SHIP_QUEST_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_onQuest",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_mouseOver",
				defaultAnimation	= "idle",
			}}
		},

		-- BIG_MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_bigMouseOver",
				defaultAnimation	= "idle",
			}}
		},

		-- UPGRADE_WOW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemIco_upgradeWow",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.ItemIcoWnd:SetupForItem( defName, bEnchanted )

	local bAutogen = UI:IsDefAutogen( defName )
	local autogenItem = nil
	
	if bAutogen then
	
		autogenItem = UI:GetAutogenItem( defName )
		
		if autogenItem then
			self:ShowAutogen( autogenItem.rollData )
		else
			sys.log( "UI.ItemIcoWnd:SetupForItem()[ERROR]: cannot find autogenItem for '%s'", defName )
		end
	else
		self:SetupIcoForItem( defName )
	end
	
	self:SetupRank( defName, true, nil )
	self:ShowInfluenceColor( UI:GetItemInfluenceColor( defName ) )
	
	if not UI:IsDefBundle( defName ) then	-- #0100859 - бандлы без цвета
		self:ShowColorBg2( UI:GetItemColor( defName ), bEnchanted )
	end
	
	if UI:IsDefModule( defName ) or UI:IsDefAmmo( defName ) then
		self:SetupCyberSport( defName, autogenItem )
	end
	
end


--
function UI.ItemIcoWnd:SetupForAutogenItemNotRolled( autogenClassId, rank )

	self:Reset()
	
	if type( autogenClassId ) ~= "number" then
		sys.log( "UI.ItemIcoWnd:SetupForAutogenItemNotRolled()[ERROR]: invalid type of the 1-st param ('autogenClassId'); 'number' expected, got '%s'", type( autogenClassId ) )
		return
	end
	
	if type( rank ) ~= "number" then
		sys.log( "UI.ItemIcoWnd:SetupForAutogenItemNotRolled()[ERROR]: invalid type of the 2-nd param ('rank'); 'number' expected, got '%s'", type( rank ) )
		return
	end
	
	local defName = UI.autogenDefaultDefName
	
	self:SetupIcoForItem( defName )
	self:ShowInfluenceColor( UI:GetItemInfluenceColor( defName ) )
	self:ShowColorBg2( UI:GetItemColor( defName ), false )
	self:SetupCyberSport( defName, nil )
	
	-- rank
	local minRank = rank
	local maxRank = minRank	-- SC-112483 Для автогено всегда показывается только минимальный ранг
	self:SetupRanksMinMax( minRank, maxRank, bFit, color )
	
	self.ranksData =
	{
		minRank	= minRank,
		maxRank	= maxRank,
		bFit	= true,
		color	= nil,
	}
	
end


--
function UI.ItemIcoWnd:Reset()

	self:ShowMain()
	self:AnimateMainIdle()
	self:HideBackground()
	self:HideEquipShip()
	self:HideCount()
	self:HideRank()
	self:HideIco()
	self:HideNew()
	self:HideMouseOver()
	self:HideLock()
	self:HideSelection()
	self:HideDarkening()
	self:ShowIcoMain()
	self:AnimateIcoIdle()
	self:HideKey()
	self:HideInBattleEffect()
	self:HideInBattleText()
	self:HideOnShipQuestEffect()
	self:HideColorBg()
	self:HideNoAmmo()
	self:HideUpgradeArrow()
	self:HideUpgradeArrow2()
	self:HideEmptySlotEffect()
	self:HideEmptySlotEffect2()
	self:HideColorBg2()
	self:HideBlinkEffect()
	self:HideClickableEffect()
	self:HideUpgradeItemWowEffect()
	self:SetRegularSize()
	self:HideBigBg()
	self:HideSpecModuleArrow()
	self:HideBigMouseOver()
	self:HideInactiveNode()
	self:HideNotLearnedNode()
	self:HideCheckmark()
	self:HideChainLeftArrow()
	self:HideSelection2()
	self:HideInfluenceColor()
	self:HideCybersport()
	self:HideShipCustomizationPresetColors()
	self:HideAutogen()
	self.tipData = nil

end


--
function UI.ItemIcoWnd:AnimateMainIdle()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.ItemIcoWnd:AnimateMainDD()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animDD )
	end

end


--
function UI.ItemIcoWnd:AnimateMainInactive()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animInactive )
	end

end


--
function UI.ItemIcoWnd:ShowMain()

	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )

end


--
function UI.ItemIcoWnd:HideMain()

	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )

end


--
function UI.ItemIcoWnd:ShowBackground()

	self:SetLayerVisible( true, self.layers.BG_EFFECT )

end


--
function UI.ItemIcoWnd:HideBackground()

	self:SetLayerVisible( false, self.layers.BG_EFFECT )

end


--
function UI.ItemIcoWnd:AnimateIcoIdle()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.icoMain.animIdle )
	end

end


--
function UI.ItemIcoWnd:AnimateIcoSel()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.icoMain.animSel )
	end

end


--
function UI.ItemIcoWnd:AnimateIcoDisabled()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.icoMain.animDisabled )
	end

end


--
function UI.ItemIcoWnd:AnimateIcoIdleAlien()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.icoMain.animIdleAlien )
	end

end


--
function UI.ItemIcoWnd:AnimateIcoSelAlien()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.icoMain.animSelAlien )
	end

end


--
function UI.ItemIcoWnd:SetupIcoForItem( defName )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( UI.WHITE_COLOR )	-- цвет иконки может меняться при отображении кастомизации корабля
	end

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )
	UI:UpdateItemIco( defName, self, self.layers.ICO_EFFECT, false )

end


--
function UI.ItemIcoWnd:SetupIco( hTex )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( UI.WHITE_COLOR )	-- цвет иконки может меняться при отображении кастомизации корабля
	end

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )
	UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

end


--
function UI.ItemIcoWnd:HideIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( UI.WHITE_COLOR )	-- цвет иконки может меняться при отображении кастомизации корабля
		UI:ResetItemIco( self, self.layers.ICO_EFFECT )	-- здесь освобождлаются текстуры; это важно, если текстуры потом нужно будет выгрузить, как в случае с наклейками для кастомизации корабля
	end

	self:SetLayerVisible( false, self.layers.ICO_EFFECT )

end


--
function UI.ItemIcoWnd:ShowIcoMain()

	self:SetLayerVisible( true, self.layers.ICO_MAIN_EFFECT )

end


--
function UI.ItemIcoWnd:HideIcoMain()

	self:SetLayerVisible( false, self.layers.ICO_MAIN_EFFECT )

end


--
function UI.ItemIcoWnd:SetupRank( defName, bFit, color )

	local minRank = UI:GetItemEquipMinRank( defName )
	local maxRank = UI:GetItemEquipMaxRank( defName )
	
	-- SC-112483 Для автогена всегда показывается только минимальный ранг
	if UI:IsDefAutogen( defName ) then
		maxRank = minRank 
	end
	
	self:SetupRanksMinMax( minRank, maxRank, bFit, color )
	
	self.ranksData =
	{
		minRank	= minRank,
		maxRank	= maxRank,
		bFit	= bFit,
		color	= color,
	}

end


--
function UI.ItemIcoWnd:HideRank()

	self:SetLayerVisible( false, self.layers.RANKS_EFFECT )
	self:SetLayerVisible( false, self.layers.RANKS )

	self.ranksData = nil

end


--
function UI.ItemIcoWnd:HideEquipShip()

	self:SetLayerVisible( false, self.layers.EQUIP_SHIP_EFFECT )

end


--
function UI.ItemIcoWnd:SetupEquipShip( equipShipDefName )

	if not equipShipDefName or equipShipDefName == "" then
		self:SetLayerVisible( false, self.layers.EQUIP_SHIP_EFFECT )
		return
	end

	self:SetLayerVisible( true, self.layers.EQUIP_SHIP_EFFECT )

	local shipEffect = UI:GetEffectFromLayer( self, self.layers.EQUIP_SHIP_EFFECT )
	if not shipEffect then
		return
	end
	
	local hTex = UI:GetShipSmallIco( equipShipDefName )
	shipEffect:SetSpriteTexture( self.effectInfo.equipShip.icoSpriteName, hTex )

end


--
function UI.ItemIcoWnd:SetCountInventory( count )

	self:HideCount()

	self:SetLayerVisible( true, self.layers.COUNT_INVENTORY_EFFECT )
	self:SetLayerVisible( true, self.layers.COUNT_INVENTORY_VAL )

	local str = UI:Num2StrSeparatedBy3( count )
	self:SetText( str, self.layers.COUNT_INVENTORY_VAL )

end


--
function UI.ItemIcoWnd:SetCountInventoryText( str )

	self:HideCount()

	self:SetLayerVisible( true, self.layers.COUNT_INVENTORY_EFFECT )
	self:SetLayerVisible( true, self.layers.COUNT_INVENTORY_VAL )

	self:SetText( str, self.layers.COUNT_INVENTORY_VAL )

end


--
function UI.ItemIcoWnd:SetCountAmmo( count, countMax )

	self:HideCount()

	self:SetLayerVisible( true, self.layers.COUNT_AMMO_EFFECT )
	self:SetLayerVisible( true, self.layers.COUNT_AMMO_VAL )

	local str = count and string.format( "%s/%s", tostring( count ), tostring( countMax ) ) or tostring( countMax )
	self:SetText( str, self.layers.COUNT_AMMO_VAL )

end


--
function UI.ItemIcoWnd:SetCountResources( count, color )

	local str = UI:Num2StrSeparatedBy3( count )
	self:SetCountResourcesText( str, color )

end


--
function UI.ItemIcoWnd:SetCountResourcesText( str, color )

	self:HideCount()

	self:SetLayerVisible( true, self.layers.COUNT_RESOURCES_EFFECT )
	self:SetLayerVisible( true, self.layers.COUNT_RESOURCES_VAL )
	
	local countResourceEffect = UI:GetEffectFromLayer( self, self.layers.COUNT_RESOURCES_EFFECT )

	if not color then
		color = countResourceEffect and countResourceEffect:GetObjColor( self.effectInfo.countResource.valLocator ) or UI.TEXT_BASE_COLOR
	end
	
	local alpha = countResourceEffect and countResourceEffect:GetAlpha() or 255
	color = UI:SetAlpha( color, alpha )

	self:SetColor( color, self.layers.COUNT_RESOURCES_VAL )	

	self:SetText( str, self.layers.COUNT_RESOURCES_VAL )

end


--
function UI.ItemIcoWnd:HideCount()

	self:SetLayerVisible( false, self.layers.COUNT_INVENTORY_EFFECT )
	self:SetLayerVisible( false, self.layers.COUNT_INVENTORY_VAL )
	self:SetLayerVisible( false, self.layers.COUNT_AMMO_EFFECT )
	self:SetLayerVisible( false, self.layers.COUNT_AMMO_VAL )
	self:SetLayerVisible( false, self.layers.COUNT_RESOURCES_EFFECT )
	self:SetLayerVisible( false, self.layers.COUNT_RESOURCES_VAL )

end


--
function UI.ItemIcoWnd:ShowNew()

	self:SetLayerVisible( true, self.layers.NEW_EFFECT )
	self:SetLayerVisible( true, self.layers.NEW_TEXT )

end


--
function UI.ItemIcoWnd:HideNew()

	self:SetLayerVisible( false, self.layers.NEW_EFFECT )
	self:SetLayerVisible( false, self.layers.NEW_TEXT )

end


--
function UI.ItemIcoWnd:ShowMouseOver()

	self:SetLayerVisible( true, self.layers.MOUSE_OVER_EFFECT )	

end


--
function UI.ItemIcoWnd:HideMouseOver()

	self:SetLayerVisible( false, self.layers.MOUSE_OVER_EFFECT )	

end


--
function UI.ItemIcoWnd:IsMouseOver()

	return self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT ) or self:IsLayerVisible( self.layers.BIG_MOUSE_OVER_EFFECT )

end


--
function UI.ItemIcoWnd:ShowLock()

	self:SetLayerVisible( true, self.layers.LOCK_EFFECT )

end


--
function UI.ItemIcoWnd:HideLock()

	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )

end


--
function UI.ItemIcoWnd:ShowSelection()

	self:SetLayerVisible( true, self.layers.SELECT_EFFECT )

end


--
function UI.ItemIcoWnd:HideSelection()

	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )

end


--
function UI.ItemIcoWnd:ShowEmptySlotEffect()	

	self:SetLayerVisible( true, self.layers.EMPTY_SLOT_EFFECT )

end


--
function UI.ItemIcoWnd:HideEmptySlotEffect()	

	self:SetLayerVisible( false, self.layers.EMPTY_SLOT_EFFECT )

end


--
function UI.ItemIcoWnd:ShowEmptySlotEffect2()

	self:SetLayerVisible( true, self.layers.EMPTY_SLOT_EFFECT_2 )

end


--
function UI.ItemIcoWnd:HideEmptySlotEffect2()

	self:SetLayerVisible( false, self.layers.EMPTY_SLOT_EFFECT_2 )

end


--
function UI.ItemIcoWnd:ShowBlinkffect()

	self:SetLayerVisible( true, self.layers.BLINK_EFFECT )

	local blinkEffect = UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT )
	if blinkEffect then
		blinkEffect:SetAnimationTimeAndUpdate( 0 )
	end	

end


--
function UI.ItemIcoWnd:HideBlinkEffect()

	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

end


--
function UI.ItemIcoWnd:SetTooltipData( tipData )

	self.tipData = tipData

end


--
function UI.ItemIcoWnd:GetTooltipData()

	return self.tipData

end


--
function UI.ItemIcoWnd:ShowDarkening()

	self:SetLayerVisible( true, self.layers.DARKENING_EFFECT )

end


--
function UI.ItemIcoWnd:HideDarkening()

	self:SetLayerVisible( false, self.layers.DARKENING_EFFECT )

end


--
function UI.ItemIcoWnd:ShowNoAmmo()

	self:SetLayerVisible( true, self.layers.NO_AMMO_EFFECT )

end


--
function UI.ItemIcoWnd:HideNoAmmo()

	self:SetLayerVisible( false, self.layers.NO_AMMO_EFFECT )

end


--
function UI.ItemIcoWnd:ShowKey()

	self:SetLayerVisible( true, self.layers.KEY_EFFECT )
	self:SetLayerVisible( true, self.layers.KEY_TEXT )

end


--
function UI.ItemIcoWnd:HideKey()

	self:SetLayerVisible( false, self.layers.KEY_EFFECT )
	self:SetLayerVisible( false, self.layers.KEY_TEXT )

end  


--
function UI.ItemIcoWnd:SetKey( strKey )

	self:SetText( strKey, self.layers.KEY_TEXT )

end


--
function UI.ItemIcoWnd:ShowInBattleEffect()

	self:SetLayerVisible( true, self.layers.IN_BATTLE_EFFECT )

end


--
function UI.ItemIcoWnd:HideInBattleEffect()

	self:SetLayerVisible( false, self.layers.IN_BATTLE_EFFECT )

end


--
function UI.ItemIcoWnd:ShowInBattleText()

	self:SetLayerVisible( true, self.layers.IN_BATTLE_TEXT )

end


--
function UI.ItemIcoWnd:HideInBattleText()

	self:SetLayerVisible( false, self.layers.IN_BATTLE_TEXT )

end


--
function UI.ItemIcoWnd:ShowOnShipQuestEffect()

	self:SetLayerVisible( true, self.layers.ON_SHIP_QUEST_EFFECT )

end


--
function UI.ItemIcoWnd:HideOnShipQuestEffect()

	self:SetLayerVisible( false, self.layers.ON_SHIP_QUEST_EFFECT )

end


--
function UI.ItemIcoWnd:ShowColorBg( color, bEnchantment )

	if bEnchantment == nil then
		bEnchantment = false
	end

	self:SetLayerVisible( true, self.layers.COLOR_BG_EFFECT )
	self:SetLayerVisible( bEnchantment, self.layers.COLOR_ENCHANTMENT_EFFECT )	

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_BG_EFFECT )
	if bgEffect then

		local bgColor = color
		if bEnchantment then
			bgColor = UI:GetPremiumItemColor( false )
		end

		bgEffect:SetColor( bgColor )

	end

	local enchantmentEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_ENCHANTMENT_EFFECT )	
	if enchantmentEffect then
		enchantmentEffect:SetColor( color )
	end

	self:SetLayerVisible( bEnchantment, self.layers.ENCHANTMENT_FRAME_EFFECT )

end


--
function UI.ItemIcoWnd:HideColorBg()

	self:SetLayerVisible( false, self.layers.COLOR_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.COLOR_ENCHANTMENT_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT_FRAME_EFFECT )

end


--
function UI.ItemIcoWnd:ShowColorBg2( color, bEnchantment )

	if bEnchantment == nil then
		bEnchantment = false
	end

	self:SetLayerVisible( true, self.layers.COLOR2_FRAME_EFFECT )

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.COLOR2_FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( color )
	end

	self:SetLayerVisible( bEnchantment, self.layers.ENCHANTMENT2_EFFECT )

end


--
function UI.ItemIcoWnd:HideColorBg2()

	self:SetLayerVisible( false, self.layers.COLOR2_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT2_EFFECT )

end



--
function UI.ItemIcoWnd:GetOrg()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjPos( self.effectInfo.main.orgLocator ) or UI:ZeroVec2()

end


--
function UI.ItemIcoWnd:ShowUpgradeArrow()

	self:SetLayerVisible( true, self.layers.UPGRADE_ARROW_EFFECT )

end


--
function UI.ItemIcoWnd:HideUpgradeArrow()

	self:SetLayerVisible( false, self.layers.UPGRADE_ARROW_EFFECT )

end


--
function UI.ItemIcoWnd:ShowUpgradeArrow2()

	self:SetLayerVisible( true, self.layers.UPGRADE_ARROW_EFFECT_2 )
	
	if self.upgradeArrowBtnPrototype ~= "" then
	
		if not self.upgradeArrowBtn then
			self.upgradeArrowBtn = UI:CreateChildWnd( self, UI[ self.upgradeArrowBtnPrototype ], "" )
		end

		local upgradeArrowEffect = UI:GetEffectFromLayer( self, self.layers.UPGRADE_ARROW_EFFECT_2 )
		UI:AddChildAndLink( self, self.upgradeArrowBtn, upgradeArrowEffect, self.effectInfo.upgradeArow2.btnLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		
	else
		sys.log( "UI.ItemIcoWnd:ShowUpgradeArrow2()[ERROR]: no self.upgradeArrowBtnPrototype" )
	end
	
	self:SetBigSize_upgradeArrow()

end


--
function UI.ItemIcoWnd:HideUpgradeArrow2()

	self:SetLayerVisible( false, self.layers.UPGRADE_ARROW_EFFECT_2 )
	
	if self.upgradeArrowBtn then
		self.upgradeArrowBtn:UnlinkFromParent()
	end
	
	self:SetRegularSize()

end


--
function UI.ItemIcoWnd:OnItemRankModeOptionChanged()

	if self.ranksData then
		self:SetupRanksMinMax( self.ranksData.minRank, self.ranksData.maxRank, self.ranksData.bFit, self.ranksData.color )
	end
	
end


--
function UI.ItemIcoWnd:ShowClickableEffect()

	self:SetLayerVisible( true, self.layers.CLICKABLE_EFFECT )

end


--
function UI.ItemIcoWnd:HideClickableEffect()

	self:SetLayerVisible( false, self.layers.CLICKABLE_EFFECT )

end


--
function UI.ItemIcoWnd:ShowUpgradeItemWowEffect()

	self:SetLayerVisible( true, self.layers.UPGRADE_WOW_EFFECT )

	local upgradeWowEffect = UI:GetEffectFromLayer( self, self.layers.UPGRADE_WOW_EFFECT )
	if upgradeWowEffect then
		upgradeWowEffect:RestartAnimation()
	end

end


--
function UI.ItemIcoWnd:HideUpgradeItemWowEffect()

	self:SetLayerVisible( false, self.layers.UPGRADE_WOW_EFFECT )

end


--
function UI.ItemIcoWnd:ShowBigBg()

	self:SetLayerVisible( true, self.layers.BIG_BG_EFFECT )
	self:SetBigSize()

end


--
function UI.ItemIcoWnd:HideBigBg()

	self:SetLayerVisible( false, self.layers.BIG_BG_EFFECT )
	self:SetRegularSize()
	
end


-- в новой версии иконок это используется вместо ShowBigBg(), т.е. стрелка без фона
function UI.ItemIcoWnd:ShowSpecModuleArrow()

	self:SetLayerVisible( true, self.layers.SPEC_MODULE_ARROW_EFFECT )
	self:SetBigSize()

end


--
function UI.ItemIcoWnd:HideSpecModuleArrow()

	self:SetLayerVisible( false, self.layers.SPEC_MODULE_ARROW_EFFECT )
	self:SetRegularSize()
	
end


--
function UI.ItemIcoWnd:ShowBigMouseOver()

	self:SetLayerVisible( true, self.layers.BIG_MOUSE_OVER_EFFECT )

end


--
function UI.ItemIcoWnd:HideBigMouseOver()

	self:SetLayerVisible( false, self.layers.BIG_MOUSE_OVER_EFFECT )

end


-- для кастомизируемого спецмодуля, т.е. если показывается BIG_BG_EFFECT(старая версия) или SPEC_MODULE_ARROW_EFFECT(новая версия)
function UI.ItemIcoWnd:SetBigSize()

	local icoMainEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )	
	local size = icoMainEffect and icoMainEffect:GetObjSize( self.effectInfo.icoMain.bigSelfLocator ) or UI:Vec2( 0, 0 )
	
	self:SetWidth( size.x )
	self:SetHeight( size.y )

end


--
function UI.ItemIcoWnd:SetBigSize_upgradeArrow()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local size = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.bigSelfLocator_upgradeArrow ) or UI:Vec2( 0, 0 )
	
	self:SetWidth( size.x )
	self:SetHeight( size.y )
	
end


--
function UI.ItemIcoWnd:SetRegularSize()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	local size = mainEffect and mainEffect:GetObjSize( "self" ) or 0 UI:Vec2( 0, 0 )
	
	self:SetWidth( size.x )
	self:SetHeight( size.y )

end


--
function UI.ItemIcoWnd:ShowInactiveNode( nodeName, shipDefName, chosenNodesMask )

	if type( nodeName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:ShowInactiveNode()[ERROR]: invalid type pf the 1-st parameter (\"nodeName\"); \"string\" expected, got \"%s\"", type( nodeName ) )
		nodeName = ""
	end

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:ShowInactiveNode()[ERROR]: invalid type pf the 2-nd parameter (\"shipDefName\"); \"string\" expected, got \"%s\"", type( shipDefName ) )
		shipDefName = ""
	end

	if chosenNodesMask ~= nil then
    	if type( chosenNodesMask ) ~= "userdata" then
    		sys.log( "UI.ItemIcoWnd:ShowInactiveNode()[ERROR]: invalid type of the 3-rd parameter (\"chosenNodesMask\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( chosenNodesMask ) )
    		chosenNodesMask = nil
    	end
	end

	self:SetLayerVisible( true, self.layers.INACTIVE_NODE_TEXT )

	local str = UI:GetStringByName( "itemIco_shipNodeInactive" )
	local linkColor = self:GetColor( self.layers.INACTIVE_NODE_TEXT )
	local strLink = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", colorSel=%u, colorUnsel=%u}]$", str, linkColor, linkColor )

	self.inactiveNodeMetaText:SetText( strLink, true )


	-- тултип
	-- не передается в инициализиурющей строке метатекста, а устанавливается руками,
	-- чтобы избежать конфликта, если в локализованном тексте окажутся кавычки или другие спецсимволы, используемые метатекстом

	local strTooltipText = UI:GetStringByName( "itemIco_shipNodeInactive_tooltip_text" )

	local tooltipBaseColor = UI.TooltipWnd_shared:GetTextColor()
	local strNodeNameLocalized = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), UI:EvolvingShipNode2Str( nodeName, shipDefName, chosenNodesMask, UI.TEXT_SEL_COLOR ), UI:Color2Str( tooltipBaseColor ) )

	local numSubst = 0
	strTooltipText, numSubst = string.gsub( strTooltipText, "%$node%$", strNodeNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.ItemIcoWnd:ShowInactiveNode()[ERROR]: cannot find placeholder \"$node$\" in string \"itemIco_shipNodeInactive_tooltip_text\"" )
		strTooltipText = string.format( "[INVALID_STRING] Activate node %s to unlock", strNodeNameLocalized )
	end	

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "itemIco_shipNodeInactive_tooltip_caption" ),
		text		= strTooltipText,
	}

	local item = self.inactiveNodeMetaText.items and self.inactiveNodeMetaText.items[ 1 ]
	if item and item.itemType == UI.MetaText.itemTypes.WND then
		local linkWnd = UI:GetUiObjByHandleT( item.hWnd )
		if linkWnd then
			linkWnd:SetTooltipData( tooltipData )
		end
	end
	
end


--
function UI.ItemIcoWnd:HideInactiveNode()

	self:SetLayerVisible( false, self.layers.INACTIVE_NODE_TEXT )
	self.inactiveNodeMetaText:SetText( "", true )
	
end


--
function UI.ItemIcoWnd:ShowNotLearnedNode( nodeName, shipDefName, chosenNodesMask )

	if type( nodeName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:ShowNotLearnedNode()[ERROR]: invalid type pf the 1-st parameter (\"nodeName\"); \"string\" expected, got \"%s\"", type( nodeName ) )
		nodeName = ""
	end

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:ShowNotLearnedNode()[ERROR]: invalid type pf the 2-nd parameter (\"shipDefName\"); \"string\" expected, got \"%s\"", type( shipDefName ) )
		shipDefName = ""
	end

	if chosenNodesMask ~= nil then
    	if type( chosenNodesMask ) ~= "userdata" then
    		sys.log( "UI.ItemIcoWnd:ShowNotLearnedNode()[ERROR]: invalid type of the 3-rd parameter (\"chosenNodesMask\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( chosenNodesMask ) )
    		chosenNodesMask = nil
    	end
	end

	if not self.notLearnedNodeIcoWnd then
		self.notLearnedNodeIcoWnd = UI:CreateChildWnd( self, UI.ItemIco_NotLearnedNodeIcoWnd, "" )	-- TODO нужно и для 1080
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.notLearnedNodeIcoWnd, mainEffect, self.effectInfo.main.lockIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )


	-- тултип

	local strTooltipText = UI:GetStringByName( "itemIco_shipNodeNotLearned_tooltip_text" )

	local tooltipBaseColor = UI.TooltipWnd_shared:GetTextColor()
	local strNodeNameLocalized = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), UI:EvolvingShipNode2Str( nodeName, shipDefName, chosenNodesMask, UI.TEXT_SEL_COLOR ), UI:Color2Str( tooltipBaseColor ) )

	local numSubst = 0
	strTooltipText, numSubst = string.gsub( strTooltipText, "%$node%$", strNodeNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.ItemIcoWnd:ShowNotLearnedNode()[ERROR]: cannot find placeholder \"$node$\" in string \"itemIco_shipNodeNotLearned_tooltip_text\"" )
		strTooltipText = string.format( "[INVALID_STRING] Learn node %s to unlock", strNodeNameLocalized )
	end	

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "itemIco_shipNodeNotLearned_tooltip_caption" ),
		text		= strTooltipText,
	}

	self.notLearnedNodeIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.ItemIcoWnd:HideNotLearnedNode()

	if self.notLearnedNodeIcoWnd then
		self.notLearnedNodeIcoWnd:UnlinkFromParent()
	end

end


--
function UI.ItemIcoWnd:ShowCheckmark()

	self:SetLayerVisible( true, self.layers.CHECKMARK_EFFECT )

end


--
function UI.ItemIcoWnd:HideCheckmark()

	self:SetLayerVisible( false, self.layers.CHECKMARK_EFFECT )

end


--
function UI.ItemIcoWnd:ShowChainLeftArrow( bActive )

	if type( bActive ) ~= "boolean" then
		sys.log( "UI.ItemIcoWnd:ShowChainLeftArrow()[ERROR]: invalid type pf the 1-st parameter (\"bActive\"); \"\" expected, got \"%s\"", type( bActive ) )
		bActive = true
	end

	self:SetLayerVisible( true, self.layers.CHAIN_LEFT_ARROW_EFFECT )

	local anim = bActive and self.effectInfo.chainLeftArrow.animActive or self.effectInfo.chainLeftArrow.animInactive

	local arrowEffect = UI:GetEffectFromLayer( self, self.layers.CHAIN_LEFT_ARROW_EFFECT )
	if arrowEffect then
		arrowEffect:StartAnimation( anim )
	end

end


--
function UI.ItemIcoWnd:HideChainLeftArrow()

	self:SetLayerVisible( false, self.layers.CHAIN_LEFT_ARROW_EFFECT )

end


--
function UI.ItemIcoWnd:ShowSelection2()

	self:SetLayerVisible( true, self.layers.SELECT2_EFFECT )

end


--
function UI.ItemIcoWnd:HideSelection2()

	self:SetLayerVisible( false, self.layers.SELECT2_EFFECT )

end


--
function UI.ItemIcoWnd:ShowInfluenceColor( color )

	if color == nil then	-- функция GetItemInfluenceColor() может возвращать nil, если нет цвета
	
		self:HideInfluenceColor()
		
	else
	
		self:SetLayerVisible( true, self.layers.INFLUENCE_COLOR_EFFECT )
		
		local influenceEffect = UI:GetEffectFromLayer( self, self.layers.INFLUENCE_COLOR_EFFECT )
		if influenceEffect then
			influenceEffect:SetColor( color )
		end
		
	end

end


--
function UI.ItemIcoWnd:HideInfluenceColor()

	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )

end


--
function UI.ItemIcoWnd:SetupCyberSport( defName, autogenItem )

	if autogenItem and UI.HangarWnd:IsOnScreen() then
		UI:AddTempAutogenDef( autogenItem )
	end

	local bShowCyberSport = UI:GetShowCyberSportMode() and UI:IsItemCyberSport( defName )
	self:SetLayerVisible( bShowCyberSport, self.layers.CYBER_SPORT )
	
	self.cyberSportData =
	{
		defName = defName,
		autogenItem = autogenItem,
	}

end


--
function UI.ItemIcoWnd:HideCybersport()

	self:SetLayerVisible( false, self.layers.CYBER_SPORT )
	self.cyberSportData = nil
	
end


--
function UI.ItemIcoWnd:OnShowCyberSportOptionChanged()

	if self.cyberSportData then
		self:SetupCyberSport( self.cyberSportData.defName, self.cyberSportData.autogenItem )
	end

end


--
function UI.ItemIcoWnd:OnLeagueForbiddenEquipmentChanged()

	if self.cyberSportData then
		self:SetupCyberSport( self.cyberSportData.defName, self.cyberSportData.autogenItem )
	end

end


--
function UI.ItemIcoWnd:ShowShipCustomizationPresetColors( customizationName )

	if type( customizationName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:ShowShipCustomizationPresetColors()[ERROR]: invalid type of the 1-st parameter ('customizationName'); 'string' expected, got '%s'", type( customizationName ) )
		return
	end
	
	self:SetLayerVisible( true, self.layers.CUSTOMIZATION_PRESET_COLORS_EFFECT )
	self:SetLayerVisible( true, self.layers.CUSTOMIZATION_PRESET_COLOR_1_EFFECT )
	self:SetLayerVisible( true, self.layers.CUSTOMIZATION_PRESET_COLOR_2_EFFECT )
	self:SetLayerVisible( true, self.layers.CUSTOMIZATION_PRESET_COLOR_3_EFFECT )	

	local color1 = UI:GetShipCustomPresetColor( customizationName, ai.VesselCustomSlot.MATERIAL_0 )
	local color2 = UI:GetShipCustomPresetColor( customizationName, ai.VesselCustomSlot.MATERIAL_1 )
	local color3 = UI:GetShipCustomPresetColor( customizationName, ai.VesselCustomSlot.MATERIAL_2 )

	local color1Effect = UI:GetEffectFromLayer( self, self.layers.CUSTOMIZATION_PRESET_COLOR_1_EFFECT )
	if color1Effect then
		color1Effect:SetColor( color1 )
	end

	local color2Effect = UI:GetEffectFromLayer( self, self.layers.CUSTOMIZATION_PRESET_COLOR_2_EFFECT )
	if color2Effect then
		color2Effect:SetColor( color2 )
	end

	local color3Effect = UI:GetEffectFromLayer( self, self.layers.CUSTOMIZATION_PRESET_COLOR_3_EFFECT )
	if color3Effect then
		color3Effect:SetColor( color3 )
	end

end


--
function UI.ItemIcoWnd:HideShipCustomizationPresetColors()
	
	self:SetLayerVisible( false, self.layers.CUSTOMIZATION_PRESET_COLORS_EFFECT )
	self:SetLayerVisible( false, self.layers.CUSTOMIZATION_PRESET_COLOR_1_EFFECT )
	self:SetLayerVisible( false, self.layers.CUSTOMIZATION_PRESET_COLOR_2_EFFECT )
	self:SetLayerVisible( false, self.layers.CUSTOMIZATION_PRESET_COLOR_3_EFFECT )

end


--
function UI.ItemIcoWnd:SetupShipCustomuzation( customizationName )

	if type( customizationName ) ~= "string" then
		sys.log( "UI.ItemIcoWnd:SetupShipCustomuzation()[ERROR]: invalid type of the 1-st parameter ('customizationName'); 'string' expected, got '%s'", type( customizationName ) )
		return
	end

	self:HideIco()
	self:HideShipCustomizationPresetColors()
	
	local customizationType = UI:GetCustomizationTypeByName( customizationName )
	local bHandled = false
	
	if customizationType == ai.VesselCustomElementType.STICKER then
	
		-- текстуры наклеек предварительно должны быть загружены внешним кодом! (они не грузятся вместе со всеми текстурами)
		local hTex = UI:GetStickerIco( customizationName )
		self:SetupIco( hTex )
		bHandled = true
	
	elseif customizationType == ai.VesselCustomElementType.MATERIAL then
		
		local hTex = UI:GetShipCustomColorIco( customizationName )
		
		if hTex ~= UI.INVALID_RESOURCE_HANDLE then
			self:SetupIco( hTex )
		else
			hTex = UI:GetTex( "white" )
			self:SetupIco( hTex )
			
			local color = UI:GetShipCustomColorVal( customizationName )	
			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:SetColor( color )
			end
		end

		bHandled = true
	elseif customizationType == ai.VesselCustomElementType.ARMOR then
		-- дефолтная иконка
	
	elseif customizationType == ai.VesselCustomElementType.CRYSTAL then
		-- дефолтная иконка
	
	elseif customizationType == ai.VesselCustomElementType.CHILD then
	
		local hTex = UI:GetShipCustomChildIco( customizationName )
		self:SetupIco( hTex )
		bHandled = true
		
	elseif customizationType == ai.VesselCustomElementType.SKIN then
		-- дефолтная иконка
	
	elseif customizationType == ai.VesselCustomElementType.MPRESET then
	
		local hTex = UI:GetShipCustomPresetIco( customizationName )
		if hTex ~= UI.INVALID_RESOURCE_HANDLE then
			self:SetupIco( hTex )
		else
			self:ShowShipCustomizationPresetColors( customizationName )
		end
		
		bHandled = true
	
	else
		sys.log( "UI.ItemIcoWnd:SetupShipCustomuzation()[ERROR]: unhandled customization type %d('%s') for customization '%s'", customizationType, UI:Val2Str( ai.VesselCustomElementType, customizationType ), tostring( customizationName ) )
	end
	
	if not bHandled then
		local hTex = UI:GetTex( "bundleContent_CUSTOM_ELEMENT" )
		self.itemIcoWnd:SetupIco( hTex )
	end

end


--
function UI.ItemIcoWnd:HideAutogen()

	self:SetLayerVisible( false, self.layers.AUTOGEN_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_1_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_2_EFFECT )

end


--
function UI.ItemIcoWnd:ShowAutogen( rollData )

	if type( rollData ) ~= "table" then
		sys.log( "UI.ItemIcoWnd:ShowAutogen()[ERROR]: invalid type of the 1-st patam ('rollData'); 'table' expected, got '%s'", type( rollData ) )
		return
	end
	
	self:HideAutogen()
	
	-- подложка, зависит от атоген-класса модуля
	
	self:SetLayerVisible( true, self.layers.AUTOGEN_EFFECT )
	
	local hBgTex = UI.INVALID_RESOURCE_HANDLE
	
	local autogenClassId = -1
	local decomposition = _G.DecompositeAutogenRollData( rollData )
	if decomposition and decomposition.autogenClass then
		autogenClassId = decomposition.autogenClass
	else
		sys.log( "UI.ItemIcoWnd:ShowAutogen(): fail to decomposite rollData" )
	end
	
	if autogenClassId ~= -1 then
		local autogenClassName = UI:Val2Key( _G.AutogenClass, autogenClassId )
		local texName = string.format( "autogen_%s_bg", autogenClassName )
		hBgTex = UI:GetTex( texName )
	end
	
	local autogenEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_EFFECT )
	if autogenEffect then
		autogenEffect:SetSpriteTexture( self.effectInfo.autogen.icoSpriteName, hBgTex )
	end
	
	-- иконки аффиксов
	
	local bestAffixes = UI:GetAutogenBestAffixes( rollData )
	
	local affix1 = bestAffixes[ 1 ]
	if affix1 then
	
		self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_1_EFFECT )
		
		local hTex = UI:GetAutogenAffixIco( affix1.affixId )
		local color = UI:GetAutogenAffixColor( affix1.affixId, affix1.level )
		
		local affixEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_AFFIX_1_EFFECT )
		if affixEffect then
		
			affixEffect:SetSpriteTexture( self.effectInfo.autogenAffix.icoSpriteName, hTex )
			affixEffect:SetColor( color )
			
		end
		
	end
	
	local affix2 = bestAffixes[ 2 ]
	
	-- если нет второго аффикса, то единственный аффикс рисуется и сверху, и снизу
	if not affix2 then
		affix2 = affix1
	end
	
	if affix2 then
	
		self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_2_EFFECT )
		
		local hTex = UI:GetAutogenAffixIco( affix2.affixId )
		local color = UI:GetAutogenAffixColor( affix2.affixId, affix2.level )
		
		local affixEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_AFFIX_2_EFFECT )
		if affixEffect then
		
			affixEffect:SetSpriteTexture( self.effectInfo.autogenAffix.icoSpriteName, hTex )
			affixEffect:SetColor( color )
			
		end
		
	end

end


-- ----------------------------------------
-- const
-- ----------------------------------------

ii.effectInfo =
{
	main =
	{
		animIdle						= "active",
		animDD							= "inactive",
		animInactive					= "drop",
		orgLocator						= "center",
		lockIcoLocator					= "lock",
		bigSelfLocator_upgradeArrow		= "self_upd",
	},

	icoMain =
	{
		icoSpriteName	= "ico",
		animIdle		= "inactive",
		animSel			= "active",
		animDisabled	= "disable",
		animIdleAlien	= "bg_2",
		animSelAlien	= "bg_3",
		bigSelfLocator	= "self_big",
	},

	ranks =
	{
		animIdle		= "idle",
		animNotFit		= "red",
		ranksValLocator	= "value"
	},

	shipType =
	{
		icoSpriteName	= "ico",
		animIdle		= "idle",
		animNotFit		= "red",
	},

	equipShip =
	{
		icoSpriteName	= "ico",
	},

	chainLeftArrow =
	{
		animActive		= "active",
		animInactive	= "inactive",
	},
	
	countResource =
	{
		valLocator		= "text",
	},
	
	autogen =
	{
		icoSpriteName	= "ico",
	},
	
	autogenAffix =
	{
		icoSpriteName	= "ico",
	},
	
	upgradeArow2 =
	{
		btnLocator		= "upd_btn",
	}
}

ii.upgradeArrowBtnPrototype = ""

-- ----------------------------------------
-- vars
-- ----------------------------------------

ii.tipData				= nil
ii.ranksData			= nil
ii.cyberSportData		= nil
ii.inactiveNodeMetaText	= nil
ii.notLearnedNodeIcoWnd	= nil
ii.upgradeArrowBtn		= nil

-- ----------------------------------------
-- work functions
-- ----------------------------------------

--
function UI.ItemIcoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end 

	self.inactiveNodeMetaText = UI.MetaText.GetNewInstance()
	self.inactiveNodeMetaText:InitFromLayer( self, self.layers.INACTIVE_NODE_TEXT )

	self:Reset()

end


--
function UI.ItemIcoWnd:F_Shutdown()

	if self.inactiveNodeMetaText then
		self.inactiveNodeMetaText:Clear()
	end

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemIcoWnd:DeleteControls()
end


--
function UI.ItemIcoWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.KEY_TEXT then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ), layerIdx )

	elseif layerIdx == self.layers.INACTIVE_NODE_TEXT then
		self.inactiveNodeMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ItemIcoWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ItemIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ItemIcoWnd:UpdateMetaTextPos()

	self.inactiveNodeMetaText:UpdateScreenOrgFromLayer( self, self.layers.INACTIVE_NODE_TEXT )

end


--
function UI.ItemIcoWnd:SetupRanksMinMax( minRank, maxRank, bFit, color )

	self:SetLayerVisible( false, self.layers.RANKS_EFFECT )
	self:SetLayerVisible( false, self.layers.RANKS )
	
	if minRank ~= -1 and maxRank ~= -1 and not( minRank == 1 and maxRank == UI:GetMaxRank() ) then	-- #0087847,комм.(0395443) - если в диапазон включаются все ранги с первого до последнего, то ранги не показываюстя

		local str = ""

		if minRank ~= maxRank then

			local mode = UI:GetItemRankMode()

			if mode == UI.itemRankModes.MAX then
				str = tostring( maxRank )

			elseif mode == UI.itemRankModes.RANGE then
				str = string.format( "%d-%d", minRank, maxRank )                    
			end

		else
			str = tostring( minRank )
		end

		self:ShowRanksInternal( str, bFit, color )

	end
	
end


--
function UI.ItemIcoWnd:ShowRanksInternal( str, bFit, color )

	self:SetLayerVisible( true, self.layers.RANKS )
	self:SetLayerVisible( true, self.layers.RANKS_EFFECT )

	self:SetText( str, self.layers.RANKS )

	local ranksEffect = UI:GetEffectFromLayer( self, self.layers.RANKS_EFFECT )
	if ranksEffect then

		local anim = ""
		local handle = self:GetUiHandle()

		ranksEffect:UnlinkLayer( handle, self.layers.RANKS, "" )

		if not bFit then

			anim = self.effectInfo.ranks.animNotFit
			ranksEffect:LinkLayer( handle, self.layers.RANKS, self.effectInfo.ranks.ranksValLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )

		elseif color then

			anim = self.effectInfo.ranks.animIdle

			-- вызывать обязательно ДО линка, иначе пропадет альфа
			self:SetColor( color, self.layers.RANKS )

			-- НЕ линкуется по цвету
			ranksEffect:LinkLayer( handle, self.layers.RANKS, self.effectInfo.ranks.ranksValLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA )

		else

			anim = self.effectInfo.ranks.animIdle
			ranksEffect:LinkLayer( handle, self.layers.RANKS, self.effectInfo.ranks.ranksValLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )

		end

		ranksEffect:StartAnimation( anim )

	end		

end


--
function UI.ItemIcoWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.UPGRADE_WOW_EFFECT ) then
		self:SetLayerVisible( false, self.layers.UPGRADE_WOW_EFFECT )
	end

end


-- ----------------------------------------------------------------------------
-- UI.ItemIco_NotLearnedNodeIcoWnd
-- ----------------------------------------------------------------------------

UI.ItemIco_NotLearnedNodeIcoWnd = {}

-- ----------------------------------------
-- window definition
-- ----------------------------------------

UI.ItemIco_NotLearnedNodeIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ItemIco_NotLearnedNodeIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "itemIco_lock2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.ItemIco_NotLearnedNodeIcoWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ItemIco_NotLearnedNodeIcoWnd:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------------------
-- vars
-- ----------------------------------------

UI.ItemIco_NotLearnedNodeIcoWnd.tooltipData	= nil

-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
	},
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "idle",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_1080
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}


-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_1080_2
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_1080_2 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_1080_2",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_1080_2",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}

-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_Small_1080
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_Small_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_Small_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_small_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}

-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_SpecModule_1080
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_SpecModule_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_SpecModule_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_spec_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}

-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_Weapon_1080
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_Weapon_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_Weapon_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_weapon_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}


-- ----------------------------------------------------------------------------
-- UI.ItemIco_UpgradeArrowBtn_Autogen_1080
-- ----------------------------------------------------------------------------

UI.ItemIco_UpgradeArrowBtn_Autogen_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemIco_UpgradeArrowBtn",

		props =
		{
			name		= "ItemIco_UpgradeArrowBtn_Autogen_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype	= true,
		},
		
		layers =
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_upgradeArrowBtn_autogen_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
}

-- ---------------------------------------------------------------------------------
-- UI.ItemIcoWnd_1080	- аналог ItemIcoWnd для базового разрешения 1920*1080
-- используется, когд нужна иконка единого "стандартного" размера
-- ---------------------------------------------------------------------------------

UI.ItemIcoWnd_1080 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_1080",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},
						
						{
							objName		= "blackout",
							layer		= "UI.ItemIcoWnd.layers.NO_AMMO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "upd",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "upd_arrow",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "blink_flash",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_1080",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "buff_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "agen_icon",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "count_3",
							layer		= "UI.ItemIcoWnd.layers.COUNT_RESOURCES_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_1080",
					defaultAnimation	= "active",
				}}
			},
			
			-- ICO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "spellIco_1080",
					defaultAnimation	= "color",
				}}
			},
			
			-- AUTOGEN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogenMain_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "icon_1",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "icon_2",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},
					}
				}}
			},
			
			-- AUTOGEN_AFFIX_1_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix1_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- AUTOGEN_AFFIX_2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix2_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT_2
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow2_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
			
			-- COUNT_RESOURCES_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COUNT_RESOURCES_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_countResources_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text",	
							layer		= "UI.ItemIcoWnd.layers.COUNT_RESOURCES_VAL",
							animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
						},
					} 
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_1080",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- NO_AMMO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.NO_AMMO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_noAmmo_1080",
					defaultAnimation	= "cross",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_1080",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- UPGRADE_WOW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_upgradeWow_1080",
					defaultAnimation	= "idle",
				}}
			},
		}
	},
	
	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_1080",
}

-- -----------------------------------------------------------------------------------------------
-- UI.ItemIcoWnd_1080	- аналог ItemIcoWnd, для базового разрешения 1920*1080; другого размера, чем ItemIcoWnd_1080
-- (для некоторых дочерних эффектов специальные версии отсутствуют, т.к. не нужны там, где используются эти иконки)
-- -----------------------------------------------------------------------------------------------

UI.ItemIcoWnd_1080_2 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_1080_2",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_1080_2",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},
						
						{
							objName		= "blackout",
							layer		= "UI.ItemIcoWnd.layers.NO_AMMO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "upd",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "upd_arrow",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "blink_flash",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_1080_2",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "buff_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "agen_icon",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_1080_2",
					defaultAnimation	= "active",
				}}
			},
			
			-- ICO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "spellIco_1080_2",
					defaultAnimation	= "color",
				}}
			},
			
			-- AUTOGEN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogenMain_1080_2",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "icon_1",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "icon_2",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},
					}
				}}
			},
			
			-- AUTOGEN_AFFIX_1_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix1_1080_2",
					defaultAnimation	= "idle",
				}}
			},
			
			-- AUTOGEN_AFFIX_2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix2_1080_2",
					defaultAnimation	= "idle",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT_2
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow2_1080_2",
					defaultAnimation	= "idle",
				}}
			},

			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_1080_2",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_1080_2",
					defaultAnimation	= "idle",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- NO_AMMO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.NO_AMMO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_noAmmo_1080_2",
					defaultAnimation	= "cross",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_1080_2",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_1080_2",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_1080_2",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_1080_2",
					defaultAnimation	= "idle",
				}}
			},

			-- UPGRADE_WOW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_upgradeWow_1080_2",
					defaultAnimation	= "idle",
				}}
			},
		}
	},
	
	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_1080_2",
}

-- -----------------------------------------------------------------------------------------------
-- UI.ItemIcoWnd_Small_1080	- аналог ItemIcoWnd, уменьшенный, для базового разрешения 1920*1080
-- (для некоторых дочерних эффектов специальные версии отсутствуют, т.к. не нужны там, где используются эти иконки)
-- -----------------------------------------------------------------------------------------------

UI.ItemIcoWnd_Small_1080 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_Small_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_small_1080",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "upd",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "blink_flash",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_small_1080",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "buff_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_small_1080",
					defaultAnimation	= "active",
				}}
			},
			
			-- ICO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "spellIco_small_1080",
					defaultAnimation	= "color",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT_2
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow2_small_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_small_1080",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_small_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_small_1080",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_small_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_small_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_small_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- UPGRADE_WOW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_upgradeWow_small_1080",
					defaultAnimation	= "idle",
				}}
			},
		}
	},
	
	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_Small_1080",
}


-- -----------------------------------------------------------------------------------------------
-- UI.ItemIcoWnd_SpecModule_1080 - аналог ItemIcoWnd, для базового разрешения 1920*1080; другого размера, чем ItemIcoWnd_1080
-- (для некоторых дочерних эффектов специальные версии отсутствуют, т.к. не нужны там, где используются эти иконки)
-- -----------------------------------------------------------------------------------------------

UI.ItemIcoWnd_SpecModule_1080 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_SpecModule_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_spec_1080",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_spec_1080",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "buff_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
    						objName		= "bg",	
							layer		= "UI.ItemIcoWnd.layers.SPEC_MODULE_ARROW_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
	
						{
							objName		= "over_big",	
							layer		= "UI.ItemIcoWnd.layers.BIG_MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
			
			-- SPEC_MODULE_ARROW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SPEC_MODULE_ARROW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_specModuleArrow_spec_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_spec_1080",
					defaultAnimation	= "active",
				}}
			},
			
			-- ICO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "spellIco_spec_1080",
					defaultAnimation	= "color",
				}}
			},
			
			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_spec_1080",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_spec_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_spec_1080",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_spec_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_spec_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_spec_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- BIG_MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.BIG_MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_bigMouseOver_spec_1080",
					defaultAnimation	= "idle",
				}}
			},
		}
	},
	
	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_SpecModule_1080",
}


-- -----------------------------------------------------------------------------------------------
-- UI.ItemIcoWnd_Weapon_1080 - аналог ItemIcoWnd, для базового разрешения 1920*1080; другого размера, чем ItemIcoWnd_1080
-- (для некоторых дочерних эффектов специальные версии отсутствуют, т.к. не нужны там, где используются эти иконки)
-- -----------------------------------------------------------------------------------------------

UI.ItemIcoWnd_Weapon_1080 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_Weapon_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_weapon_1080",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "upd",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "blink_flash",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_weapon_1080",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "buff_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_weapon_1080",
					defaultAnimation	= "active",
				}}
			},
			
			-- ICO_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "spellIco_weapon_1080",
					defaultAnimation	= "color",
				}}
			},

			-- UPGRADE_ARROW_EFFECT_2
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow2_weapon_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_weapon_1080",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_weapon_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_weapon_1080",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_weapon_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_weapon_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_weapon_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- UPGRADE_WOW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_upgradeWow_weapon_1080",
					defaultAnimation	= "idle",
				}}
			},
		},
	},

	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_Weapon_1080"
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

-- перегрузка бозовой функии - берется не квадратная, а большая прямоугольная иконка, которая в атласе используется
function UI.ItemIcoWnd_Weapon_1080:SetupIcoForItem( defName )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( UI.WHITE_COLOR )	-- цвет иконки может меняться при отображении кастомизации корабля
	end

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )
	
	local hTex = UI:GetShopIco2( defName )	-- 
	UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

end


-- -----------------------------------------------------------------------------------------------
-- UI.ItemIcoWnd_Autogen_1080	- аналог ItemIcoWnd, уменьшенный, для базового разрешения 1920*1080
-- (для некоторых дочерних эффектов специальные версии отсутствуют, т.к. не нужны там, где используются эти иконки)
-- -----------------------------------------------------------------------------------------------

UI.ItemIcoWnd_Autogen_1080 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemIcoWnd_Autogen_1080",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

		layers =
		{
			-- MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName 			= "itemIco_main_autogen_1080",
					defaultAnimation	= "active",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						
						{
							objName		= "prod_icon",
							layer		= "UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_lock",
							layer		= "UI.ItemIcoWnd.layers.LOCK_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "slot_select",
							layer		= "UI.ItemIcoWnd.layers.SELECT_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "blackout",	
							layer		= "UI.ItemIcoWnd.layers.DARKENING_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "in_battle",
							layer		= "UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "upd",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "frame",
							layer		= "UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "qu_star",
							layer		= "UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "blink_flash",
							layer		= "UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "off_text",
							layer		= "UI.ItemIcoWnd.layers.INACTIVE_NODE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "bg_2",
							layer		= "UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- ICO_MAIN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ICO_MAIN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_ico_autogen_1080",
					defaultAnimation	= "inactive",

					links =
					{
						{
							objName		= "tier",
							layer		= "UI.ItemIcoWnd.layers.RANKS_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "over",
							layer		= "UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
						
						{
							objName		= "ks",
							layer		= "UI.ItemIcoWnd.layers.CYBER_SPORT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "agen_icon",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},

					}
				}}
			},

			-- INFLUENCE_COLOR_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.INFLUENCE_COLOR_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				
				effects =
				{{
					defName 			= "itemIco_influenceColor_autogen_1080",
					defaultAnimation	= "active",
				}}
			},
			
			-- AUTOGEN_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogenMain_autogen_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "icon_1",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "icon_2",
							layer		= "UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},
					}
				}}
			},
			
			-- AUTOGEN_AFFIX_1_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_1_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix1_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- AUTOGEN_AFFIX_2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.AUTOGEN_AFFIX_2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_autogen_affix2_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},
			
			-- UPGRADE_ARROW_EFFECT_2
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_ARROW_EFFECT_2,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_upgradeArrow2_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- RANKS_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.RANKS_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_shopTypeTier_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "value",
							layer		= "UI.ItemIcoWnd.layers.RANKS",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- LOCK_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.LOCK_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_lock_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- COLOR2_FRAME_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.COLOR2_FRAME_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_color2Frame_autogen_1080",
					defaultAnimation	= "active",
				}}
			},

			-- ENCHANTMENT2_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ENCHANTMENT2_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "itemIco_enchantment2_1080",
					defaultAnimation	= "active",
				}}
			},

			-- SELECT_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.SELECT_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_select_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- DARKENING_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.DARKENING_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_darkening_autogen_1080",
					defaultAnimation	= "inactive",
				}}
			},

			-- IN_BATTLE_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.IN_BATTLE_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_inBattle_autogen_1080",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "text_buy",
							layer		= "UI.ItemIcoWnd.layers.IN_BATTLE_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- ON_SHIP_QUEST_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.ON_SHIP_QUEST_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_onQuest_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- MOUSE_OVER_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.MOUSE_OVER_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_mouseOver_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},

			-- UPGRADE_WOW_EFFECT
			{
				id			= UI.ItemIcoWnd.layers.UPGRADE_WOW_EFFECT,
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

				effects =
				{{
					defName 			= "itemIco_upgradeWow_autogen_1080",
					defaultAnimation	= "idle",
				}}
			},
		}
	},
	
	upgradeArrowBtnPrototype = "ItemIco_UpgradeArrowBtn_Autogen_1080",
}