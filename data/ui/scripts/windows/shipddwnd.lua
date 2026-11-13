-- ----------------------------------------------------------------------------
--
-- Workfile: shipddwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ShipDDWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.ShipDDWnd.def =
{
	className 	= "Wnd",
	prototype	= "ShipIcoWnd",

	props =
	{
		name		= "ShipDDWnd",
		style		= UI.WS_NOT_KB_REACT,	
	},
}

-- ----------------------------
-- const
-- ----------------------------

UI.ShipDDWnd.srcTypes =
{
	TREE_SLOT	= 1,
	BATTLE_SLOT	= 2,
	QUEST_SHIP	= 3,
}

UI.ShipDDWnd.states =
{
	INACTIVE			= 0,
	WAIT_MOUSE_CLICK	= 1,
	WAIT_MOUSE_MOVE		= 2,
	DRAG				= 3,
}

UI.ShipDDWnd.MOUSE_MOVE_THRESHOLD	= 5	-- перетаскивание начинается только если смещение мыши после клика больше этого значения

-- ----------------------------
-- vars
-- ----------------------------

UI.ShipDDWnd.state					= UI.ShipDDWnd.states.INACTIVE
UI.ShipDDWnd.ddData					= nil
UI.ShipDDWnd.startMouseX_abs		= 0
UI.ShipDDWnd.startMouseY_abs		= 0
UI.ShipDDWnd.hDstWnd				= UI.INVALID_UI_HANDLE

UI.ShipDDWnd.mouseMoveThreshold_abs	= 0

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.ShipDDWnd:F_PostLoad()

	UI.ShipIcoWnd.F_PostLoad( self )

	self:RecalcAbsVals()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )

end


--
function UI.ShipDDWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:RecalcAbsVals()

end


--
function UI.ShipDDWnd:RecalcAbsVals()

	self.mouseMoveThreshold_abs = UI:XToAbs( UI:XTo1024x768( self.MOUSE_MOVE_THRESHOLD, { x = 1280, y = 720 } ) )

end


--
function UI.ShipDDWnd:ResetAll()	-- WARNING! не переименовывать в Reset(), т.к. эта функция есть в "родительском" классе и может вызываться не там, где надо

	if UI:IsInRemovingAllWindows() then
		return
	end

	UI.ShipIcoWnd.Reset( self )

	self:SetStateInternal( self.states.INACTIVE )

    self.ddData				= nil
	self.startMouseX_abs	= 0
	self.startMouseY_abs	= 0
	self.hDstWnd			= UI.INVALID_UI_HANDLE

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

	self:Hide()

end


--
function UI.ShipDDWnd:ResetDrag()

	self:ResetAll()
	self:SetStateInternal( self.states.WAIT_MOUSE_CLICK )

end


--
function UI.ShipDDWnd:SetStateInternal( state )

	self.state = state

	self:UpdateNewFrameSubscribtion()
	self:UpdateMouseButtonDownSubscribtion()
	self:UpdateMouseButtonUpSubscribtion()

end


--
function UI.ShipDDWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.ShipDDWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.ShipDDWnd:F_OnEventWndShown( hSender, hWnd )

	if UI.HangarWnd and hWnd == UI.HangarWnd:GetUiHandle() then
		self:SetStateInternal( self.states.WAIT_MOUSE_CLICK )
	end

end


--
function UI.ShipDDWnd:F_OnEventWndHided( hSender, hWnd )

	if UI.HangarWnd and hWnd == UI.HangarWnd:GetUiHandle() then
		self:ResetAll()
	end

end


--
function UI.ShipDDWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

    if self.state == self.states.WAIT_MOUSE_MOVE then

		local mouseX = UI:GetMouseX()
		local mouseY = UI:GetMouseY()

		local mouseX_abs = UI:XToAbs( mouseX )
		local mouseY_abs = UI:YToAbs( mouseY )

    	local dir = UI:Vec2( mouseX_abs - self.startMouseX_abs, mouseY_abs - self.startMouseY_abs )
    	local distSq_abs = UI:V2LengthSq( dir )

    	if distSq_abs > self.mouseMoveThreshold_abs * self.mouseMoveThreshold_abs then

			self:SetStateInternal( self.states.DRAG )

			self:Show()

        	self:UpdatePos( mouseX, mouseY )
			self:TryNotifyDstOnDragOver( mouseX, mouseY )

			UI:CaptureMouse( self:GetUiHandle() )

			-- TODO: звук

    	end			

	end

end


--
function UI.ShipDDWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if self.state ~= self.states.WAIT_MOUSE_CLICK then
		return
	end

	if btnIdx ~= 0 then
		return
	end

	local mouseX = UI:GetMouseX()
	local mouseY = UI:GetMouseY()

	local ddData = self:FindSrcUnderMouse( mouseX, mouseY )
	if not ddData then
		return
	end

	self:SetStateInternal( self.states.WAIT_MOUSE_MOVE )

	self.ddData				= ddData
	self.startMouseX_abs	= UI:XToAbs( mouseX )
	self.startMouseY_abs	= UI:YToAbs( mouseY )

	local shipItem = UI:GetShipItem( self.ddData.vid, true )
	self:Setup( shipItem.defName, { vid = self.ddData.vid } )	-- унаследованная функция

end


--
function UI.ShipDDWnd:F_OnEventMouseButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self.state == self.states.WAIT_MOUSE_MOVE then
		self:ResetDrag()

	else
		sys.log( "UI.ShipDDWnd:F_OnEventMouseButtonUp()[ERROR]: unhandled state: %s", tostring( self.state ) )
	end

end    


--
function UI.ShipDDWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.state == self.states.DRAG then

		local mouseX_screen = self:XToScreen( mouseX )
		local mouseY_screen = self:YToScreen( mouseY )

		self:Drop( mouseX_screen, mouseY_screen )
		self:ResetDrag()		

	else
		sys.log( "UI.ShipDDWnd:F_OnMouseLButtonUp()[ERROR]: unhandled state: %s", tostring( self.state ) )
	end

	return true

end


--
function UI.ShipDDWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if self.state == self.states.DRAG then

		local mouseX_screen = self:XToScreen( mouseX )
		local mouseY_screen = self:YToScreen( mouseY )

		self:UpdatePos( mouseX_screen, mouseY_screen )
		self:TryNotifyDstOnDragOver( mouseX_screen, mouseY_screen )

	else
		sys.log( "UI.ShipDDWnd:F_OnMouseMove()[ERROR]: unhandled state: %s", tostring( self.state ) )
	end

	return true

end


--
function UI.ShipDDWnd:UpdateTooltip()

	-- нет тултипа

end


--
function UI.ShipDDWnd:UpdatePos( mouseX, mouseY )

	self:SetPos( mouseX, mouseY )

end


--
function UI.ShipDDWnd:FindSrcUnderMouse( mouseX, mouseY )

	local wndUnderMouse = self:FindWindowUnderMouse( UI.Root, mouseX, mouseY )
	if not wndUnderMouse then
		return nil
	end

	local srcWnd = nil

	if wndUnderMouse.GetShipDDData then

		srcWnd = wndUnderMouse

	else

    	local parent = wndUnderMouse:GetParent()
    	while parent do

    		if parent.GetShipDDData then
    			srcWnd = parent
				break
    		end

    		parent = parent:GetParent()

    	end

	end

	if srcWnd then
		return srcWnd:GetShipDDData()
	else
		return nil
	end

end


--
function UI.ShipDDWnd:FindDstUnderMouse( mouseX, mouseY )

	local wndUnderMouse = self:FindWindowUnderMouse( UI.Root, mouseX, mouseY )
	if not wndUnderMouse then
		return nil
	end

	if wndUnderMouse.OnShipDDOver then
		return wndUnderMouse
	end

	local parent = wndUnderMouse:GetParent()
	while parent do

		if parent.OnShipDDOver then
			return parent
		end

		parent = parent:GetParent()

	end

	return nil

end


-- отличается  от стандартной UI:FindWindowUnderMouse() тем, что игнорирует само тащимое окно, как будто его стиль UI.WS_NOT_MOUSE_REACT
function UI.ShipDDWnd:FindWindowUnderMouse( curRoot, mouseX, mouseY )

	if not curRoot then
		return nil
	end	

    if not curRoot:IsPtInBounds( mouseX, mouseY ) then
		return nil
	end

	local w = curRoot:GetLastChild()
	while w do	

    	if w:IsPtInBounds( mouseX, mouseY ) then
		
        	local childWnd = self:FindWindowUnderMouse( w, mouseX, mouseY )

        	if childWnd then
        		return childWnd
        	end

		end

		w = w:GetPrevSibling()

	end

	if curRoot == self then
		return nil
	end

	if curRoot:HasStyle( UI.WS_NOT_MOUSE_REACT ) then
		return nil
	end
	
	return curRoot

end


--
function UI.ShipDDWnd:TryNotifyDstOnDragOver( mouseX, mouseY )

	local newDstWnd = self:FindDstUnderMouse( mouseX, mouseY )
	local hNewDstWnd = newDstWnd and newDstWnd:GetUiHandle() or UI.INVALID_UI_HANDLE

	if hNewDstWnd == self.hDstWnd then
		return
	end

	if self.hDstWnd ~= UI.INVALID_UI_HANDLE then

		local dstWnd = UI:GetUiObjByHandleT( self.hDstWnd )
		if dstWnd then
			dstWnd:OnShipDDOver( false )
		end

	end

	if newDstWnd then
		newDstWnd:OnShipDDOver( true, self.ddData )
	end

	self.hDstWnd = hNewDstWnd

end


--
function UI.ShipDDWnd:Drop( mouseX, mouseY )

	local dstWnd = self:FindDstUnderMouse( mouseX, mouseY )

	if dstWnd then
		dstWnd:OnShipDDOver( false )
	end

	UI.HangarWnd:OnShipDDDrop( self.ddData, dstWnd )
	
end


--
function UI.ShipDDWnd:F_OnAfterShowOnScreen()

	UI.ShipIcoWnd.F_OnAfterShowOnScreen( self )

	self:UpdateNewFrameSubscribtion()

end


--
function UI.ShipDDWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		self:ResetAll()
	end

end


--
function UI.ShipDDWnd:UpdateNewFrameSubscribtion()

	if self:IsOnScreen() or self.state == self.states.WAIT_MOUSE_MOVE then
		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
	else
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
	end

end


--
function UI.ShipDDWnd:UpdateMouseButtonDownSubscribtion()

	if self.state == self.states.WAIT_MOUSE_CLICK then
		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	else
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.ShipDDWnd:UpdateMouseButtonUpSubscribtion()

	if self.state == self.states.WAIT_MOUSE_MOVE then
		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_UP )
	else
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_UP )
	end

end


--
function UI.ShipDDWnd:F_OnEventSaveUiState()

	self:Hide()

end