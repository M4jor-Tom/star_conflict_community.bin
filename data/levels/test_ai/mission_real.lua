

----------------------      TEST_AI

--sys.execscript( '' )
--GetAllHudEntities()

if not Mission then Mission = {} end

function Mission:OnStart()
	sys.concmd('bind x "ScriptRun "Mission:ScanInit()" "* ')
--	cvars.g_drawPostEffects = 0
--	sys.concmd('set timer_timeScale 1.5')

	sys.concmd( 'ship_create Ship_Race1_M_T5' )
	sys.concmd( 'undying' )
	UI:ShowGameHud()
	
	
end


function Mission:OnUpdate( dt )
 --[[ 	Camera:Update( dt )
	Racers:Update( dt )
	Missiles:Update( dt )
	Race:Update( dt )
	DebugUI:Update( dt )
	if Bonus then Bonus:OnUpdate( dt ) end  ]]
	
--	Mission:Scan( dt )
	Mission:TestUpdate( dt )
	
		DrawDebugLine(  
				Vec3( 0, -700, 0 ),  
				Vec3( 0, 700, 0 ),
				16777215 
				)  
		DrawDebugLine2d(Vec2(10,10),Vec2(100,100),166666  )				
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
"Ship_Race2_S_T5",  ]]

"Ship_Race1_S_T2_Steam",
"Ship_Race1_S_T3_Pirate",
"Ship_Race3_S_T2_Steam",
"Ship_Race3_S_T3_Pirate",
"Ship_Race2_S_T4_Pirate",

 --[[ 
"Ship_Race3_M_T1",
"Ship_Race3_M_T2",
"Ship_Race3_M_T3",
"Ship_Race3_M_T4",
"Ship_Race3_M_T5",

"Ship_Race1_M_T1",
"Ship_Race1_M_T2",
"Ship_Race1_M_T3",
"Ship_Race1_M_T4",
"Ship_Race1_M_T5",

"Ship_Race2_M_T1",
"Ship_Race2_M_T2",
"Ship_Race2_M_T3",
"Ship_Race2_M_T4",
"Ship_Race2_M_T5",  ]]

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
"Ship_Race2_L_T5",  ]]

"Ship_Race1_L_T3_Pirate",
"Ship_Race3_L_T3_Pirate",
"Ship_Race2_L_T4_Pirate",
"Ship_Race2_L_T5_Steam",
"Ship_Race2_L_T2_Steam",

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


