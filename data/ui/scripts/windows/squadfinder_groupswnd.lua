-- ---------------------------------------------------------------
-- UI.SquadFinder_GroupsWnd
-- ---------------------------------------------------------------

UI.SquadFinder_GroupsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.SquadFinder_GroupsWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    WAIT_EFFECT	= 2,
    WAIT_TEXT	= 3,
}


--
UI.SquadFinder_GroupsWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "SquadFinder_GroupsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = UI.SquadFinder_GroupsWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "squadFinder_groups",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",	
						layer		= "UI.SquadFinder_GroupsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load",	
						layer		= "UI.SquadFinder_GroupsWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.SquadFinder_Groups_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_reload",	
						wnd			= "UI.SquadFinder_Groups_ReloadBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down",	
						wnd			= "UI.SquadFinder_Groups_ActivitiesCB",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "list",	
						wnd			= "UI.SquadFinder_Groups_GroupsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "add_friend_btn_8",	
						wnd			= "UI.SquadFinder_Groups_CreateMyGroupBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "add_friend_btn_7",	
						wnd			= "UI.SquadFinder_Groups_JoinBtn",
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
			text			= UI:GetStringByName( "squadFinder_groups_caption" ),
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
						layer		= "UI.SquadFinder_GroupsWnd.layers.WAIT_TEXT",
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
		"UI.SquadFinder_Groups_CrossBtn",
		"UI.SquadFinder_Groups_ReloadBtn",
		"UI.SquadFinder_Groups_ActivitiesCB",
		"UI.SquadFinder_Groups_GroupsListWnd",
		"UI.SquadFinder_Groups_CreateMyGroupBtn",
		"UI.SquadFinder_Groups_JoinBtn",
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_GroupsWnd:CanSelectGroupRecord( data )

	return data ~= nil and data.groupState == UI.SquadFinder_GroupsWnd.groupStates.ACTIVE	

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnWaitingChanged()

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateWaiting()

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupsRequest()

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateGroupsList()

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnJoined( gid )

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateGroupState( gid )

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupDeleted( gid )

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateGroupState( gid )

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnCancelMyJoin( gid )

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateGroupState( gid )

end


--
function UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupChanged( gid )

	if not self:IsOnScreen() then
		return
	end

	-- здесь может поменяться состояние на JOIN_APPROVED или JOIN_REJECTED
	-- все остальные изменения, которые могут быть здесь (например, количество участников) здесь не апдейтятся, а апдейтятся только при обновлении списка

	self:UpdateGroupState( gid )

end


--
function UI.SquadFinder_GroupsWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then	
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self.groupsList:GetNumRecords() do

		local data = self.groupsList:GetRecordData( recordIdx )
		if data.groupInfo.owner == uid then

			local slotWnd = self.groupsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnNickNameUpdate()
			end

			break

		end

	end

end


--
function UI.SquadFinder_GroupsWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if not self:IsOnScreen() then	
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self.groupsList:GetNumRecords() do

		local data = self.groupsList:GetRecordData( recordIdx )
		if UI:GetPlayerClanByUid( data.groupInfo.owner ) == cid then

			local slotWnd = self.groupsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnClanNameUpdate()
			end

		end

	end

end


--
function UI.SquadFinder_GroupsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

    	for recordIdx = 1, self.groupsList:GetNumRecords() do

    		local data = self.groupsList:GetRecordData( recordIdx )
    		if data.groupInfo.owner == uid then

    			local slotWnd = self.groupsList:GetButtonForRecord( recordIdx )
    			if slotWnd then
    				slotWnd:OnClanUpdate()
    			end

    			break

    		end

    	end

	end

end


--
function UI.SquadFinder_GroupsWnd:OnSquadDataChanged()

	if not self:IsOnScreen() then
		return
	end

	if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then
		UI.HangarWnd:HideSquadFinderGroupsWnd( false )
	else
		self:UpdateJoinBtn()
	end

end


--
function UI.SquadFinder_GroupsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.activitiesCB:SelectRecord( -1 )	-- выбранная активность не сбрасывается при переоткрытии окна, сбрасывается при перелогине

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_GroupsWnd.groupStates =
{
	ACTIVE			= 1,	-- можно подать заявку
	CANCELLED		= 2,	-- группа удалена (временное состояние, до полного обновления списка, после обновления группа пропадает)
	JOIN_REGISTERED	= 3,	-- игрок подал заявку, и она ожидает реакции владельца группы
	JOIN_APPROVED	= 4,	-- игрок подал заявку, и она одобрена (игроку хозяином группы выслано приглашение, и игрок еще не принял и не отклонил его)
	JOIN_REJECTED	= 5,	-- игрок подал заявку, и она отклонена (временное состояние, до полного обновления списка, после обновления группа пропадает)
}

UI.SquadFinder_GroupsWnd.sounds =
{
    reload			= UI.sounds.btnClick,
    join			= UI.sounds.btnClick,
    cancelJoin		= UI.sounds.btnClick,
	selectGroupSlot	= UI.sounds.btnClick,
	createGroupShow	= "sound/ui/btnClick",
}

-- ----------------------------
-- vars
-- ----------------------------

UI.SquadFinder_GroupsWnd.crossBtn						= nil
UI.SquadFinder_GroupsWnd.reloadBtn						= nil
UI.SquadFinder_GroupsWnd.activitiesCB					= nil
UI.SquadFinder_GroupsWnd.groupsList						= nil
UI.SquadFinder_GroupsWnd.createMyGroupBtn				= nil
UI.SquadFinder_GroupsWnd.joinBtn						= nil
UI.SquadFinder_GroupsWnd.activityTypeToSet				= nil
UI.SquadFinder_GroupsWnd.bLockOnSelActivityChangeUpdate	= false


-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_GroupsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.crossBtn			= UI.SquadFinder_Groups_CrossBtn
    self.reloadBtn			= UI.SquadFinder_Groups_ReloadBtn
    self.activitiesCB		= UI.SquadFinder_Groups_ActivitiesCB
    self.groupsList			= UI.SquadFinder_Groups_GroupsListWnd
    self.createMyGroupBtn	= UI.SquadFinder_Groups_CreateMyGroupBtn
    self.joinBtn			= UI.SquadFinder_Groups_JoinBtn

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.SquadFinder_GroupsWnd:InitActivitiesList()

	if self.activitiesCB:GetNumRecords() > 0 then
		return
	end


	local allActivitiesData =
	{
		activityType	= UI.SquadFinder.ACTIVITY_TYPE_ALL,
		text			= UI:GetStringByName( "squadFinder_activityType_ALL" ),
	}

	self.activitiesCB:AddRecord( allActivitiesData )


	if type( _G.SquadSearchAct ) == "table" then

		local activityTypes = {}

		for name, activityType in pairs( _G.SquadSearchAct ) do

			if type( activityType ) == "number" then

				if activityType ~= UI.SquadFinder.ACTIVITY_TYPE_ALL and activityType ~= -1 then
					table.insert( activityTypes, activityType )
				else
					sys.log( "UI.SquadFinder_GroupsWnd:InitActivitiesList()[ERROR]: invalid activity %d in _G.SquadSearchAct.%s", UI.SquadFinder.ACTIVITY_TYPE_ALL, name )
				end			

			else
				sys.log( "UI.SquadFinder_GroupsWnd:InitActivitiesList()[ERROR]: invalid type of _G.SquadSearchAct.%s; \"number\" expected, got \"%s\"", name, type( activityType ) )				
			end

		end

		table.sort( activityTypes )

		for idx, activityType in ipairs( activityTypes ) do

			local data =
			{
				activityType	= activityType,
				text			= UI:SquadFinderActivityType2Str( activityType ),
			}

			self.activitiesCB:AddRecord( data )

		end

	else
		sys.log( "UI.SquadFinder_GroupsWnd:InitActivitiesList()[ERROR]: invalid type of _G.SquadSearchAct; \"table\" expected, got \"%s\"", type( _G.SquadSearchAct ) )
	end

end


--
function UI.SquadFinder_GroupsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:InitActivitiesList()

	self:FullUpdate()	

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.SquadFinder_GroupsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		UI.SquadFinder:ResetDelayedGroupsRequest()
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.SquadFinder_GroupsWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- если клик на элемент, не приндлежащий к данному окну, то скрыть
	-- исключение: если показывается перекрывающее окно (месседжбокс и т.п.) - тогда вообще не реагировать

	if UI:GetFirstOverlayWnd() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()
	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )

	if wndUnderMouse and wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) and not self.activitiesCB:IsUnderMouse() and wndUnderMouse ~= UI.Hangar_SquadBtn then
		UI.HangarWnd:HideSquadFinderGroupsWnd( false )
	end

end


--
function UI.SquadFinder_GroupsWnd:FullUpdate()

	self:Reset()

	self:UpdateWaiting()

	self.bLockOnSelActivityChangeUpdate = true
	self:ValidateSelActivity()
	self.bLockOnSelActivityChangeUpdate = false

	local bRequest = false

	if not self.bSavingGameState then

		local activityType = self:GetSelActivity()
    	if activityType ~= -1 then

    		UI.SquadFinder:RequestGroups( activityType, true )
			bRequest = true

    	end

	end

	if not bRequest then
		self:UpdateGroupsList()
	end

	self:UpdateJoinBtn()

end


--
function UI.SquadFinder_GroupsWnd:Reset()

	-- выделение активности не сбрасывается между открытиями окна, оно сбрасывается при разлогине

	self.groupsList:Reset()
	self.joinBtn:Enable( false )

end


--
function UI.SquadFinder_GroupsWnd:ValidateSelActivity()

	local activityType = self:GetSelActivity()
	if activityType ~= -1 then
		return
	end

	if self.activityTypeToSet ~= nil then
		activityType = self.activityTypeToSet
		self.activityTypeToSet = nil
	end

	if activityType == -1 then
		activityType = UI.SquadFinder.ACTIVITY_TYPE_ALL
	end

	self:SelectActivity( activityType )

end


--
function UI.SquadFinder_GroupsWnd:SelectActivity( activityType )

	local selRecordIdx = -1

	if activityType ~= -1 then

    	for recordIdx = 1, self.activitiesCB:GetNumRecords() do

    		local data = self.activitiesCB:GetRecordData( recordIdx )
    		if data.activityType == activityType then

    			selRecordIdx = recordIdx
    			break

    		end

    	end

	end

	self.activitiesCB:SelectRecord( selRecordIdx )

end


--
function UI.SquadFinder_GroupsWnd:GetSelActivity()

	local activityType = -1

	local selRecordIdx = self.activitiesCB:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		activityType = self.activitiesCB:GetRecordData( selRecordIdx ).activityType
	end

	return activityType	

end


--
function UI.SquadFinder_GroupsWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.activitiesCB:GetUiHandle() then
		self:OnSelActivityChanged()
	end

end


--
function UI.SquadFinder_GroupsWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.groupsList:GetUiHandle() then
		self:OnSelGroupChanged()
	end

end


--
function UI.SquadFinder_GroupsWnd:OnSelActivityChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.bLockOnSelActivityChangeUpdate then
		return
	end

	self.groupsList:Reset()

	local activityType = self:GetSelActivity()
	if activityType ~= -1 then
		UI.SquadFinder:RequestGroups( activityType, true )
	end

end


--
function UI.SquadFinder_GroupsWnd:OnSelGroupChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateJoinBtn()	

end


--
function UI.SquadFinder_GroupsWnd:UpdateGroupsList()

	self.groupsList:Reset()

	local groups = {}

	local activityType = self:GetSelActivity()
	if activityType ~= -1 then
		groups = UI.SquadFinder:GetGroups( activityType )
	end

	if next( groups ) then
		
		local function fnSort( groupInfo1, groupInfo2 )
			return groupInfo1.gid < groupInfo2.gid	-- новые - в конце (gid коррелирует со временем создания группы, чем меньше gid - тем старше группа)
		end

		table.sort( groups, fnSort )

		for idx, groupInfo in ipairs( groups ) do

			local data =
			{
				groupInfo	= groupInfo,
				groupState	= self:DetectGroupState( groupInfo ),
			}

			self.groupsList:AddRecord( data )			

		end

	end

end


--
function UI.SquadFinder_GroupsWnd:UpdateJoinBtn()

	local bEnable = false

	if not UI.Squad:IsInSquad() then

    	local selRecordIdx = self.groupsList:GetSelectedRecord()
    	if selRecordIdx ~= -1 then

    		local data = self.groupsList:GetRecordData( selRecordIdx )
    		if data.groupState == self.groupStates.ACTIVE then
    			bEnable = true
    		end

    	end

	end

	self.joinBtn:Enable( bEnable )

end


--
function UI.SquadFinder_GroupsWnd:DetectGroupState( groupInfo )

	local groupState = -1

	if groupInfo.bDeleted then

		groupState = self.groupStates.CANCELLED

	else

    	local joinState = UI.SquadFinder:GetPlayerJoinStateFromGroup( groupInfo, UI:GetLocalPlayerUid() )

    	if joinState == UI.SquadFinder.joinStates.APPROVED then
    		groupState = self.groupStates.JOIN_APPROVED

    	elseif joinState == UI.SquadFinder.joinStates.REJECTED then
    		groupState = self.groupStates.JOIN_REJECTED

    	elseif joinState == UI.SquadFinder.joinStates.REGISTERED then
    		groupState = self.groupStates.JOIN_REGISTERED

    	else
    		groupState = self.groupStates.ACTIVE
    	end

	end
	
	return groupState

end


--
function UI.SquadFinder_GroupsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.reloadBtn then

		if not self:IsWaiting() then

        	local activityType = self:GetSelActivity()
        	if activityType ~= -1 then
        		UI.SquadFinder:RequestGroups( activityType, false )
				UI:PlayGlobalSound( self.sounds.reload )
        	end

		end
	
	elseif UI:IsWndKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) or ( UI:HasWndAncestorKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) and not UI:IsWndKindOf( wnd, "SquadFinder_Groups_CancelJoinBtn" ) ) then

		local slotWnd = UI:IsWndKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" )
		if self:CanSelectGroupRecord( slotWnd:GetRecordData() ) then

    		if not slotWnd:IsSelected() then
				self.groupsList:SelectRecord( slotWnd:GetRecord() )
				UI:PlayGlobalSound( self.sounds.selectGroupSlot )
    		end

		end

	elseif wnd == self.joinBtn then

		if not self:IsWaiting() then

			local selRecordIdx = self.groupsList:GetSelectedRecord()
			if selRecordIdx ~= -1 then

				local gid = self.groupsList:GetRecordData( selRecordIdx ).groupInfo.gid
				UI.SquadFinder:Join( gid )
				UI:PlayGlobalSound( self.sounds.join )

			else
				sys.log( "UI.SquadFinder_GroupsWnd:F_OnMouseLButtonDown()[ERROR]: no selected group" )
			end

		end

	elseif UI:IsWndKindOf( wnd, "SquadFinder_Groups_CancelJoinBtn" ) then

		if not self:IsWaiting() then

			local slotWnd = UI:GetAncestorKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" )
			local gid = slotWnd:GetRecordData().groupInfo.gid

			UI.SquadFinder:CancelMyJoin( gid )
			UI:PlayGlobalSound( self.sounds.cancelJoin )

		end		

	elseif wnd == self.createMyGroupBtn then

		if not self:IsWaiting() then

			UI.HangarWnd:HideSquadFinderGroupsWnd( false )
			UI.HangarWnd:ShowSquadFinderCreateMyGroupWnd( false, true )

		end

	elseif wnd == self.crossBtn then

		UI.HangarWnd:HideSquadFinderGroupsWnd( true )

	end

	return true

end


--
function UI.SquadFinder_GroupsWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) or ( UI:HasWndAncestorKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) and not UI:IsWndKindOf( wnd, "SquadFinder_Groups_CancelJoinBtn" ) ) then

		if not self:IsWaiting() then

			local slotWnd = UI:IsWndKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "SquadFinder_Groups_GroupSlotWnd" )
			if self:CanSelectGroupRecord( slotWnd:GetRecordData() ) then

				local gid = slotWnd:GetRecordData().groupInfo.gid
				UI.SquadFinder:Join( gid )
				UI:PlayGlobalSound( self.sounds.join )

			end

		end

	end

	return true

end


--
function UI.SquadFinder_GroupsWnd:IsWaiting()

	return UI.SquadFinder:IsWaiting()

end


--
function UI.SquadFinder_GroupsWnd:SetWaitingEffectVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.WAIT_TEXT )	

end


--
function UI.SquadFinder_GroupsWnd:UpdateWaiting()

	self:SetWaitingEffectVisible( self:IsWaiting() )
	self:UpdateActivitiesCBState()

end


--
function UI.SquadFinder_GroupsWnd:UpdateActivitiesCBState()

	self.activitiesCB:Enable( not self:IsWaiting() )

end


--
function UI.SquadFinder_GroupsWnd:F_OnEventSaveUiState()

	UI.store.SquadFinder_GroupsWnd = {}

	local activityType = self:GetSelActivity()
	if activityType ~= -1 then
		UI.store.SquadFinder_GroupsWnd.activityType = activityType
	end


end


--
function UI.SquadFinder_GroupsWnd:F_OnEventRestoreUiState()

	if UI.store.SquadFinder_GroupsWnd then

		local activityType = UI.store.SquadFinder_GroupsWnd.activityType or -1

		if activityType ~= -1 then

    		if self:IsOnScreen() then
    			self:SelectActivity( UI.store.SquadFinder_GroupsWnd.activityType )
    		else
    			self.activityTypeToSet = UI.store.SquadFinder_GroupsWnd.activityType
    		end

		end

		UI.store.SquadFinder_GroupsWnd = nil

	end

end


--
function UI.SquadFinder_GroupsWnd:UpdateGroupState( gid )

	for recordIdx = 1, self.groupsList:GetNumRecords() do

		local data = self.groupsList:GetRecordData( recordIdx )
		if data.groupInfo.gid == gid then

			data.groupState = self:DetectGroupState( data.groupInfo )

			local slotWnd = self.groupsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnGroupStateChanged()
			end

			if recordIdx == self.groupsList:GetSelectedRecord() and not self:CanSelectGroupRecord( data ) then
				self.groupsList:SelectRecord( -1 )
			end

			break

		end

	end

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_GroupsListWnd
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_GroupsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_Groups_GroupsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "SquadFinder_Groups_GroupsListWnd",
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
				defName 			= "squadFinder_groups_groupsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "note",	
						layer		= "UI.SquadFinder_Groups_GroupsListWnd.layers.EMPTY_LIST_tEXT",
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
			text			= UI:GetStringByName( "squadFinder_groups_noGroups" ),
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_Groups_GroupsListWnd:Reset()

	self:Clear()
	self:SetLayerVisible( true, self.layers.EMPTY_LIST_tEXT )

end

-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_Groups_GroupsListWnd.layers =
{
	MAIN_EFFECT			= 0,
	EMPTY_LIST_tEXT		= 1,
}

UI.SquadFinder_Groups_GroupsListWnd.btnPrototypeName	= "SquadFinder_Groups_GroupSlotWnd"
UI.SquadFinder_Groups_GroupsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.SquadFinder_Groups_GroupsListWnd.MAX_SLOTS			= 7

UI.SquadFinder_Groups_GroupsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_Groups_GroupsListWnd:AddRecord( data )

	UI.ButtonsList3Wnd.AddRecord( self, data )
	self:SetLayerVisible( false, self.layers.EMPTY_LIST_tEXT )

end


--
function UI.SquadFinder_Groups_GroupsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_GroupSlotWnd
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_GroupSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_Groups_GroupSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "SquadFinder_Groups_GroupSlotWnd",
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
				defName 			= "squadFinder_groups_groupSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.SquadFinder_Groups_GroupSlotWnd.layers.GROUP_INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title1",	
						layer		= "UI.SquadFinder_Groups_GroupSlotWnd.layers.GROUP_DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "approved",	
						layer		= "UI.SquadFinder_Groups_GroupSlotWnd.layers.STATE",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "sel",	
						layer		= "UI.SquadFinder_Groups_GroupSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",	
						layer		= "UI.SquadFinder_Groups_GroupSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
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

		-- STATE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "squadFinder_groups_groupSlot_sel",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "squadFinder_groups_groupSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SquadFinder_Groups_GroupSlotWnd:Reset()

	UI.ButtonsList3_Btn:Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self.groupInfoMetaText:SetText( "", true )
	self:ResetGroupDesc()
	self:SetLayerVisible( false, self.layers.STATE )
	self.cancelJoinBtn:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )
	self:SetMouseOver( false )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList3_Btn.Select( self, bSelect, bAnimated )

	self:UpdateSelEffect()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:OnGroupStateChanged()

	local data = self:GetRecordData()

	self:UpdateMainAnimation( data )
	self:UpdateState( data )
	self:UpdateCancelJoinBtn( data )
	self:UpdateMouseOver()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:OnNickNameUpdate()

	local data = self:GetRecordData()
	self:UpdateGroupInfo( data )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:OnClanNameUpdate()

	local data = self:GetRecordData()
	self:UpdateGroupInfo( data )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:OnClanUpdate()

	local data = self:GetRecordData()
	self:UpdateGroupInfo( data )

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_Groups_GroupSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    GROUP_INFO			= 1,
    GROUP_DESC			= 2,
    STATE				= 3,
    SEL_EFFECT			= 4,
    MOUSE_OVER_EFFECT	= 5,
}

UI.SquadFinder_Groups_GroupSlotWnd.effectInfo =
{
	main =
	{
		animIdle				= "idle",
		animJoined				= "approved",
		animDisabled			= "disable",
		playerNameColorLocator	= "nickname_color",
		staterColorGreenLocator	= "approved",
		staterColorRedLocator	= "color_cancel",
		cancelJoinBtnLocator	= "ignor_btn",
	}
}

UI.SquadFinder_Groups_GroupSlotWnd.sounds =
{
	mouseOver	= "sound/ui/btnMouseOver",
}

-- ----------------------------
-- vars
-- ----------------------------

UI.SquadFinder_Groups_GroupSlotWnd.cancelJoinBtn		= nil
UI.SquadFinder_Groups_GroupSlotWnd.groupInfoMetaText	= nil
UI.SquadFinder_Groups_GroupSlotWnd.groupDescMetaText	= nil
UI.SquadFinder_Groups_GroupSlotWnd.groupDescLinkWnd		= nil
UI.SquadFinder_Groups_GroupSlotWnd.playerNameColor		= UI.TEXT_BASE_COLOR
UI.SquadFinder_Groups_GroupSlotWnd.stateColorGreen		= UI.PARAM_DELTA_PLUS_COLOR
UI.SquadFinder_Groups_GroupSlotWnd.stateColorRed		= UI.PARAM_DELTA_MINUS_COLOR

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_Groups_GroupSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.groupInfoMetaText = UI.MetaText.GetNewInstance()
	self.groupInfoMetaText:InitFromLayer( self, self.layers.GROUP_INFO ) 

	self.groupDescMetaText = UI.MetaText.GetNewInstance()
	self.groupDescMetaText:InitFromLayer( self, self.layers.GROUP_DESC ) 

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
 
		self.playerNameColor	= mainEffect:GetObjColor( self.effectInfo.main.playerNameColorLocator )
		self.stateColorGreen	= mainEffect:GetObjColor( self.effectInfo.main.staterColorGreenLocator )
		self.stateColorRed		= mainEffect:GetObjColor( self.effectInfo.main.staterColorRedLocator )

	end

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_Shutdown()

	if self.groupInfoMetaText then
		self.groupInfoMetaText:Clear()
	end

	if self.groupDescMetaText then
		self.groupDescMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateMetaTextPos()

	self.groupInfoMetaText:UpdateScreenOrgFromLayer( self, self.layers.GROUP_INFO )
	self.groupDescMetaText:UpdateScreenOrgFromLayer( self, self.layers.GROUP_DESC )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateMetaTextColor()

	self.groupInfoMetaText:SetColor( self:GetColor( self.layers.GROUP_INFO ) )
	self.groupDescMetaText:SetColor( self:GetColor( self.layers.GROUP_DESC ) )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.GROUP_INFO then
		self.groupInfoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.GROUP_DESC then
		self.groupDescMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:CreateControls()

	self.cancelJoinBtn		= UI:CreateChildWnd( self, UI.SquadFinder_Groups_CancelJoinBtn, "" )
	self.groupDescLinkWnd	= UI:CreateChildWnd( self, UI.LinkWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.cancelJoinBtn:GetUiHandle(), self.effectInfo.main.cancelJoinBtnLocator, UI.EffectAnimParams.POS )
	end

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateGroupInfo( data )
	self:UpdateGroupDesc( data )
	self:UpdateState( data )
	self:UpdateCancelJoinBtn( data )
	self:UpdateSelEffect( data )
	self:UpdateMouseOver()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateMainAnimation( data )

	local anim = ""

	if data.groupState == UI.SquadFinder_GroupsWnd.groupStates.ACTIVE then
		anim = self.effectInfo.main.animIdle

	elseif data.groupState == UI.SquadFinder_GroupsWnd.groupStates.CANCELLED then
		anim = self.effectInfo.main.animDisabled

	elseif data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_REGISTERED then
		anim = self.effectInfo.main.animJoined

	elseif data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_APPROVED then
		anim = self.effectInfo.main.animJoined

	elseif data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_REJECTED then
		anim = self.effectInfo.main.animDisabled

	else
		sys.log( "UI.SquadFinder_Groups_GroupSlotWnd:UpdateMainAnimation()[ERROR]: unhandled groupState: %s", tostring( data.groupState ) )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

	self:UpdateMetaTextColor()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateGroupInfo( data )

	-- активность
	local strActivity = UI:SquadFinderActivityType2Str( data.groupInfo.activityType )

	-- ранг
	local strRank = data.groupInfo.minRank ~= UI.SquadFinder.RANK_All and tostring( data.groupInfo.minRank ) or ""

	-- имя игрока
	local strPlayerName = string.format( "$link [type PLAYER][params {uid=u64(%d,%d), bWithClan=true, bWithTooltip=false, colorSel=%u, colorUnsel=%u}]$", data.groupInfo.owner.h, data.groupInfo.owner.l, self.playerNameColor, self.playerNameColor )

	-- количество членов сквада

	local strNumPlayers = UI:GetStringByName( "squadFinder_numPlayers" )
	local strNumPlayerVal = tostring( data.groupInfo.numPlayers )

	local numSubst = 0
	strNumPlayers, numSubst = string.gsub( strNumPlayers, "%$num%$", strNumPlayerVal )

	if numSubst == 0 then
		sys.log( "UI.SquadFinder_Groups_GroupSlotWnd:UpdateGroupInfo()[ERROR]: cannot find placeholder \"$num$\" in string \"squadFinder_numPlayers\"" )
		strNumPlayers = string.format( "[INVALID STRING] %s members", strNumPlayerVal )
	end
	
	-- всё вместе

	local alpha = UI:GetAlpha( self:GetColor( self.layers.GROUP_INFO ) )
	local playerNameColor = UI:SetAlpha( self.playerNameColor, alpha )
	local strGroupInfo = string.format( "%s %s%s%s(%s%s, %s)", strActivity, strRank, strRank ~= "" and " " or "", UI:Color2Str( self.playerNameColor ), strPlayerName, UI:Color2Str( self.playerNameColor ), strNumPlayers )

	self.groupInfoMetaText:SetText( strGroupInfo, true )	

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateGroupDesc( data )

	self:ResetGroupDesc()

	local strGroupDesc = UI:ShieldSpecSymbolsForMetatext( data.groupInfo.message )
	strGroupDesc = string.gsub( strGroupDesc, "\n", " " )

    strGroupDesc, bWasCut = UI:GetCutTextWithEllipses( strGroupDesc, self:GetLayerWidth( self.layers.GROUP_DESC ) - 5, self:GetFont( self.layers.GROUP_DESC ) )	-- -5 для ширины, т.к. реально ссылка с этим текстом займет немного больше места, т.к. место для нее в метатексте выделяется с помощью вставки невидимых символов

	if bWasCut then

		local color = self:GetColor( self.layers.GROUP_DESC )

		local strTooltip = UI:ShieldSpecSymbolsForMetatext( data.groupInfo.message )
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
function UI.SquadFinder_Groups_GroupSlotWnd:ResetGroupDesc()

	self.groupDescMetaText:SetText( "", true )
	self.groupDescLinkWnd:Reset()
	self.groupDescLinkWnd:UnlinkFromParent()

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateState( data )

    self:SetLayerVisible( false, self.layers.STATE )

	if data.groupState ~= UI.SquadFinder_GroupsWnd.groupStates.ACTIVE then

		-- видимость

    	self:SetLayerVisible( true, self.layers.STATE )

		-- текст

		local groupStateName = UI:Val2Key( UI.SquadFinder_GroupsWnd.groupStates, data.groupState )
		local strId = string.format( "squadFinder_groupState_%s", groupStateName )
		local str = UI:GetStringByName( strId )

		self:SetText( str, self.layers.STATE )

		-- цвет

		local color = UI.WHITE_COLOR

		if data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_REGISTERED or data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_APPROVED then
			color = self.stateColorGreen
		elseif data.groupState == UI.SquadFinder_GroupsWnd.groupStates.CANCELLED or data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_REJECTED then
			color = self.stateColorRed
		else
			sys.log( "UI.SquadFinder_Groups_GroupSlotWnd:UpdateState()[ERROR]: unhandled group state %d", data.groupState )
		end

		self:SetColor( color, self.layers.STATE )

	end

end



--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateCancelJoinBtn( data )

	local bNeedBtn = data.groupState == UI.SquadFinder_GroupsWnd.groupStates.JOIN_REGISTERED

	if bNeedBtn then
		self:AddChild( self.cancelJoinBtn )
	else
		self.cancelJoinBtn:UnlinkFromParent()
	end

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateSelEffect()

	self:SetLayerVisible( self:IsSelected(), self.layers.SEL_EFFECT )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:CanClick()

	local data = self:GetRecordData()
	return UI.SquadFinder_GroupsWnd:CanSelectGroupRecord( data )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self:CanClick() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		if wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) ) then
			bMouseOver = true
		end
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.SquadFinder_Groups_GroupSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_CancelJoinBtn
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_CancelJoinBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_Groups_CancelJoinBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "SquadFinder_Groups_CancelJoinBtn",
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
function UI.SquadFinder_Groups_CancelJoinBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_Groups_CancelJoinBtn.effectInfo =
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

UI.SquadFinder_Groups_CancelJoinBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "squadFinder_groups_cancelJoinBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_ReloadBtn
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_ReloadBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.SquadFinder_Groups_ReloadBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name 			= "SquadFinder_Groups_ReloadBtn",
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
function UI.SquadFinder_Groups_ReloadBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.SquadFinder_Groups_ReloadBtn.effectInfo =
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

UI.SquadFinder_Groups_ReloadBtn.tooltipData =
{
	tooltipType		= UI.tooltipTypes.TEXT_SMALL,
	text			= UI:GetStringByName( "squadFinder_reloadBtn_tooltipText" )
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_ActivitiesCB
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_ActivitiesCB =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "SquadFinder_Groups_ActivitiesCB"
		},
	},

	MAX_VISIBLE_RECORDS = 5
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_CreateMyGroupBtn
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_CreateMyGroupBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn3",

    	props =
    	{
    		name = "SquadFinder_Groups_CreateMyGroupBtn"
    	}
	},

	textId = "squadFinder_groups_createMyGroupBtn"
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_JoinBtn
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_JoinBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn3",

    	props =
    	{
    		name = "SquadFinder_Groups_JoinBtn"
    	}
	},

	textId = "squadFinder_groups_joinBtn"
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_Groups_CrossBtn
-- ---------------------------------------------------------------

UI.SquadFinder_Groups_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "SquadFinder_Groups_CrossBtn"
    	}
	}
}