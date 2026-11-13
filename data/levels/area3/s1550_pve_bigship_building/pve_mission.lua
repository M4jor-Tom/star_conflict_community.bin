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
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450

	eventContainer = {}

	sys.out( "Mission:SV_OnStart()" )
	sys.concmd( "e_event AiRailgun1 FullDeactivate" )
	sys.concmd( "e_event AiRailgun2 FullDeactivate" )
	sys.concmd( "e_event AiRailgun3 FullDeactivate" )
	sys.concmd( "e_event AiRailgun4 FullDeactivate" )
	sys.concmd( "e_event AiRailgun5 FullDeactivate" )
	sys.concmd( "e_event AiRailgun6 FullDeactivate" )
	sys.concmd( "e_event AiRailgun7 FullDeactivate" )
	sys.concmd( "e_event AiRailgun8 FullDeactivate" )
	sys.concmd( "e_event AiRailgun9 FullDeactivate" )
	sys.concmd( "e_event AiRailgun10 FullDeactivate" )
	sys.concmd( "e_event AiRailgun11 FullDeactivate" )
	sys.concmd( "e_event AiRailgun12 FullDeactivate" )
	sys.concmd( "e_event AiRailgun13 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun1 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun2 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun3 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun4 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun5 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun6 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun7 FullDeactivate" )
	sys.concmd( "e_event PlayerRailgun8 FullDeactivate" )
	
	for i, aPhases in pairs( PvE_BSB_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_BSB_H:OnStart()
	AID.portals = true
		
end

function MobOnDeath( mobId, pos )

end

function Mission:SV_OnStartRound( roundIdx )

end

function Mission:SV_OnSpaceShipSpawn( ship )

	
	if PvE_Mission.nCurPhase == 4 then
	else
		if ship:GetPlayerIdx() < 0 then
			table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, ship:GetId() )
		end	
	end	

end