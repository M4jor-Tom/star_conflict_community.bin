-- ----------------------------------------------------------------------------
--
-- Workfile: arenawnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ArenaWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

--
UI.ArenaWnd.layers =
{
    MAIN_EFFECT					= 0,
    WORK_EFFECT					= 1, 
    CAPTION						= 2, 
	NO_TEAM_WORK_EFFECT			= 3, 
	DESC						= 4, 
	TEAM_WORK_EFFECT			= 5, 
	TEAM_NAME_AND_PLAYERS		= 6, 
    WAIT_EFFECT					= 7, 
    WAIT_TEXT					= 8, 
	TIME_MM_WAITING_EFFECT		= 9, 
	TIME_MM_WAITING_PB_EFFECT	= 10,
	TIME_MM_WAITING_VAL			= 11,
	TIME_MM_WAITING_LABEL		= 12,
}


--
UI.ArenaWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "ArenaWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.ArenaWnd.layers.WAIT_EFFECT,

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
						layer		= "UI.ArenaWnd.layers.WORK_EFFECT",
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
				defName 			= "arena_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title38",
						layer		= "UI.ArenaWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "noteam",
						layer		= "UI.ArenaWnd.layers.NO_TEAM_WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "noteam",
						layer		= "UI.ArenaWnd.layers.TEAM_WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.Arena_LeaderboardsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",
						wnd			= "UI.Arena_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "close_btn",
						wnd			= "UI.Arena_MinimizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",
						wnd			= "UI.Arena_LeaveQueueBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Arena_CreateTeamBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Arena_StartMatchmakingBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ArenaWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						layer		= "UI.ArenaWnd.layers.TIME_MM_WAITING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- NO_TEAM_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "arena_noTeamWork",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "description7",
						layer		= "UI.ArenaWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "top_1",
						wnd			= "UI.Arena_TopPlace1Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "top_2",
						wnd			= "UI.Arena_TopPlace2Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "top_3",
						wnd			= "UI.Arena_TopPlace3Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "arena_desc" ),
		}, 

		-- TEAM_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "arena_teamWork",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "description7",
						layer		= "UI.ArenaWnd.layers.TEAM_NAME_AND_PLAYERS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fights",
						wnd			= "UI.Arena_BattlesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "wins",
						wnd			= "UI.Arena_WinsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "pl_list",
						wnd			= "UI.Arena_PlayersListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "top_3",
						wnd			= "UI.Arena_MyPlaceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEAM_NAME_AND_PLAYERS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.ArenaWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		},

		-- TIME_MM_WAITING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "arena_matchmakingTimer",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "timer_progr",
						layer		= "UI.ArenaWnd.layers.TIME_MM_WAITING_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title25",
						layer		= "UI.ArenaWnd.layers.TIME_MM_WAITING_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "pasted__title30",
						layer		= "UI.ArenaWnd.layers.TIME_MM_WAITING_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIME_MM_WAITING_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "pvpMatchmaking_timer",
			}}
		},

		-- TIME_MM_WAITING_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TIME_MM_WAITING_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "arena_searchingGame" ),
		}, 
	},

	children =
	{
		"UI.Arena_InfoIcoWnd",
        "UI.Arena_LeaderboardsBtn",
        "UI.Arena_CloseBtn",
        "UI.Arena_MinimizeBtn",
        "UI.Arena_LeaveQueueBtn",
        "UI.Arena_CreateTeamBtn",
		"UI.Arena_BattlesWnd",
		"UI.Arena_WinsWnd",
		"UI.Arena_PlayersListWnd",
        "UI.Arena_TopPlace1Wnd",
        "UI.Arena_TopPlace2Wnd",
        "UI.Arena_TopPlace3Wnd",
        "UI.Arena_MyPlaceWnd",
		"UI.Arena_StartMatchmakingBtn",
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.ArenaWnd:Setup( bMatchmaking )

	if type( bMatchmaking ) ~= "boolean" then
		sys.log( "UI.ArenaWnd:Setup()[ERROR]: invalid type of parameter #1 (\"bMatchmaking\"); \"boolean\" expected, got \"%s\"", type( bMatchmaking ) )
		return
	end

	if bMatchmaking and not UI.Arena:IsInTeam() then
		sys.log( "UI.ArenaWnd:Setup()[ERROR]: not in team" )
		return
	end

	local mode = -1

	if bMatchmaking then
		mode = self.modes.MATCHMAKING
	else
		mode = UI.Arena:IsInTeam() and self.modes.TEAM or self.modes.NO_TEAM
	end

	if mode == self.mode then
		return
	end

	local oldMode = self.mode
	self.mode = mode

	self:ValidateLeaderboardsStuff( oldMode )

	self.savedQueueInfo = nil
	self:HideLeaveQueueMsg()

	if self:IsOnScreen() then
		self:UpdateContent()
	end

end


--
function UI.ArenaWnd:GetMode()

	return self.mode

end


--
function UI.ArenaWnd:F_OnEventArenaChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateMode()
	self:ValidateLeaderboardsStuff( self.mode )
	self:UpdateContent()

end


--
function UI.ArenaWnd:F_OnEventArenaStatsChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateBattles()
	self:UpdateWins()

end


--
function UI.ArenaWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:ValidateLeaderboardsStuff( self.mode )
	self:UpdateMyPlace()

end


--
function UI.ArenaWnd:OnSquadDataChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStartMatchmakingBtn()

end


--
function UI.ArenaWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if UI.Arena_PlayersListWnd:IsChildOf( self ) then

		local slotWnd = self:GetPlayerSlotByUid( uid )
		if slotWnd then

			slotWnd:OnNameChanged()
			self:ResortPlayersList()

		end

	end

end


--
function UI.ArenaWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if UI.Arena_PlayersListWnd:IsChildOf( self ) then

    	for recordIdx = 1, UI.Arena_PlayersListWnd:GetNumRecords() do

    		local rowWnd = UI.Arena_PlayersListWnd:GetButtonForRecord( recordIdx )
    		if rowWnd then

    			for slotIdx = 1, rowWnd.NUM_SLOTS do

    				local slotWnd = rowWnd:GetSlotWnd( slotIdx )
    				if slotWnd then

    					local data = slotWnd:GetData()
    					if data then

							local playerCid = UI:GetPlayerClanByUid( data.playerInfo.uid )
							if playerCid == cid then
    							slotWnd:OnClanNameChanged()
							end

    					end

    				end

    			end

    		end

    	end

	end

end


--
function UI.ArenaWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if UI.Arena_PlayersListWnd:IsChildOf( self ) then

		if field == _G.MasterServer.UserProfileField.UPF_STATE then

			local slotWnd = self:GetPlayerSlotByUid( uid )
			if slotWnd then

				local slotData = slotWnd:GetData()
				slotData.bOnLine = self:IsStatusOnline( slotData.playerInfo.state )
				slotWnd:OnStatusChanged()

				self:ResortPlayersList()

			end

		elseif field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

			local slotWnd = self:GetPlayerSlotByUid( uid )
			if slotWnd then

				slotWnd:OnClanChanged()

			end

		end		

	end

end


--
function UI.ArenaWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.ArenaWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

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
function UI.ArenaWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.ArenaWnd:OnHangarPrepareStateChanged()

	if not UI.bSavingGameState and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

		self:HideLeaveQueueMsg()

		if self.savedQueueInfo then

    		self.savedQueueInfo = nil

		end

	end

	if self:IsOnScreen() then
		self:UpdateContent()
	end

end


--
function UI.ArenaWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.leaveQueueRequestId		= 0
	self.topLeaderboardRequestId	= nil
	self.savedTopLeaderboardData	= nil
	self.myLeaderboardRequestId		= nil
	self.savedMyLeaderboardData		= nil

end


--
function UI.ArenaWnd:OnRequestLeaderboardError( data, result )

	if self.topLeaderboardRequestId ~= nil and self.topLeaderboardRequestId == data.internalRequestId then

		self.topLeaderboardRequestId = nil

		if self:IsOnScreen() then
			self:ShowMsgOnLeaderboardError( result )
		end

	elseif self.myLeaderboardRequestId ~= nil and self.myLeaderboardRequestId == data.internalRequestId then

		self.myLeaderboardRequestId = nil

		if self:IsOnScreen() then
			self:ShowMsgOnLeaderboardError( result )
		end

	end

end


--
function UI.ArenaWnd:OnRequestLeaderboard( data )

	if self.topLeaderboardRequestId ~= nil and self.topLeaderboardRequestId == data.internalRequestId then

		self.topLeaderboardRequestId = nil
		self.savedTopLeaderboardData = data

		if self:IsOnScreen() then
			self:UpdateTopPlaces()
		end

	elseif self.myLeaderboardRequestId ~= nil and self.myLeaderboardRequestId == data.internalRequestId then

		self.myLeaderboardRequestId = nil

		local bMyLeaderboard = data.records and data.records[ 1 ] and data.records[ 1 ].e == UI.Arena:GetTeamId()
		if bMyLeaderboard then

    		self.savedMyLeaderboardData = data

    		if self:IsOnScreen() then
    			self:UpdateMyPlace()
    		end

		end

	end

end


--
function UI.ArenaWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, ltid, teamName )

	if not self:IsOnScreen() then
		return
	end

	for idx, placeWnd in pairs( self.topPlaceWnds ) do
		if placeWnd:IsChildOf( self ) then

			local data = placeWnd:GetData()
			if data and data.team == ltid then
				placeWnd:OnTeamNameChanged()
			end

		end
	end

	if UI.Arena:IsInTeam() and UI.Arena:GetTeamId() == ltid and self:IsLayerVisible( self.layers.TEAM_NAME_AND_PLAYERS ) then
		self:UpdateTeamNameAndPlayers()
	end

end


--
function UI.ArenaWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self.mode ~= self.modes.TEAM then
		self:UpdateStartMatchmakingBtn()
	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.ArenaWnd.modes =
{
	TEAM		= 1,
	NO_TEAM		= 2,
	MATCHMAKING	= 3,
}

UI.ArenaWnd.effectInfo =
{
	team =
	{
		numPlayersColorLocator	= "description_color"
	}
}

UI.ArenaWnd.sounds =
{
	cancelInvite 		= UI.sounds.btnClick,
	startMatchmaking	= UI.sounds.btnClick,
}

UI.ArenaWnd.NUM_WAITING_TIME_ANIMS		= 12
UI.ArenaWnd.LEADERBOARD_REQUEST_DELAY	= 60

UI.ArenaWnd.matchmakingBtnTextTypes =
{
	START				= 1,
	ACTIVATION_TIMER	= 2,
	DISABLED			= 3,
	BANNED				= 4,
}

UI.ArenaWnd.strBanned = UI:GetStringByName( "arena_teamBanned" )

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ArenaWnd.catpionMetaText				= nil
UI.ArenaWnd.teamNameAndPlayersMetaText	= nil
UI.ArenaWnd.mode						= -1
UI.ArenaWnd.numPlayersColor				= UI.WHITE_COLOR
UI.ArenaWnd.topPlaceWnds				= {}
UI.ArenaWnd.mmWaitingTime				= -1
UI.ArenaWnd.savedQueueInfo				= nil
UI.ArenaWnd.hMsgLeaveQueue				= UI.INVALID_UI_HANDLE
UI.ArenaWnd.leaveQueueRequestId			= 0
UI.ArenaWnd.topLeaderboardRequestId		= nil
UI.ArenaWnd.savedTopLeaderboardData		= nil
UI.ArenaWnd.topLeaderboardRequestTimer	= -1
UI.ArenaWnd.myLeaderboardRequestId		= nil
UI.ArenaWnd.savedMyLeaderboardData		= nil
UI.ArenaWnd.myLeaderboardRequestTimer	= -1
UI.ArenaWnd.hMsgLeaderboardError		= UI.INVALID_UI_HANDLE
UI.ArenaWnd.matchmakingBtnTextType		= -1
UI.ArenaWnd.matchmakingBtnTextTimer		= -1

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ArenaWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.catpionMetaText = UI.MetaText.GetNewInstance()
	self.catpionMetaText:InitFromLayer( self, self.layers.CAPTION ) 

	self.teamNameAndPlayersMetaText = UI.MetaText.GetNewInstance()
	self.teamNameAndPlayersMetaText:InitFromLayer( self, self.layers.TEAM_NAME_AND_PLAYERS ) 

	local teamWorkEffect = UI:GetEffectFromLayer( self, self.layers.TEAM_WORK_EFFECT )
	if teamWorkEffect then
		self.numPlayersColor = teamWorkEffect:GetObjColor( self.effectInfo.team.numPlayersColorLocator )
	end

	self.topPlaceWnds[ 1 ] = UI.Arena_TopPlace1Wnd
	self.topPlaceWnds[ 2 ] = UI.Arena_TopPlace2Wnd
	self.topPlaceWnds[ 3 ] = UI.Arena_TopPlace3Wnd

	self:UpdateCaption()

	local handle = self:GetUiHandle()

	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ARENA_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ARENA_STATS_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ARENA_MAJOR_CHANGED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.ArenaWnd:F_Shutdown()

	if self.catpionMetaText then
		self.catpionMetaText:Clear()
	end

	if self.teamNameAndPlayersMetaText then
		self.teamNameAndPlayersMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ArenaWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

	self.topLeaderboardRequestId	= nil
	self.savedTopLeaderboardData	= nil
	self.topLeaderboardRequestTimer = -1

	self.myLeaderboardRequestId		= nil
	self.savedMyLeaderboardData		= nil
	self.myLeaderboardRequestTimer	= -1

	if self.mode == self.modes.NO_TEAM then
		self.topLeaderboardRequestTimer = 0
	end

	if self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING then
		self.myLeaderboardRequestTimer	= 0
	end

	self:UpdateContent()

end


--
function UI.ArenaWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ArenaWnd:UpdateMetaTextPos()

	self.catpionMetaText:UpdateScreenOrgFromLayer( self, self.layers.CAPTION )
	self.teamNameAndPlayersMetaText:UpdateScreenOrgFromLayer( self, self.layers.TEAM_NAME_AND_PLAYERS )	

end


--
function UI.ArenaWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.CAPTION then
		self.catpionMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TEAM_NAME_AND_PLAYERS then
		self.teamNameAndPlayersMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ArenaWnd:UpdateMode()

	local bInTeam = UI.Arena:IsInTeam()

	local mode = -1

	-- предполагается, что когда мачмекинг закончится, это окно сразу же должно быть закрыто ангаром, и сюда не должно прийти
	if self.mode == self.modes.MATCHMAKING then
		if not bInTeam then
			sys.log( "UI.ArenaWnd:UpdateMode()[ERROR]: not in team while in matchmaking mode" )
		end
	else
		mode = bInTeam and self.modes.TEAM or self.modes.NO_TEAM
	end

	if mode ~= self.mode then

		local oldMode = self.mode
		self.mode = mode	

		self:ValidateLeaderboardsStuff( oldMode )

	end

end


--
function UI.ArenaWnd:ValidateLeaderboardsStuff( oldMode )

	-- лидерборды для первых трех мест рейтинга

	local bFitModeForTopLeaderboard		= self.mode == self.modes.NO_TEAM
	local bWasFitModeForTopLeaderboard	= oldMode == self.modes.NO_TEAM

	if bFitModeForTopLeaderboard then

		local bNeedImmediateRequest = not bWasFitModeForTopLeaderboard or self.savedTopLeaderboardData == nil

		if bNeedImmediateRequest then
			self.topLeaderboardRequestId	= nil
			self.savedTopLeaderboardData	= nil
			self.topLeaderboardRequestTimer	= 0
		end

	else
		self.topLeaderboardRequestId	= nil
		self.savedTopLeaderboardData	= nil
		self.topLeaderboardRequestTimer	= -1
	end


	-- лидерборд для моей команды

	local bFitModeForMyLeaderboard		= self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING
	local bWasFitModeForMyLeaderboard	= oldMode == self.modes.TEAM or oldMode == self.modes.MATCHMAKING

	if bFitModeForMyLeaderboard then

		local bHasMyLeaderboardData =
    		self.savedMyLeaderboardData
			and self.savedMyLeaderboardData.records
			and self.savedMyLeaderboardData.records[ 1 ]
    		and self.savedMyLeaderboardData.records[ 1 ].e == UI.Arena:GetTeamId()
			and self.savedMyLeaderboardData.leaderboardDesc.name == self:GetMyLeaderboardName()

		local bNeedImmediateRequest = not bWasFitModeForMyLeaderboard or not bHasMyLeaderboardData

		if bNeedImmediateRequest then
			self.myLeaderboardRequestId		= nil
			self.savedMyLeaderboardData		= nil
			self.myLeaderboardRequestTimer	= 0
		end

	else
		self.myLeaderboardRequestId		= nil
		self.savedMyLeaderboardData		= nil
		self.myLeaderboardRequestTimer	= -1
	end

end


--
function UI.ArenaWnd:ResetContent()

	self.mmWaitingTime				= -1
	self.matchmakingBtnTextType		= -1
	self.matchmakingBtnTextTimer	= -1

    UI.Arena_MinimizeBtn:UnlinkFromParent()
    UI.Arena_LeaveQueueBtn:UnlinkFromParent()
    UI.Arena_CreateTeamBtn:UnlinkFromParent()
    UI.Arena_BattlesWnd:UnlinkFromParent()
    UI.Arena_WinsWnd:UnlinkFromParent()
    UI.Arena_TopPlace1Wnd:UnlinkFromParent()
    UI.Arena_TopPlace2Wnd:UnlinkFromParent()
    UI.Arena_TopPlace3Wnd:UnlinkFromParent()
    UI.Arena_MyPlaceWnd:UnlinkFromParent()
    UI.Arena_StartMatchmakingBtn:UnlinkFromParent()

	UI.Arena_PlayersListWnd:Clear()
    UI.Arena_PlayersListWnd:UnlinkFromParent()

    self:AddChild( UI.Arena_CloseBtn )

	self:SetLayerVisible( false, self.layers.DESC )
	self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_EFFECT )
	self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_VAL )
	self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_LABEL )

	self:SetLayerVisible( false, self.layers.TEAM_NAME_AND_PLAYERS )
	self.teamNameAndPlayersMetaText:SetText( "", true )

end


--
function UI.ArenaWnd:UpdateContent()

	self:ResetContent()

	if self.mode == -1 then
		return
	end

    local serverInfo	= nil
    local queueInfo		= nil

	if self.mode == self.modes.MATCHMAKING then
    	serverInfo	= _G.MasterServer_GetServerInfo()
    	queueInfo	= self.savedQueueInfo or _G.MasterServer_GetQueueInfo()
	end

    self:UpdateCaption()
    self:UpdateDesc()
    self:UpdateLeaderboardsBtn()
    self:UpdateCloseBtn()
    self:UpdateMinimizeBtn()
    self:UpdateLeaveQueueBtn( queueInfo )
    self:UpdateCreateTeamBtn()
    self:UpdateStartMatchmakingBtn()
    self:UpdateTeamNameAndPlayers()
    self:UpdateBattles()
    self:UpdateWins()
    self:UpdatePlayersList()
    self:UpdateTopPlaces()
    self:UpdateMyPlace()
    self:UpdateMMWaitingTime( true )

end


--
function UI.ArenaWnd:UpdateCaption()

	self:AddChild( UI.Arena_InfoIcoWnd )

	local strInfoIco = string.format( "$wndk [hWnd %u][alignment CENTER]$", UI.Arena_InfoIcoWnd:GetUiHandle() )
	local str = string.format( "%s%s", UI:GetStringByName( "arena_caption" ), strInfoIco )

	self.catpionMetaText:SetText( str, true )

end


--
function UI.ArenaWnd:UpdateDesc()

	self:SetLayerVisible( self.mode == self.modes.NO_TEAM, self.layers.DESC )

end


--
function UI.ArenaWnd:UpdateLeaderboardsBtn()

	-- кнопка есть всегда и не меняет свое состояние

end


--
function UI.ArenaWnd:UpdateCloseBtn()

	if self.mode ~= self.modes.MATCHMAKING then
		self:AddChild( UI.Arena_CloseBtn )
	else
		UI.Arena_CloseBtn:UnlinkFromParent()
	end

end


--
function UI.ArenaWnd:UpdateMinimizeBtn()

	if self.mode == self.modes.MATCHMAKING then
		self:AddChild( UI.Arena_MinimizeBtn )
	else
		UI.Arena_MinimizeBtn:UnlinkFromParent()
	end

end


--
function UI.ArenaWnd:UpdateLeaveQueueBtn( queueInfo )

	if self.mode ~= self.modes.MATCHMAKING then
		UI.Arena_LeaveQueueBtn:UnlinkFromParent()
		return
	end

	self:AddChild( UI.Arena_LeaveQueueBtn )

	local bEnable = queueInfo.inQueue
	UI.Arena_LeaveQueueBtn:Enable( bEnable )

end


--
function UI.ArenaWnd:UpdateCreateTeamBtn()

	if self.mode == self.modes.NO_TEAM then
		self:AddChild( UI.Arena_CreateTeamBtn )
	else
		UI.Arena_CreateTeamBtn:UnlinkFromParent()
	end

end


--
function UI.ArenaWnd:UpdateStartMatchmakingBtn()

	if self.mode ~= self.modes.TEAM then
		UI.Arena_StartMatchmakingBtn:UnlinkFromParent()
		return
	end

	self:AddChild( UI.Arena_StartMatchmakingBtn )

	local bEnabledFromServer	= _G.MasterServer_GetServerInfo().mmEnableLeague == true
	local banEndTime			= UI.Arena:GetBanEndTime()
	local curTime				= _G.MasterServer_GetServerTime()	
	local bBanned				= banEndTime ~= UI.INVALID_U64_ID and banEndTime > curTime
	local tillActivationTime	= _G.MasterServer_GetTimeTillLeagueActivation()

	-- доступность

	local bEnabled =
		UI.Squad:IsInSquad()
		and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE
		and bEnabledFromServer
		and not bBanned
		and tillActivationTime <= 0

	UI.Arena_StartMatchmakingBtn:Enable( bEnabled )


	-- текст

	local textType	= -1
	local timer		= -1

	if bBanned then
		textType	= self.matchmakingBtnTextTypes.BANNED
		timer		= ( banEndTime - curTime ).l * 0.001

	elseif not bEnabledFromServer then
		textType = self.matchmakingBtnTextTypes.DISABLED

	elseif tillActivationTime > 0 then
		textType	= self.matchmakingBtnTextTypes.ACTIVATION_TIMER
		timer		= tillActivationTime

	else
		textType = self.matchmakingBtnTextTypes.START
	end

	if textType ~= self.matchmakingBtnTextType or timer ~= self.matchmakingBtnTextTimer then

		local str = ""

		if textType == self.matchmakingBtnTextTypes.START then
			str = UI:GetStringByName( "arena_startMatchmakingBtn" )

		elseif textType == self.matchmakingBtnTextTypes.ACTIVATION_TIMER then
			str = UI:Time2Str2( timer )

		elseif textType == self.matchmakingBtnTextTypes.DISABLED then
			str = UI:GetStringByName( "arena_startMatchmakingBtn_disabled" )

		elseif textType == self.matchmakingBtnTextTypes.BANNED then

			local strTime = UI:Time2Str45( timer )
			
			local numSubst = 0
			str, numSubst = string.gsub( self.strBanned, "%$time%$", strTime )

			if numSubst == 0 then
				str = string.format( "[INVALID STRING] Banned: %s", strTime )
			end

		end

		UI.Arena_StartMatchmakingBtn:SetBtnText( str )

		self.matchmakingBtnTextType		= textType
		self.matchmakingBtnTextTimer	= timer

	end

end


--
function UI.ArenaWnd:UpdateTeamNameAndPlayers()

	if not( self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING ) then
		self:SetLayerVisible( false, self.layers.TEAM_NAME_AND_PLAYERS )
		return
	end

	self:SetLayerVisible( true, self.layers.TEAM_NAME_AND_PLAYERS )


	-- имя команды

	local teamName = UI.Arena:GetTeamName()

	-- количество участников и оставшихся приглашений

	local numPlayers		= UI.Arena:GetNumPlayers( false )
	local maxNumPlayers		= UI.Arena:GetMaxNumPlayers()

	local strPlayers = string.format( "%d/%d", numPlayers, maxNumPlayers )

	if UI.Arena:IsLeader() then

		local numLeftInvites = UI.Arena:GetLeftInviteAttempts()
		strPlayers = string.format( "%s(+%d)", strPlayers, numLeftInvites )

	end

	local strLinkPlayers = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", tooltipTextId=\"arena_numPlayers_tooltipText\", tooltipCaptionId=\"arena_numPlayers_tooltipCaption\", colorSel=%u, colorUnsel=%u}]$", strPlayers, self.numPlayersColor, self.numPlayersColor )

	-- всё вместе

	local str = string.format( "%s %s", teamName, strLinkPlayers )
	self.teamNameAndPlayersMetaText:SetText( str, true )

end


--
function UI.ArenaWnd:UpdateBattles()

	if not( self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING ) then
		UI.Arena_BattlesWnd:UnlinkFromParent()
		return
	end

	self:AddChild( UI.Arena_BattlesWnd )

	local val = UI.Arena:GetNumBattles()
	UI.Arena_BattlesWnd:SetVal( val )

end


--
function UI.ArenaWnd:UpdateWins()

	if not( self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING ) then
		UI.Arena_WinsWnd:UnlinkFromParent()
		return
	end

	self:AddChild( UI.Arena_WinsWnd )

	local val = UI.Arena:GetNumWins()
	UI.Arena_WinsWnd:SetVal( val )

end


--
function UI.ArenaWnd:UpdatePlayersList()

	if not( self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING ) then
		UI.Arena_PlayersListWnd:Clear()
		UI.Arena_PlayersListWnd:UnlinkFromParent()
		return
	end                     


	self:AddChild( UI.Arena_PlayersListWnd )
	UI.Arena_PlayersListWnd:Clear()


	local players = UI.Arena:GetPlayers( UI.Arena:IsLeader() )
	local leaderUid = UI.Arena:GetLeader()


	local datas = {}
	for playerIdx, playerInfo in ipairs( players ) do

		local data = {}

		data.playerInfo	= playerInfo
        data.bLeader	= playerInfo.uid == leaderUid
		data.bOnLine	= self:IsStatusOnline( playerInfo.state )

		table.insert( datas, data )

	end

	local function l_fnSort( data1, data2 )

		-- члены/приглашенные		
		if not data1.playerInfo.bInvited and data2.playerInfo.bInvited then
			return true

		elseif data1.playerInfo.bInvited and not data2.playerInfo.bInvited then
			return false
		end

		-- для членов:
		if not data1.playerInfo.bInvited then

			-- онлайн/оффлайн
    		if data1.bOnLine and not data2.bOnLine then
    			return true

    		elseif not data1.bOnLine and data2.bOnLine then
    			return false
    		end

			-- для онлайн:
			if data1.bOnLine then

        		-- лидер/рядовые
        		if data1.bLeader and not data2.bLeader then
        			return true

        		elseif not data1.bLeader and data2.bLeader then
        			return false
        		end

			-- для оффлайн:
			else

        		-- по времени последнего посещения
				local time1 = data1.playerInfo.stateLastChange or UI.INVALID_U64_ID
				local time2 = data2.playerInfo.stateLastChange or UI.INVALID_U64_ID

				if time1 ~= time2 then
					return time1 < time2
				end

			end

		end

		-- по имени
		return data1.playerInfo.nickname < data2.playerInfo.nickname

	end

	table.sort( datas, l_fnSort )


	local row			= 1
	local rowData		= {}
	local numSlotsInRow	= 0

	local numSlots = #datas
	for slotIdx = 1, numSlots do

		local slotData = datas[ slotIdx ]

		numSlotsInRow = numSlotsInRow + 1
		rowData[ numSlotsInRow ] = slotData

		if numSlotsInRow >= UI.Arena_PlayersRowWnd.NUM_SLOTS or slotIdx == numSlots then

			UI.Arena_PlayersListWnd:AddRecord( rowData )

			row				= row + 1
			rowData			= {}
			numSlotsInRow	= 0

		end		

	end	

end


--
function UI.ArenaWnd:ResortPlayersList()

	local scrollPos = UI.Arena_PlayersListWnd:GetScrollPos()

	UI.ArenaWnd:UpdatePlayersList()

	if scrollPos ~= -1 then
		UI.Arena_PlayersListWnd:SetScrollPos( scrollPos )
	end

end


--
function UI.ArenaWnd:UpdateTopPlaces()

	if self.mode ~= self.modes.NO_TEAM then

    	for place = 1, 3 do
    		self.topPlaceWnds[ place ]:UnlinkFromParent()
    	end

		return

	end


	local datas = {}

	for place = 1, 3 do

		local data =
		{
			place	= place,
			raiting	= nil,
			team	= UI.INVALID_U64_ID,
			bMajor	= false,
		}

		table.insert( datas, data )

	end

	if self.savedTopLeaderboardData then

    	local numRecords = self.savedTopLeaderboardData.records and #self.savedTopLeaderboardData.records or 0
    	numRecords = math.min( numRecords, 3 )

    	for recordIdx = 1, numRecords do

    		local recordData = self.savedTopLeaderboardData.records[ recordIdx ]

    		local place		= recordIdx
    		local team		= recordData.e
    		local raiting	= recordData.s
    		
    		if type( team ) ~= "userdata" then
    			sys.log( "UI.ArenaWnd:UpdateTopPlaces()[ERROR]: invalid type of \"e\" (team id); \"userdata\" expected, got \"%s\"", type( team ) )
    			team = UI.INVALID_U64_ID
    		end

    		if type( raiting ) ~= "number" then
    			sys.log( "UI.ArenaWnd:UpdateTopPlaces()[ERROR]: invalid type of \"s\" (raiting); \"number\" expected, got \"%s\"", type( raiting ) )
    			raiting = 0
    		end

    		data = datas[ place ]

			data.place		= place
			data.raiting	= raiting
			data.team		= team

    	end

	end

	for place = 1, 3 do

    	local placeWnd	= self.topPlaceWnds[ place ]
		local data		= datas[ place ]

		self:AddChild( placeWnd )
		placeWnd:Setup( data )

	end

end


--
function UI.ArenaWnd:UpdateMyPlace()

	if not( self.mode == self.modes.TEAM or self.mode == self.modes.MATCHMAKING ) then
		UI.Arena_MyPlaceWnd:UnlinkFromParent()
		return
	end

	self:AddChild( UI.Arena_MyPlaceWnd )

	local data =
	{
		place	= -1,
		raiting	= 0,
		team	= nil,
		bMajor	= UI.Arena:IsTeamMajor(),
	}

    if self.savedMyLeaderboardData then

    	local recordData = self.savedMyLeaderboardData.records and self.savedMyLeaderboardData.records[ 1 ]
    	if recordData then

        	local place = recordData.p

        	if place ~= nil then
            	if type( place ) ~= "number" then
            		sys.log( "UI.ArenaWnd:UpdateMyPlace()[ERROR]: invalid type of \"p\" (place); \"number\" or \"nil\" expected, got \"%s\"", type( place ) )
            		place = nil
            	end
        	end

        	if place ~= nil and place ~= -1 then

            	local raiting = recordData.s	

            	if type( raiting ) ~= "number" then
            		sys.log( "UI.ArenaWnd:UpdateMyPlace()[ERROR]: invalid type of \"s\" (raiting); \"number\" expected, got \"%s\"", type( raiting ) )
            		raiting = 0
            	end

            	data.place		= place + 1
            	data.raiting	= raiting

			end
		end

	else
		data.raiting = UI.Arena:GetRaiting()
	end

	UI.Arena_MyPlaceWnd:Setup( data )

end


--
function UI.ArenaWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Arena_CloseBtn then

		UI.HangarWnd:HideArenaWnd( false )
		UI.HangarWnd:ShowGameplayChoiceWnd( true )

	elseif wnd == UI.Arena_MinimizeBtn then
		UI.HangarWnd:HideArenaWnd( true )

	elseif wnd == UI.Arena_CreateTeamBtn then
		self:OnCreateTeam()

	elseif UI:IsWndKindOf( wnd, "Arena_CancelInviteBtn" ) then
		self:OnCancelInvite( wnd ) 

	elseif wnd == UI.Arena_LeaveQueueBtn then
		self:TryLeaveQueue()

	elseif wnd == UI.Arena_StartMatchmakingBtn then

		self:EnterQueue()
		UI:PlayGlobalSound( self.sounds.startMatchmaking )

	elseif wnd == UI.Arena_LeaderboardsBtn then
		UI.HangarWnd:ShowArenaLeaderboards( UI.Arena:IsInTeam() and UI.Arena:IsTeamMajor() )
	end

	return true

end


--
function UI.ArenaWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "LinkWnd" ) then

		local customData = wnd:GetCustomData()
		if customData and customData.bIsPlayerName then

    		if not self:IsWaiting() then
				local playerSlotWnd = wnd:GetParent()
    			self:ShowContextMenuForPlayer( playerSlotWnd:GetData() )
    		end

		end

	end

	return true

end


--
function UI.ArenaWnd:OnEscape()

	if self.mode ~= self.modes.MATCHMAKING then

		UI.HangarWnd:HideArenaWnd( false )
		UI.HangarWnd:ShowGameplayChoiceWnd( true )

	else
		UI.HangarWnd:HideArenaWnd( true )
	end

	return true

end


--
function UI.ArenaWnd:F_OnEventSaveUiState()	

	UI.store.ArenaWnd =
	{
		mode						= self.mode,
        savedQueueInfo				= self.savedQueueInfo,
		leaveQueueRequestId			= self.leaveQueueRequestId,
		topLeaderboardRequestId		= self.topLeaderboardRequestId,
		savedTopLeaderboardData		= self.savedTopLeaderboardData,
		topLeaderboardRequestTimer	= self.topLeaderboardRequestTimer,
        myLeaderboardRequestId		= self.myLeaderboardRequestId,
        savedMyLeaderboardData		= self.savedMyLeaderboardData,
        myLeaderboardRequestTimer	= self.myLeaderboardRequestTimer,
	}

	self:Hide()

end


--
function UI.ArenaWnd:F_OnEventRestoreUiState()

	if UI.store.ArenaWnd then

		self.mode						= UI.store.ArenaWnd.mode
		self.savedQueueInfo				= UI.store.ArenaWnd.savedQueueInfo
		self.leaveQueueRequestId		= UI.store.ArenaWnd.leaveQueueRequestId
		self.topLeaderboardRequestId	= UI.store.ArenaWnd.topLeaderboardRequestId
		self.savedTopLeaderboardData	= UI.store.ArenaWnd.savedTopLeaderboardData
		self.topLeaderboardRequestTimer	= UI.store.ArenaWnd.topLeaderboardRequestTimer
        self.myLeaderboardRequestId		= UI.store.ArenaWnd.myLeaderboardRequestId
        self.savedMyLeaderboardData		= UI.store.ArenaWnd.savedMyLeaderboardData
        self.myLeaderboardRequestTimer	= UI.store.ArenaWnd.myLeaderboardRequestTimer

		if self:IsOnScreen() then
			self:UpdateContent()
		end

		UI.store.ArenaWnd = nil

	end

end   


--
function UI.ArenaWnd:OnCreateTeam()

	if self:IsWaiting() then
		return
	end

	self:LaunchCreateTeamWnd()

end


--
function UI.ArenaWnd:LaunchCreateTeamWnd()

	UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.ARENA_TEAM_CREATE )

end


--
function UI.ArenaWnd:OnCancelInvite( cancelBtn )

	if self:IsWaiting() then
		return
	end

	local uid = UI.INVALID_U64_ID

	local slotWnd = cancelBtn:GetParent()
	if slotWnd then
		local data = slotWnd:GetData()
		uid = data and data.playerInfo.uid or UI.INVALID_U64_ID
	end

	if uid ~= UI.INVALID_U64_ID then
		UI.Arena:CancelInvitePlayer( uid )
		UI:PlayGlobalSound( self.sounds.cancelInvite )
	else
		sys.log( "UI.ArenaWnd:OnCancelInvite()[ERROR]: cannot find uid" )
	end

end


--
function UI.ArenaWnd:ShowContextMenuForPlayer( data )

	UI.ContextMenu:Clear()
	UI.ContextMenu:SetName( data.playerInfo.nickname )
	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_ARENA, data.playerInfo.uid )
	UI.ContextMenu:Show( mouseX, mouseY )

end


--
function UI.ArenaWnd:GetPlayerSlotByUid( uid )

	if not UI.Arena_PlayersListWnd:IsChildOf( self ) then
		return nil
	end

	for recordIdx = 1, UI.Arena_PlayersListWnd:GetNumRecords() do

		local rowWnd = UI.Arena_PlayersListWnd:GetButtonForRecord( recordIdx )
		if rowWnd then

			for slotIdx = 1, rowWnd.NUM_SLOTS do

				local slotWnd = rowWnd:GetSlotWnd( slotIdx )
				if slotWnd then

					local data = slotWnd:GetData()
					if data and data.playerInfo.uid == uid then
						return slotWnd
					end

				end

			end

		end

	end

	return nil

end


--
function UI.ArenaWnd:IsStatusOnline( status )

	return not( status == _G.MasterServer.UserState.USER_STATE_OFFLINE or status == _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE )

end


--
function UI.ArenaWnd:UpdateWaitingEffect()

	local bWaiting = self:NeedWaitingEffect()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ArenaWnd:NeedWaitingEffect()

	return
		self:IsWaiting()
		or ( self.savedTopLeaderboardData == nil and self.topLeaderboardRequestId ~= nil )	-- для лидербордов крутяшка показывается только при первом запросе
		or ( self.savedMyLeaderboardData == nil and self.myLeaderboardRequestId ~= nil )

end


--
function UI.ArenaWnd:IsWaiting()

	return UI.Arena:IsWaitingRequests()

end


--
function UI.ArenaWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateWaitingEffect()

	if self.mode == self.modes.NO_TEAM then
		self:UpdateTopLeaderboardRequestTimer( dt_sys )

	elseif self.mode == self.modes.TEAM then
		self:UpdateStartMatchmakingBtn()
		self:UpdateMyLeaderboardRequestTimer( dt_sys )

	elseif self.mode == self.modes.MATCHMAKING then
		self:UpdateMMWaitingTime( false )
		self:UpdateMyLeaderboardRequestTimer( dt_sys )
	end

end


--
function UI.ArenaWnd:OnQueueInfo()

	if self.mode ~= self.modes.MATCHMAKING then
		return
	end

	if not UI.MatchMakingWnd:IsActive() or not UI.MatchMakingWnd:IsArena() then
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

    	local queueInfoToShow = self.savedQueueInfo or queueInfo

        self:UpdateLeaveQueueBtn( queueInfo )

	end

end


--
function UI.ArenaWnd:TryLeaveQueue()

	if self.mode ~= self.modes.MATCHMAKING then
		sys.log( "UI.ArenaWnd:TryLeaveQueue()[ERROR]: not MATCHMAKING mode" )
		return
	end

	if not UI.Arena_LeaveQueueBtn:IsChildOf( self ) or not UI.Arena_LeaveQueueBtn:IsEnabled() then
		return
	end

	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaveQueue = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )

end


--
function UI.ArenaWnd:DoLeaveQueue()

	if self.mode ~= self.modes.MATCHMAKING then
		sys.log( "UI.ArenaWnd:DoLeaveQueue()[ERROR]: not MATCHMAKING mode" )
		return
	end

	self.leaveQueueRequestId = _G.MasterServer_LeaveMatchmakingQueue()

	if self.leaveQueueRequestId == 0 then
		UI:ShowMsgOnLeaveQueueError()
	end

end


--
function UI.ArenaWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLeaveQueue then

		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoLeaveQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		end

	elseif boxHandle == self.hMsgLeaderboardError then

		self.hMsgLeaderboardError = UI.INVALID_UI_HANDLE

	end

end


--
function UI.ArenaWnd:HideLeaveQueueMsg()

    if self.hMsgLeaveQueue == UI.INVALID_UI_HANDLE then
		return
	end

    UI:RemoveUiObj( self.hMsgLeaveQueue ) 
    self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

end


--
function UI.ArenaWnd:EnterQueue()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	UI.GameplayWnd:SetGameplay( { mmParams = { league = 1, region = UI:GetGameRegion() } } )
	UI.GameplayWnd:StartMatchMaking()

end


--
function UI.ArenaWnd:CheckShowMsgOnNotSquadLeader()

	if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then

		local errorName = UI:Val2Key( _G.MasterServer.MMJoinResult, _G.MasterServer.MMJoinResult.MMJR_NOT_SQUAD_LEADER )
		local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", errorName ) )

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), strErrorLocalized , UI.MBS_OK )

		return true

	end

	return false

end


--
function UI.ArenaWnd:UpdateMMWaitingTime( bForceUpdate )

	if self.mode ~= self.modes.MATCHMAKING then

		self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_EFFECT )
		self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_PB_EFFECT )
		self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_VAL )
		self:SetLayerVisible( false, self.layers.TIME_MM_WAITING_LABEL )		

		return
	end

	self:SetLayerVisible( true, self.layers.TIME_MM_WAITING_EFFECT )
	self:SetLayerVisible( true, self.layers.TIME_MM_WAITING_PB_EFFECT )
	self:SetLayerVisible( true, self.layers.TIME_MM_WAITING_VAL )
	self:SetLayerVisible( true, self.layers.TIME_MM_WAITING_LABEL )

	local oldMMWaitingTime = self.mmWaitingTime
	self.mmWaitingTime = UI.MatchMakingWnd:IsActive() and UI.MatchMakingWnd:GetWaitingTime() or -1

	if not bForceUpdate and math.floor( self.mmWaitingTime ) == math.floor( oldMMWaitingTime ) then
		return
	end

	-- текст

	local str = ""

	if self.mmWaitingTime ~= -1 then
		local roundTime = math.floor( self.mmWaitingTime )
		str = UI:Time2Str3( roundTime )
	end

	self:SetText( str, self.layers.TIME_MM_WAITING_VAL )


	-- эффект

	local effect = UI:GetEffectFromLayer( self, self.layers.TIME_MM_WAITING_PB_EFFECT )
	if effect then

		local animName = ""

		if self.mmWaitingTime == -1 or self.mmWaitingTime == 0 then
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
function UI.ArenaWnd:UpdateTopLeaderboardRequestTimer( dt )

	if self.topLeaderboardRequestTimer ~= -1 then

		self.topLeaderboardRequestTimer = self.topLeaderboardRequestTimer - dt
		if self.topLeaderboardRequestTimer <= 0 then

			self.topLeaderboardRequestTimer = self.LEADERBOARD_REQUEST_DELAY
			self:RequestTopLeaderboard()

		end

	end

end


--
function UI.ArenaWnd:UpdateMyLeaderboardRequestTimer( dt )

	if self.myLeaderboardRequestTimer ~= -1 then

		self.myLeaderboardRequestTimer = self.myLeaderboardRequestTimer - dt
		if self.myLeaderboardRequestTimer <= 0 then

			self.myLeaderboardRequestTimer = self.LEADERBOARD_REQUEST_DELAY
			self:RequestMyLeaderboard()

		end

	end

end


--
function UI.ArenaWnd:RequestTopLeaderboard()

	if self.topLeaderboardRequestId == nil then
		self.topLeaderboardRequestId = UI.Leaderboards:SetNextRequest( self, UI.Arena.leaderboardName, 0, 3, false, true, false, nil )
	end

end


--
function UI.ArenaWnd:RequestMyLeaderboard()

	if self.myLeaderboardRequestId == nil then
		self.myLeaderboardRequestId = UI.Leaderboards:SetNextRequest( self, self:GetMyLeaderboardName(), nil, nil, false, true, false, { UI.Arena:GetTeamId() } )
	end

end


--
function UI.ArenaWnd:GetMyLeaderboardName()

	return UI.Arena:IsTeamMajor() and UI.Arena.majorLeaderboardName or UI.Arena.leaderboardName

end


--
function UI.ArenaWnd:ShowMsgOnLeaderboardError( result )

	if self.hMsgLeaderboardError ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaderboardError = UI:ShowErrorMsg( "arena_leaderboardError", result, "_G.MasterServer.LeaderboardGetResult" )

end    


-- ----------------------------------------------------------------------------
--  UI.Arena_InfoIcoWnd
-- ----------------------------------------------------------------------------

UI.Arena_InfoIcoWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name	= "Arena_InfoIcoWnd",
			style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
    				defName 			= "arena_infoIco",
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

	tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "arena_infoIco_tooltipCaption" ),
		text		= UI:GetStringByName( "arena_infoIco_tooltipText" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end,
}

-- ----------------------------------------------------------------------------
--  UI.Arena_LeaderboardsBtn
-- ----------------------------------------------------------------------------

UI.Arena_LeaderboardsBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name	= "Arena_LeaderboardsBtn",
		},		
	},

	textId = "arena_leaderboardsBtn",
}

-- ----------------------------------------------------------------------------
--  UI.Arena_CloseBtn
-- ----------------------------------------------------------------------------

UI.Arena_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name	= "Arena_CloseBtn",
		},
	},

	textId = "close",
}

-- ----------------------------------------------------------------------------
--  UI.Arena_MinimizeBtn
-- ----------------------------------------------------------------------------

UI.Arena_MinimizeBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "Arena_MinimizeBtn",
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

-- ----------------------------------------------------------------------------
--  UI.Arena_LeaveQueueBtn
-- ----------------------------------------------------------------------------

UI.Arena_LeaveQueueBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name	= "Arena_LeaveQueueBtn",
		},
	},

	textId = "matchMaking_cancel",
}


-- ----------------------------------------------------------------------------
--  UI.Arena_CreateTeamBtn
-- ----------------------------------------------------------------------------

UI.Arena_CreateTeamBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "Arena_CreateTeamBtn",
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
    				defName 			= "arena_btn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

	textId = "arena_createTeamBtn",
}


-- ----------------------------------------------------------------------------
--  UI.Arena_StartMatchmakingBtn
-- ----------------------------------------------------------------------------

UI.Arena_StartMatchmakingBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "Arena_StartMatchmakingBtn",
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
    				defName 			= "arena_btn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ----------------------------------------------------------------------------
--  UI.Arena_PlayersListWnd
-- ----------------------------------------------------------------------------

UI.Arena_PlayersListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_PlayersListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "Arena_PlayersListWnd",
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
				defName 			= "arena_playersList",
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
}

-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_PlayersListWnd.btnPrototypeName	= "Arena_PlayersRowWnd"
UI.Arena_PlayersListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.Arena_PlayersListWnd.MAX_SLOTS			= 7

UI.Arena_PlayersListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

-- ----------------------------------------------------------------------------
--  UI.Arena_PlayersRowWnd
-- ----------------------------------------------------------------------------

UI.Arena_PlayersRowWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_PlayersRowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Arena_PlayersRowWnd",
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
				defName 			= "arena_playersRow",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self1",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_PlayersRowWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
	end

end


--
function UI.Arena_PlayersRowWnd:GetSlotWnd( slotIdx )

	return self.slots[ slotIdx ]

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_PlayersRowWnd.NUM_SLOTS = 2

UI.Arena_PlayersRowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "slot_1_"
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Arena_PlayersRowWnd.slots	= {}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Arena_PlayersRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end 

	self.slots = {}

	self:CreateControls()

end


--
function UI.Arena_PlayersRowWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, self.NUM_SLOTS do

		local slotWnd = UI:CreateChildWnd( self, UI.Arena_PlayerSlotWnd, tostring( slotIdx ) )

		self.slots[ slotIdx ] = slotWnd
		UI:AddChildAndLink( self, slotWnd, mainEffect, string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )

	end

end


--
function UI.Arena_PlayersRowWnd:UpdateForData( data, bAnimated )

	for slotIdx, slotWnd in pairs( self.slots ) do

		local slotData = data and data[ slotIdx ]

		if slotData then
			slotWnd:Setup( slotData )
		else
			slotWnd:Reset()
		end

	end

end


-- ----------------------------------------------------------------------------
--  UI.Arena_PlayerSlotWnd
-- ----------------------------------------------------------------------------

UI.Arena_PlayerSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_PlayerSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Arena_PlayerSlotWnd",
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
				defName 			= "arena_playerSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title45",
						layer		= "UI.Arena_PlayerSlotWnd.layers.NAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title46",
						layer		= "UI.Arena_PlayerSlotWnd.layers.STATUS_DESC_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "arena_playerSlot_playerName",

				links =
				{
					{
						objName		= "title45",
						layer		= "UI.Arena_PlayerSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- STATUS_DESC_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "arena_playerSlot_statusDesc",

				links =
				{
					{
						objName		= "title48",
						layer		= "UI.Arena_PlayerSlotWnd.layers.STATUS_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- STATUS_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_PlayerSlotWnd:Setup( data )

	self:Reset()

	self.data = data
	self:FullUpdate()

end


--
function UI.Arena_PlayerSlotWnd:Reset()

	self.data = nil

	self:SetLayerVisible( false, self.layers.NAME_EFFECT )
	self:SetLayerVisible( false, self.layers.NAME )
	self:SetLayerVisible( false, self.layers.STATUS_DESC_EFFECT )
	self:SetLayerVisible( false, self.layers.STATUS_DESC )

	self.nameMetaText:SetText( "", true )
	self.nameLinkWnd:Reset()
	self.nameLinkWnd:UnlinkFromParent()

	self.cancelInviteBtn:UnlinkFromParent()
	self.statusIcoWnd:UnlinkFromParent()

end


--
function UI.Arena_PlayerSlotWnd:GetData()

	return self.data

end


--
function UI.Arena_PlayerSlotWnd:OnNameChanged()

	self:UpdateName()

end


--
function UI.Arena_PlayerSlotWnd:OnClanNameChanged()

	self:UpdateName()

end


--
function UI.Arena_PlayerSlotWnd:OnClanChanged()

	self:UpdateName()

end


--
function UI.Arena_PlayerSlotWnd:OnStatusChanged()

	self:UpdateStatusIco()
	self:UpdateStatusDesc()
	self:UpdateName()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_PlayerSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME_EFFECT			= 1,
    NAME				= 2,
    STATUS_DESC_EFFECT	= 3,
    STATUS_DESC			= 4,
}

UI.Arena_PlayerSlotWnd.effectInfo =
{
	main =
	{
		cancelInviteBtnLocator	= "close_btn",
		statusIcoLocator		= "on_off",
	},	

	name =
	{
		animOnLine			= "on",
		animOffLine			= "off",
		animOnLine_leader	= "lider",
		animOffLine_leader	= "lider_off",
	},

	statusIco =
	{
		animOnLine	= "on",
		animOffLine	= "off",
		animInvited	= "idle",
	},

	statusDesc =
	{
		animOnLine	= "on",
		animOffLine	= "off",
	},
}	

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Arena_PlayerSlotWnd.data				= nil
UI.Arena_PlayerSlotWnd.cancelInviteBtn	= nil
UI.Arena_PlayerSlotWnd.statusIcoWnd		= nil
UI.Arena_PlayerSlotWnd.nameMetaText		= nil
UI.Arena_PlayerSlotWnd.nameLinkWnd		= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Arena_PlayerSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 

	self:CreateControls()

end


--
function UI.Arena_PlayerSlotWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Arena_PlayerSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Arena_PlayerSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.Arena_PlayerSlotWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )

end


--
function UI.Arena_PlayerSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Arena_PlayerSlotWnd:CreateControls()

	self.cancelInviteBtn	= UI:CreateChildWnd( self, UI.Arena_CancelInviteBtn, "" )
	self.statusIcoWnd		= UI:CreateChildWnd( self, UI.Arena_PlayerStatusIcoWnd, "" )
	self.nameLinkWnd		= UI:CreateChildWnd( self, UI.LinkWnd, "" )

end


--
function UI.Arena_PlayerSlotWnd:FullUpdate()

	if not self.data then
		return
	end

	self:UpdateName()
	self:UpdateStatusIco()
	self:UpdateStatusDesc()
	self:UpdateCancelInviteBtn()

end


--
function UI.Arena_PlayerSlotWnd:UpdateName()

	if not self.data then
		sys.log( "UI.Arena_PlayerSlotWnd:UpdateName()[ERROR]: no data" )
		return
	end

	self:SetLayerVisible( true, self.layers.NAME_EFFECT )
	self:SetLayerVisible( true, self.layers.NAME )

	-- цвет

	local anim = ""

	if self.data.bOnLine and not self.data.playerInfo.bInvited then
		anim = self.data.bLeader and self.effectInfo.name.animOnLine_leader or self.effectInfo.name.animOnLine
	else
		anim = self.data.bLeader and self.effectInfo.name.animOffLine_leader or self.effectInfo.name.animOffLine
	end

	local nameEffect = UI:GetEffectFromLayer( self, self.layers.NAME_EFFECT )
	if nameEffect then
		nameEffect:StartAnimation( anim )
	end


	-- текст

	local nameFull		= UI:MakePlayerNameByUid( self.data.playerInfo.uid, true, false, nil )
	local nameMaxWidth	= self:GetLayerWidth( self.layers.NAME )	
	local hFont			= self:GetFont( self.layers.NAME )

	local strLeader		= ""
	
	if self.data.bLeader then

		strLeader = string.format( " %s", UI:GetStringByName( "squad_leader" ) )

    	local formatRect = UI:Quat( 0, 0, 10000000, self:GetLayerHeight( self.layers.NAME ) )

        local leaderWidth = _G.MeasureText(
       		strLeader,
       		hFont,
        	formatRect,
       		FONT.TF_LEFT + FONT.TF_TOP,
        	formatRect ).z

		nameMaxWidth = math.max( nameMaxWidth - leaderWidth, 0 )
		
	end

	local nameFixed, bWasCut = UI:GetCutTextWithEllipses( nameFull, nameMaxWidth, hFont )

	if self.data.bLeader then

		nameFixed = string.format( "%s%s", nameFixed, strLeader )

		if bWasCut then
			nameFull = string.format( "%s%s", nameFull, strLeader )
		end

	end

	local color = self:GetColor( self.layers.NAME )

	local linkParams =
	{
		text		= nameFixed,
		tooltipText	= bWasCut and nameFull or "",
		colorSel	= color,
		colorUnsel	= color,
		customData	= { bIsPlayerName = true },
	}

	-- не используется тэг $link$ при создании метатекста, чтобы избежать проблем со спецсимволами при передаче локализованного текста 

	self.nameLinkWnd:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, self:GetFont( self.layers.NAME ) )
	self:AddChild( self.nameLinkWnd )	
	local strMetaText = string.format( "$wndk [hWnd %u]$", self.nameLinkWnd:GetUiHandle() )

	self.nameMetaText:SetText( strMetaText, true )

end


--
function UI.Arena_PlayerSlotWnd:UpdateStatusIco()

	if not self.data then
		sys.log( "UI.Arena_PlayerSlotWnd:UpdateStatusIco()[ERROR]: no data" )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.statusIcoWnd, mainEffect, self.effectInfo.main.statusIcoLocator, UI.EffectAnimParams.POS )

	if self.data.playerInfo.bInvited then
		mode = UI.Arena_PlayerStatusIcoWnd.modes.INVITED
	else
		mode = self.data.bOnLine and UI.Arena_PlayerStatusIcoWnd.modes.ONLINE or UI.Arena_PlayerStatusIcoWnd.modes.OFFLINE
	end

	self.statusIcoWnd:SetMode( mode )

end


--
function UI.Arena_PlayerSlotWnd:UpdateStatusDesc()

	if not self.data then
		sys.log( "UI.Arena_PlayerSlotWnd:UpdateStatusDesc()[ERROR]: no data" )
		return
	end

	if self.data.playerInfo.bInvited then

    	self:SetLayerVisible( false, self.layers.STATUS_DESC )

	else

    	self:SetLayerVisible( true, self.layers.STATUS_DESC )

    	-- текст

    	local str = UI:GetPlayerStatusFullStr( self.data.playerInfo )
    	self:SetText( str, self.layers.STATUS_DESC )

    	-- анимация
    	local anim = self.data.bOnLine and self.effectInfo.statusDesc.animOnLine or self.effectInfo.statusDesc.animOffLine

    	local statusDescEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_DESC_EFFECT )
    	if statusDescEffect then
    		statusDescEffect:StartAnimation( anim )
    	end

	end

end


--
function UI.Arena_PlayerSlotWnd:UpdateCancelInviteBtn()

	if not self.data then
		sys.log( "UI.Arena_PlayerSlotWnd:UpdateCancelInviteBtn()[ERROR]: no data" )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self.data.playerInfo.bInvited then
		UI:AddChildAndLink( self, self.cancelInviteBtn, mainEffect, self.effectInfo.main.cancelInviteBtnLocator, UI.EffectAnimParams.POS )
	else
		self.cancelInviteBtn:UnlinkFromParent()
	end

end


-- ----------------------------------------------------------------------------
-- UI.Arena_CancelInviteBtn
-- ----------------------------------------------------------------------------

UI.Arena_CancelInviteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Arena_CancelInviteBtn",
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
    				defName 			= "arena_playerSlot_cancelInviteBtn",
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
    		animationDisabled		= "",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
    },

	tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "arena_cancelInviteToltip" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- ----------------------------------------------------------------------------
-- UI.Arena_PlayerStatusIcoWnd
-- ----------------------------------------------------------------------------

UI.Arena_PlayerStatusIcoWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_PlayerStatusIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Arena_PlayerStatusIcoWnd",
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
				defName 			= "arena_playerSlot_statusIco",

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

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_PlayerStatusIcoWnd:SetMode( mode )

	self.mode = mode
	self:FullUpdate()

end


--
function UI.Arena_PlayerStatusIcoWnd:Reset()

	self.mode			= -1
	self.tooltipData	= nil

end


--
function UI.Arena_PlayerStatusIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_PlayerStatusIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
}


UI.Arena_PlayerStatusIcoWnd.modes =
{
	ONLINE		= 1,
	OFFLINE 	= 2,
	INVITED	    = 3,
}

UI.Arena_PlayerStatusIcoWnd.effectInfo =
{
	main =
	{
		anims =
		{
			[ UI.Squad_Slot_OnlineStatusIcoWnd.modes.ONLINE ]	= "on",
			[ UI.Squad_Slot_OnlineStatusIcoWnd.modes.OFFLINE ]	= "off",
			[ UI.Squad_Slot_OnlineStatusIcoWnd.modes.INVITED ]	= "idle",
		}
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Arena_PlayerStatusIcoWnd.mode		= -1
UI.Arena_PlayerStatusIcoWnd.tooltipData	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Arena_PlayerStatusIcoWnd:FullUpdate()

	self:UpdateAnimation()
	self:UpdateTooltip()

end


--
function UI.Arena_PlayerStatusIcoWnd:UpdateAnimation()

	if self.mode == -1 then
		return
	end

	local anim = self.effectInfo.main.anims[ self.mode ]

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( anim )

end


--
function UI.Arena_PlayerStatusIcoWnd:UpdateTooltip()

	if self.mode == -1 then
		self.tooltipData = nil
		return
	end

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL

	local strId = string.format( "squad_statusTooltip_%s", UI:Val2Key( self.modes, self.mode ) )
	self.tooltipData.text = UI:GetStringByName( strId )	

end


-- ----------------------------------------------------------------------------
--  UI.Arena_BattlesWnd
-- ----------------------------------------------------------------------------

UI.Arena_BattlesWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_BattlesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "Arena_BattlesWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "arena_battles",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "objectName396",
						layer		= "UI.Arena_BattlesWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title30",
						layer		= "UI.Arena_BattlesWnd.layers.LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "arena_battles" )
		}, 
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_BattlesWnd:SetVal( val )

	local str = UI:Num2StrSeparatedBy3( val )
	self:SetText( str, self.layers.VAL )

end


--
function UI.Arena_BattlesWnd:Reset()

	self:SetText( "", self.layers.VAL )

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_BattlesWnd.layers =
{
    MAIN_EFFECT		= 0,
    VAL				= 1,
    LABEL			= 2,
}


-- ----------------------------------------------------------------------------
--  UI.Arena_WinsWnd
-- ----------------------------------------------------------------------------

UI.Arena_WinsWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_WinsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "ArenaWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "arena_wins",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "objectName396",
						layer		= "UI.Arena_WinsWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title30",
						layer		= "UI.Arena_WinsWnd.layers.LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "arena_wins" )
		}, 
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_WinsWnd:SetVal( val )

	local str = UI:Num2StrSeparatedBy3( val )
	self:SetText( str, self.layers.VAL )

end


--
function UI.Arena_WinsWnd:Reset()

	self:SetText( "", self.layers.VAL )

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_WinsWnd.layers =
{
    MAIN_EFFECT		= 0,
    VAL				= 1,
    LABEL			= 2,
}

-- ----------------------------------------------------------------------------
--  UI.Arena_PlaceWnd
-- ----------------------------------------------------------------------------

UI.Arena_PlaceWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_PlaceWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "Arena_PlaceWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype		= true,
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
				defName 			= "arena_place",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title49",
						layer		= "UI.Arena_PlaceWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Arena_PlaceWnd:Setup( data )

	self:Reset()

	self.data = data
	self:FullUpdate()

end


--
function UI.Arena_PlaceWnd:Reset()

	self.data = nil

	self:SetText( "", self.layers.TEXT )

	if self.effectInfo.main.icoSpriteName ~= "" then	-- у большой иконки первого места не меняется текстура

    	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    	if mainEffect then
    		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
    	end

	end

end


--
function UI.Arena_PlaceWnd:GetData()

	return self.data

end


--
function UI.Arena_PlaceWnd:OnTeamNameChanged()

	if not self.data or not self.data.team or self.data.team == UI.INVALID_U64_ID then
		return
	end

	self:UpdateText()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Arena_PlaceWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.Arena_PlaceWnd.effectInfo =
{
	main =
	{
		icoSpriteName		= "objectName381",
		placeColorLocator	= "color1",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Arena_PlaceWnd.data			= nil
UI.Arena_PlaceWnd.placeColor	= UI.WHITE_COLOR

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Arena_PlaceWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.placeColor = mainEffect:GetObjColor( self.effectInfo.main.placeColorLocator )
	end

end


--
function UI.Arena_PlaceWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateText()

end


--
function UI.Arena_PlaceWnd:UpdateIco()

	if not self.data then
		sys.log( "UI.Arena_PlaceWnd:UpdateIco()[ERROR]: no data" )
		return
	end

	if self.effectInfo.main.icoSpriteName == "" then	-- у большой иконки первого места не меняется текстура
		return
	end

	local place = self.data.place
	if place == -1 then
		local ranges = self.data.bMajor and UI.arenaMajorPlaceIcoRanges or UI.arenaPlaceIcoRanges
		place = ranges[ #ranges ]
	end	

	local hTex = UI:GetArenaPlaceIcoBig( place, self.data.bMajor )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end	

end


--
function UI.Arena_PlaceWnd:UpdateText()

	local str = ""

	-- место

	local strPlace = ""

	if self.data.place ~= -1 then

		strPlace = UI:GetStringByName( "arena_place" )
    	local strPlaceVal = UI:Num2StrSeparatedBy3( self.data.place )
    	
    	local numPlaceSubst = 0
    	strPlace, numPlaceSubst = string.gsub( strPlace, "%$val%$", strPlaceVal )
    	
    	if numPlaceSubst == 0 then
    		sys.log( "UI.Arena_PlaceWnd:UpdateText()[ERROR]: cannot find placeholder \"$val$\" in string \"arena_place\"" )
    		strPlace = string.format( "[INVALID STRING]%s place", strPlaceVal )
    	end

	else
    	strPlace = UI:GetStringByName( "arena_notInLeaderboard" )
	end

	if strPlace ~= "" then
	    strPlace = string.format( "%s%s%s", UI:Color2Str( self.placeColor ), strPlace, UI:Color2Str( self:GetColor( self.layers.TEXT ) ) )
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strPlace )
	end


	-- имя команды (может не быть)	

	local strTeam = ""

	if self.data.team == UI.INVALID_U64_ID then
		strTeam = UI:GetStringByName( "arena_unoccupiedPlaceInLeaderboard" )

	elseif self.data.team then
		strTeam = UI:GetArenaTeamName( self.data.team )
	end

	if strTeam ~= "" then
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strTeam )
	end


	-- рейтинг (может не быть)	

	local strRaiting = ""

	if self.data.raiting then

    	strRaiting = UI:GetStringByName( "arena_raiting" )
    	local strRaitingVal = UI:Num2StrSeparatedBy3( self.data.raiting )
    	
    	local numRaitingSubst = 0
    	strRaiting, numRaitingSubst = string.gsub( strRaiting, "%$val%$", strRaitingVal )
    	
    	if numRaitingSubst == 0 then
    		sys.log( "UI.Arena_PlaceWnd:UpdateText()[ERROR]: cannot find placeholder \"$val$\" in string \"arena_raiting\"" )
    		strRaiting = string.format( "[INVALID STRING]%s raiting", strRaitingVal )
    	end

	end

	if strRaiting ~= "" then
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strRaiting )
	end


	self:SetText( str, self.layers.TEXT )

end


-- ----------------------------------------------------------------------------
-- UI.Arena_TopPlace1Wnd
-- ----------------------------------------------------------------------------

UI.Arena_TopPlace1Wnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Arena_TopPlace1Wnd.def =
{
	className	= "Wnd",
	prototype	= "Arena_PlaceWnd",

	props =
	{
		name	= "Arena_TopPlace1Wnd",
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
				defName 			= "arena_firstPlace",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title30",
						layer		= "UI.Arena_PlaceWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},
	}
}

-- -------------------------------------
-- const
-- -------------------------------------


UI.Arena_TopPlace1Wnd.effectInfo =
{
	main =
	{
		icoSpriteName		= "",		-- это обеспечит неапдейт текстуры
		placeColorLocator	= "color",
	}
}


-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Arena_TopPlace1Wnd:UpdateIco()

	-- текстура врисована в эффект

end


-- ----------------------------------------------------------------------------
-- UI.Arena_TopPlace2Wnd
-- ----------------------------------------------------------------------------

UI.Arena_TopPlace2Wnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Arena_PlaceWnd",

		props =
		{
			name	= "Arena_TopPlace2Wnd"
		}
	}
}

-- ----------------------------------------------------------------------------
-- UI.Arena_TopPlace3Wnd
-- ----------------------------------------------------------------------------

UI.Arena_TopPlace3Wnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Arena_PlaceWnd",

		props =
		{
			name	= "Arena_TopPlace3Wnd"
		}
	}
}

-- ----------------------------------------------------------------------------
-- UI.Arena_MyPlaceWnd
-- ----------------------------------------------------------------------------

UI.Arena_MyPlaceWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Arena_PlaceWnd",

		props =
		{
			name	= "Arena_MyPlaceWnd"
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
    				defName 			= "arena_myPlace",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title49",
    						layer		= "UI.Arena_PlaceWnd.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
    	}
	}
}