-- ----------------------------------------------------------------------------
--
-- Workfile: WaitingWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- --
-- ----------------------------------------------------------------------------
--  $Id: waitingwnd.lua 4565 2011-10-07 08:50:40Z $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.WaitingWnd = {}
local ww = UI.WaitingWnd

-- --------------------------------------
-- window definiiton
-- --------------------------------------

UI.WaitingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "WaitingWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs		= Quat( 0, 0, 1024, 768 ),
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		}, 

		-- PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_waitCircleLarge",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.WaitingWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		}, 

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  
	}
}

-- --------------------------------------
-- interface funcitons
-- --------------------------------------

--
function UI.WaitingWnd:SetWaitText( text )

	self:SetText( text, self.layers.TEXT )

end


-- --------------------------------------
-- const
-- --------------------------------------

ww.layers =
{
	MAIN_EFFECT		= 0,
	PROGRESS_EFFECT	= 1,
	TEXT			= 2,
}