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

	sys.out( "Mission:SV_OnStart()" )
	for i = 1, 19 do
		sys.concmd( "e_event alien_portal"..i.." FullDeactivate" )
	end
	sys.concmd( "e_event Station1 FullDeactivate" )
	sys.concmd( "e_event Station2 FullDeactivate" )
	sys.concmd( "e_event WarpGate1 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional1 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional2 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional3 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional4 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional5 FullDeactivate" )
	sys.concmd( "e_event HugeCargo_Additional6 FullDeactivate" )
	sys.concmd( "e_event XL1 FullDeactivate" )
	sys.concmd( "e_event XL2 FullDeactivate" )
	sys.concmd( "e_event XL3 FullDeactivate" )
	sys.concmd( "e_event XL4 FullDeactivate" )
	sys.concmd( "e_event XL5 FullDeactivate" )
	sys.concmd( "e_event XL6 FullDeactivate" )
	
end

