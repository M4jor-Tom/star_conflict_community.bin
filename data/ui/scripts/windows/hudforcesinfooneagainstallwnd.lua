-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfooneagainstallwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesinfoOneAgainstAllWnd = {}
local fi = UI.HudForcesinfoOneAgainstAllWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesinfoOneAgainstAllWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesinfoOneAgainstAllWnd",
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
				defName 			= "hud_forcesInfoCustom_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesinfoOneAgainstAllWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
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

UI.HudForcesinfoOneAgainstAllWnd.layers =
{
    MAIN_EFFECT		= 0,
	TEXT			= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesinfoOneAgainstAllWnd.numPlayerSurvived	= -1
UI.HudForcesinfoOneAgainstAllWnd.numPlayersTotal	= -1
UI.HudForcesinfoOneAgainstAllWnd.str				= ""

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesinfoOneAgainstAllWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self.str = UI:GetStringByName( "hudForcesInfo_oneAgainstAll" )

end


--
function UI.HudForcesinfoOneAgainstAllWnd:Reset()

	self.numPlayerSurvived = -1
	self.numPlayersTotal = -1
	
	self:SetText( "", self.layers.TEXT )
	
end


--
function UI.HudForcesinfoOneAgainstAllWnd:FullUpdate()

	local numPlayerSurvived_old = numPlayerSurvived
	local numPlayersTotal_old = numPlayersTotal

	self.numPlayerSurvived, self.numPlayersTotal = _G.CL_GetNumSurvivors()
	
	if self.numPlayerSurvived == numPlayerSurvived_old and self.numPlayersTotal == numPlayersTotal_old then
		return
	end
	
	local text = string.format( "%s: %d/%d", self.str, self.numPlayerSurvived, self.numPlayersTotal )
	self:SetText( text, self.layers.TEXT )

end


--
function UI.HudForcesinfoOneAgainstAllWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()
	
end


--
function UI.HudForcesinfoOneAgainstAllWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end