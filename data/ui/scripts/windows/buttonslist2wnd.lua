-- ----------------------------------------------------------------------------
--
-- Workfile: ButtonsList2Wnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id: buttonslist2wnd.lua 3234 2011-06-01 11:31:08Z $
-- ----------------------------------------------------------------------------

-- "карусельный" список - анимированное скроллирование, выделение на фиксированном элементе, крайние элементы при скроллировании уходят в альфу

UI.ButtonsList2Wnd = {}
local bl = UI.ButtonsList2Wnd

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ButtonsList2Wnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ButtonsList2Wnd",
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
	},
}


-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ButtonsList2Wnd:AddRecord( data )

	local record = {}

	record.idx = self.numRecords + 1
	record.data = data

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	local slot = self:GetFreeSlot()
	if slot then
		self:AddChild( slot )
		slot:SetupForRecord( record )
	end

end


--
function UI.ButtonsList2Wnd:SetRecordData( data, recordIdx )

	local record = self.records[ recordIdx ]
	
	if record then
		record.data = data
	end

	local slot = self:GetSlotForRecord( record )
	if slot then
		slot:OnRecordDataChanged()
	end

end


--
function UI.ButtonsList2Wnd:GetRecordData( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.data

end


--
function UI.ButtonsList2Wnd:GetNumRecords()

	return self.numRecords

end


--
function UI.ButtonsList2Wnd:GetNumSlots()

	return self.numSlots

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:GetNumVisibleSlots()

	sys.log( "UI.ButtonsList2Wnd:GetNumVisibleSlots()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )
	return 0

end


--
function UI.ButtonsList2Wnd:SelectRecord( recordIdx, bAnimated, bReverse )

	local record = self.records[ recordIdx ]
	local oldRecord = self:GetSelectedRecordInternal()

	if oldRecord == record then
		-- Т.к. выделенной считается просто центральная запись, то при добавлении записей "выделение" меняется;
		-- однако сообщение о смене выделения при добавлении не посылается. Посылаю его здесь
		self:NotifyOnSelRecordChanged( false )
		return
	end	

	if not record then
		return
	end

	if not oldRecord then
		bAnimated = false
	end

	if not bAnimated then
		self:CenterSlotsOnRecord( recordIdx )
		self:ResetScroll()

		self:NotifyOnSelRecordChanged( false )

	else

		local delta = 0

		if not self:IsWrapped() then
			delta = recordIdx - oldRecord.idx
		else
			local d1 = math.fmod( recordIdx - oldRecord.idx + self.numRecords, self.numRecords )
			local d2 = d1 - self.numRecords 

			if math.abs( d1 ) < math.abs( d2 ) then
				delta = bReverse and d2 or d1
			else
				delta = bReverse and d1 or d2
			end

		end

		self:ScrollAnimated( delta )
	end

end


--
function UI.ButtonsList2Wnd:GetSelectedRecord()

	local selRecord = self:GetSelectedRecordInternal()
	return selRecord and selRecord.idx or -1

end


--
function UI.ButtonsList2Wnd:Clear()

	for slotIdx, slot in pairs( self.slots ) do
		slot:Reset()
		slot:UnlinkFromParent()
	end

	self.records = {}
	self.numRecords = 0

	self:ResetScroll()

end 


--
function UI.ButtonsList2Wnd:Scroll( bForward )

	self:ScrollAnimated( bForward and 1 or -1 )

end


--
function UI.ButtonsList2Wnd:ScrollHome()

	self:SelectRecord( 1, true )

end


--
function UI.ButtonsList2Wnd:ScrollEnd()

	self:SelectRecord( self.numRecords, true )

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:HasScrollBar()

	return false

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:HasListStyle( style )

	sys.log( "UI.ButtonsList2Wnd:HasListStyle()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )
	return false

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:SetListStyle( style )

	sys.log( "UI.ButtonsList2Wnd:SetListStyle()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:AddListStyle( style )

	sys.log( "UI.ButtonsList2Wnd:AddListStyle()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:RemoveListStyle( style )

	sys.log( "UI.ButtonsList2Wnd:RemoveListStyle()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )

end  


--
function UI.ButtonsList2Wnd:Record2SlotIdx( recordIdx )

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx == -1 then
		return -1
	end	

	local slotIdx = self.CENTRAL_SLOT_IDX + recordIdx - selRecordIdx

	if self:IsWrapped() then
		slotIdx = math.fmod( slotIdx + -1 + self:GetNumRecords(), self:GetNumRecords() ) + 1
	end

	return slotIdx

end


--
function UI.ButtonsList2Wnd:Slot2RecordIdx( slotIdx )

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx == -1 then
		return -1
	end	

	local recordIdx = selRecordIdx + slotIdx - self.CENTRAL_SLOT_IDX

	if self:IsWrapped() then
		recordIdx = math.fmod( recordIdx - 1, self:GetNumRecords() ) + 1
	end

	return recordIdx

end


--
function UI.ButtonsList2Wnd:IsWrapped()

	if not self.bWrapped then
		return false
	end

	if self:GetNumRecords() < self:GetNumSlots() then
		return false
	end

	return true

end


--
function UI.ButtonsList2Wnd:ActivateRecord( recordIdx )

	if not self.recordx[ recordIdx ] then
		sys.log( "UI.ButtonsList2Wnd:ActivateRecord()[ERROR]: invalid record idx: %s (wnd \"%s\")", tostring( recordIdx ), self:GetScriptTableName() )
		return
	end

	self:SelectRecord( recordIdx, false )

	UI:SendUiEvent( UI.EV_LIST_ACTIVATE_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, recordIdx, 0, 0, 0 )

end


-- только для совместимости с интерфейсом UI.BaseListWnd
function UI.ButtonsList2Wnd:GetVisibleRange()

	sys.log( "UI.ButtonsList2Wnd:GetVisibleRange()[ERROR]: not implemented (wnd \"%s\")", self:GetScriptTableName() )
	return -1, -1

end


-- для совместимости с интерфейсом UI.ButtonsListWnd
function UI.ButtonsList2Wnd:GetButtonForSlot( slotIdx )

	return self.slots[ slotIdx ]

end


--
function UI.ButtonsList2Wnd:IsScrolling()

	return self.scrollDir ~= 0

end

-- ---------------------------------
-- const
-- ---------------------------------

bl.MAX_SLOTS				= 0
bl.CENTRAL_SLOT_IDX			= -1
bl.slotProtoName			= ""
bl.SCROLL_DEFAULT_SPEED 	= 4		-- слотомест / сек
bl.SCROLL_ACCELERATION_CF	= 0.1

bl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
	}
}

bl.layers =
{
	MAIN_EFFECT	= 0,
}

bl.bLinkByColor = false
bl.bLinkByAlpha = false
bl.bLinkBySize	= false

-- ---------------------------------
-- vars
-- ---------------------------------

bl.records			= {}
bl.slots			= {}
bl.numRecords		= 0
bl.numSlots			= 0
bl.scrollsQueued 	= 0
bl.scrollProgress	= 0
bl.scrollDir		= 0
bl.scrollSpeed		= bl.SCROLL_DEFAULT_SPEED
bl.anchors			= {}
bl.bWrapped			= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ButtonsList2Wnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.records			= {}
	self.slots				= {}
	self.numRecords			= 0
	self.numSlots			= 0	
	self.scrollsQueued 		= 0
	self.scrollProgress		= 0
	self.scrollDir			= 0
	self.scrollSpeed		= bl.SCROLL_DEFAULT_SPEED
	self.anchors			= {}

	if not self:IsPrototype() then
		self:InitAnchors()
		self:CreateSlots()
	end

end


--
function UI.ButtonsList2Wnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ButtonsList2Wnd:DeleteControls()

	for idx, slot in pairs( self.slots ) do
		UI:RemoveUiObj( slot:GetUiHandle() )
	end

	self.slots = {}

end


--
function UI.ButtonsList2Wnd:InitAnchors()

	self.anchors = {}

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	for slotIdx = 1, self.MAX_SLOTS do

		local objName = string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, slotIdx )

		local anchor = {}
		anchor.pos		= mainEffect:GetObjPos( objName )
		anchor.size		= mainEffect:GetObjSize( objName )

		if self.bLinkByColor then
			anchor.color = mainEffect:GetObjColor( objName )	
		end

		if self.bLinkByAlpha then
			anchor.alpha = mainEffect:GetObjAlpha( objName )	
		end

		table.insert( self.anchors, anchor )		

	end

end


--
function UI.ButtonsList2Wnd:CreateSlots()

	local tSlotProto = UI[ self.slotProtoName ]

	for slotIdx = 1, self.MAX_SLOTS do
		local slot = UI:CreateChildWnd( self, tSlotProto, tostring( slotIdx ) )
		slot:Init( slotIdx )
		table.insert( self.slots, slot )
	end

	self.numSlots = self.MAX_SLOTS

end


--
function UI.ButtonsList2Wnd:GetFreeSlot()

	for slotIdx = 1, self.MAX_SLOTS do
		local slot = self.slots[ slotIdx ]
		if not slot:GetRecord() then
			return slot
		end
	end

	return nil

end


--
function UI.ButtonsList2Wnd:GetSelectedRecordInternal()

	local centralSlot = self.slots[ self.CENTRAL_SLOT_IDX ]
	if centralSlot then
		return centralSlot:GetRecord()
	end

	return nil

end


--
function UI.ButtonsList2Wnd:GetSlotForRecord( record )

	for slotIdx, slot in pairs( self.slots ) do
		if slot:GetRecord() == record then
			return slot
		end
	end

	return nil

end


--
function UI.ButtonsList2Wnd:CenterSlotsOnRecord( recordIdx )

	for slotIdx, slot in pairs( self.slots ) do
		
		local recordIdxForSlot = recordIdx + slotIdx - self.CENTRAL_SLOT_IDX

    	if self:IsWrapped() then
    		recordIdxForSlot = math.fmod( recordIdxForSlot - 1 + self.numRecords, self.numRecords ) + 1
    	end

		local record = self.records[ recordIdxForSlot ]

		if not record then
			slot:Reset()
			slot:UnlinkFromParent()
		else
			self:AddChild( slot )
			slot:SetupForRecord( record )				
		end

	end		

end


--
function UI.ButtonsList2Wnd:ScrollAnimated( delta )

	if delta == 0 then
		return
	end

	local scrollDir = delta > 0 and 1 or -1
	local numScrolls = math.abs( delta )	

	-- если до этого было скроллирование в ту же сторону, то увеличивается скорость
	if scrollDir == self.scrollDir then

		self.scrollsQueued = self.scrollsQueued + numScrolls
		self.speed = self:CalcSpeed( self.scrollsQueued )

	-- если до этого не было скроллирования
	elseif self.scrollDir == 0 then

		if self:ScrollInternal( scrollDir, false --[[ нотификация вызывается вручную, после нотификации о начале скроллирования ]] ) then 

    		self.scrollDir		= scrollDir
    		self.scrollsQueued	= numScrolls
    		self.speed			= self:CalcSpeed( self.scrollsQueued )
    		self.scrollProgress	= 0

			self:NotifyOnStartScroll()
			self:NotifyOnSelRecordChanged( true )

		end

	-- если до этого было скроллирование в другую сторону
	else

		if self:ScrollInternal( scrollDir, true ) then 

    		self.scrollDir		= scrollDir
    		self.scrollsQueued	= numScrolls
    		self.speed			= self:CalcSpeed( self.scrollsQueued )
    		self.scrollProgress	= 1 - self.scrollProgress

		else
			self:ResetScroll()
		end
		
	end

end


--
function UI.ButtonsList2Wnd:ScrollInternal( delta, bNotifty )

	if delta == 0 then
		return false
	end

	local selRecord = self:GetSelectedRecordInternal()
	if not selRecord then
		return false
	end

	local nextRecordIdx = selRecord.idx + delta

	if not self:IsWrapped() then
		nextRecordIdx = UI:Clamp( nextRecordIdx, 1, self.numRecords )
	else
		nextRecordIdx = math.fmod( nextRecordIdx - 1, self:GetNumRecords() ) + 1
	end

	if nextRecordIdx == selRecord.idx then
		return false
	end

	self:CenterSlotsOnRecord( nextRecordIdx )

	if bNotifty then
		self:NotifyOnSelRecordChanged( true )
	end

	return true

end


--
function UI.ButtonsList2Wnd:CalcSpeed( scrollsQueued )

	return self.SCROLL_DEFAULT_SPEED + ( scrollsQueued > 1 and self.SCROLL_DEFAULT_SPEED * ( scrollsQueued - 1 ) * self.SCROLL_ACCELERATION_CF or 0 )

end


--
function UI.ButtonsList2Wnd:ResetScroll()

	local oldScrollDir = self.scrollDir

	self.scrollDir 		= 0
	self.scrollsQueued 	= 0
	self.scrollProgress	= 0
	self.scrollSpeed	= bl.SCROLL_DEFAULT_SPEED

	self:SnapSlotsToAnchors()

	if oldScrollDir ~= 0 then
		self:NotifyOnStopScroll()
	end

end


--
function UI.ButtonsList2Wnd:SnapSlotsToAnchors()

	for slotIdx, slot in pairs( self.slots ) do
		self:SnapSlotToAnchor( slot )
	end

end


--
function UI.ButtonsList2Wnd:SnapSlotToAnchor( slot )

	local anchor = self.anchors[ slot.idx ]

	local pos = anchor and anchor.pos or UI:Vec2( 0, 0 )
	slot:SetLeft( pos.x )
	slot:SetTop( pos.y )

	if self.bLinkBySize then

		local size = anchor and anchor.size or UI:Vec2( 0, 0 )
		slot:SetSize( size )

	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local effectAlpha = mainEffect and mainEffect:GetAlpha() or 255
	local effectColor = mainEffect and mainEffect:GetColor() or UI.WHITE_COLOR

	self:UpdateSlotOpacity( slot, effectAlpha, effectColor, anchor.alpha, anchor.color )

	local slotEffect = UI:GetEffectFromLayer( slot, slot.layers.MAIN_EFFECT )
	if slotEffect then
		slotEffect:Update( 0 )
	end

end


--
function UI.ButtonsList2Wnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScroll( dt_sys )

	if not self:IsScrolling() then
		self:UpdateSlotsOpacity()
	end

end


--
function UI.ButtonsList2Wnd:UpdateSlotsOpacity()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local effectAlpha = mainEffect:GetAlpha()
	local effectColor = mainEffect:GetColor()

	for slotIdx, slot in pairs( self.slots ) do

    	local anchor = self.anchors[ slotIdx ]

    	local anchorAlpha	= anchor and anchor.alpha or 255
    	local anchorColor	= anchor and anchor.color or UI.WHITE_COLOR

		self:UpdateSlotOpacity( slot, effectAlpha, effectColor, anchorAlpha, anchorColor )
	end

end


--
function UI.ButtonsList2Wnd:UpdateSlotOpacity( slot, effectAlpha, effectColor, anchorAlpha, anchorColor )

	local slotEffect = UI:GetEffectFromLayer( slot, slot.layers.MAIN_EFFECT )
	if not slotEffect then
		return
	end

	if self.bLinkByColor then

		local r =  UI:GetRed( anchorColor )   * UI:GetRed( effectColor )   / 255 
		local g =  UI:GetGreen( anchorColor ) * UI:GetGreen( effectColor ) / 255 
		local b =  UI:GetBlue( anchorColor )  * UI:GetBlue( effectColor )  / 255 

		local color = UI:MakeArgb( 255, r, g, b )
		slotEffect:SetColor( color )

	end

	if self.bLinkByAlpha then
		local alpha = anchorAlpha * effectAlpha / 255
		slotEffect:SetAlpha( alpha )
	end		

end


--
function UI.ButtonsList2Wnd:UpdateScroll( dt )

	if self.scrollDir == 0 then
		return
	end  

	self.scrollProgress = self.scrollProgress + self.speed * dt

	-- завершение очередного прогона
	if self.scrollProgress >= 1 then

		local numScrollsDone = math.min( math.floor( self.scrollProgress ), self.scrollsQueued )
		self.scrollsQueued = self.scrollsQueued - numScrollsDone

		-- если, например, был провал в fps, то мгновенная прокрутка без анимации всех "лишних" прогонов
		if numScrollsDone > 1 then

			if not self:ScrollInternal( ( numScrollsDone - 1 ) * self.scrollDir, true ) then
				self:ResetScroll()
				return
			end

		end

		-- остались еще прогоны в очереди
		if self.scrollsQueued > 0 then

			if not self:ScrollInternal( self.scrollDir, true ) then
				self:ResetScroll()
				return
			end

			self.scrollProgress = self.scrollProgress - numScrollsDone

		-- скроллирование закончено
		else
			self:ResetScroll()
			return
		end

	end

	-- процесс скроллирования - апдейт координат и альфы слотов
	if self.scrollDir ~= 0 then
		self:UpdateSlotsForScrollProgress()
	end	

end


--
function UI.ButtonsList2Wnd:UpdateSlotsForScrollProgress()

	for slotIdx, slot in pairs( self.slots ) do
		self:UpdateSlotForScrollProgress( slot )
	end

end  


--
function UI.ButtonsList2Wnd:UpdateSlotForScrollProgress( slot )	

	if not slot:IsChildOf( self ) then
		return
	end

	local anchor = self.anchors[ slot.idx ]

	local pos		= anchor and UI:Vec2Copy( anchor.pos ) or UI:ZeroVec2()
	local alpha		= nil
	local color		= nil
	local size		= nil

	if self.bLinkByColor then
		color = anchor and anchor.color or UI.WHITE_COLOR
	end

	if self.bLinkByAlpha then
		alpha = anchor and anchor.alpha or 255
	end

	if self.bLinkBySize then
		size = anchor and UI:Vec2Copy( anchor.size ) or UI:ZeroVec2()
	end

	if self.scrollDir ~= 0 then

		local prev_idx		= slot.idx + self.scrollDir
		local prev_anchor	= self.anchors[ prev_idx ]

		if prev_anchor then

    		local prev_pos		= prev_anchor and prev_anchor.pos or UI:ZeroVec2()
    		pos.x	= UI:Lerp( prev_pos.x, pos.x, self.scrollProgress )
    		pos.y	= UI:Lerp( prev_pos.y, pos.y, self.scrollProgress )

			if self.bLinkByColor then

	    		local prev_color = prev_anchor and prev_anchor.color or UI.WHITE_COLOR
    			color = UI:LerpColor( prev_color, color, self.scrollProgress )
			end

			if self.bLinkByAlpha then

	    		local prev_alpha = prev_anchor and prev_anchor.alpha or 255
    			alpha = UI:Lerp( prev_alpha, alpha, self.scrollProgress )

			end

			if self.bLinkBySize then

        		local prev_size		= prev_anchor and prev_anchor.size or UI:ZeroVec2()
        		size.x	= UI:Lerp( prev_size.x, size.x, self.scrollProgress )
        		size.y	= UI:Lerp( prev_size.y, size.y, self.scrollProgress )

			end

		end
		
	end

	slot:SetLeft( pos.x )
	slot:SetTop( pos.y )

	if self.bLinkBySize then
		slot:SetSize( size )
	end


	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local effectAlpha = mainEffect and mainEffect:GetAlpha() or 255
	local effectColor = mainEffect and mainEffect:GetColor() or UI.WHITE_COLOR

	self:UpdateSlotOpacity( slot, effectAlpha, effectColor, alpha, color )


	local slotEffect = UI:GetEffectFromLayer( slot, slot.layers.MAIN_EFFECT )
	if slotEffect then
		slotEffect:Update( 0 )
	end

end


--
function UI.ButtonsList2Wnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:ResetScroll()

end


--
function UI.ButtonsList2Wnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:ResetScroll()
	end

end


--
function UI.ButtonsList2Wnd:NotifySlotsOnSelRecordChanged( bAnimated )

	for slotIdx, slot in pairs( self.slots ) do
		if slot:IsOnScreen() then
			slot:OnListSelectionChanged( bAnimated )
		end
	end

end


--
function UI.ButtonsList2Wnd:NotifyOnSelRecordChanged( bAnimated )

	self:NotifySlotsOnSelRecordChanged( bAnimated )
	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, bAnimated and 1 or 0, 0, 0, 0 )

end


--
function UI.ButtonsList2Wnd:NotifyOnStartScroll()

	UI:SendUiEvent( UI.EV_LIST_START_SCROLL, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.ButtonsList2Wnd:NotifyOnStopScroll()

	UI:SendUiEvent( UI.EV_LIST_STOP_SCROLL, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


-- ----------------------------------------------------
-- UI.ButtonsList2_Btn
-- ----------------------------------------------------

UI.ButtonsList2_Btn = {}
local blb = UI.ButtonsList2_Btn

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ButtonsList2_Btn.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ButtonsList2_Btn",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ButtonsList2_Btn:Init( idx )

	self.idx = idx

end


--
function UI.ButtonsList2_Btn:GetIdx()

	return self.idx

end


--
function UI.ButtonsList2_Btn:Reset()

	self.record = nil

end


--
function UI.ButtonsList2_Btn:SetupForRecord( record )

	self:Reset()

	self.record = record
	self:OnRecordDataChanged()

end


--
function UI.ButtonsList2_Btn:GetRecord()

	return self.record

end


--
function UI.ButtonsList2_Btn:IsSelected()

	local parent = self:GetParent()
	return parent and self.record and parent:GetSelectedRecord() == self.record.idx

end

-- ---------------------------------
-- const
-- ---------------------------------

blb.layers =
{
	MAIN_EFFECT	= 0,
}

blb.BUTTON_LIST_BTN = true

-- ---------------------------------
-- vars
-- ---------------------------------

blb.idx				= -1
blb.record			= nil
blb.originalSize	= Vec2( 0, 0 )

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ButtonsList2_Btn:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.idx	= -1
	self.record	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.originalSize = mainEffect:GetObjSize( "self" )
	else
		self.originalSize = Vec2( 0, 0 )
	end

end


-- to override
function UI.ButtonsList2_Btn:OnRecordDataChanged()
end


-- to override
function UI.ButtonsList2_Btn:OnListSelectionChanged( bAnimated )
end


-- to override
function UI.ButtonsList2_Btn:SetSize( size )
end