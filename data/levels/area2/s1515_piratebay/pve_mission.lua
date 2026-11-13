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
function Mission:SV_OnStart()
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450

	eventContainer = {}
	
	AID.portals = true
	AID.mod_by_bot = 0
	
	for i, aPhases in pairs( PvE_PB_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_PB_H:OnStart()
	
	sys.out( "Mission:SV_OnStart()" )
end

function Mission:SV_OnStartRound( roundIdx )

end

function Mission:SV_OnSpaceShipSpawn( ship )
	if PvE_Mission.nCurPhase == 4 then
		if ship:GetPlayerIdx() < 0 then
			table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, ship:GetId() )
		end	
	end
end