-- ----------------------------------------------------------------------------
--
-- Workfile: effecteditmultilinewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.EffectEditMultilineWnd = {}

-- --------------------------------------
-- window definiiton
-- --------------------------------------

UI.EffectEditMultilineWnd.def =
{   	
 	className	= "EditWnd",
	prototype	= "EffectEditWnd",

 	props =
 	{
 		name					= "EffectEditMultilineWnd",
		isPrototype				= true,
        editStyle				= UI.ES_MULTILINED,
 	},
}

-- --------------------------------------
-- const
-- --------------------------------------

UI.EffectEditMultilineWnd.effectInfo =
{
	main =
	{
		textObjName				= "input_line_text",
		selectionColorObjName	= "selection_color",
		cursorColorObjName		= "cursor_color",
		animActive				= "select",
		animInactive			= "deselect",
		scrollBarLocator		= "scroll_max",
	}
}

UI.EffectEditMultilineWnd.scrollBarPrototypeName = "EffectScrollWnd_Vrt"

-- --------------------------------------
-- vars
-- --------------------------------------

UI.EffectEditMultilineWnd.scrollBar = nil

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.EffectEditMultilineWnd:F_PostLoad()

	UI.EffectEditWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:InitScrollBar()

	local uiHandle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_VSCROLL_CHANGE )	
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_EDIT_CURSOR_POS_CHANGE )
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_EDIT_CHANGE )

end


--
function UI.EffectEditMultilineWnd:InitScrollBar()

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	
	if not self.scrollBar then
		return
	end

	self.scrollBar:SetStepSize( _G.GetFontLineHeight( self:GetFont( self.layers.TEXT ) ) )

	local clipRect = self:GetTextClipRect()
	self.scrollBar:SetPageSize( clipRect.w )	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = mainEffect:HasObject( self.effectInfo.main.scrollBarLocator ) and mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ) or UI:ZeroVec2()
	local baseSize = scrollEffect:GetObjSize( "self" )

	local scale_y = needSize.y / baseSize.y
	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

	self.scrollBar:SetWidth( baseSize.x )
	self.scrollBar:SetHeight( needSize.y )

	self:UpdateScrollBar()

end


--
function UI.EffectEditMultilineWnd:UpdateScrollBar()

	local bFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

	self:UpdateScrollBarVisibility()
	self:UpdateScrollBarRange()
	self:EnsureCursorVisible()		
	self:UpdateLayoutFromScrollBar()

	if bFocus and UI:GetKeyboardFocus() ~= self:GetUiHandle() then
		UI:SetKeyboardFocus( self:GetUiHandle() )
	end

end


--
function UI.EffectEditMultilineWnd:UpdateScrollBarVisibility()

	local textHeight	= self:GetLayerRect( self.layers.TEXT ).w
	local clipHeight	= self:GetTextClipRect().w

	local bNeedScrollBar = textHeight - clipHeight > 1e-3

	if bNeedScrollBar then

		if not self.scrollBar:IsChildOf( self ) then

    		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    		if mainEffect then
    			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )
    		end

		end

	else

		if self.scrollBar:IsChildOf( self ) then

    		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    		if mainEffect then
    			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
    		end	

    		self:RemoveChild( self.scrollBar )

		end
	
	end

end


--
function UI.EffectEditMultilineWnd:UpdateScrollBarRange()

	if not self.scrollBar:IsChildOf( self ) then
		return
	end

	local textHeight	= self:GetLayerRect( self.layers.TEXT ).w
	local clipHeight	= self:GetTextClipRect().w

	self.scrollBar:SetRange( 0, textHeight - clipHeight )

end


--
function UI.EffectEditMultilineWnd:EnsureCursorVisible()

	if not self.scrollBar:IsChildOf( self ) then
		return
	end

	local cursorRect = self:GetLayerRect( self.layers.CURSOR )
	local clipRect = self:GetTextClipRect()
	local textRect = self:GetLayerRect( self.layers.TEXT )

	if ( cursorRect.y >= clipRect.y ) and ( cursorRect.y + cursorRect.w <= clipRect.y + clipRect.w ) then
		return
	end

	local scrollPos = self.scrollBar:GetPos()
	local newCursorPos = clipRect.y

	if cursorRect.y < clipRect.y then
		newCursorPos = clipRect.y

	elseif cursorRect.y + cursorRect.w > clipRect.y + clipRect.w then
		newCursorPos = ( clipRect.y + clipRect.w ) - cursorRect.w
	end

	local newTextPos = newCursorPos - ( cursorRect.y - textRect.y )
	local scrollPos = clipRect.y - newTextPos	

	self.scrollBar:SetPos( scrollPos )
	
end


--
function UI.EffectEditMultilineWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateLayoutFromScrollBar()

end


--
function UI.EffectEditMultilineWnd:UpdateLayoutFromScrollBar()

    local scrollPos = 0

	if self.scrollBar:IsChildOf( self ) then	
    	scrollPos = self.scrollBar:GetPos()
	end

	local clipRect = self:GetTextClipRect()
	local cursorDeltaPos = self:GetLayerTop( self.layers.CURSOR ) - self:GetLayerTop( self.layers.TEXT )

	local textPos = clipRect.y - scrollPos
	self:SetLayerTop( textPos, self.layers.TEXT )

	local cursorPos = textPos + cursorDeltaPos
	self:SetLayerTop( cursorPos, self.layers.CURSOR )	

end


--
function UI.EffectEditMultilineWnd:F_OnEventCursorPosChange( hSender )

	if hSender ~= self:GetUiHandle() then
		return
	end

	self:EnsureCursorVisible()	

end


--
function UI.EffectEditMultilineWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender ~= self:GetUiHandle() then
		return
	end

	self:UpdateScrollBar()

end


--
function UI.EffectEditMultilineWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( self.scrollBar:GetPos() - ticks * self.scrollBar:GetStepSize() )
	end

	return true

end   