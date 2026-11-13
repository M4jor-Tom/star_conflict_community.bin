-- ----------------------------------------------------------------------------
--
-- Workfile: hudvignettelowhpwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudVignetteLowHpWnd = {}
local hv = UI.HudVignetteLowHpWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudVignetteLowHpWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudVignetteLowHpWnd",
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
				defName 			= "hud_vignetteLowHp",
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

hv.THRESHOLD	= 0.2
hv.MAX_TIME		= 5

-- ------------------------------
-- vars
-- ------------------------------

hv.timer		= -1
hv.hp			= -1
hv.shield		= -1
hv.isVisible	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudVignetteLowHpWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate( dt_sys )

end


--
function UI.HudVignetteLowHpWnd:FullUpdate( dt )

	if self.timer ~= -1 then
		self.timer = self.timer - dt
		if self.timer <= 0 then
			self.timer = -1
		end
	end

	local isVisible = false

	local myShip = UI.HudWnd.myShip
	if myShip then

    	local hp		= myShip:GetHealth() / myShip:GetMaxHealth()
		local shield	= myShip:GetShieldVal() / myShip:GetShieldMax()

    	local isLow = hp + shield <= self.THRESHOLD

		if isLow then

			-- показывается в течении некоторого времени после каждого повреждения, потом исчезает
			if self.hp == -1 or self.shield == -1 or hp < self.hp or shield < self.shield then
				self.timer = self.MAX_TIME 
			end

			isVisible = self.timer ~= -1

		end

		self.hp		= hp
		self.shield	= shield

	else
		self.hp		= -1
		self.shield	= -1
	end

	if isVisible then

		if not self.isVisible then
			self:RemoveStyle( UI.WS_NOT_DRAW )
		end

		if self.timer == -1 then
			self.timer = self.MAX_TIME
		end

	else

		if self.isVisible then
			self:AddStyle( UI.WS_NOT_DRAW )
		end

		self.timer = -1

	end

	self.isVisible = isVisible

end


--
function UI.HudVignetteLowHpWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudVignetteLowHpWnd:Reset()

	self.hp			= -1
	self.shield		= -1
	self.timer		= -1
	self.isVisible	= false

	self:AddStyle( UI.WS_NOT_DRAW )

end