-- ----------------------------------------------------------------------------
--
-- Workfile: BaseListWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: baselistwnd.lua 1831 2011-03-24 13:18:45Z $
-- ----------------------------------------------------------------------------

-- Базовый классс списка

--
UI.BaseListWnd = {}
local bl = UI.BaseListWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.BaseListWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "BaseListWnd",
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
function UI.BaseListWnd:AddRecord( data )

	local record =
	{
		idx		= self.numRecords + 1,
		data	= data
	}

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	self:UpdateScrollBarVisibility()

	if self.firstVisibleRecordIdx == -1 then
		self:SetFirstVisibleRecord( 1 )

	else

		local slot = self:GetSlotForRecord( record )
		if slot then
			self:UpdateRecordForSlot( record )
			self:UpdateSlotForRecord( slot, false )
		end

	end

	return record.idx

end


--
function UI.BaseListWnd:SetRecordData( data, recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:SetRecordData()[ERROR]: invalid type of the 2-nd parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if recordIdx < 1 or recordIdx > self.numRecords then
		sys.log( "UI.BaseListWnd:SetRecordData()[ERROR]: invalid recordIdx: %d (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return
	end

	local record = self.records[ recordIdx ]

	if not record then
		sys.log( "UI.BaseListWnd:SetRecordData()[ERROR]: record %d not found (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return
	end

	record.data = data

	local slot = self:GetSlotForRecord( record )
	if slot then
		self:UpdateSlotForRecord( slot, false )
	end

end


--
function UI.BaseListWnd:GetRecordData( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:GetRecordData()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return nil
	end

	if recordIdx < 1 or recordIdx > self.numRecords then
		sys.log( "UI.BaseListWnd:GetRecordData()[ERROR]: invalid recordIdx: %d (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return nil
	end

	local record = self.records[ recordIdx ]

	if not record then
		sys.log( "UI.BaseListWnd:GetRecordData()[ERROR]: record %d not found (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return nil
	end

	return record.data	

end


--
function UI.BaseListWnd:GetNumRecords()

	return self.numRecords

end


--
function UI.BaseListWnd:GetNumSlots()

	return self.numSlots

end


--
function UI.BaseListWnd:GetNumVisibleSlots()

	if not self:HasListStyle( self.listStyles.HIDE_EMPTY_SLOTS ) then
		return self.numSlots
	end

	return math.min( self.numRecords, self.numSlots )

end


--
function UI.BaseListWnd:SelectRecord( recordIdx, bAnimated )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:SelectRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if recordIdx ~= -1 and ( recordIdx < 1 or recordIdx > self.numRecords ) then
		sys.log( "UI.BaseListWnd:SelectRecord()[ERROR]: invalid recordIdx: %d (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return
	end

	if bAnimated ~= nil then
    	if type( bAnimated ) ~= "boolean" then
    		sys.log( "UI.BaseListWnd:SelectRecord()[ERROR]: invalid type of the 2-nd parameter (\"bAnimated\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bAnimated ) )
    		bAnimated = nil		
    	end
	end

	self:EnsureRecordIsVisible_adaptVisibleRange( recordIdx, bAnimated )

	local record = self.records[ recordIdx ]

	if not record and recordIdx ~= -1 then
		sys.log( "UI.BaseListWnd:GetRecordData()[ERROR]: record %d not found (wnd \"%s\")", recordIdx, self:GetScriptTableName() )
		return
	end

	self:SelectRecordInternal( recordIdx, bAnimated )

end


--
function UI.BaseListWnd:GetSelectedRecord()

	return self.selRecordIdx

end


--
function UI.BaseListWnd:Clear()

	self:SelectRecordInternal( -1, false )

	self.records		= {}
	self.numRecords		= 0

	self:SetFirstVisibleRecord( -1 )

	self:UpdateScrollBarVisibility()

end 


-- скроллирует выделение;
-- если выделение выходит за пределы видимости, скроллирует область видимости, чтобы выделение всегда оставалось видимым
function UI.BaseListWnd:Scroll( bForward, numRecords )

	if type( bForward ) ~= "boolean" then
		sys.log( "UI.BaseListWnd:Scroll()[ERROR]: invalid type of the 1-st parameter (\"bForward\"); \"boolean\" expected, got \"%s\"", type( bForward ) )
		return
	end

	if numRecords ~= nil then
    	if type( numRecords ) ~= "number" then
    		sys.log( "UI.BaseListWnd:Scroll()[ERROR]: invalid type of the 2-nd parameter (\"numRecords\"); \"number\" or \"nil\" expected, got \"%s\"", type( numRecords ) )
    		numRecords = nil
    	end
	end

	if not self:HasListStyle( self.listStyles.FIXED_SELECTION ) then
		self:ScrollSelection( bForward, numRecords )
	else
		self:ScrollVisibleRange( bForward, numRecords )
	end

end


--
function UI.BaseListWnd:ScrollHome()

	if self.numRecords == 0 then
		return
	end

	self:SetFirstVisibleRecord( 1, true, true )

	if not self:HasListStyle( self.listStyles.FIXED_SELECTION ) and self.selRecordIdx ~= 1 then

		self:SelectRecord( 1, true )

		if self.selectSound and self.selectSound ~= "" then
			UI:PlayGlobalSound( self.selectSound )
		end

	end

end


--
function UI.BaseListWnd:ScrollEnd()

	if self.numRecords == 0 then
		return
	end

	self:SetLastVisibleRecord( self.numRecords, true, true )

	if not self:HasListStyle( self.listStyles.FIXED_SELECTION ) and self.selRecordIdx ~= self.numRecords then

		self:SelectRecord( self.numRecords, true )

		if self.selectSound and self.selectSound ~= "" then
			UI:PlayGlobalSound( self.selectSound )
		end

	end

end


--
function UI.BaseListWnd:HasScrollBar()

	return self.scrollBar and self.scrollBar:IsChildOf( self )

end


--
function UI.BaseListWnd:HasListStyle( style )

	if type( style ) ~= "number" then
		sys.log( "UI.BaseListWnd:HasListStyle()[ERROR]: invalid type of the 1-st parameter (\"style\"); \"number\" expected, got \"%s\"", type( style ) )
		return false
	end

	return bit.band( self.listStyle, style ) ~= 0

end


--
function UI.BaseListWnd:SetListStyle( style )

	if type( style ) ~= "number" then
		sys.log( "UI.BaseListWnd:SetListStyle()[ERROR]: invalid type of the 1-st parameter (\"style\"); \"number\" expected, got \"%s\"", type( style ) )
		return
	end

	self.listStyle = style

end


--
function UI.BaseListWnd:AddListStyle( style )

	if type( style ) ~= "number" then
		sys.log( "UI.BaseListWnd:AddListStyle()[ERROR]: invalid type of the 1-st parameter (\"style\"); \"number\" expected, got \"%s\"", type( style ) )
		return
	end

	self.listStyle = bit.bor( self.listStyle, style )

end


--
function UI.BaseListWnd:RemoveListStyle( style )

	if type( style ) ~= "number" then
		sys.log( "UI.BaseListWnd:RemoveListStyle()[ERROR]: invalid type of the 1-st parameter (\"style\"); \"number\" expected, got \"%s\"", type( style ) )
		return
	end

	self.listStyle = bit.band( self.listStyle, bit.bnot( style ) )

end  


--
function UI.BaseListWnd:Record2SlotIdx( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:Record2SlotIdx()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return -1
	end

	local record = self.records[ recordIdx ]
	if not record then
		return -1
	end

	local slot = self:GetSlotForRecord( record )
	return slot and slot.idx or -1

end


--
function UI.BaseListWnd:Slot2RecordIdx( slotIdx )

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:Slot2RecordIdx()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return -1
	end

	local slot = self.slots[ slotIdx ]
	if not slot then
		return -1
	end

	local record = self:GetRecordForSlot( slot )
	return record and record.idx or -1

end


--
function UI.BaseListWnd:ActivateRecord( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.BaseListWnd:ActivateRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if not self.records[ recordIdx ] then
		sys.log( "UI.BaseListWnd:ActivateRecord()[ERROR]: invalid record idx: %s (wnd \"%s\")", tostring( recordIdx ), self:GetScriptTableName() )
		return
	end

	self:SelectRecord( recordIdx, true )

	UI:SendUiEvent( UI.EV_LIST_ACTIVATE_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, recordIdx, 0, 0, 0 )

end


--
function UI.BaseListWnd:GetVisibleRange()

	return self.firstVisibleRecordIdx, self:GetLastVisibleRecordIdx()

end


-- -------------------------------
-- const
-- -------------------------------

bl.layers =
{
    MAIN_EFFECT				= 0,
}

bl.listStyles =
{
	HIDE_SCROLL_BAR_IF_NO_NEED		= 1,	-- если все ряды видны без необходимости прокрутки, то скроллбар не показывается
	FIXED_SELECTION					= 2,	-- выделение может быть установлено только программно, и не меняется инпутом, при скроллировании и т.п.
	HIDE_EMPTY_SLOTS				= 4,	-- если слотам не соответсвуют записи, то слоты не показываются
	ACTIVATE_BY_MOUSE_CLICK			= 8,
	WRAPPED_SCROLL					= 16,
	SCROLL_SELECTION_WITH_BAR		= 32,	-- если true, то при скроллировании скроллбаром может смещаться выделение, чтобы всегда быть видимым
} 

bl.effectInfo =
{
	main =
	{
		scrollObjName		= "scroll_bar",
	}
}

bl.selectSound = ""

bl.MAX_SLOTS = 0

bl.scrollBarPrototypeName	= "EffectScrollWnd_Vrt"

-- -------------------------------
-- variables that must be overridden by inheriting windows (format see below)
-- -------------------------------

bl.listStyle		= 0
bl.bSilent			= false

-- -------------------------------
-- vars
-- -------------------------------

--[[ format

    record = 
    {	
    	idx		= <int>,
    	[data	= <any_value>,]
    }

	slot =
	{
		idx		= <int>,
	}
]]

bl.records					= {}
bl.numRecords				= 0
bl.firstVisibleRecordIdx	= -1
bl.selRecordIdx				= -1
bl.slots					= {}
bl.scrollBar				= nil
bl.numSlots					= 0

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.BaseListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.records				= {}
	self.numRecords				= 0
    self.firstVisibleRecordIdx	= -1
    self.selRecordIdx			= -1
    self.slots					= {}
	self.numSlots				= 0

	if self:IsPrototype() then
		return
	end

	self:InitElements()

	local uiHandle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.BaseListWnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BaseListWnd:DeleteControls()

	if self.scrollBar then
		UI:RemoveUiObj( self.scrollBar:GetUiHandle() )
		self.scrollBar = nil
	end

end


--
function UI.BaseListWnd:InitElements()

	self:InitSlots()
	self:InitScrollBar()

end


--
function UI.BaseListWnd:InitSlots()	

	for slotIdx = 1, self.MAX_SLOTS do

		local slot = { idx = slotIdx }	
		table.insert( self.slots, slot )
		self.numSlots = self.numSlots + 1

		if not self:HasListStyle( self.listStyles.HIDE_EMPTY_SLOTS ) then
			self:ShowSlot( slot )
		end

	end

end


--
function UI.BaseListWnd:InitScrollBar()	

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	
	if not self.scrollBar then
		return
	end

	self.scrollBar:SetPageSize( self.MAX_SLOTS )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = mainEffect:HasObject( self.effectInfo.main.scrollObjName ) and mainEffect:GetObjSize( self.effectInfo.main.scrollObjName ) or UI:ZeroVec2()
	local baseSize = scrollEffect:GetObjSize( "self" )

	local scale_y = needSize.y / baseSize.y
	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

	self.scrollBar:SetWidth( baseSize.x )
	self.scrollBar:SetHeight( needSize.y )

	self:UpdateScrollBarVisibility()

end


--
function UI.BaseListWnd:SelectRecordInternal( recordIdx, bAnimated )

	if self.selRecordIdx == recordIdx then
		return
	end

	local oldSelRecordIdx = self.selRecordIdx
	local oldSelRecord = self.records[ self.selRecordIdx ]

	self.selRecordIdx = recordIdx

	if oldSelRecord then

		self:UpdateRecordForSelection( oldSelRecord )

		local slot = self:GetSlotForRecord( oldSelRecord )
		if slot then
			self:UpdateSlotForSelection( slot, bAnimated )
		end

	end

	local record = self.records[ recordIdx ] 
	if record then

		self:UpdateRecordForSelection( record )

		local slot = self:GetSlotForRecord( record )
		if slot then
			self:UpdateSlotForSelection( slot, bAnimated )
		end

	end	

	if not self.bSilent then
		UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )
	end

end


--
function UI.BaseListWnd:EnsureSelectionIsVisible_adaptVisibleRange( bAnimated )

	self:EnsureRecordIsVisible_adaptVisibleRange( self.selRecordIdx, bAnimated )

end



--
function UI.BaseListWnd:EnsureRecordIsVisible_adaptVisibleRange( recordIdx, bAnimated )

	if recordIdx == -1 then
		return
	end

	local lastVisibleRecordIdx = self:GetLastVisibleRecordIdx()

	if recordIdx >= self.firstVisibleRecordIdx and recordIdx <= lastVisibleRecordIdx then
		return
	end

	if recordIdx < self.firstVisibleRecordIdx then
	    self:SetFirstVisibleRecord( recordIdx, true, bAnimated )

	elseif recordIdx > lastVisibleRecordIdx then
	    self:SetLastVisibleRecord( recordIdx, true, bAnimated )
	end	

end



--
function UI.BaseListWnd:EnsureSelectionIsVisible_adaptSelection( bAnimated )

	if self:HasListStyle( self.listStyles.FIXED_SELECTION ) then
		return
	end

	if self.selRecordIdx == -1 then
		return
	end

	local lastVisibleRecordIdx = self:GetLastVisibleRecordIdx()

	if self.selRecordIdx >= self.firstVisibleRecordIdx and self.selRecordIdx <= lastVisibleRecordIdx then
		return
	end

	if self.selRecordIdx < self.firstVisibleRecordIdx then
		self:SelectRecordInternal( self.firstVisibleRecordIdx, bAnimated )

	elseif self.selRecordIdx > lastVisibleRecordIdx then
		self:SelectRecordInternal( lastVisibleRecordIdx, bAnimated )
	end	

end


--
function UI.BaseListWnd:SetFirstVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	self.firstVisibleRecordIdx = recordIdx
	self:UpdateOnChangeVisibleRange( bUpdateScrollBar, bAnimated )

end


--
function UI.BaseListWnd:SetLastVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	local firstVisibleRecordIdx = -1

	if recordIdx ~= -1 then
		firstVisibleRecordIdx = math.max( recordIdx - self.MAX_SLOTS + 1, 1 )
	end

	self:SetFirstVisibleRecord( firstVisibleRecordIdx, bUpdateScrollBar, bAnimated )

end


--
function UI.BaseListWnd:GetLastVisibleRecordIdx()

	if self.firstVisibleRecordIdx == -1 then
		return -1
	end

	return self.firstVisibleRecordIdx + math.min( self.numRecords, self.numSlots ) - 1

end


--
function UI.BaseListWnd:UpdateOnChangeVisibleRange( bUpdateScrollBar, bAnimated )

	if bUpdateScrollBar == nil then
		bUpdateScrollBar = true
	end

	if bUpdateScrollBar then
		self:UpdateScrollBarPos()
	end

	self:UpdateRecordsOnChangeVisibleRange()
	self:UpdateSlotsOnChangeVisibleRange( bAnimated )	

end


--
function UI.BaseListWnd:UpdateScrollBarVisibility()	

	local bNeedScrollBar = not self:HasListStyle( self.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED ) or self.numRecords > self.MAX_SLOTS

	if bNeedScrollBar then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollObjName, UI.EffectAnimParams.POS )
		end

		self:UpdateScrollBarRange()
		self:UpdateScrollBarPos()

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )
	
	end

end


--
function UI.BaseListWnd:UpdateScrollBarRange()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetRange( 0, math.max( 0, self.numRecords - self.MAX_SLOTS ) )

end


--
function UI.BaseListWnd:UpdateScrollBarPos()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	local pos = self.firstVisibleRecordIdx - 1
	self.scrollBar:SetPos( pos )

end


--
function UI.BaseListWnd:ScrollSelection( bForward, numRecords )

	if self:HasListStyle( self.listStyles.FIXED_SELECTION ) then
		return
   	end

	if self.selRecordIdx == -1 then
		return
	end

	if not numRecords then
		numRecords = 1
	end

	local nextRecordIdx = self.selRecordIdx + ( bForward and numRecords or -numRecords )	

	if self:HasListStyle( self.listStyles.WRAPPED_SCROLL ) then
		nextRecordIdx = math.fmod( nextRecordIdx - 1 + self.numRecords, self.numRecords ) + 1

	else 
		nextRecordIdx = UI:Clamp( nextRecordIdx, 1, self.numRecords )
		if nextRecordIdx == self.selRecordIdx then
    		return
		end
	end

	self:EnsureRecordIsVisible_adaptVisibleRange( nextRecordIdx, true )

	local record = self.records[ nextRecordIdx ]
	if not record then
		sys.log( "UI.BaseListWnd:ScrollSelection()[ERROR]: cannot find record %d (wnd \"%s\")", nextRecordIdx, self:GetScriptTableName() )
		return
	end

	self:SelectRecordInternal( nextRecordIdx, true )

	if self.selectSound and self.selectSound ~= "" then
		UI:PlayGlobalSound( self.selectSound )
	end

end  


--
function UI.BaseListWnd:ScrollVisibleRange( bForward, numRecords )

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	if not numRecords then
		numRecords = 1
	end

	local nextRecordIdx = self.firstVisibleRecordIdx + ( bForward and numRecords or -numRecords )

	if self:HasListStyle( self.listStyles.WRAPPED_SCROLL ) then
		nextRecordIdx = math.fmod( nextRecordIdx - 1 + self.numRecords, self.numRecords ) + 1

	else 
		if nextRecordIdx < 1 or nextRecordIdx > self.numRecords - self.numSlots + 1 then
			return
		end

		if nextRecordIdx == self.firstVisibleRecordIdx then
			return
		end
	end

	self:SetFirstVisibleRecord( nextRecordIdx, true, true )

end


--
function UI.BaseListWnd:UpdateVisibleRangeFromScrollBar()

	if self.numRecords == 0 then
		return
	end

	local pos = self.scrollBar:GetPos()

	local firstRecordIdx = UI:Clamp( math.floor( pos ) + 1, 1, self.numRecords )

	self:SetFirstVisibleRecord( firstRecordIdx, false, true )

	if self:HasListStyle( self.listStyles.SCROLL_SELECTION_WITH_BAR ) then
		self:EnsureSelectionIsVisible_adaptSelection( true )	
	end

end


--
function UI.BaseListWnd:GetSlotForRecord( record )

	if not record then
		sys.log( "UI.BaseListWnd:GetSlotForRecord()[ERROR]: nil record (wnd \"%s\")", self:GetScriptTableName() )
		return nil
	end

	local slotIdx = record.idx - self.firstVisibleRecordIdx + 1
	return self.slots[ slotIdx ]

end


--
function UI.BaseListWnd:GetRecordForSlot( slot )

	local recordIdx = self.firstVisibleRecordIdx + slot.idx - 1
	return self.records[ recordIdx ]

end


--
function UI.BaseListWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:UpdateVisibleRangeFromScrollBar()

end


--
function UI.BaseListWnd:ShowSlot( slot )
end


--
function UI.BaseListWnd:HideSlot( slot )
end


--
function UI.BaseListWnd:UpdateRecordsOnChangeVisibleRange()
end


--
function UI.BaseListWnd:UpdateSlotsOnChangeVisibleRange( bAnimated )

	for slotIdx = 1, self.numSlots do
		local slot = self.slots[ slotIdx ]
		self:UpdateSlotForRecord( slot, bAnimated )
	end

end


--
function UI.BaseListWnd:UpdateRecordForSlot( record )
end

  
--
function UI.BaseListWnd:UpdateSlotForRecord( slot, bAnimated )

	local record = self:GetRecordForSlot( slot )

	if record then
		self:ShowSlot( slot )
	else
		self:ResetSlot( slot )
		if self:HasListStyle( self.listStyles.HIDE_EMPTY_SLOTS ) then
			self:HideSlot( slot )
		end
	end

end


--
function UI.BaseListWnd:ResetSlot( slot )
end


--
function UI.BaseListWnd:UpdateRecordForSelection( record )
end


--
function UI.BaseListWnd:UpdateSlotForSelection( slot, bAnimated )
end


--
function UI.BaseListWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	if self.scrollBar and child ~= self.scrollBar and self.scrollBar:IsChildOf( self ) then
		self:MoveChildToLastPosition( self.scrollBar )
	end

end