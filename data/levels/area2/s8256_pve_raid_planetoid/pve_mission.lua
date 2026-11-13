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
	
	for i, aPhases in pairs( Container_PvE_PlanetoidRaid ) do
		PvE_Mission[ i ] = aPhases
	end
	
	eventContainer = {}
	
	
	AID.portals = true	
	AID.warp = false
	AID.bonus_enable  = false
	
	monsterHealth = 6
	leftClaw = 0
	rightClaw = 0
	PvE_Func:InitMission()
	PvE_PlanetoidRaid:OnStart()	
	circleTable = sys.new( PvE_Mission.aPhases )
end

-- r
function Mission:CL_OnUpdate( dt )
-- довставляем марки - восклицательные знаки, в случае если их не удалось вставить сразу( на клиенте не  создался объект)
	if cl_FocusPoints then 
		--sys.out("123")
		for i, v in pairs( cl_FocusPoints ) do -- v = { pos= Vec3( posX, posY, posZ ), defName = defName, mark_type = mark_type , id = id   } --
			if not v.id and v.defName and v.pos  then	-- инфа с сервера приходила, но объект на был найден!
				for def_ind, def_id in pairs( GetEntitiesByDef( v.defName ) ) do
					if def_id then
						local o = Entities[ def_id ]
						if o and #( o:GetPos() - v.pos ) < 350 then
							v.id = def_id
							UI:ShowHudMarkNotify( def_id, v.mark_type )
						end
					end
				end
			end
		end
	end
	
end

function Mission:SV_OnSpaceShipSpawn( ship )
	
	if PvE_Mission.nCurPhase == 1 then
		if ship:GetPlayerIdx() < 0 then
			local wave = PvE_Missions.pve_planetoidraid.rounds[ 1 ].waves[ 1 ]
			local p = {}
			p[ 1 ] = ship
			designers:AddPackInAID( p )			
			for i, k in pairs( wave ) do
				if type( wave[ i ] ) == "table" then
					PvE_Mission.aPhases[ 1 ].shipsId[ ship:GetId() ] = ship:GetId()
				end	
			end	
		end	
	elseif PvE_Mission.nCurPhase == 2 then
		if ship:GetPlayerIdx() < 0 then
			local wave = PvE_Missions.pve_planetoidraid.rounds[ 1 ].waves[ 2 ]
			local p = {}
			p[ 1 ] = ship
			designers:AddPackInAID( p )		
			for i, k in pairs( wave ) do
				if type( wave[ i ] ) == "table" then
					PvE_Mission.aPhases[ 2 ].shipsId[ ship:GetId() ] = ship:GetId()		
				end	
			end
		end	
	end
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