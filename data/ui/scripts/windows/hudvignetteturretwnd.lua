-- ----------------------------------------------------------------------------
--
-- Workfile: hudvignetteturretwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudVignetteTurretWnd = {}
local hv = UI.HudVignetteTurretWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudVignetteTurretWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudVignetteTurretWnd",
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
				defName 			= "hud_vignetteTurret",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

-- ------------------------------
-- const
-- ------------------------------

hv.modes =
{
	MAIN_EFFECT = 0,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudVignetteTurretWnd.isVisible	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudVignetteTurretWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudVignetteTurretWnd:FullUpdate()

	-- TODO: функция возвращает не для спектатора, а именно для локального игрока
	local controlMode = _G.CL_GetLocalPlayerControlMode()

	local isVisible = controlMode == UI.ShipControlModes.LOCAL_TURRET or controlMode == UI.ShipControlModes.REMOTE_TURRET

	if isVisible ~= self.isVisible then

		if isVisible then
    		self:RemoveStyle( UI.WS_NOT_DRAW )
    	else
    		self:AddStyle( UI.WS_NOT_DRAW )
    	end

		self.isVisible = isVisible

	end

end


--
function UI.HudVignetteTurretWnd:Reset()

	self:AddStyle( UI.WS_NOT_DRAW )
	self.isVisible = false

end


--
function UI.HudVignetteTurretWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end