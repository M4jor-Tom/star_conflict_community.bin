-- ----------------------------------------------------------------------------
--
-- Workfile: universe.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: universe.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Universe then
	return
end
UI.Universe = {}
UI.Universe.galaxy = nil
UI.Universe.map = nil
UI.Universe.battles = nil
UI.Universe.bids = nil
UI.Universe.isInited = false
UI.Universe.ttl = u64( 0, 0 )
UI.Universe.ttlTime = u64( 0, 0 )
UI.Universe.conflict = nil
UI.Universe.bonuses = nil
UI.Universe.wingsCount = 0

UI.Universe.TIME_PREDICTION = 60 * 1000

--
function UI.Universe:Clear()
	self.galaxy = nil
	self.map = nil
	self.battles = nil
	self.isInited = false
	self.ttl = u64( 0, 0 )
	self.ttlTime = u64( 0, 0 )
	self.conflict = nil
	self.bonuses = nil
	self.wingsCount = 0
	self.isUniverseRequested = false
end

--
function UI.Universe:Reload()
	if self:IsInited() then
		self:MasterServer_OnUniverseGet( 0, 0 )
	end
end

--
function UI.Universe:IsInited()
	return self.isInited
end

--
function UI.Universe:Request( force )
	if not self.isUniverseRequested or force then
		self.isUniverseRequested = true
		return _G.MasterServer_UniverseRequest()
	end
end

--
function UI.Universe:IsTableValid( data )
	return true
end

--
function UI.Universe:MasterServer_OnUniverseGet( result, requestId )
	self.isUniverseRequested = false
	if result ~= 0 then
		return
	end
	self.isInited = true
	local data, battles, bonuses, wingsCount = _G.MasterServer_UniverseGet()
	self:Clear()
	self.isInited = true
	if self:IsTableValid( data ) then
		self.data = _G.MasterServer_UniverseGet()
	else
		--sys.log( "Loaded universe is not valid!" )
	end
end


--
function UI.Universe:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if result == 0 then
		if self.isInited then
			self:MasterServer_OnUniverseGet( 0, 0 )
		end
	end

end


--
function UI.Universe:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	if result == 0 then
		if self.isInited then
			self:MasterServer_OnUniverseGet( 0, 0 )
		end
	end

end


--
function UI.Universe:GetSectors()
	if self:IsInited() and self.data and self.data.zones then
		return self.data.zones or {}
	else
		sys.log( "UI.Universe:GetSectors()[ERROR]: Universe is not inited" )
		return {}
	end
end

--
function UI.Universe:GetSectorById( id, bErrorOnMiss--[[true по умолчанию]] )

	if bErrorOnMiss == nil then
		bErrorOnMiss = true
	end

	if self.isInited then
		if self.data and self.data.zones and self.data.zones[ id ] then
			return self.data.zones[ id ]
		else
			if bErrorOnMiss then
				sys.log( "UI.Universe:GetSectorById()[ERROR]: can't find sector by id: %d", id or 0 )
			end
		end
	else
		sys.log( "UI.Universe:GetSectorById()[ERROR]: universe is not inited" )
	end
	return nil
end

--
function UI.Universe:GetSectorOwner( id )
	local sector = self:GetSectorById( id )
	if sector and sector.owner then
		return sector.owner
	end
end


--
function UI.Universe:GetSectorClanShipRace( id )
	local sector = self:GetSectorById( id )
	if sector and sector.race then
		return sector.race
	end
end


--
function UI.Universe:IsSectorAlreadyAttacked( id )
	local rivals
end

--
function UI.Universe:GetSectorOwnerClanShip( id )
	local sector = self:GetSectorById( id )
	if sector and sector.ownerClanShip then
		return sector.ownerClanShip
	end
end

--
function UI.Universe:GetRivalsForZone( id )
	local sector = UI.Universe:GetSectorById( id )
	if sector and sector.rivals then
		return sector.rivals
	end
end

--
function UI.Universe:GetRivalByCidForZone( id, cid )
	local rivals = self:GetRivalsForZone( id )
	if rivals then
		for k, v in pairs( rivals ) do
			if v.cid == cid then
				return v
			end
		end
	end
end