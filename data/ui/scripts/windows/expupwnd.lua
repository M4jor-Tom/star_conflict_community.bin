UI.ExpUpWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ExpUpWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "ExpUpWnd",
		style			= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "expUp_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "acheiv",
						layer		= "UI.ExpUpWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "expUp_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ExpUpWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags	 	= FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ExpUpWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	if result ~= 0 then
		return
	end

	if newExp <= oldExp then
		return
	end
	
	self:ShowExp( newExp - oldExp )
	
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.ExpUpWnd.layers =
{
	MAIN_EFFECT		= 0,
	WORK_EFFECT		= 1,
	TEXT			= 2,
}

UI.ExpUpWnd.incompatibleWindows =
{
	"LoginWnd",
	"LoadingScreen_game",
	"LoadingScreen_sys",
	"EffectTreePreviewWnd",
	"AchievementWnd",
	"PveMissionLevelWowWnd",
}

UI.ExpUpWnd.sounds =
{
	showExp = "sound/ui/achievement"
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ExpUpWnd.curExp	= 0
UI.ExpUpWnd.queue	= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ExpUpWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.ExpUpWnd:Reset()

	self:ResetCurExp()
	self.queue = {}
	self:Hide()

end


--
function UI.ExpUpWnd:ResetCurExp()

	self:SetText( "", self.layers.TEXT )

	self.curExp = 0

end


--
function UI.ExpUpWnd:ShowExp( exp )

	if self:CanShowNewExp() then
		self:ShowExpInternal( exp )
	else
		self:EnqueueExp( exp )
	end

end


--
function UI.ExpUpWnd:CanShowNewExp()

	if next( self.queue ) then
		return false
	end

	if self.curExp ~= 0 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.ExpUpWnd:CanShowExpFromQueue()

	if not next( self.queue ) then
		sys.log( "UI.ExpUpWnd:CanShowExpFromQueue()[ERROR]: empty queue" )
		return false
	end

	if self.curExp ~= 0 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.ExpUpWnd:IsCompatibleEnvironment()

	for idx, wndName in pairs( self.incompatibleWindows ) do
		local wnd = UI[ wndName ]
		if wnd and wnd:IsOnScreen() then
			return false
		end
	end

	if UI.HangarWnd and UI.HangarWnd.w and UI.HangarWnd:IsOnScreen() then
		return true
	end

	if UI.HudWnd and UI.HudWnd.w and UI.HudWnd:IsOnScreen() and UI.HudWnd:GetMode() ~= UI.HudWnd.modes.USER_HIDE then
		return true
	end

	return false

end


--
function UI.ExpUpWnd:ShowExpInternal( exp )

	self:ResetCurExp()

	self:Show()
	
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:RestartAnimation()
	end

	self.curExp = exp
	self:UpdateForCurExp()

	UI:PlayGlobalSound( self.sounds.showExp )

end


--
function UI.ExpUpWnd:EnqueueExp( exp )

	table.insert( self.queue, exp )

end


--
function UI.ExpUpWnd:CheckQueue()

	if not next( self.queue ) then
		return false
	end

	if not self:CanShowExpFromQueue() then
		return false
	end

	local exp = table.remove( self.queue, 1 )
	self:ShowExpInternal( exp )

	return true

end


--
function UI.ExpUpWnd:F_OnEffectAnimationEnded( effect, animName )

	self:ResetCurExp()

	self:CheckQueue()	

	if self.curExp == 0 then
		self:Hide()
	end

end


--
function UI.ExpUpWnd:UpdateForCurExp()

	local str = UI:GetStringByName( "expUpNotify" )
	
	local numSubst = 0	
	str, numSubst = string.gsub( str, "%$val%$", tostring( self.curExp ) )
	
	if numSubst == 0 then
		sys.log( "UI.ExpUpWnd:UpdateForCurExp()[ERROR]: cannot find placeholder \"$val$\" in string \"expUpNotify\"" )
		str = string.format( "[INVALID STRING] Exp got: +%d", self.curExp )
	end
	
	self:SetText( str, self.layers.TEXT )
	
end


--
function UI.ExpUpWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.ExpUpWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.ExpUpWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.ExpUpWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.ExpUpWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:UpdateVisibility()

end


--
function UI.ExpUpWnd:UpdateVisibility()

	local bNeedVisible = false

	if self.curExp ~= 0 then
		bNeedVisible = self:IsCompatibleEnvironment()

	elseif self:CheckQueue() then
		bNeedVisible = true
	end

	local bVisible = self:IsOnScreen()

	if bVisible and not bNeedVisible then
		self:Hide()
	elseif not bVisible and bNeedVisible then
		self:Show()
	end

end


-- вызывается из UI.Root, нет собственной подписки
function UI.ExpUpWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.ExpUpWnd:F_OnEventSaveUiState()

	UI.store.ExpUpWnd =
	{
		curExp	= self.curExp,
		queue	= self.queue,
	}

end


--
function UI.ExpUpWnd:F_OnEventRestoreUiState()

	if UI.store.ExpUpWnd then
	
		self.curExp	= UI.store.ExpUpWnd.curExp
		self.queue	= UI.store.ExpUpWnd.queue

		if self.curExp ~= 0 then
			self:UpdateForCurExp()
		end

		self:UpdateVisibility()

		UI.store.ExpUpWnd = nil

	end

end