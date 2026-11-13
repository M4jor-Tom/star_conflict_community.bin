-- ----------------------------------------------------------------------------
--
-- Workfile: debriefingwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.DebriefingWnd = {}
local dw = UI.DebriefingWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name	= "DebriefingWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= -1,
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
				defName 			= "debriefing_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "product_name",	
						layer		= "UI.DebriefingWnd.layers.WIN_LOSE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "debrifing_win",
						layer		= "UI.DebriefingWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,
		},

		-- BLACK_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0xff000000,
		},

		-- WIN_LOSE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "debrifing_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "option_btn_list",
						wnd			= "UI.Debriefing_PageTypeList",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",
						wnd			= "UI.Debriefing_ExitBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						layer		= "UI.DebriefingWnd.layers.EXIT_TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "social_net_btn_1",
						wnd			= "UI.Debriefing_FbBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "social_net_btn_2",
						wnd			= "UI.Debriefing_VkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						layer		= "UI.DebriefingWnd.layers.SCREENSHOT_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_11",
						wnd			= "UI.Debriefing_StartBattleBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer2",
						layer		= "UI.DebriefingWnd.layers.MATCHMAKING_TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- EXIT_TIMER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		

		-- SCREENSHOT_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "screenshot" ),
		},		

		-- MATCHMAKING_TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		
	},

	children =
	{
		"UI.Debriefing_PageTypeList",
		"UI.Debriefing_ExitBtn",
		"UI.Debriefing_GENERAL",
		"UI.Debriefing_PLAYERS",	
		"UI.Debriefing_FbBtn",
		"UI.Debriefing_VkBtn",
		"UI.Debriefing_StartBattleBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingWnd:Setup( data, lootItems )

	self:Reset()

	self.data			= data or {}
	self.lootItems		= lootItems and UI:CopyTable2( lootItems ) or {}
	self.playerCredits	= UI:CopyTable2( UI.serverData.playerCredits )	-- во время, пока дебрифинг на экране, они могут измениться, поэтому запоминается их состояние на момент показа окна
	self.likes			= _G.MasterServer_GetPlayersLikes()

	-- #0058361,комм.(0236246) - если игрок в очереди, то счетчика нет, есть кнопка "В ангар";
	-- не проверяется через UI:IsInQueue(), т.к. ui может быть в состоянии мачмейкинга даже если не в очереди -
	-- например, если _G.MasterServer_IsInTournament()

	if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then
		self.exitTimer = self.EXIT_DELAY_TIME
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.DebriefingWnd:GetData()

	return self.data

end


--
function UI.DebriefingWnd:GetDataForPlayer( playerId )

	if type( self.data.players ) == "table" then

    	for idx, playerData in ipairs( self.data.players ) do
    	
    		if playerData and playerData.playerId == playerId then
    			return playerData
    		end

    	end

	end

	return nil

end


--
function UI.DebriefingWnd:GetPlayerCredits()

	return self.playerCredits

end


--
function UI.DebriefingWnd:GetLootItems()

	return self.lootItems

end


--
function UI.DebriefingWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Debriefing_PLAYERS:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

end


--
function UI.DebriefingWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Debriefing_PLAYERS:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.DebriefingWnd:GetLikeForPlayer( playerId )

	local likedPlayerId = self.likes[ playerId ] or -1

	if likedPlayerId == ai.MAX_PLAYERS then
		likedPlayerId = -1
	end

	return likedPlayerId

end


--
function UI.DebriefingWnd:GetLikersForPlayer( playerId )

	local likers = {}
	
	for likerPlayerId, likedPlayerId in pairs( self.likes ) do
		if likedPlayerId == playerId then
			table.insert( likers, likerPlayerId )
		end
	end

	return likers	

end


--
function UI.DebriefingWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification ~= _G.MasterServer.ServerNotification.SN_LIKE_ADDED then
		return
	end

	self.likes = _G.MasterServer_GetPlayersLikes()

	UI.Debriefing_PLAYERS:OnLikesChanged()

end


--
function UI.DebriefingWnd:MasterServer_OnAddThumbUp( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end
	
	if self.likeRequestId == requestId then
		self.likeRequestId = 0
	end

	if result ~= 0 then
		return
	end

	self.likes = _G.MasterServer_GetPlayersLikes()

	UI.Debriefing_PLAYERS:OnLikesChanged()

end


--
function UI.DebriefingWnd:IsLocalPlayerObserver()

	local bObserver = true

	local playerId = self:GetLocalPlayerId()
	if playerId ~= -1 then

		local playerData = self:GetDataForPlayer( playerId )
		if playerData then
			bObserver = playerData.status == _G.network.PlayerStatus.PS_OBSERVER
		end

	end

	return bObserver

end


--
function UI.DebriefingWnd:FB_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_LOGIN then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT )
			_G.FB_PostScreenShot()
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end		

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_UPLOADING_STARTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_POST_SCREENSHOT )
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_POSTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_POST_SCREENSHOT then
			return
		end

		self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

	end
	
end


--
function UI.DebriefingWnd:VK_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_LOGIN then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT )
			_G.VK_PostScreenShot()
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end		

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_UPLOADING_STARTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_POST_SCREENSHOT )
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_POSTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_POST_SCREENSHOT then
			return
		end

		self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

	end
	
end


--
function UI.DebriefingWnd:OnSocialNetWaitingCancel( mode )

	self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

end


--
function UI.DebriefingWnd:GetLocalPlayerId()

	local localPlayerId = -1

	local uid = UI:GetLocalPlayerUid()
	if uid ~= UI.INVALID_U64_ID then

		if type( self.data.players ) == "table" then

        	for idx, playerData in pairs( self.data.players ) do
        	
        		if playerData.uid == uid then
        			localPlayerId = playerData.playerId
    				break
        		end

        	end

		end

	end

	return localPlayerId

end


--
function UI.DebriefingWnd:GetGameplay()

	return self.data.gameMode

end


--
function UI.DebriefingWnd:GetPlayerAvailableShips( playerId )

	local playerData = self:GetDataForPlayer( playerId )
	return playerData and playerData.availableShips or {}

end


--
function UI.DebriefingWnd:GetPlayers()

	return self.data.players or {}

end


--
function UI.DebriefingWnd:GetPlayerHangarStatus( playerId, hangarIdx )

	-- такой значение по умолчанию в CL_GetHangarStatus()
	local status = 0

	local playerData = self:GetDataForPlayer( playerId )
	local availableShips = playerData and playerData.availableShips

	if availableShips then

    	for idx, shipInfo in pairs( availableShips ) do

    		if shipInfo.hangarIdx == hangarIdx then
    			status = shipInfo.status
				break
    		end

    	end

	end

	return status

end


--
function UI.DebriefingWnd:IsSinglePlayer()

	return self.data ~= nil and self.data.singleplayer == true

end


--
function UI.DebriefingWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStartBattleBtn()
	self:UpdateExitTimer( 0 )

end


--
function UI.DebriefingWnd:OnSquadDataChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStartBattleBtn()

end


--
function UI.DebriefingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	if result == 0 then
		if requestId == self.leaveQueueRequestId and self.bNeedExitAfterLeaveQueue then
    		self:DoExitToHangar()
		end
	else
		if requestId == self.leaveQueueRequestId then
			UI:ShowMsgOnLeaveQueueError()
		end
	end

	if requestId == self.leaveQueueRequestId then
		self.leaveQueueRequestId = 0
		self.bNeedExitAfterLeaveQueue = false
	end

	self:HideLeaveQueueMsg()

end



--
function UI.DebriefingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.bNeedExitAfterLeaveQueue	= false
	self.leaveQueueRequestId		= 0
	self.likeRequestId				= 0
	
end


--
function UI.DebriefingWnd:GetLocalPlayerTeam()

	local localPlayerId		= UI.DebriefingWnd:GetLocalPlayerId()
	local localPlayerData	= UI.DebriefingWnd:GetDataForPlayer( localPlayerId )

	local localPlayerTeam = localPlayerData ~= nil and localPlayerData.team or 1
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	return localPlayerTeam

end


--
function UI.DebriefingWnd:MasterServer_OnUniverseGet( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self:IsBfs() or self:IsArena() then
		self:UpdateStartBattleBtn()
	end

end


--
function UI.DebriefingWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	
	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	UI.Debriefing_GENERAL:OnAccountRankChanged()
	UI.Debriefing_PLAYERS:OnAccountRankChanged()
	
end


-- ------------------------------
-- const
-- ------------------------------

dw.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
	BLACK_BG			= 2,
    WIN_LOSE_TEXT		= 3,
    WORK_EFFECT			= 4,
	EXIT_TIMER			= 5,
	SCREENSHOT_LABEL	= 6,
	MATCHMAKING_TIME	= 7,
}

dw.pageTypes =
{
	GENERAL		= 1,
	PLAYERS		= 2,
}

dw.effectInfo =
{
	work =
	{
		pageLocator	= "debrifing_list"
	}
}

-- dw.IS_FULL_SCREEN	= false

dw.sounds =
{
	rewardIncrement		= "sound/ui/repInc",
	close				= "sound/ui/btnClick",
	lootMouseOver		= "sound/ui/btnMouseOver",
	pageMouseOver		= UI.sounds.btnMouseOver,
	pageOpen			= UI.sounds.btnClick,
	like				= UI.sounds.btnClick,
}

dw.EXIT_DELAY_TIME	= 5
dw.strExitTimer		= UI:GetStringByName( "debriefing_exitTimer" )

dw.strMatchmakingTime	= UI:GetStringByName( "debriefing_matchmakingTime" )

-- ------------------------------
-- vars
-- ------------------------------

dw.pageWnds					= {}
dw.curPageType				= -1
dw.curPageWnd				= nil
dw.pagesShown				= {}
dw.data						= {}
dw.lootItems				= {}
dw.playerCredits			= {}
dw.likes					= {}
dw.likeRequestId			= 0
dw.exitTimer				= -1
dw.socialNetWaitMode		= UI.SocialNetWaitingWnd.modes.NONE
dw.socialNetWaitWnd			= nil
dw.matchmakingTime			= -1
dw.bNeedExitAfterLeaveQueue	= false
dw.leaveQueueRequestId		= 0
dw.hMsgLeaveQueue			= UI.INVALID_UI_HANDLE

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.socialNetWaitWnd = UI.Debriefing_SocialNetWaitingWnd

	self:InitPageWnds()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.DebriefingWnd:InitPageWnds()

	for pageTypeName, pageType in pairs( self.pageTypes ) do
		
		local pageWndName = string.format( "Debriefing_%s", pageTypeName )
		local pageWnd = UI[ pageWndName ]

		if pageWnd then
			self:RemoveChild( pageWnd )

			self.pageWnds[ pageType ] = pageWnd
		end

	end

end


--
function UI.DebriefingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Debriefing_ExitBtn then

		self:TryExitToHangar()

	elseif wnd.PAGE_TYPE_SLOT then

		local data = wnd:GetRecordData()
		if not data.bDisabled then
			if data.pageType ~= self.curPageType then

				self:SetPage( data.pageType )
				UI:PlayGlobalSound( self.sounds.pageOpen )

			end
		end

	elseif UI:IsWndKindOf( wnd, "Debriefing_PLAYERS_PlayersLikeBtn" ) then

		local playerId		= wnd:GetPlayerId()
		local localPlayerId	= self:GetLocalPlayerId()

		if playerId ~= -1 and playerId ~= localPlayerId and self.likeRequestId == 0 and self:GetLikeForPlayer( localPlayerId ) == -1 and not wnd:IsGray() then
		
			self.likeRequestId = _G.MasterServer_AddLike( playerId, _G.MasterServer_GetSessionId() )
			UI:PlayGlobalSound( self.sounds.like )

		end

	elseif wnd == UI.Debriefing_FbBtn then

		if self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then

    		if _G.FB_IsLoggedIn() then

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT )
    			_G.FB_PostScreenShot()

    		else

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_LOGIN )
    			_G.FB_ForceLogIn()

    		end

		end

	elseif wnd == UI.Debriefing_VkBtn then

		if self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then

    		if _G.VK_IsLoggedIn() then

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT )
    			_G.VK_PostScreenShot()

    		else

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_LOGIN )
    			_G.VK_ForceLogIn()

    		end

		end

	elseif wnd == UI.Debriefing_StartBattleBtn then

		self:TryStartBattle()
		UI:PlayGlobalSound( UI.sounds.btnClick )

	end

	return true

end


--
function UI.DebriefingWnd:TryExitToHangar()

	if UI:IsEnqueued() then

		self.bNeedExitAfterLeaveQueue = true

		self:TryLeaveQueue()

		if self.hMsgLeaveQueue == UI.INVALID_UI_HANDLE and self.leaveQueueRequestId == 0 then
			self.bNeedExitAfterLeaveQueue = false
		end

	else

		UI:PlayGlobalSound( self.sounds.close )
		self:DoExitToHangar()

	end

end


--
function UI.DebriefingWnd:DoExitToHangar()

	self.bNeedExitAfterLeaveQueue = false
	self:Hide()
	self:PlaySentence()

end


--
function UI.DebriefingWnd:PlaySentence()

	if not next( self.data ) then
		return
	end

	if type( self.data.winnerTeam ) ~= "number" then
		sys.log( "UI.DebriefingWnd:PlaySentence()[ERROR]: invalid type of data.winnerTeam; \"number\" expected, got \"%s\"", type( self.data.winnerTeam ) )
		return
	end

	if type( self.data.gameMode ) ~= "number" then
		sys.log( "UI.DebriefingWnd:PlaySentence()[ERROR]: invalid type of data.gameMode; \"number\" expected, got \"%s\"", type( self.data.gameMode ) )
		return
	end

	local localPlayerTeam = self:GetLocalPlayerTeam()

	if self.data.winnerTeam ~= localPlayerTeam then
		return
	end

	local sentence = -1
	local hangarRace = UI:GetCurSpaceStationRace()

	if self.data.gameMode == ai.Gameplay.PVE_MISSION then
		sentence = hangarRace == ai.Race.CRYSTAL and ai.SentenceType.SENT_HANGAR_CRYSTAL_WIN_PVE or ai.SentenceType.SENT_HANGAR_WIN_PVE
	else
		sentence = hangarRace == ai.Race.CRYSTAL and ai.SentenceType.SENT_HANGAR_CRYSTAL_WIN_PVP or ai.SentenceType.SENT_HANGAR_WIN_PVP
	end

	_G.MasterServer_PlayHangarSentence( sentence )

end


--
function UI.DebriefingWnd:SetPage( pageType )

    if pageType == self.curPageType then
		return
	end

	self.curPageType = pageType

	self:UpdatePageTypeListSelection()
	self:UpdatePageWnd()

end


--
function UI.DebriefingWnd:UpdatePageTypeListSelection()

	local recordIdx = -1

	if self.curPageType ~= -1 then
		recordIdx = UI.Debriefing_PageTypeList:GetRecordByPageType( self.curPageType )
	end

	UI.Debriefing_PageTypeList:SelectRecord( recordIdx )	

end


--
function UI.DebriefingWnd:UpdatePageWnd()

	local needPageWnd = nil

	if self.curPageType ~= -1 then
		needPageWnd = self.pageWnds[ self.curPageType ]
	end

	if needPageWnd == self.curPageWnd then
		return
	end

	if self.curPageWnd then
		self:HidePageWndInternal()
	end

	if needPageWnd then

		self:ShowPageWndInternal( needPageWnd )
		self.curPageWnd:FullUpdate( self.pagesShown[ self.curPageType ] ~= true )

    	self.pagesShown[ self.curPageType ] = true

	end

end


--
function UI.DebriefingWnd:HidePageWndInternal()

	if not self.curPageWnd then
		return
	end

	self.curPageWnd:UnlinkFromParent()	

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:UnlinkWnd( self.curPageWnd:GetUiHandle(), "" )
	end

	self.curPageWnd = nil

end


--
function UI.DebriefingWnd:ShowPageWndInternal( pageWnd )

	if not pageWnd then
		sys.log( "UI.DebriefingWnd:ShowPageWndInternal()[ERROR]: pageWnd id nil" )
	end

	if self.curPageWnd ~= nil then
		sys.log( "UI.DebiefingWnd:ShowPageWndInternal()[ERROR]: curPageWnd not nil" )
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	UI:AddChildAndLink( self, pageWnd, workEffect, self.effectInfo.work.pageLocator, UI.EffectAnimParams.POS )

	self.curPageWnd = pageWnd	

end


--
function UI.DebriefingWnd:Reset()

	self.pagesShown					= {}
	self.data						= {}
	self.lootItems					= {}
	self.playerCredits				= {}
	self.likes						= {}
	self.likeRequestId				= 0
	self.exitTimer					= -1
	self.bNeedExitAfterLeaveQueue	= false
	self.leaveQueueRequestId		= 0

	self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
	self:HideLeaveQueueMsg()

end


--
function UI.DebriefingWnd:ResetControls()

	UI.FullScreenSelectionWnd.Reset( self )

	UI.Debriefing_PageTypeList:Clear()
	self:SetText( "", self.layers.WIN_LOSE_TEXT )
	self:SetPage( -1 )	
	self:HideSocialNetWaitEffect()
	UI.Debriefing_StartBattleBtn:UnlinkFromParent()
	self:SetText( "", self.layers.MATCHMAKING_TIME )
	self.matchmakingTime = -1

end



--
function UI.DebriefingWnd:FullUpdate()

	self:ResetControls()

	if not UI.bSavingGameState then
		if self:IsBfs() or self:IsArena() then
			UI.Universe:Request()
		end
	end

	UI.Debriefing_PageTypeList:UpdateRecords()
	self:UpdateWinLoseText()
	self:SetPage( self.pageTypes.GENERAL )
	self:UpdateExitBtn()
	self:UpdateExitTimerText()
    self:UpdateSocialNetWaitEffect()
	self:UpdateStartBattleBtn()
	self:UpdateMatchmakingTime()

end


--
function UI.DebriefingWnd:UpdateWinLoseText()

	if self.data.winnerTeam == nil then
		sys.log( "UI.DebriefingWnd:UpdateWinLoseText()[ERROR]: cannot find field \"winnerTeam\"" )
	end

	if self.data.winReason == nil then
		sys.log( "UI.DebriefingWnd:UpdateWinLoseText()[ERROR]: cannot find field \"winReason\"" )
	end
	
	local params =
	{
		-- #0110360 для HUNGER_GAMES
		place		= self.data.playerPosition,
		numPlayers	= #self.data.players, -- статус не проверяем, должны все, для которых тут есть данные, подойти
		
		-- SC-111329 для волновой пве
		numWaves	= self.data.numWaves
	}
	
	local strStatus, strReason = UI:GetWinLoseStrings( self.data.winnerTeam or 0, self.data.winReason or ai.WinReason.NONE, self:GetLocalPlayerTeam(), params )

	local str = string.format( "%s %s", strStatus, strReason )

	-- избавляюсь от переносов строки, заменяя их пробелами (их появление возможно, т.к. эти же строки используются в окне победы/поражения)	
	local str = string.gsub( str, "|", " " )

	self:SetText( str, self.layers.WIN_LOSE_TEXT )	

end


--
function UI.DebriefingWnd:F_OnEventSaveUiState()

	self:HideLeaveQueueMsg()

	if not self:IsOnScreen() then
		return
	end

	self:HideSocialNetWaitEffect()

	UI.store.DebriefingWnd =
	{
		data						= self.data,
		lootItems					= self.lootItems,
		playerCredits				= self.playerCredits,
		likes						= self.likes,
		likeRequestId				= self.likeRequestId,
		exitTimer					= self.exitTimer,
		socialNetWaitMode			= self.socialNetWaitMode,
		bNeedExitAfterLeaveQueue	= self.bNeedExitAfterLeaveQueue,
		leaveQueueRequestId			= self.leaveQueueRequestId,
		pagesShown					= self.pagesShown,
	}

end


--
function UI.DebriefingWnd:F_OnEventRestoreUiState()

	if UI.store.DebriefingWnd then

		self.data						= UI.store.DebriefingWnd.data
		self.lootItems					= UI.store.DebriefingWnd.lootItems
		self.playerCredits				= UI.store.DebriefingWnd.playerCredits
		self.likes						= UI.store.DebriefingWnd.likes
		self.likeRequestId				= UI.store.DebriefingWnd.likeRequestId
		self.exitTimer					= UI.store.DebriefingWnd.exitTimer
		self.socialNetWaitMode			= UI.store.DebriefingWnd.socialNetWaitMode
		self.bNeedExitAfterLeaveQueue	= UI.store.DebriefingWnd.bNeedExitAfterLeaveQueue
		self.leaveQueueRequestId		= UI.store.DebriefingWnd.leaveQueueRequestId
		self.pagesShown					= UI.store.DebriefingWnd.pagesShown

		if self:IsOnScreen() then
			self:FullUpdate()
		end
		
		UI.store.DebriefingWnd = nil

	end

end


--
function UI.DebriefingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateExitTimer( dt_sys )
	self:UpdateMatchmakingTime()

end


--
function UI.DebriefingWnd:UpdateExitTimer( dt )

	if self.exitTimer ~= -1 then

		-- #0058361,комм.(0236246) - если игрок в очереди, то счетчика нет, есть кнопка "В ангар";
		-- не проверяется через UI:IsInQueue(), т.к. ui может быть в состоянии мачмейкинга даже если не в очереди -
		-- например, если _G.MasterServer_IsInTournament()

		if UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE then
			self.exitTimer = -1
		else
    		self.exitTimer = self.exitTimer - dt
    		if self.exitTimer <= 0 then
            	self.exitTimer = -1
			end
		end

		if self.exitTimer == -1 then

			self:UpdateExitBtn()
			self:UpdateExitTimerText()
			self:UpdateStartBattleBtn()

		else
			self:UpdateExitTimerText()			
		end

	end

end


--
function UI.DebriefingWnd:UpdateExitBtn()

	if self.exitTimer == -1 then
		self:AddChild( UI.Debriefing_ExitBtn )		
	else
		UI.Debriefing_ExitBtn:UnlinkFromParent()
	end

end


--
function UI.DebriefingWnd:UpdateExitTimerText()

	if self.exitTimer == -1 then

		self:SetText( "", self.layers.EXIT_TIMER )

	else

		local timer = UI:RoundClampOne( self.exitTimer )
		local strTimer = string.format( "%d %s", timer, UI.strSecs )

		local str = string.gsub( self.strExitTimer, "%$time%$", strTimer )
		self:SetText( str, self.layers.EXIT_TIMER )

	end

end


--
function UI.DebriefingWnd:SetSocialNetWaitMode( mode )

	self.socialNetWaitMode = mode
	self:UpdateSocialNetWaitEffect()

end


--
function UI.DebriefingWnd:UpdateSocialNetWaitEffect()

	if not self:IsOnScreen() or self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then
		self:HideSocialNetWaitEffect()

	else
		self.socialNetWaitWnd:SetMode( self.socialNetWaitMode )
		UI.Root:AddChild( self.socialNetWaitWnd )
	end

end


--
function UI.DebriefingWnd:HideSocialNetWaitEffect()

	if self.socialNetWaitWnd and self.socialNetWaitWnd:IsOnScreen() then
		self.socialNetWaitWnd:Reset()
		self.socialNetWaitWnd:UnlinkFromParent()		
	end

end


--
function UI.DebriefingWnd:UpdateStartBattleBtn()

	local bNeedBtn =
		self.exitTimer == -1
		and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE
		and not( UI.Squad:IsInSquad() and not UI.Squad:IsLeader() )
		and self:CanStartBattle()

	if bNeedBtn then
		self:AddChild( UI.Debriefing_StartBattleBtn )
	else
		UI.Debriefing_StartBattleBtn:UnlinkFromParent()
	end		

end


--
function UI.DebriefingWnd:CanStartBattle()

	if type( self.data.enqParams ) ~= "table" or next( self.data.enqParams ) == nil then
		return false
	end

	if self:IsBfs() or self:IsArena() then

		local bHasConflict = false
		
		local universeType = self:IsBfs() and _G.MasterServer.UniverseType.UT_BFS or _G.MasterServer.UniverseType.UT_ARENA
    	local data = _G.MasterServer_EnableUniverse( universeType )
    	if type( data ) == "table" then

    		if type( data.enable ) == "boolean" then
    			bHasConflict = data.enable
    		else
    			sys.log( "UI.DebriefingWnd:CanStartBattle()[ERROR]: invalid type of field \"enable\" in table returned from _G.MasterServer_EnableUniverse(); \"boolean\" expected, got \"%s\"", type( data.enable ) )
    		end

    	else
    		sys.log( "UI.DebriefingWnd:CanStartBattle()[ERROR]: invalid type of return value from _G.MasterServer_EnableUniverse(); \"table\" expected, got \"%s\"", type( data ) )
    	end

		if not bHasConflict then
			return false
		end

	end

	return true

end


--
function UI.DebriefingWnd:UpdateMatchmakingTime()

	local oldMatchmakingTime = self.matchmakingTime
	self.matchmakingTime = UI.MatchMakingWnd:IsActive() and UI.MatchMakingWnd:GetWaitingTime() or -1

	if math.floor( self.matchmakingTime ) == math.floor( oldMatchmakingTime ) then
		return
	end

	local str = ""

	if self.matchmakingTime ~= -1 then

		local roundTime = math.floor( self.matchmakingTime )
		local strTime = UI:Time2Str3( roundTime )

		str = string.format( "%s: %s", self.strMatchmakingTime, strTime )

	end

	self:SetText( str, self.layers.MATCHMAKING_TIME )

end


--
function UI.DebriefingWnd:TryStartBattle()

	UI.GameplayWnd:SetGameplay( { mmParams = self.data.enqParams } )
	UI.GameplayWnd:StartMatchMaking()

end


--
function UI.DebriefingWnd:TryLeaveQueue()

	if not UI:IsEnqueued() then
		return
	end

	if self.leaveQueueRequestId ~= 0 then
		return
	end

	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaveQueue = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )

end


--
function UI.DebriefingWnd:DoLeaveQueue()

	self.leaveQueueRequestId = _G.MasterServer_LeaveMatchmakingQueue()

	if self.leaveQueueRequestId == 0 then
		UI:ShowMsgOnLeaveQueueError()
		self.bNeedExitAfterLeaveQueue = false
	end

end


--
function UI.DebriefingWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLeaveQueue then

		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoLeaveQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		else
			self.bNeedExitAfterLeaveQueue = false
		end

	end

end


--
function UI.DebriefingWnd:HideLeaveQueueMsg()

    if self.hMsgLeaveQueue == UI.INVALID_UI_HANDLE then
		return
	end

    UI:RemoveUiObj( self.hMsgLeaveQueue ) 
    self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

	if self.leaveQueueRequestId == 0 then
		self.bNeedExitAfterLeaveQueue = false
	end

end


--
function UI.DebriefingWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then

		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )

		self:HideSocialNetWaitEffect()
		self:HideLeaveQueueMsg()

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.DebriefingWnd:IsBfs()

	return type( self.data.enqParams ) == "table" and ( ( self.data.enqParams.universe == true or self.data.enqParams.universe == 1 ) and self.data.enqParams.universeType == _G.MasterServer.UniverseType.UT_BFS )

end


--
function UI.DebriefingWnd:IsArena()

	return type( self.data.enqParams ) == "table" and ( ( self.data.enqParams.universe == true or self.data.enqParams.universe == 1 ) and self.data.enqParams.universeType == _G.MasterServer.UniverseType.UT_ARENA )

end


-- -------------------------------------------------------------------
-- UI.Debriefing_ExitBtn
-- -------------------------------------------------------------------

UI.Debriefing_ExitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

    	props =
    	{
    		name	= "Debriefing_ExitBtn",
    	},
    },

	textId = "debriefing_toHangar",
}

-- -------------------------------------------------------------------
-- UI.Debriefing_StartBattleBtn
-- -------------------------------------------------------------------

UI.Debriefing_StartBattleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn10",

    	props =
    	{
    		name	= "Debriefing_StartBattleBtn",
    	},
    },

	textId = "debriefing_startGame",
}


-- -------------------------------------------------------------------
-- UI.Debriefing_PageTypeList
-- -------------------------------------------------------------------

UI.Debriefing_PageTypeList = {}
local ptl = UI.Debriefing_PageTypeList

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PageTypeList.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Debriefing_PageTypeList",
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
				defName				= "debriefing_pageTypeList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PageTypeList:GetRecordByPageType( pageType )

	for recordIdx = 1, self:GetNumRecords() do
		local data = self:GetRecordData( recordIdx )
		if data.pageType == pageType then
			return recordIdx
		end
	end

	return -1

end


-- ------------------------------
-- const
-- ------------------------------

ptl.btnPrototypeName	= "Debriefing_PageTypeSlot"

ptl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

ptl.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

ptl.MAX_SLOTS = 3

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PageTypeList:UpdateRecords()

	self:Clear()

	for pageType = 1, UI:GetTableLength( UI.DebriefingWnd.pageTypes ) do

		local data = {}
		data.pageType = pageType

		self:AddRecord( data )		

	end	

end


-- -------------------------------------------------------------------
-- UI.Debriefing_PageTypeSlot
-- -------------------------------------------------------------------

UI.Debriefing_PageTypeSlot = {}
local pts = UI.Debriefing_PageTypeSlot

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PageTypeSlot.def =
{
	className		= "Wnd",
	prototype		= "ButtonsList_Btn",

	props =
	{
		name		= "Debriefing_PageTypeSlot",
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
				defName				= "debriefing_pageTypeSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Debriefing_PageTypeSlot.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Debriefing_PageTypeSlot.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "debriefing_pageTypeSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PageTypeSlot:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )
	self:SetMouseOver( false )

end


--
function UI.Debriefing_PageTypeSlot:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateAnimation()

end

-- ------------------------------
-- const
-- ------------------------------

pts.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
    MOUSE_OVER_EFFECT	= 2,
}

pts.effectInfo =
{
	main =
	{
		animSel					= "select",
		animUnsel				= "idle",
		animDisabled			= "disable",
	}
}

pts.PAGE_TYPE_SLOT = true

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PageTypeSlot:UpdateForData( data, bAnimated )

	self:UpdateText( data )
	self:UpdateAnimation( data )

end


--
function UI.Debriefing_PageTypeSlot:UpdateText( data )

    local strId = string.format( "debriefing_pageType_%s", UI:Val2Key( UI.DebriefingWnd.pageTypes, data.pageType ) )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.TEXT )		

end


--
function UI.Debriefing_PageTypeSlot:UpdateAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()
	local isDisabled = data and data.bDisabled or false

	local anim = ""

	if isSelected then
		anim = self.effectInfo.main.animSel
	elseif isDisabled then
		anim = self.effectInfo.main.animDisabled
	else
		anim = self.effectInfo.main.animUnsel
	end

	mainEffect:StartAnimation( anim )	

end


--
function UI.Debriefing_PageTypeSlot:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Debriefing_PageTypeSlot:SetMouseOver( bMouseOver )

	if bMouseOver and self:IsOnScreen() then
		local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
		if not bWasMouseOver then
			UI:PlayGlobalSound( UI.DebriefingWnd.sounds.pageMouseOver )
		end
	end

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

end


--
function UI.Debriefing_PageTypeSlot:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )

	return true

end


--
function UI.Debriefing_PageTypeSlot:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Debriefing_PageTypeSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen( self )

	self:UpdateMouseOver()

end


-- -------------------------------------------------------------------
-- UI.Debriefing_PageWnd
-- -------------------------------------------------------------------

UI.Debriefing_PageWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PageWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Debriefing_PageWnd",
		style		= UI.WS_UPDATE_IF_VISIBLBE,
		isPrototype	= true
	}
}

-- ------------------------------
-- interdace functions
-- ------------------------------

--
function UI.Debriefing_PageWnd:GetPageType()

	return self.pageType

end


--
function UI.Debriefing_PageWnd:FullUpdate( bFirstTime )
end

-- ------------------------------
-- vars
-- ------------------------------

UI.Debriefing_PageWnd.pageType	= -1


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL.def =
{
	className	= "Wnd",
	prototype	= "Debriefing_PageWnd",

	props =
	{
		name		= "Debriefing_GENERAL",
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
				defName 			= "debriefing_GENERAL",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "stat",
						wnd			= "UI.Debriefing_GENERAL_StatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "debrif_stat3",
						wnd			= "UI.Debriefing_GENERAL_RewardWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "medal",
						wnd			= "UI.Debriefing_GENERAL_MedalsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "trophy",
						wnd			= "UI.Debriefing_GENERAL_LootWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_list",
						wnd			= "UI.Debriefing_GENERAL_ShipsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "player_list2",
						wnd			= "UI.Debriefing_GENERAL_EfficiencyWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}		
	},

	children =
	{
		"UI.Debriefing_GENERAL_StatsWnd",
		"UI.Debriefing_GENERAL_RewardWnd",
		"UI.Debriefing_GENERAL_MedalsWnd",
		"UI.Debriefing_GENERAL_LootWnd",
		"UI.Debriefing_GENERAL_ShipsWnd",
		"UI.Debriefing_GENERAL_EfficiencyWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL:FullUpdate( bFirstTime )

	local bAnimated = bFirstTime

	UI.Debriefing_GENERAL_StatsWnd:FullUpdate( bAnimated )
	UI.Debriefing_GENERAL_MedalsWnd:FullUpdate( bAnimated )
	UI.Debriefing_GENERAL_LootWnd:FullUpdate( bAnimated )
	UI.Debriefing_GENERAL_ShipsWnd:FullUpdate( bAnimated )
	UI.Debriefing_GENERAL_EfficiencyWnd:FullUpdate( bAnimated )

	if UI.DebriefingWnd:IsLocalPlayerObserver() then
		self:RemoveControl( UI.Debriefing_GENERAL_RewardWnd, self.layers.MAIN_EFFECT )
	else
		self:AddControl( UI.Debriefing_GENERAL_RewardWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.rewardsLocator )
		UI.Debriefing_GENERAL_RewardWnd:FullUpdate( bAnimated )
	end

	self:CheckPlayAnimSound()	

end


--
function UI.Debriefing_GENERAL:OnAccountRankChanged()

	if not self:IsOnScreen() then
		return
	end
	
	if UI.Debriefing_GENERAL_ShipsWnd:IsChildOf( self ) then
		UI.Debriefing_GENERAL_ShipsWnd:OnAccountRankChanged()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_GENERAL.pageType = dw.pageTypes.GENERAL

UI.Debriefing_GENERAL.layers =
{
	MAIN_EFFECT	= 0
}

UI.Debriefing_GENERAL.effectInfo =
{
	main =
	{
		rewardsLocator = "debrif_stat3",
	}
}

UI.Debriefing_GENERAL.VALS_ANIM_TIME	= 2

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.Debriefing_GENERAL:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end


--
function UI.Debriefing_GENERAL:CheckPlayAnimSound()

	if not self:IsOnScreen() then
		return
	end

	if	not UI.Debriefing_GENERAL_ShipsWnd:IsAnimating()
		and not UI.Debriefing_GENERAL_RewardWnd:IsAnimating() then
			return
	end

	UI:PlayGlobalSound( "sound/ui/debriefingCount" )

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_StatsWnd
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_StatsWnd = {}
local pgs = UI.Debriefing_GENERAL_StatsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_StatsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Debriefing_GENERAL_StatsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "debriefing_GENERAL_stats",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Debriefing_GENERAL_StatsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",
						layer		= "UI.Debriefing_GENERAL_StatsWnd.layers.LEVEL_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.Debriefing_GENERAL_StatsWnd.layers.GAMEPLAY_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_10",
						layer		= "UI.Debriefing_GENERAL_StatsWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= "^debriefing_fee"
		},

		-- LEVEL_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- GAMEPLAY_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_StatsWnd:FullUpdate()

	self:Reset()

	self:UpdateLevelName()
	self:UpdateGameplayName()
	self:UpdateTime()

end


-- ------------------------------
-- const
-- ------------------------------

pgs.layers =
{
	MAIN_EFFECT		= 0,
	CAPTION			= 1, 
	LEVEL_NAME		= 2, 
	GAMEPLAY_NAME	= 3, 
	TIME			= 4, 
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_StatsWnd:Reset()

	self:SetText( "", self.layers.LEVEL_NAME )
	self:SetText( "", self.layers.GAMEPLAY_NAME )
	self:SetText( "", self.layers.TIME )

end


--
function UI.Debriefing_GENERAL_StatsWnd:UpdateLevelName()

	local data = UI.DebriefingWnd:GetData()
	local level = data.levelName

	local strLocalizedLevelName = UI:GetLevelLocalizedName( level )

	local str = UI:GetStringByName( "debriefing_mapLabel" )
	str = string.format( "%s: %s", str, strLocalizedLevelName  )

	self:SetText( str, self.layers.LEVEL_NAME )

end


--
function UI.Debriefing_GENERAL_StatsWnd:UpdateGameplayName()

	local gameplay = UI.DebriefingWnd:GetGameplay()
	local data = UI.DebriefingWnd:GetData()

	local gameplayName = UI:Gameplay2Str( gameplay, true )

	if data.practice then
		gameplayName = string.format( "%s (%s)", gameplayName, UI:GetStringByName( "debriefing_practice" ) )
	end

	self:SetText( gameplayName, self.layers.GAMEPLAY_NAME )

end   


--
function UI.Debriefing_GENERAL_StatsWnd:UpdateTime()

	local data = UI.DebriefingWnd:GetData()
	local time = data.gameLength or 0

	local str = string.format( "%s %s", UI:GetStringByName( "debriefing_stat_TIME" ), UI:Time2Str31( time ) )

	self:SetText( str, self.layers.TIME )

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_RewardWnd
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_RewardWnd = {}
local pgf = UI.Debriefing_GENERAL_RewardWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_RewardWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Debriefing_GENERAL_RewardWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "debriefing_GENERAL_reward",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_11",	
						layer		= "UI.Debriefing_GENERAL_RewardWnd.layers.CREDITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_13",	
						layer		= "UI.Debriefing_GENERAL_RewardWnd.layers.PREMIUM_BONUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_14",	
						layer		= "UI.Debriefing_GENERAL_RewardWnd.layers.LEAVE_FINE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CREDITS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PREMIUM_BONUS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= 0,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- LEAVE_FINE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= 0,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_RewardWnd:FullUpdate( bAnimated )

	self:Reset()

	if UI.DebriefingWnd:IsLocalPlayerObserver() then
		return
	end

	self:UpdateCredits( bAnimated )
	self:UpdatePremiumBonus()
	self:UpdateFineLeave()

end


--
function UI.Debriefing_GENERAL_RewardWnd:Reset()

	self:ResetCreditsMetaText()
	self.premiumBonusMetaText:SetText( "", true )
	self.fineLeaveMetaText:SetText( "", true )

	self:ResetAnimation()

end


--
function UI.Debriefing_GENERAL_RewardWnd:IsAnimating()

	return self.animInfo.animTime ~= -1

end


-- ------------------------------
-- const
-- ------------------------------

pgf.layers =
{
    MAIN_EFFECT		= 0,
	CREDITS			= 1,
	PREMIUM_BONUS	= 2,
	LEAVE_FINE		= 3,
}

pgf.effectInfo =
{
	main =
	{
		creditsValFontLocator	= "color",
	}
}

pgf.ANIM_TIME	= UI.Debriefing_GENERAL.VALS_ANIM_TIME
pgf.strCredits	= UI:GetStringByName( "debriefing_moneyEarned" )

-- ------------------------------
-- vars
-- ------------------------------

pgf.creditsValFontId		= 0
pgf.creditsMetaText			= nil
pgf.premiumBonusMetaText	= nil
pgf.fineLeaveMetaText		= nil
pgf.creditsLinkWnd			= nil

pgf.animInfo =
{
	animTime	= -1,
	maxTime		= pgf.ANIM_TIME,
	creditsOld	= 0,
	creditsNew	= 0,
	creditsCur	= 0,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_RewardWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.creditsMetaText = UI.MetaText.GetNewInstance()
	self.creditsMetaText:InitFromLayer( self, self.layers.CREDITS ) 

	self.premiumBonusMetaText = UI.MetaText.GetNewInstance()
	self.premiumBonusMetaText:InitFromLayer( self, self.layers.PREMIUM_BONUS ) 
	
	self.fineLeaveMetaText = UI.MetaText.GetNewInstance()
	self.fineLeaveMetaText:InitFromLayer( self, self.layers.LEAVE_FINE ) 

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local creditsValFontName = mainEffect:GetObjFontName( self.effectInfo.main.creditsValFontLocator )
		self.creditsValFontId = _G.ObtainFont( creditsValFontName )

	end

	self.creditsLinkWnd = UI:CreateChildWnd( self, UI.LinkWnd, "" )

end


--
function UI.Debriefing_GENERAL_RewardWnd:F_Shutdown()

	self:ResetCreditsMetaText()

	if self.premiumBonusMetaText then
		self.premiumBonusMetaText:Clear()
	end
	
	if self.fineLeaveMetaText then
		self.fineLeaveMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Debriefing_GENERAL_RewardWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Debriefing_GENERAL_RewardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Debriefing_GENERAL_RewardWnd:UpdateMetaTextPos()

	self.creditsMetaText:UpdateScreenOrgFromLayer( self, self.layers.CREDITS )
	self.premiumBonusMetaText:UpdateScreenOrgFromLayer( self, self.layers.PREMIUM_BONUS )
	self.fineLeaveMetaText:UpdateScreenOrgFromLayer( self, self.layers.LEAVE_FINE )

end


--
function UI.Debriefing_GENERAL_RewardWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.CREDITS then
		self.creditsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PREMIUM_BONUS then
		self.premiumBonusMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	
	elseif layerIdx == self.layers.LEAVE_FINE then
		self.fineLeaveMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	
	end

end


--
function UI.Debriefing_GENERAL_RewardWnd:UpdateCredits( bAnimated )

	if bAnimated == nil then
		bAnimated = false
	end
	
	-- #0098688 - хак: в награду включается лут
	local creditsNew	= UI:CalcFullGameRewardWithLoot( UI.DebriefingWnd:GetData(), UI.DebriefingWnd:GetLootItems() )
	local creditsOld	= 0	-- показываются не все имеющиеся у игрока кредиты, а только полученные

	if creditsOld == creditsNew then
		bAnimated = false
	end

	local creditsCur = bAnimated and creditsOld or creditsNew

	local animInfo =
	{
		animTime	= 0,
		maxTime		= self.ANIM_TIME,
		creditsOld	= creditsOld,
		creditsNew	= creditsNew,
		creditsCur	= creditsCur,
	}

	self:SetupCreditsText( animInfo )

	if bAnimated then
		self.animInfo = animInfo
	end

end


--
function UI.Debriefing_GENERAL_RewardWnd:UpdateCreditsAnimation( dt )

	if self.animInfo.animTime == -1 then
		return
	end

	local bAnimStop = false

	self.animInfo.animTime = self.animInfo.animTime + dt

	if self.animInfo.animTime >= self.animInfo.maxTime then
		self.animInfo.animTime = self.animInfo.maxTime
		bAnimStop = true
	end

	local creditsCur = UI:Lerp( self.animInfo.creditsOld, self.animInfo.creditsNew, self.animInfo.animTime / self.animInfo.maxTime )
	creditsCur = UI:Round( creditsCur )

	if creditsCur ~= self.animInfo.creditsCur then
		self.animInfo.creditsCur = creditsCur
		self:SetupCreditsText( self.animInfo )
	end	

	if bAnimStop then
		self:ResetAnimation()
	end

end


--
function UI.Debriefing_GENERAL_RewardWnd:SetupCreditsText( animInfo )

	self:ResetCreditsMetaText()
	self:AddChild( self.creditsLinkWnd )

	local strVal = string.format( "$text [fontId %d][text %s][alignment BASELINE]$", self.creditsValFontId, UI:Num2StrSeparatedBy3( animInfo.creditsCur ) )

	local hIcoTex = UI:GetMailAttachmentCreditsIco()
	local strIco = string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", hIcoTex, UI.WHITE_COLOR )

	local linkColor = UI:GetPriceColor( _G.GameStore.CreditsType.CT_CREDITS )
	
	local linkParams =
	{
		text		= string.format( "%s%s", strVal, strIco ),
		colorUnsel	= linkColor,
		colorSel	= linkColor,

		tooltipData	=
		{
			tooltipType	= UI.tooltipTypes.PRICE,

			priceInfo =
			{
				priceType	= _G.GameStore.CreditsType.CT_CREDITS,
				val			= animInfo.creditsCur,
				bIsBuyPrice	= false,	
			}
		}
	}

	self.creditsLinkWnd:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, self.creditsMetaText:GetFormatParams().hFont, self.creditsMetaText:GetBlendMode(), self.creditsMetaText:GetBackColor() )
	local strLink = string.format( "$wndk [hWnd %u]$", self.creditsLinkWnd:GetUiHandle() )

	local str = string.format( "%s: %s", self.strCredits, strLink )
	self.creditsMetaText:SetText( str, true )

end


--
function UI.Debriefing_GENERAL_RewardWnd:ResetCreditsMetaText()

	self.creditsMetaText:SetText( "", true )

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self.creditsLinkWnd:Reset()
		self.creditsLinkWnd:UnlinkFromParent()
	end

end


--
function UI.Debriefing_GENERAL_RewardWnd:ResetAnimation()

    self.animInfo =
    {
		animTime	= -1,
		maxTime		= self.ANIM_TIME,
    	creditsOld	= 0,
    	creditsNew	= 0,
		creditsCur	= 0,
    }

end


--
function UI.Debriefing_GENERAL_RewardWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateCreditsAnimation( dt_sys )

end


--
function UI.Debriefing_GENERAL_RewardWnd:UpdatePremiumBonus()

	local str = ""

	local bPractice = UI.DebriefingWnd:IsSinglePlayer()
	if not bPractice then

    	local playerData = UI.DebriefingWnd:GetDataForPlayer( UI.DebriefingWnd:GetLocalPlayerId() )
		local bPremium = playerData and playerData.isPremium or false

		if bPremium then

    		local colorLabel 	= UI.GOLD_COLOR

    		-- кредиты
    			
        	local creditsBonus	= playerData and playerData.credPremium or 0

        	local creditsPriceInfo =
        	{
        		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
        		val			= creditsBonus,
        		bIsBuyPrice	= false,
        		valAsString	= string.format( "+%s", UI:Num2StrSeparatedBy3( creditsBonus ) ),
        	}

    		local strCredits = UI:PriceInfo2Str( creditsPriceInfo, colorLabel, nil, nil, true, nil )


    		-- синергия

    		local synergyBonus = 0

    		if playerData and playerData.vessels then
    			for hangasSlotIdx, hangarSlotInfo in pairs( playerData.vessels ) do
    				synergyBonus = synergyBonus + hangarSlotInfo.expPremium
    			end
    		end		

        	local synergyPriceInfo =
        	{
        		priceType	= UI.exPriceTypes.SYNERGY,
        		val			= synergyBonus,
        		bIsBuyPrice	= false,
        		valAsString	= string.format( "+%s", UI:Num2StrSeparatedBy3( synergyBonus ) ),
        	}

    		local strSynergy = UI:PriceInfo2Str( synergyPriceInfo, colorLabel, nil, nil, true, nil )


    		-- всё вместе

    		str = string.format( "%s%s: %s|%s", UI:Color2Str( colorLabel ), UI:GetStringByName( "debriefing_creditsPremiumBonus" ), strCredits, strSynergy )

		end

	end

	self.premiumBonusMetaText:SetText( str, true )

end


--
function UI.Debriefing_GENERAL_RewardWnd:UpdateFineLeave()

	local str = ""

	local bPractice = UI.DebriefingWnd:IsSinglePlayer()
	if not bPractice then

    	local playerData = UI.DebriefingWnd:GetDataForPlayer( UI.DebriefingWnd:GetLocalPlayerId() )
		
		local leaveFineCoef = playerData and playerData.leaveFineCoef or 1

		if leaveFineCoef < 1 then
			
			local leaveFineCoefPercent = UI:Round( ( leaveFineCoef - 1 ) * 100 )
			
			str = string.gsub( UI:GetStringByName( "debriefing_fineLeave" ), "%$value%$", leaveFineCoefPercent )

		end

	end

	self.fineLeaveMetaText:SetText( str, true )

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_MedalsWnd
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_MedalsWnd = {}
local pga = UI.Debriefing_GENERAL_MedalsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_MedalsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Debriefing_GENERAL_MedalsWnd",
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
				defName				= "debriefing_GENERAL_medals",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Debriefing_GENERAL_MedalsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",	
						layer		= "UI.Debriefing_GENERAL_MedalsWnd.layers.NO_MEDALS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= "^debriefing_medals",
		},

		-- NO_MEDALS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_noMedals",
		},
	},

	children = { "UI.Debriefing_GENERAL_Medals_LeftArrowBtn", "UI.Debriefing_GENERAL_Medals_RightArrowBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_MedalsWnd:FullUpdate()

	self:Reset()

	local medalsInfo = self:GetMedals()

	for recordIdx = 1, #medalsInfo do

		local medalInfo = medalsInfo[ recordIdx ]

		local data = { medalInfo = medalInfo }
		self:AddRecord( data )

	end

	self:SetLayerVisible( not next( medalsInfo ), self.layers.NO_MEDALS_TEXT )

	self:RecalcLayout()

end


-- ------------------------------
-- const
-- ------------------------------

pga.btnPrototypeName	= "Debriefing_GENERAL_MedalSlot"

pga.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "loot_",
		scrollObjName		= "",
		animIdle			= "idle",
		leftBtnLocator		= "btn_left1",
		rightBtnLocator		= "btn_right1",
	}
}

pga.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

pga.MAX_SLOTS = 5

pga.layers =
{
	MAIN_EFFECT		= 0,
	CAPTION			= 1,
	NO_MEDALS_TEXT	= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

pga.leftBtn		= nil
pga.rightBtn	= nil

-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.Debriefing_GENERAL_MedalsWnd:Reset()

	self:Clear()
	self:SetLayerVisible( false, self.layers.NO_MEDALS_TEXT )

end


--
function UI.Debriefing_GENERAL_MedalsWnd:InitScrollBar()	

	self.leftBtn 	= UI.Debriefing_GENERAL_Medals_LeftArrowBtn
	self.rightBtn	= UI.Debriefing_GENERAL_Medals_RightArrowBtn

	self:UpdateArrowsVisibility()

end


--
function UI.Debriefing_GENERAL_MedalsWnd:UpdateScrollBarVisibility()	

	self:UpdateArrowsVisibility()

end


--
function UI.Debriefing_GENERAL_MedalsWnd:UpdateScrollBarPos()

	self:UpdateArrowsState()

end


--
function UI.Debriefing_GENERAL_MedalsWnd:UpdateArrowsVisibility()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local bNeedArrows = self.numRecords > self.numSlots

	if bNeedArrows then

		UI:AddChildAndLink( self, self.leftBtn, mainEffect, self.effectInfo.main.leftBtnLocator, UI.EffectAnimParams.POS )
		UI:AddChildAndLink( self, self.rightBtn, mainEffect, self.effectInfo.main.rightBtnLocator, UI.EffectAnimParams.POS )		

		self:UpdateArrowsState()

	else

		self.leftBtn:UnlinkFromParent()
		self.rightBtn:UnlinkFromParent()

		if mainEffect then
			mainEffect:UnlinkWnd( self.leftBtn:GetUiHandle(), "" )
			mainEffect:UnlinkWnd( self.rightBtn:GetUiHandle(), "" )
		end

	end

end


--
function UI.Debriefing_GENERAL_MedalsWnd:UpdateArrowsState()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	self.leftBtn:Enable( firstVisibleRecordIdx > 1 )
	self.rightBtn:Enable( lastVisibleRecordIdx ~= -1 and lastVisibleRecordIdx < self:GetNumRecords() )

end


--
function UI.Debriefing_GENERAL_MedalsWnd:RecalcLayout()

	if self.numRecords >= self.numSlots or self.numRecords == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstLocatorX		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ).x
	local secondLocatorX	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ).x
	local lastLocatorX		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) ).x
	local slotW				= self:GetButtonForRecord( 1 ):GetWidth()
	local areaX				= firstLocatorX
	local areaW				= ( lastLocatorX + slotW ) - firstLocatorX
	local spaceSlots		= secondLocatorX - firstLocatorX - slotW
	local slotsW			= self.numRecords * slotW + ( self.numRecords - 1 ) * spaceSlots
	local slotsX			= ( areaW - slotsW ) / 2 + areaX

	for recordIdx = 1, self.numRecords do

		local slotWnd = self:GetButtonForRecord( recordIdx )

		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )

		local slotX = slotsX + ( recordIdx - 1 ) * ( slotW + spaceSlots )
		slotWnd:SetLeft( slotX )

	end

end


--
function UI.Debriefing_GENERAL_MedalsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.leftBtn then
		self:ScrollVisibleRange( false )

	elseif wnd == self.rightBtn then
		self:ScrollVisibleRange( true )
	end

	return true

end


--
function UI.Debriefing_GENERAL_MedalsWnd:GetMedals()

	local medalsInfo = {}

	local playerId = UI.DebriefingWnd:GetLocalPlayerId()
	local playerData = UI.DebriefingWnd:GetDataForPlayer( playerId )

	local medalsData = playerData and playerData.medals
	if not medalsData then
		return medalsInfo
	end

	for medalType, levelsData in pairs( medalsData ) do

		for level, count in pairs( levelsData ) do
			if count > 0 then

				local medalInfo =
				{
					medalType	= medalType,
					level		= level,
					count		= count,
				}

				table.insert( medalsInfo, medalInfo )

			end
		end

	end

	local function fnSort( info1, info2 )

		if info1.medalType < info2.medalType then
			return true
		elseif info1.medalType > info2.medalType then
			return false
		end

		return info1.level < info2.level

	end

	table.sort( medalsInfo, fnSort )

	return medalsInfo

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_MedalSlot
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_MedalSlot = {}
local pgas = UI.Debriefing_GENERAL_MedalSlot

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_MedalSlot.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Debriefing_GENERAL_MedalSlot",
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
				defName				= "shop_items_slot_ico",
				defaultAnimation	= "active",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",	
						layer		= "UI.Debriefing_GENERAL_MedalSlot.layers.COUNT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_MedalSlot:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.COUNT )

	self.tooltipData = nil

end


--
function UI.Debriefing_GENERAL_MedalSlot:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

pgas.layers =
{
	MAIN_EFFECT	= 0,
	COUNT		= 1,
}

pgas.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico"
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_MedalSlot:UpdateForData( data )

	self:UpdateIco( data )
	self:UpdateCount( data )
	self:UpdateTooltipData( data )

end


--
function UI.Debriefing_GENERAL_MedalSlot:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not icoEffect then
		return
	end
	
	local hTex = UI:GetMedalIco( data.medalInfo.medalType, data.medalInfo.level )
	icoEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )	

end


--
function UI.Debriefing_GENERAL_MedalSlot:UpdateCount( data )

	local text = string.format( "x%d", data.medalInfo.count )
	self:SetText( text, self.layers.COUNT )

end


--
function UI.Debriefing_GENERAL_MedalSlot:UpdateTooltipData( data )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:Medal2Str( data.medalInfo.medalType, data.medalInfo.level ),
		text		= UI:GetMedalDesc( data.medalInfo.medalType, data.medalInfo.level ),		
	}

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Medals_LeftArrowBtn
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_Medals_LeftArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Debriefing_GENERAL_Medals_LeftArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "debriefing_GENERAL_medals_arrowLeft",
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

-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Medals_RightArrowBtn
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_Medals_RightArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name	= "Debriefing_GENERAL_Medals_RightArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "debriefing_GENERAL_medals_arrowRight",
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

-- -------------------------------------------------------------------
-- UI.Debriefing_PLAYERS_PlayersWnd
-- -------------------------------------------------------------------

UI.Debriefing_PLAYERS_PlayersWnd = {}
local pgp = UI.Debriefing_PLAYERS_PlayersWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name	= "Debriefing_PLAYERS_PlayersWnd",
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
				defName				= "debriefing_PLAYERS_players",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_1",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ALLY_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_2",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ALLY_STAT_KILLS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_3",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ALLY_STAT_ASSISTS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_4",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ALLY_STAT_GAMEPLAY_RELATED_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_5",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ALLY_STAT_EFFICIENCY_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_6",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ENEMY_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_7",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ENEMY_STAT_KILLS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_8",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ENEMY_STAT_ASSISTS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_9",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ENEMY_STAT_GAMEPLAY_RELATED_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_10",
						layer		= "UI.Debriefing_PLAYERS_PlayersWnd.layers.ENEMY_STAT_EFFICIENCY_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= "^debriefing_players",
		},

        -- ALLY_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_allyPlayers",
		},

        -- ALLY_STAT_KILLS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_KILLS",
		},

        -- ALLY_STAT_ASSISTS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_ASSISTS",
		},

        -- ALLY_STAT_GAMEPLAY_RELATED_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- ALLY_STAT_EFFICIENCY_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_EFFICIENCY",
		},

        -- ENEMY_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_enemyPlayers",
		},

        -- ENEMY_STAT_KILLS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_KILLS",
		},

        -- ENEMY_STAT_ASSISTS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_ASSISTS",
		},

        -- ENEMY_STAT_GAMEPLAY_RELATED_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- ENEMY_STAT_EFFICIENCY_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_playerStat_EFFICIENCY",
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersWnd:FullUpdate()

	self:Reset()

	self:UpdatePlayersList()
	self:UpdateHeaders()

end    


--
function UI.Debriefing_PLAYERS_PlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	for rowIdx = 1, self:GetNumRecords() do

		local rowWnd = self:GetButtonForRecord( rowIdx )
		if rowWnd then
			rowWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
		end

	end	

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	for rowIdx = 1, self:GetNumRecords() do

		local rowWnd = self:GetButtonForRecord( rowIdx )
		if rowWnd then
			rowWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
		end

	end

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:OnLikesChanged()

	for rowIdx = 1, self:GetNumRecords() do

		local rowWnd = self:GetButtonForRecord( rowIdx )
		if rowWnd then
			rowWnd:OnLikesChanged()
		end

	end	

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:OnAccountRankChanged()

	for rowIdx = 1, self:GetNumRecords() do

		local rowWnd = self:GetButtonForRecord( rowIdx )
		if rowWnd then
			rowWnd:OnAccountRankChanged()
		end

	end

end


-- ------------------------------
-- const
-- ------------------------------

pgp.btnPrototypeName	= "Debriefing_PLAYERS_PlayersRow"

pgp.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

pgp.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

pgp.MAX_SLOTS = 11

pgp.layers =
{
	MAIN_EFFECT							= 0,
	CAPTION								= 1,
    ALLY_HEADER							= 2,
    ALLY_STAT_KILLS_HEADER				= 3,
    ALLY_STAT_ASSISTS_HEADER			= 4,
    ALLY_STAT_GAMEPLAY_RELATED_HEADER	= 5,
    ALLY_STAT_EFFICIENCY_HEADER			= 6,
    ENEMY_HEADER						= 7,
    ENEMY_STAT_KILLS_HEADER				= 8,
    ENEMY_STAT_ASSISTS_HEADER			= 9,
    ENEMY_STAT_GAMEPLAY_RELATED_HEADER	= 10,
    ENEMY_STAT_EFFICIENCY_HEADER		= 11,
}

pgp.relationships =
{
	ALLY	= 1,
	ENEMY	= 2,
}

pgp.statTypes =
{
    KILLS		= 1,
    ASSISTS		= 2,
    CAPTURES	= 3,
    EFFICIENCY	= 4,
}

-- ------------------------------
-- work functions
-- ------------------------------   

--
function UI.Debriefing_PLAYERS_PlayersWnd:Reset()

	self:Clear()

	self:SetText( "", self.layers.ALLY_STAT_GAMEPLAY_RELATED_HEADER )
	self:SetText( "", self.layers.ENEMY_STAT_GAMEPLAY_RELATED_HEADER )

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:UpdatePlayersList()

	local playersInfo = UI.DebriefingWnd:GetPlayers()
	if not next( playersInfo ) then
		return
	end

	-- make datas by relationship

	local localPlayerId		= UI.DebriefingWnd:GetLocalPlayerId()
	local localPlayerTeam	= UI.DebriefingWnd:GetLocalPlayerTeam()
	local gameplay = UI.DebriefingWnd:GetGameplay()

	local itemDatas = {}

	for idx, playerInfo in pairs( playersInfo ) do

		local playerTeam = playerInfo.team
		if playerTeam ~= 0 then

    		local relationship = playerTeam == localPlayerTeam and self.relationships.ALLY or self.relationships.ENEMY

    		local itemData = {}
    		itemData.playerInfo		= playerInfo	-- раньше playerInfo получалась из GetAllPlayersInfo(); сейчас это поле идентично debriefData; не убрано, чтобы было меньше исправлений
    		itemData.debriefData	= playerInfo
    		itemData.relationship	= relationship
			itemData.bLocal			= playerInfo.playerId == localPlayerId

			if gameplay == ai.Gameplay.THREE_TEAMS_DM and relationship == UI.Debriefing_PLAYERS_PlayersWnd.relationships.ENEMY then
				local bSecondEnemy = UI:IsThreeTeamsDMSecondEnemy( localPlayerTeam, playerTeam )
				itemData.enemyTeamIdx = bSecondEnemy and 2 or 1
			end

    		local itemDatasByRelationship = itemDatas[ relationship ]
    		if not itemDatasByRelationship then
    			itemDatasByRelationship = {}
    			itemDatas[ relationship ] = itemDatasByRelationship
    		end

    		table.insert( itemDatasByRelationship, itemData )

		end

	end

	local numPlayers = {}
	for relationship, itemDatasByRelationship in pairs( itemDatas ) do
		numPlayers[ relationship ] = #itemDatasByRelationship
	end

	-- sort by efficiency

	local fnLessByEfficiency = function( data1, data2 )

		local points1 = data1.debriefData.pointTotal or 0
		local points2 = data2.debriefData.pointTotal or 0

		if data1.enemyTeamIdx and data2.enemyTeamIdx and data1.enemyTeamIdx ~= data2.enemyTeamIdx then
			return data1.enemyTeamIdx < data2.enemyTeamIdx
		end

		return points1 > points2

	end

	for relationship, itemDatasByRelationship in pairs( itemDatas ) do
		table.sort( itemDatasByRelationship, fnLessByEfficiency )
	end


	-- make records

	local maxPlayersByRelationship = 0

	for relationship, numPlayersRelationship in pairs( numPlayers ) do
		if numPlayersRelationship > maxPlayersByRelationship then
			maxPlayersByRelationship = numPlayersRelationship
		end
	end

	for rowIdx = 1, maxPlayersByRelationship do
		
		local rowData = { items = {} }

		for relationship, itemDatasByRelationship in pairs( itemDatas ) do
			rowData.items[ relationship ] = itemDatasByRelationship[ rowIdx ] 
		end

		self:AddRecord( rowData )

	end

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do
		local rowWnd = self:GetButtonForRecord( recordIdx )
		if rowWnd then
			local data = self:GetRecordData( recordIdx )
			rowWnd:UpdateForData( data )
		end
	end

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:UpdateHeaders()

	local str = ""
	local gameplay = UI.DebriefingWnd:GetGameplay()

	if gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then
		str = UI:GetStringByName( "debriefing_playerStat_bombsPlanted" )

	elseif gameplay == ai.Gameplay.SENTINEL then
		str = UI:GetStringByName( "debriefing_playerStat_sentinelKills" )

	elseif gameplay == ai.Gameplay.TDM or gameplay == ai.Gameplay.GTDM or gameplay == ai.Gameplay.ATDM then	
		str = ""

	else
		str = UI:GetStringByName( "debriefing_playerStat_CAPTURES" )
	end

	self:SetText( str, self.layers.ALLY_STAT_GAMEPLAY_RELATED_HEADER )
	self:SetText( str, self.layers.ENEMY_STAT_GAMEPLAY_RELATED_HEADER )

end


--
function UI.Debriefing_PLAYERS_PlayersWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0 )

	return true

end

-- -------------------------------------------------------------------
-- UI.Debriefing_PLAYERS_PlayersRow
-- -------------------------------------------------------------------

UI.Debriefing_PLAYERS_PlayersRow = {}
local pgpr =  UI.Debriefing_PLAYERS_PlayersRow

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersRow.def =
{
	className		= "Wnd",
	prototype		= "ButtonsList3_Btn",

	props =
	{
		name		= "Debriefing_PLAYERS_PlayersRow",
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
				defName				= "debriefing_PLAYERS_players_row",
				defaultAnimation	= "friend",

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

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersRow:Reset()

	for relationship, itemWnd in pairs( self.items ) do
		self:HideItem( relationship )
	end

end


--
function UI.Debriefing_PLAYERS_PlayersRow:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	local data = self:GetRecordData()

	for relationship, itemWnd in pairs( self.items ) do
		if itemWnd:IsChildOf( self ) then
		
			local itemData = data.items[ relationship ]
			if itemData then
			
				local playerCid = UI:GetPlayerClanById( itemData.playerInfo.playerId )
				if playerCid == cid then
					itemWnd:UpdatePalyerName( itemData )
				end
				
			end

		end
	end

end


--
function UI.Debriefing_PLAYERS_PlayersRow:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end
	
	local data = self:GetRecordData()

	for relationship, itemWnd in pairs( self.items ) do
		if itemWnd:IsChildOf( self ) then
		
			local itemData = data.items[ relationship ]
			if itemData then
			
				local playerUid = itemData.playerInfo.isBot and itemData.playerInfo.botUid or itemData.playerInfo.uid
				if playerUid == uid then
					itemWnd:UpdatePalyerName( itemData )
				end
				
			end

		end
	end
	
end


--
function UI.Debriefing_PLAYERS_PlayersRow:OnLikesChanged()

	for relationship, itemWnd in pairs( self.items ) do
		if itemWnd:IsChildOf( self ) then
			itemWnd:OnLikesChanged()
		end
	end

end


--
function UI.Debriefing_PLAYERS_PlayersRow:OnAccountRankChanged()
	
	for relationship, itemWnd in pairs( self.items ) do
		if itemWnd:IsChildOf( self ) then
			itemWnd:OnAccountRankChanged()
		end
	end

end


-- ------------------------------
-- const
-- ------------------------------

pgpr.effectInfo =
{
	main =
	{
		slotPrefixByRelationship =
		{
			[ pgp.relationships.ALLY ]	= "slot_1",
			[ pgp.relationships.ENEMY]	= "slot_2",
		}
	}
}

pgpr.itemPrototypeName = "Debriefing_PLAYERS_PlayersItem"

-- ------------------------------
-- vars
-- ------------------------------

pgpr.items = {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersRow:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.items = {}	
	self:InitItems()

end


--
function UI.Debriefing_PLAYERS_PlayersRow:InitItems()

	local tItemProto = UI[ self.itemPrototypeName ]

	for relationshipName, relationship in pairs( UI.Debriefing_PLAYERS_PlayersWnd.relationships ) do

		local itemWnd = UI:CreateChildWnd( self, tItemProto, relationshipName )
		self.items[ relationship ] = itemWnd

	end

end


--
function UI.Debriefing_PLAYERS_PlayersRow:ShowItem( relationship )

	local itemWnd = self.items[ relationship ]

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locator = self.effectInfo.main.slotPrefixByRelationship[ relationship ]

	UI:AddChildAndLink( self, itemWnd, mainEffect, locator, UI.EffectAnimParams.POS )

end


--
function UI.Debriefing_PLAYERS_PlayersRow:HideItem( relationship )

	local itemWnd = self.items[ relationship ]

	itemWnd:Reset()
	itemWnd:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UnlinkWnd( itemWnd:GetUiHandle(), "" )
	end

end


--
function UI.Debriefing_PLAYERS_PlayersRow:UpdateForData( data )

	for relationshipName, relationship in pairs( UI.Debriefing_PLAYERS_PlayersWnd.relationships ) do

		local itemWnd = self.items[ relationship ]
		local itemData = data.items and data.items[ relationship ]

		local bNeedItem = itemData ~= nil
		local bIsItem = itemWnd:IsChildOf( self )

		if bNeedItem then

			if not bIsItem then
				self:ShowItem( relationship )
			end

			itemWnd:UpdateForData( itemData )
		
		else
			if bIsItem then
				self:HideItem( relationship )
			end
		end

	end

end


-- -------------------------------------------------------------------
-- UI.Debriefing_PLAYERS_PlayersItem
-- -------------------------------------------------------------------

UI.Debriefing_PLAYERS_PlayersItem = {}
local pgpi = UI.Debriefing_PLAYERS_PlayersItem

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersItem.def =
{
	className = "Wnd",

	props =
	{
		name		= "Debriefing_PLAYERS_PlayersItem",
		style		= UI.WS_UPDATE_IF_VISIBLE,
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
				defName				= "debriefing_PLAYERS_players_item",
				defaultAnimation	= "friend",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "|",	
						layer		= "UI.Debriefing_PLAYERS_PlayersItem.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "kills",	
						layer		= "UI.Debriefing_PLAYERS_PlayersItem.layers.STAT_KILLS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "help",	
						layer		= "UI.Debriefing_PLAYERS_PlayersItem.layers.STAT_ASSISTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "capture",	
						layer		= "UI.Debriefing_PLAYERS_PlayersItem.layers.STAT_GAMEPLAY_RELATED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "efficiency",	
						layer		= "UI.Debriefing_PLAYERS_PlayersItem.layers.STAT_EFFICIENCY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STAT_KILLS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STAT_ASSISTS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STAT_GAMEPLAY_RELATED
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STAT_EFFICIENCY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersItem:Reset()

	self:SetText( "", self.layers.PLAYER_NAME )
	self:SetText( "", self.layers.STAT_KILLS )
	self:SetText( "", self.layers.STAT_ASSISTS )
	self:SetText( "", self.layers.STAT_GAMEPLAY_RELATED )
	self:SetText( "", self.layers.STAT_EFFICIENCY )

	for shipSlotIdx = 1, self.MAX_SHIP_SLOTS do
		self:ResetShipSlot( shipSlotIdx )
	end

	self.likeBtn:Reset()
	self.likeBtn:UnlinkFromParent()

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdateForData( data )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdatePalyerName( data )
	self:UpdateShips( data )
	self:UpdateStats( data )
	self:UpdateLikeBtn( data )

	self.data = data

end


--
function UI.Debriefing_PLAYERS_PlayersItem:OnLikesChanged()

	self.likeBtn:OnLikesChanged()

end


--
function UI.Debriefing_PLAYERS_PlayersItem:OnAccountRankChanged()
	
	for shipSlotIdx, shipWnd in pairs( self.shipWnds ) do
	
		if shipWnd:IsChildOf( self ) then
			shipWnd:OnAccountRankChanged()
		end
	
	end
	
end


-- ------------------------------
-- const
-- ------------------------------

pgpi.layers =
{
	MAIN_EFFECT				= 0,
    PLAYER_NAME				= 1,
    STAT_KILLS				= 2,
    STAT_ASSISTS			= 3,
    STAT_GAMEPLAY_RELATED	= 4,
    STAT_EFFICIENCY			= 5,
}

pgpi.MAX_SHIP_SLOTS = 4

pgpi.effectInfo =
{
	main =
	{
		animLocal			= "myself",
		animSquad			= "squad",
		animAlly			= "friend",
		animEnemy			= "enemy",
		animEnemy2			= "enemy_2",
		shipLocatorPrefix	= "ship_ico_",
		likeBtnLocator		= "like",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

pgpi.data		= nil

pgpi.shipWnds	= {}
pgpi.likeBtn	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersItem:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.shipWnds = {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Debriefing_PLAYERS_PlayersItem:CreateControls()

	for shipSlotIdx = 1, self.MAX_SHIP_SLOTS do

		local shipWnd = UI:CreateChildWnd( self, UI.Debriefing_PLAYERS_PlayersShipWnd, tostring( shipSlotIdx ) )
		table.insert( self.shipWnds, shipWnd )		

	end

	self.likeBtn = UI:CreateChildWnd( self, UI.Debriefing_PLAYERS_PlayersLikeBtn, "" )

end


--
function UI.Debriefing_PLAYERS_PlayersItem:ShowShipSlot( shipSlotIdx, shipInfo, playerId )

	local shipWnd = self.shipWnds[ shipSlotIdx ]
	if not shipWnd then
		sys.log( "UI.Debriefing_PLAYERS_PlayersItem:ShowShipSlot()[ERROR]: cannot fund shipWnd for slot %s", tostring( shipSlotIdx ) )
		return
	end
	
	self:AddChild( shipWnd )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( shipWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.shipLocatorPrefix, shipSlotIdx ), UI.EffectAnimParams.POS )
	end

	shipWnd:Setup( shipInfo, playerId )

end


--
function UI.Debriefing_PLAYERS_PlayersItem:ResetShipSlot( shipSlotIdx )

	local shipWnd = self.shipWnds[ shipSlotIdx ]
	if not shipWnd then
		sys.log( "UI.Debriefing_PLAYERS_PlayersItem:ResetShipSlot()[ERROR]: cannot fund shipWnd for slot %s", tostring( shipSlotIdx ) )
		return
	end

	shipWnd:Reset()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( shipWnd:GetUiHandle(), "" )
	end

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if data.bLocal then
		anim = self.effectInfo.main.animLocal

	elseif data.relationship == UI.Debriefing_PLAYERS_PlayersWnd.relationships.ALLY then
		anim = self.effectInfo.main.animAlly

	elseif data.relationship == UI.Debriefing_PLAYERS_PlayersWnd.relationships.ENEMY then

		if data.enemyTeamIdx ~= nil and data.enemyTeamIdx == 2 then
			anim = self.effectInfo.main.animEnemy2
		else
			anim = self.effectInfo.main.animEnemy
		end

	else
		sys.log( "UI.Debriefing_PLAYERS_PlayersItem:UpdateMainAnimation()[ERROR]: unhandled case" )
	end

	mainEffect:StartAnimation( anim )

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdatePalyerName( data )
	
	local name = UI:MakePlayerNameById( data.playerInfo.playerId, true, false, nil, data.playerInfo )
	
	local squadName = UI:MakePlayerSquadName( data.playerInfo.playerId )
	if squadName ~= "" then

		local bFriend = data.relationship == UI.Debriefing_PLAYERS_PlayersWnd.relationships.ALLY
		local squadColor = bFriend and UI.FRIEND_COLOR or UI.ENEMY_COLOR

		name = string.format( "%s%s) %s", UI:Color2Str( squadColor ), squadName, name )

	end
	
	self:SetText( name, self.layers.PLAYER_NAME )

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdateShips( data )

	local shipsInfo = UI.DebriefingWnd:GetPlayerAvailableShips( data.playerInfo.playerId )
	if not shipsInfo then
		return
	end	

	local shipsInfoBySlot = {}
	for idx, shipInfo in pairs( shipsInfo ) do
		shipsInfoBySlot[ shipInfo.hangarIdx + 1 ] = shipInfo
	end

	local visibleSlotIdx = 1

	for slotIdx = 1, self.MAX_SHIP_SLOTS do

		local shipInfo = shipsInfoBySlot[ slotIdx ]
		if shipInfo then

			-- #0034565 - показывются только корабли, реально вылетавшие в бой
		    local bWasSpawn = false

			if data.debriefData.vessels then
				for debriefShipIdx, debriefShipInfo in pairs( data.debriefData.vessels ) do

					if debriefShipInfo.hangarIdx == shipInfo.hangarIdx then

    					if debriefShipInfo.numSpawns and debriefShipInfo.numSpawns > 0 then
    						bWasSpawn = true
    					end

    					break

					end
				end	
			end
			
			if bWasSpawn then
				self:ShowShipSlot( visibleSlotIdx, shipInfo, data.playerInfo.playerId )
				visibleSlotIdx = visibleSlotIdx + 1
			end

		end

	end

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdateStats( data )

	-- убийства

	local val_KILLS = data.debriefData and data.debriefData.kills or 0
	local str_KILLS = tostring( val_KILLS )
	self:SetText( str_KILLS, self.layers.STAT_KILLS )

	-- ассисты

	local val_ASSISTS = data.debriefData and data.debriefData.assists or 0
	local str_ASSISTS = tostring( val_ASSISTS )
	self:SetText( str_ASSISTS, self.layers.STAT_ASSISTS )

	-- статистика, зависящая от геймплея

	local str_GAMEPLAY_RELATED = ""
	local gameplay = UI.DebriefingWnd:GetGameplay()

	if gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then
		local val_GAMEPLAY_RELATED = data.debriefData and data.debriefData.bombsPlanted or 0
		str_GAMEPLAY_RELATED = tostring( val_GAMEPLAY_RELATED )

	elseif gameplay == ai.Gameplay.SENTINEL then
		local val_GAMEPLAY_RELATED = data.debriefData and data.debriefData.sentinelKills or 0
		str_GAMEPLAY_RELATED = tostring( val_GAMEPLAY_RELATED )

	elseif gameplay == ai.Gameplay.TDM or gameplay == ai.Gameplay.GTDM or gameplay == ai.Gameplay.ATDM then	
		str_GAMEPLAY_RELATED = ""

	else
		local val_GAMEPLAY_RELATED = data.debriefData and data.debriefData.vpCapture or 0
		str_GAMEPLAY_RELATED = tostring( val_GAMEPLAY_RELATED )
	end

	self:SetText( str_GAMEPLAY_RELATED, self.layers.STAT_GAMEPLAY_RELATED )

	-- эффективность

	local val_EFFICIENCY = data.debriefData.pointTotal or 0
	local str_EFFICIENCY = tostring( val_EFFICIENCY )
	self:SetText( str_EFFICIENCY, self.layers.STAT_EFFICIENCY )	

end


--
function UI.Debriefing_PLAYERS_PlayersItem:UpdateLikeBtn( data )

	if not data.playerInfo.isBot or data.playerInfo.botUid ~= UI.INVALID_U64_ID then

		self.likeBtn:Setup( data.playerInfo.playerId )

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.likeBtn, mainEffect, self.effectInfo.main.likeBtnLocator, UI.EffectAnimParams.POS )

	end

end


--
function UI.Debriefing_PLAYERS_PlayersItem:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	self:TryShowContextMenu()
	
	return true
	
end


--
function UI.Debriefing_PLAYERS_PlayersItem:TryShowContextMenu()

	local uid = self.data.playerInfo.isBot and self.data.playerInfo.botUid or self.data.playerInfo.uid
	if uid == UI.INVALID_U64_ID then
		return
	end
	
	local localPlayerData = UI.DebriefingWnd:GetDataForPlayer( UI.DebriefingWnd:GetLocalPlayerId() )

	UI.ContextMenu:Clear()
	UI.ContextMenu:SetName( self.data.playerInfo.nickName )
	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.COMPLAINT_CHAT, uid, { fromName = localPlayerData.nickName, toName = self.data.playerInfo.nickName, tabId = UI.Chat:GetCurrentTab() }, self.data.playerInfo.isBot )
	UI.ContextMenu:Show( mouseX, mouseY )

end


-- -------------------------------------------------------------------------------------------
-- UI.Debriefing_PLAYERS_PlayersShipWnd
-- -------------------------------------------------------------------------------------------

UI.Debriefing_PLAYERS_PlayersShipWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Debriefing_PLAYERS_PlayersShipWnd",
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
				defName 			= "playerSlot_ship",

				links =
				{		
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "ship_type",
						layer		= "UI.Debriefing_PLAYERS_PlayersShipWnd.layers.ROLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- ROLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipType_small",
				defaultAnimation	= "idle",
			}}
		}, 
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersShipWnd:Reset()	

    self.shipInfo		= nil
	self.playerId		= -1
    self.relationship	= -1
    self.tooltipData	= nil

	self:SetLayerVisible( false, self.layers.ROLE_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.shipIcoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:Setup( shipInfo, playerId )

	self:Reset()

	self.shipInfo		= shipInfo
	self.playerId		= playerId

	local localPlayerTeam	= UI.DebriefingWnd:GetLocalPlayerTeam()
	local playerData		= UI.DebriefingWnd:GetDataForPlayer( playerId )
    local playerTeam		= playerData.team

    self.relationship = playerTeam == localPlayerTeam and UI.Debriefing_PLAYERS_PlayersWnd.relationships.ALLY or UI.Debriefing_PLAYERS_PlayersWnd.relationships.ENEMY

	self:UpdateState()
	self:UpdateIco()
	self:UpdateRole()
	self:UpdateTooltip()

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:OnAccountRankChanged()

	self:UpdateTooltip()
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersShipWnd.layers =
{
    MAIN_EFFECT	= 0,
    ROLE_EFFECT	= 1,
}

UI.Debriefing_PLAYERS_PlayersShipWnd.effectInfo =
{
	main =
	{
		shipIcoSpriteName	= "ico",

		animsByRelationship =
		{
			[ pgp.relationships.ALLY ] =
			{
				ready		= "friend_live",
				destroyed	= "friend_dead",
				disabled	= "friend_dead",
			},

			[ pgp.relationships.ENEMY ] =
			{
				ready		= "enemy_live",
				destroyed	= "enemy_dead",
				disabled	= "enemy_dead",
			}
		}
	},

	role =
	{
		icoSpriteName	= "ico"
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersShipWnd.shipInfo		= nil
UI.Debriefing_PLAYERS_PlayersShipWnd.playerId		= -1
UI.Debriefing_PLAYERS_PlayersShipWnd.relationship	= -1
UI.Debriefing_PLAYERS_PlayersShipWnd.tooltipData	= nil


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateState()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if not self.shipInfo then
		sys.log( "UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateState()[ERROR]: nil shipInfo" )
		return
	end

	local status = UI.DebriefingWnd:GetPlayerHangarStatus( self.playerId, self.shipInfo.hangarIdx )

	local anims = self.effectInfo.main.animsByRelationship[ self.relationship ]
	local anim = ""

	if status == ai.HangarStatus.KILLED then
		anim = anims.destroyed

	-- в реальности DISABLED корабли не рисуются никогда, т.к. показываются только те, которые вылетали в бой (#0034565), а DISABLED не могли вылетать
	elseif status == ai.HangarStatus.DISABLED or status == ai.HangarStatus.SUSPENDED then
		anim = anims.disabled

	else
		anim = anims.ready
	end

	mainEffect:StartAnimation( anim )	

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if not self.shipInfo then
		sys.log( "UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateIco()[ERROR]: nil shipInfo" )
		return
	end
	
	local hTex = UI:GetShipSmallIco( self.shipInfo.baseDef )
	mainEffect:SetSpriteTexture( self.effectInfo.main.shipIcoSpriteName, hTex )

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateRole()

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if not roleEffect then
		return
	end

	if not self.shipInfo then
		sys.log( "UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateRole()[ERROR]: nil shipInfo" )
		return
	end

	self:SetLayerVisible( true, self.layers.ROLE_EFFECT )

	local role = UI:GetItemRole( self.shipInfo.baseDef )

	local hTex = UI:GetRoleIco4( role )
	roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, hTex )

end


--
function UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateTooltip()

	self.tooltipData = nil
	
	if not self.shipInfo then
		sys.log( "UI.Debriefing_PLAYERS_PlayersShipWnd:UpdateTooltip()[ERROR]: nil shipInfo" )
		return
	end
	
	local bCanShowTooltip = true
	if _G.MasterServer_IsConnected() then
		if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
			bCanShowTooltip = false
		end
	end
	
	if bCanShowTooltip then

		self.tooltipData =
		{
			tooltipType			= UI.tooltipTypes.SHIP,
			defName				= self.shipInfo.baseDef,
			shipInfo			= self.shipInfo,
			playerId			= self.playerId,
			playerUid			= UI.DebriefingWnd:GetDataForPlayer( self.playerId ).uid,
		}
		
	end

end


-- -------------------------------------------------------------------------------------------
-- UI.Debriefing_PLAYERS_PlayersLikeBtn
-- -------------------------------------------------------------------------------------------

UI.Debriefing_PLAYERS_PlayersLikeBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersLikeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Debriefing_PLAYERS_PlayersLikeBtn",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "debriefing_PLAYERS_players_like",

				links =
				{		
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "like_value",	
						layer		= "UI.Debriefing_PLAYERS_PlayersLikeBtn.layers.VAL",
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
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:Setup( playerId )

	self:Reset()

	self.playerId = playerId

	self:FullUpdate()

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:Reset()

	self.playerId = -1
	self.tooltipData = nil

	self:Check( false )
	self:SetGray( true )
	
end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:GetPlayerId()

	return self.playerId

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:OnLikesChanged()

	self:FullUpdate()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersLikeBtn.layers =
{
    MAIN_EFFECT	= 0,
    VAL			= 1,
}

UI.Debriefing_PLAYERS_PlayersLikeBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "idle_over",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "chek_over",
		animationDisabled	= "disable_chek",
	},

	animNoIco				= "empty",
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Debriefing_PLAYERS_PlayersLikeBtn.playerId		= -1
UI.Debriefing_PLAYERS_PlayersLikeBtn.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:FullUpdate()

	self:UpdateState()
	self:UpdateVal()
	self:UpdateTooltip()

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:UpdateState()

	local localPlayerId	= UI.DebriefingWnd:GetLocalPlayerId()

	if self.playerId == localPlayerId then

		self:Check( false )
		self:SetGray( false )

	elseif UI.DebriefingWnd:IsLocalPlayerObserver() then

		self:Check( false )
		self:SetGray( true )

	else

    	local likedPlayerId	= UI.DebriefingWnd:GetLikeForPlayer( localPlayerId )    	

    	self:Check( self.playerId == likedPlayerId )
		self:SetGray( likedPlayerId ~= -1 and likedPlayerId ~= self.playerId )

	end

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:UpdateVal()

	local str = ""

	local likers = UI.DebriefingWnd:GetLikersForPlayer( self.playerId )
	local numLikers = #likers

	if numLikers > 0 then
		str = tostring( numLikers )
	end

	self:SetText( str, self.layers.VAL )

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:UpdateTooltip()

	self.tooltipData = nil

	local likers = UI.DebriefingWnd:GetLikersForPlayer( self.playerId )
	if next( likers ) then

    	table.sort( likers )

    	self.tooltipData = {}

    	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
    	self.tooltipData.caption		= UI:GetStringByName( "tooltip_like_caption" )

    	self.tooltipData.text = UI:GetStringByName( "tooltip_like_text" )	

    	local strLikers = ""
    	for likerIdx = 1, #likers do

    		local likerId = likers[ likerIdx ]		
			local playerInfo = UI.DebriefingWnd:GetDataForPlayer( likerId )

    		local likerName = UI:MakePlayerNameById( likerId, false, false, nil, playerInfo )

    		strLikers = string.format( "%s%s%s", strLikers, strLikers ~= "" and ", " or "", likerName )

    	end

    	self.tooltipData.text = string.gsub( self.tooltipData.text, "%$players%$", strLikers )

	end

	if UI:GetCurTooltipTarget() == self then

		if self.tooltipData then		

    		local tooltipWnd = UI:GetCurTooltip()
    		if tooltipWnd then
    			tooltipWnd:Setup( self.tooltipData, true )
    		end

		else
			UI:ResetTooltip()
		end

	end

end


--
function UI.Debriefing_PLAYERS_PlayersLikeBtn:UpdateEffectAnimation()

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() ~= 0 and self.playerId == UI.DebriefingWnd:GetLocalPlayerId() then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( self.effectInfo.animNoIco )

	else

		UI.EffectCheckBoxWnd.UpdateEffectAnimation( self )

	end

end


-- -------------------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_LootWnd
-- -------------------------------------------------------------------------------------------

UI.Debriefing_GENERAL_LootWnd = {}
local pgl = UI.Debriefing_GENERAL_LootWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_LootWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Debriefing_GENERAL_LootWnd",
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
				defName				= "debriefing_GENERAL_loot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Debriefing_GENERAL_LootWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",	
						layer		= "UI.Debriefing_GENERAL_LootWnd.layers.NO_LOOT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_left1",	
						wnd			= "UI.Debriefing_GENERAL_Loot_LeftArrowBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_right1",	
						wnd			= "UI.Debriefing_GENERAL_Loot_RightArrowBtn",
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
			text			= "^debriefing_lootCaption",
		},

		-- NO_LOOT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^debriefing_noLoot",
		},
	},

	children = { "UI.Debriefing_GENERAL_Loot_LeftArrowBtn", "UI.Debriefing_GENERAL_Loot_RightArrowBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_LootWnd:FullUpdate()

	self:Reset()

	self.lootItems = UI.DebriefingWnd:GetLootItems()

	if next( self.lootItems ) then
		self:SetFirstVisibleItemIdx( 1 )
	end

	self:SetLayerVisible( not next( self.lootItems ), self.layers.NO_LOOT_TEXT )

end


-- ------------------------------
-- const
-- ------------------------------

pgl.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    NO_LOOT_TEXT	= 2,
}

pgl.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "loot_",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

pgl.leftArrow			= nil
pgl.rightArrow			= nil
pgl.lootItems			= {}
pgl.curSlots			= {}
pgl.allItemSlots		= {}
pgl.allShipPartSlots	= {}
pgl.space_slots			= 0
pgl.slotsY				= 0
pgl.slotsMinX			= 0
pgl.slotsMaxWidth		= 0
pgl.firstVisibleItemIdx	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_LootWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.leftArrow	= UI.Debriefing_GENERAL_Loot_LeftArrowBtn
	self.rightArrow	= UI.Debriefing_GENERAL_Loot_RightArrowBtn

	self:InitSlots()
	self:PrepareLayout()

	self:Reset()

end


--
function UI.Debriefing_GENERAL_LootWnd:Reset()

	self.lootItems = {}
	self:SetFirstVisibleItemIdx( -1 )
	self:SetLayerVisible( false, self.layers.NO_LOOT_TEXT )

end


--
function UI.Debriefing_GENERAL_LootWnd:InitSlots()

	for slotIdx = 1, 3 do
		self:CreateItemSlot()
	end

	for slotIdx = 1, 1 do
		self:CreateShipPartSlot()
	end

end


--
function UI.Debriefing_GENERAL_LootWnd:CreateItemSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Debriefing_GENERAL_Loot_SlotWnd, tostring( #self.allItemSlots + 1 ) )
	table.insert( self.allItemSlots, slotWnd )

	return slotWnd	

end


--
function UI.Debriefing_GENERAL_LootWnd:CreateShipPartSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipPartIcoWnd, tostring( #self.allShipPartSlots + 1 ) )
	table.insert( self.allShipPartSlots, slotWnd )

	return slotWnd	

end


--
function UI.Debriefing_GENERAL_LootWnd:ObtainFreeItemSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allItemSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateItemSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
		table.insert( self.curSlots, freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.Debriefing_GENERAL_LootWnd:ObtainFreeShipPartSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allShipPartSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateShipPartSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
		table.insert( self.curSlots, freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.Debriefing_GENERAL_LootWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSlots = {}

end


--
function UI.Debriefing_GENERAL_LootWnd:UpdateSlots()

	self:ResetSlots()

	if self.firstVisibleItemIdx == -1 then
		return
	end


	local itemSlotIdx, itemSlotWnd			= next( self.allItemSlots )
	local shipPartSlotIdx, shipPartSlotWnd	= next( self.allShipPartSlots )

	local itemSlotWidth		= itemSlotWnd:GetWidth()
	local shipPartSlotWidth	= shipPartSlotWnd:GetWidth()


	local slotsWidth = 0

	for itemIdx = self.firstVisibleItemIdx, #self.lootItems do

		local lootItem = self.lootItems[ itemIdx ]

		local bShipPart = not lootItem.bAccountAura and UI:IsDefShipPart( lootItem.defName )	
		local slotWidth = bShipPart and shipPartSlotWidth or itemSlotWidth

		local space_slots = itemIdx == self.firstVisibleItemIdx and 0 or self.space_slots
		if slotsWidth + space_slots + slotWidth > self.slotsMaxWidth + 1 then
			break
		end
		
		if bShipPart then
			local slotWnd = self:ObtainFreeShipPartSlot()
			slotWnd:Setup( lootItem.defName, lootItem.amount )
		else
			local slotWnd = self:ObtainFreeItemSlot()
			slotWnd:Setup( lootItem )
		end

		slotsWidth = slotsWidth + space_slots + slotWidth

	end

	
	local x = self.slotsMinX + ( self.slotsMaxWidth - slotsWidth ) / 2

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		slotWnd:SetLeft( x )
		slotWnd:SetTop( self.slotsY )

		x = x + self.space_slots + slotWnd:GetWidth()

	end

end


--
function UI.Debriefing_GENERAL_LootWnd:UpdateArrows()

	if #self.curSlots == #self.lootItems then

		self.leftArrow:UnlinkFromParent()
		self.rightArrow:UnlinkFromParent()

		return

	end

	self:AddChild( self.leftArrow )
	self:AddChild( self.rightArrow )

	self.leftArrow:Enable( self:CanScroll( true ) )
	self.rightArrow:Enable( self:CanScroll( false ) )

end


--
function UI.Debriefing_GENERAL_LootWnd:SetFirstVisibleItemIdx( firstVisibleItemIdx )

	if firstVisibleItemIdx ~= -1 and ( firstVisibleItemIdx < 1 or firstVisibleItemIdx > #self.lootItems ) then
		sys.log( "UI.Debriefing_GENERAL_LootWnd:SetFirstVisibleItemIdx()[ERROR]: invalid item idx %d", firstVisibleItemIdx )
		return
	end 

	self.firstVisibleItemIdx = firstVisibleItemIdx

	self:UpdateSlots()
	self:UpdateArrows()

end


--
function UI.Debriefing_GENERAL_LootWnd:Scroll( bLeft )

	if not self:CanScroll( bLeft ) then
		sys.log( "UI.Debriefing_GENERAL_LootWnd:Scroll()[ERROR]: cannot scroll this direction" )
		return
	end

	local itemIdx = bLeft and ( self.firstVisibleItemIdx - 1 ) or ( self.firstVisibleItemIdx + 1 )
	self:SetFirstVisibleItemIdx( itemIdx )

end


--
function UI.Debriefing_GENERAL_LootWnd:CanScroll( bLeft )

	if self.firstVisibleItemIdx == -1 then
		return false
	end

	if bLeft then
		return self.firstVisibleItemIdx > 1
	else
		local lastVisibleItemIdx = self.firstVisibleItemIdx + #self.curSlots - 1
		return lastVisibleItemIdx < #self.lootItems

	end

end


--
function UI.Debriefing_GENERAL_LootWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.leftArrow then
		self:Scroll( true )

	elseif wnd == self.rightArrow then
		self:Scroll( false )
	end

	return true

end


--
function UI.Debriefing_GENERAL_LootWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self.allItemSlots[ 1 ]

	local NUM_SLOT_LOCATORS = 6

	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, NUM_SLOT_LOCATORS ) ) or Vec2( 0, 0 )
	local slotWidth		= slotWnd and slotWnd:GetWidth() or 0
	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	self.space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	self.slotsY			= firstSlotPos.y
	self.slotsMinX		= firstSlotPos.x
	self.slotsMaxWidth	= ( lastSlotPos.x + slotWidth ) - firstSlotPos.x

end


-- -------------------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Loot_SlotWnd
-- -------------------------------------------------------------------------------------------

UI.Debriefing_GENERAL_Loot_SlotWnd = {}
local pgls = UI.Debriefing_GENERAL_Loot_SlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_Loot_SlotWnd.def =
{
	className		= "Wnd",
	prototype		= "ItemIcoWnd",

	props =
	{
		name		= "Debriefing_GENERAL_Loot_SlotWnd",
		isPrototype	= true,
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_Loot_SlotWnd:Setup( lootItem )

	self:Reset()

	self.lootItem = lootItem
	self:FullUpdate()

end


--
function UI.Debriefing_GENERAL_Loot_SlotWnd:Reset()

	UI.ItemIcoWnd.Reset( self )

	self.lootItem = nil

end

-- ------------------------------
-- vars
-- ------------------------------

pgls.lootItem	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_Loot_SlotWnd:FullUpdate()

	local salvagePriceType		= UI.junkPriceTypes.NONE
	local salvagePriceVal		= 0

	if self.lootItem.bSalvaged then

		if self.lootItem.tokensEarned > 0 then

			salvagePriceType	= UI.junkPriceTypes.TOKENS
			salvagePriceVal		= self.lootItem.tokensEarned

		elseif self.lootItem.creditsEarned > 0 then

			salvagePriceType	= UI.junkPriceTypes.CREDITS
			salvagePriceVal		= self.lootItem.creditsEarned

		end

	end
	
	-- автоген-деф здесь временный и быстро протухнет, поэтому его надо пересоздавать непосредственно перед использованием
	if self.lootItem.autogenItem then
		UI:AddTempAutogenDef( self.lootItem.autogenItem )
	end

	-- иконка 

	if self.lootItem.bSalvaged then

		local hTex = UI.INVALID_RESOURCE_HANDLE

		if salvagePriceType == UI.junkPriceTypes.TOKENS then
			hTex = UI:GetMailAttachmentTokensIco()

		elseif salvagePriceType == UI.junkPriceTypes.CREDITS then
			hTex = UI:GetMailAttachmentCreditsIco()	

		else
			sys.log( "UI.Debriefing_GENERAL_Loot_SlotWnd:UpdateForData()[ERROR]: cannot find reward type" )
		end

		self:SetupIco( hTex )		
		-- self:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY, false ) )	-- #0100859 - без цвета

	else

		if self.lootItem.bAccountAura then

			local hTex = UI:GetMailAttachmentAccountAuraIco( self.lootItem.defName )
			self:SetupIco( hTex )

		else
    		
    		self:SetupForItem( self.lootItem.defName, false, self.lootItem.autogenItem )
			
		end

	end


	-- тултип

	local tooltipData = nil

	if self.lootItem.bSalvaged then

		tooltipData = {}

		tooltipData.tooltipType	= UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= ""

		if salvagePriceType == UI.junkPriceTypes.TOKENS then
			tooltipData.text = UI:MailAttachmentTokens2Str( salvagePriceVal )

		elseif salvagePriceType == UI.junkPriceTypes.CREDITS then
			tooltipData.text = UI:MailAttachmentCredits2Str( salvagePriceVal )

		else
			sys.log( "UI.Debriefing_GENERAL_Loot_SlotWnd:UpdateForData()[ERROR]: cannot find reward type" )
		end

	elseif self.lootItem.bAccountAura then

    	tooltipData = {}
        tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
    	tooltipData.caption		= UI:AccountAura2Str( self.lootItem.defName )
    	tooltipData.text		= UI:GetAccountAuraDesc( self.lootItem.defName )

	elseif UI:IsDefJunk( self.lootItem.defName ) then

		tooltipData = {}

		tooltipData.tooltipType		= UI.tooltipTypes.JUNK
		tooltipData.defName			= self.lootItem.defName

		tooltipData.priceInfo = { type = UI.junkPriceTypes.NONE }

		if self.lootItem.tokensEarned > 0 then

			tooltipData.priceInfo.type		= UI.junkPriceTypes.TOKENS
			tooltipData.priceInfo.tokens	= self.lootItem.tokensEarned

		elseif self.lootItem.creditsEarned > 0 then

			tooltipData.priceInfo.type		= UI.junkPriceTypes.CREDITS
			tooltipData.priceInfo.credits	= self.lootItem.creditsEarned

		else
			sys.log( "UI.Debriefing_GENERAL_Loot_SlotWnd:UpdateForData()[ERROR]: cannot find reward type for %s", self.lootItem.defName )
		end
		
	else
		tooltipData = UI:GetTooltipForItem( self.lootItem.defName )
	end


	self:SetTooltipData( tooltipData )


	-- количество

	local amount = self.lootItem.amount

	if self.lootItem.bSalvaged then
		amount = salvagePriceVal
	end

	if amount > 1 then
		self:SetCountInventory( amount )
	else
		self:HideCount()
	end

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Loot_LeftArrowBtn
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_Loot_LeftArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Debriefing_GENERAL_Loot_LeftArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "debriefing_GENERAL_medals_arrowLeft",
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

-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Loot_RightArrowBtn
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_Loot_RightArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name	= "Debriefing_GENERAL_Loot_RightArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "debriefing_GENERAL_medals_arrowRight",
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

-- ---------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_ShipsWnd
-- ---------------------------------------------------------------------------------

UI.Debriefing_GENERAL_ShipsWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Debriefing_GENERAL_ShipsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Debriefing_GENERAL_ShipsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,		
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
				defName 			= "debriefing_GENERAL_ships",
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

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Debriefing_GENERAL_ShipsWnd:FullUpdate( bAnimated )

	self:Reset()

	if UI.DebriefingWnd:IsLocalPlayerObserver() then
		return
	end


	local ships = UI.DebriefingWnd:GetPlayerAvailableShips( UI.DebriefingWnd:GetLocalPlayerId() )

	local function fnSort( shipInfo1, shipInfo2 )
		return shipInfo1.hangarIdx < shipInfo2.hangarIdx
	end

	table.sort( ships, fnSort )


	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local numShips = #ships

	for shipIdx, shipInfo in ipairs( ships ) do

		local slotWnd = self:ObtainFreeSlot()
		slotWnd:Setup( shipInfo, bAnimated )

		-- корабли выравниваются по правому краю
		-- нумерация локаторов - справа налево
		-- корабли показываются в том же порядке (слева направо), как и в ангаре

		local locatorIdx = numShips - ( shipIdx - 1 )
		local pos = mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, locatorIdx ) ) or UI:ZeroVec2()
		slotWnd:SetPos( pos.x, pos.y )

	end	

end


--
function UI.Debriefing_GENERAL_ShipsWnd:Reset()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.Debriefing_GENERAL_ShipsWnd:IsAnimating()

	local bAnimating = false

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd:IsAnimating() then
			bAnimating = true
			break
		end
	end

	return bAnimating

end


--
function UI.Debriefing_GENERAL_ShipsWnd:OnAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnAccountRankChanged()
	end

end


-- --------------------------
-- const
-- --------------------------

UI.Debriefing_GENERAL_ShipsWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Debriefing_GENERAL_ShipsWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "ship_slot_",
	}
}

UI.Debriefing_GENERAL_ShipsWnd.MAX_SLOTS = 4

-- --------------------------
-- vars
-- --------------------------

UI.Debriefing_GENERAL_ShipsWnd.curSlots	= {}
UI.Debriefing_GENERAL_ShipsWnd.allSlots	= {}


-- --------------------------
-- work functions
-- --------------------------

--
function UI.Debriefing_GENERAL_ShipsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()

end


--
function UI.Debriefing_GENERAL_ShipsWnd:InitSlots()

    for slotIdx = 1, self.MAX_SLOTS do
		self:CreateSlot()
	end	

end


--
function UI.Debriefing_GENERAL_ShipsWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
		table.insert( self.curSlots, freeSlotWnd )	
	end

	return freeSlotWnd

end


--
function UI.Debriefing_GENERAL_ShipsWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Debriefing_GENERAL_Ships_SlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	end

	return slotWnd

end


-- ---------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Ships_SlotWnd
-- ---------------------------------------------------------------------------------

UI.Debriefing_GENERAL_Ships_SlotWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Debriefing_GENERAL_Ships_SlotWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "Debriefing_GENERAL_Ships_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "debriefing_GENERAL_ships_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",	
						layer		= "UI.Debriefing_GENERAL_Ships_SlotWnd.layers.SYNERGY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SYNERGY
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Ships_SlotWnd:Setup( shipInfo, bAnimate )

	self:Reset()

	self.shipInfo = shipInfo
	self:FullUpdate( bAnimate )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:Reset()

	self.shipInfo = nil	
	self.synergyMetaText:SetText( "", true )
	self.shipIcoWnd:Reset()	
	self:ResetSynergyTextAnimation()
	self:ResetSynergyProgressAnimation()

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:IsAnimating()

	return
		self.synergyTextAnimInfo.animTime ~= -1
		or self.synergyProgressAnimInfo.animTime ~= -1

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:OnAccountRankChanged()

	self:UpdateShipIco()
	
end


-- --------------------------
-- const
-- --------------------------

UI.Debriefing_GENERAL_Ships_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	SYNERGY		= 1
}

UI.Debriefing_GENERAL_Ships_SlotWnd.effectInfo =
{
	main =
	{
		shipIcoLocator	= "ship_slot",
	}
}

UI.Debriefing_GENERAL_Ships_SlotWnd.SYNERGY_TEXT_ANIM_TIME	= UI.Debriefing_GENERAL.VALS_ANIM_TIME
UI.Debriefing_GENERAL_Ships_SlotWnd.SYNERGY_PB_ANIM_TIME	= UI.Debriefing_GENERAL.VALS_ANIM_TIME

-- --------------------------
-- vars
-- --------------------------

UI.Debriefing_GENERAL_Ships_SlotWnd.shipInfo		= nil
UI.Debriefing_GENERAL_Ships_SlotWnd.shipIcoWnd		= nil
UI.Debriefing_GENERAL_Ships_SlotWnd.synergyMetaText	= nil

UI.Debriefing_GENERAL_Ships_SlotWnd.synergyTextAnimInfo =
{
	animTime	= -1,
	maxTime		= UI.Debriefing_GENERAL_Ships_SlotWnd.SYNERGY_TEXT_ANIM_TIME,
	valOld		= 0,
	valNew		= 0,
	valCur		= 0,
}

UI.Debriefing_GENERAL_Ships_SlotWnd.synergyProgressAnimInfo =
{
	animTime	= -1,
	maxTime		= UI.Debriefing_GENERAL_Ships_SlotWnd.SYNERGY_PB_ANIM_TIME,
	valOld		= 0,
	valNew		= 0,
	valCur		= 0,
    valMin		= 0,
    valMax		= 0,
}

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.synergyMetaText = UI.MetaText.GetNewInstance()
	self.synergyMetaText:InitFromLayer( self, self.layers.SYNERGY ) 

	self:CreateControls()

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_Shutdown()

	if self.synergyMetaText then
		self.synergyMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateMetaTextPos()

	self.synergyMetaText:UpdateScreenOrgFromLayer( self, self.layers.SYNERGY )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.SYNERGY then
		self.synergyMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:CreateControls()

	self.shipIcoWnd = UI:CreateChildWnd( self, UI.ShipIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.shipIcoWnd, mainEffect, self.effectInfo.main.shipIcoLocator, UI.EffectAnimParams.POS )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:FullUpdate( bAnimate )

	self:UpdateShipIco()
	self:UpdateSynergyText( bAnimate, false )
	self:UpdateSynergyProgress( bAnimate, false )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateShipIco()

	local bCanShowTooltip = true
	if _G.MasterServer_IsConnected() then
		if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
			bCanShowTooltip = false
		end
	end

	local data =
	{
		shipInfo		= self.shipInfo,
		playerId		= UI.DebriefingWnd:GetLocalPlayerId(),
		playerUid		= UI:GetLocalPlayerUid(),
		bDisableTooltip	= not bCanShowTooltip,
	}
	self.shipIcoWnd:Setup( self.shipInfo.baseDef, data )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:GetSynergyInfo()

	local playerData = UI.DebriefingWnd:GetDataForPlayer( UI.DebriefingWnd:GetLocalPlayerId() ) or {}
	local bPremium = playerData.isPremium or false


	-- внутрення синергия корабля

	local shipSynergyOld = self.shipInfo.exp or 0

	local shipSynergyPlusNonPremium	= 0
	local shipSynergyPlus			= 0

	if playerData.vessels then
		for hangarSlotIdx, hangarSlotInfo in pairs( playerData.vessels ) do
			if hangarSlotInfo.hangarIdx == self.shipInfo.hangarIdx then

				local base	= hangarSlotInfo.expBase or 0
				local bonus	= hangarSlotInfo.expBonus or 0

				shipSynergyPlusNonPremium	= base + bonus	-- не использовать просто hangarSlotInfo.exp! т.к. оно не поменяется после покупки премиума в этом окне
				shipSynergyPlus				= shipSynergyPlusNonPremium

				if bPremium then
					local premBonus = hangarSlotInfo.expPremium or 0
					shipSynergyPlus = shipSynergyPlus + premBonus
				end

				break

			end
		end
	end

	local shipSynergyNew			= shipSynergyOld + shipSynergyPlus	
	local shipSynergyNewNonPremium	= shipSynergyOld + shipSynergyPlusNonPremium


	-- свободная синергия

	local freeSynergyBase			= playerData.vesselExpPoolBase or 0
	local freeSynergyBonus			= playerData.vesselExpPoolBonus or 0
	local freeSynergyPlusNonPremium	= freeSynergyBase + freeSynergyBonus

	local freeSynergyPlus = freeSynergyPlusNonPremium
	if bPremium then
		local freeSynergyPremBonus = playerData.vesselExpPoolPremium or 0
		freeSynergyPlus = freeSynergyPlus + freeSynergyPremBonus
	end	

	local freeSynergyOld			= playerData.oldVesselExpPool and tostring( _G.U64ToStr( playerData.oldVesselExpPool ) ) or 0
	local freeSynergyNew			= freeSynergyOld + freeSynergyPlus	
	local freeSynergyNewNonPremium	= freeSynergyOld + freeSynergyPlusNonPremium


	-- уровень, цена уровня

	local maxLevel = UI:GetShipMaxLevel( self.shipInfo.baseDef )

	local curLevel = self.shipInfo.level or 0
	if UI:IsShipPremium( self.shipInfo.baseDef ) or UI:IsShipEvolving( self.shipInfo.baseDef ) then
		curLevel = maxLevel
	end

	local upgradeCost = 0
	if curLevel < maxLevel then	
		upgradeCost = UI:GetShipUpgradeCostForLevel( self.shipInfo.baseDef, curLevel )
	end


	local synergyInfo =
	{
		shipSynergyOld				= shipSynergyOld,
		shipSynergyNew				= shipSynergyNew,
		shipSynergyNewNonPremium	= shipSynergyNewNonPremium,
		shipSynergyPlus				= shipSynergyPlus,
		shipSynergyPlusNonPremium	= shipSynergyPlusNonPremium,
		freeSynergyOld				= freeSynergyOld,
		freeSynergyNew				= freeSynergyNew,
		freeSynergyNewNonPremium	= freeSynergyNewNonPremium,
		freeSynergyPlus				= freeSynergyPlus,
		freeSynergyPlusNonPremium	= freeSynergyPlusNonPremium,
		upgradeCost					= upgradeCost,
		curLevel					= curLevel,
		maxLevel					= maxLevel,
	}

	return synergyInfo

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateSynergyText( bAnimate, bAnimatePremBonusOnly )

	if bAnimate == nil then
		bAnimate = false
	end

	if bAnimatePremBonusOnly == nil then
		bAnimatePremBonusOnly = false
	end

    local synergyInfo	= self:GetSynergyInfo()
    local valNew		= synergyInfo.shipSynergyPlus

	-- эта функция может быть вызвана, когда анимация уже идет (когда во время анимации был куплен премиум);
	-- в этом случае анимация не прерывается и не начинается заново, а просто меняется ее конечное значение

	if self.synergyTextAnimInfo.animTime ~= -1 then

		self.synergyTextAnimInfo.maxTime	= self.synergyTextAnimInfo.maxTime - self.synergyTextAnimInfo.animTime
		self.synergyTextAnimInfo.animTime	= 0
    	self.synergyTextAnimInfo.valOld		= self.synergyTextAnimInfo.valCur
    	self.synergyTextAnimInfo.valNew		= valNew

	else

    	self:ResetSynergyTextAnimation()

    	local valOld = 0

		-- при покупке премиума анимируется только приращение от премиума
		if bAnimatePremBonusOnly then
    		valOld = synergyInfo.shipSynergyPlusNonPremium
    	end

    	if bAnimate then
    		if valOld == valNew then
    			bAnimate = false
    		end
    	end

    	local valCur = bAnimate and valOld or valNew

    	local animInfo =
    	{
    		animTime	= 0,
    		maxTime		= self.SYNERGY_TEXT_ANIM_TIME,
        	valOld		= valOld,
    	    valNew		= valNew,
        	valCur		= valCur,
    	}

    	self:SetupSynergyText( animInfo )
     
    	if bAnimate then
        	self.synergyTextAnimInfo = animInfo
    	end

	end

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateSynergyTextAnimation( dt )

	if self.synergyTextAnimInfo.animTime == -1 then
		return
	end

	local bAnimStop = false

	self.synergyTextAnimInfo.animTime = self.synergyTextAnimInfo.animTime + dt

	if self.synergyTextAnimInfo.animTime >= self.synergyTextAnimInfo.maxTime then
		self.synergyTextAnimInfo.animTime = self.synergyTextAnimInfo.maxTime
		bAnimStop = true
	end

	local valCur = UI:Lerp( self.synergyTextAnimInfo.valOld, self.synergyTextAnimInfo.valNew, self.synergyTextAnimInfo.animTime / self.synergyTextAnimInfo.maxTime )
	valCur = UI:Round( valCur )

	if valCur ~= self.synergyTextAnimInfo.valCur then
		self.synergyTextAnimInfo.valCur = valCur
		self:SetupSynergyText( self.synergyTextAnimInfo )
	end	

	if bAnimStop then
		self:ResetSynergyTextAnimation()
	end

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:SetupSynergyText( animInfo )

	local priceInfo =
	{
		priceType	= UI.exPriceTypes.SYNERGY,
		val			= animInfo.valCur,
		bIsBuyPrice	= false,
		valAsString	= string.format( "+%s", UI:Num2StrSeparatedBy3( animInfo.valCur ) ),
	}

	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.SYNERGY ), nil, nil, true, nil )
	self.synergyMetaText:SetText( str, true )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:ResetSynergyTextAnimation()

    self.synergyTextAnimInfo =
    {
		animTime	= -1,
		maxTime		= self.SYNERGY_TEXT_ANIM_TIME,
    	valOld		= 0,
    	valNew		= 0,
    	valCur		= 0,
    }

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateSynergyProgress( bAnimate, bAnimatePremBonusOnly )

	if bAnimate == nil then
		bAnimate = false
	end

	if bAnimatePremBonusOnly == nil then
		bAnimatePremBonusOnly = false
	end

	local synergyInfo	= self:GetSynergyInfo()
    local valNew		= math.min( synergyInfo.shipSynergyNew + synergyInfo.freeSynergyNew, synergyInfo.upgradeCost )

	-- эта функция может быть вызвана, когда анимация уже идет (когда во время анимации был куплен премиум);
	-- в этом случае анимация не прерывается и не начинается заново, а просто меняется ее конечное значение


	if self.synergyProgressAnimInfo.animTime ~= -1 then

		self.synergyProgressAnimInfo.maxTime	= self.synergyProgressAnimInfo.maxTime - self.synergyProgressAnimInfo.animTime
		self.synergyProgressAnimInfo.animTime	= 0
    	self.synergyProgressAnimInfo.valOld		= self.synergyProgressAnimInfo.valCur
    	self.synergyProgressAnimInfo.valNew		= valNew

	else

    	self:ResetSynergyProgressAnimation()
    	self.shipIcoWnd:HideUpgradePb()
    	self.shipIcoWnd:HideUpgradeArrow()

    	if synergyInfo.curLevel < synergyInfo.maxLevel then	

    		local valOld = math.min( synergyInfo.shipSynergyOld + synergyInfo.freeSynergyNew, synergyInfo.upgradeCost ) 	-- freeSynergyNew это не ошибка - см.#0065972,комм.(0274351) - свободная синергия сразу учитывается в стартовом значении от которого отматываем

    		-- при покупке премиума анимируется только приращение от премиума
    		if bAnimatePremBonusOnly then
				valOld = math.min( synergyInfo.shipSynergyNewNonPremium + synergyInfo.freeSynergyNewNonPremium, synergyInfo.upgradeCost )
        	end

    		if valOld == valNew then
    			bAnimate = false
    		end		

    		local valCur	= bAnimate and valOld or valNew
    		local valMax	= synergyInfo.upgradeCost

    		-- если синергии хватает на апгрейд, то прогрессбар не показывается, а показывается стрелка апгрейда
    		if valCur < valMax then

            	local animInfo =
            	{
        			animTime	= 0,
					maxTime		= self.SYNERGY_PB_ANIM_TIME,
                	valOld		= valOld,
            	    valNew		= valNew,
                	valCur		= valCur,
        			valMin		= 0,
        			valMax		= valMax,
            	}

    			self.shipIcoWnd:ShowUpgradePb()
            	self:SetupSynergyPb( animInfo )

            	if bAnimate then
                	self.synergyProgressAnimInfo = animInfo
            	end

    		else
    			self.shipIcoWnd:ShowUpgradeArrow()
    		end

    	end 

	end

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:UpdateSynergyProgressAnimation( dt )

	if self.synergyProgressAnimInfo.animTime == -1 then
		return
	end

	local bAnimStop = false

	self.synergyProgressAnimInfo.animTime = self.synergyProgressAnimInfo.animTime + dt

	if self.synergyProgressAnimInfo.animTime >= self.synergyProgressAnimInfo.maxTime then
		self.synergyProgressAnimInfo.animTime = self.synergyProgressAnimInfo.maxTime
		bAnimStop = true
	end

	self.synergyProgressAnimInfo.valCur = UI:Lerp( self.synergyProgressAnimInfo.valOld, self.synergyProgressAnimInfo.valNew, self.synergyProgressAnimInfo.animTime / self.synergyProgressAnimInfo.maxTime )	
	self:SetupSynergyPb( self.synergyProgressAnimInfo )

	if bAnimStop then

		-- если нового значения синергии хватает на апгрейд, то прогрессбар скрывается, и показывается стрелка апгрейда

    	if self.synergyProgressAnimInfo.valNew >= self.synergyProgressAnimInfo.valMax then
    		self.shipIcoWnd:HideUpgradePb()
			self.shipIcoWnd:ShowUpgradeArrow()
    	end

		self:ResetSynergyProgressAnimation()

	end

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:SetupSynergyPb( animInfo )

	local animTime = ( animInfo.valCur - animInfo.valMin ) / ( animInfo.valMax - animInfo.valMin )
	self.shipIcoWnd:SetUpgradePbAnimTime( animTime )

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:ResetSynergyProgressAnimation()

    self.synergyProgressAnimInfo =
    {
		animTime	= -1,
		maxTime		= self.SYNERGY_PB_ANIM_TIME,
    	valOld		= 0,
    	valNew		= 0,
    	valCur		= 0,
    	valMin		= 0,
    	valMax		= 0,
    }

end


--
function UI.Debriefing_GENERAL_Ships_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateSynergyTextAnimation( dt_sys )
	self:UpdateSynergyProgressAnimation( dt_sys )

end


-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_EfficiencyWnd
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_EfficiencyWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_EfficiencyWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name	= "Debriefing_GENERAL_EfficiencyWnd",
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
				defName 			= "debriefing_GENERAL_efficiency",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title28",
						layer		= "UI.Debriefing_GENERAL_EfficiencyWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
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
			text			= UI:GetStringByName( "debriefing_efficiency" ),
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_EfficiencyWnd:FullUpdate()

	self:Reset()

    local playerData = UI.DebriefingWnd:GetDataForPlayer( UI.DebriefingWnd:GetLocalPlayerId() )
	if not playerData then
		return
	end

	local slotIdx = 1
	local rowData = { slots = {} }

	local summaryData =
	{
		bSummary	= true,
		val			= playerData.pointTotal or 0,
	}

	table.insert( rowData.slots, summaryData )
	slotIdx = slotIdx + 1

	if slotIdx > UI.Debriefing_GENERAL_Efficiency_RowWnd.MAX_SLOTS then
		self:AddRecord( rowData )
		slotIdx = 1
		rowData = { slots = {} }
	end

	local pressure = 0

	if playerData.pressure ~= nil then
		if type( playerData.pressure ) == "number" then
			pressure = playerData.pressure
		else
			sys.log( "UI.Debriefing_GENERAL_EfficiencyWnd:FullUpdate()[ERROR]: invalid type of field \"pressure\"; \"number\" or \"nil\" expected, got \"%s\"", type( playerData.pressure ) )
		end
	end
	
	if pressure ~= 0 then

		local pressureData =
		{
			bPressure	= true,
			val			= math.floor( pressure ),
		}

		table.insert( rowData.slots, pressureData )

		-- slotIdx не увеличиивается, т.к. слот очков влияния идет особняком, сверх нормального количества в ряде, и рисуется в особой позиции
		
	end

	local stats = playerData.pointStats
	if stats then

    	local datas = {} 
    	for statIdx, statInfo in pairs( stats ) do
    		local data = { statInfo = statInfo }
    		table.insert( datas, data )
    	end

    	local function fnSort( data1, data2 )
    		return data1.statInfo.reason < data2.statInfo.reason
    	end

    	table.sort( datas, fnSort )

    	for statIdx, data in ipairs( datas ) do

        	table.insert( rowData.slots, data )
        	slotIdx = slotIdx + 1

        	if slotIdx > UI.Debriefing_GENERAL_Efficiency_RowWnd.MAX_SLOTS then
        		self:AddRecord( rowData )
        		slotIdx = 1
        		rowData = { slots = {} }
        	end

    	end

		if next( rowData.slots ) then
        	self:AddRecord( rowData )
		end

	end

end


--
function UI.Debriefing_GENERAL_EfficiencyWnd:Reset()

	self:Clear()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_GENERAL_EfficiencyWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.Debriefing_GENERAL_EfficiencyWnd.btnPrototypeName	= "Debriefing_GENERAL_Efficiency_RowWnd"
UI.Debriefing_GENERAL_EfficiencyWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.Debriefing_GENERAL_EfficiencyWnd.MAX_SLOTS			= 2

UI.Debriefing_GENERAL_EfficiencyWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "effectiv_slot_",
		scrollObjName		= "scroll2",
		animIdle			= "idle",
	}
}

-- -------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Efficiency_RowWnd
-- -------------------------------------------------------------------

UI.Debriefing_GENERAL_Efficiency_RowWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_GENERAL_Efficiency_RowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Debriefing_GENERAL_Efficiency_RowWnd",
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
				defName 			= "debriefing_GENERAL_efficiency_row",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end

-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_GENERAL_Efficiency_RowWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Debriefing_GENERAL_Efficiency_RowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "effectiv_slot_",
		pressureSlotLocator	= "effectiv_slot_10",
	}
}

-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_GENERAL_Efficiency_RowWnd.MAX_SLOTS	= 4

-- ------------------------------
-- vars
-- ------------------------------

UI.Debriefing_GENERAL_Efficiency_RowWnd.curSlots		= {}
UI.Debriefing_GENERAL_Efficiency_RowWnd.allCommonSlots	= {}
UI.Debriefing_GENERAL_Efficiency_RowWnd.allSummarySlots	= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	self.curSlots			= {}
	self.allCommonSlots		= {}	
	self.allSummarySlots	= {}

end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:UpdateForData( data, bAnimated )

	self:Reset()

	local numSlots = 0

	for slotIdx, slotData in ipairs( data.slots ) do

		if numSlots < self.MAX_SLOTS or slotData.bPressure then

    		local slotWnd = nil

    		if slotData.bSummary then
    			slotWnd = self:ObtainSummarySlot()

			elseif slotData.bPressure then
    			slotWnd = self:ObtainSummarySlot()

    		else
    			slotWnd = self:ObtainCommonSlot()
    		end

    		if slotWnd then
    			slotWnd:Setup( slotData )
    		end

		else
			sys.log( "UI.Debriefing_GENERAL_Efficiency_RowWnd:UpdateForData()[ERROR]: too many slots data" )
		end

		-- слот очков влияния идет особняком, сверх нормального количества в ряде, и рисуется в особой позиции
		if not slotData.bPressure then
			numSlots = numSlots + 1
		end

	end

	self:RecalcLayout()

end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:ObtainSummarySlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSummarySlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSummarySlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
		table.insert( self.curSlots, freeSlotWnd )
	end

	return freeSlotWnd	


end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:CreateSummarySlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd, tostring( #self.allSummarySlots ) )

	if slotWnd then
		table.insert( self.allSummarySlots, slotWnd )
	end

	return slotWnd

end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:ObtainCommonSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allCommonSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateCommonSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
		table.insert( self.curSlots, freeSlotWnd )
	end

	return freeSlotWnd	

end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:CreateCommonSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd, tostring( #self.allCommonSlots ) )

	if slotWnd then
		table.insert( self.allCommonSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.Debriefing_GENERAL_Efficiency_RowWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local regulatSlotIdx = 1

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		-- слот очков влияния идет особняком, сверх нормального количества в ряде, и рисуется в особой позиции
		if slotWnd:GetData().bPressure then

			local pos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.pressureSlotLocator ) or UI:ZeroVec2()
			slotWnd:SetPos( pos.x, pos.y )

		else

			local pos = mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, regulatSlotIdx ) ) or UI:ZeroVec2()
			slotWnd:SetPos( pos.x, pos.y )

			regulatSlotIdx = regulatSlotIdx + 1

		end

	end

end


-- ---------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd
-- ---------------------------------------------------------------------------------

UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Debriefing_GENERAL_Efficiency_SummarySlotWnd",
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
				defName 			= "debriefing_GENERAL_efficiency_summarySlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title20",
						layer		= "UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title21",
						layer		= "UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title22",
						layer		= "UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.layers.UNITS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},		

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- UNITS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:Setup( data )

	self:Reset()

	self.data = data

	self:FullUpdate()	

end


--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:Reset()

	self.data = nil
	self:SetText( "", self.layers.VAL )

end


--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:GetData()

	return self.data

end


-- --------------------------
-- const
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    VAL			= 2,
    UNITS		= 3,
}

-- --------------------------
-- vars
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd.data = nil

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:FullUpdate()

	self:UpdateVal()
	self:UpdateName()
	self:UpdateUnits()

end


--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:UpdateVal()

	local str = UI:Num2StrSeparatedBy3( self.data.val )
	self:SetText( str, self.layers.VAL )

end


--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:UpdateName()

	local str = ""

	if self.data.bSummary then
		str = UI:GetStringByName( "debriefing_efficiency_summary" )

	elseif self.data.bPressure then
		str = UI:GetStringByName( "debriefing_pressure" )

	else
		sys.log( "UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:UpdateName()[ERROR]: unhandled data type" )
	end

	self:SetText( str, self.layers.NAME )

end


--
function UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:UpdateUnits()

	local str = ""

	if self.data.bSummary then
		str = UI:GetStringByName( "debriefing_efficiency_score" )

	elseif self.data.bPressure then
		str = UI:GetStringByName( "debriefing_pressureUnits" )

	else
		sys.log( "UI.Debriefing_GENERAL_Efficiency_SummarySlotWnd:UpdateUnits()[ERROR]: unhandled data type" )
	end

	self:SetText( str, self.layers.UNITS )

end


-- ---------------------------------------------------------------------------------
-- UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd
-- ---------------------------------------------------------------------------------

UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Debriefing_GENERAL_Efficiency_CommonSlotWnd",
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
				defName 			= "debriefing_GENERAL_efficiency_commonSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title20",
						layer		= "UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "count",
						layer		= "UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title21",
						layer		= "UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title22",
						layer		= "UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.layers.UNITS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},		

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- UNITS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefing_efficiency_score" ),
		},
	}
}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:Setup( data )

	self:Reset()

	self.data = data

	self:FullUpdate()
	
end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:Reset()

	self.data = nil

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.COUNT )
	self:SetText( "", self.layers.VAL )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:GetData()

	return self.data

end


-- --------------------------
-- const
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
	COUNT		= 2,
    VAL			= 3,
    UNITS		= 4,
}

UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico48"
	}
}

-- --------------------------
-- vars
-- --------------------------

UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd.data = nil

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:FullUpdate()

	self:UpdateName()
	self:UpdateIco()
	self:UpdateCount()
	self:UpdateVal()

end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:UpdateName()

	local rewardReason = self.data.statInfo.reason or -1
	local str = UI:RewardReason2Str( self.data.statInfo.reason, false )

	self:SetText( str, self.layers.NAME )	

end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:UpdateIco()

	local rewardReason = self.data.statInfo.reason or -1
	local rewardReasonName = UI:Val2Key( ai.RewardReason, rewardReason )

	local texName = string.format( "rewardReason_%s", rewardReasonName )
	local hTex = UI:GetTex( texName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end	

end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:UpdateCount()

	local count = self.data.statInfo.count or 0
	local str = UI:Num2StrSeparatedBy3( count )
	
	self:SetText( str, self.layers.COUNT )

end


--
function UI.Debriefing_GENERAL_Efficiency_CommonSlotWnd:UpdateVal()

	local str = UI:Num2StrSeparatedBy3( self.data.statInfo.value or 0 )
	self:SetText( str, self.layers.VAL )

end


-- ---------------------------------------------------------------------------------
-- UI.Debriefing_RepTooltipWnd
-- ---------------------------------------------------------------------------------

UI.Debriefing_RepTooltipWnd = {}

-- --------------------------
-- window definition
-- --------------------------

local l_numBaseTooltipLayers = UI:GetTableLength( UI.TooltipWnd.layers )

UI.Debriefing_RepTooltipWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
	TEXT_2		= 3,
}

--
UI.Debriefing_RepTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "TooltipWnd",

	props =
	{
		name	= "Debriefing_RepTooltipWnd",
	},

	layers =
	{
		numLayers = l_numBaseTooltipLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "tooltip",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "title",
						layer		= "UI.Debriefing_RepTooltipWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

					-- не линкуется по алайнменту
           			{
           				objName		= "text",
						layer		= "UI.Debriefing_RepTooltipWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

					-- не линкуется по алайнменту
           			{
           				objName		= "text",
						layer		= "UI.Debriefing_RepTooltipWnd.layers.TEXT_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},
           		}
			}}		
		},

		-- TEXT
		{
		    id			= UI.Debriefing_RepTooltipWnd.layers.TEXT,			

			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,
   			formatInfoSz = { 10, 5 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- TEXT_2
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_RIGHT + FONT.TF_TOP,
   			formatInfoSz = { 10, 5 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 
	}
}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Debriefing_RepTooltipWnd:Setup( tooltipData )

	UI.TooltipWnd.Setup( self, tooltipData )

	self:SetText( tooltipData.textRight or "", self.layers.TEXT_2 )

end


-- --------------------------
-- work functions
-- --------------------------

--
function UI.Debriefing_RepTooltipWnd:RecalcLayout()

	UI.TooltipWnd.RecalcLayout( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

    	local maxSelfHeight 	= mainEffect:GetObjSize( "self" ).y
    	local maxTextRect		= self:GetLayerRect( self.layers.TEXT )
    	local space_text_bottom	= maxSelfHeight - ( maxTextRect.y + maxTextRect.w )
    	local selfHeight		= self:GetHeight()

    	local textHeight = ( selfHeight - space_text_bottom ) - maxTextRect.y
    	self:SetLayerHeight( textHeight, self.layers.TEXT_2 )

	end

end

-- -------------------------------------------------------------------
-- UI.Debriefing_PLAYERS
-- -------------------------------------------------------------------

UI.Debriefing_PLAYERS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Debriefing_PLAYERS.def =
{
	className	= "Wnd",
	prototype	= "Debriefing_PageWnd",

	props =
	{
		name		= "Debriefing_PLAYERS",
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
				defName 			= "debriefing_PLAYERS",
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
	},

	children =
	{
		"UI.Debriefing_PLAYERS_PlayersWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Debriefing_PLAYERS:FullUpdate( bFirstTime )

	UI.Debriefing_PLAYERS_PlayersWnd:FullUpdate()

end


--
function UI.Debriefing_PLAYERS:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	UI.Debriefing_PLAYERS_PlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

end


--
function UI.Debriefing_PLAYERS:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	UI.Debriefing_PLAYERS_PlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.Debriefing_PLAYERS:OnLikesChanged()

	if not self:IsOnScreen() then
		return
	end

	UI.Debriefing_PLAYERS_PlayersWnd:OnLikesChanged()

end


--
function UI.Debriefing_PLAYERS:OnAccountRankChanged()

	if not self:IsOnScreen() then
		return
	end

	UI.Debriefing_PLAYERS_PlayersWnd:OnAccountRankChanged()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Debriefing_PLAYERS.pageType = dw.pageTypes.PLAYERS

UI.Debriefing_PLAYERS.layers =
{
	MAIN_EFFECT	= 0
}

-- ----------------------------------------------------------------------------------------
-- UI.Debriefing_FbBtn
-- ----------------------------------------------------------------------------------------

UI.Debriefing_FbBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FacebookBtn1",

		props =
		{
			name	= "Debriefing_FbBtn"
		}
	},
}

-- ----------------------------------------------------------------------------------------
-- UI.Debriefing_VkBtn
-- ----------------------------------------------------------------------------------------

UI.Debriefing_VkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "VKontakteBtn1",

		props =
		{
			name	= "Debriefing_VkBtn"
		}
	},
}

-- ----------------------------------------------------------------------------------------
-- UI.Debriefing_SocialNetWaitingWnd
-- ----------------------------------------------------------------------------------------

UI.Debriefing_SocialNetWaitingWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "SocialNetWaitingWnd",

		props =
		{
			name	= "Debriefing_SocialNetWaitingWnd"
		}
	},

	mainWndName = "DebriefingWnd"
}