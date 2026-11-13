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
	
	eventContainer = {}
	
	for i = 1, 3 do
		sys.concmd( "e_event Station"..i.." HideFromHud" )
	end	
	
	for i = 1, 4 do
		sys.concmd( "e_event PvE_Gen_EnergyField"..i.." HideFromHud" )
	end

	for i = 1, 3 do
		sys.concmd( "RadarStation"..i.." HideFromHud" )
	end
	
	if CL_PveGetMissionName() == "pve_empfrontier_waves_T1" then
		PvE_Container2.aWaves = PvE_Emp_Frontier.aWaves.easy
	else	
		PvE_Container2.aWaves = PvE_Emp_Frontier.aWaves.hard
		AID.mod_by_bot = 0
		PvE_Mission.bFocusPoints = false
	end	
	
	for i, aPhases in pairs( PvE_Container2 ) do
		PvE_Mission[ i ] = aPhases
	end

	PvE_Func:InitMission()
	PvE_Emp_Frontier:OnStart()	
	AID.portals = true
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
	if Game_IsServer() then
	else
		CL_MonsterUpdate( dt )	
	end	
end

function CL_MonsterUpdate( dt )

end	

--сообщаем, какая концовка была завершена
function Mission:SV_GetFinishId()

	local pveId = PvE_MissionsId[ "pve_empfrontier_waves_T5" ]
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