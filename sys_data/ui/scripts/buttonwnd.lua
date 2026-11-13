-- ----------------------------------------------------------------------------
--
-- Workfile: ButtonWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.ButtonWnd = {}
   	
function UI.ButtonWnd:GetMouseState()			return self.w:GetMouseState() end
function UI.ButtonWnd:SetBtnStyle( style )		self.w:SetBtnStyle( style ) end
function UI.ButtonWnd:GetBtnStyle()				return self.w:GetBtnStyle() end
function UI.ButtonWnd:AddBtnStyle( style )		self.w:AddBtnStyle( style ) end
function UI.ButtonWnd:RemoveBtnStyle( style )	self.w:RemoveBtnStyle( style ) end
function UI.ButtonWnd:HasBtnStyle( style )		return self.w:HasBtnStyle( style ) end

UI:InheritWnd( UI.ButtonWnd, UI.Wnd )


