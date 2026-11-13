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

	AID.portals = true
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	
	eventContainer = {}
	
	for i, aPhases in pairs( PvE_FS_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_FS_H:OnStart()
	
end

function Mission:SV_OnStartRound( roundIdx )

end

function Mission:SV_OnSpaceShipSpawn( ship )
	if PvE_Mission.nCurPhase == 3 or PvE_Mission.nCurPhase == 4 then
		if ship:GetPlayerIdx() < 0 then
			table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, ship:GetId() )
		end	
	end
end