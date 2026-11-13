-- ----------------------------------------------------------------------------
--
-- Workfile: pvpmatchmakingwnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PvpMatchmakingWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PvpMatchmakingWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "PvpMatchmakingWnd",
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
						layer		= "UI.PvpMatchmakingWnd.layers.WORK_EFFECT",
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
						layer		= "UI.PvpMatchmakingWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text123",
						layer		= "UI.PvpMatchmakingWnd.layers.GAME_TYPE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text124",
						layer		= "UI.PvpMatchmakingWnd.layers.REGION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text135",
						layer		= "UI.PvpMatchmakingWnd.layers.AVERAGE_TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "timer_progr",
						layer		= "UI.PvpMatchmakingWnd.layers.TIME_WAITING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title25",
						layer		= "UI.PvpMatchmakingWnd.layers.TIME_WAITING_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_ico",
						wnd			= "UI.PvpMatchmaking_GameplaysListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn",
						wnd			= "UI.PvpMatchmaking_LeaveQueueBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn1",
						wnd			= "UI.PvpMatchmaking_CloseBtn",
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
			text			= UI:GetStringByName( "matchMaking_searchingGame" )
		}, 

		-- GAME_TYPE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- REGION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- AVERAGE_TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
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
	},

	children =
	{
		"UI.PvpMatchmaking_MapsListWnd",
		"UI.PvpMatchmaking_GameplaysListWnd",
		"UI.PvpMatchmaking_LeaveQueueBtn",
		"UI.PvpMatchmaking_CloseBtn",
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PvpMatchmakingWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.PvpMatchmakingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

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
function UI.PvpMatchmakingWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if result == 0 then
		self:OnQueueInfo()
	end

end


--
function UI.PvpMatchmakingWnd:OnHangarPrepareStateChanged()

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
function UI.PvpMatchmakingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.leaveQueueRequestId = 0

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PvpMatchmakingWnd.layers =
{
    MAIN_EFFECT			= 0,
	WORK_EFFECT			= 1,
    CAPTION				= 2,
    GAME_TYPE			= 3,
    REGION				= 4,
    AVERAGE_TIME		= 5,
	TIME_WAITING_EFFECT	= 6,
	TIME_WAITING_VAL	= 7,
}

UI.PvpMatchmakingWnd.NUM_WAITING_TIME_ANIMS	= 12

UI.PvpMatchmakingWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
}

UI.PvpMatchmakingWnd.effectInfo =
{
	work =
	{
		mapsListLocator				= "maps",
		averageTimeValColorLocator	= "color_text_1",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PvpMatchmakingWnd.waitingTime			= -1
UI.PvpMatchmakingWnd.savedQueueInfo			= nil
UI.PvpMatchmakingWnd.hMsgLeaveQueue			= UI.INVALID_UI_HANDLE
UI.PvpMatchmakingWnd.leaveQueueRequestId	= 0
UI.PvpMatchmakingWnd.averageTimeValColor	= UI.WHITE_COLOR

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PvpMatchmakingWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		self.averageTimeValColor = workEffect:GetObjColor( self.effectInfo.work.averageTimeValColorLocator )
	end

	local handle = self:GetUiHandle()

    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.PvpMatchmakingWnd:Reset()

	self.waitingTime = -1

	UI.PvpMatchmaking_MapsListWnd:Reset()
	UI.PvpMatchmaking_GameplaysListWnd:Clear()
	UI.PvpMatchmaking_LeaveQueueBtn:Enable( false )

	self:SetText( "", self.layers.REGION )
	self:SetText( "", self.layers.AVERAGE_TIME )
	self:SetText( "", self.layers.TIME_WAITING_VAL )

	local timeWaitingEffect = UI:GetEffectFromLayer( self, self.layers.TIME_WAITING_EFFECT )
	if timeWaitingEffect then
		timeWaitingEffect:StartAnimation( "0" )
	end

end


--
function UI.PvpMatchmakingWnd:FullUpdate()

	self:Reset()

	local serverInfo	= _G.MasterServer_GetServerInfo()
	local queueInfo		= self.savedQueueInfo or _G.MasterServer_GetQueueInfo()

    self:UpdateMaps()
    self:UpdateGameplays()
    self:UpdateGameType( queueInfo )
    self:UpdateRegion( queueInfo )
    self:UpdateAvarageTime( queueInfo )
    self:UpdateCancelBtn( queueInfo )
    self:UpdateWaitingTime()

	self:RecalcLayout()

end


--
function UI.PvpMatchmakingWnd:UpdateGameType( queueInfo )

	local str = "unknown game type"

	if UI:IsTrueEx( queueInfo.enqueuementParams.arcade ) then
		str = UI:GetStringByName( "contract_ARCADE" )

	elseif UI:IsTrueEx( queueInfo.enqueuementParams.coop_vs_ai ) then
		str = UI:GetStringByName( "matchmaking_gameType_COOP_VS_AI" )

	else
		sys.log( "UI.PvpMatchmakingWnd:UpdateGameType()[ERROR]: unhandled game type" )
	end

	self:SetText( str, self.layers.GAME_TYPE ) 

end


--
function UI.PvpMatchmakingWnd:UpdateMaps()

	UI.PvpMatchmaking_MapsListWnd:Update()

end


--
function UI.PvpMatchmakingWnd:UpdateGameplays()

	UI.PvpMatchmaking_GameplaysListWnd:Clear()

	if type( _G.GameplaysInfoList ) ~= "table" then
		sys.log( "UI.PvpMatchmakingWnd:UpdateGameplays()[ERROR]: invalid type of \"_G.GameplaysInfoList\"; \"table\" expected, got \"%s\"", type( _G.GameplaysInfoList ) )
		return
	end

	for idx, gameplay in ipairs( _G.GameplaysInfoList ) do

		if type( gameplay ) == "number" then

			local data = { gameplay = gameplay }
			UI.PvpMatchmaking_GameplaysListWnd:AddRecord( data )

		else
			sys.log( "UI.PvpMatchmakingWnd:UpdateGameplays()[ERROR]: invalid type of \"_G.GameplaysInfoList[%d]\"; \"number\" expected, got \"%s\"", idx, type( gameplay ) )
		end

	end

end


--
function UI.PvpMatchmakingWnd:UpdateRegion( queueInfo )

	local str = UI:GetStringByName( "matchMaking_rang_region" )
	local regionNameLocalized = ""

	if queueInfo.inQueue then

		regionNameLocalized = "unknown"

    	if type( queueInfo.enqueuementParams ) == "table" then

    		local region = queueInfo.enqueuementParams.region
    		if type( region ) == "number" then

    			local regionName = UI:Val2Key( _G.MasterServer.AuthRegion, region )
    			if regionName ~= "" then
    				
    				local regionNameStrId = string.format( "region_%s", regionName )
    				regionNameLocalized = UI:GetStringByName( regionNameStrId )

    			else
    				sys.log( "UI.PvpMatchmakingWnd:UpdateRegion()[ERROR]: invalid region %d; one of the _G.MasterServer.AuthRegion expected", region )
    			end

    		else
    			sys.log( "UI.PvpMatchmakingWnd:UpdateRegion()[ERROR]: invalid type of field \"enqueuementParams.region\"; \"number\" expected, got \"%s\"", type( region ) )
    		end

    	else
    		sys.log( "UI.PvpMatchmakingWnd:UpdateRegion()[ERROR]: invalid type of field \"enqueuementParams\"; \"table\" expected, got \"%s\"", type( queueInfo.enqueuementParams ) )
    	end

	end

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$region%$", regionNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.PvpMatchmakingWnd:UpdateRegion()[ERROR]: cannot find placeholder \"$region$\" in string \"matchMaking_rang_region\"" )
		str = string.format( "[INVALID STRING] Region: %s", regionNameLocalized )
	end

	self:SetText( str, self.layers.REGION )

end


--
function UI.PvpMatchmakingWnd:UpdateAvarageTime( queueInfo )

	local str = ""

	if queueInfo.inQueue then

		str = UI:GetStringByName( "matchMaking_averageTime" )


		local strVal = "unknown"

    	if type( queueInfo.averageTimeInQueue ) == "number" then
    		strVal = UI:Time2Str3( queueInfo.averageTimeInQueue )
    	else
    		sys.log( "UI.PvpMatchmakingWnd:UpdateAvarageTime()[ERROR]: invalid type of field \"averageTimeInQueue\"; \"number\" expected, got \"%s\"", type( queueInfo.averageTimeInQueue ) )
    	end

		local strValColor	= UI:Color2Str( self.averageTimeValColor )
		local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.AVERAGE_TIME ) )

		strVal = string.format( "%s%s%s", strValColor, strVal, strBaseColor )

		str = string.format( "%s %s", str, strVal )


    	if UI.Squad:IsInSquad() then

    		local strInSquad = UI:GetStringByName( "matchMaking_averageTime_longerInSquad" )
    		str = string.format( "%s|%s", str, strInSquad )

    	end

	end


	self:SetText( str, self.layers.AVERAGE_TIME )

end


--
function UI.PvpMatchmakingWnd:UpdateWaitingTime()

	local oldWaitingTime = self.waitingTime
	self.waitingTime = UI.MatchMakingWnd:IsActive() and UI.MatchMakingWnd:GetWaitingTime() or -1

	if math.floor( self.waitingTime ) == math.floor( oldWaitingTime ) then
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
function UI.PvpMatchmakingWnd:UpdateCancelBtn( queueInfo )

	local bEnable = queueInfo.inQueue
	UI.PvpMatchmaking_LeaveQueueBtn:Enable( bEnable )

end


--
function UI.PvpMatchmakingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateWaitingTime()

end


--
function UI.PvpMatchmakingWnd:OnQueueInfo()

	if not UI.MatchMakingWnd:IsActive() or not UI.MatchMakingWnd:IsPvp() then
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

	    self:UpdateGameType( queueInfo )
    	self:UpdateRegion( queueInfoToShow )
        self:UpdateAvarageTime( queueInfoToShow )
        self:UpdateCancelBtn( queueInfo )

	end

end


--
function UI.PvpMatchmakingWnd:F_OnEventSaveUiState()
	
	if self.savedQueueInfo then

		UI.store.PvpMatchmakingWnd =
		{
            savedQueueInfo		= self.savedQueueInfo,
			leaveQueueRequestId	= self.leaveQueueRequestId,
		}

	end

	self:Hide()

end


--
function UI.PvpMatchmakingWnd:F_OnEventRestoreUiState()

	if UI.store.PvpMatchmakingWnd then

		self.savedQueueInfo			= UI.store.PvpMatchmakingWnd.savedQueueInfo
		self.leaveQueueRequestId	= UI.store.PvpMatchmakingWnd.leaveQueueRequestId

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.PvpMatchmakingWnd = nil

	end

end   


--
function UI.PvpMatchmakingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.PvpMatchmaking_LeaveQueueBtn then
		self:TryLeaveQueue()

	elseif wnd == UI.PvpMatchmaking_CloseBtn then
		UI.HangarWnd:HidePvpMatchmakingWnd( true )
		UI:PlayGlobalSound( self.sounds.hide )
	end

	return true

end


--
function UI.PvpMatchmakingWnd:TryLeaveQueue()

	if not UI.PvpMatchmaking_LeaveQueueBtn:IsEnabled() then
		return
	end

	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaveQueue = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )

end


--
function UI.PvpMatchmakingWnd:DoLeaveQueue()

	self.leaveQueueRequestId = _G.MasterServer_LeaveMatchmakingQueue()

	if self.leaveQueueRequestId == 0 then
		UI:ShowMsgOnLeaveQueueError()
	end

end


--
function UI.PvpMatchmakingWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLeaveQueue then

		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoLeaveQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		end

	end

end


--
function UI.PvpMatchmakingWnd:HideLeaveQueueMsg()

    if self.hMsgLeaveQueue == UI.INVALID_UI_HANDLE then
		return
	end

    UI:RemoveUiObj( self.hMsgLeaveQueue ) 
    self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE

end


--
function UI.PvpMatchmakingWnd:RecalcLayout()

	local mapsWidth		= UI.PvpMatchmaking_MapsListWnd:GetWidth()
	local mapsHeight	= UI.PvpMatchmaking_MapsListWnd:GetHeight()

	local orgPos		= UI:ZeroVec2()
	local workEffectPos	= UI:ZeroVec2()	

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		local mapsLocatorPos	= workEffect:GetObjPos( self.effectInfo.work.mapsListLocator )
		local mapsBaseSize		= UI.PvpMatchmaking_MapsListWnd:GetBaseSize()

		orgPos.x = mapsLocatorPos.x + mapsBaseSize.x * 0.5
		orgPos.y = mapsLocatorPos.y + mapsBaseSize.y * 0.5

		workEffectPos = workEffect:GetPos()

	end

	local maps_x = orgPos.x - mapsWidth * 0.5 + workEffectPos.x
	local maps_y = orgPos.y - mapsHeight * 0.5 + workEffectPos.y

	UI.PvpMatchmaking_MapsListWnd:SetPos( maps_x, maps_y )

end


--
function UI.PvpMatchmakingWnd:OnEscape()

	UI.HangarWnd:HidePvpMatchmakingWnd()
	return true

end


-- ----------------------------------------------------------------
-- UI.PvpMatchmaking_LeaveQueueBtn
-- ----------------------------------------------------------------

UI.PvpMatchmaking_LeaveQueueBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn9",

    	props =
    	{
    		name	= "PvpMatchmaking_LeaveQueueBtn"
    	}
	},

	textId = "matchMaking_cancel"
}

-- ----------------------------------------------------------------
-- UI.PvpMatchmaking_CloseBtn
-- ----------------------------------------------------------------

UI.PvpMatchmaking_CloseBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "PvpMatchmaking_CloseBtn",
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
-- UI.PvpMatchmaking_GameplaysListWnd
-- ----------------------------------------------------------------

UI.PvpMatchmaking_GameplaysListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PvpMatchmaking_GameplaysListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "PvpMatchmaking_GameplaysListWnd",
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
				defName 			= "pvpMatchmaking_gameplaysList",
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

UI.PvpMatchmaking_GameplaysListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "gmp_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.PvpMatchmaking_GameplaysListWnd.btnPrototypeName	= "PvpMatchmaking_GameplaySlotWnd"
UI.PvpMatchmaking_GameplaysListWnd.MAX_SLOTS		= 6
UI.PvpMatchmaking_GameplaysListWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- ----------------------------------------------------------------
-- UI.PvpMatchmaking_GameplaySlotWnd
-- ----------------------------------------------------------------

UI.PvpMatchmaking_GameplaySlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PvpMatchmaking_GameplaySlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PvpMatchmaking_GameplaySlotWnd",
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
				defName 			= "pvpMatchmaking_gameplaySlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self104",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PvpMatchmaking_GameplaySlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.tooltipData = nil
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.PvpMatchmaking_GameplaySlotWnd:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PvpMatchmaking_GameplaySlotWnd.layers =
{
    MAIN_EFFECT	= 0,    
}

UI.PvpMatchmaking_GameplaySlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "race_ico3",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PvpMatchmaking_GameplaySlotWnd.tooltipData = nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PvpMatchmaking_GameplaySlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateTooltip( data )

end


--
function UI.PvpMatchmaking_GameplaySlotWnd:UpdateIco( data )

	local hTex = UI:GetGameplayIco( data.gameplay )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.PvpMatchmaking_GameplaySlotWnd:UpdateTooltip( data )

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE

	self.tooltipData.caption = UI:Gameplay2Str( data.gameplay )

	local gameplayName	= UI:Val2Key( ai.Gameplay, data.gameplay )
	local descStrId		= string.format( "gameplay_desc_%s_full", gameplayName )
	
	self.tooltipData.text = UI:GetStringByName( descStrId )

end


-- ----------------------------------------------------------------
-- UI.PvpMatchmaking_MapsListWnd
-- ----------------------------------------------------------------

UI.PvpMatchmaking_MapsListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PvpMatchmaking_MapsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "PvpMatchmaking_MapsListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
function UI.PvpMatchmaking_MapsListWnd:Update()

	self:Reset()

	local zones = {}

	for zoneName, zoneDesc in pairs( _G.SpaceZone ) do
		if type( zoneDesc.pvp_level_name ) == "string" and zoneDesc.pvp_level_name ~= "" then
			table.insert( zones, zoneDesc )
		end
	end

	local fnSort = function( zoneDesc1, zoneDesc2 )

		local zoneRank1 = type( zoneDesc1.min_ship_rank ) == "number" and zoneDesc1.min_ship_rank or -1
		local zoneRank2 = type( zoneDesc2.min_ship_rank ) == "number" and zoneDesc2.min_ship_rank or -1

		if zoneRank1 ~= zoneRank2 then
			return zoneRank1 < zoneRank2
		end

		return zoneDesc1.zone_id < zoneDesc2.zone_id

	end

	table.sort( zones, fnSort )

	for idx, zoneDesc in ipairs( zones ) do

		local slotWnd = self:ObtainSlot()	
		slotWnd:Setup( zoneDesc.zone_id )

	end

	self:RecalcLayout()

end


--
function UI.PvpMatchmaking_MapsListWnd:Reset()

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.slots = {}

end


--
function UI.PvpMatchmaking_MapsListWnd:GetBaseSize()

	return self.baseSize

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PvpMatchmaking_MapsListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.PvpMatchmaking_MapsListWnd.effectInfo =
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

UI.PvpMatchmaking_MapsListWnd.allSlots		= {}
UI.PvpMatchmaking_MapsListWnd.slots			= {}

UI.PvpMatchmaking_MapsListWnd.baseSize		= Vec2( 0, 0 )
UI.PvpMatchmaking_MapsListWnd.slotSize		= Vec2( 0, 0 )
UI.PvpMatchmaking_MapsListWnd.slots_space_x	= 0
UI.PvpMatchmaking_MapsListWnd.slots_space_y	= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PvpMatchmaking_MapsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.PvpMatchmaking_MapsListWnd:InitSlots()

	for idx = 1, 15 do
		self:CreateSlot()
	end

end


--
function UI.PvpMatchmaking_MapsListWnd:ObtainSlot()

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
function UI.PvpMatchmaking_MapsListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.PvpMatchmaking_MapSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.PvpMatchmaking_MapsListWnd:PrepareLayout()

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
function UI.PvpMatchmaking_MapsListWnd:RecalcLayout()

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
function UI.PvpMatchmaking_MapsListWnd:DetectNumSlotsInRow( row )

	local DEFAULT_NUM_SLOTS	= 5

	local numSlots = DEFAULT_NUM_SLOTS

	if type( _G.PvpMapsLayout ) == "table" then

		numSlots = _G.PvpMapsLayout[ row ]

		if type( numSlots ) ~= "number" then
			sys.log( "UI.PvpMatchmaking_MapsListWnd:DetectNumSlotsInRow()[ERROR]: invalid type of \"_G.PvpMapsLayout[%d]\"; \"number\" expected, got \"%s\"", row, type( numSlots ) )
			numSlots = DEFAULT_NUM_SLOTS
		end

	else
		sys.log( "UI.PvpMatchmaking_MapsListWnd:DetectNumSlotsInRow()[ERROR]: invalid type of \"_G.PvpMapsLayout\"; \"table\" expected, got \"%s\"", type( _G.PvpMapsLayout ) )
	end

	return numSlots

end


-- ----------------------------------------------------------------
-- UI.PvpMatchmaking_MapSlotWnd
-- ----------------------------------------------------------------

UI.PvpMatchmaking_MapSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PvpMatchmaking_MapSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PvpMatchmaking_MapSlotWnd",
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
				}
			}}
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PvpMatchmaking_MapSlotWnd:Setup( zoneId )

	self:Reset()

	self.zoneId = zoneId
	self:FullUpdate()

end


--
function UI.PvpMatchmaking_MapSlotWnd:Reset()

	self.zoneId			= -1
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.PvpMatchmaking_MapSlotWnd:GetTooltipData()

	return self.tooltipData

end

-- -------------------------------------
-- const
-- -------------------------------------

UI.PvpMatchmaking_MapSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
}

UI.PvpMatchmaking_MapSlotWnd.effectInfo =
{
	ico =
	{
		icoSpriteName	= "ico"
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.PvpMatchmaking_MapSlotWnd.zoneId			= -1
UI.PvpMatchmaking_MapSlotWnd.tooltipData	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PvpMatchmaking_MapSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.PvpMatchmaking_MapSlotWnd:UpdateIco()

	local zoneName = UI:ZoneId2Name( self.zoneId )
	local hTex = UI:GetZoneIco( zoneName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end
	
end


--
function UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()

	local zoneName = UI:ZoneId2Name( self.zoneId )

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE

	self.tooltipData.caption = UI:Zone2Str( zoneName )
	self.tooltipData.text = ""


	-- текст
	
	-- описание

	local levelName = UI:GetZoneLevel( zoneName )
	local strDesc = UI:GetLevelDescShort( levelName )
	
	if strDesc ~= "" then
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "||" or "", strDesc )
	end


	-- список геймплеев

	local availableGameplaysMap = {}

	if type( _G.AvailableLobbySettings ) == "table" then

    	for levelIdx, levelInfo in pairs( _G.AvailableLobbySettings ) do

    		if levelInfo.levelName == levelName and not( levelInfo.forbiddenOnLive and cvars.cl_versionType == "live" ) then

				if type( levelInfo.gameMode ) == "table" then

					for gameplayIdx, gameplay in pairs( levelInfo.gameMode ) do

						if type( gameplay ) == "number" then
							availableGameplaysMap[ gameplay ] = true
						else
							sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.AvailableLobbySettings[%s].gameMode[%s]\"; \"table\" or \"number\" expected, got \"%s\"", tostring( levelIdx ), tostring( gameplayIdx ), type( gameplay ) )
						end

					end

				elseif type( levelInfo.gameMode ) == "number" then
					availableGameplaysMap[ levelInfo.gameMode ] = true

				else
					sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.AvailableLobbySettings[%d].gameMode\"; \"table\" or \"number\" expected, got \"%s\"", tostring( levelIdx ), type( levelInfo.gameMode ) )
				end

				break

    		end

    	end

	else
		sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.AvailableLobbySettings\"; \"table\" expected, got \"%s\"", type( _G.AvailableLobbySettings ) )
	end


	local gameplays = {}

	if type( _G.GameplaysInfoList ) == "table" then

    	for idx, gameplay in ipairs( _G.GameplaysInfoList ) do

    		if type( gameplay ) == "number" then

				if availableGameplaysMap[ gameplay ] then
					table.insert( gameplays, gameplay )
				end

    		else
    			sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.GameplaysInfoList[%d]\"; \"number\" expected, got \"%s\"", idx, type( gameplay ) )
    		end

    	end

	else
		sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.GameplaysInfoList\"; \"table\" expected, got \"%s\"", type( _G.GameplaysInfoList ) )
	end


	local strGameplaysItems = ""

	for idx, gameplay in ipairs( gameplays ) do
		local strGameplay = UI:Gameplay2Str( gameplay )
		strGameplaysItems = string.format( "%s%s%s", strGameplaysItems, strGameplaysItems ~= "" and ", " or "", strGameplay )
	end 

	local strGameplays = UI:GetStringByName( "level_gameplays" )

	local numGamepaySubst = 0
	strGameplays, numGamepaySubst = string.gsub( strGameplays, "%$gameplays%$", strGameplaysItems )

	if numGamepaySubst == 0 then
		sys.log( "UI.PvpMatchmaking_MapSlotWnd:UpdateTooltip()[ERROR]: cannot find placeholder \"$gameplays$\" in string \"level_gameplays\"" )
		strGameplays = string.format( "[INVALID STRING] Gameplays: %s", strGameplaysItems )
	end
	
	if strGameplays ~= "" then
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "||" or "", strGameplays )
	end

end