-- ----------------------------------------------------------------------------
--
-- Workfile: Wnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- Table for base window class
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.Wnd = 
{   	
}

function UI.Wnd:GetUiHandle()										return self.w:GetUiHandle() end
function UI.Wnd:GetClassName()										return self.w:GetClassName() end
function UI.Wnd:Init()												return self.w:Init() end
function UI.Wnd:Shutdown()											self.w:Shutdown() end
function UI.Wnd:RegisterProperties()								self.w:RegisterProperties() end
function UI.Wnd:SubscribeOnEvents()									self.w:SubscribeOnEvents() end
function UI.Wnd:UnsubscribeFromEvents()								self.w:UnsubscribeFromEvents() end
function UI.Wnd:GetName()											return self.w:GetName() end
function UI.Wnd:SetName( name )										self.w:SetName( name ) end
function UI.Wnd:IsOnScreen()										return self.w:IsOnScreen() end
function UI.Wnd:Draw( rect, clipRect )								self.w:Draw( rect, clipRect ) end
function UI.Wnd:DrawLayers( rect, clipRect, firstIdx, numLayers )	self.w:DrawLayers( rect, clipRect, firstIdx, numLayers ) end
function UI.Wnd:DrawLayer( rect, clipRect, layerIdx )				self.w:DrawLayer( rect.x, rect.y, rect.z, rect.w, clipRect.x, clipRect.y, clipRect.z, clipRect.w, layerIdx ) end
function UI.Wnd:DrawChildren( rect, clipRect )						self.w:DrawChildren( rect, clipRect ) end
function UI.Wnd:GetRect()											return UI:Quat( UI_Wnd_GetRect( self.w ) ) end
function UI.Wnd:GetLeft()											return self.w:GetLeft() end
function UI.Wnd:GetTop()											return self.w:GetTop() end
function UI.Wnd:GetWidth()											return self.w:GetWidth() end		
function UI.Wnd:GetHeight()											return self.w:GetHeight() end		
function UI.Wnd:SetLeft( left )										self.w:SetLeft( left ) end
function UI.Wnd:SetTop( top )										self.w:SetTop( top ) end 
function UI.Wnd:SetPos( left, top )									self.w:SetPos( left, top ) end 
function UI.Wnd:SetWidth( w )										self.w:SetWidth( w ) end
function UI.Wnd:SetHeight( h )										self.w:SetHeight( h ) end
function UI.Wnd:SetRect( rect )										self.w:SetRectQuat( rect ) end
function UI.Wnd:ToScreen( rect )									return UI:Quat( UI_Wnd_ToScreen( self.w, rect ) ) end
function UI.Wnd:XToScreen( x )										return self.w:XToScreen( x ) end
function UI.Wnd:YToScreen( y )										return self.w:YToScreen( y ) end
function UI.Wnd:ToWindow( rect )									return UI:Quat( UI_Wnd_ToWindow( self.w, rect ) ) end
function UI.Wnd:XToWindow( x )										return self.w:XToWindow( x ) end
function UI.Wnd:YToWindow( y )										return self.w:YToWindow( y ) end
function UI.Wnd:ToParent( rect )									return UI:Quat( UI_Wnd_ToParent( self.w, rect ) ) end
function UI.Wnd:XToParent( x )										return self.w:XToParent( x ) end
function UI.Wnd:YToParent( y )										return self.w:YToParent( y ) end
function UI.Wnd:IsPtInBounds( x, y )								return self.w:IsPtInBounds( x, y ) end
function UI.Wnd:OnScreenPosChanged( oldX0, oldY0 )					self.w:OnScreenPosChanged( oldX0, oldY0 ) end
function UI.Wnd:OnSizeChanged( oldW, oldH )							self.w:OnSizeChanged( oldW, oldH ) end
function UI.Wnd:AddChild( child, bForce, bLinkAtTail )				if bForce == nil then bForce = false end; if bLinkAtTail == nil then bLinkAtTail = true end; return self.w:AddChild( child and child.w, bForce, bLinkAtTail ) end
function UI.Wnd:RemoveChild( child, bForce )						if bForce == nil then bForce = false end; return self.w:RemoveChild( child and child.w, bForce ) end 
function UI.Wnd:RemoveAllChildren( bDeleteChildren )				if bDeleteChildren == nil then bDeleteChildren = true end; self.w:RemoveAllChildren( bDeleteChildren ) end
function UI.Wnd:GetParent()											local parent = self.w:GetParent(); return parent and UI:GetTableByName( parent:GetScriptTableName() ) end
function UI.Wnd:GetFirstChild()										local child = self.w:GetFirstChild(); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetLastChild()										local child = self.w:GetLastChild(); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetNextSibling()									local sibl = self.w:GetNextSibling(); return sibl and UI:GetTableByName( sibl:GetScriptTableName() ) end
function UI.Wnd:GetPrevSibling()									local sibl = self.w:GetPrevSibling(); return sibl and UI:GetTableByName( sibl:GetScriptTableName() ) end
function UI.Wnd:IsDirectChild( child )								return self.w:IsDirectChild( child and child.w ) end
function UI.Wnd:IsChildOf( ancestor )								return self.w:IsChildOf( ancestor.w ) end
function UI.Wnd:MoveChildToFirstPosition( child )					return self.w:MoveChildToFirstPosition( child and child.w ) end
function UI.Wnd:MoveChildToLastPosition( child )					return self.w:MoveChildToLastPosition( child and child.w ) end
function UI.Wnd:MoveChildBefore( child, nextChild )					return self.w:MoveChildBefore( child and child.w, nextChild and nextChild.w ) end
function UI.Wnd:MoveChildAfter( child, prevChild )					return self.w:MoveChildAfter( child and child.w, prevChild and prevChild.w ) end
function UI.Wnd:GetChildByName( name )								local child = self.w:GetChildByName( name ); return child and UI:GetTableByName( child:GetScriptTableName() ) end  	
function UI.Wnd:GetChildByUiHandle( wndId )							local child = self.w:GetChildByUiHandle( wndId ); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:UnlinkFromParent( bForce )							if bForce == nil then bForce = false end; self.w:UnlinkFromParent( bForce ) end
function UI.Wnd:SetStyle( style )									self.w:SetStyle( style ) end
function UI.Wnd:GetStyle()											return self.w:GetStyle() end
function UI.Wnd:AddStyle( style )									self.w:AddStyle( style ) end
function UI.Wnd:RemoveStyle( style )								self.w:RemoveStyle( style ) end
function UI.Wnd:HasStyle( style )									return self.w:HasStyle( style ) end
function UI.Wnd:GetNumLayers()										return self.w:GetNumLayers() end
function UI.Wnd:GetLayer( layerType, layerIdx, appearance ) 		return self.w:GetLayer( layerType, layerIdx, appearance or 0 )  end
function UI.Wnd:SetColor( color, layerIdx, appearance )				return self.w:SetColor( color, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerRect( rect, layerIdx, appearance )			return self.w:SetLayerRectQuat( rect, layerIdx, appearance or 0 ) end
function UI.Wnd:SetMaskRect( rect, layerIdx, appearance )			return self.w:SetMaskRectQuat( rect, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerLeft( x0, layerIdx, appearance )			return self.w:SetLayerLeft( x0, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerTop( y0, layerIdx, appearance )				return self.w:SetLayerTop( y0, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerWidth( w, layerIdx, appearance )			return self.w:SetLayerWidth( w, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerHeight( h, layerIdx, appearance )			return self.w:SetLayerHeight( h, layerIdx, appearance or 0 ) end
function UI.Wnd:SetLayerVisible( bVisible, layerIdx, appearance )	return self.w:SetLayerVisible( bVisible, layerIdx, appearance or 0 ) end
function UI.Wnd:SetFrame( frameName, layerIdx, appearance )			return self.w:SetFrame( frameName, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTexture( textureName, layerIdx, appearance )		return self.w:SetTexture( textureName, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextureHandle( hTex, layerIdx, appearance ) 		return self.w:SetTextureHandle( hTex, layerIdx, appearance or 0 ) end
function UI.Wnd:SetMaskTexture( textureName, layerIdx, appearance )		return self.w:SetMaskTexture( textureName, layerIdx, appearance or 0 ) end
function UI.Wnd:SetMaskTextureHandle( hTex, layerIdx, appearance ) 		return self.w:SetMaskTextureHandle( hTex, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextureU0( u0, layerIdx, appearance )			return self.w:SetTextureU0( u0, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextureV0( v0, layerIdx, appearance )			return self.w:SetTextureV0( v0, layerIdx, appearance or 0 ) end 
function UI.Wnd:SetTextureU1( u1, layerIdx, appearance )			return self.w:SetTextureU1( u1, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextureV1( v1, layerIdx, appearance )			return self.w:SetTextureV1( v1, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextureCoordinates( u0, v0, u1, v1, layerIdx, appearance )	return self.w:SetTextureCoordinates( u0, v0, u1, v1, layerIdx, appearance or 0 ) end
function UI.Wnd:SetDefaultTextureCoordinates( layerIdx, appearance )			return self.w:SetDefaultTextureCoordinates( layerIdx, appearance or 0 ) end
function UI.Wnd:SetText( text, layerIdx, appearance )				return self.w:SetText( text, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextHandle( handle, layerIdx, appearance )		return self.w:SetTextHandle( handle, layerIdx, appearance or 0 ) end
function UI.Wnd:SetFont( fontId, layerIdx, appearance )				return self.w:SetFont( fontId, layerIdx, appearance or 0 ) end
function UI.Wnd:SetTextFormatFlags( formatFlags, layerIdx, appearance )			return self.w:SetTextFormatFlags( formatFlags, layerIdx, appearance or 0 ) end
function UI.Wnd:SetBlendMode( blendMode, layerIdx, appearance )		return self.w:SetBlendMode( blendMode, layerIdx, appearance or 0 ) end
function UI.Wnd:GetColor( layerIdx, appearance )					return self.w:GetColor( layerIdx, appearance or 0 ) end
function UI.Wnd:GetLayerRect( layerIdx, appearance )				return UI:Quat( UI_Wnd_GetLayerRect( self.w, layerIdx, appearance or 0 ) ) end
function UI.Wnd:GetMaskRect( layerIdx, appearance )					return UI:Quat( UI_Wnd_GetMaskRect( self.w, layerIdx, appearance or 0 ) ) end 
function UI.Wnd:GetLayerLeft( layerIdx, appearance )				return self.w:GetLayerLeft( layerIdx, appearance or 0 ) end
function UI.Wnd:GetLayerTop( layerIdx, appearance )					return self.w:GetLayerTop( layerIdx, appearance or 0 ) end
function UI.Wnd:GetLayerWidth( layerIdx, appearance )				return self.w:GetLayerWidth( layerIdx, appearance or 0 ) end
function UI.Wnd:GetLayerHeight( layerIdx, appearance )				return self.w:GetLayerHeight( layerIdx, appearance or 0 ) end
function UI.Wnd:IsLayerVisible( layerIdx, appearance )				return self.w:IsLayerVisible( layerIdx, appearance or 0 ) end
function UI.Wnd:GetFrameName( layerIdx, appearance )				return self.w:GetFrameName( layerIdx, appearance or 0 ) end
function UI.Wnd:GetFrame( layerIdx, appearance )					return self.w:GetFrame( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextureName( layerIdx, appearance )				return self.w:GetTextureName( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTexture( layerIdx, appearance )					return self.w:GetTexture( layerIdx, appearance or 0 ) end
function UI.Wnd:GetMaskTextureName( layerIdx, appearance )			return self.w:GetMaskTextureName( layerIdx, appearance or 0 ) end
function UI.Wnd:GetMaskTexture( layerIdx, appearance )				return self.w:GetMaskTexture( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextureU0( layerIdx, appearance )				return self.w:GetTextureU0( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextureV0( layerIdx, appearance )				return self.w:GetTextureV0( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextureU1( layerIdx, appearance )				return self.w:GetTextureU1( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextureV1( layerIdx, appearance )				return self.w:GetTextureV1( layerIdx, appearance or 0 ) end
function UI.Wnd:GetText( layerIdx, appearance )						return self.w:GetText( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextHandle( layerIdx, appearance )				return self.w:GetTextHandle( layerIdx, appearance or 0 ) end
function UI.Wnd:GetFont( layerIdx, appearance )						return self.w:GetFont( layerIdx, appearance or 0 ) end
function UI.Wnd:GetTextFormatFlags( layerIdx, appearance )			return self.w:GetTextFormatFlags( layerIdx, appearance or 0 ) end
function UI.Wnd:GetBlendMode( layerIdx, appearance )				return self.w:GetBlendMode( layerIdx, appearance or 0 ) end
function UI.Wnd:GetPacketDrawing( layerIdx, appearance )			return self.w:GetPacketDrawing( layerIdx, appearance or 0 ) end
function UI.Wnd:GetEffectsPool( layerIdx, appearance )				return self.w:GetEffectsPool( layerIdx, appearance or 0 ) end
function UI.Wnd:GetCursorName()										return self.w:GetCursorName() end
function UI.Wnd:SetCursor( resourceName )							self.w:SetCursor( resourceName ) end
function UI.Wnd:SetCursorHandle( hCursor )							self.w:SetCursorHandle( hCursor ) end
function UI.Wnd:EnableCursor( bShow )								self.w:EnableCursor( bShow ) end
function UI.Wnd:IsCursorEnabled()									return self.w:IsCursorEnabled() end
function UI.Wnd:PostLoad()											self.w:PostLoad() end
function UI.Wnd:InitFromPrototype( prototype )						return self.w:InitFromPrototype( prototype.w ) end
function UI.Wnd:OnBeforeAddChild( child, bForce )					if bForce == nil then bForce = false end; return self.w:OnBeforeAddChild( child and child.w, bForce ) end
function UI.Wnd:OnAfterAddChild( child )							self.w:OnAfterAddChild( child and child.w ) end
function UI.Wnd:OnBeforeRemoveChild( child, bForce )				if bForce == nil then bForce = false end; return self.w:OnBeforeRemoveChild( child and child.w, bForce ) end
function UI.Wnd:OnAfterRemoveChild( child )							self.w:OnAfterRemoveChild( child and child.w ) end
function UI.Wnd:OnBeforeAddToParent( parent, bForce )				if bForce == nil then bForce = false end; return self.w:OnBeforeAddToParent( parent and parent.w, bForce ) end
function UI.Wnd:OnAfterAddToParent()								self.w:OnAfterAddToParent() end
function UI.Wnd:OnBeforeRemoveFromParent( bForce )					if bForce == nil then bForce = false end; return self.w:OnBeforeRemoveFromParent( bForce ) end
function UI.Wnd:OnAfterRemoveFromParent( parent )					self.w:OnAfterRemoveFromParent( parent and parent.w ) end
function UI.Wnd:OnBeforeShowOnScreen( bForce )						if bForce == nil then bForce = false end; return self.w:OnBeforeShowOnScreen( bForce ) end
function UI.Wnd:OnAfterShowOnScreen()								self.w:OnAfterShowOnScreen() end
function UI.Wnd:OnBeforeHideFromScreen( bForce )					if bForce == nil then bForce = false end; return self.w:OnBeforeHideFromScreen( bForce ) end
function UI.Wnd:OnAfterHideFromScreen()								self.w:OnAfterHideFromScreen() end
function UI.Wnd:OnResetDevice()										self.w:OnResetDevice() end
function UI.Wnd:OnBeforeResetDevice()								self.w:OnBeforeResetDevice() end
function UI.Wnd:GetAppearance()										return self.w:GetAppearance() end
function UI.Wnd:SetAppearance( appearance )							self.w:SetAppearance( appearance ) end
function UI.Wnd:GetNumAppearances()									return self.w:GetNumAppearances() end
function UI.Wnd:UpdateAppearance()									self.w:UpdateAppearance() end
function UI.Wnd:SetActivationOrder( tabOrder )						self.w:SetActivationOrder( tabOrder ) end
function UI.Wnd:GetActivationOrder()								return self.w:GetActivationOrder() end
function UI.Wnd:GetActiveChild()									local child = self.w:GetActiveChild(); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetFirstActivatableChild()							local child = self.w:GetFirstActivatableChild(); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetNextActivatableChild( prevChild )				local child = self.w:GetNextActivatableChild( prevChild.w ); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetNextActivatableChildEx( prevChild, bIncrement, bCycled )	local child = self.w:GetNextActivatableChildEx( prevChild.w, bIncrement, bCycled ); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:SetDefaultActivatableChild( childName )				self.w:SetDefaultActivatableChild( childName ) end
function UI.Wnd:GetDefaultActivatableChild()						local child = self.w:GetDefaultActivatableChild(); return child and UI:GetTableByName( child:GetScriptTableName() ) end
function UI.Wnd:GetDefaultActivatableChildName()					return self.w:GetDefaultActivatableChildName() end
function UI.Wnd:IsActivatable()										return self.w:IsActivatable() end
function UI.Wnd:StartAnimation( animationName, keyTime )			self.w:StartAnimation( animationName, keyTime or 0 ) end
function UI.Wnd:StopAnimation( animationName )						self.w:StopAnimation( animationName ) end
function UI.Wnd:StopAllAnimations()									self.w:StopAllAnimations() end
function UI.Wnd:UpdateAnimations( dSysTime, dGameTime )				self.w:UpdateAnimations( dSysTime, dGameTime ) end
function UI.Wnd:IsPlayingAnimation()								return self.w:IsPlayingAnimation() end
function UI.Wnd:GetNumPlayingAnimations()							return self.w:GetNumPlayingAnimations() end
function UI.Wnd:GetPlayingAnimation( idx )							return self.w:GetPlayingAnimation( idx ) end
function UI.Wnd:GetAnimationByName( animationName )					return self.w:GetAnimationByName( animationName ) end
function UI.Wnd:GetAnimationById( animationId )						return self.w:GetAnimationById( animationId ) end
function UI.Wnd:EnableAnimation( animationName, bEnable )			self.w:EnableAnimation( animationName, bEnable ) end
function UI.Wnd:IsPlayingHidingAnimation()							return self.w:IsPlayingHidingAnimation() end
function UI.Wnd:SetDefaultAnimation( type, animationName )			self.w:SetDefaultAnimation( type, animationName ) end
function UI.Wnd:GetDefaultAnimationName( type )						return self.w:GetDefaultAnimationName( type ) end
function UI.Wnd:OnKeyboardKeyDown( key, wndThatReceivedInput )		return self.w:OnKeyboardKeyDown( key, wndThatReceivedInput ) end
function UI.Wnd:OnKeyboardKeyUp( key, wndThatReceivedInput )		return self.w:OnKeyboardKeyUp( key, wndThatReceivedInput ) end
function UI.Wnd:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseMButtonDown( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseMButtonDown( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseMButtonUp( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseMButtonUp( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseLButtonClick( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseLButtonClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseRButtonClick( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseRButtonClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseMButtonClick( mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseMButtonClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )		return self.w:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseRButtonDblClick( mouseX, mouseY, wndThatReceivedInput )		return self.w:OnMouseRButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseMButtonDblClick( mouseX, mouseY, wndThatReceivedInput )		return self.w:OnMouseMButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )	return self.w:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )			return self.w:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )			return self.w:OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx )			return self.w:OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickKeyDown_2( key, wndThatReceivedInput, gamepadType, controllerIdx )			return self.w:OnJoystickKeyDown_2( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickKeyUp( key, wndThatReceivedInput, gamepadType, controllerIdx )				return self.w:OnJoystickKeyUp( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickKeyUp_1( key, wndThatReceivedInput, gamepadType, controllerIdx )			return self.w:OnJoystickKeyUp_1( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickKeyUp_2( key, wndThatReceivedInput, gamepadType, controllerIdx )			return self.w:OnJoystickKeyUp_2( key, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickMove( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx )	return self.w:OnJoystickMove( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickMove_1( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx )	return self.w:OnJoystickMove_1( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnJoystickMove_2( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx )	return self.w:OnJoystickMove_2( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, controllerIdx ) end
function UI.Wnd:OnObtainKeyboardFocus()								self.w:OnObtainKeyboardFocus() end
function UI.Wnd:OnLostKeyboardFocus()								self.w:OnLostKeyboardFocus() end
function UI.Wnd:OnCaptureMouse()									self.w:OnCaptureMouse() end
function UI.Wnd:OnReleaseMouseCapture()								self.w:OnReleaseMouseCapture() end
function UI.Wnd:OnMouseIn( mouseX, mouseY, wndThatReceivedInput )	return self.w:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) end
function UI.Wnd:OnMouseOut( wndThatReceivedInput )					return self.w:OnMouseOut( wndThatReceivedInput ) end
function UI.Wnd:GetTooltipText()									return self.w:GetTooltipText() end
function UI.Wnd:GetTooltipTextHandle()								return self.w:GetTooltipTextHandle() end
function UI.Wnd:SetTooltipText( text )								self.w:SetTooltipText( text ) end
function UI.Wnd:SetTooltipTextHandle( textHandle)					self.w:SetTooltipTextHandle( textHandle ) end
function UI.Wnd:IsPrototype()										return self.w:IsPrototype() end
function UI.Wnd:PlaySound( soundName )								self.w:PlaySound( soundName ) end
function UI.Wnd:StopSound( soundName )								self.w:StopSound( soundName ) end
function UI.Wnd:IsSoundPlaying( soundName )							return self.w:IsSoundPlaying( soundName ) end
function UI.Wnd:GetSound( soundName )								return self.w:GetSound( soundName ) end
function UI.Wnd:StopAllSounds()										self.w:StopAllSounds() end
function UI.Wnd:AddSound( soundName )								return self.w:AddSound( soundName ) end
function UI.Wnd:RemoveSound( soundName )							self.w:RemoveSound( soundName ) end
function UI.Wnd:GetPrototypeWnd()									return self.w:GetPrototypeWnd() end
function UI.Wnd:GetPrototypeName()									return self.w:GetPrototypeName() end
function UI.Wnd:IsKindOfPrototype()									return self.w:IsKindOfPrototype() end
function UI.Wnd:GetScriptTableName()								return self.w:GetScriptTableName() end
function UI.Wnd:SetScriptTable( tableName )							self.w:SetScriptTable( tableName ) end
function UI.Wnd:CanUnlinkNow()										return self.w:CanUnlinkNow() end
function UI.Wnd:IsInDelayedUnlinkState()							return self.w:IsInDelayedUnlinkState() end
function UI.Wnd:ValidateMainEffectPos()								self.w:ValidateMainEffectPos() end
function UI.Wnd:SetFirstOverlayLayer( layerIdx )					self.w:SetFirstOverlayLayer( layerIdx ) end


--
local l_dpadKeys =
{
	[ UI.Keys.KEY_XINPUT_DPAD_UP ]		= true,
  	[ UI.Keys.KEY_XINPUT_DPAD_DOWN ]	= true,
  	[ UI.Keys.KEY_XINPUT_DPAD_LEFT ]	= true,
  	[ UI.Keys.KEY_XINPUT_DPAD_RIGHT ]	= true,

	[ UI.Keys.KEY_CELL_DPAD_UP ]		= true,
  	[ UI.Keys.KEY_CELL_DPAD_DOWN ]		= true,
  	[ UI.Keys.KEY_CELL_DPAD_LEFT ]		= true,
  	[ UI.Keys.KEY_CELL_DPAD_RIGHT ]		= true,
}


--
function UI.Wnd:F_OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if l_dpadKeys[ key ] then
		return true 			-- крестовина обрабатывается в HandleJoystickMovement
	else
		return self:OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )
	end

end


--
function UI.Wnd:F_OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if l_dpadKeys[ key ] then
		return true 			-- крестовина обрабатывается в HandleJoystickMovement
	else
		return self:OnJoystickKeyDown_1( key, wndThatReceivedInput, gamepadType, controllerIdx )
	end

end


--
function UI.Wnd:F_OnJoystickKeyDown_2( key, wndThatReceivedInput, gamepadType, controllerIdx )

	if l_dpadKeys[ key ] then
		return true 			-- крестовина обрабатывается в HandleJoystickMovement
	else
		return self:OnJoystickKeyDown_2( key, wndThatReceivedInput, gamepadType, controllerIdx )
	end

end


--
function UI.Wnd:HandleKey( key, controllerIdx )

	local vKey = UI:Key2VKey( key )

	if vKey then
		local handler = self[ UI.VKeysHandlers[ vKey ] ]
		if handler then
			return handler( self, key, controllerIdx )
		end
	end    

	return false

end


--
function UI.Wnd:HandleJoystickMovement( lPosX, lPosY, lDeltaPosX, lDeltaPosY, rPosX, rPosY, rDeltaPosX, rDeltaPosY, POV, wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx )

	self:HandleJoystickMovement2( lPosX, lPosY, lDeltaPosX, lDeltaPosY, wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, 1 ) 
	self:HandleJoystickMovement2( rPosX, rPosY, rDeltaPosX, rDeltaPosY, wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, 2 ) 

	return true

end  


local l_joy8 =
{
   L	= 1,
   R	= 2,
   T	= 4,
   B	= 8,
   
   LT	= 1+4,
   RT	= 2+4,
   LB	= 1+8,
   RB	= 2+8,	
}


--
local l_joy8ToKbXInput =
{
	-- primary controller
	[ 0 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_XINPUT_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_XINPUT_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_XINPUT_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_XINPUT_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB,
	},

	-- secondary controller
	[ 1 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_XINPUT1_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_XINPUT1_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_XINPUT1_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_XINPUT1_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT1,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT1,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB1,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB1,
	},

	-- other controller
	[ 2 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_XINPUT2_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_XINPUT2_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_XINPUT2_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_XINPUT2_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT1,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT1,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB1,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB1,
	}
}


local l_keysByDirXInput =
{
	-- primary controller
	[ 0 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_XINPUT_STICK1_LEFT 	] = true,
           	[ UI.Keys.KEY_XINPUT_STICK2_LEFT 	] = true,
           	[ UI.Keys.KEY_LT					] = true,
           	[ UI.Keys.KEY_LB					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_XINPUT_STICK1_RIGHT	] = true,
            [ UI.Keys.KEY_XINPUT_STICK2_RIGHT	] = true,
            [ UI.Keys.KEY_RT					] = true,
            [ UI.Keys.KEY_RB					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_XINPUT_STICK1_UP		] = true,
       		[ UI.Keys.KEY_XINPUT_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT					] = true,
       		[ UI.Keys.KEY_RT					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_XINPUT_STICK1_DOWN	] = true,
       		[ UI.Keys.KEY_XINPUT_STICK2_DOWN	] = true,
       		[ UI.Keys.KEY_LB					] = true,
       		[ UI.Keys.KEY_RB					] = true,
    	}
	},

	-- secondary controller
	[ 1 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_XINPUT1_STICK1_LEFT	] = true,
           	[ UI.Keys.KEY_XINPUT1_STICK2_LEFT	] = true,
           	[ UI.Keys.KEY_LT1					] = true,
           	[ UI.Keys.KEY_LB1					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_XINPUT1_STICK1_RIGHT	] = true,
            [ UI.Keys.KEY_XINPUT1_STICK2_RIGHT	] = true,
            [ UI.Keys.KEY_RT1					] = true,
            [ UI.Keys.KEY_RB1					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_XINPUT1_STICK1_UP		] = true,
       		[ UI.Keys.KEY_XINPUT1_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT1					] = true,
       		[ UI.Keys.KEY_RT1					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_XINPUT1_STICK1_DOWN	] = true,
       		[ UI.Keys.KEY_XINPUT1_STICK2_DOWN	] = true,
       		[ UI.Keys.KEY_LB1					] = true,
       		[ UI.Keys.KEY_RB1					] = true,
    	}
	},

	-- other controller
	[ 2 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_XINPUT2_STICK1_LEFT	] = true,
           	[ UI.Keys.KEY_XINPUT2_STICK2_LEFT	] = true,
           	[ UI.Keys.KEY_LT1					] = true,
           	[ UI.Keys.KEY_LB1					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_XINPUT2_STICK1_RIGHT	] = true,
            [ UI.Keys.KEY_XINPUT2_STICK2_RIGHT	] = true,
            [ UI.Keys.KEY_RT1					] = true,
            [ UI.Keys.KEY_RB1					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_XINPUT2_STICK1_UP		] = true,
       		[ UI.Keys.KEY_XINPUT2_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT1					] = true,
       		[ UI.Keys.KEY_RT1					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_XINPUT2_STICK1_DOWN	] = true,
       		[ UI.Keys.KEY_XINPUT2_STICK2_DOWN	] = true,
       		[ UI.Keys.KEY_LB1					] = true,
       		[ UI.Keys.KEY_RB1					] = true,
    	}
	}

}


local l_neighbourKeysXInput =
{
	-- primary controller
	[ 0 ] =
	{
    	[ UI.Keys.KEY_XINPUT_STICK1_LEFT	] = { [ UI.Keys.KEY_LT ] = true, [ UI.Keys.KEY_LB ] = true },
    	[ UI.Keys.KEY_XINPUT_STICK1_UP		] = { [ UI.Keys.KEY_LT ] = true, [ UI.Keys.KEY_RT ] = true },
    	[ UI.Keys.KEY_XINPUT_STICK1_RIGHT	] = { [ UI.Keys.KEY_RT ] = true, [ UI.Keys.KEY_RB ] = true },
    	[ UI.Keys.KEY_XINPUT_STICK1_DOWN	] = { [ UI.Keys.KEY_LB ] = true, [ UI.Keys.KEY_RB ] = true },
	},

	-- secondary controller
	[ 1 ] =
	{
    	[ UI.Keys.KEY_XINPUT1_STICK1_LEFT	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_LB1 ] = true },
    	[ UI.Keys.KEY_XINPUT1_STICK1_UP		] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_RT1 ] = true },
    	[ UI.Keys.KEY_XINPUT1_STICK1_RIGHT	] = { [ UI.Keys.KEY_RT1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
    	[ UI.Keys.KEY_XINPUT1_STICK1_DOWN	] = { [ UI.Keys.KEY_LB1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
	},

	-- other controller
	[ 2 ] =
	{
    	[ UI.Keys.KEY_XINPUT2_STICK1_LEFT	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_LB1 ] = true },
    	[ UI.Keys.KEY_XINPUT2_STICK1_UP		] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_RT1 ] = true },
    	[ UI.Keys.KEY_XINPUT2_STICK1_RIGHT	] = { [ UI.Keys.KEY_RT1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
    	[ UI.Keys.KEY_XINPUT2_STICK1_DOWN	] = { [ UI.Keys.KEY_LB1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
	},
}


local l_dpadKeysByGamepadIdxXInput =
{
	[ 0 ] =
	{
    	UP     = UI.Keys.KEY_XINPUT_DPAD_UP,
      	DOWN   = UI.Keys.KEY_XINPUT_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_XINPUT_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_XINPUT_DPAD_RIGHT,
	},

	[ 1 ] =
	{
    	UP     = UI.Keys.KEY_XINPUT_DPAD_UP,
      	DOWN   = UI.Keys.KEY_XINPUT_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_XINPUT_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_XINPUT_DPAD_RIGHT,
	},

	[ 2 ] =
	{
    	UP     = UI.Keys.KEY_XINPUT_DPAD_UP,
      	DOWN   = UI.Keys.KEY_XINPUT_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_XINPUT_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_XINPUT_DPAD_RIGHT,
	}
}


--
local l_joy8ToKbPS3 =
{
	-- primary controller
	[ 0 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_CELL_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_CELL_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_CELL_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_CELL_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB,
	},

	-- secondary controller
	[ 1 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_CELL1_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_CELL1_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_CELL1_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_CELL1_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT1,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT1,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB1,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB1,
	},

	-- other controller
	[ 2 ] =
	{
       [ l_joy8.L ]		= UI.Keys.KEY_CELL2_STICK1_LEFT,
       [ l_joy8.R ]		= UI.Keys.KEY_CELL2_STICK1_RIGHT,
       [ l_joy8.T ]		= UI.Keys.KEY_CELL2_STICK1_UP,
       [ l_joy8.B ]		= UI.Keys.KEY_CELL2_STICK1_DOWN,
       [ l_joy8.LT ]	= UI.Keys.KEY_LT1,			-- TODO
       [ l_joy8.RT ]	= UI.Keys.KEY_RT1,
       [ l_joy8.LB ]	= UI.Keys.KEY_LB1,
       [ l_joy8.RB ]	= UI.Keys.KEY_RB1,
	},
}


local l_keysByDirPS3 =
{
	-- primary controller
	[ 0 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_CELL_STICK1_LEFT 		] = true,
           	[ UI.Keys.KEY_CELL_STICK2_LEFT 		] = true,
           	[ UI.Keys.KEY_LT					] = true,
           	[ UI.Keys.KEY_LB					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_CELL_STICK1_RIGHT		] = true,
            [ UI.Keys.KEY_CELL_STICK2_RIGHT		] = true,
            [ UI.Keys.KEY_RT					] = true,
            [ UI.Keys.KEY_RB					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_CELL_STICK1_UP		] = true,
       		[ UI.Keys.KEY_CELL_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT					] = true,
       		[ UI.Keys.KEY_RT					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_CELL_STICK1_DOWN		] = true,
       		[ UI.Keys.KEY_CELL_STICK2_DOWN		] = true,
       		[ UI.Keys.KEY_LB					] = true,
       		[ UI.Keys.KEY_RB					] = true,
    	}
	},

	-- secondary controller
	[ 1 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_CELL1_STICK1_LEFT		] = true,
           	[ UI.Keys.KEY_CELL1_STICK2_LEFT		] = true,
           	[ UI.Keys.KEY_LT1					] = true,
           	[ UI.Keys.KEY_LB1					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_CELL1_STICK1_RIGHT	] = true,
            [ UI.Keys.KEY_CELL1_STICK2_RIGHT	] = true,
            [ UI.Keys.KEY_RT1					] = true,
            [ UI.Keys.KEY_RB1					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_CELL1_STICK1_UP		] = true,
       		[ UI.Keys.KEY_CELL1_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT1					] = true,
       		[ UI.Keys.KEY_RT1					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_CELL1_STICK1_DOWN		] = true,
       		[ UI.Keys.KEY_CELL1_STICK2_DOWN		] = true,
       		[ UI.Keys.KEY_LB1					] = true,
       		[ UI.Keys.KEY_RB1					] = true,
    	}
	},  

	-- other controller
	[ 2 ] =
	{
    	left =
    	{
           	[ UI.Keys.KEY_CELL2_STICK1_LEFT		] = true,
           	[ UI.Keys.KEY_CELL2_STICK2_LEFT		] = true,
           	[ UI.Keys.KEY_LT1					] = true,
           	[ UI.Keys.KEY_LB1					] = true,	
    	},

        right =
        {
            [ UI.Keys.KEY_CELL2_STICK1_RIGHT	] = true,
            [ UI.Keys.KEY_CELL2_STICK2_RIGHT	] = true,
            [ UI.Keys.KEY_RT1					] = true,
            [ UI.Keys.KEY_RB1					] = true,
        },

    	top =
    	{
       		[ UI.Keys.KEY_CELL2_STICK1_UP		] = true,
       		[ UI.Keys.KEY_CELL2_STICK2_UP		] = true,
       		[ UI.Keys.KEY_LT1					] = true,
       		[ UI.Keys.KEY_RT1					] = true,
    	},

    	bottom = 
    	{
       		[ UI.Keys.KEY_CELL2_STICK1_DOWN		] = true,
       		[ UI.Keys.KEY_CELL2_STICK2_DOWN		] = true,
       		[ UI.Keys.KEY_LB1					] = true,
       		[ UI.Keys.KEY_RB1					] = true,
    	}
	},  
}


local l_neighbourKeysPS3 =
{
	-- primary controller
	[ 0 ] =
	{
    	[ UI.Keys.KEY_CELL_STICK1_LEFT	] = { [ UI.Keys.KEY_LT ] = true, [ UI.Keys.KEY_LB ] = true },
    	[ UI.Keys.KEY_CELL_STICK1_UP	] = { [ UI.Keys.KEY_LT ] = true, [ UI.Keys.KEY_RT ] = true },
    	[ UI.Keys.KEY_CELL_STICK1_RIGHT	] = { [ UI.Keys.KEY_RT ] = true, [ UI.Keys.KEY_RB ] = true },
    	[ UI.Keys.KEY_CELL_STICK1_DOWN	] = { [ UI.Keys.KEY_LB ] = true, [ UI.Keys.KEY_RB ] = true },
	},

	-- secondary controller
	[ 1 ] =
	{
    	[ UI.Keys.KEY_CELL1_STICK1_LEFT	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_LB1 ] = true },
    	[ UI.Keys.KEY_CELL1_STICK1_UP	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_RT1 ] = true },
    	[ UI.Keys.KEY_CELL1_STICK1_RIGHT] = { [ UI.Keys.KEY_RT1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
    	[ UI.Keys.KEY_CELL1_STICK1_DOWN	] = { [ UI.Keys.KEY_LB1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
	},

	-- other controller
	[ 2 ] =
	{
    	[ UI.Keys.KEY_CELL2_STICK1_LEFT	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_LB1 ] = true },
    	[ UI.Keys.KEY_CELL2_STICK1_UP	] = { [ UI.Keys.KEY_LT1 ] = true, [ UI.Keys.KEY_RT1 ] = true },
    	[ UI.Keys.KEY_CELL2_STICK1_RIGHT] = { [ UI.Keys.KEY_RT1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
    	[ UI.Keys.KEY_CELL2_STICK1_DOWN	] = { [ UI.Keys.KEY_LB1 ] = true, [ UI.Keys.KEY_RB1 ] = true },
	},
}


local l_dpadKeysByGamepadIdxPS3 =
{
	[ 0 ] =
	{
    	UP     = UI.Keys.KEY_CELL_DPAD_UP,
      	DOWN   = UI.Keys.KEY_CELL_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_CELL_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_CELL_DPAD_RIGHT,
	},

	[ 1 ] =
	{
    	UP     = UI.Keys.KEY_CELL_DPAD_UP,
      	DOWN   = UI.Keys.KEY_CELL_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_CELL_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_CELL_DPAD_RIGHT,
	},

	[ 2 ] =
	{
    	UP     = UI.Keys.KEY_CELL_DPAD_UP,
      	DOWN   = UI.Keys.KEY_CELL_DPAD_DOWN,
      	LEFT   = UI.Keys.KEY_CELL_DPAD_LEFT,
      	RIGHT  = UI.Keys.KEY_CELL_DPAD_RIGHT,
	}
}

local l_stickKeysXInput =
{
	-- primary controller
	[ 0 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_XINPUT_STICK1_UP,
    		down	= UI.Keys.KEY_XINPUT_STICK1_DOWN,
    		left	= UI.Keys.KEY_XINPUT_STICK1_LEFT,
    		right	= UI.Keys.KEY_XINPUT_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_XINPUT_STICK2_UP,
    		down	= UI.Keys.KEY_XINPUT_STICK2_DOWN,
    		left	= UI.Keys.KEY_XINPUT_STICK2_LEFT,
    		right	= UI.Keys.KEY_XINPUT_STICK2_RIGHT,
		} 
	},

	-- secondary controller
	[ 1 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_XINPUT1_STICK1_UP,
    		down	= UI.Keys.KEY_XINPUT1_STICK1_DOWN,
    		left	= UI.Keys.KEY_XINPUT1_STICK1_LEFT,
    		right	= UI.Keys.KEY_XINPUT1_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_XINPUT1_STICK2_UP,
    		down	= UI.Keys.KEY_XINPUT1_STICK2_DOWN,
    		left	= UI.Keys.KEY_XINPUT1_STICK2_LEFT,
    		right	= UI.Keys.KEY_XINPUT1_STICK2_RIGHT,
		} 
	},

	-- other controller
	[ 2 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_XINPUT2_STICK1_UP,
    		down	= UI.Keys.KEY_XINPUT2_STICK1_DOWN,
    		left	= UI.Keys.KEY_XINPUT2_STICK1_LEFT,
    		right	= UI.Keys.KEY_XINPUT2_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_XINPUT2_STICK2_UP,
    		down	= UI.Keys.KEY_XINPUT2_STICK2_DOWN,
    		left	= UI.Keys.KEY_XINPUT2_STICK2_LEFT,
    		right	= UI.Keys.KEY_XINPUT2_STICK2_RIGHT,
		} 
	}
}


local l_stickKeysPS3 =
{
	-- primary controller
	[ 0 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_CELL_STICK1_UP,
    		down	= UI.Keys.KEY_CELL_STICK1_DOWN,
    		left	= UI.Keys.KEY_CELL_STICK1_LEFT,
    		right	= UI.Keys.KEY_CELL_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_CELL_STICK2_UP,
    		down	= UI.Keys.KEY_CELL_STICK2_DOWN,
    		left	= UI.Keys.KEY_CELL_STICK2_LEFT,
    		right	= UI.Keys.KEY_CELL_STICK2_RIGHT,
		} 
	},

	-- secondary controller
	[ 1 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_CELL1_STICK1_UP,
    		down	= UI.Keys.KEY_CELL1_STICK1_DOWN,
    		left	= UI.Keys.KEY_CELL1_STICK1_LEFT,
    		right	= UI.Keys.KEY_CELL1_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_CELL1_STICK2_UP,
    		down	= UI.Keys.KEY_CELL1_STICK2_DOWN,
    		left	= UI.Keys.KEY_CELL1_STICK2_LEFT,
    		right	= UI.Keys.KEY_CELL1_STICK2_RIGHT,
		} 
	},

	-- other controller
	[ 2 ] =
	{
		-- stick id
		[ 1 ] =
		{
    		up		= UI.Keys.KEY_CELL2_STICK1_UP,
    		down	= UI.Keys.KEY_CELL2_STICK1_DOWN,
    		left	= UI.Keys.KEY_CELL2_STICK1_LEFT,
    		right	= UI.Keys.KEY_CELL2_STICK1_RIGHT,
		},

		-- stick id
		[ 2 ] =
		{
    		up		= UI.Keys.KEY_CELL2_STICK2_UP,
    		down	= UI.Keys.KEY_CELL2_STICK2_DOWN,
    		left	= UI.Keys.KEY_CELL2_STICK2_LEFT,
    		right	= UI.Keys.KEY_CELL2_STICK2_RIGHT,
		} 
	}
}


-- TODO: optimize!!

function UI.Wnd:HandleJoystickMovement2( posX, posY, deltaX, deltaY, wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, stickId ) 

	-- only xbox and ps3 gamepad is supported for now
	if gamepadType ~= UI.GAMEPAD_TYPE_XINPUT and gamepadType ~= UI.GAMEPAD_TYPE_PS3 then
		return false
	end

	if not self._joyData then
		self._joyData = {}

		for idx = 0, 3 do
			self._joyData[ idx ] =
			{
    			joyKey		= {},
    			joyLastTime = {},
    			joyCurDelay	= {},
			}
		end

	end
	
	local deadZone					= 0
	local keyZone					= 0
	local joy8ToKb					= nil
	local keysByDir					= nil
	local neighbourKeys				= nil
	local dpadKeysByGamepadIdx		= nil
	local stickKeys					= nil
	
	if gamepadType == UI.GAMEPAD_TYPE_XINPUT then
		deadZone				= UI.XINPUT_DEADZONE
		keyZone					= deadZone + 15000
		joy8ToKb				= l_joy8ToKbXInput[ gamepadIdx ] 
		keysByDir				= l_keysByDirXInput[ gamepadIdx ]
		neighbourKeys			= l_neighbourKeysXInput[ gamepadIdx ]
		dpadKeysByGamepadIdx	= l_dpadKeysByGamepadIdxXInput[ gamepadIdx ]
		stickKeys				= l_stickKeysXInput[ gamepadIdx ][ stickId ]

	elseif gamepadType == UI.GAMEPAD_TYPE_PS3 then
		deadZone				= UI.PS3_DEADZONE
		keyZone					= deadZone + 40
		joy8ToKb				= l_joy8ToKbPS3[ gamepadIdx ]
		keysByDir				= l_keysByDirPS3[ gamepadIdx ]
		neighbourKeys			= l_neighbourKeysPS3[ gamepadIdx ]
		dpadKeysByGamepadIdx	= l_dpadKeysByGamepadIdxPS3[ gamepadIdx ]
		stickKeys				= l_stickKeysPS3[ gamepadIdx ][ stickId ]
	end

	local joyData		= self._joyData[ controllerIdx ] 
	local delay			= self._JOY_DELAY or 0.15
	local firstDelay	= self._JOY_FIRST_DELAY or 0.3
	local curDelay		= joyData.joyCurDelay[ stickId ]
	local key			= nil
	local prevKey		= joyData.joyKey[ stickId ]
	local curTime		= _G.TimerGetRealTime()
	local bHandle8		= self._bJoyHandle8

local www = --[[ stickId == 1 ]] false

	-- "крестовина" заменяет левый стик
	local dpadKey = nil

	if stickId == 1 then

		-- TODO: optimize

		local left	= _G.Input_IsKeyPressed( dpadKeysByGamepadIdx.LEFT )	and l_joy8.L or 0
		local right	= _G.Input_IsKeyPressed( dpadKeysByGamepadIdx.RIGHT )	and l_joy8.R or 0
		local top	= _G.Input_IsKeyPressed( dpadKeysByGamepadIdx.UP ) 		and l_joy8.T or 0
		local btm	= _G.Input_IsKeyPressed( dpadKeysByGamepadIdx.DOWN )	and l_joy8.B or 0

		local dpadState = 0
		if bHandle8 then
			dpadState = left + right + top + btm
		else
			if left ~= 0 then
				dpadState = left
			elseif right ~= 0 then
				dpadState = right
			elseif top ~= 0 then
				dpadState = top
			elseif btm ~= 0 then
				dpadState = btm
			end
		end

		dpadKey = joy8ToKb[ dpadState ]
		key = dpadKey

	end

	local radSq = UI:V2LengthSq( UI:Vec2( posX, posY ) )

	if not key and radSq >= keyZone * keyZone then 

    	if stickId == 1 and bHandle8 then

    		local left	= ( ( posX > deadZone or posX < -deadZone ) and posX < 0 )	and l_joy8.L or 0
    		local right	= ( ( posX > deadZone or posX < -deadZone ) and posX > 0 )	and l_joy8.R or 0
    		local top	= ( ( posY > deadZone or posY < -deadZone ) and posY > 0 )	and l_joy8.T or 0
    		local btm	= ( ( posY > deadZone or posY < -deadZone ) and posY < 0 )  and l_joy8.B or 0

			local joyState = left + right + top + btm
			key = joy8ToKb[ joyState ]

    	else

        	local bVert		= math.abs( posY ) > math.abs( posX )
        	local pos		= bVert and posY or posX
        	local delta		= bVert and deltaY or deltaX			

			if pos > 0 and delta >= 0 then
				key = bVert and stickKeys.up or stickKeys.right

			elseif pos < 0 and delta <= 0 then
				key = bVert and stickKeys.down or stickKeys.left
			end

    	end

	end

	local bContinue = false

	if key then

		if prevKey and ( key == prevKey or neighbourKeys[ prevKey ] and neighbourKeys[ prevKey ][ key ] or neighbourKeys[ key ] and neighbourKeys[ key ][ prevKey ] ) then
			bContinue = true

		else

			self:FakeJoyUp( wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, stickId )

        	if www then
        		sys.out( "key: %s   x: %d   y: %d   dx: %d   dy: %d", UI:Val2Key(UI.Keys,key), posX, posY, deltaX, deltaY )
        	end


           	joyData.joyKey[ stickId ]		= key
           	joyData.joyLastTime[ stickId ]	= curTime
           	joyData.joyCurDelay[ stickId ] 	= firstDelay

			UI:SendUiEvent( UI.EV_JOY_KEY_DOWN, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, key, 0, 0, 0 )
           	return self:HandleKey( key, controllerIdx ) 
		end		

	else

		if prevKey then

            local left	= keysByDir.left[ prevKey ] 
            local right	= keysByDir.right[ prevKey ] 
            local top	= keysByDir.top[ prevKey ] 
            local btm	= keysByDir.bottom[ prevKey ]

			local bReleaseKey = 
				left and posX >= -deadZone or
				right and posX <= deadZone or
				top and posY <= deadZone or
				btm and posY >= -deadZone 

    		if bReleaseKey then
        		if www then
        			sys.out( "release1  x: %d  y: %d  dx: %d  dy: %d", posX, posY, deltaX, deltaY )
        		end

    			self:FakeJoyUp( wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, stickId )

    		else
				bContinue = true
    		end     	

		end	 

	end 


	if bContinue then
       	if curTime - joyData.joyLastTime[ stickId ] < curDelay then
       		if www then
       			sys.out( "continue x: %d  y: %d  dx: %d  dy: %d", posX, posY, deltaX, deltaY )
       		end
       		return false
       	end

       	-- пришло время для повтора "нажатия"
       	joyData.joyLastTime[ stickId ] = curTime
       	joyData.joyCurDelay[ stickId ] = delay
       	
   		if www then
   			sys.out( "repeat x: %d  y: %d  dx: %d  dy: %d", posX, posY, deltaX, deltaY )
   		end

		UI:SendUiEvent( UI.EV_JOY_KEY_DOWN, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, prevKey, 0, 0, 0 )
       	return self:HandleKey( prevKey, controllerIdx )
	end

end


--
function UI.Wnd:FakeJoyUp( wndThatReceivedInput, gamepadType, gamepadIdx, controllerIdx, stickId )

	local joyData = self._joyData[ controllerIdx ]

	if joyData.joyKey[ stickId ] then

		local fn = nil

		if gamepadIdx == 0 then
			fn = self.F_OnJoystickKeyUp
		elseif gamepadIdx == 1 then
			fn = self.F_OnJoystickKeyUp_1
		else
			fn = self.F_OnJoystickKeyUp_2
		end

		if fn then
			fn( self, joyData.joyKey[ stickId ], wndThatReceivedInput, gamepadType, controllerIdx )		
		end

	end

   	joyData.joyKey[ stickId ]		= nil
   	joyData.joyLastTime[ stickId ]  = nil
	joyData.joyCurDelay[ stickId ]	= nil

end


--
function UI.Wnd:F_PostLoad()

	self:PostLoad()

	self:LoadResources()

end


--
function UI.Wnd:F_Shutdown()

	self:ReleaseResources()
	self:Shutdown()

end


--
function UI.Wnd:LoadResources()

	if self.resources then
    	for resourceType, resourceList in pairs( self.resources ) do
    		self:LoadResourcesFromTable( resourceList, resourceType )
    	end
	end

end


--
function UI.Wnd:LoadResourcesFromTable( t, resourceType )

	for key, val in pairs( t ) do
		if type( val ) == "table" then
			if val.name then
				val.handle = UI:GetResourceHandleByName( val.name, resourceType )
			else
				self:LoadResourcesFromTable( val, resourceType )
			end
		end
	end

end


--
function UI.Wnd:ReleaseResources()

	if self.resources then
		self:ReleaseResourcesFromTable( self.resources )
	end

end


--
function UI.Wnd:ReleaseResourcesFromTable( t )

	for key, val in pairs( t ) do
		if type( val ) == "table" then
			if val.handle then
				UI:ReleaseResourceHandle( val.handle )
				val.handle = UI.INVALID_RESOURCE_HANDLE
			else
				self:ReleaseResourcesFromTable( val )
			end
		end
	end

end

--
function UI.Wnd:F_OnResetDevice()

	self:OnResetDevice()

	if self.effects then
		for idx, effect in pairs( self.effects ) do
			effect:OnResetDevice()
		end
	end

end