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

}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	
	eventContainer = {}
	
	sys.out( "Mission:SV_OnStart()" )
	sys.concmd( "e_event ControlStationA1 DisableAi" )
	sys.concmd( "e_event ControlStationB1 DisableAi" )
	sys.concmd( "e_event ControlStationC1 DisableAi" )
	sys.concmd( "e_event ControlStationA1 HideFromHud" )
	sys.concmd( "e_event ControlStationB1 HideFromHud" )
	sys.concmd( "e_event ControlStationC1 HideFromHud" )
	
	for i, aPhases in pairs( PvE_AB_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_AB_H:OnStart()
	AID.portals = true
	
	local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
	for i, turId in pairs( mainTur ) do
		Entities[ turId ]:SetDamageable( false )
		Entities[ turId ]:ShowInHud( false )
	end
	
	Entities[ "SpaceShield_Gen" ]:SetDamageable( false )
	
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