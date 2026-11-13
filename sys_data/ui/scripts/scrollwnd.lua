-- ----------------------------------------------------------------------------
--
-- Workfile: ScrollWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.ScrollWnd = {}
   	

function UI.ScrollWnd:SetRange( min, max )					self.w:SetRange( min, max ) end
function UI.ScrollWnd:GetMin()								return self.w:GetMin() end
function UI.ScrollWnd:GetMax()								return self.w:GetMax() end
function UI.ScrollWnd:SetPos( pos, scrollEventSrc )			return self.w:SetPos( pos, scrollEventSrc or UI.SCROLL_SRC_UNKNOWN ) end
function UI.ScrollWnd:GetPos()								return self.w:GetPos() end
function UI.ScrollWnd:SetPageSize( page )					self.w:SetPageSize( page ) end
function UI.ScrollWnd:GetPageSize()							return self.w:GetPageSize() end
function UI.ScrollWnd:SetStepSize( step )					self.w:SetStepSize( step ) end
function UI.ScrollWnd:GetStepSize()							return self.w:GetStepSize() end
function UI.ScrollWnd:GetStepSize()							return self.w:GetStepSize() end
function UI.ScrollWnd:SetScrollWndStyle( styles )			return self.w:SetScrollWndStyle( styles ) end
function UI.ScrollWnd:GetScrollWndStyle()					return self.w:GetScrollWndStyle() end
function UI.ScrollWnd:GetScrollWndStyle()					return self.w:GetScrollWndStyle() end
function UI.ScrollWnd:AddScrollWndStyle( style )			self.w:AddScrollWndStyle( style ) end
function UI.ScrollWnd:RemoveScrollWndStyle( style )			self.w:RemoveScrollWndStyle( style ) end
function UI.ScrollWnd:HasScrollWndStyle( style )			return self.w:HasScrollWndStyle( style ) end
function UI.ScrollWnd:GetPrevBtnHandle()					return self.w:GetPrevBtnHandle() end
function UI.ScrollWnd:GetNextBtnHandle()					return self.w:GetNextBtnHandle() end
function UI.ScrollWnd:GetPrevPageHandle()					return self.w:GetPrevPageHandle() end
function UI.ScrollWnd:GetNextPageHandle()					return self.w:GetNextPageHandle() end
function UI.ScrollWnd:GetThumbHandle()						return self.w:GetThumbHandle() end
function UI.ScrollWnd:SetPrevBtnHandle( hWnd )				self.w:SetPrevBtnHandle( hWnd ) end
function UI.ScrollWnd:SetNextBtnHandle( hWnd )				self.w:SetNextBtnHandle( hWnd ) end
function UI.ScrollWnd:SetPrevPageHandle( hWnd )				self.w:SetPrevPageHandle( hWnd ) end
function UI.ScrollWnd:SetNextPageHandle( hWnd )				self.w:SetNextPageHandle( hWnd ) end
function UI.ScrollWnd:SetThumbHandle( hWnd )				self.w:SetThumbHandle( hWnd ) end
function UI.ScrollWnd:SetFixedThumbSize( size )				self.w:SetFixedThumbSize( size ) end
function UI.ScrollWnd:SetMinThumbSize( size )				self.w:SetMinThumbSize( size ) end
function UI.ScrollWnd:SetBarOrigin( org )					self.w:SetBarOrigin( org ) end
function UI.ScrollWnd:SetSpaceBtnBar( space )				self.w:SetSpaceBtnBar( space ) end
function UI.ScrollWnd:SetSpaceEdgeBtn( space )				self.w:SetSpaceEdgeBtn( space ) end
function UI.ScrollWnd:RecalcLayout()						self.w:RecalcLayout() end
function UI.ScrollWnd:IsVertical()							return self.w:IsVertical() end

UI:InheritWnd( UI.ScrollWnd, UI.Wnd )
