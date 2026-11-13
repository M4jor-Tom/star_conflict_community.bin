-- -----------------------------------------------------------------------------------------
-- UI.ButtonsList3Wnd_HrzScroll - список с плавным скроллированием по горизонтали
-- -----------------------------------------------------------------------------------------

UI.ButtonsList3Wnd_HrzScroll = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.ButtonsList3Wnd_HrzScroll.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",
	
	props =
	{
		name		= "ButtonsList3Wnd_HrzScroll",
		isPrototype	= true,
	},	
}


-- --------------------------------------
-- const
-- --------------------------------------

UI.ButtonsList3Wnd_HrzScroll.scrollBarPrototypeName	= "EffectScrollWnd_Hrz_2"

-- --------------------------------------
-- vars
-- --------------------------------------

UI.ButtonsList3Wnd_HrzScroll.slotWidth	= 0

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.ButtonsList3Wnd_HrzScroll:F_PostLoad()

	UI.ButtonsList3Wnd.F_PostLoad( self )

	local uiHandle = self:GetUiHandle()

	UI:UnsubscribeUiObjFromEvent( uiHandle, UI.EV_VSCROLL_CHANGE )
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_HSCROLL_CHANGE )

end


--
function UI.ButtonsList3Wnd_HrzScroll:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstSlotWnd = self.allSlots[ 1 ] and self.allSlots[ 1 ].btn
	self.slotWidth = firstSlotWnd and firstSlotWnd:GetWidth() or 0

	local firstSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )

	self.slotsSpace = secondSlotPos.x - firstSlotPos.x - self.slotWidth

	local selfRect = self:GetRect()

	self.slotsRect.x = firstSlotPos.x
	self.slotsRect.y = 0
	self.slotsRect.z = self.slotWidth * self.MAX_SLOTS + self.slotsSpace * ( self.MAX_SLOTS - 1 )
	self.slotsRect.w = selfRect.w

	self.slotsWnd:SetRect( self.slotsRect )

	local slotY = firstSlotPos.y - self.slotsWnd:GetTop()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			slot.btn:SetTop( slotY )
		end
	end

end


--
function UI.ButtonsList3Wnd_HrzScroll:UpdateSlotPos( slot )
--[[
	local x = 0

	if self.numRecords >= self.MAX_SLOTS then
		x = self.slotsRect.x + ( slot.recordIdx - self.scrollPos ) * ( self.slotWidth + self.slotsSpace ) - self.slotsWnd:GetLeft()
	else
		local slotsWidth = self.numRecords * self.slotWidth + ( self.numRecords - 1 ) * self.slotsSpace
		local slotsX = ( self.slotsWnd:GetWidth() - slotsWidth ) * 0.5
		x = slotsX + ( slot.idx - 1 ) * ( self.slotWidth + self.slotsSpace )
	end
	
	slot.btn:SetLeft( x )
	]]
--[[	
	local y = self.slotsRect.y + ( slot.recordIdx - self.scrollPos ) * ( self.slotHeight + self.slotsSpace ) - self.slotsWnd:GetTop()
	slot.btn:SetTop( y )
]]

	local x = self.slotsRect.x + ( slot.recordIdx - self.scrollPos ) * ( self.slotWidth + self.slotsSpace ) - self.slotsWnd:GetLeft()
	slot.btn:SetLeft( x )

	

end


--
function UI.ButtonsList3Wnd_HrzScroll:InitScrollBar()

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

	local scale_x = needSize.x / baseSize.x
	scrollEffect:SetScale( UI:Vec2( scale_x, 1 ) )

	self.scrollBar:SetWidth( needSize.x )
	self.scrollBar:SetHeight( baseSize.y )

	self:UpdateScrollBarVisibility()

end


--
function UI.ButtonsList3Wnd_HrzScroll:F_OnEventHScrollChange( hSender, eventSrc, newPos, oldPos )

	self:F_OnEventVScrollChange( self, hSender, eventSrc, newPos, oldPos )

end