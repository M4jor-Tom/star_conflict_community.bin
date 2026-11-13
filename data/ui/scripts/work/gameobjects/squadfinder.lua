-- ----------------------------------------------------------------
-- UI.SquadFinder
-- ----------------------------------------------------------------

if UI.SquadFinder then
	return
end

UI.SquadFinder = {}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.SquadFinder:RequestGroups( activityType, bImmediate )

	if type( activityType ) ~= "number" then
		sys.log( "UI.SquadFinder:RequestGroups()[ERROR]: invalid type of the 1-st parameter (\"activityType\"); \"number\" expected, got \"%s\"", type( activityType ) )
		return
	end

	if bImmediate ~= nil then
		if type( bImmediate ) ~= "boolean" then
			sys.log( "UI.SquadFinder:RequestGroups()[ERROR]: invalid type of the 2-nd parameter (\"bImmediate\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bImmediate ) )
			bImmediate = nil
		end		
	end

	if bImmediate == nil then
		bImmediate = false
	end

	local filter = self:MakeGroupsFilter( activityType )

	if self.requestId_groups ~= 0 and self:IsGroupsFiltersEqual( filter, self.groupsRequestedFilter ) then	-- уже ожидается ответ на запрос того же самого
		return
	end

	if self:IsWaiting() or ( not bImmediate and self.groupsRequestTimer ~= -1 ) then
		self.groupsToRequestData = { activityType = activityType }
		return
	end

	self:RequestGroupsInternal( filter )

end


--
function UI.SquadFinder:ResetDelayedGroupsRequest()

	self.groupsToRequestData = nil

end


--
function UI.SquadFinder:GetGroups( activityType )

	local groups = {}

	if type( activityType ) ~= "number" then
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: invalid type of the 1-st parameter (\"activityType\"); \"number\" expected, got \"%s\"", type( activityType ) )
		return groups
	end

	if self.groupsFilter == nil then
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: no groups requested" )
		return groups
	end

	if self.groupsFilter.activityType == activityType then

		groups = self.groups

	elseif self.groupsFilter.activityType == self.ACTIVITY_TYPE_ALL then

		for idx, groupInfo in ipairs( self.groups ) do
			if groupInfo.activityType == activityType then
				table.insert( groups, groupInfo )
			end
		end

	else
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: activityType does not match" )
	end	

	return groups

end


--
function UI.SquadFinder:GetGroupInfoById( gid )

	local goupInfo = nil

	if type( gid ) ~= "number" then
		sys.log( "UI.SquadFinder:GetGroupInfoById()[ERROR]: invalid type of the 1-st parameter (\"gid\"); \"number\" expected, got \"%s\"", type( gid ) )
		return goupInfo
	end

	for idx, _groupInfo in ipairs( self.groups ) do
		if _groupInfo.gid == gid then
			goupInfo = _groupInfo
			break
		end
	end

	return goupInfo

end


--
function UI.SquadFinder:GetPlayerJoinStateFromGroup( groupInfo, uid )

	local joinState = self.joinStates.NONE

	if type( groupInfo ) ~= "table" then
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: invalid type of the 1-st parameter (\"groupInfo\"); \"table\" expected, got \"%s\"", type( groupInfo ) )
		return joinState
	end

	if not self:IsGroupInfoValid( groupInfo ) then
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: invalid format of \"groupInfo\"" )
		return joinState
	end

	if type( uid ) ~= "userdata" then
		sys.log( "UI.SquadFinder:GetGroups()[ERROR]: invalid type of the 2-nd parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return joinState
	end

	-- предполагается, что игрок не может быть одновременно в списках joinReqs и rejectedUids;
	-- если это не так, то эта ситуация корректно не обработается

	for idx, joinInfo in pairs( groupInfo.joinReqs ) do
		if joinInfo.uid == uid then
			joinState = joinInfo.invited and self.joinStates.APPROVED or self.joinStates.REGISTERED
			break
		end
	end

	if joinState == self.joinStates.NONE then
    	for idx, rejectedUid in pairs( groupInfo.rejectedUids ) do
    		if rejectedUid == uid then
    			joinState = self.joinStates.REJECTED
    			break
    		end
    	end
	end

	return joinState

end


-- подать заявку на присоединение к группе
function UI.SquadFinder:Join( gid )

	if type( gid ) ~= "number" then
		sys.log( "UI.SquadFinder:Join()[ERROR]: invalid type of the 1-st parameter (\"gid\"); \"number\" expected, got \"%s\"", type( gid ) )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:Join()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_join = _G.MasterServer_LobbyGroupJoinReqCreate( gid )

	if self.requestId_join == 0 then
		self:ShowMsgOnJoinError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


-- отозвать мою заявку на присоединение к группе
function UI.SquadFinder:CancelMyJoin( gid )

	if type( gid ) ~= "number" then
		sys.log( "UI.SquadFinder:CancelMyJoin()[ERROR]: invalid type of the 1-st parameter (\"gid\"); \"number\" expected, got \"%s\"", type( gid ) )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:CancelMyJoin()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_cancelMyJoin = _G.MasterServer_LobbyGroupJoinReqCancel( gid )

	if self.requestId_cancelMyJoin == 0 then
		self:ShowMsgOnCancelMyJoinError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


--
function UI.SquadFinder:GetMyGroupInfo()

	return self.myGroupInfo

end


--
function UI.SquadFinder:IsMyGroup()

	return self.myGroupInfo ~= nil

end


-- создать свою группу
function UI.SquadFinder:CreateMyGroup( groupParams )

	if self.myGroupInfo ~= nil then
		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: already have my group" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: still waiting for another request" )
		return
	end

	if type( groupParams ) ~= "table" then
		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: invalid type of the 1-st parameter (\"groupParams\"); \"table\" expected, got \"%s\"", type( groupParams ) )
		return
	end
	
	if type( groupParams.activityType ) ~= "number" then
		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: invalid type of groupParams.activityType; \"number\" expected, got \"%s\"", type( groupParams.activityType ) )
		return
	end

	if groupParams.activityType == self.ACTIVITY_TYPE_ALL then
		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: invalid groupParams.activityType: %d", groupParams.activityType )
		return
	end

	if groupParams.minRank ~= nil then
    	if type( groupParams.minRank ) ~= "number" then
    		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: invalid type of groupParams.minRank; \"number\" or \"nil\" expected, got \"%s\"", type( groupParams.minRank ) )
    		return
    	end
	end

	if groupParams.message ~= nil then
    	if type( groupParams.message ) ~= "string" then
    		sys.log( "UI.SquadFinder:CreateMyGroup()[ERROR]: invalid type of groupParams.message; \"string\" or \"nil\" expected, got \"%s\"", type( groupParams.message ) )
    		return
    	end
	end

	self.requestId_createMyGroup = _G.MasterServer_LobbyGroupCreate( groupParams )

	if self.requestId_createMyGroup == 0 then
		self:ShowMsgOnCreateMyGroupError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


-- удалить группу, владельцем которой я являюсь 
function UI.SquadFinder:DeleteMyGroup()

	if self.myGroupInfo == nil then
		sys.log( "UI.SquadFinder:DeleteMyGroup()[ERROR]: no my group" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:DeleteMyGroup()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_deleteMyGroup = _G.MasterServer_LobbyGroupDelete()

	if self.requestId_deleteMyGroup == 0 then
		self:ShowMsgOnDeleteMyGroupError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


-- изменить текстовое описание своей группы
function UI.SquadFinder:EditMyGroup( desc )

	if self.myGroupInfo == nil then
		sys.log( "UI.SquadFinder:EditMyGroup()[ERROR]: no my group" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:EditMyGroup()[ERROR]: still waiting for another request" )
		return
	end

	if type( desc ) ~= "string" then
		sys.log( "UI.SquadFinder:EditMyGroup()[ERROR]: invalid type of the 1-st parameter (\"desc\"); \"string\" expected, got \"%s\"", type( desc ) )
		return
	end

	self.requestId_editMyGroup = _G.MasterServer_LobbyGroupModify( desc )

	if self.requestId_editMyGroup == 0 then
		self:ShowMsgOnEditMyGroupError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


-- одобрить заявку другого игрока на присоединение к моей группе и выслать ему приглашение
function UI.SquadFinder:ApproveJoin( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.SquadFinder:ApproveJoin()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if self.myGroupInfo == nil then
		sys.log( "UI.SquadFinder:ApproveJoin()[ERROR]: no my group" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:ApproveJoin()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_squadInviteSend = _G.MasterServer_SquadInviteSend( uid, true )

	if self.requestId_squadInviteSend ~= 0 then
		self.bWaitingMyGroupInfo = true		-- должны прийти новые данные группы - там будет выставлен флаг, что этот игрок был приглашен; во время ожидания этих данных также показываем крутяшку
	else
		self:ShowMsgOnSquadInviteSendError( _G.MasterServer.SquadOpResult.SOR_ERROR )
	end

	self:UpdateWaiting()

end


-- отвергнуть заявку другого игрока на присоединение к моей группе
function UI.SquadFinder:RejectJoin( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.SquadFinder:RejectJoin()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if self.myGroupInfo == nil then
		sys.log( "UI.SquadFinder:RejectJoin()[ERROR]: no my group" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.SquadFinder:RejectJoin()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_rejectJoin = _G.MasterServer_LobbyGroupJoinReqReject( uid )

	if self.requestId_rejectJoin == 0 then
		self:ShowMsgOnRejectJoinError( _G.MasterServer.LobbyOpResult.LOR_ERROR )
	end

	self:UpdateWaiting()

end


--
function UI.SquadFinder:IsWaiting()

	return self.bWaiting

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupList( result, requestId, param1, param2, u64Param )

	if requestId ~= self.requestId_groups then
		return
	end

	if result == 0 then
		self:UpdateGroups( self.groupsRequestedFilter )
		UI.HangarWnd:SquadFinder_OnGroupsRequest()
	else
		self:ShowMsgOnRequestGroupsError()
	end

	self.requestId_groups		= 0
	self.groupsRequestedFilter	= nil
	self:UpdateWaiting()

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCreate( result, requestId, param1, param2, u64Param )

	local gid = param1

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then		

		for idx, groupInfo in pairs( self.groups ) do

			if groupInfo.gid == gid then

				local groupInfo_new = _G.MasterServer_GetLobbyGroup( gid )

				if self:IsGroupInfoValid( groupInfo_new ) then
					UI:CopyTable( groupInfo_new, self.groups[ idx ] )	-- окна могут хранить ссылку на таблицу группы, поэтому не делается присваиваине новой таблицы
					UI.HangarWnd:SquadFinder_OnJoined( gid )
				else
					sys.log( "UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCreate()[ERROR]: invalid group data format" )
				end

				break

			end

		end

	else

		if requestId == self.requestId_join then
			self:ShowMsgOnJoinError( result )
		end

		-- отдельного сообщения о том, что группа была удалена, не приходит, используется косвенный - если она не найдена при попытке присоединения
		if result == _G.MasterServer.LobbyOpResult.LOR_NOT_FOUND then

    		for idx, groupInfo in pairs( self.groups ) do

    			if groupInfo.gid == gid then

					groupInfo.bDeleted = true	-- группа не удаляется, т.к. ее еще надо показывать до полного обновления списка
					UI.HangarWnd:SquadFinder_OnGroupDeleted( gid )

    				break

    			end

    		end

		end
		
	end

	if requestId == self.requestId_join then
		self.requestId_join = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCancel( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then		

		local gid = param1

		for idx, groupInfo in pairs( self.groups ) do

			if groupInfo.gid == gid then

				local groupInfo_new = _G.MasterServer_GetLobbyGroup( gid )

				if self:IsGroupInfoValid( groupInfo_new ) then
					UI:CopyTable( groupInfo_new, self.groups[ idx ] )	-- окна могут хранить ссылку на таблицу группы, поэтому не делается присваиваине новой таблицы
					UI.HangarWnd:SquadFinder_OnCancelMyJoin( gid )
				else
					sys.log( "UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCancel()[ERROR]: invalid group data format" )
				end

				break

			end

		end

	else

		if requestId == self.requestId_cancelMyJoin then
			self:ShowMsgOnCancelMyJoinError( result )
		end

	end

	if requestId == self.requestId_cancelMyJoin then
		self.requestId_cancelMyJoin = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupUpdated( gid )

	for idx, groupInfo in pairs( self.groups ) do

		if groupInfo.gid == gid then

			local groupInfo_new = _G.MasterServer_GetLobbyGroup( gid )

			if self:IsGroupInfoValid( groupInfo_new ) then
				UI:CopyTable( groupInfo_new, self.groups[ idx ] )	-- окна могут хранить ссылку на таблицу группы, поэтому не делается присваиваине новой таблицы
				UI.HangarWnd:SquadFinder_OnGroupChanged( gid )
			else
				sys.log( "UI.SquadFinder:MasterServer_OnLobbyGroupUpdated()[ERROR]: invalid group data format" )
			end
			
			break

		end

	end

end


--
function UI.SquadFinder:OnNewFrame( dt_sys, dt_game )

	if self.groupsRequestTimer ~= -1 then
		self:UpdateGroupsRequestTimer( dt_sys )
	end	

end


--
function UI.SquadFinder:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupInfo( result, requestId, param1, param2, u64Param )

	if self.bWaitingMyGroupInfo then
		self.bWaitingMyGroupInfo = false
		self:UpdateWaiting()
	end

	if result ~= 0 then
		return
	end

	self:UpdateMyGroup()
	UI.HangarWnd:SquadFinder_OnMyGroupChanged()

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupDelete( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then		

		self.myGroupInfo = nil
		UI.HangarWnd:SquadFinder_OnMyGroupDelete()

	else

		if requestId == self.requestId_deleteMyGroup then
			self:ShowMsgOnDeleteMyGroupError( result )
		end

	end

	if requestId == self.requestId_deleteMyGroup then
		self.requestId_deleteMyGroup = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnSquadInviteSend( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.SquadOpResult.SOR_OK then

		if requestId == self.requestId_squadInviteSend then

			-- ошбика показывается из uipublic.lua

			self.bWaitingMyGroupInfo = false

		end

	end

	if requestId == self.requestId_squadInviteSend then
		self.requestId_squadInviteSend = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqReject( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then

		self:UpdateMyGroup()

		local uid = u64Param
		UI.HangarWnd:SquadFinder_OnRejectJoin( uid )

	else

		if requestId == self.requestId_rejectJoin then
			self:ShowMsgOnRejectJoinError( result )
		end

	end

	if requestId == self.requestId_rejectJoin then
		self.requestId_rejectJoin = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupCreate( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then

		self:UpdateMyGroup()
		UI.HangarWnd:SquadFinder_OnMyGroupCreate()

	else

		if requestId == self.requestId_createMyGroup then
			self:ShowMsgOnCreateMyGroupError( result )
		end

	end

	if requestId == self.requestId_createMyGroup then
		self.requestId_createMyGroup = 0
		self:UpdateWaiting()
	end

end


--
function UI.SquadFinder:MasterServer_OnLobbyGroupModify( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then

		self:UpdateMyGroup()
		UI.HangarWnd:SquadFinder_OnMyGroupEdit()

	else

		if requestId == self.requestId_editMyGroup then
			self:ShowMsgOnEditMyGroupError( result )
		end

	end

	if requestId == self.requestId_editMyGroup then
		self.requestId_editMyGroup = 0
		self:UpdateWaiting()
	end

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.SquadFinder.GROUPS_REQUEST_TIME	= 2		-- [секунд]; минимальное время между запросами списка групп (исключая срочные)

UI.SquadFinder.joinStates =
{
	NONE		= 1,		-- от игрока не поступало заявки
	REGISTERED	= 2,		-- поступила заявка, но она пока ни одобрена, ни отклонена
	APPROVED	= 3,		-- заявка одобрена, игроку было выслано приглашение в сквад
	REJECTED	= 4,		-- заявка отклонена, игрока занесли в бан-лист
}

UI.SquadFinder.ACTIVITY_TYPE_ALL	= 0
UI.SquadFinder.RANK_All				= 0

-- ------------------------------------
-- vars
-- ------------------------------------

UI.SquadFinder.groups						= {}
UI.SquadFinder.groupsFilter					= nil
UI.SquadFinder.requestId_groups				= 0
UI.SquadFinder.groupsRequestedFilter		= nil
UI.SquadFinder.groupsToRequestData			= nil
UI.SquadFinder.groupsRequestTimer			= -1
UI.SquadFinder.bWaiting						= false
UI.SquadFinder.requestId_join				= 0
UI.SquadFinder.requestId_cancelMyJoin		= 0
UI.SquadFinder.myGroupInfo					= nil
UI.SquadFinder.requestId_deleteMyGroup		= 0
UI.SquadFinder.requestId_squadInviteSend	= 0
UI.SquadFinder.bWaitingMyGroupInfo			= false
UI.SquadFinder.requestId_rejectJoin			= 0
UI.SquadFinder.requestId_createMyGroup		= 0
UI.SquadFinder.requestId_editMyGroup		= 0

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.SquadFinder:Reset()

    self.groups						= {}
    self.groupsFilter				= nil
    self.requestId_groups			= 0
    self.groupsRequestedFilter		= nil
    self.groupsToRequestData		= nil
    self.groupsRequestTimer			= -1
    self.bWaiting					= false
    self.requestId_join				= 0
    self.requestId_cancelMyJoin		= 0
	self.myGroupInfo				= nil
	self.requestId_deleteMyGroup	= 0
	self.requestId_squadInviteSend	= 0
	self.bWaitingMyGroupInfo		= false
	self.requestId_rejectJoin		= 0
	self.requestId_createMyGroup	= 0
	self.requestId_editMyGroup		= 0

end


--
function UI.SquadFinder:RequestGroupsInternal( filter )

	self.groupsToRequestData	= nil
	self.groupsRequestTimer		= self.GROUPS_REQUEST_TIME
	self.groupsRequestedFilter	= filter

	local serverFilter = UI:CopyTable2( filter )
	if serverFilter.activityType == self.ACTIVITY_TYPE_ALL then
		serverFilter.activityType = nil
	end

	self.requestId_groups = _G.MasterServer_RequestLobbyGroups( serverFilter )

	if self.requestId_groups == 0 then
		self.groupsRequestedFilter = nil
		self:ShowMsgOnRequestGroupsError()
	end

	self:UpdateWaiting()

end


--
function UI.SquadFinder:CheckRequestGroupsDelayed()

	if not self.groupsToRequestData then
		return
	end

	if self:IsWaiting() or self.groupsRequestTimer ~= -1 then
		return
	end

	local filter = self:MakeGroupsFilter( self.groupsToRequestData.activityType )
	self:RequestGroupsInternal( filter )

end


--
function UI.SquadFinder:UpdateGroups( filter )

	self.groups			= {}
	self.groupsFilter	= filter

	local groups			= _G.MasterServer_GetLobbyGroups()
	local localPlayerUid	= UI:GetLocalPlayerUid()

	for idx, groupInfo in ipairs( groups ) do

		if self:IsGroupInfoValid( groupInfo ) then

			-- если игрок забанен в группе (его заявку однажды отклонили), то группа не показывается (после обновления списка)
			if self:GetPlayerJoinStateFromGroup( groupInfo, localPlayerUid ) ~= self.joinStates.REJECTED then

				groupInfo.bDeleted = false
				table.insert( self.groups, groupInfo )

			end

		else
			sys.log( "UI.SquadFinder:UpdateGroups()[ERROR]: invalid group format" )
		end

	end

end


--
function UI.SquadFinder:MakeGroupsFilter( activityType )

	return
	{
		activityType	= activityType,
	}

end


--
function UI.SquadFinder:IsGroupsFiltersEqual( filter1, filter2 )

	return
		filter1 ~= nil
		and filter2 ~= nil
		and filter1.activityType == filter2.activityType

end


--
function UI.SquadFinder:ShowMsgOnRequestGroupsError()

	UI:ShowErrorMsg( "squadFinder_error_requestGroups" )

end


--
function UI.SquadFinder:ShowMsgOnJoinError( result )

	UI:ShowErrorMsg( "squadFinder_error_join", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnCancelMyJoinError( result )

	UI:ShowErrorMsg( "squadFinder_error_cancelMyJoin", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnDeleteMyGroupError( result )

	UI:ShowErrorMsg( "squadFinder_error_deleteMyGroup", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnSquadInviteSendError( result )

	UI:ShowErrorMsg( "error_squad_INVITE_ACCEPT", result, "_G.MasterServer.SquadOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnRejectJoinError( result )

	UI:ShowErrorMsg( "squadFinder_error_rejectJoin", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnCreateMyGroupError( result )

	UI:ShowErrorMsg( "squadFinder_error_createMyGroup", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:ShowMsgOnEditMyGroupError( result )

	UI:ShowErrorMsg( "squadFinder_error_editMyGroup", result, "_G.MasterServer.LobbyOpResult" )

end


--
function UI.SquadFinder:IsGroupInfoValid( groupInfo )

	if type( groupInfo ) ~= "table" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type; \"table\" expected, got \"%s\"", type( groupInfo ) )
		return false
	end

	if type( groupInfo.gid ) ~= "number" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"gid\"; \"number\" expected, got \"%s\"", type( groupInfo.gid ) )
		return false
	end

	if type( groupInfo.owner ) ~= "userdata" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"owner\"; \"userdata\" expected, got \"%s\"", type( groupInfo.owner ) )
		return false
	end

	if type( groupInfo.message ) ~= "string" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"message\"; \"string\" expected, got \"%s\"", type( groupInfo.message ) )
		return false
	end

	if type( groupInfo.activityType ) ~= "number" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"activityType\"; \"number\" expected, got \"%s\"", type( groupInfo.activityType ) )
		return false
	end

	if groupInfo.activityType == self.ACTIVITY_TYPE_ALL then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid \"activityType\" (%d)", self.ACTIVITY_TYPE_ALL )
		return false
	end

	if type( groupInfo.minRank ) ~= "number" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"minRank\"; \"number\" expected, got \"%s\"", type( groupInfo.minRank ) )
		return false
	end

	if type( groupInfo.numPlayers ) ~= "number" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"numPlayers\"; \"number\" expected, got \"%s\"", type( groupInfo.numPlayers ) )
		return false
	end

	if type( groupInfo.joinReqs ) ~= "table" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"joinReqs\"; \"table\" expected, got \"%s\"", type( groupInfo.joinReqs ) )
		return false
	end

	for idx, joinInfo in pairs( groupInfo.joinReqs ) do

    	if type( joinInfo.uid ) ~= "userdata" then
    		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"joinReqs[%s].uid\"; \"userdata\" expected, got \"%s\"", tostring( idx ), type( joinInfo.uid ) )
    		return false
    	end

    	if type( joinInfo.invited ) ~= "boolean" then
    		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"joinReqs[%s].invited\"; \"boolean\" expected, got \"%s\"", tostring( idx ), type( joinInfo.invited ) )
    		return false
    	end

	end

	if type( groupInfo.rejectedUids ) ~= "table" then
		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"rejectedUids\"; \"table\" expected, got \"%s\"", type( groupInfo.rejectedUids ) )
		return false
	end

	for idx, uid in pairs( groupInfo.rejectedUids ) do

    	if type( uid ) ~= "userdata" then
    		sys.log( "UI.SquadFinder:IsGroupInfoValid()[ERROR]: invalid type of field \"rejectedUids[%s]\"; \"userdata\" expected, got \"%s\"", tostring( idx ), type( uid ) )
    		return false
    	end

	end

	return true

end


--
function UI.SquadFinder:UpdateWaiting()

	local bOldWaiting = self.bWaiting
	self.bWaiting = self:CheckWaiting()

	if bOldWaiting ~= self.bWaiting then
		UI.HangarWnd:SquadFinder_OnWaitingChanged()
	end

	self:CheckRequestGroupsDelayed()

end


--
function UI.SquadFinder:CheckWaiting()

	return
		self.requestId_groups ~= 0
		or self.requestId_join ~= 0
		or self.requestId_cancelMyJoin ~= 0
		or self.requestId_deleteMyGroup ~= 0
		or self.requestId_squadInviteSend ~= 0
		or self.bWaitingMyGroupInfo
		or self.requestId_rejectJoin ~= 0
		or self.requestId_createMyGroup ~= 0
		or self.requestId_editMyGroup ~= 0

end


--
function UI.SquadFinder:UpdateGroupsRequestTimer( dt )

	if self.groupsRequestTimer ~= -1 then

		self.groupsRequestTimer = self.groupsRequestTimer - dt

		if self.groupsRequestTimer <= 0 then

			self.groupsRequestTimer = -1
			self:CheckRequestGroupsDelayed()

		end

	end

end


--
function UI.SquadFinder:UpdateMyGroup()

	self.myGroupInfo = nil

	local myGroupInfo = _G.MasterServer_GetLobbyGroup()

	if self:IsGroupInfoValid( myGroupInfo ) then

		if myGroupInfo.gid ~= 0 then
			self.myGroupInfo = myGroupInfo
		end

	else
		sys.log( "UI.SquadFinder:UpdateMyGroup()[ERROR]: invalid group data format" )
	end

end