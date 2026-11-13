--12
TalentGroups =
{
	{ "TALENT_HULL_INTEGRITY", 				"TALENT_HULL_RESILIENCE",			"TALENT_HULL_RESIST", 				},
	{ "TALENT_COMPUTER_ANALYZER", 			"TALENT_LONG_RANGE",				"TALENT_COMPUTER_UPGRADES", 		},
	{ "TALENT_SHIELD_RENEW",				"TALENT_SHIELD_REINFORCE",			"TALENT_SHIELD_RESIST",				},
	{ "TALENT_ADVANCED_MISSILES_CONTROL", 	"TALENT_AGILITY_MISSILES",			"TALENT_LONG_MISSILES",				},
	{ "TALENT_ROTATION_SPEED", 				"TALENT_MANEUVER_SPEED", 			"TALENT_MAX_SPEED",					},
	{ "TALENT_ADVANCED_WEAPON_CONTROL", 	"TALENT_SURGICAL_STRIKE",			"TALENT_FAST_PROJECTILES",			},
	{ "TALENT_ENERGY_VOLUME", 				"TALENT_BOOST_ENERGY", 				"TALENT_ENERGY_RECUPERATION",		},
	{ "TALENT_SURVIVAL_COOLDOWN", 			"TALENT_SLOW_RESIST", 				"TALENT_ENERGY_RESIST",				},
	{ "TALENT_HULL_FORTITUDE",				"TALENT_BOOST_SPEED", 				"TALENT_SHIELD_HARDENER",			}, --  9
	{ "TALENT_TACTIC_COOLDOWN",				"TALENT_TACTIC_ENERGY", 			"TALENT_TACTIC_EFFICIENCY", 		},  -- 10
	{ "TALENT_WEAPON_PENETRATION", 			"TALENT_WEAPON_BURST", 				"TALENT_MISSILES_BURST",			},
	{ "TALENT_IDLE_TO_WEAPON",				"TALENT_IDLE_TO_ENERGY",			"TALENT_IDLE_TO_SHIELD",			},
	{ "TALENT_KILL_TO_CD_RESET",			"TALENT_KILL_TO_MAJOR_DAMAGE",		"TALENT_KILL_TO_MINOR_DAMAGE",		},
	{ "TALENT_EMERGENCY_CLEANSE",			"TALENT_EMERGENCY_STEALTH",			"TALENT_EMERGENCY_RESIST",			},
	{ "TALENT_RACE_DAMAGE",					"TALENT_RACE_HEALTH",				"TALENT_RACE_ROCKET_DAMAGE",		},
}


--
Talent = {}

-- Устойчивость корпуса всем видам повреждений увеличена на N единиц
-- param1 аддитивно влияет на все резисты корпуса (hull_resist_*)
Talent.TALENT_HULL_RESIST = 
{
	param1 = 20,
}


-- Корабли получают на N% меньше повреждений по корпусу от взрывных (blastwave) и от критических попаданий
-- дополнительный множитель (1.0 - param1) к полулчаемым повреждениям с флагами DMG_EXPLOSION 
-- дополнительный множитель (1.0 - param2) к полулчаемым повреждениям с флагами DMG_CRITICAL  (понижается ВЕСЬ урон, а не бонусная часть)
Talent.TALENT_HULL_RESILIENCE =
{
	param1 = 0.30,
	param2 = 0.30,
	param1_percent = true,
	param2_percent = true,
	--!!! надо 2 параметра
}


-- Прочность корпуса увеличена на N% 
-- param1 мультиплекативно меняет hull_health
Talent.TALENT_HULL_INTEGRITY =
{
	param1 = 0.25,
	param1_percent = true,
}
	

-- N% к дальности обзора, M% к дальности основного вооружения
-- param1 мультиплекативно влияет на vision_radius и vision_offset
-- param2 мультиплекативно влияет на optimal_range и max_range основного оружия
Talent.TALENT_LONG_RANGE = 
{
	param1 = 0.75,
	param1_percent = true,
	param2 = 0.2,
	param2_percent = true,
}


-- Скорость захвата цели увеличена на N%, +M% вероятности нанесения критического повреждения
-- param1 мультиплекативно влияет lock_time
-- param2 аддитивно влияет на crit_chance
Talent.TALENT_COMPUTER_ANALYZER =
{
	param1 = -0.75,
	param1_percent = true,
	param2 = 0.1,
	param2_percent = true,
}


-- Время действия модулей, лишающих ваш корабль управления, снижено на N%, M% точности основного вооружения
-- param1 мультиплекативно влияет на crowd_control_coef
-- param2 мультиплекативно влияет на dispersion и dispersion_max
Talent.TALENT_COMPUTER_UPGRADES =
{
	param1 = -0.3,
	param1_percent = true,
	param2 = -0.25, 
	param2_percent = true,
}


-- Модули выживания/восстановления перезаряжаются на N% быстрее
-- param1 мультиплекативно влияет на cooldown модулей группы ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK
Talent.TALENT_SURVIVAL_COOLDOWN =
{
	param1 = -0.20,
	param1_percent = true,
}


-- При активации модулей выживания/восстановления корабль не попадает под воздействия замедляющих (буст дизаблящих) эффектов в течении N секунд
-- При активации модулей группы ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK, на корабль вешается аура Talent_SlowResist
Talent.TALENT_SLOW_RESIST =
{
	param1 = 5,
}


-- При активации модулей выживания/восстановления корабль не попадает под эффекты дестабилизации энергии в течении N секунд
-- При активации модулей группы ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK, на корабль вешается аура Talent_EnergyResist
Talent.TALENT_ENERGY_RESIST =
{
}


-- Устойчивость щита всем видам повреждений увеличена на N единиц
-- param1 аддитивно влияет на все резисты щита (shield_resist_*)
Talent.TALENT_SHIELD_RESIST =
{
	param1 = 30,
}


-- Скорость регенерации щита увеличена на N%
-- param1 мультиплекативно влияет на shield_regen
Talent.TALENT_SHIELD_RENEW =
{
	param1 = 0.5,
	param1_percent = true,
}
		

-- Объем щита увеличен на N%
-- param1 мультиплекативно влияет на shield_max
Talent.TALENT_SHIELD_REINFORCE =
{
	param1 = 0.35,
	param1_percent = true,
}
		

-- +N% к дальности полета ракет
-- param1 мультиплекативно влияет на max_range ракет
-- param2 мультипликативно влияет на blast_minDistance и blast_maxDistance у порождённого взрыва (explosion_blast_wave), а также на aura_range у порождённой ауры (spell) ТОЛЬКО ДЛЯ РАКЕТ СО СКОРОСТЬЮ 0 (#53045)
Talent.TALENT_LONG_MISSILES = 
{
	param1 = 0.75,
	param1_percent = true,
	param2 = 0.2,
	param2_percent = true,
}


-- Ваше ракетное вооружение наносит на N% больше повреждений
-- param1 мультиплекативно влияет на повреждения ракет
Talent.TALENT_ADVANCED_MISSILES_CONTROL =
{
	param1 = 0.1,
	param1_percent = true,
}


-- +N% к скорости полета и поворота ракет
-- param1 мультиплекативно влияет на параметры speed и angular_velocity ракет
-- для дес рея модифицируется время подготовки как парам1 с "-"
-- param3  теперь аддитивно влияет на time_to_live у ракеты  ТОЛЬКО ДЛЯ РАКЕТ СО СКОРОСТЬЮ 0  (#53045)
Talent.TALENT_AGILITY_MISSILES =
{
	param1 = 0.20,
	param2 = 0.10,
	param1_percent = true,
	param2_percent = true,
	param3 = -1,
}
		

-- Все модули, кроме выживания/восстановления, перезаряжаются на N% быстрее
-- param1 мультиплекативно влияет на cooldown модулей группы отличной от ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK
Talent.TALENT_TACTIC_COOLDOWN = 
{
	param1 = -0.11111111111,
	param1_percent = true,
}
		

-- Все модули, кроме выживания/восстановления, потребляют на N% меньше энергии
-- param1 мультиплекативно влияет на energy_cost и energy_cost_per_second модулей группы отличной от ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK
Talent.TALENT_TACTIC_ENERGY =
{
	param1 = -0.4,
	param1_percent = true,
}
		

-- Все модули, кроме выживания/восстановления, работают на N% эффективнее
-- param1 мультиплекативно влияет на aura_param и influence_param Spell'ов порожденных модулями группы отличной от ai.ItemGroup.SELF_RESTORE и ai.ItemGroup.TANK
-- Если aura_param и influence_param не прописаны - то увеличивает duration
-- Особые случаи искать в мантисе #0034709
Talent.TALENT_TACTIC_EFFICIENCY =
{
	param1 = 0.12,
	param1_percent = true,
}
		

-- +N% к скорости поворота корабля
-- param1 мультиплекативно влияет на rot_xmaxspeed, rot_ymaxspeed, rot_zmaxspeed 
Talent.TALENT_ROTATION_SPEED =
{
	param1 = 0.3,
	param1_percent = true,
}
		

-- +N% к скорости боковых перемещений
-- param1 мультиплекативно влияет на max_xspeed, max_yspeed
Talent.TALENT_MANEUVER_SPEED = 
{
	param1 = 0.75,
	param1_percent = true,
}
		

-- +N% к максимальной скорости
-- param1 мультиплекативно влияет на max_speed
Talent.TALENT_MAX_SPEED = 
{
	param1 = 0.1,--0.03,
	param1_percent = true,
}


-- Скорость полета частиц и пуль увеличена на N%, Лазеры имеют объем нагрева на M% больше
-- param1 мультиплекативно увеличивает projectile_speed основного оружия
-- param2 мультиплекативно увеличивает heat_max лазерного оружия
Talent.TALENT_FAST_PROJECTILES =
{
	param1 = 0.3,
	param1_percent = true,
	param2 = 0.1,
	param2_percent = true,
}
		

-- Ваше основное оружие наносит на +N% больше повреждений
-- param1 мультиплекативно увеличивает параметры damage, damage_kinetic, damage_emp, damage_thermal основного оружия
Talent.TALENT_ADVANCED_WEAPON_CONTROL =
{
	param1 = 0.07,
	param1_percent = true,
}
		

-- Критические попадания из вашего оружия наносят +N% повреждений
-- param1 аддитивно влияет на параметр crit_damage
Talent.TALENT_SURGICAL_STRIKE =
{
	param1 = 0.30,
	param1_percent = true,
}


-- +N% к емкости энергии
-- param2 мультиплекативно меняет energy_max
Talent.TALENT_ENERGY_VOLUME =
{
	param1 = 0.4,
	param1_percent = true,
}
		

-- Ускорители потребляют на N% меньше энергии
-- param1 мультиплекативно меняет boost_energy_cost и boost_energy_cost_per_second 
Talent.TALENT_BOOST_ENERGY = 
{
	param1 = -0.2,
	param1_percent = true,
}
		

-- N% от повреждений нанесенных вам в щит, запасаются в виде энергии 
-- param1 аддитивно меняет параметр recuperation_power 
Talent.TALENT_ENERGY_RECUPERATION = 
{
	param1 = 0.15,
	param1_percent = true,
}
		

-- Устойчивость корпуса и щита всем видам повреждения увеличивается на 10 единиц за каждого противника, который держит вас на прицеле.
-- динамически добавляет param1 ко всем резистам за каждого залочившего нас врага
Talent.TALENT_HULL_FORTITUDE =
{
	param1 = 12,
}

		

-- +N единиц сопротивления щита. щиты принимают на себя удары от столкновений с препятствиями
-- param1 аддитивно влияет на все резисты щита (shield_resist_*)
-- Для борьбы с фокусом решили сделать масштабируемым #63051
Talent.TALENT_SHIELD_HARDENER =
{
	param1 = 7,
}
		

-- Максимальная скорость с включенным ускорителем увеличена на N%
-- param1 мультиплекативно влияет на boost_maxspeed_coef 
Talent.TALENT_BOOST_SPEED =
{
	param1 = 0.07,
	param1_percent = true,
}
		

-- Защита вражеского корабля легче пробивается вашим основным вооружением (устойчивость корпуса и щита цели снижена на N единиц)
-- param1 аддитивно влияет на resist_penetration основного оружия
Talent.TALENT_WEAPON_PENETRATION =
{
	param1 = 10,--8,
}


-- Темп стрельбы повышен на N%
-- param1 мультиплекативно меняет fire_rate основного оружия
Talent.TALENT_WEAPON_BURST =
{
	param1 = 0.08,
	param1_percent = true,
}
		

-- Скорость перезарядки ракет увеличена на N%
-- param1 мультиплекативно меняет rocket_cooldown_coef
Talent.TALENT_MISSILES_BURST =
{
	param1 = -0.25,
	param1_percent = true,
}
		

-- При скорости корабля ниже 50% от максимальной оружие наносит на 7% (раньше 10%) больше повреждений
Talent.TALENT_IDLE_TO_WEAPON =
{
	param1 = 0.07,
	param1_percent = true,
}
		

-- При скорости корабля ниже 50% от максимальной щиты восстанавливаются на 40% (раньше 25%) быстрее
Talent.TALENT_IDLE_TO_SHIELD =
{
	param1 = 0.6,
	param1_percent = true,
}
		

-- При скорости корабля ниже 50% от максимальной энергия восстанавливается на 50% (раньше 40%) быстрее
Talent.TALENT_IDLE_TO_ENERGY =
{
	param1 = 0.5,
	param1_percent = true,
}


-- При убийстве или ассисте уроном корабля противника, уменьшает время отката всех модулей (кроме установленного в слот SMS_SECONDARY_WEAPON) на N% от максимального времени отката - Rapidus III
Talent.TALENT_KILL_TO_CD_RESET = 
{
	param1 = 0.07,
	param1_percent = true
}


-- При убийстве или ассисте уроном корабля противника, на корабль вешается аура Talent_KillToMajorDamage (временно увеличивает урон) - Муравей II
Talent.TALENT_KILL_TO_MAJOR_DAMAGE = 
{
}


-- При убийстве или ассисте уроном корабля противника, на корабль вешается аура Talent_KillToMinorDamage_Mk1 (постоянно увеличивает урон, стакается) - WPN-F70
-- если такая аура уже есть то она убирается и вешается аура старшего Mk вплоть до Talent_KillToMinorDamage_Mk10
Talent.TALENT_KILL_TO_MINOR_DAMAGE = 
{
}


-- Единожды за вылет при "Падение щита" (при первом уроне по корпусу в отсутствии щитов), на корабль вешается аура Talent_EmergencyCleanse (имун к контролю) 
Talent.TALENT_EMERGENCY_CLEANSE = 
{
}


-- Единожды за вылет при "Падение щита" (при первом уроне по корпусу в отсутствии щитов), на корабль вешается аура Talent_EmergencyStealth (невидимость)
-- #31931 не срабаотывает если на корабль наложена аура SPY_DRONE или SPY_DRONE_REDUCE_HEAL
Talent.TALENT_EMERGENCY_STEALTH = 
{
}


-- Единожды за вылет при "Падение щита" (при первом уроне по корпусу в отсутствии щитов), на корабль вешается аура Talent_EmergencyResist (увеличение резистов корпуcа) 
Talent.TALENT_EMERGENCY_RESIST = 
{
	param1 = 100,  -- цифры только для тултипа!
	param2 = 2, -- цифры только для тултипа!
}


-- Увеличивает на param1 % синергию зарабатываемую кораблем, увеличивает на param1 % серебро зарабатываемое кораблем (всеми кораблями. без учета ранга корабля)
-- param2 мультиплекативно меняет повреждения основного оружия
Talent.TALENT_RACE_DAMAGE = 
{
	param1 = 0.0,
	param1_percent = true,
	param2 = 0.03,
	param2_percent = true,
}


-- Увеличивает на param1 % серебро зарабатываемое кораблем (всеми кораблями. без учета ранга корабля)
-- param2 мультиплекативно меняет hull_health и shield_max 
Talent.TALENT_RACE_HEALTH = 
{
	param1 = 0.0,
	param1_percent = true,
	param2 = 0.05,
	param2_percent = true,
}


-- Увеличивает на param1 % синергию зарабатываемую кораблем (всеми кораблями. без учета ранга корабля)
-- param2 мультиплекативно влияет на повреждения ракет
Talent.TALENT_RACE_ROCKET_DAMAGE = 
{
	param1 = 0.0,
	param1_percent = true,
	param2 = 0.07,
	param2_percent = true,
}


-- стоимость покупки дополнительных наборов имплантов
TalentSetCosts = 
{
	-- 1 есть по умолчанию
	{},
	
	-- 2
	{
		rank = 15,
		race = ai.Race.EMPIRE,
		gold_credits = 2000
	},
	
	-- 3
	{
		rank = 15,
		race = ai.Race.FEDERATION,
		gold_credits = 2000
	},
	
	-- 4
	{
		rank = 15,
		race = ai.Race.JERICHO,
		gold_credits = 2000
	}
}
