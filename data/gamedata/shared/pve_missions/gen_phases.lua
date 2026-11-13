PvE_Phases = {}

PvE_Phases.Standart = 
{
	[ "destroyer" ] = { -- фаза на уничтожение объекта
		bCountBar = false, --  нужно ли отображать количество оставшихся ключевых объектов
		bHPBar = false, -- нужно ли отображать хпбар
		bRandomBoss = false, -- включать ли босса
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		nStartWoWMsgTimer = 30, -- через какой промежуток отображать WoW сообщения
		nWoWMsgTimer = 30, -- время до отображения WoW сообщения
		tId = {}, -- таблица из id целевых дефов
		tCount = 1, -- сколько объектов уничтожить нужно
		PossibleEvents = {}, -- таблица из эвентов
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		sReplaceObject = nil, -- имя заменяемого объекта
		sTargetDef = nil, -- целевой деф для уничтожения
		ruins = nil, -- имя уничтоженного дефа
		replaceObjectFromPhase = nil, -- из какой фазы брать заменяемый объект
		shield = nil, -- щит для уничтожаемого объекта
		DialogOnProgress = {}, 
		progressCount = 0, -- прогресс по квесту
	},
	[ "transport" ] = { -- фаза на уничтожение/сопровождение транспорта
		bHPBar	= false, -- нужно ли отображать хпбар
		bRandomBoss	= false, -- включать ли босса
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		bTransportShield = false, -- стоит ли щит на транспорте
		bEscapeResult = false, -- флаг на результат ухода транспорта
		bDeadResult = true, -- флаг на результат смерти транспорта
		bWaitForAllTransp = false, -- подождать всех транспортников для финиша фазы
		transport = nil, -- указываем название сквада с транспортом
		sTargetDef = nil, -- целевой деф для уничтожения
		aTransportEngines = {}, -- дефы двигателей
		aTransportEnginesId = {}, -- id двигателей
		tSpeed = 0.1, -- целевая скорость транспортника
		nMaxSpeed = 15, -- максимально возможная скорость 
		bAvoidPrev = false, -- не врезаться в впереди идущего
		tId = {}, -- таблица из id целевых дефов
		PossibleEvents = {}, -- таблица из эвентов
		switchNPhase = {}, -- таблица с номерами фаз на замену
		tSwitchTable = {}, -- таблица с новыми фазами
		sMining = nil, -- нужно ли минировать что-то
		tMinesId = {}, -- таблица с id мин
		aDropTable = {}, -- что сбрасывать надо
		TotalEngines = 1, -- сколько всего изначально двигателей у транспорта
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		timer = 0,
		DialogOnProgress = {},
		progressCount = 0,
		needAssistance = {}, -- таблица из мобов
	},
	[ "vitals" ] = { -- фаза на захват маяков
		bCountBar = false, --нужно ли отображать количество оставшихся ключевых объектов
		bRandomBoss = false, -- включать ли босса
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents = {}, -- таблица из эвентов
		count = 1, -- сколько нужно маяков обработать
		tId = {}, -- таблица из id целевых дефов
		sTargetDef = nil, -- целевой деф для уничтожения
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		progressCount = 0,
		DialogOnProgress = {},
	},
	[ "mines" ] = { -- минирование объекта
		bCountBar = false, --нужно ли отображать количество оставшихся ключевых объектов
		tId = {}, -- таблица из id целевых дефов
		sTargetDef = nil, -- целевой деф для уничтожения
		bombHolo = nil, -- деф-голограмма цели минирования
		mines = nil, -- деф мин
		tTrigger = nil, -- триггер для постройки
		trsId = {}, -- таблица дефов триггеров 
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents = {}, -- таблица из эвентов
		sync_UI_Timer = 0.25, -- время до отображения хп бара
	}, 
	[ "selector" ] = { -- минирование объекта
		bCountBar = false, --нужно ли отображать количество оставшихся ключевых объектов
		tId = {}, -- таблица из id целевых дефов
		sTargetDef = nil, -- целевой деф для уничтожения
		bombHolo = nil, -- деф-голограмма цели минирования
		mines = nil, -- деф мин
		tTrigger = nil, -- триггер для постройки
		trsId = {}, -- таблица дефов триггеров 
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents = {}, -- таблица из эвентов
		sync_UI_Timer = 0.25, -- время до отображения хп бара
	}, 
	[ "defense" ] = { -- защита объекта от уничтожения
		bHPBar	= false, -- нужно ли отображать хпбар
		bRandomBoss = false, -- включать ли босса
		nStartWoWMsgTimer = 30, -- через какой промежуток отображать WoW сообщения
		nWoWMsgTimer = 30, -- время до отображения WoW сообщения
		sTargetDef	= nil, -- целевой деф для уничтожения
		tId 	= {}, -- таблица из id целевых дефов
		replaceObjectFromPhase = nil, -- из какой фазы брать заменяемый объект
		timer	= 180, -- сколько защищать цель
		nRoundPhase	= 1, -- запуск конкретной фазы ПвЕ из кода
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		PossibleEvents = {}, -- таблица из эвентов
	}, 
	[ "towerDefense" ] = { -- защита объекта от уничтожения с возможностью постройки
		bHPBar	= false, -- нужно ли отображать хпбар
		PossibleEvents	= {}, -- таблица из эвентов
		tId 	= {}, -- таблица из id целевых дефов
		turId	= {},
		tTrigger= nil, -- триггер для постройки
		trsId	= {}, -- таблица дефов триггеров 
		timer	= 180, -- сколько защищать цель
		nRoundPhase		= 1, -- запуск конкретной фазы ПвЕ из кода
		nStartWoWMsgTimer = 30, -- через какой промежуток отображать WoW сообщения
		nWoWMsgTimer = 30, -- время до отображения WoW сообщения
		ruins			= nil, -- имя уничтоженного дефа
		switchNPhase = {}, -- таблица с номерами фаз на замену
		tSwitchTable = {}, -- таблица с новыми фазами
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		sReplaceObject = nil, -- имя заменяемого объекта
		sTargetDef	= nil, -- целевой деф для уничтожения
	}, 
	[ "flag" ] = { -- захват маяков с порождением эффектов
		bCountBar = false, --нужно ли отображать количество оставшихся ключевых объектов
		PossibleEvents	= {}, -- таблица из эвентов
		tId 	= {}, -- таблица из id целевых дефов
		timer	= 180, -- за какое время нужно успеть активировать маяк
		sync_UI_Timer = 0.25, -- время до отображения хп бара	
		switchNPhase = {}, -- таблица с номерами фаз на замену
		tSwitchTable = {}, -- таблица с новыми фазами
		nWoWMsgTimer = 30, -- время до отображения WoW сообщения
		nRoundPhase		= 1, -- запуск конкретной фазы ПвЕ из кода
	},
	[ "dreadnought" ] = { -- появление дредноута
		bCountBar = false, --нужно ли отображать количество оставшихся ключевых объектов
		PossibleEvents	= {}, -- таблица из эвентов
		tId 	= {}, -- таблица из id целевых дефов
		timer	= 180, -- за какое время нужно успеть активировать маяк
		sync_UI_Timer = 0.25, -- время до отображения хп бара
		switchNPhase = {}, -- таблица с номерами фаз на замену
		tSwitchTable = {}, -- таблица с новыми фазами
		nWoWMsgTimer = 30, -- время до отображения WoW сообщения
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		staticDread	= false,
	},
	[ "kill" ] = { -- фаза на уничтожение мобов
		bCountBar	= true, --нужно ли отображать количество оставшихся ключевых объектов
		count		= 0, -- сколько нужно уничтожить
		shipsId		= {},
		tId 		= {}, -- таблица из id целевых дефов
		nRoundPhase	= 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
	},
	[ "kill2" ] = { -- фаза на уничтожение мобов
		bCountBar	= true, --нужно ли отображать количество оставшихся ключевых объектов
		shipsId		= {},
		tId 		= {}, -- таблица из id целевых дефов
		nRoundPhase	= 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
	},
	[ "custom" ] = { -- фаза "пауза" с кастомным скриптом
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
		tId			= {}, -- таблица из id целевых дефов
		nWoWMsgTimer = 10000000000,
		nStartWoWMsgTimer = 10000000000,
	},	
	[ "monster_attack" ] = { -- рейдовый монстр в атаке
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
	},
	[ "tongue" ] = { -- рейдовый монстр в атаке
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
	},
	[ "waves" ] = { -- рейдовый монстр в атаке
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
		sync_UI_Timer = 0.25,
	},
	[ "escape" ] = {	
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		PossibleEvents	= {}, -- таблица из эвентов
	},
	[ "reach" ] = {	
		nRoundPhase = 1, -- запуск конкретной фазы ПвЕ из кода
		player_perc = 0.5,
		dist = 100,
	},
}

--контейнер миссии
PvE_Mission = {

	functions = {
	
		[ "destroyer" ] = {
			fInit = function ( self, curPhase )
				if curPhase.shield then
					local object = GetObjectByName( curPhase.shield )
					Entities[ object:GetId() ]:Fadeout()
				end
				
				local tId = {}
				
				if curPhase.sReplaceObject then
					tId[ 1 ] = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, curPhase.sReplaceObject, curPhase.sTargetDef )
				elseif curPhase.replaceObjectFromPhase then
					tId[ 1 ] = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, PvE_Mission.aPhases[ curPhase.replaceObjectFromPhase ].sReplaceObject, curPhase.sTargetDef )
				else	
					local count = 1
					for i, name in pairs( curPhase.sTargetDef ) do
						local objectsId = GetEntitiesByDef( curPhase.sTargetDef[ i ] )
						for j, id in ipairs( objectsId ) do
							tId[ count ] = objectsId[ j ]
							count = count + 1
						end	
					end	
				end
				
				local j = curPhase.tCount
					
				if next( tId ) then
					for i = 1, j do 
						local pN = math.random( #tId )
						local p = tId[ pN ]
						Entities[ p ]:ShowInHud( true )
						Entities[ p ]:SetDamageable( true )
						if curPhase.tId == nil then
							curPhase.tId = {}
						end
						
						table.insert( curPhase.tId, p )
						PvE_Func:RemoveFromList( tId, p )
					end	
					if next( tId ) then 
						for i, target in ipairs( tId ) do
							Entities[ target ]:Remove()
						end	
					end	
				end
						
			end,
			
			fUpdate = function ( self, dt, curPhase )
			
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						--включаем хпбар
						if curPhase.bHPBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", curPhase.sTargetDef[ 1 ] )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( curPhase.sTargetDef[ 1 ] )	--id
							end	
						--включаем отображение прогресса	
						elseif curPhase.bCountBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", #curPhase.tId, curPhase.tCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", #curPhase.tId, curPhase.tCount )	--id
							end					
						end	
					end
				end		
				
				for i, targetId in pairs( curPhase.tId ) do
					if Entities[ targetId ] then
						if Entities[ targetId ]:IsDead() then
							curPhase.progressCount = curPhase.progressCount + 1
							-- головы при прогрессе фазы
							if curPhase.DialogOnProgress[ curPhase.progressCount ] then
								for i, j in ipairs( curPhase.DialogOnProgress[ curPhase.progressCount ] ) do 
									table.insert( DialogsUpdate, curPhase.DialogOnProgress[ curPhase.progressCount ][ i ] )
								end	
							end	
									
							PvE_Func:RemoveFromList( curPhase.tId, targetId )
							if curPhase.bCountBar == true then
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.tCount - curPhase.progressCount, curPhase.tCount )	--id
								else
									CL_ShowProgressPhase( "Target_Count", curPhase.tCount - curPhase.progressCount, curPhase.tCount   )	--id
								end					
							end	
						end
					else 	
						if not Entities[ targetId ] or Entities[ targetId ] == nil then
						
							curPhase.progressCount = curPhase.progressCount + 1
							-- головы при прогрессе фазы
							if curPhase.DialogOnProgress[ curPhase.progressCount ] then
								for i, j in ipairs( curPhase.DialogOnProgress[ curPhase.progressCount ] ) do 
									table.insert( DialogsUpdate, curPhase.DialogOnProgress[ curPhase.progressCount ][ i ] )
								end	
							end	
							
							PvE_Func:RemoveFromList( curPhase.tId, targetId )
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.tCount - curPhase.progressCount, curPhase.tCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", curPhase.tCount - curPhase.progressCount, curPhase.tCount   )	--id
							end		
						end							
					end
				end
				if not next( curPhase.tId ) then
					if curPhase.ruins ~= nil then
						local c = ai.Spawn( curPhase.ruins )-- тут должен быть специальный объект
						c:SetPosDir( curPhase.pos, curPhase.dir )
					end
					if curPhase.bHPBar == true then
						--отключаем хпбар
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
						else
							PvE_Common.UI.PveEvents:SetBossId()	--id
						end
					end	
					--отчключаем отображения количества целей
					if curPhase.bCountBar == true then
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
						else
							CL_HideProgressPhase()	--id
						end					
					end			
					return true
				end		
			
				if curPhase.timer then
					curPhase.timer = curPhase.timer - dt
					curPhase.nWoWMsgTimer = curPhase.nWoWMsgTimer - dt
				end
				
				if curPhase.timer and curPhase.timer < 0 then
					if curPhase.bCountBar == true then
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
						else
							CL_HideProgressPhase()	--id
						end					
					end		
					return false
				end
				
				--говорим, сколько еще до конца раунда осталось
				if curPhase.nWoWMsgTimer <= 0 then
					local param = { { type = 6, name = "time", value = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timer } }
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "ShowWow", "Attack_Time", true, 5, param ) 
					else
						UI:ShowWowMsg( "Attack_Time", true, 5, param )
					end		
					curPhase.nWoWMsgTimer = curPhase.nStartWoWMsgTimer
				end			
			end,
		},
		
		[ "transport" ] = {
			fInit = function ( self, curPhase )
				--ищем отряд с указанным в фазе именем и спавним его
				if type( curPhase.transport ) == "string" then
					local squad = curPhase.transport
					SV_Pve_AISquadSpawn( squad )
					
					local mission = CL_PveGetMissionName() 
					
					for i, squad in pairs( PvE_Missions[ mission ].squads ) do
						if squad.name == curPhase.transport then
							curPhase.sTargetDef = squad.cargoship
						end
					end
					local transport = GetEntitiesByDef( curPhase.sTargetDef )
					
					if transport ~= nil then 
						curPhase.tId = transport[ 1 ]
					end	
					
					if curPhase.bTransportShield == true then
						Entities[ curPhase.tId ]:ActivateShield( true ) 
					end
					
					if PvE_Mission.container.nMaxHp then
						local maxDefHealth = Entities[ curPhase.tId ]:GetMaxHealth()
						local damage = maxDefHealth - PvE_Mission.container.nMaxHp
						Entities[ curPhase.tId ]:SetHealth( maxDefHealth - damage )
					end
				else 
					curPhase.nCurrentTransport = 1
				end
				
				if curPhase.sMining then
					local p = math.random( #PvE_Mission.aRandomPoints )

					self.cPointName = PvE_Mission.aRandomPoints[ p ]
					
					PvE_Func:RemoveFromList( PvE_Mission.aRandomPoints, p )
					
					local point = GetObjectByName( self.cPointName )
					local pos = point:GetPos()
					j = 10
					for i = 1, j do
						local p = pos
						p.x = p.x + math.random( 30 ) - 15
						p.y = p.y + math.random( 30 ) - 15
						p.z = p.z + math.random( 30 ) - 15
						
						local bombId = SV_Pve_SpawnBomb( curPhase.sMining, p, Vec3(1,0,0) )
						table.insert( curPhase.tMinesId, bombId )
					end	
				end
				
				--если указаны двигатели для транспорта - собираем их ID в таблицу для дальнейшей обработки
				if next( curPhase.aTransportEngines ) then
					engines = curPhase.aTransportEngines
					for i, engineDef in pairs ( engines ) do
						local aResEngines = GetEntitiesByDef( engineDef )
						for j, engine in pairs( aResEngines ) do
							table.insert( curPhase.aTransportEnginesId, engine )
						end	
						curPhase.TotalEngines = #curPhase.aTransportEnginesId
					end
				end	
				curPhase.nTransportSpawnSyncTimer = 2
				curPhase.nInitCount = #curPhase.transport
				if not curPhase.EscapeToEnd then
					curPhase.EscapeToEnd = curPhase.nInitCount
				end
				curPhase.aliveCount = 0
			end,
			
			fUpdate = function ( self, dt, curPhase )
			
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						--включаем хпбар
						if curPhase.bHPBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", curPhase.sTargetDef )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( curPhase.sTargetDef )	--id
							end	
							curPhase.sync_UI_Timer = 10
						end	
						if curPhase.bCountBar == true then
							curPhase.count = curPhase.nInitCount - curPhase.progressCount
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							end		
							curPhase.sync_UI_Timer = 10			
						end	
					end
				end		
			
				--спавним множество транспортов, если надо
				if curPhase.timer > 0 then
					curPhase.timer = curPhase.timer - dt					
					if curPhase.timer <= 0 then
						if type( curPhase.transport ) == "table" then
							if curPhase.transport[ curPhase.nCurrentTransport ]  then
								SV_Pve_AISquadSpawn( curPhase.transport[ curPhase.nCurrentTransport ] )
								
								curPhase.nCurrentTransport = curPhase.nCurrentTransport + 1
								
								if curPhase.nextSpawn then
									if type( curPhase.nextSpawn ) == "table" and curPhase.nextSpawn[ curPhase.nCurrentTransport ] then
										curPhase.timer = curPhase.nextSpawn[ curPhase.nCurrentTransport ]
									elseif type( curPhase.nextSpawn ) == "number" then
										curPhase.timer = curPhase.nextSpawn
									else
										curPhase.timer = 10	
									end
								else
									curPhase.timer = 10	
								end
								
							else
								curPhase.transport = nil
								curPhase.nTransportSpawnSyncTimer = nil
							end							
						end	
					end
				end
				-- if curPhase.nTransportSpawnSyncTimer then
					-- curPhase.nTransportSpawnSyncTimer = curPhase.nTransportSpawnSyncTimer - dt
					-- if curPhase.nTransportSpawnSyncTimer < 0 then
				local transport = GetEntitiesByDef( curPhase.sTargetDef )
				if type( curPhase.tId ) == "number" then
					if curPhase.tId == transport[ 1 ] then
					else
						curPhase.tId = transport[ 1 ]
					end
				else
					for _, eId in ipairs( transport ) do
						local found = false 
						for _, curId in ipairs( curPhase.tId ) do 
							if eId == curId then
								found = true
							else
							end
						end
						if not found and not Entities[ eId ]:IsDead() then
							table.insert( curPhase.tId, eId )
						end
					end
					--curPhase.tId = transport
				end	
				if curPhase.nCurrentTransport and curPhase.needAssistance[ curPhase.nCurrentTransport - 1 ] and next( curPhase.tId ) then
					local packDefs = {}
					for i, mob in ipairs( curPhase.needAssistance[ curPhase.nCurrentTransport - 1 ] ) do
						packDefs[ i ] = mob
					end
					local transportId = curPhase.tId[ #curPhase.tId ]
					local pos = Entities[ transportId ]:GetPos()
					local resPos 
					local resPosDist = 999999999999999999999999999 
					for i, spawn in pairs( AID.spawnPos ) do
						local dist = SquareLen( pos, spawn.pos )
						if resPosDist > dist then
							resPosDist = dist
							resPos = i
						end
					end
					--этот механизм можно в отдельную функцию вынести, т.к. уже много где используется в таком виде
					local near, dir = AID:GetMobSpawnPos()
					local relationshipGroup = Def[ packDefs[ 1 ] ].relationship_group or 2
					local p = designers:AddPack( packDefs, AID.spawnPos[ resPos ].pos , relationshipGroup, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir )
					designers:AddPackInAID( p, packAvt )
					AID:PortalInitialization( p[ 1 ], resPos )
					curPhase.needAssistance[ curPhase.nCurrentTransport - 1 ] = nil
						-- end
						-- curPhase.nTransportSpawnSyncTimer = 1					
					-- end	
				end			
				if curPhase.tId then
					if type( curPhase.tId ) == "table" then
						for i = #curPhase.tId, 1, -1 do
							local transportId = curPhase.tId[ i ]
							local transport = Entities[ transportId ]
							if transport then
								if transport:IsPathFollowingComplete() then
									--curPhase.tId[ i ] = nil
									table.remove(curPhase.tId, i)									
									curPhase.progressCount = curPhase.progressCount + 1
									curPhase.aliveCount = curPhase.aliveCount + 1
									curPhase.count = curPhase.nInitCount - curPhase.progressCount 					
									if Game_IsServer() then
										ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
									else
										CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
									end								
								elseif curPhase.bAvoidPrev then
									--считаем скорость для транспортника
									local sensorLenght = 30
									local sensorOffset = 20
									local maxSpeed = 20
									local tPos = transport:GetPos()
									local tRot = transport:GetRot()
									local point1 = tPos + Vec3( VecRot3( tRot, Vec3( 0, 0, -1 * sensorOffset ) ) )
									local point2 = point1 + Vec3( VecRot3( tRot, Vec3( 0, 0, -1 * sensorLenght ) ) )
									local ent = TraceLine( point1, point2, false )
									if ent then
										local defName = ent:GetDefName()
										local def = Def[ defName ]
										if def and def.class == "CargoShip" then
											transport:SetTargetSpeed( 0 )
										else
											transport:SetTargetSpeed( maxSpeed )
										end
									end
								end
							elseif not transport or transport:IsDead() then
								--curPhase.tId[ i ] = nil
								table.remove(curPhase.tId, i)
								curPhase.progressCount = curPhase.progressCount + 1
								curPhase.count = curPhase.nInitCount - curPhase.progressCount 
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
								else
									CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
								end	
								
								-- головы при прогрессе фазы
								if curPhase.DialogOnProgress[ curPhase.progressCount ] then
									for i, j in ipairs( curPhase.DialogOnProgress[ curPhase.progressCount ] ) do 
										table.insert( DialogsUpdate, curPhase.DialogOnProgress[ curPhase.progressCount ][ i ] )
									end	
								end	
							end				
							if curPhase.EscapeToEnd <= curPhase.aliveCount and ( not curPhase.bWaitForAllTransp or ( not next( curPhase.tId ) and( curPhase.nCurrentTransport - 1 )== curPhase.nInitCount ) ) then
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
								else
									CL_HideProgressPhase()	--id
								end						
								return curPhase.bEscapeResult	
							elseif curPhase.EscapeToEnd > curPhase.aliveCount and not next( curPhase.tId ) and( curPhase.nCurrentTransport - 1 )== curPhase.nInitCount then
								return curPhase.bDeadResult		
							end
						end
					elseif type( curPhase.tId ) == "number" then
						local transport = Entities[ curPhase.tId ] 
						if transport then	
							if transport:IsDead() then
								--если есть мины с раунда - удаляем их
								if next( curPhase.tMinesId ) then
									for i, mineId in pairs( curPhase.tMinesId ) do
										if Entities[ mineId ] then
											Entities[ mineId ]:Remove()
										end	
									end
								end
								
								--отключаем хпбар
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
								else
									PvE_Common.UI.PveEvents:SetBossId()	--id
								end				

								--сбрасываем лут с транспорта, если это надо
								if next( curPhase.aDropTable ) then
									local loot, pos, j
									pos = transport:GetPos()
									j = curPhase.aDropTable.count
									for i = 1, j do
										loot = ai.Spawn( curPhase.aDropTable.dropDef )
										local p = pos
										p.x = p.x + math.random( 30 ) - 15
										p.y = p.y + math.random( 30 ) - 15
										p.z = p.z + math.random( 30 ) - 15
										loot:SetPos( p )
									end					
								end
								return curPhase.bDeadResult
							elseif transport:IsPathFollowingComplete() then
							
								--если есть мины с раунда - удаляем их
								if next( curPhase.tMinesId ) then
									for i, mineId in pairs( curPhase.tMinesId )  do
										if Entities[ mineId ] then
											Entities[ mineId ]:Remove()
										end	
									end
								end
							
								--отключаем хпбар
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
								else
									PvE_Common.UI.PveEvents:SetBossId()	--id
								end
								
								PvE_Mission.container.nMaxHp = transport:GetHealth()
								return curPhase.bEscapeResult
								
							else
								if curPhase.bTransportShield == true then
									local transportShield = transport:GetShieldEntity()
									if transportShield:GetHealth() <= 0 then
										transport:ActivateShield( false ) 
									end
								end	
								
								--считаем скорость для транспортника
								--ищем двигатели транспорта
								local nEngine = 0
								local nTotalEngines = curPhase.TotalEngines
								if next( curPhase.aTransportEnginesId ) then 
									for i, engine in pairs( curPhase.aTransportEnginesId ) do 
										if not Entities[ engine ] then
											PvE_Func:RemoveFromList( curPhase.aTransportEnginesId, engine )
										end
									end
									nEngine = #curPhase.aTransportEnginesId
								end
								if nEngine == 0 then
									nEngine = 1
								end
								local nMaxSpeed = curPhase.nMaxSpeed/nTotalEngines*nEngine
								if curPhase.tSpeed >= nMaxSpeed then
									transport:SetTargetSpeed( nMaxSpeed )
								else
									curPhase.tSpeed =( curPhase.tSpeed + nEngine*( dt / 10 ) )
									transport:SetTargetSpeed( curPhase.tSpeed )
								end	
							end
						else
							return true
						end
					end	
				end			
			end,
		},
		
		[ "vitals" ] = {
			fInit = function ( self, curPhase )
				local vitalNewId = nil
				local vitals = {}
				local j = curPhase.count
				
				
				if curPhase.specificDef then 
					vitals = GetEntitiesByDef( curPhase.specificDef )
					local j = curPhase.count
					for l = 1, j do
						local selectedId = PvE_Func:RandomFromList( vitals )
						curPhase.tId[ l ] = selectedId
						Entities[ selectedId ]:ShowInHud( true )
						Entities[ selectedId ]:FullActivate( true )
						if Entities[ "Shadow_"..( Entities[ selectedId ]:GetName() ) ] then
							Entities[ "Shadow_"..( Entities[ selectedId ]:GetName() ) ]:FullActivate( false )
						end
						PvE_Func:RemoveFromList( vitals, selectedId )
					end
				else	
					local vitalCurrent = PvE_Mission.nVitalCurrent
					for i = 1, j do 
						vitalCurrent = vitalCurrent + 1 
						if curPhase.sTargetDef then
							local obj = Entities[ PvE_Mission.aVitalsInGame[ vitalCurrent ].id ]
							local pos = obj:GetPos()
							local rot = obj:GetRot()
							Entities[ PvE_Mission.aVitalsInGame[ vitalCurrent ].id ]:Remove()						
							local newObj = ai.Spawn( curPhase.sTargetDef )
							newObj:SetPos( pos )
							newObj:SetRot( rot )
							PvE_Mission.aVitalsInGame[ vitalCurrent ].id = newObj:GetId()	
							curPhase.tId[ i ] = PvE_Mission.aVitalsInGame[ vitalCurrent ].id	
						elseif PvE_Mission.aVitalsInGame[ vitalCurrent ] then 
							vitalNewId = PvE_Mission.aVitalsInGame[ vitalCurrent ].id
							Entities[ vitalNewId ]:FullActivate( true )
							curPhase.tId[ i ] = PvE_Mission.aVitalsInGame[ vitalCurrent ].id
						end
						
						-- убираем заглушку маяка
						if curPhase.shadow or ( PvE_Mission.aVitalsInGame[ vitalCurrent ] and PvE_Mission.aVitalsInGame[ vitalCurrent ].shadow ) then 
							Entities[ PvE_Mission.aVitalsInGame[ vitalCurrent ].shadow ]:Remove() 
							PvE_Mission.aVitalsInGame[ vitalCurrent ].shadow = nil
						end		
						
						local pos = Entities[ curPhase.tId[ i ] ]:GetPos()
						
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_LightSpawn", pos.x, pos.y, pos.z, "PvE_Gen_GeneratorsLight" )
						else
							CL_LightSpawn( pos.x, pos.y, pos.z, "PvE_Gen_GeneratorsLight" )
						end							
					end
					PvE_Mission.nVitalCurrent = PvE_Mission.nVitalCurrent + vitalCurrent
				end	
			end,
			
			fUpdate = function ( self, dt, curPhase )
			
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						--включаем отображение прогресса	
						if curPhase.bCountBar == true then
							curPhase.nInitCount = curPhase.count
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							end					
						end			
					end
				end		
				
				local j = curPhase.count
				for i = 1, j do 		
					if PvE_Func:VitalsOnUsed( curPhase.tId[ i ] ) == true then
						Entities[ curPhase.tId[ i ] ]:ShowInHud( false )
						Entities[ curPhase.tId[ i ] ]:SetDamageable( false )
						curPhase.count = curPhase.count - 1
						PvE_Func:RemoveFromList( curPhase.tId, curPhase.tId[ i ] )
						curPhase.progressCount = curPhase.progressCount + 1
						-- головы при прогрессе фазы
						if curPhase.DialogOnProgress[ curPhase.progressCount ] then
							for i, j in ipairs( curPhase.DialogOnProgress[ curPhase.progressCount ] ) do 
								table.insert( DialogsUpdate, curPhase.DialogOnProgress[ curPhase.progressCount ][ i ] )
							end	
						end	
						if curPhase.bCountBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
							end								
						end
						if curPhase.count <= 0 then 
							if curPhase.bCountBar == true then
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
								else
									CL_HideProgressPhase()	--id
								end					
							end							
							return true
						elseif curPhase.timer then
							curPhase.timer = curPhase.timer - dt
							if curPhase.timer <= 0 then
								return false
							end
						end	
					end
				end		
			end,
		},
		
		[ "mines" ] = {
			fInit = function ( self, curPhase )
				local mines = GetEntitiesByDef( curPhase.sTargetDef )
				if next( mines ) then
					for i, mine in ipairs( mines ) do
						curPhase.tId[ i ] = Entities[ mine ]:GetId()
						Entities[ mine ]:FullActivate( true )
					end
				end
				if curPhase.bCountBar == true and curPhase.trsId then
					curPhase.count = #curPhase.trsId
					curPhase.nInitCount = curPhase.count
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
					else
						CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
					end					
				end	
			end,
			
			fUpdate = function ( self, dt, curPhase )

				local mineTriggers = curPhase.trsId

				for i, trigger in pairs( mineTriggers ) do
					if Entities[ trigger ]:GetBuildProgress() == 1 then
						PvE_Func:RemoveFromList( mineTriggers, trigger )
						if curPhase.count then
							curPhase.count = curPhase.count - 1
						end
						local name = Entities[ trigger ]:GetName()
						local objName = PvE_Mission.buildConteiner[ name ]
						local objId = Entities[ objName ]:GetId()
						local player = Entities[ objId ]:GetOwner()
						local shipId = player:GetId()
						PvE_Func:RemoveBomb( shipId )
					end							
				end

				local deactiveTriggers = GetEntitiesByDef( "Logic_EntityBuilderTrigger" )				
				
				if PvE_Mission.aSapperPlayers and next( mineTriggers ) and next( PvE_Mission.aSapperPlayers ) then
					for i, trigger in pairs( mineTriggers ) do
						local trigPos, shipPos, players, resultDist
						trigPos = Entities[ trigger ]:GetPos()
						players = PvE_Mission.aSapperPlayers
						for n, shipId in pairs( players ) do
							if not Entities[ shipId[ 1 ] ] then
								PvE_Func:RemoveBomb( shipId[ 1 ] )
							else
								shipPos = Entities[ shipId[ 1 ] ]:GetPos()
								shipId[ 2 ] = shipPos
								resultDist = SquareLen( shipPos, trigPos )
								if resultDist < 100 then
									if Entities[ trigger ]:IsActive() == false then
										Entities[ trigger ]:Activate()
									end	
									PvE_Func:RemoveFromList( deactiveTriggers, trigger )
								end
							end	
						end						
					end
				end
				
				PvE_Func:DeactivateTriggers( deactiveTriggers )
				
				if next( curPhase.trsId ) then
					if curPhase.bCountBar == true then
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.count, curPhase.nInitCount )	--id
						else
							CL_ShowProgressPhase( "Target_Count", curPhase.count, curPhase.nInitCount )	--id
						end								
					end
				else
					local bombs = GetEntitiesByDef( PvE_Mission.aPhases[ PvE_Mission.nCurPhase - 1 ].aDropTable.dropDef ) 
					for i, j in pairs ( bombs ) do
						Entities[ j ]:Remove()
					end  
					players = PvE_Mission.aSapperPlayers
					for n, shipId in pairs( players ) do
						PvE_Func:RemoveBomb( shipId[ 1 ] )
					end	
					if curPhase.bCountBar == true then
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
						else
							CL_HideProgressPhase()	--id
						end					
					end		
					return true				
				end					
			end,
		},
		
		[ "defense" ] = {
			fInit = function ( self, curPhase )	
			
				if curPhase.sReplaceObject then
					curPhase.tId, curPhase.sReplaceObject, curPhase.sTargetDef = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, curPhase.sReplaceObject, curPhase.sTargetDef )
				elseif curPhase.replaceObjectFromPhase then
					if PvE_Mission.aPhases[ curPhase.replaceObjectFromPhase ].sReplaceObject then
						curPhase.tId, curPhase.sReplaceObject, curPhase.sTargetDef = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, PvE_Mission.aPhases[ curPhase.replaceObjectFromPhase ].sReplaceObject, curPhase.sTargetDef )
					elseif PvE_Mission.aPhases[ curPhase.replaceObjectFromPhase ].sTargetDef then
						local a = GetEntitiesByDef( PvE_Mission.aPhases[ curPhase.replaceObjectFromPhase ].sTargetDef )
						local name = Entities[ a[ 1 ] ]:GetName()
						curPhase.tId, curPhase.sReplaceObject, curPhase.sTargetDef = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, name, curPhase.sTargetDef )
					end
				elseif curPhase.sTargetDef then
					curPhase.tId = GetEntitiesByDef( curPhase.sTargetDef )
				end	
				if type( curPhase.tId ) == "number" then
					Entities[ curPhase.tId ]:SetDamageable( true )
					Entities[ curPhase.tId ]:ShowInHud( true )
				elseif type( curPhase.tId ) == "table" then
					for i, targetId in pairs( curPhase.tId ) do
						Entities[ targetId ]:SetDamageable( true )
						Entities[ targetId ]:ShowInHud( true )
					end
				end	
			end,
			
			fUpdate = function ( self, dt, curPhase )
			
			if curPhase.bHPBar == true then
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						--включаем хпбар
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", curPhase.sTargetDef )	--id
						else
							PvE_Common.UI.PveEvents:SetBossId( curPhase.sTargetDef )	--id
						end	
					end
				end					
			end
			
			if curPhase.timer then
				curPhase.timer = curPhase.timer - dt
				curPhase.nWoWMsgTimer = curPhase.nWoWMsgTimer - dt
			end
			
			if curPhase.timer <= 0 then
				
				if curPhase.bHPBar == true then
					--отключаем хпбар
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
					else
						PvE_Common.UI.PveEvents:SetBossId( )	--id
					end
				end
				
				if type( curPhase.tId ) == "number" then
					Entities[ curPhase.tId ]:SetDamageable( false )
					Entities[ curPhase.tId ]:ShowInHud( false )
				elseif type( curPhase.tId ) == "table" then
					for i, targetId in pairs( curPhase.tId ) do
						Entities[ targetId ]:SetDamageable( false )
						Entities[ targetId ]:ShowInHud( false )
					end
				end	
				
				return true
			end
			
			if type( curPhase.tId ) == "number" then
				if Entities[ curPhase.tId ] then
					local hp = Entities[ curPhase.tId ]:GetHealth()
					if hp <= 0 then
						if curPhase.ruins == true then
							local c = ai.Spawn( curPhase.ruins )-- тут должен быть специальный объект
							c:SetPosDir( curPhase.pos, curPhase.dir )
						end
						if curPhase.bHPBar == true then
							--отключаем хпбар
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( )	--id
							end
						end			
						return false
					end
				elseif not Entities[ curPhase.tId ] or Entities[ curPhase.tId ] == nil then
					if curPhase.ruins then
						local c = ai.Spawn( curPhase.ruins )-- тут должен быть специальный объект
						c:SetPosDir( curPhase.pos, curPhase.dir )
					end
					if curPhase.bHPBar == true then
						--отключаем хпбар
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
						else
							PvE_Common.UI.PveEvents:SetBossId( )	--id
						end
					end		
					return false
				end
			elseif type( curPhase.tId ) == "table" then
				for i, entity in pairs( curPhase.tId ) do
					local hp = Entities[ entity ]:GetHealth()
					if hp <= 0 then
						table.remove( curPhase.tId, i )
					end
				end
				if not next( curPhase.tId ) then
					return false
				end
			end
			
			--говорим, сколько еще до конца раунда осталось
			if curPhase.nWoWMsgTimer <= 0 then
				local param = { { type = 6, name = "time", value = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timer } }
				if Game_IsServer() then
					ServerLuaRpcEx( ai.MAX_PLAYERS, "ShowWow", "Defense_Time", true, 5, param ) 
				else
					UI:ShowWowMsg( "Defense_Time", true, 5, param )
				end		
				curPhase.nWoWMsgTimer = curPhase.nStartWoWMsgTimer
			end			
		end,
		},		
		
		[ "towerDefense" ] = {
			fInit = function ( self, curPhase )
				curPhase.tId, curPhase.sReplaceObject, curPhase.sTargetDef, curPhase.oldDef = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, curPhase.sReplaceObject, curPhase.sTargetDef )
				
				for i, trig in ipairs( curPhase.trsId ) do
					Entities[ trig ]:Activate()
				end	
			end,
			
			fUpdate = function ( self, dt, curPhase )
			
				if curPhase.timer then
					curPhase.timer = curPhase.timer - dt
					curPhase.nWoWMsgTimer = curPhase.nWoWMsgTimer - dt

					--завершаем фазу, если время вышло
					if curPhase.timer <= 0 then
						curPhase.tId, curPhase.sReplaceObject, curPhase.sTargetDef = PvE_Func:ReplaceObject( PvE_Mission.nCurPhase, curPhase.sReplaceObject, curPhase.oldDef )
						
						if curPhase.bHPBar == true then
							--отключаем хпбар
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( )	--id
							end
						end
						
						return true
					end		

					--говорим, сколько еще до конца раунда осталось
					if curPhase.nWoWMsgTimer <= 0 then
						local param = { { type = 6, name = "time", value = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timer } }
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "ShowWow", "Defense_Time", true, 5, param ) 
						else
							UI:ShowWowMsg( "Defense_Time", true, 5, param )
						end		
						curPhase.nWoWMsgTimer = curPhase.nStartWoWMsgTimer
					end						
				end
				
				if curPhase.bHPBar == true then
					if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
						curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
						if curPhase.sync_UI_Timer <= 0 then
							--включаем хпбар
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", curPhase.sTargetDef )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( curPhase.sTargetDef )	--id
							end	
						end
					end					
				end		
				
				if Entities[ curPhase.tId ] then
					local hp = Entities[ curPhase.tId ]:GetHealth()
					if hp <= 0 then
						if curPhase.ruins then
							local c = ai.Spawn( curPhase.ruins )-- тут должен быть специальный объект
							c:SetPosDir( curPhase.pos, curPhase.dir )
						end
						if curPhase.bHPBar == true then
							--отключаем хпбар
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( )	--id
							end
						end			
						return false
					end
				elseif not Entities[ curPhase.tId ] or Entities[ curPhase.tId ] == nil then
					if curPhase.ruins then
						local c = ai.Spawn( curPhase.ruins )-- тут должен быть специальный объект
						c:SetPosDir( curPhase.pos, curPhase.dir )
					end
					if curPhase.bHPBar == true then
						--отключаем хпбар
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
						else
							PvE_Common.UI.PveEvents:SetBossId( )	--id
						end
					end		
					return false
				end		
			end,
		},		
		
		[ "flag" ] = {
			fInit = function ( self, curPhase )	
				
				local flags = GetEntitiesByDef( curPhase.sTargetDef )
				curPhase.tId = flags
				if curPhase.sTargetDef then
					for i, flagId in pairs( flags ) do
						local obj = Entities[ flagId ]
						obj:ShowInHud( true )
						obj:FullActivate( true )
						if curPhase.shadow then 
							Entities[ curPhase.shadow ]:Remove() 
						end							
					end
				end
			end,
			
			fUpdate = function ( self, dt, curPhase )
				for i, flagId in pairs( curPhase.tId ) do
					if PvE_Func:VitalsOnUsed( flagId ) == true then
							return true
					elseif curPhase.timer then
						curPhase.timer = curPhase.timer - dt
						if curPhase.timer <= 0 then
							return false
						end				
					end
				end	
			end,
		},	
		
		[ "kill" ] = {
			fInit = function ( self, curPhase )
				local wave = PvE_Missions.pve_planetoidraid.rounds[ 1 ].waves[ curPhase.wave ]
				for i, k in pairs( wave ) do
					if type( wave[ i ] ) == "table" then
						curPhase.count = curPhase.count + wave[ i ].count
					end	
				end
			end,
			fUpdate = function ( self, dt, curPhase )
			
				for i, shipId in pairs( curPhase.shipsId ) do
					if Entities[ shipId ]:IsDead() == true or Entities[ shipId ] == nil then
						curPhase.count = curPhase.count - 1
						curPhase.shipsId[ shipId ] = nil
					end
				end
				if curPhase.count == 0 then
					return true
				end
			end,
		},			
		
		[ "kill2" ] = {
			fInit = function ( self, curPhase )
				local waves = curPhase.waves
				for i, k in pairs( waves ) do
					curPhase.progressCount = curPhase.progressCount + waves[ i ].count
				end		
				curPhase.initCount = curPhase.progressCount
				curPhase.spawnTimer	= waves[ 1 ].delay
				
				if Game_IsServer() then
					ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].progressCount, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].initCount )	--id
				else
					CL_ShowProgressPhase( "Target_Count", PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].progressCount, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].initCount )	--id
				end			
			end,
			fUpdate = function ( self, dt, curPhase )
				
				if curPhase.spawnTimer and curPhase.spawnTimer <= 0 then
					local packDefs = {}
					if curPhase.waves[ curPhase.queueMob ] then
						local l = curPhase.waves[ curPhase.queueMob ].count
						for k = 1, l do
							packDefs[ k ] = curPhase.waves[ curPhase.queueMob ].def
						end
						local near, dir = AID:GetMobSpawnPos()
						local relationshipGroup = Def[ packDefs[ 1 ] ].relationship_group or 2
						local p = designers:AddPack( packDefs, AID.spawnPos[ near ].pos , relationshipGroup, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir )
						designers:AddPackInAID( p, packAvt )
						AID:PortalInitialization( p[ 1 ], near )
						
						curPhase.spawnTimer = curPhase.waves[ curPhase.queueMob ].delay or 1
						curPhase.queueMob = curPhase.queueMob + 1
					else
						spawnTimer = nil
					end
				else
					curPhase.spawnTimer = curPhase.spawnTimer - dt
				end
					
				for i, shipId in pairs( curPhase.tId ) do
					if Entities[ shipId ] == nil or Entities[ shipId ]:IsDead() == true then
						curPhase.progressCount = curPhase.progressCount - 1
						curPhase.tId[ i ] = nil
						
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].progressCount, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].initCount )	--id
						else
							CL_ShowProgressPhase( "Target_Count", PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].progressCount, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].initCount )	--id
						end								
					end
				end
				if curPhase.progressCount <= 0 then
					return true
				end		
				
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						if curPhase.bCountBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.initCount, curPhase.initCount )	--id
							else
								CL_ShowProgressPhase( "Target_Count", curPhase.initCount, curPhase.initCount )	--id
							end	
						end
					end
				end	
				
			end,
		},	
		
		[ "custom" ] = {
			fInit = function ( self, curPhase )
			end,
			fUpdate = function ( self, dt, curPhase )
				if curPhase.timer < 0 then
					return true
				else
					curPhase.timer = curPhase.timer - dt
					curPhase.nWoWMsgTimer = curPhase.nWoWMsgTimer - dt
				end
				
				if curPhase.nWoWMsgTimer <= 0 then
				local param = { { type = 6, name = "time", value = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].timer } }
				if Game_IsServer() then
					ServerLuaRpcEx( ai.MAX_PLAYERS, "ShowWow", "Defense_Time", true, 5, param ) 
				else
					UI:ShowWowMsg( "Defense_Time", true, 5, param )
				end		
				curPhase.nWoWMsgTimer = curPhase.nStartWoWMsgTimer
			end		
			end,
		},
		
		[ "monster_attack" ] = {
			fInit = function ( self, curPhase )
				Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.DEFAULT )	
			end,
			fUpdate = function ( self, dt, curPhase )		
				if curPhase.timer < 0 then 
					local curCountHunter = #( GetEntitiesByDef( "Ship_Alien_Hunter_PlanetoidRaid" ) ) or 0
					local curCountPredator = #( GetEntitiesByDef( "Ship_Alien_Predator_PlanetoidRaid" ) ) or 0
					local curCount = curCountHunter + curCountPredator
					if curCount < curPhase.maxCount then
						if curPhase.need2recalculate == true then
							curPhase.need2spawn = curPhase.maxCount - curCount
							curPhase.need2recalculate = false
						end
						if curPhase.spawnTimer < 0 then
							Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.ATTACK )	
							local n_pos = Entities[ "Dread1" ]:GetPos() or Vec3( 0, 0, 0 )
							local pos = Entities[ curPhase.spawnPoint ]:GetPos() or Vec3( 0, 0, 0 )
							local dir = ( n_pos - pos ):GetNormalized()
							local mobs = { "Ship_Alien_Hunter_PlanetoidRaid", "Ship_Alien_Predator_PlanetoidRaid" }
							local randomDef = mobs[ math.random( #mobs ) ]
							local packDefs = {}
							table.insert( packDefs, randomDef )
							local p = designers:AddPack( packDefs, pos, ai.RelationshipGroups.Alien, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)

							if not curPhase.need2spawn then
								curPhase.need2spawn = 0
								sys.out( "need2spawn was invalid!!!" )
							end
							
							designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
							curPhase.spawnTimer = 1
							curPhase.need2spawn = curPhase.need2spawn - 1							
							
							if curPhase.need2spawn <= 0 then
								curPhase.timer = 60
								curPhase.need2recalculate = true
								Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.DEFAULT )
							end
						else
							curPhase.spawnTimer = curPhase.spawnTimer - dt
						end	
					end	
				end	
				
				curPhase.timer = curPhase.timer - dt
				if not next( aMonsterShields )then	
					return true
				end
			end,
		},
				
		[ "selector" ] = {
			fInit = function ( self, curPhase )
				local number = math.random( #PvE_Mission.selectorTriggers )
				Entities[ PvE_Mission.selectorTriggers[ number ][ 1 ] ]:Activate()
				Entities[ PvE_Mission.selectorTriggers[ number ][ 2 ] ]:FullActivate( true )
				Entities[ PvE_Mission.selectorTriggers[ number ][ 3 ] ]:FullActivate( true )
				curPhase.tId = Entities[ PvE_Mission.selectorTriggers[ number ][ 2 ] ]:GetId()
				curPhase.number = number
				
				Entities[ PvE_Mission.gunLight[ curPhase.number ] ]:FullActivate( true )
				
			end,
			
			fUpdate = function ( self, dt, curPhase )	
				local number = curPhase.number
				local mineTriggerId = PvE_Mission.selectorTriggers[ number ][ 1 ]
				if Entities[ PvE_Mission.selectorTriggers[ number ][ 1 ] ]:GetBuildProgress() == 1 then
					curPhase.selectResultId = mineTriggerId	
					Entities[ mineTriggerId ]:Deactivate()
					Entities[ PvE_Mission.selectorTriggers[ number ][ 3 ] ]:FullActivate( false )
					table.remove( PvE_Mission.selectorTriggers, number )
					Entities[ PvE_Mission.gunLight[ curPhase.number ] ]:FullActivate( false )
					return true
				end
				
				if curPhase.timer < 0 then
					local curCountHunter = #( GetEntitiesByDef( "Ship_Alien_Hunter_PlanetoidRaid" ) )
					local curCountPredator = #( GetEntitiesByDef( "Ship_Alien_Predator_PlanetoidRaid" ) )
					local curCount = curCountHunter + curCountPredator
					if curCount < curPhase.maxCount then
						if curPhase.spawnTimer <= 0 then	
							if curPhase.houk == false then
								if curPhase.attackDelay >= 0 then
									curPhase.attackDelay = curPhase.attackDelay - dt
									curPhase.wowTimer = curPhase.wowTimer - dt
									if curPhase.wowTimer <= 0 then
										local param = { { type = 6, name = "time", value = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].attackTimer } }
										SV_ShowWowMsg( -1, "Devourer_In_Attack", true, 1, param, 0.8 )
										curPhase.wowTimer = 1
										PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].attackTimer = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].attackTimer - 1
									end	
								else
									curPhase.attackDelay = 5
									if leftClaw and rightClaw then
										local array = {}
										array = { "HIT_LEFT", "HIT_RIGHT" }
										local side = array[ math.random( #array ) ]
										Entities[ "Monster1" ]:SetTargetState( ai.Monster01State[ side ] )
									elseif leftClaw then
										Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.HIT_RIGHT )
									elseif rightClaw then
										Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.HIT_LEFT )
									end	
									curPhase.houk = true
									curPhase.houkTimer = 10
								end	
							elseif curPhase.houkTimer > 0 and curPhase.houk == true then
								curPhase.houkTimer = curPhase.houkTimer - dt
							else
								Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.ATTACK )	
								local n_pos = Entities[ "Dread1" ]:GetPos()
								local pos = Entities[ curPhase.spawnPoint ]:GetPos() 
								local dir = ( n_pos - pos ):GetNormalized()
								local mobs = { "Ship_Alien_Hunter_PlanetoidRaid", "Ship_Alien_Predator_PlanetoidRaid" }
								local randomDef = mobs[ math.random( #mobs ) ]
								local packDefs = {}
								table.insert( packDefs, randomDef )
								local p = designers:AddPack( packDefs, pos, ai.RelationshipGroups.Alien, "pack " .. tostring (AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
								
								designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
								curPhase.spawnTimer = 1
									
								if curCount >= curPhase.maxCount - 1 then
									curPhase.timer = 70
									curPhase.houk = false
									PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].attackTimer = 4
								end
							end	
						else
							curPhase.spawnTimer = curPhase.spawnTimer - dt
						end	
					elseif curCount >= curPhase.maxCount then
						Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.DEFAULT )
					end		
				end	
				curPhase.timer = curPhase.timer - dt		
			end,
		},

		[ "dreadnought" ] = {
			fInit = function ( self, curPhase )
				Entities[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadName ]:FullActivate( true )
				Entities[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadName ]:SetPathByName( "PathObject1" )									
				local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
				for i, main in ipairs( mainTur ) do
					Entities[ main ]:FullActivate( true )
				end
			end,
			
			fUpdate = function ( self, dt, curPhase )				
	
				local dread = Entities[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadName ]
				
				if dread:IsHidden() == false then
					local startPos = dread:GetPos()
					local finishPos = Entities[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].finishPoint ]:GetPos()
					local resSpeed = #( 1.5*( startPos - finishPos ) )	
					dread:SetTargetSpeed( resSpeed )
				end
				
				if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer then
					PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer - dt
					if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer < 0 then
						PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer = nil
					end	
				else		
					local mainTur = GetEntitiesByDef( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].mainTurrets )
					for i, main in ipairs( mainTur ) do
						Entities[ main ]:Start()
					end	
					
					local Tur = GetEntitiesByDef( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].averageTurrets )
					for i, main in ipairs( Tur ) do
						Entities[ main ]:FullActivate( true )
					end		
					
					return true
				end	
			end,
		},
		
		[ "tongue" ] = {
			fInit = function ( self, curPhase )
			end,
			fUpdate = function ( self, dt, curPhase )
				local monster = Entities[ "Monster3" ]
				local netId = Entities[ "Monster3" ]:GetNetworkId()
				curPhase.timer = curPhase.timer + dt
				if curPhase.timer > 2 and curPhase.timer < 15.5 then
					if curPhase.sent1 == nil then	
						monster:SetTargetState( ai.Monster04State.ATTACK )
						curPhase.sent1 = true
					end	
				elseif curPhase.timer > 15.5 and curPhase.sent2 == nil then
					curPhase.turretsId = {}
					local k = 1
					for i = 1, 4 do
						for j = 1, 3 do
							local turret = ai.Spawn( "Turret_MonsterGun" ) 
							monster:AttachToBone( turret, "turret"..i.."_0"..j )							
							curPhase.turretsId[ k ] = {}
							curPhase.turretsId[ k ][ 1 ] = turret:GetId()
							k = k + 1
						end
					end	
					curPhase.sent2 = true
				elseif curPhase.timer > 15.5 and next( curPhase.turretsId ) then	
					for i, j in pairs( curPhase.turretsId ) do
						if Entities[ j[ 1 ] ]:IsDead() then
							if j[ 2 ] then
								local packDefs = {}
								packDefs[ i ] = "Ship_Alien_EggScout_PlanetoidRaid"
								local p = {}
								p[ 1 ] = designers:AddBot( "Ship_Alien_EggScout_PlanetoidRaid", j[ 2 ], ai.RelationshipGroups.Alien, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", j[ 3 ] )

								local aMobsId = designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
								
								if PvE_Mission.eggs < 6 then
									for n, id in pairs( aMobsId ) do
										table.insert( PvE_Mission.aMinions, id )
									end
								end
								
								PvE_Func:RemoveFromList( curPhase.turretsId, j )
								
							end	
						elseif Entities[ j[ 1 ] ] == nil then
							PvE_Func:RemoveFromList( curPhase.turretsId, j )
						else
							local pos = Entities[ j[ 1 ] ]:GetPos()
							if pos ~= nil then
								j[ 2 ] = pos
							end	
							local dir = Entities[ j[ 1 ] ]:GetDir()
							if dir ~= nil then
								j[ 3 ] = dir
							end	
						end
					end
				elseif curPhase.timer > 15.5 and not next( curPhase.turretsId ) and curPhase.sent2 == true then
					if curPhase.sent3 == nil then				
						monster:SetTargetState( ai.Monster04State.HIDDEN )		
						curPhase.sent3 = true
						return true
					end	
				end		
			end,
		},
		
		[ "reach" ] = {
			fInit = function ( self, curPhase )
				curPhase.tId = {}
				curPhase.tId[ 1 ] = Entities[ curPhase.sTargetObject ]:GetId()
			end,
			fUpdate = function ( self, dt, curPhase )
			local player_count = 0
				local players = GetAllPlayersInfo()
									local playersId = {}
									for i, player in ipairs( players ) do
										if Entities[ player.entityId ] and not Entities[ player.entityId ]:IsDead() and not player.isBot then
											playersId[ i ] = player.entityId
											player_count = player_count+1
										end	
									end
				local cnt = 0
				for i, player in ipairs( playersId ) do
					local playerPos = Entities[player]:GetPos()
					local trigPos = Entities[ curPhase.sTargetObject ]:GetPos()
					if #( playerPos - trigPos ) <= curPhase.dist then
						cnt = cnt+1
					end
				end	
				if curPhase.bCountBar == true then
								if Game_IsServer() then
									ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", curPhase.tCount - curPhase.progressCount, curPhase.tCount )	--id
								else
									CL_ShowProgressPhase( "Target_Count", cnt, player_count*curPhase.player_perc   )	--id
								end					
							end	
				if cnt >= player_count*curPhase.player_perc then return true end
			end,
		},
		
		[ "tutorial_reach" ] = {
			fInit = function ( self, curPhase )
				curPhase.tId = {}
				curPhase.tId[ 1 ] = Entities[ curPhase.sTargetObject ]:GetId()
			end,
			fUpdate = function ( self, dt, curPhase )
				local player = CL_GetLocalPlayerShip()
				if player then
					local playerPos = CL_GetLocalPlayerShip():GetPos()
					local trigPos = Entities[ curPhase.sTargetObject ]:GetPos()
					if #( playerPos - trigPos ) <= curPhase.dist then
						return true
					end
				else
					return 2, ai.WinReason.TUTORIAL_PLAYER_DEAD
				end	
			end,
		},
		
		[ "tutorialKill" ] = {
			fInit = function ( self, curPhase )
			end,
			fUpdate = function ( self, dt, curPhase )
				
				if curPhase.count == ( -1 ) then
					curPhase.tId = GetEntitiesByDef( curPhase.sTargetDef )
					curPhase.count = #( curPhase.tId )
				end
				if curPhase.tId then			
					for i, shipId in pairs( curPhase.tId ) do
						if Entities[ shipId ]:IsDead() == true or Entities[ shipId ] == nil then
							curPhase.count = curPhase.count - 1
							PvE_Func:RemoveFromList( curPhase.tId, shipId )
						end
					end
				end	
				if curPhase.count == 0 then
					return true
				end
			end,	
		},
		
		[ "waves" ] = {
			fInit = function ( self, curPhase )
			
				local targets = GetEntitiesByDef( curPhase.sTargetDef )
				curPhase.tId = {}
				curPhase.tId = targets
				
				local aResTable = {}
				if PvE_Mission.trsId then
					for i, turId in ipairs( PvE_Mission.trsId ) do
						local name = Entities[ turId ]:GetName()
						local objName = PvE_Mission.buildConteiner[ name ]
						local objId = Entities[ objName ]:GetId()
						local player = Entities[ objId ]:GetOwner()
						if player then
							aResTable[ i ] = i
						end	
					end
					for k, number in pairs( aResTable ) do
						table.remove( PvE_Mission.trsId, k )
					end
				end	
				if curPhase.specificSpawnName then
					curPhase.specificSpawns = {}
					PvE_Func:FindSpawns( curPhase.specificSpawns, curPhase.specificSpawnName )
				end
				
			end,
			fUpdate = function ( self, dt, curPhase )
				
				for i, id in pairs( PvE_Mission.tId ) do
					if not Entities[ id ] or Entities[ id ]:GetHealth() < 0 then
						PvE_Func:RemoveFromList( PvE_Mission.tId, id )
					end
					if Entities[ id ]:GetHealth() < ( Entities[ id ]:GetMaxHealth() * 0.3 ) and not PvE_Mission.alarm then
						
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "PlaySoundOnClient" )	--id
						else
							PlaySoundOnClient( )	--id
						end	
						PvE_Mission.alarm = true
					end	
				end
			
				if not next( PvE_Mission.tId ) then
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId" )	--id
					else
						PvE_Common.UI.PveEvents:SetBossId( )	--id
					end					
				end
				
				local deactiveTriggers = GetEntitiesByDef( "Logic_EntityBuilderTrigger" )
				
				if next( PvE_Mission.aSapperPlayers ) then
					local trigPos, shipPos, players, resultDist, mineTriggers 
					
					players = PvE_Mission.aSapperPlayers
					if next( players ) then
						for n, shipId in pairs( players ) do
							if not Entities[ shipId[ 1 ] ] then
								PvE_Mission.aSapperPlayers[ shipId[ 1 ] ] = nil
							else		
								local bomb = ai.GetNetworkEntity( shipId[ 3 ] )
								local defName = bomb:GetDefName()
								if Def[ defName ].build_object == true then
									if bomb then
										mineTriggers = sys.new( PvE_Mission.trsId )
										for i, trigger in pairs( mineTriggers ) do
											if Entities[ trigger ]:GetBuildProgress() == 1 then		
												local name = Entities[ trigger ]:GetName()
												local objName = PvE_Mission.buildConteiner[ name ]
												local objId = Entities[ objName ]:GetId()
												local player = Entities[ objId ]:GetOwner()
												if player == nil then
													sys.out( "!!!!!!!!!!!!!!!!!!!!!!!!!_NIL_PLAYER_!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" )
												end
												local shipId = player:GetId()
												if shipId == nil then
													sys.out( "!!!!!!!!!!!!!!!!!!!!!!!!!_NIL_ID_PLAYER_!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" )
												end
												PvE_Func:RemoveBomb( shipId )
												table.remove( PvE_Mission.trsId, i )
												break	
											else
												shipPos = Entities[ shipId[ 1 ] ]:GetPos()	
												trigPos = Entities[ trigger ]:GetPos()
												resultDist = SquareLen( shipPos, trigPos )
												if resultDist < 400 then
													if Entities[ trigger ]:IsActive() == false then
														Entities[ trigger ]:Activate()
														mineTriggers[ i ] = nil
													end	
													PvE_Func:RemoveFromList( deactiveTriggers, trigger )
												end																	
											end	
										end	
									end	
								end	
							end
						end
						PvE_Func:DeactivateTriggers( deactiveTriggers )
					end	
				else
					PvE_Func:DeactivateTriggers( deactiveTriggers )
				end
				
				
				if curPhase.sync_UI_Timer and curPhase.sync_UI_Timer > 0 then
					curPhase.sync_UI_Timer = curPhase.sync_UI_Timer - dt
					if curPhase.sync_UI_Timer <= 0 then
						if curPhase.bHPBar == true then		
							--включаем хпбар
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", curPhase.sTargetDef )	--id
							else
								PvE_Common.UI.PveEvents:SetBossId( curPhase.sTargetDef )	--id
							end	
							local descParams = { { name = "waves", type = ai.GameMsgParamType.INT, value = PvE_Mission.try } } 
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ActivatePVEEvent", "wave_guard", -1, PvE_Mission.iTotalMobs, {}, -1, descParams )
							else
								PvE_Common.UI.PveEvents:ActivatePVEEvent( "wave_guard", -1, PvE_Mission.iTotalMobs, {}, -1, descParams )
							end		
						elseif curPhase.bCountBar == true then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ShowProgressPhase", "Target_Count", PvE_Mission.iWaveMobs - PvE_Mission.iKilled, PvE_Mission.iWaveMobs )	--id
							else
								CL_ShowProgressPhase( "Target_Count", PvE_Mission.iWaveMobs - PvE_Mission.iKilled, PvE_Mission.iWaveMobs )	--id
							end	
						end
					end
				end
				
				if curPhase then
					local aResultMobs = {}
					local aSpaceShips = GetEntitiesByClass( "SpaceShip" )	
					for i, ship in ipairs( aSpaceShips ) do
						if Entities[ ship ]:GetPlayerIdx() < 0 and not Entities[ ship ]:IsDead() then
							table.insert( aResultMobs, ship )
						end
					end
					if PvE_Mission.iWaveMobs > 0 then
						if #aResultMobs < PvE_Mission.iMaxMobs then
							if curPhase.spawnTimer < 0 then
								local pointNumber
								local p, mobs = {}
								local mobPack = {}
								if PvE_Mission.iNeed2Boss >= PvE_Mission.waveCut[ "iNeed2Boss" ] then
									mobs = PvE_Mission.roundMobs[ PvE_Mission.try ] and PvE_Mission.roundMobs[ PvE_Mission.try ].BossBots or PvE_Mission.mobs.BossBots
									PvE_Mission.iNeed2Boss = 0
								elseif PvE_Mission.iNeed2Elite >= PvE_Mission.waveCut[ "iNeed2Elite" ] then
									mobs = PvE_Mission.roundMobs[ PvE_Mission.try ] and PvE_Mission.roundMobs[ PvE_Mission.try ].EliteBots or PvE_Mission.mobs.EliteBots
									PvE_Mission.iNeed2Elite = 0
								else	
									mobs = PvE_Mission.roundMobs[ PvE_Mission.try ] and PvE_Mission.roundMobs[ PvE_Mission.try ].MeatBots or PvE_Mission.mobs.MeatBots
								end	
								local randomDef = mobs[ math.random( #mobs ) ]								
								
								if type( randomDef ) == "table" then
									if PvE_Mission.iWaveMobs < #randomDef then
										mobPack[ 1 ] = randomDef[ math.random( #randomDef ) ]
									else
										mobPack = randomDef
									end	
								else
									mobPack[ 1 ] = randomDef
								end
								for i, mobDef in pairs( mobPack ) do
									local spawn
									if curPhase.specificSpawns then
										pointNumber = math.random( #curPhase.specificSpawns )
										spawn = curPhase.specificSpawns[ pointNumber ]
									else
										pointNumber = math.random( #AID.spawnPos )
										spawn = AID.spawnPos[ pointNumber ]
									end	
									local n_pos = Entities[ PvE_Mission.tId[ math.random( #PvE_Mission.tId ) ] ]:GetPos()
									local dir = ( n_pos - spawn.pos ):GetNormalized()								
									p[ i ] = designers:AddBot( mobDef, spawn.pos, 2, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir )
								end	
								designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
								curPhase.spawnTimer = 2 						
								PvE_Mission.iWaveMobs = PvE_Mission.iWaveMobs - #p	
								AID:PortalInitialization( p[ 1 ], pointNumber )
								if type( randomDef ) == "table" then
									local players = GetAllPlayersInfo()
									local playersId = {}
									for i, player in ipairs( players ) do
										if Entities[ player.entityId ] and not Entities[ player.entityId ]:IsDead() then
											playersId[ i ] = player.entityId
										end	
									end
									local mobsId = {}
									for i, mob in ipairs( p ) do
										mobsId[ i ] = mob:GetId()
									end
									local resultSelect = math.random( #playersId )	
									AID:PVE_ForceTarget( mobsId, playersId[ resultSelect ] )			
								end
							else
								curPhase.spawnTimer = curPhase.spawnTimer - dt
							end	
						end	
					else	
						if not next( aResultMobs ) then
							if Game_IsServer() then
								ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_HideProgressPhase" )	--id
							else
								CL_HideProgressPhase()	--id
							end		
							return true
						end
					end		
				end				
			end,
		},
	},
	
	aEvents = {
		[ "Desttown_Goblin" ] = {
			timer = 25, -- через столько от начала фазы стартанет эвент
			EscapeTime = 30,
			EventTargetDefs = { "Ship_Gen_Event_Goblin" },
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= false,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cTextOnStart = "pve_gen_desttown_event_goblin_start", --"pveEvent_Kill_Jericho_Runner",
			cCharacterOnStart 	= "pve_briggs",
			cTextOnFailed = "pve_gen_desttown_event_goblin_fail",
			cCharacterOnFailed 	= "pve_briggs",
			cTextOnComplit = "pve_gen_desttown_event_goblin_complit", 
			cCharacterOnComplit = "pve_briggs",
			portal	= nil,
			reward   = 0.1,
			nCount	 = 0,	-- внутренняя переменная
			boss		= nil,
			fStart	 =	function (self, container, dt, curPhase, event) -- не стандартные действия при запуске фазы
							local curEvent = PvE_Mission.aEvents[ "Desttown_Goblin" ]
							local i, pid, p
							local packDefs = curEvent.EventTargetDefs
							
							if not container[ "Desttown_Goblin" ].portal then
								if not curEvent.boss then 
									local near, dir = AID:GetMobSpawnPos( )
									if near then 
										p = designers:AddPack( packDefs, AID.spawnPos[near].pos , 2, "Desttown_Goblin", dir )	
										designers:AddPackInAID( p, { Avt.GoblinRunAway } )
										
										PvE_Mission.aAdditionalTargetId = {}
									
										for i = 1, #p do
											PvE_Mission.aAdditionalTargetId[ i ] = p[ i ]:GetId()
										end

										curEvent.boss = p[ 1 ]:GetId()
										AID:PortalInitialization( p[ 1 ], near )								
										return true  --isStarted отсюда возьмется
									end
								end
							end
						end,
						
			fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
				local curEvent = PvE_Mission.aEvents[ "Desttown_Goblin" ]
				local bot = AID:GetBot( curEvent.boss )  -- получить таблицу моба в системе AID
				local ship = Entities[ curEvent.boss ]
				if ship then
					if bot and bot.behavior_time and bot.behavior and bot.behavior == "EscapeByPortal" and  bot.behavior_time >= curEvent.EscapeTime then
						self.isFailed = true
						ship:Remove()
						return true
					end
				elseif not curEvent.isComplete then
					return true
				end
			end,
						
			fEnd	 = 	function ( self, container, dt, curPhase, event )  
							dprint("--------!!!  Goblin Event fEnd " )
						end, -- не стандартные действия на окончание времени эвента
		},
		
		[ "Desttown_Event_Kill" ] = { -- Уничтожение враждебной цели ( корабль )
			EventTargetDefs = { "Ship_Gen_Boss_Empire_Destroyer" },
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= false,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cTextOnStart = "PvE_RandomEvent2S",
			cTextOnFailed = "PvE_RandomEvent2F",
			cTextOnComplit = "PvE_RandomEvent2C",
			aPatrols = { "Desttown_Event_Kill" },	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = { "Desttown_Event_Kill" },
			portal		= nil,
			reward   = 0.1,
			nCount	 = 0,	-- внутренняя переменная
			boss		= nil,

			fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы

							local i, pid, p
							local packDefs = PvE_Mission.aEvents[ "Desttown_Event_Kill" ].EventTargetDefs
							
							if not container[ "Desttown_Event_Kill" ].portal then
								if not PvE_Mission.aEvents[ "Desttown_Event_Kill" ].boss then 
									local near, dir = AID:GetMobSpawnPos( )
									if near then 
										p = designers:AddPack( packDefs, AID.spawnPos[near].pos , 2, "pack " .. tostring ( 1 ) .." : ", dir )	
										PvE_Mission.aEvents[ "Desttown_Event_Kill" ].boss = p[ 1 ]
										
										PvE_Mission.aAdditionalTargetId = {}
										
										for i = 1, #p do
											PvE_Mission.aAdditionalTargetId[ i ] = p[ i ]:GetId()
										end

										container[ "Desttown_Event_Kill" ].portal = AID:PortalInitialization( p[ 1 ], near, "Desttown_Event_Kill" )
										return true
									end
								end
							end
						end,
						
			fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
							if PvE_Mission.aEvents[ "Desttown_Event_Kill" ].boss then
								if PvE_Mission.aEvents[ "Desttown_Event_Kill" ].boss:IsDead() then
									return true
								end
							end
						end,
			fEnd	 = function ( self, container, dt, curPhase, event ) 
			end, -- не стандартные действия на окончание времени эвента
		},
			
		[ "Desttown_Event_Beacon" ] = { -- Уничтожение генератора для турелей
			EventTargetDefs = { "PvE_Gen_Beacon_event" },
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= false,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			nPhaseStart	= nil,
			aTurrets	= {},
			cTextOnStart = "pve_gen_desttown_event_beacon_start",
			cCharacterOnStart = "broker",
			cTextOnFailed = "pve_gen_desttown_event_beacon_fail",
			cCharacterOnFailed  = "broker",
			cTextOnComplit = "pve_gen_desttown_event_beacon_complit",
			cCharacterOnComplit = "broker",
			precache_defs = { "PvE_Gen_Beacon_event", "Turret_Beacon_bb2_event_shadow" },
			reward = 0.1,	-- награда за выполнение, 10%
			
			nCount	 = 0,	-- внутренняя переменная
			fInit	 = 	function ( self, container, dt, curPhase, event ) -- не стандартные действия при старте мисиии (1й кадр после отсчёта)
		
							local p = math.random( #PvE_Mission.aRandomPoints )
		
							self.cPointName = PvE_Mission.aRandomPoints[ p ]
							
							PvE_Func:RemoveFromList( PvE_Mission.aRandomPoints, p )
							
							local point = GetObjectByName( self.cPointName )
							
							if point then
								PvE_Common:slog( "shadow add" )
								local i, pid, b, p
								b = ai.Spawn( "Turret_Beacon_bb2_event_shadow" )
								b:SetPos( point:GetPos() ) 

								local entities = GetEntitiesByClass( "BaseEntity" )
								
								for i, pid in pairs( entities ) do
									p = Entities[ pid ]:GetDefName()
									if p == "Turret_Beacon_bb2_event_shadow" then
										self.shadow = pid
									end
								end
							else
								PvE_Common:slog("!!!================================= Error RandomEvent DestroyBeacon not found point ")
							end

						end,
			fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы
							
							self.aTurrets = GetEntitiesByDef( "PvE_Gen_Jericho_Turret1" )

							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							if self.shadow and Entities[ self.shadow ] then
								Entities[ self.shadow ]:Remove()
							else
								PvE_Common:slog( "!!!================================= Error RandomEvent DestroyBeacon not found shadow" )
							end

							
							local point = GetObjectByName( self.cPointName )
							if point then
								local b = ai.Spawn( "PvE_Gen_Beacon_event" )
								b:SetPos( point:GetPos() )
								
								local i, pid, p
								for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
									p = Entities[ pid ]:GetDefName()
									if p == "PvE_Gen_Beacon_event" then
										self.beacon = pid
										Entities[ self.beacon ]:FullActivate( true )												
										PvE_Mission.aAdditionalTargetId = {}
										PvE_Mission.aAdditionalTargetId[ 1 ] = pid
									end
								end
								
								-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
								local spawn = GetObjectByName( "spawn_spot_event" )
								if spawn then
									spawn:SetPos( point:GetPos() )
								else
									PvE_Common:slog( "no spawn_spot_event in Event DestroyBeacon" )
								end
							end
							
							if not self.beacon then
								PvE_Common:slog( "no beacon with Turret_Beacon_bb666 in Event DestroyBeacon" )
							end
							self.nPhaseStart = PvE_Mission.nCurPhase
							return true
						end,
			fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon and Entities[ self.beacon ] then
								if Entities[ self.beacon ]:GetHealth() <= 0 then
									self.isComplete = true
									return true
								end
							end
							if self.nPhaseStart ~= PvE_Mission.nCurPhase then 
								self.isFailed = true
								return true
							end
						end,
			fEnd	 = function ( self, container, dt, curPhase, event ) 
							if self.isFailed then
								PvE_Mission.aAdditionalTargetId	= {},
								Entities[ self.beacon ]:FullActivate( false )
								for i, turret in pairs( self.aTurrets ) do
									Entities[ turret ]:FullActivate( true )
								end 
							end
						end, -- не стандартные действия на окончание времени эвента
			
		},	
		
		[ "Desttown_Grab_Hero" ] = { -- Эвакуация тела пилота
			EventTargetDefs = { "LootCrate_Gen_PvE_DeathShip" },
			
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= false,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,			
			cTextOnStart = "pve_gen_desttown_event_hero_start",
			cCharacterOnStart = "pve_lang",
			cTextOnFailed = "pve_gen_desttown_event_hero_fail",
			cCharacterOnFailed = "pve_lang",
			cTextOnComplit = "pve_gen_desttown_event_hero_complit",
			cCharacterOnComplit = "pve_lang",
			nCount	 = 0,	-- внутренняя переменная
			boxes = {},
			precache_defs = { "LootCrate_Gen_PvE_DeathShip"},
			reward = 0.1,
			
			fStart	 = function ( self, container, dt, curPhase, event )	
			
							local p = math.random( #PvE_Mission.aRandomPoints )
		
							self.cPointName = PvE_Mission.aRandomPoints[ p ]
							
							PvE_Func:RemoveFromList( PvE_Mission.aRandomPoints, p )
							
							local point = GetObjectByName( self.cPointName )
							
							if point then
								--PvE_Common:slog("sss")
								local i, pid, box, pos, p
								pos = point:GetPos()
								for i = 1, 1 do
									box = ai.Spawn( "LootCrate_Gen_PvE_DeathShip" )
									p = pos
									p.x = p.x + math.random( 20 )-10
									p.y = p.y + math.random( 20 )-10
									p.z = p.z + math.random( 20 )-10
									box:SetPos( p )
								end
								
								local entities = GetEntitiesByClass( "LootCrate" )
								
								-- запоминаем расставленные ящики по id - для дальнейшего отслеживания.
								for i, pid in pairs( entities ) do
									p = Entities[ pid ]
									if p:GetDefName() == "LootCrate_Gen_PvE_DeathShip" then
										table.insert( self.boxes, pid )
										
										PvE_Mission.aAdditionalTargetId = {}
										
										for j = 1, #entities do
											PvE_Mission.aAdditionalTargetId[ j ] = pid
										end	
										
									end
								end
							else
								PvE_Common:slog( "!!!================================= Error RandomEvent Box not found point" )
							end
							return true
						end, -- не стандартные действия при запуске эвента
						
			fUpdate	 = function ( self, container, dt, curPhase, event ) -- проверка выполнения/провала эвента
					-- считаем число оставшихся ящиков
					local i, pid, p
					local cnt = 0
					local deadcnt = 0
					for i = 1, #self.boxes do
						if self.boxes[ i ] <= 0 then
							deadcnt = deadcnt + 1
						else
							p = Entities[ self.boxes[ i ] ]
							if p then
								cnt = cnt + 1
								if p:GetHealth() < 1000000 then	-- ящик повреждён
									p:Remove()
									self.boxes[ i ] = 0
								end
							else
								self.boxes[i] = -1
								self.nCount = self.nCount + 1	-- собрано
							end
						end
					end
					
					PvE_Common:slog( "cnt="..cnt.." self.nCount="..self.nCount, 6, 100 )
					
					if cnt == 0 then
						--self.isComplete = true
						if PvE_Mission.aWaves[ curPhase + 1 ] then
							table.insert( PvE_Mission.aPhases[ curPhase + 1 ].PossibleEvents, "Desttown_Allie_Supressor" )
						end	
						return true
					end
					if self.nPhaseStart ~= PvE_Mission.nCurPhase then 
						self.isFailed = true
						return true
					end
					-- если их меньше ??? фэйлим эвент
				end, 
				
			fEnd	 = function ( self, container, dt, curPhase, event )
					local p, i
					PvE_Common:slog( "!!!================================= blow boxcount ".. #self.boxes )
					for i = 1, #self.boxes do
						p = Entities[ self.boxes[ i ] ]
						if self.boxes[ i ]>0 and p then
							PvE_Common:slog( "!!!================================= blow" )
							SV_Pve_EmitBlowEffect( p )
							p:Remove()
						end
					end
				end, -- не стандартные действия на окончание времени эвента
		},	

		[ "Desttown_Allie_Supressor" ] = { --Союзный эсминец на подмоге
			EventTargetDefs = { "Ship_Gen_Event_Friendly_Destroyer" },
			isEndFail	= false, -- !если время эвента вышло а союзник ещё жив - то считать выполненным
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cTextOnStart = "pve_gen_desttown_event_supressor_start",
			cCharacterOnStart = "pve_lang",
			cTextOnFailed = "pve_gen_desttown_event_supressor_fail",
			cCharacterOnFailedt = "pve_lang",
			cTextOnComplit = "pve_gen_desttown_event_supressor_complit",
			cCharacterOnComplitt = "pve_lang",
			reward   = 0.1,
			nCount	 = 0,	-- внутренняя переменная
			boss	= nil,
			
			fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы
							local i, pid, p

							local packDefs = PvE_Mission.aEvents[ "Desttown_Allie_Supressor" ].EventTargetDefs
							
							if not PvE_Mission.aEvents[ "Desttown_Allie_Supressor" ].boss then 
								local spawn = GetObjectByName( "Team1Group1" )
								local pos = spawn:GetPos()
								local dir = spawn:GetDir()
								p = designers:AddPack( packDefs, pos , 1, "pack " .. tostring ( 1 ) .." : ", dir )	
								PvE_Mission.aEvents[ "Desttown_Allie_Supressor" ].boss = p[ 1 ]

								return true
							end
								
						end,
			fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.boss and Entities[ self.boss ] then
								if Entities[ self.boss ]:IsDead() then
									self.isFailed = true -- союзник убит раньше окончания, провал эевента
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, event) end, -- не стандартные действия на окончание времени эвента
		},

		[ "Desttown_Defuse_bombs" ] = { --Разминирование бомб
			EventCounter = 0,	-- это универсальный прогресс эвента, при изменений этой переменной будет срабатывать UpdatePVEEvent( id, target_current )
			EventCounterMax = 7, -- это универсальный максимум для эвента (по умолчанию считаем 1)
			EventTargetDefs = { "LootCrate_Gen_PvE_Bombs" }, -- это дефы для подсветки
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= false,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cTextOnStart = "pve_gen_desttown_event_bombs_start",
			cCharacterOnStart = "umc_dispatch",
			cTextOnFailed = "pve_gen_desttown_event_bombs_fail",
			cCharacterOnFailed = "umc_dispatch",
			cTextOnComplit = "pve_gen_desttown_event_bombs_complit",
			cCharacterOnComplit = "umc_dispatch",
			nCount	 = 0,	-- внутренняя переменная
			boxes = {},
			precache_defs = { "LootCrate_Gen_PvE_Bombs" },
			reward = 0.1,	-- награда за выполнение, 10%
			fStart	 = function ( self, container, dt, curPhase, event )
			
							local p = math.random( #PvE_Mission.aRandomPoints )
		
							self.cPointName = PvE_Mission.aRandomPoints[ p ]
							
							PvE_Func:RemoveFromList( PvE_Mission.aRandomPoints, p )
							
							local point = GetObjectByName( self.cPointName )
							
							if point then
								local i, pid, box, pos, p
								pos = point:GetPos()
								for i = 1, 7 do
									box = ai.Spawn( "LootCrate_Gen_PvE_Bombs" )
									p = pos
									p.x = p.x + math.random( 30 ) - 15
									p.y = p.y + math.random( 30 ) - 15
									p.z = p.z + math.random( 30 ) - 15
									box:SetPos( p )
								end
								
								-- запоминаем расставленные ящики по id - для дальнейшего отслеживания.
								local entities = GetEntitiesByClass( "LootCrate" )
								for i,pid in pairs( entities ) do
									p = Entities[ pid ]
									if p:GetDefName() == "LootCrate_Gen_PvE_Bombs" then
										table.insert( self.boxes, pid )
										
										PvE_Mission.aAdditionalTargetId = {}
										
										for j = 1, #entities do
											PvE_Mission.aAdditionalTargetId[ j ] = pid
										end											
										
									end
								end
							else
								PvE_Common:slog( "!!!================================= Error RandomEvent Box not found point" )
							end
							return true
						end, -- не стандартные действия при запуске эвента
						
			fUpdate	 = function ( self, container, dt, curPhase, event ) -- проверка выполнения/провала эвента
					-- считаем число оставшихся ящиков
					local i, pid, p
					local cnt = 0
					local deadcnt = 0
					for i = 1, #self.boxes do
						if self.boxes[ i ] <= 0 then
							deadcnt = deadcnt + 1
						else
							p = Entities[ self.boxes[ i ] ]
							if p then
								cnt = cnt + 1
							else
								self.boxes[i] = -1
								self.nCount = self.nCount + 1	-- собрано
								self.EventCounter = self.EventCounter + 1
								if self.EventCounter >= self.EventCounterMax then
									self.EventCounter = self.EventCounterMax
									return true
								end
							end
						end
					end
					
					PvE_Common:slog( "cnt="..cnt.." self.nCount="..self.nCount, 5, 100 )
					
					if cnt == 0 then
						if self.nCount==0 then
							self.isFailed = true
						end
						return true
					end
				end,
				
			fEnd	 = function ( self, container, dt, curPhase, event )				
					local p, i
					PvE_Common:slog( "!!!================================= blow boxcount ".. #self.boxes )
					for i = 1, #self.boxes do
						p = Entities[ self.boxes[ i ] ]
						if self.boxes[ i ]>0 and p then	-- #83840 походу тут удялялись уже убранные ящики и это приводило к проблемам с физикой
							PvE_Common:slog( "!!!================================= blow" )
							SV_Pve_EmitBlowEffect(p)
							p:Remove()
						end
					end
				end, -- не стандартные действия на окончание времени эвента
		},		
	},	
}

--прекеш в миссию из контейнера с эвентами
function PvE_Func:PreparePrecache( container, name )
	local precache_defs = {}
	
	for cEvent, dEvent in pairs( container ) do	-- обычные эвенты тоже могут иметь precache_defs
		if dEvent.precache_defs then
			local i
			for i = 1, #dEvent.precache_defs do
				precache_defs[ #precache_defs + 1 ] = dEvent.precache_defs[ i ]
			end
		end
	end
	
	local mission = PvE_Missions[ name ]
	if #precache_defs > 0 then
		for i, precache_def in pairs( precache_defs ) do
			table.insert( mission.rounds[ 1 ].precache_defs, precache_def )
		end	
	end	
end	
	
--инициализация миссии	
function PvE_Func:InitMission()
	DialogsUpdate = {}
	PvE_Func:Inherit( PvE_Mission.aPhases )
end

--прописывание дефолтных значений в фазы
function PvE_Func:Inherit( phases )
	
	for key, phase in pairs( phases ) do
		for n, param in pairs( PvE_Phases.Standart[ phase.sRoundType ] ) do
			if phase[ n ] == nil then
				phase[ n ] = sys.new( param )
			end	
			if phase.tSwitchTable then
				PvE_Func:Inherit( phase.tSwitchTable )
			end
		end
	end
end

--замена одного объекта на другой
function PvE_Func:ReplaceObject( curPhase, sReplaceObject, newObject )

	local obj = GetObjectByName( sReplaceObject )
	local oldDef = {}
	oldDef[ 1 ] = obj:GetDefName()
	local pos = obj:GetPos()
	local rot = obj:GetRot()
	local dir = obj:GetDir()
	
	if type( newObject ) == "string" then
		newObject = { newObject }
	end
	
	obj:Remove()
	local newBay = ai.Spawn( newObject[ 1 ] )
	newBay:SetPos( pos )
	newBay:SetRot( rot )	
	local defName = newBay:GetDefName()
	PvE_Mission.aPhases[ curPhase ].pos = pos
	PvE_Mission.aPhases[ curPhase ].rot = rot
	PvE_Mission.aPhases[ curPhase ].dir = dir
	local id = newBay:GetId()
	local name = newBay:GetName()
	return id, name, defName, oldDef
		
end

--действие на старте миссии
function PvE_Mission:OnStart()

	if not PvE_Mission.aPhases then
		PvE_Mission.aPhases = {}
	end

	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450
	
	AID:OnStart()
	
	AID:Init()
end

--апдейт фаз
function PvE_Func:OnUpdate( dt )

	PvE_Mission.nPvETimer = PvE_Mission.nPvETimer + dt

	--AID:EventUpdate( PvE_Mission.aEvents, dt, PvE_Mission.nCurPhase )
	AID:EventUpdate( eventContainer, dt, PvE_Mission.nCurPhase )
	
	AID:Update( dt )
	
	local result = PvE_Func:PhaseUpdater( dt, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ] )
	
	if result == true then
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result == nil then
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result = true
		end	
		if PvE_Func:PhasesSelector() == true then
			return 1, ai.WinReason.PVE_MISSION_COMPLETE	
		end	
	elseif result == false then
		if ( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tSwitchTable ) and ( #PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tSwitchTable > 0 ) then
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result = false
			PvE_Func:SwitchPhases( PvE_Mission.nCurPhase )
		else
			return 2, ai.WinReason.PVE_MISSION_COMPLETE	
		end	
		if PvE_Func:PhasesSelector() == true then
			return 1, ai.WinReason.PVE_MISSION_COMPLETE	
		end	
	else
	end

	if DialogsUpdate[ 1 ] then
		if not DialogsUpdate[ 1 ][ 1 ] then
			sys.log( "DialogsUpdate[ 1 ][ 1 ] is not working" )
		end
		if not DialogsUpdate[ 1 ][ 3 ] then
			sys.log( "DialogsUpdate[ 1 ][ 3 ] is not working" )
		end
		DialogsUpdate[ 1 ][ 1 ] = DialogsUpdate[ 1 ][ 1 ] - dt
		if DialogsUpdate[ 1 ][ 1 ] <= 0  then
			local sound = DialogsUpdate[ 1 ][ 4 ] or nil
			local text_id = DialogsUpdate[ 1 ][ 3 ]
			local time_show = DialogsUpdate[ 1 ][ 5 ] or 10
			SV_ShowDialogScript( -1, PvE_Character[ DialogsUpdate[ 1 ][ 2 ]  ][ 1 ], PvE_Character[ DialogsUpdate[ 1 ][ 2 ] ][ 2 ], text_id, time_show, sound )
			table.remove( DialogsUpdate, 1 )
		end
	end
	
end

--контейнер-апдейтер фаз
function PvE_Func:PhaseUpdater( dt, curPhase )
end

--замена фаз
function PvE_Func:SwitchPhases( curPhase )

	if type( PvE_Mission.aPhases[ curPhase ].switchNPhase ) == "table" then
		local j = curPhase + 1
		local k = #PvE_Mission.aPhases
		for j = curPhase + 1, k do
			PvE_Mission.aPhases[ j ] = nil
		end
		
		local i = 1
		for firstPhase, endPhase in pairs( PvE_Mission.aPhases[ curPhase ].switchNPhase ) do 
			PvE_Mission.aPhases[ endPhase ] = {}
			PvE_Mission.aPhases[ endPhase ] = PvE_Mission.aPhases[ curPhase ].tSwitchTable[ i ]
			i = i + 1
		end
	end
	if type( PvE_Mission.aPhases[ curPhase ].switchNPhase ) == "number" then
		PvE_Mission.aPhases[ PvE_Mission.aPhases[ curPhase ].switchNPhase ] = PvE_Mission.aPhases[ curPhase ].tSwitchTable
	end

end

--инициализируем новую фазу и ее апдейт
function PvE_Func:PhasesSelector()
	if PvE_Mission.aPhases[ PvE_Mission.nCurPhase + 1 ] ~= nil then
	
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ] then
			if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].additionalFunc then
				PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].additionalFunc:Func( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ] )
			end
		end
		
		PvE_Mission.nCurPhase = PvE_Mission.nCurPhase + 1 
		
		PvE_Mission.functions[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].sRoundType ]:fInit( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ] )
		
		PvE_Func.PhaseUpdater = PvE_Mission.functions[ PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].sRoundType ].fUpdate
		
		SV_Pve_StartPhase( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].nRoundPhase )

		local nTimer = -10
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart then
			if next( DialogsUpdate ) then 
				nTimer = DialogsUpdate[ #DialogsUpdate ][ 5 ] or 10
			elseif currentTimerDialog then
				nTimer = math.ceil( currentTimerDialog )
			end
			for i, j in ipairs( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart ) do 
				local newDialog = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart[ i ]
				if nTimer > PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart[ i ][ 1 ] then			
					newDialog[ 1 ] = nTimer
				end
				nTimer = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart[ i ][ 5 ] or 10
				table.insert( DialogsUpdate, PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].DialogsOnStart[ i ] )
			end	
		end		
		
	else
		return true
	end
end

--удаление бомбы с корабля игрока
function PvE_Func:RemoveBomb( shipId )
	if Entities[ shipId ] then
		local bombNetId = PvE_Mission.aSapperPlayers[ shipId ][ 3 ]
		local bomb = ai.GetNetworkEntity( bombNetId )
		if bomb and bomb:GetParent() == Entities[ PvE_Mission.aSapperPlayers[ shipId ][ 1 ] ] then
			Entities[ shipId ]:RemoveChild( bomb )
			bomb:Remove()
		end
	end
	PvE_Mission.aSapperPlayers[ shipId ] = nil
end

--деактивация триггера 
function PvE_Func:DeactivateTriggers( trigArray )
	for i, trig in pairs( trigArray ) do
		if Entities[ trig ]:IsActive() == true then
			Entities[ trig ]:Deactivate()
		end							
	end
end

--колбек на смерть моба
function MobOnDeath( botId, pos )

end

--инициализация фаз по раундам
function PvE_Func:RoundsInit( name )	

	local mission = PvE_Missions[ name ]
	PvE_Mission.aPhases = {}
	local rounds = #mission.rounds
	PvE_Func:PreparePhases( rounds )
end

--подготовка фаз для раундов
function PvE_Func:PreparePhases( rounds )
	for i = 1, rounds do
		PvE_Mission.aPhases[ i ] = {}
		PvE_Mission.aPhases[ i ].sRoundType = "custom"		
		PvE_Mission.aPhases[ i ].nRoundPhase = i
	end
end

function PvE_Func:FindSpawns( String )
	local Table = {}
	for i, v in pairs( GetEntitiesByClass( "TagPoint" ) ) do
		local tp = Entities[ v ]
		if tp and string.match( tp:GetName(), String ) then 
			table.insert( Table, { entityId = v, pos = tp:GetPos() } )
		end
	end
	return Table
end

--ищем в массиве наличие элемента
function PvE_Func:FindValue( array, key )
	
	for n, m in ipairs( array ) do
		if m == key then
			return true
		end
	end
	return false
end