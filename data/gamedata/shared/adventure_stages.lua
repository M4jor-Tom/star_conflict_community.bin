-- файл не читается на сервисе, только на дедике и клиенте

-- 
local TestStageAlpha = {}


function TestStageAlpha:Init( player, atid, params, stageDefTable, progress )
	self.timer = 0
	self.healed = 0
	self.damaged = 0
	sys.log("TestStageAlpha:Init( "..player..", "..atid.."," .. progress .. ")")
end


function TestStageAlpha:Clean()
	sys.log("TestStageAlpha:Clean(), self.healed %d", self.healed )
end


function TestStageAlpha:SV_OnUpdate( dt )

	self.timer = self.timer + dt
	
	if self.timer > 8 then
		self.timer = self.timer - 8
		sys.log( "TestStageAlpha:SV_OnUpdate( dt ): TRYAM!" )
	end
	
end


function TestStageAlpha:SV_OnEntityKill( victimEntity, asists, isLastHit )

	sys.log("TestStageAlpha:SV_OnEntityKill( %d, %s )", victimEntity:GetId(), isLastHit )
	dprint( asists );
	self:Finish( ai.AdventureStage.ROUTE_FIRST + 2 )
end


function TestStageAlpha:SV_OnAdventureObjectInteract( user, object )

	sys.log("TestStageAlpha:SV_OnAdventureObjectInteract( %d, %d )", user:GetId(), object:GetId() )
	
	self:IncProgress( 1 )

end


function TestStageAlpha:SV_OnLootItem( itemDefName, count )

	sys.log("TestStageAlpha:SV_OnLootItem( %s, %d )", itemDefName, count )
	
	self:IncProgress( 1 )

end


function TestStageAlpha:SV_OnDropItem( itemDefName, count )

	sys.log("TestStageAlpha:SV_OnDropItem( %s, %d )", itemDefName, count )

end


function TestStageAlpha:SV_OnHeal( patientEntity, healerId, healedValue )

	sys.log("TestStageAlpha:SV_OnHeal( %d, %d, %f )", patientEntity:GetId(), healerId,  healedValue)
	
	self.healed = self.healed + healedValue
	
	if self.healed > 500 then
		self:IncProgress( 1 )
		self.healed = self.healed - 500
	end
end


function TestStageAlpha:SV_OnDamage( victimEntity, damagerId, damageValue )

	sys.log("TestStageAlpha:SV_OnDamage( %d, %d, %f)", victimEntity:GetId(), damagerId,  damageValue)
	
	self.damaged = self.damaged + damageValue
	
	if self.damaged > 500 then
		self:IncProgress( 1 )
		self.damaged = self.damaged - 500
	end
end


local TestStageBeta = {}

function TestStageBeta:Init( player, atid, params, stageDefTable, progress )

	sys.log("TestStageBeta:Init( "..player..", "..atid.."," .. progress .. " )")
	self.name			= "TestStageBeta[ "..atid.." ]"
	
end

function TestStageBeta:Clean()

	sys.log( self.name..":Clean()")
	
end

function TestStageBeta:SV_OnReceiveSituationNotification( sourceId, code)

	sys.log( self.name .. ":ReceiveNotification: sit_%d sending code %d", sourceId, code )

end

function TestStageBeta:SV_OnReceiveSituationResult( sourceId, code)

	sys.log( self.name..":ReceiveResult: sit_%d sending result %d", sourceId, code )
	
end

-------------------------------------------
-------------------------------------------
local SITUATION_RESULT = {}

function SITUATION_RESULT:Init( player, atid, params, stageDefTable, progress )

	sys.log("SITUATION_RESULT:Init( "..player..", "..atid.."," .. progress .. " )")
	self.name			= "SITUATION_RESULT[ "..atid.." ]"
	
end

function SITUATION_RESULT:Clean()

	sys.log( self.name..":Clean()")
	
end

function SITUATION_RESULT:SV_OnReceiveSituationNotification( sourceId, code)

	sys.log( self.name .. ":ReceiveNotification: sit_%d sending code %d", sourceId, code )

end

function SITUATION_RESULT:SV_OnReceiveSituationResult( sourceId, code)

	sys.log( self.name..":ReceiveResult: sit_%d sending result %d", sourceId, code )
	
end

function SITUATION_RESULT:SV_OnUpdate( dt )


end

-------------------------------------------
local CHECK_ZONE = {}

function CHECK_ZONE:Init( player, atid, params, stageDefTable, progress )
	
	-- зона которую надо проверять должна быть первым параметром
	sys.log("CHECK_ZONE:Init( "..player..", "..atid.."," .. progress .. " )")
	self.name			= "CHECK_ZONE[ "..atid.." ]"
	
	self.zone = params[1]
	self.player = player
	self.playerId = -1
	self.AllowUpdate = false
	
	if self.zone == CL_GetCurrentSpaceZoneId() then
		self.AllowUpdate = true
	end
end

function CHECK_ZONE:Clean()

	sys.log( self.name..":Clean()")
	
end

function CHECK_ZONE:SV_OnReceiveSituationNotification( sourceId, code)

	sys.log( self.name .. ":ReceiveNotification: sit_%d sending code %d", sourceId, code )

end

function CHECK_ZONE:SV_OnReceiveSituationResult( sourceId, code)

	sys.log( self.name..":ReceiveResult: sit_%d sending result %d", sourceId, code )
	
end

function CHECK_ZONE:SV_OnUpdate( dt )

	if self.AllowUpdate then 
		self.playerId = GetPlayerInfo( self.player ).entityId
		if self.playerId == -1 then
			return
		else
			self:IncProgress( 1 )
			self.AllowUpdate = false
			return
		end
	end
end

----------------------------------------------------------------------------------------------------
AdventureStageScripts = {}
AdventureStageScripts[ ai.AdventureStageType.TestStageAlpha ] = TestStageAlpha
AdventureStageScripts[ ai.AdventureStageType.TestStageBeta	] = TestStageBeta
AdventureStageScripts[ ai.AdventureStageType.SITUATION_RESULT ] = SITUATION_RESULT
AdventureStageScripts[ ai.AdventureStageType.CHECK_ZONE ] = CHECK_ZONE
