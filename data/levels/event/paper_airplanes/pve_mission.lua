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

	sys.out( "Mission:SV_OnStart()" )
	sys.concmd( "e_event TowerStation1 FullDeactivate" )
	sys.concmd( "e_event TowerStation2 FullDeactivate" )
	sys.concmd( "e_event TowerStation3 FullDeactivate" )
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
	sys.concmd( "e_event PlayerRailgun1 FullActivate" )
	sys.concmd( "e_event PlayerRailgun2 FullActivate" )
	sys.concmd( "e_event PlayerRailgun3 FullActivate" )
	sys.concmd( "e_event PlayerRailgun4 FullActivate" )
	sys.concmd( "e_event PlayerRailgun5 FullActivate" )
	sys.concmd( "e_event PlayerRailgun6 FullActivate" )
	sys.concmd( "e_event PlayerRailgun7 FullActivate" )
	
end

