-- ----------------------------------------------------------------------------
--
-- Workfile: hudtimerwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudTimerWnd = {}
local ht = UI.HudTimerWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudTimerWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudTimerWnd",
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
				defName 			= "hud_timer",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "timer_1",
						layer		= "UI.HudTimerWnd.layers.TEXT_OUTL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "timer_2",
						layer		= "UI.HudTimerWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- TEXT_OUTL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- const
-- ------------------------------

ht.layers =
{
    MAIN_EFFECT	= 0,
	TEXT_OUTL	= 1,
	TEXT		= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

ht.timer = -1

-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.HudTimerWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer()

end


--
function UI.HudTimerWnd:UpdateTimer()

	local timer = _G.CL_GetGameplayTimer()
	timer = math.floor( timer )

	if timer == self.timer then
		return
	end

	self.timer = timer

	if timer < 0 then

		self:SetText( "", self.layers.TEXT_OUTL )
		self:SetText( "", self.layers.TEXT )

	else

    	local str = UI:Time2Str3( timer )
    	self:SetText( str, self.layers.TEXT_OUTL )
    	self:SetText( str, self.layers.TEXT )

	end

end



--
function UI.HudTimerWnd:Reset()

	self.timer = -1

	self:SetText( "", self.layers.TEXT_OUTL )
	self:SetText( "", self.layers.TEXT )	

end


--
function UI.HudTimerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end