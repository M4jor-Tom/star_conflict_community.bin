-- ----------------------------------------------------------------------------
--
-- Workfile: controlswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.SquadWnd
-- -----------------------------------------------------------------

UI.SquadWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.SquadWnd.def =
{
	className	= "Wnd",
	--prototype	= "ButtonsListWnd",

	props =
	{
		name				= "SquadWnd",
		style				= 0,	-- стиля WS_UPDATE_IF_VISIBLE нет, т.к. подписка на ивент EV_NEW_FRAME производится вручную
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName				= "squad_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "squad_trans",
						wnd			= "UI.Squad_ConvertWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "squad_find",
						wnd			= "UI.Squad_SquadFinderBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},
	children = { "UI.Squad_ListWnd", "UI.Squad_ConvertWnd", "UI.Squad_SquadFinderBtn" }
}

UI.SquadWnd.layers =
{
	MAIN_EFFECT		= 0,
}

UI.SquadWnd.CLEAR_FAIL_TIME = 3

UI.SquadWnd.effectInfo =
{
	main =
	{
		convertLocator	= "squad_trans",
		listLocator		= "list",
		minSizeLocator	= "dist_min",
	}
}


UI.SquadWnd.startFaileTime = nil
UI.SquadWnd.cancelInviteRequestId = 0

UI.SquadWnd.space_top_convert	= 0
UI.SquadWnd.space_convert_list	= 0
UI.SquadWnd.space_list_btm		= 0
UI.SquadWnd.minHeight			= 0
UI.SquadWnd.maxHeight			= 0


--
function UI.SquadWnd:MasterServer_OnSquadInviteCancel( result, requestId, unused1, unused2, uid )

	if requestId == self.cancelInviteRequestId then

		if result ~= _G.MasterServer.SquadOpResult.SOR_OK then
			self:ShowMsgOnCancelInviteError( result )
		end

		self.cancelInviteRequestId = 0

	end

end


--
function UI.SquadWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.cancelInviteRequestId = 0

end


--
function UI.SquadWnd:SquadFinder_OnMyGroupCreate()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSquadFinderBtn()

end


--
function UI.SquadWnd:SquadFinder_OnMyGroupDelete()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSquadFinderBtn()

end


--
function UI.SquadWnd:SquadFinder_OnMyGroupChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSquadFinderBtn()

end


--
function UI.SquadWnd:SquadFinder_OnRejectJoin( uid )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSquadFinderBtn()

end


--
function UI.SquadWnd:ClearStatusLabel()

	self.startFaileTime = _G.TimerGetRealTime()
	self:UpdateNewFrameSubscription()

end


--
function UI.SquadWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	if self.startFaileTime then
		if _G.TimerGetRealTime() - self.startFaileTime > self.CLEAR_FAIL_TIME then
			self.startFaileTime = nil
			self:UpdateNewFrameSubscription()
			UI.Squad:ReloadSquadList()
		end
	end
end


--
function UI.SquadWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selfMinSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local convertPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.convertLocator ) or Vec2( 0, 0 )
	local convertHeight	= UI.Squad_ConvertWnd:GetHeight()	
	local listPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.listLocator ) or Vec2( 0, 0 )
	local listHeight	= UI.Squad_ListWnd:GetBaseHeight()

	self.space_top_convert	= convertPos.y
	self.space_convert_list	= listPos.y - ( convertPos.y + convertHeight )
	self.space_list_btm		= selfSize.y - ( listPos.y + listHeight )
	self.minHeight			= selfMinSize.y
	self.maxHeight			= selfSize.y

	self:SetWidth( selfSize.x )		

end


--
function UI.SquadWnd:RecalcLayout()

	-- позиция списка

	local listY = 0

	if UI.Squad_ConvertWnd:IsChildOf( self ) then
		listY = UI.Squad_ConvertWnd:GetTop() + UI.Squad_ConvertWnd:GetHeight() + self.space_convert_list
	else
		listY = self.space_top_convert
	end

	UI.Squad_ListWnd:SetTop( listY )
	

	-- собственный размер и анимация

	local selfHeight = listY + UI.Squad_ListWnd:GetHeight() + self.space_list_btm
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )
	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end

--
function UI.SquadWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end

--
function UI.SquadWnd:Reload( bSquadCreate )

	if bSquadCreate == nil then
		bSquadCreate = false
	end

	self.startFailer = nil
	UI.Squad_ListWnd:Clear()
	if UI.Squad:IsInSquad() then
		if not self:IsOnScreen() and ( not UI.Hangar_SquadBtn:IsOnScreen() or bSquadCreate ) then
			UI.HangarWnd:TryShowSquadWnd()
		end
		local records = {}
		local leaderUid = UI.Squad:GetLeaderUid()
		for i = 1, UI.Squad:GetPilotsCount() do

			local info = UI:CopyTable2( UI.Squad:GetPilotsInfo( i ) )
			info.bInvited = false

			table.insert( records, info )

		end

		for i = 1, UI.Squad:GetInvitedPlayersCount() do

			local info = UI:CopyTable2( UI.Squad:GetInvitedPlayerInfo( i ) )
			info.bInvited = true		

			table.insert( records, info )

		end

		local localPlayerUid = UI:GetLocalPlayerUid()

		local function SortSquad( info1, info2 )

			if info1.uid == localPlayerUid then
				return true
			end

			if info2.uid == localPlayerUid then
				return false
			end			

			local leaderUid = UI.Squad:GetLeaderUid()
			if info1.uid == leaderUid then
				return true
			end
			if info2.uid == leaderUid then
				return false
			end
			return info1.nickname < info2.nickname 
		end

		table.sort( records, SortSquad )
		for i = 1, #records do
			UI.Squad_ListWnd:AddRecord( records[ i ] )
		end
		
		if UI.Squad:IsWing() then
			UI.Squad_ConvertWnd:UnlinkFromParent()
		else
			if UI.Squad:IsLeader() then
				self:AddChild( UI.Squad_ConvertWnd )
			else
				UI.Squad_ConvertWnd:UnlinkFromParent()
			end
		end

		self:UpdateSquadFinderBtn()

		self:RecalcLayout()

		UI.HangarWnd:OnSquadWndReload()

	else
		UI.HangarWnd:HideSquadWnd()
	end
end

--
function UI.SquadWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.Squad_ConvertBtnWnd then
		if UI.Squad_ConvertBtnWnd:IsGray() then
			return true
		end
		UI:PlayGlobalSound( UI.sounds.btnClick )
		_G.MasterServer_SquadConvertToWing()

	elseif wnd == UI.Squad_SquadFinderBtn then

		if UI.SquadFinder:IsMyGroup() then
			UI.HangarWnd:ShowSquadFinderMyGroupWnd( true )
		else
			UI.HangarWnd:ShowSquadFinderGroupsWnd( true )
		end

	end

	return true
end


--
function UI.SquadWnd:CancelInvite( uid )

	if self.cancelInviteRequestId ~= 0 then
		return
	end

	self.cancelInviteRequestId = _G.MasterServer_SquadInviteCancel( uid )

	if self.cancelInviteRequestId == 0 then
		self:ShowMsgOnCancelInviteError( _G.MasterServer.SquadOpResult.SOR_ERROR )
	end

end


--
function UI.SquadWnd:ShowMsgOnCancelInviteError( result )

	local resultName = UI:Val2Key( _G.MasterServer.SquadOpResult, result )
	local strResult = UI:GetStringByName( resultName )

	local msg = UI:GetStringByName( "squad_inviteError" )
	msg = string.format( msg, strResult )

	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end


--
function UI.SquadWnd:F_OnEventSaveUiState()

	UI.store.SquadWnd =
	{
		cancelInviteRequestId = self.cancelInviteRequestId
	}

end


--
function UI.SquadWnd:F_OnEventRestoreUiState()

	if UI.store.SquadWnd then

		self.cancelInviteRequestId = UI.store.SquadWnd.cancelInviteRequestId

		UI.store.SquadWnd = nil

	end

end


--
function UI.SquadWnd:UpdateSquadFinderBtn()

	if UI.Squad:IsLeader() then

		UI.Squad_SquadFinderBtn:Enable( true )
		UI.Squad_SquadFinderBtn:SetBtnText( UI.SquadFinder:IsMyGroup() and UI:GetStringByName( "squad_wnd_squadFinderBtn_myGroup" ) or UI:GetStringByName( "squad_wnd_squadFinderBtn_createMyGroup" ) )

		UI.Squad_SquadFinderBtn:ResetNewJoins()

		if UI.SquadFinder:IsMyGroup() then

			local newJoins = 0

			local groupInfo = UI.SquadFinder:GetMyGroupInfo()
			for joinIdx, joinInfo in pairs( groupInfo.joinReqs ) do
				if not joinInfo.invited then
					newJoins = newJoins + 1
				end
			end

			if newJoins > 0 then
				UI.Squad_SquadFinderBtn:SetNewJoins( newJoins )
			end

		end

	else
		UI.Squad_SquadFinderBtn:Enable( false )
		UI.Squad_SquadFinderBtn:SetBtnText( UI:GetStringByName( "squad_wnd_squadFinderBtn_createMyGroup" ) )
		UI.Squad_SquadFinderBtn:ResetNewJoins()
	end

end


--
function UI.SquadWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateSquadFinderBtn()
	self:UpdateNewFrameSubscription()

end


--
function UI.SquadWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	self:UpdateNewFrameSubscription()

end


--
function UI.SquadWnd:UpdateNewFrameSubscription()

	local bNeedUpdateNewFrame =
		self:IsOnScreen()
		or self.startFaileTime ~= nil

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

    	if bNeedUpdateNewFrame then
    		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
    	else
    		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )		
    	end

	end

end


-- -----------------------------------------------------------------
-- UI.Squad_ListWnd
-- -----------------------------------------------------------------

UI.Squad_ListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Squad_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name				= "Squad_ListWnd",
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
				defName				= "squad_list",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Squad_ListWnd:GetBaseHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjSize( "self" ).y or 0

end

-- ------------------------------
-- const
-- ------------------------------

UI.Squad_ListWnd.btnPrototypeName	= "Squad_SlotWnd"

UI.Squad_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_0",
		scrollObjName		= "scroll",
	}
}

UI.Squad_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.Squad_ListWnd.MAX_SLOTS = 8

-- ------------------------------
-- vars
-- ------------------------------

UI.Squad_ListWnd.space_slots_btm = 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Squad_ListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	self:PrepareLayout()

end


--
function UI.Squad_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( "sound/ui/btnMouseOver" )
	end
	return true
end


--
function UI.Squad_ListWnd:ShowSlot( slot )
	
	UI.ButtonsListWnd.ShowSlot( self, slot )

	self:RecalcLayout()

end


--
function UI.Squad_ListWnd:HideSlot( slot )

	UI.ButtonsListWnd.HideSlot( self, slot )

	self:RecalcLayout()

end


--
function UI.Squad_ListWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self:GetButtonForSlot( 1 )

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local lastSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) ) or Vec2( 0, 0 )
	local slotHeight	= slotWnd and slotWnd:GetHeight() or 0

	self.space_slots_btm = selfSize.y - ( lastSlotPos.y + slotHeight )

	self:SetWidth( selfSize.x )

end


--
function UI.Squad_ListWnd:RecalcLayout()

	local selfHeight = 0

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if lastVisibleRecordIdx ~= -1 then	

		local lastVisibleSlot = self:GetButtonForRecord( lastVisibleRecordIdx ) 
		selfHeight = lastVisibleSlot:GetTop() + lastVisibleSlot:GetHeight() + self.space_slots_btm

	end

	self:SetHeight( selfHeight )

end


-- -----------------------------------------------------------------
-- UI.Squad_SlotWnd
-- -----------------------------------------------------------------

UI.Squad_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Squad_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "Squad_SlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "squad_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.Squad_SlotWnd.layers.NICKNAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "status_2",	
						layer		= "UI.Squad_SlotWnd.layers.READY_STATUS_ICO",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",	
						layer		= "UI.Squad_SlotWnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,

   			effects =
			{{
				defName 			= "squad_slot_over",
				defaultAnimation	= "idle",
			}}
		},

		-- NICKNAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- READY_STATUS_ICO
		{
			layerType			= UI.LAYER_EFFECT,
			layerStyle			= UI.WLS_RESIZABLE,

   			effects =
			{{
				defName 			= "squad_slot_status_ico",
				defaultAnimation	= "on",
			}}
		},
	}
}


--
UI.Squad_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    OVER_EFFECT			= 1,
    NICKNAME			= 2,
    READY_STATUS_ICO	= 3,
}


--
UI.Squad_SlotWnd.onlineStatisIcoWnd	= nil
UI.Squad_SlotWnd.cancelInviteBtn	= nil


--
function UI.Squad_SlotWnd:UpdateForData( data, bAnimated )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local nickNameColor = UI.WHITE_COLOR

	if data.uid == UI.Squad:GetLeaderUid() then
		nickNameColor = mainEffect:GetObjColor( "color_lid" )
	elseif data.offlineStatus == MasterServer.UserState.USER_STATE_OFFLINE or data.bInvited then
		nickNameColor = mainEffect:GetObjColor( "color_offline" )
	else
		nickNameColor = mainEffect:GetObjColor( "color_online" )
	end

	self:SetColor( nickNameColor, self.layers.NICKNAME )	
	self:SetText( data.nickname, self.layers.NICKNAME )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.READY_STATUS_ICO )
	if not data.bInvited and UI.Squad:IsReadyCheckNeedShowStatus() then
		if data.offlineStatus == MasterServer.UserState.USER_STATE_OFFLINE then
			self:SetLayerVisible( true, self.layers.READY_STATUS_ICO )
			icoEffect:StartAnimation( "off" )
		elseif data.readyCheckStatus == 0 then
			self:SetLayerVisible( false, self.layers.READY_STATUS_ICO )
		elseif data.readyCheckStatus == 1 then
			self:SetLayerVisible( true, self.layers.READY_STATUS_ICO )
			icoEffect:StartAnimation( "on" )
		elseif data.readyCheckStatus == -1 then
			self:SetLayerVisible( true, self.layers.READY_STATUS_ICO )
			icoEffect:StartAnimation( "off" )
		end

	else
		self:SetLayerVisible( false, self.layers.READY_STATUS_ICO )
	end

	if data.bInvited then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.cancelInviteBtn, mainEffect, "ignor_btn", UI.EffectAnimParams.POS )		

	else

		self.cancelInviteBtn:UnlinkFromParent()
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:UnlinkWnd( self.cancelInviteBtn:GetUiHandle(), "" )

	end


	local onlineStatusIcoMode = -1

	if data.bInvited then
		onlineStatusIcoMode = UI.Squad_Slot_OnlineStatusIcoWnd.modes.INVITED

	elseif data.offlineStatus == _G.MasterServer.UserState.USER_STATE_OFFLINE then
		onlineStatusIcoMode = UI.Squad_Slot_OnlineStatusIcoWnd.modes.OFFLINE

	else
		onlineStatusIcoMode = UI.Squad_Slot_OnlineStatusIcoWnd.modes.ONLINE
	end	

	self.onlineStatisIcoWnd:SetMode( onlineStatusIcoMode, data.uid == UI.Squad:GetLeaderUid() )

end


--
function UI.Squad_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	UI.ContextMenu:Clear()

	-- fill context menu
	local data = self:GetRecordData()

	UI.ContextMenu:SetName( data.nickname )

	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_SQUAD, data.uid )
	
	UI.ContextMenu:Show( mouseX, mouseY )
	return true

end


--
function UI.Squad_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.cancelInviteBtn then

		local data = self:GetRecordData()
		UI.SquadWnd:CancelInvite( data.uid )

	end

	return true

end


--
function UI.Squad_SlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

	self:CreateControls()

end


--
function UI.Squad_SlotWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.cancelInviteBtn = UI:CreateChildWnd( self, UI.Squad_Slot_CancelInviteBtn, "" )

	self.onlineStatisIcoWnd = UI:CreateChildWnd( self, UI.Squad_Slot_OnlineStatusIcoWnd, "" )
	UI:AddChildAndLink( self, self.onlineStatisIcoWnd, mainEffect, "status", UI.EffectAnimParams.POS )

end


--
function UI.Squad_SlotWnd:F_OnMouseIn()

	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true

end


--
function UI.Squad_SlotWnd:F_OnMouseOut()

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true

end


-- -------------------------------------------------------------------
-- UI.Squad_Slot_CancelInviteBtn
-- -------------------------------------------------------------------

UI.Squad_Slot_CancelInviteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Squad_Slot_CancelInviteBtn",
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
    				defName				= "squad_slot_cancelInviteBtn",
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

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "squad_calcelInviteTooltip" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end 
}


-- -------------------------------------------------------------------
-- UI.Squad_Slot_OnlineStatusIcoWnd
-- -------------------------------------------------------------------

UI.Squad_Slot_OnlineStatusIcoWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Squad_Slot_OnlineStatusIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Squad_Slot_OnlineStatusIcoWnd",
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
				defName				= "squad_slot_onlineStatusIco",
				defaultAnimation    = "offline",

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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Squad_Slot_OnlineStatusIcoWnd:SetMode( mode, bLeader )

	self.mode		= mode
	self.bLeader	= bLeader

	self:FullUpdate()

end


--
function UI.Squad_Slot_OnlineStatusIcoWnd:Reset()

	self.mode			= -1
	self.bLeader		= false
	self.tooltipData	= nil

end


--
function UI.Squad_Slot_OnlineStatusIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.Squad_Slot_OnlineStatusIcoWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Squad_Slot_OnlineStatusIcoWnd.modes =
{
	ONLINE		= 1,
	OFFLINE 	= 2,
	INVITED	    = 3,
}

UI.Squad_Slot_OnlineStatusIcoWnd.effectInfo =
{
	main =
	{
		animOnline			= "online",
		animOnline_leader	= "lid",
		animOffline			= "offline",
		animOffline_leader	= "offline",
		animInvited			= "waiting",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Squad_Slot_OnlineStatusIcoWnd.mode			= -1
UI.Squad_Slot_OnlineStatusIcoWnd.bLeader		= false
UI.Squad_Slot_OnlineStatusIcoWnd.tooltipData	= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Squad_Slot_OnlineStatusIcoWnd:FullUpdate()

	self:UpdateAnimation()
	self:UpdateTooltip()

end


--
function UI.Squad_Slot_OnlineStatusIcoWnd:UpdateAnimation()

	if self.mode == -1 then
		return
	end

	local anim = ""

	if self.mode == self.modes.ONLINE then
		anim = self.bLeader and self.effectInfo.main.animOnline_leader or self.effectInfo.main.animOnline

	elseif self.mode == self.modes.OFFLINE then
		anim = self.bLeader and self.effectInfo.main.animOffline_leader or self.effectInfo.main.animOffline

	elseif self.mode == self.modes.INVITED then
		anim = self.effectInfo.main.animInvited

	else
		sys.log( "UI.Squad_Slot_OnlineStatusIcoWnd:UpdateAnimation()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	if anim ~= "" then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.Squad_Slot_OnlineStatusIcoWnd:UpdateTooltip()

	if self.mode == -1 then
		self.tooltipData = nil
		return
	end

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL

	local strId = string.format( "squad_statusTooltip_%s", UI:Val2Key( self.modes, self.mode ) )
	self.tooltipData.text = UI:GetStringByName( strId )	

end

-- -------------------------------------------------------------------
-- UI.Squad_ConvertWnd
-- -------------------------------------------------------------------

UI.Squad_ConvertWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Squad_ConvertWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Squad_ConvertWnd",
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
				defName 			= "squad_convert",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "trans_btn",	
						wnd			= "UI.Squad_ConvertBtnWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_5",	
						layer		= "UI.Squad_ConvertWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
			text			= UI:GetStringByName( "squad_convertToWing" ),
		},
	},

	children = { "UI.Squad_ConvertBtnWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Squad_ConvertWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.Squad_ConvertWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Squad_ConvertWnd.tooltipData =
{
	tooltipType = UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "squad_tooltip_convert_to_wing_caption" ),
	text		= UI:GetStringByName( "squad_tooltip_convert_to_wing_text" )..UI:GetStringByName( "squad_tooltip_convert_to_wing_help_text" ),
}

-- -------------------------------------------------------------------
-- UI.Squad_ConvertBtnWnd
-- -------------------------------------------------------------------

UI.Squad_ConvertBtnWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name			= "Squad_ConvertBtnWnd",
			selectSound		= UI.sounds.btnMouseOver,
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
    				defName 			= "squad_convert_btn",
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
		tooltipType = UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "squad_tooltip_convert_to_wing_caption" ),
		text		= UI:GetStringByName( "squad_tooltip_convert_to_wing_text" )..UI:GetStringByName( "squad_tooltip_convert_to_wing_help_text" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

-- -----------------------------------------------------------------------
-- UI.Squad_SquadFinderBtn
-- -----------------------------------------------------------------------

UI.Squad_SquadFinderBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Squad_SquadFinderBtn.layers =
{
	MAIN_EFFECT			= 0,
	DEBUG				= 1,
	TEXT				= 2,
	NEW_JOINS_EFFECT	= 3,
	NEW_JOINS_VAL		= 4,
}

UI.Squad_SquadFinderBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name	= "Squad_SquadFinderBtn"
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Squad_SquadFinderBtn.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "squad_squadFinderBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_5",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "count",
						layer		= "UI.Squad_SquadFinderBtn.layers.NEW_JOINS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NEW_JOINS_EFFECT
		{
			id			= UI.Squad_SquadFinderBtn.layers.NEW_JOINS_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "squad_squadFinderBtn_newJoins",
				defaultAnimation	= "idle",
		
				links =
				{
					{
						objName		= "text_7",
						layer		= "UI.Squad_SquadFinderBtn.layers.NEW_JOINS_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- NEW_JOINS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Squad_SquadFinderBtn:ResetNewJoins()

	self:SetLayerVisible( false, self.layers.NEW_JOINS_EFFECT )
	self:SetLayerVisible( false, self.layers.NEW_JOINS_VAL )

end


--
function UI.Squad_SquadFinderBtn:SetNewJoins( newJoins )

	self:SetLayerVisible( true, self.layers.NEW_JOINS_EFFECT )
	self:SetLayerVisible( true, self.layers.NEW_JOINS_VAL )

	local str = string.format( "+%d", newJoins )
	self:SetText( str, self.layers.NEW_JOINS_VAL )

end