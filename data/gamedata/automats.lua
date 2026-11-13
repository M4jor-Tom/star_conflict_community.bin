-- таблица бехавиоров  ( пример конечного автомата)
Avt = {}
Avt.Pack_Dive = 
 { 	
 -- защищать корабль в паке по циклу (если умрет защищаемый защищать следующий,) если невозможно делать состояние 1, то идти в состояние 2. Если возможно, то включать в стек состояний состояние 3
	{ behavior = "DefendShip", next_behavior = { 1, 2 }, possible_stack = { 3, }, },
	-- лететь на врага по прямой и пролететь "за него"
	{ behavior = "Dive", next_behavior = { 2, } }, 
	-- если у корабля хп корпуса меньше или ровно 0.5, то включить состояние "уклонения", 
	{ 	behavior = "BigEvade", 		
		conditions	= { -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					--condition_type = AICondition.ArmorLessThen,
					--param = 0.5,
				},
			},  
	}, 
	--{ behavior = "MapExit",   }, 
 }
 
-- прячась за камни снайперить = сделано для баферов- хилеров, то есть для неких элитных одиночных врагов
--снайпер - руннер
--    выбор цели
--    полет к позиции
--    поворот к цели
--    стрельба
--        потеряны ли цель
--    бегство если мало хп (должна быть хилка с активацией OnHide)
Avt.DistanceHitAndRun = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 4, 2, 3, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 350,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 150, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 250,
		},
		
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 4, 5, 3, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 400, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	--	possible_stack = { 3, }, 
	},
	--
	{ 	behavior = "Hide", 
		next_behavior = { 4, 1, 2, 3 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.8,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.Target,
				},
			},  
	}, 
	{ 	behavior = "Drifting", 
		next_behavior = { 3, 1, 5 },
		conditions	= { -- что проверяем
				--conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.2,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.35,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	}, 
}

--
Avt.DistanceHitAndStrafe = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 4, 2, 3, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 350,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 150, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 250,
		},
		
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 4, 5, 3, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 400, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	--	possible_stack = { 3, }, 
	},
	--
	{ 	behavior = "Hide", 
		next_behavior = { 4, 1, 2, 3 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.8,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.Target,
				},
			},  
	}, 
	{ 	behavior = "Strafe", 
		next_behavior = { 3, 5 },
		conditions	= { -- что проверяем
				--conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.2,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.35,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
		param = { ai.AiStrafeDirection.UP, ai.AiStrafeDirection.DOWN },  --ai.AiStrafeDirection.LEFT, ai.AiStrafeDirection.RIGHT 
	}, 
}




-- то же что и предыдущее но расстояние <1000m
Avt.CloseHitAndRun = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 4, 2, 3, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 100,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 60,
	},
		
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 4, 3, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistLess,
					param = 130, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	},
	--
	{ 	behavior = "Hide", 
		next_behavior = { 4, 1, 2, 3 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.8,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.Target,
				},
			},  
	}, 
	
}

-- Кратко для доклада
--[[ Avt.AttackAndRun = {  
	{ behavior = "FindTarget", next_behavior = { 1, 2, }, 
		conditions	= { { condition_type = AICondition.NoTarget, }, },
	}, -- просто выбор цели
	{ behavior = "Attack", next_behavior = { 3, 1, 2, }, -- атакуем цель по простому алгоритму
		conditions	= { { condition_type = AICondition.Target, }, },
		param = 5, -- время атаки
	},
	{ behavior = "Hide", next_behavior = { 3, 1, 2, },
		conditions	= { 
				conditions_and = true,
				{	condition_type = AICondition.ArmorLessThen, param = 0.8, },
				{	condition_type = AICondition.Target, },
			},  
	}, 
} ]]

-- атакуем  если хп мало, то отступаем, чекаем цель раз в 6 сек.
Avt.AttackAndRun = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	-- атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 3, 1, 2, }, 
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
			},
			--param = 5, -- время атаки
		},
		
	--
	{ 	behavior = "Hide", 
		next_behavior = { 3, 1, 2, },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.8,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.Target,
				},
			},  
	}, 
}




-- атакуем  если хп мало, то отступаем, чекаем цель раз в 6 сек.
Avt.GuardPoint = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	-- 
	{ behavior = "Guard", next_behavior = { 1, 3, 2, }, 
			param = 200, -- макс расстояние
	},
	
	{ 	behavior = "Drifting", 
		next_behavior = { 2 },
		conditions	= { -- что проверяем
				--conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.5,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},
			},  
	}, 
}

--Ship_Gen_Event_Goblin
Avt.GoblinRunAway = {
	{ 	behavior = "Hide", 
		next_behavior = { 2, 1, }, 
		-- кондишинов нет, если второе не стартануло то всегда тут вертимся
--[[		conditions	= { -- что проверяем
			},  
			]]
		
	}, 
	{ 	behavior = "EscapeByPortal", 
		param = 30, -- время выхода в портал
		next_behavior = { 2, 1, },
		-- кондишинов нет, если второе не стартануло то всегда тут вертимся
		conditions	= { -- что проверяем
				{ -- все враги далеко 
					condition_type = AICondition.DistMore,
					param = 450,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 450,
						-- AROUND
						},
				},
				{ -- или 
					condition_type = AICondition.TargetNotTrace,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 450,
						},
				},
			}, 
	}, 
}


-- автомат открытого мира -- босс летает по ключевым точкам (как то в моба пропишем) (бехевиор FlyRoute), в последней может деспавнится
Avt.BossEasyPatrol ={
	--осмотрется, есть ли кого побит
	{ 	behavior = "FindTarget",  -- Смотрим, есть ли цели в агро листе
		--next_behavior = { 1, 3, }, 
		next_behavior = { 1, 4, 3, 2 }, 
	}, 
	--"полет по пути"
	{ 	behavior = "FlyRoute",   -- если делать нече (нет целей, то летим по пути/ к цели)
		--next_behavior = { 1, 3, 2 }, 
		next_behavior = { 1, 4, 3, 2 }, 
	}, 
	--бой
	{ 	behavior = "FlyToDistanceShoot",    -- Летим на дистанцию выстрела
		--next_behavior = { 1, 4, 3, 2 }, 
		next_behavior = { 1, 4, 3, 2 }, 
		conditions	= { -- что проверяем
			--conditions_and = true,
			--checkBattlefieldRadius = true, -- если корабль за краем карты, то бехэвиор не сработает
			--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
			{  
				condition_type = AICondition.DistLess,
				param = 80,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
			{  
				condition_type = AICondition.DistMore,
				param = 350,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
			{
				condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			}, 
		},
		param = 120,		-- оптимальная дистанция
	}, 
	{ 	behavior = "DistanceShoot",    -- Стреляем цели
		--next_behavior = { 4, 1, 3, 2 }, 
		next_behavior = { 1, 4, 3, 2 }, 
		conditions	= { -- что проверяем
			checkBattlefieldRadius = true, -- если корабль за краем карты, то бехэвиор не сработает
			conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
			{  
				condition_type = AICondition.DistMore,
				param = 50, -- пушка должна стрелять дальше
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
			{  
				condition_type = AICondition.DistLess,
				param = 370,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		}, 		
	}, 
}



-- тестовые- "одиночные" бехевиоры
Avt.Dive = 
{
	{ behavior = "Dive", next_behavior = { 1, } }, 
}
-- пролет чуть ближе и сверху
Avt.CloseDive = 
{
	{ behavior = "Dive", next_behavior = { 1, },  param = 3, }, 
}

Avt.CloseDiveNearBoss =  
-- если босс есть и он жив то лететь к боссу. 
-- если босс умер и нет врагов, то деспавн
-- иначе делаем Dive
{
	{ behavior = "Guard", next_behavior = { 1, 2, 3, 4 },  -- если босс далеко догнать его
		conditions	= { -- что проверяем
			{  
				condition_type = AICondition.DistMore,
				param 	= 300, 
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},},
		param = 300, -- макс расстояние
	},
	{ behavior = "Dive", next_behavior = { 1, 2, 3, 4 }, param = 3, },  -- атаковать цель
 	{ behavior = "EscapeByPortal", next_behavior = { 3, 2 },  -- уйти с карты
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.NoTarget,
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},
			{
				condition_type = AICondition.EmptyAgroList,
			}, },
		param = 2, -- время на выход
	},
	--DefendShip -- лететь рядом с боссом
	{ behavior = "DefendShip", next_behavior = {  2, 4, 3 }, }, 
}

----------------------------------------------------
Avt.DistanceHitAndRunNearBoss = 
-- если босс есть и он жив то лететь к боссу. 
-- если босс умер и нет врагов, то деспавн
-- иначе делаем стрельбу, если много урона получено, то убегаем
{
	{ behavior = "Guard", next_behavior = { 1, 5, 4, 3, 2, 6 }, 
		conditions	= { -- что проверяем
			{  
				condition_type = AICondition.DistMore,
				param 	= 500, 
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},},
		param = 500, -- макс расстояние
	},
	
	--DefendShip -- лететь рядом с боссом
	{ behavior = "DefendShip", next_behavior = {  5, 4, 3, 2, 6 }, }, 
--3
	{ behavior = "FlyToDistanceShoot", next_behavior = { 7, 1, 5, 4, 3, 2, 6 },   -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 300,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 75, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 120,
	},
--4
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 7, 1, 5, 4, 3, 2, 6 },  
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistLess,
					param = 300, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistMore,
					param = 50,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	},
--5
	{ 	behavior = "Hide", 
		next_behavior = { 5, 4, 3, 2, 6 }, 
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.8,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
--[[ 				{
					condition_type = AICondition.Target,
				}, ]]
			},  
	},  
--6
 	{ behavior = "EscapeByPortal", next_behavior = { 5, 4, 3, 6, 2 }, 
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.NoTarget,
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},
			{
				condition_type = AICondition.EmptyAgroList,
			}, },
		param = 2, -- время на выход
	}, 
--7
	{ 	behavior = "FindTarget",  -- Смотрим, есть ли цели в агро листе
		next_behavior =  { 7, 5, 4, 3, 2, 6 }, 
	}, 
}


Avt.AttackAndRunNearBoss = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 4, 3, 2, 6, 5 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	-- атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 1, 3, 4, 2, 5, 6 }, 
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
			},
		--param = 12, -- время атаки (не работает)
	},
	{ 	behavior = "Hide", 
		next_behavior = { 3, 1, 2, 5 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.5,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.Target,
				},
			},  
	}, 
	{ behavior = "Guard", next_behavior = { 4, 1, 3, 2, 6, 5 }, 
		conditions	= { -- что проверяем
			{  
				condition_type = AICondition.DistMore,
				param 	= 500, 
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},},
		param = 500, -- макс расстояние
	},
	--DefendShip -- лететь рядом с боссом
	{ behavior = "DefendShip", next_behavior = { 1, 4, 3, 2, 6, 5 }, }, 
 	{ behavior = "EscapeByPortal", next_behavior = { 6, 1, 3, 2 }, 
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.NoTarget,
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},
			{
				condition_type = AICondition.EmptyAgroList,
			}, },
		param = 2, -- время на выход
	}, 
}

Avt.AttackTargetThenDieAndBlow =  -- атаковать заданную цель, если цель пропала или далеко - взорваться
{
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
	--[[  		conditions	= { -- что проверяем
					{  
						condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
						target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
					},
			},   ]]
	--	param = { configId = "behavior_AttackEntityId" },  -- цель предпочитаемая --!!!
	},
	{ behavior = "Attack", next_behavior = { 1, 2, 3, }, param = 4, },  -- атаковать цель
 	{ behavior = "DieAndBlow", next_behavior = { 1, 2, 3 },  -- если сюда попали, то самоубиваемся
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.NoTarget,
				target 	= { targetId = true },  -- цель живет как bot.targetId -- задается при создании-регистрации бота как постояная цель
			},
			{
				condition_type = AICondition.EmptyAgroList,
			}, },
		--param = 2,
	}, 
}

--для "прикрытия" без убегания
Avt.DistanceHit150 = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 2, 3, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--cond0itions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 200,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 100, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 150,
		},
		
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 4, 3, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 70,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 250, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	},
	{ 	behavior = "Drifting", 
		next_behavior = { 4, 3, 2, 1 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.35,
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					--target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	}, 
}

--для "прикрытия" без убегания
Avt.DistanceHit300 = 
{ 
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3 },  -- просто выбор цели
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 2, 3, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--cond0itions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 310,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 120, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 280,
		},
		
	-- если поранены то бежим, стрельба пока враг в области видимости, если _дистанционная_4 стрельба невозможна, то запускаем автомат сначала. если враг сместился - разворачиваемся
	{ behavior = "DistanceShoot", next_behavior = { 4, 3, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 110,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.DistLess,
					param = 311, -- пушка должна стрелять дальше
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	},
	{ 	behavior = "Drifting", 
		next_behavior = { 4, 3, 2, 1 },
		conditions	= { -- что проверяем
				conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.35,
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					--target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
	}, 
}

Avt.Ride =  -- гонка по пути + деспавн
{
	{ 	behavior = "FlyRoute",   -- если делать нече (нет целей, то летим по пути/ к цели)
		next_behavior = { 1, }, 
	}, 
}

Avt.DefendShip = 
{
	{ behavior = "DefendShip", next_behavior = { 1, } }, 
}
Avt.DefendPlayerShip = 
{
	{ behavior = "DefendPlayerShip", next_behavior = { 1, } }, 
}

Avt.Hide = 
{
	{ behavior = "Hide", next_behavior = { 1, } }, 
}



-- короткие бехевиоры для "наборных" автоматов
Avt.EscapeByPortal =  
{
 	{ behavior = "EscapeByPortal", 
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.EmptyAgroList,
			}, 
			{
				condition_type = AICondition.LifeTimeMore,
				param 	= 3, 
			},
		},
		param = 6, -- время на выход
	},
}
-- жестко быстрое отварп
Avt.ForceEscapeByPortal =  
{
 	{ behavior = "EscapeByPortal", next_behavior = { 1, } },
}

Avt.CaptureBeacon =
{
 	{ behavior = "CaptureBeacon", 
		--conditions	= { -- внутри старта проверим что bot.CaptureBeaconId существует и вражеский, тогда сидим в этом состоянии 5 сек.
		param = 25, --  расстояние на котором тремся от цели
	}
}
Avt.DefendStation =
{
 	{ behavior = "CaptureBeacon", 
		param = 60, --  расстояние на котором тремся от цели
	}
}
Avt.Idle =
{
 	{ behavior = "Idle", }
}
Avt.Guard = -- если босс далеко догнать его
{
	{ behavior = "Guard", 
		conditions	= { -- что проверяем
			{  
				condition_type = AICondition.DistMore,
				param 	= 300,  
				target 	= { configId = "behavior_guardEntityId" },  -- цель охраняемая
			},},
		param = 300, -- макс расстояние
	},
}

--DefendShip -- лететь рядом с боссом
Avt.DefendShip = { 
	{ behavior = "DefendShip", }, 
}

-- лететь по пути, либо случайным точкам
Avt.FlyRoute = { 
	{ 	behavior = "FlyRoute", }
}

Avt.HuntShip = {
	{ 	behavior = "HuntShip", }
}

-- стоп+ анимация
Avt.ScanArea = {
	{ 	behavior = "ScanArea", }
}

--[[
Непонятно откуда это взялось - копия же одноименная!!!
Avt.EscapeByPortal =  -- создать портал и улететь  в него
{
 	{ behavior = "EscapeByPortal", next_behavior = { 6, 1, 3, 2 }, 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.EmptyAgroList,
			}, },
		param = 2, -- время на выход
	}, 
}]]

Avt.Adv_AttackAndRun = 
{ 
	-- 1 стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3, 4 },  -- просто выбор цели { 1, 2, 3, 5 }
	},
	-- 2
	{ behavior = "FlyToDistanceShoot", next_behavior = { 3, 2, 1, 4 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 100,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 60, -- оптимальная дистанция
	},
	-- 3 атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 3, 5, 1, 2, 4 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
				{  
					condition_type = AICondition.DistLess,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.VisibleTarget,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
			--param = 5, -- время атаки
		},
		
	-- 4
	{ 	behavior = "Adv_EscapeByPortal", 
		next_behavior = { 4, 1, },
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.EmptyAgroList,
			}, 
		},
		param = 45, -- время на выход
	},
	-- 5
	{ 	behavior = "Strafe", 
		next_behavior = { 3, 5 },
		conditions	= { -- что проверяем
				--conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.2,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.35,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
		param = { ai.AiStrafeDirection.UP, ai.AiStrafeDirection.DOWN, ai.AiStrafeDirection.LEFT, ai.AiStrafeDirection.RIGHT },  --
	}, 
}

Avt.Adv_Attack = 
{ 
	-- 1 стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 1, 2, 3, },  -- просто выбор цели { 1, 2, 3, 5 }
	},
	-- 2
	{ behavior = "FlyToDistanceShoot", next_behavior = { 3, 2, 1, },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 100,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 60, -- оптимальная дистанция
	},
	-- 3 атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 3, 4, 1, 2, }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
				{  
					condition_type = AICondition.DistLess,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.VisibleTarget,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
			--param = 5, -- время атаки
	},
		
	-- 4
	{ 	behavior = "Strafe", 
		next_behavior = { 3, 4 },
		conditions	= { -- что проверяем
				--conditions_and = true,
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Random,
					param = 0.2,
					--target = { },  -- если таржет не указан, то берем корабль сам
				},				
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.35,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},  
		param = { ai.AiStrafeDirection.UP, ai.AiStrafeDirection.DOWN, ai.AiStrafeDirection.LEFT, ai.AiStrafeDirection.RIGHT },  --
	}, 
}

Avt.Adv_AttackAndPatrol = 
{ 
	{ 	behavior = "FlyRoute", 
		next_behavior = { 2, 1 },
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.EmptyAgroList,
			}, 
		},
	},
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 2, 3, 1 },  -- просто выбор цели { 1, 2, 3, 5 }
--[[  		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.NoTarget, -- нет цели или она мертва (bot.behavior_targetId)
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
		},   ]]
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 4, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				--conditions_or = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{  
					condition_type = AICondition.DistMore,
					param = 100,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 60, -- оптимальная дистанция
	},
	-- атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 4, 2, 1 }, 
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
				{  
					condition_type = AICondition.DistLess,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.VisibleTarget,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
			--param = 5, -- время атаки
		},
		
	--

}

Avt.PveStealth_AttackAndPatrol = 
{ 
	{ 	behavior = "FlyRoute", 
		next_behavior = { 2, 3, 1, 4 },
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.EmptyAgroList,
			}, 
		},
	},
	-- стреляем с расстояния рейндж оружия
	{ behavior = "FindTarget", next_behavior = { 2, 3, 1, 4 },  -- просто выбор цели { 1, 2, 3, 5 }
	},
	{ behavior = "FlyToDistanceShoot", next_behavior = { 2, 3, 4, 1 },  -- стараться лететь так, чтобы оказаться на дистанции выстрела сначало летим "на псфайдинге", но проверяем трейс лайн до цели. как только видим цель отлетаем по прямой от нее на расстояние выстрела. (но если отлететь не можем то летим вбок)
		conditions	= { -- что проверяем
				{  
					condition_type = AICondition.DistMore,
					param = 100,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
 				{
					condition_type = AICondition.TargetNotTrace, -- цель что то перекрыло
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, 
			},
			param = 60, -- оптимальная дистанция
	},
	-- атакуем цель по простому алгоритму
	{ behavior = "Attack", next_behavior = { 2, 4, 1, 3 },
		conditions	= { -- что проверяем
				conditions_and = true, -- вероятно будет несколько проверок.  дефолтно через "или" 
				{
					condition_type = AICondition.Target,
				},
				{  
					condition_type = AICondition.DistLess,
					param = 120,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{  
					condition_type = AICondition.VisibleTarget,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
			--param = 5, -- время атаки
		},
}