--[[
	набор скриптов для поддержки Pve
	
	usefull global functions:
		float TimerGetGameTime() - текущее игровое время
		string CL_PveGetMissionName()
		<cur> <max> CL_PveGetMissionRound()
		<cur> <max> CL_PveGetMissionWave()
		<left> <max> CL_PveGetWaveInvaders()
		<alive> <total> CL_PveGetSabotageTargetsNum()
]]



Mission = 
{
	switchTimer = 0,
	round3StateCounter = 1,

	rocketGunName = { "RocketGun7", "RocketGun8", "RocketGun9" }
}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	sys.out( "Mission:SV_OnStart()" )
	eventContainer = {}
	
	sys.concmd( "e_event RocketGun7 ActivateShield" )	-- T1-T2
	sys.concmd( "e_event RocketGun8 ActivateShield" )	-- T1-T2
	sys.concmd( "e_event RocketGun9 ActivateShield" ) -- T1-T2
	sys.concmd( "e_event RocketGun4 Remove" )	-- T3-T4
	sys.concmd( "e_event RocketGun5 Remove" )	-- T3-T4
	sys.concmd( "e_event RocketGun6 Remove" ) -- T3-T4
	sys.concmd( "e_event RocketGun1 Remove" )	-- T1
	sys.concmd( "e_event RocketGun2 Remove" )	-- T1
	sys.concmd( "e_event RocketGun3 Remove" ) -- T1
	sys.concmd( "e_event ControlStationA1 FullDeactivate" )
	sys.concmd( "e_event ControlStationB1 FullDeactivate" )
	sys.concmd( "e_event ControlStationC1 FullDeactivate" )
		
	sys.concmd( "e_event PlasmaCannon1 ActivateShield" )
	sys.concmd( "e_event PlasmaCannon2 ActivateShield" )
	sys.concmd( "e_event PlasmaCannon3 ActivateShield" )
	sys.concmd( "e_event PlasmaCannon4 ActivateShield" )
	
	
	for i, aPhases in pairs( PvE_CRB_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_CRB_H:OnStart()
	AID.portals = true
	
end


-- функция вызывается, в начале каждого раунда, roundIdx - индекс с нуля.
function Mission:SV_OnStartRound( roundIdx )
	sys.out( "Mission:SV_OnStartRound( %d )", roundIdx )

	-- PvE_Mission.nCurPhase = PvE_Mission.nCurPhase + 1
	
	-- if CL_PveGetMissionName() == "capture_repairbase_t1" then
	
		-- AID.maxBots = PvE_Missions.capture_repairbase_t1.rounds[ PvE_Mission.nCurPhase ].waves[ 1 ].max_agents_at_same_time
		
		-- self.rocketGunName = { "RocketGun7", "RocketGun8", "RocketGun9", }
		
		-- local m = PvE_Missions.capture_repairbase_t1.rounds[ PvE_Mission.nCurPhase ].sabotage_list
		
		-- for i, v in pairs( m ) do
			-- local o = Entities[ v ]
			-- if o then
				-- table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, o:GetId() )
			-- end
		-- end		
	-- else
		-- AID.maxBots = PvE_Missions.capture_repairbase_hard.rounds[ PvE_Mission.nCurPhase ].waves[ 1 ].max_agents_at_same_time
		
		-- self.rocketGunName = { "RocketGun4", "RocketGun5", "RocketGun6", }	
		
		-- local m = PvE_Missions.capture_repairbase_hard.rounds[ PvE_Mission.nCurPhase ].sabotage_list
		
		-- for i, v in pairs( m ) do
			-- local o = Entities[ v ]
			-- if o then
				-- table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, o:GetId() )
			-- end
		-- end			
	-- end	
	
	-- AID:ResetPain()
	
	-- local mobsId = GetAllSpaceShips()
	
	-- for i, shipId in pairs( mobsId ) do
		-- Entities[ shipId ]:Remove()
	-- end
end


-- функция вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
function Mission:SV_OnUpdate( dt )
	--sys.out( "Mission:SV_OnUpdate( %f )  invaders %d", dt, CL_PveGetWaveInvaders() )
	
	if PvE_Mission.nCurPhase == 4 then
		
		Mission.switchTimer = Mission.switchTimer + dt
		
		if Mission.switchTimer >= 20 then
			Mission.switchTimer = 0
			Mission:SwitchTurretUpdate()
		end
		
	end
	
end


--
function Mission:SwitchTurretUpdate()
	local function gun1_on()
		sys.concmd( "e_event " .. self.rocketGunName[ 1 ] .. " DeactivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 2 ] .. " ActivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 3 ] .. " ActivateShield" )
		Mission.round3StateCounter = 2						
	end
	
	local function gun2_on()
		sys.concmd( "e_event " .. self.rocketGunName[ 1 ] .. " ActivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 2 ] .. " DeactivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 3 ] .. " ActivateShield" )
		Mission.round3StateCounter = 3					
	end

	local function gun3_on()
		sys.concmd( "e_event " .. self.rocketGunName[ 1 ] .. " ActivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 2 ] .. " ActivateShield" )
		sys.concmd( "e_event " .. self.rocketGunName[ 3 ] .. " DeactivateShield" )
		Mission.round3StateCounter = 1
	end
	

	local  gun1 = Entities[ self.rocketGunName[ 1 ] ]
	local  gun2 = Entities[ self.rocketGunName[ 2 ] ]
	local  gun3 = Entities[ self.rocketGunName[ 3 ] ]
	
	if Mission.round3StateCounter == 1 then
		if gun1 and not gun1:IsDead() then 
			gun1_on()
		elseif gun2 and not gun2:IsDead() then 
			gun2_on()
		elseif gun3 and not gun3:IsDead() then
			gun3_on()						
		end
		
	elseif Mission.round3StateCounter == 2 then
		if gun2 and not gun2:IsDead() then 
			gun2_on()
		elseif gun3 and not gun3:IsDead() then 
			gun3_on()
		elseif gun1 and not gun1:IsDead() then 
			gun1_on()						
		end

	elseif Mission.round3StateCounter == 3 then
		if gun3 and not gun3:IsDead() then 
			gun3_on()
		elseif gun1 and not gun1:IsDead() then 
			gun1_on()
		elseif gun2 and not gun2:IsDead() then 
			gun2_on()						
		end

	end
	
end


