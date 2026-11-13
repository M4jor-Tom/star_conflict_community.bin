-- ----------------------------------------------------------------------------
--
-- Workfile: pvechoicewnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- TODO: убрать разные режимы, оставить только матчмейкинг, переименовать в PveMatchmakingWnd

UI.PveChoiceWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PveChoiceWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "PveChoiceWnd",
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
				defName 			= "help_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "gmp_sel_win",
						layer		= "UI.PveChoiceWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "pvpMatchmaking_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title21",
						layer		= "UI.PveChoiceWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text123",
						layer		= "UI.PveChoiceWnd.layers.GAME_TYPE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text124",
						layer		= "UI.PveChoiceWnd.layers.REGION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text125",
						layer		= "UI.PveChoiceWnd.layers.TIME_AVERAGE_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text127",
						layer		= "UI.PveChoiceWnd.layers.TIME_AVERAGE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "timer_progr",
						layer		= "UI.PveChoiceWnd.layers.TIME_WAITING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title25",
						layer		= "UI.PveChoiceWnd.layers.TIME_WAITING_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text131",
						layer		= "UI.PveChoiceWnd.layers.INFO_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text132",
						layer		= "UI.PveChoiceWnd.layers.INFO_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn",
						wnd			= "UI.PveChoice_LeaveQueueBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn1",
						wnd			= "UI.PveChoice_CloseBtn_matchmaking",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn",
						wnd			= "UI.PveChoice_CloseBtn_choice",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "history",
						wnd			= "UI.PveChoice_PveMissionInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- GAME_TYPE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "contract_PVE" )
		}, 

		-- REGION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME_AVERAGE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "matchMaking_averageTime" ),
		},

		-- TIME_AVERAGE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME_WAITING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "pvpMatchmaking_timer",
			}}
		},

		-- TIME_WAITING_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- INFO_1
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "pveChoice_info1" )
		}, 

		-- INFO_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "pveChoice_info2" )
		}, 
	},

	children =
	{
		"UI.PveChoice_MapsListWnd",
		"UI.PveChoice_LeaveQueueBtn",
		"UI.PveChoice_CloseBtn_matchmaking",
		"UI.PveChoice_CloseBtn_choice",
		"UI.PveChoice_PveMissionInfoWnd",
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PveChoiceWnd:Setup( mode )

	if type( mode ) ~= "number" then
		sys.log( "UI.PveChoiceWnd:Setup()[ERROR]: invalid type of parameter #1 (\"mode\"); \"number\" expected, got \"%s\"", type( mode ) )
		return
	end

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.PveChoiceWnd:Setup()[ERROR]: invalid mode %d", mode )
		return
	end

	if mode == self.mode then
		return
	end

	self.mode = mode

	self.savedQueueInfo = nil
	self:HideLeaveQueueMsg()
	UI.PveChoice_PveMissionInfoWnd:UnlinkFromParent()

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.PveChoiceWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.PveChoiceWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	if result == 0 then
		self:OnQueueInfo()
	else
		if requestId == self.leaveQueueRequestId then
			UI:ShowMsgOnLeaveQueueError()
		end
	end

	if requestId == self.leaveQueueRequestId then
		self.leaveQueueRequestId = 0
	end

end


--
function UI.PveChoiceWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.PveChoiceWnd:OnHangarPrepareStateChanged()

	if not UI.bSavingGameState and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

		self:HideLeaveQueueMsg()

		if self.savedQueueInfo then

    		self.savedQueueInfo = nil

    		if self:IsOnScreen() then
				self:FullUpdate()
    		end

		end

	end

end


--
function UI.PveChoiceWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

    if not UI.serverData.playerCredits.raceRepChanged then
		return
	end

	UI.PveChoice_MapsListWnd:OnRaceRepChanged()

end


--
function UI.PveChoiceWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.leaveQueueRequestId = 0

end


--
function UI.PveChoiceWnd:IsMapEnqueued( levelName )

	if self.mode ~= self.modes.MATCHMAKING then
		return false
	end
	
	local queueInfo = self:GetQueueInfo()
	if queueInfo == nil or not queueInfo.inQueue then
		return false
	end

	if type( queueInfo.enqueuementParams ) == "table" and type( queueInfo.enqueuementParams.pve_mission ) == "string" and queueInfo.enqueuementParams.pve_mission ~= "" then

		local enqueuedLevelName = UI:GetPveMissionLevelName( queueInfo.enqueuementParams.pve_mission )
		if enqueuedLevelName == levelName then
			return true
		end		

	end

	return false

end


--
function UI.PveChoiceWnd:GetMode()

	return self.mode

end


--
function UI.PveChoiceWnd:GetQueueInfo()

	local queueInfo = nil
	
	if self.mode == self.modes.MATCHMAKING then
		queueInfo = self.savedQueueInfo or _G.MasterServer_GetQueueInfo()
	end
	
	return queueInfo
	
end


--
function UI.PveChoiceWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.PveChoice_MapsListWnd:OnAccountRankChanged()

end


--
function UI.PveChoiceWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )

	if not self:IsOnScreen() then
		return
	end

	UI.PveChoice_MapsListWnd:OnUnlimPveMissionLevelChanged( missionName, level )
	
end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PveChoiceWnd.layers =
{
    MAIN_EFFECT			= 0,
	WORK_EFFECT			= 1, 
    CAPTION				= 2, 
    GAME_TYPE			= 3, 
    REGION				= 4, 
    TIME_AVERAGE_LABEL	= 5, 
    TIME_AVERAGE_VAL	= 6, 
	TIME_WAITING_EFFECT	= 7, 
	TIME_WAITING_VAL	= 8,
	INFO_1				= 9,
	INFO_2				= 10,
}

UI.PveChoiceWnd.NUM_WAITING_TIME_ANIMS	= 12

UI.PveChoiceWnd.sounds =
{
	mapSlotClick		= UI.sounds.btnClick,
	showPveMissionInfo	= "sound/ui/btnClick",
	hidePveMissionInfo	= "sound/ui/MsgHide",
}

UI.PveChoiceWnd.effectInfo =
{
	work =
	{
		mapsListLocator	= "maps"
	}
}

UI.PveChoiceWnd.modes =
{
	CHOICE		= 1,
	MATCHMAKING = 2,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PveChoiceWnd.mode				= -1
UI.PveChoiceWnd.waitingTime			= -1
UI.PveChoiceWnd.savedQueueInfo		= nil
UI.PveChoiceWnd.hMsgLeaveQueue		= UI.INVALID_UI_HANDLE
UI.PveChoiceWnd.leaveQueueRequestId	= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PveChoiceWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()

    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.PveChoiceWnd:ResetContent()

	self.waitingTime = -1

	UI.PveChoice_MapsListWnd:Reset()

	UI.PveChoice_LeaveQueueBtn:UnlinkFromParent()
	UI.PveChoice_CloseBtn_matchmaking:UnlinkFromParent()
	UI.PveChoice_CloseBtn_choice:UnlinkFromParent()

	self:SetLayerVisible( false, self.layers.REGION )
	self:SetLayerVisible( false, self.layers.GAME_TYPE )
	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL )
	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL )
	self:SetLayerVisible( false, self.layers.TIME_WAITING_EFFECT )
	self:SetLayerVisible( false, self.layers.TIME_WAITING_VAL )
	self:SetLayerVisible( false, self.layers.INFO_1 )
	self:SetLayerVisible( false, self.layers.INFO_2 )

	self:SetText( "", self.layers.CAPTION )

end


--
function UI.PveChoiceWnd:FullUpdate()

	self:ResetContent()

	if self.mode == -1 then
		return
	end

	self:UpdateMaps()
	self:UpdateRegion()
	self:UpdateAvarageTime()
	self:UpdateLeaveQueueBtn()
	self:UpdateWaitingTime( true )
	self:UpdateMinimizeBtn()
	self:UpdateInfo1()
	self:UpdateInfo2()
	self:UpdateCloseBtn()
	self:UpdateCaption()
	self:UpdateGameType()

	self:RecalcLayout()

end


--
function UI.PveChoiceWnd:UpdateMaps()

	UI.PveChoice_MapsListWnd:Update()

end


--
function UI.PveChoiceWnd:UpdateRegion()

	if self.mode ~= self.modes.MATCHMAKING then
		self:SetLayerVisible( false, self.layers.REGION )
		return
	end

	self:SetLayerVisible( true, self.layers.REGION )

	local str = UI:GetStringByName( "matchMaking_rang_region" )
	local regionNameLocalized = ""

	local queueInfo = self:GetQueueInfo()
	if queueInfo and queueInfo.inQueue then

		regionNameLocalized = "unknown"

    	if type( queueInfo.enqueuementParams ) == "table" then

    		local region = queueInfo.enqueuementParams.region
    		if type( region ) == "number" then

    			local regionName = UI:Val2Key( _G.MasterServer.AuthRegion, region )
    			if regionName ~= "" then
    				
    				local regionNameStrId = string.format( "region_%s", regionName )
    				regionNameLocalized = UI:GetStringByName( regionNameStrId )

    			else
    				sys.log( "UI.PveChoiceWnd:UpdateRegion()[ERROR]: invalid region %d; one of the _G.MasterServer.AuthRegion expected", region )
    			end

    		else
    			sys.log( "UI.PveChoiceWnd:UpdateRegion()[ERROR]: invalid type of field \"enqueuementParams.region\"; \"number\" expected, got \"%s\"", type( region ) )
    		end

    	else
    		sys.log( "UI.PveChoiceWnd:UpdateRegion()[ERROR]: invalid type of field \"enqueuementParams\"; \"table\" expected, got \"%s\"", type( queueInfo.enqueuementParams ) )
    	end

	end

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$region%$", regionNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.PveChoiceWnd:UpdateRegion()[ERROR]: cannot find placeholder \"$region$\" in string \"matchMaking_rang_region\"" )
		str = string.format( "[INVALID STRING] Region: %s", regionNameLocalized )
	end

	self:SetText( str, self.layers.REGION )

end


--
function UI.PveChoiceWnd:UpdateAvarageTime()

	if self.mode ~= self.modes.MATCHMAKING then
		self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL )
		self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL )
		return
	end

	self:SetLayerVisible( true, self.layers.TIME_AVERAGE_LABEL )
	self:SetLayerVisible( true, self.layers.TIME_AVERAGE_VAL )

	local str = ""

	local queueInfo = self:GetQueueInfo()
	if queueInfo and queueInfo.inQueue then

		str = "unknown"

    	if type( queueInfo.averageTimeInQueue ) == "number" then
    		str = UI:Time2Str3( queueInfo.averageTimeInQueue )
    	else
    		sys.log( "UI.PveChoiceWnd:UpdateAvarageTime()[ERROR]: invalid type of field \"averageTimeInQueue\"; \"number\" expected, got \"%s\"", type( queueInfo.averageTimeInQueue ) )
    	end

	end

	self:SetText( str, self.layers.TIME_AVERAGE_VAL )

end


--
function UI.PveChoiceWnd:UpdateWaitingTime( bForceUpdate )

	if self.mode ~= self.modes.MATCHMAKING then
		self:SetLayerVisible( false, self.layers.TIME_WAITING_EFFECT )
		self:SetLayerVisible( false, self.layers.TIME_WAITING_VAL )
		return
	end

	self:SetLayerVisible( true, self.layers.TIME_WAITING_EFFECT )
	self:SetLayerVisible( true, self.layers.TIME_WAITING_VAL )

	local oldWaitingTime = self.waitingTime
	self.waitingTime = UI.MatchMakingWnd:IsActive() and UI.MatchMakingWnd:GetWaitingTime() or -1

	if not bForceUpdate and math.floor( self.waitingTime ) == math.floor( oldWaitingTime ) then
		return
	end

	-- текст

	local str = ""

	if self.waitingTime ~= -1 then
		local roundTime = math.floor( self.waitingTime )
		str = UI:Time2Str3( roundTime )
	end

	self:SetText( str, self.layers.TIME_WAITING_VAL )


	-- эффект

	local effect = UI:GetEffectFromLayer( self, self.layers.TIME_WAITING_EFFECT )
	if effect then

		local animName = ""

		if self.waitingTime == -1 or self.waitingTime == 0 then
			animName = "0"

		else

        	local curAnimName	= effect:GetCurAnimation()
        	local curAnimIdx	= tonumber( curAnimName )

        	if curAnimIdx then
				local nextAnimIdx = curAnimIdx % self.NUM_WAITING_TIME_ANIMS + 1
    			animName = tostring( nextAnimIdx )
        	end

		end

		effect:StartAnimation( animName )

	end	

end


--
function UI.PveChoiceWnd:UpdateLeaveQueueBtn()

	if self.mode ~= self.modes.MATCHMAKING then
		UI.PveChoice_LeaveQueueBtn:UnlinkFromParent()
		return
	end

	self:AddChild( UI.PveChoice_LeaveQueueBtn )

	local queueInfo = self:GetQueueInfo()
	local bEnable = queueInfo ~= nil and queueInfo.inQueue
	UI.PveChoice_LeaveQueueBtn:Enable( bEnable )

end


--
function UI.PveChoiceWnd:UpdateCaption()

	local str = ""

	if self.mode == self.modes.CHOICE then
		str = UI:GetStringByName( "pveChoice_caption_choice" )

	elseif self.mode == self.modes.MATCHMAKING then
		str = UI:GetStringByName( "pveChoice_caption_matchmaking" )

	else
		sys.log( "UI.PveChoiceWnd:UpdateCaption()[ERROR]: unhandled mode %d", self.mode )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.PveChoiceWnd:UpdateGameType()

	self:SetLayerVisible( self.mode == self.modes.MATCHMAKING, self.layers.GAME_TYPE )

end


--
function UI.PveChoiceWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.mode == self.modes.MATCHMAKING then
		self:UpdateWaitingTime( false )
	end

end


--
function UI.PveChoiceWnd:F_OnAfterShowOnScreen()

	UI.PveChoice_PveMissionInfoWnd:UnlinkFromParent()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

end


--
function UI.PveChoiceWnd:OnQueueInfo()

	if self.mode ~= self.modes.MATCHMAKING then
		return
	end

	if not UI.MatchMakingWnd:IsActive() or not UI.MatchMakingWnd:IsPve() then
		return
	end

	local queueInfo = _G.MasterServer_GetQueueInfo()

	if queueInfo.inQueue then
		self.savedQueueInfo = queueInfo
	end	

	if not queueInfo.inQueue then
		self:HideLeaveQueueMsg()
	end

	if self:IsOnScreen() then

		self:UpdateRegion()
		self:UpdateAvarageTime()
		self:UpdateLeaveQueueBtn()
		UI.PveChoice_MapsListWnd:OnQueueInfo()

	end

end


--
function UI.PveChoiceWnd:F_OnEventSaveUiState()
	
	if self.savedQueueInfo then

		UI.store.PveChoiceWnd =
		{
			mode				= self.mode,
            savedQueueInfo		= self.savedQueueInfo,
			leaveQueueRequestId	= self.leaveQueueRequestId,
		}

	end

	self:Hide()

end


--
function UI.PveChoiceWnd:F_OnEventRestoreUiState()

	if UI.store.PveChoiceWnd then

		self.mode					= UI.store.PveChoiceWnd.mode
		self.savedQueueInfo			= UI.store.PveChoiceWnd.savedQueueInfo
		self.leaveQueueRequestId	= UI.store.PveChoiceWnd.leaveQueueRequestId

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.PveChoiceWnd = nil

	end

end   


--
function UI.PveChoiceWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.PveChoice_LeaveQueueBtn then
		self:TryLeaveQueue()

	elseif wnd == UI.PveChoice_CloseBtn_matchmaking then

		UI.HangarWnd:HidePveChoiceWnd( true )

	elseif wnd == UI.PveChoice_CloseBtn_choice then

		UI.HangarWnd:HidePveChoiceWnd( false )
		UI.HangarWnd:ShowGameplayChoiceWnd( true )

	elseif UI:IsWndKindOf( wnd, "PveChoice_MapSlotWnd" ) then

		if self.mode == self.modes.CHOICE and not wnd:IsLocked() and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then
			self:EnterQueue( wnd )
			UI:PlayGlobalSound( self.sounds.mapSlotClick )
		end

	elseif UI:IsWndKindOf( wnd, "PveChoice_PveMissionInfoBtn" ) then

		local mapSlotWnd = wnd:GetParent()
		local missionName = mapSlotWnd:GetMissionForDesc()

		if missionName ~= "" then
			self:ShowPveMissionInfoWnd( missionName )
		else
			sys.log( "UI.PveChoiceWnd:F_OnMouseLButtonDown()[ERROR]: cannot find mission name for map desc" )
		end

	end

	return true

end


--
function UI.PveChoiceWnd:TryLeaveQueue()

	if self.mode ~= self.modes.MATCHMAKING then
		sys.log( "UI.PveChoiceWnd:TryLeaveQueue()[ERROR]: not MATCHMAKING mode" )
		return
	end

	if not UI.PveChoice_LeaveQueueBtn:IsChildOf( self ) or not UI.PveChoice_LeaveQueueBtn:IsEnabled() then
		return
	end

	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaveQueue = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )

end


--
function UI.PveChoiceWnd:DoLeaveQueue()

	if self.mode ~= self.modes.MATCHMAKING then
		sys.log( "UI.PveChoiceWnd:DoLeaveQueue()[ERROR]: not MATCHMAKING mode" )
		return
	end

	self.leaveQueueRequestId = _G.MasterServer_LeaveMatchmakingQueue()

	if self.leaveQueueRequestId == 0 then
		UI:ShowMsgOnLeaveQueueError()
	end

end


--
function UI.PveChoiceWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLeaveQueue then

		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoLeaveQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		end

	end

end


--
function UI.PveChoiceWnd:HideLeaveQueueMsg()

    if self.hMsgLeaveQueue == UI.INVALID_UI_HANDLE then
		return
	end

    UI:RemoveUiObj( self.hMsgLeaveQueue ) 
    self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

end


--
function UI.PveChoiceWnd:RecalcLayout()

	local mapsWidth		= UI.PveChoice_MapsListWnd:GetWidth()
	local mapsHeight	= UI.PveChoice_MapsListWnd:GetHeight()

	local orgPos		= UI:ZeroVec2()
	local workEffectPos	= UI:ZeroVec2()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		local mapsLocatorPos	= workEffect:GetObjPos( self.effectInfo.work.mapsListLocator )
		local mapsBaseSize		= UI.PveChoice_MapsListWnd:GetBaseSize()

		orgPos.x = mapsLocatorPos.x + mapsBaseSize.x * 0.5
		orgPos.y = mapsLocatorPos.y + mapsBaseSize.y * 0.5

		workEffectPos = workEffect:GetPos()

	end

	local maps_x = orgPos.x - mapsWidth * 0.5 + workEffectPos.x
	local maps_y = orgPos.y - mapsHeight * 0.5 + workEffectPos.y

	UI.PveChoice_MapsListWnd:SetPos( maps_x, maps_y )

end


--
function UI.PveChoiceWnd:UpdateMinimizeBtn()

	if self.mode == self.modes.MATCHMAKING then
		self:AddChild( UI.PveChoice_CloseBtn_matchmaking )
	else
		UI.PveChoice_CloseBtn_matchmaking:UnlinkFromParent()
	end

end


--
function UI.PveChoiceWnd:UpdateInfo1()

	self:SetLayerVisible( self.mode == self.modes.CHOICE, self.layers.INFO_1 )

end


--
function UI.PveChoiceWnd:UpdateInfo2()

	self:SetLayerVisible( self.mode == self.modes.CHOICE, self.layers.INFO_2 )
end


--
function UI.PveChoiceWnd:UpdateCloseBtn()

	if self.mode == self.modes.CHOICE then
		self:AddChild( UI.PveChoice_CloseBtn_choice )
	else
		UI.PveChoice_CloseBtn_choice:UnlinkFromParent()
	end

end


--
function UI.PveChoiceWnd:EnterQueue( mapSlotWnd )

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	local mapInfo = mapSlotWnd:GetMapInfo()
	
	local missionName = UI:GetPveMissionToLaunchForLevel( mapInfo.levelName, false, "easy" )
	if missionName ~= "" then

		UI.GameplayWnd:SetGameplay( { mmParams = { pve = 1, pve_mission = missionName, region = UI:GetGameRegion(), scheduled = true } } )
		UI.GameplayWnd:StartMatchMaking()

	else
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_VESSEL_RANK_INAPPROPRIATE_PVE" ), UI.MBS_OK )
	end

end


--
function UI.PveChoiceWnd:CheckShowMsgOnNotSquadLeader()

	if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then

		local errorName = UI:Val2Key( _G.MasterServer.MMJoinResult, _G.MasterServer.MMJoinResult.MMJR_NOT_SQUAD_LEADER )
		local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", errorName ) )

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), strErrorLocalized , UI.MBS_OK )

		return true

	end

	return false

end


--
function UI.PveChoiceWnd:ShowPveMissionInfoWnd( missionName )

	self:AddChild( UI.PveChoice_PveMissionInfoWnd )
	UI.PveChoice_PveMissionInfoWnd:UpdateForData( missionName )
	UI:PlayGlobalSound( self.sounds.showPveMissionInfo )

end


--
function UI.PveChoiceWnd:OnEscape()

	if UI.PveChoice_PveMissionInfoWnd:IsOnScreen( self ) then

		UI.PveChoice_PveMissionInfoWnd:UnlinkFromParent()
		UI:PlayGlobalSound( self.sounds.hidePveMissionInfo )

	else

		if self.mode == self.modes.CHOICE then

			UI.HangarWnd:HidePveChoiceWnd( false )
			UI.HangarWnd:ShowGameplayChoiceWnd( true )

		else
			UI.HangarWnd:HidePveChoiceWnd( true )
		end

	end

	return true

end


-- ----------------------------------------------------------------
-- UI.PveChoice_LeaveQueueBtn
-- ----------------------------------------------------------------

UI.PveChoice_LeaveQueueBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn9",

    	props =
    	{
    		name	= "PveChoice_LeaveQueueBtn"
    	}
	},

	textId = "matchMaking_cancel"
}

-- ----------------------------------------------------------------
-- UI.PveChoice_CloseBtn_choice
-- ----------------------------------------------------------------

UI.PveChoice_CloseBtn_choice =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn9",

    	props =
    	{
    		name	= "PveChoice_CloseBtn_choice"
    	}
	},

	textId = "close"
}

-- ----------------------------------------------------------------
-- UI.PveChoice_CloseBtn_matchmaking
-- ----------------------------------------------------------------

UI.PveChoice_CloseBtn_matchmaking =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "PveChoice_CloseBtn_matchmaking",
			selectSound	= UI.sounds.btnMouseOver,
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
    				defName 			= "pvpMatchmaking_closeBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		}
		}
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
    }
}

-- ----------------------------------------------------------------
-- UI.PveChoice_MapsListWnd
-- ----------------------------------------------------------------

UI.PveChoice_MapsListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PveChoice_MapsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "PveChoice_MapsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "pvpMatchmaking_mapsList",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PveChoice_MapsListWnd:Update()

	self:Reset()
	
	local mapsArr = {}
	local wavePveMissionName = UI:GetWavePveMissionName()
	
	if type( _G.PvE_Missions ) == "table" then

		for missionName, missionDef in pairs( _G.PvE_Missions ) do
			
			if not UI:IsPveMissionRaid( missionName ) and not UI:IsPveMissionDisabled( missionName ) and ( UI:GetPveMissionDifficulty( missionName ) == "easy" or missionName == wavePveMissionName ) then

				local minShipRank, maxShipRank = UI:GetPveMissionShipRanks( missionName )

				local mapInfo =
				{
					missionName	= missionName,
					levelName	= UI:GetPveMissionLevelName( missionName ),
					minShipRank	= minShipRank,
					maxShipRank	= maxShipRank,
					rank		= UI:GetPveMissionRank( missionName ),
					bEnqueued	= false,
					difficulty	= UI:GetPveMissionDifficulty( missionName ),
				}
				table.insert( mapsArr, mapInfo )

			end

		end

	else
		sys.log( "UI.PveChoice_MapsListWnd:Update()[ERROR]: invalid type of \"_G.PvE_Missions\"; \"table\" expected, got \"%s\"", type( _G.PvE_Missions ) )
	end


	local fnSort = function( mapInfo1, mapInfo2 )
	
		-- волновая пве - в конце списка
		local bIsWavePve1 = mapInfo1.missionName == wavePveMissionName
		local bIsWavePve2 = mapInfo2.missionName == wavePveMissionName
		if bIsWavePve1 ~= bIsWavePve2 then
			return not bIsWavePve1
		end

		if mapInfo1.minShipRank ~= mapInfo2.minShipRank then
			return mapInfo1.minShipRank < mapInfo2.minShipRank
		end
		
		if mapInfo1.rank ~= mapInfo2.rank then
			return mapInfo1.rank < mapInfo2.rank
		end

		if mapInfo1.levelName ~= mapInfo2.levelName then
			return mapInfo1.levelName < mapInfo2.levelName
		end
		
		return mapInfo1.missionName < mapInfo2.missionName

	end

	table.sort( mapsArr, fnSort )


	for idx, mapInfo in ipairs( mapsArr ) do
		local slotWnd = self:ObtainSlot()
		slotWnd:Setup( mapInfo )
	end

	self:RecalcLayout()

end


--
function UI.PveChoice_MapsListWnd:Reset()

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.slots = {}

end


--
function UI.PveChoice_MapsListWnd:OnRaceRepChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnRaceRepChanged()
	end

end


--
function UI.PveChoice_MapsListWnd:OnAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnAccountRankChanged()
	end

end


--
function UI.PveChoice_MapsListWnd:GetBaseSize()

	return self.baseSize

end


--
function UI.PveChoice_MapsListWnd:OnQueueInfo()

	for idx, slotWnd in pairs( self.slots ) do
	
		local mapInfo = slotWnd:GetMapInfo()
		mapInfo.bEnqueued = UI.PveChoiceWnd:IsMapEnqueued()
		
		slotWnd:OnQueueInfo()
		
	end

end


--
function UI.PveChoice_MapsListWnd:OnUnlimPveMissionLevelChanged( missionName, level )
	
	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetMapInfo().missionName == missionName then
			slotWnd:OnUnlimPveMissionLevelChanged()
			break
		end
	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PveChoice_MapsListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.PveChoice_MapsListWnd.effectInfo =
{
	main =
	{
		slotLocator11	= "slot_1_1",
		slotLocator12	= "slot_1_2",
		slotLocator21	= "slot_1_3",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PveChoice_MapsListWnd.allSlots		= {}
UI.PveChoice_MapsListWnd.slots			= {}

UI.PveChoice_MapsListWnd.baseSize		= Vec2( 0, 0 )
UI.PveChoice_MapsListWnd.slotSize		= Vec2( 0, 0 )
UI.PveChoice_MapsListWnd.slots_space_x	= 0
UI.PveChoice_MapsListWnd.slots_space_y	= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PveChoice_MapsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.PveChoice_MapsListWnd:InitSlots()

	for idx = 1, 15 do
		self:CreateSlot()
	end

end


--
function UI.PveChoice_MapsListWnd:ObtainSlot()

	local slotWnd = nil

	for idx, wnd in pairs( self.allSlots ) do

		if not wnd:IsChildOf( self ) then
			slotWnd = wnd	
			break
		end

	end

	if not slotWnd then
		slotWnd = self:CreateSlot()
	end

	self:AddChild( slotWnd )
	table.insert( self.slots, slotWnd )

	return slotWnd

end


--
function UI.PveChoice_MapsListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.PveChoice_MapSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.PveChoice_MapsListWnd:PrepareLayout()

	local slotWnd = self.allSlots[ 1 ]
	if slotWnd then

		self.slotSize.x = slotWnd:GetWidth()
		self.slotSize.y = slotWnd:GetHeight()

	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local slot11Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator11 )
		local slot12Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator12 )
		local slot21Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator21 )

		self.slots_space_x = slot12Pos.x - ( slot11Pos.x + self.slotSize.x )
		self.slots_space_y = slot21Pos.y - ( slot11Pos.y + self.slotSize.y )

		self.baseSize = mainEffect:GetObjSize( "self" )

	end

end


--
function UI.PveChoice_MapsListWnd:RecalcLayout()

	local numSlots = #self.slots
	if numSlots == 0 then
		return
	end

	local slotsByRow		= {}
	local maxRowSlots		= 0

	local row				= 1
	local firstRowSlotIdx	= 1

	while firstRowSlotIdx <= numSlots do

		local numRowSlots = self:DetectNumSlotsInRow( row )
		local lastRowSlotIdx = firstRowSlotIdx + numRowSlots - 1

		lastRowSlotIdx = math.min( lastRowSlotIdx, numSlots )
		numRowSlots = lastRowSlotIdx - firstRowSlotIdx + 1

		if numRowSlots > maxRowSlots then
			maxRowSlots = numRowSlots
		end

		local rowSlots = {}
		slotsByRow[ row ] = rowSlots

		for slotIdx = firstRowSlotIdx, lastRowSlotIdx do
			local slotWnd = self.slots[ slotIdx ]
			table.insert( rowSlots, slotWnd )
		end

		row = row + 1
		firstRowSlotIdx = lastRowSlotIdx + 1		

	end	


	local numRows = #slotsByRow

	local selfW = maxRowSlots * self.slotSize.x + ( maxRowSlots - 1 ) * self.slots_space_x
	local selfH = numRows * self.slotSize.y + ( numRows - 1 ) * self.slots_space_y

	self:SetWidth( selfW )
	self:SetHeight( selfH )


	local centerPos = UI:Vec2( selfW * 0.5, selfH * 0.5 )

	for row, rowSlots in pairs( slotsByRow ) do

		local numRowSlots = #rowSlots
		local row_w = numRowSlots * self.slotSize.x + ( numRowSlots - 1 ) * self.slots_space_x

		local row_x = centerPos.x - row_w * 0.5
		local row_y = ( row - 1 ) * ( self.slotSize.y + self.slots_space_y )

		for idx, slotWnd in pairs( rowSlots ) do

			local slot_x = row_x + ( idx - 1 ) * ( self.slotSize.x + self.slots_space_x )
			slotWnd:SetPos( slot_x, row_y )

		end

	end

end


--
function UI.PveChoice_MapsListWnd:DetectNumSlotsInRow( row )

	local DEFAULT_NUM_SLOTS	= 5

	local numSlots = DEFAULT_NUM_SLOTS

	if type( _G.PveMapsLayout ) == "table" then

		numSlots = _G.PveMapsLayout[ row ]

		if type( numSlots ) ~= "number" then
			sys.log( "UI.PveChoice_MapsListWnd:DetectNumSlotsInRow()[ERROR]: invalid type of \"_G.PveMapsLayout[%d]\"; \"number\" expected, got \"%s\"", row, type( numSlots ) )
			numSlots = DEFAULT_NUM_SLOTS
		end

	else
		sys.log( "UI.PveChoice_MapsListWnd:DetectNumSlotsInRow()[ERROR]: invalid type of \"_G.PveMapsLayout\"; \"table\" expected, got \"%s\"", type( _G.PveMapsLayout ) )
	end

	return numSlots

end


-- ----------------------------------------------------------------
-- UI.PveChoice_MapSlotWnd
-- ----------------------------------------------------------------

UI.PveChoice_MapSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PveChoice_MapSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PveChoice_MapSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "pvpMatchmaking_mapSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "disable",
						layer		= "UI.PveChoice_MapSlotWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock1",
						layer		= "UI.PveChoice_MapSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text130",
						layer		= "UI.PveChoice_MapSlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "text137",
						layer		= "UI.PveChoice_MapSlotWnd.layers.MISSION_LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sel",
						layer		= "UI.PveChoice_MapSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.PveChoice_MapSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "skull",
						layer		= "UI.PveChoice_MapSlotWnd.layers.DIFFICULTY_ICO",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- DARKENING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pvpMatchmaking_mapSlot_darkening",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "pvpMatchmaking_lock",
				defaultAnimation	= "idle",
			}}
		},

		-- REQUIREMENTS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- MISSION_LEVEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- DIFFICULTY_ICO
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "skull",
				defaultAnimation	= "idle",
			}}
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pveChoice_mapSlot_sel",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pveChoice_mapSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PveChoice_MapSlotWnd:Setup( mapInfo )

	self:Reset()

	self.mapInfo = mapInfo
	self:FullUpdate()

end


--
function UI.PveChoice_MapSlotWnd:Reset()

	self.mapInfo		= nil
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	self:SetLayerVisible( false, self.layers.REQUIREMENTS )
	self:SetLayerVisible( false, self.layers.DARKENING_EFFECT )
	self:SetLayerVisible( false, self.layers.DIFFICULTY_ICO )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )
	self:SetLayerVisible( false, self.layers.MISSION_LEVEL )

	self:SetMouseOver( false )
	
	self.infoBtn:UnlinkFromParent()

end


--
function UI.PveChoice_MapSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.PveChoice_MapSlotWnd:OnRaceRepChanged()
	
	self:UpdateTooltip()

	if UI:GetCurTooltipTarget() == self then

		local tooltipWnd = UI:GetCurTooltip()
		if tooltipWnd then
			tooltipWnd:Setup( self.tooltipData, true )
		end

	end

end


--
function UI.PveChoice_MapSlotWnd:OnAccountRankChanged()

	self:UpdateLockAndRequirements()
	self:UpdateDarkening()
	self:UpdateDifficultyIco()
	self:UpdateMouseOver()
	self:UpdateInfoBtn()
	self:UpdateMissionLevel()

end


--
function UI.PveChoice_MapSlotWnd:OnQueueInfo()
	
	self:UpdateSelection()

end


--
function UI.PveChoice_MapSlotWnd:OnUnlimPveMissionLevelChanged( missionName, level )

	self:UpdateMissionLevel()
	
end


--
function UI.PveChoice_MapSlotWnd:IsLocked()

	if self:IsLockedByAccountRank() then
		return true
	end	
	
	return false

end


--
function UI.PveChoice_MapSlotWnd:IsLockedByAccountRank()

	return self.mapInfo ~= nil and self.mapInfo.rank > UI:GetPlayerAccountRank()

end


--
function UI.PveChoice_MapSlotWnd:GetMapInfo()

	return self.mapInfo

end


--
function UI.PveChoice_MapSlotWnd:GetMissionForDesc()

	local missionName = ""

	local missions = UI:GetPveMissionsForLevel( self.mapInfo.levelName, false, true )

	if missions[ 1 ] then
		missionName = missions[ 1 ]
	end

	return missionName

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PveChoice_MapSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	DARKENING_EFFECT	= 1,
    LOCK_EFFECT			= 2,
    REQUIREMENTS		= 3,
	MISSION_LEVEL		= 4,
	DIFFICULTY_ICO		= 5,
	SEL_EFFECT			= 6,
	MOUSE_OVER_EFFECT	= 7,
}

UI.PveChoice_MapSlotWnd.effectInfo =
{
	main =
	{
		infoBtnLocator	= "info_icon",
	},

	ico =
	{
		icoSpriteName	= "ico",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PveChoice_MapSlotWnd.mapInfo		= nil
UI.PveChoice_MapSlotWnd.tooltipData	= nil
UI.PveChoice_MapSlotWnd.infoBtn		= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PveChoice_MapSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.PveChoice_MapSlotWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.infoBtn = UI:CreateChildWnd( self, UI.PveChoice_PveMissionInfoBtn, "" )
	UI:AddChildAndLink( self, self.infoBtn, mainEffect, self.effectInfo.main.infoBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.PveChoice_MapSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateLockAndRequirements()
	self:UpdateDarkening()
	self:UpdateTooltip()
	self:UpdateDifficultyIco()
	self:UpdateSelection()
	self:UpdateMouseOver()
	self:UpdateInfoBtn()
	self:UpdateMissionLevel()

end


--
function UI.PveChoice_MapSlotWnd:UpdateIco()

	local hTex = UI:GetMapIco( self.mapInfo.levelName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end
	
end


--
function UI.PveChoice_MapSlotWnd:UpdateLockAndRequirements()

	local bNeedLock			= false
	local strRequirements	= ""
	
	local bRankFit = self.mapInfo == nil or self.mapInfo.rank <= UI:GetPlayerAccountRank()
	if not bRankFit then
	
		bNeedLock = true
		strRequirements = tostring( self.mapInfo.rank )
		
	end
	
	self:SetLayerVisible( bNeedLock, self.layers.LOCK_EFFECT )
	
	if strRequirements ~= "" then
		self:SetLayerVisible( true, self.layers.REQUIREMENTS )
		self:SetText( strRequirements, self.layers.REQUIREMENTS )
	else
		self:SetLayerVisible( false, self.layers.REQUIREMENTS )
	end
	
end


--
function UI.PveChoice_MapSlotWnd:UpdateDarkening()

	self:SetLayerVisible( self:IsLocked(), self.layers.DARKENING_EFFECT )

end


--
function UI.PveChoice_MapSlotWnd:UpdateTooltip()

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE

	self.tooltipData.caption = UI:GetLevelLocalizedName( self.mapInfo.levelName )
	self.tooltipData.text = ""


	-- текст
	
	-- описание
	local strDesc = UI:GetLevelDescShort( self.mapInfo.levelName )
	
	if strDesc ~= "" then
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "||" or "", strDesc )
	end

	-- ранги

	local strRanksVal = string.format( "%d-%d", self.mapInfo.minShipRank, self.mapInfo.maxShipRank )

	local strRanks = UI:GetStringByName( "pve_map_mission_ranks" )

	local numSubst = 0
	strRanks, numSubst = string.gsub( strRanks, "%$ranks%$", strRanksVal )

	if numSubst == 0 then
		sys.log( "UI.PveChoice_MapSlotWnd:UpdateTooltip()[ERROR]: cannot find placeholder \"$ranks$\" in string \"pve_map_mission_ranks\"" )
		strRanks = string.format( "[INVALID STRING] Ranks: %s", strRanksVal )
	end
	
	if strRanks ~= "" then
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "||" or "", strRanks )
	end

end


--
function UI.PveChoice_MapSlotWnd:UpdateDifficultyIco()
	
	local bVisible = ( self.mapInfo.difficulty == "hard" or self.mapInfo.difficulty == "wave" ) and not self:IsLockedByAccountRank()
	self:SetLayerVisible( bVisible, self.layers.DIFFICULTY_ICO )
	
end


--
function UI.PveChoice_MapSlotWnd:UpdateSelection()

	self:SetLayerVisible( self.mapInfo.bEnqueued, self.layers.SEL_EFFECT )

end


--
function UI.PveChoice_MapSlotWnd:UpdateInfoBtn()

	local bVisible = not self:IsLockedByAccountRank()

	if bVisible then
		self:AddChild( self.infoBtn )
	else
		self.infoBtn:UnlinkFromParent()
	end
	
end


--
function UI.PveChoice_MapSlotWnd:UpdateMissionLevel()

	if self.mapInfo.difficulty == "easy" and not self:IsLockedByAccountRank() then
	
		self:SetLayerVisible( true, self.layers.MISSION_LEVEL )

		local level = _G.MasterServer_UnlimPveGetMissionLevel( self.mapInfo.missionName )
		local strLevel = tostring( level )
		self:SetText( strLevel, self.layers.MISSION_LEVEL )
		
	else
		self:SetLayerVisible( false, self.layers.MISSION_LEVEL )
	end

end


--
function UI.PveChoice_MapSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.PveChoice_MapSlotWnd:UpdateMouseOver()

	local bMouseOver = false	
	local bInMatchmaking = self:IsChildOf( UI.PveChoiceWnd ) and UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.CHOICE
	
	if not bInMatchmaking and not self:IsLocked() then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self

	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.PveChoice_MapSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.PveChoice_MapSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.PveChoice_MapSlotWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ---------------------------------------------------------------------
-- UI.PveChoice_PveMissionInfoBtn
-- ---------------------------------------------------------------------

UI.PveChoice_PveMissionInfoBtn = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.PveChoice_PveMissionInfoBtn.def = 
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "PveChoice_PveMissionInfoBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
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
				defName				= "gameplay_scenario_info",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.PveChoice_PveMissionInfoBtn:GetTooltipData()

	return self.tooltipData

end

-- --------------------------------
-- const
-- --------------------------------

UI.PveChoice_PveMissionInfoBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "over",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "over",
	},
}

UI.PveChoice_PveMissionInfoBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "tooltip_gameplays_scenario_info_caption" ),
	text		= UI:GetStringByName( "tooltip_gameplays_scenario_info_text" ),
}

-- ---------------------------------------------------------------------
-- UI.PveChoice_PveMissionInfoWnd
-- ---------------------------------------------------------------------

UI.PveChoice_PveMissionInfoWnd = 
{
	def =
	{
		className	= "Wnd",
		prototype	= "PveMissionInfoWnd",

		props =
		{
			name	= "PveChoice_PveMissionInfoWnd",
		},
	}
}