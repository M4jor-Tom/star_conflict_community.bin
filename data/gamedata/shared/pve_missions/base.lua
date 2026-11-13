-- константы для настройки диапозонов ПвЕ, и пресет ботов
PvE_breckets = {
	low = {3, 5, "Easy",},
	med = {6, 10, "Medium",},
	hi = {11, 17, "Hard",},
}

PvE_MissionsId = {
	[ "pve_desttown_waves_hard" ] = 1,
	[ "pve_desttown_waves_easy" ] = 2,
	[ "pve_empfrontier_waves_T5" ] = 3,
}

-- 
PvE_Missions = {}
PvE_Func = {}

PvE_Character = {

	[ "irodr" ] = { "quest_character_pve_irodr_medium", "quest_character_pve_irodr_name_short" },
	[ "mercenary" ] = { "quest_character_mercenary_medium", "quest_character_mercenary_name_short" },
	[ "eventgirl" ] = { "quest_character_eventgirl_medium", "quest_character_eventgirl_name_short" },
	[ "pve_briggs" ] = { "quest_character_pve_briggs_medium", "quest_character_pve_briggs_name_short" },
	[ "ellidium_girl" ] = { "quest_character_ellidium_girl_medium", "quest_character_ellidium_girl_name_short" },
	[ "sch_jackson" ] = { "quest_character_jackson_medium", "quest_character_jackson_name_short" },
	[ "broker" ] = { "quest_character_broker_medium", "quest_character_broker_name_short" },
	[ "pve_lang" ] = { "quest_character_pve_lang_medium", "quest_character_pve_lang_name_short" },
	[ "umc_dispatch" ] = { "quest_character_umc_dispatch_medium", "quest_character_umc_dispatch_name_short" },
	[ "emp_captain" ] = { "quest_character_emp_captain_medium", "quest_character_emp_captain_name_short" },
	[ "jer_major" ] = { "quest_character_jer_major_medium", "quest_character_jer_major_name_short" },
	[ "jer_engineer" ] = { "quest_character_jer_engineer_medium", "quest_character_jer_engineer_name_short" },
	[ "fed_major" ] = { "quest_character_fed_major_medium", "quest_character_fed_major_name_short" },
	[ "fed_engineer" ] = { "quest_character_fed_engineer_medium", "quest_character_fed_engineer" },
	[ "sch_admiral" ] = { "quest_character_evil_admiral_medium", "quest_character_evil_admiral_name_short" },
	[ "sch_kate" ] = { "quest_character_kate_medium", "quest_character_kate_name_short" },
	[ "sch_tana" ] = { "quest_character_tana_medium", "quest_character_tana_name_short" },
	[ "pilot1" ] = { "", "" },
	[ "le_vasseur" ] = { "quest_character_le_vasseur_medium", "quest_character_le_vasseur_name_short" },
	[ "philip_k_dry" ] = { "quest_character_default_medium", "quest_character_philip_k_dry_name_short" },
	[ "spike_beagle" ] = { "quest_character_default_medium", "quest_character_spike_beagle_name_short" },
	[ "peter_keel" ] = { "quest_character_default_medium", "quest_character_peter_keel_name_short" },
	[ "fed_captain" ] = { "quest_character_fed_captain_medium", "quest_character_fed_captain_name_short" },
	[ "Coordinator" ] = { "quest_character_sch_jerico_medium", "quest_character_sch_jerico" },
	[ "Jer_Voice" ] = { "quest_character_default_medium", "quest_character_jer_voice_name_short" },
	[ "contractor" ] = { "quest_character_default_medium", "quest_character_contractor_name_short" },
	[ "trashmaster" ] = { "quest_character_default_medium", "quest_character_trashmaster_name_short" },
	[ "pirate_agent" ] = { "quest_character_pirate_agent_medium", "quest_character_pirate_agent_name_short" },
	
	
}

-----------------------------------------------------------------------------------------------------------

function GetObjectByName(cName)
	local aclass = {"LootCrate", "BaseEntity", "ScBaseEntity", "Turret", "TagPoint", "AnimatedEntity", "WarpGate", "PathObject", "CargoShip", "SpaceShip", "UfoShip"}
	local j, i, pid, p
	for j = 1, #aclass do
		for i, pid in pairs( GetEntitiesByClass( aclass[j] ) ) do
			p = Entities[pid]
			if p and p:GetName() == cName then
				return p, pid
			end
		end
	end
end

function GetEntityIdByDefName(cDefName)
	local aclass = {"LootCrate", "BaseEntity", "ScBaseEntity", "Turret", "TagPoint", "AnimatedEntity", "WarpGate", "PathObject", "CargoShip", "SpaceShip", "UfoShip"}
	local j, i, pid, p
	for j = 1, #aclass do
		for i, pid in pairs( GetEntitiesByClass( aclass[j] ) ) do
			p = Entities[pid]
			if p and p:GetDefName() == cDefName then
				return pid
			end
		end
	end
end

function GetAllTagPointsByName( prefix )
	local aclass = { "TagPoint", }
	local j, i, pid, p
	local res = {}
	for j = 1, #aclass do
		for i, pid in pairs( GetEntitiesByClass( aclass[ j ] ) ) do
			local name = prefix..i
			if Entities[ name ] then
				table.insert( res, name )
			end
		end
	end
	return res
end

--Функция возвращает имя самого ближнего объекта из списка list, находящегося рядом с pos
function GetClosest( list, pos )
	if not list or not pos then return end

	local closestObject, closestDist
	for _, name in ipairs( list ) do
		local entity = Entities[ name ]
		if entity then
			local dist = #( entity:GetPos() - pos )
			if not closestDist or dist < closestDist then
				closestDist = dist
				closestObject = name
			end
		end
	end
	return closestObject
end

--функция возвращает случайный элемент из списка list
function PvE_Func:RandomFromList( list )
	if list and #list > 0 then
		return list[ math.random( #list ) ]
	end
end

--функция удаляет из таблицы элемент
function PvE_Func:RemoveFromList( list, testvalue )
	for index, value in pairs( list ) do
		if testvalue == value then
			table.remove( list, index )
			return true
		end
	end
end

--Функция возвращает имена объектов из списка list, находящийся рядом с pos на минимальной дистанции minDist и максимальной дистанции maxDist
function PvE_Func:GetInRange( list, pos, minDist, maxDist )
	if not list or not pos then return end

	local output = {}
	--ищем объекты в нужном диапазоне дальности
	for _, name in ipairs( list ) do
		local entity = Entities[ name ]
		if entity then
			local dist = SquareLen( entity:GetPos(), pos )
			local check = true
			if minDist and dist < minDist then check = nil end
			if maxDist and dist > maxDist then check = nil end
			if check then
				table.insert( output, name )
			end
		end
	end
	--если их нет, выходим
	if not next( output ) then
		return false
	end
	return output
end

--функция возвращает true, если текущий работающий маяк был отключен
function PvE_Func:VitalsOnUsed( id )
	if Entities[ id ] then
		if Entities[ id ]:GetRelationshipGroup() == 2 then
			local currentHp = Entities[ id ]:GetHealth()
			if currentHp <= 0 then
				return true
			else 
				return false
			end
		elseif Entities[ id ]:GetRelationshipGroup() == 1 then
			local currentHp = Entities[ id ]:GetHealth()
			local maxHp = Entities[ id ]:GetMaxHealth()
			if currentHp >= maxHp then
				return true
			else 
				return false
			end
		end	
	end
end


-- Общий контейнер с логикой на все мисиии #66867
PvE_Common = {
	minloglevel = 0,	-- уровень обрезки логов (начиная с этого номера не будет логгирования, если поставить 0 - то логгирование вообще отключается)
	nkd = 0,	-- сколько попыток вывода лога пропускать по умолчанию
	akd = {},	-- массив для хранения попыток вывода логов с разными уровнями
	
	nTimeForHead = 10, -- длительность показа одной головы в SV_Pve_ScriptedNotification
	nPvETimer = 0, -- таймер длительности выполнения пве
	
	--	Массив рандомных эвентов, у фазы должно быть поле bRandomEvent = true тогда к этой фазе может быть приписан какой-то из эвентов.
	--	Эвенты не повторяются, общее количество на ПвЕ задаётся nMinRandomEvents>=0, nMaxRandomEvents <= число фаз с bRandomEvent = true.
	--	На каждой карте должно быть количество точек деф PvE_RandomEvent_Position для размещение рандомных эвентов (не менее nMaxRandomEvents), поле cPointName в рандомном евенте!
	--  таблица Events в контейнере миссии будет дополнена элементами из таблицы ниже, пр ипервом обращении к обработчику фаз
	-- таблица патрулей с идентификаторами (крутостью), в каждом могут быть варианты патруля, которые выбираются рандомно
	aPatrols = {
		[1] = {	-- для каждого тека (тира) своя, 
			
			["Event_Beacon"] = {
				{
					{ "Ship_Pirate_Healer_M1_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_Healer_M1_T1" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Pirate_DD_M1_T1" , Vec3( 0, 0, 10 ) },	
					{ "Ship_Pirate_DD_M1_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_DD_M1_T1" , Vec3( 15, -15, 0 ) },		
				},
			},

			["Event_Kill"] = {
				{
					{ "Ship_Race3_H_T3_M1_T1" , Vec3( 0, 15, 10 ) },		
				},
			},
			
			["Allie_Supressor"] = {
				{
					{ "Ship_Race1_H_T3_M1_T1_Friendly" , Vec3( 0, 15, 10 ) },		
				},
			},
			
			["Event_Alien"] = {
				{
					{ "Ship_Large_Precursor_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T1" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Predator_T1" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Interceptor_T1" , Vec3( -15, 0, 0 ) },
				},
				
			},
			
			["Kill_Jericho_Runner"] = {
				{
					{ "Ship_Jericho_Escapist_M1_T1" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Jericho_Escapist_M2_T1" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Jericho_Escapist_M1_T1" , Vec3( 0, 15, 10 ) },	
					{ "Ship_Jericho_Escapist_M3_T1" , Vec3( 0, 15, 0 ) },		
				},
				
			},
			
			["Kill_Alien_Patrol"] = {
				{
					{ "Ship_Large_Precursor_T1_Squad" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T1_Squad" , Vec3( -15, 0, 0 ) },
					{ "Ship_Precursor_Predator_T1_Squad" , Vec3( -15, 0, 0 ) },
					{ "Ship_Precursor_Interceptor_T1_Squad" , Vec3( -15, 0, 0 ) },
				},	
			},

		},


		[3] = {	-- для каждого тека своя, 
			
			["Event_Beacon"] = {
				{
					{ "Ship_Pirate_Healer_M1_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_Healer_M1_T2" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Pirate_DD_M1_T2" , Vec3( 0, 0, 10 ) },	
					{ "Ship_Pirate_DD_M1_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_DD_M1_T2" , Vec3( 15, -15, 0 ) },		
				},
			},

			["Event_Kill"] = {
				{
					{ "Ship_Race3_H_T3_M1_T2" , Vec3( 0, 15, 10 ) },		
				},
			},

			["Allie_Supressor"] = {
				{
					{ "Ship_Race1_H_T3_M1_T2_Friendly" , Vec3( 0, 15, 10 ) },		
				},
			},
			
			["Event_Alien"] = {
				{
					{ "Ship_Large_Precursor_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T2" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Predator_T2" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Interceptor_T2" , Vec3( -15, 0, 0 ) },
				},
				
			},
			
			["Kill_Jericho_Runner"] = {
				{
					{ "Ship_Jericho_Escapist_M1_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Jericho_Escapist_M2_T2" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Jericho_Escapist_M3_T2" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Jericho_Escapist_M4_T2" , Vec3( -15, 0, 0 ) },
				},
				
			},
			
			["Kill_Alien_Patrol"] = {
				{
					{ "Ship_Large_Precursor_T2_Squad" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T2_Squad" , Vec3( -15, 0, 0 ) },
					{ "Ship_Precursor_Predator_T2_Squad" , Vec3( 0, 0, 0 ) },
					{ "Ship_Precursor_Interceptor_T2_Squad" , Vec3( 0, -15, 0 ) },
				},	
			},
			
		},

		[5] = {	-- для каждого тека своя, 
			
			["Event_Beacon"] = {
				{
					{ "Ship_Pirate_Healer_M1_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_Healer_M1_T3" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Pirate_DD_M1_T3" , Vec3( 0, 0, 10 ) },	
					{ "Ship_Pirate_DD_M1_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Pirate_DD_M1_T3" , Vec3( 15, -15, 0 ) },		
				},
			},

			["Event_Kill"] = {
				{
					{ "Ship_Race3_H_T3_M1_T3" , Vec3( 0, 15, 10 ) },		
				},
			},
			
			["Allie_Supressor"] = {
				{
					{ "Ship_Race1_H_T3_M1_T3_Friendly" , Vec3( 0, 15, 10 ) },		
				},
			},
			
			["Event_Alien"] = {
				{
					{ "Ship_Large_Precursor_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T3" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Predator_T3" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Large_Precursor_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Precursor_Interceptor_T3" , Vec3( -15, 0, 0 ) },
				},
				
			},
			
			["Kill_Jericho_Runner"] = {
				{
					{ "Ship_Jericho_Escapist_M1_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Jericho_Escapist_M2_T3" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Jericho_Escapist_M3_T3" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Jericho_Escapist_M4_T3" , Vec3( -15, 0, 0 ) },
				},
				
			},
			
			["Kill_Alien_Patrol"] = {
				{
					{ "Ship_Large_Precursor_T3_Squad" , Vec3( 0, 15, 10 ) },		
					{ "Ship_Biomorph_Large_T3_Squad" , Vec3( -15, 0, 0 ) },
					{ "Ship_Precursor_Predator_T3_Squad" , Vec3( 0, 0, 0 ) },
					{ "Ship_Precursor_Interceptor_T3_Squad" , Vec3( 0, -15, 0 ) },
				},	
			},
			
		},
	},				
	
	-- список порталов, имя должно совпадать с именем портала на карте
   -- <Entity Name="spawn_spot_31" Def="Logic_SpawnArea_Team2Group0" Pos="328.357 126.000 794.140" Rot="0.000 -0.272 0.000 0.962" box_dimensions="60.000 54.000 75.000" spawn_dir="0" from_zone="0" />
   -- <Entity Name="portal_31" Def="VitalPoint_ReiderPortal_PVE" Pos="318.760 158.992 827.524" Rot="-0.715 -0.187 -0.209 0.640" />
	aPortals = {
		["Event_Beacon"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_beacon",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Event_Beacon",
			nCount = 1,
			route = "event_path",
		},

		["Event_Kill"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_kill",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Event_Kill",
			nCount = 1,
		},
		
		["Allie_Supressor"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_allie",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Allie_Supressor",
			relationship_group = 1,
			nCount = 1,
		},
		
		["Event_Alien"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_alien",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Event_Alien",
			relationship_group = ai.RelationshipGroups.Alien,
			nCount = 1,
		},
		
		["Kill_Jericho_Runner"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_jericho",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Kill_Jericho_Runner",
			nCount = 1,
		},

		["Kill_Alien_Patrol"] = { -- Портал и отряд для охраны маяка
			cPortal = "portal_event_alien_portal",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_event",
			cPatrol = "Kill_Alien_Patrol",
			relationship_group = ai.RelationshipGroups.Alien,
			nCount = 1,
		},

	}, 

	-- список рандомных евентов - isActive могут быть добавлены в мисиии
	aEvents = {
		["Defuse_bombs"] = { --Разминирование бомб
			--isTestEvent	= true, -- использовать только для тестов, этот евет встанет в 1ю фазу точно!
			EventTimer 	= 90, 
			EventCounter = 0,	-- это универсальный прогресс эвента, при изменений этой переменной будет срабатывать UpdatePVEEvent( id, target_current )
			EventCounterMax = 7, -- это универсальный максимум для эвента (по умолчанию считаем 1)
			EventTargetDefs = {"LootCrate_PVE_bb2"}, -- это дефы для подсветки
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent1S",
			cDialogOnFailed = "PvE_RandomEvent1F",
			cDialogOnComplit = "PvE_RandomEvent1C",
			nCount	 = 0,	-- внутренняя переменная
			boxes = {},
			precache_defs = {"LootCrate_PVE_bb2"},
			reward = 0.05,	-- награда за выполнение, 10%
			fStart	 = function (self, container, dt, curPhase, nTier, event)
							-- надо в точке cPointName разместить ящики
							local point = GetObjectByName(self.cPointName)
							
							if point then
								--PvE_Common:slog("sss")
								local i, pid, box, pos, p
								pos = point:GetPos()
								for i = 1, 7 do
									box = ai.Spawn("LootCrate_PVE_bb2")
									p = pos
									p.x = p.x + math.random(30)-15
									p.y = p.y + math.random(30)-15
									p.z = p.z + math.random(30)-15
									box:SetPos(p)
								end
								
								-- запоминаем расставленные ящики по id - для дальнейшего отслеживания.
								for i,pid in pairs(GetEntitiesByClass( "LootCrate" ) ) do
									p = Entities[pid]
									if p:GetDefName() == "LootCrate_PVE_bb2" then
										table.insert(self.boxes, pid)
									end
								end
							else
								PvE_Common:slog("!!!================================= Error RandomEvent Box not found point")
							end
							return true
						end, -- не стандартные действия при запуске эвента
			fUpdate	 = function (self, container, dt, curPhase, nTier, event) -- проверка выполнения/провала эвента
					-- считаем число оставшихся ящиков
					local i, pid, p
					local cnt = 0
					local deadcnt = 0
					for i = 1, #self.boxes do
						if self.boxes[i] <= 0 then
							deadcnt = deadcnt + 1
						else
							p = Entities[self.boxes[i]]
							if p then
								if p:GetHealth() < 1000000 then	-- ящик повреждён
									PvE_Common:slog("!!!================================= blow")
									SV_Pve_EmitBlowEffect(p)
									p:Remove()
									self.boxes[i] = 0
								else
									--PvE_Common:slog("!!!================================= box i="..i.." GetHealth="..p:GetHealth(), 20+i, 100)
									cnt = cnt + 1
								end
							else
								self.boxes[i] = -1
								self.nCount = self.nCount + 1	-- собрано
								self.EventCounter = self.EventCounter + 1
								if self.EventCounter >= self.EventCounterMax then
									self.EventCounter = self.EventCounterMax
									self.isComplete = true
									return true
								end
							end
						end
					end
					PvE_Common:slog("cnt="..cnt.." self.nCount="..self.nCount, 5, 100)
					
					if cnt == 0 then
						if self.nCount==0 then
							self.isFailed = true
						end
						return true
					end
				end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event)
					local p, i
					PvE_Common:slog("!!!================================= blow boxcount ".. #self.boxes)
					for i = 1, #self.boxes do
						p = Entities[self.boxes[i]]
						if self.boxes[i]>0 and p then	-- #83840 походу тут удялялись уже убранные ящики и это приводило к проблемам с физикой
							PvE_Common:slog("!!!================================= blow")
							SV_Pve_EmitBlowEffect(p)
							p:Remove()
						end
					end
				end, -- не стандартные действия на окончание времени эвента
		},

		["Event_Beacon"] = { -- Уничтожение глушилки
			EventTimer 	= 360, 
			EventTargetDefs = {"Turret_Beacon_bb2_event"},
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent2S",
			cDialogOnFailed = "PvE_RandomEvent2F",
			cDialogOnComplit = "PvE_RandomEvent2C",
			precache_defs = {"Turret_Beacon_bb2_event", "Turret_Beacon_bb2_event_shadow"},
			aPatrols = {"Event_Beacon"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Event_Beacon"},
			reward = 0.05,	-- награда за выполнение, 10%
			
			nCount	 = 0,	-- внутренняя переменная
			fInit	 = 	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при старте мисиии (1й кадр после отсчёта)
							local point = GetObjectByName(self.cPointName)
							
							if point then
								PvE_Common:slog("shadow add")
								local i, pid, b, p
								b = ai.Spawn("Turret_Beacon_bb2_event_shadow")
								b:SetPos(point:GetPos())

								for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
									p = Entities[pid]:GetDefName()
									if p == "Turret_Beacon_bb2_event_shadow" then
										self.shadow = pid
									end
								end
							else
								PvE_Common:slog("!!!================================= Error RandomEvent DestroyBeacon not found point ")
							end

						end,
			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							if self.shadow and Entities[self.shadow] then
								Entities[self.shadow]:Remove()
							else
								PvE_Common:slog("!!!================================= Error RandomEvent DestroyBeacon not found shadow")
							end

							local point = GetObjectByName(self.cPointName)
							if point then
								local b = ai.Spawn("Turret_Beacon_bb2_event")
								b:SetPos(point:GetPos())
								
								local i, pid, p
								for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
									p = Entities[pid]:GetDefName()
									if p == "Turret_Beacon_bb2_event" then
										self.beacon = pid
										Entities[self.beacon]:FullActivate(true)
									end
								end
								
								-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
								local spawn = GetObjectByName("spawn_spot_event")
								if spawn then
									spawn:SetPos(point:GetPos())
								else
									PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
								end
								
								-- путь туда же отправить
								local p = point:GetPos()
								p.x = p.x - 20
								p.y = p.y - 20
								p.z = p.z - 20
								local path = GetObjectByName("event_path")
								if path then
									path:SetPos(p)
								else
									PvE_Common:slog("no event_path in Event DestroyBeacon")
								end
								
								-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
								container.aPortals["Event_Beacon"].nState = 1
							end
							
							if not self.beacon then
								PvE_Common:slog("no beacon with Turret_Beacon_bb666 in Event DestroyBeacon")
							end
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon and Entities[self.beacon] then
								if Entities[self.beacon]:GetHealth() <= 0 then
									self.isComplete = true
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
			
		},
			
		["Event_Kill"] = { -- Уничтожение враждебной цели (эсминец)
			EventTimer 	= 360, 
			EventTargetDefs = {"Ship_Race3_H_T3_M1_T1", "Ship_Race3_H_T3_M1_T2", "Ship_Race3_H_T3_M1_T3"},
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent3S",
			cDialogOnFailed = "PvE_RandomEvent3F",
			cDialogOnComplit = "PvE_RandomEvent3C",
			aPatrols = {"Event_Kill"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Event_Kill"},
			reward   = 0.05,
			nCount	 = 0,	-- внутренняя переменная

			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							local i, pid, p

							if not container.aPortals["Event_Kill"].nState or container.aPortals["Event_Kill"].nState == 0 then
							
								-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
								local point = GetObjectByName(self.cPointName)
								local spawn = GetObjectByName("spawn_spot_event")
								if spawn then
									spawn:SetPos(point:GetPos())
								else
									PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
								end
								
								-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
								container.aPortals["Event_Kill"].nState = 1
								PvE_Common:slog("!!!!!!!!!!!!===== nState 1")
								
							else
								PvE_Common:slog("!!!!!!!!!!!!===== nState ? wait", 15, 50)
								self.boss = nil
								for i, pid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
									p = Entities[pid]:GetDefName()
									if p == "Ship_Race3_H_T3_M1_T1" or p == "Ship_Race3_H_T3_M1_T2" or p == "Ship_Race3_H_T3_M1_T3" then	-- деф цели, его же надо в Patrol прописать на все теки
										self.boss = pid
										return true
									end
								end
							end
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.boss and Entities[self.boss] then
								if Entities[self.boss]:IsDead() then
									--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
	
		["Event_Alien"] = { -- Мини-боссы пришельцы, враждебные всем фракциям (сильные)
			--EventTimer 	= 720, 
			EventCounter = 0,
			EventCounterMax = 2,
			EventTargetDefs = {"Ship_Biomorph_Large_T1", "Ship_Large_Precursor_T1", "Ship_Precursor_Predator_T1", "Ship_Precursor_Interceptor_T1", 
			"Ship_Biomorph_Large_T2", "Ship_Large_Precursor_T2", "Ship_Precursor_Predator_T2", "Ship_Precursor_Interceptor_T2", 
			"Ship_Biomorph_Large_T3", "Ship_Large_Precursor_T3", "Ship_Precursor_Predator_T3", "Ship_Precursor_Interceptor_T3"},
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent6S",
			cDialogOnFailed = "PvE_RandomEvent6F",
			cDialogOnComplit = "PvE_RandomEvent6C",
			aPatrols = {"Event_Alien"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Event_Alien"},
			reward   = 0.05,
			nCount	 = 0,	-- внутренняя переменная

			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							local i, pid, p

							-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
							local point = GetObjectByName(self.cPointName)
							local spawn = GetObjectByName("spawn_spot_event")
							if spawn then
								spawn:SetPos(point:GetPos())
							else
								PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
							end
							
							-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
							container.aPortals["Event_Alien"].nState = 1
							return true
						end,	
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if container.aPortals["Event_Alien"].nState == 4 then
								--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
								return true
							elseif container.aPortals["Event_Alien"].nState == 3 then
								local c = container.aPortals["Event_Alien"].cPatrolName
								if container.aPatrolsBotsCount[c] then -- тут тек и рандом могут вмешаться, поэтому так
									self.EventCounter = self.EventCounterMax - container.aPatrolsBotsCount[c]
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
		
		["Kill_Jericho_Runner"] = { -- Уничтожение быстрых врагов-беглецов из Иерихона
			EventTimer 	= 180, 
			EventCounter = 0,	-- это универсальный прогресс эвента, при изменений этой переменной будет срабатывать UpdatePVEEvent( id, target_current )
			EventCounterMax = 2, -- это универсальный максимум для эвента (по умолчанию считаем 1)
			EventTargetDefs = {"Ship_Jericho_Escapist_M1_T1", "Ship_Jericho_Escapist_M2_T1", "Ship_Jericho_Escapist_M3_T1", "Ship_Jericho_Escapist_M4_T1",
			"Ship_Jericho_Escapist_M1_T2", "Ship_Jericho_Escapist_M2_T2", "Ship_Jericho_Escapist_M3_T2", "Ship_Jericho_Escapist_M4_T2",
			"Ship_Jericho_Escapist_M1_T3", "Ship_Jericho_Escapist_M2_T3", "Ship_Jericho_Escapist_M3_T3", "Ship_Jericho_Escapist_M4_T3"},
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			--isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent5S",
			cDialogOnFailed = "PvE_RandomEvent5F",
			cDialogOnComplit = "PvE_RandomEvent5C",
			aPatrols = {"Kill_Jericho_Runner"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Kill_Jericho_Runner"},
			reward   = 0.05,
			nCount	 = 0,	-- внутренняя переменная

			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							local i, pid, p

							-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
							local point = GetObjectByName(self.cPointName)
							local spawn = GetObjectByName("spawn_spot_event")
							if spawn then
								spawn:SetPos(point:GetPos())
							else
								PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
							end
							
							-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
							container.aPortals["Kill_Jericho_Runner"].nState = 1
							return true
						end,	
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if container.aPortals["Kill_Jericho_Runner"].nState == 4 then
								--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
								return true
							elseif container.aPortals["Kill_Jericho_Runner"].nState == 3 then
								local c = container.aPortals["Kill_Jericho_Runner"].cPatrolName
								if container.aPatrolsBotsCount[c] then -- тут тек и рандом могут вмешаться, поэтому так
									self.EventCounter = self.EventCounterMax - container.aPatrolsBotsCount[c]
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
		
		["Kill_Alien_Patrol"] = { -- Мини-боссы пришельцы, враждебные всем фракциям (слабые)
			--EventTimer 	= 720, 
			EventCounter = 0,
			EventCounterMax = 4,
			EventTargetDefs = {"Ship_Large_Precursor_T1_Squad", "Ship_Biomorph_Large_T1_Squad", "Ship_Precursor_Predator_T1_Squad", "Ship_Precursor_Interceptor_T1_Squad",
			"Ship_Large_Precursor_T2_Squad", "Ship_Biomorph_Large_T2_Squad", "Ship_Precursor_Predator_T2_Squad", "Ship_Precursor_Interceptor_T2_Squad",
			"Ship_Large_Precursor_T3_Squad", "Ship_Biomorph_Large_T3_Squad", "Ship_Precursor_Predator_T3_Squad", "Ship_Precursor_Interceptor_T3_Squad"},
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent6S",
			cDialogOnFailed = "PvE_RandomEvent6F",
			cDialogOnComplit = "PvE_RandomEvent6C",
			aPatrols = {"Kill_Alien_Patrol"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Kill_Alien_Patrol"},
			reward   = 0.05,
			nCount	 = 0,	-- внутренняя переменная

			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							local i, pid, p

							-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
							local point = GetObjectByName(self.cPointName)
							local spawn = GetObjectByName("spawn_spot_event")
							if spawn then
								spawn:SetPos(point:GetPos())
							else
								PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
							end
							
							-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
							container.aPortals["Kill_Alien_Patrol"].nState = 1
							return true
						end,	
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if container.aPortals["Kill_Alien_Patrol"].nState == 4 then
								--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
								return true
							elseif container.aPortals["Kill_Alien_Patrol"].nState == 3 then
								local c = container.aPortals["Kill_Alien_Patrol"].cPatrolName
								if container.aPatrolsBotsCount[c] then -- тут тек и рандом могут вмешаться, поэтому так
									self.EventCounter = self.EventCounterMax - container.aPatrolsBotsCount[c]
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
		
		["Grab_Hero"] = { -- Эвакуация тела пилота
			EventTimer 	= 420, 
			--EventCounter = 1,
			--EventCounterMax = 1,
			EventTargetDefs = {"LootCrate2_PVE_bb2"},
			
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,			
			cDialogOnStart = "PvE_RandomEvent7S",
			cDialogOnFailed = "PvE_RandomEvent7F",
			cDialogOnComplit = "PvE_RandomEvent7C",
			nCount	 = 0,	-- внутренняя переменная
			boxes = {},
			precache_defs = {"LootCrate2_PVE_bb2"},
			reward = 0.05,
			
			fStart	 = function (self, container, dt, curPhase, nTier, event)
							-- надо в точке cPointName разместить ящики
							local point = GetObjectByName(self.cPointName)
							
							if point then
								--PvE_Common:slog("sss")
								local i, pid, box, pos, p
								pos = point:GetPos()
								for i = 1, 1 do
									box = ai.Spawn("LootCrate2_PVE_bb2")
									p = pos
									p.x = p.x + math.random(20)-10
									p.y = p.y + math.random(20)-10
									p.z = p.z + math.random(20)-10
									box:SetPos(p)
								end
								
								-- запоминаем расставленные ящики по id - для дальнейшего отслеживания.
								for i,pid in pairs(GetEntitiesByClass( "LootCrate" ) ) do
									p = Entities[pid]
									if p:GetDefName() == "LootCrate2_PVE_bb2" then
										table.insert(self.boxes, pid)
									end
								end
							else
								PvE_Common:slog("!!!================================= Error RandomEvent Box not found point")
							end
							return true
						end, -- не стандартные действия при запуске эвента
			fUpdate	 = function (self, container, dt, curPhase, nTier, event) -- проверка выполнения/провала эвента
					-- считаем число оставшихся ящиков
					local i, pid, p
					local cnt = 0
					local deadcnt = 0
					for i = 1, #self.boxes do
						if self.boxes[i] <= 0 then
							deadcnt = deadcnt + 1
						else
							p = Entities[self.boxes[i]]
							if p then
								cnt = cnt + 1
								if p:GetHealth() < 1000000 then	-- ящик повреждён
									p:Remove()
									self.boxes[i] = 0
								end
							else
								self.boxes[i] = -1
								self.nCount = self.nCount + 1	-- собрано
							end
						end
					end
					PvE_Common:slog("cnt="..cnt.." self.nCount="..self.nCount, 6, 100)
					
					if cnt == 0 then
						self.isComplete = true
						return true
					end
					
					-- если их меньше ??? фэйлим эвент
				end, 
			fEnd	 = function (self, container, dt, curPhase, nTier, event)
					local p, i
					PvE_Common:slog("!!!================================= blow boxcount ".. #self.boxes)
					for i = 1, #self.boxes do
						p = Entities[self.boxes[i]]
						if self.boxes[i]>0 and p then
							PvE_Common:slog("!!!================================= blow")
							SV_Pve_EmitBlowEffect(p)
							p:Remove()
						end
					end
				end, -- не стандартные действия на окончание времени эвента
		},
		
		["Allie_Supressor"] = { --Союзный эсминец на подмоге
			--EventTimer 	= 20, 
			EventTargetDefs = {"Ship_Race1_H_T3_M1_T1_Friendly", "Ship_Race1_H_T3_M1_T2_Friendly", "Ship_Race1_H_T3_M1_T3_Friendly"},
			isEndFail	= false, -- !если время эвента вышло а союзник ещё жив - то считать выполненным
			isActive	= true,
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			cDialogOnStart = "PvE_RandomEvent8S",
			cDialogOnFailed = "PvE_RandomEvent8F",
			cDialogOnComplit = "PvE_RandomEvent8C",
			aPatrols = {"Allie_Supressor"},	-- имена будут скопированы в миссию - елси эвент будет в неё добавлен
			aPortals = {"Allie_Supressor"},
			reward   = 0.05,
			nCount	 = 0,	-- внутренняя переменная

			fStart	 =	function (self, container, dt, curPhase, nTier, event) -- не стандартные действия при запуске фазы
							local i, pid, p

							if not container.aPortals["Allie_Supressor"].nState or container.aPortals["Allie_Supressor"].nState == 0 then
							
								-- надо сдвинуть спавн spawn_spot_event на точку point, размер спавна большой - маяк вроже не должен помешать
								local point = GetObjectByName(self.cPointName)
								local spawn = GetObjectByName("spawn_spot_event")
								if spawn then
									spawn:SetPos(point:GetPos())
								else
									PvE_Common:slog("no spawn_spot_event in Event DestroyBeacon")
								end
								
								-- надо ещё патруль выпустить, пусть обработчик порталов по-работает, там рандом настроен...
								container.aPortals["Allie_Supressor"].nState = 1
								PvE_Common:slog("!!!!!!!!!!!!===== nState 1")
								
							else
								PvE_Common:slog("!!!!!!!!!!!!===== nState ? wait", 18, 50)
								self.boss = nil
								for i, pid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
									p = Entities[pid]:GetDefName()
									if p == "Ship_Race1_H_T3_M1_T1_Friendly" or p == "Ship_Race1_H_T3_M1_T2_Friendly" or p == "Ship_Race1_H_T3_M1_T3_Friendly" then	-- деф цели, его же надо в Patrol прописать на все теки
										self.boss = pid
										return true
									end
								end
							end
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier, event) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.boss and Entities[self.boss] then
								if Entities[self.boss]:IsDead() then
									self.isFailed = true -- союзник убит раньше окончания, провал эевента
									--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
	},
}

-- функция выборочного логгирования
PvE_Common.slog = function (self, stext, nlevel, nkd)
	if not nkd then nkd = PvE_Common.nkd end -- если не указать таймер, то берём по умолчанию
	if not nlevel then nlevel = 0 end -- если не указать уровень, то логгировать всегда
	if nlevel < PvE_Common.minloglevel then
		local b = true
		if nkd > 0 then
			b = false
			if not PvE_Common.akd[nlevel] then
				PvE_Common.akd[nlevel] = -1
			else
				PvE_Common.akd[nlevel] = PvE_Common.akd[nlevel] - 1
			end
			if PvE_Common.akd[nlevel] < 0 then	-- делаем лог и восстанавливаем количество кадров до следующего лога
				PvE_Common.akd[nlevel] = nkd - 1
				b = true
			end
		end
		if b then
			sys.log( stext )
		end
	end
end


-- функция заполнения списка сквадов в миссии по таблице
PvE_Common.SetSquads = function (self, container)
	PvE_Common:slog("============ SetSquads", 5)
	local nTier, cMission
	local mission
	local nPortal, pdata
	local nVariant, a
	local nSquadAdded

	self.nPvETimer = 0 -- сброс таймера миссии

	-- рандомные эвенты могут потребовать прекеш дефов
	local nRandomEvents = 0 -- количество доступных рандомных евентов
	local cEvent, dEvent
	local precache_defs = {}
	for cEvent, dEvent in pairs(PvE_Common.aEvents) do
		if dEvent.isActive then
			nRandomEvents = nRandomEvents + 1
			if dEvent.precache_defs then
				local i
				for i = 1, #dEvent.precache_defs do
					precache_defs[#precache_defs + 1] = dEvent.precache_defs[i]
				end
			end
		end
	end

	for cEvent, dEvent in pairs(container.aEvents) do	-- обычные эвенты тоже могут иметь precache_defs
		if dEvent.precache_defs then
			local i
			for i = 1, #dEvent.precache_defs do
				precache_defs[#precache_defs + 1] = dEvent.precache_defs[i]
			end
		end
	end

	-- проверки на рандомные эвенты
	local nPhaseCount = 0 -- количество фаз доступных для вставки эвента
	local nPhase, dPhase
	for nPhase, dPhase in pairs(container.aPhases) do
		if dPhase.bRandomEvent then
			nPhaseCount = nPhaseCount + 1
		end

		if dPhase.precache_defs then	-- в фазах тоже можно создавать объекты precache_defs
			local i
			for i = 1, #dPhase.precache_defs do
				precache_defs[#precache_defs + 1] = dPhase.precache_defs[i]
			end
		end
	end

	nTier = next(container.aMissions)	-- нам пофиг, лишь бы был валидный
	if nTier then
		if nPhaseCount < container.nMaxRandomEvents then -- не хватает фаз
			PvE_Common:slog("!!!============ Error in cMission="..container.aMissions[nTier]..", not enough phases for place random events "..nPhaseCount.."<"..container.nMaxRandomEvents)
		end
		if nRandomEvents < container.nMaxRandomEvents then -- не хватает евентов
			PvE_Common:slog("!!!============ Error in cMission="..container.aMissions[nTier]..", not enough random events for place "..nRandomEvents.."<"..container.nMaxRandomEvents)
		end
	else
		PvE_Common:slog("!!!============ Error in cMission. No Tier")
	end

		-- рандомные эвенты вставляем
		local nRandomEventCount = container.nMinRandomEvents
		local r = container.nMaxRandomEvents - nRandomEventCount
		if r > 0 then
			nRandomEventCount = nRandomEventCount + math.random(r+1)-1
		end

		local aPos = {} -- список фаз для вставки рандомных евентов
		for nPhase, dPhase in pairs(container.aPhases) do
			if dPhase.bRandomEvent then
				aPos[#aPos+1] = nPhase
				if nPhase==1 then
					--sys.log("======== Тестовый эвент место "..#aPos)
					PvE_Common.cTestEventNPos = #aPos
				end
			end
		end

		local aRandomEvents = {} -- список сid рандомных евентов для вставки
		for cEvent, dEvent in pairs(PvE_Common.aEvents) do
			if dEvent.isActive then
				aRandomEvents[#aRandomEvents+1] = cEvent
				if dEvent.isTestEvent then -- для тестов
					PvE_Common.cTestEventN = #aRandomEvents
					sys.log("======== Тестовый эвент "..cEvent.." N="..PvE_Common.cTestEventN)
				end
			end
		end
		
		local aRandomPoints = {} -- список точек на карте в которых может разместиться рандомный эвент, считаем что их всегда 10 и называются они posN
		local i
		for i = 1, 10 do
			aRandomPoints[#aRandomPoints+1] = "pos"..i
		end
		
		if #aRandomPoints < nRandomEventCount then
			PvE_Common:slog("!!!============ Error in cMission="..container.aMissions[nTier]..", not enough random points events DefName==PvE_RandomEvent_Position for place events "..#aRandomPoints.."<"..nRandomEventCount)
		end

		nRandomEventCount = math.min(#aRandomPoints, #aPos, nRandomEventCount) -- оставляем эвентов не больше, чем есть места и фаз (ошибку с фазами должно было написать ещё на запуске игры)
		
		local i
		for i = 1, nRandomEventCount do
			local nPos = math.random(#aPos)
			if PvE_Common.cTestEventN and i==1 then -- для тестов
				nPos = PvE_Common.cTestEventNPos
			end
			
			local nPhase = aPos[nPos]
			table.remove(aPos, nPos) -- 1 фаза максимум 1 евент

			nPos = math.random(#aRandomEvents)
			if PvE_Common.cTestEventN and i==1 then  -- для тестов
				nPos = PvE_Common.cTestEventN
			end

			local cEvent = aRandomEvents[nPos]
			table.remove(aRandomEvents, nPos) -- 1 евент максимум 1 раз за мисиию
			
			local nPos = math.random(#aRandomPoints)
			local cPointName = aRandomPoints[nPos]
			table.remove(aRandomPoints, nPos) -- 1 точка максимум 1 раз за мисиию
			
			
			container.aEvents[cEvent] = PvE_Common.aEvents[cEvent] -- это не копирование а ссылка! но вроде как у нас 1 разовое всё и должно прокатить и так
			container.aEvents[cEvent].nPhaseStart = nPhase
			--container.aEvents[cEvent].nPhaseEnd = #container.aPhases -- #81738 по окончании миссии то всё равно надо принудительно завершить любой эвент.
			container.aEvents[cEvent].cPointName = cPointName
			--а собстна и всё, дальше это обрабатывается как обычный эвент, вот только его надо так изначально настроить - чтобы он ни от чего не зависел
			PvE_Common:slog("Mission="..container.aMissions[nTier]..", RandomEvent = "..cEvent.." added in Phase = "..nPhase.." on Point = "..cPointName, 4)
			
			-- тут надо ещё нужные евенту патрули и порталы скопировать в миссию
			if container.aEvents[cEvent].aPatrols then
				for i, cPatrol in pairs(container.aEvents[cEvent].aPatrols) do
					-- пробегаемся по всем сложностям
					for nTier, cMission in pairs(container.aMissions) do
						container.aPatrols[nTier][cPatrol] = PvE_Common.aPatrols[nTier][cPatrol] -- это не копирование а ссылка!
					end
				end
			end
			
			if container.aEvents[cEvent].aPortals then
				for i, cPortal in pairs(container.aEvents[cEvent].aPortals) do
					container.aPortals[cPortal] = PvE_Common.aPortals[cPortal] -- это не копирование а ссылка!
				end
			end

		end
	
	
	-- список боссов
	container.aBoss = {} -- заполнится в процессе создания списка сквадов и потом на появление/смерть будет колбек в интерфейс
	
	-- пробегаемся по всем сложностям
	for nTier, cMission in pairs(container.aMissions) do
		mission = PvE_Missions[cMission]
		nSquadAdded = 0
		if mission then
			PvE_Common:slog("SetSquads("..cMission.."), Tier="..nTier)
			
			if #precache_defs > 0 then
				for i, precache_def in pairs( precache_defs ) do
					table.insert( mission.rounds[ 1 ].precache_defs, precache_def )
				end	
			end	
			-- делаем запуск обработчиков фаз/волн/эвентов на каждый кадр
			mission.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
				return PvE_Common:OnUpdateRound(container, dt, curPhase, nTier)
			end
			
			-- дублируем диалоги в каждую сложность
			local i
			for i = 1, #container.HudDialogs do
				table.insert(mission.HudDialogs, container.HudDialogs[i])
			end
			
			---кастомные награды тут организовать SV_GetFinishRewardCoefs SV_GetBaseLootAttempts
			mission.rounds[1].SV_GetFinishRewardCoefs = function(self, roundsFinished)
				return container:SV_GetFinishRewardCoefs(nTier, roundsFinished)
			end

			mission.rounds[1].SV_GetBaseLootAttempts = function(self, roundsFinished)
				return container:SV_GetBaseLootAttempts(nTier, roundsFinished)
			end
			
			local nSquad = 1
			-- пробегаемся по всем порталам
			for nPortal, pdata in pairs(container.aPortals) do
				local cPortal	= pdata.cPortal
				local cSpawn	= pdata.cSpawn
				local cPatrol	= pdata.cPatrol
				local cargoship = pdata.cargoship
				local route		= "default_path"
				if pdata.route then route = pdata.route end
				local relationship_group = 2
				if pdata.relationship_group then relationship_group = pdata.relationship_group end
				local boss		= pdata.boss
				pdata.aPatrolNames = {}	-- имена патрулей для портала, нужно чтобы потом можно было патрули вызывать без вычисления имён
				
				-- пробегаемся по вариантам патрулей нужной сложности
				local apt = container.aPatrols[nTier]
				if apt then
					local aptt = container.aPatrols[nTier][cPatrol]
					local cPatrolName
					if aptt then
						for nVariant = 1, #aptt do
							-- берём заготовку сквада
							cPatrolName = cPortal.."_"..cPatrol.."_"..nVariant
							table.insert(pdata.aPatrolNames, cPatrolName)
							
							a = {
								name = cPatrolName,
								relationship_group = relationship_group,
								spawn_spot = cSpawn,
								route = route,
								squad_type = ai.AISquadType.PATROL,
								spawn_by_mission = true,
								respawn_time = 12000,
								members = {{}},
							}
							
							if cargoship then -- меняем параметры сквада
								a.squad_type = ai.AISquadType.CONVOY
								a.cargoship = cargoship	
							end
							
							if boss then
								a.boss = true
								--a.spawn_ignore_collision = true
								a.collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN
								PvE_Common:slog("!============ Boss squad in cMission="..cMission..", Tier="..nTier.." , cPatrolName="..cPatrolName .. " , nSquad="..nSquad)
								container.aBoss[aptt[nVariant][1][1]] = true -- первый корабль патруля считается боссом, тут можно и более тонко определять, но пока так
							end
							
							--table.insert(a.members, aptt[nVariant]) -- это не копирование а подстановка ссылки, и потом проблемы возникают при добавлении элитников (везде добавляются)
							local iship
							for key, value in pairs(aptt[nVariant]) do	--iship = 1, #aptt[nVariant] do
								a.members[1][key] = value
							end
							
							-- добавление элитников
							if container.nRandomEliteChance and container.cRandomElite and container.aRandomSpawn then
								--nRandomEliteChance = 0.01,	-- вероятность добавления элитного бота/отряда в патрули из списка aRandomSpawn
								--cRandomElite = "RandomElite", -- список элитников
								--aRandomSpawn = { RandomSpawn = true }, -- в эти патрули может быть добавлен элитник, формат имя = true !
								if container.aRandomSpawn[cPatrol] and math.random() < container.nRandomEliteChance then -- надо добавить элитника
									--PvE_Common:slog("!============ Elite squad in cMission="..cMission..", Tier="..nTier.." , cPatrolName="..cPatrolName .. " , nSquad="..nSquad)
									local aRandomElite = container.aPatrols[nTier][container.cRandomElite] -- список вариантов элитников
									local nRandomElite = math.random(#aRandomElite) -- выбираем конкретный вариант элитников (добавится только 1й корабль!!!)
									table.insert(a.members[1], aRandomElite[nRandomElite][1])
								end
							end

							if mission.squads then
								table.insert(mission.squads, a)
								nSquadAdded = nSquadAdded + 1
								nSquad = nSquad + 1
							else
								PvE_Common:slog("!!!============ Error no squads in cMission="..cMission..", Tier="..nTier.." , cPatrol="..cPatrol..", nVariant="..nVariant)
							end

						end
					else
						PvE_Common:slog("!!!============ Error Patrol cMission="..cMission..", Tier="..nTier.." not found in aPatrols for cPatrol="..cPatrol)
					end
				else
					PvE_Common:slog("!!!============ Error Tier cMission="..cMission..", Tier="..nTier.." not found in aPatrols")
				end
			end
			
			PvE_Common:slog("SetSquads("..cMission.."), Tier="..nTier.." nSquadAdded="..nSquadAdded)
		else
			PvE_Common:slog("!!!================================= Error cMission="..cMission..", Tier="..nTier)
		end
	end
	
end


-- функция обработчик фаз
PvE_Common.PhasesUpdate = function (self, container, dt, curPhase, nTier)
	local ph = container.aPhases[curPhase]
	if ph then
		if ph.isStarted then
			PvE_Common:slog("Mission="..container.aMissions[nTier]..", Update Phase = "..curPhase,3,200)
			if ph.DialogAfterStartTimer then -- 2я голова
				ph.DialogAfterStartTimer = ph.DialogAfterStartTimer - dt
				if ph.DialogAfterStartTimer < 0 then
					--PvE_Common:slog("========================================= cDialogAfterStart now")
					ph.DialogAfterStartTimer = nil
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", Head on Phase = "..curPhase.." cDialogAfterStart")
					if ph.cDialogAfterStart then
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", Head on Phase = "..curPhase.." cDialogAfterStart="..ph.cDialogAfterStart)
						SV_Pve_ScriptedNotification(ph.cDialogAfterStart)
					end
				end
			end
			
			if ph:fUpdate(container, dt, curPhase, nTier) then	-- фаза окончена
				PvE_Common:slog("Mission="..container.aMissions[nTier]..", End of Phase = "..curPhase)

				if container.nPhaseComplete then -- нужно чтобы вычислить награду - если не дошли до конца
					container.nPhaseComplete = container.nPhaseComplete + 1
				else
					container.nPhaseComplete = 1
				end
				
				ph:fEnd(container, dt, curPhase, nTier)
				if ph.nNextPhase then
					SV_Pve_StartPhase(ph.nNextPhase)
					container.bChangeWave = true	-- ставим флаг смены волны
				else -- а может и не быть у последней волны
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", End of Mission on Phase = "..curPhase)
					--container.aPhases[curPhase] = nil -- убираем фазу, тем самым останавливается вообще PhasesUpdate (!убирать совсем как-то кажется опасным, пусть лучше апдейт зацикливается)
				end
				
				return true
			end
		else
			PvE_Common:slog("Mission="..container.aMissions[nTier]..", try start of Phase = "..curPhase)
			if ph:fStart(container, dt, curPhase, nTier) then
				PvE_Common:slog("Mission="..container.aMissions[nTier]..", Started Phase = "..curPhase)
				ph.isStarted = true
				-- показать голову для 1й фазы (сейчас это как-то черезе Билимбай деалается)
				PvE_Common:slog("Mission="..container.aMissions[nTier]..", Head on Phase = "..curPhase.." cDialogOnStart")
				if ph.cDialogOnStart then
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", Head on Phase = "..curPhase.." cDialogOnStart="..ph.cDialogOnStart)
					SV_Pve_ScriptedNotification( ph.cDialogOnStart)
					if ph.cDialogAfterStart then -- есть 2я глова
						--PvE_Common:slog("========================================= cDialogAfterStart = "..ph.cDialogAfterStart)
						ph.DialogAfterStartTimer = PvE_Common.nTimeForHead -- пережидаем основную голову
					end
				end
			end
		end
	else
		PvE_Common:slog("!!!============ Error in cMission="..container.aMissions[nTier]..", Phase not found = "..curPhase)
	end
	
end


-- функция обработчик эвентов
PvE_Common.EventsUpdate = function (self, container, dt, curPhase, nTier)
	local cEvent, dEvent
	local nPhase, dPhase

	if not container.bRandomEventsInit then
	
		if Game_IsServer() then	-- зачищаем возможные остатки информации от предыдущих пве на клиентах
			ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_PveEventsReset")
		else
			CL_PveEventsReset()
		end
		
		for cEvent, dEvent in pairs(container.aEvents) do
			if dEvent.fInit then -- если есть что сделать на старте миссии - то делаем
				dEvent:fInit(container, dt, curPhase, nTier, dEvent)
			end
		end
		
		container.bRandomEventsInit = true
		PvE_Common.nWinCommand = nil	-- чтобы повторный запуск с консоли работал
		PvE_Common.nWinReason = nil
	end
	
	for cEvent, dEvent in pairs(container.aEvents) do
		if dEvent.isStarted then
			if not dEvent.isFailed and not dEvent.isComplete then
				PvE_Common:slog("Mission="..container.aMissions[nTier]..", update of Event = "..cEvent, 8, 100)
				if dEvent:fUpdate(container, dt, curPhase, nTier, dEvent) then
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", end of Event = "..cEvent)
					if not dEvent.isFailed and not dEvent.isComplete then	-- если не указано, то автокомплитим или файлим
						dEvent.isComplete = true
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", end of Event = "..cEvent..", autoComplite")
					end
					dEvent:fEnd(container, dt, curPhase, nTier, dEvent)
				end
				if dEvent.EventTimer then -- есть время действия эвента
					dEvent.EventTimer = dEvent.EventTimer - dt
				end
				--#81738 добавил окончание евента при окончании миссии
				if PvE_Common.nWinCommand or curPhase == dEvent.nPhaseEnd or (dEvent.EventTimer and dEvent.EventTimer < 0) then	-- закончиться может только начинавшийся эвент
					if not (dEvent.isComplete or dEvent.isFailed) then -- это на случай одновременного штатного завершения в fUpdate
						dEvent.isFailed = dEvent.isEndFail
						dEvent.isComplete = not dEvent.isEndFail
						
						if curPhase == dEvent.nPhaseEnd then
							PvE_Common:slog("Mission="..container.aMissions[nTier]..", end of phase Event = "..cEvent)
						elseif PvE_Common.nWinCommand then
							PvE_Common:slog("Mission="..container.aMissions[nTier]..", end of Mission for Event = "..cEvent)
						else
							PvE_Common:slog("Mission="..container.aMissions[nTier]..", end of time Event = "..cEvent)
						end
						dEvent:fEnd(container, dt, curPhase, nTier, dEvent)
					end
				end

				-- головы на окончание евента выношу сюда, ибо закончиться можно и штатно
				-- + апдейт или окончание как у квестов в опен-спейсе #72075
				if dEvent.isFailed then
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnFailed")
					if dEvent.cDialogOnFailed then
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnFailed="..dEvent.cDialogOnFailed)
						SV_Pve_ScriptedNotification(dEvent.cDialogOnFailed)
					end
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FailPVEEvent", cEvent )
					else
						PvE_Common.UI.PveEvents:FailPVEEvent( cEvent )
					end
				elseif dEvent.isComplete then
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnComplit")
					if dEvent.cDialogOnComplit then
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnComplit="..dEvent.cDialogOnComplit)
						SV_Pve_ScriptedNotification(dEvent.cDialogOnComplit)
					end
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", cEvent, dEvent.EventCounterMax )
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_CompletePVEEvent", cEvent )
					else
						PvE_Common.UI.PveEvents:UpdatePVEEvent(cEvent, dEvent.EventCounterMax)
						PvE_Common.UI.PveEvents:CompletePVEEvent( cEvent )
					end
				elseif dEvent.EventCounterLast < dEvent.EventCounter then -- апдейт
					dEvent.EventCounterLast = dEvent.EventCounter
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", cEvent, dEvent.EventCounterLast )
					else
						PvE_Common.UI.PveEvents:UpdatePVEEvent(cEvent, dEvent.EventCounterLast)
					end
				end
				
			end
		else
			if curPhase == dEvent.nPhaseStart then
				if not dEvent.timer then
					if container.aPhases[curPhase].cDialogAfterStart then -- есть 2я глова
						dEvent.timer = 3 * PvE_Common.nTimeForHead	-- время показа головы от фазы надо переждать, обе головы
					else
						dEvent.timer = PvE_Common.nTimeForHead	-- время показа головы от фазы надо переждать
					end
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", timer for Event = "..cEvent)
				end
				dEvent.timer = dEvent.timer - dt
				if dEvent.timer < 0 then
					PvE_Common:slog("Mission="..container.aMissions[nTier]..", try start of Event = "..cEvent, 10, 100)
					dEvent.isStarted = dEvent:fStart(container, dt, curPhase, nTier, dEvent)
					-- головы
					if dEvent.isStarted then
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnStart")
						if dEvent.cDialogOnStart then
							PvE_Common:slog("Mission="..container.aMissions[nTier]..", head for Event = "..cEvent.." cDialogOnStart="..dEvent.cDialogOnStart)
							SV_Pve_ScriptedNotification( dEvent.cDialogOnStart )
						end
					
						-- Отображение как у квестов в опен-спейсе #72075
						local time_max = -1
						if dEvent.EventTimer then
							time_max = dEvent.EventTimer
						end
						
						if not dEvent.EventCounterMax then
							dEvent.EventCounterMax = 1
						end
						local target_max = dEvent.EventCounterMax
						
						local target_def = {}
						if dEvent.EventTargetDefs then
							if type( dEvent.EventTargetDefs ) == "table" then	-- доп проверка
								target_def = dEvent.EventTargetDefs
							else
								sys.log( "PvE_Common.UI.PveEvents:EventsUpdate()[ERROR]: invalid type of EventTargetDefs in "..cEvent)
							end
						end
						
						local reward = dEvent.reward
						
						-- тут надо передать строку на клиент
						PvE_Common:slog("Mission="..container.aMissions[nTier]..", info for Event = "..cEvent.." ActivatePVEEvent time_max="..time_max..", target_max="..target_max..", #target_def="..#target_def)
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ActivatePVEEvent", cEvent, time_max, target_max, target_def, reward )
						else
							PvE_Common.UI.PveEvents:ActivatePVEEvent(cEvent, time_max, target_max, target_def, reward)
						end
						
						if not dEvent.EventCounter then
							dEvent.EventCounter = 0
						end
						dEvent.EventCounterLast = dEvent.EventCounter -- запоминаем текущее значение чтобы потом автоматически отслеживать изменения, но надо в Update не забывыать его считать - если там больше 1 состояния
					end
				end
			end
		end
	end
end


-- функция обработчик волн, волны от старой фазы игнориуем, но надо закрытие порталов обеспечить
PvE_Common.WavesUpdate = function (self, container, dt, curPhase, nTier)
	local nWave, dWave, i

	local ncw = container.nCurrentWave
	local w = nil
	PvE_Mission.nCurPhase = container.nCurrentWave
	
	if ncw~=0 then
		w = container.aWaves[ncw]
		if not (w.nPhase == curPhase) then
			container.bChangeWave = true
		end
	end
	
	if container.bChangeWave then -- надо найти новую волну
		container.bChangeWave = false	-- сняли флаг новой волны

		local nnext = 1 -- по умолчанию следующей будет 1я волна
		if not (ncw==0) then	-- была волна
			PvE_Common:slog("============ w.nPhase="..w.nPhase..", curPhase = "..curPhase.." w.n="..w.n)
			if w.nPhase == curPhase then -- фаза не сменилась
				nnext = w.n + 1 -- будем искать следующую волну той же фазы
			end
		end
		
		-- закрываем порталы от текущей волны, если она есть
		if w then
			-- деактивация дополнительных патрулей из порталов (на случай если там респаун nCount большой стоит, то после смены фазы никто уже не заспавнится)
			if w.aPortalsUse then
				for i = 1, #w.aPortalsUse do
					container.aPortals[w.aPortalsUse[i]].nPatrolUseCount = container.aPortals[w.aPortalsUse[i]].nCount	-- обработчик порталов пусть на это реагирует
				end
			else -- порталы у текущей фазы ещё не открылись и даже не определились
				PvE_Common:slog("== wait for open portals in currwent wave", 7, 50)
				--return
			end
		end
		
		-- ищем следующую волну
		PvE_Common:slog("============ cMission="..container.aMissions[nTier]..", Search Next Wave for Phase = "..curPhase..", in wave = "..ncw..", nnext="..nnext)
		local bFound = false -- пока не нашли
		for nWave, dWave in pairs(container.aWaves) do
			if (dWave.nPhase == curPhase) and (dWave.n == nnext) then
				bFound = true	-- нашли
				container.nCurrentWave = nWave	-- запомнили номер следующей волны
				if container.aWaves[nWave].nState then -- если волна уже запускалась, сообщим об этом
					PvE_Common:slog("!============ cMission="..container.aMissions[nTier]..", Next Wave for Phase = "..curPhase..", is = "..nWave..", already in state="..container.aWaves[nWave].nState)
				end
				container.aWaves[nWave].nState = 1	-- обнулили состояние волны
				container.nTimerWave = container.nWaitWaveTime -- включаем таймер запуска
				break -- дальше можно не искать
			end
		end
		
		if not bFound then	-- а нету следующей волны, что странно, но может быть кончились
			container.nCurrentWave = 0		-- а нету новой волны
			PvE_Common:slog("!============ cMission="..container.aMissions[nTier]..", Next Wave not found for Phase = "..curPhase..", Last wave = "..ncw)
		end
	else	-- новую волну искать не надо
		if container.nTimerWave > 0 then -- идёт отсчёт до старта волны
			container.nTimerWave = container.nTimerWave - dt	-- ждём
		else -- таймер не включен или прошёл
			-- Состояние волн и порталов: 1-не запущен, но дана команда, 2-в процессе запуска, 3-запущен, 4-закрыт (= 0 не было)
			if w then -- есть текущая волна
				-- тут надо в зависимости от состояния волны делать разные вещи, состояния: не запущена, запускается, запущена, закрывается...
				if w.nState == 1 then -- волна ещё не запущена
					if not w.nWaveUseCount then
						w.nWaveUseCount = 1
					else
						w.nWaveUseCount = w.nWaveUseCount + 1
					end
					
					PvE_Common:slog("============ Wave activation Phase = "..curPhase..", Wave = "..ncw.." nWaveUseCount="..w.nWaveUseCount)
					-- выбираем порталы для запуска
					local cnt = w.nMinPortals
					if w.nMaxPortals - w.nMinPortals > 0 then cnt = cnt + math.random(w.nMaxPortals - w.nMinPortals + 1) - 1  end	-- определяем конкретное число порталов
					--PvE_Common:slog("cnt="..cnt.." w.nMaxPortals="..w.nMaxPortals.." w.nMinPortals="..w.nMinPortals)
					
					if not w.aMainPortals then w.aMainPortals = {} end
					w.aPortalsUse = {unpack(w.aMainPortals)}	-- будущий список порталов
					local aPortalsSrc = {unpack(w.aPortals)}	-- копируем список возможных порталов, будем потом его резать
					
					local i, n
					for i = 1, cnt do
						n = math.random(#aPortalsSrc)	-- выбираем какой=то конкретный портал и копируем его номер в список порталов волны
						table.insert(w.aPortalsUse, aPortalsSrc[n])
						table.remove(aPortalsSrc, n)
					end

					-- активация порталов
					for i = 1, #w.aPortalsUse do
						if container.aPortals[w.aPortalsUse[i]].nState and (container.aPortals[w.aPortalsUse[i]].nState > 1) then	-- портал то уже что-то делает!
							PvE_Common:slog(i.."/"..#w.aPortalsUse.." ============ cMission="..container.aMissions[nTier]..", Phase = "..curPhase..", wave = "..ncw.." Portal = "..w.aPortalsUse[i].." already in state = "..container.aPortals[w.aPortalsUse[i]].nState)
						else
							--PvE_Common:slog(i.."/"..#w.aPortalsUse.." ============ cMission="..container.aMissions[nTier]..", Phase = "..curPhase..", wave = "..ncw.." Portal = "..w.aPortalsUse[i].." activated 1st time ")
						end
						container.aPortals[w.aPortalsUse[i]].nPatrolUseCount = 0
						container.aPortals[w.aPortalsUse[i]].nState = 1	-- обработчик порталов пусть на это реагирует
					end
					
					w.nState = 2 -- волна теперь считается в процессе запуска

				elseif w.nState == 2 then -- волна в процессе запуска
					-- тут надо проверить, все ли порталы открылись чтобы считать волну полностью запущенной (возможны варианты с блокировкой спавна!)
					local bStarted = true
					for i = 1, #w.aPortalsUse do
						if container.aPortals[w.aPortalsUse[i]].nState < 2 then	-- портал всё ещё не открылся
							bStarted = false	-- чтобы волна считалась запущенной надо чтобы все порталы открылись, одного не открытого достаточно, чтобы ждать
							break
						end
					end
					
					if bStarted then
						w.nState = 3 -- все порталы открыты - волна полностью запущена
						PvE_Common:slog("============ Wave active Phase = "..curPhase..", Wave = "..ncw)
					end
					
					-- фаза 0я: волна запущена (или перезапущена)
					w.timer = nil -- сброс таймера респавна волны
					--w.bRespawnTimerActive = nil -- таймер ещё не взводился

				elseif w.nState == 3 then -- волна полностью запущена
					-- тут надо следить за состоянием порталов (они ниже обрабатываются), если все закрыты - то волну надо завершать и запускать следующую bChangeWave = true

					local bFinished = true
					local nBotsCount = 0 -- сколько всего ботов в волне осталось
					local i
					for i = 1, #w.aPortalsUse do
						if container.aPortals[w.aPortalsUse[i]].nState < 4 then	-- портал всё ещё не закрыт
							if container.aPortals[w.aPortalsUse[i]].nBotsCount then
								nBotsCount = nBotsCount + container.aPortals[w.aPortalsUse[i]].nBotsCount -- плюсуем ботов
								--PvE_Common:slog(i.."/"..#w.aPortalsUse.." ============ Wave Phase = "..curPhase..", Wave = "..ncw..", Portal = ".. w.aPortalsUse[i] ..", nBotsCount = "..container.aPortals[w.aPortalsUse[i]].nBotsCount )
							else
								--PvE_Common:slog(i.."/"..#w.aPortalsUse.." ============ Wave Phase = "..curPhase..", Wave = "..ncw..", Portal = ".. w.aPortalsUse[i] ..", no nBotsCount!!!")
							end
							bFinished = false
							--break
						else
							--PvE_Common:slog(i.."/"..#w.aPortalsUse.." ============ Wave Phase = "..curPhase..", Wave = "..ncw..", Portal = ".. w.aPortalsUse[i] ..", nState = ".. container.aPortals[w.aPortalsUse[i]].nState)
						end
					end
					
					-- фаза 1я: ботов много
					--if not w.timer and w.nRespawnTimer and nBotsCount>container.nBotsCountToRespawn then	-- у волны есть таймер на респавн, и ботов хоть когда-то было больше нормы (защита от ложно срабатывания на старте волны)
						--w.bRespawnTimerActive = true	-- таймер теперь может включиться
						--PvE_Common:slog("============ Wave respawn timer ON Phase = "..curPhase..", Wave = "..ncw..", nBotsCount = "..nBotsCount )
					--elseif not w.bRespawnTimerActive then
						--PvE_Common:slog("============ Wave respawn timer OFF Phase = "..curPhase..", Wave = "..ncw..", nBotsCount = "..nBotsCount )
					--end
					
					-- фаза 2я: ботов стало мало, активируем таймер
					if not w.timer and w.nRespawnTimer and nBotsCount<container.nBotsCountToRespawn then	-- у волны готов таймер на респавн, и осталось ботов меньше нормы
						w.timer = w.nRespawnTimer -- запускаем
						PvE_Common:slog("============ Wave respawn timer RUN Phase = "..curPhase..", Wave = "..ncw..", nBotsCount = "..nBotsCount )
					end

					-- фаза 3я: идёт осчёт на респавн
					if w.timer then
						if w.timer < 0 then -- время на учничтожение волны вышло - делаем респавн или запускаем следующую волну
							bFinished = true
							-- !!! тут надо бы всех старых ботов убить - а то волна поди не перезапустится (хотя х.з. надо проверить)
						else -- время волны ещё тикает
							w.timer = w.timer - dt
						end
					end
					
					if bFinished then
						PvE_Common:slog("============ Wave end Phase = "..curPhase..", Wave = "..ncw)
						
						-- но может быть перезапуск той же волны
						local nCount = 1
						if w.nCount then
							nCount = w.nCount
						end
						if w.nWaveUseCount < nCount then
							w.nState = 1 -- надо запустить ещё раз волну
						else
							w.nState = 4 -- все порталы закрыты - волна закончилась
							container.bChangeWave = true	-- просим следующую волну
						end
						
					end
					
				end
			end
		end
	end
end

-- функция обработчик порталов, они живут своей жизнью, постоянно мониторят ботов
PvE_Common.PortalsUpdate = function (self, container, dt, curPhase, nTier)
	local nPortal, dPortal
	
	-- разовая инициализация массива имём порталов
	if not container.aPortalsName2Id then
		container.aPortalsName2Id = {}
		-- пробегаем по порталам на карте, и запоминаем соответсвие имени и id
		local i, pid, name
		for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
			name = Entities[pid]:GetName()
			container.aPortalsName2Id[name] = pid
		end
	end

	local aBots = {} -- объединённый список кораблей и каргошипов, чтобы делать провери единообразно в одном месте
	container.aPatrolsBotsCount = {} -- список патрулей, у которых есть живые корабли (теперь доступен извне)
	local aPatrols = container.aPatrolsBotsCount
	local ii, id, defname
	local bossalive = false
	-- пробежимся по всем кораблям и каргошипам
	for ii, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		aBots[#aBots+1] = Entities[id]
		defname = Entities[id]:GetDefName()
		if container.aBoss[defname] then -- босс жив
			bossalive = true
			if not container.boss_id then -- первое появление, запоминаем и сообщаем в клиент
				container.boss_id = id
				PvE_Common:slog("!=== boss on id = "..container.boss_id, 10)
				if Game_IsServer() then
					ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", defname )	--id
				else
					PvE_Common.UI.PveEvents:SetBossId( defname )	--id
				end
			elseif not container.boss_id == id then -- что за фигня - другой босс!
				PvE_Common:slog("!!!=== Error second boss found oldid = "..container.boss_id.." newid = "..id)
			end
		end
	end
	
	if container.boss_id and not bossalive then -- босс был, но кончился, сообщаем клиенту
		PvE_Common:slog("!=== boss off id = "..container.boss_id, 11)
		container.boss_id = nil
		if Game_IsServer() then
			ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId")
		else
			PvE_Common.UI.PveEvents:SetBossId()
		end
	end
	
	for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
		aBots[#aBots+1] = Entities[id]
	end
	
	--запомним из каких они патрулей, посчитаем даже количество
	local bot, cPatrol
	for ii = 1, #aBots do
		bot = aBots[ii]
		if bot then
			if bot:GetRelationshipGroup() == 2 or bot:GetRelationshipGroup() == ai.RelationshipGroups.Alien then	-- тут не уверен что это корректно, может алиенты тоже будут
				if not bot:IsDead() then
					cPatrol = bot:GetAISquadName()
					PvE_Common:slog("=== Found bot from patrol = "..cPatrol, 51, 100)
					if aPatrols[cPatrol] then
						aPatrols[cPatrol] = aPatrols[cPatrol] + 1
					else
						aPatrols[cPatrol] = 1
					end
				end
			end
		end
	end
	--PvE_Common:slog("=== Portal open = "..#aPatrols.." bots alive = "..#aBots, 2, 50)

	-- открытые порталы проверить надо и возможно закрыть, или запустить закрытие...
		-- если портал открыт и его нет в текущей фазе - надо закрыть (считаем что порталы не используются повторно, хотя бы в тех фазах что могут запуститься в процессе закрытия)
	for nPortal, dPortal in pairs(container.aPortals) do
	
		if dPortal.cPatrolName and aPatrols[dPortal.cPatrolName] then -- для портал определён патруль и есть боты из него, переносим количество ботов в портал - для дельнейшего более удобного использования
			dPortal.nBotsCount = aPatrols[dPortal.cPatrolName]
		else
			dPortal.nBotsCount = nil
		end
		
		-- смотрим состояние самого портала как энтити
		if dPortal.nTimer then
			if dPortal.nTimer > 0 then -- анимация закрытия идёт
				dPortal.nTimer = dPortal.nTimer - dt
			else
				if dPortal.Portal then
					dPortal.Portal:FullActivate(false)
				else
					-- !!! а нет самого портала, возможно стоит об этом сообщить, а можно просто проигнорить
					PvE_Common:slog("======= Portal = "..dPortal.cPortal.." not found (close)")
				end
				dPortal.nTimer = false
			end
		end

		-- смотрим состояни патрулей из портала
		if not dPortal.nState then
			---!!!логично спрятать портал тут или до начала миссии вообще
			dPortal.Portal = Entities[container.aPortalsName2Id[dPortal.cPortal]]
			if dPortal.Portal then
				dPortal.Portal:FullActivate(false)
			else
				-- !!! а нет самого портала, возможно стоит об этом сообщить, а можно просто проигнорить
				PvE_Common:slog("======= Portal = "..dPortal.cPortal.." not found (init)")
			end

			dPortal.nState = 0
		end
		
		if dPortal.nState == 1 then	-- портал надо открыть
			-- надо выбрать патруль для запуска, и запомнить его имя
			local nPatrol = math.random(#dPortal.aPatrolNames)
			--PvE_Common:slog("======= Portal = "..dPortal.cPortal..", #dPortal.aPatrolNames = "..#dPortal.aPatrolNames..", nPatrol = "..nPatrol)
			dPortal.cPatrolName = dPortal.aPatrolNames[nPatrol]
			
			SV_Pve_AISquadSpawn(dPortal.cPatrolName)
			
			-- надо помнить какой по счёту патруль пошёл спортала
			if not dPortal.nPatrolUseCount then dPortal.nPatrolUseCount = 0 end
			dPortal.nPatrolUseCount = dPortal.nPatrolUseCount + 1
			
			-- сам портал надо включить открытие
			dPortal.Portal = Entities[container.aPortalsName2Id[dPortal.cPortal]]
			if dPortal.Portal then
				dPortal.Portal:FullActivate(true)
				dPortal.Portal:SV_SetActivity( "7", false )	-- дефолтная анимация вращения
			else
				-- !!! а нет самого портала, возможно стоит об этом сообщить, а можно просто проигнорить
				PvE_Common:slog("======= Portal = "..dPortal.cPortal.." not found (open)")
			end
			dPortal.nTimer = false	-- если был таймер на закрытие - то сбросим его
			
			dPortal.nState = 2 -- считаем что мы в процессе
		elseif dPortal.nState == 2 then	-- портал открывается, но ждём пока из него вылетят
			if aPatrols[dPortal.cPatrolName] then	-- есть корабли с патруля
				PvE_Common:slog("======= Portal = "..dPortal.cPatrolName.." is spawned squad")

				dPortal.nTimer = container.nClosePortalTime -- прятать портал после этого времени (чтобы не болтался и не отвлекал игроков)
				if dPortal.Portal then
					dPortal.Portal:SV_SetActivity( "8", false ) -- анимацию закрытия портала запустили
				else
					-- !!! а нет самого портала, возможно стоит об этом сообщить, а можно просто проигнорить
					PvE_Common:slog("======= Portal = "..dPortal.cPortal.." not found (closing)")
				end
				dPortal.nState = 3 -- считаем что портал открыт
			end
		elseif dPortal.nState == 3 then	-- портал открыт, смотрим анимацию закрытия и не убиты ли все боты
			if not aPatrols[dPortal.cPatrolName] then	-- кораблей с нашего патруля не осталось
				PvE_Common:slog("======= Portal = "..dPortal.cPortal.." Patrol="..dPortal.cPatrolName.." has no active bots")
				local nCount = 1
				if dPortal.nCount then
					nCount = dPortal.nCount
				end
				
				if dPortal.nPatrolUseCount < nCount then	-- надо запустить ещё патруль
					dPortal.nState = 1
				else -- всё патрули кончились, надо отрубать портал
					dPortal.nState = 4
				end
			end
		end
	end -- перебор порталов
end

-- функция вызывается каждый кадр
PvE_Common.OnUpdateRound = function (self, container, dt, curPhase, nTier)

	self.nPvETimer = self.nPvETimer + dt

	-- обработчик порталов
	PvE_Common:PortalsUpdate(container, dt, curPhase, nTier)

	-- обработчик волн
	PvE_Common:WavesUpdate(container, dt, curPhase, nTier)

	-- обработчик фаз
	PvE_Common:PhasesUpdate(container, dt, curPhase, nTier)

	-- обработчик эвентов
	PvE_Common:EventsUpdate(container, dt, curPhase, nTier)
	
	AID:Update( dt )
	
	if PvE_Common.nWinCommand then	-- завершение миссии
		if Game_IsServer() then	-- зачищаем возможные остатки информации на предыдущих пве на клиентах #75782
			ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_PveEventsReset")
		else
			CL_PveEventsReset()
		end
		return PvE_Common.nWinCommand, PvE_Common.nWinReason
	end
	
end


math.randomseed(math.floor(GetU64Time().l%10000))
PvE_Common:slog("!!!================================= ".. math.floor(GetU64Time().l%10000) )


sys.execscript( 'gamedata/shared/pve_missions/gen_phases.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_desttown.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_transit_emp_rock_frontier.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_wave_nalnifan_gate_lumen.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_wave_planet_war.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1550_pve_bigship_building.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1550_pve_bigship_building_2.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1550_pve_asteroid_building.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1550_pve_capture_repairbase.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1347_pve_loot_geostation.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1515_piratebay.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_jericho_base.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_raid_waterharvest.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_raid.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_frozen_station.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s8256_pve_raid_planetoid.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_debrissite.lua' )
sys.execscript( 'gamedata/shared/pve_missions/s1550_pve_newbie_mission.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_temple_of_last_hope.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_rescue_pirates_base.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_magnificent_seven.lua' )
sys.execscript( 'gamedata/shared/pve_missions/pve_stealth.lua' )
--sys.execscript( 'gamedata/shared/pve_missions/football_championship.lua' )
--sys.execscript( 'gamedata/shared/pve_missions/sirius_debrissite_2.lua' )

PvE_Missions.TestMission = 
{
	levelName = "test_ai",
	
	desc = "",
	--exp_mul = "",
	--min_iLvl = 30, 
	item_lvl  = 18, -- по этому числу настраивается лут и деньги ( обычно в других геймплеях это средний илвл кораблей игрока )
	-- на 18.12.12   т1= 16 т2 =18 т3 = 20 т4 = 22
	bot_difficulty = 3,
	bot_preset_name = PvE_breckets.hi[3],
	
	turret_health_coef = 1.5,
	turret_damage_coef = 1.3,
	
	rounds = 
	{
		[ 1 ] =
		{
			type = "TRANSPORT_ATTACK",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 1,
			player_spawn_group = 1,
			--success_timer = 300,
			
			modifiers =
			{
				{ spell = "TestPveBuff",	caster_group = 1, },
				{ spell = "TestPveBuff",	caster_group = 1, },
				{ spell = "TestPveBuff",	caster_group = 2, },
			},

			start_sentence = "CMDR_PVE_START_ROUND_TRANSPORT_ATTACK",
			start_event = 
			{
				{  target = "FlakGun1", action = "EnableAi", },
				{  target = "FlakGun2", action = "FullActivate", },
				{  target = "FlakGun3", action = "FullActivate", },
				{  target = "FlakGun4", action = "FullActivate", },
			},

			waves =
			{
				[ 1 ] = 
				{
					max_agents_at_same_time = 10,
					{	def = "Ship_Bot_Meat_R1_S_T2", count = 1, spawn_group = 11, spawn_warp = true, delay = 3, repeat_time = 5.0, require_entity = "TowerStation1", },
					{	def = "Ship_Bot_Meat_R1_S_T2", count = 1, spawn_group = 12, spawn_warp = true, delay = 3, repeat_time = 5.0, require_entity = "TowerStation2", },
					{	def = "Ship_Bot_Meat_R1_S_T2", count = 1, spawn_group = 13, spawn_warp = true, delay = 3, repeat_time = 5.0, require_entity = "TowerStation3", },
					{	def = "Ship_Bot_Meat_R1_M_T2", count = 1, spawn_group = 1, spawn_warp = true, delay = 150, ui_notification = true, },
				},
			},

			transport_to_fail = 2, 
			transport = 
			{
				{	def = "CargoShip", path = "TransportPath1", delay = 0, },
				{	def = "CargoShip", path = "TransportPath2", delay = 10, },
				{	def = "CargoShip", path = "TransportPath3", delay = 20, },
				{	def = "CargoShip", path = "TransportPath1", delay = 30, },
				{	def = "CargoShip", path = "TransportPath2", delay = 40, },
				{	def = "CargoShip", path = "TransportPath3", delay = 50, },
			},
		},
		
		[ 2 ] =
--[[		{
			type = "SECTOR_CAPTURE",
			exp_reward_portion = 2,
			cred_reward_portion = 2,
			loot_attempts_reward = 1,
			player_spawn_group = 3,

			sabotage_list = { "ControlStationA1", "ControlStationC1", },

			start_event = 
			{
				{  target = "FlakGun1", action = "Remove", },
			},

			waves =
			{
				[ 1 ] = 
				{
					{	def = "Ship_Bot_Meat_R1_S_T2", count = 5, spawn_group = 0, spawn_warp = true, delay = 0, repeat_time = 30.0, },
					{	def = "Ship_Bot_Meat_R1_M_T2", count = 5, spawn_group = 0, spawn_warp = true, delay = 0, },
				},
			},
		},	

		[ 3 ] = 
]]		
		{
			type = "TRANSPORT_DEFENCE",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			start_sentence = "CMDR_PVE_START_ROUND_TRANSPORT_DEFENCE",
			modifiers =
			{
				{ spell = "TestPveBuff",	caster_group = 2, },
			},

			waves =
			{
				[ 1 ] = 
				{
					{	def = "Ship_Bot_Meat_R1_S_T2", count = 3, spawn_group = 0, spawn_warp = false, repeat_time = 30.0, },
					{	def = "Ship_Bot_Meat_R1_M_T2", count = 3, spawn_group = 0, spawn_warp = false, delay = 0, },
				},
			},

			transport_to_fail = 2, 
			transport = 
			{
				{	def = "CargoShip", path = "TransportPath4", delay = 0, },
				{	def = "CargoShip", path = "TransportPath5", delay = 10, },
				{	def = "CargoShip", path = "TransportPath4", delay = 20, },
				{	def = "CargoShip", path = "TransportPath5", delay = 45, },
				{	def = "CargoShip", path = "TransportPath4", delay = 55, },
				{	def = "CargoShip", path = "TransportPath5", delay = 65, },
			},
		},
	},
}

-- БЗС стартует в 4,13,18,20 рейд не должен наслаиваться на парвый час БЗС + турниры в воскресенье 1, 17, 19 длительность час
-- 0 понедельник, минимальный период - час, всё по GMT
-- работает с i по j часов + 1 
--- последние правки от SC-114650 15.02.2021
RaidSchedule =
{
    { time = "0.0-0.0", level = "s8256_pve_raid_planetoid" },
    { time = "0.2-0.2", level = "s8256_pve_raid_planetoid" },
    { time = "0.4-0.4", level = "s8256_pve_raid_planetoid" },
    { time = "0.6-0.6", level = "s8256_pve_raid_planetoid" },
    { time = "0.8-0.8", level = "s8256_pve_raid_planetoid" },
    { time = "0.10-0.10", level = "s8256_pve_raid_planetoid" },
    { time = "0.12-0.12", level = "s8256_pve_raid_planetoid" },
    { time = "0.14-0.14", level = "s8256_pve_raid_planetoid" },
    { time = "0.16-0.16", level = "s8256_pve_raid_planetoid" },
    { time = "0.18-0.18", level = "s8256_pve_raid_planetoid" },
    { time = "0.20-0.20", level = "s8256_pve_raid_planetoid" },
    { time = "0.22-0.22", level = "s8256_pve_raid_planetoid" },

    { time = "1.0-1.0", level = "pve_raid_waterharvest" },
    { time = "1.2-1.2", level = "pve_raid_waterharvest" },
    { time = "1.4-1.4", level = "pve_raid_waterharvest" },
    { time = "1.6-1.6", level = "pve_raid_waterharvest" },
    { time = "1.8-1.8", level = "pve_raid_waterharvest" },
    { time = "1.10-1.10", level = "pve_raid_waterharvest" },
    { time = "1.12-1.12", level = "pve_raid_waterharvest" },
    { time = "1.14-1.14", level = "pve_raid_waterharvest" },
    { time = "1.16-1.16", level = "pve_raid_waterharvest" },
    { time = "1.18-1.18", level = "pve_raid_waterharvest" },
    { time = "1.20-1.20", level = "pve_raid_waterharvest" },
    { time = "1.22-1.22", level = "pve_raid_waterharvest" },

    { time = "2.0-2.0", level = "pve_raid" },
    { time = "2.2-2.2", level = "pve_raid" },
    { time = "2.4-2.4", level = "pve_raid" },
    { time = "2.6-2.6", level = "pve_raid" },
    { time = "2.8-2.8", level = "pve_raid" },
    { time = "2.10-2.10", level = "pve_raid" },
    { time = "2.12-2.12", level = "pve_raid" },
    { time = "2.14-2.14", level = "pve_raid" },
    { time = "2.16-2.16", level = "pve_raid" },
    { time = "2.18-2.18", level = "pve_raid" },
    { time = "2.20-2.20", level = "pve_raid" },
    { time = "2.22-2.22", level = "pve_raid" },

    { time = "3.0-3.0", level = "s8256_pve_raid_planetoid" },
    { time = "3.2-3.2", level = "s8256_pve_raid_planetoid" },
    { time = "3.4-3.4", level = "s8256_pve_raid_planetoid" },
    { time = "3.6-3.6", level = "s8256_pve_raid_planetoid" },
    { time = "3.8-3.8", level = "s8256_pve_raid_planetoid" },
    { time = "3.10-3.10", level = "s8256_pve_raid_planetoid" },
    { time = "3.12-3.12", level = "s8256_pve_raid_planetoid" },
    { time = "3.14-3.14", level = "s8256_pve_raid_planetoid" },
    { time = "3.16-3.16", level = "s8256_pve_raid_planetoid" },
    { time = "3.18-3.18", level = "s8256_pve_raid_planetoid" },
    { time = "3.20-3.20", level = "s8256_pve_raid_planetoid" },
    { time = "3.22-3.22", level = "s8256_pve_raid_planetoid" },

    { time = "4.0-4.0", level = "pve_raid" },
    { time = "4.2-4.2", level = "pve_raid" },
    { time = "4.4-4.4", level = "pve_raid" },
    { time = "4.6-4.6", level = "pve_raid" },
    { time = "4.8-4.8", level = "pve_raid" },
    { time = "4.10-4.10", level = "pve_raid" },
    { time = "4.12-4.12", level = "pve_raid" },
    { time = "4.14-4.14", level = "pve_raid" },
    { time = "4.16-4.16", level = "pve_raid" },
    { time = "4.18-4.18", level = "pve_raid" },
    { time = "4.20-4.20", level = "pve_raid" },
    { time = "4.22-4.22", level = "pve_raid" },


    { time = "5.0-5.0", level = "pve_raid_waterharvest" },
    { time = "5.2-5.2", level = "pve_raid_waterharvest" },
    { time = "5.4-5.4", level = "pve_raid_waterharvest" },
    { time = "5.6-5.6", level = "pve_raid_waterharvest" },
    { time = "5.8-5.8", level = "pve_raid_waterharvest" },
    { time = "5.10-5.10", level = "pve_raid_waterharvest" },
    { time = "5.12-5.12", level = "pve_raid_waterharvest" },
    { time = "5.14-5.14", level = "pve_raid_waterharvest" },
    { time = "5.16-5.16", level = "pve_raid_waterharvest" },
    { time = "5.18-5.18", level = "pve_raid_waterharvest" },
    { time = "5.20-5.20", level = "pve_raid_waterharvest" },
    { time = "5.22-5.22", level = "pve_raid_waterharvest" },

    { time = "6.0-6.0", level = "pve_raid_waterharvest" },
    { time = "6.2-6.2", level = "pve_raid" },
    { time = "6.4-6.4", level = "s8256_pve_raid_planetoid" },
    { time = "6.6-6.6", level = "pve_raid_waterharvest" },
    { time = "6.8-6.8", level = "pve_raid" },
    { time = "6.10-6.10", level = "s8256_pve_raid_planetoid" },
    { time = "6.12-6.12", level = "pve_raid_waterharvest" },
    { time = "6.14-6.14", level = "pve_raid" },
    { time = "6.16-6.16", level = "s8256_pve_raid_planetoid" },
    { time = "6.18-6.18", level = "pve_raid_waterharvest" },
    { time = "6.20-6.20", level = "pve_raid" },
    { time = "6.22-6.22", level = "s8256_pve_raid_planetoid" },

}


-------------------------------------------------------------------
---  Хранение и управления данными по евентам на клиенте  ---------
-------------------------------------------------------------------

PvE_Common.UI = {}	-- слой для UI, сохраняю уже готовые рабочие функции (минимальный набор)

if PvE_Common.UI.PveEvents then
	return	
end

PvE_Common.UI.PveEvents = {}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function PvE_Common.UI.PveEvents:ActivatePVEEvent( id, time_max, target_max, target_def, reward, param )
	--sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent() id="..id)

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end

	if id == "" then
		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: empty id" )
		return
	end

	if type( time_max ) == "number" then
		if time_max < 0 and time_max ~= -1 then
			sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid time_max (%s)", tostring( time_max ) )
			time_max = -1
		end
	else
		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid type of the 2-nd parameter (\"time_max\"); \"number\" expected, got \"%s\"", type( time_max ) )
		time_max = -1
	end

	if type( target_max ) ~= "number" then
		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid type of the 3-rd parameter (\"target_max\"); \"number\" expected, got \"%s\"", type( target_max ) )
		target_max = 0
	end

	if type( target_def ) ~= "table" then
		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid type of the 4-th parameter (\"target_def\"); \"table\" expected, got \"%s\"", type( target_def ) )
		target_def = {}
	end

	for defIdx, defName in pairs( target_def ) do
		if type( defIdx ) ~= "number" or type( defName ) ~= "string" then
			sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: invalid format of table \"target_def\"; <number>=<string> expected, got <%s>=<%s>", type( defIdx ), type( defName ) )
			target_def = {}
			break			
		end
	end

	local event = self.events[ id ]

	if not event then

		event = self:MakeEmptyEvent()
		event.id = id
		self.events[ id ] = event

	else

    	if event.bActive then
    		sys.log( "PvE_Common.UI.PveEvents:ActivatePVEEvent()[ERROR]: event %s is already active", id )
    	end

	end

	event.startTime		= _G.MasterServer_GetServerTime() or u64( _G.TimerGetGameTime() * 1000 )	-- TimerGetGameTime чтобы не было ошибки если нет мультиплеера
	event.duration		= time_max
	event.valMax		= target_max
	event.valCur		= 0
	event.targetDefs	= target_def
	event.bActive		= true
	event.bCompleted	= false
	event.bSuccess		= false
	if not reward then reward = 0.1 end
	event.reward		= reward
	event.descParams	= param

	UI:OnPveEventAcivate( id )

end


--
function PvE_Common.UI.PveEvents:CompletePVEEvent( id )

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:CompletePVEEvent()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end

	local event = self.events[ id ]

	if not event then
		sys.log( "PvE_Common.UI.PveEvents:CompletePVEEvent()[ERROR]: cannot find data for event %s", id )
		return
	end

	if event.bCompleted then
		sys.log( "PvE_Common.UI.PveEvents:CompletePVEEvent()[ERROR]: event %s is already completed", id )
		return
	end

	if not event.bActive then
		sys.log( "PvE_Common.UI.PveEvents:CompletePVEEvent()[ERROR]: event %s is not active", id )
		return
	end

	event.bActive		= false
	event.bCompleted	= true
	event.bSuccess		= true

	UI:OnPveEventComplete( id )

end


--
function PvE_Common.UI.PveEvents:FailPVEEvent( id )

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:FailPVEEvent()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end

	local event = self.events[ id ]

	if not event then
		sys.log( "PvE_Common.UI.PveEvents:FailPVEEvent()[ERROR]: cannot find data for event %s", id )
		return
	end

	if event.bCompleted then
		sys.log( "PvE_Common.UI.PveEvents:FailPVEEvent()[ERROR]: event %s is already completed", id )
		return
	end

	if not event.bActive then
		sys.log( "PvE_Common.UI.PveEvents:FailPVEEvent()[ERROR]: event %s is not active", id )
		return
	end

	event.bActive		= false
	event.bCompleted	= true
	event.bSuccess		= false

	UI:OnPveEventComplete( id )

end


--
function PvE_Common.UI.PveEvents:UpdatePVEEvent( id, target_current )

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:UpdatePVEEvent()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end

	if type( target_current ) ~= "number" then
		sys.log( "PvE_Common.UI.PveEvents:UpdatePVEEvent()[ERROR]: invalid type of the 2-nd parameter (\"target_current\"); \"number\" expected, got \"%s\"", type( target_current ) )
		target_current = 0
	end

	local event = self.events[ id ]

	if not event then
		sys.log( "PvE_Common.UI.PveEvents:UpdatePVEEvent()[ERROR]: cannot find data for event %s", id )
		return
	end

	if event.bCompleted then
		sys.log( "PvE_Common.UI.PveEvents:UpdatePVEEvent()[ERROR]: event %s is already completed", id )
		return
	end

	if not event.bActive then
		sys.log( "PvE_Common.UI.PveEvents:UpdatePVEEvent()[ERROR]: event %s is not active", id )
		return
	end

	event.valCur = target_current

	UI:OnPveEventProgress( id )

end


--
function PvE_Common.UI.PveEvents:Reset()

	self.events		= {}
	self.boss_id	= -1

end


--
function PvE_Common.UI.PveEvents:GetEvents()

	return self.events

end


--
function PvE_Common.UI.PveEvents:GetEvent( id )

	local event = nil

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:GetEvent()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return event
	end

	local event = self.events[ id ]

	if not event then
		sys.log( "PvE_Common.UI.PveEvents:GetEvent()[ERROR]: cannot find data for event %s", id )
	end

	return event

end


--
function PvE_Common.UI.PveEvents:IsEventActive( id )

	local bActive = false

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:IsEventActive()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return bActive
	end

	local event = self.events[ id ]

	if event then
		bActive = event.bActive
	else
		sys.log( "PvE_Common.UI.PveEvents:IsEventActive()[ERROR]: cannot find data for event %s", id )
	end

	return bActive

end


--
function PvE_Common.UI.PveEvents:IsEventCompleted( id )

	local bCompleted = false
	local bSuccess = false 

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:IsEventCompleted()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return bCompleted, bSuccess
	end

	local event = self.events[ id ]

	if event then
		bCompleted	= event.bCompleted
		bSuccess	= event.bSuccess
	else
		sys.log( "PvE_Common.UI.PveEvents:IsEventCompleted()[ERROR]: cannot find data for event %s", id )
	end

	return bCompleted, bSuccess

end


--
function PvE_Common.UI.PveEvents:IsEventCompletedSuccessfull( id )

	local bSuccess = false

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:IsEventCompletedSuccessfull()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return bSuccess
	end

	local event = self.events[ id ]

	if not event then
		sys.log( "PvE_Common.UI.PveEvents:IsEventCompletedSuccessfull()[ERROR]: cannot find data for event %s", id )
		return bSuccess
	end

	if not event.bCompleted then
		sys.log( "PvE_Common.UI.PveEvents:IsEventCompletedSuccessfull()[ERROR]: event %s is not completed", id )
		return bSuccess
	end

	bSuccess = event.bSuccess

	return bSuccess

end


--
function PvE_Common.UI.PveEvents:GetEventStarTime( id, bLogErrors )

	local startTime = PvE_Common.UI.INVALID_U64_ID

	if bLogErrors ~= nil then
		if type( bLogErrors ) ~= "boolean" then
			bLogErrors = nil
		end
	end

	if bLogErrors == nil then
		bLogErrors = true
	end

	if type( id ) ~= "string" then
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventStarTime()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		end
		return startTime
	end

	local event = self.events[ id ]

	if event then
		startTime = event.startTime
	else
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventStarTime()[ERROR]: cannot find data for event %s", id )
		end
	end

	return startTime

end


--
function PvE_Common.UI.PveEvents:GetEventDuration( id, bLogErrors )

	local duration = -1

	if bLogErrors ~= nil then
		if type( bLogErrors ) ~= "boolean" then
			bLogErrors = nil
		end
	end

	if bLogErrors == nil then
		bLogErrors = true
	end

	if type( id ) ~= "string" then
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventDuration()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		end
		return duration
	end

	local event = self.events[ id ]

	if event then
		duration = event.duration
	else
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventDuration()[ERROR]: cannot find data for event %s", id )
		end
	end

	return duration

end


--
function PvE_Common.UI.PveEvents:IsEventLimitedByTime( id, bLogErrors )

	return PvE_Common.UI.PveEvents:GetEventDuration( id, bLogErrors ) ~= -1

end


--
function PvE_Common.UI.PveEvents:GetEventLeftTime( id, bLogErrors )

	local leftTime = -1

	if bLogErrors ~= nil then
		if type( bLogErrors ) ~= "boolean" then
			bLogErrors = nil
		end
	end

	if bLogErrors == nil then
		bLogErrors = true
	end

	if type( id ) ~= "string" then
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventLeftTime()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		end
		return leftTime
	end

	local event = self.events[ id ]

	if not event then
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventLeftTime()[ERROR]: cannot find data for event %s", id )
		end
		return leftTime
	end

	if event.duration == -1 then
		if bLogErrors then
			sys.log( "PvE_Common.UI.PveEvents:GetEventLeftTime()[ERROR]: event %s is not limited by time", id )
		end
		return leftTime
	end

	if event.bActive then

    	local curTime = _G.MasterServer_GetServerTime() or u64( _G.TimerGetGameTime() * 1000 )	-- TimerGetGameTime чтобы не было ошибки если нет мультиплеера
    	local endTime = event.startTime + event.duration * 1000

    	leftTime = 0
		if endTime > curTime then
			leftTime = ( endTime - curTime ).l * 0.001
		end

	else
		leftTime = 0
	end

	return leftTime

end


--
function PvE_Common.UI.PveEvents:GetEventTargetDefs( id )

	local targetDefs = {}

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:GetEventTargetDefs()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return targetDefs
	end

	local event = self.events[ id ]

	if event then
		targetDefs = event.targetDefs
	else
		sys.log( "PvE_Common.UI.PveEvents:GetEventTargetDefs()[ERROR]: cannot find data for event %s", id )
	end

	return targetDefs

end


--
function PvE_Common.UI.PveEvents:GetEventValCur( id )

	local valCur = 0

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:GetEventValCur()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return valCur
	end

	local event = self.events[ id ]

	if event then
		valCur = event.valCur
	else
		sys.log( "PvE_Common.UI.PveEvents:GetEventValCur()[ERROR]: cannot find data for event %s", id )
	end

	return valCur

end


--
function PvE_Common.UI.PveEvents:GetEventValMax( id )

	local valMax = 0

	if type( id ) ~= "string" then
		sys.log( "PvE_Common.UI.PveEvents:GetEventValMax()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return valMax
	end

	local event = self.events[ id ]

	if event then
		valMax = event.valMax
	else
		sys.log( "PvE_Common.UI.PveEvents:GetEventValMax()[ERROR]: cannot find data for event %s", id )
	end

	return valMax

end


------------------- boss
function PvE_Common.UI.PveEvents:SetBossId(cDefName) -- вызывается 2 раза на появление и на смерть босса (id = nil)
	local id

	if cDefName then -- закостылил на передачу имени, ибо id не обязаны совпадать на сервере и клиенте!
		--sys.log( "! PvE_Common.UI.PveEvents:SetBossId(id): cDefName = "..cDefName)
		id = GetEntityIdByDefName(cDefName)
		if not id then
			--sys.log( "!!! PvE_Common.UI.PveEvents:SetBossId(id): no id cDefName = "..cDefName)
			id = cDefName -- код может передать сразу число, по старому
			if type(id) ~= "number" then -- #75839 чтобы не палал ui, если босс не нашёлся на клиенте
				id = nil
			end
		end
	else
		--sys.log( "!!! PvE_Common.UI.PveEvents:SetBossId(id): no cDefName")
	end

	--[[if id then -- временное логгирование чтобы понять что происходит
		sys.log( "! PvE_Common.UI.PveEvents:SetBossId(id): old id = %s , new id = %s", self.boss_id, id )
		if Entities[id] then
			--sys.log( "! PvE_Common.UI.PveEvents:SetBossId(id): Entities[id].class = "..Entities[id].class )
		else
			sys.log( "!!! PvE_Common.UI.PveEvents:SetBossId(id): Entities[id] not found on client!!! ")
		end
	else
		sys.log( "! PvE_Common.UI.PveEvents:SetBossId(): old id = %s ", self.boss_id )
	end]]

	if id then
		--[[if self.boss_id > -1 then -- босса был и опять?
			sys.log( "PvE_Common.UI.PveEvents:SetBossId() - boss already in. old id = %s , new id = %s", self.boss_id, id )
		end]]
		-- но всё равно показываем, мало ли
		self.boss_id = id
		if not Game_IsServer() then
			UI:UIBossSpawned( id )
		else
			--sys.log( "! PvE_Common.UI.PveEvents:SetBossId(): no UI for UI:UIBossSpawned( id )")
		end
	elseif self.boss_id > -1 then -- босс был и помер
		if not Game_IsServer() then
			UI:UIBossRemoved()
		else
			--sys.log( "! PvE_Common.UI.PveEvents:SetBossId(): no UI for UI:UIBossRemoved()")
		end
		self.boss_id = -1
	else
		sys.log( "PvE_Common.UI.PveEvents:SetBossId()[ERROR]: boss not found")
	end

end

function PvE_Common.UI.PveEvents:GetBossId() -- возвращает id босса для интерфейса

	--return self.boss_id
	if self.boss_id > -1 then
		if Entities[self.boss_id] then
			return self.boss_id
		else
			sys.log( "PvE_Common.UI.PveEvents:GetBossId()[ERROR]: boss not found self.boss_id="..self.boss_id)
			return -1
		end
	else
		--sys.log( "PvE_Common.UI.PveEvents:GetBossId() no boss yet")
		return -1
	end

end



-- обвязка для вызовов ServerLuaRpcEx
function CL_PveEventsReset()
	PvE_Common.UI.PveEvents:Reset()
end

function CL_ActivatePVEEvent( id, time_max, target_max, target_def, reward, param )
	PvE_Common.UI.PveEvents:ActivatePVEEvent( id, time_max, target_max, target_def, reward, param )
end

function CL_UpdatePVEEvent( id, target_current )
	PvE_Common.UI.PveEvents:UpdatePVEEvent( id, target_current )
end

function CL_CompletePVEEvent( id )
	PvE_Common.UI.PveEvents:CompletePVEEvent( id )
end

function CL_FailPVEEvent( id )
	PvE_Common.UI.PveEvents:FailPVEEvent( id )
end


function CL_SetBossId(id)
	PvE_Common.UI.PveEvents:SetBossId(id)
end

--отображение wow сообщений
function ShowWow( text, positive, timer, param )
	UI:ShowWowMsg( text, positive, timer, param )   
end

--отображение диалогов
function PvE_Func:ShowDialogs( cDialog )
	SV_Pve_ScriptedNotification( cDialog )
end

--отображение прогрессбара
function CL_ShowProgressPhase( strId, nCurrent, nMax )
	UI:ShowPhaseProgressBar( strId, nCurrent, nMax )
end

--скрытие прогрессбара
function CL_HideProgressPhase()
	UI:HidePhaseProgressBar()
end

--создание источника света
function CL_LightSpawn( posX, posY, posZ, DefName )
	local light = ai.Spawn( DefName )
	local pos = Vec3( posX, posY, posZ )
	light:SetPos( pos )
end

-- ---------------------------
-- vars
-- ---------------------------

PvE_Common.UI.PveEvents.events	= {}
PvE_Common.UI.PveEvents.boss_id	= -1	-- когда босса нет то -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function PvE_Common.UI.PveEvents:MakeEmptyEvent()

	return
	{
		id			= "",
		startTime	= u64(0),	-- константы интерфейса не стоит использовать
		duration	= -1,
		valMax		= 0,
		valCur		= 0,
		targetDefs	= {},
		bActive		= false,
		bCompleted	= false,			
		bSuccess	= false,
		reward 		= 0.1, -- по умолчанию 10% серебра за евент
	}

end