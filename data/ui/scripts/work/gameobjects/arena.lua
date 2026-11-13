-- --------------------------------------------------------------------------
-- UI.Arena
-- --------------------------------------------------------------------------

if UI.Arena then
	return
end

UI.Arena = {}

-- -----------------------
-- interface funcitons
-- -----------------------

--
function UI.Arena:IsInited()

	return self.data ~= nil

end


--
function UI.Arena:IsInTeam()

	return self.data ~= nil and self.data.ltid ~= UI.INVALID_U64_ID

end


--
function UI.Arena:GetTeamName()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetTeamName()[ERROR]: not in team" )
		return ""
	end

	return self.data.externalName

end


--
function UI.Arena:GetTeamId()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetTeamId()[ERROR]: not in team" )
		return UI.INVALID_U64_ID
	end

	return self.data.ltid

end


--
function UI.Arena:IsTeamMajor()

	local bMajor = false

	if not self:IsInTeam() then
		sys.log( "UI.Arena:IsTeamMajor()[ERROR]: not in team" )
		return bMajor
	end

	if type( self.data.major ) == "boolean" then
		bMajor = self.data.major
	else
		sys.log( "UI.Arena:IsTeamMajor() invalid type of field \"major\" in team data; \"boolean\" expected, got \"%s\"", type( self.data.major ) )
	end

	return bMajor

end


--
function UI.Arena:GetNumPlayers( bIncludeInvited )

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetNumPlayers()[ERROR]: not in team" )
		return 0
	end

	if bIncludeInvited ~= nil then
		if type( bIncludeInvited ) ~= "boolean" then
			sys.log( "UI.Arena:GetPlayers()[ERROR]: invalid type of the 1-st parameter (\"bIncludeInvited\"); \"boolean\" expected, got \"%s\"", type( bIncludeInvited ) )
			bIncludeInvited = nil
		end
	end

	if bIncludeInvited == nil then
		bIncludeInvited = false
	end

	if bIncludeInvited and not self:IsLeader() then
		sys.log( "UI.Arena:GetPlayers()[ERROR]: not leader, cannot be invited players" )
		bIncludeInvitedand = false
	end

	local numPlayers = 0

	if bIncludeInvited then
		numPlayers = #self.players
	else
        for playerIdx, playerInfo in ipairs( self.players ) do
        	if not playerInfo.bInvited then
        		numPlayers = numPlayers + 1
        	end
        end
	end

	return numPlayers

end


--
function UI.Arena:GetMaxNumPlayers()

	local maxNumPlayers = 0

	if type( _G.LeagueTeamSettings ) == "table" then

		if type( _G.LeagueTeamSettings.max_team_size ) == "number" then
			maxNumPlayers = _G.LeagueTeamSettings.max_team_size
		else
			sys.log( "UI.Arena:GetMaxNumPlayers()[ERROR]: invalid type of \"_G.LeagueTeamSettings.max_team_size\"; \"number\" expected, got \"%s\"", type( _G.LeagueTeamSettings.max_team_size ) )
		end

	else
		sys.log( "UI.Arena:GetMaxNumPlayers()[ERROR]: invalid type of \"_G.LeagueTeamSettings\"; \"table\" expected, got \"%s\"", type( _G.LeagueTeamSettings ) )
	end

	return maxNumPlayers

end


--
function UI.Arena:GetPlayers( bIncludeInvited )

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetPlayers()[ERROR]: not in team" )
		return {}
	end

	if bIncludeInvited ~= nil then
		if type( bIncludeInvited ) ~= "boolean" then
			sys.log( "UI.Arena:GetPlayers()[ERROR]: invalid type of the 1-st parameter (\"bIncludeInvited\"); \"boolean\" expected, got \"%s\"", type( bIncludeInvited ) )
			bIncludeInvited = nil
		end
	end

	if bIncludeInvited == nil then
		bIncludeInvited = false
	end

	if bIncludeInvited and not self:IsLeader() then
		sys.log( "UI.Arena:GetPlayers()[ERROR]: not leader, cannot be invited players" )
		bIncludeInvitedand = false
	end

	local players = nil

	if bIncludeInvited then
		players = self.players
	else
		players = {}

		for playerIdx, playerInfo in ipairs( self.players ) do
			if not playerInfo.bInvited then
				table.insert( players, playerInfo )
			end
		end
	end

	return players

end


--
function UI.Arena:GetLeader()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetLeader()[ERROR]: not in team" )
		return UI.INVALID_U64_ID
	end

	return self.data.ownerUid

end


--
function UI.Arena:IsLeader()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:IsLeader()[ERROR]: not in team" )
		return false
	end

	return self:GetLeader() == UI:GetLocalPlayerUid()

end


--
function UI.Arena:GetLeftInviteAttempts()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetLeftInviteAttempts()[ERROR]: not in team" )
		return 0
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:GetPlayers()[ERROR]: not leader" )
		return 0
	end

	local numAttempts = self.data.numAcceptedMembers
	local maxAttempts = self:GetMaxInviteAttempts( self:IsTeamMajor() )

	return math.max( maxAttempts - numAttempts, 0 )

end


--
function UI.Arena:GetMaxInviteAttempts( bMajor )

	local maxAttempts = 0

	if type( bMajor ) ~= "boolean" then
		sys.log( "UI.Arena:GetMaxInviteAttempts()[ERROR]: invalid type of the 1-st parameter (\"bMajor\"); \"boolean\" expected, got \"%s\"", type( bMajor ) )
		return maxAttempts
	end

	if type( _G.LeagueTeamSettings ) == "table" then

		local fieldName	= bMajor and "max_num_accepted_members_for_major" or "max_num_accepted_members"
		local val		= _G.LeagueTeamSettings[ fieldName ]

		if type( val ) == "number" then
			maxAttempts = val
		else
			sys.log( "UI.Arena:GetMaxInviteAttempts()[ERROR]: invalid type of \"_G.LeagueTeamSettings.%s\"; \"number\" expected, got \"%s\"", fieldName, type( val ) )
		end

	else
		sys.log( "UI.Arena:GetMaxInviteAttempts()[ERROR]: invalid type of \"_G.LeagueTeamSettings\"; \"table\" expected, got \"%s\"", type( _G.LeagueTeamSettings ) )
	end

	return maxAttempts

end


--
function UI.Arena:GetNumBattles()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetNumBattles()[ERROR]: not in team" )
		return 0
	end

	return self.data.gameTotal

end


--
function UI.Arena:GetNumWins()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetNumWins()[ERROR]: not in team" )
		return 0
	end

	return self.data.winTotal

end


--
function UI.Arena:GetRaiting()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetRaiting()[ERROR]: not in team" )
		return 0
	end

	return self.data.rating

end


--
function UI.Arena:IsWaitingRequests()

	return
		self.createTeamRequestId ~= 0
		or self.leaveTeamRequestId ~= 0
		or next( self.inviteRequests ) ~= nil
		or next( self.cancelInviteRequests ) ~= nil
		or self.acceptInviteToMeRequestId ~= 0
		or self.declineInviteToMeRequestId ~= 0
		or next( self.kickRequests ) ~= nil

end


--
function UI.Arena:CreateTeam( teamName )

	if type( teamName ) ~= "string" then
		sys.log( "UI.Arena:CreateTeam()[ERROR]: invalid type of the 1-st parameter (\"teamName\"); \"string\" expected, got \"%s\"", type( teamName ) )
		return
	end

	if self:IsInTeam() then
		sys.log( "UI.Arena:CreateTeam()[ERROR]: already in team" )
		return
	end

	if self.createTeamRequestId ~= 0 then
		return
	end

	self.createTeamRequestId = _G.MasterServer_LeagueTeamCreate( teamName )

	if self.createTeamRequestId == 0 then
		self:ShowMsgOnCreateTeamError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

end


--
function UI.Arena:DisbandTeam()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:DisbandTeam()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:DisbandTeam()[ERROR]: not leader" )
		return
	end

	if self.leaveTeamRequestId ~= 0 then
		return
	end

	if self.hMsgDisband == UI.INVALID_UI_HANDLE then
		self.hMsgDisband = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "arena_disbandTeamConfirm" ), UI.MBS_YES_NO  )
	end

end


--
function UI.Arena:Leave()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:Leave()[ERROR]: not in team" )
		return
	end

	if self:IsLeader() then
		sys.log( "UI.Arena:Leave()[ERROR]: is leader" )
		return
	end

	if self.leaveTeamRequestId ~= 0 then
		return
	end

	if self.hMsgLeave == UI.INVALID_UI_HANDLE then
		local text = self:IsTeamMajor() and UI:GetStringByName( "arena_leaveConfirm_major" ) or UI:GetStringByName( "arena_leaveConfirm" )
		self.hMsgLeave = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), text, UI.MBS_YES_NO  )
	end

end


--
function UI.Arena:InvitePlayer( uid, isBot )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:InvitePlayer()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end
	
	if isBot ~= nil then
		if type( isBot ) ~= "boolean" then
			sys.log( "UI.Arena:InvitePlayer()[ERROR]: invalid type of the 1-st parameter (\"isBot\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( isBot ) )
			isBot = nil
		end
	end
	
	if isBot == nil then
		isBot = false
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:InvitePlayer()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:InvitePlayer()[ERROR]: not leader" )
		return
	end

	if self:IsPlayerMember( uid ) then
		sys.log( "UI.Arena:InvitePlayer()[ERROR]: already member" )
		return
	end

	if self:IsPlayerInvited( uid ) then
		sys.log( "UI.Arena:InvitePlayer()[ERROR]: already invited" )
		return
	end

	local bRequestFound = false
	for requestIdx, requestInfo in pairs( self.inviteRequests ) do
		if requestInfo.uid == uid then
			bRequestFound = true
			break
		end
	end

	if bRequestFound then
		return
	end

	local msgFound = false
	for msgIdx, msgInfo in pairs( self.inviteMsgs ) do
		if msgInfo.uid == uid and msgInfo.isBot == isBot then
			msgFound = true
			break
		end
	end

	if not msgFound then

		local text = self:MakeInviteMsgText( uid )
		local hMsg = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), text, UI.MBS_YES_NO  )

		local msgInfo =
		{
			hMsg	= hMsg,
			uid		= uid,
			isBot	= isBot,
		}
		table.insert( self.inviteMsgs, msgInfo )
		
	end

end


--
function UI.Arena:CancelInvitePlayer( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:CancelInvitePlayer()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:CancelInvitePlayer()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:CancelInvitePlayer()[ERROR]: not leader" )
		return
	end

	if not self:IsPlayerInvited( uid ) then
		sys.log( "UI.Arena:CancelInvitePlayer()[ERROR]: not invited" )
		return
	end

	local bRequestFound = false
	for requestIdx, requestInfo in pairs( self.cancelInviteRequests ) do
		if requestInfo.uid == uid then
			bRequestFound = true
			break
		end
	end

	if bRequestFound then
		return
	end

	local requestId = _G.MasterServer_LeagueTeamInviteCancel( uid )

	if requestId ~= 0 then

		local requestInfo =
		{
			requestId	= requestId,
			uid			= uid,
		}
		table.insert( self.cancelInviteRequests, requestInfo )

	else
		self:ShowMsgOnCancelInvitePlayerError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

end


--
function UI.Arena:KickPlayer( uid, isBot )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:KickPlayer()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end
	
	if isBot ~= nil then
		if type( isBot ) ~= "boolean" then
			sys.log( "UI.Arena:KickPlayer()[ERROR]: invalid type of the 1-st parameter (\"isBot\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( isBot ) )
			isBot = nil
		end
	end
	
	if isBot == nil then
		isBot = false
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:KickPlayer()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:KickPlayer()[ERROR]: not leader" )
		return
	end

	if not self:IsPlayerMember( uid ) then
		sys.log( "UI.Arena:KickPlayer()[ERROR]: not member" )
		return
	end

	local bRequestFound = false
	for requestIdx, requestInfo in pairs( self.kickRequests ) do
		if requestInfo.uid == uid then
			bRequestFound = true
			break
		end
	end

	if bRequestFound then
		return
	end

	local msgFound = false
	for msgIdx, msgInfo in pairs( self.kickMsgs ) do
		if msgInfo.uid == uid and msgInfo.isBot == isBot then
			msgFound = true
			break
		end
	end

	if not msgFound then

		local text = self:MakeKickMsgText( uid )
		local hMsg = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), text, UI.MBS_YES_NO  )

		local msgInfo =
		{
			hMsg	= hMsg,
			uid		= uid,
			isBot	= isBot,
		}
		table.insert( self.kickMsgs, msgInfo )
		
	end

end


--
function UI.Arena:GetPlayerInfo( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:GetPlayerInfo()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return nil
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetPlayerInfo()[ERROR]: not in team" )
		return nil
	end

	for playerIdx, playerInfo in pairs( self.players ) do
		if playerInfo.uid == uid then
			return playerInfo
		end
	end

	return nil

end


--
function UI.Arena:IsPlayerMember( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:IsPlayerMember()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return false
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:IsPlayerMember()[ERROR]: not in team" )
		return nil
	end

	local playerInfo = self:GetPlayerInfo( uid )
	return playerInfo ~= nil and not playerInfo.bInvited

end


--
function UI.Arena:IsPlayerInvited( uid )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Arena:IsPlayerInvited()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return false
	end

	if not self:IsInTeam() then
		sys.log( "UI.Arena:IsPlayerInvited()[ERROR]: not in team" )
		return nil
	end

	local playerInfo = self:GetPlayerInfo( uid )
	return playerInfo ~= nil and playerInfo.bInvited

end


--
function UI.Arena:CheckShowInviteToMeMsg()

	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then
		return true
	end

	if not next( self.invitesToMe ) then
		return false
	end

	local firstInviteInfo = self.invitesToMe[ 1 ]

	local text = self:MakeInviteToMeMsgText( firstInviteInfo.uid )
	self.hMsgInviteToMe = UI:MessageBox( UI:GetStringByName( "arena_inviteMe_caption" ), text, UI.MBS_YES_NO  )

	self.shownInviteToMeInfo = firstInviteInfo

	return true

end


--
function UI.Arena:GetRequiredRank()

	-- #0056012,комм.(0225310),(0225385) - min_ship_rank

	local rank = -1

	if type( _G.LeagueTeamSettings ) == "table" then

		if type( _G.LeagueTeamSettings.min_ship_rank ) == "number" then
			rank = _G.LeagueTeamSettings.min_ship_rank
		else
			sys.log( "UI.Arena:GetRequiredRank()[ERROR]: invalid type of \"_G.LeagueTeamSettings.min_ship_rank\"; \"number\" expected, got \"%s\"", type( _G.LeagueTeamSettings.min_ship_rank ) )
		end

	else
		sys.log( "UI.Arena:GetRequiredRank()[ERROR]: invalid type of \"_G.LeagueTeamSettings\"; \"table\" expected, got \"%s\"", type( _G.LeagueTeamSettings ) )
	end

	return rank	

end


--
function UI.Arena:GetBanEndTime()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:GetBanEndTime()[ERROR]: not in team" )
		return UI.INVALID_U64_ID
	end

	if type( self.data.banTill ) == "userdata" then
		return self.data.banTill
	else
		return UI.INVALID_U64_ID
	end

end


-- секунды c начала дня в локальном времени; сортированы по возрастанию
function UI.Arena:GetBattleActivationTimes()

	local times = {}

	if type( _G.LeagueTeamSettings ) == "table" then

		if type( _G.LeagueTeamSettings.active_time ) == "table" then

			local timeDiff_msec = _G.MasterServer_ServerTimeToLocalTime( u64( 0, 0 ) )

			-- нивелирование погрешности
			local timeDiff_min = UI:Round( timeDiff_msec.l / 1000 / 60 )

			for periodIdx, periodInfo in pairs( _G.LeagueTeamSettings.active_time ) do

				if type( periodInfo ) == "string" then

					-- начальное и конечное время записано как одна строка вида "3-5"
					local startTime_server_hours = string.match( periodInfo,"^%s*(%d+)%s*%-%s*%d+%s*$" )

					if startTime_server_hours then

						local startTime_local_min = startTime_server_hours * 60 + timeDiff_min

						local minsInDay = 24 * 60
						startTime_local_min = math.fmod( minsInDay + startTime_local_min, minsInDay )

						table.insert( times, startTime_local_min * 60 )

					else
						sys.log( "UI.Arena:GetBattleActivationTimes()[ERROR]: invalid format of time (\"%s\") in _G.LeagueTeamSettings.active_time[%s]", tostring( periodIdx ) )
					end

				else
					sys.log( "UI.Arena:GetBattleActivationTimes()[ERROR]: invalid type of \"_G.LeagueTeamSettings.active_time[%s]\"; \"string\" expected, got \"%s\"", tostring( periodIdx ), type( periodInfo ) )
				end

			end

		else
			sys.log( "UI.Arena:GetBattleActivationTimes()[ERROR]: invalid type of \"_G.LeagueTeamSettings.active_time\"; \"table\" expected, got \"%s\"", type( _G.LeagueTeamSettings.active_time ) )
		end

	else
		sys.log( "UI.Arena:GetBattleActivationTimes()[ERROR]: invalid type of \"_G.LeagueTeamSettings\"; \"table\" expected, got \"%s\"", type( _G.LeagueTeamSettings ) )
	end

	table.sort( times )

	return times	

end


--
function UI.Arena:MasterServer_OnLeagueTeamInfo( result, requestId )

	if result ~= _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then
		return
	end

	self:UpdateData()

end


--
function UI.Arena:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsInited() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == MasterServer.UserProfileField.UPF_STATE then

    	for playerIdx, playerInfo in pairs( self.players ) do

			if playerInfo.uid == uid then
    			self:UpdatePlayerState( playerInfo, false )
				break
			end

    	end

	end

end


--
function UI.Arena:MasterServer_OnNickNameUpdate( result, requestId, uid, nickname )

	if not self:IsInited() then
		return
	end

	if result ~= 0 then
		return
	end

	for playerIdx, playerInfo in pairs( self.players ) do

		if playerInfo.uid == uid then
			self:UpdateNickname( playerInfo )
			break
		end

	end

   	for msgIdx, msgInfo in pairs( self.inviteMsgs ) do

		if msgInfo.uid == uid then

			local msgBox= UI:GetUiObjByHandleT( msgInfo.hMsg )
			if msgBox then
				local text = self:MakeInviteMsgText( msgInfo.uid )
				msgBox:SetMsg( text )
			else
				sys.log( "UI.Arena:MasterServer_OnNickNameUpdate()[ERROR]: cannot find msg box window for invite player" )
			end

			break

		end

	end

	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE and self.shownInviteToMeInfo and self.shownInviteToMeInfo.uid == uid then

		local msgBox= UI:GetUiObjByHandleT( self.hMsgInviteToMe )
		if msgBox then
			local text = self:MakeInviteToMeMsgText( self.shownInviteToMeInfo.uid )
			msgBox:SetMsg( text )
		else
			sys.log( "UI.Arena:MasterServer_OnNickNameUpdate()[ERROR]: cannot find msg box window for invite me" )
		end

	end

   	for msgIdx, msgInfo in pairs( self.kickMsgs ) do

		if msgInfo.uid == uid then

			local msgBox= UI:GetUiObjByHandleT( msgInfo.hMsg )
			if msgBox then
				local text = self:MakeKickMsgText( msgInfo.uid )
				msgBox:SetMsg( text )
			else
				sys.log( "UI.Arena:MasterServer_OnNickNameUpdate()[ERROR]: cannot find msg box window for kick" )
			end

			break

		end

	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamCreate( result, requestId, param1, param2 )

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then

		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_LOCAL_PLAYER_JOINED, { uid = UI:GetLocalPlayerUid(), ltid = self:GetTeamId(), teamName = self:GetTeamName() } )

	else
		if requestId == self.createTeamRequestId then
			self:ShowMsgOnCreateTeamError( result )
		end
	end

	if requestId == self.createTeamRequestId then
		self.createTeamRequestId = 0
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamLeave( result, requestId, param1, param2 )

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then

		local teamId	= self:GetTeamId()
		local bLeader	= self:IsLeader()
		local teamName	= self:GetTeamName()

		self:UpdateData()

		if bLeader then
			UI.Notifications:AddNotification( UI.Notifications.types.ARENA_TEAM_DISBAND, { ltid = teamId, teamName = teamName } )
		else
			UI.Notifications:AddNotification( UI.Notifications.types.ARENA_LOCAL_PLAYER_LEFT, { uid = UI:GetLocalPlayerUid(), ltid = teamId, teamName = teamName } )
		end

	else
		if requestId == self.leaveTeamRequestId then
			self:ShowMsgOnLeaveError( result )
		end
	end

	if requestId == self.leaveTeamRequestId then
		self.leaveTeamRequestId = 0
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamInviteSend( result, requestId, param1, param2 )

	local requestIdx = -1

	for idx, requestInfo in pairs( self.inviteRequests ) do
		if requestInfo.requestId == requestId then
			requestIdx = idx
			break
		end
	end

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then
		self:UpdateData()
	else
		if requestIdx ~= -1 then
			self:ShowMsgOnInvitePlayerError( result )
		end
	end

	if requestIdx ~= -1 then
		table.remove( self.inviteRequests, requestIdx )
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamInviteCancel( result, requestId, param1, param2 )

	local requestIdx = -1

	for idx, requestInfo in pairs( self.cancelInviteRequests ) do
		if requestInfo.requestId == requestId then
			requestIdx = idx
			break
		end
	end

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then
		self:UpdateData()
	else
		if requestIdx ~= -1 then
			self:ShowMsgOnCancelInvitePlayerError( result )
		end
	end

	if requestIdx ~= -1 then
		table.remove( self.cancelInviteRequests, requestIdx )
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamInviteAccept( result, requestId, param1, param2 )

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then

		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_LOCAL_PLAYER_JOINED, { uid = UI:GetLocalPlayerUid(), ltid = self:GetTeamId(), teamName = self:GetTeamName() } )

	else
		if requestId == self.acceptInviteToMeRequestId then
			self:ShowMsgOnAcceptInviteToMeError( result )
		end
	end

	if requestId == self.acceptInviteToMeRequestId then
		self.acceptInviteToMeRequestId = 0
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamInviteDecline( result, requestId, param1, param2 )

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then
		-- ничего
	else
		if requestId == self.declineInviteToMeRequestId then
			self:ShowMsgOnDeclineInviteToMeError( result )
		end
	end

	if requestId == self.declineInviteToMeRequestId then
		self.declineInviteToMeRequestId = 0
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamKick( result, requestId, param1, param2, u64Param )

	local requestIdx = -1

	for idx, requestInfo in pairs( self.kickRequests ) do
		if requestInfo.requestId == requestId then
			requestIdx = idx
			break
		end
	end

	if result == _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_OK then

		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_REMOTE_PLAYER_KICKED, { uid = u64Param, ltid = self:GetTeamId(), teamName = self:GetTeamName() } )

	else
		if requestIdx ~= -1 then
			self:ShowMsgOnKickPlayerError( result )
		end
	end

	if requestIdx ~= -1 then
		table.remove( self.kickRequests, requestIdx )
	end

end


--
function UI.Arena:MasterServer_OnLeagueTeamNotif( notificationType, teamId, fromUid, paramU64, paramInt )

	-- приходит всем кроме ушедшего; если ушел лидер, то вместо этой нотификации посылается LTEAMN_DISBAND
	if notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_LEFT then

		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_REMOTE_PLAYER_LEFT, { uid = paramU64, ltid = teamId, teamName = self:GetTeamName() } )

	-- приходит рядовым членам
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_DISBAND then

		local teamName = self:GetTeamName()
		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_TEAM_DISBAND, { ltid = teamId, teamName = teamName } )

	-- приходит тому, кого пригласили
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_INVITE_ADD then

		local toUid = paramU64
		if toUid == UI:GetLocalPlayerUid() then
			self:OnInviteToMe( teamId, fromUid )
		else
			sys.log( "UI.Arena:MasterServer_OnLeagueTeamNotif()[ERROR]: LTEAMN_INVITE_ADD - invited not me" )
		end

	-- приходит тому, кого приглашали
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_INVITE_CANCELED then

		local toUid = paramU64
		if toUid == UI:GetLocalPlayerUid() then
			self:OnInviteToMeCancelled( teamId, fromUid )
		else
			sys.log( "UI.Arena:MasterServer_OnLeagueTeamNotif()[ERROR]: LTEAMN_INVITE_CANCELED - cancelled invite no to me" )
		end

	-- приходит всем кроме присоединившегося
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_JOINED then

		self:UpdateData()
		UI.Notifications:AddNotification( UI.Notifications.types.ARENA_REMOTE_PLAYER_JOINED, { uid = paramU64, ltid = teamId, teamName = self:GetTeamName() } )

	-- приходит лидеру
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_INVITE_DECLINE then

		self:UpdateData()

	-- приходит рядовым членам
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_KICKED then

		local teamName	= self:GetTeamName()
		local uid		= paramU64

		self:UpdateData()

		if uid == UI:GetLocalPlayerUid() then
			UI.Notifications:AddNotification( UI.Notifications.types.ARENA_LOCAL_PLAYER_KICKED, { uid = uid, ltid = teamId, teamName = teamName } )
		else
			UI.Notifications:AddNotification( UI.Notifications.types.ARENA_REMOTE_PLAYER_KICKED, { uid = uid, ltid = teamId, teamName = teamName } )
		end

	-- приходит всем
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_STATS_CHANGE then

		self:OnStatsChanged()

	-- приходит всем
	elseif notificationType == _G.MasterServer.LeagueTeamNotification.LTEAMN_MAJOR_CHANGE then

		self:OnMajorChanged()

	else
		sys.log( "UI:MasterServer_OnLeagueTeamNotif()[ERROR]: unhandled notification %d(%s)", notificationType, UI:Val2Key( _G.MasterServer.LeagueTeamNotification, notificationType ) )
	end

end


--
function UI.Arena:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end

-- -----------------------
-- const
-- -----------------------

UI.Arena.leaderboardName		= "league_rating"
UI.Arena.majorLeaderboardName	= "major_league_rating"

-- -----------------------
-- vars
-- -----------------------

UI.Arena.data						= nil
UI.Arena.players					= {}
UI.Arena.createTeamRequestId		= 0
UI.Arena.leaveTeamRequestId			= 0
UI.Arena.inviteRequests				= {}
UI.Arena.cancelInviteRequests		= {}
UI.Arena.hMsgDisband				= UI.INVALID_UI_HANDLE
UI.Arena.hMsgLeave					= UI.INVALID_UI_HANDLE
UI.Arena.inviteMsgs					= {}
UI.Arena.invitesToMe				= {}
UI.Arena.hMsgInviteToMe				= UI.INVALID_UI_HANDLE
UI.Arena.shownInviteToMeInfo		= nil
UI.Arena.acceptInviteToMeRequestId	= 0
UI.Arena.declineInviteToMeRequestId	= 0
UI.Arena.kickRequests				= {}
UI.Arena.kickMsgs					= {}

-- -----------------------
-- work functions
-- -----------------------

--
function UI.Arena:Reset()

    self.data						= nil
    self.players					= {}
    self.createTeamRequestId		= 0
    self.leaveTeamRequestId			= 0
    self.inviteRequests				= {}
	self.cancelInviteRequests		= {}
	self.invitesToMe				= {}
	self.shownInviteToMeInfo		= nil
	self.acceptInviteToMeRequestId	= 0
	self.declineInviteToMeRequestId	= 0
	self.kickRequests				= {}

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

    	if self.hMsgDisband ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgDisband )
    	end

    	if self.hMsgLeave ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgLeave )
    	end

		for msgIdx, msgInfo in pairs( self.inviteMsgs ) do
        	UI:RemoveUiObj( msgInfo.hMsg )
		end

    	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgInviteToMe )
    	end

		for msgIdx, msgInfo in pairs( self.kickMsgs ) do
        	UI:RemoveUiObj( msgInfo.hMsg )
		end

	end

    self.hMsgDisband	= UI.INVALID_UI_HANDLE
    self.hMsgLeave		= UI.INVALID_UI_HANDLE
    self.inviteMsgs		= {}
	self.hMsgInviteToMe	= UI.INVALID_UI_HANDLE
	self.kickMsgs		= {}

end


--
function UI.Arena:UpdateData()

	self.players = {}

	self.data = _G.MasterServer_GetLeagueTeam()

	-- лидер, рядовые члены и приглашенные помещаются в один список для удобства

	-- лидер (в пришедших данных хранится отдельно)
	if self.data.ownerUid ~= UI.INVALID_U64_ID then
    	local ownerInfo = self:MakePlayerInfo( self.data.ownerUid, false )
    	table.insert( self.players, ownerInfo )
	end

	-- остальные члены команды
	for memberIdx, uid in ipairs( self.data.members ) do
		local memberInfo = self:MakePlayerInfo( uid, false )
		table.insert( self.players, memberInfo )
	end	

	-- приглашенные, но пока еще не члены (есть только у лидера)
	for invitedIdx, uid in ipairs( self.data.invites ) do
		local invitedInfo = self:MakePlayerInfo( uid, true )
		table.insert( self.players, invitedInfo )
	end


	local bInTeam = self:IsInTeam()
	local bLeader = bInTeam and self:IsLeader()

	if self.hMsgDisband ~= UI.INVALID_UI_HANDLE and ( not bInTeam or not bLeader ) then
		UI:RemoveUiObj( self.hMsgDisband )
		self.hMsgDisband = UI.INVALID_UI_HANDLE
	end

	if self.hMsgLeave ~= UI.INVALID_UI_HANDLE and ( not bInTeam or bLeader ) then
		UI:RemoveUiObj( self.hMsgLeave )
		self.hMsgLeave = UI.INVALID_UI_HANDLE
	end

	local fixedInviteMsgs = {}
	for msgIdx, msgInfo in pairs( self.inviteMsgs ) do
		if not bInTeam or not bLeader or self:IsPlayerMember( msgInfo.uid ) or self:IsPlayerInvited( msgInfo.uid ) then
			UI:RemoveUiObj( msgInfo.hMsg )
		else
			table.insert( fixedInviteMsgs, msgInfo )
		end
	end
	self.inviteMsgs = fixedInviteMsgs

	if bInTeam then

		self.invitesToMe			= {}
		self.shownInviteToMeInfo	= nil

    	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgInviteToMe )
    		self.hMsgInviteToMe = UI.INVALID_UI_HANDLE
    	end

	end

	local fixedKickMsgs = {}
	for msgIdx, msgInfo in pairs( self.kickMsgs ) do
		if not bInTeam or not bLeader or not self:IsPlayerMember( msgInfo.uid ) then
			UI:RemoveUiObj( msgInfo.hMsg )
		else
			table.insert( fixedKickMsgs, msgInfo )
		end
	end
	self.kickMsgs = fixedKickMsgs

	UI:SendUiEvent( UI.EV_ARENA_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Arena:MakePlayerInfo( uid, bInvited )

	local playerInfo =
	{
		uid				= uid,
		bInvited		= bInvited,
		state			= _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE,
		stateLastChange = nil,
		nickname		= "",
	}

	self:UpdatePlayerState( playerInfo, true )
	self:UpdateNickname( playerInfo )

	return playerInfo

end


--
function UI.Arena:UpdatePlayerState( playerInfo, bRequest )

	if bRequest then
		_G.MasterServer_UserProfileRequestField( playerInfo.uid, _G.MasterServer.UserProfileField.UPF_STATE )
	end

	local profile = _G.MasterServer_UserProfileGet( playerInfo.uid )
	if profile and profile.state then

		playerInfo.state			= profile.state
		playerInfo.stateLastChange	= profile.stateLastChange

	end	

end


--
function UI.Arena:UpdateNickname( playerInfo )

	local nickname, bCached, requestId = _G.MasterServer_GetNickName( playerInfo.uid )
	playerInfo.nickname = nickname

end


--
function UI.Arena:ShowMsgOnArenaError( result, strId )

	UI:ShowErrorMsg( strId, result, "_G.MasterServer.LeagueTeamOperationResult" )

end


--
function UI.Arena:ShowMsgOnCreateTeamError( result )

	self:ShowMsgOnArenaError( result, "arena_createTeamError" )

end


--
function UI.Arena:ShowMsgOnLeaveError( result )

	self:ShowMsgOnArenaError( result, "arena_leaveError" )

end


--
function UI.Arena:ShowMsgOnInvitePlayerError( result )

	self:ShowMsgOnArenaError( result, "arena_invitePlayerError" )

end


--
function UI.Arena:ShowMsgOnCancelInvitePlayerError( result )

	self:ShowMsgOnArenaError( result, "arena_cancelInvitePlayerError" )

end


--
function UI.Arena:ShowMsgOnAcceptInviteToMeError( result )

	self:ShowMsgOnArenaError( result, "arena_acceptInviteToMeError" )

end


--
function UI.Arena:ShowMsgOnDeclineInviteToMeError( result )

	self:ShowMsgOnArenaError( result, "arena_declineInviteToMeError" )

end


--
function UI.Arena:ShowMsgOnKickPlayerError( result )

	self:ShowMsgOnArenaError( result, "arena_kickPlayerError" )

end


--
function UI.Arena:DoLeave()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:DoLeave()[ERROR]: not in team" )
		return
	end

	if self.leaveTeamRequestId ~= 0 then
		sys.log( "UI.Arena:DoLeave()[ERROR]: is waitnig for another request" )
		return
	end

	self.leaveTeamRequestId = _G.MasterServer_LeagueTeamLeave()

	if self.leaveTeamRequestId == 0 then
		self:ShowMsgOnLeaveError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end	

end


--
function UI.Arena:DoInvitePlayer( uid )

	if not self:IsInTeam() then
		sys.log( "UI.Arena:DoInvitePlayer()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:DoInvitePlayer()[ERROR]: not leader" )
		return
	end

	if self:IsPlayerMember( uid ) then
		sys.log( "UI.Arena:DoInvitePlayer()[ERROR]: already member" )
		return
	end

	if self:IsPlayerInvited( uid ) then
		sys.log( "UI.Arena:DoInvitePlayer()[ERROR]: already invited" )
		return
	end

	local bRequestFound = false
	for requestIdx, requestInfo in pairs( self.inviteRequests ) do
		if requestInfo.uid == uid then
			bRequestFound = true
			break
		end
	end

	if bRequestFound then
		sys.log( "UI.Arena:DoInvitePlayer()[ERROR]: is waitnig for another request" )
		return
	end

	local requestId = _G.MasterServer_LeagueTeamInviteSend( uid )

	if requestId ~= 0 then

		local requestInfo =
		{
			requestId	= requestId,
			uid			= uid,
		}
		table.insert( self.inviteRequests, requestInfo )

	else
		self:ShowMsgOnInvitePlayerError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

end


--
function UI.Arena:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgDisband then

		if retCode == UI.MBRET_YES then
			self:DoLeave()
		end

		self.hMsgDisband = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgLeave then

		if retCode == UI.MBRET_YES then
			self:DoLeave()
		end

		self.hMsgLeave = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgInviteToMe then

		if retCode == UI.MBRET_YES then
			self:AcceptInviteToMe( self.shownInviteToMeInfo )
		else
			self:DeclinetInviteToMe( self.shownInviteToMeInfo )
		end

		self.hMsgInviteToMe = UI.INVALID_UI_HANDLE

	else

    	for msgIdx, msgInfo in pairs( self.inviteMsgs ) do

    		if msgInfo.hMsg == boxHandle then

				if retCode == UI.MBRET_YES then
					if not msgInfo.isBot then
						self:DoInvitePlayer( msgInfo.uid )
					end
				end

				table.remove( self.inviteMsgs, msgIdx )
				return

    		end

    	end

    	for msgIdx, msgInfo in pairs( self.kickMsgs ) do

    		if msgInfo.hMsg == boxHandle then

				if retCode == UI.MBRET_YES then
					if not msgInfo.isBot then
						self:DoKickPlayer( msgInfo.uid )
					end
				end

				table.remove( self.kickMsgs, msgIdx )
				return

    		end

    	end

	end

end


--
function UI.Arena:MakeInviteMsgText( uid )

	local nicknameColor	= UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.SYSTEM )
	local baseColor		= UI.TEXT_BASE_COLOR

	local text = UI:GetStringByName( "arena_invitePlayerConfirm" )

	local nickname = _G.MasterServer_GetNickName( uid )
	nickname = string.format( "%s%s%s", UI:Color2Str( nicknameColor ), nickname, UI:Color2Str( baseColor ) )

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$player%$", nickname )

	if numSubst == 0 then
		sys.log( "UI.Arena:MakeInviteMsgText()[ERROR]: cannot find placeholder \"$player$\" in string \"arena_invitePlayerConfirm\"" )
		text = string.format( "[INVALID STRING] Do you want to invite player %s?", nickname )
	end

	text = string.format( "%s%s", UI:Color2Str( baseColor ), text )

	return text

end


--
function UI.Arena:MakeInviteToMeMsgText( uid )

	local nicknameColor	= UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.SYSTEM )
	local baseColor		= UI.TEXT_BASE_COLOR

	local text = UI:GetStringByName( "arena_inviteMe_text" )

	local nickname = _G.MasterServer_GetNickName( uid )
	nickname = string.format( "%s%s%s", UI:Color2Str( nicknameColor ), nickname, UI:Color2Str( baseColor ) )

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$player%$", nickname )

	if numSubst == 0 then
		sys.log( "UI.Arena:MakeInviteToMeMsgText()[ERROR]: cannot find placeholder \"$player$\" in string \"arena_inviteMe_text\"" )
		text = string.format( "[INVALID STRING] Player %s invites you. Do you want to accept invitation?", nickname )
	end

	text = string.format( "%s%s", UI:Color2Str( baseColor ), text )

	return text

end


--
function UI.Arena:MakeKickMsgText( uid )

	local nicknameColor	= UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.SYSTEM )
	local baseColor		= UI.TEXT_BASE_COLOR

	local text = UI:GetStringByName( "arena_kickPlayerConfirm" )

	local nickname = _G.MasterServer_GetNickName( uid )
	nickname = string.format( "%s%s%s", UI:Color2Str( nicknameColor ), nickname, UI:Color2Str( baseColor ) )

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$player%$", nickname )

	if numSubst == 0 then
		sys.log( "UI.Arena:MakeInviteToMeMsgText()[ERROR]: cannot find placeholder \"$player$\" in string \"arena_kickPlayerConfirm\"" )
		text = string.format( "[INVALID STRING] Do you want to kick player %s?", nickname )
	end

	text = string.format( "%s%s", UI:Color2Str( baseColor ), text )

	return text

end


--
function UI.Arena:OnInviteToMe( teamId, uid )

	if self:IsInTeam() then
		sys.log( "UI.Arena:OnInviteToMe()[ERROR]: already in team" )
		return
	end

	local existInviteInfo = false
	for inviteIdx, inviteInfo in pairs( self.invitesToMe ) do
		if inviteInfo.uid == uid then
			existInviteInfo = inviteInfo
			break
		end
	end

	if existInviteInfo then

		-- приглашающий игрок мог создать другую команду
		if existInviteInfo.teamId ~= teamId then
			existInviteInfo.teamId = teamId
		end		

	else

		local inviteInfo =
		{
			teamId	= teamId,
			uid		= uid,
		}
		table.insert( self.invitesToMe, inviteInfo )

	end

	-- вызов месседжбокса осуществляется из ангара (по аналогии с приглашением в сквад и клан)

end


--
function UI.Arena:OnInviteToMeCancelled( teamId, fromUid )

	-- если для данного ивайта показывается в данный момент сообщение, то оно не удаляется (так было сделано в сквадах)
	if self.shownInviteToMeInfo and self.shownInviteToMeInfo.fromUid == fromUid then
		return
	end

	for inviteIdx, inviteInfo in pairs( self.invitesToMe ) do
		if inviteInfo.fromUid == fromUid then
			table.remove( self.invitesToMe, inviteIdx )
			break
		end
	end	

end


--
function UI.Arena:AcceptInviteToMe( inviteInfo )

	if not inviteInfo then
		sys.log( "UI.Arena:AcceptInviteToMe()[ERROR]: nil param" )
		return
	end

	self.acceptInviteToMeRequestId = _G.MasterServer_LeagueTeamInviteAccept( inviteInfo.teamId )

	if self.acceptInviteToMeRequestId == 0 then
		self:ShowMsgOnAcceptInviteToMeError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

	for savedInviteIdx, savedInviteInfo in pairs( self.invitesToMe ) do
		if savedInviteInfo.uid == inviteInfo.uid then
			table.remove( self.invitesToMe, savedInviteIdx )
			break
		end
	end

	if self.shownInviteToMeInfo and self.shownInviteToMeInfo.uid == inviteInfo.uid then

		self.shownInviteToMeInfo = nil

    	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgInviteToMe )
			self.hMsgInviteToMe = UI.INVALID_UI_HANDLE
    	end	

	end

end


--
function UI.Arena:DeclinetInviteToMe( inviteInfo )

	if not inviteInfo then
		sys.log( "UI.Arena:DeclinetInviteToMe()[ERROR]: nil param" )
		return
	end

	self.declineInviteToMeRequestId = _G.MasterServer_LeagueTeamInviteDecline( inviteInfo.teamId )

	if self.declineInviteToMeRequestId == 0 then
		self:ShowMsgOnDeclineInviteToMeError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

	for savedInviteIdx, savedInviteInfo in pairs( self.invitesToMe ) do
		if savedInviteInfo.uid == inviteInfo.uid then
			table.remove( self.invitesToMe, savedInviteIdx )
			break
		end
	end

	if self.shownInviteToMeInfo and self.shownInviteToMeInfo.uid == inviteInfo.uid then

		self.shownInviteToMeInfo = nil

    	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgInviteToMe )
			self.hMsgInviteToMe = UI.INVALID_UI_HANDLE
    	end	

	end

end


--
function UI.Arena:DoKickPlayer( uid )

	if not self:IsInTeam() then
		sys.log( "UI.Arena:DoKickPlayer()[ERROR]: not in team" )
		return
	end

	if not self:IsLeader() then
		sys.log( "UI.Arena:DoKickPlayer()[ERROR]: not leader" )
		return
	end

	if not self:IsPlayerMember( uid ) then
		sys.log( "UI.Arena:DoKickPlayer()[ERROR]: not member" )
		return
	end

	local bRequestFound = false
	for requestIdx, requestInfo in pairs( self.kickRequests ) do
		if requestInfo.uid == uid then
			bRequestFound = true
			break
		end
	end

	if bRequestFound then
		sys.log( "UI.Arena:DoKickPlayer()[ERROR]: is waitnig for another request" )
		return
	end

	local requestId = _G.MasterServer_LeagueTeamKick( uid )

	if requestId ~= 0 then

		local requestInfo =
		{
			requestId	= requestId,
			uid			= uid,
		}
		table.insert( self.kickRequests, requestInfo )

	else
		self:ShowMsgOnKickPlayerError( _G.MasterServer.LeagueTeamOperationResult.LTEAMOR_ERROR )
	end

end


--
function UI.Arena:OnStatsChanged()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:OnStatsChanged()[ERROR]: not in team" )
		return
	end

	local data = _G.MasterServer_GetLeagueTeam()

	self.data.rating	= data.rating
	self.data.gameTotal	= data.gameTotal
	self.data.winTotal	= data.winTotal

	UI:SendUiEvent( UI.EV_ARENA_STATS_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Arena:OnMajorChanged()

	if not self:IsInTeam() then
		sys.log( "UI.Arena:OnMajorChanged()[ERROR]: not in team" )
		return
	end

	local data = _G.MasterServer_GetLeagueTeam()

	self.data.major = data.major

	UI:SendUiEvent( UI.EV_ARENA_MAJOR_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Arena:SaveUiState()

	if not self:IsInited() then
		return
	end

	-- все месседжбоксы при перезагрузке ресурсов удаляются,
	-- поэтому критичные здесь сохраняются, а потом будут восстановлены,
	-- а для некритичных будет сбрасывается запомненный хэндл

	self.hMsgDisband	= UI.INVALID_UI_HANDLE
	self.hMsgLeave		= UI.INVALID_UI_HANDLE
	self.inviteMsgs		= {}
	self.kickMsgs		= {}

	UI.store.Arena = {}

	if self.hMsgInviteToMe ~= UI.INVALID_UI_HANDLE then

		local msgBox = UI:GetUiObjByHandleT( self.hMsgInviteToMe )
		if msgBox then

    		UI.store.Arena.msgInviteToMe =
    		{
    			caption	= msgBox:GetCaption(),
    			msg		= msgBox:GetMsg(),
    			style	= msgBox:GetMsgBoxStyle(),
    		}

		end

		self.hMsgInviteToMe = UI.INVALID_UI_HANDLE

	end

end



--
function UI.Arena:RestoreUiState()

	if UI.store.Arena then

		if UI.store.Arena.msgInviteToMe then
			self.hMsgInviteToMe = UI:MessageBox( UI.store.Arena.msgInviteToMe.caption, UI.store.Arena.msgInviteToMe.msg, UI.store.Arena.msgInviteToMe.style )
		end

		UI.store.Arena = nil

	end
 
end