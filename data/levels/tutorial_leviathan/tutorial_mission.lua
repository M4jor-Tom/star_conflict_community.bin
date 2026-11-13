lua_debug = false

Mission = 
{
}
PvE_Tutorial = {}
PvE_Mission.nVitalsTotal = 1
PvE_Mission.needPrepare = true
PvE_Mission.nCurPhase 	= 0
Container_Tutorial = 
{
	aPhases = {  
		[ 1 ] = -- прилет риверов
			{ 
				sRoundType 	= "tutorial_reach",
				sTargetObject	= "WreckFuel1",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 1,	
				nHeadTimer	= 0,
				desc		= 2,
				dist		= 50,
				timerDesc	= 5,
				sound 		= "cmd/tutorial/new_tutorial1",
				text		= "tutorial_leviathan_1",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
						local pos = Entities[ "Bonus" ]:GetPos() 
						local bonus = ai.Spawn( "Bonus_Tutorial_HealHull" )
						bonus:SetPos( pos ) 
						PvE_Mission.aPhases[ 2 ].sTargetObject = bonus:GetId()
					end
				},
			},
		[ 2 ] = -- прилет риверов
			{ 
				sRoundType 	= "tutorial_reach",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 1,	
				nHeadTimer	= 0,
				dist		= 20,
				desc		= 3,
				timerDesc	= 5,
				sound 		= "cmd/tutorial/new_tutorial2",
				text		= "tutorial_leviathan_3",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
						local name = Entities[ PvE_Mission.aPhases[ 2 ].sTargetObject ]:GetName()
						CL_TutorialSetDisabledSpaceShipModule( CL_GetLocalPlayerShip(), ai.SpaceShipModuleSlot.ACTIVE_01, false )
						sys.concmd( "e_event "..name.." EmitDeathEffectAndRemove" )
					end
				},
			},
		[ 3 ] = -- прилет риверов
			{ 
				sRoundType 	= "tutorial_reach",
				sTargetObject	= "WreckDebris2",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 2,	
				nHeadTimer	= 0,
				desc		= 4,
				dist		= 50,
				timerDesc	= 5,
				sound 		= "cmd/tutorial/new_tutorial3",
				text		= "tutorial_leviathan_4",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
						local n_pos = ( CL_GetLocalPlayerShip() ):GetPos()
						local pos = Entities[ "Mob1" ]:GetPos() 
						local dir = ( n_pos - pos ):GetNormalized()
						local packDefs = { "Ship_Alien_Scout_Tutorial" }
						local p = designers:AddPack( packDefs, pos, ai.RelationshipGroups.Alien, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
						designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
						CL_TutorialSetDisabledSpaceShipModule( CL_GetLocalPlayerShip(), ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01, false )
					end
				},
			},	
		[ 4 ] = 
			{ 
				sRoundType 	= "tutorialKill",
				count 		= -1,
				sTargetDef	= "Ship_Alien_Scout_Tutorial",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 3,	
				desc		= 7,
				timerDesc	= 5,
				nHeadTimer	= 0,
				sound 		= "cmd/tutorial/new_tutorial4",
				text		= "tutorial_leviathan_5",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
						local n_pos = ( CL_GetLocalPlayerShip() ):GetPos()
						local pos = Entities[ "Mob2" ]:GetPos() 
						local dir = ( n_pos - pos ):GetNormalized()
						local packDefs = { "Ship_Alien_Hunter_Tutorial", }
						local p = designers:AddPack( packDefs, pos, ai.RelationshipGroups.Alien, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
						designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
						CL_TutorialSetDisabledSpaceShipModule( CL_GetLocalPlayerShip(), ai.SpaceShipModuleSlot.SECONDARY_WEAPON, false )
						CL_TutorialSetDisabledSpaceShipModule( CL_GetLocalPlayerShip(), ai.SpaceShipModuleSlot.SPECIAL, false )
					end
				},
			},
		[ 5 ] = 
			{ 
				sRoundType 	= "tutorialKill",
				count 		= -1,
				sTargetDef	= "Ship_Alien_Hunter_Tutorial",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 4,
				desc		= 8,
				timerDesc	= 5,	
				nHeadTimer	= 0,
				sound 		= "cmd/tutorial/new_tutorial5",
				text		= "tutorial_leviathan_6",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
					end
				},
			},
		[ 6 ] = 	
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				nHeadTimer	= 0,
				progressCount = 0,
				DialogOnProgress = {}, 
				sDialog 	= "PvE_Event2C",		
				sTargetDef	= "VitalPoint_Tutorial",
				count		= 1,
				desc		= 11,
				timerDesc	= 5,
				nRoundPhase	= 5,	
				sound 		= "cmd/tutorial/new_tutorial6",
				text		= "tutorial_leviathan_7",
				PossibleEvents = {},	
				tId = {},		
				additionalFunc = { 
					Func = function( self, curPhase )
						local n_pos = ( CL_GetLocalPlayerShip() ):GetPos()
						local pos = Entities[ "Mob3" ]:GetPos() 
						local dir = ( n_pos - pos ):GetNormalized()
						local packDefs = { "Ship_Alien_Predator_Tutorial", "Ship_Alien_Predator_Tutorial" }
						local p = designers:AddPack( packDefs, pos, ai.RelationshipGroups.Alien, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
						designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
						CL_TutorialDeactivateDesignator()
				end,},
			},
		[ 7 ] = 			
			{
				sRoundType 	= "custom",
				timer		= 20,			
				nRoundPhase	= 5,		
				result		= false, 
				sDialog 	= "PvE_Phase5",	
				PossibleEvents = {},	
				sound 		= "cmd/tutorial/new_tutorial7",
				text		= "tutorial_leviathan_8",
				nHeadTimer 	= 1, -- время в секундах до запуска говорящей головы
				additionalFunc = {
					Func = function( self, curPhase )
						local mobsPack = GetEntitiesByDef( "Ship_Alien_Predator_Tutorial" )
						if next( mobsPack ) then
							local mob = mobsPack[ math.random( #mobsPack ) ]
							local n_pos = Entities[ mob ]:GetPos()
							local vital = GetEntitiesByDef( "VitalPoint_Tutorial" )					
							local pos = Entities[ vital[ 1 ] ]:GetPos()  
							local dir = ( n_pos - pos ):GetNormalized()
							local packDefs = { "Ship_Emp_Legion_Tutorial", "Ship_Emp_Legion_Tutorial" }
							local p = designers:AddPack( packDefs, pos, 1, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
							designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
						end	
					end
				},
			},
		[ 8 ] = 
			{ 
				sRoundType 	= "tutorialKill",
				count 		= -1,
				sTargetDef	= "Ship_Alien_Predator_Tutorial",
				sDialog 	= "PvE_Phase1",		
				nRoundPhase	= 4,	
				--nHeadTimer	= 1,
				--text		= "tutorial_leviathan_9",
				PossibleEvents = {},
				additionalFunc = {
					Func = function( self, curPhase )
					end
				},
			},
		[ 9 ] = 			
			{
				sRoundType 	= "custom",
				timer		= 15,			
				nRoundPhase	= 5,		
				result		= true, 
				sDialog 	= "PvE_Phase5",	
				sound 		= "cmd/tutorial/new_tutorial8",
				text		= "tutorial_leviathan_9",
				PossibleEvents = {},	
				nHeadTimer 	= 1, -- время в секундах до запуска говорящей головы
			},
	},		
}

function Mission:SV_OnUpdate( dt )

	local result = PvE_Func:PhaseUpdater( dt, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ] )
	
	AID:Update( dt )
	
	if PvE_Mission.needPrepare then
		local ship = CL_GetLocalPlayerShip()
		if ship then
			CL_TutorialSetDisabledSpaceShipModule( ship, ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01, true )
			CL_TutorialSetDisabledSpaceShipModule( ship, ai.SpaceShipModuleSlot.SECONDARY_WEAPON, true )
			CL_TutorialSetDisabledSpaceShipModule( ship, ai.SpaceShipModuleSlot.SPECIAL, true )
			CL_TutorialSetDisabledSpaceShipModule( ship, ai.SpaceShipModuleSlot.ACTIVE_01, true )
			AddAura( ship, "RamCharge_Self_PvE" )
			AddAura( ship, "Shield_Resist_Thermal_Self_PvE" )
			AddAura( ship, "Hull_Resist_Thermal_Self_PvE" )
			ship:SetHealth( 1500 )
			PvE_Mission.needPrepare = nil
		end
	end
	
	if result == true then
		CL_TutorialActivateObjectiveDesc( -1 )
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result == nil then
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result = true
		end	
		if PvE_Func:PhasesSelector() == true then
			return 1, ai.WinReason.TUTORIAL_MISSION_COMPLETE	
		end	
	elseif result == false then
		CL_TutorialActivateObjectiveDesc( -1 )
		if #PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tSwitchTable > 0 then
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result = false
			PvE_Func:SwitchPhases( PvE_Mission.nCurPhase )
		else
			return 2, ai.WinReason.TUTORIAL_PLAYER_DEAD	
		end	
		if PvE_Func:PhasesSelector() == true then
			return 1, ai.WinReason.TUTORIAL_MISSION_COMPLETE	
		end	
	else
	end
	
	-- головы с отсрочкой, если таймер не указать, то голову не покажет
	if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nHeadTimer then
		PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nHeadTimer = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nHeadTimer - dt
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nHeadTimer <= 0 then
			local time_show = 13
			local sound
			if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].sound then
				if UI:GetLanguage() == "RUSSIAN" then
					sound = "ru_voice/vo/ru/"..PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].sound
				else
					sound = "en_voice/vo/en/"..PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].sound
				end
			end	
			local text_id = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].text
			SV_ShowDialogScript( -1, "quest_character_mercenary_medium", "quest_character_general_soldier", text_id, time_show, sound )
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nHeadTimer = nil
		end
	end
	
	--апдейт на клиенте
	if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timerDesc then
		PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timerDesc = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timerDesc - dt
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timerDesc <= 0 then
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timerDesc = nil
			CL_TutorialActivateObjectiveDesc( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].desc )
		end	
	end

	if cl_FocusPoints then 
		for i, v in pairs( cl_FocusPoints ) do -- v = { pos= Vec3( posX, posY, posZ ), defName = defName, mark_type = mark_type , id = id   } --
			if not v.id and v.defName and v.pos  then	-- инфа с сервера приходила, но объект на был найден!
				for def_ind, def_id in pairs( GetEntitiesByDef( v.defName ) ) do
					if def_id then
						local o = Entities[ def_id ]
						if o and #( o:GetPos() - v.pos ) < 350 then
							v.id = def_id
							UI:ShowHudMarkNotify( def_id, v.mark_type )
						end
					end
				end
			end
		end
	end
	
	if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId and CL_GetLocalPlayerShip() then
		CL_TutorialActivateDesignatorToTarget( Entities[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId[ 1 ] ] )
	end
end

--апдейтер фаз
function PvE_Func:PhaseUpdater( dt, curPhase )
end
	
function Mission:SV_OnStart()

	for i, aPhases in pairs( Container_Tutorial ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	AID.portals = false

	PvE_Mission.nVitalCurrent = 0
	PvE_Mission.vitals = GetEntitiesByDef( "VitalPoint_Tutorial" )
	PvE_Mission.aVitalsInGame = {}
	PvE_Mission.aVitalsInGame[ 1 ] = {}
	PvE_Mission.aVitalsInGame[ 1 ].id = PvE_Mission.vitals[ 1 ]
	Entities[ "King1" ]:FullActivate( false )
	PvE_Func:PhasesSelector()
	PvE_Mission:OnStart()
end

function Mission:OnPrecache()
	PrecacheDef( "Ship_Emp_Legion_Tutorial" )
	PrecacheDef( "Ship_Alien_Predator_Tutorial" )
	PrecacheDef( "Ship_Alien_Hunter_Tutorial" )
	PrecacheDef( "Ship_Alien_Scout_Tutorial" )
	PrecacheDef( "Bonus_Tutorial_HealHull" )
end
