-- ----------------------------------------------------------------------------
--
-- Workfile: EffectComboBoxWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.EffectComboBoxWnd = {}
local cb = UI.EffectComboBoxWnd

-- --------------------------------
-- window definition
-- --------------------------------

UI.EffectComboBoxWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "EffectComboBoxWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.EffectComboBoxWnd:Open()

	if not self:IsOnScreen() then
		sys.log( "UI.EffectComboBoxWnd:Open()[ERROR]: not on screen" )
		return
	end

	self:SetState( self.states.OPEN )

end


--
function UI.EffectComboBoxWnd:Close()

	self:SetState( self.states.CLOSED )

end


--
function UI.EffectComboBoxWnd:IsOpen()

	return self.state == self.states.OPEN

end


--
function UI.EffectComboBoxWnd:GetSelectedText()

	if self.selItemWnd and self.selItemWnd:GetClassName() == "EditWnd" then
		return self.selItemWnd:GetEditText()	
	else
		sys.log( "UI.EffectComboBoxWnd:GetSelectedText()[ERROR]: wrong selItemWnd" )
	end

end


--
function UI.EffectComboBoxWnd:SetSelectedText( text )

	if self.selItemWnd and self.selItemWnd:GetClassName() == "EditWnd" then
	
		self.selItemWnd:SetEditText( text )
		self.selItemWnd:SetCursorPos( 0 )

	else
		sys.log( "UI.EffectComboBoxWnd:SetSelectedText()[ERROR]: wrong selItemWnd" )
	end

end


--
function UI.EffectComboBoxWnd:AddRecord( data )

	self.listWnd:AddRecord( data )
	self:UpdateListRelPos()

end


--
function UI.EffectComboBoxWnd:GetSelectedRecord()

	return self.selRecordIdx

end


--
function UI.EffectComboBoxWnd:SelectRecord( recordIdx )

	if self.selRecordIdx == recordIdx then
		return
	end	

	if recordIdx ~= -1 then
		if recordIdx < 1 or recordIdx > self:GetNumRecords() then
			sys.log( "UI.EffectComboBoxWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
			return
		end
	end

	local oldSelRecordIdx = self.selRecordIdx
	self.selRecordIdx = recordIdx

	if self.state == self.states.OPEN then
		self.listWnd:SelectRecord( recordIdx )		
	end

	self:OnSelectRecord()

	UI:SendUiEvent( UI.EV_COMBO_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )

end


--
function UI.EffectComboBoxWnd:GetRecordData( recordIdx )

	return self.listWnd:GetRecordData( recordIdx )

end


--
function UI.EffectComboBoxWnd:SetRecordData( data, recordIdx )

	self.listWnd:SetRecordData( data, recordIdx )

end


--
function UI.EffectComboBoxWnd:GetNumRecords()

	return self.listWnd:GetNumRecords()

end


--
function UI.EffectComboBoxWnd:GetMaxVisibleRecords()

	return self.MAX_VISIBLE_RECORDS

end


--
function UI.EffectComboBoxWnd:SetMaxVisibleRecords( count )

	if count < 0 then
		sys.log( "UI.EffectComboBoxWnd:SetMaxVisibleRecords()[ERROR]: negative count" )
		return
	end

	if self:GetNumRecords() > 0 then
		sys.log( "UI.EffectComboBoxWnd:SetMaxVisibleRecords()[ERROR]: the list is not empty; call Reset() first" )
		return
	end

	self.MAX_VISIBLE_RECORDS = count
	self.listWnd:SetMaxSlots( count )
	
end


--
function UI.EffectComboBoxWnd:Reset()

	self:Close()

	self.selRecordIdx = -1

	self.listWnd:Clear()
	self:UpdateListRelPos()

	self:ResetSelItemWnd()

end


--
function UI.EffectComboBoxWnd:Enable( bEnable )

	if bEnable then

		self:RemoveStyle( UI.WS_GRAYED )	-- UI.WS_DISABLE нельзя использовать, т.к. он включает в себя UI.WS_NOT_MOUSE_REACT, а реакции на мышь для главного окна не надо
		self.stateBtn:RemoveStyle( UI.WS_DISABLE )
		self.selItemWnd:RemoveStyle( UI.WS_GRAYED )

	else

		self:AddStyle( UI.WS_GRAYED )	
		self.stateBtn:AddStyle( UI.WS_DISABLE )	
		self.selItemWnd:AddStyle( UI.WS_GRAYED )

		self:Close()

	end

end


--
function UI.EffectComboBoxWnd:IsEnabled()

	return not self:HasStyle( UI.WS_GRAYED )

end


-- раскрываемый список не является формально дочерним объектом комбобокса, а является дочерним непосредственно UI.Root;
-- эта функция рассматривает его логически как дочерний комбобоксу
function UI.EffectComboBoxWnd:IsUnderMouse()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	return wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) or wndUnderMouse == self.listWnd or wndUnderMouse:IsChildOf( self.listWnd ) )

end


-- --------------------------------
-- const
-- --------------------------------

cb.layers =
{
	MAIN_EFFECT	= 0,
}

cb.styles =
{
	EDITING_ENABLED = 1,
}

cb.orientations =
{
	DONW	= 1,
	UP		= 2,
}

cb.states =
{
	CLOSED	= 1,
	OPEN	= 2,
}

cb.MAX_VISIBLE_RECORDS	= 0

cb.selItemPrototypeName		= "ComboBox_EditWnd"
cb.listPrototypeName		= "ComboBox_ListWnd"
cb.stateBtnPrototypeName	= "ComboBox_StateBtn"

cb.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ cb.orientations.DONW ]	= "",
			[ cb.orientations.UP ]		= "",
		},

		selItemObjName			= "",
		listObjName			= "",
		stateBtnObjName		= "",
	}
}

cb.soundActivateRecord	= "sound/ui/btnClick"
cb.soundOpen			= "sound/ui/commonListOpen"
cb.soundClose			= "sound/ui/commonListClose"

-- --------------------------------
-- vars
-- --------------------------------

cb.style				= 0
cb.orientation			= cb.orientations.DONW
cb.state				= cb.states.CLOSED
cb.selItemWnd			= nil
cb.listWnd				= nil
cb.stateBtn				= nil
cb.selRecordIdx			= -1
cb.listPos				= Vec2( 0, 0 )

-- --------------------------------
-- fork functions
-- --------------------------------

--
function UI.EffectComboBoxWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.listPos = Vec2( 0, 0 )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:RecalcLayout()

	local handle = self:GetUiHandle()	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )

end


--
function UI.EffectComboBoxWnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.EffectComboBoxWnd:DeleteControls()

	if self.listWnd then
		UI:RemoveUiObj( self.listWnd:GetUiHandle() )
		self.listWnd = nil
	end

end


--
function UI.EffectComboBoxWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selItemProto = UI[ self.selItemPrototypeName ]
    self.selItemWnd = UI:CreateChildWnd( self, selItemProto, "" )
	UI:AddChildAndLink( self, self.selItemWnd, mainEffect, self.effectInfo.main.selItemObjName, UI.EffectAnimParams.POS )	

	local listProto = UI[ self.listPrototypeName ]
    self.listWnd = UI:CreateChildWnd( self, listProto, "" )
	self.listWnd:Setup( self )
	self.listWnd:SetMaxSlots( self.MAX_VISIBLE_RECORDS )

	local stateBtnProto = UI[ self.stateBtnPrototypeName ]
    self.stateBtn = UI:CreateChildWnd( self, stateBtnProto, "" )
	UI:AddChildAndLink( self, self.stateBtn, mainEffect, self.effectInfo.main.stateBtnObjName, UI.EffectAnimParams.POS )	
	
end


--
function UI.EffectComboBoxWnd:RecalcLayout()

	self:UpdateMainAnimation()
	self:UpdateListRelPos()
	self:UpdateListVisibility()

end


--
function UI.EffectComboBoxWnd:SetState( state )

	if state == self.state then
		return
	end

	self.state = state

	self:UpdateListVisibility()

	if self.state == self.states.OPEN then
		self:ValidateListSelection()
	end

	self:UpdateStateBtn()

end


--
function UI.EffectComboBoxWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = self.effectInfo.main.orientation2Anim[ self.orientation ] or ""
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.EffectComboBoxWnd:UpdateListVisibility()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self.state == self.states.CLOSED then
		self.listWnd:UnlinkFromParent()
	else
		UI.Root:AddChild( self.listWnd )
	end

end


--
function UI.EffectComboBoxWnd:UpdateListRelPos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local listMainEffect = UI:GetEffectFromLayer( self.listWnd, self.listWnd.layers.MAIN_EFFECT )

	local locatorPos = mainEffect:GetObjPos( self.effectInfo.main.listObjName )
	local listPosY = 0

	if self.orientation == self.orientations.DONW then
		 listPosY = locatorPos.y

	elseif self.orientation == self.orientations.UP then

		local listMaxHeight	= listMainEffect and listMainEffect:GetObjSize( "self" ).y or 0
		local listHeight	= self.listWnd:GetHeight()

		listPosY = locatorPos.y + listMaxHeight - listHeight

	end

	self.listPos.x = locatorPos.x
	self.listPos.y = listPosY

	if self:IsOnScreen() then
		self:UpdateListScreenPos()
	end

end    


--
function UI.EffectComboBoxWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateListScreenPos()
	end

end


--
function UI.EffectComboBoxWnd:UpdateListScreenPos()

	if not self.listWnd then
		return
	end

	self.listWnd:SetLeft( self:XToScreen( self.listPos.x ) )
	self.listWnd:SetTop( self:YToScreen( self.listPos.y ) )

end


--
function UI.EffectComboBoxWnd:ValidateListSelection()

	local selRecordIdx = self.selRecordIdx

	if selRecordIdx == -1 and self:GetNumRecords() > 0 then
		selRecordIdx = 1
	end

	self.listWnd:SelectRecord( selRecordIdx  )

end


--
function UI.EffectComboBoxWnd:UpdateStateBtn()

	self.stateBtn:Check( self:IsOpen() )

end


--
function UI.EffectComboBoxWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender ~= self.listWnd:GetUiHandle() then
		return
	end

	self:OnListSelectRecord()

end


--
function UI.EffectComboBoxWnd:OnListSelectRecord()

	-- nothing?

end


--
function UI.EffectComboBoxWnd:OnSelectRecord()

	self:UpdateSelectedText()

end


--
function UI.EffectComboBoxWnd:UpdateSelectedText()

	if self.selItemWnd and self.selItemWnd:GetClassName() == "EditWnd" then

    	local text = ""
    	local data = nil

    	if self.selRecordIdx ~= -1 then
    		data = self.listWnd:GetRecordData( self.selRecordIdx )
    	end

    	text = data and data.text or ""
    	self.selItemWnd:SetEditText( text )
    	self.selItemWnd:SetCursorPos( 0 )

    	local color = data and data.color or 0
    	self.selItemWnd:SetTextColor( color )

	else
		sys.log( "UI.EffectComboBoxWnd:UpdateSelectedText()[ERROR]: wrong selItemWnd" )
	end
	
end


--
function UI.EffectComboBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.stateBtn then

		if self:IsOpen() then
			self:Close()
			UI:PlayGlobalSound( self.soundClose )

		else
			self:Open()
			UI:PlayGlobalSound( self.soundOpen )
		end

	end

	return false

end


--
function UI.EffectComboBoxWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

	self:UpdateListScreenPos()

end


--
function UI.EffectComboBoxWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:Close()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.EffectComboBoxWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if not self:IsUnderMouse() then
		self:Close()
	end

end


--
function UI.EffectComboBoxWnd:F_OnEventSaveUiState()

	self:Close()	

end


--
function UI.EffectComboBoxWnd:ListOnSlotClick( slotWnd )

	local recordIdx = slotWnd:GetRecord()		

	self:SelectRecord( recordIdx )
	self:Close()
	UI:PlayGlobalSound( self.soundActivateRecord )

end


--
function UI.EffectComboBoxWnd:ListOnEnter()

	local selRecordIdx = self.listWnd:GetSelectedRecord()

	if selRecordIdx ~= -1 then
	    self:SelectRecord( selRecordIdx )
    	UI:PlayGlobalSound( self.soundActivateRecord )
	else
    	UI:PlayGlobalSound( self.soundClose )
	end

    self:Close()

end


--
function UI.EffectComboBoxWnd:ListOnEscape()

    self:Close()
    UI:PlayGlobalSound( self.soundClose )

end


--
function UI.EffectComboBoxWnd:ResetSelItemWnd()

	if self.selItemWnd then

		if self.selItemWnd:GetClassName() == "EditWnd" then

	    	self.selItemWnd:SetEditText( "" )
    		self.selItemWnd:SetTextColor( 0 )

		else
			sys.log( "UI.EffectComboBoxWnd:ResetSelItemWnd()[ERROR]: wrong selItemWnd" )
		end

	end

end


-- -----------------------------------------------------------------------
-- UI.ComboBox_ListWnd
-- -----------------------------------------------------------------------

UI.ComboBox_ListWnd = {}
local cbl = UI.ComboBox_ListWnd

-- --------------------------------
-- window definition
-- --------------------------------

UI.ComboBox_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "ComboBox_ListWnd",
		isPrototype		= true,
		activationOrder	= 0,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			main		= true,
			updatable	= false,
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.ComboBox_ListWnd:Setup( comboBox )

	self.comboBox = comboBox

end


--
function UI.ComboBox_ListWnd:GetComboBox()

	return self.comboBox

end


--
function UI.ComboBox_ListWnd:SetMaxSlots( maxSlots )

	if self:GetNumRecords() > 0 then
		sys.log( "UI.ComboBox_ListWnd:SetMaxSlots()[ERROR]: the list is not empty" )
		return
	end

	if maxSlots == self.MAX_SLOTS then
		return
	end

	self:ClearSlots()

	self.MAX_SLOTS = maxSlots
	self:InitSlots()

	if self.scrollBar then
		self.scrollBar:SetPageSize( self.MAX_SLOTS )
	end

	self:RecalcLayout()

end


--
function UI.ComboBox_ListWnd:AddRecord( data )

	UI.ButtonsList3Wnd.AddRecord( self, data )
	self:RecalcListLayout()

end


--
function UI.ComboBox_ListWnd:Clear()

	UI.ButtonsList3Wnd.Clear( self )
	self:RecalcListLayout()

end


-- --------------------------------
-- const
-- --------------------------------

cbl.btnPrototypeName	= "ComboBox_ListSlot"
cbl.MAX_SLOTS			= 0
cbl.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK

cbl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "",
		scrollObjName		= "",
		animIdle			= "",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

cbl.ultimateMaxSlots	= 0		-- на сколько слотов максимус расчитан эффект
cbl.selectSound			= "sound/ui/btnMouseOver"
cbl.comboBox			= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.ComboBox_ListWnd:F_PostLoad()

	UI.ButtonsList3Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		while true do

			local objName = string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.ultimateMaxSlots + 1 )

			if not mainEffect:HasObject( objName ) then
				break
			end

			self.ultimateMaxSlots = self.ultimateMaxSlots + 1

		end     

		-- размер будет изменяться в зависимости от количества записей, поэтому убирается зависимость его от эффекта
		mainEffect:UnlinkWnd( self:GetUiHandle(), "self" )

	end

	self:RecalcListLayout()

end


--
function UI.ComboBox_ListWnd:ClearSlots()

	for slotIdx, slot in pairs( self.allSlots ) do
		if slot.btn then
			UI:RemoveUiObj( slot.btn:GetUiHandle() )
		end
	end

	UI:Purge()

	self.allSlots = {}
	self.slots = {}
	self.numSlots = 0

end


--
function UI.ComboBox_ListWnd:RecalcListLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local numVisibleSlots = math.min( self.numRecords, self.MAX_SLOTS )
	if numVisibleSlots == 0 then
		numVisibleSlots = 1		-- при отсутствии записей показывается место для одной записи
	end

	local t = UI:Clamp( numVisibleSlots / self.ultimateMaxSlots, 0, 1 )

	-- размер главного эффекта (устанавливается подобно прогрессбару)
	mainEffect:SetAnimationTime( t )
	mainEffect:Update( 0 )

	-- размер собственного rect
	local selfMaxHeight	= mainEffect:GetObjSize( "self" ).y
	local selfHeight	= selfMaxHeight * t
	self:SetHeight( selfHeight )	

	-- область слотов
	self.slotsRect.w = self.slotHeight * numVisibleSlots + self.slotsSpace * ( numVisibleSlots - 1 )
	self.slotsWnd:SetRect( self.slotsRect )

	-- размер скроллбара
	if self.scrollBar and self.scrollBar:IsChildOf( self ) then

		local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
		if scrollEffect then	

        	local maxHeight = mainEffect:GetObjSize( self.effectInfo.main.scrollObjName ).y
        	local baseHeight = scrollEffect:GetObjSize( "self" ).y

			local y0 = mainEffect:GetObjPos( self.effectInfo.main.scrollObjName ).y
			local y1 = y0 + maxHeight
			local dy = selfMaxHeight - y1

			local y1_new = selfHeight - dy
			local height_new = y1_new - y0

        	local scale = height_new / baseHeight
        	scrollEffect:SetScale( UI:Vec2( 1, scale ) )

        	self.scrollBar:SetHeight( height_new )

		end

	end

end


--
function UI.ComboBox_ListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.ComboBox_ListWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.ComboBox_ListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.ComboBox_ListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.BUTTON_LIST_BTN then

		if self.comboBox then
			self.comboBox:ListOnSlotClick( wnd )
		end

	end

	return false

end


--
function UI.ComboBox_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:ScrollVisibleRange( ticks < 0, math.abs( ticks ) )
	return true

end


--
function UI.ComboBox_ListWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd.BUTTON_LIST_BTN then

		local recordIdx = wnd:GetRecord()		

		if recordIdx ~= self:GetSelectedRecord() then
			self:SelectRecord( recordIdx )
			UI:PlayGlobalSound( self.selectSound )	
		end	

		return true

	end

	return false

end 


--
function UI.ComboBox_ListWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
		return true
	end
		
	return self:HandleKey( key, -2 )	

end


--
function UI.ComboBox_ListWnd:OnUp( key, controllerIdx )

	self:Scroll( false, 1 )
	return true

end


--
function UI.ComboBox_ListWnd:OnDown( key, controllerIdx )

	self:Scroll( true, 1 )
	return true

end


--
function UI.ComboBox_ListWnd:OnHome( key, controllerIdx )

	self:ScrollHome()
	return true

end


--
function UI.ComboBox_ListWnd:OnEnd( key, controllerIdx )

	self:ScrollEnd()
	return true

end


--
function UI.ComboBox_ListWnd:OnPageUp( key, controllerIdx )

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= -1 then
		self:SelectRecord( firstVisibleRecordIdx )
	end

	return true

end


--
function UI.ComboBox_ListWnd:OnPageDown( key, controllerIdx )

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if lastVisibleRecordIdx ~= -1 then
		self:SelectRecord( lastVisibleRecordIdx )
	end

	return true

end


--
function UI.ComboBox_ListWnd:OnEnter( key, controllerIdx )

	if self.comboBox then
		self.comboBox:ListOnEnter()
	end

	return true

end


--
function UI.ComboBox_ListWnd:OnEscape( key, controllerIdx )

	if self.comboBox then
		self.comboBox:ListOnEscape()
	end

	return true

end


-- ---------------------------------------------------------------
-- UI.ComboBox_ListSlot
-- ---------------------------------------------------------------

UI.ComboBox_ListSlot = {}
local cbs = UI.ComboBox_ListSlot

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.ComboBox_ListSlot.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "ComboBox_ListSlot",
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

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ComboBox_ListSlot:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local color = mainEffect:GetObjColor( self.effectInfo.main.textLocator )
		self:SetColor( color, self.layers.TEXT )		
	end

end


--
function UI.ComboBox_ListSlot:Select( bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateSelection( data )

end


-- ------------------------------------
-- const
-- ------------------------------------

cbs.layers =
{
	MAIN_EFFECT		= 0,
	TEXT			= 1,
}

cbs.effectInfo =
{
	main =
	{
		animUnsel	= "",
		animSel		= "",
		textLocator	= "",
	}
}

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.ComboBox_ListSlot:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.TEXT, "" )
	end

end


--
function UI.ComboBox_ListSlot:UpdateForData( data, bAnimated )

	self:UpdateSelection( data )
	self:UpdateText( data )
	self:UpdateColor( data )

end


--
function UI.ComboBox_ListSlot:UpdateText( data )

	local text = data and data.text or ""
	self:SetText( text, self.layers.TEXT ) 

end


--
function UI.ComboBox_ListSlot:UpdateSelection( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel 
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ComboBox_ListSlot:UpdateColor( data )

	local color = data.color
	if not color then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			color = mainEffect:GetObjColor( self.effectInfo.main.textLocator )
		else
			color = UI.TEXT_BASE_COLOR
		end
		
	end

	self:SetColor( color, self.layers.TEXT )

end


-- ------------------------------------------------------------------------
-- UI.ComboBox_EditWnd
-- ------------------------------------------------------------------------

UI.ComboBox_EditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name		= "ComboBox_EditWnd",
	 		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
    		symbolsLimit= -1,
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    		},
     	}
    },

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "",
    		selectionColorObjName	= "",
    		cursorColorObjName		= "",
    		animActive				= "",
    		animInactive			= "",
			animDisabled			= "",
    	}
    }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ComboBox_EditWnd:SetTextColor( color )

	if color == 0 then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			color = mainEffect:GetObjColor( self.effectInfo.main.textObjName )
		else
			color = UI.TEXT_BASE_COLOR
		end

	end

	local alpha = UI:GetAlpha( self:GetColor( self.layers.TEXT ) )	
	color = UI:SetAlpha( color, alpha )

	self:SetColor( color, self.layers.TEXT )

end


-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ComboBox_EditWnd:F_PostLoad()

	UI.EffectEditWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.TEXT, "" )
		mainEffect:LinkLayer( self:GetUiHandle(), self.layers.TEXT, self.effectInfo.main.textObjName, UI.EffectAnimParams.ALPHA )
	end

end


-- ------------------------------------------------------------------------
-- UI.ComboBox_StateBtn
-- ------------------------------------------------------------------------

UI.ComboBox_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "EffectCheckBoxWnd",

     	props =
     	{
     		name		= "ComboBox_StateBtn",
			selectSound	= UI.sounds.btnMouseOver,
    		isPrototype	= true,
     	},
    }
}


-- реализации с конкретными эффектами

-- ---------------------------------------------------------------------------
-- UI.ComboBox1
-- ---------------------------------------------------------------------------

--
UI.ComboBox1 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectComboBoxWnd",

		props =
		{
			name		= "ComboBox1",
			isPrototype	= true,
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
    				defName				= "comboBox1_main",
					defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

    selItemPrototypeName	= "ComboBox1_EditWnd",
    listPrototypeName		= "ComboBox1_ListWnd",
    stateBtnPrototypeName	= "ComboBox1_StateBtn",

    effectInfo =
    {
    	main =
    	{
    		orientation2Anim =
    		{
    			[ cb.orientations.DONW ]	= "deselect",
    			[ cb.orientations.UP ]		= "",
    		},

    		selItemObjName		= "drop_down_input",
    		listObjName			= "list",
    		stateBtnObjName		= "drop_down_btn",
    	}
    }
}


--
UI.ComboBox1_ListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ComboBox_ListWnd",

    	props =
    	{
    		name		= "ComboBox1_ListWnd",
			isPrototype	= true,
    	},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "comboBox1_list",
					defaultAnimation	= "open",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
    	}
    },

    btnPrototypeName	= "ComboBox1_ListSlot",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll_max",
    		animIdle			= "open",
    	}
    }
}


--
UI.ComboBox1_ListSlot =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "ComboBox_ListSlot",

    	props =
    	{
    		name			= "ComboBox1_ListSlot",
    		isPrototype		= true,
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
    				defName				= "comboBox1_slot",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.ComboBox_ListSlot.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
    	{
    		animUnsel	= "idle",
    		animSel		= "select",
			textLocator	= "text",
    	}
    }
}


--
UI.ComboBox1_EditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "ComboBox_EditWnd",

     	props =
     	{
     		name		= "ComboBox1_EditWnd",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName				= "comboBox1_edit",
					defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}
    },

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "login",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
			animDisabled			= "disable",
    	}
    }
}


--
UI.ComboBox1_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "ComboBox_StateBtn",

     	props =
     	{
     		name		= "ComboBox1_StateBtn",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

    			effects =
    			{{
    				defName				= "comboBox1_btn",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}    
    },

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    }
}


-- ---------------------------------------------------------------------------
-- UI.ComboBoxLong
-- ---------------------------------------------------------------------------

--
UI.ComboBoxLong =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectComboBoxWnd",

		props =
		{
			name		= "ComboBoxLong",
			isPrototype	= true,
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
    				defName				= "comboBox_long_main",
					defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

    selItemPrototypeName	= "ComboBoxLong_EditWnd",
    listPrototypeName		= "ComboBoxLong_ListWnd",
    stateBtnPrototypeName	= "ComboBoxLong_StateBtn",

    effectInfo =
    {
    	main =
    	{
    		orientation2Anim =
    		{
    			[ cb.orientations.DONW ]	= "deselect",
    			[ cb.orientations.UP ]		= "",
    		},

    		selItemObjName		= "drop_down_input",
    		listObjName			= "list",
    		stateBtnObjName		= "drop_down_btn",
    	}
    }
}


--
UI.ComboBoxLong_ListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ComboBox_ListWnd",

    	props =
    	{
    		name		= "ComboBoxLong_ListWnd",
			isPrototype	= true,
    	},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "comboBox_long_list",
					defaultAnimation	= "open",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
    	}
    },

    btnPrototypeName	= "ComboBoxLong_ListSlot",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll_max",
    		animIdle			= "open",
    	}
    }
}


--
UI.ComboBoxLong_ListSlot =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "ComboBox_ListSlot",

    	props =
    	{
    		name			= "ComboBoxLong_ListSlot",
    		isPrototype		= true,
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
    				defName				= "comboBox_long_slot",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.ComboBox_ListSlot.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
    	{
    		animUnsel	= "idle",
    		animSel		= "select",
			textLocator	= "text",
    	}
    }
}


--
UI.ComboBoxLong_EditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "ComboBox_EditWnd",

     	props =
     	{
     		name		= "ComboBoxLong_EditWnd",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName				= "comboBox_long_edit",
					defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}
    },

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "login",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
    	}
    }
}


--
UI.ComboBoxLong_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "ComboBox_StateBtn",

     	props =
     	{
     		name		= "ComboBoxLong_StateBtn",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

    			effects =
    			{{
    				defName				= "comboBox_long_btn",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}    
    },

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    }
}


-- ---------------------------------------------------------------------------
-- UI.ComboBoxForClans
-- ---------------------------------------------------------------------------

--
UI.ComboBoxForClans =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectComboBoxWnd",

		props =
		{
			name		= "ComboBoxForClans",
			isPrototype	= true,
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
    				defName				= "comboBox_long_main",
					defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

    selItemPrototypeName	= "ComboBoxForClans_EditWnd",
    listPrototypeName		= "ComboBoxForClans_ListWnd",
    stateBtnPrototypeName	= "ComboBoxForClans_StateBtn",

    effectInfo =
    {
    	main =
    	{
    		orientation2Anim =
    		{
    			[ cb.orientations.DONW ]	= "deselect",
    			[ cb.orientations.UP ]		= "",
    		},

    		selItemObjName		= "drop_down_input",
    		listObjName			= "list",
    		stateBtnObjName		= "drop_down_btn",
    	}
    }
}


--
UI.ComboBoxForClans_ListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ComboBox_ListWnd",

    	props =
    	{
    		name		= "ComboBoxForClans_ListWnd",
			isPrototype	= true,
    	},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "comboBox_for_clans_list",
					defaultAnimation	= "open",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
    	}
    },

    btnPrototypeName	= "ComboBoxForClans_ListSlot",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll_max",
    		animIdle			= "open",
    	}
    }
}


--
UI.ComboBoxForClans_ListSlot =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "ComboBox_ListSlot",

    	props =
    	{
    		name			= "ComboBoxForClans_ListSlot",
    		isPrototype		= true,
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
    				defName				= "comboBox_for_clans_list_line",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.ComboBox_ListSlot.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
    	{
    		animUnsel	= "idle",
    		animSel		= "select",
			textLocator	= "text",
    	}
    }
}


--
UI.ComboBoxForClans_EditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "ComboBox_EditWnd",

     	props =
     	{
     		name		= "ComboBoxForClans_EditWnd",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName				= "clan_find_input",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}
    },

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "idle",
    	}
    }
}


--
UI.ComboBoxForClans_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "ComboBox_StateBtn",

     	props =
     	{
     		name		= "ComboBoxForClans_StateBtn",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

    			effects =
    			{{
    				defName				= "comboBox_for_clans_btn",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self128",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}    
    },

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		animationDisabled	= "disable",
    	},
    }
}


-- ---------------------------------------------------------------------------
-- UI.ComboBox2
-- ---------------------------------------------------------------------------

UI.ComboBox2 = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ComboBox2.def =
{
	className	= "Wnd",
	prototype	= "EffectComboBoxWnd",

	props =
	{
		name		= "ComboBox2",
		isPrototype	= true,
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
				defName				= "comboBox2_main",
				defaultAnimation	= "deselect",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox2.selItemPrototypeName	= "ComboBox2_EditWnd"
UI.ComboBox2.listPrototypeName		= "ComboBox2_ListWnd"
UI.ComboBox2.stateBtnPrototypeName	= "ComboBox2_StateBtn"

UI.ComboBox2.orientation			= cb.orientations.UP

UI.ComboBox2.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ cb.orientations.DONW ]	= "",
			[ cb.orientations.UP ]		= "deselect",
		},

		selItemObjName		= "drop_down_input",
		listObjName			= "list",
		stateBtnObjName		= "drop_down_btn",
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ComboBox2:Reset()

	UI.EffectComboBoxWnd.Reset( self )
	self.selItemWnd:SetPremium( false )

end

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.ComboBox2:UpdateSelectedText()

	UI.EffectComboBoxWnd.UpdateSelectedText( self )

	local bPremium = false

	if self.selRecordIdx ~= -1 then
		local data = self.listWnd:GetRecordData( self.selRecordIdx )
		bPremium = data.bPremium
	end

	self.selItemWnd:SetPremium( bPremium  )
	
end


-- -----------------------------------------------
-- UI.ComboBox2_ListSlot
-- -----------------------------------------------

UI.ComboBox2_ListSlot = {}

-- ----------------------------
-- window definition
-- ----------------------------

local l_numBaseSlotLayers = UI:GetTableLength( UI.ComboBox_ListSlot.layers )

UI.ComboBox2_ListSlot.def =
{
	className 	= "Wnd",
	prototype	= "ComboBox_ListSlot",

	props =
	{
		name			= "ComboBox2_ListSlot",
		isPrototype		= true,
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "comboBox2_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ComboBox_ListSlot.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_2",
						layer		= "UI.ComboBox2_ListSlot.layers.TEXT_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- TEXT_2
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ComboBox2_ListSlot:Reset()

	UI.ComboBox_ListSlot.Reset( self )

	self.metaText:SetText( "", true )
	self:SetText( "", self.layers.TEXT_2 )

end


-- ----------------------------
-- const
-- ----------------------------

UI.ComboBox2_ListSlot.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
    TEXT_2		= 2,
}


UI.ComboBox2_ListSlot.effectInfo =
{
	main =
	{
		animUnsel			= "idle",
		animSel				= "select",
		animUnsel_premium	= "premium",
		animSel_premium		= "premium_select",
		textLocator			= "text",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.ComboBox2_ListSlot.metaText = nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.ComboBox2_ListSlot:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 

end


--
function UI.ComboBox2_ListSlot:F_Shutdown()

	if not self:IsPrototype() then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ComboBox2_ListSlot:UpdateForData( data, bAnimated )

	UI.ComboBox_ListSlot.UpdateForData( self, data, bAnimated )
	self:UpdateText2( data )

end


--
function UI.ComboBox2_ListSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ComboBox2_ListSlot:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ComboBox2_ListSlot:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.ComboBox2_ListSlot:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ComboBox2_ListSlot:UpdateText( data )

	local text = ""

	if data and data.text then
		text = data.text

		if data.bPremium then
			text = string.format( "%s$texture [texName premiumContract] [color 0xffffffff] [scale 0.8]$", text )
		end
	end

	self.metaText:SetText( text, true ) 

end


--
function UI.ComboBox2_ListSlot:UpdateText2( data )

	self:SetText( data.text2 or "", self.layers.TEXT_2 )

end


--
function UI.ComboBox2_ListSlot:UpdateSelection( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = "" 
	if data and data.bPremium then
		anim = self:IsSelected() and self.effectInfo.main.animSel_premium or self.effectInfo.main.animUnsel_premium
	else
		anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel 
	end

	mainEffect:StartAnimation( anim )

	self.metaText:SetColor( self:GetColor( self.layers.TEXT ) )

end


-- -----------------------------------------------
-- UI.ComboBox2_EditWnd
-- -----------------------------------------------

UI.ComboBox2_EditWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.ComboBox2_EditWnd.def =
{   	
 	className	= "EditWnd",
	prototype	= "ComboBox_EditWnd",

 	props =
 	{
 		name		= "ComboBox2_EditWnd",
		isPrototype	= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "comboBox2_edit",
				defaultAnimation	= "deselect",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
 	}
}


-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ComboBox2_EditWnd:SetPremium( bPremium )

	self.bPremium = bPremium
	self:UpdateMainAnimation()

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.ComboBox2_EditWnd.effectInfo =
{
	main =
	{
		textObjName				= "login",
		selectionColorObjName	= "select_color",
		cursorColorObjName		= "cursor",
		animActive				= "select",
		animInactive			= "deselect",
		animActive_premium		= "premium_sel",
		animInactive_premium	= "premium_desel",
	}
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.ComboBox2_EditWnd.bPremium = false

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.ComboBox2_EditWnd:UpdateMainAnimation()

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

    local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local anim = ""

		if self.bPremium then
			anim = bHasFocus and self.effectInfo.main.animActive_premium or self.effectInfo.main.animInactive_premium
		else
			anim = bHasFocus and self.effectInfo.main.animActive or self.effectInfo.main.animInactive
		end

		mainEffect:StartAnimation( anim )
	end

end


-- -----------------------------------------------
-- UI.ComboBox2_ListWnd, UI.ComboBox2_StateBtn
-- -----------------------------------------------

--
UI.ComboBox2_ListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ComboBox_ListWnd",

    	props =
    	{
    		name		= "ComboBox2_ListWnd",
			isPrototype	= true,
    	},

    	layers =
    	{
			numLayers = 2,
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "comboBox2_list",
					defaultAnimation	= "open",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},

			-- DEBUG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_RESIZABLE,
				texture		= "white",
				color		= 0x66ff0000,
				visible		= false,
			}
    	}
    },

    btnPrototypeName	= "ComboBox2_ListSlot",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll_max",
    		animIdle			= "open",
    	}
    }
}


--
UI.ComboBox2_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "ComboBox_StateBtn",

     	props =
     	{
     		name		= "ComboBox2_StateBtn",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

    			effects =
    			{{
    				defName				= "comboBox2_btn",
					defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
     	}    
    },

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    }
}


-- ---------------------------------------------------------------------------
-- UI.ComboBox3
-- ---------------------------------------------------------------------------

UI.ComboBox3 = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ComboBox3.def =
{
	className	= "Wnd",
	prototype	= "EffectComboBoxWnd",

	props =
	{
		name		= "ComboBox3",
		isPrototype	= true,
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
				defName				= "comboBox3_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ComboBox3:Reset()

	UI.EffectComboBoxWnd.Reset( self )
	self.stateBtn:SetTooltipData( nil )

end


--
function UI.ComboBox3:SetTooltipData( tooltipData )

	self.stateBtn:SetTooltipData( tooltipData )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox3.selItemPrototypeName	= "ComboBox3_EditWnd"
UI.ComboBox3.listPrototypeName		= "ComboBox3_ListWnd"
UI.ComboBox3.stateBtnPrototypeName	= "ComboBox3_StateBtn"

UI.ComboBox3.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ UI.EffectComboBoxWnd.orientations.DONW ]	= "idle",
			[ UI.EffectComboBoxWnd.orientations.UP ]	= "",
		},

		selItemObjName		= "drop_down_input",
		listObjName			= "list",
		stateBtnObjName		= "drop_down_btn",
	}
}

UI.ComboBox3.MAX_VISIBLE_RECORDS = 10

-- ---------------------------------------------------------------------------
-- UI.ComboBox3_ListWnd
-- ---------------------------------------------------------------------------

UI.ComboBox3_ListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ComboBox3_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ComboBox_ListWnd",

	props =
	{
		name		= "ComboBox3_ListWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			main		= true,
			updatable	= false,

			effects =
			{{
				defName				= "comboBox3_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox3_ListWnd.btnPrototypeName		= "ComboBox3_ListSlot"
UI.ComboBox3_ListWnd.scrollBarPrototypeName	= "EffectScrollWnd_Vrt_3"

UI.ComboBox3_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
		minDistLocator		= "dist_min",
		maxDistLocator		= "self",
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ComboBox3_ListWnd:RecalcListLayout()

	UI.ComboBox_ListWnd.RecalcListLayout( self )

	-- анимация фона, в отличие от реализации в базовом классе, имеет ненулевое начальное состояние

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local minAnimHeight = mainEffect:GetObjSize( self.effectInfo.main.minDistLocator ).y
	local maxAnimHeight = mainEffect:GetObjSize( self.effectInfo.main.maxDistLocator ).y
	local selfHeight	= self:GetHeight()	

	local animTime = ( selfHeight - minAnimHeight ) / ( maxAnimHeight - minAnimHeight )
	mainEffect:SetAnimationTimeAndUpdate( animTime  )

end


-- ---------------------------------------------------------------------------
-- UI.ComboBox3_ListSlot
-- ---------------------------------------------------------------------------

UI.ComboBox3_ListSlot = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ComboBox3_ListSlot.def =
{
	className 	= "Wnd",
	prototype	= "ComboBox_ListSlot",

	props =
	{
		name			= "ComboBox3_ListSlot",
		isPrototype		= true,
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
				defName				= "comboBox3_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ComboBox3_ListSlot.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ComboBox3_ListSlot:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox3_ListSlot.effectInfo =
{
	main =
	{
		animUnsel	= "idle",
		animSel		= "select",
		textLocator	= "text",
	}
}

-- ------------------------------------
-- work funtions
-- ------------------------------------

--
function UI.ComboBox3_ListSlot:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

end


--
function UI.ComboBox3_ListSlot:UpdateColor( data )
end


-- ---------------------------------------------------------------------------
-- UI.ComboBox3_EditWnd
-- ---------------------------------------------------------------------------

UI.ComboBox3_EditWnd = {}

-- ---------------------------------
-- window definitions
-- ---------------------------------

UI.ComboBox3_EditWnd.def =
{   	
 	className	= "EditWnd",
	prototype	= "ComboBox_EditWnd",

 	props =
 	{
 		name		= "ComboBox3_EditWnd",
		isPrototype	= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "comboBox3_edit",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
 	}
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox3_EditWnd.effectInfo =
{
	main =
	{
		textObjName				= "text\\",
		selectionColorObjName	= "select_color",
		cursorColorObjName		= "cursor",
		animActive				= "select",
		animInactive			= "deselect",
		animDisabled			= "daseble",

	}
}

-- ---------------------------------------------------------------------------
-- UI.ComboBox3_StateBtn
-- ---------------------------------------------------------------------------

UI.ComboBox3_StateBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ComboBox3_StateBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "ComboBox_StateBtn",

 	props =
 	{
 		name		= "ComboBox3_StateBtn",
		isPrototype	= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "comboBox3_btn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
 	}    
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ComboBox3_StateBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.ComboBox3_StateBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ComboBox3_StateBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "disable",
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ComboBox3_StateBtn.tooltipData = nil