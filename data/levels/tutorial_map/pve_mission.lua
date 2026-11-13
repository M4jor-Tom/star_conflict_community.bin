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
	for i, aPhases in pairs( Container_Tutorial ) do
		PvE_Mission[ i ] = aPhases
	end	
	PvE_Tutorial:OnStart()	
	AID.portals = false
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

	
end


-- function PvE_Common.UI.PveEvents:GetEventTargetDefs( id )
	-- sys.out("PvE_Common.UI.PveEvents:GetEventTargetDefs  ".. tostring(id) )
	-- return 
-- end

-- function PvE_Common.UI.PveEvents:GetEventValCur( id )
	-- sys.out("GetEventValCur  ".. tostring(id) )
-- end
