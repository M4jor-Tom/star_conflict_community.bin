-- ----------------------------------------------------------------------------
--
-- Workfile: ScrollWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.TextBoxWnd = {}

function UI.TextBoxWnd:GetScrollText()						return self.w:GetScrollText() end
function UI.TextBoxWnd:SetScrollText( text )				self.w:SetScrollText( text ) end
function UI.TextBoxWnd:GetScrollTextLayerIdx()				return self.w:GetScrollTextLayerIdx() end
function UI.TextBoxWnd:GetTextBoxStyle()					return self.w:GetTextBoxStyle() end
function UI.TextBoxWnd:SetTextBoxStyle( style )				self.w:SetTextBoxStyle( style ) end
function UI.TextBoxWnd:AddTextBoxStyle( style )				self.w:AddTextBoxStyle( style ) end
function UI.TextBoxWnd:RemoveTextBoxStyle( style )			self.w:RemoveTextBoxStyle( style ) end
function UI.TextBoxWnd:HasTextBoxStyle( style )				return self.w:HasTextBoxStyle( style ) end
function UI.TextBoxWnd:GetScrollHandle()					return self.w:GetScrollHandle() end
function UI.TextBoxWnd:GetClientRect()						return UI:Quat( UI_TextBoxWnd_GetClientRect( self.w ) ) end
function UI.TextBoxWnd:GetClientLeft()						return self.w:GetClientLeft() end
function UI.TextBoxWnd:GetClientTop()						return self.w:GetClientTop() end
function UI.TextBoxWnd:GetClientWidth()						return self.w:GetClientWidth() end
function UI.TextBoxWnd:GetClientHeight()					return self.w:GetClientHeight() end
function UI.TextBoxWnd:RecalcLayot()						self.w:RecalcLayot() end
function UI.TextBoxWnd:GetScrollPos()						return self.w:GetScrollPos() end
function UI.TextBoxWnd:GetScrollStep()						return self.w:GetScrollStep() end
function UI.TextBoxWnd:SetScrollStep( step )				self.w:SetScrollStep( step ) end
function UI.TextBoxWnd:GetScrollWheelStep()					return self.w:GetScrollWheelStep() end
function UI.TextBoxWnd:SetScrollWheelStep( step )			self.w:SetScrollWheelStep( step ) end

UI:InheritWnd( UI.TextBoxWnd, UI.Wnd )
