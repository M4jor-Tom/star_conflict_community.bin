-- ----------------------------------------------------------------------------
--
-- Workfile: notificationslistwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.NotificationsListWnd = {}
local nl = UI.NotificationsListWnd

-- --------------------------
-- window definition
-- --------------------------

UI.NotificationsListWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "NotificationsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "notificationsList_main",
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
	},

	children = { "UI.NotificationsList_WorkListWnd", "UI.NotificationsList_ScrollBarWnd" }
}

-- --------------------------
-- const
-- --------------------------

nl.layers =
{
	MAIN_EFFECT = 0,
}

nl.effectInfo =
{
	main =
	{
		scrollBarLocator 	= "scroll_max",
	},

	workList =
	{
		firstSlotLocator	= "slot_1",
		secondSlotLocator	= "slot_2",
	}
}

-- --------------------------
-- vars
-- --------------------------

nl.records		= {}
nl.firstId		= -1
nl.lastId		= -1
nl.slotWnds		= {}
nl.scrollBar	= nil
nl.slotsRect	= Quat( 0, 0, 0, 0 )
nl.space_slots	= 0
nl.workListWnd	= nil

-- --------------------------
-- work functions
-- --------------------------

--
function UI.NotificationsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.workListWnd = UI.NotificationsList_WorkListWnd

	self:MakeConstParams()
	self:InitScrollBar()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_ADD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_CLEAR )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_ALLOWED_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.NotificationsListWnd:MakeConstParams()

	local slotSize		= UI:ZeroVec2()
	local firstSlotPos	= UI:ZeroVec2()
	local secondSlotPos	= UI:ZeroVec2()

	local tempSlotEffect = _G.UI_SpawnEffect( "notifications_slot", self:GetUiHandle() )
	if tempSlotEffect then
		slotSize = tempSlotEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( tempSlotEffect )
	end

	local workListRect = self.workListWnd:GetRect()

	local workListEffect = UI:GetEffectFromLayer( self.workListWnd, self.workListWnd.layers.MAIN_EFFECT )
	if workListEffect then

		firstSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.firstSlotLocator )
		firstSlotPos.x = firstSlotPos.x + workListRect.x
		firstSlotPos.y = firstSlotPos.y + workListRect.y

		secondSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.secondSlotLocator )
		secondSlotPos.x = secondSlotPos.x + workListRect.x
		secondSlotPos.y = secondSlotPos.y + workListRect.y

	end

	local maskRect = self.workListWnd:GetLayerRect( self.workListWnd.layers.MASK )
	maskRect.x = maskRect.x + workListRect.x
	maskRect.y = maskRect.y + workListRect.y

	self.slotsRect.x = firstSlotPos.x
	self.slotsRect.y = firstSlotPos.y
	self.slotsRect.z = slotSize.x
	self.slotsRect.w = ( maskRect.y + maskRect.w ) - ( firstSlotPos.y - maskRect.y ) - firstSlotPos.y

	self.space_slots = secondSlotPos.y - firstSlotPos.y - slotSize.y

end


--
function UI.NotificationsListWnd:Reset()

	self:ResetRecords()

	self.scrollBar:SetRange( -1, -1 )
	self:SetScrollBarVisible( false )

end


--
function UI.NotificationsListWnd:ResetRecords()

	for id, record in pairs( self.records ) do
		self:RemoveRecord( id )
	end

	self.records	= {}
	self.firstId	= -1
	self.lastId		= -1	

end


--
function UI.NotificationsListWnd:RemoveRecord( id )

	local record = self.records[ id ]
	if not record then
		return
	end

	record.slotWnd:Reset()
	record.slotWnd:UnlinkFromParent()

	self.records[ id ] = nil	

end


--
function UI.NotificationsListWnd:AddRecord( id )

	if self.records[ id ] then
		sys.log( "UI.NotificationsListWnd:AddRecord()[ERROR]: already exists" )
		return self.records[ id ]
	end

	local record = {}

	record.id = id
	record.slotWnd = self:ObtainFreeSlotWnd()

	record.slotWnd:SetLeft( self.slotsRect.x - self.workListWnd:GetLeft() )	
	record.slotWnd:Setup( id, UI.NotificationsSlotWnd.modes.LIST )

	self.records[ id ] = record

	return record

end


--
function UI.NotificationsListWnd:ObtainFreeSlotWnd()

	for idx, slotWnd in pairs( self.slotWnds ) do
		if slotWnd:GetNotificationId() == -1 then
			return slotWnd
		end
	end

	local slotWnd = UI:CreateChildWnd( self.workListWnd, UI.NotificationsSlotWnd, tostring( #self.slotWnds + 1 ) )
	table.insert( self.slotWnds, slotWnd )

	return slotWnd

end


--
function UI.NotificationsListWnd:InitScrollBar()

	self.scrollBar = UI.NotificationsList_ScrollBarWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ).y
	local baseSize = scrollEffect:GetObjSize( "self" ).y

	scrollEffect:SetScale( UI:Vec2( 1, needSize / baseSize ) )
	self.scrollBar:SetHeight( needSize )

end


--
function UI.NotificationsListWnd:SetScrollBarVisible( bVisible )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if bVisible then

		if not self.scrollBar:IsChildOf( self ) then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )		
		end

	else

		if self.scrollBar:IsChildOf( self ) then

    		self.scrollBar:UnlinkFromParent()

    		if mainEffect then
    			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
    		end

		end

	end

end


--
function UI.NotificationsListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.NotificationsListWnd:FullUpdate()

	self:Reset()

	if UI.Notifications:GetNumNotifications() == 0 then
		return
	end

	self:UpdateScrollRange()
	self:SetScrollPos( self:GetMaxScrollPos(), true )

end


--
function UI.NotificationsListWnd:UpdateScrollRange()

	local min = -1
	local max = -1

	if UI.Notifications:GetNumNotifications() > 0 then
		min = UI.Notifications:GetFirstNotificationId()
		max = self:MakeTail()
	end

	self.scrollBar:SetRange( min, max )

	self:UpdateScrollBarVisibility()

end


--
function UI.NotificationsListWnd:UpdateScrollBarVisibility()

	local needScrollBar = math.abs( self:GetMinScrollPos() - self:GetMaxScrollPos() ) > 1e-3
	self:SetScrollBarVisible( needScrollBar )	

end


--
function UI.NotificationsListWnd:GetScrollPos()

	return self.scrollBar:GetPos()

end


--
function UI.NotificationsListWnd:GetMaxScrollPos()

	return self.scrollBar:GetMax()

end


--
function UI.NotificationsListWnd:GetMinScrollPos()

	return self.scrollBar:GetMin()

end


--
function UI.NotificationsListWnd:MakeTail()

	for id, record in pairs( self.records ) do
		record.bTail = false
	end
	
	if UI.Notifications:GetNumNotifications() == 0 then
		return -1
	end

	local firstId = UI.Notifications:GetFirstNotificationId()
	local lastId = UI.Notifications:GetLastNotificationId()

	local maxScrollPos = firstId
	local y = self.slotsRect.y + self.slotsRect.w
	
	for id = lastId, firstId, -1 do

		local record = self.records[ id ]

		if not record then
			record = self:AddRecord( id )			
		end		

		record.bTail = true

		local slotHeight = record.slotWnd:GetHeight()
		if id ~= lastId then
			slotHeight = slotHeight + self.space_slots
		end
		
		y = y - slotHeight

		if y <= self.slotsRect.y then
			maxScrollPos = id + ( self.slotsRect.y - y ) / slotHeight
			break			
		end

	end

	return maxScrollPos

end


--
function UI.NotificationsListWnd:SetScrollPos( scrollPos, bUpdateScrollBar )

	if UI.Notifications:GetNumNotifications() == 0 then
		return
	end

	local ntfLastId = UI.Notifications:GetLastNotificationId()

	self.firstId	= math.floor( scrollPos )
	self.lastId		= self.firstId

	local deltaCf	= scrollPos - self.firstId
	local y			= self.slotsRect.y

	for id = self.firstId, ntfLastId do

		local record = self.records[ id ]

		if not record then
			record = self:AddRecord( id )
		end

		if not record.slotWnd:IsChildOf( self ) then
			self.workListWnd:AddChild( record.slotWnd )
		end

		self.lastId = id

		local slotHeight = record.slotWnd:GetHeight()

		if id ~= ntfLastId then
			slotHeight = slotHeight + self.space_slots
		end

		if id == self.firstId then
			y = y - slotHeight * deltaCf
		end

		record.slotWnd:SetTop( y - self.workListWnd:GetTop() )

		y = y + slotHeight		

		if y >= self.slotsRect.y + self.slotsRect.w then
			break
		end

	end

	for id, record in pairs( self.records ) do
		if ( id < self.firstId or id > self.lastId ) then
			if record.bTail then
				record.slotWnd:UnlinkFromParent()
			else
				self:RemoveRecord( id )
			end
		end
	end

	if bUpdateScrollBar then
		self.scrollBar:SetPos( scrollPos )
	end

end


--
function UI.NotificationsListWnd:F_OnEventNotificationsAdd( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	local oldScrollPos		= self:GetScrollPos()
	local oldMaxScrollPos	= self:GetMaxScrollPos()

	self:UpdateScrollRange()

	if math.abs( oldScrollPos - oldMaxScrollPos ) <= 1e-3 then
		self:SetScrollPos( self:GetMaxScrollPos(), true )

	elseif oldScrollPos < self:GetMinScrollPos() then
		self:SetScrollPos( self:GetMinScrollPos(), true )
	end	

end


--
function UI.NotificationsListWnd:F_OnEventNotificationsClear( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:Reset()

end


--
function UI.NotificationsListWnd:F_OnEventNotificationsAllowedChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.NotificationsListWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:SetScrollPos( self.scrollBar:GetPos(), false )

end


--
function UI.NotificationsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( -ticks, UI.SCROLL_SRC_WHEEL ) 
	end

	return true

end


--
function UI.NotificationsListWnd:Scroll( delta, eventSrc )

	local curPos = self.scrollBar:GetPos()
	local nextPos = curPos

	if delta > 0 then
		nextPos = math.floor( curPos + math.abs( delta ) )	

	elseif delta < 0 then
		nextPos = math.ceil( curPos - math.abs( delta ) )
	end

	self.scrollBar:SetPos( nextPos, eventSrc )

end


-- -------------------------------------------------------------------------------
-- UI.NotificationsList_WorkListWnd
-- -------------------------------------------------------------------------------

UI.NotificationsList_WorkListWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.NotificationsList_WorkListWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "NotificationsList_WorkListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "notificationsList_workList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "area",	
						layer		= "UI.NotificationsList_WorkListWnd.layers.MASK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "notificationsMask",
			visible		= false,
		}
	},
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.NotificationsList_WorkListWnd.layers =
{
	MAIN_EFFECT	= 0,
	MASK		= 1,
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.NotificationsList_WorkListWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self:ToScreen( self:GetLayerRect( self.layers.MASK ) )
	local hTexMask = self:GetTexture( self.layers.MASK )

	UI.drawer:BeginMask( hTexMask, maskRect )
	_G.Font_BeginMask( hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.Font_EndMask()
	UI.drawer:EndMask()

end


-- -------------------------------------------------------------------------------
-- UI.NotificationsList_ScrollBarWnd
-- -------------------------------------------------------------------------------

UI.NotificationsList_ScrollBarWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.NotificationsList_ScrollBarWnd.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt",

	props =
	{
		name		= "NotificationsList_ScrollBarWnd",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.NotificationsList_ScrollBarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		UI.NotificationsListWnd:Scroll( -1, UI.SCROLL_SRC_UP_BTN )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		UI.NotificationsListWnd:Scroll( 1, UI.SCROLL_SRC_DOWN_BTN )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		UI.NotificationsListWnd:Scroll( -1, UI.SCROLL_SRC_UP_PAGE )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		UI.NotificationsListWnd:Scroll( 1, UI.SCROLL_SRC_DOWN_PAGE )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end