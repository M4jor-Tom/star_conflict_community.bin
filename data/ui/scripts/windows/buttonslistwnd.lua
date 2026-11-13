-- ----------------------------------------------------------------------------
--
-- Workfile: ButtonsListWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id: buttonslistwnd.lua 3234 2011-06-01 11:31:08Z $
-- ----------------------------------------------------------------------------

-- "классический" список - скроллирование слотами

UI.ButtonsListWnd = {}
local bl = UI.ButtonsListWnd

-- -----------------------------
-- window definition
-- -----------------------------

UI.ButtonsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "BaseListWnd",

	props =
	{
		name			= "ButtonsListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype		= true,
	},
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.ButtonsListWnd:GetButtonForSlot( slotIdx )

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.ButtonsListWnd:GetButtonForSlot()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return nil
	end

	local slot = self.slots[ slotIdx ]
	return slot and slot.btn	

end


--
function UI.ButtonsListWnd:GetButtonForRecord( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.ButtonsListWnd:GetButtonForRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"); \"number\" expected, got \"%s\" (wnd '%s')", type( recordIdx ), self:GetName() )
		return nil
	end

	local slotIdx = self:Record2SlotIdx( recordIdx )
	return self:GetButtonForSlot( slotIdx )

end


-- -----------------------------
-- const
-- -----------------------------

bl.btnPrototypeName = ""

bl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_bar",
		animIdle			= "idle",
	}
}

bl.MAX_SLOTS = 0

-- -----------------------------
-- vars
-- -----------------------------

-- -----------------------------
-- work funcions
-- -----------------------------

--
function UI.ButtonsListWnd:InitSlots()	

	local btnProto = UI[ self.btnPrototypeName ]

	if not btnProto then
		return
	end

	for slotIdx = 1, self.MAX_SLOTS do

		local slot = { idx = slotIdx }	
		table.insert( self.slots, slot )
		self.numSlots = self.numSlots + 1

		slot.btn = UI:CreateChildWnd( self, btnProto, slotIdx )
		slot.btn:SetSlot( slotIdx, self )

		if not self:HasListStyle( self.listStyles.HIDE_EMPTY_SLOTS ) then
			self:ShowSlot( slot )
		end

	end

end


--
function UI.ButtonsListWnd:DeleteControls()

	if self.scrollBar then
		UI:RemoveUiObj( self.scrollBar:GetUiHandle() )
		self.scrollBar = nil
	end

	for idx, slot in pairs( self.slots ) do
		if slot.btn then
			UI:RemoveUiObj( slot.btn:GetUiHandle() )
			slot.btn = nil
		end
	end

end


--
function UI.ButtonsListWnd:ShowSlot( slot )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local objName = string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, slot.idx )
	UI:AddChildAndLink( self, slot.btn, mainEffect, objName, UI.EffectAnimParams.POS )

end


--
function UI.ButtonsListWnd:HideSlot( slot )

	slot.btn:UnlinkFromParent()

end


--
function UI.ButtonsListWnd:UpdateSlotForRecord( slot, bAnimated )

	UI.BaseListWnd.UpdateSlotForRecord( self, slot, bAnimated )

	if slot.btn:IsChildOf( self ) then
		slot.btn:Update( bAnimated )
	end

end


--
function UI.ButtonsListWnd:UpdateSlotForSelection( slot, bAnimated )

	local record = self:GetRecordForSlot( slot )
	local bSelect = record and record.idx == self.selRecordIdx

	slot.btn:Select( bSelect, bAnimated )	

end


--
function UI.ButtonsListWnd:ResetSlot( slot )

	if slot and slot.btn then
		slot.btn:Reset()
	end

end


-- ---------------------------------------------------------------
-- ButtonsList_Btn
-- ---------------------------------------------------------------

UI.ButtonsList_Btn = {}
local blb = UI.ButtonsList_Btn

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.ButtonsList_Btn.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ButtonsList_Btn",
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

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ButtonsList_Btn:SetSlot( slotIdx, parentListWnd )

	self.slotIdx = slotIdx
	self.parentListWnd = parentListWnd

end


--
function UI.ButtonsList_Btn:GetSlot()

	return self.slotIdx

end


--
function UI.ButtonsList_Btn:GetRecord()

	local list = self:GetList()
	if not list then
		return -1
	end

	return list:Slot2RecordIdx( self.slotIdx )

end


--
function UI.ButtonsList_Btn:Update( bAnimated )

	local list = self:GetList()
	if not list then
		return
	end

	local recordIdx = list:Slot2RecordIdx( self.slotIdx )
	local data = recordIdx ~= -1 and list:GetRecordData( recordIdx )

	if data then
		self:UpdateForData( data, bAnimated )
	end

end


--
function UI.ButtonsList_Btn:Reset()

	self:Select( false, false )

end


--
function UI.ButtonsList_Btn:Select( bSelect, bAnimated )
end


--
function UI.ButtonsList_Btn:IsSelected()

	local list = self:GetList()
	if not list then
		return false
	end

	local selRecordIdx = list:GetSelectedRecord()
	local selSlotIdx = list:Record2SlotIdx( selRecordIdx )

	return selSlotIdx == self.slotIdx

end

-- ------------------------------------
-- const
-- ------------------------------------

blb.layers =
{
	MAIN_EFFECT	= 0
}

blb.BUTTON_LIST_BTN = true

-- ------------------------------------
-- vars
-- ------------------------------------

blb.slotIdx			= -1
blb.parent			= nil
blb.parentListWnd	= nil

-- ------------------------------------
-- work funcitons
-- ------------------------------------

--
function UI.ButtonsList_Btn:UpdateForData( data, bAnimated )
end


--
function UI.ButtonsList_Btn:GetRecordData()

	local list = self:GetList()
	if not list then
		return nil
	end

	local recordIdx = list:Slot2RecordIdx( self.slotIdx )
	if recordIdx == -1 then
		return nil
	end

	return list:GetRecordData( recordIdx )

end


--
function UI.ButtonsList_Btn:GetList()

	return self.parentListWnd

end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.ButtonsList_Btn:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.ButtonsList_Btn:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end