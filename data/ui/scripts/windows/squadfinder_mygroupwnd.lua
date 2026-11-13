-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroupWnd
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroupWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.SquadFinder_MyGroupWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
	GROUP_INFO	= 2,
	GROUP_DESC	= 3,
    WAIT_EFFECT	= 4,
    WAIT_TEXT	= 5,
}


--
UI.SquadFinder_MyGroupWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "SquadFinder_MyGroupWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = UI.SquadFinder_MyGroupWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "squadFinder_myGroup",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",	
						layer		= "UI.SquadFinder_MyGroupWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title",	
						layer		= "UI.SquadFinder_MyGroupWnd.layers.GROUP_INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title1",	
						layer		= "UI.SquadFinder_MyGroupWnd.layers.GROUP_DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load",	
						layer		= "UI.SquadFinder_MyGroupWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.SquadFinder_MyGroup_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_reload",	
						wnd			= "UI.SquadFinder_MyGroup_ReloadBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_edit",	
						wnd			= "UI.SquadFinder_MyGroup_EditGroupBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "list",	
						wnd			= "UI.SquadFinder_MyGroup_JoinsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_8",	
						wnd			= "UI.SquadFinder_MyGroup_DeleteGroupBtn",
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
			text			= UI:GetStringByName( "squadFinder_myGroup_caption" ),
		},
		
		-- GROUP_INFO
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- GROUP_DESC
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
						layer		= "UI.SquadFinder_MyGroupWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hangar_loading" ),
		},
	},

	children =
	{
		"UI.SquadFinder_MyGroup_CrossBtn",
		"UI.SquadFinder_MyGroup_ReloadBtn",
		"UI.SquadFinder_MyGroup_EditGroupBtn",
		"UI.SquadFinder_MyGroup_JoinsListWnd",
		"UI.SquadFinder_MyGroup_DeleteGroupBtn",
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnWaitingChanged()

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateWaiting()

end



--
function UI.SquadFinder_MyGroupWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then	
		return
	end

	if result ~= 0 then
		return
	end

	if not UI.SquadFinder:GetMyGroupInfo() then
		return
	end

	if uid == UI:GetLocalPlayerUid() then
		self:UpdateGroupInfo()
	end

	for recordIdx = 1, self.joinsList:GetNumRecords() do

		local data = self.joinsList:GetRecordData( recordIdx )
		if data.joinInfo.uid == uid then

			local slotWnd = self.joinsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnNickNameUpdate()
			end

			break

		end

	end

end


--
function UI.SquadFinder_MyGroupWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if not self:IsOnScreen() then	
		return
	end

	if result ~= 0 then
		return
	end

	if not UI.SquadFinder:GetMyGroupInfo() then
		return
	end

	if UI.Clan:IsInClan() and UI.Clan:GetCid() == cid then
		self:UpdateGroupInfo()
	end

	for recordIdx = 1, self.joinsList:GetNumRecords() do

		local data = self.joinsList:GetRecordData( recordIdx )
		if UI:GetPlayerClanByUid( data.joinInfo.uid ) == cid then

			local slotWnd = self.joinsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnClanNameUpdate()
			end

		end

	end

end


--
function UI.SquadFinder_MyGroupWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if not UI.SquadFinder:GetMyGroupInfo() then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

    	if uid == UI:GetLocalPlayerUid() then
    		self:UpdateGroupInfo()
    	end

    	for recordIdx = 1, self.joinsList:GetNumRecords() do

    		local data = self.joinsList:GetRecordData( recordIdx )
    		if data.joinInfo.uid == uid then

    			local slotWnd = self.joinsList:GetButtonForRecord( recordIdx )
    			if slotWnd then
    				slotWnd:OnClanUpdate()
    			end

    			break

    		end

    	end

	end

end


--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupDelete()

	if not self:IsOnScreen() then
		return
	end

	UI.HangarWnd:HideSquadFinderMyGroupWnd( false )
	UI.HangarWnd:ShowSquadFinderGroupsWnd( true )

end


--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnRejectJoin( uid )

	if not self:IsOnScreen() then
		return
	end

	local scrollPos = self.joinsList:GetScrollPos()

	local datas = {}

	for recordIdx = 1, self.joinsList:GetNumRecords() do

		local data = self.joinsList:GetRecordData( recordIdx )

		if data.joinInfo.uid ~= uid then
			table.insert( datas, data )
		end
		
	end

	self.joinsList:Clear()

	for idx, data in ipairs( datas ) do
		self.joinsList:AddRecord( data )
	end

	if next( datas ) then
		if scrollPos ~= -1 then
			self.joinsList:SetScrollPos( scrollPos )
		end	
	end

end


--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupChanged()

	if not self:IsOnScreen() then
		return
	end

	local groupInfo = UI.SquadFinder:GetMyGroupInfo()
	if not groupInfo then
		return
	end

	self:UpdateGroupInfo()
	self:UpdateGroupDesc()

	local oldJoinsDatas = {}

	for recordIdx = 1, self.joinsList:GetNumRecords() do
		table.insert( oldJoinsDatas, self.joinsList:GetRecordData( recordIdx ) )
	end

	for oldJoinIdx, oldData in ipairs( oldJoinsDatas ) do

		local oldJoinState = oldData.joinState

		local newJoinInfo = nil

		for newJoinIdx, _newJoinInfo in pairs( groupInfo.joinReqs ) do
			if _newJoinInfo.uid == oldData.joinInfo.uid then
				newJoinInfo = _newJoinInfo
				break
			end
		end

		-- старой заявки больше нет
		if not newJoinInfo then

			-- игрок ранее был приглашен, значит он либо принял приглашение и, соответстченно, попал в сквад (состояние INVITE_ACCEPTED),
			-- либо отказался ( состояние INVITE_DECLINED ) (в обоих случаях происходит удаление заявки);
			-- на эти события состояние меняется не здесь, а в соответствующих сквадовых нотификациях (в MasterServer_OnSquadNotification()), т.к. здесь эти состояния различить нельзя

			if oldData.joinInfo.invited then
				-- нет реакции

			-- игрок не был приглашен, значит он сам отозвал заявку
			else
				oldData.joinState = self.joinStates.JOIN_CANCELLED
			end

		-- старая заявка всё еще есть
		else

			-- поменялся флаг приглашения;
			-- здесь должно выставиться состояние INVITED

			if newJoinInfo.invited ~= oldData.joinInfo.invited then
				oldData.joinInfo.invited = newJoinInfo.invited
				oldData.joinState = self:DetectJoinState( newJoinInfo )
			end

		end

		-- апдейт слота, если состояние поменялось

		if oldJoinState ~= oldData.joinState then
			local slotWnd = self.joinsList:GetButtonForRecord( oldJoinIdx ) 
			if slotWnd then
				slotWnd:OnJoinStateChanged()
			end
		end

	end


	-- если появились новые заявки, то они добавляются (в конец списка)

	for newJoinIdx, newJoinInfo in ipairs( groupInfo.joinReqs ) do

		local bFoundInOld = false
		for oldJoinIdx, oldData in pairs( oldJoinsDatas ) do
			if oldData.joinInfo.uid == newJoinInfo.uid then
				bFoundInOld = true
				break
			end
		end

		if not bFoundInOld then

    		local data =
    		{
    			joinState	= self:DetectJoinState( newJoinInfo ),
    			joinInfo	= newJoinInfo,
    		}

    		self.joinsList:AddRecord( data )

		end

	end

end


--
function UI.SquadFinder_MyGroupWnd:MasterServer_OnSquadNotification( type, squad, uid, params )

	if not self:IsOnScreen() then
		return
	end

	for recordIdx = 1, self.joinsList:GetNumRecords() do

		local data = self.joinsList:GetRecordData( recordIdx )
		if data.joinInfo.uid == uid then

			if data.joinInfo.invited then

				local oldJoinState = data.joinState

            	if type == _G.MasterServer.SquadNotification.SQN_JOINED then
					data.joinState = self.joinStates.INVITE_ACCEPTED

            	elseif type == _G.MasterServer.SquadNotification.SQN_INVITE_CANCELED then
					data.joinState = self.joinStates.INVITE_DECLINED
            	end

        		if oldJoinState ~= data.joinState then
        			local slotWnd = self.joinsList:GetButtonForRecord( recordIdx ) 
        			if slotWnd then
        				slotWnd:OnJoinStateChanged()
        			end
        		end

			end

			break

		end

	end

end



--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupCreate()

	if not self:IsOnScreen() then
		return
	end

	sys.log( "UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupCreate()[ERROR]: not expected" )

	self:FullUpdate()

end


--
function UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupEdit()

	if not self:IsOnScreen() then
		return
	end

	sys.log( "UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupEdit()[ERROR]: not expected" )

	self:UpdateGroupDesc()

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroupWnd.joinStates =
{
	NOT_INVITED		= 1,	-- заявка еще не была ни одобрена, ни отклонена
	INVITED			= 2,	-- заявка одобрена, заявителю послано приглашение в сквад, но он пока на него не отреагировал
	INVITE_ACCEPTED	= 3,	-- заявка одобрена, заявителю послано приглашение в сквад, заявитель принял его и вступил в сквад (временное состояние, до полного обновления списка, после обновления заявка пропадает)
	INVITE_DECLINED	= 4,	-- заявка одобрена, заявителю послано приглашение в сквад, но он отклонил его (временное состояние, до полного обновления списка, после обновления заявка пропадает)
	JOIN_CANCELLED	= 5,	-- заявка была отована заявителем (временное состояние, до полного обновления списка, после обновления заявка пропадает)
}

UI.SquadFinder_MyGroupWnd.sounds =
{
    reload			= UI.sounds.btnClick,
	createGroupShow	= "sound/ui/btnClick",
	approveJoin		= UI.sounds.btnClick,
	rejectJoin		= UI.sounds.btnClick,
}

UI.SquadFinder_MyGroupWnd.effectInfo =
{
	main =
	{
		playerNameColorLocator	= "nickname_color1\\",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.SquadFinder_MyGroupWnd.crossBtn				= nil
UI.SquadFinder_MyGroupWnd.reloadBtn				= nil
UI.SquadFinder_MyGroupWnd.editGroupBtn			= nil
UI.SquadFinder_MyGroupWnd.joinsList				= nil
UI.SquadFinder_MyGroupWnd.deleteGroupBtn		= nil
UI.SquadFinder_MyGroupWnd.playerNameColor		= UI.TEXT_BASE_COLOR
UI.SquadFinder_MyGroupWnd.groupInfoMetaText		= nil
UI.SquadFinder_MyGroupWnd.groupDescMetaText		= nil
UI.SquadFinder_MyGroupWnd.groupDescLinkWnd		= nil
UI.SquadFinder_MyGroupWnd.hMsgDeleteGroup		= UI.INVALID_UI_HANDLE

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_MyGroupWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.crossBtn		= UI.SquadFinder_MyGroup_CrossBtn
    self.reloadBtn		= UI.SquadFinder_MyGroup_ReloadBtn
    self.editGroupBtn	= UI.SquadFinder_MyGroup_EditGroupBtn
    self.joinsList		= UI.SquadFinder_MyGroup_JoinsListWnd
    self.deleteGroupBtn	= UI.SquadFinder_MyGroup_DeleteGroupBtn

	self.groupInfoMetaText = UI.MetaText.GetNewInstance()
	self.groupInfoMetaText:InitFromLayer( self, self.layers.GROUP_INFO ) 

	self.groupDescMetaText = UI.MetaText.GetNewInstance()
	self.groupDescMetaText:InitFromLayer( self, self.layers.GROUP_DESC ) 

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.playerNameColor = mainEffect:GetObjColor( self.effectInfo.main.playerNameColorLocator )
	end

	self:CreateControls()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.SquadFinder_MyGroupWnd:F_Shutdown()

	if self.groupInfoMetaText then
		self.groupInfoMetaText:Clear()
	end

	if self.groupDescMetaText then
		self.groupDescMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.SquadFinder_MyGroupWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.SquadFinder_MyGroupWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.SquadFinder_MyGroupWnd:UpdateMetaTextPos()

	self.groupInfoMetaText:UpdateScreenOrgFromLayer( self, self.layers.GROUP_INFO )
	self.groupDescMetaText:UpdateScreenOrgFromLayer( self, self.layers.GROUP_DESC )

end


--
function UI.SquadFinder_MyGroupWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.GROUP_INFO then
		self.groupInfoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.GROUP_DESC then
		self.groupDescMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.SquadFinder_MyGroupWnd:CreateControls()

	self.groupDescLinkWnd = UI:CreateChildWnd( self, UI.LinkWnd, "" )

end


--
function UI.SquadFinder_MyGroupWnd:Reset()

	self.groupInfoMetaText:SetText( "", true )
	self:ResetGroupDesc()
	self.joinsList:Clear()

end


--
function UI.SquadFinder_MyGroupWnd:FullUpdate()

	self:Reset()

	self:UpdateWaiting()

	if UI.SquadFinder:GetMyGroupInfo() then

		self:UpdateGroupInfo()
		self:UpdateGroupDesc()
		self:UpdateJoinsList()

	end

end


--
function UI.SquadFinder_MyGroupWnd:UpdateGroupInfo()

	self.groupInfoMetaText:SetText( "", true )

	local groupInfo = UI.SquadFinder:GetMyGroupInfo()
	if not groupInfo then
		return
	end

	-- активность
	local strActivity = UI:SquadFinderActivityType2Str( groupInfo.activityType )

	-- ранг
	local strRank = groupInfo.minRank ~= UI.SquadFinder.RANK_All and tostring( groupInfo.minRank ) or ""

	-- имя игрока
	local strPlayerName = string.format( "$link [type PLAYER][params {uid=u64(%d,%d), bWithClan=true, bWithTooltip=false, colorSel=%u, colorUnsel=%u}]$", groupInfo.owner.h, groupInfo.owner.l, self.playerNameColor, self.playerNameColor )

	-- количество членов сквада

	local strNumPlayers = UI:GetStringByName( "squadFinder_numPlayers" )
	local strNumPlayerVal = tostring( groupInfo.numPlayers )

	local numSubst = 0
	strNumPlayers, numSubst = string.gsub( strNumPlayers, "%$num%$", strNumPlayerVal )

	if numSubst == 0 then
		sys.log( "UI.SquadFinder_MyGroupWnd:UpdateGroupInfo()[ERROR]: cannot find placeholder \"$num$\" in string \"squadFinder_numPlayers\"" )
		strNumPlayers = string.format( "[INVALID STRING] %s members", strNumPlayerVal )
	end
	
	-- всё вместе

	local alpha = UI:GetAlpha( self:GetColor( self.layers.GROUP_INFO ) )
	local playerNameColor = UI:SetAlpha( self.playerNameColor, alpha )
	local strGroupInfo = string.format( "%s %s%s%s(%s%s, %s)", strActivity, strRank, strRank ~= "" and " " or "", UI:Color2Str( self.playerNameColor ), strPlayerName, UI:Color2Str( self.playerNameColor ), strNumPlayers )

	self.groupInfoMetaText:SetText( strGroupInfo, true )	

end


--
function UI.SquadFinder_MyGroupWnd:UpdateGroupDesc()

	self:ResetGroupDesc()

	local groupInfo = UI.SquadFinder:GetMyGroupInfo()
	if not groupInfo then
		return
	end

	local strGroupDesc = UI:ShieldSpecSymbolsForMetatext( groupInfo.message )
	strGroupDesc = string.gsub( strGroupDesc, "\n", " " )

    strGroupDesc, bWasCut = UI:GetCutTextWithEllipses( strGroupDesc, self:GetLayerWidth( self.layers.GROUP_DESC ) - 5, self:GetFont( self.layers.GROUP_DESC ) )	-- -5 для ширины, т.к. реально ссылка с этим текстом займет немного больше места, т.к. место для нее в метатексте выделяется с помощью вставки невидимых символов

	if bWasCut then

		local color = self:GetColor( self.layers.GROUP_DESC )

		local strTooltip = UI:ShieldSpecSymbolsForMetatext( groupInfo.message )
		strTooltip = string.gsub( strTooltip, "\n", "|" )

		local linkParams =
		{
			text			= strGroupDesc,
			tooltipText		= strTooltip,
			tooltipCaption	= UI:GetStringByName( "squadFinder_groupDescTooltipCaption" ),
			colorSel		= color,
			colorUnsel		= color,
		}

		local backColor = 0

    	local layerObj = self:GetLayer( UI.LAYER_TEXT, self.layers.GROUP_DESC, 0 )
    	if layerObj then
			backColor = layerObj:GetBackColor()
    	end

		self.groupDescLinkWnd:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, self:GetFont( self.layers.GROUP_DESC ), self:GetBlendMode( self.layers.GROUP_DESC ), backColor )
		self:AddChild( self.groupDescLinkWnd )

		local strGroupDescLink = string.format( "$wndk [hWnd %u][alignment BASELINE]$", self.groupDescLinkWnd:GetUiHandle() )
		self.groupDescMetaText:SetText( strGroupDescLink, true )

	else
		self.groupDescMetaText:SetText( strGroupDesc, true )
	end


end


--
function UI.SquadFinder_MyGroupWnd:ResetGroupDesc()

	self.groupDescMetaText:SetText( "", true )
	self.groupDescLinkWnd:Reset()
	self.groupDescLinkWnd:UnlinkFromParent()

end


--
function UI.SquadFinder_MyGroupWnd:UpdateJoinsList()

	self.joinsList:Clear()

	local groupInfo = UI.SquadFinder:GetMyGroupInfo()
	if not groupInfo then
		return
	end

	for joinIdx, joinInfo in ipairs( groupInfo.joinReqs ) do

		local data =
		{
			joinState	= self:DetectJoinState( joinInfo ),
			joinInfo	= joinInfo,
		}

		self.joinsList:AddRecord( data )

	end

end


-- здесь выставляются только базовые состояния - INVITED/NOT_INVITED;
-- остальные состояния - временные, и держатся только до следующего полного апдейта списка
function UI.SquadFinder_MyGroupWnd:DetectJoinState( joinInfo )

	return joinInfo.invited and self.joinStates.INVITED or self.joinStates.NOT_INVITED

end


--
function UI.SquadFinder_MyGroupWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "SquadFinder_MyGroup_ApproveJoinBtn" ) then

		if not self:IsWaiting() then

			local slotWnd = UI:GetAncestorKindOf( wnd, "SquadFinder_MyGroup_JoinSlotWnd" )
			UI.SquadFinder:ApproveJoin( slotWnd:GetRecordData().joinInfo.uid )
			UI:PlayGlobalSound( self.sounds.approveJoin )

		end

	elseif UI:IsWndKindOf( wnd, "SquadFinder_MyGroup_RejectJoinBtn" ) then

		if not self:IsWaiting() then

			local slotWnd = UI:GetAncestorKindOf( wnd, "SquadFinder_MyGroup_JoinSlotWnd" )
			UI.SquadFinder:RejectJoin( slotWnd:GetRecordData().joinInfo.uid )
			UI:PlayGlobalSound( self.sounds.rejectJoin )

		end

    elseif wnd == self.editGroupBtn then

		if not self:IsWaiting() then

        	if UI.SquadFinder:GetMyGroupInfo() then		
				UI.HangarWnd:HideSquadFinderMyGroupWnd( false )
				UI.HangarWnd:ShowSquadFinderCreateMyGroupWnd( true, true )
			end

		end

    elseif wnd == self.deleteGroupBtn then

		if not self:IsWaiting() then

        	if UI.SquadFinder:GetMyGroupInfo() then
				self:TryDeleteGroup()
			end

		end

    elseif wnd == self.reloadBtn then

		if not self:IsWaiting() then

    		self:UpdateJoinsList()
			UI:PlayGlobalSound( self.sounds.reload )

		end

    elseif wnd == self.crossBtn then

		UI.HangarWnd:HideSquadFinderMyGroupWnd( true )

	end

	return true

end


--
function UI.SquadFinder_MyGroupWnd:TryDeleteGroup()

	self.hMsgDeleteGroup = UI:MessageBox( UI:GetStringByName( "squadFinder_msg_deleteGroup_caption" ), UI:GetStringByName( "squadFinder_msg_deleteGroup_text" ), UI.MBS_YES_NO )

end


--
function UI.SquadFinder_MyGroupWnd:DoDeleteGroup()

	UI.SquadFinder:DeleteMyGroup()

end


--
function UI.SquadFinder_MyGroupWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgDeleteGroup then

		self.hMsgDeleteGroup = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoDeleteGroup()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		end

	end

end


--
function UI.SquadFinder_MyGroupWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
    	if self.hMsgDeleteGroup ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgDeleteGroup )
			self.hMsgDeleteGroup = UI.INVALID_UI_HANDLE
    	end
	end

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.SquadFinder_MyGroupWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- если клик на элемент, не приндлежащий к данному окну, то скрыть
	-- исключение: если показывается перекрывающее окно (месседжбокс и т.п.) - тогда вообще не реагировать

	if UI:GetFirstOverlayWnd() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )

	if wndUnderMouse and wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) and wndUnderMouse ~= UI.Squad_SquadFinderBtn and wndUnderMouse ~= UI.Hangar_SquadBtn then
		UI.HangarWnd:HideSquadFinderMyGroupWnd( false )
	end

end


--
function UI.SquadFinder_MyGroupWnd:IsWaiting()

	return UI.SquadFinder:IsWaiting()

end


--
function UI.SquadFinder_MyGroupWnd:SetWaitingEffectVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.WAIT_TEXT )	

end


--
function UI.SquadFinder_MyGroupWnd:UpdateWaiting()

	self:SetWaitingEffectVisible( self:IsWaiting() )

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_JoinsListWnd
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_JoinsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_JoinsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "SquadFinder_MyGroup_JoinsListWnd",
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
				defName 			= "squadFinder_myGroups_joinsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "note",	
						layer		= "UI.SquadFinder_MyGroup_JoinsListWnd.layers.EMPTY_LIST_tEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- EMPTY_LIST_tEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "squadFinder_myGroup_noJoins" ),
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_JoinsListWnd:Clear()

	UI.ButtonsList3Wnd.Clear( self )
	self:SetLayerVisible( true, self.layers.EMPTY_LIST_tEXT )

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_JoinsListWnd.layers =
{
	MAIN_EFFECT			= 0,
	EMPTY_LIST_tEXT		= 1,
}

UI.SquadFinder_MyGroup_JoinsListWnd.btnPrototypeName	= "SquadFinder_MyGroup_JoinSlotWnd"
UI.SquadFinder_MyGroup_JoinsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.SquadFinder_MyGroup_JoinsListWnd.MAX_SLOTS			= 10

UI.SquadFinder_MyGroup_JoinsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_1_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_JoinsListWnd:AddRecord( data )

	UI.ButtonsList3Wnd.AddRecord( self, data )
	self:SetLayerVisible( false, self.layers.EMPTY_LIST_tEXT )

end


--
function UI.SquadFinder_MyGroup_JoinsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_JoinSlotWnd
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_JoinSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_JoinSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "SquadFinder_MyGroup_JoinSlotWnd",
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
				defName 			= "squadFinder_myGroup_joinSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",	
						layer		= "UI.SquadFinder_MyGroup_JoinSlotWnd.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "approved",	
						layer		= "UI.SquadFinder_MyGroup_JoinSlotWnd.layers.STATE",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "over",	
						layer		= "UI.SquadFinder_MyGroup_JoinSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STATE
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
				defName 			= "squadFinder_myGroup_joinSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_JoinSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self.playerNameMetaText:SetText( "", true )
    self:SetLayerVisible( false, self.layers.STATE )
    self.approveJoinBtn:UnlinkFromParent()
    self.rejectJoinBtn:UnlinkFromParent()

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:OnJoinStateChanged()

	local data = self:GetRecordData()

	self:UpdateState( data )
	self:UpdateApproveJoinBtn( data )
	self:UpdateRejectJoinBtn( data )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:OnNickNameUpdate()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:OnClanNameUpdate()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:OnClanUpdate()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_JoinSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    PLAYER_NAME			= 1,
    STATE				= 2,
	MOUSE_OVER_EFFECT	= 3,
}

UI.SquadFinder_MyGroup_JoinSlotWnd.effectInfo =
{
	main =
	{
		staterColorGreenLocator		= "approved",
		staterColorRedLocator		= "color_cancel1",
		staterColorYellowLocator	= "color_invited",
		approveJoinBtnLocator		= "add_btn",
		rejectJoinBtnLocator		= "ignor_btn",
	}
}

UI.SquadFinder_MyGroup_JoinSlotWnd.sounds =
{
	mouseOver	= "sound/ui/btnMouseOver",
}

-- ----------------------------
-- vars
-- ----------------------------

UI.SquadFinder_MyGroup_JoinSlotWnd.approveJoinBtn		= nil
UI.SquadFinder_MyGroup_JoinSlotWnd.rejectJoinBtn		= nil
UI.SquadFinder_MyGroup_JoinSlotWnd.playerNameMetaText	= nil
UI.SquadFinder_MyGroup_JoinSlotWnd.stateColorGreen		= UI.PARAM_DELTA_PLUS_COLOR
UI.SquadFinder_MyGroup_JoinSlotWnd.stateColorRed		= UI.PARAM_DELTA_MINUS_COLOR
UI.SquadFinder_MyGroup_JoinSlotWnd.stateColorYellow		= 0xffffff00

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.playerNameMetaText = UI.MetaText.GetNewInstance()
	self.playerNameMetaText:InitFromLayer( self, self.layers.PLAYER_NAME ) 

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.stateColorGreen	= mainEffect:GetObjColor( self.effectInfo.main.staterColorGreenLocator )
		self.stateColorRed		= mainEffect:GetObjColor( self.effectInfo.main.staterColorRedLocator )
		self.stateColorYellow	= mainEffect:GetObjColor( self.effectInfo.main.staterColorYellowLocator )
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_Shutdown()

	if self.playerNameMetaText then
		self.playerNameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
		self:UpdateMouseOver()
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateMetaTextPos()

	self.playerNameMetaText:UpdateScreenOrgFromLayer( self, self.layers.PLAYER_NAME )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PLAYER_NAME then
		self.playerNameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:CreateControls()

	self.approveJoinBtn	= UI:CreateChildWnd( self, UI.SquadFinder_MyGroup_ApproveJoinBtn, "" )
	self.rejectJoinBtn	= UI:CreateChildWnd( self, UI.SquadFinder_MyGroup_RejectJoinBtn, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:LinkWnd( self.approveJoinBtn:GetUiHandle(), self.effectInfo.main.approveJoinBtnLocator, UI.EffectAnimParams.POS )
		mainEffect:LinkWnd( self.rejectJoinBtn:GetUiHandle(), self.effectInfo.main.rejectJoinBtnLocator, UI.EffectAnimParams.POS )

	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdatePlayerName( data )
	self:UpdateState( data )
	self:UpdateApproveJoinBtn( data )
	self:UpdateRejectJoinBtn( data )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdatePlayerName( data )

	local color = self:GetColor( self.layers.PLAYER_NAME )
	local strPlayerName = string.format( "$link [type PLAYER][params {uid=u64(%d,%d), bWithClan=true, bWithTooltip=false, colorSel=%u, colorUnsel=%u}]$", data.joinInfo.uid.h, data.joinInfo.uid.l, color, color )
	self.playerNameMetaText:SetText( strPlayerName, true )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateState( data )

    self:SetLayerVisible( false, self.layers.STATE )

	if data.joinState ~= UI.SquadFinder_MyGroupWnd.joinStates.NOT_INVITED then

		-- видимость

    	self:SetLayerVisible( true, self.layers.STATE )

		-- текст
	
		local stateName = UI:Val2Key( UI.SquadFinder_MyGroupWnd.joinStates, data.joinState )
		local strId = string.format( "squadFinder_joinState_%s", stateName )
		local text = UI:GetStringByName( strId )

    	self:SetText( text, self.layers.STATE )

		-- цвет

		local color = UI.WHITE_COLOR

    	if data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.INVITED then
    		color = self.stateColorYellow

    	elseif data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.INVITE_ACCEPTED then
    		color = self.stateColorGreen

    	elseif data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.INVITE_DECLINED then
    		color = self.stateColorRed

    	elseif data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.JOIN_CANCELLED then
    		color = self.stateColorRed

    	else
    		sys.log( "UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateState()[ERROR]: unhandled joinState %s", tostring( data.joinState ) )
    	end

		self:SetColor( color, self.layers.STATE )

	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateApproveJoinBtn( data )

	local bNeedBtn = data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.NOT_INVITED

	if bNeedBtn then
		self:AddChild( self.approveJoinBtn )
	else
		self.approveJoinBtn:UnlinkFromParent()
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateRejectJoinBtn( data )

	local bNeedBtn = data.joinState == UI.SquadFinder_MyGroupWnd.joinStates.NOT_INVITED

	if bNeedBtn then
		self:AddChild( self.rejectJoinBtn )
	else
		self.rejectJoinBtn:UnlinkFromParent()
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:UpdateMouseOver()

	local bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	self:SetMouseOver( bMouseOver )

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.SquadFinder_MyGroup_JoinSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_ApproveJoinBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_ApproveJoinBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_ApproveJoinBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "SquadFinder_MyGroup_ApproveJoinBtn",
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
				defName 			= "friends_list_slot_2_add",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_ApproveJoinBtn:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_ApproveJoinBtn.effectInfo =
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
}

UI.SquadFinder_MyGroup_ApproveJoinBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "squadFinder_myGroup_approveJoinBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_RejectJoinBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_RejectJoinBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_RejectJoinBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "SquadFinder_MyGroup_RejectJoinBtn",
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
				defName 			= "friends_list_slot_2_ignor",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_RejectJoinBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_RejectJoinBtn.effectInfo =
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
}

UI.SquadFinder_MyGroup_RejectJoinBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "squadFinder_myGroup_rejectJoinBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_ReloadBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_ReloadBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_ReloadBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name 			= "SquadFinder_MyGroup_ReloadBtn",
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
				defName 			= "squadFinder_reloadBtn",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_ReloadBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_ReloadBtn.effectInfo =
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
}

UI.SquadFinder_MyGroup_ReloadBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "squadFinder_reloadBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_EditGroupBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_EditGroupBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_MyGroup_EditGroupBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name 			= "SquadFinder_MyGroup_EditGroupBtn",
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
				defName 			= "squadFinder_myGroup_editGroupBtn",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_MyGroup_EditGroupBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_MyGroup_EditGroupBtn.effectInfo =
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
}

UI.SquadFinder_MyGroup_EditGroupBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "squadFinder_myGroup_editGroupBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_DeleteGroupBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_DeleteGroupBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn3",

    	props =
    	{
    		name = "SquadFinder_MyGroup_DeleteGroupBtn"
    	}
	},

	textId = "squadFinder_myGroup_deleteGroupBtn"
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_MyGroup_CrossBtn
-- ---------------------------------------------------------------

UI.SquadFinder_MyGroup_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "SquadFinder_MyGroup_CrossBtn"
    	}
	}
}