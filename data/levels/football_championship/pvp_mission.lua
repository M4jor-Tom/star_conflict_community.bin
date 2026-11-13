
Mission = 
{
}




function Mission:SV_OnUpdate( dt )
	if not  football.ball then 
	--	football:Init()
	end
	
	if football and football.players and ( not football.players[1] ) and CL_GetPlayerShip( 0 ) then
--[[ 		football:Init()
		football.offplay = true
		football.offplay_timer = 4 ]]
	end
	
	football:Update( dt )
end


function Mission:CL_OnStart()

end



-------------
function Mission:SV_OnStart()
	if not network.MAX_PLAYERS then
		network.MAX_PLAYERS =  64
	end
	
	football:Init()
	football.offplay = true
	football.offplay_timer = 3
end




-- r
function Mission:CL_OnUpdate( dt )

--счет в худе
	if not Mission.init and UI then
		Mission.init = true
		UI.HudForcesInfoTdmWnd.F_OnNewFrame = nil
		UI.HudForcesInfoWnd:UnlinkFromParent()
		if not football_cl then 
			football_cl = { [1] = 0, [2] = 0 }
		end
	end
-- каждый кадр так как "карта все убивает"
	if UI then
		UI.HudForcesInfoWnd:UnlinkFromParent()
		UI.HudWnd:AddChild( UI.HudForcesInfoTdmWnd ) 		
		UI.HudForcesInfoTdmWnd:SetText( tostring(football_cl[1]), UI.HudForcesInfoTdmWnd.layers.FRIEND_SCORE ) -- показать значение для друзей
		UI.HudForcesInfoTdmWnd:SetText( tostring(football_cl[2]), UI.HudForcesInfoTdmWnd.layers.ENEMY_SCORE ) -- показать значение для врагов
		if football_cl[1] == football_cl[2] then 
			UI:GetEffectFromLayer( UI.HudForcesInfoTdmWnd, UI.HudForcesInfoTdmWnd.layers.COMPARISON_EFFECT ):StartAnimation( "equally" ) -- знак равенства
		elseif football_cl[1] > football_cl[ 2 ] then 
			UI:GetEffectFromLayer( UI.HudForcesInfoTdmWnd, UI.HudForcesInfoTdmWnd.layers.COMPARISON_EFFECT ):StartAnimation( "more" ) 
		elseif football_cl[1] < football_cl[2] then 
			UI:GetEffectFromLayer( UI.HudForcesInfoTdmWnd, UI.HudForcesInfoTdmWnd.layers.COMPARISON_EFFECT ):StartAnimation( "less" ) -- знак меньше
		end
	end

	-- апдейт мяча (для мягкости полета)
	if Mission.ballId and Mission.ball_speed and Mission.sync < 0.33 then
		Mission.sync = Mission.sync + dt
		local b = Entities[Mission.ballId]
		--sys.out("Mission.sync")
		if b then
			if #( CL_GetLocalPlayerShip():GetPos() - b:GetPos() ) > 6 then
				b:SetPos(b:GetPos() + Mission.ball_speed * dt)
			end
			Mission.ball_speed = Mission.ball_speed:GetNormalized() * ( #Mission.ball_speed * ( 1 - 3 * dt) )
			--speed_decy
		end
	end
end


function CL_BALL_SYNC( x,y,z,xs,ys,zs, disabled ) 
	if not disabled then
		Mission.sync = 0
		Mission.ball_speed = Vec3(xs,ys,zs)
		--local pos = Vec3(x,y,z)
		local b = Mission.ballId and Entities[Mission.ballId] or nil
		if not b then 
			Mission.ballId = GetEntityIdByDefName("Football_ball_script")
			b = Mission.ballId and Entities[Mission.ballId] or nil
		end
		if b then 
			if #( CL_GetLocalPlayerShip():GetPos() - Vec3(x,y,z) ) > 6 then
				b:SetPos(Vec3(x,y,z))
			end
		end
	else 
		Mission.sync = 1
	end
end





function Mission:GetWinner()
	local res = 0
	if football and football.counter and football.counter[1] and football.counter[2] then
		if football.counter[1] > football.counter[2] then  -- первые ворота получили больше 
			res = 2
		elseif football.counter[2] > football.counter[1] then  -- вторые ворота получили больше 
			res = 1
		end
	end
	return res
end




function Mission:SV_FindPlaceToSpawnPlayerSpaceShip( playerIdx, desiredSpawnGroup)  -- SV_OnFindPlaceToSpawnPlayerSpaceShip( i32 playerIdx, i32 desiredSpawnGroup)
	local pos, dir = Vec3( 0,0,0) , Vec3(0,0,1)
	--sys.out( "SV_OnFindPlaceToSpawnPlayerSpaceShip " .. tostring(playerIdx) .. " : " .. tostring( desiredSpawnGroup )  )
	--sys.out( "football.gates: " .. tostring(#football.gates) .. "  : " .. tostring( desiredSpawnGroup )  )
	local i = playerIdx + 1 
	if football.playersDir and football.playersDir[ i ] and football.playersPos[i] then 
		pos = football.playersPos[i] - football.playersDir[ i ] * 5
		dir = football.playersDir[ i ]
	end
	return pos, dir
end