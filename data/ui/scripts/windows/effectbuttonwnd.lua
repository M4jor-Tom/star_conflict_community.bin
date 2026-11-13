-- ----------------------------------------------------------------------------
--
-- Workfile: EffectButtonWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id: effectbuttonwnd.lua 3234 2011-06-01 11:31:08Z $
-- ----------------------------------------------------------------------------


UI.EffectButtonWnd = {}
local ht = UI.EffectButtonWnd


-- --------------------------------
-- window definition
-- --------------------------------

UI.EffectButtonWnd.def =
{
	className = "ButtonWnd",

	props =
	{
		name		= "EffectButtonWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
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

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,			
			texture		= "white",
			color		= UI:ARGB( 0x55, 0xff, 0x00, 0x00 ),
			visible		= _BORDERS_DEBUG == true,
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.EffectButtonWnd:Press()

	self.pressTimer = self.PRESS_TIME
	self:UpdateEffectAnimation()

end


--
function UI.EffectButtonWnd:Release()

	self.pressTimer = -1
	self:UpdateEffectAnimation()

end


--
function UI.EffectButtonWnd:Enable( bEnable )

	local isEnalbed = self:IsEnabled()
	if isEnalbed == bEnable then
		return
	end

	if bEnable then
		self:RemoveStyle( UI.WS_DISABLE )
	else
		self:AddStyle( UI.WS_DISABLE )
	end

end


--
function UI.EffectButtonWnd:IsEnabled()

	return not self:HasStyle( UI.WS_DISABLE )

end


--
function UI.EffectButtonWnd:SetGray( bGray )

	if bGray then
		self:AddStyle( UI.WS_GRAYED )
	else
		self:RemoveStyle( UI.WS_GRAYED )
	end

end


--
function UI.EffectButtonWnd:IsGray()

	return self:HasStyle( UI.WS_GRAYED )

end


--
function UI.EffectButtonWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.EffectButtonWnd:GetTooltipData( tooltipData )

	return self.tooltipData

end


-- --------------------------------
-- const
-- --------------------------------

UI.EffectButtonWnd.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "select",
		animationPressed		= "pressed",
		animationDisabled		= "disabled",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "select",
		animationPressed_focus	= "pressed",
	},
}

UI.EffectButtonWnd.layers =
{
	MAIN_EFFECT			= 0,
	DEBUG				= 1,
}

UI.EffectButtonWnd.PRESS_TIME = 0.1

-- --------------------------------
-- vars
-- --------------------------------

UI.EffectButtonWnd.pressTimer	= -1
UI.EffectButtonWnd.tooltipData	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.EffectButtonWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.pressTimer = -1

end


--
function UI.EffectButtonWnd:F_UpdateAppearance()

	if not self:IsPrototype() then
		self:UpdateEffectAnimation()
	end

end


--
function UI.EffectButtonWnd:UpdateEffectAnimation()

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local mouseState = self:GetMouseState()
	local animation = ""
	local curAnimation = mainEffect:GetCurAnimation()
	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

	if self.pressTimer ~= -1 then
		animation = self.effectInfo.main.animationPressed

	elseif self:HasStyle( UI.WS_GRAYED ) or self:HasStyle( UI.WS_DISABLE ) then
		animation = self.effectInfo.main.animationDisabled

	elseif mouseState == UI.MOUSE_DOWN then
		animation = bHasFocus and self.effectInfo.main.animationPressed_focus or self.effectInfo.main.animationPressed
		self.pressTimer = self.PRESS_TIME

	elseif mouseState == UI.MOUSE_OUT then
		animation = bHasFocus and self.effectInfo.main.animationIdle_focus or self.effectInfo.main.animationIdle

	elseif mouseState == UI.MOUSE_IN then
		animation = bHasFocus and self.effectInfo.main.animationSelect_focus or self.effectInfo.main.animationSelect
	end

	if animation and animation ~= "" and animation ~= curAnimation then
		mainEffect:StartAnimation( animation )
	end

end


--
function UI.EffectButtonWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.pressTimer ~= -1 then
		self.pressTimer = self.pressTimer - dt_sys
		if self.pressTimer < 0 then

			self.pressTimer = -1
			self:UpdateEffectAnimation()

		end
	end

end


--
function UI.EffectButtonWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	self.pressTimer = -1

end