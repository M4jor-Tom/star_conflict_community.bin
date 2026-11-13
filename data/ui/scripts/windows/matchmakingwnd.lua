-- ----------------------------------------------------------------------------
--
-- Workfile: matchmakingwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.MatchMakingContainerWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.MatchMakingContainerWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "MatchMakingContainerWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		--activationOrder	= 0,
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
				defName 			= "matchMaking_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "window",
						wnd 		= "UI.MatchMakingWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					--[[{
						objName		= "blackout",
						layer		= "UI.MatchMakingContainerWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},]]
				}		
			}}
		},  

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	},

	children = { "UI.MatchMakingWnd" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.MatchMakingContainerWnd.layers =
{
    MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
}


UI.MatchMakingWnd = {}
local mm = UI.MatchMakingWnd

UI.MatchMakingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "MatchMakingWnd",
		style			= 0,
		activationOrder	= 0,
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
				defName 			= "matchMaking_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.MatchMakingWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_gameplay",
						layer		= "UI.MatchMakingWnd.layers.GAME_TYPE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text2",
						layer		= "UI.MatchMakingWnd.layers.TIME_AVERAGE_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_2",
						wnd			= "UI.MatchMaking_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.MatchMakingWnd.layers.TIME_WAITING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "time2",
						layer		= "UI.MatchMakingWnd.layers.TIME_AVERAGE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",
						layer		= "UI.MatchMakingWnd.layers.TIME_AVERAGE_LABEL_SQUAD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "time",
						layer		= "UI.MatchMakingWnd.layers.TIME_AVERAGE_VAL_SQUAD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_3",
						layer		= "UI.MatchMakingWnd.layers.REGION_VALUE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},


					{
						objName		= "title_2",
						layer		= "UI.MatchMakingWnd.layers.SQUAD_INFO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_expand",
						wnd			= "UI.MatchMaking_MinimizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		                                                             	
		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},

		-- GAME_TYPE
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},

		-- TIME_WAITING_EFFECT
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
						layer		= "UI.MatchMakingWnd.layers.TIME_WAITING_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIME_WAITING_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},

		-- TIME_AVERAGE_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
			text = "^matchMaking_averageTime",
		},

		-- TIME_AVERAGE_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},

		-- TIME_AVERAGE_LABEL_SQUAD
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
			text = "^matchMaking_averageTime",
		},

		-- TIME_AVERAGE_VAL_SQUAD
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},

    	-- SQUAD_INFO
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
   			text = "^matchMaking_maxTime_squad_info",
		},

		-- REGION_VALUE
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		}, 
	},

	children = { "UI.MatchMaking_CancelBtn", "UI.MatchMaking_MinimizeBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.MatchMakingWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	if not self.bActive then
		return
	end

	if result == 0 then
		self:UpdateOnResult_QueInfo()

	elseif result == 1 and requestId == self.lastRequestId_QueueInfo then
		self:ShowMessageOnTimeOut()
	end

	if requestId == self.lastRequestId_QueueInfo then
		self.lastRequestId_QueueInfo = 0
	end   

end


--
function UI.MatchMakingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	if not self.bActive then
		return
	end

	if result == 0 then
		self:UpdateOnResult_LeaveMMQueue( param1 ~= 0 )

	elseif result == 1 and requestId == self.lastRequestId_LeaveMMQueue then
		self:ShowMessageOnTimeOut()
	end

	if requestId == self.lastRequestId_LeaveMMQueue then
		self.lastRequestId_LeaveMMQueue = 0
	end   

end


--
function UI.MatchMakingWnd:SetActive( gameType )

	if self.bActive then
		return
	end

	self:Reset()

	self.bActive = true

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )

	self:FullUpdate()

end


--
function UI.MatchMakingWnd:IsActive()

	return self.bActive

end


--
function UI.MatchMakingWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.MatchMakingWnd:GetWaitingTime()
	
	return self.waitingTime

end


--
function UI.MatchMakingWnd:IsPvp()

	return self.bPvp

end


--
function UI.MatchMakingWnd:IsPve()

	return self.bPve

end


--
function UI.MatchMakingWnd:IsArena()

	return self.bArena

end


--
function UI.MatchMakingWnd:IsCoopVsAi()

	return self.bCoopVsAi

end


-- ------------------------------
-- const
-- ------------------------------

mm.layers =
{
    MAIN_EFFECT				= 0,
	CAPTION                 = 1,
	GAME_TYPE				= 2, 
    TIME_WAITING_EFFECT		= 3, 
    TIME_WAITING_VAL		= 4, 
    TIME_AVERAGE_LABEL		= 5, 
    TIME_AVERAGE_VAL		= 6, 
	TIME_AVERAGE_LABEL_SQUAD= 7, 
    TIME_AVERAGE_VAL_SQUAD	= 8, 
	SQUAD_INFO 				= 9,
	REGION_VALUE 			= 10,
}

mm.REQUEST_DELAY = 10		-- через такое количество секунд обновляется среднее время

mm.states =
{
	SEARCHING_GAME	= 1, 
	JOINING_GAME	= 2,
}

mm.JOINING_TIME_OUT	= 30

mm.sounds =
{
	hide	= "sound/ui/MsgHide",
}

mm.IS_FULL_SCREEN	= false
mm.ROUND_MISS_MSG_TIMEOUT = 5

-- ------------------------------
-- vars
-- ------------------------------

mm.lastRequestId_QueueInfo		= 0
mm.lastRequestId_LeaveMMQueue	= 0
mm.hMsgTimeOut					= UI.INVALID_UI_HANDLE
mm.hMsgExitMatchMaking			= UI.INVALID_UI_HANDLE
mm.waitingTime					= -1
mm.requestTimer					= -1
mm.state						= -1
mm.joiningTimer					= -1
mm.bActive						= false
mm.needShowRoundMissMsg 		= -1
mm.bPvp							= false
mm.bPve							= false
mm.bArena						= false
mm.bCoopVsAi					= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.MatchMakingWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:Reset()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.MatchMakingWnd:Reset()

	self:SetText( "", self.layers.TIME_WAITING_VAL )
	self:SetText( "", self.layers.TIME_AVERAGE_VAL )
	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.GAME_TYPE )

	self.lastRequestId_QueueInfo	= 0
	self.lastRequestId_LeaveMMQueue	= 0
	self.waitingTime				= -1
	self.requestTimer				= -1
	self.state						= -1	
	self.joiningTimer				= -1
	self.bPvp						= false
	self.bPve						= false
	self.bArena						= false
	self.bCoopVsAi					= false

	UI.MatchMaking_CancelBtn:Enable( false )

	self.bActive = false

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		if self.hMsgTimeOut ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgTimeOut ) 
			self.hMsgTimeOut = UI.INVALID_UI_HANDLE
		end

		if self.hMsgExitMatchMaking ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgExitMatchMaking ) 
			self.hMsgExitMatchMaking = UI.INVALID_UI_HANDLE
		end

	end

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
	end

	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL )
	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL )
	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL_SQUAD )
	self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL_SQUAD )
	self:SetLayerVisible( false, self.layers.SQUAD_INFO )

end


--
function UI.MatchMakingWnd:FullUpdate()

	if not UI.bSavingGameState then

		if _G.MasterServer_IsInTournament() then

			self.state = self.states.SEARCHING_GAME
		
		else

    		self.state = _G.MasterServer_IsInGame() and self.states.JOINING_GAME or self.states.SEARCHING_GAME

    	end

		if self.state == self.states.JOINING_GAME then
			self.joiningTimer = self.JOINING_TIME_OUT
		end

	end

	self:UpdateLayersVisibility()
	self:UpdateCaption()
	self:UpdateCancelBtn()
	self:UpdateGameTypeName()
	self:UpdateWatingTimeText()

	if self.state == self.states.SEARCHING_GAME then
		self:Request_QueInfo()
	else
		self:SetWaitingTime( 0 )
	end

	if self:IsActive() then
		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
	end

	self.tournamentRoundInfo = nil
	self.needShowRoundMissMsg = -1

end


--
function UI.MatchMakingWnd:UpdateLayersVisibility()

	if _G.MasterServer_IsInTournament and _G.MasterServer_IsInTournament() then

		self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL )
		self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL_SQUAD )
		self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL_SQUAD )
		self:SetLayerVisible( false, self.layers.SQUAD_INFO )

		self:SetLayerVisible( true, self.layers.TIME_AVERAGE_LABEL )
		self:SetText( UI:GetStringByName( "matchMaking_tournamentTime" ), self.layers.TIME_AVERAGE_LABEL )

	else

		self:SetText( UI:GetStringByName( "matchMaking_averageTime" ), self.layers.TIME_AVERAGE_LABEL )

		if UI.Squad:IsInSquad() then
			self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL )
			self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL )
			self:SetLayerVisible( true, self.layers.TIME_AVERAGE_LABEL_SQUAD )
			self:SetLayerVisible( true, self.layers.TIME_AVERAGE_VAL_SQUAD )
			self:SetLayerVisible( true, self.layers.SQUAD_INFO )
		else
			self:SetLayerVisible( true, self.layers.TIME_AVERAGE_LABEL )
			self:SetLayerVisible( true, self.layers.TIME_AVERAGE_VAL )
			self:SetLayerVisible( false, self.layers.TIME_AVERAGE_LABEL_SQUAD )
			self:SetLayerVisible( false, self.layers.TIME_AVERAGE_VAL_SQUAD )
			self:SetLayerVisible( false, self.layers.SQUAD_INFO )
		end

	end

end


--
function UI.MatchMakingWnd:Request_QueInfo()

	self.lastRequestId_QueueInfo = _G.MasterServer_RequestQueueInfo()
	self.requestTimer = self.REQUEST_DELAY

end


--
function UI.MatchMakingWnd:Request_LeaveMMQueue()

	if _G.MasterServer_IsInTournament() then

		self.lastRequestId_LeaveMMQueue = MasterServer_LeaveTournament()

	else

		self.lastRequestId_LeaveMMQueue = MasterServer_LeaveMatchmakingQueue()

	end

end


--
function UI.MatchMakingWnd:UpdateOnResult_QueInfo()

	if self.state ~= self.states.SEARCHING_GAME then
		return
	end

	local queueInfo = _G.MasterServer_GetQueueInfo()

	if not queueInfo.inQueue then
--		self:Reset()	-- зачем??	При этом уничтожаются все переменные...
		return
	end

	self.bPvp 		= queueInfo.enqueuementParams.arcade ~= nil
	self.bPve 		= queueInfo.enqueuementParams.pve ~= nil
	self.bArena		= queueInfo.enqueuementParams.league ~= nil
	self.bCoopVsAi	= queueInfo.enqueuementParams.coop_vs_ai ~= nil

	if self.waitingTime == -1 then
		self:SetWaitingTime( queueInfo.timeInQueue )
	end

	self:SetAverageTime( queueInfo.averageTimeInQueue )

end


--
function UI.MatchMakingWnd:UpdateOnResult_LeaveTournament()

	--UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_joiningGameFail" ), UI.MBS_OK )

end


--
function UI.MatchMakingWnd:UpdateOnResult_LeaveMMQueue( bJoiningGame )

	if bJoiningGame then

		self.state = self.states.JOINING_GAME
		self.requestTimer = -1

		self:UpdateCaption()
		self:UpdateCancelBtn()

		if self.hMsgExitMatchMaking ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgExitMatchMaking ) 
			self.hMsgExitMatchMaking = UI.INVALID_UI_HANDLE
		end

		if self.waitingTime == -1 then
			self:SetWaitingTime( 0 )
		end

		self.joiningTimer = self.JOINING_TIME_OUT
		
	else
		UI.HangarWnd:SetPrepareState( UI.HangarWnd.prepareStates.NONE )
	end

end


--
function UI.MatchMakingWnd:SetWaitingTime( waitingTime )

	local oldWaitingTime = self.waitingTime
	self.waitingTime = waitingTime

	if _G.MasterServer_IsInTournament and _G.MasterServer_IsInTournament() then

		local round, bCurRound, timeLeft = UI:GetTourRoundTimeInfo()
		if UI:IsTourTeamExist() then
			if bCurRound then
				timeLeft = timeLeft-- + Tournaments.preparation_time * 60 
			end
		else
			if bCurRound then
				timeLeft = timeLeft-- + Tournaments.preparation_time * 60 
			else
				if round == 1 then
					if timeLeft > ( Tournaments.preparation_time * 60 ) then
						timeLeft = timeLeft - Tournaments.preparation_time * 60
						round = 0
					else
						timeLeft = timeLeft + Tournaments.round_time * 60
					end
				else
					timeLeft = timeLeft + Tournaments.round_time * 60
				end
			end

			if self.tournamentRoundInfo then
				if self.tournamentRoundInfo.roud ~= round then
					self.needShowRoundMissMsg = self.ROUND_MISS_MSG_TIMEOUT
				end
			end
		end
		self.tournamentRoundInfo = {}
		self.tournamentRoundInfo.roud = round
		self.waitingTime = timeLeft

		self:UpdateWatingTimeText()

	end

	if oldWaitingTime == -1 or math.floor( waitingTime ) ~= math.floor( oldWaitingTime ) then
		self:UpdateWatingTimeText()
	end

end


--
function UI.MatchMakingWnd:UpdateWatingTimeText()

	local str = ""

	if self.waitingTime ~= -1 then

		local roundTime = math.floor( self.waitingTime )
		str = UI:Time2Str3( roundTime )

	end

	self:SetText( str, self.layers.TIME_WAITING_VAL )

end


--
function UI.MatchMakingWnd:SetAverageTime( averageTime )

	local str = UI:Time2Str3( averageTime )
	self:SetText( str, self.layers.TIME_AVERAGE_VAL )
	self:SetText( str, self.layers.TIME_AVERAGE_VAL_SQUAD )

end


--
function UI.MatchMakingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self:IsActive() then

		self:UpdateWaitingTime( dt_sys )

		if self.state == self.states.SEARCHING_GAME then
			self:UpdateRequestTimer( dt_sys )

		elseif self.state == self.states.JOINING_GAME then
			self:UpdateJoiningTimer( dt_sys )
		end

		if self.needShowRoundMissMsg ~= -1 then
			self.needShowRoundMissMsg = self.needShowRoundMissMsg - dt_sys
			if self.needShowRoundMissMsg < 0 then
				self.needShowRoundMissMsg = -1
				if UI:IsInTournament() and not UI:IsTourTeamExist() and not UI:IsMsgBoxOnScreen() then
					UI:MessageBox( UI:GetStringByName( "msgCapt_information" ), UI:GetStringByName( "msg_tournamentRoundEndedInMM" ), UI.MBS_OK )
				end
			end
		end

	end

end


--
function UI.MatchMakingWnd:UpdateWaitingTime( dt )

	if self.waitingTime ~= -1 or _G.MasterServer_IsInTournament() then
		self:SetWaitingTime( self.waitingTime + dt )
	end

end


--
function UI.MatchMakingWnd:UpdateRequestTimer( dt )

	if self.requestTimer ~= -1 then
		self.requestTimer = self.requestTimer - dt

		if self.requestTimer <= 0 then
			self:Request_QueInfo()
		end
	end

end


--
function UI.MatchMakingWnd:UpdateJoiningTimer( dt_sys )

	if self.joiningTimer ~= -1 then

		self.joiningTimer = self.joiningTimer - dt_sys
		if self.joiningTimer <= 0 then

			UI.HangarWnd:SetPrepareState( UI.HangarWnd.prepareStates.NONE )

			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_joiningGameFail" ), UI.MBS_OK )

		end		

	end

end


--
function UI.MatchMakingWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.MatchMakingWnd:F_OnAfterHideFromScreen()
	self:OnAfterHideFromScreen()
	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end
end


--
function UI.MatchMakingWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	local firstMsgBox = UI:GetFirstMsgBox()
	if firstMsgBox then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
	local rect = self:GetRect()
	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end
	if not UI:IsPtInRect( rect, mouseX, mouseY ) then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
		if wndUnderMouse ~= UI.Hangar_StartBtn then
			UI.HangarWnd:HideMatchMakingWnd()
		end
	end

end

--
function UI.MatchMakingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w == UI.MatchMaking_CancelBtn then
		self:TryCancel()

	elseif w == UI.MatchMaking_MinimizeBtn then
		UI:PlayGlobalSound( self.sounds.hide )
		self:GetParent():Hide()
	end

	return true

end


--
function UI.MatchMakingWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self.bActive then
		return
	end

	if boxHandle == self.hMsgTimeOut then
		self.hMsgTimeOut = UI.INVALID_UI_HANDLE

		UI.HangarWnd:SetPrepareState( UI.HangarWnd.prepareStates.NONE )

	elseif boxHandle == self.hMsgExitMatchMaking then
		self.hMsgExitMatchMaking = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:Request_LeaveMMQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		end

	end

end


--
function UI.MatchMakingWnd:ShowMessageOnTimeOut()

	if self.hMsgTimeOut ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgTimeOut = UI:ShowMessageOnTimeOut()

end


--
function UI.MatchMakingWnd:UpdateCaption()

	local captionId = ""

	if self.state == self.states.SEARCHING_GAME then
		captionId = "matchMaking_searchingGame"
	elseif self.state == self.states.JOINING_GAME then
		captionId = "matchMaking_joiningGame"
	end

	if _G.MasterServer_IsInTournament() then

		captionId = "matchMaking_tournament"

	end

	self:SetText( UI:GetStringByName( captionId ), self.layers.CAPTION )

end


--
function UI.MatchMakingWnd:UpdateCancelBtn()

	UI.MatchMaking_CancelBtn:Enable( self.state == self.states.SEARCHING_GAME )

end


--
function UI.MatchMakingWnd:UpdateGameTypeName()

	local str = ""

	local queueInfo = _G.MasterServer_GetQueueInfo()

	local enqueuementParams = queueInfo.enqueuementParams

	if _G.MasterServer_IsInTournament() then

		enqueuementParams = _G.MasterServer_GetTournamentTeamsInfo().enqueuementParams
		str = UI:GetStringByName( "contract_TOURNAMENT" )

	else

		if queueInfo.enqueuementParams then
			if queueInfo.enqueuementParams.pve ~= nil then
				str = UI:GetStringByName( "contract_PVE" )
			elseif queueInfo.enqueuementParams.arcade ~= nil then
				str = UI:GetStringByName( "contract_ARCADE" )
			elseif queueInfo.enqueuementParams.brawl ~= nil then
				str = UI:GetStringByName( "gameplayChoice_slotName_BRAWL" )
			else
				str = UI:GetStringByName( "contract_SECTOR" )
			end
		end

	end

	self:SetText( str, self.layers.GAME_TYPE )

	str = ""
	if enqueuementParams and enqueuementParams.region then
		str = UI:GetStringByName( "matchMaking_rang_region" )
		str = string.gsub( str, "%$region%$", UI:GetStringByName( "region_"..UI:Val2Key( MasterServer.AuthRegion, enqueuementParams.region ) ) )
	end

	self:SetText( str, self.layers.REGION_VALUE )

end


--
function UI.MatchMakingWnd:F_OnEventSaveUiState()
	
	if self.bActive then

		UI.store.MatchMakingWnd =
		{
            lastRequestId_QueueInfo		= self.lastRequestId_QueueInfo,
            lastRequestId_LeaveMMQueue	= self.lastRequestId_LeaveMMQueue,
            waitingTime					= self.waitingTime,
            requestTimer				= self.requestTimer,
            state						= self.state,
			joiningTimer				= self.joiningTimer,
			bActive						= self.bActive,
			bPvp						= self.bPvp,
			bPve						= self.bPve,
			bArena						= self.bArena,
			bCoopVsAi					= self.bCoopVsAi,
		}

	end

end


--
function UI.MatchMakingWnd:F_OnEventRestoreUiState()

	if UI.store.MatchMakingWnd then

        self.lastRequestId_QueueInfo	= UI.store.MatchMakingWnd.lastRequestId_QueueInfo
        self.lastRequestId_LeaveMMQueue	= UI.store.MatchMakingWnd.lastRequestId_LeaveMMQueue
		self.waitingTime				= UI.store.MatchMakingWnd.waitingTime
        self.requestTimer				= UI.store.MatchMakingWnd.requestTimer
        self.state						= UI.store.MatchMakingWnd.state
		self.joiningTimer				= UI.store.MatchMakingWnd.joiningTimer
		self.bActive					= UI.store.MatchMakingWnd.bActive
		self.bPvp						= UI.store.MatchMakingWnd.bPvp
		self.bPve						= UI.store.MatchMakingWnd.bPve
		self.bArena						= UI.store.MatchMakingWnd.bArena
		self.bCoopVsAi					= UI.store.MatchMakingWnd.bCoopVsAi

		self:FullUpdate()

		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )

		UI.store.MatchMakingWnd = nil

	end

end   


--
function UI.MatchMakingWnd:OnEscape()

	self:TryCancel()
	return true

end


--
function UI.MatchMakingWnd:TryCancel()

	if not UI.MatchMaking_CancelBtn:IsEnabled() then
		return
	end

	self.hMsgExitMatchMaking = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )

end


-- -----------------------------------------------------------------------
-- UI.MatchMaking_CancelBtn
-- -----------------------------------------------------------------------

local l_baseBtnNumLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.MatchMaking_CancelBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "MatchMaking_CancelBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
    	},		

    	layers =
    	{
			numLayers = l_baseBtnNumLayers + 1,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,

    			effects =
    			{{
    				defName 			= "msgBox_btn",
    				defaultAnimation	= "select",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.MatchMaking_CancelBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- TEXT
    		{
    			id			= l_baseBtnNumLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
    			text = "^matchMaking_cancel"
    		},
		}
	},

    layers =
    {
    	MAIN_EFFECT		= 0,
    	DEBUG			= 1,
    	TEXT			= 2,
    },

    effectInfo =
    {
    	main =
    	{
			animationIdle 		= "idle",
			animationSelect		= "over_nofocus",
			animationPressed	= "press_nofocus",
    		animationDisabled	= "disable",
    	},
    }
}  

-- ------------------------------------------------------------------------
-- UI.MatchMaking_MinimizeBtn
-- ------------------------------------------------------------------------

UI.MatchMaking_MinimizeBtn =
{
    def =
    {

    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "MatchMaking_MinimizeBtn",
    		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
    				defName 			= "minimizeBtn",
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
    },

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "idle",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
    },

	tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "tooltip_hideMatchmaking" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end,
}