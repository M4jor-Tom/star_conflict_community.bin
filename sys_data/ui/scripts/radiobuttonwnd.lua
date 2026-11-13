-- ----------------------------------------------------------------------------
--
-- Workfile: RadioButtonWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.RadioButtonWnd = {}
   	
function UI.RadioButtonWnd:GetGroupId()				return self.w:GetGroupId() end
function UI.RadioButtonWnd:SetGroupId( groupId )	self.w:SetGroupId( groupId ) end


UI:InheritWnd( UI.RadioButtonWnd, UI.CheckButtonWnd )


