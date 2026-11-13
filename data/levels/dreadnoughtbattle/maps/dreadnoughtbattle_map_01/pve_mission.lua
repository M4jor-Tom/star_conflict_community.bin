--[[
	набор скриптов для поддержки Pve
]]


Mission = {}


--
function Mission:CL_OnUpdate( dt )
	Mission:UpdateDockingBayAnimation()
end



--
function Mission:UpdateDockingBayAnimation()

	-- init
	if not self.DockingBay then
		self.DockingBay = {}

		for i = 1,32 do
			local e = Entities[ "DockingBay" .. i ]
			if e and ( Def[ e:GetDefName() ].class or "" ) == "AnimatedEntity" then
				table.insert( self.DockingBay, { id = e:GetId(), open = false, } )
			end
		end

	end

	-- find all cargoShips
	local cargoShips = {}
	local numHudEntities = GetAllHudEntities()
	for i, id in ipairs( numHudEntities ) do
		local e = Entities[ id ]	
		if e and ( Def[ e:GetDefName() ].class or "" ) == "CargoShip" then
			table.insert( cargoShips, e )
		end
	end

	-- update DockingBay
	for i, doc in ipairs( self.DockingBay ) do
		local e = Entities[ doc.id ]
		if e then
			local needOpen = false
			local pos = e:GetBoneWorldPos( "docking" ) + e:GetDir() * 10

			for j, cs in ipairs( cargoShips ) do
				
				local csPos = cs:GetEstimatePos( 4.0 )	-- где будет корабль пока ворота открываются
				if #( csPos - pos ) < 45 then
					needOpen = true	
					--DrawDebugLine( pos, csPos, 0xffffff )
					break
				end
				--DrawDebugLine( pos, csPos, 0xff0000 )
			end

			-- включаем анимацию открывания если нужно
			if needOpen ~= doc.open then
				doc.open = needOpen
				e:SetActivity( needOpen and "OPEN" or "CLOSE" )
			end
		end
	end

end

-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()

	sys.out( "Mission:SV_OnStart()" )
	sys.concmd( "e_event RocketGun1 FullDeactivate" )
	sys.concmd( "e_event RocketGun2 FullDeactivate" )
	sys.concmd( "e_event RocketGun3 FullDeactivate" )
	sys.concmd( "e_event RocketGun4 FullDeactivate" )
	sys.concmd( "e_event RocketGun5 FullDeactivate" )
	sys.concmd( "e_event RocketGun6 FullDeactivate" )
	sys.concmd( "e_event RocketGun7 FullDeactivate" )
	sys.concmd( "e_event RocketGun8 FullDeactivate" )
	sys.concmd( "e_event RocketGun9 FullDeactivate" )
	sys.concmd( "e_event RocketGun10 FullDeactivate" )
	sys.concmd( "e_event StationRailgun1 FullDeactivate" )
	sys.concmd( "e_event StationRailgun2 FullDeactivate" )
	sys.concmd( "e_event StationRailgun3 FullDeactivate" )
	sys.concmd( "e_event StationRailgun4 FullDeactivate" )
	sys.concmd( "e_event StationRailgun5 FullDeactivate" )
	sys.concmd( "e_event StationRailgun6 FullDeactivate" )
	sys.concmd( "e_event StationRailgun7 FullDeactivate" )
	sys.concmd( "e_event StationRailgun8 FullDeactivate" )
	sys.concmd( "e_event StationRailgun9 FullDeactivate" )
	sys.concmd( "e_event StationRailgun10 FullDeactivate" )
	sys.concmd( "e_event StationRailgun11 FullDeactivate" )
	sys.concmd( "e_event StationRailgun12 FullDeactivate" )
	sys.concmd( "e_event StationRailgun13 FullDeactivate" )
	sys.concmd( "e_event StationRailgun14 FullDeactivate" )
	sys.concmd( "e_event StationRailgun15 FullDeactivate" )
	
end