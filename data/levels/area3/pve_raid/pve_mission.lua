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
	AID.bonus_enable  = false
	sys.out( "Mission:SV_OnStart()" )
	for i = 1, 9 do
		sys.concmd( "e_event alien_portal"..i.." FullDeactivate" )
	end
	for i = 1, 15 do
		sys.concmd( "e_event MegaBomb"..i.." FullDeactivate" )
	end
	
end

function Mission:SV_OnSpaceShipSpawn( ship )
	
	if ship:GetPlayerIdx() < 0 then
		local p = {}
		p[ 1 ] = ship
		designers:AddPackInAID( p )
	end	
end