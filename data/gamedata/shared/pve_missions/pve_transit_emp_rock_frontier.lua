lua_debug = false

PvE_Emp_Frontier = {}

PvE_Container2 = 
{
	aPhases = {  
		[ 1 ] = 
			{ 
				sRoundType 	= "defense",
				bCountBar	= true,
				sTargetDef	= "PvE_Gen_Average_Turret2",
				nWoWMsgTimer= 30, 
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_tur_defense" },
				},
				timer		= 120,
				nRoundPhase	= 1,		
				additionalFunc = { 
					Func = function( self, curPhase )
						if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result == true then
							Entities[ "SpaceShield_Gen" ]:SetDamageable( true )
							Entities[ "SpaceShield_Gen" ]:ShowInHud( true )
						end	
				end,},
				switchNPhase= { 2, 3, 4, 5, 6, 7, 8 }, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "transport",	
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_dock_defense1" },
						},
						nRoundPhase	= 7,	
						bCountBar	= true,
						transport 	= { "Transport1", "Transport2", "Transport3", },
						sTargetDef 	= "CargoShip_Gen_Kamikaze", -- целевой деф, может быть враждебным и союзным
						bAvoidPrev	= true,
						EscapeToEnd	= 1,
						bEscapeResult= false, -- флаг на результат ухода транспорта
						bDeadResult	= true, -- флаг на результат смерти транспорта
						timer		= 20,
						tId			= nil,
						switchNPhase= { 3, 4, 5, 6 }, -- фазы под каким номером нужно заменить, в случае поражения
						tSwitchTable = -- таблица подменяемых фаз в случае поражения
						{
							{
								sRoundType 	= "vitals",
								bCountBar	= true,
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_vitals3" },
								},								
								sTargetDef	= "PvE_Gen_RadarStation2",
								count		= 3,
								nRoundPhase	= 8,	
								aDropTable	= {
									count	= 10, -- сколько объектов надо дропнуть
									dropDef	= "LootCrate_Gen_PvE_Mines", -- что надо дропнуть
								},	
								additionalFunc = { 
									Func = function( self, curPhase )
										if PvE_Mission.aPhases[ PvE_Mission.nCurPhase + 1 ].sRoundType == "mines" then
											local loot, p, pos, j
											pos = Entities[ "MinesSpawner1" ]:GetPos()
											j = curPhase.aDropTable.count
											for i = 1, j do
												loot = ai.Spawn( curPhase.aDropTable.dropDef )
												p = pos
												p.x = p.x + math.random( 30 ) - 15
												p.y = p.y + math.random( 10 )
												p.z = p.z + math.random( 30 ) - 15
												loot:SetPos( p )
											end	
										end
									end,
								},								
							},
							{
								sRoundType 	= "mines",
								bCountBar	= true,
								sTargetDef	= "PvE_Debrissite_Bomb",
								bombHolo	= "PvE_Debrissite_Bomb",
								mines		= "LootCrate_Gen_PvE_Mines",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_mines2" },
								},
								tTrigger	= "BombBuilderTrigger",		
								nRoundPhase	= 9,
							},
							{
								sRoundType 	= "transport",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_barque3" },
								},	
								nRoundPhase	= 10,
								transport 	= "Barque1",
								bHPBar 		= false,
								tSpeed		= 0.1, --целевая скорость транспортника
								nMaxSpeed	= 10,
								bEscapeResult= false, -- флаг на результат ухода транспорта
								bDeadResult	= true, -- флаг на результат смерти транспорта
								tId			= nil,
							},
							{
								sRoundType 	= "defense",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_survive3" },
								},
								bHPBar 		= false,
								sTargetDef	= "PvE_Gen_Allidium_Dread01",
								timer		= 180,
								nWoWMsgTimer= 30, 
								nRoundPhase	= 11,
								bRandomBoss = true,
								phaseId		= 3,
							},
						},
					},
					{
						sRoundType 	= "vitals",
						bCountBar	= true,
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_vitals2" },
						},					
						sTargetDef	= "PvE_Gen_RadarStation2",
						count		= 3,
						nRoundPhase	= 8,				
						additionalFunc = { 
							Func = function( self, curPhase )
							Entities[ "Empire1" ]:Stop()
							Entities[ "Empire2" ]:Stop()
							Entities[ "Empire3" ]:Stop()
						end,},
					},
					{
						sRoundType 	= "custom",
						timer		= 15,		
						nRoundPhase	= 5,				
						result		= false, 
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_mt_defense2" },
						},			
					},
					{ 
						sRoundType 	= "defense",
						bCountBar	= true,
						sTargetDef	= "PvE_Gen_Dreadnought_AllidiumMainTurret",
						nWoWMsgTimer= 30, 	
						timer		= 180,
						nRoundPhase	= 5,			
						switchNPhase= { 6, 7, 8, 9 }, -- фазы под каким номером нужно заменить, в случае поражения			
						additionalFunc = { 
							Func = function( self, curPhase )
							if Entities[ "Empire1" ] then
								Entities[ "Empire1" ]:Start()
							end	
							if Entities[ "Empire2" ] then
								Entities[ "Empire2" ]:Start()
							end	
							if Entities[ "Empire3" ] then
								Entities[ "Empire3" ]:Start()
							end
						end,},
						
						tSwitchTable = -- таблица подменяемых фаз в случае поражения
						{
							{
								sRoundType 	= "dreadnought",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_dread1" },
								},
								nRoundPhase	= 13,
								mainTurrets	= "PvE_Gen_Dreadnought_MainTurret",
								dreadName	= "Dred1",
								averageTurrets	= "PvE_Gen_Average_Turret1",
								finishPoint	= "Dread1_Finish",
								dreadtimer	= 10,
							},
							{ 
								sRoundType 	= "vitals", -- указываем тип фазы
								bCountBar	= true,
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_mt_gen_destroy2" },
								},
								nHeadTimer 	= 2,
								specificDef	= "PvE_Gen_DreadGen", -- целевой деф для уничтожения
								count		= 3, -- сколько объектов уничтожить нужно
								nRoundPhase	= 13, -- запуск конкретной фазы ПвЕ из кода				
								additionalFunc = { 
									Func = function( self, curPhase )
									
									local mainTurrets = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
									for i, turId in pairs( mainTurrets ) do
										Entities[ turId ]:Stop()
									end
									
								end,
								},
							},
							{
								sRoundType 	= "custom",
								timer		= 15,			
								nRoundPhase	= 13,	
								result		= false, 	
							},
							{ 
								sRoundType 	= "destroyer", -- указываем тип фазы
								bCountBar	= true,
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_mt_destroy2" },
								},
								nHeadTimer 	= 2,
								sTargetDef	= { "PvE_Gen_Dreadnought_MainTurret", }, -- целевой деф для уничтожения
								tCount		= 3, -- сколько объектов уничтожить нужно
								nRoundPhase	= 14, -- запуск конкретной фазы ПвЕ из кода
								phaseId		= 4,
							},						
						},
					},
					{
						sRoundType 	= "custom",
						timer		= 15,			
						nRoundPhase	= 3,	
						result		= false, 	
						additionalFunc = { 
							Func = function( self, curPhase )
							if Entities[ "Empire1" ] then
								Entities[ "Empire1" ]:Stop()
							end
							if Entities[ "Empire2" ] then							
								Entities[ "Empire2" ]:Stop()
							end
							if Entities[ "Empire3" ] then
								Entities[ "Empire3" ]:Stop()
							end
							
							Entities[ "SpaceShield1" ]:FullActivate( false )
							Entities[ "SpaceShield2" ]:FullActivate( false )
							Entities[ "SpaceShield3" ]:FullActivate( false )						
						end,},
					},
					{ 
						sRoundType 	= "destroyer",
						bCountBar	= true,	
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_shieldgen2" },
						},	
						sTargetDef	= { "PvE_Gen_EnergyStation", }, -- целевой деф для уничтожения
						tCount		= 3,
						nRoundPhase	= 3,
						timer		= 180,
						nWoWMsgTimer= 30, 
						switchNPhase= { 8, 9 }, -- фазы под каким номером нужно заменить, в случае поражения
						tSwitchTable = -- таблица подменяемых фаз в случае поражения
						{
							{
								sRoundType 	= "transport",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_barque2" },
								},					
								transport 	= "Barque1",
								nRoundPhase	= 10,
								bHPBar 		= false,
								tSpeed		= 0.1, --целевая скорость транспортника
								nMaxSpeed	= 10,
								bEscapeResult= false, -- флаг на результат ухода транспорта
								bDeadResult	= true, -- флаг на результат смерти транспорта
								tId			= nil,
							},
							{
								sRoundType 	= "defense",
								bHPBar 		= false,
								sTargetDef	= "PvE_Gen_Allidium_Dread01",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_survive2" },
								},							
								timer		= 180,
								nWoWMsgTimer= 30, 
								nRoundPhase	= 11,
								bRandomBoss = true,
								phaseId		= 5,
							},
						},
					},
					{ 
						sRoundType 	= "destroyer", -- указываем тип фазы
						bCountBar	= true,
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_suppressor2" },
						},
						nHeadTimer 	= 2,
						sTargetDef	= { "PvE_Gen_EnergyField", }, -- целевой деф для уничтожения
						tCount		= 4, -- сколько объектов уничтожить нужно
						nRoundPhase	= 6, -- запуск конкретной фазы ПвЕ из кода
						phaseId		= 2,
					},
				},	
			},
		[ 2 ] = 
			{
				sRoundType 	= "flag",
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_flag1" },
				},
				sTargetDef	= "PvE_Gen_BeamParentEntity_1",
				shadow 		= "PvE_Gen_StationShadow",
				nRoundPhase	= 2,
				timer 		= 999999,
				additionalFunc = { 
					Func = function( self, curPhase )
					
					local mainTurrets = GetEntitiesByDef( "PvE_Gen_Dreadnought_AllidiumMainTurret" )
					for i, turId in pairs( mainTurrets ) do
						Entities[ turId ]:Stop()
					end
					
					local parent = Entities[ curPhase.tId[ 1 ] ]
					local pos = parent:GetPos()
					
					Entities[ "SpaceShield1" ]:FullActivate( false )
					Entities[ "SpaceShield2" ]:FullActivate( false )
					Entities[ "SpaceShield3" ]:FullActivate( false )
					
				end,
				},
			},
		[ 3 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_shieldgen1" },
				},
				sTargetDef	= { "PvE_Gen_EnergyStation", }, -- целевой деф для уничтожения
				tCount		= 3,
				nRoundPhase	= 3,
				timer		= 120,
				nWoWMsgTimer= 30, 
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "SpaceShield_Gen1" ]:SetDamageable( true )
						Entities[ "SpaceShield_Gen1" ]:ShowInHud( true )
				end,},
				switchNPhase= { 4, 5, 6 }, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "transport",
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_dock_defense2" },
						},
						nRoundPhase	= 7,
						bCountBar	= true,
						transport 	= { "Transport1", "Transport2", "Transport3", },
						sTargetDef 	= "CargoShip_Gen_Kamikaze", -- целевой деф, может быть враждебным и союзным
						bAvoidPrev	= true,
						EscapeToEnd	= 1,
						bEscapeResult= false, -- флаг на результат ухода транспорта
						bDeadResult	= true, -- флаг на результат смерти транспорта
						timer		= 10,
						tId			= nil,		
						aDropTable	= {
							count	= 10, -- сколько объектов надо дропнуть
							dropDef	= "LootCrate_Gen_PvE_Mines", -- что надо дропнуть
						},		
						additionalFunc = { 
							Func = function( self, curPhase )
								if PvE_Mission.aPhases[ PvE_Mission.nCurPhase + 1 ].sRoundType == "mines" then
									local loot, p, pos, j
									pos = Entities[ "MinesSpawner1" ]:GetPos()
									j = curPhase.aDropTable.count
									for i = 1, j do
										loot = ai.Spawn( curPhase.aDropTable.dropDef )
										p = pos
										p.x = p.x + math.random( 30 ) - 15
										p.y = p.y + math.random( 10 )
										p.z = p.z + math.random( 30 ) - 15
										loot:SetPos( p )
									end	
								end
							end,
						},
						switchNPhase= { 5, 6, 7 }, -- фазы под каким номером нужно заменить, в случае поражения
						tSwitchTable = -- таблица подменяемых фаз в случае поражения
						{
							{
								sRoundType 	= "transport",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_barque1" },
								},
								nRoundPhase	= 10,
								transport 	= "Barque1",
								bHPBar 		= false,
								tSpeed		= 0.1, --целевая скорость транспортника
								nMaxSpeed	= 10,
								bEscapeResult= false, -- флаг на результат ухода транспорта
								bDeadResult	= true, -- флаг на результат смерти транспорта
								tId			= nil,
							},
							{
								sRoundType 	= "defense",
								bHPBar 		= false,
								sTargetDef	= "PvE_Gen_Allidium_Dread01",
								DialogsOnStart = {	
									{ 1, "irodr", "pve_gen_empfrontier_survive1" },
								},							
								timer		= 180,
								nWoWMsgTimer= 30, 
								nRoundPhase	= 11,
								bRandomBoss = true,
								phaseId		= 7,
							},
						},
					},
					{
						sRoundType 	= "mines",
						bCountBar	= true,						
						sTargetDef	= "PvE_Debrissite_Bomb",
						bombHolo	= "PvE_Debrissite_Bomb",
						mines		= "LootCrate_Gen_PvE_Mines",
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_mines1" },
						},
						tTrigger	= "BombBuilderTrigger",		
						nRoundPhase	= 9,
					},
					{
						sRoundType 	= "vitals",
						bCountBar	= true,
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_vitals1" },
						},
						sTargetDef	= "PvE_Gen_RadarStation2",
						count		= 3,
						nRoundPhase	= 8,
						phaseId		= 8,
					},
				},	
			},
		[ 4 ] = 
			{
				sRoundType 	= "flag",
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_flag2" },
				},
				sTargetDef	= "PvE_Gen_BeamParentEntity_2",
				nRoundPhase	= 4,
				timer 		= 999999,
				additionalFunc = { 
					Func = function( self, curPhase )
					local parent = Entities[ curPhase.tId[ 1 ] ]
					local pos = parent:GetPos()
					
					local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_AllidiumMainTurret" )
					for i, turret in pairs( mainTur ) do
						Entities[ turret ]:SetDamageable( true )
					end	
				end,
				}
			},
		[ 5 ] = 			
			{
				sRoundType 	= "custom",
				timer		= 15,			
				nRoundPhase	= 5,		
				result		= false, 
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_mt_defense1" },
				},
				nHeadTimer 	= 1, -- время в секундах до запуска говорящей головы
			},
		[ 6 ] = 
			{ 
				sRoundType 	= "defense",
				sTargetDef	= "PvE_Gen_Dreadnought_AllidiumMainTurret",
				bCountBar	= true,
				nWoWMsgTimer= 30, 	
				nHeadTimer 	= 60000, -- время в секундах до запуска говорящей головы
				timer		= 180,
				nRoundPhase	= 5,
				switchNPhase= { 7, 8, 9, 10 }, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "dreadnought",
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_dread1" },
						},
						nRoundPhase	= 13,
						mainTurrets	= "PvE_Gen_Dreadnought_MainTurret",
						dreadName	= "Dred1",
						averageTurrets	= "PvE_Gen_Average_Turret1",
						finishPoint	= "Dread1_Finish",
						dreadtimer	= 10,
					},
					{ 
						sRoundType 	= "vitals", -- указываем тип фазы
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_mt_gen_destroy1" },
						},
						bCountBar	= true,
						nHeadTimer 	= 2,
						specificDef	= "PvE_Gen_DreadGen", -- целевой деф для уничтожения
						dreadName	= "Dred1",
						count		= 3, -- сколько объектов уничтожить нужно
						nRoundPhase	= 13, -- запуск конкретной фазы ПвЕ из кода				
						additionalFunc = { 
							Func = function( self, curPhase )
							
							local mainTurrets = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
							for i, turId in pairs( mainTurrets ) do
								Entities[ turId ]:Stop()
							end
							
						end,
						},
					},
					{
						sRoundType 	= "custom",
						timer		= 15,			
						nRoundPhase	= 13,		
						result		= false, 
					},
					{ 
						sRoundType 	= "destroyer", -- указываем тип фазы
						bCountBar	= true,
						DialogsOnStart = {	
							{ 1, "irodr", "pve_gen_empfrontier_mt_destroy1" },
						},
						nHeadTimer 	= 2,
						sTargetDef	= { "PvE_Gen_Dreadnought_MainTurret", }, -- целевой деф для уничтожения
						tCount		= 3, -- сколько объектов уничтожить нужно
						nRoundPhase	= 14, -- запуск конкретной фазы ПвЕ из кода
						phaseId		= 8,
					},
				},
			},
		[ 7 ] = 	
			{ 
				sRoundType 	= "destroyer", -- указываем тип фазы
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "irodr", "pve_gen_empfrontier_suppressor1" },
				},
				nHeadTimer 	= 2,
				sTargetDef	= { "PvE_Gen_EnergyField", }, -- целевой деф для уничтожения
				tCount		= 4, -- сколько объектов уничтожить нужно
				nRoundPhase	= 6, -- запуск конкретной фазы ПвЕ из кода
				phaseId		= 1,
			},
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {},
	
}

PvE_Emp_Frontier.aWaves = {}

PvE_Emp_Frontier.aWaves.easy = 
{
	[ 1 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= {},	
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },		
			},

	[ 2 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 3 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= {  "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 4 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 5 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				BossBots	= { "Ship_Gen_Easy_Boss_Federation_Destroyer", "Ship_Gen_Easy_Boss_Predator" },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 6 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 7 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 8 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 9 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S", "Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" },	
			},
}

PvE_Emp_Frontier.aWaves.hard = 
{
	[ 1 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Bot_Wave_Rocket_T5" },				
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},

	[ 2 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 3 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 4 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 5 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				BossBots	= { "Ship_Gen_Boss_Federation_Destroyer", "Ship_Gen_Boss_Predator" },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 6 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 7 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 8 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
	[ 9 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_Pirate_S", "Ship_Gen_Meat_Pirate_M", "Ship_Gen_Meat_Pirate_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Pirate_Heal_L", "Ship_Gen_Meat_Pirate_Guard_L", "Ship_Gen_Meat_Pirate_Saboteur_S", "Ship_Gen_Meat_Pirate_Silence_S", "Ship_Gen_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Meat_Pirate_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Pirate_Command_Sniper_M", "Ship_Gen_Elite_Pirate_Atacker_Angry_M", "Ship_Gen_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Elite_Pirate_EMC_Chameleon_S", "Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Elite_Pirate_Recon_S", "Ship_Gen_Elite_Pirate_Guard_Hook_L", "Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Elite_Pirate_Hiller_L", },
				Executor	= { "Ship_Gen_Elite_Pirate_Saboteur_Executor" },	
			},
}

PvE_Mission.buildConteiner = 
{

	[ "BombBuilderTrigger1" ] = "BombBuild1",
	[ "BombBuilderTrigger2" ] = "BombBuild2",
	[ "BombBuilderTrigger3" ] = "BombBuild3",
	[ "BombBuilderTrigger4" ] = "BombBuild4",
	
}

PvE_Mission.aMissions = 
{	
	[ 1 ] = "pve_empfrontier_waves_T5",
	[ 2 ] = "pve_empfrontier_waves_T1",
}

PvE_Missions.pve_empfrontier_waves_T5 = 
{	
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	
	levelName = "pve_transit_emp_rock_frontier",
	scenario_description = { "pve_empfrontier_waves_str1", "pve_empfrontier_waves_str2", "pve_empfrontier_waves_str3" },
	need_spawn_warp = true,
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",

	desc = "",
	resurrection_attempts = 2,
	item_lvl = 30, -- параметр для начисления награды.
	accountRank = 12,
	rank  = PvE_breckets.med[1],  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	difficulty = "hard",		
	
	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn1",
			route = "TroopersPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport2",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn2",
			route = "TroopersPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn2",
			route = "TroopersPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Barque1",
	 		relationship_group = 2,
			spawn_spot = "Barque_spawn1",
			route = "BarquePath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_wave_HugeCargo_T5", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "MobileSpawn",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_PvE_Mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, -20, -20 ) },
				},
			},			
		},	
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Gen_Meat_Pirate_S", 
				"Ship_Gen_Meat_Pirate_M", 
				"Ship_Gen_Meat_Pirate_L",
				"Ship_Gen_Meat_Pirate_Heal_L", 
				"Ship_Gen_Meat_Pirate_Guard_L", 
				"Ship_Gen_Meat_Pirate_Saboteur_S", 
				"Ship_Gen_Meat_Pirate_Silence_S", 
				"Ship_Gen_Meat_Pirate_Command_Attacker_M", 
				"Ship_Gen_Meat_Pirate_Tackler_M",			
				"Ship_Gen_Elite_Pirate_Command_Sniper_M", 
				"Ship_Gen_Elite_Pirate_Atacker_Angry_M", 
				"Ship_Gen_Elite_Pirate_Tackler_Invisible_M", 
				"Ship_Gen_Elite_Pirate_EMC_Chameleon_S", 
				"Ship_Gen_Elite_Pirate_Saboteur_Bomb_S", 
				"Ship_Gen_Elite_Pirate_Recon_S", 
				"Ship_Gen_Elite_Pirate_Guard_Hook_L", 
				"Ship_Gen_Elite_Pirate_Sniper_Chameleon_L", 
				"Ship_Gen_Elite_Pirate_Hiller_L",
				"Ship_Gen_Elite_Pirate_Saboteur_Executor",	
				"Bot_Wave_Rocket_T5",
				"PvE_Gen_RadarStation2",
				"PvE_Debrissite_Bomb",
				"PvE_Gen_EnergyStation",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"BtB_Bomb",
				"Ship_Gen_Boss_Predator",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8,
			loot_attempts_reward = 3,
			player_spawn_group = 1,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_GEN_PVE_DREAD_DEFENSE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 9999, }, 
				},
			},
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
				[ 5 ] = {},	
				[ 6 ] = {},	
				[ 7 ] = {},	
				[ 8 ] = {},	
				[ 9 ] = {},	
				[ 10 ] = {},	
				[ 11 ] = {},	
				[ 12 ] = {},	
				[ 13 ] = {},	
				[ 14 ] = {},	
            },
		},	
	},
}

PvE_Missions.pve_empfrontier_waves_T1 = 
{	
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	event_loot_attempts = 3,
	
	levelName = "pve_transit_emp_rock_frontier",
	scenario_description = { "pve_empfrontier_waves_str1", "pve_empfrontier_waves_str2", "pve_empfrontier_waves_str3" },
	need_spawn_warp = true,
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",	

	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 8,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	difficulty = "easy",

	turret_health_coef = 0.6,
	turret_damage_coef = 0.8,	
	
	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn1",
			route = "TroopersPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport2",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn2",
			route = "TroopersPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn2",
			route = "TroopersPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Barque1",
	 		relationship_group = 2,
			spawn_spot = "Barque_spawn1",
			route = "BarquePath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_wave_HugeCargo_T1", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "MobileSpawn",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_PvE_Mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, -20, -20 ) },
				},
			},			
		},		
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Gen_Easy_Meat_Pirate_S", 
				"Ship_Gen_Easy_Meat_Pirate_M", 
				"Ship_Gen_Easy_Meat_Pirate_L",
				"Ship_Gen_Easy_Meat_Pirate_Heal_L", 
				"Ship_Gen_Easy_Meat_Pirate_Guard_L", 
				"Ship_Gen_Easy_Meat_Pirate_Saboteur_S", 
				"Ship_Gen_Easy_Meat_Pirate_Silence_S", 
				"Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", 
				"Ship_Gen_Easy_Meat_Pirate_Tackler_M",				
				"Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", 
				"Ship_Gen_Easy_Elite_Pirate_Atacker_Angry_M", 
				"Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", 
				"Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S", 
				"Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", 
				"Ship_Gen_Easy_Elite_Pirate_Recon_S", 
				"Ship_Gen_Easy_Elite_Pirate_Guard_Hook_L", 
				"Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", 
				"Ship_Gen_Easy_Elite_Pirate_Hiller_L",
				"Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor",
				"PvE_Gen_RadarStation2",
				"PvE_Debrissite_Bomb",
				"PvE_Gen_EnergyStation",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"BtB_Bomb",
				"Ship_Gen_Boss_Predator",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8,
			loot_attempts_reward = 4,
			player_spawn_group = 1,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_GEN_PVE_DREAD_DEFENSE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 9999, }, 
				},
			},
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
				[ 5 ] = {},	
				[ 6 ] = {},	
				[ 7 ] = {},	
				[ 8 ] = {},	
				[ 9 ] = {},	
				[ 10 ] = {},	
				[ 11 ] = {},	
				[ 12 ] = {},	
				[ 13 ] = {},	
				[ 14 ] = {},	
            },
		},	
	},
}

PvE_Missions.pve_empfrontier_waves_T5.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_Func:OnUpdate( dt )
end

PvE_Missions.pve_empfrontier_waves_T1.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	
	return PvE_Func:OnUpdate( dt )
end
	
function PvE_Emp_Frontier:OnStart()
	
	PvE_Mission.nVitalsTotal = 5
	
	PvE_Mission.vitals = GetEntitiesByDef( "PvE_Gen_Station" )
	
	AID.portals = false
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
	
	objArray = {}
	
	local beam1 = GetObjectByName( "BeamParentEntity1" )
	beam1:FullActivate( false )
	PvE_Mission.aPhases[ 2 ].shadow = GetObjectByName( "BeamParentEntity1_shadow" ):GetId()
	
	local beam2 = GetObjectByName( "BeamParentEntity2" )
	beam2:FullActivate( false )
	PvE_Mission.aPhases[ 4 ].shadow = GetObjectByName( "BeamParentEntity2_shadow" ):GetId()
	
	local eGen = GetEntitiesByDef( "PvE_Gen_EnergyStation" )
	for i, eGenId in ipairs( eGen )do
		Entities[ eGenId ]:ShowInHud( false )
	end
	
	local shieldsId = GetEntitiesByDef( "PvE_Gen_SpaceShield" )
	
	for i, shieldId in ipairs( shieldsId )do
		Entities[ shieldId ]:SetDamageable( false )
	end	
	
	Entities[ "SpaceShield_Gen" ]:SetDamageable( false )
	Entities[ "SpaceShield_Gen1" ]:SetDamageable( false )
	Entities[ "SpaceShield_Gen" ]:ShowInHud( false )
	Entities[ "SpaceShield_Gen1" ]:ShowInHud( false )
	
	local fieldsId = GetEntitiesByDef( "PvE_Gen_EnergyField" )
	
	for i, fieldId in ipairs( fieldsId )do
		Entities[ fieldId ]:SetDamageable( false )
		Entities[ fieldId ]:ShowInHud( false )
	end
	
	local mainTurs = GetEntitiesByDef( "PvE_Gen_Dreadnought_AllidiumMainTurret" )
	
	for i, mainTur in ipairs( mainTurs )do
		Entities[ mainTur ]:SetDamageable( false )
		Entities[ mainTur ]:ShowInHud( false )
	end

	for i = 1, PvE_Mission.nVitalsTotal do
		local distMin = 50000 + i * 1000
		local distMax = 225000 + i * 1500
		local vital = PvE_Func:RandomFromList( PvE_Func:GetInRange( PvE_Mission.vitals, closestPos, distMin, distMax) )
		if not vital then
			for j = 1, 20 do	
				local distMin = 50000 + i * 1000
				local distMax = 225000 + ( j * i * 1500 )
				vital = PvE_Func:RandomFromList( PvE_Func:GetInRange( PvE_Mission.vitals, closestPos, distMin, distMax) )
				
				if vital then 
					break 
				end
			end	
		end	
		
		if vital then 
		else
			vital = PvE_Func:RandomFromList( PvE_Mission.vitals )
		end
		PvE_Mission.aVitalsInGame[ i ] = {}
		PvE_Mission.aVitalsInGame[ i ].id = vital
		PvE_Mission.aVitalsInGame[ i ].pos = Entities[ vital ]:GetPos()
		local vitalName = Entities[ vital ]:GetName()
		local newVitalName = vitalName.."_shadow"
		PvE_Mission.aVitalsInGame[ i ].shadow = GetObjectByName( newVitalName ):GetId()
		PvE_Func:RemoveFromList( PvE_Mission.vitals, vital )
		closestPos = PvE_Mission.aVitalsInGame[ i ].pos
		Entities[ vital ]:FullActivate( false )
	end
	
	for i, vital in pairs( PvE_Mission.vitals ) do
		local vitalName = Entities[ vital ]:GetName()
		local newVitalName = vitalName.."_shadow"
		Entities[ newVitalName ]:Remove()
		Entities[ vital ]:Remove()
	end
	
	PvE_Mission.dread = GetObjectByName( "Dred1" )
	PvE_Mission.dread:FullActivate( false )

	local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
	for i, main in ipairs( mainTur ) do
		Entities[ main ]:Stop()
		Entities[ main ]:SetDamageable( false )
		Entities[ main ]:ShowInHud( false )
		Entities[ main ]:FullActivate( false )
		local netId = Entities[ main ]:GetNetworkId()
		table.insert( objArray, netId )
	end
	
	local averTur = GetEntitiesByDef( "PvE_Gen_Average_Turret1" )
	for i, aver in ipairs( averTur ) do
		Entities[ aver ]:FullActivate( false )
	end

	
	local mineTriggers = {}
	local mineTrigger
	for i = 1, 4 do
		mineTrigger = GetObjectByName( "BombBuilderTrigger"..i )
		mineTriggers[ i ] = mineTrigger:GetId()
	end	
	
	PvE_Mission.aPhases[ 3 ].tSwitchTable[ 2 ].trsId = mineTriggers
	PvE_Mission.aPhases[ 1 ].tSwitchTable[ 1 ].tSwitchTable[ 2 ].trsId = mineTriggers
	
	if next( mineTriggers ) then
		for i, tId in ipairs( mineTriggers ) do
			Entities[ tId ]:Deactivate()
		end
	end		
	local mines = GetEntitiesByDef( "PvE_Debrissite_Bomb" )
	if next( mines ) then
		for i, mine in ipairs( mines ) do
			Entities[ mine ]:FullActivate( false )
		end
	end	
	
end

PvE_Missions.pve_empfrontier_waves_T5.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_empfrontier_waves_T5.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end

PvE_Missions.pve_empfrontier_waves_T1.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_empfrontier_waves_T1.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end