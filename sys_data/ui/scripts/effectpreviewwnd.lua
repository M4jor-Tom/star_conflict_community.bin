-- ----------------------------------------------------------------------------
--
-- Workfile: EffectPreviewWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.-- 
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

--
UI.EffectPreviewWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------
UI.EffectPreviewWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "EffectPreviewWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,
		},
	},
}
