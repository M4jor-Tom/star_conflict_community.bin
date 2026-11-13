-- ----------------------------------------------------------------------------
--
-- Workfile: hudbombericownd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudBomberIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudBomberIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudBomberIcoWnd",
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
				defName 			= "hud_bombIco",
				defaultAnimation	= "on_friend",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},   
	},
}

-- ------------------------------
-- const
-- ------------------------------

UI.HudBomberIcoWnd.layers =
{
    MAIN_EFFECT			= 0,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudBomberIcoWnd.bVisible = true

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudBomberIcoWnd:Reset()

	self:SetVisible( false )

end


--
function UI.HudBomberIcoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local gameplay = _G.GetCurrentGameMode()

	local bombersMask = 0

	if gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then
		bombersMask = _G.CL_BombTheBaseGetCarrier()

	elseif gameplay == ai.Gameplay.CLANSHIP then
		bombersMask = _G.CL_ClanShipGetBombCarriers()
	end

	local bVisible = UI:BitTst( bombersMask, UI.HudWnd.localPlayerId )

	if bVisible ~= self.bVisible then
		self:SetVisible( bBomber )
	end

end


--
function UI.HudBomberIcoWnd:SetVisible( bVisible )

	if bVisible then
		self:RemoveStyle( UI.WS_NOT_DRAW )
	else
		self:AddStyle( UI.WS_NOT_DRAW )
	end

	self.bVisible = bVisible

end


--
function UI.HudBomberIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end