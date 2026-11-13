-- ------------------------------------------------------------------
-- UI.ProfileWnd_new
-- ------------------------------------------------------------------

UI.ProfileWnd_new = {}

-- -----------------------------
-- window definition
-- -----------------------------

--
UI.ProfileWnd_new.layers =
{
	MAIN_EFFECT				= 0,
	BLACK_BG				= 1,
	BG_EFFECT				= 2,
	PLAYER_NAME				= 3,
	CLAN_NAME				= 4,
	RANK_LABEL				= 5,
	RANK_CUR				= 6,
	RANK_PROGRESS_VAL		= 7,
	RANK_PROGRESS_EFFECT	= 8,
    WAIT_EFFECT				= 9, 
    WAIT_TEXT				= 10, 
}


--
UI.ProfileWnd_new.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "ProfileWnd_new",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		rect	= Quat( 0, 0, 0, 0 ),	-- перегрузка установки из базового в FullScreenWnd; высота проверяется на 0 перед инициализацией раскладки (InitLayout())
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.ProfileWnd_new.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "profile_new",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg",
						layer		= "UI.ProfileWnd_new.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "nick_name",
						layer		= "UI.ProfileWnd_new.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "clan_name",
						layer		= "UI.ProfileWnd_new.layers.CLAN_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

--[[ #0084469 - закладки временно убраны
					{
						objName		= "bookmark",
						wnd			= "UI.Profile_TabsWnd_new",
						animParams	= UI.EffectAnimParams.POS,
					},
]]

					{
						objName		= "btn_x",
						wnd			= "UI.Profile_CrossBtn_new",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "atlas_win",
						wnd			= "UI.Profile_AtlasWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "clan_name1",
						layer		= "UI.ProfileWnd_new.layers.RANK_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "lvl",
						layer		= "UI.ProfileWnd_new.layers.RANK_CUR",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "lvl_val2",
						layer		= "UI.ProfileWnd_new.layers.RANK_PROGRESS_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "lvl_progr",
						layer		= "UI.ProfileWnd_new.layers.RANK_PROGRESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ProfileWnd_new.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "area",
						wnd			= "UI.Profile_RankMouseAreaWnd_new",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- BLACK_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "Black",
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_bg_new",
				defaultAnimation	= "idle",
			}}
		},

		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RANK_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "profile_rank_level" ),
		},

		-- RANK_CUR
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RANK_PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RANK_PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "profile_rank_progress_new",
				defaultAnimation	= "idle",
			}}
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
						layer		= "UI.ProfileWnd_new.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^hangar_loading"
		},
	},

	children =
	{
		"UI.Profile_TabsWnd_new",
		"UI.Profile_CrossBtn_new",
		"UI.Profile_AtlasWnd",
		"UI.Profile_RankMouseAreaWnd_new",
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.ProfileWnd_new:Setup( uid, mode, launchData )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if uid == UI.INVALID_U64_ID then
		sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: invalid uid" )
		return
	end

	if mode ~= nil then
    	if type( mode ) ~= "number" then
    		sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: invalid type of the 2-nd parameter (\"mode\"); \"number\" expected, got \"%s\"", type( mode ) )
    	end
	end

	if mode == nil then
		mode = self.modes.COMMON
	end

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: invalid mode %d", mode )
		return
	end

	if mode ~= self.modes.ATLAS then
		sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: mode %d(%s) is not supported", mode, UI:Val2Key( self.modes, mode ) )
		return
	end
	
	if launchData ~= nil then
		if type( launchData ) ~= "table" then
			sys.log( "UI.ProfileWnd_new:Setup()[ERROR]: invalid type of the 3-rd parameter (\"launchData\"); \"table\" expected, got \"%s\"", type( launchData ) )
			launchData = nil
		end
	end

	if uid == self.uid then
	
		self.launchData = launchData

		if mode ~= self.mode then
			self:SelectMode( mode )
		end

	else

		self:Reset()
	
		self.uid		= uid
		self.launchData	= launchData

		self:SelectMode( mode )
	
		if self:IsOnScreen() then
			self:RequestProfile()
			self:FullUpdate()
		end

	end

end


--
function UI.ProfileWnd_new:GetUid()

	return self.uid

end


--
function UI.ProfileWnd_new:GetMode()

	return self.mode

end


--
function UI.ProfileWnd_new:GetLaunchData()

	return self.launchData
	
end


-- дополнительные параметры, которые не отражены в Setup и не хранятся в профиле игрока (_G.GetProfileTable());
-- используется для восстановления состояния окна, например, после выхода из режима превью или покупки корабля
function UI.ProfileWnd_new:GetRestoreStateData()

	local restoreData = nil

	if self.workWnd and self.workWnd.GetRestoreStateData then
		restoreData = self.workWnd:GetRestoreStateData()
	end

	return restoreData

end


-- дополнительные параметры, которые не отражены в Setup и не хранятся в профиле игрока (_G.GetProfileTable());
-- используется для восстановления состояния окна, например, после выхода из режима превью или покупки корабля
function UI.ProfileWnd_new:RestoreState( restoreData )

	if restoreData and self.workWnd and self.workWnd.RestoreState then
		self.workWnd:RestoreState( restoreData )
	end

end


--
function UI.ProfileWnd_new:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if result == 0 and self:IsOnScreen() then
		if uid == self.uid then
			self:UpdatePlayerName()
		end
	end

end


--
function UI.ProfileWnd_new:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if result == 0 and self:IsOnScreen() then
    	if cid == UI:GetPlayerClanByUid( self.uid ) then
			self:UpdateClanName()
		end
	end

end


--
function UI.ProfileWnd_new:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if result == 0 then

    	if self:IsOnScreen() and uid == self.uid then

			if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then
				self:UpdateClanName()

			elseif field == _G.MasterServer.UserProfileField.UPF_GENERAL_STATS then
				self:UpdateGeneralStats()

			elseif field == _G.MasterServer.UserProfileField.UPF_ATLAS then
				self:UpdateAtlas()
			end

    	end

	else
		if requestId ~= 0 and ( requestId == self.generalStastRequestId or requestId == self.atlasRequestId ) then
			self:ShowMsgOnProfileError()
		end
	end

	if requestId ~= 0 then
		if requestId == self.generalStastRequestId then
			self.generalStastRequestId = 0
		elseif requestId == self.atlasRequestId then
			self.atlasRequestId = 0
		end
	end

end


--
function UI.ProfileWnd_new:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI.Profile_AtlasWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	
end


--
function UI.ProfileWnd_new:GetWorkWndAvailableHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workWndPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.workWndLocator ) or Vec2( 0, 0 )

	return self:GetHeight() - workWndPos.y

end


--
function UI.ProfileWnd_new:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ProfileWnd_new:IsWaiting()

	return
		self.generalStats == nil
		or self.atlas == nil
		or self.workWnd and self.workWnd.IsWaiting ~= nil and self.workWnd:IsWaiting()

end


--
function UI.ProfileWnd_new:GetAtlas()

	return self.atlas

end


--
function UI.ProfileWnd_new:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.generalStastRequestId	= 0
	self.atlasRequestId			= 0

end


-- -----------------------------
-- const
-- -----------------------------

UI.ProfileWnd_new.modes =
{
	COMMON		 		= 1,
	ACHIEVEMENTS 		= 2,
	MEDALS				= 3,
	TITLES				= 4,
	MOTTOS 				= 5,
	ATLAS				= 6,
}

UI.ProfileWnd_new.effectInfo =
{
	main =
	{
		workWndLocator	= "atlas_win",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.ProfileWnd_new.uid					= UI.INVALID_U64_ID
UI.ProfileWnd_new.mode					= -1
UI.ProfileWnd_new.launchData			= nil

UI.ProfileWnd_new.workWnd				= nil
UI.ProfileWnd_new.tabsWnd				= nil
UI.ProfileWnd_new.generalStastRequestId	= 0
UI.ProfileWnd_new.atlasRequestId		= 0
UI.ProfileWnd_new.generalStats			= nil
UI.ProfileWnd_new.atlas					= nil
UI.ProfileWnd_new.hMsgError				= UI.INVALID_UI_HANDLE

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.ProfileWnd_new:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.tabsWnd = UI.Profile_TabsWnd_new
	self.tabsWnd:UnlinkFromParent()	-- #0084469 - закладки временно убраны

	UI.Profile_AtlasWnd:UnlinkFromParent()
	self:UpdateWaitingEffect()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )

end


--
function UI.ProfileWnd_new:Reset()

	self.uid					= UI.INVALID_U64_ID
	self.launchData				= nil
	self.generalStastRequestId	= 0
	self.atlasRequestId			= 0
	self.generalStats			= nil
	self.atlas					= nil

	self:SelectMode( -1 )
	self:UpdateWaitingEffect()
	self:ResetContent()

	if self.hMsgError ~= UI.INVALID_UI_HANDLE then
	    UI:RemoveUiObj( self.hMsgError ) 
		self.hMsgError = UI.INVALID_UI_HANDLE
	end

end


--
function UI.ProfileWnd_new:ResetContent()

	self:SetText( "", self.layers.PLAYER_NAME )
	self:SetText( "", self.layers.CLAN_NAME )
	self:SetText( "", self.layers.RANK_CUR )
	self:SetText( "", self.layers.RANK_PROGRESS_VAL )

	local rankProgressEffect = UI:GetEffectFromLayer( self, self.layers.RANK_PROGRESS_EFFECT )
	if rankProgressEffect then
		rankProgressEffect:SetAnimationTimeAndUpdate( 0 )
	end
	
	UI.Profile_RankMouseAreaWnd_new:SetTooltipData( nil )

end


--
function UI.ProfileWnd_new:FullUpdate()

	self:ResetContent()

	if self.uid == UI.INVALID_U64_ID then
		return
	end

	self:UpdateGeneralStats()
	self:UpdateAtlas()
	self:UpdatePlayerName()
	self:UpdateClanName()
	self:UpdateTabs()
	self:UpdateWorkWnd()

end


--
function UI.ProfileWnd_new:UpdatePlayerName()

	local nickname = UI:GetPlayerNicknameByUid( self.uid )
	self:SetText( nickname, self.layers.PLAYER_NAME )

end


--
function UI.ProfileWnd_new:UpdateClanName()

	if self.uid == UI.INVALID_U64_ID then
		sys.log( "UI.ProfileWnd_new:UpdateClanName()[ERROR]: invalid uid" )
		return
	end

	local str = ""

	local cid = UI:GetPlayerClanByUid( self.uid )

	if cid ~= UI.INVALID_U64_ID then
		str = string.format( "%s %s", UI:GetStringByName( "profile_stat_clan_caption" ), UI:GetFullClanName( cid ) )
	else
		str = UI:GetStringByName( "profile_noClan" )
	end

	self:SetText( str, self.layers.CLAN_NAME )

end


--
function UI.ProfileWnd_new:UpdateRank()

	if self.uid == UI.INVALID_U64_ID then
		sys.log( "UI.ProfileWnd_new:UpdateRank()[ERROR]: invalid uid" )
		return
	end

	local rank	= 1
	local exp	= 0

	if self.generalStats then
		if type( self.generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_ACCOUNT_RANK ] ) == "userdata" then
			rank = self.generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_ACCOUNT_RANK ].l
		else
			sys.log( "UI.ProfileWnd_new:UpdateRank()[ERROR]: invalid type of generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_ACCOUNT_RANK ]; \"userdata\" expected, got \"%s\"", type( self.generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_ACCOUNT_RANK ] ) )
		end
	end

	if self.atlas then
		if type( self.atlas.accountExpPool ) == "userdata" then
			exp = tonumber( _G.I64ToStr( self.atlas.accountExpPool ) )
		else
			sys.log( "UI.ProfileWnd_new:UpdateRank()[ERROR]: invalid type of \"atlas.accountExpPool\"; \"userdata\" expected, got \"%s\"", type( self.atlas.accountExpPool ) )
		end
	end

	-- текущий ранг

	self:SetText( tostring( rank ), self.layers.RANK_CUR )

	-- прогроесс до следующего уровня
	
	local maxRank = UI:GetMaxAccountRank()
	if rank < maxRank then

		local nextRankCost = UI:GetPlayerAccountRankExpCost( rank + 1 )

		-- текст

		local expClamped = math.min( exp, nextRankCost )
		
		local strExpOvercap = ""
		
		if expClamped < exp then
		
			local expOvercap = exp - expClamped
			local strExpOvercapVal = UI:Num2StrSeparatedBy3( expOvercap )
		
			strExpOvercap = UI:GetStringByName( "profile_rank_overcap" )
			
			local numSubst = 0 
			strExpOvercap, numSubst = string.gsub( strExpOvercap, "%$val%$", strExpOvercapVal )
			
			if numSubst == 0 then
				sys.log( "UI.ProfileWnd_new:UpdateRank()[ERROR]: cannot find placeholder \"$val$\" in string \"profile_rank_overcap\"" )
				strExpOvercap = string.format( "[INVALID STRING] overcap %s", strExpOvercapVal )
			end
		
			strExpOvercap = string.format( " (%s)", strExpOvercap )
			
		end
		
    	local strProgress = string.format( "%s/%s%s", UI:Num2StrSeparatedBy3( expClamped ), UI:Num2StrSeparatedBy3( nextRankCost ), strExpOvercap )
    	self:SetText( strProgress, self.layers.RANK_PROGRESS_VAL )

		-- прогрессбар

    	local progressAnimTime = nextRankCost ~= 0 and exp / nextRankCost or 0

    	local rankProgressEffect = UI:GetEffectFromLayer( self, self.layers.RANK_PROGRESS_EFFECT )
    	if rankProgressEffect then
    		rankProgressEffect:SetAnimationTimeAndUpdate( progressAnimTime  )
    	end

	else

		-- текст

    	local strProgress = string.format( "%s", UI:Num2StrSeparatedBy3( exp ) )
    	self:SetText( strProgress, self.layers.RANK_PROGRESS_VAL )

		-- прогрессбар

    	local progressAnimTime = 1

    	local rankProgressEffect = UI:GetEffectFromLayer( self, self.layers.RANK_PROGRESS_EFFECT )
    	if rankProgressEffect then
    		rankProgressEffect:SetAnimationTimeAndUpdate( progressAnimTime  )
    	end

	end
	
	-- тултип
	
	local rankTooltipData = UI:GetAccountRankTooltipData( rank, exp )
	UI.Profile_RankMouseAreaWnd_new:SetTooltipData( rankTooltipData )

end


--
function UI.ProfileWnd_new:F_OnAfterShowOnScreen()

	-- вызвается ДО того, как будет вызван OnAfterShowOnScreen дочерних элементов,
	-- т.к. их размер может зависеть от размера главного окна
	self:InitLayout()

	self:OnAfterShowOnScreen()
	
	if self.uid == UI.INVALID_U64_ID then
		self:Setup( UI:GetLocalPlayerUid(), self.modes.ATLAS, nil )
	else
		self:RequestProfile()
		self:FullUpdate()
	end

	self:UpdateBlackBg()

end


--
function UI.ProfileWnd_new:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
		self:Reset()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.ProfileWnd_new:UpdateWorkWnd()

	-- пока сделано только одно окно - атлас
    local mode2WorkWnd =
    {
    	[ self.modes.COMMON ]		= nil,
    	[ self.modes.ACHIEVEMENTS ] = nil,
    	[ self.modes.MEDALS ]		= nil,
    	[ self.modes.TITLES ]		= nil,
    	[ self.modes.MOTTOS ] 		= nil,
    	[ self.modes.ATLAS ]		= UI.Profile_AtlasWnd,
    }

	local mode = self:GetMode()
	local workWnd = mode2WorkWnd[ mode ]

	if workWnd ~= self.workWnd then

		if self.workWnd then
			self.workWnd:UnlinkFromParent()
		end

		if workWnd then

			if workWnd == UI.Profile_AtlasWnd then
				UI.Profile_AtlasWnd:Setup( self.uid )
			end

			self:AddChild( workWnd )

		end

		self.workWnd = workWnd

	end

end


--
function UI.ProfileWnd_new:UpdateTabs()

	self.tabsWnd:SelectMode( self.mode )
	
end


--
function UI.ProfileWnd_new:SelectMode( mode )

	if mode == self.mode then
		return
	end

	if mode ~= -1 and mode ~= self.modes.ATLAS then

		if self:IsOnScreen() then
			UI:ShowProfile( self.uid, UI:Val2Key( self.modes, mode, false ) )
		else
			sys.log( "UI.ProfileWnd_new:SelectMode()[ERROR]: not on screen" )
		end

	else

		self.mode = mode

		self:UpdateTabs()
		self:UpdateWorkWnd()

	end

end


--
function UI.ProfileWnd_new:InitLayout()

	if self:GetHeight() ~= 0 then
		return
	end

	local selfHeight = UI.HangarWnd:GetBottomPanelY() - self:GetTop()
	self:SetHeight( selfHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local selfWidth = mainEffect and mainEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )

end


--
function UI.ProfileWnd_new:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Profile_CrossBtn_new then

		self:Close()

	elseif UI:IsWndKindOf( wnd, "Profile_TabBtn_new" ) then

		if not wnd:IsChecked() then
			self:SelectMode( wnd:GetMode() )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	end

	return true

end


--
function UI.ProfileWnd_new:F_OnEventSaveUiState()

	if self.uid == UI.INVALID_U64_ID then
		return
	end

	UI.store.ProfileWnd_new =
	{
		uid						= self.uid,
		mode					= self.mode,
		generalStastRequestId	= self.generalStastRequestId,
		atlasRequestId			= self.atlasRequestId,
	}

end


--
function UI.ProfileWnd_new:F_OnEventRestoreUiState()

	if UI.store.ProfileWnd_new then

    	self.uid					= UI.store.ProfileWnd_new.uid
		self.generalStastRequestId	= UI.store.ProfileWnd_new.generalStastRequestId
		self.atlasRequestId			= UI.store.ProfileWnd_new.atlasRequestId

    	self:SelectMode( UI.store.ProfileWnd_new.mode )

		UI.store.ProfileWnd_new = nil

	end

end


--
function UI.ProfileWnd_new:OnEscape()

	self:Close()
	return true

end


--
function UI.ProfileWnd_new:Close()

	if not self:IsOnScreen() then
		return
	end

	if self.launchData then
	
		local launchData = self.launchData	-- сохраняется в локальной переменной, т.к. после закрытия окна обнуляется
	
		if launchData.bEquipment then
		
			if self:IsChildOf( UI.HangarWnd ) then
			
				if launchData.bPreview then
					UI.HangarWnd:ShowEquipmentPreview( launchData.vid, nil, launchData.previewLaunchData )
				else
					UI.HangarWnd:ShowShipEquipment( launchData.vid )
				end
				
				UI.EquipmentWnd:SelectShipSlotByInfo( launchData.selInfo )
				
			else
				sys.log( "UI.ProfileWnd_new:Close()[ERROR]: cannot show equipment - not in hangar" )
			end
			
		elseif launchData.bOldProfile then
			UI:ShowProfile( self.uid, launchData.modeName, true )
				
		elseif launchData.bShop then
		
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.SHOP, true, false )
			UI.ShopWnd:RestoreState( launchData.restoreData )
			
		elseif launchData.bShipsTree then

			UI.HangarWnd:OpenShips( launchData.shipDefNameCenterOn, true, launchData.bEvolvingEdit, launchData.evolvingEditParams, launchData.shipsTreeLaunchData )
		
		else
			sys.log( "UI.ProfileWnd_new:Close()[ERROR]: unhandled launchData" )
		end
		
	end
	
	if self:GetParent() then
	
		if self:IsChildOf( UI.HangarWnd ) then
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
		else
			self:Hide()
			UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
		end

	end
	
end


--
function UI.ProfileWnd_new:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	-- скролл "съедается", чтобы нельзя было во время этого окна скроллировать сцену
	return true

end


--
function UI.ProfileWnd_new:ShowMsgOnProfileError()

	if self.hMsgError ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgError = UI:ShowErrorMsg( "msg_profileError" )

end


--
function UI.ProfileWnd_new:RequestProfile()

	self:RequestGeneralStats()
	self:RequestAtlas()

end


--
function UI.ProfileWnd_new:RequestGeneralStats()

	if not self:IsOnScreen() then
		return
	end

	if self.uid == UI.INVALID_U64_ID then
		return
	end

	if self.generalStastRequestId ~= 0 then
		return
	end

	self.generalStastRequestId = _G.MasterServer_UserProfileRequestField( self.uid, _G.MasterServer.UserProfileField.UPF_GENERAL_STATS )
	if self.generalStastRequestId == 0 then
		self:ShowMsgOnProfileError()
	end

end


--
function UI.ProfileWnd_new:RequestAtlas()

	if not self:IsOnScreen() then
		return
	end

	if self.uid == UI.INVALID_U64_ID then
		return
	end

	if self.atlasRequestId ~= 0 then
		return
	end

	self.atlasRequestId = _G.MasterServer_UserProfileRequestField( self.uid, _G.MasterServer.UserProfileField.UPF_ATLAS )
	if self.atlasRequestId == 0 then
		self:ShowMsgOnProfileError()
	end

end


--
function UI.ProfileWnd_new:UpdateGeneralStats()

	self.generalStats = nil

	local profile = _G.MasterServer_UserProfileGet( self.uid )
	if profile then

		if profile.generalStats ~= nil then
    		if type( profile.generalStats ) == "table" then
    			self.generalStats = profile.generalStats
    		else
    			sys.log( "UI.ProfileWnd_new:UpdateGeneralStats()[ERROR]: invalid type of \"generalStats\"; \"table\" or \"nil\" expected, got \"%s\"", type( profile.generalStats ) )
    		end
		end

	end

	self:OnGeneralStatsChanged()

end


--
function UI.ProfileWnd_new:UpdateAtlas()

	self.atlas = nil

	local profile = _G.MasterServer_UserProfileGet( self.uid )
	if profile then

		if profile.atlas ~= nil then
    		if type( profile.atlas ) == "table" then
    			self.atlas = profile.atlas
    		else
    			sys.log( "UI.Profile_AtlasWnd:UpdateAtlas()[ERROR]: invalid type of \"atlas\"; \"table\" or \"nil\" expected, got \"%s\"", type( profile.atlas ) )
    		end
		end

	end

	self:OnAtlasChanged()

end


--
function UI.ProfileWnd_new:OnGeneralStatsChanged()

	self:UpdateRank()
	self:UpdateWaitingEffect()

end


--
function UI.ProfileWnd_new:OnAtlasChanged()

	self:UpdateRank()
	self:UpdateWaitingEffect()

	UI.Profile_AtlasWnd:OnAtlasChanged()

end


--
function UI.ProfileWnd_new:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgError then
		self.hMsgError = UI.INVALID_UI_HANDLE
	end

end


--
function UI.ProfileWnd_new:UpdateBlackBg()

	local bNeedBlackBg = UI.DebriefingWnd:IsOnScreen()
	self:SetLayerVisible( bNeedBlackBg, self.layers.BLACK_BG )

end


--
function UI.ProfileWnd_new:F_OnEventWndShown( hSender, hWnd )	

	if not self:IsOnScreen() then
		return
	end

	if UI.DebriefingWnd and UI.DebriefingWnd.w and UI.DebriefingWnd:GetUiHandle() == hWnd then
		self:UpdateBlackBg()
	end

end


--
function UI.ProfileWnd_new:F_OnEventWndHided( hSender, hWnd )

	if not self:IsOnScreen() then
		return
	end

	if UI.DebriefingWnd and UI.DebriefingWnd.w and UI.DebriefingWnd:GetUiHandle() == hWnd then
		self:UpdateBlackBg()
	end

end


-- ------------------------------------------------------------------
-- UI.Profile_TabsWnd_new
-- ------------------------------------------------------------------

UI.Profile_TabsWnd_new = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.Profile_TabsWnd_new.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Profile_TabsWnd_new",
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
				defName 			= "profile_tabs_new",
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

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.Profile_TabsWnd_new:GetSelMode()

	return self.selMode

end


--
function UI.Profile_TabsWnd_new:SelectMode( mode )

	if mode == self.selMode then
		return
	end

	self.selMode = mode
	self:UpdatewBtnsStates()

end


-- -----------------------------
-- const
-- -----------------------------

UI.Profile_TabsWnd_new.layers =
{
	MAIN_EFFECT	= 0
}

UI.Profile_TabsWnd_new.effectInfo =
{
	main =
	{
		btnLocatorPrefix	= "bookmark_btn_",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.Profile_TabsWnd_new.btns		= {}
UI.Profile_TabsWnd_new.selMode	= -1

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.Profile_TabsWnd_new:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:Init()

end


--
function UI.Profile_TabsWnd_new:Init()

	if next( self.btns ) then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local modesOrder = {}
	for modeName, mode in pairs( UI.ProfileWnd_new.modes ) do
		table.insert( modesOrder, mode )
	end
	table.sort( modesOrder )

	for idx, mode in ipairs( modesOrder ) do

		local btn = UI:CreateChildWnd( self, UI.Profile_TabBtn_new, tostring( UI:GetTableLength( self.btns ) + 1 ) )
		if btn then

			btn:Init( mode )
			UI:AddChildAndLink( self, btn, mainEffect, string.format( "%s%d", self.effectInfo.main.btnLocatorPrefix, idx ), UI.EffectAnimParams.POS )
			self.btns[ mode ] = btn

		else
    		sys.log( "UI.Profile_TabsWnd_new:Init()[ERROR]: cannot create btn" )
		end

	end

end


--
function UI.Profile_TabsWnd_new:UpdatewBtnsStates()

	for mode, btn in pairs( self.btns ) do
		btn:Check( btn:GetMode() == self.selMode )
	end

end


-- ------------------------------------------------------------------
-- UI.Profile_TabBtn_new
-- ------------------------------------------------------------------

UI.Profile_TabBtn_new = {}

-- -----------------------------
-- window definition
-- -----------------------------

--
UI.Profile_TabBtn_new.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}


--
UI.Profile_TabBtn_new.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Profile_TabBtn_new",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Profile_TabBtn_new.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "profile_tabBtn_new",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Profile_TabBtn_new.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= UI.Profile_TabBtn_new.layers.TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------
-- interface function 
-- -----------------------------

--
function UI.Profile_TabBtn_new:Init( mode )

	self.mode = mode

	self:UpdateText()

end


--
function UI.Profile_TabBtn_new:GetMode()

	return self.mode

end


-- -----------------------------
-- const
-- -----------------------------

UI.Profile_TabBtn_new.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,

}

UI.Profile_TabBtn_new.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "idle",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "select",
		animationPressed	= "select",
		animationDisabled	= "select",
	},
}

-- -----------------------------
-- vars
-- -----------------------------

UI.Profile_TabBtn_new.mode	= -1

-- -----------------------------
-- work function 
-- -----------------------------

--
function UI.Profile_TabBtn_new:UpdateText()

	-- строки те же, что были в старом окне профиля

    local mode2StrId =
    {
    	[ UI.ProfileWnd_new.modes.COMMON ]		= "profile_statistics",
    	[ UI.ProfileWnd_new.modes.ACHIEVEMENTS ]= "profile_achievements",
    	[ UI.ProfileWnd_new.modes.MEDALS ]		= "profile_medals",
    	[ UI.ProfileWnd_new.modes.TITLES ]		= "profile_titles",
    	[ UI.ProfileWnd_new.modes.MOTTOS ]		= "profile_mottos",
    	[ UI.ProfileWnd_new.modes.ATLAS ]		= "profile_atlas",
    }

	local strId = mode2StrId[ self.mode ]
	if not strId then
		sys.log( "UI.Profile_TabBtn_new:UpdateText()[ERROR]: cannot find string for mode %d(\"%s\")", self.mode, UI:Val2Key( UI.ProfileWnd_new.modes, self.mode ) )		
	end

	local text = strId and UI:GetStringByName( strId ) or "error"
	self:SetText( text, self.layers.TEXT )

end

-- ------------------------------------------------------------------
-- UI.Profile_CrossBtn_new
-- ------------------------------------------------------------------

UI.Profile_CrossBtn_new =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn3",

		props =
		{
			name	= "Profile_CrossBtn_new"
		}
	}
}

-- область, объединяющая все элементы опыта, чтобы на ней показывать тултип
-- ------------------------------------------------------------------
-- UI.Profile_RankMouseAreaWnd_new
-- ------------------------------------------------------------------

UI.Profile_RankMouseAreaWnd_new = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.Profile_RankMouseAreaWnd_new.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Profile_RankMouseAreaWnd_new",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.Profile_RankMouseAreaWnd_new:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData
	
end


--
function UI.Profile_RankMouseAreaWnd_new:GetTooltipData()

	return self.tooltipData
	
end


-- -----------------------------
-- vars
-- -----------------------------

UI.Profile_RankMouseAreaWnd_new.tooltipData = nil