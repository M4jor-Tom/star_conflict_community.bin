-- ----------------------------------------------------------------------------
--
-- Workfile: Options.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: options.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

local RELOAD_TIME_t = 30
local REWARD_NOTIFICATION_MERGE_TIME = 5


if UI.Clan then
	return
else
	UI.Clan = 
	{
		inited = false,
		inClan = false,
		invites = {},
		members = {},
		cid = UI.INVALID_U64_ID,
		nicknameRequest = nil,
		clannameRequest = nil,
		name = "",
		RELOAD_TIME = RELOAD_TIME_t,
		upgrades = {},
		motd = "",
		recruiting = false,
		scoutsUsed = 0,
		clanShips = {},
		currentClanShip = "",
	}
end


--
function UI.Clan:Init()

	if not self.inited then
		--_G.MasterServer_ClanJoinReqGetPlayers()
		self.inited = true
	end

end


--
function UI.Clan:Clear( notFull )

	self.nicknameRequest = nil
	self.clannameRequest = nil
	self.inClan = false
	self.invites = {}
	if not notFull then
		self.inited = false
	end
	self.members = {}
	self.cid = UI.INVALID_U64_ID
	self.name = ""
	self.influenceClan = {}
	self.motd = ""
	self.recruiting = false
	self.scoutsUsed = 0
	self.clanShips = {}
	self.currentClanShip = ""

end


--
function UI.Clan:AddInvite( invite )

	if self.inClan then
		return
	end

	local nickName, bCached, requestId = _G.MasterServer_GetNickName( invite.uid )
	if not bCached then
		self.nicknameRequest = requestId
	else
		invite.nickname = nickName
	end

	local clanName, bCached, requestId = _G.MasterServer_GetClanName( invite.cid )
	if not bCached then
		self.clannameRequest = requestId
	else
		invite.clanname = clanName
	end

	self.invites[ #self.invites + 1 ] = invite

end


--
function UI.Clan:AcceptCurInvite()

	local clan = self.invites[ 1 ].cid
	local initiatorUid = self.invites[ 1 ].uid
	self.invites = {}
	_G.MasterServer_ClanInviteAccept( clan, initiatorUid )

end


--
function UI.Clan:RejectCurInvite()

	local clan = UI.Clan.invites[ 1 ].cid
	table.remove( UI.Clan.invites, 1 )
	_G.MasterServer_ClanInviteCancel( clan )

end


--
function UI.Clan:GetInvite()

	if self.inClan then
		return
	end

	if next( UI.Clan.invites ) then
		if UI.Clan.invites[ 1 ].nickname ~= nil and UI.Clan.invites[ 1 ].clanname ~= nil then
			return UI.Clan.invites[ 1 ]
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
			if not self.clannameRequest then
				local clanName, bCached, requestId = _G.MasterServer_GetClanName( self.invites[ 1 ].cid )
				if not bCached then
					self.clannameRequest = requestId
				else
					-- обработаемся на следующем кадре
					self.invites[ 1 ].clanname = clanName
				end
			end
		end
	end

	return nil

end


--
function UI.Clan:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if self.clannameRequest == requestId then

		self.clannameRequest = nil 

		if not clanName or result ~= 0 then
			return
		end

		for i = 1, #self.invites do
			if self.invites[ i ].cid == cid then
				self.invites[ i ].clanname = clanName
			end
		end

	end

	if not clanName or result ~= 0 then
		return
	end

end


--
function UI.Clan:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

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

	if self.inClan then
		if self.members then
			local add = false
			for i = 1, #self.members do
				if self.members[ i ].uid == uid then
					self.members[ i ].nickname = nickName
					add = true
				end
			end
			if add then
				UI.ClansMainWnd:Update( "CLAN" )
			end
		end
	end

end


--
function UI.Clan:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if result ~= MasterServer.ClanOpResult.CLR_OK then
		return
	end

	if field == MasterServer.UserProfileField.UPF_STATE then

		if self.members then
			local needUpdate = false
			for i = 1, #self.members do
				if self.members[ i ].uid == uid then
					local profile = _G.MasterServer_UserProfileGet( uid )
					if profile and profile.state then
						self.members[ i ].state = profile.state
						self.members[ i ].stateLastChange = profile.stateLastChange
						needUpdate = true
					end
				end
			end
			if needUpdate then
				UI.ClansMainWnd:Update( "CLAN" )
			end
		end
	end

end

--
function UI.Clan:ReloadList( result, requestId )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		return
	end

	local list = _G.MasterServer_ClanGetDesc()
	local isBeInClan = self.inClan
	local lastMotD = self.motd
	self.inClan = false
	self:Clear( true )
	if list.inClan then
		self.inClan = true
		self.members = UI:CopyTable2( list.members )
		self.upgrades = UI:CopyTable2( list.upgrades )
		self.cid = list.cid
		self.name = list.name
		self.tag = list.tag
		self.resources = list.resources
		self.motd = list.motd and list.motd or ""
		self.findDesc = list.desc and list.desc or ""
		self.recruiting = list.recruiting
		self.scoutsUsed = list.scoutsUsed
		self.scoutsUsedDay = list.lastScoutDay
		self.clanShips = list.clanShips
		self.currentClanShip = list.currentClanShip or ""
		local recruits = list.joinReqs
		for k, v in pairs( recruits ) do
			table.insert( self.members, { uid = v, recruit = true } )
		end
		for i = 1, #self.members do
			local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.members[ i ].uid )
			self.members[ i ].nickname = nickName
			_G.MasterServer_UserProfileRequestField( self.members[ i ].uid, MasterServer.UserProfileField.UPF_STATE )
			local profile = _G.MasterServer_UserProfileGet( self.members[ i ].uid )
			if profile and profile.state then
				self.members[ i ].state = profile.state
				self.members[ i ].stateLastChange = profile.stateLastChange
			else
				self.members[ i ].state = MasterServer.UserState.USER_STATE_NOT_AVAILABLE
			end
		end
	end

	if isBeInClan ~= self.inClan then
		if self.inClan then
			UI.Chat:AddClanTab()
		else
			UI.Chat:RemoveClanTab()
		end
		UI.LeaderboardWnd:UpdateClanWnd()
	end

	if lastMotD ~= self.motd then
		local text = UI.Clan:GetMotD()
		if text ~= "" then
			text = UI:Ut8ValidateLastSymbol( text )
			--text = UI:ShieldSpecSymbolsForMetatext( text )
			-- #0059192 - moved to ChatWnd
--			text = string.gsub( text, "\n" , "|" )
			if UI.Clan:GetMotD() ~= "" then
				UI.Chat:AddClanMotD( text )
			end
		end
	end

	UI.ClansMainWnd:Update( "CLAN" )
	UI.HangarWnd:OnClanDataChanged()
	if UI.Squad:IsInSquad() then
		if UI.Squad:IsLeader() then
			UI.SquadWnd:Reload()
		end
	end

end

--
function UI.Clan:GetResources( resource )
	return self.resources and self.resources[ resource ] or u64( 0 )
end

--
function UI.Clan:IsInClan()
	return self.inClan
end

--
function UI.Clan:GetMotD()
	return self.motd
end

--
function UI.Clan:GetFindDesc()
	return self.findDesc
end


--
function UI.Clan:GetSquadId()
	--return self.squadId
end


--
function UI.Clan:GetMembersCount()

	local members = 0
	if self.inClan and self.members then
		for k, v in pairs( self.members ) do
			if not v.recruit then
				members = members + 1
			end
		end
	end

	return members

end


--
function UI.Clan:GetMembers()

	return self.members

end


--
function UI.Clan:IsClanMember( uid )

	if self.inClan and self.members then
		for i = 1, #self.members do
			if self.members[ i ].uid == uid then
				return true
			end
		end
	end

	return false

end


--
function UI.Clan:GetClanMemberRole( uid )

	if self.inClan and self.members then
		for i = 1, #self.members do
			if self.members[ i ].uid == uid then
				return self.members[ i ].role
			end
		end
	end

	return -1

end


--
function UI.Clan:IsLeader( uid )

	if self:GetClanMemberRole( uid ) == MasterServer.ClanRole.CR_LEADER then
		return true
	end

	return false

end

--
function UI.Clan:GetClanLeader()
	for k, v in pairs( self.members ) do
		if v.role == MasterServer.ClanRole.CR_LEADER then
			return v.uid
		end
	end
	sys.log( "UI.Clan:GetClanLeader()[ERROR]: no leader in clan cid:%s", _G.U64ToStr( self:GetCid() ) )
end

--
function UI.Clan:IsExecutiveAssistant( uid )

	if self:GetClanMemberRole( uid ) == MasterServer.ClanRole.CR_EXECUTIVE_ASSISTANT then
		return true
	end

	return false

end

--
function UI.Clan:IsOfficer( uid )

	if self:GetClanMemberRole( uid ) == MasterServer.ClanRole.CR_OFFICER then
		return true
	end

	return false

end


--
function UI.Clan:Leave()

	_G.MasterServer_ClanLeave()

end


--
function UI.Clan:InviteToClan( uid )

	return _G.MasterServer_ClanInviteSend( uid )

end


--
function UI.Clan:GetTag( uid )

	return self.tag

end


--
function UI.Clan:Kick( uid )
end


--
function UI.Clan:GetCid()

	if self.inClan then
		return self.cid
	end

end

--
function UI.Clan:GetUpgradeLevel( upgrade )

	if self.inClan and self.upgrades[ upgrade ] then
		return self.upgrades[ upgrade ]
	end

	sys.log( "UI.Clan:GetUpgradeRating( upgrade )[ERROR]: Can't find upgrade %d", upgrade )
	return

end


--
function UI.Clan:GetMaxCapacity()

	return _G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_CAPACITY ][ self:GetUpgradeLevel( MasterServer.ClanUpgrades.CU_CAPACITY ) ]

end

--
function UI.Clan:GetMaxResourceCount()

	return _G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_RESOURCE_LIMIT ][ self:GetUpgradeLevel( MasterServer.ClanUpgrades.CU_RESOURCE_LIMIT ) ]

end


--
function UI.Clan:IsMaxExpandReached( upgrade )

	return #_G.ClanUpgradeValues[ upgrade ] == self:GetUpgradeLevel( upgrade )

end


--
function UI.Clan:GetExpandPrice()

	local time = _G.TimerGetRealTime()
	if time - self.lastLeaderboardTime > UI.Clan.RELOAD_TIME or force then
		_G.MasterServer_ClanLeaderboardsGetEntries( MasterServer.ClanLeaderboardStat.CLS_KILLS )
		self.lastLeaderboardTime = time
	end

end

--
function UI.Clan:IsRecruiting()
	return self.recruiting
end

--
function UI.Clan:IfShipyardBuilded( race )
	local dreadnoughtDefName, dreadnoughtTable = UI.Clan:GetDreadnoughtForRace( race, true )
	if dreadnoughtTable and dreadnoughtTable.partBeingBuilt and dreadnoughtTable.mainParts then
		if dreadnoughtTable.partBeingBuilt ~= "Shipyard" then
			for k, v in pairs( dreadnoughtTable.mainParts ) do
				if v == "Shipyard" then
					return true
				end
			end
		end
	end
	return false
end

--
function UI.Clan:GetDreadnoughtRace( dreadnoughtDef )
	if dreadnoughtDef and dreadnoughtDef ~= "" then
		if ClanShipDefs[ dreadnoughtDef ].station_race ~= nil then
			return ClanShipDefs[ dreadnoughtDef ].station_race
		else
			sys.log( "UI.Clan:GetDreadnoughtRace()[ERROR]: dreadnought's def '%s' haven't field station_race" )
		end
	else
		sys.log( "UI.Clan:GetDreadnoughtRace()[ERROR]: invalid dreadnoughtDef" )
	end
end

--
function UI.Clan:GetCurrentDreadnought( bNotBuilded )
	if UI.Clan:IsInClan() then
		if self.clanShips and self.currentClanShip and self.currentClanShip ~= "" then
			for k, v in pairs( self.clanShips ) do
				if k == self.currentClanShip then
					if UI.Clan:IsDreadnoughtBuilt( v ) then
						return v.defName, v
					end
					if bNotBuilded then
						return v.defName, v
					end
				end
			end
		end
	end
	return nil
end


--
function UI.Clan:GetDreadnoughtForRace( race, bNotBuilded )
	if UI.Clan:IsInClan() then
		if self.clanShips then
			for k, v in pairs( self.clanShips ) do
				if k ~= "" and self:GetDreadnoughtRace( k ) == race then
					if UI.Clan:IsDreadnoughtBuilt( v ) then
						return v.defName, v
					end
					if bNotBuilded then
						return v.defName, v
					end
				end
			end
		end
	end
	return nil
end

--
function UI.Clan:HasPermission( opeartion )
	if self:IsInClan() then
		local actions = _G.MasterServer_ClanGetActionPrivileges( _G.MasterServer_GetLocalUserId() )
		for i = 1, #actions do
			if actions[ i ] == opeartion then
				return true
			end
		end
	end
	return false
end

--
function UI.Clan:IsDreadnoughtBuilt( dreadnought )
	if dreadnought == nil then
		local dreadnoughtName, dreadnoughtShip = UI.Clan:GetCurrentDreadnought( false )
		dreadnought = dreadnoughtShip
	end
	if dreadnought then
		return _G.MasterServer_IsClanShipFullyBuilt( dreadnought.defName )
	end
	return false
end

--
function UI.Clan:GetCurrentDreadnoughtZoneId()
	local dreadnoughtName, dreadnoughtShip = UI.Clan:GetCurrentDreadnought( false )
	if dreadnoughtShip and dreadnoughtShip.curZone then
		return dreadnoughtShip.curZone
	end
	return false
end