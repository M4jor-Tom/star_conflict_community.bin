-- ----------------------------------------------------------------------------
--
-- Workfile: FullScreenWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- --
-- ----------------------------------------------------------------------------
--  $Id: fullscreenwnd.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

UI.FullScreenWnd = {}
local bw = UI.FullScreenWnd

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -------------------------------
-- window definition
-- -------------------------------

UI.FullScreenWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "FullScreenWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		activationOrder	= 0,
		isPrototype		= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.FullScreenWnd:Show( bPlayStartAnim )

	if self:IsOnScreen() then

		self.bToHide = false
		self:StopHideAnimation()

	else

		UI.Root:AddChild( self )
		self:StartShowAnimation( bPlayStartAnim )

	end

end


--
function UI.FullScreenWnd:Hide( bPlayAnim, bPlayFinalAnim )

	if not self:IsOnScreen() then
		return
	end

	if not bPlayAnim then
		bPlayFinalAnim = false
	end

	if not bPlayAnim then
		self:UnlinkFromParent()		
		return
	end

	self.bToHide = true
	self:StopShowAnimation()
	self:StartHideAnimation( bPlayFinalAnim )	

end   

-- -------------------------------
-- const
-- -------------------------------

bw.layers =
{
    MAIN_EFFECT				= 0, 
    BG_EFFECT           	= 1, 
}

bw.IS_FULL_SCREEN	= true

bw.showAnimations		= {}
bw.startShowAnimations	= {}
bw.hideAnimations		= {}
bw.finalHideAnimations	= {}

bw.effectInfo =
{
	main =
	{
		animIdle = "idle"		
	},

	bg =
	{
		animIdle = "idle"
	}
}

-- -------------------------------
-- "static" vars
-- -------------------------------

bw.bgAnimTime	= 0
bw.bgEffectName	= ""
bw.bgAnimIdle	= "idle"

-- -------------------------------
-- vars
-- -------------------------------

bw.keyTipPanel			= nil
bw.creepingLine			= nil
bw.numShowAnimations	= 0
bw.numHideAnimations	= 0
bw.bToHide				= false
bw.commandOnHide		= { fn = "", params = nil }

-- -------------------------------
-- animations
-- -------------------------------

bw.animations = {}

bw.animationShowLayersBase =
{
	length	= 1000,
	loop	= true,

	animInfo = {},

	--
	onStart = function( self, w, animation )

		w.numShowAnimations = w.numShowAnimations + 1

		for idx, info in pairs( self.animInfo ) do

			wnd = info.wndName and UI[ info.wndName ] or w
			local effect = UI:GetEffectFromLayer( wnd, info.layer )

			if effect and effect:HasAnimation( info.anim ) then
				effect:StartAnimation( info.anim )
			end

		end			

	end, 

	--
	onStop = function( self, w, animation )

		w.numShowAnimations = w.numShowAnimations - 1

		if UI:IsInRemovingAllWindows() then
			return
		end

		for idx, info in pairs( self.animInfo ) do

			wnd = info.wndName and UI[ info.wndName ] or w
			local effect = UI:GetEffectFromLayer( wnd, info.layer )

			if effect then
				effect:StartAnimation( info.animIdle or "idle" )
			end

		end							

		if w.numShowAnimations == 0 then
			w:OnStopShowAnimation()
		end						

	end, 

	--
	onUpdate = function( self, w, animation, dt )

		for idx, info in pairs( self.animInfo ) do

			wnd = info.wndName and UI[ info.wndName ] or w
			local effect = UI:GetEffectFromLayer( wnd, info.layer )

			if effect and effect:GetCurAnimation() == info.anim and wnd:IsLayerVisible( info.layer ) then
				return
			end				

		end

		animation:Stop()

	end,		
}

bw.animationHideLayersBase =
{
	length	= 1000,
	loop	= true,

	animInfo = {},

	--
	onStart = function( self, w, animation )

		w.numHideAnimations = w.numHideAnimations + 1

		for idx, info in pairs( self.animInfo ) do

			wnd = info.wndName and UI[ info.wndName ] or w
			local effect = UI:GetEffectFromLayer( wnd, info.layer )

			if effect and effect:HasAnimation( info.anim ) then
				effect:StartAnimation( info.anim )
			end

		end			

	end,

	--
	onStop = function( self, w, animation )

		w.numHideAnimations = w.numHideAnimations - 1

		if UI:IsInRemovingAllWindows() then
			return
		end

		if w.numHideAnimations == 0 then
			w:OnStopHideAnimation()
		end						

	end,

	--
	onUpdate = function( self, w, animation, dt )

		for idx, info in pairs( self.animInfo ) do

			wnd = info.wndName and UI[ info.wndName ] or w
			local effect = UI:GetEffectFromLayer( wnd, info.layer )

			if effect and effect:GetCurAnimation() == info.anim then
				return
			end				

		end

		animation:Stop()

	end,		
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.FullScreenWnd:F_PostLoad()    

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.commandOnHide = { fn = "", params = nil }

	self.keyTipPanel	= self:GetChildByName( "keyTipPanel" )
	self.creepingLine	= self:GetChildByName( "creepingLine" )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_KEY_TIP )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.FullScreenWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcAbsVals()
	self:RestoreBgAnimTime()
	self:FullUpdate()

end


--
function UI.FullScreenWnd:F_OnAfterHideFromScreen()

	self.bToHide = false

	if not UI:IsInRemovingAllWindows() then
		self:ResetEffectAnimations()
		self:SaveBgAnimTime()
	end

	self:OnAfterHideFromScreen()

end


--
function UI.FullScreenWnd:Reset()

	if self.creepingLine then
		self.creepingLine:Reset()
	end

end


--
function UI.FullScreenWnd:FullUpdate()

	self:Reset()
	self:UpdateKeyTipPanel()
	self:UpdateCreepingLine()

end


-- for overriding
function UI.FullScreenWnd:UpdateKeyTipPanel()
end


-- for overriding
function UI.FullScreenWnd:UpdateCreepingLine()
end


--
function UI.FullScreenWnd:StartShowAnimation( bPlayStartAnim )

	-- необходимо, чтобы в случае, если одна из анимаций завершится сразу же при старте,
	-- не запустилась обработка конца анимации

	self.numShowAnimations = self.numShowAnimations + 1

	if bPlayStartAnim then
		for i = 1, #self.startShowAnimations do
			self:StartAnimation( self.startShowAnimations[ i ] )
		end		
	end

	for i = 1, #self.showAnimations do
		self:StartAnimation( self.showAnimations[ i ] )
	end		

	self.numShowAnimations = self.numShowAnimations - 1

	if self.numShowAnimations == 0 then
		self:OnStopShowAnimation()
	end

end


--
function UI.FullScreenWnd:StopShowAnimation()

	for i = 1, #self.showAnimations do
		self:StopAnimation( self.showAnimations[ i ] )
	end

	for i = 1, #self.startShowAnimations do
		self:StopAnimation( self.startShowAnimations[ i ] )
	end

end


--
function UI.FullScreenWnd:IsPlayingShowAnimation()

	return self.numShowAnimations > 0

end


--
function UI.FullScreenWnd:StartHideAnimation( bPlayFinalAnim )

	-- необходимо, чтобы в случае, если одна из анимаций завершится сразу же при старте,
	-- не запустилась обработка конца анимации

	self.numHideAnimations = self.numHideAnimations + 1

    if bPlayFinalAnim then
		for i = 1, #self.finalHideAnimations do
			self:StartAnimation( self.finalHideAnimations[ i ] )
		end
	end

	for i = 1, #self.hideAnimations do
		self:StartAnimation( self.hideAnimations[ i ] )
	end

	self.numHideAnimations = self.numHideAnimations - 1

	if self.numHideAnimations == 0 then
		self:OnStopHideAnimation()
	end

end


--
function UI.FullScreenWnd:StopHideAnimation()

	for i = 1, #self.hideAnimations do
		self:StopAnimation( self.hideAnimations[ i ] )
	end

	for i = 1, #self.finalHideAnimations do
		self:StopAnimation( self.finalHideAnimations[ i ] )
	end

	self:ResetEffectAnimations()

end


--
function UI.FullScreenWnd:ResetEffectAnimations()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect and mainEffect:GetCurAnimation() ~= self.effectInfo.main.animIdle then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect and bgEffect:GetCurAnimation() ~= self.effectInfo.bg.animIdle then
		bgEffect:StartAnimation( self.effectInfo.bg.animIdle )
	end

end


--
function UI.FullScreenWnd:IsPlayingHideAnimation()

	return self.numHideAnimations > 0

end


--
function UI.FullScreenWnd:OnStopHideAnimation()

	if self.bToHide then
		self:UnlinkFromParent()
	end

	self:ExecuteCommandOnHide()

end


--
function UI.FullScreenWnd:OnStopShowAnimation()
end


--
function UI.FullScreenWnd:ExecuteCommandOnHide()

	if self.commandOnHide.fn ~= "" then
		self[ self.commandOnHide.fn ]( self, self.commandOnHide.params )
	end

	self:ResetCommandOnHide()

end


--
function UI.FullScreenWnd:ResetCommandOnHide()

	self.commandOnHide = { fn = "", params = nil }

end


--
function UI.FullScreenWnd:IsInputBlocked()

	return self:IsPlayingShowAnimation() or self:IsPlayingHideAnimation()

end	


--
function UI.FullScreenWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then

    	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
    		return true
		else 
			return self:HandleKey( key, -2 )
    	end

	end		

	if self.OnTab then
		return self:HandleKey( key, -2 )
	else
		return true
	end

end


--[[
function UI.FullScreenWnd:F_OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if UI.Wnd.F_OnJoystickKeyDown( self, key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	return self:HandleKey( key, controllerIdx )

end
]]


--[[
function UI.FullScreenWnd:F_OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if UI.Wnd.F_OnJoystickKeyDown_1( self, key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	return self:HandleKey( key, controllerIdx )

end
]]


--[[
function UI.FullScreenWnd:F_OnJoystickMove( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx )

	if self:OnJoystickMove( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	return self:HandleJoystickMovement( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, 0, controllerIdx )	

end
]]


--[[
function UI.FullScreenWnd:F_OnJoystickMove_1( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx )

	if self:OnJoystickMove_1( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	return self:HandleJoystickMovement( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, 1, controllerIdx )	

end  
]]


--
function UI.FullScreenWnd:F_OnKeyTip( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:HandleKey( iParam0, -2 )

end


-- for overriding
function UI.FullScreenWnd:F_OnEventSaveUiState()
end


-- for overriding
function UI.FullScreenWnd:F_OnEventRestoreUiState()
end


--
function UI.FullScreenWnd:SaveBgAnimTime()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )

	if bgEffect and bgEffect:GetName() == self.bgEffectName and bgEffect:GetCurAnimation() == self.bgAnimIdle then
		 UI.FullScreenWnd.bgAnimTime = bgEffect:GetAnimationTime()
	end

end


--
function UI.FullScreenWnd:RestoreBgAnimTime()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )

	if bgEffect and bgEffect:GetName() == self.bgEffectName and bgEffect:GetCurAnimation() == self.bgAnimIdle then
		bgEffect:SetAnimationTime( UI.FullScreenWnd.bgAnimTime )
		bgEffect:Update( 0 )
	end

end


--
function UI.FullScreenWnd:RecalcAbsVals()
end


--
function UI.FullScreenWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:RecalcAbsVals()

end


--
function UI.FullScreenWnd:HandleTooltip( targetWnd, tooltipData )

	return false

end