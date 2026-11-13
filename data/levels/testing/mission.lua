sys.execscript( 'scripts/hangar.lua' )

function Hangar:Update( dt )
	self:UpdateCamera( dt, true )
end

Mission = 
{
	prevMouseX = 0,
	prevMouseY = 0,
	shipHangarSlots = {},

	MAX_SLOTS = 4,
}

worldViewAlternative = cvars.cam_worldViewAlternative ~= 0
cvars.cam_worldViewAlternative = 0

--[[
local function ParseTokenPrefix( name, desc )

	local res = "other"
	
	if not desc or not desc.albedo then
		return res
	end

	local start = 1
	local finish = string.find( desc.albedo, "/", start )
	while finish do
		res = string.sub( desc.albedo, start, finish - 1 )
		start = finish + 1
		finish = string.find( desc.albedo, "/", start )
	end
	return res

end
]]
--[[
local function PrecacheModelSkins( model )
	local skinIdx = model:GetSkin( "improved" );
	if skinIdx < 10 then
		model:SetSkin( skinIdx )
	end

	skinIdx = model:GetSkin( "premium" );
	if skinIdx < 10 then
		model:SetSkin( skinIdx )
	end
	
	skinIdx = model:GetSkin( "advanced" );
	if skinIdx < 10 then
		model:SetSkin( skinIdx )
	end

	-- restore default skin
	model:SetSkin( 0 )
end
]]
--
function Mission:OnStart()	
	-- HACK мышку должен обрабатывать UI и передавать значения в Hangar, когда это нужно 
	sys.concmd( [[bind mwheelup "scriptrun 'if Mission and Mission.OnMouseWheel then Mission:OnMouseWheel( 1 ) end'" 65]] )
	sys.concmd( [[bind mwheeldown "scriptrun 'if Mission and Mission.OnMouseWheel then Mission:OnMouseWheel( -1 ) end'" 65]] )
	sys.concmd( "showCursor;" )
	--[[
	-- global 
	DummuMenu_TestMenu = 
	{
		{ label = "selectSlot 1", 				cmd = "scriptrun 'Mission:SetCameraSlot( 1 )';", hide = false, },	
		{ label = "selectSlot 2", 				cmd = "scriptrun 'Mission:SetCameraSlot( 2 )';", hide = false, },	
		{ label = "selectSlot 3", 				cmd = "scriptrun 'Mission:SetCameraSlot( 3 )';", hide = false, },	
		{ label = "selectSlot 4", 				cmd = "scriptrun 'Mission:SetCameraSlot( 4 )';", hide = false, },	
		{ label = "change spaceship",			cmd = "dummyMenu_load DummuMenu_TestMenuShip", hide = false, },
		{ label = "change weapon",				cmd = "dummyMenu_load DummuMenu_TestMenuShipWeapon", hide = false, },
		{ label = "change module",				cmd = "dummyMenu_load DummuMenu_TestMenuShipModuleSel", hide = false, },
		{ label = "change decal",				cmd = "dummyMenu_load DummuMenu_TestMenuDecalToken", hide = false, },
		{ label = "change armor",				cmd = "dummyMenu_load DummuMenu_TestMenuArmors", hide = false, },
		{ label = "change dye",					cmd = "dummyMenu_load DummuMenu_TestMenuDyesSlotSel", hide = false, },
		{ label = "change skin",				cmd = "dummyMenu_load DummuMenu_TestMenuSkins", hide = false, },
		{ label = "change child",				cmd = "dummyMenu_load DummuMenu_TestMenuChilds", hide = false, },
		{ label = "change preset",				cmd = "dummyMenu_load DummuMenu_TestMenuPresets", hide = false, },
		{ label = "------------------------" },
		{ label = "FIX CAMERA", 				cmd = "scriptrun 'Mission:ReloadScripts()';", hide = false, },
		{ label = "------------------------" },
		{ label = "Back...",					cmd = "scriptrun 'cvars.cam_worldViewAlternative = worldViewAlternative and 1 or 0'; dummyMenu_load DummyMenu; map mainmenu", hide = false, },
	}
	
	function GetDefsByPrefix(filter)
		local defs = {}
		for name,def in pairs(Def) do
			if string.sub(name, 1, #filter) == filter then
				defs[name] = def
			end
		end
		return defs
	end
	
	if DummuMenu_TestMenuShip == nil then -- do not recreate TestMenuShip on map reload (below logic is not appropriate for reloading)
		-- global 
		DummuMenu_TestMenuShip = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "-- Ships --",				cmd = "", hide = false, },
		}
		
		for name, ship in pairsSorted( GetDefsByPrefix("Ship_") ) do

			if ship then

				local prefix = "Other"
				
				if string.sub(name, 1, 9) == "Ship_Race" then
					prefix = string.sub(name, 6, 10)
				end

				local subMenuTableName = "DummuMenu_TestMenuShip" .. prefix 
				if _G[ subMenuTableName ] == nil then
					
					_G[ subMenuTableName ] = 
					{
						{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuShip", hide = false, },
						{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
					}

					local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
					table.insert( DummuMenu_TestMenuShip, item )
				end

				local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShip( [ ["..name.."] ])'" }
				table.insert( _G[ subMenuTableName ], item )

			end
		end
	end
	
	if DummuMenu_TestMenuShipWeapon == nil then -- do not recreate TestMenuShipWeapon on map reload (below logic is not appropriate for reloading)
		-- global 
		DummuMenu_TestMenuShipWeapon = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "-- Weapons --",				cmd = "", hide = false, },
		}
		
		for name, weapon in pairsSorted( GetDefsByPrefix("Weapon_") ) do

			if weapon then

				local prefix = "Other"
				
				if weapon.shopSubCategory then
					prefix = weapon.shopSubCategory
				end

				local subMenuTableName = "DummuMenu_TestMenuShipWeapon" .. prefix 
				if _G[ subMenuTableName ] == nil then
					
					_G[ subMenuTableName ] = 
					{
						{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuShipWeapon", hide = false, },
						{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
					}

					local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
					table.insert( DummuMenu_TestMenuShipWeapon, item )
				end

				local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipModule( 0, [ ["..name.."] ])'" }
				table.insert( _G[ subMenuTableName ], item )

			end
		end
	end
	
	self.moduleSlot = 5
	DummuMenu_TestMenuShipModuleSel = 
	{
		{ label = "Module slot 1", 		cmd = "scriptrun 'Mission.moduleSlot = 5'; dummyMenu_load DummuMenu_TestMenuShipModule", hide = false, },	
		{ label = "Module slot 2", 		cmd = "scriptrun 'Mission.moduleSlot = 6'; dummyMenu_load DummuMenu_TestMenuShipModule", hide = false, },	
		{ label = "Module slot 3", 		cmd = "scriptrun 'Mission.moduleSlot = 7'; dummyMenu_load DummuMenu_TestMenuShipModule", hide = false, },	
		{ label = "Module slot 4", 		cmd = "scriptrun 'Mission.moduleSlot = 8'; dummyMenu_load DummuMenu_TestMenuShipModule", hide = false, },	
		{ label = "------------------------" },
		{ label = "Back...",					cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
	}
	
	if DummuMenu_TestMenuShipModule == nil then -- do not recreate TestMenuShipWeapon on map reload (below logic is not appropriate for reloading)
		-- global 
		DummuMenu_TestMenuShipModule = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "-- Modules --",				cmd = "", hide = false, },
		}
		
		for name, mod in pairsSorted( GetDefsByPrefix("Module_") ) do

			if mod then

				local prefix = "Other"
				
				if mod.shopSubCategory then
					prefix = mod.shopSubCategory
				end

				local subMenuTableName = "DummuMenu_TestMenuShipModule" .. prefix 
				if _G[ subMenuTableName ] == nil then
					
					_G[ subMenuTableName ] = 
					{
						{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuShipModule", hide = false, },
						{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
					}

					local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
					table.insert( DummuMenu_TestMenuShipModule, item )
				end

				local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipModule( Mission.moduleSlot, [ ["..name.."] ])'" }
				table.insert( _G[ subMenuTableName ], item )

			end
		end
	end
	
	DummuMenu_TestMenuDyesSlotSel = 
	{
		{ label = "@Dyes" },
		{ label = "Slot 1", 			cmd = "scriptrun 'Mission.moduleSlot = 0'; dummyMenu_load DummuMenu_TestMenuDyes", hide = false, },
		{ label = "Slot 2", 			cmd = "scriptrun 'Mission.moduleSlot = 1'; dummyMenu_load DummuMenu_TestMenuDyes", hide = false, },
		{ label = "Slot 3", 			cmd = "scriptrun 'Mission.moduleSlot = 2'; dummyMenu_load DummuMenu_TestMenuDyes", hide = false, },
		{ label = "------------------------" },
		{ label = "Back...",					cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
	}
	
	if DummuMenu_TestMenuDyes == nil then -- do not recreate on map reload (below logic is not appropriate for reloading)
		DummuMenu_TestMenuDyes = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Clear",						cmd = "scriptrun 'Mission:ChangeTestMenuShipDye( Mission.moduleSlot )'", hide = false, },
			{ label = "-- Dyes --",					cmd = "", hide = false, },
		}
			
		if ShipDyes then
			for name, data in pairsSorted( ShipDyes ) do
				local prefix = "Other"
				local second_prefix = string.gmatch(name, "[^_]+")()
				if prefix ~= second_prefix then
					prefix = second_prefix
				end
				local subMenuTableName = "DummuMenu_TestMenuDyes" .. prefix 
				if _G[ subMenuTableName ] == nil then
					_G[ subMenuTableName ] = 
					{
						{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuDyes", hide = false, },
						{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
					}
					local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
					table.insert( DummuMenu_TestMenuDyes, item )
				end
				local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipDye( Mission.moduleSlot, [ ["..name.."] ])'" }
				table.insert( _G[ subMenuTableName ], item )
			end
		end
	end
	
	if DummuMenu_TestMenuArmors == nil then -- do not recreate on map reload (below logic is not appropriate for reloading)
		DummuMenu_TestMenuArmors = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Clear",					cmd = "scriptrun 'Mission:ChangeTestMenuShipArmor([ [Disabled] ])'", hide = false, },
			{ label = "-- Armors --",			cmd = "", hide = false, },
		}
			
		if ShipArmors then
			for name, data in pairsSorted( ShipArmors ) do
				if name ~= "Disabled" then
					local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipArmor( [ ["..name.."] ])'" }
					table.insert( DummuMenu_TestMenuArmors, item )
				end
			end
		end
	end
	
	if DummuMenu_TestMenuDecalToken == nil then -- do not recreate TestMenuDecalToken on map reload (below logic is not appropriate for reloading)
		-- global 
		DummuMenu_TestMenuDecalToken = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Clear",					cmd = "scriptrun 'Mission:ChangeTestMenuShipDecal( 0, [ [Disabled] ])'", hide = false, },
			{ label = "-- Decal Token --",			cmd = "", hide = false, },
		}
		
		if ShipDecals and ShipDecals.Token then

			for name, data in pairsSorted( ShipDecals.Token ) do

				if name ~= "Disabled" then

					local prefix = ParseTokenPrefix( name, data )

					local subMenuTableName = "DummuMenu_TestMenuDecalToken" .. prefix 
					if _G[ subMenuTableName ] == nil then
						
						_G[ subMenuTableName ] = 
						{
							{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuDecalToken", hide = false, },
							{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
						}

						local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
						table.insert( DummuMenu_TestMenuDecalToken, item )
					end

					local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipDecal( 0, [ ["..name.."] ])'" }
					table.insert( _G[ subMenuTableName ], item )

				end
			end

		end
	end
	
	-- global 
	DummuMenu_TestMenuSkins = 
	{
		{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
		{ label = "-- Skins --",				cmd = "", hide = false, },
		{ label = "default",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [ [default] ] )'", hide = false, },
		{ label = "improved",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [ [improved] ] )'", hide = false, },
		{ label = "premium",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [ [premium] ] )'", hide = false, },
		{ label = "advanced",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [ [advanced] ] )'", hide = false, },
	}
	
	if DummuMenu_TestMenuChilds == nil then -- do not recreate on map reload (below logic is not appropriate for reloading)
		DummuMenu_TestMenuChilds = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Clear",					cmd = "scriptrun 'Mission:ChangeTestMenuShipChild(ai.VesselCustomSlot.CHILD_1)'", hide = false, },
			{ label = "-- Childs --",			cmd = "", hide = false, },
		}
			
		if VesselCustomElements then
			for name, data in pairsSorted( VesselCustomElements ) do
				if data.type and data.type == ai.VesselCustomElementType.CHILD and data.slot and data.slot == ai.VesselCustomSlot.CHILD_1 then
					local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipChild( ai.VesselCustomSlot.CHILD_1, [ ["..name.."] ])'" }
					table.insert( DummuMenu_TestMenuChilds, item )
				end
			end
		end
	end

	if DummuMenu_TestMenuPresets == nil then -- do not recreate on map reload (below logic is not appropriate for reloading)
		DummuMenu_TestMenuPresets = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Clear",					cmd = "scriptrun 'Mission:ChangeTestMenuShipPreset([ [] ])'", hide = false, },
			{ label = "-- Presets --",			cmd = "", hide = false, },
		}
			
		if VesselCustomElements then
			for name, data in pairsSorted( VesselCustomElements ) do
				if data.type and data.type == ai.VesselCustomElementType.MPRESET then
					local prefix = "Other"
					local second_prefix = string.gmatch(name, "[^_]+")()
					if prefix ~= second_prefix then
						prefix = second_prefix
					end
					local subMenuTableName = "DummuMenu_TestMenuPresets" .. prefix 
					if _G[ subMenuTableName ] == nil then
						_G[ subMenuTableName ] = 
						{
							{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenuPresets", hide = false, },
							{ label = "-- ".. prefix .. " --",		cmd = "", hide = false, },
						}
						local item = { label = prefix, hide = false, cmd = "dummyMenu_load " .. subMenuTableName, }
						table.insert( DummuMenu_TestMenuPresets, item )
					end
					local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipPreset( [ ["..name.."] ])'" }
					table.insert( _G[ subMenuTableName ], item )
				end
			end
		end
	end

	
	sys.concmd( "dummyMenu_load DummuMenu_TestMenu" )
	]]
	-- spawn default ships
	local shipDefs = { "Ship_Default", "Ship_Race1_S_T3", "Ship_Race1_M_T3", "Ship_Race1_L_T3" }
	for idx, defName in ipairs( shipDefs ) do
	
		local spawnSpot = Entities[ "SpawnSpot" .. idx ]
		if spawnSpot then
		
			local ship = _G.SpawnSpaceShip( defName, "HangarShip" .. idx, false )
			if ship then
				self.shipHangarSlots[ idx ] = ship:GetId()
				self:SetShipHangarSlot( ship, idx )
				--PrecacheModelSkins( ship )
			end
			
		end
		
	end
	
	Hangar:InitCamera()
	Hangar:SetCameraSlot( 1, self.shipHangarSlots[ 1 ], true )
	
end

--[[
--
function Mission:ChangeTestMenuShip( defName )

	local slot = Hangar.selectedSlot
	local prevShip = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if prevShip then
		prevShip:Remove()
		self.shipHangarSlots[ slot ] = nil
	end
	
	if defName then
	
		local spawnSpot = Entities[ "SpawnSpot" .. slot ]
		if spawnSpot then
			
			local ship = _G.SpawnSpaceShip( defName, "HangarShip" .. slot, false )
			if ship then
				self.shipHangarSlots[ slot ] = ship:GetId()
				self:SetShipHangarSlot( ship, slot )
				self:SetCameraSlot( slot )
				PrecacheModelSkins( ship )
			end
				
		end
	end

end


--
function Mission:ChangeTestMenuShipDecal( decalSlot, name )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		ship:EquipDecal( decalSlot, name )
	end
	
end


--
function Mission:ChangeTestMenuShipArmor( name )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		ship:EquipArmor( name )
	end
	
end

--
function Mission:ChangeTestMenuShipDye( dyeSlot, name )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	local dyeName = name
	if not dyeName then
		local def = Def[ship:GetDefName()]
		if def and def.default_custom_elements and def.default_custom_elements[dyeSlot+1] then
			dyeName = def.default_custom_elements[dyeSlot+1]
		else
			return
		end
	end
	if ship then
		ship:EquipDyeing( dyeSlot, dyeName )
	end
	
end


--
function Mission:ChangeTestMenuShipSkin( skinName )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		local skinIdx = ship:GetSkin( skinName )
		if skinIdx < 10 then
			ship:SetSkin( skinIdx )
		end
	end
	
end


--
function Mission:ChangeTestMenuShipModule( moduleSlot, defName )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		ship:EquipModule( moduleSlot, defName )
	end

end


--
function Mission:ChangeTestMenuShipChild( moduleSlot, defName )

	local slot = Hangar.selectedSlot
	local childName = defName or ""
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		ship:EquipChild( moduleSlot, childName )
	end

end


--
function Mission:ChangeTestMenuShipPreset( presetName )

	local slot = Hangar.selectedSlot
	local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		ship:SetVesselCustomElement( presetName, 5 )
	end

end
]]
--
function Mission:SetShipHangarSlot( ship, slot )
	
	local spawnSpot = Entities[ "SpawnSpot" .. slot ]
	
	local shipType = ship:GetShipClass()
	local shipTypeName = UI:Val2Key( ai.ShipClass, shipType )
	local preset = Hangar.CameraPresets[ shipTypeName ] or Hangar.CameraPresets.default

	local modelPos = _G.GetShipHangarOffset( ship )
	local shipPos = modelPos or preset.shipPos			

	ship:SetPosDir( spawnSpot:GetPos() + shipPos, spawnSpot:GetDir() )
	
end


--
function Mission:OnUpdate( dt )

	-- HACK мышку должен обрабатывать UI и передавать значения в Hangar, когда это нужно 
	local curMouseX = UI:GetMouseX() 
	local curMouseY = UI:GetMouseY() 
	local dx = curMouseX - self.prevMouseX
	local dy = curMouseY - self.prevMouseY
	if _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON2 ) then 
		Hangar:RotateCamera( dx, dy )
	end
	if _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON3 ) then 
		Hangar:MoveCamera( dx, dy )
	end
 	self.prevMouseX = curMouseX
	self.prevMouseY = curMouseY
 
	Hangar:Update( dt )
	--Mission:DebugDraw()
	
	-- force move ship to their current position for fix issue with applying RenderEntity's global illumination
	for slot = 1, self.MAX_SLOTS do
		local ship = self.shipHangarSlots[ slot ] and Entities[ self.shipHangarSlots[ slot ] ]
		if ship then
			ship:SetPos( ship:GetPos() );
		end
	end
	
end


--
function Mission:OnMouseWheel( val )

	-- HACK мышку должен обрабатывать UI и передавать значения в Hangar, когда это нужно 
	--sys.out( "Mission.OnMouseWheel( ".. tostring( val ).." )" )
	Hangar:ZoomCamera( val )
	
end

--[[
--
function Mission:DebugDraw()
	
	local x = 300
	local y = 40
	local slot = Hangar.selectedSlot
	DrawDebugText( 1, x, y, "^2slot       ".. slot )	y = y + 10
	DrawDebugText( 1, x, y, string.format( "^2cam pos  %0.2f %0.2f %0.2f", Hangar.cameraPos.x, Hangar.cameraPos.y, Hangar.cameraPos.z ) )	y = y + 10
	DrawDebugText( 1, x, y, string.format( "^2cam aim  %0.2f %0.2f %0.2f", Hangar.cameraAim.x, Hangar.cameraAim.y, Hangar.cameraAim.z ) )	y = y + 10
	
	local spawnSpot = Entities[ "SpawnSpot" .. slot ]
	local spotPos = vecs.v000
	if spawnSpot then
		spotPos = spawnSpot:GetPos()
		DrawDebugText( 1, x, y, string.format( "^2spot pos %0.2f %0.2f %0.2f", spotPos.x, spotPos.y, spotPos.z ) )	y = y + 10
	end
	
	local ship = Entities[ self.shipHangarSlots[ slot ] ]
	if ship then
		local shipType = ship:GetShipClass()
		local shipTypeName = UI:Val2Key( ai.ShipClass, shipType )
		local preset = Hangar.CameraPresets[ shipTypeName ] or Hangar.CameraPresets.default

		local modelPos = _G.GetShipHangarOffset( ship )

		local shipPos = ship:GetPos()
		DrawDebugText( 1, x, y, string.format( "^2ship pos %0.2f %0.2f %0.2f", shipPos.x, shipPos.y, shipPos.z ) )	y = y + 10
		
		if modelPos then
			DrawDebugText( 1, x, y, string.format( "^2offset   %0.2f %0.2f %0.2f", modelPos.x, modelPos.y, modelPos.z ) )	y = y + 10
			DrawDebugText( 1, x, y, string.format( "^2from model " .. ship:GetDefName() ) )	y = y + 10
		else
			DrawDebugText( 1, x, y, string.format( "^2offset   %0.2f %0.2f %0.2f", preset.shipPos.x, preset.shipPos.y, preset.shipPos.z ) )	y = y + 10
			DrawDebugText( 1, x, y, string.format( "^2from preset " .. shipTypeName ) )	y = y + 10
		end
		
	end
	
end
]]

--
function Mission:ReloadScripts()
	sys.execscript( 'scripts/hangar.lua' )
	Hangar:InitCamera()
	Hangar:SetCameraSlot( 1, self.shipHangarSlots[ 1 ], true )
end


--
function Mission:SetCameraSlot( slot )
	Hangar:SetCameraSlot( slot, self.shipHangarSlots[ slot ], false )
end