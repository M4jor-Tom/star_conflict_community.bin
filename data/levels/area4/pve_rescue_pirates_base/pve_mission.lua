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

	sys.out( "Mission:SV_OnStart()" )
	
	for i, aPhases in pairs( PvE_RPB_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_RPB:OnStart()
	AID.portals = true
		
end

function MobOnDeath( mobId, pos )

end

function Mission:SV_OnStartRound( roundIdx )

end

function Mission:SV_OnSpaceShipSpawn( ship )
	if PvE_Mission.nCurPhase == 1 or PvE_Mission.nCurPhase == 2 then
		if ship:GetPlayerIdx() < 0 then
			table.insert( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId, ship:GetId() )
		end	
	end
end