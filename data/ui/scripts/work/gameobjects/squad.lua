-- ----------------------------------------------------------------------------
--
-- Workfile: Options.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: options.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Squad then
	return
else
	UI.Squad = 
	{
		nicknameRequest = nil,
		inSquad = false,
		invites = {},
		-- Инициируется теперь в окне логина без всяких проверок
		inited = true,
		squadInfo = nil,
		invitedPlayers = nil,
		leaderUid = nil,
		requestReadyCheck = nil,
		requestReadyCheckType = 0,
		leaderCheckReadyState = nil,
		gameParams= nil,
		isWing = false
	}
end

--
function UI.Squad:Clear()
	self.nicknameRequest = nil
	self.inSquad = false
	self.invites = {}
	self.inited = false
	self.squadInfo = nil
	self.invitedPlayers = nil
	self.leaderUid = nil
	self.requestReadyCheck = nil
	self.requestReadyCheckType = 0
	self.leaderCheckReadyState = nil
	self.gameParams = nil
	self.isWing = false
end


--
function UI.Squad:AddInvite( invite )
	if self.inSquad then
		return
	end

	-- лидер приглашающей группы мог приглашение отменить, а потом снова добавить;
	-- в этом случае второй раз в список не добавляется
	-- (проверка идет только по номеру сквада, т.к. лидер мог поменяться)

	for idx, inviteInfo in pairs( self.invites ) do
		if inviteInfo.squad == invite.squad then
			return
		end
	end

	local nickName, bCached, requestId = _G.MasterServer_GetNickName( invite.uid )
	if not bCached then
		self.nicknameRequest = requestId
	else
		invite.nickname = nickName
	end
	UI.Squad.invites[ #UI.Squad.invites + 1 ] = invite
end


--
function UI.Squad:RemoveInvite( squad )

	for idx, inviteInfo in pairs( self.invites ) do

		if inviteInfo.squad == squad then

			table.remove( self.invites, idx )

			if idx == 1 then
				UI.HangarWnd:OnSquadInviteRemove()
			end

			break

		end

	end

end


--
function UI.Squad:AcceptCurInvite()
	local squad = UI.Squad.invites[ 1 ].squad
	table.remove( UI.Squad.invites, 1 )
	if UI.HudWnd and UI.HudWnd:IsOnScreen() and _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
		_G.CL_RequestAcceptSquadInvite( squad )
	else
		_G.MasterServer_SquadInviteAccept( squad )
	end
end

--
function UI.Squad:RejectCurInvite()
	local squad = UI.Squad.invites[ 1 ].squad
	table.remove( UI.Squad.invites, 1 )
	_G.MasterServer_SquadInviteDecline( squad )
end

--
function UI.Squad:GetInvite()
	if self.inSquad then
		return
	end
	if next( UI.Squad.invites ) then
		if UI.Squad.invites[ 1 ].nickname ~= nil then
			return UI.Squad.invites[ 1 ]
		else
			if not self.nicknameRequest then
				local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.invites[ 1 ].uid )
				if not bCached then
					self.nicknameRequest = requestId
				else
					-- обработаемся на следующем кадре
					self.invites[ 1 ].nickname = nickName
				end
			end
		end
	end
	return nil
end

--
function UI.Squad:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	if self.nicknameRequest == requestId then
		self.nicknameRequest = nil 
		if not nickName or result ~= 0 then
			return
		end
		for i = 1, #self.invites do
			if self.invites[ i ].uid == uid then
				self.invites[ i ].nickName = nickName
			end
		end
	end
	if not nickName or result ~= 0 then
		return
	end
	if self.inSquad then

		local add = false

		if self.squadInfo then
			for i = 1, #self.squadInfo do
				if self.squadInfo[ i ].uid == uid then
					self.squadInfo[ i ].nickname = nickName
					add = true
				end
			end
		end

		if self.invitedPlayers then
			for i = 1, #self.invitedPlayers do
				if self.invitedPlayers[ i ].uid == uid then
					self.invitedPlayers[ i ].nickname = nickName
					add = true
				end
			end
		end

		if add then
			UI.SquadWnd:Reload()
		end

	end
end

--
function UI.Squad:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		return
	end
	if field == MasterServer.UserProfileField.UPF_STATE then
		if self.squadInfo then 
			for i = 1, #self.squadInfo do
				if self.squadInfo[ i ].uid == uid then
					local profile = _G.MasterServer_UserProfileGet( uid )
					if profile and profile.state then
            			self.squadInfo[ i ].offlineStatus = profile.state
        			else
        				self.squadInfo[ i ].offlineStatus = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
        			end
					UI.SquadWnd:Reload()
					return
				end
			end
		end

		if self.invitedPlayers then 
			for i = 1, #self.invitedPlayers do
				if self.invitedPlayers[ i ].uid == uid then
					local profile = _G.MasterServer_UserProfileGet( uid )
					if profile and profile.state then
						self.invitedPlayers[ i ].offlineStatus= profile.state
        			else
        				self.squadInfo[ i ].offlineStatus = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
        			end
					UI.SquadWnd:Reload()
					return
				end
			end
		end
	end
end

--
function UI.Squad:ReloadSquadList()

	local bInSquadOld = self.inSquad

	local list = _G.MasterServer_GetSquadInfo()
	local isBeInSquad = self.inSquad
	self.inSquad = false
	self.leaderUid = nil
	if list.inSquad then
		self.inSquad = true
		self.leaderUid = list.squadInfo.leader
		self.squadInfo = UI:CopyTable2( list.squadInfo.pilots )
		self.squadId = list.squadInfo.id
		self.isWing = list.squadInfo.isWing or false
		for i = 1, #self.squadInfo do
			local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.squadInfo[ i ].uid )
			self.squadInfo[ i ].nickname = nickName
			_G.MasterServer_UserProfileRequestField( self.squadInfo[ i ].uid, MasterServer.UserProfileField.UPF_STATE )
			local profile = _G.MasterServer_UserProfileGet( self.squadInfo[ i ].uid )
			if profile and profile.state then
				self.squadInfo[ i ].offlineStatus = profile.state
			else
				self.squadInfo[ i ].offlineStatus = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
			end
			self.squadInfo[ i ].readyCheckStatus = self.squadInfo[ i ].ready
			self.squadInfo[ i ].status = nil
		end

		self.invitedPlayers = {}

		for invitedIdx, invitedUid in ipairs( list.squadInfo.invites ) do

			local invitedInfo = { uid = invitedUid }
			table.insert( self.invitedPlayers, invitedInfo )

			local nickName, bCached, requestId = _G.MasterServer_GetNickName( invitedUid )
			invitedInfo.nickname = nickName

			_G.MasterServer_UserProfileRequestField( invitedUid, MasterServer.UserProfileField.UPF_STATE )
			local profile = _G.MasterServer_UserProfileGet( invitedUid )

			if profile and profile.state then
				invitedInfo.offlineStatus = profile.state
			else
				invitedInfo.offlineStatus = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
			end

		end

	end

	local bSquadCreate = not bInSquadOld and self.inSquad
	UI.SquadWnd:Reload( bSquadCreate )
	if isBeInSquad ~= self.inSquad then
		if self.inSquad then
			UI.Chat:AddSquadTab()
		else
			UI.Chat:RemoveSquadTab()
		end
	end
	UI.HangarWnd:OnSquadDataChanged()
end

--
function UI.Squad:IsInSquad()
	return self.inSquad
end

--
function UI.Squad:GetSquadId()
	return self.squadId
end

--
function UI.Squad:GetLeaderUid()
	if self.inSquad and self.leaderUid then
		return self.leaderUid
	end
	return nil
end

--
function UI.Squad:IsLeader()
	return self:GetLeaderUid() == _G.MasterServer_GetLocalUserId()
end

--
function UI.Squad:GetPilotsCount()
	if self.inSquad and self.squadInfo then
		return #self.squadInfo
	end
	return nil
end

--
function UI.Squad:GetPilotsInfo( index )
	if self.inSquad and self.squadInfo and self.squadInfo[ index ] then
		return self.squadInfo[ index ]
	end
	return nil
end

--
function UI.Squad:InSquad( uid )
	if self.inSquad and self.squadInfo then
		for i = 1, #self.squadInfo do
			if self.squadInfo[ i ].uid == uid then
				return true
			end
		end
	end
	return false
end


--
function UI.Squad:GetInvitedPlayersCount()
	if self.inSquad and self.invitedPlayers then
		return #self.invitedPlayers
	end
	return 0
end


--
function UI.Squad:GetInvitedPlayerInfo( index )
	if self.inSquad and self.invitedPlayers and self.invitedPlayers[ index ] then
		return self.invitedPlayers[ index ]
	end
	return nil
end


--
function UI.Squad:IsPlayerInvited( uid )
	if self.inSquad and self.invitedPlayers then
		for i = 1, #self.invitedPlayers do
			if self.invitedPlayers[ i ].uid == uid then
				return true
			end
		end
	end
	return false
end


--
function UI.Squad:Kick( uid )
	_G.MasterServer_SquadKick( uid )
	self:CheckReadyCancel()
	--self:LeaderFinishCheckReady()
end

--
function UI.Squad:IsWing()
	return self.isWing or false
end

--
function UI.Squad:ReadyCheckIsAllReady()
	for k, v in pairs( self.squadInfo ) do
		if v.readyCheckStatus ~= 1 then
			return false
		end
	end
	return true
end

--
function UI.Squad:CheckReadyLeaderStart( checkReadyType, gameParams )
	if self:IsInSquad() and self:IsLeader() and UI.Squad:GetPilotsCount() > 1 then
		if not self.readyCheckOngoing then
			self.readyCheckOngoing = true
			self.gameParams = gameParams
			_G.MasterServer_SquadReady( true, checkReadyType )
		end
	else
		sys.log( "UI.Squad:CheckReadyLeaderStart()[ERROR]: not in squad or not squad leader or num pilots in squad is 1." )
	end
end

--
function UI.Squad:CheckReadyCancel()
	if self:IsInSquad() then
		self.readyCheckOngoing = false
		self.readyCheckRequested = false
		self.gameParams = nil
		self.readyCheckType = nil
	else
		sys.log( "UI.Squad:CheckReadyCancel()[ERROR]: not in squad or not squad leader." )
	end
end

--
function UI.Squad:CheckReadyUpdate( result, requestId, param1, param2 )
	if result == 0 then
		self:ReloadSquadList()
		self:ReadyCheckTryToStart()
		if self:ReadyCheckIsAllReady() then
			UI.SquadWnd:ClearStatusLabel()
		end
	else
		self.readyCheckOngoing = false
	end
	UI.SquadWnd:Reload()
end

--
function UI.Squad:CheckReadyFail( uid )
	--if self.readyCheckRequested or self.readyCheckOngoing then
		for k, v in pairs( self.squadInfo ) do
			if v.uid == uid then
				v.readyCheckStatus = -1
			end
		end
	--end
	self:CheckReadyCancel()
	UI.SquadWnd:ClearStatusLabel()
	UI.SquadWnd:Reload()
	UI.HangarWnd:OnCheckReadyFail()
end

--
function UI.Squad:ReadyCheckTryToStart()
	if self.readyCheckOngoing and self:IsLeader() then
		if self:ReadyCheckIsAllReady() then
			self.readyCheckOngoing = false
			local gameParams = self.gameParams
			self.gameParams = nil
			UI.HangarWnd:CheckStartMatchMaking( nil, gameParams )
		end
	end
end

--
function UI.Squad:ReadyCheckRequested( checkReadyType )
	self.readyCheckType = checkReadyType
	self.readyCheckRequested = true
	UI.Squad:ReloadSquadList()
end

--
function UI.Squad:IsReadyCheckRequestExist()
	if self.readyCheckRequested then
		return true, self.readyCheckType
	end
end

--
function UI.Squad:IsReadyCheck()
	return self.readyCheckOngoing or self.readyCheckRequested
end

--
function UI.Squad:ReadyCheckAccept()
	self.readyCheckRequested = false
	_G.MasterServer_SquadReady( true, 1 )
end

--
function UI.Squad:ReadyCheckReject()
	self.readyCheckRequested = false
	_G.MasterServer_SquadReady( false, 1 )
end

--
function UI.Squad:IsReadyCheckNeedShowStatus()
	for k, v in pairs( self.squadInfo ) do
		if v.readyCheckStatus ~= 0 or ( self.readyCheckOngoing and v.offlineStatus == _G.MasterServer.UserState.USER_STATE_OFFLINE ) then
			return true
		end
	end
	return false
end


--
function UI.Squad:IsLeaderDoingReadyCheck()

	return self.readyCheckOngoing

end


--
function UI.Squad:LeaderCancelReady()

	if not self:IsInSquad() or not self:IsLeader() then
		return
	end

	if self.squadInfo then

		local bLeaderReady = false
		local bWasReadyCheckFail = false 

		for idx, pilotInfo in pairs( self.squadInfo ) do

			if pilotInfo.uid == self.leaderUid and pilotInfo.readyCheckStatus == 1 then
				bLeaderReady = true
			end

    		-- если хотя бы один из пилотов имеет статус редичека -1 (отказался), это значит, что на самом деле
    		-- в cpp редичек считается законченным, и у всех игроков на самом деле статус 0; "-1" - это чисто интерфейсное значение;
    		-- после отказа данные в ui умышленно не обновляются в течение нескольких секунд (чтобы показать именно отказ)

			if pilotInfo.readyCheckStatus == -1 then
				bWasReadyCheckFail = true
			end

		end

		if bLeaderReady and not bWasReadyCheckFail then
			_G.MasterServer_SquadReady( false, 1 )
		end

	end

end