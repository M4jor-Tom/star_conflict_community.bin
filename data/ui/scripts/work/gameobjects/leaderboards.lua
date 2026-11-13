-- ----------------------------------------------------------------------------
--
-- Workfile: lobby.lua
-- Copyright é 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: lobby.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Leaderboards then
	return
end

UI.Leaderboards = {}
UI.Leaderboards.isInited = false
UI.Leaderboards.lastRequestData = nil
UI.Leaderboards.curRequestData = nil
UI.Leaderboards.nextRequestData = nil
UI.Leaderboards.list = nil
UI.Leaderboards.internalRequestId = 0

UI.Leaderboards.MAX_REQUEST_COUNT = 0xffffffff

UI.Leaderboards.requestState = 
{
	maxRecordsCount 			= nil,
	beginRecordIndex 			= nil,
	bNeedCountRecordsRequest 	= nil,
	countRecords 				= nil,
	bNeedRecordsRequest 		= nil,
	records 					= nil,
	bNeedMyRecordsRequest		= nil,
	myRecord					= nil,
	receivedTime 				= nil,
	maxRecordsCountRequestId 	= nil,
	recordsRequestId 			= nil,
	myRecordRequestId 			= nil,
	leaderboardDesc 			= nil,
	wnd 						= nil,
	internalRequestId 			= nil,
	myUid						= nil,
}

--
function UI.Leaderboards:Clear()
	self.list = nil
	self.lastRequestData = nil
	self.curRequestData = nil
	self.nextRequestData = nil
end

--
function UI.Leaderboards:SetNextRequest( wnd, name, beginIndex, count, bNeedCountRecordsRequest, bNeedRecordsRequest, bNeedMyRecordRequest, list, myUid )
	if not self.list then
		self.list = _G.MasterServer_LeaderboardGetDescs()
	end
	local request = self:CreateEmptyRequestData()
	local leaderboardExist = false
	for k, v in pairs( self.list ) do
		if v.name == name then
			leaderboardExist = true
			request.leaderboardDesc = v
			break
		end
	end
	if not leaderboardExist then
		sys.log( "UI.Leaderboards:SetNextRequest()[ERROR]: can't find leaderboard with name '%s'", name )
		--self:OnError( nil, MasterServer.LeaderboardGetResult.LGR_WRONG_LEADERBOARD )
		--return
	end
	request.beginRecordIndex = beginIndex
	request.countRecords = count
	request.bNeedMyRecordRequest = bNeedMyRecordRequest
	request.bNeedRecordsRequest = bNeedRecordsRequest
	request.bNeedCountRecordsRequest = bNeedCountRecordsRequest and bNeedCountRecordsRequest or false
	request.internalRequestId = self.internalRequestId
	request.wnd = wnd
	request.list = list
	request.myUid = ( myUid ~= nil and myUid ~= UI.INVALID_U64_ID ) and myUid or UI:GetLocalPlayerUid()
	if not request.leaderboardDesc then
		request.leaderboardDesc = {}
		request.leaderboardDesc.name = name
	end
	
	self.internalRequestId = self.internalRequestId + 1
	if self.internalRequestId == self.MAX_REQUEST_COUNT then
		self.internalRequestId = 0
	end
	if request.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
		if UI:GetPlayerClanByUid( request.myUid ) == UI.INVALID_U64_ID then
			return
		end
	end
	if self.curRequestData == nil then
		self:StartRequest( request )
	else
		self.nextRequestData = request
	end
	return request.internalRequestId
end

--
function UI.Leaderboards:MasterServer_OnLeaderboardGet( result, requestId, entries )
	if result == 0 then
		if self.curRequestData == nil then
			sys.log( "UI.Leaderboards:MasterServer_OnLeaderboardGet()[ERROR]: current curRequestData is nil" )
			return
		end
		if requestId == self.curRequestData.maxRecordsCountRequestId then
			if not self.curRequestData.bNeedCountRecordsRequest then
				sys.log( "UI.Leaderboards:MasterServer_OnLeaderboardGet()[ERROR]: received maxRecordsCountRequestId but bNeedCountRecordsRequest is false" )
			end
			self.curRequestData.maxRecordsCount = entries[ 1 ]
			self.curRequestData.maxRecordsCountRequestId = nil
			if self.curRequestData.wnd and self.curRequestData.wnd.OnRequestMaxRecordLeaderboard then
				self.curRequestData.wnd:OnRequestMaxRecordLeaderboard( self.curRequestData )
			else
				
			end
			self:ProceedCurrentRequest()
		elseif requestId == self.curRequestData.recordsRequestId then
			if not self.curRequestData.bNeedRecordsRequest then
				sys.log( "UI.Leaderboards:MasterServer_OnLeaderboardGet()[ERROR]: received recordRequestId but bNeedRecordsRequest is false" )
			end
			self.curRequestData.records = entries
			self.curRequestData.recordsRequestId = nil
			self:ProceedCurrentRequest()
		elseif requestId == self.curRequestData.myRecordRequestId then
			if not self.curRequestData.bNeedMyRecordRequest then
				sys.log( "UI.Leaderboards:MasterServer_OnLeaderboardGet()[ERROR]: received myRecordRequestId but bNeedMyRecordRequest is false" )
			end
			self.curRequestData.myRecord = entries[ 1 ]
			self.curRequestData.myrecordRequestId = nil
			self:ProceedCurrentRequest()
		end
		
	else
		if self.curRequestData.maxRecordsCountRequestId == requestId or requestId == self.curRequestData.recordsRequestId or requestId == self.curRequestData.myRecordRequestId then
			self:OnError( result )
		end
		self:ProceedCurrentRequest()
	end
end

--
function UI.Leaderboards:OnError( result )
	self.lastRequestData = self.curRequestData
	self.curRequestData = nil
	if self.nextRequestData then
		self:StartRequest( self.nextRequestData )
		self.nextRequestData = nil
	end
	if self.lastRequestData.wnd and self.lastRequestData.wnd.OnRequestLeaderboardError then
		self.lastRequestData.wnd:OnRequestLeaderboardError( self.lastRequestData, result )
	end
end

--
function UI.Leaderboards:StartRequest( request )
	if self.curRequestData ~= nil then
		sys.log( "UI.Leaderboards:StartRequest()[ERROR]: try to start a new request before last ended" )
		return
	end
	self.curRequestData = request
	self:ProceedCurrentRequest()
end

--
function UI.Leaderboards:ProceedCurrentRequest()
	if self.curRequestData then
		if self.curRequestData.maxRecordsCount == nil then
			if self.curRequestData.maxRecordsCountRequestId ~= nil then
				sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: try to proceed not ready maxRecordsCountRequest" )
				return
			end
			if self.curRequestData.bNeedCountRecordsRequest then
				-- request max records count
				local cid = nil
				if self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
					cid = UI:GetPlayerClanByUid( self.curRequestData.myUid )
				end
				self.curRequestData.maxRecordsCountRequestId = _G.MasterServer_LeaderboardGet( 
					{
						lb = self.curRequestData.leaderboardDesc.name, 
						qt = MasterServer.LeaderboardQueryType.LQT_LBRD_SIZE, 
						cid = cid,
					} )
				return
			end
		end

		if self.curRequestData.records == nil then
			if self.curRequestData.recordsRequestId ~= nil then
				sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: try to proceed not ready recordsRequest" )
				return
			end
			if self.curRequestData.bNeedRecordsRequest then
				-- request records
				local cid = nil
				if self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
					cid = UI:GetPlayerClanByUid( self.curRequestData.myUid )
				end
				if self.curRequestData.list then
					self.curRequestData.recordsRequestId = _G.MasterServer_LeaderboardGet( 
						{
							lb = self.curRequestData.leaderboardDesc.name, 
							qt = MasterServer.LeaderboardQueryType.LQT_ENTITY_LIST, 
							list = self.curRequestData.list,
							cid = cid,
						} )
				else
					self.curRequestData.recordsRequestId = _G.MasterServer_LeaderboardGet( 
						{
							lb = self.curRequestData.leaderboardDesc.name, 
							qt = MasterServer.LeaderboardQueryType.LQT_RANGE, 
							from = self.curRequestData.beginRecordIndex, 
							to = self.curRequestData.beginRecordIndex + self.curRequestData.countRecords,
							cid = cid,
						} )
				end
				return
			end
		end

		if self.curRequestData.myRecord == nil then
			if self.curRequestData.myRecordRequestId ~= nil then
				sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: try to proceed not ready myRecordRequest" )
				return
			end
			local listParam = nil
			if self.curRequestData.bNeedMyRecordRequest then
				listParam = {}
				if self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER then
					table.insert( listParam, self.curRequestData.myUid )
				elseif self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then
					local cid = UI:GetPlayerClanByUid( self.curRequestData.myUid )
					if cid ~= UI.INVALID_U64_ID then
						table.insert( listParam, _G.U64ToStr( cid ) )
					else
						sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: request my clan data, but user not in clan" )
						listParam = nil
					end
				elseif self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
					table.insert( listParam, self.curRequestData.myUid )

				elseif self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM then

					if UI.Arena:IsInTeam() then

						if not UI.Arena:IsTeamMajor() then
							table.insert( listParam, UI.Arena:GetTeamId() )
						else
							sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: player is in major team" )
						end

					else
						sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: request my arena team data, but user not in team" )
						listParam = nil
					end

				elseif self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then

					if UI.Arena:IsInTeam() then

						if UI.Arena:IsTeamMajor() then
							table.insert( listParam, UI.Arena:GetTeamId() )
						else
							sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: player is not in major team" )
						end

					else
						sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: request my arena team data, but user not in team" )
						listParam = nil
					end

				end
			end
			local cid = nil
			if self.curRequestData.leaderboardDesc.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
				cid = UI:GetPlayerClanByUid( self.curRequestData.myUid )
			end
			if listParam then
				self.curRequestData.myRecordRequestId = _G.MasterServer_LeaderboardGet( 
					{
						lb = self.curRequestData.leaderboardDesc.name, 
						qt = MasterServer.LeaderboardQueryType.LQT_ENTITY_LIST, 
						list = listParam,
						cid = cid,
					} )
				return
			end
		end
		self.lastRequestData = self.curRequestData
		self.curRequestData = nil
		if self.nextRequestData then
			self:StartRequest( self.nextRequestData )
			self.nextRequestData = nil
		end
		if self.lastRequestData.wnd and self.lastRequestData.wnd.OnRequestLeaderboard then
			self.lastRequestData.wnd:OnRequestLeaderboard( self.lastRequestData )
		else
			sys.log( "UI.Leaderboards:ProceedCurrentRequest()[ERROR]: parent wnd don't implement OnRequestLeaderboard( data ) function" )
		end
		return
	end

	self.curRequestData = nil
	if self.nextRequestData then
		self:StartRequest( self.nextRequestData )
		self.nextRequestData = nil
	end

end

--
function UI.Leaderboards:CreateEmptyRequestData()
	return UI:CopyTable2( self.requestState )
end