-- ----------------------------------------------------------------------------
--
-- Workfile: Timers.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id: timersmanager.lua 1660 2011-03-21 11:32:08Z $
-- ----------------------------------------------------------------------------

--
UI.TimersManager = {}
local tm = UI.TimersManager


-- ---------------------------
-- work vars
-- ---------------------------

tm.timers = {}
tm.nextId = 1


-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.TimersManager:AddTimer( hWnd, deltaTime, startTime, stopTime, bGameTime, bBroadcast )

	if deltaTime == nil and stopTime == nil then
		sys.out( "UI.TimersManager:AddTimer()[ERROR] - cannot create timer: both 'deltaTime' and 'stopTime' cannot be nil" )
		return -1
	end

	local timer = {}

	timer.id		= self.nextId	
  	timer.hOwner	= hWnd or UI.INVALID_UI_HANDLE
  	timer.deltaTime	= deltaTime
  	timer.startTime	= startTime or 0
	timer.stopTime	= stopTime
	timer.curTime	= timer.startTime
	timer.lastTime	= timer.startTime
  	timer.bGameTime	= bGameTime ~= nil and bGameTime or false
  	timer.bBroadcast= bBroadcast ~= nil and bBroadcast or false
	timer.bActive	= false
	
	timer.subscribers= {}
	self:SubscribeInternal( timer.hOwner, timer )

	self.timers[ timer.id ] = timer

	self.nextId = self.nextId + 1

	return timer.id

end


--
function UI.TimersManager:RemoveTimer( timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:UnsubscribeAll( timer )

	self.timers[ timerId ] = nil

end


--
function UI.TimersManager:SubscribeOnTimer( hWnd, timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:SubscribeInternal( hWnd, timer )

end


--
function UI.TimersManager:UnsubscribeFromTimer( hWnd, timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:UnsubscribeInternal( hWnd, timer )

end


--
function UI.TimersManager:StopTimer( timerId, bSilent )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:StopTimerInternal( timer, bSilent )	

end


--
function UI.TimersManager:StartTimer( timerId, startTime )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:StartTimerInternal( timer, startTime )

end


--
function UI.TimersManager:PauseTimer( timerId, bSilent )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:PauseTimerInternal( timer, bSilent )

end


--
function UI.TimersManager:UnpauseTimer( timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	self:UnpauseTimerInternal( timer )

end


--
function UI.TimersManager:GetTimerCurTime( timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return 0
	end

	return timer.curTime	

end


--
function UI.TimersManager:SetTimerCurTime( timerId, curTime )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	timer.curTime = curTime

end


--
function UI.TimersManager:SetTimerStartTime( timerId, startTime )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	timer.startTime = startTime

end


--
function UI.TimersManager:SetTimerStopTime( timerId, stopTime )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	if timer.deltaTime == nil and stopTime == nil then
		sys.out( "UI.TimersManager:SetTimerStopTime()[ERROR] - cannot modify timer: both 'deltaTime' and 'stopTime' cannot be nil" )
		return
	end

	timer.stopTime = stopTime

end


--
function UI.TimersManager:SetTimerDeltaTime( timerId, deltaTime )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	if deltaTime == nil and timer.stopTime == nil then
		sys.out( "UI.TimersManager:SetTimerDeltaTime()[ERROR] - cannot modify timer: both 'deltaTime' and 'stopTime' cannot be nil" )
		return
	end

	timer.deltaTime = deltaTime
	self:UpdateSubscribe( timer )

end


--
function UI.TimersManager:SetTimerOwner( timerId, hOwner )

	local timer = self.timers[ timerId ]
	if not timer then
		return
	end

	if timer.hOwner == hOwner then
		return
	end

	if timer.hOwner ~= UI.INVALID_UI_HANDLE then
		self:UnsubscribeInternal( timer.hOwner, timer )
	end

	timer.hOwner = hOwner

	if timer.hOwner ~= UI.INVALID_UI_HANDLE then
		self:SubscribeInternal( timer.hOwner, timer )	
	end

end

         
--
function UI.TimersManager:IsTimerActive( timerId )

	local timer = self.timers[ timerId ]
	if not timer then
		return false
	end

	return timer.bActive	

end


-- ---------------------------
-- work funtions
-- ---------------------------

--
function UI.TimersManager:Update( dSysTime, dGameTime )

	for id, timer in pairs( self.timers ) do
	    if timer.bActive then

			local dTime = timer.bGameTime and dGameTime or dSysTime
			
			local bStop = false
			
			local bForward = true
			if timer.deltaTime then
				bForward = timer.deltaTime >= 0
			else
				bForward = timer.stopTime >= timer.startTime
			end

  			if bForward then
  				timer.curTime = timer.curTime + dTime
  				if timer.stopTime and timer.curTime >= timer.stopTime then
  					timer.curTime = timer.stopTime
  					bStop = true
  				end
  			else
  				timer.curTime = timer.curTime - dTime
  				if timer.stopTime and timer.curTime <= timer.stopTime then
  					timer.curTime = timer.stopTime
  					bStop = true
  				end
  			end

			if timer.deltaTime then
    			if math.abs( timer.curTime - timer.lastTime ) >= math.abs( timer.deltaTime ) then
    				timer.lastTime = timer.lastTime + timer.deltaTime
    				self:FireTimerEvent( timer, UI.EV_TIMER, nil, timer.curTime )
    			end
			end

			if bStop then
				self:StopTimerInternal( timer, false )
			end
			
		end		
	end

end


--
function UI.TimersManager:SubscribeInternal( hWnd, timer )

	if hWnd == UI.INVALID_ID then
		return
	end

	if timer.subscribers[ hWnd ] then
		return
	end

	if timer.deltaTime then
	   	UI:SubscribeUiObjOnEvent( hWnd, UI.EV_TIMER )
	end

	UI:SubscribeUiObjOnEvent( hWnd, UI.EV_TIMER_ACTIVE )

	timer.subscribers[ hWnd ] = true

end


--
function UI.TimersManager:UnsubscribeInternal( hWnd, timer )

	if hWnd == UI.INVALID_ID then
		return
	end

	if not timer.subscribers[ hWnd ] then
		return
	end

	timer.subscribers[ hWnd ] = nil
	
	UI:UnsubscribeUiObjFromEvent( hWnd, UI.EV_TIMER )	
	UI:UnsubscribeUiObjFromEvent( hWnd, UI.EV_TIMER_ACTIVE )

end


--
function UI.TimersManager:UpdateSubscribe( timer )

	for hWnd in pairs( timer.subscribers ) do
    	if timer.deltaTime then
    		UI:SubscribeUiObjOnEvent( hWnd, UI.EV_TIMER )	
    	else
    		UI:UnsubscribeUiObjFromEvent( hWnd, UI.EV_TIMER )	
    	end
    end
	
end


--
function UI.TimersManager:UnsubscribeAll( timer )

	for hWnd in pairs( timer.subscribers ) do
		UI:UnsubscribeUiObjFromEvent( hWnd, UI.EV_TIMER )		
		UI:UnsubscribeUiObjFromEvent( hWnd, UI.EV_TIMER_ACTIVE )
	end

	timer.subscribers = {}

end


--
function UI.TimersManager:StopTimerInternal( timer, bSilent )

	local bOdActive = timer.bActive

	timer.bActive	= false
	timer.curTime	= startTime or timer.startTime

	if bSilent == nil then
		bSilent = false
	end

	if bOdActive and not bSilent then
		self:FireTimerEvent( timer, UI.EV_TIMER_ACTIVE, 0, 0 )
	end

end


--
function UI.TimersManager:StartTimerInternal( timer, startTime )

	timer.bActive	= true	
	timer.curTime	= startTime or timer.startTime

	self:FireTimerEvent( timer, UI.EV_TIMER_ACTIVE, 1, 0 )

end


--
function UI.TimersManager:PauseTimerInternal( timer, bSilent )

	if not timer.bActive then
		return
	end

	timer.bActive = false

	if bSilent == nil then
		bSilent = false
	end

	if not bSilent then
		self:FireTimerEvent( timer, UI.EV_TIMER_ACTIVE, 0, 1 )
	end

end


--
function UI.TimersManager:UnpauseTimerInternal( timer, startTime )

	if timer.bActive then
		return
	end

	timer.bActive = true
	self:FireTimerEvent( tiemr, UI.EV_TIMER_ACTIVE, 1, 1 )

end  


--
function UI.TimersManager:FireTimerEvent( timer, eventId, iParam1, fParam0, fParam1 )

	if timer.bBroadcast then
		UI:SendUiEvent( eventId, UI.INVALID_RESOURCE_HANDLE, UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, timer.id, iParam1 or 0, fParam0 or 0, fParam1 or 0 )
	else
		for hWnd in pairs( timer.subscribers ) do
			UI:SendUiEvent( eventId, UI.INVALID_RESOURCE_HANDLE, hWnd, UI.DELIVER_IMMEDIATE, timer.id, iParam1 or 0, fParam0 or 0, fParam1 or 0 )
		end 
	end	

end


--
function UI.TimersManager:F_OnEventEndLevel( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:StopAllTimers()

end


--
function UI.TimersManager:StopAllTimers()

	for id, timer in pairs( self.timers ) do
		self:StopTimerInternal( timer )
	end

end


--
function UI.TimersManager:SaveUiState()

	UI.store.TimersManager =
	{
		timers	= self.timers,
		nextId	= self.nextId
	}

end


--
function UI.TimersManager:RestoreUiState()

	if UI.store.TimersManager then
		self.timers = UI.store.TimersManager.timers
		self.nextId	= UI.store.TimersManager.nextId

		self:RemoveDynamicHandles()
	end

end


--
function UI.TimersManager:RemoveDynamicHandles()

	for id, timer in pairs( self.timers ) do
		if UI:IsUiHandleDynamic( timer.hOwner ) then
			timer.hOwner = UI.INVALID_UI_HANDLE
		end
		for hWnd, b in pairs( timer.subscribers ) do
			if UI:IsUiHandleDynamic( hWnd ) then
				timer.subscribers[ hWnd ] = nil
			end
		end
	end

end