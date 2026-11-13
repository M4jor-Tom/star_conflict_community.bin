-- -------------------------------------------------------------
-- Created: 10-Sept-2018
-- Copyright © 2018, Targem LLC. All rights reserved.
-- -------------------------------------------------------------

if UI.RewardSchedule then
	return
end

UI.RewardSchedule = {}

-- -----------------------------------
-- interface funcitons
-- -----------------------------------


--
function UI.RewardSchedule:GetGoldRewardState()

	return self.goldRewardState

end


--
function UI.RewardSchedule:F_OnEventMasterServerConnected( hSender, iParam0, iParam1, fParam0, fParam1 )
	
	self:Init()

end


--
function UI.RewardSchedule:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	
	self:Reset()

end



--
function UI.RewardSchedule:MasterServer_OnRewardSchedule( result, requestId, param1, param2, u64Param )

	self:UpdateSchedule()
	
end


-- -----------------------------------
-- const
-- -----------------------------------

UI.RewardSchedule.GOLD_REWARD_NOTIFY_START	= 4 * 60 * 60	--[сек] - за 4 часа до начала периода золотой награды начинаются нотификации в чат --#98615
UI.RewardSchedule.GOLD_REWARD_NOTIFY_DELAY	= 30 * 60		--[сек] - нотификации происходят каждые полчаса

-- -----------------------------------
-- vars
-- -----------------------------------

UI.RewardSchedule.bInited				= false
UI.RewardSchedule.schedule				= {}
UI.RewardSchedule.goldRewardNotifyTimer	= -1

UI.RewardSchedule.goldRewardState =
{
	isActive	= false,
	nextTime	= UI.INVALID_U64_ID,
	val			= 0,
}

-- -----------------------------------
-- work funcitons
-- -----------------------------------

--
function UI.RewardSchedule:Init()

	self:Reset()
	
	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return
	end
	
	self.bInited = true
	self:UpdateSchedule()

end


--
function UI.RewardSchedule:Reset()

	--sys.log( "UI.RewardSchedule:Reset()" )

	self.bInited				= false
	self.schedule				= {}
	self.goldRewardNotifyTimer	= -1
	
	self.goldRewardState =
	{
		isActive	= false,
		nextTime	= UI.INVALID_U64_ID,
		val			= 0,
	}
	
end


--
function UI.RewardSchedule:UpdateSchedule()

	self.schedule = self:FixSchedule( _G.MasterServer_GetRewardSchedule() )
	
	--sys.log( "UI.RewardSchedule:UpdateSchedule() - schedule is:" )
	--dprint( self.schedule )
	
	self:UpdateGoldReward()

end


--
function UI.RewardSchedule:FixSchedule( schedule )

	if type( schedule ) ~= "table" then
		sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: schedule is not table" )
		return {}
	end
	
	local fixedSchedule = UI:CopyTable2( schedule )
	
	for dayKey, dayInfo in pairs( schedule ) do
	
		-- ключи строковые, из-за технических особенностей передачи таблиц в коде cpp
		if type( dayKey ) ~= "string" or type( dayInfo ) ~= "table" then
			sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid format; <int>=<table> expected" )
			return {}
		end
		
		local day = tonumber( dayKey )
		if day == nil then
			sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid format; <int>=<table> expected" )
			return {}
		end
		
		if day < 0 or day > 6 then
			sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid day %d", day )
			return {}
		end
		
		fixedSchedule[ day ] = fixedSchedule[ dayKey ]
		fixedSchedule[ dayKey ] = nil
		
		local numIntervals = UI:GetTableLength( dayInfo )
		
		for intervalKey, intervalInfo in pairs( dayInfo ) do
		
			-- ключи строковые, из-за технических особенностей передачи таблиц в коде cpp
			if type( intervalKey ) ~= "string" or type( intervalInfo ) ~= "table" then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid format for day %d; <int>=<table> expected", day )
				return {}
			end
			
			local intervalIdx = tonumber( intervalKey )
			if intervalIdx == nil then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid format for day %d; <int>=<table> expected", day )
				return {}
			end
			
			if intervalIdx < 1 or intervalIdx > numIntervals then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid interval idx %d in day %d", intervalIdx, day )
				return {}
			end
			
			fixedSchedule[ day ][ intervalIdx ] = fixedSchedule[ day ][ intervalKey ]
			fixedSchedule[ day ][ intervalKey ] = nil
			
			if type( intervalInfo.hourBegin ) ~= "number" then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid type of \"hourBegin\" for interval %d day %d; \"number\" expected, got \"%s\"", intervalIdx, day, type( intervalInfo.hourBegin ) )
				return {}
			end
			
			if type( intervalInfo.hourEnd ) ~= "number" then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid type of \"hourEnd\" for interval %d day %d; \"number\" expected, got \"%s\"", intervalIdx, day, type( intervalInfo.hourEnd ) )
				return {}
			end
			
			if intervalInfo.hourBegin > intervalInfo.hourEnd then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: hourBegin > hourEnd in interval %d day %d", intervalIdx, day )
				return {}
			end
			
			if intervalInfo.goldReward ~= nil and type( intervalInfo.goldReward ) ~= "number" then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: invalid type of \"goldReward\" for interval %d day %d; \"number\" or nil expected, got \"%s\"", intervalIdx, day, type( intervalInfo.goldReward ) )
				return {}
			end
		
		end
		
		for intervalIdx = 1, numIntervals do
			if not fixedSchedule[ day ][ intervalIdx ] then
				sys.log( "UI.RewardSchedule:FixSchedule()[ERROR]: missing interval %d in day %d; regular array expected", intervalIdx, day )
				return {}
			end
		end
	
	end
	
	return fixedSchedule

end


--
function UI.RewardSchedule:UpdateGoldReward()

	local oldGoldRewardState = self.goldRewardState
	self.goldRewardState = self:DetectGoldRewardStateFromSchedule( self.schedule )
	
	local bGoldRewardChanged =
		oldGoldRewardState.isActive ~= self.goldRewardState.isActive
		or oldGoldRewardState.nextTime ~= self.goldRewardState.nextTime
		or oldGoldRewardState.val ~= self.goldRewardState.val
	
	if bGoldRewardChanged then
		
		self.goldRewardNotifyTimer = -1
		self:UpdateGoldRewardNotifyTimer()
		
		UI:SendUiEvent( UI.EV_GOLD_REWARD_STATE_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
		
		--sys.log( "UI.RewardSchedule:UpdateGoldReward() - goldRewardState is:" )
		--dprint( self.goldRewardState )
		
	end

end


--
function UI.RewardSchedule:DetectGoldRewardStateFromSchedule( schedule )
	
	local goldRewardState =
	{
		isActive	= false,
		nextTime	= UI.INVALID_U64_ID,
		val			= 0,
	}
	
	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return goldRewardState
	end
	
	local curTime	= _G.MasterServer_GetServerTime()
	local dateTime	= _G.PlatformTimeToTable( curTime )
	local curDay	= ( dateTime.dayOfWeek == 0 ) and 6 or dateTime.dayOfWeek - 1	-- в данных воскресенье=0, переводим на понедельник=0
	local curHour	= dateTime.hour
	
	local NUM_DAYS = 7
	
	local isActive	= false
	local nextDay	= -1
	local nextHour	= -1
	local val		= 0
	
	for dayIdx = 0, NUM_DAYS - 1 do
	
		local day = ( curDay + dayIdx ) % NUM_DAYS
		
		local dayInfo = schedule[ day ]
		if dayInfo then
		
			for intervalIdx, intervalInfo in ipairs( dayInfo ) do
			
				if intervalInfo.goldReward then
				
					val = intervalInfo.goldReward
			
					if day ~= curDay or curHour < intervalInfo.hourBegin then
					
						isActive	= false
						nextDay		= day
						nextHour	= intervalInfo.hourBegin
						break
						
					end

					-- допускается интервал с одинаковым временем начала и конца, например, 2-2, это будет эквивалентно 2-3
					if( intervalInfo.hourBegin == intervalInfo.hourEnd and curHour == intervalInfo.hourEnd ) or ( intervalInfo.hourBegin <= curHour and curHour < intervalInfo.hourEnd ) then
					
						-- проверка, не переходит ли интервал на следующие сутки
						if( intervalInfo.hourBegin == intervalInfo.hourEnd and intervalInfo.hourEnd == 23 ) or intervalInfo.hourEnd == 24 then
						
							local dayAfter = ( day + 1 ) % NUM_DAYS
							
							local dayAfterInfo = schedule[ dayAfter ]
							local dayAfterIntervalInfo = dayAfterInfo and dayAfterInfo[ 1 ]
							
							if dayAfterIntervalInfo and ( not dayAfterIntervalInfo.goldReward or dayAfterIntervalInfo.goldReward ~= intervalInfo.goldReward or dayAfterIntervalInfo.hourBegin ~= 0 ) then
								dayAfterIntervalInfo = nil
							end
							
							if dayAfterIntervalInfo then
							
								isActive	= true
								nextDay		= dayAfter
								nextHour	= ( dayAfterIntervalInfo.hourBegin == dayAfterIntervalInfo.hourEnd ) and dayAfterIntervalInfo.hourEnd + 1 or dayAfterIntervalInfo.hourEnd
								break
								
							end

						end
						
						isActive	= true
						nextDay		= day
						nextHour	= ( intervalInfo.hourBegin == intervalInfo.hourEnd ) and intervalInfo.hourEnd + 1 or intervalInfo.hourEnd
						break
						
					end
					
				end
			
			end
			
			if nextDay ~= -1 then
				break
			end
			
		end
		
	end
	
	if nextDay ~= -1 then
	
		goldRewardState.isActive	= isActive
		goldRewardState.val			= val
		
		local secsInDay = 24 * 60 * 60
		local nextTimeInHours =
			math.floor( ( curTime * 0.001 ).l / secsInDay ) * 24	-- начало текущих суток
			+ ( ( nextDay - curDay ) % NUM_DAYS ) * 24				-- количество суток до начала
			+ nextHour												-- количество часов с начала суток
		
		goldRewardState.nextTime = u64( nextTimeInHours * 60 * 60 ) * 1000
		
	end

	return goldRewardState

end


--
function UI.RewardSchedule:OnNewFrame( dt_sys, dt_game )

	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return
	end

	self:CheckUpdateGoldReward()
	self:UpdateGoldRewardNotifyTimer( dt )

end


--
function UI.RewardSchedule:CheckUpdateGoldReward()

	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return
	end

	if self.goldRewardState.nextTime ~= UI.INVALID_U64_ID then
		if _G.MasterServer_GetServerTime() >= self.goldRewardState.nextTime then
			self:UpdateGoldReward()
		end
	end
	
end	
	

	--
function UI.RewardSchedule:UpdateGoldRewardNotifyTimer( dt )

	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return
	end

	if not self.goldRewardState.isActive and self.goldRewardState.nextTime ~= UI.INVALID_U64_ID then
	
		local curTime = _G.MasterServer_GetServerTime()
		local timeLeft = ( self.goldRewardState.nextTime > curTime ) and ( ( self.goldRewardState.nextTime - curTime ) * 0.001 ).l or 0
		
		if timeLeft > 0 and timeLeft <= self.GOLD_REWARD_NOTIFY_START then
		
			if self.goldRewardNotifyTimer == -1 then
				self.goldRewardNotifyTimer = 0
			else
				self.goldRewardNotifyTimer = self.goldRewardNotifyTimer - dt
			end
			
			if self.goldRewardNotifyTimer <= 0 then
				self.goldRewardNotifyTimer = self.GOLD_REWARD_NOTIFY_DELAY
				self:NotifyOfGoldReward( timeLeft )
			end
		
		else
			self.goldRewardNotifyTimer = -1
		end
		
	else
		self.goldRewardNotifyTimer = -1
	end

end


--
function UI.RewardSchedule:NotifyOfGoldReward( timeLeft )
	
	local str = UI:GetStringByName( "scheduledGoldReward_chatMsg" )	
	local strTime = UI:Time2Str45( timeLeft )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$time%$", strTime )
	
	if numSubst == 0 then
		sys.log( "UI.RewardSchedule:NotifyOfGoldReward()[ERROR]: cannot find placegolder \"$time$\" in string \"scheduledGoldReward_chatMsg\"" )
		str = string.format( "[INVALID STRING] Time left for gold reward hours: %s", strTime )
	end
	
	UI.Chat:AddSystemMessage( str )
	
end


-- ---------------------------------------------

-- чтобы при перезагрузке ресурсов (если намеренно обнулить - UI.RewardSchedule=nil), всё снова инициализировалось (штатная инициализация происходит в F_OnEventMasterServerConnected())
if not UI.RewardSchedule.bInited then
	UI.RewardSchedule:Init()
end