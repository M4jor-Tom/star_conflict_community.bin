-- ----------------------------------------------------------------------------
--
-- Workfile: ScrollWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.StringList = {}

function UI.StringList:AddItem( str )							return self.w:AddItem( str ) end
function UI.StringList:SetItemsTextColor( color, itemState )	self.w:SetItemsTextColor( color, itemState == nil and UI.ITEM_STATE_ALL or itemState ) end
function UI.StringList:GetClientRect()							return UI:Quat( UI_StringList_GetClientRect( self.w ) ) end
function UI.StringList:GetClientHeight()						return self.w:GetClientHeight() end
function UI.StringList:RemoveAllItems()							self.w:RemoveAllItems() end
function UI.StringList:SetItemData( itemIdx, data )				self.w:SetItemData( itemIdx, data ) end
function UI.StringList:GetItemData( itemIdx )					return self.w:GetItemData( itemIdx ) end
function UI.StringList:SelectItem( itemIdx, eventSrc )			if eventSrc == nil then eventSrc = UI.EVENT_SRC_UNKNOWN end; self.w:SelectItem( itemIdx, eventSrc ) end
function UI.StringList:GetNumItems()							return self.w:GetNumItems() end
function UI.StringList:FindItemId( str )						return self.w:FindItemId( str ) end
function UI.StringList:SetTopItem( itemIdx )					self.w:SetTopItem( itemIdx ) end
function UI.StringList:GetSelectedItem()						return self.w:GetSelectedItem() end
function UI.StringList:DrawItem( itemIdx, x0, y0, w, h, clippedX0, clippedY0, clippedW, clippedH )	self.w:DrawItem( itemIdx, x0, y0, w, h, clippedX0, clippedY0, clippedW, clippedH ) end
function UI.StringList:GetItemString( itemIdx )					return self.w:GetItemString( itemIdx ) end
function UI.StringList:GetItemString( itemIdx )					return self.w:GetItemString( itemIdx ) end
function UI.StringList:SetScrollWheelStep( step )				self.w:SetScrollWheelStep( step ) end
function UI.StringList:SetScrollStep( step )					self.w:SetScrollStep( step ) end
function UI.StringList:RecalcLayout()							self.w:RecalcLayot() end
function UI.StringList:SetSpacing( client_x0, client_y0, client_w, client_h, bar_x0, bar_y0, bar_w, bar_h, space_client_bar )	self.w:SetSpacing( client_x0, client_y0, client_w, client_h, bar_x0, bar_y0, bar_w, bar_h, space_client_bar ) end
function UI.StringList:GetScrollHandle()						return self.w:GetScrollHandle() end

UI:InheritWnd( UI.StringList, UI.Wnd )
