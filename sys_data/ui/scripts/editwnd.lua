-- ----------------------------------------------------------------------------
--
-- Workfile: EditWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
-- Table for base EditWnd class
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.EditWnd = {}

function UI.EditWnd:GetEditText()							return self.w:GetEditText() end
function UI.EditWnd:SetEditText( text, eventSrc )			self.w:SetEditText( text, eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.EditWnd:GetSelStart()							return self.w:GetSelStart() end
function UI.EditWnd:GetSelEnd()								return self.w:GetSelEnd() end
function UI.EditWnd:SetSel( selStart, selEnd )				self.w:SetSel( selStart, selEnd ) end
function UI.EditWnd:ReplaceSel( txt, eventSrc )				return self.w:ReplaceSel( txt, eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.EditWnd:GetSymbolsLimit()						return self.w:GetSymbolsLimit() end
function UI.EditWnd:SetSymbolsLimit( limit )				self.w:SetSymbolsLimit( limit ) end
function UI.EditWnd:GetBytesLimit()							return self.w:GetBytesLimit() end
function UI.EditWnd:SetBytesLimit( limit )					self.w:SetBytesLimit( limit ) end
function UI.EditWnd:GetStringsLimit()						return self.w:GetStringsLimit() end
function UI.EditWnd:SetStringsLimit( limit )				self.w:SetStringsLimit( limit ) end
function UI.EditWnd:Clear( eventSrc )						self.w:Clear( eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.EditWnd:Copy()									self.w:Copy() end
function UI.EditWnd:Cut( eventSrc )							self.w:Cut( eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.EditWnd:Paste( eventSrc )						return self.w:Paste( eventSrc or UI.EVENT_SRC_UNKNOWN ) end
function UI.EditWnd:GetEditStyle()							return self.w:GetEditStyle() end
function UI.EditWnd:SetEditStyle( style )					self.w:SetEditStyle( style ) end
function UI.EditWnd:AddEditStyle( style )					self.w:AddEditStyle( style ) end
function UI.EditWnd:RemoveEditStyle( style )				self.w:RemoveEditStyle( style ) end
function UI.EditWnd:HasEditStyle( style )					return self.w:HasEditStyle( style ) end
function UI.EditWnd:GetForbiddenChars()						return self.w:GetForbiddenChars() end
function UI.EditWnd:SetForbiddenChars( chars )				self.w:SetForbiddenChars( chars ) end
function UI.EditWnd:RecalcLayot()							self.w:RecalcLayot() end
function UI.EditWnd:GetEditTextLayerIdx()					self.w:GetEditTextLayerIdx() end
function UI.EditWnd:SetTextLayerEdges( edges )				self.w:SetTextLayerEdges( edges ) end
function UI.EditWnd:GetDrawText()							return self.w:GetDrawText() end
function UI.EditWnd:GetSubstituteSymbol()					return self.w:GetSubstituteSymbol() end
function UI.EditWnd:SetSubstituteSymbol( ch )				self.w:SetSubstituteSymbol( ch ) end
function UI.EditWnd:SetCursorPos( pos )						self.w:SetCursorPos( pos ) end
function UI.EditWnd:GetCursorPos()							return self.w:GetCursorPos() end
function UI.EditWnd:GetMaxCursorPos()						return self.w:GetMaxCursorPos() end
function UI.EditWnd:GetTextClipRect()						return self.w:GetTextClipRect() end
function UI.EditWnd:CharFromPoint( pt, text, bClampToString )	return self.w:CharFromPoint( pt, text or self.w:GetDrawText(), bClampToString or false ) end
function UI.EditWnd:MoveCursor( newPos, bDragSel )			return self.w:MoveCursor( newPos, bDragSel ) end
function UI.EditWnd:IsDrag()								return self.w:IsDrag() end
function UI.EditWnd:StartDrag()								return self.w:StartDrag() end
function UI.EditWnd:StopDrag()								return self.w:StopDrag() end
function UI.EditWnd:GetWordStart( curPos )					return self.w:GetWordStart( curPos ) end
function UI.EditWnd:GetNextWordStart( curPos )				return self.w:GetNextWordStart( curPos ) end
function UI.EditWnd:DeleteSubstr( pos, count, eventSrc )	return self.w:DeleteSubstr( pos, count, eventSrc ) end
                                                                                      
UI:InheritWnd( UI.EditWnd, UI.Wnd )


