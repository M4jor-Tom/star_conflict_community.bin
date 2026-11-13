-- ----------------------------------------------------------------------------
--
-- Workfile: ButtonsList3Wnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- список с плавным скроллированием

UI.ButtonsList3Wnd = {}
local bl = UI.ButtonsList3Wnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.ButtonsList3Wnd.def =
{
	className = "Wnd",
	prototype = "ButtonsListWnd",

	props =
	{
		name			= "ButtonsList3Wnd",
		isPrototype		= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	},
}

-- -------------------------------
-- interface funcitons
-- -------------------------------  

--
function UI.ButtonsList3Wnd:GetNumVisibleSlots()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	if firstVisibleRecordIdx ~= -1 then
		return lastVisibleRecordIdx - firstVisibleRecordIdx + 1
		
	else
		return 0
	end	

end


--
function UI.ButtonsList3Wnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self.slots = {}

end


-- slotIdx - визуальный индекс (аналогично ButtonsListWnd)
function UI.ButtonsList3Wnd:GetButtonForSlot( slotIdx )

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.ButtonsList3Wnd:GetButtonForSlot()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return nil
	end

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	if firstVisibleRecordIdx ~= -1 then

		local recordIdx = self.firstVisibleRecordIdx + slotIdx - 1
		return self:GetButtonForRecord( recordIdx )

	else
		return nil
	end

end


--
function UI.ButtonsList3Wnd:GetButtonForRecord( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.ButtonsList3Wnd:GetButtonForRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return nil
	end

	local slot = self.slots[ recordIdx ]
	return slot and slot.btn

end


--
function UI.ButtonsList3Wnd:GetScrollPos()

	return self.scrollPos

end


--
function UI.ButtonsList3Wnd:GetMaxScrollPos()

	if self.numRecords == 0 or self.MAX_SLOTS == 0 then
		return -1
	end

	return math.max( self.numRecords - self.MAX_SLOTS + 1, 1 )

end


--
function UI.ButtonsList3Wnd:GetMinScrollPos()

	if self.numRecords == 0 or self.MAX_SLOTS == 0 then
		return -1
	end

	return 1

end


--
function UI.ButtonsList3Wnd:SetScrollPos( scrollPos, bUpdateScrollBar, bAnimated )

	if type( scrollPos ) ~= "number" then
		sys.log( "UI.ButtonsList3Wnd:SetScrollPos()[ERROR]: invalid type of the 1-st parameter (\"scrollPos\"); \"number\" expected, got \"%s\"", type( scrollPos ) )
		return
	end

	if bUpdateScrollBar ~= nil then
    	if type( bUpdateScrollBar ) ~= "boolean" then
    		sys.log( "UI.ButtonsList3Wnd:SetScrollPos()[ERROR]: invalid type of the 2-nd parameter (\"bUpdateScrollBar\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bUpdateScrollBar ) )
    		bUpdateScrollBar = nil
    	end
	end

	if bAnimated ~= nil then
    	if type( bAnimated ) ~= "boolean" then
    		sys.log( "UI.ButtonsList3Wnd:SetScrollPos()[ERROR]: invalid type of the 3-rd parameter (\"bAnimated\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bAnimated ) )
    		bAnimated = nil
    	end
	end

	if scrollPos ~= -1 then

		local maxScrollPos = self:GetMaxScrollPos()
		if maxScrollPos ~= -1 then
			scrollPos = UI:Clamp( scrollPos, 1, maxScrollPos )
		else
			scrollPos = -1
		end

	end

	if scrollPos == self.scrollPos then
		return
	end

	self.scrollPos = scrollPos
	self.firstVisibleRecordIdx = self.scrollPos == -1 and -1 or math.floor( self.scrollPos )

	self:UpdateOnChangeVisibleRange( bUpdateScrollBar, bAnimated )

end


-- -------------------------------
-- const
-- -------------------------------

bl.scrollBarPrototypeName	= "ButtonsList3Wnd_ScrollBarWnd"

-- -------------------------------
-- vars
-- -------------------------------

bl.allSlots		= {}
bl.scrollPos	= -1
bl.slotsRect	= Quat( 0, 0, 0, 0 )
bl.slotHeight	= 0
bl.slotsSpace	= 0
bl.slotsWnd		= nil	-- вспомогательное окно, объединяет слоты (но не скроллбар) для того, чтобы маска применялась только к ним

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ButtonsList3Wnd:F_PostLoad()

	self.allSlots	= {}
	self.slotsRect	= Quat( 0, 0, 0, 0 )

	UI.ButtonsListWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateSlotsWnd()
	self:RecalcLayout()

end


--
function UI.ButtonsList3Wnd:DeleteControls()

	if self.scrollBar then
		UI:RemoveUiObj( self.scrollBar:GetUiHandle() )
		self.scrollBar = nil
	end

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			UI:RemoveUiObj( slot.btn:GetUiHandle() )
			slot.btn = nil
		end
	end

end


--
function UI.ButtonsList3Wnd:CreateSlotsWnd()

	self.slotsWnd = UI:CreateChildWnd( self, UI.ButtonsList3_SlotsWnd, "" )
	self:AddChild( self.slotsWnd )	

end


--
function UI.ButtonsList3Wnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstSlotWnd = self.allSlots[ 1 ] and self.allSlots[ 1 ].btn
	self.slotHeight = firstSlotWnd and firstSlotWnd:GetHeight() or 0

	local firstSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )

	self.slotsSpace = secondSlotPos.y - firstSlotPos.y - self.slotHeight

	local selfRect = self:GetRect()

	self.slotsRect.x = 0
	self.slotsRect.y = firstSlotPos.y
	self.slotsRect.z = selfRect.z
	self.slotsRect.w = self.slotHeight * self.MAX_SLOTS + self.slotsSpace * ( self.MAX_SLOTS - 1 )

	self.slotsWnd:SetRect( self.slotsRect )

	local slotX = firstSlotPos.x - self.slotsWnd:GetLeft()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			slot.btn:SetLeft( slotX )
		end
	end

end


--
function UI.ButtonsList3Wnd:InitSlots()	

	local btnProto = UI[ self.btnPrototypeName ]

	if not btnProto then
		sys.log( "UI.ButtonsList3Wnd:InitSlots()[ERROR]: cannot find prototype for slots: \"%s\" in list \"%s\"", tostring( self.btnPrototypeName ), self:GetScriptTableName() )
		return
	end

	if self.MAX_SLOTS > 0 then

    	for slotIdx = 1, self.MAX_SLOTS + 1 do

    		local slot = { idx = slotIdx }	
    		table.insert( self.allSlots, slot )

    		slot.btn = UI:CreateChildWnd( self, btnProto, slotIdx )
    		slot.btn:SetSlot( slotIdx, self )

    	end

	end

end


--
function UI.ButtonsList3Wnd:AddRecord( data )

	local record =
	{
		idx		= self.numRecords + 1,
		data	= data
	}

	local firstVisibleRecordIdx_prev, lastVisibleRecordIdx_prev = self:GetVisibleRange()

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	self:UpdateScrollBarVisibility()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	if firstVisibleRecordIdx == -1 then
		self:SetFirstVisibleRecord( 1 )

	elseif firstVisibleRecordIdx ~= firstVisibleRecordIdx_prev or lastVisibleRecordIdx ~= lastVisibleRecordIdx_prev then
		self:UpdateOnChangeVisibleRange( true, false )
	end

	return record.idx

end


--
function UI.ButtonsList3Wnd:ShowSlot( slot )

	self.slots[ slot.recordIdx ] = slot

	self.slotsWnd:AddChild( slot.btn )
	self:UpdateSlotPos( slot )

end


--
function UI.ButtonsList3Wnd:HideSlot( slot )

	self.slots[ slot.recordIdx ] = nil

	self:ResetSlot( slot )
	slot.btn:UnlinkFromParent()

end


--
function UI.ButtonsList3Wnd:UpdateSlotForRecord( slot, bAnimated )

	if slot.btn:IsChildOf( self ) then
		slot.btn:Update( bAnimated )
	end

end


--
function UI.ButtonsList3Wnd:SetFirstVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	self:SetScrollPos( recordIdx, bUpdateScrollBar, bAnimated )

end


--
function UI.ButtonsList3Wnd:GetLastVisibleRecordIdx()

	if self.scrollPos == -1 then
		return -1
	end

	return UI:Clamp( math.ceil( self.scrollPos + self.MAX_SLOTS - 1 ), 1, self.numRecords )

end


--
function UI.ButtonsList3Wnd:UpdateScrollBarRange()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	if self.numRecords == 0 or self.MAX_SLOTS == 0 then
		self.scrollBar:SetRange( -1, -1 )

	else
		self.scrollBar:SetRange( 1, self:GetMaxScrollPos() )
	end

end


--
function UI.ButtonsList3Wnd:UpdateScrollBarPos()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetPos( self.scrollPos )

end


--
function UI.ButtonsList3Wnd:ScrollVisibleRange( bForward, numRecords )

	if numRecords == nil then
		numRecords = 1
	end
	
	self:ScrollSlots( bForward and numRecords or -numRecords, true )

end


--
function UI.ButtonsList3Wnd:ScrollSlots( delta, bUpdateScrollBar )

	local curPos = self.scrollPos
	local nextPos = curPos

	if delta > 0 then
		nextPos = math.floor( curPos + math.abs( delta ) )	

	elseif delta < 0 then
		nextPos = math.ceil( curPos - math.abs( delta ) )
	end

	-- обязательно клампить ДО SetScrollPos(), т.е. если получится -1, то там он посчитается за невалидное значение
	local maxScrollPos = self:GetMaxScrollPos()
	if maxScrollPos ~= -1 then
		nextPos = UI:Clamp( nextPos, 1, maxScrollPos )
	else
		nextPos = -1
	end

	self:SetScrollPos( nextPos, bUpdateScrollBar, false )

end


--
function UI.ButtonsList3Wnd:UpdateVisibleRangeFromScrollBar()

	if self.numRecords == 0 then
		return
	end

	local pos = self.scrollBar:GetPos()
	self:SetScrollPos( pos, false, false )

	if self:HasListStyle( self.listStyles.SCROLL_SELECTION_WITH_BAR ) then
		self:EnsureSelectionIsVisible_adaptSelection( true )	
	end

end


--
function UI.ButtonsList3Wnd:GetSlotForRecord( record )

	if not record then
		sys.log( "UI.ButtonsList3Wnd:GetSlotForRecord()[ERROR]: nil record (wnd \"%s\")", self:GetScriptTableName() )
		return nil
	end

	return self.slots[ record.idx ]

end


--
function UI.ButtonsList3Wnd:GetRecordForSlot( slot )

	if not slot then
		sys.log( "UI.ButtonsList3Wnd:GetRecordForSlot()[ERROR]: nil slot (wnd \"%s\")", self:GetScriptTableName() )
		return nil
	end

	return self.records[ slot.recordIdx ]

end


--
function UI.ButtonsList3Wnd:Slot2RecordIdx( slotIdx )

	local slot = self.allSlots[ slotIdx ]
	if not slot then
		return -1
	end

	local record = self:GetRecordForSlot( slot )
	return record and record.idx or -1

end


--
function UI.ButtonsList3Wnd:UpdateSlotsOnChangeVisibleRange( bAnimated )

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	for idx, slot in pairs( self.slots ) do

		if firstVisibleRecordIdx == -1 or slot.recordIdx < firstVisibleRecordIdx or slot.recordIdx > lastVisibleRecordIdx then
			self:HideSlot( slot )
		end	

	end

	if firstVisibleRecordIdx == -1 then
		return
	end

	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

		local record = self.records[ recordIdx ]
		local slot = self:GetSlotForRecord( record )

		if slot then
			self:UpdateSlotPos( slot )

		else	
			slot = self:GetFreeSlot()

    		if slot then		

    			slot.recordIdx = record.idx

    			self:ShowSlot( slot )
    			self:UpdateSlotForRecord( slot )

    		else
    			sys.log( "UI.ButtonsList3Wnd:UpdateSlotsOnChangeVisibleRange()[ERROR]: cannot find free slot (wnd \"%s\")", self:GetScriptTableName() )
    		end			
		end

	end

end 


--
function UI.ButtonsList3Wnd:GetFreeSlot()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn and not slot.btn:IsChildOf( self ) then
			return slot
		end
	end

	return nil

end


--
function UI.ButtonsList3Wnd:UpdateSlotPos( slot )

	local y = self.slotsRect.y + ( slot.recordIdx - self.scrollPos ) * ( self.slotHeight + self.slotsSpace ) - self.slotsWnd:GetTop()
	slot.btn:SetTop( y )

end


-- -------------------------------------------------------------------------------
-- UI.ButtonsList3Wnd_ScrollBarWnd
-- -------------------------------------------------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt",

	props =
	{
		name		= "ButtonsList3Wnd_ScrollBarWnd",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
		isPrototype	= true,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ButtonsList3Wnd_ScrollBarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	local parent = self:GetParent()
	if not parent then
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		parent:ScrollSlots( -self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		parent:ScrollSlots( self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		parent:ScrollSlots( -self:GetPageSize() )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		parent:ScrollSlots( self:GetPageSize() )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end


-- -------------------------------------------------------------------------------
-- UI.ButtonsList3Wnd_ScrollBarWnd_3
-- -------------------------------------------------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd_3 = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd_3.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt_3",

	props =
	{
		name		= "ButtonsList3Wnd_ScrollBarWnd_3",
		isPrototype	= true,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ButtonsList3Wnd_ScrollBarWnd_3:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	local parent = self:GetParent()
	if not parent then
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		parent:ScrollSlots( -self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		parent:ScrollSlots( self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		parent:ScrollSlots( -self:GetPageSize() )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		parent:ScrollSlots( self:GetPageSize() )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end


-- -------------------------------------------------------------------------------
-- UI.ButtonsList3Wnd_ScrollBarWnd_1080
-- -------------------------------------------------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd_1080 = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ButtonsList3Wnd_ScrollBarWnd_1080.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt_1080",

	props =
	{
		name		= "ButtonsList3Wnd_ScrollBarWnd_1080",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
		isPrototype	= true,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ButtonsList3Wnd_ScrollBarWnd_1080:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	local parent = self:GetParent()
	if not parent then
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		parent:ScrollSlots( -self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		parent:ScrollSlots( self:GetStepSize() )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		parent:ScrollSlots( -self:GetPageSize() )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		parent:ScrollSlots( self:GetPageSize() )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end


-- -------------------------------------------------------------------------------
-- UI.ButtonsList3_SlotsWnd
-- -------------------------------------------------------------------------------

UI.ButtonsList3_SlotsWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ButtonsList3_SlotsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ButtonsList3_SlotsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ButtonsList3_SlotsWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.ButtonsList3_SlotsWnd.parent		= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ButtonsList3_SlotsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
                                                                                                                     
	if self:IsPrototype() then
		return
	end

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.ButtonsList3_SlotsWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.ButtonsList3_SlotsWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.ButtonsList3_SlotsWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- -------------------------------------------------------------------------------
-- UI.ButtonsList3_Btn
-- -------------------------------------------------------------------------------

UI.ButtonsList3_Btn = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ButtonsList3_Btn.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ButtonsList3_Btn",
		isPrototype	= true,
	}
}