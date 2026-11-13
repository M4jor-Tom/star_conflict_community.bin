-- ----------------------------------------------------------------------------------
-- PveMissionLevelWowWnd
-- ----------------------------------------------------------------------------------

UI.PveMissionLevelWowWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.PveMissionLevelWowWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "PveMissionLevelWowWnd",
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
				defName 			= "achievement_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "acheiv",
						layer		= "UI.PveMissionLevelWowWnd.layers.WORK_EFFECT",
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
				defName 			= "pveMissionLevelWowWnd_work",	-- tODO: нужен свой эффект
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_name",
						layer		= "UI.PveMissionLevelWowWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_ETEXT,

			formatFlags	 	= FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			
			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.PveMissionLevelWowWnd.layers.WORK_EFFECT",
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.PveMissionLevelWowWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )
	
	self:ShowMissionLevel( missionName, level )
	
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.PveMissionLevelWowWnd.layers =
{
	MAIN_EFFECT		= 0,
	WORK_EFFECT		= 1,
	TEXT			= 2,
}

UI.PveMissionLevelWowWnd.incompatibleWindows =
{
	"LoginWnd",
	"LoadingScreen_game",
	"LoadingScreen_sys",
	"EffectTreePreviewWnd",
	"AchievementWnd",
	"ExpUpWnd",
}

UI.PveMissionLevelWowWnd.sounds =
{
	show = "sound/ui/achievement"
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.PveMissionLevelWowWnd.missionName	= ""
UI.PveMissionLevelWowWnd.level			= 1
UI.PveMissionLevelWowWnd.queue			= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.PveMissionLevelWowWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.PveMissionLevelWowWnd:Reset()

	self:ResetCurMissionLevel()
	self.queue = {}
	self:Hide()

end


--
function UI.PveMissionLevelWowWnd:ResetCurMissionLevel()

	self:SetText( "", self.layers.TEXT )

	self.missionName	= ""
	self.level			= 1

end


--
function UI.PveMissionLevelWowWnd:ShowMissionLevel( missionName, level )

	if self:CanShowNewMissionLevel() then
		self:ShowMissionLevelInternal( missionName, level )
	else
		self:EnqueueMissionLevel( missionName, level )
	end

end


--
function UI.PveMissionLevelWowWnd:CanShowNewMissionLevel()

	if next( self.queue ) then
		return false
	end

	if self.missionName ~= "" then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.PveMissionLevelWowWnd:CanShowMissionLevelFromQueue()

	if not next( self.queue ) then
		sys.log( "UI.PveMissionLevelWowWnd:CanShowMissionLevelFromQueue()[ERROR]: empty queue" )
		return false
	end

	if self.missionName ~= "" then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.PveMissionLevelWowWnd:IsCompatibleEnvironment()

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
function UI.PveMissionLevelWowWnd:ShowMissionLevelInternal( missionName, level )

	self:ResetCurMissionLevel()

	self:Show()
	
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:RestartAnimation()
	end

	self.missionName = missionName
	self.level = level
	self:UpdateForCurMissionLevel()

	UI:PlayGlobalSound( self.sounds.show )

end


--
function UI.PveMissionLevelWowWnd:EnqueueMissionLevel( missionName, level )

	table.insert( self.queue, { missionName = missionName, level = level } )

end


--
function UI.PveMissionLevelWowWnd:CheckQueue()

	if not next( self.queue ) then
		return false
	end

	if not self:CanShowMissionLevelFromQueue() then
		return false
	end

	local info = table.remove( self.queue, 1 )
	self:ShowMissionLevelInternal( info.missionName, info.level )

	return true

end


--
function UI.PveMissionLevelWowWnd:F_OnEffectAnimationEnded( effect, animName )

	self:ResetCurMissionLevel()

	self:CheckQueue()	

	if self.missionName == "" then
		self:Hide()
	end

end


--
function UI.PveMissionLevelWowWnd:UpdateForCurMissionLevel()
	
	local strMissionLocalizedName = UI:PveMission2Str( self.missionName )
	
	local tSubst =
	{
		mission	= strMissionLocalizedName,
		level	= tostring( self.level )
	}
	
	local str = UI:GetStringByName( "ntf_UNLIM_PVE_MISSION_LEVEL_UP" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$([%w_]+)%$", tSubst )
	
	if numSubst ~= 2 then
		sys.log( "UI.PveMissionLevelWowWnd:UpdateForCurMissionLevel()[ERROR]: invalid placeholders in string 'ntf_UNLIM_PVE_MISSION_LEVEL_UP'; '$mission$' and '$level$' expected" )
		str = string.format( "[INVALID STRING] Mission %s level %d", strMissionLocalizedName, self.level )
	end
	
	self:SetText( str, self.layers.TEXT )
	
end


--
function UI.PveMissionLevelWowWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.PveMissionLevelWowWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.PveMissionLevelWowWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.PveMissionLevelWowWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.PveMissionLevelWowWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:UpdateVisibility()

end


--
function UI.PveMissionLevelWowWnd:UpdateVisibility()

	local bNeedVisible = false

	if self.missionName ~= "" then
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
function UI.PveMissionLevelWowWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.PveMissionLevelWowWnd:F_OnEventSaveUiState()

	UI.store.PveMissionLevelWowWnd =
	{
		missionName	= self.missionName,
		level		= self.level,
		queue		= self.queue,
	}

end


--
function UI.PveMissionLevelWowWnd:F_OnEventRestoreUiState()

	if UI.store.PveMissionLevelWowWnd then
	
		self.missionName	= UI.store.PveMissionLevelWowWnd.missionName
		self.level			= UI.store.PveMissionLevelWowWnd.level
		self.queue			= UI.store.PveMissionLevelWowWnd.queue

		if self.missionName ~= "" then
			self:UpdateForCurMissionLevel()
		end

		self:UpdateVisibility()

		UI.store.PveMissionLevelWowWnd = nil

	end

end