-------------------
--   AI Director
-------------------
AICondition = {
	ArmorLessThen 	= 1,  -- процентное соотношение корпуса и макс корпуса меньше чем параметр.
	ShieldLessThen	= 2,
	Dist			= 3,  --  расстояние до таржета
	AngleMoreThen	= 4,  --  угол до таржета
	NotInFireSector = 5,
	DistMore		= 6,
	DistLess		= 7,
	VisibleTarget	= 8, 		-- цель жива и трейслайнится
	Target			= 9, 		-- есть живая цель bot.behavior_targetId
	NoTarget		= 10, 		-- нет живой цели
	TargetNotTrace	= 11, 		-- цель (ввсе цели) не на линии огня
	Behavior		= 12, 		-- у бота включен бехавиор
	Random			= 13, 		-- если рандом меньше парама то кондишен = валидный
	EmptyAgroList	= 14,
	LifeTimeMore	= 15, -- сколько цель живет в мире
	EnergyLessThen	= 16, -- процентное соотношение
}
-- танк с лучом, который "не дает стрелять таржету" на 2/3 постоянно. в радиусе 750м
-- танк от входящего урона кастает на себя супер ресист.
-- снайпер с ракетой - шаром / спавнит лужу сразу под игроком
-- снайпер спавнит неспешный сингуляро-шар
-- ударник - мясо или "поток ракет", в точку где был игрок
-- заградитель с туррелью. (надо разработать систему чтобы он ее ставил только перед игроком, затем уходит  в невидимость)
-- заградитель с замедлялкой в клозе
-- командник мясо? бафер по дамагу (надо разработать систему чтобы он ее ставил только под дамагом)
-- командник стреляет чайн лайтингом. причем сплеш урон растет в доп цель а не падает.
-- диверсант - ставит ядерку, с таймингом и улетает на расстояние безопасное
-- скаут  мясо?  спавнит тень / ворует щит / дает себе  невидимость на 3 секунды без самодиспела
-- рэб отрубает пушки/модули в клозе(1км) и начинает жечь игрока, освободится можно убив/засайленсить РЭБ

AID = { --ai director
	update_period 	= 0.1, -- раз в сколько вызываем апдейт
	next_update		= 0, -- время осталось до следующего апдейта
	
	max_packId = 0,
	bots = { }, -- список живых ботов
	packs = { }, -- список паков, внутри таблицы с ид кораблей
	modules = { },  -- список модулей, которыми управляет AID
	targets = { },  -- { { entityId = .., pos = ..} ... }, список игроков или целей которые можно пострелять
	spawnPos = { }, -- места где спавним мобов 
	maxBots = 25, -- максимум простых ботов (может быть больше на пак)
	max_dist = 300,
	respawnWaveTime = 22,
	portals = true,
	warp	= true,
	bonus_timeout = 0,  -- таймер чтобы сильно много не спавнить бонусов  "с мелочи"
	bonus_timeout_base =  3,  -- сколько делать задержку между спавнами бонусов
	bonus_enable = true,
}
-- AID = {   
-- max_packId = 1,
-- bots = {  -- список живых ботов
		--{
		--entityId =X , 
		--packId = X, 
		--target -- сквозной таржет, сохраняется при смене бехевиаров
		--avt = <таблица автомата>, 
		--avt_current = <id в таблица автомата>,  
		--avt_stack = ???, 
		--behavior = XX, 
		--behavior_targetId = XX, 
		--behavior_time = Z, 
		--behavior_targetPos = Vec3 
		--defName = 
		--healthMax = макс исло корпуса
		-- isDead =  true
		-- pos = Vec3()
		-- min_dist -- расстояние с которого бот добавляет врагов в агро таблицу - в ОМ
		--agroTable = { ... { targetId = targetId, startTime = cur_time, lastTime = cur_time, agro = agro, playerId = playerId } }, -- в ОМ
		--numAgroPlayers -- в ОМ сколько игроков-людей было отмечено в агроТаблице
		--},  
--}, 
-- packs = { idPack = { shipID1, .. },..},
-- modules = { },  -- список модулей, которыми управляет AID
-- targets = {  -- список игроков или целей которые можно пострелять
		--{ 
			--entityId = .., 
			--pos = ..
			--shield = -- щит на прошлом кадре			
			--health = --здоровье на прошлом кадре
			--summHP = sh:GetShieldMax() + sh:GetMaxHealth()
			--isDead = false
			--pain = 0, 
			--lastPainUpdate = 0, , 
		--} ... },  
-- spawnPos = { {entityId1 = .., pos = Vec3, {entityId2 ... }, -- места где спавним мобов
--
--}

function AID:OnStart()
	-- если мы в режиме отладки, то создаем "хак" корабль
 	AID:DebugOnStart()
	AID.clientFocusPoints = {}
end

function AID:Init()
	AID.GameMode = GetCurrentGameMode() -- =GetCurrentGameMode() =ai.Gameplay.FREE_SPACE ==ai.Gameplay.PVE_MISSION
-- ищем на карте все таг поинты с подстрокой в имени "Spawn_AI" и заносим их ID  в таблицу AID.spawnPos
	for i, v in pairs( GetEntitiesByClass("TagPoint") ) do
		local tp = Entities[v]
		if tp and string.match( tp:GetName(), "Spawn_AI" ) then 
			table.insert( AID.spawnPos, { entityId = v, pos = tp:GetPos() } )
		end
	end
end


function AID:Update( dt )
	if not AID.GameMode then 
		AID.GameMode = GetCurrentGameMode()
		AID.battlefieldRadius = GetBattlefieldRadius() -- размер карты, чтобы не спавнится за границей
		AID.battlefieldRadius2 = AID.battlefieldRadius * AID.battlefieldRadius --^2 размер чтобы быстро смотреть расстояния
	end
	
	-- этот блок только в ПВЕ
	if AID.GameMode == ai.Gameplay.PVE_MISSION then
		AID:UpdatePain( dt )
		AID:Portals( dt )
	end
	
	AID.next_update = AID.next_update + dt
	if AID.next_update >= AID.update_period then  
		---------------------------
		-- Начало "редкого апдейта" апдейта 
		---------------------------
		-- апдейтим всех ботов
		AID:BotsUpdate( AID.next_update )
		--апдейт модулей
		AID:UpdateModules( AID.next_update ) -- AID_next_update = AID.next_update несколько  dt

		-- что то делаем только в ПВЕ что то только в Фри-Спейс/ мишинскрипт
		if AID.GameMode == ai.Gameplay.PVE_MISSION or AID.GameMode == ai.Gameplay.TUTORIAL then 
			--обновляем таржеты (ПЛЕЕРОВ)
			AID:FindTargets()				
			-- если ботов мало, то создаем еще		
			if ( not disable_bots ) then 
				AID:GenerateBots( AID.next_update )--порождаем врагов	
			end
			-- синкронизируем марки-цели в ПВЕ
			AID:UpdateMarks( AID.next_update ) 
		else
			-- апдейт "системы агро"
			AID:UpdateAgro( AID.next_update )
		end
		AID.next_update = 0
	end

--Debug (дебажная отрисовка)
	AID:DebugDraw( dt )
	if track_id then
		local target = Entities[ track_id ]
		if target then
			--RuleConsole( "e_jump ".. tostring( track_id ) )
			SetCameraAimPos( target:GetPos() ) 
			if #( GetCameraPos() - target:GetPos() ) >10 then
				SetCameraPos( target:GetPos() + 10*( GetCameraPos() - target:GetPos() ):GetNormalized() )
			end
		end
	end
end

-- Управление агро мобов
--bot.agroTable[ targetId ] = { targetId = targetId, startTime = cur_time, lastTime = cur_time, agro = agro, playerId = playerId }
function AID:UpdateAgro( dt )
	local cur_time = TimerGetGameTime()
	local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
	--составляем список всех кораблей - целей на карте
	local ships = {}
	for i, v in pairs( GetAllSpaceShips() ) do
		local ship = Entities[v]
		if ship then
			table.insert( ships, { id = v, pos = ship:GetPos(), rel = ship:GetRelationshipGroup(), playerIdx = ship:GetPlayerIdx() } )
		end
	end
	for i, bot in pairs( AID.bots ) do
		if not bot.isDead then
			local b_ship = Entities[ bot.entityId ]
			if not b_ship then 
				break
			end
			local b_relationship = b_ship:GetRelationshipGroup()
			--смотрим есть ли  у бота агро таблица
			if not bot.agroTable then
				bot.agroTable = {}     --{ targetId = , startTime=,  lastTime = , agro = }
			end
			--обнуляем агро, если 20 секунд таржет не был агрессивен
			for j, agroTarget in pairs( bot.agroTable ) do
				if cur_time - agroTarget.lastTime > 20 then 
					bot.agroTable[ j ] = nil
				end
			end
			--добавляем в агро лист тех врагов что рядом, или обновляем их агро 
			local min_dist = bot.min_dist and ( bot.min_dist * bot.min_dist ) or ( 150 * 150 )
			for k, ship in pairs( ships ) do
				-- если бот не он сам и бот и шип враги...
				if ( ship.id ~= bot.entityId ) and ( RelationshipTable:GetRelationship( b_relationship, ship.rel ) == ai.RelatioshipType.ENEMY ) then 
					if SquareLen( bot.pos, ship.pos ) < min_dist then  -- SquareLen = век3:LengthSq()
						AID:AddAgro( bot, ship.id, 0, 100 ) -- 0 добавочное агро, 100  минимальное агро
					end
				end
			end
		end
	end
end

-- вызывается из активного Mission:SV_OnSpaceShipDamage( victimIdx, attackers ) 
-- для жертвы смотрим - надо ли добавить агро против агрессора и добавляем
function AID:AddAgroByDamage( victimIdx, attackers )
	local bot = AID:GetBot( victimIdx ) --victimIdx - наш моб?
	if bot then
		for attacker_, damage in pairs( attackers ) do
			local attacker = tonumber( attacker_ )
			-- проверяем есть ли у цели ХП - чтобы считать ее врагом + это не витал поинт (удар-таран об витал поинт засчитываетсякак атака витал-поинта)
			local ent = Entities[ attacker ]
			if ent and ent:GetMaxHealth() > 0 and ( not( Def[ ent:GetDefName() ].class == "VitalPoint" ) ) then
				AID:AddAgro( bot, attacker, damage )
			end
		end
	end
end

-- добавляем|обновляем боту bot запись о новом агрессоре,  +время агрессии +размер агро,  min_agro - агро не может быть меньше этого типа выставить мин
-- disablePackAgro - не вызывать агро для членов сквада
function AID:AddAgro( bot, targetId, agro, min_agro_, disablePackAgro ) -- 
	if bot and targetId then
		local min_agro = min_agro_ and min_agro_ or 0
		-- только враги растят агро! 
		local ship = AID:GetShip( bot )
		local shipAgressor = Entities[ targetId ]
		if 	shipAgressor and ship and 
			ai.Relationship:GetRelationship( shipAgressor:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == ai.RelatioshipType.ENEMY then
			local cur_time = TimerGetGameTime()
			if not bot.agroTable then -- мало ли... еще не создали
				bot.agroTable = {}     --{ targetId = , startTime=,  lastTime = , agro = }
			end
			if not bot.agroTable[ targetId ] then
			-- вставляем в агро таблицу новый источник агро (если его еще не было)
				-- а не игрок живой ли это?
				local playerId = shipAgressor:GetPlayerIdx()
				playerId = ( playerId >= 0 ) and playerId or nil
--[[ 									local  h_players = GetAllPlayersInfo()
									if h_players then
										for i, player in pairs( h_players ) do
											if player and ( not player.isBot ) and player.entityId == targetId then
												playerId = player.playerId
												break
											end
										end
									end			 ]]
									--=Def[ shipAgressor:GetDefName() ].signature
									--=ai.Signature.HUGE
				local isHuge = Def[ shipAgressor:GetDefName() ].signature and Def[ shipAgressor:GetDefName() ].signature == ai.Signature.HUGE -- для супер бафа против худже
				bot.agroTable[ targetId ] = { targetId = targetId, startTime = cur_time, lastTime = cur_time, agro = agro, playerId = playerId, isHuge = isHuge }
			elseif agro then
				--добавляем агро, обновляем время
				bot.agroTable[ targetId ].agro = bot.agroTable[ targetId ].agro + agro
				bot.agroTable[ targetId ].lastTime = cur_time
			end
			if min_agro then
				--выставляем "минимум" агро если надо 
				bot.agroTable[ targetId ].agro = ( bot.agroTable[ targetId ].agro > min_agro ) and bot.agroTable[ targetId ].agro or min_agro
			end
			-- расскажем друганам что на нас напали!
			if #AID.packs[ bot.packId ] > 1 and not( disablePackAgro ) then
				for i, v in pairs( AID.packs[ bot.packId ] ) do
					local comrad = AID:GetBot( v )
					if comrad and comrad ~= bot then
						AID:AddAgro( comrad, targetId, agro/10, 0, true )
					end
				end
			end
		end
	end
end

-- удаляем цель из всех агро таблиц
function AID:AgroRemoveTargetId( targetId )
	for i, bot in pairs( AID.bots ) do
		if bot.agroTable and bot.agroTable[ targetId ] then
			bot.agroTable[ targetId ] = nil
		end
	end
end



		--апдейт модулей
function AID:UpdateModules( AID_next_update ) -- AID_next_update = AID.next_update несколько  dt
		for i, m in pairs( AID.modules ) do --m = { shipId = ship:GetId(), moduleN = i, AIRules = Def[m:GetDefName()].AIRules, update_time = 0, }
			if m and m.shipId then 
				m.update_time = m.update_time + AID_next_update
				--пришло время апдейтить модуль
				if  m.AIRules.period and m.update_time >= m.AIRules.period then 
					local ship = Entities[ m.shipId ] 
					--корабль есть, он не мертв, модуль есть, условия активации есть
					if ship and ( not ship:IsDead() ) and ship:GetModule( m.moduleN ) and m.AIRules.conditions
						and not ( ship:GetModule( m.moduleN ):IsCoolingDown() ) and not ( ship:GetModule( m.moduleN ):IsActive() ) then --оставил проверки для быстродействия, можно закомментить
						if AID:IsConditionsValid( ship, m.AIRules.conditions, m.bot ) then -- условия активации совпадают
							local result = false
							if m.AIRules.useTargetModule then
								--активация модуля типа с прицеливанием (фиринг модуле), возвращает успешность применения
								result = ship:AI_ActivateModule( m.moduleN )
							else
								-- активация просто модуля, возвращает успешность применения
								result = ship:SV_ActivateModule( m.moduleN )
							end
							
							-- вызов "луа функции" из модуля, если модуль смог сработать
							if result and m.AIRules.func and AID[ m.AIRules.func ] then
								AID[ m.AIRules.func ]( ship, m.bot, m.AIRules.func_params )
							end
							
							if m.AIRules.debug then
								sys.out( string.format( "Activate module %s, successful: %s", ship:GetModule( m.moduleN ):GetDefName(), result ) )
							end
						end
					end
					m.update_time = 0
				end
			end
		end
end

function AID:BotsUpdate( dt )
	--поведение ботов
	local numBots = 0
	if AID.bonus_timeout > 0 then
		AID.bonus_timeout = AID.bonus_timeout - dt
	end	
	for i, bot in pairs( AID.bots ) do
		if not bot.isDead then
			local ship = Entities[ bot.entityId ]
			if ship and ( not ship:IsDead() ) and ( not bot.removed ) then 
				numBots = numBots + 1
				AID:BotUpdate( bot, ship, dt )
			elseif ( ship and ship:IsDead() and ( not bot.isDead ) ) or ( not bot.isDead ) then
				AID:OnBotDeath( bot )
				-- как то удалить надо мертвого бота
			end
		end
	end
	AID.numBots = numBots
	
end


function AID:UpdateMobs( dt )

end



function AID:UpdateMarks( dt )
-- создание таблицы для отрисовки худа
-- Primary objectives (золотые)
	if ( Game_IsServer() ) or ( not Game_IsClient() ) then  
		local clientFocusPoints = {}  --AID.clientFocusPoints
		if PvE_Mission and PvE_Mission.aPhases and PvE_Mission.nCurPhase > 0 and PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId then
			local m = 	type(PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId ) == "table" and PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId or 
					type(PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId ) == "number" and { PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].tId }			
			for i, v in pairs( m ) do
				local o = Entities[ v ]
				if o then
					local defName = o:GetDefName()
					local need_attack = Def[defName].damageable and not ( Def[defName].class == "VitalPoint" ) and true or false -- цель можно атаковать ботам!
					table.insert( clientFocusPoints, { pos = o:GetPos(), id = o:GetId(), networkId = o:GetNetworkId(), defName = defName, need_attack = need_attack, main_obj = true } )
				end
			end
		end
		-- secondry objectives (синие)
		if PvE_Mission.aAdditionalTargetId and #PvE_Mission.aAdditionalTargetId > 0 then
			for i, v in pairs( PvE_Mission.aAdditionalTargetId ) do
				local o = Entities[ v ]
				if o then
					local defName = o:GetDefName()
					local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
					local is_enemy = RelationshipTable:GetRelationship( o:GetRelationshipGroup(), 2 ) == 2
					local need_attack = Def[defName].damageable and not ( Def[defName].class == "VitalPoint" ) and is_enemy and true or false -- цель можно атаковать ботам!
					table.insert( clientFocusPoints, { pos = o:GetPos(), id = o:GetId(), networkId = o:GetNetworkId(), defName = defName, need_attack = need_attack, main_obj = false } )
				end
			end
		end
		
		-- смотрим надо ли синхронизировать клиент
		local res = false
		if clientFocusPoints and AID.clientFocusPoints and #clientFocusPoints ~= #AID.clientFocusPoints then 
			res = true
		elseif #clientFocusPoints > 0 then
			for i, v in pairs( AID.clientFocusPoints ) do
				if v.id ~= clientFocusPoints[i].id then
					res = true
					break
				end
			end
		end

	if PvE_Mission.bFocusPoints == true then				
		--синхронизируем клиент
		-- с задержкой, так как на клиенте объект может еще не существовать.
		if AID.clientFocusPoints_syncTimeout and AID.clientFocusPoints_syncTimeout > 0 then
			AID.clientFocusPoints_syncTimeout = AID.clientFocusPoints_syncTimeout - dt
			if AID.clientFocusPoints_syncTimeout <= 0 then
				if Game_IsServer() then
					ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FocusPointsClear", 0 )
					for i, v in pairs( clientFocusPoints ) do
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FocusPointsAdd", v.networkId, v.main_obj )
					end
				else
					CL_FocusPointsClear(0)
					for i, v in pairs( clientFocusPoints ) do
						--CL_FocusPointsAdd( v.pos.x, v.pos.y, v.pos.z, v.defName, v.main_obj )
						CL_FocusPointsAdd( v.networkId, v.main_obj )
					end
					--CL_FocusPointsUpdate( clientFocusPoints )
				end
			end
		end
	end
		-- записываемся на синхронизацию с задержкой
		if res then 
			AID.clientFocusPoints_syncTimeout = 0.25
			AID.clientFocusPoints = clientFocusPoints
		end
	end
end


function CL_FocusPointsClear( n )
	if cl_FocusPoints then 
		for i,v in pairs(cl_FocusPoints) do
			if v.id then 
				UI:HideHudMarkNotify( v.id )
			end
		end
	end
	cl_FocusPoints =  {}
end



--function CL_FocusPointsAdd( posX,posY,posZ, defName, mark_type )
function CL_FocusPointsAdd( networkId, mark_type )
	--mark_type_ = mark_type or 5
	--=ai.GetNetworkEntity(97)
	local ent_mark = { networkId = networkId, mark_type = mark_type   } --id = v
	
	local o = networkId and ai.GetNetworkEntity( networkId ) or nil
	if o then 
		ent_mark.id = o:GetId()
		UI:ShowHudMarkNotify( ent_mark.id, mark_type )
	end
--[[ 	for i, v in pairs( GetEntitiesByDef( defName ) ) do
		if v then
			local o = Entities[v]
			if o and #( o:GetPos() - ent_mark.pos ) < 150 then
				--table.insert( cl_FocusPoints, { pos= Vec3( posX, posY, posZ ), defName = defName, id = v })				
				--UI:OnRemoveEntityFromHud( v )
				--UI.HudObjectsMarksWnd:AddMark( v, mark_type_ ) --=UI.HudObjectsMarksWnd.objTypes				
				--UI:ShowHudMarkNotify( v, true )
				
				--теперь это все и в Mission:CL_OnUpdate( dt )
				ent_mark.id = v
				UI:ShowHudMarkNotify( v, mark_type )  --
			else 
				--sys.log( "ERROR: On client Object with def: " .. defName .. " not found" )
			end
		end
	end
 ]]
	table.insert( cl_FocusPoints, ent_mark )
end



--разные поведения ботов
AID.Dive = {}  -- поведение: пролет - пикирование "мимо игрока"
--находим точку позади врага и летим в нее
function AID.Dive:Start( ship, bot, param )
	if lua_debug then dprint("AID.Dive:Start") end
	local res = false
	local fly_from_player = 220
	local dist = param or -20
	
	local targetId = AID:GetTargetForBot( ship, bot )
	--local target = targetId and AID.targets[ t_ind ] or nil
	if targetId then
		bot.behavior_targetId = targetId
		local t = Entities[ bot.behavior_targetId ]
		if t then 
			-- пока ищем простую точку, без учета камней и без нормальной длины пути "за игроком", всегда под игроком.
			--local d =(t:GetPos() - ship:GetPos() + Vec3( 0, -50, 0 )):GetNormalized()
			bot.behavior_targetPos = ship:GetPos() + (t:GetPos() - ship:GetPos() + Vec3( 0, dist, 0 )):GetNormalized() * ( #(t:GetPos() - ship:GetPos()) + fly_from_player )
			local ent, pos, normal = TraceLine( ship:GetPos(), bot.behavior_targetPos, true )
			if pos then 
				if #( pos - ship:GetPos()) < 150 then
					bot.behavior_targetPos = t:GetPos()
				else
					bot.behavior_targetPos = pos
				end
			end
			
			--ship:AI_NewOrder( ai.AiOrder.ENTITY_ATTACK, ai.AiTargetType.ENTITY, t ) -- типа чтобы корабль залочил таржет
			--ship:AI_Attack( t )
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos ) --s:AI_NewOrderPos( ai.AiOrder.RETREAT_TO_POINT, ai.AiTargetType.POSITION, s:GetPos() )
			
			--ship:AI_NewOrder( ai.AiOrder.RETREAT, ai.AiTargetType.ENTITY, t )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = ship:GetPos(), p2 = bot.behavior_targetPos, color = 255*256* 256 + 255*256 + 110} )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = ship:GetPos(), p2 = t:GetPos(), color =  110} )
			bot.behavior = "Dive"
			bot.behavior_time = 0
			res = true
		else 
			if lua_debug then dprint("AID.Dive:Start taked target not valid") end
		end
	else 
		if lua_debug then dprint("AID.Dive:Start  not  found valid target") end
	end
	return res
end
--проверяем не пора ли закончить, то есть не слишком ли мы близко к точке.
function AID.Dive:Update( dt, ship, bot )
	--local behavior_time = bot.behavior_time
	bot.behavior_time = bot.behavior_time + dt
	local behavior_maxtime = 30
	local behavior_delta_target = 22
	local pos = ship:GetPos()
	if ( #( pos - bot.behavior_targetPos ) < behavior_delta_target ) or ( bot.behavior_time > behavior_maxtime ) or    -- прилетели  или  летим оч долго или
				( dt > 0 and bot.behavior_time > 1 and bot.behavior_pos and #( bot.behavior_pos - pos ) / ( dt ) < 1 ) then -- стоим на месте
		-- переходим из этого поведения в другое
		AID:SetNewBehavior( ship, bot )
	end
	bot.behavior_pos = pos
end


AID.DefendShip = {}  -- поведение: охранять другой корабль, bot.config.behavior_guardEntityId или(исключающее) который "первее в паке" если такого в паке нет, то вернем false
AID.DefendShip.DURATION = 3
function AID.DefendShip:Start( ship, bot, param )
	if lua_debug then dprint( "AID.DefendShip:Start" ) end

	local ship = Entities[ bot.entityId ]

	local target = AID:GetTargetForBot( ship, bot ) --target_type ??
	if target then 
		bot.behavior_targetId = target
	end

	local res = false
	local masterId = nil  -- на выходе тут получим айди кого охранять либо нил
	local master = nil
	if bot.config and bot.config.behavior_guardEntityId then  -- охрана конкретного парня из конфига (босса ОW)
		masterId = bot.config.behavior_guardEntityId
		master = Entities[ masterId ]
		if not ( master and not master:IsDead() ) then -- если мастер мертв то он не катит
			masterId = nil
		end
	else  -- охрана другого моба из той же группы
		if bot and bot.packId and AID.packs[ bot.packId ] then -- возьмем пак бота и пройдемся по нему, разберемся, кто живой, кого охранять... 
			for i, v in pairs( AID.packs[ bot.packId ] ) do
				if bot.entityId == v then
					break -- охраняем только более главный корабль, а главный тот кто первый встретился, если дошли до себя то охранять больше некого
				end
				master = Entities[ v ]
				if master and not master:IsDead() then
					masterId = v
					break
				end
			end
		end
	end
	if masterId and master then
		--ship:AI_NewOrder( ai.AiOrder.ENTITY_DEFEND, ai.AiTargetType.ENTITY, master ) -- не стреляет
		--ship:AI_NewOrder( ai.AiOrder.PLAYER_DEFEND, ai.AiTargetType.ENTITY, master ) -- не летает
		local masterBot = AID:GetBot( masterId )
		-- высчитываем точку назначения через 3 секунды
		local dist = master.GetLinearVelocity and #master:GetLinearVelocity() * AID.DefendShip.DURATION or 50 * AID.DefendShip.DURATION
		local targetPos = nil
		if masterBot and masterBot.behavior_guardPos then
			targetPos = masterBot.behavior_guardPos
		elseif masterBot and masterBot.behavior_targetPos and masterBot.pos and #( masterBot.pos - masterBot.behavior_targetPos ) < dist then
			targetPos = masterBot.behavior_targetPos
		else
			targetPos = master:GetPos()+ master:GetDir() * dist
		end		
		if bot.config and bot.config.shift_from_entity then
			bot.behavior_targetPos = targetPos + bot.config.shift_from_entity
		else
			--выставляем место назначения нашего бота, где то рядом с мастер ботом
			-- masterBot -- запоминает где относительно его конкретно этот моб тусит
			local shift = nil
			masterBot.childBotsPos = masterBot.childBotsPos or {}  -- мастер боту создаем таблицу аддов если ее не было
			for ind, childBotPos in pairs( masterBot.childBotsPos ) do   -- смотрим может уже считали шифт адда относительно мастера
				if childBotPos.id == bot.entityId then
					shift = childBotPos.shift
					break
				end
			end
			if not shift then  -- если не считали еще, то считаем и записываем
				local a = math.random() * 3.14159 * 2
				local r = 30
				shift = Vec3( r * math.sin( a ), math.random( 2 * r ) - r, r * math.cos( a ) ) -- размещаем всех на цилиндре вокруг
				table.insert( masterBot.childBotsPos, { shift = shift, id = bot.entityId } )
			end
			bot.behavior_targetPos = targetPos + shift  -- выставляем финальную точку
		end
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
	--=ai.AiOrder.SQUAD_PURSUIT
	--ship:AI_NewOrderPos( ai.AiOrder.SQUAD_PURSUIT, ai.AiTargetType.POSITION, bot.behavior_targetPos )
		bot.behavior_masterId = masterId
		bot.old_behavior = bot.behavior
		bot.behavior = "DefendShip"
		bot.behavior_time = 0
		res = true
	end
	return res
end
function AID.DefendShip:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	local master = Entities[ bot.behavior_masterId ]
	if master and ( not master:IsDead() ) and bot.behavior_time < AID.DefendShip.DURATION then
		-- проще каждый раз бехевиор запускать чем обновлять точку цели раз в кадр
--[[ 		if #( bot.behavior_targetPos - ship:GetPos() ) < 30 then  -- or #( master:GetPos() - ship:GetPos() ) > 40
			bot.behavior_targetPos = master:GetPos()+ master:GetDir() * 100 + Vec3(60, 0 ,0 )
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
		end ]] 
	else
		AID:SetNewBehavior( ship, bot )
	end
end



AID.DefendPlayerShip = {} -- защита игрока
function AID.DefendPlayerShip:Start( ship, bot, param )
	if lua_debug then dprint( "AID.DefendPlayerShip:Start" ) end
	local res = false
	local masterId = bot.behavior_targetId  -- на выходе тут получим айди кого охранять либо нил
	local master = masterId and Entities[ masterId ] or nil
	if ( not master ) or ( master and master:IsDead() ) then 
		for i, v in pairs( AID.targets ) do
			if ( not v.isBot ) and v.entityId and Entities[ v.entityId ] and ( not Entities[ v.entityId ]:IsDead() ) then
				masterId = v.entityId
				master = masterId and Entities[ masterId ]
			end
		end
	end
	if masterId and master then
		--ship:AI_NewOrder( ai.AiOrder.ENTITY_DEFEND, ai.AiTargetType.ENTITY, master ) -- не стреляет
		--ship:AI_NewOrder( ai.AiOrder.PLAYER_DEFEND, ai.AiTargetType.ENTITY, master ) -- не летает
		bot.behavior_targetPos = master:GetPos()+ master:GetDir() * 35 + Vec3(60, 0 ,0 )
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
		bot.behavior_targetId = masterId
		bot.old_behavior = bot.behavior
		bot.behavior = "DefendPlayerShip"
		bot.behavior_time = 0
		res = true
	end
	return res
end
function AID.DefendPlayerShip:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	local master = Entities[ bot.behavior_targetId ]
	if master and ( not master:IsDead() ) then
		if ( #( bot.behavior_targetPos - ship:GetPos() ) < 50 and bot.behavior_time > 3  ) or bot.behavior_time > 15 then  -- or #( master:GetPos() - ship:GetPos() ) > 40
			bot.behavior_targetPos = master:GetPos()+ master:GetDir() * 70 + Vec3(30, 0 ,0 )
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
			bot.behavior_time = 0
			dprint( "DefendPlayerShip:Update" ) 
		end
	else
		bot.behavior_targetId = nil
		AID:SetNewBehavior( ship, bot )
	end
end

------------------------------------------------------------------------------
-- Преследование корабля
AID.HuntShip = {} -- 
-- у корабля может быть цель -- охота на корабль (например полиция на игрока)
-- если цель далеко - бросаем все и летим к ней,
-- иногда видим даже невидимку и летим к ней (к месту где была цель)
-- добавляем в агро нашу цель +1000  иногда (если агро лист не пуст)
-- должен быть таймер -- когда долго нет цели, переход на деспавн но это видимо на уровне автомата надо делать, а не здесь
function AID.HuntShip:Start( ship, bot, param )
	if lua_debug then dprint( "AID.HuntShip:Start" ) end
	local res = false
	local masterId = bot.targetId  -- на выходе тут получим айди кого охранять либо нил
	local master = masterId and Entities[ masterId ] or nil
	if masterId and master then  -- цель существует
		if TimerGetGameTime() - bot.spawn_timer < bot.behavior_ttl then  -- бот живет меньше отведеного времени			 
			--ship:AI_NewOrder( ai.AiOrder.ENTITY_DEFEND, ai.AiTargetType.ENTITY, master ) -- не стреляет
			--ship:AI_NewOrder( ai.AiOrder.PLAYER_DEFEND, ai.AiTargetType.ENTITY, master ) -- не летает
			AID:AddAgro( bot, masterId, 100 ) -- обноввляем агро, так как цель есть, чтобы не улетел корабль-охотник
			if (( master:GetPos() - bot.pos ):LengthSq() > 62500 ) then -- дальше 2.5 км
				bot.behavior_targetPos = master:GetPos()+ master:GetDir() * 35 + Vec3(60, 0 ,0 )   --!!!
				ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
			end
			bot.behavior_targetId = masterId
			bot.old_behavior = bot.behavior
			bot.behavior = "HuntShip"
			bot.behavior_time = 0
			res = true
		end
	end
	return res
end
function AID.HuntShip:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	local master = Entities[ bot.behavior_targetId ]
	if master and ( not master:IsDead() ) and bot.behavior_time < 6 then
		--
	else
		AID:SetNewBehavior( ship, bot )
	end
end


------------------------------------------------------------------------------
-- экшин поведение "прятаться" 
AID.Hide = {} 
--  1 летим за камень
--  2 если камень не обнаружен, то по дигонали от цели
function AID.Hide:Start( ship, bot, param )
	if lua_debug then dprint("AID.Hide:Start") end
	local res = false
	-- тут живет корабль от которого прячемся. пока это первый корабль в списке, но потом надо выбрать тот который ближе к нам из  тех что стреляют  по нам
	bot.behavior_targetId = AID:GetTargetForBot( ship, bot )
	local target = bot.behavior_targetId and Entities[ bot.behavior_targetId ] or nil
	-- target     ===  bot.behavior_targetId --
	--bot.behavior_targetPos -- место где корабль должен прятаться
	if ship and target then
		--ищем другана за спиной которого мождно спрятаться
		local allypos = AID:GetAllyHideSpot( ship, bot, 350, target:GetPos(), nil  ) --( my_ship, my_bot, maxDist2Hide, targetPos, dist2Target  )
		if not allypos then
			bot.behavior_targetPos = HideSpot( ship, target ) -- ищем валидное место "прятаться" за камнем
		else 
			bot.behavior_targetPos = allypos
			if lua_debug then
				sys.out("close!")
				table.insert( AID.debug_draw, { draw_type = 1, p1 = bot.pos, p2 = allypos, color = 245} )
			end
		end
		if  not bot.behavior_targetPos then 
			local dir = ( ship:GetPos() - target:GetPos() ):GetNormalized() 
			local add = Vec3(0,0,0)
			CrossProduct( dir, Vec3( 1, 0, 0 ), add )  -- тут в add перпендикуляр ветору корабль - цель
			bot.behavior_targetPos = 45 * ( dir + add ) + ship:GetPos() --  под 45градусов кудато отлетает  --!!! по хорошему надо перенаправлять ближе к центру
			if #bot.behavior_targetPos > 750 then -- если улетаем куда то вдаль, то лучше лететь назад вниз/вверх
				if #( ship:GetPos() - Vec3( 0, 200, 0 )) <  #( ship:GetPos() - Vec3( 0, -200, 0 ) ) then
					bot.behavior_targetPos = Vec3( 0, 200, 0 )
				else 
					bot.behavior_targetPos = Vec3( 0, -200, 0 )
				end
			end
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = ship:GetPos(), p2 = bot.behavior_targetPos, color = 20} )
		else
			-- если прятаться назначено "рядом", то немного летим "дальше"
			if #( bot.behavior_targetPos - ship:GetPos() ) < 110 then 
				bot.behavior_targetPos = bot.behavior_targetPos + ( bot.behavior_targetPos - ship:GetPos() ):GetNormalized() * 30 -- чуть чуть дальше пролетаем, если где то рядом
			end
		end
		if bot.behavior_targetPos then 
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
			bot.old_behavior = bot.behavior
			bot.behavior = "Hide"
			bot.behavior_time = 0
			res = true
		end
	end
	return res
end
function AID.Hide:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	local min_hide_time = 2  -- не может этот экшин длиться меньше.
	local max_hide_time = 5  -- не может этот экшин длиться дольше.
	local epsilon_to_pos = 12  -- *10 метров до точки считаем что долетели.
	local master = Entities[ bot.behavior_targetId ]
	-- если цель еще жива или мы не долетели до точки назначения или мы летели слишком не долго, то
	if  ( min_hide_time > bot.behavior_time )
		or ( master and ( not master:IsDead() ) and #( bot.behavior_targetPos - ship:GetPos() ) > epsilon_to_pos and bot.behavior_time < max_hide_time ) then
		-- do fly_from_player
	else
		-- вроде как пора заняться чем то еще
		AID:SetNewBehavior( ship, bot )
	end
end


-- специальное поведение "моб выставляет портал и ждет пока он зарядится" как гоблин в диабло
AID.EscapeByPortal = {} 
function AID.EscapeByPortal:Start( ship, bot, param )
	if lua_debug then dprint("AID.EscapeByPortal:Start") end
	-- порождаем портал
 	local g = ai.Spawn( "PvE_Gen_Portal" )
	if g and ship then
		bot.PortalId = g:GetId()
		local r = ship:GetRot()
		g:SetPos( ship:GetPos() + 5 * ship:GetDir() )
		g:SetRot( r * Quat( 0.5, 0, 0, 0.5 ) ) 

		ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship )
		bot.total_max_health = ship:GetShieldMax() + ship:GetMaxHealth()
		bot.percent_health = (ship:GetHealth() + ship:GetShieldVal())/ bot.total_max_health
		bot.behavior = "EscapeByPortal"
		bot.behavior_time = 0
		if param then 
			bot.behavior_timeEnd = param
		else
			bot.behavior_timeEnd = 12
		end
		return true
	 end 
end

--  апдейт
function AID.EscapeByPortal:Update( dt, ship_, bot )
	bot.behavior_time = bot.behavior_time + dt
	local ship = Entities[ bot.entityId ]
	if bot.behavior_time > bot.behavior_timeEnd then  -- в эвентах заканчивать будем при 30 -- другой проверяльщик этого же таймера в апдейте евента
	-- успех моба 		
		if ship and  ( not ship:IsDead() ) and ( not bot.removed ) then
			bot.removed = true
			AID:RemoveShip( ship, bot.entityId ) -- Mission:SV_OnSpaceShipKill( bot.entityId, {} ) + ship:Remove()
			AID.EscapeByPortal:Cancel( bot )
		end
	elseif bot.percent_health - ( ship:GetHealth() + ship:GetShieldVal() )/ bot.total_max_health > 0.15 then 	
		AID.EscapeByPortal:Cancel( bot )
		bot.behavior_time = 0
		AID:SetNewBehavior( ship, bot )
	end
end

-- вызываем если бехевиор был прерван. например смертью
function AID.EscapeByPortal:Cancel( bot )
	local e = bot.PortalId and Entities[ bot.PortalId ]
	if e then 
		bot.PortalId = nil
		e:Remove()
	end
end
---- если сюда попали, то самоубиваемся
AID.DieAndBlow = {} 
function AID.DieAndBlow:Start( ship, bot, param )
	if lua_debug then dprint("AID.DieAndBlow:Start") end
	ship:DieAndBlow()
	bot.behavior = "DieAndBlow"
	bot.behavior_time = 0
	return true
end
--  апдейт
function AID.DieAndBlow:Update( dt, ship_, bot )
end




-- экшин поведение "выбрать цель"  мгновенное
AID.FindTarget = {} 
function AID.FindTarget:Start( ship, bot, param )
	if lua_debug then dprint("AID.FindTarget:Start") end
	-- тут живет корабль от которого прячемся. пока это первый корабль в списке, но потом надо выбрать тот который ближе к нам из  тех что стреляют  по нам
	local res = AID:GetTargetForBot( ship, bot ) --target_type ??
	if res == bot.behavior_targetId then 
		res = false
	else 
		bot.behavior_targetId = res
		bot.behavior = "FindTarget"
		bot.behavior_time = 0
		local t = Entities[ bot.behavior_targetId ]
		if t then 
			ship:AI_NewOrder( ai.AiOrder.ENTITY_ATTACK, ai.AiTargetType.ENTITY, t ) -- типа чтобы корабль залочил таржет
		end
	end
	return res
end
-- в следующий апдейт выходим из этого экшина
function AID.FindTarget:Update( dt, ship, bot )
	AID:SetNewBehavior( ship, bot )
end

-- экшин поведение "лететь на цель" 
AID.FlyToDistanceShoot = {} 
function AID.FlyToDistanceShoot:Start( ship, bot, param )
	if lua_debug then dprint("AID.FlyToDistanceShoot:Start") end
	-- 
	if bot.behavior_targetId and Entities[ bot.behavior_targetId ] then
		local enemy_pos = Entities[ bot.behavior_targetId ]:GetPos()
		local my_pos = ship:GetPos()
		local dist = param or 250
		local shiftFromRock = 8
		
				--ищем другана за спиной которого мождно спрятаться
		local allypos = AID:GetAllyHideSpot( ship, bot, 250, enemy_pos, dist  ) --( my_ship, my_bot, maxDist2Hide, targetPos, dist2Target  )
		if not allypos then
			-- если не нашли то просто летим прочь
			bot.behavior_targetPos = ( my_pos - enemy_pos ):GetNormalized() * ( dist - #( my_pos - enemy_pos ) ) + my_pos
			local ent, pos, normal = TraceLine( enemy_pos, bot.behavior_targetPos, true ) -- проверка может там камень и туда лететь не стоит
			-- если оперируем внутри карты то летим 
			if ( pos and AID.battlefieldRadius2 and pos:LengthSq() < AID.battlefieldRadius2 ) or ( pos and ( not AID.battlefieldRadius2 )) then
				bot.behavior_targetPos = pos + normal * shiftFromRock
				--!!!  else    написать код, который вибирает точку слева или справа от врага на расстоянии dist, ту которая ближе к центру, сейчас не пишу чтобы версию не сломать перед эвентом, но фича нужна
			else  -- пока почти тоже самое но низ-верх это по простому, но право лево возможно меньше путает игрока
				bot.behavior_targetPos = enemy_pos + ( enemy_pos - my_pos ):GetNormalized() * dist + Vec3( 0, ( -50 ) * my_pos.y / math.abs( my_pos.y ) ,0 )
				ent, pos, normal = TraceLine( enemy_pos, bot.behavior_targetPos, true ) -- проверка может там камень и туда лететь не стоит
				if pos then
					bot.behavior_targetPos = pos + normal * shiftFromRock
				end
			end
		else 
			bot.behavior_targetPos = allypos
			if lua_debug then
				sys.out("close!")
				table.insert( AID.debug_draw, { draw_type = 1, p1 = bot.pos, p2 = allypos, color = 245} )
			end
		end
		
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
		bot.behavior = "FlyToDistanceShoot"
		bot.behavior_time = 0
		return true
	else
		return false
	end
end
-- в следующий апдейт выходим из этого экшина
function AID.FlyToDistanceShoot:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	
	if bot.behavior_time > 10 then 
		AID:SetNewBehavior( ship, bot )
	end
end

-- экшин поведение "стрелять цель" 
AID.DistanceShoot = {} 
function AID.DistanceShoot:Start( ship, bot, param )
	if lua_debug then dprint("AID.DistanceShoot:Start") end
	-- попытаться выбрать более точную цель
	local targetId = AID:GetTargetForBot( ship, bot ) --target_type ??
	local target = nil
	if targetId then 
		bot.behavior_targetId = targetId
		target = Entities[ bot.behavior_targetId ]
		--if target then 
			--ship:AI_NewOrder( ai.AiOrder.ENTITY_ATTACK, ai.AiTargetType.ENTITY, t ) -- типа чтобы корабль залочил таржет
			--sys.out( "ship:AI_NewOrder ENTITY_ATTACK: " .. tostring( bot.behavior_targetId ) )
		--end
	end
	if target then
		bot.behavior_targetPos = ship:GetPos()
		--ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )		
		--if new_target and bot.old_behavior == "DistanceShoot" then
			ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
			if target then
				ship:AI_Attack( target ) --Вызывать только в режиме защиты.  для атаки конкретного игрока
				--sys.out( "ship:AI_Attack: " .. tostring( t:GetDefName() ) )
			end 
		--end
		bot.behavior = "DistanceShoot"
		bot.behavior_time = 0
		return true
	else
		return false
	end
end
-- в следующий апдейт выходим из этого экшина
function AID.DistanceShoot:Update( dt, ship, bot )
	if bot.behavior_time == 0 then
		--ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
		local t = bot.behavior_targetId and Entities[ bot.behavior_targetId ] or nil
		if t then
			--ship:AI_Attack( t )
		end
	end
	
	bot.behavior_time = bot.behavior_time + dt
	
	if bot.behavior_time > 5 then   --через 5 сек проверяем валидность если что вернемся в это состояние.
		AID:SetNewBehavior( ship, bot )
	end
end


--- не бехавиор, а часть работы модуля босса
function AID.BossRelocation( ship, bot, param ) 
	local d = param and param.range or 50
	local target = bot and bot.behavior_targetId and Entities[ bot.behavior_targetId ] or nil
	if ship and target then 
		local place = AID:GetPlace( target:GetPos(), d, 10 ) -- относительно pos  на расстоянии dist размера s		
		if place then
			ship:SetPos( place )
		end
	end	
end

--- не бехавиор, а часть работы модуля  рандомный даш влево или право
function AID.DashLeftRight( ship, bot, param ) 
	if ship then  
		local r = math.random()
		if r < 0.25 then
			AID:SpellCast( ship, "DodgeDrive_l_Mob" )
		elseif r < 0.5 then
			AID:SpellCast( ship, "DodgeDrive_r_Mob" )
		elseif r < 0.75 then
			AID:SpellCast( ship, "DodgeDrive_up_Mob" )
		else
			AID:SpellCast( ship, "DodgeDrive_down_Mob" )
		end
	end
end

--- не бехавиор, а часть работы модуля босса
function AID.CreateModuleEvent( ship, bot, param ) 
	local d = param and param.range or 50
	local target = bot and bot.behavior_targetId and Entities[ bot.behavior_targetId ] or nil
	if ship and target then 
		local place = AID:GetPlace( ship:GetPos(), d, 10 ) -- относительно pos  на расстоянии dist размера s		
		if place then
			-- Mission:CreateEvent( "AlienPortal", { pos = CL_GetLocalPlayerShip():GetPos(), dir = CL_GetLocalPlayerShip():GetDir() } )
			Mission:CreateEvent( param.event, { pos = place, dir = ship:GetDir(), masterId = bot.entityId, masterBot = bot } )
		end
	end	
end


-- Обычная атака
AID.Attack = {} 
function AID.Attack:Start( ship, bot, param )
	if lua_debug then dprint("AID.Attack:Start") end
	local t = bot.behavior_targetId and Entities[ bot.behavior_targetId ]  or nil
	if t then
		bot.behavior_targetPos = t:GetPos()
		--ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )		
		ship:AI_NewOrder( ai.AiOrder.ENTITY_ATTACK, ai.AiTargetType.ENTITY, t ) -- типа чтобы корабль залочил таржет
		--ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
		bot.behavior = "Attack"
		bot.behavior_time = 0
		return true
	else
		return false
	end
end
function AID.Attack:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 7 then   --через 5 сек проверяем валидность если что вернемся в это состояние.
		AID:SetNewBehavior( ship, bot )
	end
end


-- Обычное стояние 
AID.Guard = {}  
function AID.Guard:Start( ship, bot, param )
	if lua_debug then dprint("AID.Guard:Start") end
	bot.behavior_guardPos = bot.behavior_guardPos or ship:GetPos()
	--!!!
	if bot.config and bot.config.behavior_guardEntityId then
		local ent = Entities[ bot.config.behavior_guardEntityId ]
		if ent then
			bot.behavior_guardPos = ent:GetPos()
		end
	end
	local dist = param or 250
	if #( bot.behavior_guardPos - ship:GetPos() ) > dist then
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_guardPos )		
--		table.insert( AID.debug_draw, { draw_type = 1, p1 = ship:GetPos(), p2 = bot.behavior_guardPos, color = 255*256* 256 + 255*256 + 110} )
	else
		ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
		--по идее надо тут выбрать цель
		local t = bot.behavior_targetId and Entities[ bot.behavior_targetId ]  or nil
		if t then 
			ship:AI_Attack( t )
		end
	end
	bot.behavior = "Guard"
	bot.behavior_time = 0
	return true
end

function AID.Guard:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 5 then   --через 5 сек проверяем валидность если что вернемся в это состояние.
		bot.behavior_guardPos = nil
		AID:SetNewBehavior( ship, bot )
	end
end


-- Миграция:  коррабль летит на новую точку в текущем расстоянии от цели , стараясь лететь ближе к коллизии или ближе к центру карты,  соблюдая трейслайн до цели текущей
AID.Drifting = {}  
function AID.Drifting:Start( ship, bot, param )
	if lua_debug then dprint("AID.Drifting:Start") end
	local final_res = false
	local t = bot.behavior_targetId and Entities[ bot.behavior_targetId ]  or nil
	if t then 
		local dist = param or 150  -- на сколько ед. летим от текущей позиции
		local dist_min = math.min( 70, dist / 2 ) --минимальная дистанция где возможен полет (до коллизии)		
		local pos_array = {  {1,0}, {-1,0}, {1,1}, {1, -1}, {-1, 1}, {-1,-1}, {0,1}, {0,-1} } -- вестора направлений в 8 сторон в пространстве векторов n1 -n2

		local t_pos = t:GetPos()
		local my_pos = ship:GetPos()
		
		
		--ищем другана за спиной которого мождно спрятаться
		local allypos = AID:GetAllyHideSpot( ship, bot, dist * 1.333, t_pos, #( t_pos - my_pos )  ) --( my_ship, my_bot, maxDist2Hide, targetPos, dist2Target  )
		if not allypos then
		  -- просто летим вокруг цели
			local dir = ( t_pos - my_pos ):GetNormalized() 
			--local dist2target = #( t_pos - my_pos ) -- расстояние до цели
			local n1, n2 = Vec3(0,0,0), Vec3(0,0,0) -- нормали пространства движения дрифта
			CrossProduct( dir, Vec3(1,0,0), n1 )
			CrossProduct( dir, n1, n2 )
			
			local nearest_to_center = nil  -- тут будет ближайшая к центру валидная точка 
			local dist_to_center = 10000000 --
			local res = {}   -- сюда будем складывать все валидные точки которые "рядом со статикой"
			for i, v in pairs( pos_array ) do 
				local global_valid = true -- подходит ли точка "вообще"
				local good_point = false  -- подходит ли точка в массив res
				local pos1 = my_pos + dist * 2 * ( v[1] * n1 + v[2] * n2 + 0.25 * dir ):GetNormalized()  -- текущее направление куда мы хотим послать корабль ( dir перенаправляем с касательной на хорду)
					---table.insert( AID.debug_draw, { draw_type = 1, p1 = my_pos, p2 = pos1, color = 2} )
				local ent, pos, normal = TraceLine( my_pos, pos1, true ) -- трейс  мой корабль- новая точка	
				if pos then
					if #( my_pos - pos ) > dist_min then  -- куда то уперлись и при этом  есть место "где полетать"
						pos1 = pos + normal * 10
						good_point = true
					else
						global_valid = false
					end
				end
				if global_valid then 
					-- обрезаем путь, чтобы он не был длинее чем dist
					if #( my_pos - pos1 ) > dist then 
						pos1 = my_pos + dist * ( pos1 - my_pos ):GetNormalized()
					end
					-- проверяем что новая точка валидна для стрельбы
					local ent, pos, normal = TraceLine( pos1, t_pos, true ) -- трейс  новая точка - цель корабля 
					if pos then 
						global_valid = false
					end
				end
				-- массив оч "хороших" точек рядом со статикой
				if global_valid and good_point then
					table.insert( res, { n = i, pos = pos1 } )
				end
				-- ближайшая к центру карты точка
				if global_valid and dist_to_center > #( pos1 ) then 
					dist_to_center =#( pos1 )
					nearest_to_center = pos1
				end
			end
			
			bot.behavior_targetPos = #res > 0 and res[ math.random(#res) ].pos or nearest_to_center  -- берем лучшую точку , случаайную из массива либо ближайшую к центру карты
		else  -- прячемся у другана
			bot.behavior_targetPos = allypos
			if lua_debug then
				sys.out("close!")
				table.insert( AID.debug_draw, { draw_type = 1, p1 = bot.pos, p2 = allypos, color = 245} )
			end
		end
		
		if bot.behavior_targetPos then  -- если найдена точка, то запускаем бехевиор
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )		
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = my_pos, p2 = bot.behavior_targetPos, color = 245} )
			final_res = true
			bot.behavior = "Drifting"
			bot.behavior_time = 0
		end
	end
	return final_res
end

function AID.Drifting:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 7 then   --через 5 сек уходим
		AID:SetNewBehavior( ship, bot )
	end
end

----------------------
AID.Strafe = {}  
function AID.Strafe:Start( ship, bot, param )
	if lua_debug then dprint("AID.Strafe:Start") end
	local final_res = false
		local direction = ai.AiStrafeDirection.LEFT
		direction = param and param [ math.random( #param ) ]  or direction
		ship:AI_ApplyEvation( direction, false, 5 )--SpaceShip:AI_ApplyEvation( ai.AiStrafeDirection direction, bool roll, f32 time )
		--table.insert( AID.debug_draw, { draw_type = 1, p1 = my_pos, p2 = bot.behavior_targetPos, color = 245} )
		final_res = true
		bot.behavior = "Strafe"
		bot.behavior_time = 0
	return final_res
end

function AID.Strafe:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 4 then   --через 5 сек уходим
		AID:SetNewBehavior( ship, bot )
	end
end

----------------------  
-- Летим по пути который пришел при инициализации, в конце пути или деспавнимся или летим к первой точке
-- bot.config = { Vec3(), Vec3(), "cycle", 220, "despawn" } -- "таблица  пути" 
-- или
-- Летим по настоящему пути, ИД пришел при инициализации bot.pathId =   N
-- bot.currentWayPoint -- указатель текущей точки назначения
-- bot.way_start_time = 123 -- время старта
AID.FlyRoute = {}  
AID.FlyRoute.DIST_CHECK = 40*40
function AID.FlyRoute:Start( ship, bot, param )
	if lua_debug then dprint("AID.FlyRoute:Start") end
	local final_res = false
	
	local adv_config = Def[ship:GetDefName()].adv_pathConfig
	if adv_config and type( adv_config ) == "table" then
		bot.config = adv_config
	end
	
	if ( bot.config and type( bot.config ) == "table" and #bot.config > 0 ) or bot.pathId then
		if not bot.way_start_time then
			bot.way_start_time = TimerGetGameTime()
		end
		if ( not bot.currentWayPoint ) or ( bot.currentWayPoint and bot.currentWayPoint == 0 ) then 
			bot.currentWayPoint = 1
		end
		--bot.behavior_targetPos = AID.FlyRoute:GetPos( bot, bot.currentWayPoint ) --bot.config[ bot.currentWayPoint ]
		if not bot.behavior_targetPos then
			AID.FlyRoute:GetNewWayPoint(ship, bot)
		end
		if bot.behavior_targetPos and type( bot.behavior_targetPos ) == "userdata" then
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )		
			bot.behavior = "FlyRoute"
			bot.behavior_time = 0 
			--bot.check_time	= 0
			final_res = true
		end
		
		-- Смотрим есть ли потребность подождать комрадов по паку?
		if bot.packId and #AID.packs[ bot.packId ] > 1 then -- пак нашего героя большой
			-- измеряем расстояния до всех друганов если кто то далеко,
			for _, botId in pairs( AID.packs[ bot.packId ] ) do
				local botComrade = AID:GetBot( botId )
				if botComrade and botComrade.pos and ( botComrade.pos - bot.pos ):LengthSq() > AID.FlyRoute.DIST_CHECK then
					AddAura( ship, "SlowPatrolLeader" )
				end
			end
		end

	end
	return final_res
end

function AID.FlyRoute:GetPos( bot, n )
	if bot.pathId then 
		local p = Entities[ bot.pathId ]
		if p and p.GetWayPoint then 
			return p:GetWayPoint( n )
		end
	else
		return bot.config[ n ]
	end
end

function AID.FlyRoute:GetNewWayPoint(ship, bot)
	local nextPoint = AID.FlyRoute:GetPos( bot, bot.currentWayPoint )
	if nextPoint then
		if type( nextPoint ) == "string" and nextPoint == "despawn" then
			bot.removed = true -- флаг что бот не умер и не надо всякие штуки с этим связанные запускать
			if ship and ( not ship:IsDead() ) then
				ship:DieAndBlow()
				bot.entityId = nil
			end
			return false
		elseif type( nextPoint ) == "string" and nextPoint == "remove" then
			bot.removed = true -- флаг что бот не умер и не надо всякие штуки с этим связанные запускать
			if ship and ( not ship:IsDead() ) then
				AID:RemoveShip( ship, bot.entityId )
				bot.entityId = nil
			end
			return false
		elseif type( nextPoint ) == "string" and nextPoint == "cycle" then -- зацикливаем путь, в следующем цикле будет 1
			bot.currentWayPoint = 0
		elseif type( nextPoint ) == "string" and nextPoint == "stop" then -- останавливаем бота (он будет стоять если последнее в таблице)
			bot.behavior_targetPos = nil
			bot.old_behavior = bot.behavior
			bot.behavior = nil
			ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship )
		elseif type( nextPoint ) == "userdata" then
			bot.behavior_targetPos = nextPoint
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
			return true
		elseif type( nextPoint ) == "string" then -- это имя пути внутри config
			for _, def_id in pairs( GetEntitiesByClass( "PathObject" ) ) do 
				local p = Entities[ def_id ]
				if p:GetName() == nextPoint then
					if p then 
						bot.subpathPoint = 0
						bot.pathId = def_id
						bot.behavior_targetPos = AID.FlyRoute:GetPos( bot, bot.subpathPoint )
						ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
					end
				end
			end
			return true
		end
	end
end

function AID.FlyRoute:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	--bot.check_time = bot.check_time + dt
	
	if ( bot.behavior_targetPos - ship:GetPos() ):LengthSq() < AID.FlyRoute.DIST_CHECK then  -- долетели  
		-- переходим к следующей точке
		
		if bot.subpathPoint and bot.pathId then -- если в config вышли на pathId
			bot.subpathPoint = bot.subpathPoint + 1
			local p = Entities[ bot.pathId ]
			if p and p:GetNum() <= bot.subpathPoint then 
				bot.pathId = nil
				bot.subpathPoint = nil
			else
				local nextPoint = AID.FlyRoute:GetPos( bot, bot.subpathPoint )
				if nextPoint and type( nextPoint ) == "userdata" then
					bot.behavior_targetPos = nextPoint
					ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_targetPos )
				end
			end
		end
		
		if not bot.subpathPoint then
			bot.currentWayPoint = bot.currentWayPoint + 1 
			-- в случае если по пути, то зацикливаем
			if bot.pathId then  
				local p = Entities[ bot.pathId ]
				if p and p:GetNum() <= bot.currentWayPoint then 
					bot.currentWayPoint = 0
				end
			end
			-- получаем точку
			AID.FlyRoute:GetNewWayPoint(ship, bot)
		end
	end
	
	if bot.behavior_time > 6 and ( not bot.removed ) then   --через n сек уходим bot.flyRouteUpdate
		AID:SetNewBehavior( ship, bot )
	end
end

-- бот останавливается и играет эффект - анимацию.
AID.ScanArea = {}
function AID.ScanArea:Start( ship, bot, param )
	if lua_debug then dprint("AID.ScanArea:Start  (Try)") end
	local param = param and param or 0.1 -- шанс того что стартанем
	local final_res = false
	if param >= math.random() then
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.pos )
		local scanEffect = ai.Spawn( "Gen_PortalOpening" )
		if scanEffect then
			ship:AddChild( scanEffect )  --  Entities[984]:AddChild( ai.Spawn( "PvE_Gen_PortalOpening" ) )
		end
		AddAura( ship, "Stop" )
		bot.behavior = "ScanArea"
		bot.behavior_time = 0 
		final_res = true
	end
	return final_res
end

function AID.ScanArea:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 5 then   --через 5 сек проверяем валидность если что вернемся в это состояние.
		AID:SetNewBehavior( ship, bot )
	end
end



-- CaptureBeacon   -- бот летит к цели, пока цель не захвачена бехевиор работает  ( bot.CaptureBeaconId )
AID.CaptureBeacon = {}  
function AID.CaptureBeacon:Start( ship, bot, param )
	local res = false
	if lua_debug then dprint("AID.CaptureBeacon:Start") end
	if bot.behaviorGuardPos then  -- если явно задали точку охраны "снаружи", то берем за базу ее
		bot.behavior_guardPos = bot.behaviorGuardPos 
		res = true
	elseif bot.CaptureBeaconId  then -- сущность для защиты есть
		local ent = Entities[ bot.CaptureBeaconId ] -- маяк
		if ent and not ent:IsDead() then -- Сущность есть и жива
			bot.behavior_guardPos = ent:GetPos()
			res = true
		end
	end
	
	if res then 
		bot.behaviorDist = bot.behaviorDist and bot.behaviorDist or param -- расстояние от точки стояния до цели-маяка
		bot.behaviorDist = bot.behaviorDist and bot.behaviorDist or 30
		local z = math.random() - 0.5 -- считаем z отдельно чтобы не было вырождено в 0
		if math.abs( z ) < 0.01 then z = 0.5 end
		bot.behavior_guardPos = bot.behavior_guardPos + bot.behaviorDist * Vec3( math.random() - 0.5, z, math.random() - 0.5 ):GetNormalized() --!!! не  проверяем проходимость пока
		if #( bot.behavior_guardPos - ship:GetPos() ) > bot.behaviorDist / 2 then -- иногда будет летать иногда стоять (не ошибка)
			ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, bot.behavior_guardPos )		
	--		table.insert( AID.debug_draw, { draw_type = 1, p1 = ship:GetPos(), p2 = bot.behavior_guardPos, color = 255*256* 256 + 255*256 + 110} )
		else
			ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
		end
		bot.behavior = "CaptureBeacon"
		bot.behavior_time = 0
	end
	
	return res
end

function AID.CaptureBeacon:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 5 then   --через 5 сек проверяем валидность если что вернемся в это состояние.
		bot.behavior_guardPos = nil
		AID:SetNewBehavior( ship, bot )
	end
end

 
-- Idle   -- бот тупит пару сек, вместо того чтобы лихорадочно думать что делать каждый кадр и все равно тупить
AID.Idle = {}  
function AID.Idle:Start( ship, bot, param )
	if lua_debug then dprint("AID.Idle:Start") end
	ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship ) -- типа чтобы корабль стоял на месте и крутился носом
	bot.behavior = "Idle"
	bot.behavior_time = 0
	return true
end

function AID.Idle:Update( dt, ship, bot )
	bot.behavior_time = bot.behavior_time + dt
	if bot.behavior_time > 2 then   --через 2 сек проверяем валидность 
		AID:SetNewBehavior( ship, bot )
	end
end


-------------------------------------------------------------------------------------------------

function AID:IsConditionsValid( ship, conditions, bot ) 
	local final_res = false -- можно или нет заюзать	
	-- проверка кондишина - "доступно только внутри карты"
	if conditions.checkBattlefieldRadius and AID.battlefieldRadius2 then
		if ship and ( ship:GetPos() ):LengthSq() > AID.battlefieldRadius2  then
			return false
		end
	end
	
	if conditions.conditions_and then
		final_res = true
	end
	if ship and ( not bot ) then
		bot  = AID:GetBot( ship:GetId() )
	end
	local targets = {}
	for ic, condition in pairs( conditions ) do --цикл по кондишинам
		if type( condition ) == "table" then
			local res = false
			targets = {}  -- собираем сюда всех потенциальных таржетов текущего кондишина
			if condition.target and condition.target.class  then 
				local aclass = { "SpaceShip" }
				if condition.target.class == ai.SpellTargetClass.SHIP then 
					aclass = { "SpaceShip", "UfoShip"}
				end	
				local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
			
				for j = 1, #aclass do
					for i, pid in pairs( GetEntitiesByClass( aclass[j] ) ) do
						local pvalid = true
						local p = Entities[ pid ]
						if p then
							if condition.target.relationship and bit.band( condition.target.relationship, ai.SpellTargetRelationship.ALLY ) > 0 then 
								if not( RelationshipTable:GetRelationship( p:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == 0 ) then
									-- группы 0 ALLY. 1 neutral 2 enemy  , а это битовое ai.SpellTargetRelationship.ALLY - 1 
									pvalid = false -- не алли
								end							
							elseif condition.target.relationship and bit.band( condition.target.relationship, ai.SpellTargetRelationship.ENEMY ) > 0 then 
								if not( RelationshipTable:GetRelationship( p:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == 2 ) then
									-- 0 ALLY.  , а это битовое ai.SpellTargetRelationship.ALLY - 1 
									pvalid = false -- не алли
								end
							elseif condition.target.relationship and bit.band( condition.target.relationship, ai.SpellTargetRelationship.NEUTRAL ) > 0 then 
								if not( RelationshipTable:GetRelationship( p:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == 1 ) then
									-- 0 ALLY.  , а это битовое ai.SpellTargetRelationship.ALLY - 1 
									pvalid = false -- не алли
								end
							end
							if condition.target.range then
								if #( p:GetPos() - ship:GetPos() ) > condition.target.range then -- если не входит в цель в окружность
									pvalid = false -- 
								end
							end
							if condition.target.target and condition.target.target == ai.SpellTargetGeneral.LOCKED_TARGET then 
								if ship:GetTargetLock() ~=  p then 
									pvalid = false -- 
								end
							end
						else 
							pvalid = false
						end
						if pvalid then 
							table.insert( targets, p )
						end
					end
				end
			-- залоченая цель бота
			elseif condition.target and condition.target.target and ( condition.target.target == ai.SpellTargetGeneral.LOCKED_TARGET ) then 
				if ship:GetTargetLock() then --  бот никого не лочит если не было команды атаковать.
					table.insert( targets, ship:GetTargetLock() )
				end
			elseif condition.target and condition.target.target and ( condition.target.target == ai.SpellTargetGeneral.CONTEXT_TARGET ) and bot and bot.behavior_targetId and
					Entities[ bot.behavior_targetId ] and ( not Entities[ bot.behavior_targetId ]:IsDead() ) then
				table.insert( targets, Entities[ bot.behavior_targetId ] )
			
			--target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			elseif condition.target and condition.target.configId and bot and bot.config and bot.config[ condition.target.configId ] then
				table.insert( targets, Entities[ bot.config[ condition.target.configId ] ] )

			--target 	= { targetId = true },  -- цель предопределенная при создании бота
			elseif condition.target and condition.target.targetId and bot and bot.targetId then
				table.insert( targets, Entities[ bot.targetId ] )
				
			-- если таржет отсутствует то имеем ввиду корабль сам
			elseif not ( condition.target and condition.target.target) then
				table.insert( targets, ship )
			end
			
			-- если таржет валидный, то проверяем conditions
			if lua_debug then sys.out( "targets : ".. tostring(#targets) .. " ** " .. tostring( condition.condition_type ) ) end
			for i, v in pairs( targets ) do
				if condition.condition_type and condition.condition_type == AICondition.ArmorLessThen then
					if v:GetHealth() / v:GetMaxHealth() < condition.param then
						res = true
					end					
				elseif condition.condition_type and condition.condition_type == AICondition.ShieldLessThen and v.GetShieldVal and v.GetShieldMax then
					if v:GetShieldVal() / v:GetShieldMax() < condition.param then
						res = true
					end
				elseif condition.condition_type and condition.condition_type == AICondition.EnergyLessThen and v.GetEnergy and v.GetMaxEnergy then
					if v:GetEnergy() / v:GetMaxEnergy() < condition.param then
						res = true
					end
					
				elseif condition.condition_type and condition.condition_type == AICondition.DistMore then
					if #( ship:GetPos() - v:GetPos() ) > condition.param then -- для всех таржетов должно выполняться
						if i == 1 then
							res = true
						end
					else 
						res = false
					end
				elseif condition.condition_type and condition.condition_type == AICondition.DistLess then
					if #( ship:GetPos() - v:GetPos() ) < condition.param then
						res = true
					end
				elseif condition.condition_type and condition.condition_type == AICondition.VisibleTarget then
					if lua_debug then sys.out( "AICondition.VisibleTarget" ) end
					if bot.behavior_targetId and Entities[ bot.behavior_targetId ] then
						local pos_t = Entities[ bot.behavior_targetId ]:GetPos()
						local ent, pos, normal = TraceLine( ship:GetPos(), pos_t, true )
						--sys.out(tostring(ent).. tostring(pos) .. tostring( normal) )
						if not pos then
							res = true
						end
					end
				elseif condition.condition_type and condition.condition_type == AICondition.TargetNotTrace then
					if lua_debug then sys.out("AICondition.TargetNotTrace") end
					if bot.behavior_targetId and Entities[ bot.behavior_targetId ] then
						local pos_t = Entities[ bot.behavior_targetId ]:GetPos()
						local ent, pos, normal = TraceLine( ship:GetPos(), pos_t, true )
						if pos and i == 1 then -- для всех таржетов должно выполняться
							res = true
						elseif not pos then
							res = false
						end
					end
				elseif condition.condition_type and condition.condition_type == AICondition.Behavior then
					if lua_debug then sys.out("AICondition.Behavior") end
					if bot.behavior and bot.behavior == condition.param then
						res = true
					end
						--Random			= 13, 		-- если рандом меньше парама то кондишен = валидный
				elseif condition.condition_type and condition.condition_type == AICondition.Random then
					if lua_debug then sys.out("AICondition.Random") end
					if math.random() < condition.param then
						res = true
					end
					
				--elseif
				--TODO 
				end
			end
			if condition.condition_type and condition.condition_type == AICondition.NoTarget then
				if #targets == 0 then
					res = true
				end
			end
			if condition.condition_type and condition.condition_type == AICondition.EmptyAgroList then
				local checkTable = bot.agroTable or bot.adventureTargetId or bot.stealthTargetId
				if checkTable and type( checkTable ) == "table" then
					res = true
					for ia, va in pairs( checkTable ) do
						res = false
						break
					end
				end
			end
			if condition.condition_type and condition.condition_type == AICondition.Target then
				if bot and bot.behavior_targetId and
					Entities[ bot.behavior_targetId ] and ( not Entities[ bot.behavior_targetId ]:IsDead() ) then
					res = true
				end
			end
			if condition.condition_type and condition.condition_type == AICondition.LifeTimeMore then
				if bot and bot.spawn_timer then
					if TimerGetGameTime() - bot.spawn_timer > condition.param then
						res = true
					end
				end
			end
			
				
			if conditions.conditions_and then
				final_res = final_res and res
			else
				final_res = final_res or res
			end
		end
	end
	return final_res
end


-- таблица бехавиоров  ( пример конечного автомата)
--[[
Avt = {}  -- в дезайнерс тулс пока
Avt.Pack_Dive = 
 { 	
 -- защищать корабль в паке по циклу (если умрет защищаемый защищать следующий,) если невозможно делать состояние 1, то идти в состояние 2. Если возможно, то включать в стек состояний состояние 3
	{ behavior = "DefendShip", next_behavior = { 1, 2 }, possible_stack = { 3, }, },
	-- лететь на врага по прямой и пролететь "за него"
	{ behavior = "Dive", next_behavior = { 2, } }, 
	-- если у корабля хп корпуса меньше или ровно 0.5, то включить состояние "уклонения", 
	{ behavior = "BigEvade", hull_health = 0.5,  }, 
	--{ behavior = "MapExit",   }, 
 }
]]
-- установить новое поведение игрока
-- вызываем поведение, какое там следующее, если старт провален, либо не проходит по кондишинам, то вызываем следующее рекурсивно, бехевиор должен быть построен так, 
--   что какое то состояние безусловно вызовется, например айдл.
function AID:SetNewBehavior( ship_, bot, next_behaviorID )
	-- 
	if bot.behavior then 
		bot.old_behavior = bot.behavior
		bot.behavior = nil
	end

	local ship = Entities[ bot.entityId ]
	
	if (not next_behaviorID) and lua_debug then
		if lua_debug then sys.out("------------------------------------ Current avtomat " .. tostring(bot.avt_current)		) end
	end
	
	
	local result = true -- если не стартанул бехевиор то вызовем рекурсивно себя еще раз
	
	local next_behavior = nil
	--получим "следующий" бехевиор из машины состоянии
	local next_behaviorID 	= next_behaviorID or 1
	bot.avt_current			= bot.avt_current or 1 -- указатель на текущее положение в матрице автомата	
	if bot.avt and bot.avt[ bot.avt_current ].next_behavior and bot.avt[ bot.avt_current ].next_behavior[next_behaviorID] and bot.avt[ bot.avt[ bot.avt_current ].next_behavior[next_behaviorID]] then  -- получим "следующий бехавиор"
		next_behavior = bot.avt[ bot.avt[ bot.avt_current ].next_behavior[next_behaviorID]].behavior
	elseif not next_behaviorID then
		next_behavior = "Dive"  -- для отладки просто атака
	else 
		sys.out( "Table of next behavior not found   botId:" .. tostring( bot.entityId ) )
	end	
	--sys.out("1  ".. next_behavior )
	
	if next_behavior and AID[ next_behavior ] and AID[ next_behavior ].Start then  --not bot.behavior and
		if lua_debug then sys.out("Found next_behavior ".. next_behavior ) end
		--bot.avt[ bot.avt[ bot.avt_current ].next_behavior[ next_behaviorID ] ]
		if ( bot.avt[ bot.avt[ bot.avt_current ].next_behavior[ next_behaviorID ] ].conditions and 
			AID:IsConditionsValid( ship, bot.avt[ bot.avt[ bot.avt_current ].next_behavior[ next_behaviorID ] ].conditions, bot ) ) or not bot.avt[ bot.avt[ bot.avt_current ].next_behavior[ next_behaviorID ] ].conditions then --bot.avt[ bot.avt_current ].conditions
			if lua_debug then sys.out("Valid  ".. next_behavior ) end
			if AID[ next_behavior ]:Start( ship, bot, bot.avt[ bot.avt[ bot.avt_current ].next_behavior[ next_behaviorID ] ].param ) then -- 
--sys.out("Behavior strted: ".. next_behavior )
				-- запуск бехевиора прошел успешно
				bot.avt_current = bot.avt[ bot.avt_current ].next_behavior[next_behaviorID] -- указатель текущего положения машины состояний переводим
				if lua_debug then
					if lua_debug then  sys.out( "LUA AI: " .. next_behavior .. " Started for " .. ship:GetName() ) end
				end			
			else -- запуск бехевиора прошел неуспешно, пробуем следующий на какой можем переключиться
				result = false
				if lua_debug then
					if lua_debug then sys.out( "LUA AI: " .. next_behavior .. " Failed  for " .. ship:GetName() ) end
				end
			end
		else  -- бехвиор не прошел по кондишинам
			result = false
			if lua_debug then  sys.out( "LUA AI: " .. next_behavior .. " failed due conditions " .. ship:GetName() ) end
			
		end
		
		if not result then
			AID:SetNewBehavior( ship, bot, next_behaviorID + 1 )
		end
	else 
		--sys.out( "All behavior failed. bot id: ".. tostring(bot.entityId).. " Name: " .. bot.defName .. 
		--		" bot N: " .. AID:GetBot( bot.entityId ).. " Avt_current:" .. tostring( bot.avt_current ) .. "Behavior: " .. tostring( bot.behavior ) )
	end
	return result
end

-- полностью заменить мобу матрицу управления , например когда снаружи говорим мобу - отварпывай.
function AID:SetNewAutomatTable( bot, newAutomat )
	local ship = bot and type( bot ) == "table" and bot.entityId and Entities[ bot.entityId ] or nil
	if ship and newAutomat then
		bot.avt_current	= nil
		bot.avt = newAutomat
		AID:SetNewBehavior( ship, bot )
	end
end

		--апдейтим игроков - обновляем таржеты  
function AID:FindTargets( )
	--local t = {}
	local j, i, pid, p
--[[
	local targetRelationshipGroup = 0
	local aclass = { "SpaceShip", "UfoShip"} --"Turret", "CargoShip",
	
	for j = 1, #aclass do
		for i, pid in pairs( GetEntitiesByClass( aclass[j] ) ) do
			p = Entities[pid]
			if p and p:GetRelationshipGroup() == targetRelationshipGroup then
				table.insert( t, { entityId = pid, pos = p:GetPos() } )
			end
		end
	end
]]
--AID.targets=GetAllPlayersInfo()
	local  h_players = GetAllPlayersInfo()
	--for i = 1,  ai.MAX_PLAYERS do 
	if h_players then
		for i,v in pairs( h_players ) do
			--local sh = CL_GetPlayerShip( i - 1 ) 
			local sh = Entities[ v.entityId ]
			if sh and not sh:IsDead() then
				-- есть ли запись о игроке? соответствует ли она реальности?
				if not AID.targets[ i ] or ( AID.targets[ i ] and AID.targets[ i ].entityId ~= sh:GetId() ) then 
					-- делаем запись о игроке
					AID.targets[ i ] = { pain = 0, lastPainUpdate = 0, summHP = sh:GetShieldMax() + sh:GetMaxHealth(), entityId = sh:GetId(), pos = sh:GetPos(), health = sh:GetHealth(), shield = sh:GetShieldVal(), isDead = false, isBot = v.isBot }
					-------------- Бот, что изображает игрока-напарника обнаружен!  вставляем боту поведение
					if v.isBot then
						local bots_ = designers:AddPackInAID( { sh }, { Avt.DefendPlayerShip } )
						local bot = AID:GetBot( bots_[ 1 ] )
						if bot then
							bot.isBot = true
						end
					end
					
				else  
					-- вносим изменения хп и щита и позиции
					AID.targets[ i ].pos = sh:GetPos()
					local shield = sh:GetShieldVal()
					if shield < AID.targets[ i ].shield then
						AID:AddPainByDamage( AID.targets[ i ], AID.targets[ i ].shield - shield )
					end
					AID.targets[ i ].shield = shield
					
					local health = sh:GetHealth()
					if health < AID.targets[ i ].health then
						AID:AddPainByDamage( AID.targets[ i ], AID.targets[ i ].health - health )
					end
					AID.targets[ i ].health = health
					AID.targets[ i ].isDead = false
				end
			elseif sh then 
				AID.targets[ i ].isDead = true
			end
		end
	end
end

function AID:BotUpdate( bot, ship, dt )
	if ship then 
		bot.pos = ship:GetPos()
	end
	-- проверяем бехавиор ботов
	  --апдейт текущего бехавиора
	if bot.behavior and ( not ship:IsDead() ) and ( not bot.removed ) and AID[ bot.behavior ] and AID[ bot.behavior ].Update then 
		AID[ bot.behavior ]:Update( dt, ship, bot )
	end
	
	if not bot.behavior then
		AID:SetNewBehavior( ship, bot )
	end
end

--+++++++++++++++++++++
-- 
--    P A I N
--
--+++++++++++++++++++++

AID.maxPain = 100 -- макс боли 100.
AID.basePain = 150 --расчет что за 100% хп игрок получает 150ед. боли
AID.decayPainTime = 5 -- это время после получения боли декой не работает
AID.decayPainSpeed = 7 -- столько в секунду утекает боли
AID.enoughPain = 83  --  от этого предела считаем что боли много    maxPain >= AID.enoughPain and AID.enoughPain * 0.75 <= summPain / #AID.targets
AID.smallPain = 20  --  от этого предела считаем что боли мало
AID.painTime = 0 --  таймер для PainPlato, Relax
AID.painPlatoTimeMax = 10 -- время нахождения в состоянии PainPlato
AID.painRelaxTimeMax = 38 -- время нахождения в состоянии Relax
AID.painStates = { ["None"] = 0, ["PainGrow"] = 1, ["PainPlato"] = 2, ["PainDown"] = 3, ["Relax"] = 4, }  -- машина не работает,  боль растим, продолжаем Спавнить, боль уменьшаем, отдыхаем
AID.painState = AID.painStates.None  -- стартуем по умолчанию без боли, спавн через painNoneTime
AID.painNoneTime = 5
AID.painGrowBig = 150 -- начинается спавнится бот пила
AID.painGrowHuge = 240 -- считаем что так долго растить боль нельзя.
AID.modifier = 1 -- модификатор боли
AID.mod_by_bot = 0.12 -- +0.12  за каждого игрока-бота 


function AID:ResetPain( noneTime )  -- ресет боли,  время 
	AID.painState =  AID.painStates.None
	AID.painNoneTime = noneTime and noneTime or 5 
	for i1, playerTable in pairs( AID.targets ) do
		playerTable.pain = 0
	end
end


-- боль увеличивается  от урона
function AID:AddPainByDamage( playerTable, damage )
--playerTable = AID.targets[ i ] = { pain = 0, lastPainUpdate = 0, summHP = sh:GetShieldMax() + sh:GetMaxHealth(), entityId = sh:GetId(), pos = ...
	local pain = damage / playerTable.summHP * AID.basePain
	playerTable.pain = Clamp( playerTable.pain + pain, 0, AID.maxPain )
	playerTable.lastPainUpdate = 0
end

-- боль увеличивается от смерти бота рядом с игроком
function AID:AddPainByDeath( bot )
	-- 1 ед боли на 1000 хп корпуса трупа, за смерть ближе 60ед, но не более 25 боли.
	local p1 = Clamp( math.floor( 1 * bot.healthMax / 1000 ), 1, 25 )
	local d1 = 60
	-- 1 ед боли за смерть 150ед
	local p2 = 1
	local d2 = 500
	local a = (p2-p1)/(d2-d1)
	local b = p1 - a * d1
	if  bot.pos then
		for i1, playerTable in pairs(AID.targets) do
			if playerTable.pos then 
				local pain = Clamp ( #( playerTable.pos - bot.pos ) * a + b, 0, p1 )
				playerTable.pain = Clamp( playerTable.pain + pain, 0, AID.maxPain )
				if lua_debug then  dprint( "painByDeath " .. tostring(pain) ) end
				if pain > 1 then playerTable.lastPainUpdate = AID.decayPainTime - 0.5 end -- на 0.5 секунд паузим декой боли
			end
		end
	end
end



-- боль уменьшается если игрок не получал боли
function AID:UpdatePain( dt )
	local maxPain = 0  -- сравниваем с AID.enoughPain
	local summPain = 0 -- может быть надо считать не макс боль а среднюю? AID.enoughPain * n * 50
	local modifier = AID.modifier
	for i1, playerTable in pairs( AID.targets ) do
		--decay боли
		playerTable.lastPainUpdate = playerTable.lastPainUpdate + dt
		if playerTable.lastPainUpdate > AID.decayPainTime then 
			playerTable.pain = Clamp( playerTable.pain - AID.decayPainSpeed * dt, 0, AID.maxPain )
		end
		-- текущая "боль команды"
		maxPain = math.max( playerTable.pain, maxPain )
		if playerTable.isDead then 
			summPain = summPain + AID.enoughPain
		else 
			summPain = summPain + playerTable.pain
		end
		if playerTable.isBot then
			modifier = modifier + AID.mod_by_bot
		end		
	end
	
	summPain = summPain * modifier
	maxPain	= maxPain * modifier
	
-- переключаем состояний  - режимы порождения ботов от боли   
	-- переходим из "режима роста" в "режим плато боли" если кто то достиг макса и средняя боль по команде +50% макса боли
	AID.painTime = AID.painTime - dt
	if ( AID.painState == AID.painStates.PainGrow and maxPain >= AID.enoughPain and AID.enoughPain * 0.75 <= summPain / #AID.targets ) or ( AID.painTime <  AID.painGrowBig - AID.painGrowHuge) then	
		AID.painState = AID.painStates.PainPlato
		AID.painTime = AID.painPlatoTimeMax
	end
	-- переходим из режима PainPlato в PainDown
	if AID.painState == AID.painStates.PainPlato then
		if AID.painTime <= 0 then
			AID.painState = AID.painStates.PainDown
		end
	end
	--Переходим  в релакс
	if AID.painState == AID.painStates.PainDown then
		if maxPain < AID.smallPain then
			AID.painState = AID.painStates.Relax
			AID.painTime = AID.painRelaxTimeMax
		end
	end
	--Возвращаемся в painGrow из Relax
	if AID.painState == AID.painStates.Relax then
		if AID.painTime <= 0 then
			AID.painState = AID.painStates.PainGrow
			AID.painTime = AID.painGrowBig -- если PainGrow затянется выше этого, то будем спавнить дополнительного спец моба
		end
	end
	
	if AID.painState == AID.painStates.None then
		AID.painNoneTime = AID.painNoneTime - dt
		if AID.painNoneTime <= 0 then
			AID.painState = AID.painStates.PainGrow
			AID.painTime = AID.painGrowBig -- если PainGrow затянется выше этого, то будем спавнить дополнительного спец моба
		end
	end
	

end


-- реакция на смерть бота:   вызываем боль, порождаем бонус(возможно)
function AID:OnBotDeath( bot )

	if bot.behavior and AID[ bot.behavior ] and AID[ bot.behavior ].Cancel then 
		AID[ bot.behavior ]:Cancel( bot )
	end
	
	bot.isDead = true
	if lua_debug then dprint("Bot dead: " .. bot.defName ) end
	if not bot.removed then  -- бота не удалили, а он реально умер
		AID:AddPainByDeath( bot )
	end
	
	--порождение бонусов
	if AID.bonus_enable then
		if bot and bot.pos and bot.healthMax and ( not bot.removed ) then
			if not ( AID.bonus_timeout > 0 and bot.healthMax < 20000 ) then -- если недавно порождали бонус, и бот слишком "слабый", то не порождаем
				local p = Clamp(  bot.healthMax / 12000, 0, 1) --вероятность бонуса
				if p >= math.random() then
					local small_bonuses = { "Bonus_PVE_Heal_S", "Bonus_PVE_Damage_Self", "Bonus_PVE_Shield_S" }
					local big_bonuses = { "Bonus_PVE_SpeedUp", "Bonus_PVE_Shield_All", "Bonus_PVE_Heal_All" }
					local bonus = small_bonuses[ math.random( #small_bonuses ) ]
					if bot.healthMax > 20000 or math.random() > 0.6 then 
						bonus = big_bonuses[ math.random( #big_bonuses ) ]
					end
					AID.bonus_timeout = AID.bonus_timeout_base
					local ent = ai.Spawn( bonus )  --     ent = ai.Spawn( "Bonus_PVE_Heal_S" )
					if ent then
						ent:SetPos( bot.pos + Vec3( 0,-5,0) )  --   ent:SetPos( CL_GetLocalPlayerShip():GetPos() + Vec3( 0,-50,0) )  
					end
				end
			end
		end
	end
	if not bot.isBot then -- только для мобов вызываем, не для игрока
		MobOnDeath( bot.entityId, bot.pos )
	end
end


--"выбрать цель"
function AID:GetTargetForBot( ship, bot ) -- , target_type
		-- на выбор функции - та которая менее всего атакована или имеет больше ХП. если все одинаково то смотрим боль
		-- отбившаяся цель
		-- цель с минимумом "Боли"
		-- ближайшая цель
		--AID.targets[ i ] = { pain = 0, lastPainUpdate = 0, summHP = sh:GetShieldMax() + sh:GetMaxHealth(), entityId = sh:GetId(), pos = sh:GetPos(), health = sh:GetHealth(), shield = sh:GetShieldVal(), isDead = false, }
		
	--  пока алгоритм простой: берем видимого самого жирного живого игрока в пределах 4км, если все  если такого нет, то берем ближайшего. 
	-- ? если  у всех сумма хп больше 75% то берем с наименьшей болью.

--------------------------------------
--    FreeSpace	
	if bot.agroTable then
		--body for FreeSpace
		
		--for adventures
		if bot and bot.adventureTargetId then
			local max_agro = 60
			local id 	= nil
			for k, v in pairs( bot.agroTable ) do
				local dist = bot.pos and v.pos and #( bot.pos - v.pos ) or nil
				if AID:TargetVisible( v.targetId, dist ) then 
					if v.agro >= max_agro then   --!!! можно переход агро по расстоянию еще тюнить и по дельте(чтобы исключить переключения быстрые)
						max_agro = v.agro
						id = k
					end
				end
			end
			
			if id and bot.agroTable[ id ] and bot.agroTable[ id ].targetId and Entities[ id ] then
				return id
			else
				local targetId, dist
				local botPos = bot.pos
				for _, v in pairs( bot.adventureTargetId ) do
					if Entities[ v ] then
						targetPos = Entities[ v ]:GetPos()
						if not (dist) or SquareLen( botPos, targetPos ) < dist then
							targetId = v
						end
					end
				-- нужна проверка на расстояние до ближайшего или по агро
				end 
				return targetId
			end	 
		end
		
		local max_agro = -1
		local id 	= nil
		for k, v in pairs( bot.agroTable ) do
			local dist = bot.pos and v.pos and #( bot.pos - v.pos ) or nil
			if AID:TargetVisible( v.targetId, dist ) then 
				if v.agro >= max_agro then   --!!! можно переход агро по расстоянию еще тюнить и по дельте(чтобы исключить переключения быстрые)
					max_agro = v.agro
					id = k
				end
						--!!! targetId  force_attack
				if bot.targetId and bot.force_attack and bot.targetId == v.targetId then
					id = k 
					max_agro = 1000000
					break
				end
			end
		end
		return id and bot.agroTable[ id ] and bot.agroTable[ id ].targetId or nil

----------------------------------------------------
--      PVE	

	-- для стелс пве
	elseif bot.stealthTargetId then
		local targetId, distance
		for k, tid in pairs( bot.stealthTargetId ) do
			local te = Entities[tid]
			if te then
				local dist = SquareLen( te:GetPos(), bot.pos )
				if not targetId  or ( ( distance > dist and distance - dist > 14000 ) and AID:TargetVisible( tid, dist ) )  then
					targetId = tid
					distance = dist	
				end
			end 
		end 
		return targetId or -1
	
	else
		-- есть цель для атаки и она жива
		if bot and bot.forceTargetId and Entities[ bot.forceTargetId ] then
			return bot.forceTargetId
		end
		
		-- иначе обычная логика поиска цели
		local nearest_player = nil
		local dist = 100000
		local max_hp_player = nil
		local max_hp = 0
		local min_pain_player = nil
		local min_pain = 10000
		local n = {}
		local defend_pos = PvE_Mission and PvE_Mission.vitalsInGame and PvE_Mission.vitalCurrent and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ] and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos or nil  -- позиция витал поинта
		local defend_dist = 90  -- на этом расстоянии от витал поинта моб опасен  (радиус захвата 85)
		for i, v in pairs( AID.targets ) do
			v.points2kill = 0
			if v and not ( v.isDead ) then
				local d = #( v.pos - bot.pos )
				if d < dist then -- выискиваем ближайшго
					dist = d
					nearest_player = i
				end
				if defend_pos and #( v.pos - defend_pos ) < defend_dist then 
					--v.need_defend = true
					v.points2kill = 15  -- некий вес что этот игрок будет выбран
				else
					v.points2kill = 1
					--v.need_defend = false
				end
				if d < 400 then -- для всех кто ближе 4км
					v.points2kill = v.points2kill + 3
				end
				if AID:TargetVisible( v.entityId, d ) then  -- AID:TargetVisible( entityId, distance )
					local ent, pos, normal = TraceLine( bot.pos, v.pos, true ) -- ent, pos, normal = TraceLine( Entities[29372]:GetPos(), Entities[247]:GetPos(), true )
					if not pos then  -- есть трейслайн
						v.points2kill = v.points2kill + 5
						if v.pain < min_pain then -- близкий видимый игрок с наименьшей болью
							min_pain = v.pain
							min_pain_player = i
						end
						if ( v.summHP and v.health and v.shield ) and ( v.health + v.shield ) / v.summHP > max_hp then -- близкий видимый игрок с наибольшим % здоровья
							max_hp = ( v.health + v.shield ) / v.summHP
							max_hp_player = i
						end
					end
				else 
					v.points2kill = 0 -- если враг невидимка то ну его нафиг
				end
			end
		end
		--выбираем игрока
		if min_pain_player then
			AID.targets[ min_pain_player ].points2kill = AID.targets[ min_pain_player ].points2kill + 16  -- + очки игроку с низкой болью
		end
		if max_hp_player then
			AID.targets[ max_hp_player ].points2kill = AID.targets[ max_hp_player ].points2kill + 12  -- + очки игроку с макс %  хп
		end
		if nearest_player and AID.targets[ nearest_player ].points2kill > 0 then
			AID.targets[ nearest_player ].points2kill = AID.targets[ nearest_player ].points2kill + 4 -- + очки игроку ближайшему к боту
		end
		--рандом из всех игроков по весам игроков
		local summ_points2kill =0
		for i, v in pairs( AID.targets ) do
			summ_points2kill = summ_points2kill + v.points2kill
		end
		local r = math.random ( summ_points2kill )
		local res = nil
		summ_points2kill = 0
		for i, v in pairs( AID.targets ) do
			if r <= v.points2kill + summ_points2kill then 
				res = i 
				break
			end
			summ_points2kill = summ_points2kill + v.points2kill
		end
		
		
		res = res and AID.targets[ res ].entityId or nil
		
		-- смотрим подходит ли цель обжектив ПВЕ, как "цель для стрельбы" для бота
		-- AID.clientFocusPoints,    { pos = o:GetPos(), id = o:GetId(), defName = defName, need_attack = need_attack }
		local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
					
		if AID.clientFocusPoints then 
			for i, v in pairs( AID.clientFocusPoints ) do
				local is_enemy = Entities[ v.id ] and 
					( RelationshipTable:GetRelationship( Entities[ v.id ]:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == ai.RelatioshipType.ENEMY ) or nil
				if ( v.need_attack and is_enemy and  math.random() < 0.5 ) or -- с вероятностью 0.5 выбираем цель обжектива вместо игрока
				( not res and v.need_attack and is_enemy ) then -- а если нет другой цели то 100%
					res = v.id
					break
				end
			end
		end

		return res 
	end	
end


-- установить выбор цели для бота/ботов из entityIds = { 1322, 1233, } всегда targetId (для ПВЕ)
function AID:PVE_ForceTarget( entityIds, targetId )
	if entityIds and type( entityIds ) == "table" and targetId and type( targetId ) == "number" then
		for i, id in pairs( entityIds ) do
			local bot = AID:GetBot( id )
			if bot then
				bot.forceTargetId = targetId
			end
		end
	end
end

--проверяем видима ли цель в смысле невидимости - незаметности
function AID:TargetVisible( entityId, distance )
	local ship = Entities[ entityId ]
	local res = false
	if not( ( ship and ship:CheckAura( ai.Aura.STEALTH ) ) or ( distance and ship and ship:CheckAura( ai.Aura.ANTI_RADAR ) and distance < 200 ) ) then
		res = true
	end
	return res 
end


function HideSpot( myShip, target )
	local myShip = myShip or nil -- кто прячется
	local target = target or CL_GetLocalPlayerShip() -- от кого прячется
	local min_hide_dist = 350
	local test_step = 30
	local ent, pos, normal = nil, nil,nil
	
	if myShip and target then 
		local hidePos = myShip:GetPos()
		local targetPos = target:GetPos()
		local dir = hidePos - targetPos 
		-- если корабли близко, то ищем укрытие все же подальше не ближе 3500м
		if #dir < min_hide_dist then
			hidePos = dir:GetNormalized() * min_hide_dist + targetPos 
		end
		local xc = Vec3(0,0,0)
		local yc = Vec3(0,0,0)
		local zc = Vec3(0,0,0)
		xc = CrossProduct( dir, Vec3(1,0,0), xc )
		yc = CrossProduct( dir, Vec3(0,1,0), yc )
		zc = CrossProduct( dir, Vec3(0,0,1), zc )
		--v1 и v2  векторы перпендикуляры к диру
		local v1 = ( ( #xc>#yc or #xc>#zc ) and xc:GetNormalized() ) or zc:GetNormalized() 
		local v2 = ( ( #yc>#xc or #yc>#zc ) and yc:GetNormalized() ) or zc:GetNormalized()

		--local res = nil
		for i = 1, 6 do
			local step = i * test_step
			ent, pos, normal = TraceLine( hidePos + v1 * step, targetPos, true )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos + v1 * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
			if pos then break end
			ent, pos, normal = TraceLine( hidePos - v1 * step, targetPos, true )			
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos - v1 * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
			if pos then break end
			ent, pos, normal = TraceLine( hidePos + v2 * step, targetPos, true )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos + v2 * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
			if pos then break end
			ent, pos, normal = TraceLine( hidePos - v2 * step, targetPos, true )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos - v2 * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
			if pos then break end
		end
		if not pos then
			for i = 1, 6 do
				local step = i * test_step * 2
				ent, pos, normal = TraceLine( hidePos + (v1+v2) * step, targetPos, true )
				--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos + (v1+v2) * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
				if pos then break end
				ent, pos, normal = TraceLine( hidePos - (v1+v2) * step, targetPos, true )
				--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos - (v1+v2) * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
				if pos then break end
				ent, pos, normal = TraceLine( hidePos + (v2-v1) * step, targetPos, true )
				--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos + (v2-v1) * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
				if pos then break end
				ent, pos, normal = TraceLine( hidePos - (v2-v1) * step, targetPos, true )
				--table.insert( AID.debug_draw, { draw_type = 1, p1 = hidePos - (v2-v1) * step, p2 = targetPos, color = 255*256* 256 + 255*256 + 110} )
				if pos then break end
			end
		end
		if pos then
			--dprint( "HideSpot" )
			--dprint( pos )
			--отступаем от коллизии
			pos = pos  + ( pos - targetPos ):GetNormalized() * 50 --+ normal * 10 

			--dprint( pos )
			--table.insert( AID.debug_draw, { draw_type = 1, p1 = pos, p2 = targetPos, color = 245} )
		end
	end
	return pos
end


-- ищем укрытие "у союзника"  то есть смотрим кто из союзников дает укрытие и летим к нему
function AID:GetAllyHideSpot( my_ship, my_bot, maxDist2Hide, targetPos, dist2Target  ) -- maxDist2Hide  дольше этого не летим . dist2Target -- +-35% допустимое расстояние до targetPos
	local hide_dist = 30
	local res = nil
	--перебираем дружественные корабли в поиске isHideSpot	
	for i, bot in pairs( AID.bots ) do
		if ( not bot.isDead ) and ( bot.isHideSpot ) and bot ~= my_bot  then  -- прятающий бот, 			 
			if bot.pos and my_bot.pos and #(bot.pos - my_bot.pos) < maxDist2Hide + hide_dist then  -- не так уж и далеко
				if #(bot.pos - my_bot.pos) < hide_dist * 1.5 then -- мы уже спрятаны за этим мобом !!1
					break
				end
				-- прячемся поддерживая дистанцию до цели
				if dist2Target and targetPos and #( bot.pos - targetPos ) < dist2Target * 1.5 and #( bot.pos - targetPos ) > dist2Target * 0.66 then 
					res = hide_dist * ( my_bot.pos - bot.pos ):GetNormalized() + bot.pos -- летим (без проверок пока)
					break
				-- просто прячемся
				elseif not dist2Target then
					if targetPos then 
						res = hide_dist * 0.5 * ( bot.pos - targetPos ):GetNormalized() + bot.pos -- за бота 
						break
					else 
						res = hide_dist * ( my_bot.pos - bot.pos ):GetNormalized() + bot.pos -- просто рядом
						break
					end
				end
			end
		end
	end
	return res
end



function AID:GetMobSpawnPos(predefinedPortalPoints)
			--поиск подходящих мест спавна --AID.spawnPos, { entityId = v, pos = tp:GetPos() }
			--local 
			targetPos =  {}
			--local pos_ = AID.targets[ 1 ] and AID.targets[ 1 ].pos or Vec3( 1, 0, 0 )  
			-- подбираем в массив всех игроков
			for i, v in pairs( AID.targets ) do
				if v and v.pos then
					table.insert( targetPos ,v.pos )
				end
			end
			--local pos = PvE_Mission and PvE_Mission.vitalsInGame and PvE_Mission.vitalCurrent and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ] and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos or pos_  
			-- позиция витал поинта (ключевых объектов)
			--  AID.clientFocusPoints ... { pos = o:GetPos(), id = o:GetId(), defName = defName, need_attack = need_attack, main_obj = true } 
			if AID.clientFocusPoints and #AID.clientFocusPoints >0 then
				for i, v in pairs( AID.clientFocusPoints ) do
					if v.main_obj and v.pos and v.need_attack then
						table.insert( targetPos ,v.pos )
					end
				end
			end
			
			local s = {} -- массив подходящих спавнов
			local near = nil  -- если массив будет пуст на выходе то возьмем этот ближайший поинт
			local n_pos = Vec3(0,0,0)
			local dir = nil -- направление на цель
			local near_d = 100000 -- расстояние до ближайшего поинта
			local min_dist = 100 -- не ближе этого   параметры выбора в таблицу 
			--local AID.max_dist = 300 -- не дальше этого
			
			local spawnPos = predefinedPortalPoints or AID.spawnPos
			
			for i, sp in pairs( spawnPos ) do
				for pos_i, pos in pairs( targetPos ) do
					local d = #(sp.pos - pos )
					if d > min_dist and d < AID.max_dist then -- портал в вилке мин_дист - мах_дист
						local r = true
						for i1, v in pairs( AID.targets ) do  -- все игроки на расстоянии более 800м от портала
							r = r and #( v.pos - sp.pos ) > 80
						end
						if r then 
							table.insert( s, { i = i , pos = pos } )
						end
					end
					if d < near_d then
						near_d = d
						near = i
						n_pos = pos
					end
				end
			end
			--dprint( "Points found to spawn ships: " .. tostring( #s ) )
			if #s > 0 then
				local n = math.random( #s )
				near = s[ n ].i
				n_pos = s[ n ].pos
			end
			if near then 
				dir = ( n_pos - spawnPos[ near ].pos ):GetNormalized()
			end
	return near, dir
end



-- Ищем место для объекта
function AID:GetPlace( pos_t, dist, s ) -- относительно pos  на расстоянии dist размера s
	-- ищем место рядом с витал поинтом где нет статики
	local s = s or 10
	local dist = dist or 70
	local possible_point = { Vec3( 0, 1, 0 ), Vec3( 0, -1, 0 ), Vec3( 1, 0, 0 ), Vec3( -1, 0, 0 ), Vec3( 0, 0, 1 ), Vec3( 0, 0, -1 ), }
	-- рандомизируем случайные точки
	local pp = {}
	local possible_random_point =  {}
	for i = 1, #possible_point do
		table.insert( pp, possible_point[i] )
	end
	for i = 1, #pp do
		local r = math.random(#pp)
		table.insert( possible_random_point, pp[r] )
		table.remove( pp, r )
	end
	
	--ищем точку
	local final_point = nil
	local ent, pos, normal, n  = nil, nil, nil, nil
	for i = 1, #possible_random_point do
		ent, pos, normal = TraceLine( pos_t + (dist + s * 2) * possible_random_point[i], pos_t, true )
		if not pos then 
			final_point = pos_t + dist * possible_random_point[i]  -- точка "найдена"
			--трейслайним "кристалл" чтобы убедится что это не одиночная дырка, а "объем"
			local res = true
			for j = 3, 6 do -- от верхней вершины possible_random_point[1] по бокам
				ent, pos, normal = TraceLine( final_point +  s * possible_point[1], final_point +  s * possible_point[j], false )
				if pos or ent then 
					res = false
					break
				end
			end
			if res then 
				for j = 3, 6 do -- от нижней вершины possible_random_point[2] по бокам
					ent, pos, normal = TraceLine( final_point +  s * possible_point[2], final_point +  s * possible_point[j], false )
					if pos or ent then 
						res = false
						break
					end
				end	
			end
			if res then
				break 
			else 
				final_point = nil
			end
		end
	end
	
	return final_point
end


function AID:GenerateBots( dt )
 	--PvE_Mission.nCurPhase
	--local maxBots = 25 -- максимум простых ботов (может быть больше на пак)
	local MeatBots_t1 = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].MeatBots_t1
		or { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" }
	local MeatBots_t2 = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].MeatBots_t2	
		or { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" }
	local EliteBots = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and  PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].EliteBots
		or { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L",  }
	local Executor = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and  PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].Executor or { "Ship_Gen_Elite_Saboteur_Executor" }
	local BossBots	= PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and  PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].BossBots
		or { "Ship_Gen_Boss_Empire_Destroyer", "Ship_Gen_Boss_Federation_Destroyer", "Ship_Gen_Boss_Jericho_Destroyer", "Ship_Gen_Boss_Predator", }
 	
	local portalTagPoints = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and  PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].portalTagPoints or nil
	local predefinedPortalPoints = nil
	local MainPortalTagPoints = PvE_Mission and PvE_Mission.aWaves and PvE_Mission.nCurPhase and PvE_Mission.aWaves[ PvE_Mission.nCurPhase ] and  PvE_Mission.aWaves[ PvE_Mission.nCurPhase ].MainPortalTagPoints or nil
	local predefinedMainPortalPoints = nil
	--заполняем таблицу порталов для спавна
	if portalTagPoints then 
		predefinedPortalPoints = {}
		for _,v in ipairs(portalTagPoints) do
			local entity = GetObjectByName(v)
			if entity then 
				table.insert(predefinedPortalPoints, {entityId = entity:GetId(), pos = entity:GetPos()})
			end
		end
	end
	
	if MainPortalTagPoints then 
		predefinedMainPortalPoints = {}
		for _,v in ipairs(MainPortalTagPoints) do
			local entity = GetObjectByName(v)
			if entity then 
				table.insert(predefinedMainPortalPoints, {entityId = entity:GetId(), pos = entity:GetPos()})
			end
		end
	end
	-- генерация "волн"  только в режиме "нарастания боли" и "плато"
	--local respawnWaveTime = 22	
	AID.generateBotsTime = ( AID.generateBotsTime and AID.generateBotsTime + dt ) or AID.respawnWaveTime
	if ( AID.painState == AID.painStates.PainGrow or AID.painState == AID.painStates.PainPlato ) and  AID.numBots < AID.maxBots and #MeatBots_t1 > 0 then
		if AID.generateBotsTime > AID.respawnWaveTime then 
			--dprint("AID:GenerateBots( dt )")
			AID.generateBotsTime = 0
			
			local near, dir = AID:GetMobSpawnPos(predefinedPortalPoints)
			
			if near then 
				--------------- генератор пака
				local packDefs = {}
				local packAvt = {}
				-- пак состоит из pack_size t1 мобов + 1 моб т2/ элит?
				local pack_size = 1 + math.random( 2 ) -- 2-3
				for i = 1,  pack_size do
					table.insert( packDefs, MeatBots_t1[ math.random( #MeatBots_t1 ) ] )
					local avt = Def[packDefs[#packDefs] ].avtomat and Avt[ Def[packDefs[#packDefs] ].avtomat ] or Avt.Pack_Dive -- Avt.Pack_Dive  --DistanceHitAndRun
					table.insert( packAvt, avt )
				end
				--лидер пака
				if AID.numBots < 10 then  -- если ботов мало, то лидер ботов "крутой"
					table.insert( packDefs, EliteBots[ math.random( #EliteBots ) ] )
				else -- если ботов много, то лидер ботов "средний"
					table.insert( packDefs, MeatBots_t2[ math.random( #MeatBots_t2 ) ] )
				end
				local avt = Def[packDefs[#packDefs] ].avtomat and Avt[ Def[packDefs[#packDefs] ].avtomat ] or Avt.Pack_Dive -- Avt.Pack_Dive  --DistanceHitAndRun
				table.insert( packAvt, avt )

				
				-- если люди долго давят спавны, то добавляем в спавн бота - экзекутора, но не бесконечно
				if 	( AID.painTime < 0 and AID.painTime > -AID.respawnWaveTime * 2 and AID.painState == AID.painStates.PainGrow ) and #Executor > 0 then
					table.insert( packDefs, Executor[ math.random( #Executor ) ] )
					avt = Def[packDefs[#packDefs] ].avtomat and Avt[ Def[packDefs[#packDefs] ].avtomat ] or Avt.Pack_Dive -- Avt.Pack_Dive  --DistanceHitAndRun
					table.insert( packAvt, avt )
				end
					
					
				--хак = если в фазе надо мочить НПС, то подходит только AttackAndRun
				if AID.clientFocusPoints and AID.clientFocusPoints[1] and AID.clientFocusPoints[1].need_attack then 
					for i,v in pairs( packAvt ) do
						packAvt[i] = Avt.AttackAndRun
					end
				end
				
				--порождаем
				--создаем пак из кораблей units, вокруг точки pos (или перед игроком), через designers:AddBot,  возвращаем таблицу кораблей
				local p = designers:AddPack( packDefs, AID.spawnPos[near].pos , 2, "pack " .. tostring (AID.max_packId + 1 ) .." : ", dir ) -- в p таблица кораблей(Ent)
				designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.    вносим в систему аид-бехевиаров
				
				--стартовая неуязвимость
				for i, v in pairs( p ) do					
					AID:SpellCast( v, "BotInvulnerability7" )
				end
				
				if AID.aPortals and next( AID.aPortals ) then
					local spawnApproved = true
					local newPos = Vec3( 0, 0, 0 )
					for i, portal in pairs( AID.aPortals ) do
						if Entities[ portal.id ] then
							local pPos = Entities[ portal.id ]:GetPos()
							newPos = pPos - AID.spawnPos[ near ].pos
							if #( newPos ) <= 10 then
								AID.aPortals[ portal.id ].timer = 10 
								spawnApproved = false
								break
							end
						end	
					end
					if spawnApproved == true then 
					--	sys.out( "newPos_"..#newPos )
						if AID.portals == true then
							AID:PortalInitialization( p[ 1 ], near )	
						end
					end
				elseif AID.aPortals and AID.portals == true then
					AID:PortalInitialization( p[ 1 ], near )
				end

				-------------------------
				-- ускоряем спавн, если ботов мало и стаже 1
				if AID.painState == AID.painStates.PainGrow and AID.numBots+pack_size < 4  then  -- 1-3 то ваще сразу
					AID.generateBotsTime = AID.respawnWaveTime - 1
				elseif AID.painState == AID.painStates.PainGrow and AID.numBots+pack_size < 5 then -- 4 
					AID.generateBotsTime = AID.respawnWaveTime * 0.5
				elseif AID.painState == AID.painStates.PainGrow and AID.numBots+pack_size < 7 then
					AID.generateBotsTime = AID.respawnWaveTime * 0.8
				end
			end
		end
	end 
	
	-- генерация "Элитников"  только в режиме "нарастания боли" и "плато" и "спад боли"  раз в х (90 сек)
	if EliteBots and #EliteBots > 0 then
		local respawnEliteTime = 45
		AID.generateEliteTime = ( AID.generateEliteTime and AID.generateEliteTime + dt ) or 0
		if ( AID.painState == AID.painStates.PainGrow or AID.painState == AID.painStates.PainPlato or AID.painState == AID.painStates.PainDown ) then 
			if AID.generateEliteTime > respawnEliteTime then 
				if lua_debug then dprint("generateElite") end
				-- 
				AID.generateEliteTime = 0
				
				local near, dir = AID:GetMobSpawnPos(predefinedPortalPoints)
				if near then 
					--------------- генератор пака
					local packDefs = {}
					local packAvt = {}
					table.insert( packDefs, EliteBots[ math.random( #EliteBots ) ] )
					local avt = Def[ packDefs[1] ].avtomat and Avt[ Def[packDefs[1] ].avtomat ] or Avt.Pack_Dive -- Avt.Pack_Dive  --DistanceHitAndRun
					table.insert( packAvt, avt )
					
					local p = designers:AddPack( packDefs, AID.spawnPos[near].pos , 2, "Elite " .. tostring (AID.max_packId + 1 ) .." : ", dir )
					designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.
				end
			end
		end  
	end
	
	-- Генерация БОССОВ
	-- пока привязано к маякам
--[[ 	if not AID.BossStages then
		AID.BossStages = { 0,1,0,1,0,1,0,0,0 } -- на каких этапах порождать босса
	end ]]
	if #BossBots > 0 and PvE_Mission and PvE_Mission.nCurPhase > 0 and 
	PvE_Mission.aPhases[PvE_Mission.nCurPhase].bRandomBoss and not PvE_Mission.aPhases[PvE_Mission.nCurPhase].BossSpawned then
		--if PvE_Mission.vitalsInGame and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ] and PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos then
		local isPredefined = predefinedMainPortalPoints and #predefinedMainPortalPoints > 0 or false
		if isPredefined or (AID.clientFocusPoints and #AID.clientFocusPoints > 0) then
			PvE_Mission.aPhases[PvE_Mission.nCurPhase].BossSpawned = true -- больше босса тут порождать не будем
			
			-- ищем место рядом с витал поинтом где нет статики
--[[ 			local possible_point = { Vec3( 0, 70, 0 ), Vec3( 0, -70, 0 ), Vec3( 70, 0, 0 ), Vec3( -70, 0, 0 ), Vec3( 0, 0, 70 ), Vec3( 0, 0, -70 ), }
			local ent, pos, normal, n  = nil, nil, nil, nil
			for i = 1, #possible_point do
				ent, pos, normal = TraceLine( 	PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos + 1.2 * possible_point[i], 
												PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos, true )
				if not pos then 
					n = i
					break 
				end
			end ]]
			
			--AID.clientFocusPoints  { { pos = o:GetPos(), id = o:GetId(), defName = o:GetDefName() }, ... }
			local place = nil
			local behavior_guardPos = nil
			
			if isPredefined then 
				for _, fp in ipairs ( predefinedMainPortalPoints ) do -- ищем вокруг ключевой точки
					place = AID:GetPlace( fp.pos, 70, 12 ) -- относительно pos  на расстоянии dist размера s
					if place then 
						break
					end
				end
			end
			
			
			if not place and #AID.clientFocusPoints > 0 then
				for plI, fp in pairs ( AID.clientFocusPoints ) do -- ищем вокруг ключевой точки
					place = AID:GetPlace( fp.pos, 70, 12 ) -- относительно pos  на расстоянии dist размера s
					if place then 
						break
					end
					--place = AID:GetPlace( PvE_Mission.vitalsInGame[ PvE_Mission.vitalCurrent ].pos, 70, 12 ) -- относительно pos  на расстоянии dist размера s
				end
				if not place then
					for plI, fp in pairs ( AID.clientFocusPoints ) do -- ищем обычный спавн спот "рядом"
					--AID.spawnPos, { entityId = v, pos = tp:GetPos() }
						local fpe = Entities[ fp.id ]
						local dist_ = 1000000
						for i, v in pairs( AID.spawnPos ) do
							if fpe and #(fp.pos - v.pos) < dist_ then
								place = v.pos
								behavior_guardPos = fp.pos + fpe:GetUpDir() * 30
								dist_ = #(fp.pos - v.pos)
								--break
							end
						end
						if place then break end
					end
				end
			end
			
			-- если место нашли то порождаем:
			if place then 
				local packDefs = {}
				local packAvt = {}
				table.insert( packDefs, BossBots[ math.random( #BossBots ) ] )
				local avt = Def[packDefs[1]].avtomat and Avt[ Def[packDefs[1]].avtomat ] or Avt.GuardPoint  -- Avt.Pack_Dive  --DistanceHitAndRun
				table.insert( packAvt, avt )
				local p = designers:AddPack( packDefs, place, 
							2, "Boss " .. tostring (AID.max_packId + 1 ) .." : " )
				designers:AddPackInAID( p, packAvt ) -- таблица кораблей и таблица бехевиоров.
				
				-- охраняемая точка 
				if p[1] then
					local id =  p[1]:GetId()
					if id then 
						local bot = AID:GetBot( id )
						if bot then 
							bot.behavior_guardPos = behavior_guardPos -- надо потестить может надо где то "точку рядом " искать
						end
					end
				end
			else 
				sys.out( "in phase " .. tostring( PvE_Mission.nCurPhase ) .. "  place for boss not found. ---")
			end
		end
	end
 	
	-- Включаем  рандом эвенты
	-- Если на текущей фазе подключен бит случайного эвента и есть список случайных эвентов
	if PvE_Mission and PvE_Mission.nCurPhase > 0 and 
			next( PvE_Mission.aPhases[PvE_Mission.nCurPhase].PossibleEvents ) and not PvE_Mission.aPhases[PvE_Mission.nCurPhase].RandomEventSpawned then
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].PossibleEvents and #PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].PossibleEvents > 0 then
			PvE_Mission.aPhases[PvE_Mission.nCurPhase].RandomEventSpawned = true -- больше тут порождать не будем 
			-- выбираем эвент - чтобы без повторений
			local p_event = {}
			for i, v in pairs( PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].PossibleEvents ) do
				if ( not v.nPhaseStart ) and ( not v.isActive ) and ( not v.isStarted ) and ( not v.isComplete ) and ( not v.isFailed ) then
					table.insert( p_event, v )
				end
			end
			
			local eventName = #p_event> 0 and p_event[ math.random( #p_event ) ]
			if eventName and eventContainer and eventContainer[eventName] then
				eventContainer[eventName].nPhaseStart = PvE_Mission.nCurPhase  -- так "включаем эвент" он начнет апдейтится после этого
				eventContainer[eventName].isActive = true
				if lua_debug then dprint("Started Event: "..eventName ) end
			else 
				sys.out( "Random Event not found" )
			end
		else
			sys.out( "Random Event table not found" )
		end
	end
end


function AID:Portals( dt )
	if AID.aPortals ~= nil then
		for i, portal in pairs( AID.aPortals ) do
			if AID.aPortals[ i ].timer > 0 then
				AID.aPortals[ i ].timer = AID.aPortals[ i ].timer - dt
			end
			
			if AID.aPortals[ i ].timer <= 0 then
				local p = Entities[ AID.aPortals[ i ].id ]
				if p then
					local pos = p:GetPos()
					local ending = ai.Spawn( "PvE_Gen_PortalOpening" )
					ending:SetPos( pos )
					p:Remove()
					AID.aPortals[ i ].id = nil
					AID.aPortals[ i ].endingId = ending:GetId()
					AID.aPortals[ i ].endingTime = 2
					designers:SafeRemove( AID.aPortals[ i ].openId ) --	Entities[ AID.aPortals[ i ].openId ]:Remove()
					AID.aPortals[ i ].openId = nil
				end
				if AID.aPortals[ i ].endingTime > 0 then
					AID.aPortals[ i ].endingTime = AID.aPortals[ i ].endingTime - dt
				elseif AID.aPortals[ i ].endingTime < 0 then
					designers:SafeRemove( AID.aPortals[ i ].endingId ) --Entities[ AID.aPortals[ i ].endingId ]:Remove()
					AID.aPortals[ i ] = nil
				end
			end	
			
		end
	else 
		AID.aPortals = {}	
	end
	
	
	
end


--покадровый апдейт эвентов
function AID:EventUpdate( container, dt, curPhase )
	local cEvent, dEvent
	local nPhase, dPhase

	if not PvE_Mission.bRandomEventsInit then
	
		if Game_IsServer() then	-- зачищаем возможные остатки информации от предыдущих пве на клиентах
			ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_PveEventsReset" )
		else
			CL_PveEventsReset()
		end

		local i
		for i = 1, 10 do
			PvE_Mission.aRandomPoints[ #PvE_Mission.aRandomPoints + 1 ] = "pos"..i
		end		
		
		for cEvent, dEvent in pairs( container ) do
			if dEvent.fInit then -- если есть что сделать на старте миссии - то делаем
				dEvent:fInit( container, dt, curPhase, dEvent )
			end
		end	
		
		PvE_Mission.bRandomEventsInit = true
	end
	
	for cEvent, dEvent in pairs( container ) do
		if dEvent.isStarted then
			if dEvent.isActive then 
				if dEvent:fUpdate( container, dt, curPhase, dEvent ) then
					if dEvent.isFailed then
						if dEvent.cTextOnFailed then
							local text_id = dEvent.cTextOnFailed
							local time_show = dEvent.time_show or 10
							SV_ShowDialogScript( -1, PvE_Character[ dEvent.cCharacterOnFailed ][ 1 ], PvE_Character[ dEvent.cCharacterOnFailed  ][ 2 ], text_id, time_show )	
						end	
						
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FailPVEEvent", cEvent )
						else
							PvE_Common.UI.PveEvents:FailPVEEvent( cEvent )
						end
						
						dEvent.isActive = false
						dEvent:fEnd( container, dt, curPhase, dEvent )
					else
						dEvent.isComplete = true
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", cEvent, dEvent.EventCounterMax )
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_CompletePVEEvent", cEvent )
						else
							PvE_Common.UI.PveEvents:UpdatePVEEvent( cEvent, dEvent.EventCounterMax )
							PvE_Common.UI.PveEvents:CompletePVEEvent( cEvent )
						end		
						if dEvent.cTextOnComplit then
							local text_id = dEvent.cTextOnComplit
							local time_show = dEvent.time_show or 10
							SV_ShowDialogScript( -1, PvE_Character[ dEvent.cCharacterOnComplit ][ 1 ], PvE_Character[ dEvent.cCharacterOnComplit  ][ 2 ], text_id, time_show )	
						end	
						dEvent.isActive = false
						dEvent:fEnd( container, dt, curPhase, dEvent )
					end	
				end
			
				if dEvent.EventCounterLast < dEvent.EventCounter then -- апдейт
					dEvent.EventCounterLast = dEvent.EventCounter
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", cEvent, dEvent.EventCounterLast )
					else
						PvE_Common.UI.PveEvents:UpdatePVEEvent( cEvent, dEvent.EventCounterLast )
					end
				end				
			end
		elseif curPhase == dEvent.nPhaseStart then
			if not dEvent.timer then
				dEvent.timer = 10
			else
				dEvent.timer = dEvent.timer - dt
				if dEvent.timer < 0 then
					dEvent.isStarted = dEvent:fStart( container, dt, curPhase, dEvent )
					if dEvent.cTextOnStart then						
						local text_id = dEvent.cTextOnStart
						local sound = dEvent.cSoundOnStart or nil
						local time_show = dEvent.time_show or 10
						SV_ShowDialogScript( -1, PvE_Character[ dEvent.cCharacterOnStart ][ 1 ], PvE_Character[ dEvent.cCharacterOnStart  ][ 2 ], text_id, time_show, sound )	
						
						local time_max = -1
						if dEvent.EventTimer then
							time_max = dEvent.EventTimer
						end
					
						local target_max = dEvent.EventCounterMax or 1
						
						local target_def = dEvent.EventTargetDefs or {}

						local reward = dEvent.reward or - 1
						
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_ActivatePVEEvent", cEvent, time_max, target_max, target_def, reward )
						else
							PvE_Common.UI.PveEvents:ActivatePVEEvent( cEvent, time_max, target_max, target_def, reward )
						end						
					end
				
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_UpdatePVEEvent", cEvent, dEvent.EventCounterLast )
					else
						PvE_Common.UI.PveEvents:UpdatePVEEvent( cEvent, dEvent.EventCounterLast )
					end
					
					if not dEvent.EventCounter then
						dEvent.EventCounter = 0
					end
					dEvent.EventCounterLast = dEvent.EventCounter	
				end			
			end
		else	
		end
	end
end	

function AID:PortalInitialization( p, near, event )

	local gId = -1

	local spawnApproved = true
	local newPos = 0
	for i, portal in pairs( AID.aPortals ) do
		if portal and portal.id then
			local pPos = Entities[ portal.id ]:GetPos()
			newPos = SquareLen( pPos, AID.spawnPos[ near ].pos )
			if newPos <= 100 then
				AID.aPortals[ portal.id ].timer = 10 
				spawnApproved = false
				gId = portal.id
				break
			end
		end	
	end
	
	if spawnApproved == true then 
		if AID.portals == true then
			local g = ai.Spawn( "PvE_Gen_Portal" )
			local o = ai.Spawn( "PvE_Gen_PortalOpening" )
			g:ShowInHud( false )
			gId = g:GetId()
			local r = p:GetRot()
			g:SetPos( AID.spawnPos[ near ].pos )
			o:SetPos( AID.spawnPos[ near ].pos )
			g:SetRot( r * Quat( 0.5, 0, 0, 0.5 ) )

			if AID.aPortals[ gId ] then 
			else
				AID.aPortals[ gId ] = {}	
			end
			AID.aPortals[ gId ].state = 1
			AID.aPortals[ gId ].timer = 8 
			AID.aPortals[ gId ].id = gId
			AID.aPortals[ gId ].openId = o:GetId()
		end
	end	
	if event then
		return gId	
	end
end

function AID:SpellCast( ship, spell )
	--const char* spellDefName, i32 inflictorId, i32 casterId, Object target, Vec3 targetPos
	if ship then
		local id = ship:GetId()
		if id and Spell[ spell ] then
			SV_Pve_CastSpell( spell, id, id, ship, ship:GetPos() ) 
		end
	end
end

function AID:DebugOnStart()
	if (not Game_IsServer() ) and ( not Game_IsClient() ) then
		if cvars.profile_name == "andrei_katorgin" or cvars.profile_name == "alexey_rechkalov" then
			sys.concmd( 'ship_create Ship_Race1_M_T5' )
			sys.concmd( 'cheat_equipWeapon Weapon_Railgun_Basic_T5_Epic' )
			sys.concmd( 'undying' )
			
			--disable_bots = true
			
			-- -- --бафф изображающий из игшрока пати
			local n = CL_GetLocalPlayerShip() and CL_GetLocalPlayerShip():GetName()
			if n then 
				sys.concmd( "spell_cast PVETestBuff "..n )
				sys.concmd( "spell_cast PVETestBuff2 "..n )
				local ln = GetLevelName()
				if ln and ln == "pve_desttown" then
					CL_GetLocalPlayerShip():SetPos(Vec3(-385,141,-300))
				elseif ln and ln == "test_ai" then
					CL_GetLocalPlayerShip():SetPos(Vec3(-614,-41,-407))
				end
			end
		end
	end
end


function AID:RemoveShip( ship, shipId )
	--так как убиваем то надо вызвать (программисты не вызывают)
	if Mission and Mission.SV_OnSpaceShipKill then
		Mission:SV_OnSpaceShipKill( shipId, {} )
	end
	ship:Remove()
end


function AID:DebugDraw()
	if not AID.debug_draw then
		AID.debug_draw = { }
	end
	if not Game_IsServer() and lua_debug then
		if AID.debug_draw then
			for i, v in pairs( AID.debug_draw ) do
				local color = v.color or 255
				if v.draw_type == 1 then
					if v.p1 and v.p2 then
						DrawDebugLine( v.p1, v.p2, color )
					end
				end
				if v.draw_type == 2 then
					if v.p1 and v.r then
						DrawDebugSphere( v.p1, v.r, color, false, true )--  /* draw debug sphere in 3d */
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


function testPack( def )
	if def and not Def[ def ] then
		sys.out( "Def ".. def .." not found" )
	end
	local def = def and def or "Ship_Gen_Meat_Command_Attacker_M"
	local avt = Def[ def ].avtomat and Avt[ Def[ def ].avtomat ] or Avt.DistanceHitAndRun

	local p = designers:AddPack( { def }, 200, 2, "pack " )  -- Ship_Gen_Elite_Command_Sniper_M
	--designers:AddPackInAID( p, { Avt.Pack_Dive,  Avt.Pack_Dive } ) -- таблица кораблей и таблица бехевиоров.
	designers:AddPackInAID( p, {  avt } ) -- таблица кораблей и таблица бехевиоров.
	
	--Avt.DistanceHitAndRun
	--designers:AddPackInAID( p, { Avt.Hide, } ) -- таблица кораблей и таблица бехевиоров.
	RemoveAllyBots()
end


function SpawnDraw()
		--void DrawDebugSphere( Vec3 center, float radius, int color, [bool nurb], [bool zBuffer] )   /* draw debug sphere in 3d */
	for i, sp in pairs( AID.spawnPos ) do
		table.insert( AID.debug_draw, { p1 = sp.pos, r= 37, color = 200, draw_type = 2 } )
	end
end


function RemoveAllyBots()
	local ship = CL_GetLocalPlayerShip()
	local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
	for i, pid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local p = Entities[ pid ]
		if p and ship then
			if p ~= ship and ( RelationshipTable:GetRelationship( p:GetRelationshipGroup(), ship:GetRelationshipGroup() ) == 0 ) then
				p:Remove()
			end
		end
	end
end


function KillAll()
	local ship = CL_GetLocalPlayerShip()
	local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
	for i, pid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		local p = Entities[ pid ]
		if p and ship then
			if p ~= ship and ( RelationshipTable:GetRelationship( p:GetRelationshipGroup(), ship:GetRelationshipGroup() ) > 0 ) then
				p:Remove()
			end
		end
	end
end


function FindBot( id ) 	 --!!! на фига это?
	for i, b in pairs( AID.bots ) do 
		if b.entityId == id then 
			--dprint( i )	
			return i
		end	
	end
end


function AID:GetBot( id )
	for i, v in pairs( AID.bots ) do  
		if v and v.entityId and v.entityId == id then 
			return v
		end 
	end
	return nil
end


function AID:GetShip( bot )
	if bot and bot.entityId and ( not bot.removed ) then
		local ship = Entities[ bot.entityId ]
		if ship and not ship:IsDead() then
			return ship
		end
	end
end


-- Есть встроеное =Entities[240]:GetPlayerIdx()  [[ 0 .. max]] -1 если не игрок
--[[ function AID:GetPlayerByShipId( id )
	local  h_players = GetAllPlayersInfo()
	local res = nil
	if h_players then
		for i, player in pairs( h_players ) do
			if player and ( not player.isBot ) and player.entityId == id then
				res = player.playerId
				break
			end
		end
	end
end ]]


AID.Adv_EscapeByPortal = {} 
function AID.Adv_EscapeByPortal:Start( ship, bot, param )
	if lua_debug then dprint("AID.Adv_EscapeByPortal:Start") end
 	
	if ship then

		ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship )
		bot.total_max_health = ship:GetShieldMax() + ship:GetMaxHealth()
		bot.percent_health = (ship:GetHealth() + ship:GetShieldVal())/ bot.total_max_health
		bot.behavior = "Adv_EscapeByPortal"
		bot.behavior_time = 0
		if param then 
			bot.behavior_timeEnd = param
		else
			bot.behavior_timeEnd = 12
		end
		return true
	 end 
end

function AID.Adv_EscapeByPortal:Update( dt, ship_, bot )
	bot.behavior_time = bot.behavior_time + dt
	local ship = Entities[ bot.entityId ]
	if bot.behavior_time > bot.behavior_timeEnd then  -- в эвентах заканчивать будем при 30 -- другой проверяльщик этого же таймера в апдейте евента
	-- успех моба 		
		if ship and  ( not ship:IsDead() ) and ( not bot.removed ) then
			bot.removed = true
			AID:RemoveShip( ship, bot.entityId ) -- Mission:SV_OnSpaceShipKill( bot.entityId, {} ) + ship:Remove()
			AID.Adv_EscapeByPortal:Cancel( bot )
		end
		
	elseif ( not bot.PortalId ) and bot.behavior_time > bot.behavior_timeEnd - 2 then
		local portal = ai.Spawn( "PvE_Gen_Portal" )
		bot.PortalId = portal:GetId()
		local r = ship:GetRot()
		portal:SetPos( ship:GetPos() + 5 * ship:GetDir() )
		portal:SetRot( r * Quat( 0.5, 0, 0, 0.5 ) ) 
		ship:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, portal:GetPos() ) -- двигаем корабль в портал
	
	elseif bot.percent_health - ( ship:GetHealth() + ship:GetShieldVal() )/ bot.total_max_health > 0.15 then 	
		AID.Adv_EscapeByPortal:Cancel( bot )
		bot.behavior_time = 0
		AID:SetNewBehavior( ship, bot )
	end
end

-- вызываем если бехевиор был прерван. например смертью
function AID.Adv_EscapeByPortal:Cancel( bot )
	local e = bot.PortalId and Entities[ bot.PortalId ]
	if e then 
		e:Remove()
		bot.PortalId = nil
	end
end