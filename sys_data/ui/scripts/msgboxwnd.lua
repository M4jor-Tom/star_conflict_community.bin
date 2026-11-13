-- ----------------------------------------------------------------------------
--
-- Workfile: MsgBoxWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.MsgBoxWnd= {}
   	
function UI.MsgBoxWnd:Setup( caption, msg, mbStyle )		self.w:Setup( caption, msg, mbStyle ) end
function UI.MsgBoxWnd:RecalcLayot()							self.w:RecalcLayot() end
function UI.MsgBoxWnd:SetCaption( caption )					self.w:SetCaption( caption ) end
function UI.MsgBoxWnd:GetCaption()							return self.w:GetCaption() end
function UI.MsgBoxWnd:SetMsg( msg )							self.w:SetMsg( msg ) end
function UI.MsgBoxWnd:GetMsg()								return self.w:GetMsg() end
function UI.MsgBoxWnd:SetMsgBoxStyle( mbStyle )				self.w:SetMsgBoxStyle( mbStyle ) end
function UI.MsgBoxWnd:GetMsgBoxStyle()						return self.w:GetMsgBoxStyle() end
function UI.MsgBoxWnd:HasMsgBoxStyle( mbStyle )				return self.w:HasMsgBoxStyle( mbStyle ) end

UI:InheritWnd( UI.MsgBoxWnd, UI.Wnd )


