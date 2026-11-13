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
}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:CL_OnStart()

	sys.out( "Mission:CL_OnStart()" )
	sys.concmd( "e_event PlasmaGun1 FullDeactivate" )
	sys.concmd( "e_event PlasmaGun2 FullDeactivate" )
	
end

