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
	AID.maxBots = 20
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	
	eventContainer = {}
	sys.out( "Mission:SV_OnStart()" )
	
	
	for i, aPhases in pairs( PvE_LGS_H_Container ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_LGS_H:OnStart()
	AID.portals = true	
	
end

function Mission:SV_OnStartRound( roundIdx )
	
end