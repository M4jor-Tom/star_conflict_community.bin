-- ----------------------------------------------------------------------------
--
-- Workfile: FullScreenSelectionWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- --
-- ----------------------------------------------------------------------------
--  $Id: fullscreenselectionwnd.lua 3234 2011-06-01 11:31:08Z $
-- ----------------------------------------------------------------------------

UI.FullScreenSelectionWnd = {}
local bw = UI.FullScreenSelectionWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.FullScreenSelectionWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "FullScreenSelectionWnd",
		isPrototype		= true,
	},
}

-- -------------------------------
-- const
-- -------------------------------

-- from Wnd
bw._JOY_FIRST_DELAY			= 0.5
bw._JOY_DELAY				= 0.2

-- from FullScreenWnd
bw.showAnimations		= {}
bw.hideAnimations		= {}

bw.DELAY_SINCE_MOUSE_WHEEL	= 0.2
bw.selectSound				= ""
bw.KB_SCROLL_DELAY_FIRST	= bw._JOY_FIRST_DELAY
bw.KB_SCROLL_DELAY			= bw._JOY_DELAY

bw.scrollKeys =
{
    [ UI.VKeys.LEFT ]		= true,
    [ UI.VKeys.RIGHT ]		= true,
    [ UI.VKeys.UP ]			= true,
    [ UI.VKeys.DOWN	]		= true,
    [ UI.VKeys.PAGEUP	]	= true,
    [ UI.VKeys.PAGEDOWN ]	= true,
}

-- -------------------------------
-- vars
-- -------------------------------

bw.listWnd				= nil   
bw.timeSinceMouseWheel	= -1
bw.scrollKey			= -1
bw.scrollControllerIdx	= -1
bw.scrollTimer			= -1

-- -------------------------------
-- animations
-- -------------------------------

bw.animations = {}

--
bw.animations.showButtons =
{
    length	= 1000,
    loop	= true,

	animName = "on_show",

	--
    onStart = function( self, w, animation )

    	w.numShowAnimations = w.numShowAnimations + 1

		if w.listWnd then
        	local effect = UI:GetEffectFromLayer( w.listWnd, w.listWnd.layers.MAIN_EFFECT )
        	if effect and effect:HasAnimation( self.animName ) then
        		effect:StartAnimation( self.animName )
        	end
		end

    end,   

	--
    onStop = function( self, w, animation )

    	w.numShowAnimations = w.numShowAnimations - 1

    	if UI:IsInRemovingAllWindows() then
    		return
    	end

		if w.listWnd then
        	local effect = UI:GetEffectFromLayer( w.listWnd, w.listWnd.layers.MAIN_EFFECT )
        	if effect then
        		effect:StartAnimation( "idle" )
        	end
		end

    end,

	--
    onUpdate = function( self, w, animation, dt )

		if not w.listWnd or not w.listWnd:IsChildOf( w ) then
        	animation:Stop()
			return
		end

    	local effect = UI:GetEffectFromLayer( w.listWnd, w.listWnd.layers.MAIN_EFFECT )
    	if not effect or effect:GetCurAnimation() ~= self.animName then
        	animation:Stop()
    		return
    	end				

    end,
}	

--
bw.animations.hideButtons =
{
    length	= 1000,
    loop	= true, 

	animName = "on_hide",

	--
    onStart = function( self, w, animation )

    	w.numHideAnimations = w.numHideAnimations + 1

		if w.listWnd then
        	local effect = UI:GetEffectFromLayer( w.listWnd, w.listWnd.layers.MAIN_EFFECT )
        	if effect and effect:HasAnimation( self.animName ) then
        		effect:StartAnimation( self.animName )
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

		if not w.listWnd or not w.listWnd:IsChildOf( w ) then
        	animation:Stop()
			return
		end

    	local effect = UI:GetEffectFromLayer( w.listWnd, w.listWnd.layers.MAIN_EFFECT )
    	if not effect or effect:GetCurAnimation() ~= self.animName then
        	animation:Stop()
			return
    	end				

    end,
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.FullScreenSelectionWnd:F_PostLoad()    

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.listWnd = self:GetChildByName( "list" )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )

end


--
function UI.FullScreenSelectionWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self.timeSinceMouseWheel 	= -1

	self.scrollTimer			= -1			
	self.scrollKey				= key
	self.scrollControllerIdx	= -1

end


--
function UI.FullScreenSelectionWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	if self.listWnd then
		self.listWnd:Clear()
	end

end


--
function UI.FullScreenSelectionWnd:FullUpdate()

	self:Reset()

	self:UpdateList()
	self:ValidateListSelection()
	self:UpdateKeyTipPanel()
	self:UpdateCreepingLine()

end


-- for overriding
function UI.FullScreenSelectionWnd:UpdateList()
end


--
function UI.FullScreenSelectionWnd:ValidateListSelection()

	if not self.listWnd then
		return
	end

	if self.listWnd:GetNumRecords() > 0 then
		self.listWnd:SelectRecord( 1, false )
	end

end


--
function UI.FullScreenSelectionWnd:ResetEffectAnimations()

	UI.FullScreenWnd.ResetEffectAnimations( self )

	if self.listWnd then
    	local listEffect = UI:GetEffectFromLayer( self.listWnd, self.listWnd.layers.MAIN_EFFECT )
    	if listEffect then
    		listEffect:StartAnimation( self.listWnd.effectInfo.main.animIdle )
    	end
	end

end


--
function UI.FullScreenSelectionWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return self.listWnd ~= nil
	end

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self.timeSinceMouseWheel = 0
	self:ScrollList( ticks < 0 )

	return true

end


--
function UI.FullScreenSelectionWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return self.listWnd ~= nil
	end

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if not self.listWnd then
		return false
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	local btn = self:GetSlotByInput( w )
	if not btn then
		return false
	end	

	if self.listWnd:HasListStyle( UI.BaseListWnd.listStyles.FIXED_SELECTION ) then
		return false
	end

	if self.timeSinceMouseWheel ~= -1 then
		return true
	end

   	local slotIdx = btn:GetSlot()
   	local recordIdx = self.listWnd:Slot2RecordIdx( slotIdx )

	if recordIdx ~= -1 and recordIdx ~= self.listWnd:GetSelectedRecord() then
		self.listWnd:SelectRecord( recordIdx, true )
		if self.selectSound and self.selectSound ~= "" then
			UI:PlayGlobalSound( self.selectSound )
		end
	end

	return true

end


--
function UI.FullScreenSelectionWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return self.listWnd ~= nil
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if not self.listWnd then
		return false
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	local btn = self:GetSlotByInput( w )
	if not btn then
		return false
	end	

	if not self.listWnd:HasListStyle( self.listWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK ) then
		return false
	end

   	local slotIdx = btn:GetSlot()
   	local recordIdx = self.listWnd:Slot2RecordIdx( slotIdx )

	if recordIdx ~= -1 then
		self.listWnd:SelectRecord( recordIdx, true )

		local data = self.listWnd:GetRecordData( recordIdx )
		if not data.bDisabled then
			self:ActivateSelRecord( UI.Keys.KEY_MOUSE_BUTTON1 )
		elseif self.TryActivateLockedRecord then
			self:TryActivateLockedRecord()
		end
	end

	return true

end    


--
function UI.FullScreenSelectionWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
		if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
			return true
		end
	end

	local bCanHandle = self:CheckScrollStart( key, -2 )

	if bCanHandle then
		return self:HandleKey( key, -2 )
	else
		return true
	end

end


--
function UI.FullScreenSelectionWnd:F_OnKeyboardKeyUp( key, wndThatReceivedInput )

	if self:OnKeyboardKeyUp( key, wndThatReceivedInput ) then
		return true
	end

	self:CheckScrollStop( key, -2 )
	return true

end


--[[
function UI.FullScreenSelectionWnd:F_OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if UI.Wnd.F_OnJoystickKeyDown( self, key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	local bCanHandle = self:CheckScrollStart( key, controllerIdx )

	if bCanHandle then
		return self:HandleKey( key, controllerIdx )
	else
		return true
	end

end
]]


--[[
function UI.FullScreenSelectionWnd:F_OnJoystickKeyUp( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if self:OnJoystickKeyUp( key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	self:CheckScrollStop( key, controllerIdx )
	return true

end
]]


--[[
function UI.FullScreenSelectionWnd:F_OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if UI.Wnd.F_OnJoystickKeyDown_1( self, key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	local bCanHandle = self:CheckScrollStart( key, controllerIdx )

	if bCanHandle then
		return self:HandleKey( key, controllerIdx )
	else
		return true
	end

end   
]]


--[[
function UI.FullScreenSelectionWnd:F_OnJoystickKeyUp_1( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if self:OnJoystickKeyUp_1( key, wndThatReceivedInput, gamepadType, controllerIdx ) then
		return true
	end

	self:CheckScrollStop( key, controllerIdx )
	return true

end
]]


--
function UI.FullScreenSelectionWnd:CheckScrollStart( key, controllerIdx )

	local bCanHandle = true

	if self:IsScrollKey( key ) then

		if key == self.scrollKey and controllerIdx == self.scrollControllerIdx then
			bCanHandle = false
		else
			self.scrollKey				= key
			self.scrollControllerIdx	= controllerIdx
			self.scrollTimer			= self:GetScrollDelay( key, true )
		end

	end         

	return bCanHandle

end


--
function UI.FullScreenSelectionWnd:CheckScrollStop( key, controllerIdx )

	if self.scrollKey ~= -1 then
		
		if key == self.scrollKey and controllerIdx == self.scrollControllerIdx then
			self.scrollKey				= -1
			self.scrollControllerIdx	= -1
			self.scrollTimer			= -1
		end

	end

end


--
function UI.FullScreenSelectionWnd:IsScrollKey( key )

	local vKey = UI:Key2VKey( key )
	return self.scrollKeys[ vKey ] == true

end   


--
function UI.FullScreenSelectionWnd:UpdateScrollRepeat( dt )

	if self.scrollTimer == -1 then
		return
	end

	self.scrollTimer = self.scrollTimer - dt

	if self.scrollTimer <= 0 then

		self.scrollTimer = self:GetScrollDelay( self.scrollKey, false )
		self:HandleKey( self.scrollKey, self.scrollControllerIdx )

	end		

end   


--
function UI.FullScreenSelectionWnd:GetScrollDelay( key, bFirst )

	return bFirst and self.KB_SCROLL_DELAY_FIRST or self.KB_SCROLL_DELAY

end


--
function UI.FullScreenSelectionWnd:OnEnter( key, controllerIdx )

	if not self.listWnd then
		return false
	end

	if self.keyTipPanel and not self.keyTipPanel:IsBtnEnabled( UI.Keys.KEY_ENTER ) then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end   	

	local selRecordIdx = self.listWnd:GetSelectedRecord()
	if selRecordIdx == -1 then
		return true
	end

	local data = self.listWnd:GetRecordData( selRecordIdx )
	if not data.bDisabled then
		self:ActivateSelRecord( key )
	else
		self:TryActivateLockedRecord()
	end

	return true

end


--
function UI.FullScreenSelectionWnd:OnUp( key, controllerIdx )

	if not self.listWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	self:ScrollList( false )
	return true

end


--
function UI.FullScreenSelectionWnd:OnDown( key, controllerIdx )

	if not self.listWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	self:ScrollList( true )
	return true

end


--
function UI.FullScreenSelectionWnd:OnHome( key, controllerIdx )

	if not self.listWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	self.listWnd:ScrollHome()
	return true

end


--
function UI.FullScreenSelectionWnd:OnEnd( key, controllerIdx )

	if not self.listWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	self.listWnd:ScrollEnd()
	return true

end


-- for overriding
function UI.FullScreenSelectionWnd:ActivateSelRecord( key )
end


-- for overriding
function UI.FullScreenSelectionWnd:TryActivateLockedRecord()
end


--
function UI.FullScreenSelectionWnd:ScrollList( bForward )

	if self.listWnd then
		self.listWnd:Scroll( bForward )
	end

end


--
function UI.FullScreenSelectionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateMouseWheelDelay( dt_sys )
	self:UpdateScrollRepeat( dt_sys )
	
end


--
function UI.FullScreenSelectionWnd:UpdateMouseWheelDelay( dt )

	if self.timeSinceMouseWheel ~= -1 then

		self.timeSinceMouseWheel = self.timeSinceMouseWheel + dt

		if self.timeSinceMouseWheel >= self.DELAY_SINCE_MOUSE_WHEEL then
			self.timeSinceMouseWheel = -1
		end

	end

end


--
function UI.FullScreenSelectionWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self.listWnd or hSender ~= self.listWnd:GetUiHandle() then
		return
	end

	self:OnListSelectionChanged()

end


--
function UI.FullScreenSelectionWnd:OnListSelectionChanged()

	self:UpdateKeyTipPanel()
	self:UpdateCreepingLine()

end


--
function UI.FullScreenSelectionWnd:F_OnLostKeyboardFocus()

	self:OnLostKeyboardFocus()

	self.timeSinceMouseWheel	= -1
	self.scrollTimer 			= -1			
	self.scrollKey				= -1
	self.scrollControllerIdx	= -1

end


--
function UI.FullScreenSelectionWnd:GetSlotByInput( w )

	if w.BUTTON_LIST_BTN then
		return w
	end

	local parent = w:GetParent()
	while parent do
		if parent.BUTTON_LIST_BTN then
			return parent
		end
		parent = parent:GetParent()
	end

	return nil

end  


-- ---------------------------------------------------
-- UI.FullScreenSelection_ListWnd
-- ---------------------------------------------------

UI.FullScreenSelection_ListWnd =
{
	def =
	{
    	className 	= "Wnd",
    	prototype	= "ButtonsListWnd",

    	props =
    	{
    		name			= "FullScreenSelection_ListWnd",
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
    	}
	},

	btnPrototypeName	= "FullScreenSelection_ListBtn",
	listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK + UI.BaseListWnd.listStyles.WRAPPED_SCROLL,
	MAX_SLOTS			= 6,

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "",
    		scrollObjName		= "",
			animIdle			= "idle",
    	}
    }
}

-- ---------------------------------------------------
-- UI.FullScreenSelection_ListBtn
-- ---------------------------------------------------

UI.FullScreenSelection_ListBtn = {}
local mwb = UI.FullScreenSelection_ListBtn

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.FullScreenSelection_ListBtn.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "FullScreenSelection_ListBtn",
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

		-- TEXT
		{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
			{
  				fontName = UI:GetFontPattern( "Small" ), 
   			},
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.FullScreenSelection_ListBtn:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )

end


--
function UI.FullScreenSelection_ListBtn:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()

	self:UpdateColor( data )
	self:UpdateEffectAnimation( data, bAnimated )

end


-- -------------------------------------
-- const
-- -------------------------------------

--[[ data format need be:

	{
		[text		= <string>],
		[color		= <int>],
		[bDisabled	= <boolean>],
	} 
]]


mwb.layers =
{
	MAIN_EFFECT		= 0,
	TEXT			= 1,
}

mwb.colors =
{
	textNormal				= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
	textSelect				= UI:ARGB( 0xff, 54, 147, 237 ),
	textDisabled			= UI:ARGB( 0xff, 0x77, 0x77, 0x77 ),
	textDisabledSelected	= UI:ARGB( 0xff, 0, 0, 0 ),
}

mwb.effectInfo =
{
	main  =
	{
		animIdle			= "",
		animSelect			= "",
		animOnSelect 		= "",
		animOnRelease		= "",
		animDisabled		= "",
		animDisabledSelect	= "",
	},
}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.FullScreenSelection_ListBtn:UpdateForData( data, bAnimated )

	self:UpdateText( data )
	self:UpdateColor( data )
	self:UpdateEffectAnimation( data, bAnimated )

end


--
function UI.FullScreenSelection_ListBtn:UpdateText( data )

	local text = data and data.text or ""
	self:SetText( text, self.layers.TEXT )

end


--
function UI.FullScreenSelection_ListBtn:UpdateColor( data )

	local color = data and data.color

	if not color then

		local bSelected	= self:IsSelected()
		local bDisabled	= self:IsDisabled( data )

		if bDisabled and bSelected then
			color = self.colors.textDisabledSelected

		elseif bDisabled then
			color = self.colors.textDisabled

		elseif bSelected then
			color = self.colors.textSelect		

		else
			color = self.colors.textNormal
		end

	end

	self:SetColor( color, self.layers.TEXT )

end


--
function UI.FullScreenSelection_ListBtn:UpdateEffectAnimation( data, bTransit )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return		
	end

	local bSelected	= self:IsSelected()
	local bDisabled	= self:IsDisabled( data )


	local dstAnim = ""

	if not bDisabled and not bSelected then
		dstAnim = self.effectInfo.main.animIdle 

	elseif not bDisabled and bSelected then
		dstAnim = self.effectInfo.main.animSelect

	elseif bDisabled and not bSelected then
		dstAnim = self.effectInfo.main.animDisabled

	elseif bDisabled and bSelected then 
		dstAnim = self.effectInfo.main.animDisabledSelect
	end


	local curAnim = mainEffect:GetCurAnimation()

	if dstAnim == curAnim then
		return
	end

	local animToApply = dstAnim

	if bTransit and not bDisabled then
		local animTransit = bSelected and self.effectInfo.main.animOnSelect or self.effectInfo.main.animOnRelease
		if mainEffect:HasAnimation( animTransit ) then
			animToApply = animTransit 
		end
	end

	mainEffect:StartAnimation( animToApply )
	
end


--
function UI.FullScreenSelection_ListBtn:F_OnEffectAnimationEnded( effect, animName )

	local data = self:GetRecordData()
	self:UpdateEffectAnimation( data, false )

end


--
function UI.FullScreenSelection_ListBtn:IsDisabled( data )

	return data and data.bDisabled

end