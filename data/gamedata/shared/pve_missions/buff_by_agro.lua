--//////////////////////////////////////////////////////////////////////////////
--//
--// Created: 26-Feb-2020
--// Copyright © 2020, Targem LLC. All rights reserved.
--//
--// Система динамического скалирования HP и урона мобов
--//
--//////////////////////////////////////////////////////////////////////////////

--[[

-- Дефы:

Def.Test =
{
	...
	
	gameplay_coef_group_id = 0, -- Деф участвует в системе, на него будут наложены баффы, дефы с разным gameplay_coef_group_id могут иметь разный уровень, значения 0..3
	gameplay_coef_min_lifetime = 5, -- Этот деф должен жить как минимум n секунд
	
	...
}

-- Инициализация:

buffer = BuffByAgro( {

	buffs =
	{
		"buff1", -- Баффы, в них должен быть параметр gameplay_coef_group_id, равный group_id
		"buff2", -- Баффы, в них должен быть параметр gameplay_coef_group_id, равный group_id
		...
	},
	
	group_id = 0, -- Группа выбора дефов и аур, значения 0..3

	buff_level_max = 10, -- Максимальный уровень баффов
	check_period = 3, -- Каждые check_period с. проверяем, есть ли убитые раньше времени
	increase_coef = 1, -- Если да, то текущий уровень увеличивается на (increase_coef * количество целей) вплоть до buff_level_max
	increase_coef_mul_max = 3, -- Ограничитель количества целей increase_coef
	decrease_coef = 0.2, -- Если нет, то текущий уровень уменьшается на decrease_coef вплоть до 0

	debug_level = BuffByAgro.dbg_lvl.INFO, -- Настройка дебага
})

-- Использование

buffer:Update( dt )

-- Автоматически подключает новые живые энтити в систему, если в дефе есть gameplay_coef_group_id, срабатывает не чаще, чем через update_period секунд
-- Определение "живого" производится в функции BuffByAgro:IsDead( entityId )

-- Также можно получить текущий уровень баффов:
buffer.buff_level
-- И максимальный:
buffer.buff_level_max

]]

BuffByAgro =
{

	dbg_lvl = 
	{
		ERRORS		= 0,
		WARNINGS	= 1,
		INFO		= 2,
		ADDITIONAL	= 3,
	},

	update_period = 0.5, -- Период подключения новых энтити в систему, уменьшить, если мобов будут убивать раньше, но лучше увеличить время стартовой неуязвимости мобов
	supported_classes = -- Поддерживаемые классы Entity
	{
		--"BaseEntity",
		"ScBaseEntity",
		"SpaceShip",
		"Turret",
		"VitalPointTurret",
		"CargoShip",
	},
	
	attack_detection_min_health = 0.5, -- Если здоровье+щиты снизились на этот уровень, то таймеры не перезапускаются
	attack_detection_coef = 0.1, -- Если здоровье+щиты снизились на этот уровень, то моб считается атакованным
	attack_detection_timeout = 18, -- Если здоровье+щиты не снизились в течении этого времени, то моб более не считается атакованным
	
	debug_level = 1, -- Дебажный вывод в консоль и логгирование
	
}

-- Конструктор объекта
local BuffByAgro_Meta = {}
function BuffByAgro_Meta:__call( params )

	-- Проверки
	if not ( type( params ) == "table" ) then
		error( "Params must be a table!" )
	end
	
	local group_id = tonumber( params.group_id ) or 0

	local buffs = {}
	if type( params.buffs ) == "string" then
		buffs = { params.buffs }
	else
		buffs = ( type( params.buffs ) == "table" ) and params.buffs or {}
	end
	local buff_level_max = tonumber( params.buff_level_max ) or 10
	local check_period = tonumber( params.check_period ) or 3
	local increase_coef = tonumber( params.increase_coef ) or 1
	local increase_coef_mul_max = tonumber( params.increase_coef_mul_max ) or 3
	local decrease_coef = tonumber( params.decrease_coef ) or 0.2

	local debug_level = tonumber( params.debug_level ) or BuffByAgro.debug_level

	local buffer =
	{
		-- group
		group_id = group_id,
		
		-- settings
		buffs = buffs,
		buff_level_max = buff_level_max,
		check_period = check_period,
		increase_coef = increase_coef,
		increase_coef_mul_max = increase_coef_mul_max,
		decrease_coef = decrease_coef,
		
		-- debug override
		debug_level = debug_level,
		
		-- system
		level = 0,
		buff_level = 0,
		update_timer = 0,
		check_timer = 0,
		
		targets = {},
	}
	
	-- Работа функций из designers.buffByAgro
	setmetatable( buffer, { __index = self } )
	
	if self.debug_level >= self.dbg_lvl.INFO then
		BuffByAgro:Log( "################################################" )
		BuffByAgro:Log( "  Created new instance of BuffByAgro" )
		BuffByAgro:Log( "################################################" )
		BuffByAgro:Log( "  Spell group: %f", group_id )
		BuffByAgro:Log( "------------------------------------------------" )
		BuffByAgro:Log( "  Max buffs level: %f", buff_level_max )
		BuffByAgro:Log( "  Update period: %f", self.update_period )
		BuffByAgro:Log( "  Check period: %f", check_period )
		BuffByAgro:Log( "  Increase coef: %f", increase_coef )
		BuffByAgro:Log( "  Decrease coef: %f", decrease_coef )
		BuffByAgro:Log( "################################################" )
	end
	
	return buffer
end
setmetatable( BuffByAgro, BuffByAgro_Meta )

function BuffByAgro:IsDeleted( entity_id )
	if ( not Entities[ entity_id ] ) then
		return true
	else
		return false
	end
end

function BuffByAgro:IsDead( entity_id )
	if ( self:IsDeleted( entity_id ) ) or
	 ( Entities[ entity_id ].IsDead and Entities[ entity_id ]:IsDead() ) or
	 ( Entities[ entity_id ].GetHealth and Entities[ entity_id ]:GetHealth() <= 0 ) then
		return true
	else
		return false
	end
end

function BuffByAgro:IsBuffExistsOnTarget( entity_id, buff )

	if self:IsDeleted( entity_id ) then
		return false
	end
	
	local entity = Entities[ entity_id ]

	if not entity.GetAppliedAuraCount then
		return false
	end

	for i = 1, entity:GetAppliedAuraCount() do
		local aura = entity:GetAppliedAura( i - 1 )
		if aura and aura:GetSpellDefName() == buff then
			return true
		end
	end

	return false

end

function BuffByAgro:AddBuffsToTarget( entity_id )

	if not self.targets[ entity_id ] or self:IsDead( entity_id ) then
		return false
	end
	
	local entity = Entities[ entity_id ]

	for _, buff in pairs( self.buffs ) do
		
		if Spell[ buff ] and ( Spell[ buff ].gameplay_coef_group_id == self.group_id ) then

			if entity.GetAppliedAuraCount then

				if not self:IsBuffExistsOnTarget( entity_id, buff ) then
					return SV_GP_CastSpell( buff, entity_id, entity_id, entity, entity:GetPos() )
				elseif self.debug_level >= self.dbg_lvl.WARNINGS then
					self:Log( "BuffByAgro%i: eId %i, name %s: already has aura %s", self.group_id, entity_id, entity:GetName() or entity:DefName(), buff )
				end
			end
		elseif self.debug_level >= self.dbg_lvl.ERRORS then
			self:LogError( "BuffByAgro%i: invalid spell %s", self.group_id, buff )
		end
		
	end
	
	if self.debug_level >= self.dbg_lvl.INFO then
		self:Log( "BuffByAgro%i: eId %i, name %s: initial buffs applied", self.group_id, entity_id, entity:GetName() or entity:DefName() )
	end
	
	return true
	
end

function BuffByAgro:BuffTargets()

	local level = math.floor( self.level )
	
	if self.buff_level == level then
		return false
	end

	SV_SetGameplaySpellAuraParamCoef( self.group_id, level )
	
	self.buff_level = level
	
	if self.debug_level >= self.dbg_lvl.INFO then
		self:Log( "BuffByAgro%i: buff changed to lvl %i (%f)", self.group_id, level, self.level )
	end
	
	return true
	
end

function BuffByAgro:GetHealthCoef( entity_id )
	if Entities[ entity_id ] then
		local shield = Entities[ entity_id ].GetShieldVal and Entities[ entity_id ]:GetShieldVal() or 0
		local shieldmax = Entities[ entity_id ].GetShieldMax and Entities[ entity_id ]:GetShieldMax() or 0
		local health = Entities[ entity_id ].GetHealth and Entities[ entity_id ]:GetHealth() or 0
		local healthmax = Entities[ entity_id ].GetMaxHealth and Entities[ entity_id ]:GetMaxHealth() or 0
		
		local summ = shield + health
		local summ_max = shieldmax + healthmax
		
		if summ_max > 0 then
			return ( summ / summ_max )
		end
	end
	
	return 0
end

function BuffByAgro:AddTargets()
	for _, class in ipairs( self.supported_classes ) do
		for _, entity_id in ipairs( GetEntitiesByClass( class ) ) do
			self:AddTarget( entity_id )
		end
	end
	return true
end

function BuffByAgro:AddTarget( entity_id )
	if self.targets[ entity_id ] or self:IsDead( entity_id ) then
		return false
	end

	local entity = Entities[ entity_id ]
	local defName = entity.GetDefName and entity:GetDefName()
	local def = Def[ defName ]
	if not def or not def.gameplay_coef_group_id or not ( def.gameplay_coef_group_id == self.group_id ) then
		return false
	end

	self.targets[ entity_id ] =
	{
		min_lifetime = def.gameplay_coef_min_lifetime or nil, -- Время жизни объекта, к которому стремимся
		trigger_time = 0, -- В это время объект будет проверен, при отсутствии атаки обновляется на "текущее время" + min_lifetime
		damaged_trigger_time = 0, -- Триггер "с момента последнего урона"
		last_hp_coef = 0, -- Предыдущий коэффициент ХП
	}
	
	if self.debug_level >= self.dbg_lvl.INFO then
		self:Log( "BuffByAgro%i: new target added, eId %i, name %s", self.group_id, entity_id, entity:GetName() or entity:DefName() )
	end
	
	self:AddBuffsToTarget( entity_id )

	self:UpdateTarget( entity_id )
	
	return self.targets[ entity_id ]
end

function BuffByAgro:UpdateTarget( entity_id )

	if not self.targets[ entity_id ] or self:IsDead( entity_id ) then
		return false
	end
	
	if not self.targets[ entity_id ].min_lifetime then
		return true
	end
	
	local healthCoef = self:GetHealthCoef( entity_id )
	
	if healthCoef <= self.attack_detection_min_health then
		return true
	end
	
	if healthCoef + self.attack_detection_coef < self.targets[ entity_id ].last_hp_coef then
		self.targets[ entity_id ].damaged_trigger_time = TimerGetGameTime() + self.attack_detection_timeout
	elseif self.targets[ entity_id ].damaged_trigger_time <= TimerGetGameTime() then
		self.targets[ entity_id ].trigger_time = TimerGetGameTime() + self.targets[ entity_id ].min_lifetime
	end
	
	self.targets[ entity_id ].last_hp_coef = healthCoef
	
	if self.debug_level >= self.dbg_lvl.ADDITIONAL then
		local entity = Entities[ entity_id ]
		self:Log( "BuffByAgro%i: target updated, eId %i, name %s, min_lifetime %f", self.group_id, entity_id, entity:GetName() or entity:DefName(), self.targets[ entity_id ].min_lifetime or -1 )
	end
	
	return true
end

function BuffByAgro:IsTargetDiedTooFast( entity_id )
	if self.targets[ entity_id ].min_lifetime and self:IsDead( entity_id ) then
		if TimerGetGameTime() <= self.targets[ entity_id ].trigger_time then
			return true
		end
	end
	return false
end

function BuffByAgro:CheckTargets()

	local died_count = 0

	for id, data in pairs( self.targets ) do
		if self:IsTargetDiedTooFast( id ) then
			
			died_count = died_count + 1
			
			if self.debug_level >= self.dbg_lvl.INFO then
				local entity = Entities[ id ]
				self:Log( "BuffByAgro%i: eId %i killed, current time is %f, target time is %f", self.group_id, id, TimerGetGameTime(), data.trigger_time or 0 )
			end
			
			self.targets[ id ] = nil
		end
	end
	
	local coef = 0
	if died_count > 0 then
		coef = math.min( died_count, self.increase_coef_mul_max ) * self.increase_coef
	else
		coef = ( -self.decrease_coef )
	end
	
	local new_level = self.level + coef
	new_level = math.min( math.max( 0, new_level ), self.buff_level_max )
	
	if self.debug_level >= self.dbg_lvl.INFO then
		self:Log( "BuffByAgro%i: died_count: %s, coef: %f, previous level: %f, new level: %f", self.group_id, died_count, coef, self.level, new_level )
	end
	
	self.level = new_level
	
	return true	
end

function BuffByAgro:UpdateTargets()

	self:CheckTargets()
	
	for id, data in pairs( self.targets ) do
		self:UpdateTarget( id )
	end

	self:BuffTargets()
	
	return true	
end

function BuffByAgro:Update( dt )
	self.update_timer = self.update_timer + dt
	self.check_timer = self.check_timer + dt
	
	if self.update_timer > self.update_period then
		self.update_timer = 0
		self:AddTargets()
	end
	
	if self.check_timer > self.check_period then
		self.check_timer = 0
		if self.debug_level >= self.dbg_lvl.ADDITIONAL then
			self:Log( "BuffByAgro%i: checking...", self.group_id)
		end
		self:UpdateTargets()
	end
	
	return true
end

function BuffByAgro:Log( ... )
	if self.debug_level >= self.dbg_lvl.ERRORS then
		_, str = pcall( string.format, ... )
		sys.log( str )
	end
end

function BuffByAgro:LogError( ... )
	if self.debug_level >= self.dbg_lvl.ERRORS then
		_, str = pcall( string.format, ... )
		sys.logError( str )
	end
end