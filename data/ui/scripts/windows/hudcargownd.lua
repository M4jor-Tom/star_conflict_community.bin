-- ----------------------------------------------------------------------------
--
-- Workfile: hudcargownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudCargoWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.HudCargoWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "HudCargoWnd",
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
				defName 			= "hud_cargo_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title4",
						layer		= "UI.HudCargoWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg",	
						layer		= "UI.HudCargoWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}				
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_cargo_bg",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.HudCargoWnd:OnLootCrateHarvested( defName, amount )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateCaption()
	self:UpdateSlots()

end


--
function UI.HudCargoWnd:OnLootCrateDropped()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateCaption()
	self:UpdateSlots()

end


--
function UI.HudCargoWnd:OnCargoHoldItemConsumed()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateCaption()
	self:UpdateSlots()

end


--
function UI.HudCargoWnd:OnCargoHoldResized()

	if not self:IsOnScreen() then
		return
	end
	
	self:FullUpdate()

end


--
function UI.HudCargoWnd:OnBindsChanged()

	if self:IsOnScreen() then
		self:UpdateCaption()
	end

end


--
function UI.HudCargoWnd:OnToggleCargoModeBind()

	if not self:IsOnScreen() then
		return
	end

	if self.mode ~= -1 then

		local newMode = self.mode % UI:GetTableLength( self.modes ) + 1
		self:SetMode( newMode, true )

	else

		sys.log( "UI.HudCargoWnd:OnToggleCargoModeBind()[ERROR]: invalid mode" )
		self:ValidateMode( true )

	end

end


--
function UI.HudCargoWnd:GetMaxHeight()

	return self.selfHeightMax

end


--
function UI.HudCargoWnd:GetMode()

	return self.mode

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.HudCargoWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	BG_EFFECT	= 2,
}

UI.HudCargoWnd.btnPrototypeName = "HudCargo_RowWnd"

UI.HudCargoWnd.effectInfo =
{
	main =
	{
		scrollObjName			= "",
		slotObjNamePrefix		= "slot_",
		animIdle				= "idle",
		selfSizeOpenLocator		= "self",
		selfSizeClosedLocator	= "self_2",
		bgLocator				= "bg",
	},

	bg =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	}
}

UI.HudCargoWnd.MAX_SLOTS 		= 4
UI.HudCargoWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.HudCargoWnd.MAX_SLOTS_IN_ROW	= 4

UI.HudCargoWnd.sounds =
{
	slotMouseOver	= UI.sounds.btnMouseOver
}

UI.HudCargoWnd.modes =
{
	OPEN	= 1,
	CLOSED	= 2,
}

UI.HudCargoWnd.DEFAULT_MODE	= UI.HudCargoWnd.modes.CLOSED

-- -----------------------------------
-- vars
-- -----------------------------------

UI.HudCargoWnd.maxCargoSlots		= 0
UI.HudCargoWnd.mode					= -1
UI.HudCargoWnd.bgMinHeight			= 0
UI.HudCargoWnd.bgMaxHeight			= 0
UI.HudCargoWnd.space_slots_bgBtm	= 0
UI.HudCargoWnd.space_bg_btm			= 0
UI.HudCargoWnd.selfHeightClosed		= 0
UI.HudCargoWnd.selfHeightMax		= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.HudCargoWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_ACTIVATE_RECORD )	

end


--
function UI.HudCargoWnd:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowWnd = self:GetButtonForRecord( recordIdx )
	if not rowWnd then
		return 0
	end

	return rowWnd:GetNumSlots()	

end


--
function UI.HudCargoWnd:Reset()

	local oldMode = self.mode
	
	self.maxCargoSlots	= 0
	self.mode			= -1

	self:SetText( "", self.layers.CAPTION )
	self:ResetSlots()
	self:SetLayerVisible( false, self.layers.BG_EFFECT )
	self:SetHeight( 0 )
	
	if oldMode ~= self.mode and not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:NotifyOnModeChanged( oldMode )
	end

end


--
function UI.HudCargoWnd:ResetSlots()

	self:Clear()

end


--
function UI.HudCargoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()
	
end


--
function UI.HudCargoWnd:FullUpdate()

	self:Reset()

	self:UpdateMaxSize()
	self:ValidateMode( false )

	self:UpdateCaption()
	self:UpdateSlots()

	self:RecalcLayout()

end


--
function UI.HudCargoWnd:UpdateMaxSize()

	self.maxCargoSlots = _G.CL_GetPlayerCargoHoldMaxSize( UI.HudWnd.localPlayerId )

	local maxSlots = self.MAX_SLOTS * self.MAX_SLOTS_IN_ROW
	if self.maxCargoSlots > maxSlots then
		sys.log( "UI.HudCargoWnd:UpdateMaxSize()[ERROR]: too big cargo size (%d); max slots to show is %d", self.maxCargoSlots, maxSlots )
	end

end


--
function UI.HudCargoWnd:UpdateCaption()

	local items = _G.CL_GetPlayerCargoHoldItems( UI.HudWnd.localPlayerId )
	
	local strNumItems	= tostring( #items )
	local strMaxItems	= tostring( self.maxCargoSlots )
	local strKey		= UI:GetBindKeysStr( "toggleCargoMode" )

	local str = UI:GetStringByName( "hud_cargo_caption" )

	str = string.format( "%s: %s/%s", str, strNumItems, strMaxItems )

	if strKey ~= "" then
		str = string.format( "%s [%s]", str, strKey )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.HudCargoWnd:UpdateSlots()

	self:ResetSlots()

	if self.mode ~= self.modes.OPEN then
		return
	end

	local items = _G.CL_GetPlayerCargoHoldItems( UI.HudWnd.localPlayerId )

	local numSlots = #items
	local maxShowSlots = self.MAX_SLOTS * self.MAX_SLOTS_IN_ROW
	if numSlots > maxShowSlots then
		sys.log( "UI.HudCargoWnd:UpdateSlots()[ERROR]: too many items (%d); max items for show is %d", numSlots, maxShowSlots )
	end	

	if numSlots > self.maxCargoSlots then
		sys.log( "UI.HudCargoWnd:UpdateSlots()[ERROR]: numSlots (%d) is more than stored maxCargoSlots val (%d)", numSlots, self.maxCargoSlots )
	end

	numSlots = math.max( numSlots, self.maxCargoSlots )

	local rows		= {}
	local slotIdx	= 1
	local rowData	= { slots = {} }

	for idx = 1, numSlots do
		
		local item = items[ idx ]

		local slotData = {}
		slotData.defName		= item and item.defName or ""	-- пустые слоты также показываются
		slotData.amount			= item and item.amount or 0
		slotData.cargoSlotId	= idx - 1

		if not rowData then
			rowData = { slots = {} }
		end

		-- заполнение слотов в ряду идет справа налево; это обеспечивается нумерацией локаторов
		table.insert( rowData.slots, slotData )

    	slotIdx = slotIdx + 1
    	if slotIdx > self.MAX_SLOTS_IN_ROW then

			table.insert( rows, rowData )

    		slotIdx = 1
    		rowData = { slots = {} }

    	end

	end	

	if rowData.slots[ 1 ] then
		table.insert( rows, rowData )
	end

	-- заполнение рядов идет снизу вверх
	for rowIdx = #rows, 1, -1 do
		self:AddRecord( rows[ rowIdx ] )
	end

end


--
function UI.HudCargoWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bgEffect		= UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	local rowWnd		= self.slots[ 1 ].btn

	local selfSizeOpen		= mainEffect:GetObjSize( self.effectInfo.main.selfSizeOpenLocator )
	local selfSizeClozed	= mainEffect:GetObjSize( self.effectInfo.main.selfSizeClosedLocator )
	local bgMinSize			= bgEffect:GetObjSize( self.effectInfo.bg.minSizeLocator )
	local bgMaxSize			= bgEffect:GetObjSize( self.effectInfo.bg.maxSizeLocator )
	local bgPos				= mainEffect:GetObjPos( self.effectInfo.main.bgLocator )
	local lastRowPos		= mainEffect:GetObjPos( string.format( "%s%s", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) )
	local rowHeight			= rowWnd:GetHeight()

    self.bgMinHeight		= bgMinSize.y
    self.bgMaxHeight		= bgMaxSize.y
	self.space_slots_bgBtm	= ( bgPos.y + bgMaxSize.y ) - ( lastRowPos.y + rowHeight )
	self.space_bg_btm		= selfSizeOpen.y - ( bgPos.y + bgMaxSize.y )
	self.selfHeightClosed	= selfSizeClozed.y
	self.selfHeightMax		= selfSizeOpen.y

	self:SetWidth( selfSizeOpen.x )

end


--
function UI.HudCargoWnd:RecalcLayout()

	if self.mode == self.modes.OPEN then

		if self:GetNumRecords() > 0 then

    		self:SetLayerVisible( true, self.layers.BG_EFFECT )

    		local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

    		local lastRowWnd = self:GetButtonForRecord( lastVisibleRecordIdx )
    		local lastRowY1 = lastRowWnd:GetTop() + lastRowWnd:GetHeight()

    		local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
    		local bgY = bgEffect:GetPos().y

    		local bgHeight = ( lastRowY1 + self.space_slots_bgBtm ) - bgY
    		bgHeight = UI:Clamp( bgHeight, self.bgMinHeight, self.bgMaxHeight )

        	local bgAnimTime = ( bgHeight - self.bgMinHeight ) / ( self.bgMaxHeight - self.bgMinHeight )
        	bgEffect:SetAnimationTime( bgAnimTime )
        	bgEffect:UpdateAnimation()

    		local selfHeight = bgY + bgHeight + self.space_bg_btm

			if selfHeight > self.selfHeightMax then
				selfHeight = self.selfHeightMax
			end
    		self:SetHeight( selfHeight )

		else

			self:SetLayerVisible( false, self.layers.BG_EFFECT )
			self:SetHeight( self.selfHeightClosed )

		end

	elseif self.mode == self.modes.CLOSED then

		self:SetLayerVisible( false, self.layers.BG_EFFECT )
		self:SetHeight( self.selfHeightClosed )

	else

		sys.log( "UI.HudCargoWnd:RecalcLayout()[ERROR]: invalid mode" )

	end

	UI.HudWnd:OnCargoWndHeightChanged()

end


--
function UI.HudCargoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if _G.IsCursorHidden() then
		return true		
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "HudCargo_SlotWnd" ) then

		local playerId		= UI.HudWnd.localPlayerId
		local spectateId	= _G.GetSpectatorTargetIdx()
		local bIsSpectator = playerId ~= spectateId

		if not bIsSpectator then

			if wnd:GetDefName() ~= "" then
				local cargoSlotId = wnd:GetCargoSlotId()
				self:DropItem( cargoSlotId )
			end

		end

	end

	return true

end


--
function UI.HudCargoWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if _G.IsCursorHidden() then
		return true		
	end

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "HudCargo_SlotWnd" ) then

		local playerId		= UI.HudWnd.localPlayerId
		local spectateId	= _G.GetSpectatorTargetIdx()
		local bIsSpectator = playerId ~= spectateId

		if not bIsSpectator then

			if wnd:GetDefName() ~= "" then
				self:ShowPopUpMenuForItem( wnd )
			end

		end

	end

	return true

end


--
function UI.HudCargoWnd:F_OnEventListActivateRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.PopUpMenuWnd:GetUiHandle() and UI.PopUpMenuWnd:GetOwner() == self:GetUiHandle() then

    	local menuType = UI.PopUpMenuWnd:GetMenuType()
    	if menuType == UI.popUpMenuTypes.LOOT then
    		self:OnPopUpMenu( iParam0 )
    	else
    		sys.log( "UI.HudCargoWnd:F_OnEventListActivateRecord()[ERROR]: unhandled pop-up menu type: \"%s\"", tostring( menuType ) )
    	end

	end

end  


--
function UI.HudCargoWnd:ShowPopUpMenuForItem( slotWnd )

	local defName		= slotWnd:GetDefName()
	local cargoSlotId	= slotWnd:GetCargoSlotId()
	
	local menuDatas = {}

	local dropData = {}
	dropData.slotType		= UI.popUpMenuSlotTypes.DROP_LOOT_ITEM
	dropData.cargoSlotId	= cargoSlotId
	dropData.text			= UI:GetStringByName( "popUpMenu_dropLootItem" )
	table.insert( menuDatas, dropData )
	
	if _G.GetCurrentGameMode() == ai.Gameplay.BATTLE_ROYALE and UI:CanItemBeAcivatedInBattleRoyal( defName ) then
	
		local activateData = {}
		activateData.slotType		= UI.popUpMenuSlotTypes.ACTIVATE_LOOT_ITEM
		activateData.cargoSlotId	= cargoSlotId
		activateData.text			= UI:GetStringByName( "popUpMenu_activateLootItem" )
		table.insert( menuDatas, activateData )
		
	end
	
	if next( menuDatas ) then
	
		UI.PopUpMenuWnd:Setup( self:GetUiHandle(), UI.popUpMenuTypes.LOOT, UI:GetEntityLocalizedNameByDef( defName, true, false, true ) )
		
		for idx, data in ipairs( menuDatas ) do
			UI.PopUpMenuWnd:AddRecord( data )
		end
		
	end

end


--
function UI.HudCargoWnd:OnPopUpMenu( recordIdx )

	local data = UI.PopUpMenuWnd:GetRecordData( recordIdx )
	if not data then
		sys.log( "UI.HudCargoWnd:OnPopUpMenu()[ERROR]: cannot find pop-up menu data for record %d", recordIdx )
		return
	end

	if data.slotType == UI.popUpMenuSlotTypes.DROP_LOOT_ITEM then
		self:DropItem( data.cargoSlotId )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.ACTIVATE_LOOT_ITEM then
		self:ActivateItem( data.cargoSlotId )
	end

end


--
function UI.HudCargoWnd:DropItem( cargoSlotId )

	_G.CL_RequestDropCargoHoldItem( cargoSlotId )

end


--
function UI.HudCargoWnd:ActivateItem( cargoSlotId )

	_G.CL_RequestActivateCargoHoldItem( cargoSlotId )

end


--
function UI.HudCargoWnd:ValidateMode( bUpdate )

	if self.mode ~= -1 then
		return
	end

	local mode = self:GetSavedMode()

	if mode == -1 then
		mode = self.DEFAULT_MODE
	end

	self:SetMode( mode, bUpdate )

end


--
function UI.HudCargoWnd:SetMode( mode, bUpdate )

	if mode == self.mode then
		return
	end

	local oldMode = self.mode
	self.mode = mode
	self:SaveMode()

	if bUpdate and self:IsOnScreen() then
		self:FullUpdate()
	end	
	
	self:NotifyOnModeChanged( oldMode )

end


--
function UI.HudCargoWnd:NotifyOnModeChanged( oldMode )

	if oldMode ~= self.mode then
		UI:SendUiEvent( UI.EV_HUD_CARGO_MODE_CHANGED, self:GetUiHandle(), UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, self.mode, oldMode, 0, 0 )
	end
	
end


--
function UI.HudCargoWnd:SaveMode()

	if self.mode == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if profile.hudCargoMode ~= self.mode then

		profile.hudCargoMode = self.mode
		Profile:Save()

	end

end


--
function UI.HudCargoWnd:GetSavedMode()

	local profile = _G.GetProfileTable()

	local mode = profile.hudCargoMode

	if type( mode ) ~= "number" or UI:Val2Key( self.modes, mode ) == "" then
		mode = nil
	end

	if mode == nil then
		mode = -1
	end

	return mode

end


-- -------------------------------------------------------------------------
-- UI.HudCargo_RowWnd
-- -------------------------------------------------------------------------

UI.HudCargo_RowWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.HudCargo_RowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "HudCargo_RowWnd",
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
				defName 			= "hud_cargo_row",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,			
					},
				}
			}}
		}
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.HudCargo_RowWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	for slotIdx, slotWnd in ipairs( self.slots ) do
		self:HideSlot( slotIdx ) 
	end

end


--
function UI.HudCargo_RowWnd:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.HudCargo_RowWnd:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.HudCargo_RowWnd:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in ipairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.HudCargo_RowWnd.effectInfo =
{
	main =
	{
		slotPrefix = "slot_"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.HudCargo_RowWnd.slots = {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.HudCargo_RowWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.HudCargo_RowWnd:CreateSlots()

	for slotIdx = 1, UI.HudCargoWnd.MAX_SLOTS_IN_ROW do

		local slotWnd = UI:CreateChildWnd( self, UI.HudCargo_SlotWnd, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.HudCargo_RowWnd:UpdateForData( data, bAnimated )

	self:Reset()

	if not data then
		return
	end

	for slotIdx = 1, #data.slots do

		self:ShowSlot( slotIdx )

		local slotWnd = self.slots[ slotIdx ]
		if slotWnd then
			slotWnd:Setup( data.slots[ slotIdx ] )
		end		

	end

end


--
function UI.HudCargo_RowWnd:HideSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd then

		slotWnd:Reset()
		slotWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.HudCargo_RowWnd:ShowSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.HudCargo_RowWnd:ShowSlot()[ERROR]: cannot find slot %d", slotIdx )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )

	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

end


-- ----------------------------------------------------------
-- UI.HudCargo_SlotWnd
-- ----------------------------------------------------------

UI.HudCargo_SlotWnd = {}

-- -----------------------------------
-- wndow definition
-- -----------------------------------

UI.HudCargo_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ItemIcoWnd",

	props =
	{
		name		= "HudCargo_SlotWnd",
		isPrototype	= true,
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.HudCargo_SlotWnd:SetSlot( slotIdx )

	self.slotIdx = slotIdx

end


--
function UI.HudCargo_SlotWnd:GetSlot()

	return self.slotIdx

end


--
function UI.HudCargo_SlotWnd:GetRow()

	local parent = self:GetParent()
	return parent and parent:GetRecord() or -1

end


--
function UI.HudCargo_SlotWnd:Reset()

	self.data = nil
	UI.ItemIcoWnd.Reset( self )

end


--
function UI.HudCargo_SlotWnd:Setup( data )

	self:Reset()

	self.data = data

	self:UpdateMainAnimation()

	if self.data.defName ~= "" then
		self:UpdateIco()
		self:UpdateTooltip()
	end

end


--
function UI.HudCargo_SlotWnd:GetDefName()

	return self.data and self.data.defName or ""

end


--
function UI.HudCargo_SlotWnd:GetCargoSlotId()

	return self.data and self.data.cargoSlotId or -1

end


-- -----------------------------------
-- vars
-- -----------------------------------

UI.HudCargo_SlotWnd.data		= nil
UI.HudCargo_SlotWnd.slotIdx		= -1

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.HudCargo_SlotWnd:UpdateMainAnimation()

	if self.data.defName == "" then
		self:AnimateMainInactive()
	else
		self:AnimateMainIdle()
	end

end


--
function UI.HudCargo_SlotWnd:UpdateIco()

	self:SetupForItem( self.data.defName )
	
	if self.data.amount > 1 then
		self:SetCountResources( self.data.amount )
	end

end


--
function UI.HudCargo_SlotWnd:UpdateTooltip()

	local tooltipData = UI:GetTooltipForItem( self.data.defName )
	self:SetTooltipData( tooltipData )

end


--
function UI.HudCargo_SlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not _G.IsCursorHidden() and self.data and self.data.defName ~= "" then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.HudCargo_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver then
		self:ShowMouseOver()
	else
		self:HideMouseOver()
	end

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.HudCargoWnd.sounds.slotMouseOver )
	end

end


--
function UI.HudCargo_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.HudCargo_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.HudCargo_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end