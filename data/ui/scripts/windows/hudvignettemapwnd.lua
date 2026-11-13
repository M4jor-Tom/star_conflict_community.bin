-- ----------------------------------------------------------------------------
--
-- Workfile: hudvignettemapwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudVignetteMapWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudVignetteMapWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudVignetteMapWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "hud_mapBg",
				defaultAnimation	= "idle",
			}}
		}
	}
}
