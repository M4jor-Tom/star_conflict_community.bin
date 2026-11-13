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

	eventContainer = PvE_Mission.aEvents
	
	local i
	
	for i = 1, 22 do
		sys.concmd( "e_event Jericho"..i.." FullDeactivate" )
	end
	
	for i = 1, 4 do
		sys.concmd( "e_event Bomb"..i.." FullDeactivate" )
	end
	
	for i = 1, 1 do
		sys.concmd( "e_event EnergyGenerator"..i.." HideFromHud" )
	end

	if CL_PveGetMissionName() == "pve_desttown_waves_easy" then
		PvE_Container.aWaves = PvE_Desttown.aWaves.easy
	else	
		PvE_Container.aWaves = PvE_Desttown.aWaves.hard
		PvE_Mission.bFocusPoints = false
		AID.mod_by_bot = 0
	end	

	for i, aPhases in pairs( PvE_Container ) do

		PvE_Mission[ i ] = aPhases
		
	end	

	PvE_Func:InitMission()
	PvE_Desttown:OnStart()
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

--сообщаем, какая концовка была завершена
function Mission:SV_GetFinishId()

	local pveId = PvE_MissionsId[ "pve_desttown_waves_hard" ]
	local finishId = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].phaseId
	if not finishId then 
		finishId = 0
	end
	return pveId, finishId
	
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