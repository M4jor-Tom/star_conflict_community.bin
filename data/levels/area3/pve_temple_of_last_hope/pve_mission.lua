Mission = 
{
}

-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()

	eventContainer = PvE_NewEvents
		
	PvE_Container3.aWaves = PvE_Temple_of_Last_Hope.aWaves.easy
	
	for i, aPhases in pairs( PvE_Container3 ) do
		PvE_Mission[ i ] = aPhases
	end
	
	PvE_Mission.buildConteiner = {

		[ "EntityBuilderTrigger1" ] = "PoliceTurret1",
		[ "EntityBuilderTrigger2" ] = "PoliceTurret2",
		[ "EntityBuilderTrigger3" ] = "PoliceTurret3",
		[ "EntityBuilderTrigger4" ] = "PoliceTurret4",
		[ "EntityBuilderTrigger5" ] = "PoliceTurret5",
		[ "EntityBuilderTrigger6" ] = "PoliceTurret6",
		[ "EntityBuilderTrigger7" ] = "PoliceTurret7",
		[ "EntityBuilderTrigger8" ] = "PoliceTurret8",
		[ "EntityBuilderTrigger9" ] = "PoliceTurret9",
		[ "EntityBuilderTrigger10" ] = "PoliceTurret10",
	}	

	PvE_Func:InitMission()
	PvE_Temple_of_Last_Hope:OnStart()	
	AID.portals = true
	circleTable = sys.new( PvE_Mission.aPhases )
	PvE_Mission.alarm = false
	PvE_Mission.waveCut = 
	{
		[ "iNeed2Boss" ] = 4,
		[ "iNeed2Elite" ] = 2,
		[ "iEventWave" ] = 6,
		[ "repairsGroup" ] = 5,
	}
end


-- r
function Mission:CL_OnUpdate( dt )
-- довставляем марки - восклицательные знаки, в случае если их не удалось вставить сразу( на клиенте не  создался объект)
	if cl_FocusPoints then 
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

function Mission:SV_OnInteractiveObjectInteracted( object, userObject )

	if not object:GetParent() then
		local entityId = userObject:GetId()
		local defName = object:GetDefName()
		WaveBonuses.functions[ defName ]:Func( object, userObject, entityId ) --entityId можно спросить уже внутри функции, не за чем его тут посылать
	else
		local parent = object:GetParent()
		local entityId = userObject:GetId()
		if parent == userObject then
			userObject:RemoveChild( object )
		end
	end	
end

WaveBonuses = {

	functions = {
	
		[ "PvE_Gen_ActivatotObject" ] = {
			Func = function ( self, object, userObject, entityId  )			
				--RegisterAttachOnPlayer( userObject, object, entityId )
				for i, turret in pairs( PvE_Mission.stationaryTurrets ) do
					Entities[ turret[ 1 ] ]:EnableAiThink( true )
					PvE_Mission.activeTurretsTimer = 20
				end				
				object:Remove()
			end,
		},
		[ "PvE_Gen_BuilderObject" ] = {
			Func = function ( self, object, userObject, entityId  )			
				RegisterAttachOnPlayer( userObject, object, entityId )
			end,
			Remove = function( self, userObject, entityId )	
				PvE_Mission.aSapperPlayers[ userObject:GetId() ] = nil
				Entities[ entityId ]:Remove()			
			end,
		},
		[ "PvE_Gen_KillAllObject" ] = {
			Func = function ( self, object, userObject, entityId )
				if not PvE_Mission.aSapperPlayers[ entityId ] then
					local aResultMobs = {}
					local aSpaceShips = GetEntitiesByClass( "SpaceShip" )	
					for i, ship in ipairs( aSpaceShips ) do
						if Entities[ ship ]:GetPlayerIdx() < 0 and not Entities[ ship ]:IsDead() then
							Entities[ ship ]:DieAndBlow()
							table.insert( aResultMobs, ship )
						end
					end
				end
				object:Remove()
			end,
		},
		[ "PvE_Gen_RepairAllGens" ] = {
			Func = function ( self, object, userObject, entityId )
				local targets = GetEntitiesByDef( PvE_Mission.aPhases[ 1 ].sTargetDef )
				for i, gen in pairs( targets ) do
					local maxHP = Entities[ gen ]:GetMaxHealth()
					local currentHP = Entities[ gen ]:GetHealth()
					local newHP = currentHP + ( currentHP / 2 )
					if newHP < maxHP then 
						Entities[ gen ]:SetHealth( newHP )
					else
						Entities[ gen ]:SetHealth( maxHP )
					end	
				end
				object:Remove()
			end,
		},
		[ "PvE_Gen_HackAllEnemy" ] = {
			Func = function ( self, object, userObject, entityId )
				local gen = Entities[ "EnergyGenerator1" ]
				SV_GP_CastSpell( "PvE_Waves_HackWeapon", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
				object:Remove()
			end,
		},
		[ "PvE_Gen_SlowAllEnemy" ] = {
			Func = function ( self, object, userObject, entityId )
				local gen = Entities[ "EnergyGenerator1" ]
				SV_GP_CastSpell( "PvE_Waves_SlowManeuver", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
				object:Remove()
			end,
		},
		[ "PvE_Gen_DebuffAllEnemy" ] = {
			Func = function( self, object, userObject, entityId )				
				if RegisterAttachOnPlayer( userObject, object, entityId ) then
					SV_GP_CastSpell( "PvE_Waves_Passive_AllBodyResistDebuff", userObject:GetId(), userObject:GetId(), userObject, userObject:GetPos() )
				end	
			end,
			Remove = function( self, userObject, entityId )	
				PvE_Mission.aSapperPlayers[ userObject:GetId() ] = nil
				Entities[ entityId ]:Remove()			
				RemoveAura( userObject, "PvE_Waves_Passive_AllBodyResistDebuff" )	
			end,
		},
	}	
}
	
function Mission:SV_OnInteractiveObjectDetached( object, userObject )

	local playerId = userObject:GetId()
	local defName = object:GetDefName()
	WaveBonuses.functions[ defName ]:Remove( userObject, object:GetId() )

end

function MobOnDeath( mobId, pos )

	if PvE_Mission.previousMobId ~= mobId and pos then

		local bonusMaxAmount = 50
		PvE_Mission.previousMobId = mobId
		if not PvE_Mission.nBonusHope then PvE_Mission.nBonusHope = 0 end -- скрытая инициализация счётчика бонусов
		if PvE_Mission.nBonusHope >= bonusMaxAmount then -- ввёл лимит на выпадение бонусов, защита от падений от спама бонусов при длинной пве
			PvE_Mission.chance = 0
		else
			PvE_Mission.chance = PvE_Mission.chance + 1
		end

		local ver = math.random( 1, 100 + PvE_Mission.nBonusHope * 30 ) -- уменьшил шансы выпадения бонуса, никто их не собирает
				
		if  PvE_Mission.chance > ver then
			PvE_Mission.chance = 0
			local key = ai.Spawn( PvE_Mission.aPhases[ 1 ].key[ math.random( #PvE_Mission.aPhases[ 1 ].key ) ] )
			key:SetPos( pos )
			if PvE_Mission.nBonusHope + 1 == bonusMaxAmount then
				sys.log("Bonus limit reached: %d", bonusMaxAmount)
			end
			PvE_Mission.nBonusHope = PvE_Mission.nBonusHope + 1 -- считаю бонусы
		end
		PvE_Mission.iKilled = PvE_Mission.iKilled + 1
		
		if Game_IsServer() then
			ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", "wave_guard", PvE_Mission.iKilled )
		else
			PvE_Common.UI.PveEvents:UpdatePVEEvent( "wave_guard", PvE_Mission.iKilled )
		end		
	end
end

function RegisterAttachOnPlayer( userObject, object, entityId )
	if not PvE_Mission.aSapperPlayers[ entityId ] then
		userObject:AttachToBone( object, "root" )
		PvE_Mission.aSapperPlayers[ entityId ] = {}
		PvE_Mission.aSapperPlayers[ entityId ][ 1 ] = entityId
		PvE_Mission.aSapperPlayers[ entityId ][ 3 ] = object:GetNetworkId()
		return true
	else
		local child = ai.GetNetworkEntity( PvE_Mission.aSapperPlayers[ entityId ][ 3 ] )
		userObject:RemoveChild( child )
		PvE_Mission.aSapperPlayers[ entityId ] = nil
	end	
end	

function PlaySoundOnClient()

	sys.concmd( "e_event AmbientSoundSpot1 Play" )
end

function Mission:SV_SetStartWave( wave )
	PvE_Mission.try = wave
							
	local gen = Entities[ "EnergyGenerator1" ]
	for i = 1, wave do
		local params = { "iNeed2Boss", "iNeed2Elite", "iTotalMobs", "iEventWave", "repairsGroup" }
		
		for i, param in pairs( params ) do
			PvE_Mission[ param ] = PvE_Mission[ param ] + 1
		end
							
		if PvE_Mission.iNeed2Elite >= PvE_Mission.waveCut[ "iNeed2Elite" ] and i ~= wave then
			PvE_Mission.iNeed2Elite = 0
		end
		if PvE_Mission.iNeed2Boss >= PvE_Mission.waveCut[ "iNeed2Boss" ] and i ~= wave then
			PvE_Mission.iNeed2Boss = 0
		end
		if PvE_Mission.iEventWave >= PvE_Mission.waveCut[ "iEventWave" ] and i ~= wave then
			PvE_Mission.iEventWave = 0
		end
		if PvE_Mission.repairsGroup >= PvE_Mission.waveCut[ "repairsGroup" ] and i ~= wave  then
			PvE_Mission.repairsGroup = 0
		end
	end

	local max = math.floor( wave / 5 )
	local max = math.floor( max ^ 1.5 ) -- нужен не линейный рост  / только тут в инициализации, там где накладывается бафф каждый уровень, не надо.
	max = math.min( max, 100 * 300 + 10 * 300 + 1 * 300 ) -- убираем попытки бесконечных баффов / 300 - макс число стаков 
	for j = 1, math.floor( max / 100 ) do
		SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist_x100", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
	end
	max = max % 100
	for j = 1, math.floor( max / 10 ) do
		SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist_x10", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
	end
	max = max % 10
	for j = 1, max do
		SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
	end

	PvE_Mission.iWaveMobs = PvE_Mission.iTotalMobs
end

