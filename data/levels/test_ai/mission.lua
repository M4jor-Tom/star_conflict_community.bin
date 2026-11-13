-- если что то серьезно кодать на век3 то надо дернуть лайброри допустим эту https://github.com/bjornbytes/maf/blob/master/maf.lua

----------------------      TEST_AI

--sys.execscript( '' )
--GetAllHudEntities()
--/scriptRunFile levels\test_ai\mission.lua

-- /game test_ai Mission_Script
--p = designers:AddPack(
--designers:AddPackInAID( designers:AddPack({"Ship_OW_Boss_Predator"}) )
--designers:AddPackInAID( designers:AddPack({"Ship_OW_Cyber_S"}) )
--designers:AddPackInAID( designers:AddPack({"Ship_Wave_Easy_Elite_HardShield_L"}) )
--Ship_Wave_Easy_EnergyTaran
--designers:AddPackInAID( designers:AddPack({"Ship_OW_Cyber_M"}) )



if not Mission then Mission = {} end
Mission.debug_draw = { }
lua_debug = true
lua_debug_draw = false



function Mission:OnStart()
	--sys.concmd('bind x "ScriptRun "Mission:ScanInit()" "* ')
--	cvars.g_drawPostEffects = 0
--	sys.concmd('set timer_timeScale 1.5')

sys.concmd('ship_create Ship_Race1_M_T5')

		
	UI:ShowGameHud()
	
	--врагов по дефолту нет - надо создать
	
	local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
	if RelationshipTable then 
		RelationshipTable:SetRelationship( 0, 2, ai.RelatioshipType.ENEMY ) -- 1 c 2 враги.
		RelationshipTable:SetRelationship( 1, 2, ai.RelatioshipType.ENEMY ) -- 1 c 2 враги.
	end
	
 	AID:OnStart()
	AID:Init() 
	
	
	segments = 6
	elements = 2  --2 --4
	rnd_shift = 0
	dr_count = segments * elements * 10  -- 4элемента змеи, 4 элемента разбивки маски, число дронов в разбивке
 	sw = {
		pos = Vec3(0,0,0),
		upTime = 0,
		drons = { 
--[[ 			--x segments
			{
			next_mask = id
			dr = {
				pos = Vec3()
				entId  = ...
				}
			},
			
 ]]		
		},
		masks = {
			-- segments+1
--[[ 			{
				pos = Vec3()
				targetPos = Vec3()
				slots = {
					 = Vec3() -- относительно поса родительского
					...
				}
			} ]]
 		},
		--targetPos = 
		}
	sw.pos = CL_GetLocalPlayerShip() and CL_GetLocalPlayerShip():GetPos() or sw.pos
	for i = 1, segments do
		sw.masks[i] = {}
		sw.masks[i].nextMaskId = ( i == 1 ) and segments or ( i - 1 )
		Mission:SwarmGenNextMask( sw.masks[i], sw.pos, sw.pos + Vec3(0,0,1) ) -- ( mask, pos, targetPos )
		--sw.masks[i].debug_= ai.Spawn( "Cube" )
	end
	
	
	for j = 1, segments do
		sw.drons[j] = {}
		sw.drons[j].dr = {}
		sw.drons[j].next_mask = j
		for i = 1, dr_count / segments do
			local g = ai.Spawn( "SwarmDrone" ) --"Jungle_JMeduza13"
			if g then 
				sw.drons[j].dr[i] = {}
				sw.drons[j].dr[i].entId = g:GetId()
				sw.drons[j].dr[i].ent = g
				--sw.drons[j].dr[i].ent1 = ai.Spawn( "Jungle_JMeduza13" ) --
				--local r = ship:GetRot()
				sw.drons[j].dr[i].pos = sw.masks[ j ].slots[ i ] + sw.masks[ j ].pos
				g:SetPos( sw.masks[ j ].slots[ i ] )
				--g:SetRot( r * Quat( 0.5, 0, 0, 0.5 ) )
			end
		end
	end				
end



function Mission:OnUpdate( dt )
--	Mission:SwarmUpdate( sw, dt )
disable_bots = true
 	AID:Update( dt ) 



 --[[ 	Camera:Update( dt )
	Racers:Update( dt )
	Missiles:Update( dt )
	Race:Update( dt )
	DebugUI:Update( dt )
	if Bonus then Bonus:OnUpdate( dt ) end  ]]
	
--	Mission:Scan( dt )
	--Mission:TestUpdate( dt )
	

	
	
 	if not Game_IsServer() and lua_debug then
		if not Mission.debug_draw then
			Mission.debug_draw = { }
		end
		if Mission.debug_draw and lua_debug_draw then
			for i, v in pairs( Mission.debug_draw ) do
				if v.draw_type == 1 then
					local color = v.color or 255
					if v.p1 and v.p2 then
						DrawDebugLine( v.p1, v.p2, color )
					end
				end
			end
		end
		for i,v in pairs( AID.targets ) do
			DrawDebugText( 1, 1500, 300 + 20 * i, "Pain: " .. tostring(v.pain) )
		end
		DrawDebugText( 1, 1650, 340, "State : " .. tostring( AID.painState ) )
		DrawDebugText( 1, 1650, 360, "Bots c: " .. tostring( AID.numBots ) )
	end 
end




 



Mission.ship2test =
{
 --[[ "Ship_Race3_S_T1",
"Ship_Race3_S_T2",
"Ship_Race3_S_T3",
"Ship_Race3_S_T4",
"Ship_Race3_S_T5",

"Ship_Race1_S_T1",
"Ship_Race1_S_T2",
"Ship_Race1_S_T3",
"Ship_Race1_S_T4",
"Ship_Race1_S_T5",

"Ship_Race2_S_T1",
"Ship_Race2_S_T2",
"Ship_Race2_S_T3",
"Ship_Race2_S_T4",
"Ship_Race2_S_T5",  

"Ship_Race1_S_T2_Steam",
"Ship_Race1_S_T3_Pirate",
"Ship_Race3_S_T2_Steam",
"Ship_Race3_S_T3_Pirate",
"Ship_Race2_S_T4_Pirate",

 
"Ship_Race3_M_T1",
"Ship_Race3_M_T2",
"Ship_Race3_M_T3",
"Ship_Race3_M_T4",
"Ship_Race3_M_T5",

"Ship_Race2_M_T1",
"Ship_Race2_M_T2",
"Ship_Race2_M_T3",
"Ship_Race2_M_T4",
"Ship_Race2_M_T5",  ]]


"Ship_Race1_M_T1",
"Ship_Race1_M_T2",
"Ship_Race1_M_T3",
"Ship_Race1_M_T4",
"Ship_Race1_M_T5",


"Ship_Race1_M_T5_Craft",
"Ship_Race3_L_T5_Craft",
"Ship_Race2_S_T5_Craft",

"Ship_Race1_M_T3_Steam",
"Ship_Race1_M_T3_Steam",
"Ship_Race1_M_T2_Pirate",
"Ship_Race1_M_T4_Steam",
"Ship_Race3_M_T3_Steam",
"Ship_Race3_M_T2_Pirate",
"Ship_Race2_M_T3_Steam",
"Ship_Race2_M_T4_Pirate",


 --[[ "Ship_Race3_L_T1",
"Ship_Race3_L_T2",
"Ship_Race3_L_T3",
"Ship_Race3_L_T4",
"Ship_Race3_L_T5",

"Ship_Race1_L_T1",
"Ship_Race1_L_T2",
"Ship_Race1_L_T3",
"Ship_Race1_L_T4",
"Ship_Race1_L_T5",

"Ship_Race2_L_T1",
"Ship_Race2_L_T2_Faction2", 
"Ship_Race2_L_T3",
"Ship_Race2_L_T4",
"Ship_Race2_L_T5",  

"Ship_Race1_L_T3_Pirate",
"Ship_Race3_L_T3_Pirate",
"Ship_Race2_L_T4_Pirate",
"Ship_Race2_L_T5_Steam",
"Ship_Race2_L_T2_Steam",]]

}

Mission.res = {}




function Mission:TestUpdate( dt )
	if Mission.t_started  then
		Mission.Timer = Mission.Timer - dt
		if Mission.Timer < 0 then 
			--Снять показания
			if Mission.testId and Mission.ship2test_n > 0 then
				s = Entities[ Mission.testId ]
				if s then
					Mission.res[ Mission.ship2test_n ] = s:GetMaxHealth() - s:GetHealth()
					--удаляем старый корабль
					s:Remove()
				end				
			end
			--спавним еще корабль
			Mission.ship2test_n = Mission.ship2test_n + 1
			if  Mission.ship2test_n <= #Mission.ship2test then
				local s = ai.Spawn( Mission.ship2test[ Mission.ship2test_n ] )
				if s then 
					s:SetPos( Vec3( Mission.s_pos ))
					s:SetRelationshipGroup( 3 )
					Mission.testId = s:GetId()
				end			
			else
				-- Завершаем тест
				Mission.t_started = false				
				--распечатаем результаты
				str =""
				for i,v in pairs ( Mission.ship2test ) do 
					str = str .. "\n" ..tostring(v) .. " ".. tostring( Mission.res[ i ] ) 
					dprint( tostring(v) .. " ".. tostring( Mission.res[ i ] )  )					
				end
				WriteStringToFile( "statistic_by_size", str )
			end
			Mission.Timer = 60
		end
		--setDIR нихуя не работает для кораблей под управлением аи.
 --[[ 		Mission.s_dir = Mission.s_dir + Vec3( dt*10, dt*20, dt*150 )   
		Mission.s_dir = 1/#Mission.s_dir * Mission.s_dir
		s = Entities[ Mission.testId ]
		if s then 
			s:SetPosDir( s:GetPos(), Mission.s_dir )
		end  ]]
	end
end


function Mission:TestInit( )
	Mission.s_pos = Vec3( -42, 660, 250 )
	local s = CL_GetLocalPlayerShip()
	if not s then
		dprint("player Ship not found")
	end
	ai.Relationship:SetRelationship( 3, 4, ai.RelatioshipType.ENEMY )
	ai.Relationship:SetRelationship( s:GetRelationshipGroup(), 3, ai.RelatioshipType.FRIEND )
	sys.concmd( "spell_cast TestDummy_Shield_Vampire player0" )
	sys.concmd( "spell_cast TestDummy_Shield_Vampire " .. s:GetName() )
	for i = 1, 50 do
			local t = ai.Spawn( "Turret_DummyKiller" )
			if t then 
				local rv = Vec3( math.random()-0.5,math.random()-0.5,math.random() -0.5)
				rv = 1/#rv * rv				
				t:SetPosDir( Mission.s_pos + 300 * rv, -rv )
				t:SetRelationshipGroup( 4 )
			end
	end
	
	Mission.t_started  = true
	--Mission.s_dir = Vec3(0,1,0)
	
	Mission.ship2test_n = 0
	Mission.Timer = 0
	
end

-- str ="" for i,v in pairs ( Mission.ship2test ) do str =str .."\n".. tostring(v) .. " "..tostring( ( Mission.res[ i ] ))  end WriteStringToFile( "statistic_by_size", str  )

--sum = 0 n = 0 for i,v in pairs(Mission.ship2test ) do if string.find( v, "_S_") then sum = sum + Mission.res[ i ] n=n+1 end end dprint(sum/n)
--sum = 0 n = 0 for i,v in pairs(Mission.ship2test ) do if string.find( v, "_M_") then sum = sum + Mission.res[ i ] n=n+1 end end dprint(sum/n)

--870к  shoots
--15k shoots per ship (4950 potenshional dmg)




--[[ function ttt()
dprint('ttt')
l = 0
	for i1,v1 in pairs( BuffByRank ) do
		for i2,v2 in pairs( v1 ) do
			if Spell[ v2 ] then 
				--dprint("+1")
				l  = l+1
			else
				dprint( v2 )
				dprint( "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" )
			end
		end
	end
dprint(l)
end ]]

--[[
Мясо перехват-разведчик	Ship_Gen_Meat_S
Мясо ударка без модулей	Ship_Gen_Meat_M
Мясо фрегат дальнобойный	Ship_Gen_Meat_L
Мясо характерное Хилер	Ship_Gen_Meat_Heal_L
Мясо характерное Прикрытие	Ship_Gen_Meat_Guard_L
Мясо характерное дивер	Ship_Gen_Meat_Saboteur_S
Рэб с сайленсом	Ship_Gen_Meat_Silence_S
Командник с бонусом на урон	Ship_Gen_Meat_Command_Attacker_M
Заград с тормозящим лучом	Ship_Gen_Meat_Tackler_M
Командник снайпер	Ship_Gen_Elite_Command_Sniper_M
Агрессивный ударник	Ship_Gen_Elite_Atacker_Angry_M
Заград с частым инвизом	Ship_Gen_Elite_Tackler_Invisible_M
Рэб с незаметностью	Ship_Gen_Elite_EMC_Chameleon_S
Дивер с ядеркой	Ship_Gen_Elite_Saboteur_Bomb_S
Развед с сжиганием энергии	Ship_Gen_Elite_Recon_S
Прикрытие с тянущим лучом	Ship_Gen_Guard_Hook_L
Дальнобой с инвизом	Ship_Gen_Sniper_Chameleon_L

]]


function Mission:SwarmGenNextMask( mask, pos, targetPos )
	local d = 3 -- сечение
	local k = 0.5 -- сечение шара	0.4
	local mask_step = m_dist * ( segments - 1 )
	local dron_per_mask = dr_count / segments
	mask.pos = pos + ( targetPos - pos ):GetNormalized() * mask_step
	mask.targetPos = targetPos
	
		local dir = (targetPos - pos ):GetNormalized()
		n1, n2 = Vec3(0,0,0), Vec3(0,0,0) -- нормали пространства движения 
		n1 = CrossProduct( dir, Vec3(1,0,0), n1 )
		n2 = CrossProduct( dir, n1, n2 )
		mask.dir = dir
		--первый квадрант лево вверх
	mask.n = {
		[1] = math.random( ) * ( 2 * d / 3 - k ), --слева рандом   отступ по n1
		[2] = math.random( ) * ( 2 * d / 3 - k ) + k / 3, -- снизу рандом   отступ по n2
		-- квадрант лево низ
		[3] = math.random( ) * ( 2 * d / 3 - k ), --слева рандом   отступ по n1
		[4] = math.random( ) * ( 2 * d / 3 - k ), -- снизу рандом   отступ по n2
		-- квадрант право вверх
		[5] = math.random( ) * ( 2 * d / 3 - k ) + k / 3, --слева рандом   отступ по n1
		[6] = math.random( ) * ( 2 * d / 3 - k ) + k / 3,-- снизу рандом   отступ по n2
		-- квадрант право низ
		[7] = math.random( ) * ( 2 * d / 3 - k ) + k / 3, --слева рандом   отступ по n1
		[8] = math.random( ) * ( 2 * d / 3 - k ), -- снизу рандом   отступ по n2
	}
	
	if not mask.slots then 
		mask.slots = {}
	end
	local n = 1

	rnd_shift = math.min( math.max( -2*d, rnd_shift + 4 * ( math.random( ) -0.5) ), 2*d )

	for j = 1, elements do 
		for i = 1, dron_per_mask / elements do 
			mask.slots[ n ] = 	( mask.n[ ( j - 1 ) * 2 + 1 ] + math.random( )*k ) * n1 + 
								( mask.n[ ( j - 1 ) * 2 + 2 ] + math.random( )*k ) * n2 +
								rnd_shift * n2 + 
								( math.random( )*k*4 ) * dir
			n = n + 1
		end
	end
end

m_dist = 0.65
function Mission:SwarmUpdate( sw, dt )
	--апдейт масок (двигаем их вперед)
	local speed_m = 2
	local speed_d = speed_m * 1.2

	--local  dir  = Vec3(0,0,0)
	local  dir_l  = speed_m
	local speed = speed_m
	for i, v in pairs( sw.masks ) do
		speed = speed_m
		if  sw.drons[1].next_mask ~= i then  -- маска не первая
			v.dir = ( sw.masks[ v.nextMaskId ].pos - v.pos )
			dir_l = #( v.dir )
			v.dir = v.dir:GetNormalized()
			if  dir_l > m_dist then  -- cледующая улетела далеко
				speed = speed_m * 2
			elseif dir_l < m_dist / 2 then
				speed = speed_m / 2
			end
		else                   -- маска первая
			--dir = v.dir
			--dir_l = #( dir )
		end
		v.pos = v.pos + v.dir * dt * speed
		if sw.masks[i].debug_ then
			sw.masks[i].debug_:SetPos(sw.masks[i].pos)
		end
	end

	--апдейт дронов
	
	local needUpMask = false
	for j = 1, segments do
		--sw.drons[j] 		--sw.drons[j].dr = {} --sw.drons[j].next_mask
		for i, v in pairs( sw.drons[j].dr )  do			
			v.d = sw.masks[ sw.drons[j].next_mask ].pos + sw.masks[ sw.drons[j].next_mask ].slots[i]  - v.pos
			v.dir = ( v.d ):GetNormalized() * 0.15 + sw.masks[ sw.drons[j].next_mask ].dir * 0.85
			--v.dir = ( v.d ):GetNormalized()
			local d = #v.d
			if d > m_dist * 1.5  then 
				v.pos = v.pos + ( v.dir ) * dt * speed_d * 1.6
			elseif d > m_dist * 1.2  then 
				v.pos = v.pos + ( v.dir ) * dt * speed_d * 1.25
			else
				v.pos = v.pos + ( v.dir ) * dt * speed_d 
			end			
			v.ent:SetPos( v.pos )
			if  v.ent1 then
				v.ent1:SetPos( sw.masks[ sw.drons[j].next_mask ].pos + sw.masks[ sw.drons[j].next_mask ].slots[i] )
			end
			if d < 0.01 then 
				needUpMask = true
			end
		end
	end

	--переход на новые "маски"
	sw.upTime = sw.upTime + dt 
	--[[if sw.upTime >= 3.5 then 		
		needUpMask = true
	end]]
	if needUpMask and sw.targetPos then
		sw.upTime = 0
		dprint("needUpMask")
		local new_mask = sw.drons[ segments ].next_mask
		Mission:SwarmGenNextMask( sw.masks[ new_mask ], sw.masks[ new_mask ].pos, sw.targetPos )
		for j = 0, segments - 2 do
			if sw.drons[ segments - j ] and sw.drons[ segments - j - 1 ].next_mask then 
				sw.drons[ segments - j ].next_mask = sw.drons[ segments - j - 1 ].next_mask
			end
		end
		sw.drons[ 1 ].next_mask = new_mask
	end




end