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

	rocketGunName = { "RocketGun1", "RocketGun2", "RocketGun3", },
}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()

	PvE_Mission.aPhases = {}
	for i = 1, 5 do 
		PvE_Mission.aPhases[ i ] = {} 
		PvE_Mission.aPhases[ i ].sRoundType = "custom"		
		PvE_Mission.aPhases[ i ].nRoundPhase = i
	end
	
	PvE_Func:InitMission()
	
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	PvE_Mission:OnStart()
	sys.out( "Mission:SV_OnStart()" )

	sys.concmd( "e_event antenna FullDeactivate" )
	
	if CL_PveGetMissionName() == "bigship_building_2_easy" then
	else
		AID.mod_by_bot = 0
		PvE_Mission.bFocusPoints = false
	end	
	
	local i
	for i = 1, 3 do
		sys.concmd( "e_event Turret_Beacon_bb2"..i.." FullDeactivate" )
	end
	
	for i = 1, 3 do
		sys.concmd( "e_event beacon_test"..i.." FullDeactivate" )
	end
	
	for i = 1, 3 do
		sys.concmd( "e_event portal_"..i.." FullDeactivate" )
	end
	
	for i = 9, 23 do
		sys.concmd( "e_event portal_"..i.." FullDeactivate" )
	end
	
	for i = 29, 30 do
		sys.concmd( "e_event portal_"..i.." FullDeactivate" )
	end
	
	-- for i = 1, 32 do
		-- sys.concmd( "e_event AiRailgun"..i.." FullDeactivate" )
	-- end
	
end

function Mission:SV_OnSpaceShipSpawn( ship )
	if PvE_Mission.nCurPhase == 2 then
	else
		if ship:GetPlayerIdx() < 0 then
			local p = {}
			p[ 1 ] = ship
			designers:AddPackInAID( p )
			
		end	
	end	
end