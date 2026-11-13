-- ----------------------------------------------------------------------------
--
-- Workfile: CheckButtonWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.CheckButtonWnd= {}
   	

function UI.CheckButtonWnd:IsChecked()					return self.w:IsChecked() end
function UI.CheckButtonWnd:Check( bCheck, eventSrc )    self.w:Check( bCheck, eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.CheckButtonWnd:OnCheckStateChanged( eventSrc ) self.w:OnCheckStateChanged( eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.CheckButtonWnd:SetCheckStyle( style )		self.w:SetCheckStyle( style ) end
function UI.CheckButtonWnd:GetCheckStyle()				return self.w:GetCheckStyle() end
function UI.CheckButtonWnd:AddCheckStyle( style )		self.w:AddCheckStyle( style ) end
function UI.CheckButtonWnd:RemoveCheckStyle( style ) 	self.w:RemoveCheckStyle( style ) end
function UI.CheckButtonWnd:HasCheckStyle( style )		return self.w:HasCheckStyle( style ) end


UI:InheritWnd( UI.CheckButtonWnd, UI.ButtonWnd )


