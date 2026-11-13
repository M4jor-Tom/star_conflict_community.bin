-- ----------------------------------------------------------------------------
--
-- Workfile: UiManager.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------


function UI:GetUiObjByHandleT( objId )
	local obj = self:GetUiObjByHandle( objId )
	return obj and self:GetTableByName( obj:GetScriptTableName() )
end


function UI:CreateUiObj( className, bInit, wantedObjId )	if bInit == nil then bInit = true end; return UI.base:CreateUiObj( className, bInit, wantedObjId or UI.INVALID_UI_HANDLE ) end
function UI:CreateUiObjFromScript( tableName )				return UI.base:CreateUiObjFromScript( tableName ) end
function UI:RemoveUiObj( objId )							UI.base:RemoveUiObj( objId ) end
function UI:GetUiObjByHandle( objId )						return UI.base:GetUiObjByHandle( objId ) end
function UI:ShowWindow( objId )								return UI.base:ShowWindow( objId ) end
function UI:HideWindow( objId )								return UI.base:HideWindow( objId ) end
function UI:IsWindowOnScreen( objId )						return UI.base:IsWindowOnScreen( objId ) end
function UI:SendUiEvent( eventId, senderObjId, recipientObjId, deliverType, iParam0, iParam1, fParam0, fParam1 ) UI.base:SendUiEvent( eventId, senderObjId, recipientObjId, deliverType, iParam0, iParam1, fParam0, fParam1 ) end
function UI:SubscribeUiObjOnEvent( objId, eventId )			return UI.base:SubscribeUiObjOnEvent( objId, eventId ) end
function UI:UnsubscribeUiObjFromEvent( objId, eventId )		UI.base:UnsubscribeUiObjFromEvent( objId, eventId ) end
function UI:UnsubscribeUiObjFromAllEvents( objId )			UI.base:UnsubscribeUiObjFromAllEvents( objId ) end	
function UI:IsUiObjSubscribedOnEvent( objId, eventId )		return UI.base:IsUiObjSubscribedOnEvent( objId, eventId ) end
function UI:LoadResourceList( fileName )					return UI.base:LoadResourceList( fileName ) end
function UI:LoadResourcesByGroup( groupName )				return UI.base:LoadResourcesByGroup( groupName ) end
function UI:UnloadResourcesByGroup( groupName )				UI.base:UnloadResourcesByGroup( groupName ) end
function UI:SetKeyboardFocus( wndId )						return UI.base:SetKeyboardFocus( wndId ) end
function UI:GetKeyboardFocus()								return UI.base:GetKeyboardFocus() end
function UI:CaptureMouse( wndId )							return UI.base:CaptureMouse( wndId ) end
function UI:GetMouseCapture()								return UI.base:GetMouseCapture() end
function UI:FindWindowUnderMouse( curRoot, mouseX, mouseY, bIgnoreNotReactingWindows ) local wnd = UI.base:FindWindowUnderMouse( curRoot and curRoot.w, mouseX, mouseY, bIgnoreNotReactingWindows ); return wnd and UI:GetTableByName( wnd:GetScriptTableName() ) end
function UI:GetDefaultCursorName()							return UI.base:GetDefaultCursorName() end
function UI:SetDefaultCursor( cursorResourceName )			UI.base:SetDefaultCursor( cursorResourceName ) end
function UI:GetCurrentCursor()								return UI.base:GetCurrentCursor() end
function UI:GetCurrentCursorName()							return UI.base:GetCurrentCursorName() end
function UI:EnableDXCursor( bEnable )						UI.base:EnableDXCursor( bEnable ) end
function UI:IsDXCursorEnabled()								return UI.base:IsDXCursorEnabled() end
function UI:MakeArgb( a, r, g, b )							return UI.base:MakeArgb( a, r, g, b ) end
function UI:GetAlpha( color )								return UI.base:GetAlpha( color ) end
function UI:GetRed( color )									return UI.base:GetRed( color ) end
function UI:GetGreen( color )								return UI.base:GetGreen( color ) end
function UI:GetBlue( color )								return UI.base:GetBlue( color ) end
function UI:SetAlpha( color, a )							return UI.base:SetAlpha( color, a ) end
function UI:SetRed( color, r )								return UI.base:SetRed( color, r ) end
function UI:SetGreen( color, g )							return UI.base:SetGreen( color, g ) end
function UI:SetBlue( color, b )								return UI.base:SetBlue( color, b ) end
function UI:HasBitFlag( flagSet, flag )						return UI.base:HasBitFlag( flagSet, flag ) end
function UI:SetBitFlag( flagSet, flag )						return UI.base:SetBitFlag( flagSet, flag ) end
function UI:ResetBitFlag( flagSet, flag )					return UI.base:ResetBitFlag( flagSet, flag ) end
function UI:GetMouseX()            							return UI.base:GetMouseX() end
function UI:GetMouseY()										return UI.base:GetMouseY() end
function UI:ReloadResources( resTypes, srcGroup, dstGroup )	UI.base:ReloadResources( resTypes or UI.RES_ALL, srcGroup or "", dstGroup or "" ) end
function UI:SaveUiStates()									UI.base:SaveUiStates() end
function UI:RestoreUiStates()								UI.base:RestoreUiStates() end
function UI:SetUiStateI( stateId, value )					UI.base:SetUiStateI( stateId, value ) end
function UI:SetUiStateU( stateId, value )					UI.base:SetUiStateU( stateId, value ) end
function UI:SetUiStateF( stateId, value )					UI.base:SetUiStateF( stateId, value ) end
function UI:SetUiStateB( stateId, value )					UI.base:SetUiStateB( stateId, value ) end
function UI:SetUiStateS( stateId, value )					UI.base:SetUiStateS( stateId, value ) end
function UI:SetUiStateV( stateId, value )					UI.base:SetUiStateV( stateId, value ) end
function UI:SetUiStateQ( stateId, value )					UI.base:SetUiStateQ( stateId, value ) end
function UI:GetUiStateI( stateId )							return UI.base:GetUiStateI( stateId ) end
function UI:GetUiStateU( stateId )							return UI.base:GetUiStateU( stateId ) end
function UI:GetUiStateF( stateId )							return UI.base:GetUiStateF( stateId ) end
function UI:GetUiStateB( stateId )							return UI.base:GetUiStateB( stateId ) end
function UI:GetUiStateS( stateId )							return UI.base:GetUiStateS( stateId ) end
function UI:GetUiStateV( stateId )							return UI.base:GetUiStateV( stateId ) end
function UI:GetUiStateQ( stateId )							return UI.base:GetUiStateQ( stateId ) end
function UI:BeginCallbackInfoRegistration()					UI.base:BeginCallbackInfoRegistration() end
function UI:EndCallbackInfoRegistration()					UI.base:EndCallbackInfoRegistration() end
function UI:RegisterCallbackInfoForEvent( eventId, defaultFuncName ) return UI.base:RegisterCallbackInfoForEvent( eventId, defaultFuncName ) end
function UI:GetResourceHandleByName( resourceName, resourceType, bDontSpew ) if bDontSpew == nil then bDontSpew = false end; return UI.base:GetResourceHandleByName( resourceName, resourceType, bDontSpew ) end
function UI:ReferenceResourceHandle( handle )				UI.base:ReferenceResourceHandle( handle ) end
function UI:ReleaseResourceHandle( handle )					UI.base:ReleaseResourceHandle( handle ) end
function UI:IsResourceHandleValid( handle )					return UI.base:IsResourceHandleValid( handle ) end
function UI:GetResourceByHandle( handle )					return UI.base:GetResourceByHandle( handle ) end
function UI:GetWndFrameByHandle( handle )					return UI.base:GetWndFrameByHandle( handle ) end
function UI:GetCursorByHandle( handle )						return UI.base:GetCursorByHandle( handle ) end
function UI:GetSoundByHandle( handle )						return UI.base:GetSoundByHandle( handle ) end
function UI:GetStringByName( resourceName, bReturnKeyIfMissing ) if bReturnKeyIfMissing == nil then bReturnKeyIfMissing = true end;	return UI.base:GetStringByName( resourceName, bReturnKeyIfMissing ) end
function UI:GetPrototypeByName( resourceName )				return UI.base:GetPrototypeByName( resourceName ) end
function UI:GetColorByName( resourceName )					return UI.base:GetColorByName( resourceName ) end
function UI:UpdateInternal( elapsedTime )					UI.base:UpdateInternal( elapsedTime ) end
function UI:SubscribeOnEngineEvent( eventId )               UI.base:SubscribeOnEngineEvent( eventId ) end
function UI:HideAllWindows()								UI.base:HideAllWindows() end
function UI:IsInShutdown()									return UI.base:IsInShutdown() end
function UI:IsInRemovingAllWindows()						return UI.base:IsInRemovingAllWindows() end
function UI:Purge()											UI.base:Purge() end
function UI:CreateGlobalSound( name )						return UI.base:CreateGlobalSound( name ) end
function UI:GetGlobalSound( name )							return UI.base:GetGlobalSound( name ) end
function UI:PlayGlobalSound( name, bLoop, bStopPreviousOfThisKind ) if bLoop == nil then bLoop = false end; if bStopPreviousOfThisKind == nil then bStopPreviousOfThisKind = true end; UI.base:PlayGlobalSound( name, bLoop, bStopPreviousOfThisKind ) end
function UI:StopGlobalSound( name )							UI.base:StopGlobalSound( name ) end
function UI:StopAllGlobalSounds()							UI.base:StopAllGlobalSounds() end
function UI:LoadTexture( name, fileName, rect, wrapHorz, wrapVert )	return UI.base:LoadTexture( name, fileName, rect or Quat( 0, 0, 0, 0 ), wrapHorz or UI.TW_WRAP_CLAMP, wrapVert or UI.TW_WRAP_CLAMP ) end
function UI:UnloadTexture( handle, bForce )					UI.base:UnloadTexture( handle, bForce or false ) end
function UI:IsUiHandleDynamic( handle )						return UI.base:IsUiHandleDynamic( handle ) end
function UI:SpawnEffect( effectName, hOwner, effectPos )	return _G.UI_SpawnEffect( effectName, hOwner, effectPos ) end
function UI:DestroyEffect( effect )							_G.UI_DestroyEffect( effect ) end
function UI:SetLanguage( language )							return UI.base:SetLanguage( language ) end
function UI:GetLanguage()									return UI.base:GetLanguage() end
function UI:LoadEffect( resourceName, fileName ) 			return UI.base:LoadEffect( resourceName, fileName ) end
function UI:ValidateKeyboardFocus()							UI.base:ValidateKeyboardFocus() end
function UI:DumpWindows()									UI.base:DumpWindows() end
function UI:VideoPlay( fileName, looped )					if looped == nil then looped = false end; UI.base:VideoPlay( fileName, looped ) end
function UI:VideoIsPlaying()								return UI.base:VideoIsPlaying() end
function UI:VideoStop()										UI.base:VideoStop() end

--
function UI:MessageBox( caption, msg, mbStyle, sound )

	local result = UI.base:MessageBox( caption, msg, mbStyle )

	if sound == nil then
		sound = "sound/ui/msgBox"
	end

	if sound ~= "" then
		UI:PlayGlobalSound( sound )
	end
	
	return result

end


--
function UI:Key2VKey( key )

	if _G.IsEnterCancelButtonSwaped() then	
		key = UI:SwapPS3Key( key )
	end

	return key and UI.key2VKey[ key ]

end


--
function UI:SwapPS3Key( key )

	if key == UI.Keys.KEY_CELL_CROSS then
		return UI.Keys.KEY_CELL_CIRCLE

	elseif key == UI.Keys.KEY_CELL1_CROSS then
		return UI.Keys.KEY_CELL1_CIRCLE

	elseif key == UI.Keys.KEY_CELL_CIRCLE then
		return UI.Keys.KEY_CELL_CROSS

	elseif key == UI.Keys.KEY_CELL1_CIRCLE then
		return UI.Keys.KEY_CELL1_CROSS

	else
		return key
	end

end