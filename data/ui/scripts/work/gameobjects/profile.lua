-- ----------------------------------------------------------------------------
--
-- Workfile: Options.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: options.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Profile then
	return
end
UI.Profile = {}

UI.Profile.requestId = nil
UI.Profile.uid = nil
UI.Profile.achievements = nil
UI.Profile.common_stats = nil
UI.Profile.rank_stats = nil
UI.Profile.clanId = nil
UI.Profile.medals = nil
UI.Profile.dailyLoginReward = false
UI.Profile.clearAchieveData = nil
UI.Profile.maxScore = nil
UI.Profile.requestsToClan = nil

--
function UI.Profile:Clear()

	self.uid = nil
	self.achievements = nil
	self.requestId = nil
	self.points = nil
	self.clanId = nil
	self.medals = nil
	self.dailyLoginReward = false
	self.maxScore = nil
	self.requestsToClan = nil

end

--
function UI.Profile:MasterServer_OnNotification( notification, params )
	if notification == MasterServer.ServerNotification.SN_DAILY_LOGIN then
		self.dailyLoginReward = true
		local profile = _G.GetProfileTable()
		profile.dailiLoginParams = params
		Profile:Save()
	end
end

--
function UI.Profile:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if result ~= 0 then
		return
	end

	if field == MasterServer.UserProfileField.UPF_ACHIEVEMENTS then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.achievements = profile.achievements
			if not self.achievements then
				self.achievements = {}
				sys.log( "UI.Profile:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )[ERROR]: profile.achievements is nil" )
			end
			self:PrepareAchievements()
		end
	elseif field == MasterServer.UserProfileField.UPF_GENERAL_STATS then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.common_stats = profile.generalStats
			UI.Profile_CommonWnd:UpdateIfVisible( uid )
		end
	elseif field == MasterServer.UserProfileField.UPF_VESSELS_RANK_STATS then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.rank_stats = profile.vesselsRankStats
		end
	elseif field == MasterServer.UserProfileField.UPF_CLAN_ID then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.clanId = profile.clanId
		end
	elseif field == MasterServer.UserProfileField.UPF_MEDALS then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.medals = profile.medals
		end
	elseif field == MasterServer.UserProfileField.UPF_TITLES then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.titles = profile.titles
		end
	elseif field == MasterServer.UserProfileField.UPF_AVATARS then
		if uid == self.uid then
			local profile = _G.MasterServer_UserProfileGet( uid )
			self.avatars = profile.avatars
		end
	end

end


--
function UI.Profile:PrepareAchievements()

	local achievTable = {}
	local achiveCount = 0
	self.points = 0
	for i = 1, #self.achievements do
		if Achievements[ i ] ~= nil then
		
			for j = 1, #self.achievements[ i ].ranks do
				if Achievements[ i ].ranks[ j ] then
					if Achievements[ i ].ranks[ j ].points then
						self.points = self.points + Achievements[ i ].ranks[ j ].points
					end
				else
					sys.log( "UI.Profile:PrepareAchievements()[ERROR]: achieved rank more then max. Achieve id: %d, achieved rank: %d, max rank: %d", i, j, #Achievements[ i ].ranks )
				end
			end

			local j = #self.achievements[ i ].ranks
			if j > #Achievements[ i ].ranks then
				sys.log( "UI.Profile:PrepareAchievements()[ERROR]: achieved rank more then max. Achieve id: %d, achieved rank: %d, max rank: %d", i, j, #Achievements[ i ].ranks )
				j = #Achievements[ i ].ranks
			else
				if j > 0 then
					achiveCount = achiveCount + 1
					achievTable[ achiveCount ] = {}
					achievTable[ achiveCount ].id = i
					achievTable[ achiveCount ].rank = j
					achievTable[ achiveCount ].value = self.achievements[ i ].value
					achievTable[ achiveCount ].achieved = true
					achievTable[ achiveCount ].date = self.achievements[ i ].ranks[ j ]
				end
				if #Achievements[ i ].ranks > #self.achievements[ i ].ranks then
					achiveCount = achiveCount + 1
					achievTable[ achiveCount ] = {}
					achievTable[ achiveCount ].id = i
					achievTable[ achiveCount ].rank = #self.achievements[ i ].ranks + 1
					achievTable[ achiveCount ].value = self.achievements[ i ].value
				end
			end


			--[[for j = #self.achievements[ i ].ranks + 1, #Achievements[ i ].ranks do
				achiveCount = achiveCount + 1
				achievTable[ achiveCount ] = {}
				achievTable[ achiveCount ].id = i
				achievTable[ achiveCount ].rank = j
				achievTable[ achiveCount ].value = self.achievements[ i ].value
			end]]
			
		end
	end
	self.clearAchieveData = self.achievements
	self.achievements = achievTable

end


--
function UI.Profile:GetAchieveUnlockData( id, rank )
	if self.clearAchieveData[ id ].ranks[ rank ] then
		return self.clearAchieveData[ id ].ranks[ rank ]
	end
	return nil
end

--
function UI.Profile:GetAchieveRankCount( id )
	return #Achievements[ id ].ranks
end

--
function UI.Profile:RequestAchievements( uid )

	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_ACHIEVEMENTS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.achievements = profile.achievements
	if self.achievements then
		self:PrepareAchievements()
		return nil
	else
		return requestId
	end	

end

--
function UI.Profile:IfAchievementUnlocked( id, rank )
	if self.clearAchieveData[ id ].ranks[ rank ] then
		return true
	end
	--[[for i = 1, #self.achievements do
		if self.achievements[ i ].id == id then
			return self.achievements[ i ].achieved
		end
	end]]
	return false
end


--
function UI.Profile:GetAchievements()

	return self.achievements

end


--
function UI.Profile:GetAllPoints()

	return self.points

end

--
function UI.Profile:GetMaxPoints()
	if self.maxScore == nil then
		self.maxScore = 0
		for k, v in pairs( Achievements ) do
			if not v.invisible_by_default and not v.disabled then
				if v.category == nil then
					sys.log( "UI.Profile:GetMaxPoints()[ERROR]: achieve %d is enabled, but nave no category", k )
				end
				if v.ranks then
					for kk, vv in pairs( v.ranks ) do
						self.maxScore = self.maxScore + vv.points
					end
				end
			end
			if v.invisible_by_default then
				if v.ranks then
					for kk, vv in pairs( v.ranks ) do
						if vv.points > 0 then
							sys.log( "UI.Profile:GetMaxPoints()[ERROR]: achieve %d is great, but nave non-zero reward points", k )
						end
					end
				end
			end
		end
	end
	return self.maxScore
end

--
function UI.Profile:RequestCommonStats( uid )

	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_GENERAL_STATS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.common_stats = profile.generalStats
	if self.common_stats then
		return nil
	else
		return requestId
	end	

end

--
function UI.Profile:IfCommonStatsLoaded( uid )

	if self.uid == uid then
		if self.common_stats ~= nil then
			return true
		end
	end

	return false

end

--
function UI.Profile:GetCommonStats()

	return self.common_stats

end


--
function UI.Profile:RequestRankStats( uid )

	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_VESSELS_RANK_STATS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.rank_stats = profile.vesselsRankStats
	if self.rank_stats then
		return nil
	else
		return requestId
	end	

end


--
function UI.Profile:IfRankStatsLoaded( uid )

	if self.uid == uid then
		if self.rank_stats ~= nil then
			return true
		end
	end

	return false

end


--
function UI.Profile:GetRankStats()

	return self.rank_stats

end


--
function UI.Profile:RequestClanId( uid )

	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_CLAN_ID )
	--self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.clanId = profile.clanId
	if self.clanId then
		return nil
	else
		return requestId
	end	

end

--
function UI.Profile:IfClanIdLoaded( uid )

	if self.uid == uid then
		if self.clanId ~= nil then
			return true
		end
	end

	return false

end

--
function UI.Profile:GetClanId( uid )

	local profile = _G.MasterServer_UserProfileGet( uid )
	if profile.clanId then
		return profile.clanId
	else
		return UI.INVALID_U64_ID
	end

end

--
function UI.Profile:RequestMedals( uid )
	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_MEDALS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.medals = profile.medals
	if self.medals then
		return nil
	else
		return requestId
	end
end

--
function UI.Profile:IfMedalsLoaded( uid )
	if self.uid == uid then
		if self.medals ~= nil then
			return true
		end
	end
	return false
end

--
function UI.Profile:GetMedals()
	return self.medals
end

--
function UI.Profile:RequestTitles( uid )
	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_TITLES )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.titles = profile.titles
	if self.titles then
		return nil
	else
		return requestId
	end
end

--
function UI.Profile:IfTitlesLoaded( uid )
	if self.uid == uid then
		if self.titles ~= nil then
			return true
		end
	end
	return false
end

--
function UI.Profile:GetTitles( uid )
	local titles = _G.MasterServer_UserProfileGet( uid ).titles
	return titles and titles.acquiredTitles or {}
end

--
function UI.Profile:GetCurrentTitle( uid )
	local titles = _G.MasterServer_UserProfileGet( uid ).titles
	return titles and titles.title or PlayerTitleId.NO_TITLE
end

--
function UI.Profile:IsTitleUnlocked( title, uid )
	local titles = self:GetTitles( uid )
	for k, v in pairs( titles ) do
		if v.id == title then
			return true
		end
	end
	return false
end

--
function UI.Profile:RequestAvatars( uid )
	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_AVATARS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.avatars = profile.avatars
	if self.avatars then
		return nil
	else
		return requestId
	end
end

--
function UI.Profile:IfAvatarsLoaded( uid )
	if self.uid == uid then
		if self.avatars ~= nil then
			return true
		end
	end
	return false
end

--
function UI.Profile:GetAvatars( uid )
	local avatars = _G.MasterServer_UserProfileGet( uid ).avatars
	return avatars and avatars.acquiredAvatars or {}
end


--
function UI.Profile:IsAvatarUnlocked( uid, avatar )
	if avatar == "" then
		return true
	end
	local avatars = self:GetAvatars( uid )
	return avatars and avatars[ avatar ] ~= nil
end

--
function UI.Profile:GetCurrentAvatar( uid )
	local avatars = _G.MasterServer_UserProfileGet( uid ).avatars
	return avatars and avatars.avatar or ""
end

--
function UI.Profile:RequestMottos( uid )
	local requestId = _G.MasterServer_UserProfileRequestField( uid, MasterServer.UserProfileField.UPF_MOTTOS )
	self.uid = uid
	local profile = _G.MasterServer_UserProfileGet( uid )
	self.mottos = profile.mottos
	if self.mottos then
		return nil
	else
		return requestId
	end
end

--
function UI.Profile:IfMottosLoaded( uid )
	if self.uid == uid then
		if self.mottos ~= nil then
			return true
		end
	end
	return false
end

--
function UI.Profile:GetMottos( uid )
	local mottos = _G.MasterServer_UserProfileGet( uid ).mottos
	return mottos and mottos.acquiredMottos or {}
end


--
function UI.Profile:IsMottoUnlocked( uid, motto )
	if motto == "" then
		return true
	end
	local mottos = self:GetMottos( uid )
	return mottos and mottos[ motto ] ~= nil
end

--
function UI.Profile:GetCurrentMotto( uid )
	local mottos = _G.MasterServer_UserProfileGet( uid ).mottos
	return mottos and mottos.motto or ""
end

--
function UI.Profile:IsNeedShowDailyLoginRewardWnd()
	if not self.dailyLoginReward then
		local profile = _G.GetProfileTable()
		if profile.dailiLoginParams then
			return true
		end
	end

	return self.dailyLoginReward
end

--
function UI.Profile:GetDailyLoginRewardIdx()
	local profile = _G.GetProfileTable()
	return profile.dailiLoginParams and profile.dailiLoginParams.tier
end


--
function UI.Profile:GetDailyLoginNotificationParams()

	local profile = _G.GetProfileTable()
	return profile.dailiLoginParams

end


--
function UI.Profile:ResetNeedShowDailyLoginRewardWnd()
	self.dailyLoginReward = false
	local profile = _G.GetProfileTable()
	profile.dailiLoginParams = nil
	Profile:Save()
end

--
function UI.Profile:HasEnoughtFightToBeATeacher()
	local profile = _G.MasterServer_UserProfileGet( _G.MasterServer_GetLocalUserId() )
	if profile.generalStats then
		return ( profile.generalStats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_PVE_BATTLES ] + profile.generalStats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_BATTLES ] ).l >= TeacherMinFights
	end
	return false
end