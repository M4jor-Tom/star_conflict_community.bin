-- ----------------------------------------------------------------------------
--
-- Workfile: Options.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: options.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Social then
	return
end
UI.Social = {}

UI.Social.FriendList 		= {}
UI.Social.WatchList 		= {}
UI.Social.IgnorList			= {}
UI.Social.NewList			= {}
UI.Social.FriendRequestList	= {}
UI.Social.ReferalsList 			= {}
UI.Social.inited			= false


--
function UI.Social:Init()

	if not self.inited then
		--_G.MasterServer_RequestSocial()
		self.inited = true
	end

end


--
function UI.Social:Clear()

	self.WatchList 			= {}
	self.IgnorList			= {}
	self.FriendList 		= {}
	self.NewList			= {}
	self.ReferalsList		= {}
	self.inited = false

end


--
function UI.Social:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not nickName or result ~= 0 then
		return
	end

	for i = 1, #self.FriendList do
		if self.FriendList[ i ].uid == uid then
			self.FriendList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.FRIENDS )
		end
	end

	for i = 1, #self.IgnorList do
		if self.IgnorList[ i ].uid == uid then
			self.IgnorList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.IGNORE )
		end
	end

	for i = 1, #self.WatchList do
		if self.WatchList[ i ].uid == uid then
			self.WatchList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.WATCH )
		end
	end

	for i = 1, #self.NewList do
		if self.NewList[ i ].uid == uid then
			self.NewList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.NEW )
		end
	end

	for i = 1, #self.FriendRequestList do
		if self.FriendRequestList[ i ].uid == uid then
			self.FriendRequestList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.FRIENDS )
		end
	end

	for i = 1, #self.ReferalsList do
		if self.ReferalsList[ i ].uid == uid then
			self.ReferalsList[ i ].nickName = nickName
			UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.REFERRALS )
		end
	end

end


--
function UI.Social:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if result ~= MasterServer.ClanOpResult.CLR_OK then
		return
	end

	if field == MasterServer.UserProfileField.UPF_STATE then

		if self.FriendList then
			for i = 1, #self.FriendList do
				if self.FriendList[ i ].uid == uid then
					local profile = _G.MasterServer_UserProfileGet( uid )
					if profile and profile.state then
						self.FriendList[ i ].state = profile.state
						self.FriendList[ i ].stateLastChange = profile.stateLastChange
						UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.FRIENDS )
					end
				end
			end
		end

		if self.WatchList then
			for i = 1, #self.WatchList do
				if self.WatchList[ i ].uid == uid then
					local profile = _G.MasterServer_UserProfileGet( uid )
					if profile and profile.state then

						local state = profile.state

						-- #0036426 - в списке наблюдения различаются только состояния offline и online;
						-- сейчас других нет, но если появятся, то их надо будет интерпретировать как offline или online

						if not( state == _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE or state == _G.MasterServer.UserState.USER_STATE_OFFLINE or state == _G.MasterServer.UserState.USER_STATE_ONLINE ) then
							sys.log( "UI.Social:MasterServer_OnUserProfileUpdate()[ERROR]: unhandled state %s", UI:Val2Key( _G.MasterServer.UserState, state ) )
							state = _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE
						end

						self.WatchList[ i ].state = state

						self.WatchList[ i ].stateLastChange = profile.stateLastChange
						UI.FriendsListWnd:ReloadList( UI.FriendsListWnd.filterType.WATCH )
					end
				end
			end
		end
	end

	UI.HangarWnd:SetFriendOnlineCount( self:GetFriendOnlineCount() )

end

--
function UI.Social:GetFriendOnlineCount()
	local online = 0
	for i = 1, #self.FriendList do
		if self.FriendList[ i ].state then
			if self.FriendList[ i ].state ~= MasterServer.UserState.USER_STATE_NOT_AVAILABLE and self.FriendList[ i ].state ~= MasterServer.UserState.USER_STATE_OFFLINE then
				online = online + 1
			end
		end
	end
	return online
end

--
function UI.Social:AddReferral( referal, isReferrer )
	for i = 1, #self.FriendList do
		if self.FriendList[ i ].uid == referal.uid then
			finded = true
			self.FriendList[ i ].referral = true
		end
	end
	if not isReferrer then
		if not self.Referals then
			self.Referals = {}
		end
	 	table.insert( self.Referals, referal )
	 end
end

--
function UI.Social:RemoveFromList( list, uid )
	for k, v in pairs( list ) do
		if v.uid == uid then
			table.remove( list, k )
			return
		end
	end
end

--
function UI.Social:ReloadSocialList( list )

	self.FriendList 		= {}
	self.WatchList 			= {}
	self.IgnorList			= {}
	self.NewList			= {}
	self.FriendRequestList	= {}
	self.Referals 			= {}

	--dprint( list )

	if list.friends then
		if list.friends[ 0 ] then
			list.friends[ #list.friends + 1 ] = list.friends[ 0 ]
		end
	end

	if list.watch then
		if list.watch[ 0 ] then
			list.watch[ #list.watch + 1 ] = list.watch[ 0 ]
		end
	end

	if list.ignore then
		if list.ignore[ 0 ] then
			list.ignore[ #list.ignore + 1 ] = list.ignore[ 0 ]
		end
	end

	if list.friend_requests_to_me then
		if list.friend_requests_to_me[ 0 ] then
			list.friend_requests_to_me[ #list.friend_requests_to_me + 1 ] = list.friend_requests_to_me[ 0 ]
		end
	end

	if list.friend_requests_from_me then
		if list.friend_requests_from_me[ 0 ] then
			list.friend_requests_from_me[ #list.friend_requests_from_me + 1 ] = list.friend_requests_from_me[ 0 ]
		end
	end

	if list.friends then
		self.FriendList = UI:CopyTable2( list.friends )
	end
	if list.watch then
		self.WatchList = UI:CopyTable2( list.watch )
	end
	if list.ignore then
		self.IgnorList = UI:CopyTable2( list.ignore )
	end
	if list.friend_requests_to_me then
		self.NewList = UI:CopyTable2( list.friend_requests_to_me )
	end
	if list.friend_requests_from_me then
		self.FriendRequestList = UI:CopyTable2( list.friend_requests_from_me )
	end

	local studyList = _G.MasterServer_Teaching_List()
	if studyList.teachers then
		for k, v in pairs( studyList.teachers ) do
			self:RemoveFromList( self.FriendList, v )
			table.insert( self.FriendList, { uid = v, isTeacher = true } )
		end
	end
	if studyList.students then
		for k, v in pairs( studyList.students ) do
			self:RemoveFromList( self.FriendList, v )
			table.insert( self.FriendList, { uid = v, isPupil = true } )
		end
	end
	--[[if studyList.requests_to_teachers then
		for k, v in pairs( studyList.requests_to_teachers ) do
			table.insert( self.NewList, { uid = v, isPupil = true } )
		end
	end]]
	if studyList.requests_from_students then
		for k, v in pairs( studyList.requests_from_students ) do
			self:RemoveFromList( self.NewList, v )
			table.insert( self.NewList, { uid = v, isPupil = true } )
		end
	end

	if studyList.requests_from_teachers then
		for k, v in pairs( studyList.requests_from_teachers ) do
			self:RemoveFromList( self.NewList, v )
			table.insert( self.NewList, { uid = v, isTeacher = true } )
		end
	end

	local referalsList = _G.MasterServer_GetReferrals()
	if referalsList.referrer and referalsList.referrer ~= UI.INVALID_U64_ID then
		--table.insert( list.friends, { uid = referrals.referrer, referral = true } )
		self:AddReferral( { uid = referalsList.referrer }, true )
	end

	if referalsList.referees then
		for i = 1, #referalsList.referees do
			self:AddReferral( referalsList.referees[ i ] )
		end
		self.ReferalsList = referalsList.referees
	end
	--[[if studyList.requests_to_students then
		for k, v in pairs( studyList.requests_to_students ) do
			table.insert( self.NewList, { uid = v, isTeacher = true } )
		end
	end]]

	-- get nicknames
	for i = 1, #self.FriendList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.FriendList[ i ].uid )
		self.FriendList[ i ].nickName = nickName
		_G.MasterServer_UserProfileRequestField( self.FriendList[ i ].uid, MasterServer.UserProfileField.UPF_STATE )
		local profile = _G.MasterServer_UserProfileGet( self.FriendList[ i ].uid )
		if profile and profile.state then
			self.FriendList[ i ].state = profile.state
			self.FriendList[ i ].stateLastChange = profile.stateLastChange
		else
			self.FriendList[ i ].state = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
		end
	end

	for i = 1, #self.WatchList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.WatchList[ i ].uid )
		self.WatchList[ i ].nickName = nickName
		MasterServer_UserProfileRequestField( self.WatchList[ i ].uid, MasterServer.UserProfileField.UPF_STATE )
		local profile = _G.MasterServer_UserProfileGet( self.WatchList[ i ].uid )
		if profile and profile.state then

			local state = profile.state

			-- #0036426 - в списке наблюдения различаются только состояния offline и online;
			-- сейчас других нет, но если появятся, то их надо будет интерпретировать как offline или online

			if not( state == _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE or state == _G.MasterServer.UserState.USER_STATE_OFFLINE or state == _G.MasterServer.UserState.USER_STATE_ONLINE ) then
				sys.log( "UI.Social:ReloadSocialList()[ERROR]: unhandled state %s", UI:Val2Key( _G.MasterServer.UserState, state ) )
				state = _G.MasterServer.UserState.USER_STATE_NOT_AVAILABLE
			end

			self.WatchList[ i ].state = state

			self.WatchList[ i ].stateLastChange = profile.stateLastChange
		else
			self.WatchList[ i ].state = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
		end
	end

	for i = 1, #self.IgnorList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.IgnorList[ i ].uid )
		self.IgnorList[ i ].nickName = nickName
	end

	for i = 1, #self.IgnorList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.IgnorList[ i ].uid )
		self.IgnorList[ i ].nickName = nickName
	end

	for i = 1, #self.NewList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.NewList[ i ].uid )
		self.NewList[ i ].nickName = nickName
	end

	for i = 1, #self.ReferalsList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.ReferalsList[ i ].uid )
		self.ReferalsList[ i ].nickName = nickName
	end

	--[[for i = 1, #self.FriendRequestList do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.FriendRequestList[ i ].uid )
		self.FriendRequestList[ i ].nickname = nickName
	end]]

	if #self.NewList > 0 then
		UI.HangarWnd:SetNewFriendRequest( true )
	else
		UI.HangarWnd:SetNewFriendRequest( false )
	end

	UI.FriendsListWnd:ReloadCurrentList()
	UI.HangarWnd:SetFriendOnlineCount( self:GetFriendOnlineCount() )

end


--
function UI.Social:GetFriendList()

	return self.FriendList

end


--
function UI.Social:GetWatchList()

	return self.WatchList

end


--
function UI.Social:GetIgnorList()

	return self.IgnorList

end


--
function UI.Social:GetNewList()

	return self.NewList

end

--
function UI.Social:GetAllReferalsProfit()
	local profit = 0
	if self.ReferalsList then
		for k, v in pairs( self.ReferalsList ) do
			profit = profit + v.bonusGold
		end
	end
	return profit
end

--
function UI.Social:GetReferalsList()
	return self.ReferalsList
end

--
function UI.Social:IsFriend( uid )

	for i = 1, #self.FriendList do
		if self.FriendList[ i ].uid == uid then
			return true
		end
	end
	return false

end


--
function UI.Social:IsWatch( uid )

	for i = 1, #self.WatchList do
		if self.WatchList[ i ].uid == uid then
			return true
		end
	end
	return false

end


--
function UI.Social:IsIgnore( uid )

	for i = 1, #self.IgnorList do
		if self.IgnorList[ i ].uid == uid then
			return true
		end
	end
	return false

end


--
function UI.Social:IsNew( uid )

	for i = 1, #self.NewList do
		if self.NewList[ i ].uid == uid then
			return true
		end
	end
	return false

end



--
function UI.Social:HasNew()

	return #self.NewList > 0 

end


--
function UI.Social:IsFrendRequest( uid )

	for i = 1, #self.FriendRequestList do
		if self.FriendRequestList[ i ].uid == uid then
			return true
		end
	end
	return false

end

--
function UI.Social:GetTeacher()
	local studyList = _G.MasterServer_Teaching_List()
	if studyList.teachers then
		for k, v in pairs( studyList.teachers ) do
			return v
		end
	end
	return nil
end

--
function UI.Social:GetStudents()
	local students = {}
	local studyList = _G.MasterServer_Teaching_List()
	if studyList.students then
		for k, v in pairs( studyList.students ) do
			table.insert( students, v )
		end
	end
	return students
end

--
function UI.Social:IsTeacher( uid )
	local studyList = _G.MasterServer_Teaching_List()
	if studyList.teachers then
		for k, v in pairs( studyList.teachers ) do
			if v == uid then
				return true
			end
		end
	end
	return false
end

--
function UI.Social:IsStudent( uid )
	local studyList = _G.MasterServer_Teaching_List()
	if studyList.students then
		for k, v in pairs( studyList.students ) do
			if v == uid then
				return true
			end
		end
	end
	return false
end