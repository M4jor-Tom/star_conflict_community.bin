sys.execscript( 'scripts/hangar.lua' )


Mission = 
{
	prevMouseX = 0,
	prevMouseY = 0,
	shipEntityId = {},

	MAX_SLOTS = 4,
}


--
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

--
function Mission:OnStart()
	
	-- HACK мышку должен обрабатывать UI и передавать значения в Hangar, когда это нужно 
	sys.concmd( [[bind mwheelup "scriptrun 'if Mission and Mission.OnMouseWheel then Mission:OnMouseWheel( 1 ) end'" 65]] )
	sys.concmd( [[bind mwheeldown "scriptrun 'if Mission and Mission.OnMouseWheel then Mission:OnMouseWheel( -1 ) end'" 65]] )
	sys.concmd( "showCursor;" )
	
	-- global 
	DummuMenu_TestMenu = 
	{
		{ label = "back",						cmd = "dummyMenu_load DummyMenu", hide = false, },
		{ label = "selectSlot 1", 				cmd = "scriptrun 'Mission:SetCameraSlot( 1 )';", hide = false, },	
		{ label = "selectSlot 2", 				cmd = "scriptrun 'Mission:SetCameraSlot( 2 )';", hide = false, },	
		{ label = "selectSlot 3", 				cmd = "scriptrun 'Mission:SetCameraSlot( 3 )';", hide = false, },	
		{ label = "selectSlot 4", 				cmd = "scriptrun 'Mission:SetCameraSlot( 4 )';", hide = false, },	
		{ label = "change spaceship",			cmd = "dummyMenu_load DummuMenu_TestMenuShip", hide = false, },
		{ label = "change Token",			cmd = "dummyMenu_load DummuMenu_TestMenuDecalToken", hide = false, },
		{ label = "change Skin",			cmd = "dummyMenu_load DummuMenu_TestMenuSkins", hide = false, },
		{ label = "reload scripts",				cmd = "scriptrun 'Mission:ReloadScripts()';", hide = false, },
	}
	
	-- global 
	DummuMenu_TestMenuShip =
	{
		{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
		{ label = "clear slot",					cmd = "scriptrun 'Mission:ChangeTestMenuShip()'", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "---Race1 Empire Ships---",	cmd = "", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "S_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_S_T1]])'", hide = false, },
		{ label = "S_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_S_T2]])", hide = false, },
		{ label = "S_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_S_T3]])", hide = false, },
		{ label = "S_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_S_T4]])", hide = false, },
		{ label = "S_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_S_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "M_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T1]])", hide = false, },
		{ label = "M_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T2]])", hide = false, },
		{ label = "M_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T3]])", hide = false, },
		{ label = "M_T3_Steam",					cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T3_Steam]])", hide = false, },
		{ label = "M_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T4]])", hide = false, },
		{ label = "M_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_M_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },       
		{ label = "L_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_L_T1]])", hide = false, },
		{ label = "L_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_L_T2]])", hide = false, },
		{ label = "L_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_L_T3]])", hide = false, },
		{ label = "L_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_L_T4]])", hide = false, },
		{ label = "L_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_L_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "H_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race1_H_T3]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "--Race2 Jericho Ships---",	cmd = "", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "S_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_S_T1]])", hide = false, },
		{ label = "S_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_S_T2]])", hide = false, },
		{ label = "S_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_S_T3]])", hide = false, },
		{ label = "S_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_S_T4]])", hide = false, },
		{ label = "S_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_S_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "M_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T1]])", hide = false, },
		{ label = "M_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T2]])", hide = false, },
		{ label = "M_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T3]])", hide = false, },
		{ label = "M_T3_Steam",					cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T3_Steam]])", hide = false, },
		{ label = "M_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T4]])", hide = false, },
		{ label = "M_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_M_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "L_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_L_T1]])", hide = false, },
		{ label = "L_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_L_T2]])", hide = false, },
		{ label = "L_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_L_T3]])", hide = false, },
		{ label = "L_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_L_T4]])", hide = false, },
		{ label = "L_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_L_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "H_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race2_H_T3]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "--Race3 Federation Ships--",	cmd = "", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "S_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_S_T1]])", hide = false, },
		{ label = "S_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_S_T2]])", hide = false, },
		{ label = "S_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_S_T3]])", hide = false, },
		{ label = "S_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_S_T4]])", hide = false, },
		{ label = "S_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_S_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "M_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T1]])", hide = false, },
		{ label = "M_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T2]])", hide = false, },
		{ label = "M_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T3]])", hide = false, },
		{ label = "M_T3_Steam",					cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T3_Steam]])", hide = false, },
		{ label = "M_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T4]])", hide = false, },
		{ label = "M_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_M_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },                                 
		{ label = "L_T1",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_L_T1]])", hide = false, },
		{ label = "L_T2",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_L_T2]])", hide = false, },
		{ label = "L_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_L_T3]])", hide = false, },
		{ label = "L_T4",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_L_T4]])", hide = false, },
		{ label = "L_T5",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_L_T5]])", hide = false, },
		{ label = "------------------------",	cmd = "", hide = false, },
		{ label = "H_T3",						cmd = "scriptrun 'Mission:ChangeTestMenuShip( [[Ship_Race3_H_T3]])", hide = false, },
	}                                                                                                       
	
	if DummuMenu_TestMenuDecalToken == nil then -- do not recreate TestMenuDecalToken on map reload (below logic is not appropriate for reloading)
		-- global 
		DummuMenu_TestMenuDecalToken = 
		{
			{ label = "back",						cmd = "dummyMenu_load DummuMenu_TestMenu", hide = false, },
			{ label = "Disabled",					cmd = "scriptrun 'Mission:ChangeTestMenuShipDecal( 0, [[Disabled]])'", hide = false, },
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

					local item = { label = name, hide = false, cmd = "scriptrun 'Mission:ChangeTestMenuShipDecal( 0, [["..name.."]])'" }
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
		{ label = "default",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [[default]] )'", hide = false, },
		{ label = "improved",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [[improved]] )'", hide = false, },
		{ label = "premium",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [[premium]] )'", hide = false, },
		{ label = "advanced",					cmd = "scriptrun 'Mission:ChangeTestMenuShipSkin( [[advanced]] )'", hide = false, },
	}

	
	sys.concmd( "dummyMenu_load DummuMenu_TestMenu" )
	
	-- spawn default ships
	local shipDefs = { "Ship_Race1_S_T3", "Ship_Race1_M_T3", "Ship_Race1_L_T3", "Ship_Race2_L_T3" }
	for idx, defName in ipairs( shipDefs ) do
	
		local spawnSpot = Entities[ "SpawnSpot" .. idx ]
		if spawnSpot then
		
			local ship = _G.SpawnSpaceShip( defName, "HangarShip" .. idx, false )
			if ship then
				self.shipEntityId[ idx ] = ship:GetId()
				self:SetShipPos( ship, idx )
				PrecacheModelSkins( ship )
			end
			
		end
		
	end
	
	Hangar:InitCamera()
	Hangar:SetCameraSlot( 1, self.shipEntityId[ 1 ], true )
	
end


--
function Mission:ChangeTestMenuShip( defName )

	local slot = Hangar.selectedSlot
	local prevShip = self.shipEntityId[ slot ] and Entities[ self.shipEntityId[ slot ] ]
	if prevShip then
		prevShip:Remove()
		self.shipEntityId[ slot ] = nil
	end
	
	if defName then
	
		local spawnSpot = Entities[ "SpawnSpot" .. slot ]
		if spawnSpot then
			
			local ship = _G.SpawnSpaceShip( defName, "HangarShip" .. slot, false )
			if ship then
				self.shipEntityId[ slot ] = ship:GetId()
				self:SetShipPos( ship, slot )
				self:SetCameraSlot( slot )
				PrecacheModelSkins( ship )
			end
				
		end
	end

end


--
function Mission:ChangeTestMenuShipDecal( decalSlot, name )

	local slot = Hangar.selectedSlot
	local ship = self.shipEntityId[ slot ] and Entities[ self.shipEntityId[ slot ] ]
	if ship then
		ship:EquipDecal( decalSlot, name )
	end
	
end


--
function Mission:ChangeTestMenuShipSkin( skinName )

	local slot = Hangar.selectedSlot
	local ship = self.shipEntityId[ slot ] and Entities[ self.shipEntityId[ slot ] ]
	if ship then
		local skinIdx = ship:GetSkin( skinName )
		if skinIdx < 10 then
			ship:SetSkin( skinIdx )
		end
	end
	
end


--
function Mission:SetShipPos( ship, slot )
	
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
		local ship = self.shipEntityId[ slot ] and Entities[ self.shipEntityId[ slot ] ]
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
	
	local ship = Entities[ self.shipEntityId[ slot ] ]
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


--
function Mission:ReloadScripts()

	sys.execscript( 'scripts/hangar.lua' )
	Hangar:InitCamera()
	Hangar:SetCameraSlot( 1, self.shipEntityId[ 1 ], true )
	
end


--
function Mission:SetCameraSlot( slot )
	Hangar:SetCameraSlot( slot, self.shipEntityId[ slot ], false )
end