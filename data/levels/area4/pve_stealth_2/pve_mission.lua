--[[
	набор скриптов для поддержки Pve
]]


Mission = 
{
}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()
	cvars.sv_mmBattleRank = 15 

	eventContainer = {}

	sys.out( "Mission:SV_OnStart()" )
	
	local i
	
	
	for i, aPhases in pairs( PvE_ST_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_ST:OnStart()
	AID.portals = true
		
end

function MobOnDeath( mobId, pos )

end

function Mission:SV_OnStartRound( roundIdx )

end

function Mission:SV_OnSpaceShipSpawn( ship )
end

function Mission:SV_OnInteractiveObjectInteracted( object, userObject )

	if not object:GetParent() then
		local entityId = userObject:GetId()
		if not PvE_Mission.aSapperPlayers[ entityId ] then
			userObject:AddChild( object )
			PvE_Mission.aSapperPlayers[ entityId ] = {}
			PvE_Mission.aSapperPlayers[ entityId ][ 1 ] = entityId
			PvE_Mission.aSapperPlayers[ entityId ][ 3 ] = object:GetNetworkId()
			object:SetActive( false )
			object:ShowInHud( false )
		end
	end	
end

function Mission:SV_OnInteractiveObjectDetached( object, userObject )
	local entityId = userObject:GetId()
	if PvE_Mission.aSapperPlayers[ entityId ] then
		PvE_Mission.aSapperPlayers[ entityId ] = nil
		object:SetActive( true )
		object:ShowInHud( true )
	end	
end