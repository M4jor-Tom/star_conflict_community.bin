
---------------------------------------
---------------------------------------

function CheckAdventureLauchTable( situationName, launchT )

	if not launchT.adventure then
		sys.logError( situationName .. ": failed to launch, this situation for adventure")
		return false
	end
		
	if type( launchT.adventure.player ) ~= "number" or launchT.adventure.player < 0 then
		sys.logError( situationName .. ": failed to launch, no player")
		return false
	end
	
	return true
end


function GetPositionNearPlayer( playerSlot )

	local playerShipId = GetPlayerInfo( playerSlot ).entityId
	
	if playerShipId == -1 then
		return
	end
	
	local playerShip = Entities[ playerShipId ]
	
	if not playerShip then
		return
	end
	
	local dir 	= playerShip:GetDir()
	local pos 	= playerShip:GetPos() + dir * 4
	
	return pos, dir
	
end

---------------------------------------
---------------------------------------

local SituationAlpha = { }

function SituationAlpha:Init( defT )

	self.timer		= 0
	self.counter	= 0

	sys.log( self:GetPrintName() .. ":Init()")
	dprint( defT )
	
	self.satelite = nil
	
	return true
	
end

function SituationAlpha:GetPrintName()

	return "SituationAlpha[" .. self:GetId()  .. ":" .. self:GetDefName() .. "]"

end

function SituationAlpha:Release()

	sys.log( self:GetPrintName() .. ":Release" )

end

function SituationAlpha:Launch( launchT )

	sys.log( self:GetPrintName() .. ":Launch" )
	
	local defT = Situations[ self:GetDefName() ]
	
	if defT.satelite ~= nil and type(defT.satelite) == "string" then
	
		local id = self:GetId()
		self.satelite = self:LaunchChild( defT.satelite, { who = id } )
			
		if self.satelite == -1 then
			sys.log("SituationAlpha: failed to create satelite")
			self.satelite = nil
		end
		
	end
	
		
end

function SituationAlpha:Clean()

	sys.log( self:GetPrintName() .. ":Clean" )

end

function SituationAlpha:ReceiveNotification( sourceId, code)

	sys.log( self:GetPrintName() .. ":ReceiveNotification: %d -> %d", sourceId, code )

end

function SituationAlpha:ReceiveResult( sourceId, code)

	sys.log( self:GetPrintName() .. ":ReceiveResult: %d -> %d", sourceId, code )

end

function SituationAlpha:SV_OnUpdate( dt )

	self.timer = self.timer + dt
	
	local period = 60.0
	
	if self.timer > period then
		self.timer = self.timer - period
		self.counter = self.counter + 1
		sys.log( self:GetPrintName() .. ": timer is ticked!" )
		self:Notify( self.counter )
	end
	
end

function SituationAlpha:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )

	sys.log( self:GetPrintName() .. ":SV_OnEntityKill: %d is killed by %d (player_%d)", victimEntity:GetId(), killerEntityId, killerPlayer )
	dprint( asistTable );
	self:Finish( ai.SituationResult.FAIL )
end

function SituationAlpha:SV_OnAddPlayer( player )

	sys.log( self:GetPrintName() .. ":SV_OnAddPlayer( player_%d )", player )
	
end

function SituationAlpha:SV_OnRemovePlayer( player )

	sys.log( self:GetPrintName() .. ":SV_OnRemovePlayer( player_%d )", player )
	
end

function SituationAlpha:SV_OnAdventureObjectInteract( user, object )

	sys.log( self:GetPrintName() .. ":SV_OnAdventureObjectInteract: %d (%s) interacts with %d (%s)",
		user:GetId(), user:GetDefName(), object:GetId(), object:GetDefName() )
	
end

function SituationAlpha:SV_OnLootItem( playerIx, itemDefName, count )

	sys.log( self:GetPrintName() .. ":SV_OnLootItem: player_%d loots %s x%d", playerIx, itemDefName, count )

end

function SituationAlpha:SV_OnDropItem( playerIx, itemDefName, count )

	sys.log( self:GetPrintName() .. ":SV_OnDropItem: player_%d drops %s x%d", playerIx, itemDefName, count )

end

function SituationAlpha:SV_OnHeal( patientEntity, healerId, healerPlayer, healedValue )

	sys.log( self:GetPrintName() .. ":SV_OnHeal: entity %d get heal %f from entity %d ( player_%d)",
		patientEntity:GetId(), healedValue, healerId, healerPlayer )

end

function SituationAlpha:SV_OnDamage( victimEntity, damagerId, damagerPlayer, damageValue )

	sys.log( self:GetPrintName() .. ":SV_OnDamage: entity %d get damage %f from entity %d ( player_%d )",
		victimEntity:GetId(), damageValue, damagerId, damagerPlayer )
		
end

function SituationAlpha:SV_OnEntityRemoved( entityId )

	sys.log( self:GetPrintName() .. ":SV_OnEntityRemoved: entity %d removed", entityId )
		
end


---------------------------------------
---------------------------------------

local SituationBeta = { }

function SituationBeta:Init( defT )

	self.timer		= 0

	sys.log( self:GetPrintName() .. ":Init" )
	dprint( defT )
	
	return true
	
end

function SituationBeta:GetPrintName()

	return "SituationBeta[" .. self:GetId()  .. ":" .. self:GetDefName() .. "]"

end

function SituationBeta:Release()

	sys.log( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function SituationBeta:Launch( launchT )

	sys.log( self:GetPrintName() .. ":Launch" )
	dprint (launchT)
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	self.player = launchT.adventure.player
	
end

function SituationBeta:Clean()

	sys.log( self:GetPrintName() .. ":Clean" )

end

function SituationBeta:SV_OnUpdate( dt )

	self.timer = self.timer + dt
	
	local period = 15.0
	
	if self.timer > period then
		self.timer = self.timer - period
		self:Notify( 1 )
	end
	
end

function SituationBeta:SV_OnAdventureObjectInteract( user, object )

	sys.log( self:GetPrintName() .. ":SV_OnAdventureObjectInteract: %d (%s) interacts with %d (%s)",
		user:GetId(), user:GetDefName(), object:GetId(), object:GetDefName() )
		
	self:Finish( ai.SituationResult.SUCCESS )
	
end

function SituationBeta:SV_OnRemovePlayer( player )

	sys.log( self:GetPrintName() .. ":SV_OnRemovePlayer( player_%d )", player )
	
	if self.player == player then
		self:Finish( ai.SituationResult.FAIL )
	end
	
end


---------------------------------------
---------------------------------------
local SituationSingle = {}

function SituationSingle:Init( defT )

	sys.log( self:GetPrintName() .. ":Init" )
	
	self.bossDef		= defT.bossDef or "Ship_UFO_L_GUARD_Rank10"	
	self.bossName		= defT.bossName or "Super Evil Ship"
	self.defaultPos		= defT.defaultPos or Vec3( 0, 0, 0)
	self.bossEntityId	= -1
	
	return true
	
end

function SituationSingle:GetPrintName()

	return "SituationSingle [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function SituationSingle:Release()

	sys.log( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function SituationSingle:Launch( launchT )

	sys.log( self:GetPrintName() .. ":Launch" )
	
	dprint( launchT )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	local player = launchT.adventure.player
	
	if self.bossEntityId == -1 then
		local plr = Entities[GetPlayerInfo(player).entityId]
		local d = plr and plr:GetDir() or Vec3( 1, 0, 0 );
		local p = plr and plr:GetPos() + d * 5 or self.defaultPos
	
		local boss = designers:AddBot( self.bossDef, p, ai.RelationshipGroups.Pirate, self.bossName, -d, nil )
		if boss then
			boss:SetHealth(10)
			self.bossEntityId = boss:GetId()
		else
			sys.logError( self:GetPrintName() .. ": failed to spawn boss")
		end
		
	end
end

function SituationSingle:Clean()

	sys.log( self:GetPrintName() .. ":Clean" )
	
	local boss = self.bossEntityId >= 0 and Entities[ self.bossEntityId ] or nil
	
	if boss then
		boss:Remove()
	end

end

function SituationSingle:SV_OnEntityRemoved( entityId )

	sys.log( self:GetPrintName() .. ":SV_OnEntityRemoved: %d (%s) interacts with %d (%s)",
		user:GetId(), user:GetDefName(), object:GetId(), object:GetDefName() )
	
	if entityId == self.bossEntityId then
		
		self:Finish( ai.SituationResult.CANCEL )
		self.bossEntityId  = -1
		
	end
	
end

function SituationSingle:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )

	sys.log( self:GetPrintName() .. ":SV_OnEntityKill: %d is killed by %d (player_%d)", victimEntity:GetId(), killerEntityId, killerPlayer )
	
	if victimEntity:GetId() == self.bossEntityId then
	
		if killerPlayer >= 0 then
			self:Finish( ai.SituationResult[ "CODE_" .. (killerPlayer + 1)] )
		else
			self:Finish( ai.SituationResult.FAIL )
		end
		
		self.bossEntityId = -1
		
	end
	
end


function SituationSingle:SV_OnDamage( victimEntity, damagerId, damagerPlayer, damageValue )

	sys.log( self:GetPrintName() .. ":SV_OnDamage: entity %d get damage %f from entity %d ( player_%d )",
		victimEntity:GetId(), damageValue, damagerId, damagerPlayer )
	
	self:Notify( damageValue )
	
end


---------------------------------------
---------------------------------------

local AdventureTest_SpawnNPC = {}

function AdventureTest_SpawnNPC:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.shipDef		= "Ship_Adventure_A"	
	self.shipName		= "Adventure Dummy"
	self.friendly		= false
	self.shipId			= -1
	self.spawnHealth	= 0
	self.defaultPos		= defT.defaultPos or Vec3( 0, 0, 0)
	self.respawnsUsed	= 0
	self.respawnsNum	= 1
	
	return true
	
end

function AdventureTest_SpawnNPC:GetPrintName()

	return "AdventureTest_SpawnNPC [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function AdventureTest_SpawnNPC:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function AdventureTest_SpawnNPC:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
		
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	if self.shipId ~= -1 then
		sys.logError( self:GetPrintName() .. ": ship already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.shipDef		= launchT.shipDef			or "Ship_Adventure_A"	
	self.shipName		= launchT.shipName			or "Adventure Dummy"
	self.friendly		= launchT.friendly			or false
	self.spawnHealth	= launchT.spawnHealth		or 0
	self.player			= launchT.adventure.player	or 0 -- Idx игрока

	self.respawnsNum	= launchT.respawnsNum 	or 1
	if self.respawnsNum < 1 then self.respawnsNum = 1 end
	
	self.respawnsUsed	= 0
	
end

function AdventureTest_SpawnNPC:TrySpawnShipNearPlayer()

	local entityId = GetPlayerInfo( self.player ).entityId
	
	if entityId == -1 or self.shipId ~= -1 then
		return
	end
	
	local e = Entities[ entityId ]
	
	if not e then
		return
	end
	
	local dir 	= e:GetDir()
	local pos 	= e:GetPos() + dir * 4
	local rg 	= self.friendly and ai.RelationshipGroups.FirstPlayer + self.player or ai.RelationshipGroups.Hostile2
	
	local npc = designers:AddBot( self.shipDef, pos, rg, self.shipName, -dir, { disable_warp = true } )

	
	if npc then
		
		---
		designers:AddPackInAID( {npc} )
		for _, def_id in pairs( GetEntitiesByClass( "PathObject" ) ) do 
			if Entities[def_id]:GetName() == "alien_path1" then 
				self.bot = AID:GetBot( npc:GetId() )
				sys.logError( self:GetPrintName() .. ": npc_id %d , pathId %d", npc:GetId(), def_id )
				self.bot.config = { "police_path1", "stop"} --, "remove" }
				--self.bot.pathId = def_id
				break
			end
		end
		
		---
	
		npc:EnableRemoveNotification( true )
		
		if self.spawnHealth > 0 then
			npc:SetHealth( self.spawnHealth )
		end
		
		self.shipId			= npc:GetId()
		self.respawnsUsed	= self.respawnsUsed + 1
		
	else
	
		sys.logError( self:GetPrintName() .. ": failed to spawn ship %s", self.shipName)
		
	end
	
end

function AdventureTest_SpawnNPC:SV_OnUpdate( dt )

	if self.respawnsUsed < self.respawnsNum then
		
		if self.shipId == -1 then
			self.respawnsUsed = 10
			self.respawnsNum = 1
			self:TrySpawnShipNearPlayer()
		end
		
	else
		-- выключаем обновление
		--self.SV_OnUpdate = nil
	end
	if self.bot and self.bot.subpathPoint then
		sys.logError( self:GetPrintName() .. ": subpathPoint %d %d %d WayPoint %d", self.bot.behavior_targetPos.x, self.bot.behavior_targetPos.y, self.bot.behavior_targetPos.z, self.bot.currentWayPoint )
	end
end

function AdventureTest_SpawnNPC:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local npc = self.shipId >= 0 and Entities[ self.shipId ] or nil
	self.shipId = -1
	
	if npc then
		npc:Remove()
	end

end

function AdventureTest_SpawnNPC:SV_OnEntityRemoved( entityId )
	
	if self.shipId ~= -1 and entityId == self.shipId then
		
		self.shipId  = -1
		
		if self.respawnsUsed == self.respawnsNum then
			self:Finish( ai.SituationResult.CANCEL )
		end
		
	end
	
end

function AdventureTest_SpawnNPC:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	
	if victimEntity:GetId() == self.shipId then
				
		if self.respawnsUsed == self.respawnsNum then
		
			self.shipId  = -1
			
			if killerPlayer >= 0 then
				self:Finish( ai.SituationResult[ "CODE_" .. (killerPlayer + 1)] )
			else
				self:Finish( ai.SituationResult.FAIL )
			end
			
		end
		
	end
end


---------------------------------------
---------------------------------------

local AdventureTest_SpawnEntity = {}

function AdventureTest_SpawnEntity:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.entityDef		= "Adventure_Object_A"	
	self.entityId		= -1
	self.countdown		= -1
	self.countdownTime	= 0
	self.isInteractive	= false
	
	return true
	
end

function AdventureTest_SpawnEntity:GetPrintName()

	return "AdventureTest_SpawnEntity [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function AdventureTest_SpawnEntity:Release()

	sys.out( self:GetPrintName() .. ":Release" )
		
	if self.isInteractive then
	
		local e = self.entityId >= 0 and Entities[ self.entityId ] or nil
		if e then
			e:SV_UnsetUseableForPlayer( self.player )
		end
		
	end
	
	-- ввел для тестирования переключения объекта в неинтерактивное состояние
	self.countdown = self.countdownTime
	if self.countdown <= 0 then
		self:Finish( ai.SituationResult.CANCEL )
	end

end

function AdventureTest_SpawnEntity:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
		
	if self.entityId ~= -1 then
		sys.logError( self:GetPrintName() .. ": already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.entityDef		= launchT.entityDef			or "Adventure_Object_A"	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	
	self.isInteractive	= launchT.isInteractive		or false
	self.countdownTime	= launchT.countdownTime		or 0
	self.respawnsNum	= launchT.respawnsNum or 1
	
	if self.respawnsNum < 1 then self.respawnsNum = 1 end
	
	self.respawnsUsed	= 0

end

function AdventureTest_SpawnEntity:TrySpawnEntityNearPlayer()

	local playerShipId = GetPlayerInfo( self.player ).entityId
	
	if playerShipId == -1 or self.entityId ~= -1 then
		return
	end
	
	local playerShip = Entities[ playerShipId ]
	
	if not playerShip then
		return
	end
	
	local dir 	= playerShip:GetDir()
	local pos 	= playerShip:GetPos() + dir * 4
	
	local newEntity = ai.Spawn(self.entityDef)
	
	if newEntity then
	
		newEntity:SetPos(pos)
		newEntity:EnableRemoveNotification( true )
		
		self.entityId		= newEntity:GetId()
		self.respawnsUsed	= self.respawnsUsed + 1
		
		if self.isInteractive then
			newEntity:SV_SetUseableForPlayer( self.player )
		end
		
	else
	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
		
	end
	
end

function AdventureTest_SpawnEntity:SV_OnUpdate( dt )

	if self.countdown >= 0 then
		self.countdown = self.countdown - dt
		
		if self.countdown <= 0 then
			self:Finish( ai.SituationResult.CANCEL )
		end
		
	end
	
	if self.respawnsUsed < self.respawnsNum then
		
		if self.entityId == -1 then
			self:TrySpawnEntityNearPlayer()
		end
		
	elseif self.countdownTime == 0 then
		-- выключаем обновление
		self.SV_OnUpdate = nil
	end
	
end

function AdventureTest_SpawnEntity:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local e = self.entityId >= 0 and Entities[ self.entityId ] or nil
	self.entityId = -1
	
	if e then
		e:Remove()
	end

end

function AdventureTest_SpawnEntity:SV_OnEntityRemoved( entityId )
	
	if self.entityId ~= -1 and entityId == self.entityId then
		
		self.entityId  = -1
		
		if self.respawnsUsed == self.respawnsNum then
			self:Finish( ai.SituationResult.CANCEL )
		end
		
	end
	
end


---------------------------------------
---------------------------------------

local AdventureTest_SpawnLootCrate = {}

function AdventureTest_SpawnLootCrate:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.entityDef		= "Adventure_LootCrate_Generic"
	self.entityId		= -1
	self.lootDef		= "Adventure_Loot_A"
	self.lootCount		= 1
	self.entityTtl		= 0
	
	return true
	
end

function AdventureTest_SpawnLootCrate:GetPrintName()

	return "AdventureTest_SpawnLootCrate [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function AdventureTest_SpawnLootCrate:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function AdventureTest_SpawnLootCrate:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
		
	if self.entityId ~= -1 then
		sys.logError( self:GetPrintName() .. ": already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.entityDef		= launchT.entityDef			or "Adventure_LootCrate_Generic"	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.lootDef		= launchT.lootDef			or "Adventure_Loot_A"
	self.lootCount		= launchT.lootCount			or 1
	self.crateTtl		= launchT.ttl				or 0

end

function AdventureTest_SpawnLootCrate:SetupEntity( entity )

	entity:SetPlayersCanUse( 2 ^ self.player )
	entity:SetLoot( self.lootDef, self.lootCount )
	entity:SetAutoRemove( self.crateTtl )
	
end

function AdventureTest_SpawnLootCrate:TrySpawnEntityNearPlayer()

	if self.entityId ~= -1 then
		return
	end
	
	local pos, dir = GetPositionNearPlayer( self.player )
	
	if not pos then
		return
	end
	
	local newEntity = ai.Spawn( self.entityDef )
	
	if newEntity then
	
		newEntity:SetPos(pos)
		newEntity:EnableRemoveNotification( true )
		
		self:SetupEntity( newEntity )
		self.entityId		= newEntity:GetId()

	else
	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
		
	end
	
end

function AdventureTest_SpawnLootCrate:SV_OnUpdate( dt )

	if self.entityId == -1 then
		self:TrySpawnEntityNearPlayer()
	else
		self.SV_OnUpdate = nil
	end
	
end

function AdventureTest_SpawnLootCrate:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local e = self.entityId >= 0 and Entities[ self.entityId ] or nil
	self.entityId = -1
	
	if e then
		e:Remove()
	end

end

function AdventureTest_SpawnLootCrate:SV_OnEntityRemoved( entityId )
	
	if self.entityId ~= -1 and entityId == self.entityId then
		
		self.entityId  = -1
		self:Finish( ai.SituationResult.CANCEL )
		
	end
	
end

---------------------------------------
---------------------------------------

local Adventure_InteractObject = {}

function Adventure_InteractObject:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.entityDef		= false
	self.entityId		= -1
	self.countdown		= -1
	--self.countdownTime	= 0
	self.multiuse		= false
	self.objTable		= {}
	self.Start = true
	self.triggerId = nil
	self.Timer_trigger_spawn = 0
	
	return true
	
end

function Adventure_InteractObject:GetPrintName()

	return "AdventureTest_SpawnEntity [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_InteractObject:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
		
	if self.entityId ~= -1 then
		sys.logError( self:GetPrintName() .. ": already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.entityDef		= launchT.entityDef			or "Adventure_Object_A"	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	
	self.multiuse		= launchT.multiuse			or false -- с одним обьектом можно взаимодействовать несколько раз
	self.removeAfterUse	= launchT.removeAfterUse	or false
	self.spawnpoint		= launchT.spawnpoint		or nil
	self.spawnDef		= launchT.spawnDef			or nil
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone	or false-- проваливать задание если игрок покинул зону до выполнения задания
	self.remove_ifEscapeZone = launchT.remove_ifEscapeZone	or false -- удалить один обьект задания, если игрок покидает локациию
	self.fail_ifTriggerOutOfRange	= launchT.fail_ifTriggerOutOfRange	or false-- проваливать задание если триггер вне области triggerEntRange
	
	self.triggerEntDef		= launchT.triggerEntDef		or nil -- деф сущности, которая должна быть в радиусе для завершения стадии
	self.triggerEntRange	= launchT.triggerEntRange	or 500 -- радиус до сущности, для срабатывания
	self.triggerSettings	= launchT.triggerSettings	or {}
	
	self.dialog_params		= launchT.dialog_params	or {}

	if self.triggerEntRange then
		self.triggerEntRange = self.triggerEntRange*self.triggerEntRange
	end
end

function Adventure_InteractObject:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	-- переводим все обьекты в неактивное сосотояние
	local pid, p
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.entityDef and p:IsUseableForPlayer( self.player ) then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
	
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
	
	self.objTable	= {}
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_InteractObject:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then
		if self.remove_ifEscapeZone then
			for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
				local p = Entities[pid]
				if p:GetDefName() == self.entityDef then
					p:Remove()
					sys.log( self:GetPrintName() .. ": Player left the zone. Removing %s entity", self.entityDef )
					break
				end
			end
		end
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_InteractObject:SpawnEntity( def , pos )

	local newEntity = ai.Spawn(def)
	
	if newEntity then
		local playerShip = Entities[ GetPlayerInfo( self.player ).entityId ]
		newEntity:SetPos(pos)
		local dir = (playerShip:GetPos() - pos):GetNormalized()
		newEntity:SetPosDir( pos, dir )
		newEntity:EnableRemoveNotification( true )
		return newEntity
	else	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
	end
	return nil
end

function Adventure_InteractObject:GetObjEntitysByName( def ) -- ищет ентити на карте ома по имени
	for _, pid in pairs( GetEntitiesByClass( "TagPoint" ) ) do
		local p = Entities[pid]
		if p:GetDefName() == def then
			return p
		end
	end
	return nil
end

function Adventure_InteractObject:TriggerInRange( triggerEnt, pointPos, range )
	
	if triggerEnt and triggerEnt:GetHealth() > 0 then
		local mobPos = triggerEnt:GetPos()
		local dist = SquareLen( mobPos, pointPos )
		if range > dist then 
			return true
		end
	else
		return false
	end
	
end

function Adventure_InteractObject:ReturnEntityByDef( defName, class, name )
	local eid
	for _, eid in pairs( GetEntitiesByClass( class ) ) do
		local e = Entities[eid]
		if not name and defName and e:GetDefName() == defName then
			return e
		elseif name and e:GetName() == name then
			return e
		end
	end
	return nil
end

function Adventure_InteractObject:SV_OnUpdate( dt )
	if self.Start and Entities[ GetPlayerInfo( self.player ).entityId ] then
		-- находим все обьекты с дефом, делаем их доступными, если нет условия триггера
		if not self.triggerDef then
			local i, pid, p
			for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
				p = Entities[pid]
				if p:GetDefName() == self.entityDef then
					p:EnableRemoveNotification( true )
					p:SV_SetUseableForPlayer( self.player )
					table.insert(self.objTable , p )
				end
			end
		end
		
		-- спавним обьект -- нигде не использовано (пока)
		if self.spawnpoint then -- работает только с одной единственной точкой
			-- добавить spawn_amount как количество сущностей которые нужно заспавнить
			local pos = self:GetObjEntitysByName( self.spawnpoint ):GetPos()
			local e = self:SpawnEntity( self.entityDef , pos )
			
			if e and not self.triggerDef then -- делаем доступным для игрока если нет триггера
				if e:GetDefName() == self.entityDef then
					e:EnableRemoveNotification( true )
					e:SV_SetUseableForPlayer( self.player )
					table.insert(self.objTable , p )
				end
			end	
		end
		
		self.Start = false
	end
	
	if self.triggerEntDef then
		self.trigger = self:ReturnEntityByDef(self.triggerEntDef, Def[self.triggerEntDef].class)
		
		if self.trigger then
			self.triggerId = self.trigger:GetId()
		elseif self:TriggerSpawnPeriodChecker() then -- спавним триггер по всем правилам
			if self.triggerSettings then	
				if self.triggerSettings.spawnspot then 
					local posE = self:ReturnEntityByDef( "Logic_SpawnArea_FreeSpaceAIAgents", "SpawnSpot", self.triggerSettings.spawnspot )
					if posE then 
						local pos = posE:GetPos()
					
						self.trigger = designers:AddBot( self.triggerEntDef, pos, Def[self.triggerEntDef].relationship_group, Def[self.triggerEntDef].uiName, dir, { disable_warp = true } )
						self.triggerId = self.trigger:GetId()
						designers:AddPackInAID( {self.trigger} )
						self.trigger:EnableRemoveNotification( true )
					end
				end
				if self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" and self.trigger then 
					AID:GetBot( self.trigger:GetId() ).config = self.triggerSettings.path_config
				end
			end
		end
		if self.fail_ifTriggerOutOfRange then
			for _, e in pairs( self.objTable ) do
				-- завершается провалом если триггер вне зоны или его нет
				if not self:TriggerInRange(self.trigger, e:GetPos(), self.triggerEntRange) then
					self:Finish( ai.SituationResult.FAIL )
				end
			end
		end
	end
end

function Adventure_InteractObject:TriggerSpawnPeriodChecker( )

	local add = 0.03
	self.Timer_trigger_spawn = self.Timer_trigger_spawn + add
	
	if self.Timer_trigger_spawn > 15 then
		self.Timer_trigger_spawn = 0
		return true
	else
		return false
	end
	
end

function Adventure_InteractObject:SV_OnEntityRemoved( entityId )

	if self.triggerEntDef and self.triggerId and entityId == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
	end
end

function Adventure_InteractObject:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )

	if self.triggerEntDef and self.triggerId and victimEntity:GetId() == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
	end
end

function Adventure_InteractObject:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )

end

function Adventure_InteractObject:SV_OnAdventureObjectInteract( user, object )
	
	if not ( self.multiuse ) and user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.entityDef then
		local obj = Entities[object:GetId()]
		obj:SV_UnsetUseableForPlayer( self.player )
		--table.insert(self.UsedObjects , obj:GetName() )
		if self.removeAfterUse then
			object:Remove()
		end 
	end
end


---------------------------------------
---------------------------------------

local Adventure_QuestCollectObject = {}

function Adventure_QuestCollectObject:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.entityDef		= false
	self.entityId		= -1
	self.lootDef		= "Adventure_Loot_A"
	self.lootCount		= 1
	self.isInteractive	= true
	self.entityTtl		= 0
	self.spawnPointDef	= false
	self.chance			= 100
	self.failIncChanceOn	= 0
	
	self.Start = true
	
	return true
	
end

function Adventure_QuestCollectObject:GetPrintName()

	return "Adventure_QuestCollectObject [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_QuestCollectObject:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function Adventure_QuestCollectObject:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
		
	if self.entityId ~= -1 then
		sys.logError( self:GetPrintName() .. ": already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.entityDef		= launchT.entityDef			or false	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.lootDef		= launchT.lootDef			or "Adventure_Loot_A"
	self.lootCount		= launchT.lootCount			or 1
	self.crateTtl		= launchT.ttl				or 30
	self.spawnPointDef	= launchT.spawnPointDef		or 0
	self.chance			= launchT.chance			or 100
	self.failIncChanceOn	= launchT.failIncChanceOn		or 0
	self.needZones		= launchT.needZones			or {}	-- id зон в которых работает стадия
	
	-- проверяем разрешена ли зона в приключении
	if #self.needZones > 0 then
		self.Start = false
		
		for i, zid in pairs( self.needZones ) do
			if zid == CL_GetCurrentSpaceZoneId() then
				self.Start = true
				
				if #self.triggerSwitchEntDef > 0 then
					self.triggerEntDef = self.triggerSwitchEntDef[i]
				end
				
				if self.zonesAreSwitch then 
					self.zonesAreSwitch = i
				end
				
				break
			end
		end
	end
end

function Adventure_QuestCollectObject:SetAllEntityDefUseableForPlayer()
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.entityDef then
			p:EnableRemoveNotification( true )
			if self.isInteractive then
				p:SV_SetUseableForPlayer( self.player )
			end
		end
	end
end

function Adventure_QuestCollectObject:SpawnEntityOnPos( pos )

	-- if self.entityId ~= -1  then
		-- return
	-- end
-- спавн обьекта на pos еще не сделан
	if self.spawnPointDef then
		
		local i, pid, lcid, point, pos
		local points = GetAllTagPointsByName( self.spawnPointDef )
		for i, pid in pairs( points ) do
			pos = Entities[ pid ]:GetPos()
			if pos then
				local newEntity = ai.Spawn( self.entityDef )
				if newEntity then
					newEntity:SetPos(pos)
					newEntity:EnableRemoveNotification( true )
					self:SetupEntity( newEntity )
					self.entityId = newEntity:GetId()

				else
					sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
							
				end
			end
		end	
	end
end

function Adventure_QuestCollectObject:SV_OnUpdate( dt )
	if self.Start and Entities[ GetPlayerInfo( self.player ).entityId ] then
		self:SetAllEntityDefUseableForPlayer()
		self.Start = false
	end
end

function Adventure_QuestCollectObject:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.entityDef then
			--p:EnableRemoveNotification( true )
			if self.isInteractive then
				p:SV_UnsetUseableForPlayer( self.player )
			end
		end
	end

end

function Adventure_QuestCollectObject:CheckPlayerChances( )
	
	local chanceRoll = math.random( 0, 100 )
	if self.chance >= chanceRoll then
		return true
	end
	return false
end

function Adventure_QuestCollectObject:SV_OnAdventureObjectInteract( user, object )
	--пока так, когда вариация квестов и функционала с обьектами станет больше - нужно будет переписать
	if user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.entityDef then
		local obj = Entities[object:GetId()]
		if self:CheckPlayerChances() then
			SV_FreeSpace_GiveCargoItem( user:GetPlayerIdx(), self.lootDef, self.lootCount )
			obj:SV_UnsetUseableForPlayer( self.player )
		else 
			self.chance = self.chance + self.failIncChanceOn -- увеличиваем шансы после неудачной попытки
			obj:SV_UnsetUseableForPlayer( self.player )
		end
	end
end

---------------------------------------
---------------------------------------

local Adventure_QuestTakeObject = {}

function Adventure_QuestTakeObject:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.entityDef		= false
	self.entityId		= -1
	self.lootDef		= "Adventure_Loot_A"
	self.lootCount		= 1
	self.isInteractive	= true
	self.entityTtl		= 0
	self.spawnPointDef	= false
	self.chance			= 100
	self.failIncChanceOn	= 0
	
	return true
	
end

function Adventure_QuestTakeObject:GetPrintName()

	return "Adventure_QuestTakeObject [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_QuestTakeObject:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
	
	self:Finish( ai.SituationResult.CANCEL )

end

function Adventure_QuestTakeObject:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
		
	if self.entityId ~= -1 then
		sys.logError( self:GetPrintName() .. ": already launched")
		return
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.entityDef		= launchT.entityDef			or false	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.lootDef		= launchT.lootDef			or "Adventure_Loot_A"
	self.lootCount		= launchT.lootCount			or 1
	self.chance			= launchT.chance			or 100
	self.failIncChanceOn	= launchT.failIncChanceOn		or 0
	self.giveQuestAtTheEnd	= launchT.giveQuestAtTheEnd	or nil -- работает только на первое срабатывание подбора, после будет происходить на каждый вход в локацию (лучше не использовать и сделать через стадии)
	self.dialog_params		= launchT.dialog_params	or {}
	
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.entityDef then
			p:EnableRemoveNotification( true )
			p:SV_SetUseableForPlayer( self.player )
		end
	end
	
end

function Adventure_QuestTakeObject:SV_OnUpdate( dt )

end

function Adventure_QuestTakeObject:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.entityDef then
			--p:EnableRemoveNotification( true )
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end

end

function Adventure_QuestTakeObject:CheckPlayerChances( )
	
	local chanceRoll = math.random( 0, 100 )
	if self.chance >= chanceRoll then
		return true
	end
	return false
end

function Adventure_QuestTakeObject:CheckAdventures( id ) -- проверка на отсутсвие у игрока выдаваемого задания 
	
	local adventures = SV_FreeSpace_GetPlayerAdventures(self.player)
	for _, adv in pairs( adventures ) do
		if adv.atid == id then
			return false
		end
	end
	return true	
end

function Adventure_QuestTakeObject:SV_OnAdventureObjectInteract( user, object )
	--пока так, когда вариация квестов и функционала с обьектами станет больше - нужно будет переписать
	if user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.entityDef then
		local obj = Entities[object:GetId()]
		if self:CheckPlayerChances() then
			SV_FreeSpace_GiveCargoItem( user:GetPlayerIdx(), self.lootDef, self.lootCount )
				
			if self.giveQuestAtTheEnd then
				if self:CheckAdventures( self.giveQuestAtTheEnd )then
					SV_FreeSpace_TryGiveAdventure( self.player, self.giveQuestAtTheEnd )
					self.giveQuestAtTheEnd = nil
				end
			end
		else 
			self.chance = self.chance + self.failIncChanceOn -- увеличиваем шансы после неудачной попытки
		end
	end
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_ReachThePoint = {}

function Adventure_ReachThePoint:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.tagPoints		= {}	-- список точек которые будут засчитывать прохождение
	self.playerId		= -1	-- id коробля игрока
	self.Start			= true
	
	self.triggerId 	= nil
	self.trigger	= nil	-- сущность от triggerEntDef
	self.triggerPos = nil
	
	self.Allow_update	= false -- выставление в false означачает, что Update больше не будет работать с этой ситуацией
	self.Timer_trigger_spawn = 0
	self.Timer_trigger = 5
	
	return true
	
end

function Adventure_ReachThePoint:GetPrintName()

	return "Adventure_ReachThePoint [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_ReachThePoint:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function Adventure_ReachThePoint:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.achiveDistance		= launchT.achiveDistance	or 500	-- дистанция до точки для выполнения задания
	self.tagPointPrefix		= launchT.tagPointPrefix	or nil	-- префикс для имен точек к которым нужно подлететь
	self.tagPointName		= launchT.tagPointName		or nil	-- имя точеки к которой нужно подлететь
	self.pointDef			= launchT.pointDef			or nil	-- деф AdventureObject точки которую нужно достичь
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone	or false-- проваливать задание если игрок покинул зону до выполнения задания
	self.needZones			= launchT.needZones			or {}	-- id зон в которых работает стадия
	
	self.triggerSpawnpoint	= launchT.triggerSpawnpoint	or nil -- место спавна триггера
	self.triggerEntDef		= launchT.triggerEntDef		or nil -- деф сущности, которая должна быть в радиусе для завершения стадии
	--self.triggerEntClass	= launchT.triggerEntClass	or nil -- класс сущности дефа, обязательно для заполнения вместе с дефом
	self.triggerEntRange	= launchT.triggerEntRange	or 500 -- радиус до сущности, для срабатывания
	self.triggerSettings	= launchT.triggerSettings	or {}
	self.triggerDropOnDeath = launchT.triggerDropOnDeath	or nil
	
	self.zonesAreSwitch		= launchT.zonesAreSwitch	or nil -- использовать зоны из needZones как переключатели резутьтата
	self.triggerSwitchEntDef = launchT.triggerSwitchEntDef	or {} -- использовать разные триггеры на свичах 
	
	self.dialog_params		= launchT.dialog_params		or {}
	
	self.achiveDistance = self.achiveDistance*self.achiveDistance
	if self.triggerEntRange then
		self.triggerEntRange = self.triggerEntRange*self.triggerEntRange
	end
	
	if self.tagPointName then 
		local point = self:ReturnEntityByDef( nil, "TagPoint", self.tagPointName )
		point:SV_SetUseableForPlayer( self.player )
		table.insert(self.tagPoints , point:GetPos() )
	elseif self.tagPointPrefix then 
		self:GetAllTagPointsByPrefix( self.tagPointPrefix )
	end
	
	if self.pointDef and Def[self.pointDef].class then 
		self:GetAllEntitiesByDef( self.pointDef ) 
	end
	
	if #self.needZones > 0 then
		for i, zid in pairs( self.needZones ) do
			if zid == CL_GetCurrentSpaceZoneId() then
				self.Allow_update = true
				
				if #self.triggerSwitchEntDef > 0 then
					self.triggerEntDef = self.triggerSwitchEntDef[i]
				end
				
				if self.zonesAreSwitch then 
					self.zonesAreSwitch = i
				end
				
				break
			end
		end
	else
		self.Allow_update = true
	end
	
	self.Timer_trigger = self.Timer_trigger + ( self.player * 0.5 )% 15 -- чтобы не спавнилось по несколько триггеров на игрока
	
end

function Adventure_ReachThePoint:GetAllTagPointsByPrefix( prefix ) -- надо проверить перед использованием
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "TagPoint" ) ) do
		local name = prefix..i
		local p = Entities[ name ]
		if p then
			p:SV_SetUseableForPlayer( self.player )
			table.insert(self.tagPoints , p:GetPos() )
		end
	end
end

function Adventure_ReachThePoint:GetAllEntitiesByDef( defName )
	local pid
	local class = Def[defName].class or "AdventureObject"

	for _, pid in pairs( GetEntitiesByClass( class ) ) do
		local p = Entities[pid]
		if p:GetDefName() == defName then
			if class == "AdventureObject" then
				p:SV_SetUseableForPlayer( self.player )
			end
			table.insert(self.tagPoints , p:GetPos() )
		end
	end
end

function Adventure_ReachThePoint:ReturnEntityByDef( defName, class, name )
	local eid
	for _, eid in pairs( GetEntitiesByClass( class ) ) do
		local e = Entities[eid]
		if not name and defName and e:GetDefName() == defName then
			return e
		elseif name and e:GetName() == name then
			return e
		end
	end
	return nil
end

--Функция определяет есть ли точки из pointsList в радиусе self.achiveDistance от игрока
function Adventure_ReachThePoint:CheckRangeToPoints( pointsList, dt )
	--local playerPos = GetPositionOfPlayer( self.player )
	local e, pointPos, i, playerPos
	if self.playerId > -1 and Entities[ self.playerId ] then	
		e = Entities[ self.playerId ]
		playerPos = e:GetPos()
	else
		return false
	end
	
	--считаем дистанцию от игрока до всех точек, если успех - выходим true
	for i , pointPos in ipairs( pointsList ) do
		local dist = SquareLen( pointPos, playerPos )
		if self.achiveDistance > dist then 
		
			if self.triggerEntDef then -- проверка на наличие тригера в радиусе точки
				if self.triggerId and Entities[self.triggerId] and self:CheckIfRangeFromMobToPointLess( self.trigger, pointPos, self.triggerEntRange ) then
					table.remove( pointsList, i )
					return true
				end 
			else -- если приблизился - то выкидываем точку из списка
				table.remove( pointsList, i )
				return true
			end
		end		
	end
	--если поблизости точек нет, выходим false
	return false
end

function Adventure_ReachThePoint:SV_OnEntityRemoved( entityId )

	if self.triggerEntDef and self.triggerId and entityId == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
		self.Timer_trigger_spawn = 0
	end
end

function Adventure_ReachThePoint:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )

	if self.triggerEntDef and self.triggerId and victimEntity:GetId() == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
		self.Timer_trigger_spawn = 0
		if self.triggerDropOnDeath and self.triggerPos and self.playerId > 0 then
			self:SpawnEntity( self.triggerDropOnDeath, self.triggerPos )
			self:Finish( ai.SituationResult.CODE_6 )
		end
	end
end


function Adventure_ReachThePoint:SpawnEntity( def , pos )

	local newEntity = ai.Spawn(def)
	
	if newEntity then
		local playerShip = Entities[ GetPlayerInfo( self.player ).entityId ]
		newEntity:SetPos(pos)
		local dir = (playerShip:GetPos() - pos):GetNormalized()
		newEntity:SetPosDir( pos, dir )
		newEntity:EnableRemoveNotification( true )
	else	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
	end	
end

function Adventure_ReachThePoint:CheckIfRangeFromMobToPointLess( mobEnt, pointPos, range )

	if mobEnt:GetId() then 
		self.triggerPos = mobEnt:GetPos()
		if self.triggerPos and mobEnt:GetHealth() > 0 then
			local dist = SquareLen( self.triggerPos, pointPos )
			if range > dist then 
				return true
			end
		else
			return false
		end
	end
end

function Adventure_ReachThePoint:TriggerSpawnPeriodChecker( dt )

	local add = dt or 0
	self.Timer_trigger_spawn = self.Timer_trigger_spawn + add

	if self.Timer_trigger_spawn > self.Timer_trigger then
		self.Timer_trigger_spawn = 0
		return true
	else
		return false
	end
	
end

function Adventure_ReachThePoint:SpawnTrigger( dt )

	if self.triggerSettings then	-- and self:TriggerSpawnPeriodChecker( dt ) then	
		
		if self.triggerSettings.spawnspot then 
		
			local spwn = self:ReturnEntityByDef( "Logic_SpawnArea_FreeSpaceAIAgents", "SpawnSpot", self.triggerSettings.spawnspot )
			if spwn then 
				local pos = spwn:GetPos()
				
				self.trigger = designers:AddBot( self.triggerEntDef, pos, Def[self.triggerEntDef].relationship_group, Def[self.triggerEntDef].uiName, dir, { disable_warp = true } )
				self.triggerId = self.trigger:GetId()
				designers:AddPackInAID( {self.trigger} )
				self.trigger:EnableRemoveNotification( true )
			else -- точка спавна не была найдена, отмена отслеживания задания в этой зоне
				self.Allow_update	= false
				sys.log( self:GetPrintName() .. ": Trigger don't have spawnspot %s in this zone", self.triggerSettings.spawnspot )
				return
			end
		end
		if self.trigger and self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
			-- только если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
			-- можно сюда поставить SetNewBehavior и сделать ограничение на уже занятые сущности
			AID:GetBot( self.trigger:GetId() ).config = self.triggerSettings.path_config
		end
	end
end

function Adventure_ReachThePoint:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_ReachThePoint:SV_OnAddPlayer( player )

	if self.player == player and #self.tagPoints > 0 then
		self.playerId = GetPlayerInfo( player ).entityId
		Entities[ self.playerId ]:EnableRemoveNotification(true)
	end
end

function Adventure_ReachThePoint:SV_OnUpdate( dt )

	if self:SetPlayerID( ) and Entities[ self.playerId ] and self.Allow_update and #self.tagPoints > 0 then

		if self.Start then
		
			self.Start = false
			-- заспавнить тригер-сущность, если надо

			if self.triggerEntDef then

				self.trigger = self:ReturnEntityByDef(self.triggerEntDef, Def[self.triggerEntDef].class)
				if self.trigger then -- тригер уже есть, записываем его
					self.triggerId = self.trigger:GetId()
					
					if self.triggerSettings and self.triggerSettings.setNewBehavior then -- возможность переписать поведение уже существующего тригера
						local bot = AID:GetBot( self.trigger:GetId() )
						if self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
							-- если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
							bot.config = self.triggerSettings.path_config
						end
						
						bot.currentWayPoint = 0
						bot.behavior = "FlyRoute"
						AID:SetNewBehavior( self.trigger, bot )
						--AID.FlyRoute:Start( self.trigger, bot )
					end	
				end
			end
		elseif self:CheckRangeToPoints( self.tagPoints, dt ) then
			
			sys.out( self:GetPrintName() .. ": Player %s reached the quest point", self.player )
			
			if self.zonesAreSwitch then 
				local path = ai.SituationResult.CODE_1 + self.zonesAreSwitch - 1
				self:StartDialog( self.zonesAreSwitch )
				self:Finish( path )
			else
				self:StartDialog( nil )
				self:Finish( ai.SituationResult.SUCCESS )
			end 
			
		end
		
		if self.triggerEntDef and not (self.Start or self.trigger) and self:TriggerSpawnPeriodChecker( dt ) then -- тригер был, но пропал
		
			self.trigger = self:ReturnEntityByDef(self.triggerEntDef, Def[self.triggerEntDef].class)
			if not self.trigger then 
				self:SpawnTrigger( dt )
			elseif self.triggerSettings and self.triggerSettings.setNewBehavior then
				local bot = AID:GetBot( self.trigger:GetId() )
				if self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
					-- если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
					bot.config = self.triggerSettings.path_config
				end

				bot.currentWayPoint = 0
				bot.behavior = "FlyRoute"
				AID:SetNewBehavior( self.trigger, bot )
				--AID.FlyRoute:Start( self.trigger, bot )
			end	
		end
	end
end


function Adventure_ReachThePoint:StartDialog( param )
	for i, dialog in pairs( self.dialog_params ) do
		if not param or (dialog.param == param) then 
			local portrait, character
			if dialog.character and type( dialog.character ) == "string" then
				character = "quest_character_"..dialog.character
			else
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
				break
			end 
			if not dialog.text then
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
				break
			end
			if dialog.portrait and type( dialog.portrait ) == "string" then 
				portrait = "quest_character_"..dialog.portrait.."_medium"
			else 
				portrait = "quest_character_default_medium"
			end 
			if not dialog.timer then
				dialog.timer = 15
			end 
			if dialog.sound_file then 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
			else 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
			end
		end
	end
end


function Adventure_ReachThePoint:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_ReachThePoint:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local pid
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		local p = Entities[pid]
		if p:GetDefName() == self.pointDef then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
	
	if self.triggerEntDef then
		self.trigger = nil
		self.triggerId = nil
	end
	
	self.Timer_trigger_spawn = 0
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_SpawnMobPack = {}

function Adventure_SpawnMobPack:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId		= -1 -- заполнится в первом update
	self.playerShip 	= nil -- заполнится в первом update
	
	self.loopedSpawn	= false -- будет ли спавн мобов цикличным пока стадия активна
	self.countSpawn		= 1 -- счет оставшихся спавнов (если спавн не зациклен)
	self.spawnedBots	= {} -- таблица id созданных мобов 
	self.mobPacksTable	= {} -- таблица паков которые надо создать
	self.fail_ifEscapeZone	= false -- проваливать задание, если игрок покинул зону
	
	self.noAlivePacks	= true
	self.spawnTimer		= 0
	self.spawnPeriod	= 2
	
	self.forseAdwOwner	= false -- нужно ли для ботов включать игрока в приоритетные цели
	self.forseEntityDefs = { } -- список дефов на включение в приоритетные цели
	
	self.protectionTarget	= nil -- цель которая должна жить чтобы не было провала
	
	self.Allow_update = false
	
	self.castSpell = true

	--[[ структура mobPacksTable = 
	{
		{
		def = "", -- имя дефа "" или таблица имен
		amount = 1, -- нужно только если def - имя, определяет кол-во мобов в пачке, иначе расчет по кол-ву имен в таблице def
		settings = { -- настройки поведения и тп
			relationship = , -- отношение мобов в пачке
			}, 
		spawnpoint = "",-- имя точки спавна
		},
	}
	]]
	
	return true
	
end

function Adventure_SpawnMobPack:GetPrintName()

	return "Adventure_SpawnMobPack [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_SpawnMobPack:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.mobPacksTable		= launchT.mobPacksTable		or nil
	self.loopedSpawn		= launchT.loopedSpawn		or false
	self.countSpawn			= launchT.countSpawn 		or 1
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone or false
	self.altEnd_ifDie 		= launchT.altEnd_ifDie		or false
	self.forseAdwOwner	 	= launchT.forseAdwOwner 	or false
	self.forseEntityDefs	= launchT.forseEntityDefs 	or {}
	self.protectionTarget	= launchT.protectionTarget 	or nil
	self.spawnPeriod		= launchT.spawnPeriod 		or 2 -- боты будут спавнится не чаще чем раз в spawnPeriod
	self.firstSpawnDelay	= launchT.firstSpawnDelay 	or 0
	self.altEnd_protectionTargetDie = launchT.altEnd_protectionTargetDie or nil -- альтернативный конец при смерти защищаемой цели
	self.needZones			= launchT.needZones			or {}	-- id зон в которых работает стадия
	self.castSpellOnProtectionTarget = launchT.castSpellOnProtectionTarget	or nil -- какой спел нужно скастовать на защищаемую цель
	self.forceProtectionTargetAttackPlayer = launchT.forceProtectionTargetAttackPlayer	or nil -- приказ защищаемой цели убить игрока
	
	
	self.spawnTimer	= self.spawnPeriod - 3 - self.firstSpawnDelay
	
	if #self.needZones > 0 then
		for i, zid in pairs( self.needZones ) do
			if zid == CL_GetCurrentSpaceZoneId() then
				self.Allow_update = true				
				break
			end
		end
	else
		self.Allow_update = true
	end
end

function Adventure_SpawnMobPack:ChekEntityByName( name, eType ) -- ищет сущность по имени и типу
	local pid, j, searchClass
	if type( eType ) == "string" then
		searchClass = { eType }
	elseif type( eType ) == "table" then
		searchClass = eType
	else 
		sys.logError( self:GetPrintName() .. ": ChekEntityByName - Wrong type of parametr #2" )
		return false
	end

	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				return true
			end
		end
	end
	return false
end

function Adventure_SpawnMobPack:GetAllPointEntitysByName( name ) -- ищет ентити на карте ома по имени
	local pid, j
	local searchClass = {"TagPoint", "AdventureObject", "SpawnSpot",}
	local pointTable = {}
	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				table.insert(pointTable , p )
			end
		end
	end
	
	if #pointTable < 1 then
		sys.log( self:GetPrintName() .. ": GetAllPointsByName - Point with name '%s' wasn't found ", name )
		return nil
	else 
		return pointTable
	end
end


--designers:AddCargo это подсказка для квестов с карго
function Adventure_SpawnMobPack:SpawnPackOnPoint( packTable )
	
	local mobsTable = {}
	local playerShip = Entities[ self.playerId ]
	
	-- заполняем таблицу мобов в пачке mobsTable из packTable.def
	if packTable and packTable.def then
		if type( packTable.def ) == "string" then
			local amount = packTable.amount or 1
			local def = packTable.def 
			for i=1, amount do
				table.insert(mobsTable , def )
			end
		elseif type( packTable.def ) == "table" then 
			for _, mob in ipairs( packTable.def ) do
				if type( mob ) == "string" then
					table.insert(mobsTable , mob )
				else 
					sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
			return false
		end
	else return false
	end

	local pointList = nil or self:GetAllPointEntitysByName( packTable.spawnpoint )
	local pos, point
	if pointList then
		for _, point in pairs( pointList ) do
			pos = point:GetPos()
			dir	= (playerShip:GetPos() - point:GetPos()):GetNormalized() --:GetDir()
			
			local relationship 
			if packTable.settings.relationship then
				relationship = packTable.settings.relationship 
			end
			
			local packAvt = packTable.packAvt or nil
			local p = designers:AddPack( mobsTable, pos, relationship, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir) -- в p таблица кораблей (Ent)
			designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров. вносим в систему аид-бехевиаров
			
			for _, mob in ipairs( p ) do
				table.insert( self.spawnedBots , mob:GetId() )
				
				if self.forseEntityDefs then -- Если есть настройка на атаку обьектов с дефом
					for _, def in pairs( self.forseEntityDefs ) do 
						for _, def_id in pairs( GetEntitiesByDef( def ) ) do 
							self:ForceTarget( mob:GetId(), def_id ) -- прописываем сущность в приоритетные цели пака
						end
					end	
				end
				
				if self.forseAdwOwner then -- Если есть настройка на преследование квестовнера
					self:ForceTarget( mob:GetId(), self.playerId ) -- прописываем игрока в приоритетные цели пака	
				end
			end 
		end 
	end

	
end

function Adventure_SpawnMobPack:ForceTargetForPack( pack, targetId ) -- записываем таргет для пака мобов в приоритетные цели
	for _, mob in ipairs( pack ) do
		self:ForceTarget( mob:GetId(), targetId ) -- вписываем таргет как приоритетную цель
	end	
end

function Adventure_SpawnMobPack:ForceTarget( entityId, targetId ) --записываем таргет в приоритетные цели
	if entityId and type(entityId) == "number" and targetId and type(targetId) == "number" and AID:GetBot( entityId ) then
		local bot = AID:GetBot( entityId )
		if bot.adventureTargetId then -- если у бота есть таблица преследования - записываем в неё
			if not self:CheckTableForMatch(bot.adventureTargetId, targetId) then
				table.insert( bot.adventureTargetId , targetId )
			end
		else -- иначе создаем её
			bot.adventureTargetId = { targetId }
		end
		
	end
end

function Adventure_SpawnMobPack:CheckTableForMatch( tab, ent ) --проверяет таблицу на наличие в ней обьекта
	for _, t in ipairs( tab ) do
		if t == ent then
			return true
		end
	end
	return false
end

function Adventure_SpawnMobPack:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			self.spawnedBots = {}
			self:FindAllSituationBots()
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_SpawnMobPack:SpawnPeriodChecker( dt )

	self.spawnTimer = self.spawnTimer + dt
	
	if self.spawnTimer > self.spawnPeriod then
		self.spawnTimer = 0
		return true
	else
		return false
	end
	
end

function Adventure_SpawnMobPack:CheckAnyProtectionTargetAive( )
	
	for _, eid in ipairs( GetEntitiesByDef( self.protectionTarget ) ) do
		if Entities[ eid ]:GetHealth() > 0 then
			if self.castSpellOnProtectionTarget and self.castSpell then
				SV_Pve_CastSpell( self.castSpellOnProtectionTarget, self.playerId, self.playerId, Entities[ eid ], Entities[ eid ]:GetPos() )
				
				if self.forceProtectionTargetAttackPlayer then 
					self:ForceTarget( eid, self.playerId )
				end
				
				self.castSpell = false
			end
			return true
		end
	end 
	return false
end

function Adventure_SpawnMobPack:SV_OnUpdate( dt )

	if self:SetPlayerID( ) and self.Allow_update then -- запускаем прогон только после того как игрок загрузился на локацию -- and Entities[ self.playerId ]

		if #self.spawnedBots < 1 then -- если нет данных о сущ-их ботах
			if self:SpawnPeriodChecker(dt) and self:FindAllSituationBots() then -- true если живых ботов не найдено, создаем их (заодно записываем всех существующих)

				if self.countSpawn > 0 then -- самый первый прогон и прогоны по количеству волн
					if ( not self.protectionTarget ) or ( self.protectionTarget and self:CheckAnyProtectionTargetAive() ) then -- если есть цель на защиту, то она должна быть жива
						self.countSpawn = self.countSpawn - 1
						local pack
						for _, pack in ipairs( self.mobPacksTable ) do
							self:SpawnPackOnPoint( pack )
						end 
					end
				elseif self.loopedSpawn then -- зацикленный спавн мобов
					local pack
					for _, pack in ipairs( self.mobPacksTable ) do
						self:SpawnPackOnPoint( pack )
					end 
				else
					self:Finish( ai.SituationResult.SUCCESS )
				end
					
--			elseif ( not self.loopedSpawn ) then -- countSpawn не работает, надо чинить (пока нигде не используется)
--			
--				if self.countSpawn < 1 then
--					self:Finish( ai.SituationResult.SUCCESS )
--				end
				
				self.countSpawn = self.countSpawn - 1
			end
		end
		
	end
end

function Adventure_SpawnMobPack:FindAllSituationBots( ) -- записывает все сущности с именем и типом в таблицу self:spawnedBots, записываем в агросписок
	local botsDefList = {}
	for _, pack in ipairs( self.mobPacksTable ) do
		if type( pack.def ) == "string" then
			table.insert( botsDefList , pack.def )
		elseif type( pack.def ) == "table" then 
			for _, mob in ipairs( pack.def ) do
				if type( mob ) == "string" then
					table.insert( botsDefList , mob )
				else 
					sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
			return false
		end
	end

	local BotsDead = true
	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local name = Entities[bid]:GetDefName()
		for _, def in pairs( botsDefList ) do
			if name == def then
				BotsDead = false
				if self.forseAdwOwner then
					self:ForceTarget( bid, self.playerId ) -- если живые боты есть, то вписываем игрока в агротаблицу
				end
			end
		end
	end

	return BotsDead
end

function Adventure_SpawnMobPack:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then	
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_SpawnMobPack:Release()

	sys.out( self:GetPrintName() .. ":Clean" )
	self.loopedSpawn = false
	self.countSpawn = 0
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_SpawnMobPack:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	self.loopedSpawn = false
	self.countSpawn = 0
end

function Adventure_SpawnMobPack:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	
	local vId = victimEntity:GetId()
	for i, id in ipairs( self.spawnedBots ) do
		if vId == id then 
			table.remove( self.spawnedBots, i )
			break
		end
	end
	
	if self.altEnd_ifDie and vId == self.playerId then
		self:Finish( ai.SituationResult.CODE_5 )
	end
	
	if self.protectionTarget and victimEntity:GetDefName() == self.protectionTarget then
		if self.altEnd_protectionTargetDie then 
			self:Finish( ai.SituationResult.CODE_6 )
		else
			self:Finish( ai.SituationResult.FAIL )
		end
		
	end
	
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_Ambush = {}

function Adventure_Ambush:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId		= -1 -- заполнится в первом update
	self.playerShip 	= nil -- заполнится в первом update

	self.spawnedBots	= {} -- таблица таблиц id  созданных мобов 
	
	
	self.ambush_Single	= false -- только одна засада может быть запущена одновременно
	self.ambush_Chance	= 0 -- шанс, что засада на игрока сработает
	self.triggerDef		= nil -- деф обьекта с которым нужно провзаимодействовать, чтобы запустить засаду
	self.triggerReach		= false -- к обьекту достаточно подлететь
	self.triggerPointDist	= 100 -- деф обьекта с которым нужно провзаимодействовать, чтобы запустить засаду
	
	self.triggerDef_coutnter = 0 -- кол-во triggerDef на карте
	self.mobPacksTable	= {} -- таблица паков которые надо создать
	
	self.noAlivePacks	= true
	self.spawnTimer		= 0
	self.spawnPeriod	= 2
	
	self.forseAdwOwner	 = false
	self.forseEntityDefs = {}
	--[[ структура mobPacksTable = 
	{
		{
		def = "", -- имя дефа "" или таблица имен
		amount = 1, -- нужно только если def - имя, определяет кол-во мобов в пачке, иначе расчет по кол-ву имен в таблице def
		settings = { -- настройки поведения и тп
			relationship = , -- отношение мобов в пачке
			
			}, 
		spawnpoint = "",-- имя точки спавна
		},
	}
	]]
	
	return true
	
end

function Adventure_Ambush:GetPrintName()

	return "Adventure_Ambush [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_Ambush:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.mobPacksTable		= launchT.mobPacksTable		or nil
	self.ambush_Single		= launchT.ambush_Single		or false
	self.ambush_Chance		= launchT.ambush_Chance		or 0
	self.triggerDef			= launchT.triggerDef		or nil
	self.triggerReach		= launchT.triggerReach		or false -- пока не реализовано
	self.triggerPointDist	= launchT.triggerPointDist	or 100 -- пока не реализовано
	
	self.forseAdwOwner	 	= launchT.forseAdwOwner 	or false
	self.forseEntityDefs	= launchT.forseEntityDefs 	or {}
	
	if type(self.triggerDef) == "string" then 
		local pid, p
		for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
			p = Entities[pid]
			if p:GetDefName() == self.triggerDef then
				p:EnableRemoveNotification( true )
				p:SV_SetUseableForPlayer( self.player )
				self.triggerDef_coutnter = self.triggerDef_coutnter + 1
			end
		end
	else
		sys.logError( situationName .. ": Launch - wrong type of triggerDef, string expected")
	end
	
	self.triggerPointDist = self.triggerPointDist * self.triggerPointDist
end

function Adventure_Ambush:ChekEntityByName( name, eType ) -- ищет сущность по имени и типу
	local pid, j, searchClass
	if type( eType ) == "string" then
		searchClass = { eType }
	elseif type( eType ) == "table" then
		searchClass = eType
	else 
		sys.logError( self:GetPrintName() .. ": ChekEntityByName - Wrong type of parametr #2" )
		return false
	end

	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				return true
			end
		end
	end
	return false
end

function Adventure_Ambush:GetAllPointEntitysByName( name ) -- ищет ентити на карте ома по имени
	local pid, j
	local searchClass = {"TagPoint", "AdventureObject", "SpawnSpot",}
	local pointTable = {}
	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				table.insert(pointTable , p )
			end
		end
	end
	
	if #pointTable < 1 then
		sys.log( self:GetPrintName() .. ": GetAllPointsByName - Point with name '%s' wasn't found ", name )
		return nil
	else 
		return pointTable
	end
end

function Adventure_Ambush:SpawnPackOnPoint( packTable )
	
	local mobsTable = {}
	local playerShip = Entities[ self.playerId ]
	
	-- заполняем таблицу мобов в пачке mobsTable из packTable.def
	if packTable and packTable.def then
		if type( packTable.def ) == "string" then
			local amount = packTable.amount or 1
			local def = packTable.def 
			for i=1, amount do
				table.insert(mobsTable , def )
			end
		elseif type( packTable.def ) == "table" then 
			for _, mob in ipairs( packTable.def ) do
				if type( mob ) == "string" then
					table.insert(mobsTable , mob )
				else 
					sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
			return false
		end
	else return false
	end

	local pointList = nil or self:GetAllPointEntitysByName( packTable.spawnpoint )
	local pos, point
	if pointList then
		for _, point in pairs( pointList ) do
			pos = point:GetPos()
			dir	= (playerShip:GetPos() - point:GetPos()):GetNormalized() --:GetDir()
			
			local relationship 
			if packTable.settings.relationship then
				relationship = packTable.settings.relationship 
			end

			local p = designers:AddPack( mobsTable, pos, relationship, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir) -- в p таблица кораблей (Ent)
			designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров. вносим в систему аид-бехевиаров
			
			if self.forseAdwOwner then -- Если есть настройка на преследование квестовнера
				self:ForceTargetForPack( p, self.playerId ) -- прописываем игрока в приоритетные цели пака	
			end
			
			if self.forseEntityDefs then -- Если есть настройка на атаку обьектов с дефом
				for _, def in pairs( self.forseEntityDefs ) do 
					for _, def_id in pairs( GetEntitiesByDef( def ) ) do 
						self:ForceTargetForPack( p, def_id ) -- прописываем сущность в приоритетные цели пака
					end
				end	
			end
		end 
	end

	
end

function Adventure_Ambush:ForceTargetForPack( pack, targetId ) -- записываем таргет для пака мобов в приоритетные цели
	for _, mob in ipairs( pack ) do
		self:ForceTarget( mob:GetId(), targetId ) -- вписываем таргет как приоритетную цель
	end	
end

function Adventure_Ambush:ForceTarget( entityId, targetId ) --записываем таргет в приоритетные цели
	if entityId and type(entityId) == "number" and targetId and type(targetId) == "number" and AID:GetBot( entityId ) then
		local bot = AID:GetBot( entityId )
		if bot.adventureTargetId then -- если у бота есть таблица преследования - записываем в неё
			table.insert( bot.adventureTargetId , targetId )
		else -- иначе создаем её
			bot.adventureTargetId = { targetId }
		end
		
		table.insert( self.spawnedBots , entityId )
	end
end

function Adventure_Ambush:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			self.spawnedBots = {}
			self:FindAliveSituationBots()
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_Ambush:SV_OnUpdate( dt )
	self:SetPlayerID()
end

function Adventure_Ambush:FindAliveSituationBots( ) -- ищет живых мобов, если находит - false
	local botsDefList = {}
	for _, pack in ipairs( self.mobPacksTable ) do
		table.insert( botsDefList , pack.def ) 
	end 
	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local name = Entities[bid]:GetDefName()
		for _, def in pairs( botsDefList ) do
			if name == def then
				return false
			end
		end
	end

	return true
end

function Adventure_Ambush:CheckPlayerChances( )
	
	local chanceRoll = math.random( 0, 100 )
	if self.ambush_Chance >= chanceRoll then
		return true
	end
	return false
end

function Adventure_Ambush:SV_OnAdventureObjectInteract( user, object )
	self.triggerDef_coutnter = self.triggerDef_coutnter - 1
	
	if user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.triggerDef then
		local obj = Entities[object:GetId()]
		obj:SV_UnsetUseableForPlayer( self.player )
		
		if ( self.ambush_Single and self:FindAliveSituationBots() ) and self:CheckPlayerChances() then -- проверка на создание засады
			local pack
			for _, pack in ipairs( self.mobPacksTable ) do
				self:SpawnPackOnPoint( pack )
			end 
			self:Finish( ai.SituationResult.CODE_1 )
			
		elseif self.triggerDef_coutnter < 1 then -- засады сейчас не будет, если это был последний обьект взаимодействия - заканчиваем стадию
			self:Finish( ai.SituationResult.CODE_2 )
		end
	end
end

function Adventure_Ambush:Release()
	sys.out( self:GetPrintName() .. ":Release" )
	-- переводим все обьекты в неактивное сосотояние
	local pid, p
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.triggerDef then
			if self.isInteractive then
				p:SV_UnsetUseableForPlayer( self.player )
			end
		end
	end
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_Ambush:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_KillAllMobs = {}
-- мобы уже должны быть на карте к моменту старта ситуации! если их нет, то автопобеда
-- игрок уже должен находиться в локации
function Adventure_KillAllMobs:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId		= -1
	self.playerShip 	= nil
	
	self.def	= nil -- таблица или строка
	
	self.fail_ifEscapeZone	= false -- проваливать задание, если игрок покинул зону	
	self.protectionTarget	= nil
	
	self.spawnedBots	= {}
	self.checkTimer		= 0
	self.checkPeriod	= 2.5
	
	self.once = true
	
	return true
	
end

function Adventure_KillAllMobs:GetPrintName()

	return "Adventure_KillAllMobs [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_KillAllMobs:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone or false
	self.fail_ifDie			= launchT.fail_ifDie		or false
	self.def				= launchT.def 				or nil
	self.protectionTarget	= launchT.protectionTarget 	or nil
	self.forseAdwOwner		= launchT.forseAdwOwner		or false
	self.playerId = GetPlayerInfo( self.player ).entityId
	
	-- проверка def на строку или таблицу строк
	if self.def then
		if type( self.def ) == "string" then
			self.def = { self.def }
		elseif type( self.def ) == "table" then 
			for i, d in ipairs( self.def ) do
				if ( not type( d ) == "string" ) then
					sys.logError( self:GetPrintName() .. ": Launch - wrong type of param %s in table def, expected string", i )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": Launch - wrong type of def, expected string or table of strings" )
		end
	else 
		sys.logError( self:GetPrintName() .. ": Launch - No def of ship to kill" )
	end
	
	-- заполним spawnedBots существующими мобами 	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local e = Entities[bid]
		local name = e:GetDefName()
		for _, d in pairs( self.def ) do
			if name == d and e:GetHealth() > 0 then
				table.insert( self.spawnedBots , bid ) 
			end
		end
	end
	-- if #self.spawnedBots < 1 then
		-- self:Finish( ai.SituationResult.SUCCESS )
	-- end
	
end

function Adventure_KillAllMobs:ForceTarget( entityId, targetId ) --записываем таргет в приоритетные цели
	if entityId and type(entityId) == "number" and targetId and type(targetId) == "number" and AID:GetBot( entityId ) then
		local bot = AID:GetBot( entityId )
		if bot.adventureTargetId then -- если у бота есть таблица преследования - записываем в неё
			table.insert( bot.adventureTargetId , targetId )
		else -- иначе создаем её
			bot.adventureTargetId = { targetId }
		end
		
		--table.insert( self.spawnedBots , entityId )
	end
end

function Adventure_KillAllMobs:PeriodChecker( dt )
	self.checkTimer = self.checkTimer + dt
	
	if self.checkTimer < self.checkPeriod and self.checkTimer > 1 then
		-- self.checkTimer = 0
		return true
	else
		return false
	end
end

function Adventure_KillAllMobs:SV_OnUpdate( dt )

	if self:PeriodChecker(dt) and self.once then
		if #self.spawnedBots < 1 then -- поменять на self:FindAllSituationBots( #self.spawnedBots < 1 ) ??
			if self:FindAllSituationBots( true ) then 
				self:Finish( ai.SituationResult.SUCCESS )
			end
		else 	
			if self:FindAllSituationBots( false ) then 
				sys.log( self:GetPrintName() .. ":No more bots, but they weren't been kiled %s", #self.spawnedBots )
				self:Finish( ai.SituationResult.FAIL )
			end
		end
		self.once = false
	end
end

function Adventure_KillAllMobs:FindAllSituationBots( emptyIdList ) -- записывает все сущности с именем и типом в таблицу self:spawnedBots, записываем в агросписок
	local BotsDead = true
	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local e = Entities[bid]
		local name = e:GetDefName()
		for _, def in pairs( self.def ) do
			if name == def then
				BotsDead = false
				if emptyIdList then 
					if self.forseAdwOwner then
						self:ForceTarget( bid, self.playerId ) -- если живые боты есть, то вписываем игрока в агротаблицу
					end
					table.insert( self.spawnedBots , bid )
				end
			end
		end
	end

	return BotsDead
end

function Adventure_KillAllMobs:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then
		sys.log( self:GetPrintName() .. ":Player failed adv by escaping current zone" )
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_KillAllMobs:Release()

	sys.out( self:GetPrintName() .. ":Clean" )
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_KillAllMobs:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
end

function Adventure_KillAllMobs:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	
	local vId = victimEntity:GetId()
	for i, id in ipairs( self.spawnedBots ) do
		if vId == id then 
			self.checkTimer = 0
			table.remove( self.spawnedBots, i )
			self.once = true
			break
		end
	end
	
	if self.fail_ifDie and vId == playerId then 
		sys.log( self:GetPrintName() .. ":Adventure owner have been killed" )
		self:Finish( ai.SituationResult.FAIL )
	end
	
	if self.protectionTarget and victimEntity:GetDefName() == self.protectionTarget then
		sys.log( self:GetPrintName() .. ":Protection target have been killed" )
		self:Finish( ai.SituationResult.FAIL )
	end

end

---------------------------------------
---------------------------------------

local Adventure_PikabuEvent = {}

function Adventure_PikabuEvent:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.prefix 		= "AdventureInteractObject_Pikabu_Beacon"
	self.beacons		= {}
	self.beaconsList	= { 
							"_other", 
							"_first_1", "_first_2", "_first_3", "_first_4",
							"_second_1", "_second_2", "_second_3", "_second_4",
							"_third_1", "_third_2", "_third_3", "_third_4", 
						  }
	--self.itemsList		= {"OpenWorld_PikabuAstronaut_1", "OpenWorld_PikabuAstronaut_2", "OpenWorld_PikabuAstronaut_3",}
	self.permissionToSpawn	= false
	self.itemName 			= nil
	self.give_now			= nil
	self.give_now_b			= false
	
	return true
	
end

function Adventure_PikabuEvent:GetPrintName()

	return "AdventureTest_SpawnEntity [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_PikabuEvent:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.beacons		= launchT.beacons or {}
	self.clue			= launchT.clue or 1
	self.give_now		= launchT.give_now or nil
	self.give_now_b		= launchT.give_now or false

	for _, postfix in pairs( self.beaconsList ) do
		local def = self.prefix..postfix
		for _, id in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
			local e = Entities[id]
			if e:GetDefName() == def then
				e:SV_SetUseableForPlayer( self.player )
			end
		end
	end
end
--ai.RelationshipGroups.Alien GetRelationshipGroup()

function Adventure_PikabuEvent:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	if Def[victimEntity:GetDefName()].relationship_group == ai.RelationshipGroups.Alien and killerEntityId == GetPlayerInfo( self.player ).entityId then
		if self:CheckPlayerChances( 20 ) then
			local pos = victimEntity:GetPos()
			local tab = {"LootCrate_PikabuEvent_1", "LootCrate_PikabuEvent_2", "LootCrate_PikabuEvent_3"}
			local def = math.random( 1, 3 )
			self:SpawnEntity( tab[def], pos )
		end
	end
end

function Adventure_PikabuEvent:CheckPlayerChances( chance )
	
	local chanceRoll = math.random( 0, 100 )
	if chance >= chanceRoll then
		return true
	end
	return false
end

function Adventure_PikabuEvent:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	-- переводим все обьекты в неактивное сосотояние

	for _, postfix in pairs( self.beaconsList ) do
		local name = self.prefix..postfix
		for _, id in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
			local e = Entities[id]
			if e:GetDefName() == name then
				e:SV_UnsetUseableForPlayer( self.player )
			end
		end
	end
	self:Finish( ai.SituationResult.CANCEL )
end



function Adventure_PikabuEvent:GetPointEntitysByName( name ) -- ищет ентити на карте ома по имени
	for _, pid in pairs( GetEntitiesByClass( "TagPoint" ) ) do
		local p = Entities[pid]
		if p:GetDefName() == name then
			return p
		end
	end
end 

function Adventure_PikabuEvent:GetObjEntitysByName( name ) -- ищет ентити на карте ома по имени
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		local p = Entities[pid]
		if p:GetDefName() == name then
			return true
		end
	end
	return false
end 

function Adventure_PikabuEvent:CheckIfSpawned( name ) -- проверяет, что обьекта на карте нет
	for _, eid in pairs( GetEntitiesByClass( "QuestObject" ) ) do
		if Entities[eid]:GetDefName() == name then
			return false
		end
	end
	return true
end 

function Adventure_PikabuEvent:SpawnEntity( def , pos )

	local newEntity = ai.Spawn(def)
	
	if newEntity then
		local playerShip = Entities[ GetPlayerInfo( self.player ).entityId ]
		newEntity:SetPos(pos)
		local dir = (playerShip:GetPos() - pos):GetNormalized()
		newEntity:SetPosDir( pos, dir )
		newEntity:EnableRemoveNotification( true )
	else	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
	end	
end

function Adventure_PikabuEvent:SV_OnUpdate( dt )
	if self.permissionToSpawn then
		if self.itemName and self:CheckIfSpawned( self.itemName ) then
		
			local point = self:GetPointEntitysByName("AdventureSpawnPoint_Event_PikabuQuest")
			local pos = point:GetPos() 
			
			self:SpawnEntity( self.itemName, pos )
		end 
		self.permissionToSpawn = false
	end
	if self.give_now and self.give_now_b then 
		SV_FreeSpace_GiveCargoItem( Entities[ GetPlayerInfo( self.player ).entityId ]:GetPlayerIdx(), self.give_now, 1 )
		self.give_now_b = false
	end
end

function Adventure_PikabuEvent:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end

function Adventure_PikabuEvent:SV_OnAdventureObjectInteract( user, object )
	
	if user:GetId() == GetPlayerInfo( self.player ).entityId then
		local name = object:GetDefName()
		
		for _, t in pairs( self.beacons ) do
			local ddef = t.def
			if type( t.def ) == "table" then
				for _, y in pairs( t.def ) do
					local def = self.prefix..y
					local result = t.result
					if name == def then
						if t.result then
							--local obj = Entities[object:GetId()]
							--obj:SV_UnsetUseableForPlayer( self.player )	
							self:Finish( t.result )
						elseif t.spawn then
							self.itemName = t.spawn
							self.permissionToSpawn = true
							break
						end
					end
				end
			else
				local def = self.prefix..t.def
				local result = t.result
				if name == def then
					if t.result then
						--local obj = Entities[object:GetId()]
						--obj:SV_UnsetUseableForPlayer( self.player )
						self:Finish( t.result )
					elseif t.spawn then
						self.itemName = t.spawn
						self.permissionToSpawn = true
						break
					end
				end
			end
		end
	end
end

function Adventure_PikabuEvent:SV_OnLootItem( playerIx, itemDefName, count )

	for _, d in pairs( {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} ) do
		if itemDefName == d then
			for _, eid in pairs( GetEntitiesByClass( "QuestObject" ) ) do
				local name = Entities[eid]:GetDefName()
				if name == "OpenWorld_PikabuAstronaut_1" or name == "OpenWorld_PikabuAstronaut_2" or name == "OpenWorld_PikabuAstronaut_3" then
					Entities[eid]:Remove()
				end
			end
		end
	end
end

---------------------------------------
---------------------------------------

local Adventure_GiveItems = {}

function Adventure_GiveItems:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.itemDef 			= nil
	self.itemsAmount		= 1
	self.playerId			= 0
	self.permissionToGive	= true
	
	return true
	
end

function Adventure_GiveItems:GetPrintName()

	return "AdventureTest_SpawnEntity [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_GiveItems:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.itemDef		= launchT.itemDef or nil
	self.itemsAmount	= launchT.itemsAmount or 1
	self.giveQuestAtTheEnd	= launchT.giveQuestAtTheEnd or nil
	self.dialog_params	= launchT.dialog_params	or {}

	if not self.itemDef then
		sys.logError( self:GetPrintName() .. ": itemDef is not specified.")
		self:Finish( ai.SituationResult.ERROR )
	end
end

function Adventure_GiveItems:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	if self.giveQuestAtTheEnd then
		SV_FreeSpace_TryGiveAdventure( self.player, self.giveQuestAtTheEnd )
	end
	
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
	
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_GiveItems:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			self.spawnedBots = {}
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_GiveItems:SV_OnUpdate( dt )
	
	if self:SetPlayerID( ) and Entities[ self.playerId ] then -- запускаем прогон только после того как игрок загрузился на локацию
		if self.permissionToGive then
			SV_FreeSpace_GiveCargoItem( self.player, self.itemDef, self.itemsAmount )
			self.permissionToGive = false
		end
	end
end

function Adventure_GiveItems:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end


---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
local Adventure_NewGround_Ambush = {}

function Adventure_NewGround_Ambush:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId		= -1 -- заполнится в первом update
	self.playerShip 	= nil -- заполнится в первом update

	self.spawnedBots	= {} -- таблица таблиц id  созданных мобов 
	
	self.ambush_Single	= false -- только одна засада может быть запущена одновременно
	self.ambush_Chance	= 0 -- шанс, что засада на игрока сработает

	--self.mobPacksTable	= {} -- таблица паков которые надо создать
	self.ambushStarted = false
	self.noAlivePacks	= true
	self.spawnTimer		= 0
	self.spawnPeriod	= 2
	self.dialog_params	= {}
	self.forseAdwOwner	= false
	self.forseEntityDefs = {}
	self.spawnTimer		= 0
	self.EmpPack = {}
	self.mobPacksTableEmp =
		{
			def = {
			"AdvShip_NewGround_H_Emp",
			"AdvShip_NewGround_M_Emp",
			"AdvShip_NewGround_M_Emp",
			"AdvShip_NewGround_M_Emp",
			},
			settings = {relationship = nil,},
			spawnpoint = "AdventureSpawnPoint_NewGroundQuest_Emp",
		}
		
	self.FedPack = {}
	self.mobPacksTableFed =
		{
			def = {
			"AdvShip_NewGround_H_Fed",
			"AdvShip_NewGround_M_Fed",
			"AdvShip_NewGround_M_Fed",
			"AdvShip_NewGround_M_Fed",
			},
			settings = {relationship = nil,},
			spawnpoint = "AdventureSpawnPoint_NewGroundQuest_Fed",
		}
		
	self.JerPack = {}
	self.mobPacksTableJer =
		{
			def = {
			"AdvShip_NewGround_H_Jer",
			"AdvShip_NewGround_M_Jer",
			"AdvShip_NewGround_M_Jer",
			"AdvShip_NewGround_M_Jer",
			},
			settings = {relationship = nil,},
			spawnpoint = "AdventureSpawnPoint_NewGroundQuest_Jer",
		}

	
	return true
	
end

function Adventure_NewGround_Ambush:GetPrintName()

	return "Adventure_NewGround_Ambush [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_NewGround_Ambush:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.dialog_params		= launchT.dialog_params	or {}
	
	
	local pid, p
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == "AdventureInteractObject_NewGroundQuest_End" then
			p:SV_SetUseableForPlayer( self.player )
		end
	end
end

function Adventure_NewGround_Ambush:ChekEntityByName( name, eType ) -- ищет сущность по имени и типу
	local pid, j, searchClass
	if type( eType ) == "string" then
		searchClass = { eType }
	elseif type( eType ) == "table" then
		searchClass = eType
	else 
		sys.logError( self:GetPrintName() .. ": ChekEntityByName - Wrong type of parametr #2" )
		return false
	end

	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				return true
			end
		end
	end
	return false
end

function Adventure_NewGround_Ambush:GetAllPointEntitysByName( name ) -- ищет ентити на карте ома по имени
	local pid, j
	local searchClass = {"TagPoint", "AdventureObject", "SpawnSpot",}
	local pointTable = {}
	for j = 1, #searchClass do
		for _, pid in pairs( GetEntitiesByClass( searchClass[j] ) ) do
			local p = Entities[pid]
			if p:GetDefName() == name then
				table.insert(pointTable , p )
			end
		end
	end
	
	if #pointTable < 1 then
		sys.log( self:GetPrintName() .. ": GetAllPointsByName - Point with name '%s' wasn't found ", name )
		return nil
	else 
		return pointTable
	end
end

function Adventure_NewGround_Ambush:SpawnPackOnPoint( packTable )
	
	local mobsTable = {}
	local playerShip = Entities[ self.playerId ]
	
	-- заполняем таблицу мобов в пачке mobsTable из packTable.def
	if packTable and packTable.def then
		if type( packTable.def ) == "string" then
			local amount = packTable.amount or 1
			local def = packTable.def 
			for i=1, amount do
				table.insert(mobsTable , def )
			end
		elseif type( packTable.def ) == "table" then 
			for _, mob in ipairs( packTable.def ) do
				if type( mob ) == "string" then
					table.insert(mobsTable , mob )
				else 
					sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": SpawnPackOnPoint - wrong type of MobPacksTable.def, expected string or table of strings" )
			return false
		end
	else return false
	end
	
	local packEnt
	local pointList = nil or self:GetAllPointEntitysByName( packTable.spawnpoint )
	local pos, point
	if pointList then
		for _, point in pairs( pointList ) do
			pos = point:GetPos()
			dir	= (playerShip:GetPos() - point:GetPos()):GetNormalized() --:GetDir()
			
			local relationship 
			if packTable.settings.relationship then
				relationship = packTable.settings.relationship 
			end

			packEnt = designers:AddPack( mobsTable, pos, relationship, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir) -- в p таблица кораблей (Ent)
			designers:AddPackInAID( packEnt, packAvt ) -- таблица кораблей и таблица бехевиоров. вносим в систему аид-бехевиаров
			
			self:ForceTargetForPack( packEnt, self.playerId ) -- прописываем игрока в приоритетные цели пака	

			
		end 
	end
	return packEnt
end

function Adventure_NewGround_Ambush:ForceTargetForPack( pack, targetId ) -- записываем таргет для пака мобов в приоритетные цели
	for _, mob in ipairs( pack ) do
		self:ForceTarget( mob:GetId(), targetId ) -- вписываем таргет как приоритетную цель
	end	
end

function Adventure_NewGround_Ambush:ForceTarget( entityId, targetId ) --записываем таргет в приоритетные цели
	if entityId and type(entityId) == "number" and targetId and type(targetId) == "number" and AID:GetBot( entityId ) then
		local bot = AID:GetBot( entityId )
		if bot.adventureTargetId then -- если у бота есть таблица преследования - записываем в неё
			table.insert( bot.adventureTargetId , targetId )
		else -- иначе создаем её
			bot.adventureTargetId = { targetId }
		end
		
		table.insert( self.spawnedBots , entityId )
	end
end

function Adventure_NewGround_Ambush:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			self.spawnedBots = {}
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_NewGround_Ambush:SpawnPeriodChecker( dt )

	self.spawnTimer = self.spawnTimer + dt
	
	if self.spawnTimer > 100 then
		return true
	else
		return false
	end
	
end

function Adventure_NewGround_Ambush:SV_OnUpdate( dt )
	self:SetPlayerID()
	
	if self.waitForDialog and self:SpawnPeriodChecker( dt ) then
		self.waitForDialog = false
		self:SpawnPackOnPoint( self.mobPacksTableEmp )
		self:SpawnPackOnPoint( self.mobPacksTableFed )
		self:SpawnPackOnPoint( self.mobPacksTableJer )
		self.ambushStarted = true
	end
end

function Adventure_NewGround_Ambush:SV_OnAdventureObjectInteract( user, object )
	
	if user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == "AdventureInteractObject_NewGroundQuest_End" then
		local obj = Entities[object:GetId()]
		obj:SV_UnsetUseableForPlayer( self.player )
		
		self.waitForDialog = true
		
		local playership = Entities[self.playerId]
		SV_Pve_CastSpell( "NewGround_Debuff", self.playerId, self.playerId, playership, playership:GetPos() )
		SV_Pve_CastSpell( "NewGround_Damage", self.playerId, self.playerId, playership, playership:GetPos() )
		
		
		for i, dialog in pairs( self.dialog_params ) do
			local portrait, character
			if dialog.character and type( dialog.character ) == "string" then
				character = "quest_character_"..dialog.character
			else
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
				break
			end 
			if not dialog.text then
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
				break
			end
			if dialog.portrait and type( dialog.portrait ) == "string" then 
				portrait = "quest_character_"..dialog.portrait.."_medium"
			else 
				portrait = "quest_character_default_medium"
			end 
			if not dialog.timer then
				dialog.timer = 15
			end 
			if dialog.sound_file then 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
			else 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
			end
		end
	end
end

function Adventure_NewGround_Ambush:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	if victimEntity == Entities[self.playerId] and self.ambushStarted then
		SV_FreeSpace_GiveCargoItem( self.player, "AdventureItem_NewGround_Lost", 1 )
		self:Finish( ai.SituationResult.SUCCESS )
	end

end

function Adventure_NewGround_Ambush:Release()
	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_NewGround_Ambush:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_ChangeBotAutomat = {}
-- мобы уже должны быть на карте к моменту старта ситуации! если их нет, то автопобеда
-- игрок уже должен находиться в локации
function Adventure_ChangeBotAutomat:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId		= -1
	self.playerShip 	= nil
	
	self.def	= nil -- таблица или строка
	
	self.fail_ifEscapeZone	= false -- проваливать задание, если игрок покинул зону	
	self.protectionTarget	= nil
	
	self.spawnedBots	= {}
	self.checkTimer		= 0
	self.checkPeriod	= 2.5
	
	self.once = true
	
	return true
	
end

function Adventure_ChangeBotAutomat:GetPrintName()

	return "Adventure_ChangeBotAutomat [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_ChangeBotAutomat:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone or false
	self.fail_ifDie			= launchT.fail_ifDie		or false
	self.def				= launchT.def 				or nil
	self.protectionTarget	= launchT.protectionTarget 	or nil
	self.forseAdwOwner		= launchT.forseAdwOwner		or false
	self.newAutomat			= launchT.newAutomat		or nil
	self.playerId = GetPlayerInfo( self.player ).entityId
	
	-- проверка def на строку или таблицу строк
	if self.def then
		if type( self.def ) == "string" then
			self.def = { self.def }
		elseif type( self.def ) == "table" then 
			for i, d in ipairs( self.def ) do
				if ( not type( d ) == "string" ) then
					sys.logError( self:GetPrintName() .. ": Launch - wrong type of param %s in table def, expected string", i )
				end
			end	
		else 
			sys.logError( self:GetPrintName() .. ": Launch - wrong type of def, expected string or table of strings" )
		end
	else 
		sys.logError( self:GetPrintName() .. ": Launch - No def of ship to kill" )
	end
	
	-- заполним spawnedBots существующими мобами 	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local e = Entities[bid]
		local name = e:GetDefName()
		for _, d in pairs( self.def ) do
			if name == d and e:GetHealth() > 0 then
				table.insert( self.spawnedBots , bid ) 
			end
		end
	end
	-- if #self.spawnedBots < 1 then
		-- self:Finish( ai.SituationResult.SUCCESS )
	-- end
	
end

function Adventure_ChangeBotAutomat:ForceTarget( entityId, targetId ) --записываем таргет в приоритетные цели
	if entityId and type(entityId) == "number" and targetId and type(targetId) == "number" and AID:GetBot( entityId ) then
		local bot = AID:GetBot( entityId )
		if bot.adventureTargetId then -- если у бота есть таблица преследования - записываем в неё
			table.insert( bot.adventureTargetId , targetId )
		else -- иначе создаем её
			bot.adventureTargetId = { targetId }
		end
		
		--table.insert( self.spawnedBots , entityId )
	end
end

function Adventure_ChangeBotAutomat:PeriodChecker( dt )
	self.checkTimer = self.checkTimer + dt
	
	if self.checkTimer < self.checkPeriod and self.checkTimer > 1 then
		-- self.checkTimer = 0
		return true
	else
		return false
	end
end

function Adventure_ChangeBotAutomat:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			self.spawnedBots = {}
			self:FindAllSituationBots()
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_ChangeBotAutomat:SV_OnUpdate( dt )

	if self.once and self:SetPlayerID() then
		for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
			local e = Entities[bid]
			local name = e:GetDefName()
			for _, d in pairs( self.def ) do
				if name == d then 
					local bot = AID:GetBot( bid )
					if bot then
						AID:SetNewAutomatTable( bot, Avt[self.newAutomat] )
						self:ForceTarget( bid, self.playerId )
						e:AI_NewOrder( ai.AiOrder.ENTITY_ATTACK, ai.AiTargetType.ENTITY, Entities[self.playerId] )
						SV_Pve_CastSpell( "NewGround_Damage", self.playerId, self.playerId, e, e:GetPos() )
						sys.log( self:GetPrintName() .. ":Force %d %d",self.playerId, bot.adventureTargetId[1] )
					end
				end
			end
		end
		
		self.once = false
	end
end

function Adventure_ChangeBotAutomat:FindAllSituationBots( emptyIdList ) -- записывает все сущности с именем и типом в таблицу self:spawnedBots, записываем в агросписок
	local BotsDead = true
	
	for _, bid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local e = Entities[bid]
		local name = e:GetDefName()
		for _, def in pairs( self.def ) do
			if name == def then
				BotsDead = false
				if emptyIdList then 
					if self.forseAdwOwner then
						self:ForceTarget( bid, self.playerId ) -- если живые боты есть, то вписываем игрока в агротаблицу
						
					end
					table.insert( self.spawnedBots , bid )
				end
			end
		end
	end

	return BotsDead
end

function Adventure_ChangeBotAutomat:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then
		sys.log( self:GetPrintName() .. ":Player failed adv by escaping current zone" )
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_ChangeBotAutomat:Release()

	sys.out( self:GetPrintName() .. ":Clean" )
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_ChangeBotAutomat:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
end

function Adventure_ChangeBotAutomat:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )
	
	local vId = victimEntity:GetId()
	for i, id in ipairs( self.spawnedBots ) do
		if vId == id then 
			self.checkTimer = 0
			table.remove( self.spawnedBots, i )
			self.once = true
			break
		end
	end
	
	if self.fail_ifDie and vId == self.playerId then 
		sys.log( self:GetPrintName() .. ":Adventure owner have been killed" )
		self:Finish( ai.SituationResult.SUCCESS )
	end
	
	if self.protectionTarget and victimEntity:GetDefName() == self.protectionTarget then
		sys.log( self:GetPrintName() .. ":Protection target have been killed" )
		self:Finish( ai.SituationResult.FAIL )
	end

end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_EnterZoneSwitch = {}

function Adventure_EnterZoneSwitch:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId	= -1
	self.playerShip = nil
	self.timer		= 10
	self.playerId	= -1
	self.allow_Update = true
	
	return true
	
end

function Adventure_EnterZoneSwitch:GetPrintName()

	return "Adventure_EnterZoneSwitch [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_EnterZoneSwitch:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.current_zone_id	= CL_GetCurrentSpaceZoneId()
	self.zones	= launchT.zones or {} -- список id зон которые выдают разные исходы CODE_1..64
	
end

function Adventure_EnterZoneSwitch:SV_OnAddPlayer( player )
	if self.player == player then
		for i, id in ipairs( self.zones ) do
			if self.current_zone_id == id then
				local path = ai.SituationResult.CODE_1 + i - 1
				sys.log( self:GetPrintName() .. ":Player entered zone %d, start path %d", self.current_zone_id, i )
				self:Finish( path )
			end
		end
	end
end

function Adventure_EnterZoneSwitch:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)

			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_ChangeBotAutomat:SV_OnUpdate( dt )

	if self.allow_Update and self:SetPlayerID( ) and Entities[ self.playerId ] then
		for i, id in ipairs( self.zones ) do
			if self.current_zone_id == id then
				local path = ai.SituationResult.CODE_1 + i - 1
				sys.log( self:GetPrintName() .. ":Player entered zone %d, start path %d", self.current_zone_id, i )
				self:Finish( path )
			end
		end
		--self.allow_Update = false
	end
end

function Adventure_EnterZoneSwitch:Release()

	sys.out( self:GetPrintName() .. ":Clean" )
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_EnterZoneSwitch:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_FlyNearby = {}

function Adventure_FlyNearby:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.tagPoints		= {}	-- список точек которые будут засчитывать прохождение
	self.playerId		= -1	-- id коробля игрока
	self.Start			= true
	
	self.triggerId 	= nil
	self.trigger	= nil	-- сущность от triggerEntDef
	self.triggerPos = nil
	
	self.Allow_update	= false -- выставление в false означачает, что Update больше не будет работать с этой ситуацией
	self.Timer_trigger_spawn = 0
	self.Timer_trigger = 5
	
	self.Nearby_Counter = 0 --считает значения до nearby_timer
	
	return true
	
end

function Adventure_FlyNearby:GetPrintName()

	return "Adventure_FlyNearby [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_FlyNearby:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	self:Finish( ai.SituationResult.CANCEL )

end

function Adventure_FlyNearby:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- параметры, с которыми ситуацию запустили
	self.player				= launchT.adventure.player	or 0	-- Idx игрока
	self.achiveDistance		= launchT.achiveDistance	or 500	-- дистанция до точки для выполнения задания
	
	self.pointDef			= launchT.pointDef			or nil	-- деф AdventureObject точки которую нужно достичь
	self.fail_ifEscapeZone	= launchT.fail_ifEscapeZone	or false-- проваливать задание если игрок покинул зону до выполнения задания
	self.needZones			= launchT.needZones			or {}	-- id зон в которых работает стадия
	
	self.triggerSpawnpoint	= launchT.triggerSpawnpoint	or nil -- место спавна триггера
	self.triggerEntDef		= launchT.triggerEntDef		or nil -- деф сущности, которая должна быть в радиусе для завершения стадии
	self.triggerEntRange	= launchT.triggerEntRange	or 500 -- радиус до сущности, для срабатывания
	self.triggerSettings	= launchT.triggerSettings	or {}
	self.triggerDropOnDeath = launchT.triggerDropOnDeath	or nil
	
	self.shallNotDieDef		= launchT.shallNotDieDef	or nil -- убийство сущности с этим дефом проваливает квест.
	
	self.zonesAreSwitch		= launchT.zonesAreSwitch	or nil -- использовать зоны из needZones как переключатели резутьтата
	self.triggerSwitchEntDef = launchT.triggerSwitchEntDef	or {} -- использовать разные триггеры на свичах 
	
	--параметры счетчика при нахождении рядом с целью
	self.nearby_timer		= launchT.nearby_timer		or 10	-- Какой счетчик нужно заполнить чтобы выполнить цель
	self.nearby_dec 		= launchT.nearby_dec		or 0	-- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью
	
	-- текстовые уведомления счетчика
	self.nearby_text_progress = launchT.nearby_text_progress or nil -- Текст прогресса счетчика в процентах, значение в поле $nearby_progress$
	--self.nearby_text_dec 	= launchT.nearby_text_finish or nil -- Текст завершения счетчика, $nearby_dec$
	
	self.dialog_params		= launchT.dialog_params		or {}
	
	self.achiveDistance = self.achiveDistance*self.achiveDistance
	if self.triggerEntRange then
		self.triggerEntRange = self.triggerEntRange*self.triggerEntRange
	end
	
	if self.pointDef and Def[self.pointDef].class then 
		self:GetAllEntitiesByDef( self.pointDef ) 
	end
	
	if #self.needZones > 0 then
		for i, zid in pairs( self.needZones ) do
			if zid == CL_GetCurrentSpaceZoneId() then
				self.Allow_update = true
				
				if #self.triggerSwitchEntDef > 0 then
					self.triggerEntDef = self.triggerSwitchEntDef[i]
				end
				
				if self.zonesAreSwitch then 
					self.zonesAreSwitch = i
				end
				
				break
			end
		end
	else
		self.Allow_update = true
	end
	
	self.Timer_trigger = self.Timer_trigger + ( self.player * 0.5 )% 15 -- чтобы не спавнилось по несколько триггеров на игрока
	
end

function Adventure_FlyNearby:GetAllEntitiesByDef( defName )
	local pid
	local class = Def[defName].class or "AdventureObject"
	self.tagPoints = {}

	for _, pid in pairs( GetEntitiesByClass( class ) ) do
		local p = Entities[pid]
		if p:GetDefName() == defName then
			if class == "AdventureObject" then
				p:SV_SetUseableForPlayer( self.player )
			end
			table.insert(self.tagPoints , p:GetPos() )
		end
	end
end

function Adventure_FlyNearby:ReturnEntityByDef( defName, class, name )
	local eid
	for _, eid in pairs( GetEntitiesByClass( class ) ) do
		local e = Entities[eid]
		if not name and defName and e:GetDefName() == defName then
			return e
		elseif name and e:GetName() == name then
			return e
		end
	end
	return nil
end

--Функция определяет есть ли точки из pointsList в радиусе self.achiveDistance от игрока
function Adventure_FlyNearby:CheckRangeToPoints( pointsList, dt )
	self:GetAllEntitiesByDef( self.pointDef )

	--local playerPos = GetPositionOfPlayer( self.player )
	local e, pointPos, i, playerPos
	if self.playerId > -1 and Entities[ self.playerId ] then	
		e = Entities[ self.playerId ]
		playerPos = e:GetPos()
	else
		return false
	end
	
	--считаем дистанцию от игрока до всех точек, если успех - выходим true
	for i , pointPos in ipairs( pointsList ) do
		local dist = SquareLen( pointPos, playerPos )
		if self.achiveDistance > dist then 		
			if self.triggerEntDef then -- проверка на наличие тригера в радиусе точки
				if self.triggerId and Entities[self.triggerId] and self:CheckIfRangeFromMobToPointLess( self.trigger, pointPos, self.triggerEntRange ) then
					--table.remove( pointsList, i )
					return true
				end 
			else -- если приблизился - то выкидываем точку из списка
				--table.remove( pointsList, i )
				return true
			end
		end		
	end
	--если поблизости точек нет, выходим false
	return false
end

function Adventure_FlyNearby:SV_OnEntityRemoved( entityId )

	if self.triggerEntDef and self.triggerId and entityId == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
		self.Timer_trigger_spawn = 0
	end
end

function Adventure_FlyNearby:SV_OnEntityKill( victimEntity, killerEntityId, killerPlayer, asistTable )

	if self.triggerEntDef and self.triggerId and victimEntity:GetId() == self.triggerId then
		self.trigger = nil
		self.triggerId = nil
		self.Timer_trigger_spawn = 0
		if self.triggerDropOnDeath and self.triggerPos and self.playerId > 0 then
			self:SpawnEntity( self.triggerDropOnDeath, self.triggerPos )
			self:Finish( ai.SituationResult.CODE_6 )
		end
	end
	
	if self.shallNotDieDef and victimEntity:GetDefName() == self.shallNotDieDef then
		self:Finish( ai.SituationResult.CODE_6 )
	end
end


function Adventure_FlyNearby:SpawnEntity( def , pos )

	local newEntity = ai.Spawn(def)
	
	if newEntity then
		local playerShip = Entities[ GetPlayerInfo( self.player ).entityId ]
		newEntity:SetPos(pos)
		local dir = (playerShip:GetPos() - pos):GetNormalized()
		newEntity:SetPosDir( pos, dir )
		newEntity:EnableRemoveNotification( true )
	else	
		sys.logError( self:GetPrintName() .. ": failed to spawn entity" )
	end	
end

function Adventure_FlyNearby:CheckIfRangeFromMobToPointLess( mobEnt, pointPos, range )

	if mobEnt:GetId() then 
		self.triggerPos = mobEnt:GetPos()
		if self.triggerPos and mobEnt:GetHealth() > 0 then
			local dist = SquareLen( self.triggerPos, pointPos )
			if range > dist then 
				return true
			end
		else
			return false
		end
	end
end

function Adventure_FlyNearby:TriggerSpawnPeriodChecker( dt )

	local add = dt or 0
	self.Timer_trigger_spawn = self.Timer_trigger_spawn + add

	if self.Timer_trigger_spawn > self.Timer_trigger then
		self.Timer_trigger_spawn = 0
		return true
	else
		return false
	end
	
end

function Adventure_FlyNearby:SpawnTrigger( dt )

	if self.triggerSettings then	-- and self:TriggerSpawnPeriodChecker( dt ) then	
		
		if self.triggerSettings.spawnspot then 
		
			local spwn = self:ReturnEntityByDef( "Logic_SpawnArea_FreeSpaceAIAgents", "SpawnSpot", self.triggerSettings.spawnspot )
			if spwn then 
				local pos = spwn:GetPos()
				
				self.trigger = designers:AddBot( self.triggerEntDef, pos, Def[self.triggerEntDef].relationship_group, Def[self.triggerEntDef].uiName, dir, { disable_warp = true } )
				self.triggerId = self.trigger:GetId()
				designers:AddPackInAID( {self.trigger} )
				self.trigger:EnableRemoveNotification( true )
			else -- точка спавна не была найдена, отмена отслеживания задания в этой зоне
				self.Allow_update	= false
				sys.log( self:GetPrintName() .. ": Trigger don't have spawnspot %s in this zone", self.triggerSettings.spawnspot )
				return
			end
		end
		if self.trigger and self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
			-- только если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
			-- можно сюда поставить SetNewBehavior и сделать ограничение на уже занятые сущности
			AID:GetBot( self.trigger:GetId() ).config = self.triggerSettings.path_config
		end
	end
end

function Adventure_FlyNearby:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local e = Entities[ self.playerId ]
		if self.playerId > 0 and e then
			e:EnableRemoveNotification(true)
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_FlyNearby:SV_OnAddPlayer( player )

	if self.player == player and #self.tagPoints > 0 then
		self.playerId = GetPlayerInfo( player ).entityId
		Entities[ self.playerId ]:EnableRemoveNotification(true)
	end
end

function Adventure_FlyNearby:SV_OnUpdate( dt )
	
	if self:SetPlayerID( ) and Entities[ self.playerId ] and self.Allow_update then

		if self.Start then
			
			self.Start = false
			-- заспавнить тригер-сущность, если надо
			if self.triggerEntDef then

				self.trigger = self:ReturnEntityByDef(self.triggerEntDef, Def[self.triggerEntDef].class)
				if self.trigger then -- тригер уже есть, записываем его
					self.triggerId = self.trigger:GetId()
					
					if self.triggerSettings and self.triggerSettings.setNewBehavior then -- возможность переписать поведение уже существующего тригера
						local bot = AID:GetBot( self.trigger:GetId() )
						if self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
							-- если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
							bot.config = self.triggerSettings.path_config
						end
						
						bot.currentWayPoint = 0
						bot.behavior = "FlyRoute"
						AID:SetNewBehavior( self.trigger, bot )
						--AID.FlyRoute:Start( self.trigger, bot )
					end	
				end
			end
		elseif self:CheckRangeToPoints( self.tagPoints, dt ) then
			
			--sys.out( self:GetPrintName() .. ": Player %s reached the quest point", self.player )
			
			--Проверка на счетчик
			if self.Nearby_Counter >= self.nearby_timer then
			
				-- Сообщение о завершении выполнения 
				if self.nearby_text_progress then
					SV_ShowWowMsg( self.player, self.nearby_text_progress, true, 300, {{ name = "nearby_progress", type = ai.GameMsgParamType.INT, value = 100,},}, 1 )
				end
				
				-- Засчитываем выполнеине		
				if self.zonesAreSwitch then 
					local path = ai.SituationResult.CODE_1 + self.zonesAreSwitch - 1
					self:StartDialog( self.zonesAreSwitch )
					self:Finish( path )
				else
					self:StartDialog( nil )
					self:Finish( ai.SituationResult.SUCCESS )
				end 
			else 
				self.Nearby_Counter = self.Nearby_Counter + dt
				
				-- Сообщение о прогрессе
				if self.nearby_text_progress then
					local progress = self.Nearby_Counter / self.nearby_timer * 100
					SV_ShowWowMsg( self.player, self.nearby_text_progress, true, 297, {{ name = "nearby_progress", type = ai.GameMsgParamType.INT, value = progress,},}, 1 )
				end
			end
			
		elseif self.nearby_dec > 0 then
			self.Nearby_Counter = math.max (self.Nearby_Counter - dt*self.nearby_dec, 0)
			
			if self.Nearby_Counter > 0 and self.nearby_text_progress then
				-- Негативное сообщение о прогрессе
				local progress = self.Nearby_Counter / self.nearby_timer * 100
				SV_ShowWowMsg( self.player, self.nearby_text_progress, false, 298, {{ name = "nearby_progress", type = ai.GameMsgParamType.INT, value = progress,},}, 1 )
			end
		end
		
		if self.triggerEntDef and not (self.Start or self.trigger) and self:TriggerSpawnPeriodChecker( dt ) then -- тригер был, но пропал
		
			self.trigger = self:ReturnEntityByDef(self.triggerEntDef, Def[self.triggerEntDef].class)
			if not self.trigger then 
				self:SpawnTrigger( dt )
			elseif self.triggerSettings and self.triggerSettings.setNewBehavior then
				local bot = AID:GetBot( self.trigger:GetId() )
				if self.triggerSettings.path_config and type(self.triggerSettings.path_config) == "table" then 
					-- если триггер - корабль (нужно добавить проверку на остальные классы сущностей)
					bot.config = self.triggerSettings.path_config
				end

				bot.currentWayPoint = 0
				bot.behavior = "FlyRoute"
				AID:SetNewBehavior( self.trigger, bot )
				--AID.FlyRoute:Start( self.trigger, bot )
			end	
		end
	end
end


function Adventure_FlyNearby:StartDialog( param )
	for i, dialog in pairs( self.dialog_params ) do
		if not param or (dialog.param == param) then 
			local portrait, character
			if dialog.character and type( dialog.character ) == "string" then
				character = "quest_character_"..dialog.character
			else
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
				break
			end 
			if not dialog.text then
				sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
				break
			end
			if dialog.portrait and type( dialog.portrait ) == "string" then 
				portrait = "quest_character_"..dialog.portrait.."_medium"
			else 
				portrait = "quest_character_default_medium"
			end 
			if not dialog.timer then
				dialog.timer = 15
			end 
			if dialog.sound_file then 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
			else 
				SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
			end
		end
	end
end


function Adventure_FlyNearby:SV_OnRemovePlayer( player )
	if self.player == player and self.fail_ifEscapeZone then
		self:Finish( ai.SituationResult.FAIL )
	end
end

function Adventure_FlyNearby:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )
	
	local pid
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		local p = Entities[pid]
		if p:GetDefName() == self.pointDef then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
	
	if self.triggerEntDef then
		self.trigger = nil
		self.triggerId = nil
	end
	
	self.Timer_trigger_spawn = 0
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local Adventure_GiveAdventures = {}

function Adventure_GiveAdventures:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.playerId			= 0
	
	return true
	
end

function Adventure_GiveAdventures:GetPrintName()

	return "Adventure_GiveAdventures [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_GiveAdventures:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	self.giveQuestAtTheEnd	= launchT.giveQuestAtTheEnd or nil
	self.dialog_params	= launchT.dialog_params	or {}
end

function Adventure_GiveAdventures:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	if self.giveQuestAtTheEnd then
		SV_FreeSpace_TryGiveAdventure( self.player, self.giveQuestAtTheEnd )
	end
	
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
	
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_GiveAdventures:SetPlayerID( )
	if self.playerId < 0 or not (Entities[ self.playerId ]) then
		self.playerId = GetPlayerInfo( self.player ).entityId
		local playerEntity = Entities[ self.playerId ]
		if self.playerId > 0 and playerEntity then
			return true
		else 
			return false
		end
	end
	return true
end

function Adventure_GiveAdventures:SV_OnUpdate( dt )
	
	if self:SetPlayerID( ) and Entities[ self.playerId ] then -- запускаем прогон только после того как игрок загрузился на локацию
		if self.giveQuestAtTheEnd then
			if self:CheckAdventures( self.giveQuestAtTheEnd )then
				local tryGiveAdv = SV_FreeSpace_TryGiveAdventure( self.player, self.giveQuestAtTheEnd )
				self.giveQuestAtTheEnd = nil
				if tryGiveAdv then 
					self:Finish( ai.SituationResult.SUCCESS )
				else
					self:Finish( ai.SituationResult.FAIL )
				end
			end
		end
	end
end

function Adventure_GiveAdventures:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end

---------------------------------------
---------------------------------------

local Adventure_SpawnObjectsAfterInteract = {}

function Adventure_SpawnObjectsAfterInteract:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	self.spawnPointDef		= nil
	self.entityDef		= nil
	self.existenceTime	= nil
	self.startTime = 0
	
	self.Start = true
	self.fail_ifEscapeZone = true
	
	self.multiuse		= false
	self.objContainer  = {}
	
	return true
end

function Adventure_SpawnObjectsAfterInteract:GetPrintName()

	return "Adventure_SpawnObjectsAfterInteract [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_SpawnObjectsAfterInteract:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	
	
	self.spawnPointDef	= launchT.spawnPointDef		or nil
	self.entityDef		= launchT.entityDef			or nil
	self.entityName		= launchT.entityName		or nil
	self.existenceTime	= launchT.existenceTime		or 5
	self.interactionDef = launchT.interactionDef	or nil
	
	self.dialog_params		= launchT.dialog_params	or {}

	if not type(self.spawnPointDef == "string") then
		sys.logError( self:GetPrintName() .. ": spawnPointDef - wrong type. Strig expected.")
	end
	if not type(self.entityDef == "string") then
		sys.logError( self:GetPrintName() .. ": spawnPointDef - wrong type. Strig expected.")
	end
	if not type(self.entityName == "string") then
		sys.logError( self:GetPrintName() .. ": spawnPointDef - wrong type. Strig expected.")
	end
	if not type(self.interactionDef == "string") then
		sys.logError( self:GetPrintName() .. ": spawnPointDef - wrong type. Strig expected.")
	end
end

function Adventure_SpawnObjectsAfterInteract:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	
	-- переводим все обьекты в неактивное сосотояние
	local pid, p
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef and p:IsUseableForPlayer( self.player ) then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
	
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
	

	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_SpawnObjectsAfterInteract:GetClassByEntityDef( def )
	return Def[ def ].class
end


function Adventure_SpawnObjectsAfterInteract:GetObjEntitysByDef( def ) -- ищет ентити на карте ома по дефу
	local ents = {}
	
	for _, pid in pairs( GetEntitiesByClass( self:GetClassByEntityDef( def ) ) ) do
		local p = Entities[pid]
		if p:GetDefName() == def then
			table.insert(ents , p )
		end
	end
	
	return ents
end

function Adventure_SpawnObjectsAfterInteract:SetUseable( )
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef then
			p:EnableRemoveNotification( true )
			p:SV_SetUseableForPlayer( self.player )
		end
	end
end

function Adventure_SpawnObjectsAfterInteract:UnsetUseable( )
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
end

function Adventure_SpawnObjectsAfterInteract:SV_OnUpdate( dt )
	if self.Start and Entities[ GetPlayerInfo( self.player ).entityId ] then
	
		-- находим все обьекты с дефом, делаем их доступными
		self:SetUseable()
		self.Start = false
	end
	
	
	if #self.objContainer > 0 then
		-- запустить таймер на отсчет до выключения точек
		self.startTime = self.startTime + dt
		
		if self.startTime > self.existenceTime then
			-- удаляем сущности c карты
			self:RemoveSpawnedFromMap()
			
			self.startTime = 0
			self.objContainer = {}
			self:Finish( ai.SituationResult.SUCCESS )
		end
	end
end

function Adventure_SpawnObjectsAfterInteract:RemoveSpawnedFromMap()

	for _, obj in pairs( self.objContainer ) do
		obj:Remove()
	end
	self.objContainer = {}
end

-- спавн обьектов entityDef с именем entityName	на точках spawnPointDef
function Adventure_SpawnObjectsAfterInteract:SpawnEntOnPoints()
	
	if self.spawnPointDef then
			
		local points = self:GetObjEntitysByDef( self.spawnPointDef )
		local i = 1
		
		-- спавним обьекты на точках
		for _, p in pairs( points ) do
			local pos = p:GetPos()
			local e = ai.Spawn( self.entityDef, self.entityName..tostring( i ) )
			e:SetRelationshipGroup( ai.RelationshipGroups.Police )
			i = i + 1
			e:SetPos(pos)
			table.insert(self.objContainer , e )
		end
		
	else 
		sys.logError( self:GetPrintName() .. ": spawnPointDef did not found")
	end
end

function Adventure_SpawnObjectsAfterInteract:Clean()

	sys.out( self:GetPrintName() .. ":Clean" )

end

function Adventure_SpawnObjectsAfterInteract:SV_OnRemovePlayer( player )
	if self.player == player then
		if #self.objContainer > 0 then
			self:RemoveSpawnedFromMap()
		end
	end
end

function Adventure_SpawnObjectsAfterInteract:SV_OnAdventureObjectInteract( user, object )
	
	if not ( self.multiuse ) and user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.interactionDef then
		self:UnsetUseable()
		
		self:SpawnEntOnPoints()
	end
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------


local Adventure_ShotMainTurretsAfterInteract = {}

function Adventure_ShotMainTurretsAfterInteract:Init( defT )

	sys.out( self:GetPrintName() .. ":Init" )
	
	--self.spawnPointDef		= nil
	self.mainTurretDef		= nil
	self.existenceTime	= nil
	self.startTime = 0
	
	self.Start = true
	self.fail_ifEscapeZone = true
	
	self.multiuse		= false
	self.objContainer  = {}
	self.Shooting = false 
	
	return true
end

function Adventure_ShotMainTurretsAfterInteract:GetPrintName()

	return "Adventure_ShotMainTurretsAfterInteract [ " .. self:GetId()  .. " : " .. self:GetDefName() .. " ]"

end

function Adventure_ShotMainTurretsAfterInteract:Launch( launchT )

	sys.out( self:GetPrintName() .. ":Launch" )
	
	if not CheckAdventureLauchTable( self:GetPrintName(), launchT ) then
		self:Finish( ai.SituationResult.ERROR )
	end
	
	-- в теории так можно будет вытащить параметры, с которыми ситуацию запустили
	self.player			= launchT.adventure.player	or 0 -- Idx игрока
	
	
	--self.spawnPointDef	= launchT.spawnPointDef		or nil
	self.mainTurretDef	= launchT.mainTurretDef			or nil
	self.existenceTime	= launchT.existenceTime		or 5
	self.interactionDef = launchT.interactionDef	or nil
	
	self.dialog_params		= launchT.dialog_params	or {}

	if not type(self.mainTurretDef == "string") then
		sys.logError( self:GetPrintName() .. ": mainTurretDef - wrong type. Strig expected.")
	end
	if not type(self.interactionDef == "string") then
		sys.logError( self:GetPrintName() .. ": interactionDef - wrong type. Strig expected.")
	end
end

function Adventure_ShotMainTurretsAfterInteract:Release()

	sys.out( self:GetPrintName() .. ":Release" )
	
	-- переводим все обьекты в неактивное сосотояние
	local pid, p
	for _, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef and p:IsUseableForPlayer( self.player ) then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
	
	self:Finish( ai.SituationResult.CANCEL )
end

function Adventure_ShotMainTurretsAfterInteract:GetClassBymainTurretDef( def )
	return Def[ def ].class
end

function Adventure_ShotMainTurretsAfterInteract:PlayDialogs( )
	for i, dialog in pairs( self.dialog_params ) do
		local portrait, character
		if dialog.character and type( dialog.character ) == "string" then
			character = "quest_character_"..dialog.character
		else
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no character", i)
			break
		end 
		if not dialog.text then
			sys.logError( self:GetPrintName() .. ": dialog_params[%d] has no text", i)
			break
		end
		if dialog.portrait and type( dialog.portrait ) == "string" then 
			portrait = "quest_character_"..dialog.portrait.."_medium"
		else 
			portrait = "quest_character_default_medium"
		end 
		if not dialog.timer then
			dialog.timer = 15
		end 
		if dialog.sound_file then 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer, dialog.sound_file )  
		else 
			SV_ShowDialogScript( self.player, portrait, character, dialog.text, dialog.timer )  
		end
	end
end


function Adventure_ShotMainTurretsAfterInteract:GetObjEntitysByDef( def ) -- ищет ентити на карте ома по дефу
	local ents = {}
	
	for _, pid in pairs( GetEntitiesByClass( self:GetClassBymainTurretDef( def ) ) ) do
		local p = Entities[pid]
		if p:GetDefName() == def then
			table.insert(ents , p )
		end
	end
	
	return ents
end

function Adventure_ShotMainTurretsAfterInteract:SetUseable( )
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef then
			p:EnableRemoveNotification( true )
			p:SV_SetUseableForPlayer( self.player )
		end
	end
end

function Adventure_ShotMainTurretsAfterInteract:UnsetUseable( )
	local i, pid, p
	for i, pid in pairs( GetEntitiesByClass( "AdventureObject" ) ) do
		p = Entities[pid]
		if p:GetDefName() == self.interactionDef then
			p:SV_UnsetUseableForPlayer( self.player )
		end
	end
end

function Adventure_ShotMainTurretsAfterInteract:SV_OnUpdate( dt )
	if self.Start and Entities[ GetPlayerInfo( self.player ).entityId ] then
	
		-- находим все обьекты с дефом, делаем их доступными
		self:SetUseable()
		self.Start = false
	end
	
	
	if self.Shooting then
		-- запустить таймер на отсчет до выключения точек
		self.startTime = self.startTime + dt
		
		if self.startTime > self.existenceTime then
			self.Shooting = false
			self:StopShootingMainTurrets()
			self.startTime = 0
			self:Finish( ai.SituationResult.SUCCESS )
		end
	end
end

function Adventure_ShotMainTurretsAfterInteract:StartShootingMainTurrets()
	
	if self.mainTurretDef then
		
		local mainTur = GetEntitiesByDef( self.mainTurretDef )
		for i, main in ipairs( mainTur ) do
			Entities[ main ]:Start()
		end
		self.Shooting = true
		
	else 
		sys.logError( self:GetPrintName() .. ": mainTurretDef did not found")
	end
end

function Adventure_ShotMainTurretsAfterInteract:StopShootingMainTurrets()
	
	if self.mainTurretDef then
		
		local mainTur = GetEntitiesByDef( self.mainTurretDef )
		for i, main in ipairs( mainTur ) do
			Entities[ main ]:Stop()
		end
		
	else 
		sys.logError( self:GetPrintName() .. ": mainTurretDef did not found")
	end
end

function Adventure_ShotMainTurretsAfterInteract:Clean()
	sys.out( self:GetPrintName() .. ":Clean" )
end

function Adventure_ShotMainTurretsAfterInteract:SV_OnRemovePlayer( player )
	if self.player == player then
		self:StopShootingMainTurrets()
	end
end

function Adventure_ShotMainTurretsAfterInteract:SV_OnAdventureObjectInteract( user, object )
	
	if not ( self.multiuse ) and user:GetId() == GetPlayerInfo( self.player ).entityId and object:GetDefName() == self.interactionDef then
		self:UnsetUseable()
		
		self:StartShootingMainTurrets()
		self:PlayDialogs()
	end
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

SituationScripts = {}
SituationScripts.Alpha						= SituationAlpha
SituationScripts.Beta						= SituationBeta
SituationScripts.Single 					= SituationSingle
SituationScripts.AdventureTest_SpawnNPC 	= AdventureTest_SpawnNPC
SituationScripts.AdventureTest_SpawnEntity	= AdventureTest_SpawnEntity
SituationScripts.AdventureTest_LootCrate	= AdventureTest_SpawnLootCrate
SituationScripts.Adventure_QuestInteract	= Adventure_InteractObject
SituationScripts.Adventure_QuestCollect		= Adventure_QuestCollectObject -- делает обьект неактивным после взаимодействия, выдает предмет
SituationScripts.Adventure_QuestTake		= Adventure_QuestTakeObject	-- обьект взаимодействия остается активным (для обьектов с respawn_time), выдает предмет
SituationScripts.Adventure_ReachThePoint	= Adventure_ReachThePoint -- задача на достижение точки на карте
SituationScripts.Adventure_SpawnMobPack		= Adventure_SpawnMobPack -- порождает волны врагов
SituationScripts.Adventure_Ambush			= Adventure_Ambush -- какое-то действие одноразово порождает на точке мобов
SituationScripts.Adventure_KillAllMobs		= Adventure_KillAllMobs -- задача на убийство всех ботов конкретного дефа
SituationScripts.Adventure_PikabuEvent		= Adventure_PikabuEvent -- SC-115988 Колаб с Пикабу 12 апреля. Квест от Пикабу
SituationScripts.Adventure_GiveItems		= Adventure_GiveItems -- при получении стадии выдает игроку предмет
SituationScripts.Adventure_NewGround_Ambush	= Adventure_NewGround_Ambush -- Квестовая засада в которой игрок должен погибнуть
SituationScripts.Adventure_ChangeBotAutomat	= Adventure_ChangeBotAutomat -- меняет автомат поведения выбранных мобов
SituationScripts.Adventure_EnterZoneSwitch	= Adventure_EnterZoneSwitch -- переключатель на разные стадии в зависимости от локации в которую игрок прилетел
SituationScripts.Adventure_FlyNearby		= Adventure_FlyNearby -- Нужно лететь рядом с целью пока не заполнится счетчик
SituationScripts.Adventure_GiveAdventures	= Adventure_GiveAdventures -- Выдает приключение
SituationScripts.Adventure_SpawnObjectsAfterInteract	= Adventure_SpawnObjectsAfterInteract -- На время спавнит обьекты после взаимодействия
SituationScripts.Adventure_ShotMainTurretsAfterInteract	= Adventure_ShotMainTurretsAfterInteract -- Стреляет выбранными пушками при взаимодействии с обьектом



