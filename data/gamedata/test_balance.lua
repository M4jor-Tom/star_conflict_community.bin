--#####################################################################################--
--#################### БАЛАНСОВЫЕ ПРАВКИ ДЛЯ ПРОЕКТА STAR CONFLICT ####################--
--#####################################################################################--

-- #0111139: Вынесение балансных правок в отдельный файл

-- Для включения прописать в data/gamedata/developer.lua
-- sys.execscript( 'gamedata/test_balance.lua' )

--#################### ВООРУЖЕНИЕ И МОДУЛИ ####################--

--Дезинтегратор (не касается синергетического дезинтегратора)
--Скорость полёта снаряда увеличена на 20%
--[[
Def.Module_Disintegrator_T1_Base.projectile_speed=980
Def.Module_Disintegrator_T1_Faction1.projectile_speed=980
Def.Module_Disintegrator_T1_Faction2.projectile_speed=980
Def.Module_Disintegrator_T2_Base.projectile_speed=1055
Def.Module_Disintegrator_T2_Faction1.projectile_speed=1055
Def.Module_Disintegrator_T2_Faction2.projectile_speed=1055
Def.Module_Disintegrator_T3_Base.projectile_speed=1160
Def.Module_Disintegrator_T3_Faction1.projectile_speed=1160
Def.Module_Disintegrator_T3_Faction2.projectile_speed=1160
Def.Module_Disintegrator_T4_Base.projectile_speed=1190
Def.Module_Disintegrator_T4_Faction1.projectile_speed=1190
Def.Module_Disintegrator_T4_Faction2.projectile_speed=1190
Def.Module_Disintegrator_T5_Base.projectile_speed=1240
Def.Module_Disintegrator_T5_Faction1.projectile_speed=1240
Def.Module_Disintegrator_T5_Faction2.projectile_speed=1240
]]--

--Управляемая торпеда (не касается кластерной торпеды)
--Скорость полёта торпеды увеличена на 20%
--[[
Def.GuidedMissile.speed = 65*1.2 --63
Def.GuidedMissile_Faction1.speed = 60*1.2 -- 70
]]
--Маневренность торпеды увеличена на 10%
--[[
Def.GuidedMissile.angular_velocity = 15*1.1
Def.GuidedMissile_T2.angular_velocity = 16.5*1.1
Def.GuidedMissile_T3.angular_velocity = 18*1.1
Def.GuidedMissile_T4.angular_velocity = 19.5*1.1
Def.GuidedMissile_T5.angular_velocity = 21*1.1
Def.GuidedMissile_Faction1.angular_velocity	= 25*1.1
]]
--Время перезарядки модуля снижено на 20%
--[[
Def.Module_GuidedMissile_T1_Base.cooldown=12.8
Def.Module_GuidedMissile_T1_Faction1.cooldown=12.8
Def.Module_GuidedMissile_T1_Faction2.cooldown=12.8
Def.Module_GuidedMissile_T2_Base.cooldown=12.8
Def.Module_GuidedMissile_T2_Faction1.cooldown=12.8
Def.Module_GuidedMissile_T2_Faction2.cooldown=12.8
Def.Module_GuidedMissile_T3_Base.cooldown=12.8
Def.Module_GuidedMissile_T3_Faction1.cooldown=12.8
Def.Module_GuidedMissile_T3_Faction2.cooldown=12.8
Def.Module_GuidedMissile_T4_Base.cooldown=12.8
Def.Module_GuidedMissile_T4_Faction1.cooldown=12.8
Def.Module_GuidedMissile_T4_Faction2.cooldown=12.8
Def.Module_GuidedMissile_T5_Base.cooldown=12.8
Def.Module_GuidedMissile_T5_Faction1.cooldown=12.8
Def.Module_GuidedMissile_T5_Faction2.cooldown=12.8
]]

--Форсирование вооружения и тахионный рывок
--Время перезарядки модулей снижено на 31%
--[[
Def.Module_SniperOverload_T1_Mk1.cooldown=24.15
Def.Module_SniperOverload_T1_Mk2.cooldown=24.15
Def.Module_SniperOverload_T1_Prem.cooldown=24.15
Def.Module_SniperOverload_T1_Rare.cooldown=24.15
Def.Module_SniperOverload_T1_Mk3.cooldown=24.15
Def.Module_SniperOverload_T1_Epic.cooldown=24.15
Def.Module_SniperOverload_T1_Rel.cooldown=24.15
Def.Module_SniperOverload_T2_Mk1.cooldown=23.115
Def.Module_SniperOverload_T2_Mk2.cooldown=23.115
Def.Module_SniperOverload_T2_Prem.cooldown=23.115
Def.Module_SniperOverload_T2_Rare.cooldown=23.115
Def.Module_SniperOverload_T2_Mk3.cooldown=23.115
Def.Module_SniperOverload_T2_Epic.cooldown=23.115
Def.Module_SniperOverload_T2_Rel.cooldown=23.115
Def.Module_SniperOverload_T3_Mk1.cooldown=22.08
Def.Module_SniperOverload_T3_Mk2.cooldown=22.08
Def.Module_SniperOverload_T3_Prem.cooldown=22.08
Def.Module_SniperOverload_T3_Rare.cooldown=22.08
Def.Module_SniperOverload_T3_Mk3.cooldown=22.08
Def.Module_SniperOverload_T3_Epic.cooldown=22.08
Def.Module_SniperOverload_T3_Rel.cooldown=22.08
Def.Module_SniperOverload_T4_Mk1.cooldown=21.045
Def.Module_SniperOverload_T4_Mk2.cooldown=21.045
Def.Module_SniperOverload_T4_Prem.cooldown=21.045
Def.Module_SniperOverload_T4_Rare.cooldown=21.045
Def.Module_SniperOverload_T4_Mk3.cooldown=21.045
Def.Module_SniperOverload_T4_Epic.cooldown=21.045
Def.Module_SniperOverload_T4_Rel.cooldown=21.045
Def.Module_SniperOverload_T5_Mk1.cooldown=20.01
Def.Module_SniperOverload_T5_Mk2.cooldown=20.01
Def.Module_SniperOverload_T5_Prem.cooldown=20.01
Def.Module_SniperOverload_T5_Rare.cooldown=20.01
Def.Module_SniperOverload_T5_Mk3.cooldown=20.01
Def.Module_SniperOverload_T5_Epic.cooldown=20.01
Def.Module_SniperOverload_T5_Rel.cooldown=20.01
Def.Module_SniperFastShot_T1_Mk1.cooldown=24.15
Def.Module_SniperFastShot_T1_Mk2.cooldown=24.15
Def.Module_SniperFastShot_T1_Prem.cooldown=24.15
Def.Module_SniperFastShot_T1_Rare.cooldown=24.15
Def.Module_SniperFastShot_T1_Mk3.cooldown=24.15
Def.Module_SniperFastShot_T1_Epic.cooldown=24.15
Def.Module_SniperFastShot_T1_Rel.cooldown=24.15
Def.Module_SniperFastShot_T2_Mk1.cooldown=23.115
Def.Module_SniperFastShot_T2_Mk2.cooldown=23.115
Def.Module_SniperFastShot_T2_Prem.cooldown=23.115
Def.Module_SniperFastShot_T2_Rare.cooldown=23.115
Def.Module_SniperFastShot_T2_Mk3.cooldown=23.115
Def.Module_SniperFastShot_T2_Epic.cooldown=23.115
Def.Module_SniperFastShot_T2_Rel.cooldown=23.115
Def.Module_SniperFastShot_T3_Mk1.cooldown=22.08
Def.Module_SniperFastShot_T3_Mk2.cooldown=22.08
Def.Module_SniperFastShot_T3_Prem.cooldown=22.08
Def.Module_SniperFastShot_T3_Rare.cooldown=22.08
Def.Module_SniperFastShot_T3_Mk3.cooldown=22.08
Def.Module_SniperFastShot_T3_Epic.cooldown=22.08
Def.Module_SniperFastShot_T3_Rel.cooldown=22.08
Def.Module_SniperFastShot_T4_Mk1.cooldown=21.045
Def.Module_SniperFastShot_T4_Mk2.cooldown=21.045
Def.Module_SniperFastShot_T4_Prem.cooldown=21.045
Def.Module_SniperFastShot_T4_Rare.cooldown=21.045
Def.Module_SniperFastShot_T4_Mk3.cooldown=21.045
Def.Module_SniperFastShot_T4_Epic.cooldown=21.045
Def.Module_SniperFastShot_T4_Rel.cooldown=21.045
Def.Module_SniperFastShot_T5_Mk1.cooldown=20.01
Def.Module_SniperFastShot_T5_Mk2.cooldown=20.01
Def.Module_SniperFastShot_T5_Prem.cooldown=20.01
Def.Module_SniperFastShot_T5_Rare.cooldown=20.01
Def.Module_SniperFastShot_T5_Mk3.cooldown=20.01
Def.Module_SniperFastShot_T5_Epic.cooldown=20.01
Def.Module_SniperFastShot_T5_Rel.cooldown=20.01
]]--

--Переброс энергии
--Ускорение корабля во время работы модуля дополнительно увеличено на 50%
--[[
Spell.EngineAmplifier_T3_Mk1.additional_auras[1].aura_param=1.5
Spell.EngineAmplifier_T3_Rare.additional_auras[1].aura_param=1.75
Spell.EngineAmplifier_T3_Mk3.additional_auras[1].aura_param=2.0
Spell.EngineAmplifier_T3_Epic.additional_auras[1].aura_param=2.1
Spell.EngineAmplifier_T3_Rel.additional_auras[1].aura_param=2.2
Spell.EngineAmplifier_T5_Mk1.additional_auras[1].aura_param=1.5
Spell.EngineAmplifier_T5_Rare.additional_auras[1].aura_param=1.75
Spell.EngineAmplifier_T5_Mk3.additional_auras[1].aura_param=2.0
Spell.EngineAmplifier_T5_Epic.additional_auras[1].aura_param=2.1
Spell.EngineAmplifier_T5_Rel.additional_auras[1].aura_param=2.2
]]

--Орудие с компенсацией отдачи
--Скорость откидывания стрелка снижена на 35%
--[[
Spell.JerichoTrumpets_ReturnMove1.aura_param=-26
Spell.JerichoTrumpets_ReturnMove1.aura_param_add=16.25
Spell.JerichoTrumpets_ReturnMove2.aura_param=16.25
]]

--Радиопоглощающее поле
--Время действия модуля увеличено на 20%
--[[
Spell.Camouflage_T1_Mk1.duration=43.75
Spell.Camouflage_T1_Mk2.duration=46.25
Spell.Camouflage_T1_Prem.duration=48.75
Spell.Camouflage_T1_Rare.duration=46.25
Spell.Camouflage_T1_Mk3.duration=48.75
Spell.Camouflage_T1_Epic.duration=50
Spell.Camouflage_T1_Rel.duration=52.5
Spell.Camouflage_T2_Mk1.duration=43.75
Spell.Camouflage_T2_Mk2.duration=46.25
Spell.Camouflage_T2_Prem.duration=48.75
Spell.Camouflage_T2_Rare.duration=46.25
Spell.Camouflage_T2_Mk3.duration=48.75
Spell.Camouflage_T2_Epic.duration=50
Spell.Camouflage_T2_Rel.duration=52.5
Spell.Camouflage_T3_Mk1.duration=43.75
Spell.Camouflage_T3_Mk2.duration=46.25
Spell.Camouflage_T3_Prem.duration=48.75
Spell.Camouflage_T3_Rare.duration=46.25
Spell.Camouflage_T3_Mk3.duration=48.75
Spell.Camouflage_T3_Epic.duration=50
Spell.Camouflage_T3_Rel.duration=52.5
Spell.Camouflage_T4_Mk1.duration=43.75
Spell.Camouflage_T4_Mk2.duration=46.25
Spell.Camouflage_T4_Prem.duration=48.75
Spell.Camouflage_T4_Rare.duration=46.25
Spell.Camouflage_T4_Mk3.duration=48.75
Spell.Camouflage_T4_Epic.duration=50
Spell.Camouflage_T4_Rel.duration=52.5
Spell.Camouflage_T5_Mk1.duration=43.75
Spell.Camouflage_T5_Mk2.duration=46.25
Spell.Camouflage_T5_Prem.duration=48.75
Spell.Camouflage_T5_Rare.duration=46.25
Spell.Camouflage_T5_Mk3.duration=48.75
Spell.Camouflage_T5_Epic.duration=50
Spell.Camouflage_T5_Rel.duration=52.5
]]

--Снайперский дрон “Напарник”
--Дальность работы модуля увеличена на 66.6%
--[[
Def.Module_SniperDefender.optimal_range = 125*1.666
Def.Module_SniperDefender.max_range = 150*1.666
]]
--Прочность дрона увеличена до 6 тыс.
--[[
Def.Module_SniperDefender_T2_Mk1.activate_entity_health=4469
Def.Module_SniperDefender_T2_Rare.activate_entity_health=4713
Def.Module_SniperDefender_T2_Mk3.activate_entity_health=4956
Def.Module_SniperDefender_T2_Epic.activate_entity_health=5151
Def.Module_SniperDefender_T2_Rel.activate_entity_health=5322
Def.Module_SniperDefender_T5_Mk1.activate_entity_health=5322
Def.Module_SniperDefender_T5_Rare.activate_entity_health=5566
Def.Module_SniperDefender_T5_Mk3.activate_entity_health=5809
Def.Module_SniperDefender_T5_Epic.activate_entity_health=6004
Def.Module_SniperDefender_T5_Rel.activate_entity_health=6175
]]

--Плазменный разрушитель
--Скорость полёта снаряда увеличена на 30%
--[[
Def.Weapon_PlasmaGuard_T2_Mk1.projectile_speed=325
Def.Weapon_PlasmaGuard_T2_Rare.projectile_speed=325
Def.Weapon_PlasmaGuard_T2_Mk3.projectile_speed=325
Def.Weapon_PlasmaGuard_T2_Epic.projectile_speed=325
Def.Weapon_PlasmaGuard_T2_Rel.projectile_speed=325
Def.Weapon_PlasmaGuard_T5_Mk1.projectile_speed=357.5
Def.Weapon_PlasmaGuard_T5_Rare.projectile_speed=357.5
Def.Weapon_PlasmaGuard_T5_Mk3.projectile_speed=357.5
Def.Weapon_PlasmaGuard_T5_Epic.projectile_speed=357.5
Def.Weapon_PlasmaGuard_T5_Rel.projectile_speed=357.5
]]

--Система ПРО
--Частота уничтожения ракет увеличена на 30%
--[[
Def.Module_MissileDefenceType1_T1_Mk1.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Mk2.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Prem.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Rare.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Mk3.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Epic.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T1_Rel.beam_cooldown=0.48
Def.Module_MissileDefenceType1_T2_Mk1.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Mk2.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Prem.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Rare.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Mk3.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Epic.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T2_Rel.beam_cooldown=0.44
Def.Module_MissileDefenceType1_T3_Mk1.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Mk2.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Prem.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Rare.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Mk3.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Epic.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T3_Rel.beam_cooldown=0.4
Def.Module_MissileDefenceType1_T4_Mk1.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Mk2.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Prem.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Rare.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Mk3.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Epic.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T4_Rel.beam_cooldown=0.36
Def.Module_MissileDefenceType1_T5_Mk1.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Mk2.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Prem.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Rare.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Mk3.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Epic.beam_cooldown=0.32
Def.Module_MissileDefenceType1_T5_Rel.beam_cooldown=0.32
]]

--Установка Dag'tnith
--Время работы дебаффа снижено на 50%
--Spell.PlasmaBlade.duration = 2.5

--Дестабилизатор энергосистем Object NY'18
--Время работы снижено на 50%.
--[[
Spell.EnergyNullifier_T2_Mk1.duration=5
Spell.EnergyNullifier_T2_Rare.duration=5.9
Spell.EnergyNullifier_T2_Mk3.duration=6.6
Spell.EnergyNullifier_T2_Epic.duration=7.3
Spell.EnergyNullifier_T2_Rel.duration=7.85
Spell.EnergyNullifier_T3_Mk1.duration=5.5
Spell.EnergyNullifier_T3_Rare.duration=6.4
Spell.EnergyNullifier_T3_Mk3.duration=7.1
Spell.EnergyNullifier_T3_Epic.duration=7.8
Spell.EnergyNullifier_T3_Rel.duration=8.35
Spell.EnergyNullifier_T4_Mk1.duration=6
Spell.EnergyNullifier_T4_Rare.duration=6.9
Spell.EnergyNullifier_T4_Mk3.duration=7.6
Spell.EnergyNullifier_T4_Epic.duration=8.3
Spell.EnergyNullifier_T4_Rel.duration=8.85
Spell.EnergyNullifier_T5_Mk1.duration=6.5
Spell.EnergyNullifier_T5_Rare.duration=7.4
Spell.EnergyNullifier_T5_Mk3.duration=8.1
Spell.EnergyNullifier_T5_Epic.duration=8.8
Spell.EnergyNullifier_T5_Rel.duration=9.35
]]
--Время перезарядки снижено на 20%.
--[[
Def.Module_EnergyNullifier_T2_Mk1.cooldown=38
Def.Module_EnergyNullifier_T2_Rare.cooldown=37
Def.Module_EnergyNullifier_T2_Mk3.cooldown=36
Def.Module_EnergyNullifier_T2_Epic.cooldown=35
Def.Module_EnergyNullifier_T2_Rel.cooldown=34
Def.Module_EnergyNullifier_T3_Mk1.cooldown=35
Def.Module_EnergyNullifier_T3_Rare.cooldown=34
Def.Module_EnergyNullifier_T3_Mk3.cooldown=33
Def.Module_EnergyNullifier_T3_Epic.cooldown=32
Def.Module_EnergyNullifier_T3_Rel.cooldown=31
Def.Module_EnergyNullifier_T4_Mk1.cooldown=32
Def.Module_EnergyNullifier_T4_Rare.cooldown=31
Def.Module_EnergyNullifier_T4_Mk3.cooldown=30
Def.Module_EnergyNullifier_T4_Epic.cooldown=29
Def.Module_EnergyNullifier_T4_Rel.cooldown=28
Def.Module_EnergyNullifier_T5_Mk1.cooldown=29
Def.Module_EnergyNullifier_T5_Rare.cooldown=28
Def.Module_EnergyNullifier_T5_Mk3.cooldown=27
Def.Module_EnergyNullifier_T5_Epic.cooldown=26
Def.Module_EnergyNullifier_T5_Rel.cooldown=25
]]
--Энергопотребление увеличено на 100%
--[[
Def.Module_EnergyNullifier_T2_Mk1.energy_cost=300
Def.Module_EnergyNullifier_T2_Rare.energy_cost=300
Def.Module_EnergyNullifier_T2_Mk3.energy_cost=300
Def.Module_EnergyNullifier_T2_Epic.energy_cost=300
Def.Module_EnergyNullifier_T2_Rel.energy_cost=300
Def.Module_EnergyNullifier_T3_Mk1.energy_cost=340
Def.Module_EnergyNullifier_T3_Rare.energy_cost=340
Def.Module_EnergyNullifier_T3_Mk3.energy_cost=340
Def.Module_EnergyNullifier_T3_Epic.energy_cost=340
Def.Module_EnergyNullifier_T3_Rel.energy_cost=340
Def.Module_EnergyNullifier_T4_Mk1.energy_cost=385
Def.Module_EnergyNullifier_T4_Rare.energy_cost=385
Def.Module_EnergyNullifier_T4_Mk3.energy_cost=385
Def.Module_EnergyNullifier_T4_Epic.energy_cost=385
Def.Module_EnergyNullifier_T4_Rel.energy_cost=385
Def.Module_EnergyNullifier_T5_Mk1.energy_cost=435
Def.Module_EnergyNullifier_T5_Rare.energy_cost=435
Def.Module_EnergyNullifier_T5_Mk3.energy_cost=435
Def.Module_EnergyNullifier_T5_Epic.energy_cost=435
Def.Module_EnergyNullifier_T5_Rel.energy_cost=435
]]

--Автономная зарядная станция
--Сила модуля увеличена на 45%
--[[
Spell.ShieldRay_l_T1_Mk1.aura_param=250
Spell.ShieldRay_l_T1_Mk2.aura_param=285
Spell.ShieldRay_l_T1_Prem.aura_param=305
Spell.ShieldRay_l_T1_Rare.aura_param=285
Spell.ShieldRay_l_T1_Mk3.aura_param=305
Spell.ShieldRay_l_T1_Epic.aura_param=315
Spell.ShieldRay_l_T1_Rel.aura_param=330
Spell.ShieldRay_l_T2_Mk1.aura_param=310
Spell.ShieldRay_l_T2_Mk2.aura_param=330
Spell.ShieldRay_l_T2_Prem.aura_param=345
Spell.ShieldRay_l_T2_Rare.aura_param=330
Spell.ShieldRay_l_T2_Mk3.aura_param=345
Spell.ShieldRay_l_T2_Epic.aura_param=360
Spell.ShieldRay_l_T2_Rel.aura_param=370
Spell.ShieldRay_l_T3_Mk1.aura_param=345
Spell.ShieldRay_l_T3_Mk2.aura_param=360
Spell.ShieldRay_l_T3_Prem.aura_param=380
Spell.ShieldRay_l_T3_Rare.aura_param=360
Spell.ShieldRay_l_T3_Mk3.aura_param=380
Spell.ShieldRay_l_T3_Epic.aura_param=390
Spell.ShieldRay_l_T3_Rel.aura_param=405
Spell.ShieldRay_l_T4_Mk1.aura_param=370
Spell.ShieldRay_l_T4_Mk2.aura_param=385
Spell.ShieldRay_l_T4_Prem.aura_param=405
Spell.ShieldRay_l_T4_Rare.aura_param=385
Spell.ShieldRay_l_T4_Mk3.aura_param=405
Spell.ShieldRay_l_T4_Epic.aura_param=420
Spell.ShieldRay_l_T4_Rel.aura_param=430
Spell.ShieldRay_l_T5_Mk1.aura_param=385
Spell.ShieldRay_l_T5_Mk2.aura_param=405
Spell.ShieldRay_l_T5_Prem.aura_param=420
Spell.ShieldRay_l_T5_Rare.aura_param=405
Spell.ShieldRay_l_T5_Mk3.aura_param=420
Spell.ShieldRay_l_T5_Epic.aura_param=435
Spell.ShieldRay_l_T5_Rel.aura_param=445
Spell.ShieldRay_l_T3_Set.aura_param=522
]]

--Автономная ремонтная станция
--Сила модуля увеличена на 45%
--[[
Spell.RepairRay_l_T1_Mk1.aura_param=250
Spell.RepairRay_l_T1_Mk2.aura_param=285
Spell.RepairRay_l_T1_Prem.aura_param=305
Spell.RepairRay_l_T1_Rare.aura_param=285
Spell.RepairRay_l_T1_Mk3.aura_param=305
Spell.RepairRay_l_T1_Epic.aura_param=315
Spell.RepairRay_l_T1_Rel.aura_param=330
Spell.RepairRay_l_T2_Mk1.aura_param=310
Spell.RepairRay_l_T2_Mk2.aura_param=330
Spell.RepairRay_l_T2_Prem.aura_param=345
Spell.RepairRay_l_T2_Rare.aura_param=330
Spell.RepairRay_l_T2_Mk3.aura_param=345
Spell.RepairRay_l_T2_Epic.aura_param=360
Spell.RepairRay_l_T2_Rel.aura_param=370
Spell.RepairRay_l_T3_Mk1.aura_param=345
Spell.RepairRay_l_T3_Mk2.aura_param=360
Spell.RepairRay_l_T3_Prem.aura_param=380
Spell.RepairRay_l_T3_Rare.aura_param=360
Spell.RepairRay_l_T3_Mk3.aura_param=380
Spell.RepairRay_l_T3_Epic.aura_param=390
Spell.RepairRay_l_T3_Rel.aura_param=405
Spell.RepairRay_l_T4_Mk1.aura_param=370
Spell.RepairRay_l_T4_Mk2.aura_param=385
Spell.RepairRay_l_T4_Prem.aura_param=405
Spell.RepairRay_l_T4_Rare.aura_param=385
Spell.RepairRay_l_T4_Mk3.aura_param=405
Spell.RepairRay_l_T4_Epic.aura_param=420
Spell.RepairRay_l_T4_Rel.aura_param=430
Spell.RepairRay_l_T5_Mk1.aura_param=385
Spell.RepairRay_l_T5_Mk2.aura_param=405
Spell.RepairRay_l_T5_Prem.aura_param=420
Spell.RepairRay_l_T5_Rare.aura_param=405
Spell.RepairRay_l_T5_Mk3.aura_param=420
Spell.RepairRay_l_T5_Epic.aura_param=435
Spell.RepairRay_l_T5_Rel.aura_param=445
]]--

--Барьер “Близнецы”
--Время работы увеличено на 66.6% (новое значение - 5с)
--[[
Spell.DivineSave.duration = 5
Spell.DivineSave_Self.duration = 5
]]
--Модуль возможно накладывать за препятствием
--[[
Spell.DivineSave.target =
{
	target			= ai.SpellTargetGeneral.LOCKED_TARGET,
	class			= ai.SpellTargetClass.SHIP,
	relationship	= ai.SpellTargetRelationship.ALLY,
	vitality		= ai.SpellTargetVitality.ALIVE,
}
]]

--Нанопожиратели
--Урон модуля увеличен на 300%
--[[
Spell.PrimaryNanoRobots1_T4_Mk1.aura_param=402
Spell.PrimaryNanoRobots1_T4_Rare.aura_param=424
Spell.PrimaryNanoRobots1_T4_Mk3.aura_param=446
Spell.PrimaryNanoRobots1_T4_Epic.aura_param=464
Spell.PrimaryNanoRobots1_T4_Rel.aura_param=479
]]--
--Радиус восстановления увеличен на 100%
--Spell.PrimaryNanoRobots2.target_range = 100
--Сила восстановления увеличена на 6.84% (х0.0683761)
--[[
Spell.PrimaryNanoRobots2_T4_Mk1.aura_param=267
Spell.PrimaryNanoRobots2_T4_Rare.aura_param=282
Spell.PrimaryNanoRobots2_T4_Mk3.aura_param=297
Spell.PrimaryNanoRobots2_T4_Epic.aura_param=308
Spell.PrimaryNanoRobots2_T4_Rel.aura_param=318
]]
--Время восстановления корпуса снижено до 5 секунд
--[[
Spell.PrimaryNanoRobots2_T4_Mk1.duration=5
Spell.PrimaryNanoRobots2_T4_Rare.duration=5
Spell.PrimaryNanoRobots2_T4_Mk3.duration=5
Spell.PrimaryNanoRobots2_T4_Epic.duration=5
Spell.PrimaryNanoRobots2_T4_Rel.duration=5
]]

--Заряжающие щиты
--Прочность щита увеличена на 49.8%
--[[
Spell.SelfPairsShell_T3_Mk1.influence_param=7030
Spell.SelfPairsShell_T3_Rare.influence_param=7375
Spell.SelfPairsShell_T3_Mk3.influence_param=7720
Spell.SelfPairsShell_T3_Epic.influence_param=7995
Spell.SelfPairsShell_T3_Rel.influence_param=8240
Spell.PairsShell_T3_Mk1.influence_param=7030
Spell.PairsShell_T3_Rare.influence_param=7375
Spell.PairsShell_T3_Mk3.influence_param=7720
Spell.PairsShell_T3_Epic.influence_param=7995
Spell.PairsShell_T3_Rel.influence_param=8240
]]

--Бластер "Игнис"
--Время действия поджига цели уменьшено до 3.2 с.
--Spell.FlameThrowerFire.duration = 3.2
--Время действия ДОТ-урона цели при контакте с огнём, который находится в текстуре снижено до 4 с.
--Spell.Flame.duration = 4.0

--Магнитный рассеиватель
--Время наложения дебаффа снижено на 71% (новое значение - 3с)
--Spell.Decay.duration = 3
--Урон дебаффа увеличен на 15%
--[[
Spell.Decay_T3_Mk1.aura_param=565
Spell.Decay_T3_Rare.aura_param=596
Spell.Decay_T3_Mk3.aura_param=627
Spell.Decay_T3_Epic.aura_param=652
Spell.Decay_T3_Rel.aura_param=673
Spell.Decay_T5_Mk1.aura_param=665
Spell.Decay_T5_Rare.aura_param=705
Spell.Decay_T5_Mk3.aura_param=740
Spell.Decay_T5_Epic.aura_param=770
Spell.Decay_T5_Rel.aura_param=795
]]

--Квантовый рейлган
--Скорость полёта снаряда увеличена на 30%
--[[
Def.Weapon_KineticCDRbyCrit_T4_Mk1.projectile_speed=715
Def.Weapon_KineticCDRbyCrit_T4_Rare.projectile_speed=715
Def.Weapon_KineticCDRbyCrit_T4_Mk3.projectile_speed=715
Def.Weapon_KineticCDRbyCrit_T4_Epic.projectile_speed=715
Def.Weapon_KineticCDRbyCrit_T4_Rel.projectile_speed=715
]]

--Диффузионный щит
--Количество принимаемого урона за единицу энергии увеличено на 15.38%
--[[
Spell.EnergyShieldCommander_T1_Base.aura_param=8
Spell.EnergyShieldCommander_T2_Base.aura_param=9
Spell.EnergyShieldCommander_T3_Base.aura_param=11
Spell.EnergyShieldCommander_T4_Base.aura_param=13
Spell.EnergyShieldCommander_T5_Base.aura_param=14.9994
Spell.EnergyShieldCommander_T5_Faction1.aura_param=14.9994
Spell.EnergyShieldCommander_T5_Faction2.aura_param=14.9994
Spell.EnergyShieldCommander_T5_Uniq.aura_param=14.9994
]]

--Энергокуб
--Дальность работы модуля увеличена на 46.66%
--[[
Spell.MacheteBox_T2_Mk1.aura_range=219.99
Spell.MacheteBox_T2_Rare.aura_range=219.99
Spell.MacheteBox_T2_Mk3.aura_range=219.99
Spell.MacheteBox_T2_Epic.aura_range=219.99
Spell.MacheteBox_T2_Rel.aura_range=219.99
Spell.MacheteBox_T5_Mk1.aura_range=219.99
Spell.MacheteBox_T5_Rare.aura_range=219.99
Spell.MacheteBox_T5_Mk3.aura_range=219.99
Spell.MacheteBox_T5_Epic.aura_range=219.99
Spell.MacheteBox_T5_Rel.aura_range=219.99
]]

--Лучевой дезинтегратор
--Перезарядка модуля увеличена на 30%
--[[
Def.Module_FoxMShot_T2_Mk1.cooldown=45.5
Def.Module_FoxMShot_T2_Rare.cooldown=39
Def.Module_FoxMShot_T2_Mk3.cooldown=35.1
Def.Module_FoxMShot_T2_Epic.cooldown=32.5
Def.Module_FoxMShot_T2_Rel.cooldown=31.2
Def.Module_FoxMShot_T5_Mk1.cooldown=45.5
Def.Module_FoxMShot_T5_Rare.cooldown=39
Def.Module_FoxMShot_T5_Mk3.cooldown=35.1
Def.Module_FoxMShot_T5_Epic.cooldown=32.5
Def.Module_FoxMShot_T5_Rel.cooldown=31.2
]]
--Дальность действия модуля уменьшена на 11.11%
--[[
Spell.FoxMShot1.aura_range = 450*0.89
Spell.FoxMShot2.aura_range = 450*0.89
]]
--Время подготовки модуля снижено на 33.33% (новое значение - 1с)
--Spell.FoxMShot_Self.duration = 1
--Энергопотребление модуля увеличено на 30%
--[[
Def.Module_FoxMShot_T2_Mk1.energy_cost=195
Def.Module_FoxMShot_T2_Rare.energy_cost=195
Def.Module_FoxMShot_T2_Mk3.energy_cost=195
Def.Module_FoxMShot_T2_Epic.energy_cost=195
Def.Module_FoxMShot_T2_Rel.energy_cost=195
Def.Module_FoxMShot_T5_Mk1.energy_cost=260
Def.Module_FoxMShot_T5_Rare.energy_cost=260
Def.Module_FoxMShot_T5_Mk3.energy_cost=260
Def.Module_FoxMShot_T5_Epic.energy_cost=260
Def.Module_FoxMShot_T5_Rel.energy_cost=260
]]--

--Мина-ловушка
--Время перезарядки снижено на 28.6%
--[[
Def.Module_CageTrapMine_T5_Mk1.cooldown=36
Def.Module_CageTrapMine_T5_Rare.cooldown=32
Def.Module_CageTrapMine_T5_Mk3.cooldown=29
Def.Module_CageTrapMine_T5_Epic.cooldown=25
Def.Module_CageTrapMine_T5_Rel.cooldown=23
]]
--Разрешается устанавливать до 2 мин
--Def.Module_CageTrapMine.activate_entity_max = 2

--Квантовая защита
--Время работы модуля снижено до 5с
--Spell.DiverTransparency_Base.duration = 5

--Термотранслятор
--Частота нанесения урона увеличена на 100%
--Spell.ReactorSpark.period = 1

--Плазменная дуга
--Время перезарядки снижено на 34% (новое значение - 35с)
--[[
Def.Module_EnergyLance_T1_Mk1.cooldown=42.9
Def.Module_EnergyLance_T1_Mk2.cooldown=42.9
Def.Module_EnergyLance_T1_Prem.cooldown=42.9
Def.Module_EnergyLance_T1_Rare.cooldown=42.9
Def.Module_EnergyLance_T1_Mk3.cooldown=42.9
Def.Module_EnergyLance_T1_Epic.cooldown=42.9
Def.Module_EnergyLance_T1_Rel.cooldown=42.9
Def.Module_EnergyLance_T2_Mk1.cooldown=40.92
Def.Module_EnergyLance_T2_Mk2.cooldown=40.92
Def.Module_EnergyLance_T2_Prem.cooldown=40.92
Def.Module_EnergyLance_T2_Rare.cooldown=40.92
Def.Module_EnergyLance_T2_Mk3.cooldown=40.92
Def.Module_EnergyLance_T2_Epic.cooldown=40.92
Def.Module_EnergyLance_T2_Rel.cooldown=40.92
Def.Module_EnergyLance_T3_Mk1.cooldown=38.94
Def.Module_EnergyLance_T3_Mk2.cooldown=38.94
Def.Module_EnergyLance_T3_Prem.cooldown=38.94
Def.Module_EnergyLance_T3_Rare.cooldown=38.94
Def.Module_EnergyLance_T3_Mk3.cooldown=38.94
Def.Module_EnergyLance_T3_Epic.cooldown=38.94
Def.Module_EnergyLance_T3_Rel.cooldown=38.94
Def.Module_EnergyLance_T4_Mk1.cooldown=36.96
Def.Module_EnergyLance_T4_Mk2.cooldown=36.96
Def.Module_EnergyLance_T4_Prem.cooldown=36.96
Def.Module_EnergyLance_T4_Rare.cooldown=36.96
Def.Module_EnergyLance_T4_Mk3.cooldown=36.96
Def.Module_EnergyLance_T4_Epic.cooldown=36.96
Def.Module_EnergyLance_T4_Rel.cooldown=36.96
Def.Module_EnergyLance_T5_Mk1.cooldown=34.98
Def.Module_EnergyLance_T5_Mk2.cooldown=34.98
Def.Module_EnergyLance_T5_Prem.cooldown=34.98
Def.Module_EnergyLance_T5_Rare.cooldown=34.98
Def.Module_EnergyLance_T5_Mk3.cooldown=34.98
Def.Module_EnergyLance_T5_Epic.cooldown=34.98
Def.Module_EnergyLance_T5_Rel.cooldown=34.98
]]
--Увеличена длина дуги на 10%
--Def.Module_EnergyLance.damage_box_size = Vec3( 3.0, 1.0, 10.5 )

--Дестабилизация реактора
--Время перезарядки модуля снижено на 58.3%
--[[
Def.Module_Suicide_T1_Mk1.cooldown=36.696
Def.Module_Suicide_T1_Mk2.cooldown=36.696
Def.Module_Suicide_T1_Prem.cooldown=36.696
Def.Module_Suicide_T1_Rare.cooldown=36.696
Def.Module_Suicide_T1_Mk3.cooldown=36.696
Def.Module_Suicide_T1_Epic.cooldown=36.696
Def.Module_Suicide_T1_Rel.cooldown=36.696
Def.Module_Suicide_T2_Mk1.cooldown=35.028
Def.Module_Suicide_T2_Mk2.cooldown=35.028
Def.Module_Suicide_T2_Prem.cooldown=35.028
Def.Module_Suicide_T2_Rare.cooldown=35.028
Def.Module_Suicide_T2_Mk3.cooldown=35.028
Def.Module_Suicide_T2_Epic.cooldown=35.028
Def.Module_Suicide_T2_Rel.cooldown=35.028
Def.Module_Suicide_T3_Mk1.cooldown=33.36
Def.Module_Suicide_T3_Mk2.cooldown=33.36
Def.Module_Suicide_T3_Prem.cooldown=33.36
Def.Module_Suicide_T3_Rare.cooldown=33.36
Def.Module_Suicide_T3_Mk3.cooldown=33.36
Def.Module_Suicide_T3_Epic.cooldown=33.36
Def.Module_Suicide_T3_Rel.cooldown=33.36
Def.Module_Suicide_T4_Mk1.cooldown=31.692
Def.Module_Suicide_T4_Mk2.cooldown=31.692
Def.Module_Suicide_T4_Prem.cooldown=31.692
Def.Module_Suicide_T4_Rare.cooldown=31.692
Def.Module_Suicide_T4_Mk3.cooldown=31.692
Def.Module_Suicide_T4_Epic.cooldown=31.692
Def.Module_Suicide_T4_Rel.cooldown=31.692
Def.Module_Suicide_T5_Mk1.cooldown=30.024
Def.Module_Suicide_T5_Mk2.cooldown=30.024
Def.Module_Suicide_T5_Prem.cooldown=30.024
Def.Module_Suicide_T5_Rare.cooldown=30.024
Def.Module_Suicide_T5_Mk3.cooldown=30.024
Def.Module_Suicide_T5_Epic.cooldown=30.024
Def.Module_Suicide_T5_Rel.cooldown=30.024
]]

--Кристаллическая мина
--Время воздействия дебаффа снижено на 50%
--Spell.Spell_ProximityMineGreen1.duration = 10
--Spell.Spell_ProximityMineGreen2.duration = 10
--Радиус взрыва (не детонации!) снижен на 40% (новое значение - 300м)
--Def.BlastWave_ProximityMineGreen.blast_maxDistance = 30

--Сенсорная мина
--Время активации с момента сброса снижено до 1 секунды
--[[
Def.SpaceMissile_ProximityMine_T1_Mk1.period=1
Def.SpaceMissile_ProximityMine_T1_Mk2.period=1
Def.SpaceMissile_ProximityMine_T1_Prem.period=1
Def.SpaceMissile_ProximityMine_T1_Rare.period=1
Def.SpaceMissile_ProximityMine_T1_Mk3.period=1
Def.SpaceMissile_ProximityMine_T1_Epic.period=1
Def.SpaceMissile_ProximityMine_T1_Rel.period=1
Def.SpaceMissile_ProximityMine_T2_Mk1.period=1
Def.SpaceMissile_ProximityMine_T2_Mk2.period=1
Def.SpaceMissile_ProximityMine_T2_Prem.period=1
Def.SpaceMissile_ProximityMine_T2_Rare.period=1
Def.SpaceMissile_ProximityMine_T2_Mk3.period=1
Def.SpaceMissile_ProximityMine_T2_Epic.period=1
Def.SpaceMissile_ProximityMine_T2_Rel.period=1
Def.SpaceMissile_ProximityMine_T3_Mk1.period=1
Def.SpaceMissile_ProximityMine_T3_Mk2.period=1
Def.SpaceMissile_ProximityMine_T3_Prem.period=1
Def.SpaceMissile_ProximityMine_T3_Rare.period=1
Def.SpaceMissile_ProximityMine_T3_Mk3.period=1
Def.SpaceMissile_ProximityMine_T3_Epic.period=1
Def.SpaceMissile_ProximityMine_T3_Rel.period=1
Def.SpaceMissile_ProximityMine_T4_Mk1.period=1
Def.SpaceMissile_ProximityMine_T4_Mk2.period=1
Def.SpaceMissile_ProximityMine_T4_Prem.period=1
Def.SpaceMissile_ProximityMine_T4_Rare.period=1
Def.SpaceMissile_ProximityMine_T4_Mk3.period=1
Def.SpaceMissile_ProximityMine_T4_Epic.period=1
Def.SpaceMissile_ProximityMine_T4_Rel.period=1
Def.SpaceMissile_ProximityMine_T5_Mk1.period=1
Def.SpaceMissile_ProximityMine_T5_Mk2.period=1
Def.SpaceMissile_ProximityMine_T5_Prem.period=1
Def.SpaceMissile_ProximityMine_T5_Rare.period=1
Def.SpaceMissile_ProximityMine_T5_Mk3.period=1
Def.SpaceMissile_ProximityMine_T5_Epic.period=1
Def.SpaceMissile_ProximityMine_T5_Rel.period=1
]]

--Кристалл-замедлитель
--Радиус сопровождения снижен с 750 до 500 м (-33.3%)
--Def.Projectile_GrowingStar.max_owner_distance = 50
--Верхний предел радиуса взрыва снижен на 10%
--Def.Blastwave_GrowingStar.blast_maxDistance	= 0.9
--Перезарядка увеличена на 36.36%
--[[
Def.Module_GrowingStar_T3_Mk1.cooldown=25
Def.Module_GrowingStar_T3_Rare.cooldown=22
Def.Module_GrowingStar_T3_Mk3.cooldown=19.5
Def.Module_GrowingStar_T3_Epic.cooldown=18
Def.Module_GrowingStar_T3_Rel.cooldown=17
Def.Module_GrowingStar_T4_Mk1.cooldown=24
Def.Module_GrowingStar_T4_Rare.cooldown=21
Def.Module_GrowingStar_T4_Mk3.cooldown=18.5
Def.Module_GrowingStar_T4_Epic.cooldown=17
Def.Module_GrowingStar_T4_Rel.cooldown=16
Def.Module_GrowingStar_T5_Mk1.cooldown=23
Def.Module_GrowingStar_T5_Rare.cooldown=20
Def.Module_GrowingStar_T5_Mk3.cooldown=17.5
Def.Module_GrowingStar_T5_Epic.cooldown=16
Def.Module_GrowingStar_T5_Rel.cooldown=15
]]
--Скорость полёта кристалла снижена на 13.63% (475 м/с)
--[[
Def.Module_GrowingStar_T3_Mk1.projectile_speed=39
Def.Module_GrowingStar_T3_Rare.projectile_speed=39
Def.Module_GrowingStar_T3_Mk3.projectile_speed=39
Def.Module_GrowingStar_T3_Epic.projectile_speed=39
Def.Module_GrowingStar_T3_Rel.projectile_speed=39
Def.Module_GrowingStar_T4_Mk1.projectile_speed=43
Def.Module_GrowingStar_T4_Rare.projectile_speed=43
Def.Module_GrowingStar_T4_Mk3.projectile_speed=43
Def.Module_GrowingStar_T4_Epic.projectile_speed=43
Def.Module_GrowingStar_T4_Rel.projectile_speed=43
Def.Module_GrowingStar_T5_Mk1.projectile_speed=47.5
Def.Module_GrowingStar_T5_Rare.projectile_speed=47.5
Def.Module_GrowingStar_T5_Mk3.projectile_speed=47.5
Def.Module_GrowingStar_T5_Epic.projectile_speed=47.5
Def.Module_GrowingStar_T5_Rel.projectile_speed=47.5
Def.Module_GrowingStar_T3_Mk1.max_range=195
Def.Module_GrowingStar_T3_Rare.max_range=195
Def.Module_GrowingStar_T3_Mk3.max_range=195
Def.Module_GrowingStar_T3_Epic.max_range=195
Def.Module_GrowingStar_T3_Rel.max_range=195
Def.Module_GrowingStar_T4_Mk1.max_range=215
Def.Module_GrowingStar_T4_Rare.max_range=215
Def.Module_GrowingStar_T4_Mk3.max_range=215
Def.Module_GrowingStar_T4_Epic.max_range=215
Def.Module_GrowingStar_T4_Rel.max_range=215
Def.Module_GrowingStar_T5_Mk1.max_range=237.5
Def.Module_GrowingStar_T5_Rare.max_range=237.5
Def.Module_GrowingStar_T5_Mk3.max_range=237.5
Def.Module_GrowingStar_T5_Epic.max_range=237.5
Def.Module_GrowingStar_T5_Rel.max_range=237.5
]]

--Кристалл-спутник Tai’Kin
--Скорость полёта снижена на 30.7%
--Def.Companion.max_speed	= 65*0.693
--Максимальное удаление от носителя снижено на 40% 
--Def.Companion.control_range = 500*0.6
--Def.Companion.teleport_dist = 500*0.6 -- расстояние с которого дрон телепортируется, если следует за кораблем, работает только если есть CompanionDroneModule

--Дрон-диверсант
--Сила откачки щита увеличена на 10%
--[[
Spell.SpyDroneShieldThief_T3_Mk1.additional_auras[1].aura_param=355
Spell.SpyDroneShieldThief_T3_Rare.additional_auras[1].aura_param=375
Spell.SpyDroneShieldThief_T3_Mk3.additional_auras[1].aura_param=395
Spell.SpyDroneShieldThief_T3_Epic.additional_auras[1].aura_param=410
Spell.SpyDroneShieldThief_T3_Rel.additional_auras[1].aura_param=420
Spell.SpyDroneShieldThief_T5_Mk1.additional_auras[1].aura_param=460
Spell.SpyDroneShieldThief_T5_Rare.additional_auras[1].aura_param=490
Spell.SpyDroneShieldThief_T5_Mk3.additional_auras[1].aura_param=515
Spell.SpyDroneShieldThief_T5_Epic.additional_auras[1].aura_param=535
Spell.SpyDroneShieldThief_T5_Rel.additional_auras[1].aura_param=545
]]
--Время работы снижено на 16.66% 
--[[
Spell.SpyDroneShieldThief_T3_Mk1.duration=6.5
Spell.SpyDroneShieldThief_T3_Mk1.additional_auras[1].duration=6.5
Spell.SpyDroneShieldThief_T3_Rare.duration=8
Spell.SpyDroneShieldThief_T3_Rare.additional_auras[1].duration=8
Spell.SpyDroneShieldThief_T3_Mk3.duration=9
Spell.SpyDroneShieldThief_T3_Mk3.additional_auras[1].duration=9
Spell.SpyDroneShieldThief_T3_Epic.duration=10
Spell.SpyDroneShieldThief_T3_Epic.additional_auras[1].duration=10
Spell.SpyDroneShieldThief_T3_Rel.duration=11
Spell.SpyDroneShieldThief_T3_Rel.additional_auras[1].duration=11
Spell.SpyDroneShieldThief_T5_Mk1.duration=6.5
Spell.SpyDroneShieldThief_T5_Mk1.additional_auras[1].duration=6.5
Spell.SpyDroneShieldThief_T5_Rare.duration=8
Spell.SpyDroneShieldThief_T5_Rare.additional_auras[1].duration=8
Spell.SpyDroneShieldThief_T5_Mk3.duration=9
Spell.SpyDroneShieldThief_T5_Mk3.additional_auras[1].duration=9
Spell.SpyDroneShieldThief_T5_Epic.duration=10
Spell.SpyDroneShieldThief_T5_Epic.additional_auras[1].duration=10
Spell.SpyDroneShieldThief_T5_Rel.duration=11
Spell.SpyDroneShieldThief_T5_Rel.additional_auras[1].duration=11
]]
--Перезарядка увеличена на 33.3% 
--[[
Def.Module_SpyDroneShieldThief_T3_Mk1.cooldown=26.66
Def.Module_SpyDroneShieldThief_T3_Rare.cooldown=22.661
Def.Module_SpyDroneShieldThief_T3_Mk3.cooldown=21.328
Def.Module_SpyDroneShieldThief_T3_Epic.cooldown=19.995
Def.Module_SpyDroneShieldThief_T3_Rel.cooldown=18.662
Def.Module_SpyDroneShieldThief_T5_Mk1.cooldown=26.66
Def.Module_SpyDroneShieldThief_T5_Rare.cooldown=22.661
Def.Module_SpyDroneShieldThief_T5_Mk3.cooldown=21.328
Def.Module_SpyDroneShieldThief_T5_Epic.cooldown=19.995
Def.Module_SpyDroneShieldThief_T5_Rel.cooldown=18.662
]]

--Боковой ускоритель
--Время перезарядки увеличено на 100%
--[[
Def.Module_DodgeDrive_T4_Mk1.cooldown=30
Def.Module_DodgeDrive_T4_Rare.cooldown=24
Def.Module_DodgeDrive_T4_Mk3.cooldown=20
Def.Module_DodgeDrive_T4_Epic.cooldown=14
Def.Module_DodgeDrive_T4_Rel.cooldown=12
]]
--Сбрасывают бомбу; не работают при накладывании модулей таклера: блок. луч, тяж.дрон.
--Def.Module_DodgeDrive.is_fast_movement=true
--Дистанция перемещения снижена на 25%
--Spell.DodgeDrive_l.duration=0.75

--Саботаж орудийных систем Karud
--Теперь модуль запрещает использовать орудия выбранной цели (вместо нанесения урона)
--[[
Def.Module_WeaponHacker.spell = "Spell_NoFireWeapon"
Def.Module_WeaponHacker.additional_spell = nil
Spell.Spell_NoFireWeapon.duration = 6
]]
--Добавить влияние  "Протонной стены" и экипажа 2-3 как эффекты антиконтроля, которые снижают время воздействия модуля 
--Spell.Spell_NoFireWeapon.apply_crowd_control_coef=true

--Контроль протоколов
--Использование модуля сбрасывает бомбу
--[[
Spell.EnlargeActiveCooldown_Self.additional_auras =
{
	{
		aura_target		= { target = ai.SpellTargetGeneral.HOLDER, },
		aura			= ai.Aura.ANTI_RADAR,
		duration		= 0.01,
		isBuff			= true,
		hud_visible 	= false,
	}
}
]]
--Рельсотрон
--Скорость полёта снаряда увеличена на 17%
--[[
Def.Weapon_RailgunDestr_T3_Mk1.projectile_speed=565
Def.Weapon_RailgunDestr_T3_Mk3.projectile_speed=565
Def.Weapon_RailgunDestr_T3_Rare.projectile_speed=565
Def.Weapon_RailgunDestr_T3_Epic.projectile_speed=565
Def.Weapon_RailgunDestr_T3_Rel.projectile_speed=565
Def.Weapon_RailgunDestr_T4_Mk1.projectile_speed=580
Def.Weapon_RailgunDestr_T4_Mk3.projectile_speed=580
Def.Weapon_RailgunDestr_T4_Rare.projectile_speed=580
Def.Weapon_RailgunDestr_T4_Epic.projectile_speed=580
Def.Weapon_RailgunDestr_T4_Rel.projectile_speed=580
Def.Weapon_RailgunDestr_T5_Mk1.projectile_speed=605
Def.Weapon_RailgunDestr_T5_Mk3.projectile_speed=605
Def.Weapon_RailgunDestr_T5_Rare.projectile_speed=605
Def.Weapon_RailgunDestr_T5_Epic.projectile_speed=605
Def.Weapon_RailgunDestr_T5_Rel.projectile_speed=605
]]

--Посадочная платформа Ze'Ta
--Скорость полёта дрона снижена на 33%
--Def.PlatformCompanion.max_speed = 30
--Максимальная дистанция работы дрона снижена на 36.36%
--Def.PlatformCompanion.control_range = 320

--Проектор червоточин
--Перезарядка модуля снижена на 33.3% (до 60с)
--[[
Def.Module_Teleporter_T3_Mk1.cooldown=63.65
Def.Module_Teleporter_T3_Rare.cooldown=63.65
Def.Module_Teleporter_T3_Mk3.cooldown=63.65
Def.Module_Teleporter_T3_Epic.cooldown=63.65
Def.Module_Teleporter_T4_Mk1.cooldown=62.31
Def.Module_Teleporter_T4_Rare.cooldown=62.31
Def.Module_Teleporter_T4_Mk3.cooldown=62.31
Def.Module_Teleporter_T4_Epic.cooldown=62.31
Def.Module_Teleporter_T5_Mk1.cooldown=60.3
Def.Module_Teleporter_T5_Rare.cooldown=60.3
Def.Module_Teleporter_T5_Mk3.cooldown=60.3
Def.Module_Teleporter_T5_Epic.cooldown=60.3
]]
--Скорость полёта "червоточины" увеличена до 800м/с
--Def.Module_Teleporter.projectile_speed=80

--Форсированный охладитель
--Сила модуля увеличена на 20%
--[[
Def.Module_CoolantSystemIdle_T5_Mk1.heat_add_mul=-0.528
Def.Module_CoolantSystemIdle_T5_Rare.heat_add_mul=-0.684
Def.Module_CoolantSystemIdle_T5_Mk3.heat_add_mul=-0.888
Def.Module_CoolantSystemIdle_T5_Epic.heat_add_mul=-1.14
Def.Module_CoolantSystemIdle_T5_Rel.heat_add_mul=-1.476
]]

--Бластерная турель
--Время снижения манёвренности снижено на 30%
--Spell.SlowByDestrTurret40.duration = 4.2
--Spell.SlowByDestrTurret40.additional_auras[1].duration = 4.2

--Преобразователь энергии
--Возвращаемый урон снижен на 10%
--Spell.Spell_EnergyReflector.aura_param = 9
--Перезарядка модуля увеличена на 30%
--[[
Def.Module_EnergyReflector_T3_Mk1.cooldown=50.5
Def.Module_EnergyReflector_T3_Rare.cooldown=45.95
Def.Module_EnergyReflector_T3_Mk3.cooldown=41.4
Def.Module_EnergyReflector_T3_Epic.cooldown=37.5
Def.Module_EnergyReflector_T3_Rel.cooldown=34.25
Def.Module_EnergyReflector_T4_Mk1.cooldown=48
Def.Module_EnergyReflector_T4_Rare.cooldown=43.45
Def.Module_EnergyReflector_T4_Mk3.cooldown=38.9
Def.Module_EnergyReflector_T4_Epic.cooldown=35
Def.Module_EnergyReflector_T4_Rel.cooldown=31.75
Def.Module_EnergyReflector_T5_Mk1.cooldown=45.5
Def.Module_EnergyReflector_T5_Rare.cooldown=40.95
Def.Module_EnergyReflector_T5_Mk3.cooldown=36.4
Def.Module_EnergyReflector_T5_Epic.cooldown=32.5
Def.Module_EnergyReflector_T5_Rel.cooldown=29.25
Def.Module_EnergyReflector_T5_Gold.cooldown=32.5
]]

--Ремкомплект Малый / Средний / Большой
--Время перезарядки снижено на 20%
--[[
Def.Module_RepairDrones_s_T1_Mk1.cooldown=76
Def.Module_RepairDrones_s_T1_Mk2.cooldown=76
Def.Module_RepairDrones_s_T1_Prem.cooldown=76
Def.Module_RepairDrones_s_T1_Rare.cooldown=76
Def.Module_RepairDrones_s_T1_Mk3.cooldown=76
Def.Module_RepairDrones_s_T1_Epic.cooldown=76
Def.Module_RepairDrones_s_T1_Rel.cooldown=76
Def.Module_RepairDrones_s_T2_Mk1.cooldown=72
Def.Module_RepairDrones_s_T2_Mk2.cooldown=72
Def.Module_RepairDrones_s_T2_Prem.cooldown=72
Def.Module_RepairDrones_s_T2_Rare.cooldown=72
Def.Module_RepairDrones_s_T2_Mk3.cooldown=72
Def.Module_RepairDrones_s_T2_Epic.cooldown=72
Def.Module_RepairDrones_s_T2_Rel.cooldown=72
Def.Module_RepairDrones_s_T3_Mk1.cooldown=68
Def.Module_RepairDrones_s_T3_Mk2.cooldown=68
Def.Module_RepairDrones_s_T3_Prem.cooldown=68
Def.Module_RepairDrones_s_T3_Rare.cooldown=68
Def.Module_RepairDrones_s_T3_Mk3.cooldown=68
Def.Module_RepairDrones_s_T3_Epic.cooldown=68
Def.Module_RepairDrones_s_T3_Rel.cooldown=68
Def.Module_RepairDrones_s_T4_Mk1.cooldown=64
Def.Module_RepairDrones_s_T4_Mk2.cooldown=64
Def.Module_RepairDrones_s_T4_Prem.cooldown=64
Def.Module_RepairDrones_s_T4_Rare.cooldown=64
Def.Module_RepairDrones_s_T4_Mk3.cooldown=64
Def.Module_RepairDrones_s_T4_Epic.cooldown=64
Def.Module_RepairDrones_s_T4_Rel.cooldown=64
Def.Module_RepairDrones_s_T5_Mk1.cooldown=60
Def.Module_RepairDrones_s_T5_Mk2.cooldown=60
Def.Module_RepairDrones_s_T5_Prem.cooldown=60
Def.Module_RepairDrones_s_T5_Rare.cooldown=60
Def.Module_RepairDrones_s_T5_Mk3.cooldown=60
Def.Module_RepairDrones_s_T5_Epic.cooldown=60
Def.Module_RepairDrones_s_T5_Rel.cooldown=60
Def.Module_RepairDrones_m_T1_Mk1.cooldown=76
Def.Module_RepairDrones_m_T1_Mk2.cooldown=76
Def.Module_RepairDrones_m_T1_Prem.cooldown=76
Def.Module_RepairDrones_m_T1_Rare.cooldown=76
Def.Module_RepairDrones_m_T1_Mk3.cooldown=76
Def.Module_RepairDrones_m_T1_Epic.cooldown=76
Def.Module_RepairDrones_m_T1_Rel.cooldown=76
Def.Module_RepairDrones_m_T2_Mk1.cooldown=72
Def.Module_RepairDrones_m_T2_Mk2.cooldown=72
Def.Module_RepairDrones_m_T2_Prem.cooldown=72
Def.Module_RepairDrones_m_T2_Rare.cooldown=72
Def.Module_RepairDrones_m_T2_Mk3.cooldown=72
Def.Module_RepairDrones_m_T2_Epic.cooldown=72
Def.Module_RepairDrones_m_T2_Rel.cooldown=72
Def.Module_RepairDrones_m_T3_Mk1.cooldown=68
Def.Module_RepairDrones_m_T3_Mk2.cooldown=68
Def.Module_RepairDrones_m_T3_Prem.cooldown=68
Def.Module_RepairDrones_m_T3_Rare.cooldown=68
Def.Module_RepairDrones_m_T3_Mk3.cooldown=68
Def.Module_RepairDrones_m_T3_Epic.cooldown=68
Def.Module_RepairDrones_m_T3_Rel.cooldown=68
Def.Module_RepairDrones_m_T4_Mk1.cooldown=64
Def.Module_RepairDrones_m_T4_Mk2.cooldown=64
Def.Module_RepairDrones_m_T4_Prem.cooldown=64
Def.Module_RepairDrones_m_T4_Rare.cooldown=64
Def.Module_RepairDrones_m_T4_Mk3.cooldown=64
Def.Module_RepairDrones_m_T4_Epic.cooldown=64
Def.Module_RepairDrones_m_T4_Rel.cooldown=64
Def.Module_RepairDrones_m_T5_Mk1.cooldown=60
Def.Module_RepairDrones_m_T5_Mk2.cooldown=60
Def.Module_RepairDrones_m_T5_Prem.cooldown=60
Def.Module_RepairDrones_m_T5_Rare.cooldown=60
Def.Module_RepairDrones_m_T5_Mk3.cooldown=60
Def.Module_RepairDrones_m_T5_Epic.cooldown=60
Def.Module_RepairDrones_m_T5_Rel.cooldown=60
Def.Module_RepairDrones_l_T1_Mk1.cooldown=76
Def.Module_RepairDrones_l_T1_Mk2.cooldown=76
Def.Module_RepairDrones_l_T1_Prem.cooldown=76
Def.Module_RepairDrones_l_T1_Rare.cooldown=76
Def.Module_RepairDrones_l_T1_Mk3.cooldown=76
Def.Module_RepairDrones_l_T1_Epic.cooldown=76
Def.Module_RepairDrones_l_T1_Rel.cooldown=76
Def.Module_RepairDrones_l_T2_Mk1.cooldown=72
Def.Module_RepairDrones_l_T2_Mk2.cooldown=72
Def.Module_RepairDrones_l_T2_Prem.cooldown=72
Def.Module_RepairDrones_l_T2_Rare.cooldown=72
Def.Module_RepairDrones_l_T2_Mk3.cooldown=72
Def.Module_RepairDrones_l_T2_Epic.cooldown=72
Def.Module_RepairDrones_l_T2_Rel.cooldown=72
Def.Module_RepairDrones_l_T3_Mk1.cooldown=68
Def.Module_RepairDrones_l_T3_Mk2.cooldown=68
Def.Module_RepairDrones_l_T3_Prem.cooldown=68
Def.Module_RepairDrones_l_T3_Rare.cooldown=68
Def.Module_RepairDrones_l_T3_Mk3.cooldown=68
Def.Module_RepairDrones_l_T3_Epic.cooldown=68
Def.Module_RepairDrones_l_T3_Rel.cooldown=68
Def.Module_RepairDrones_l_T4_Mk1.cooldown=64
Def.Module_RepairDrones_l_T4_Mk2.cooldown=64
Def.Module_RepairDrones_l_T4_Prem.cooldown=64
Def.Module_RepairDrones_l_T4_Rare.cooldown=64
Def.Module_RepairDrones_l_T4_Mk3.cooldown=64
Def.Module_RepairDrones_l_T4_Epic.cooldown=64
Def.Module_RepairDrones_l_T4_Rel.cooldown=64
Def.Module_RepairDrones_l_T5_Mk1.cooldown=60
Def.Module_RepairDrones_l_T5_Mk2.cooldown=60
Def.Module_RepairDrones_l_T5_Prem.cooldown=60
Def.Module_RepairDrones_l_T5_Rare.cooldown=60
Def.Module_RepairDrones_l_T5_Mk3.cooldown=60
Def.Module_RepairDrones_l_T5_Epic.cooldown=60
Def.Module_RepairDrones_l_T5_Rel.cooldown=60
]]--

--Вулкан
--Разброс снижен на 12.5%
--[[
Def.Weapon_RailVolcano_T2_Mk1.dispersion=0.65625
Def.Weapon_RailVolcano_T2_Mk1.dispersion_max=1.3125
Def.Weapon_RailVolcano_T2_Mk1.dispersion_add=0.13125
Def.Weapon_RailVolcano_T2_Mk1.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T2_Rare.dispersion=0.65625
Def.Weapon_RailVolcano_T2_Rare.dispersion_max=1.3125
Def.Weapon_RailVolcano_T2_Rare.dispersion_add=0.13125
Def.Weapon_RailVolcano_T2_Rare.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T2_Mk3.dispersion=0.65625
Def.Weapon_RailVolcano_T2_Mk3.dispersion_max=1.3125
Def.Weapon_RailVolcano_T2_Mk3.dispersion_add=0.13125
Def.Weapon_RailVolcano_T2_Mk3.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T2_Epic.dispersion=0.65625
Def.Weapon_RailVolcano_T2_Epic.dispersion_max=1.3125
Def.Weapon_RailVolcano_T2_Epic.dispersion_add=0.13125
Def.Weapon_RailVolcano_T2_Epic.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T2_Rel.dispersion=0.65625
Def.Weapon_RailVolcano_T2_Rel.dispersion_max=1.3125
Def.Weapon_RailVolcano_T2_Rel.dispersion_add=0.13125
Def.Weapon_RailVolcano_T2_Rel.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T3_Mk1.dispersion=0.65625
Def.Weapon_RailVolcano_T3_Mk1.dispersion_max=1.3125
Def.Weapon_RailVolcano_T3_Mk1.dispersion_add=0.13125
Def.Weapon_RailVolcano_T3_Mk1.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T3_Rare.dispersion=0.65625
Def.Weapon_RailVolcano_T3_Rare.dispersion_max=1.3125
Def.Weapon_RailVolcano_T3_Rare.dispersion_add=0.13125
Def.Weapon_RailVolcano_T3_Rare.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T3_Mk3.dispersion=0.65625
Def.Weapon_RailVolcano_T3_Mk3.dispersion_max=1.3125
Def.Weapon_RailVolcano_T3_Mk3.dispersion_add=0.13125
Def.Weapon_RailVolcano_T3_Mk3.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T3_Epic.dispersion=0.65625
Def.Weapon_RailVolcano_T3_Epic.dispersion_max=1.3125
Def.Weapon_RailVolcano_T3_Epic.dispersion_add=0.13125
Def.Weapon_RailVolcano_T3_Epic.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T3_Rel.dispersion=0.65625
Def.Weapon_RailVolcano_T3_Rel.dispersion_max=1.3125
Def.Weapon_RailVolcano_T3_Rel.dispersion_add=0.13125
Def.Weapon_RailVolcano_T3_Rel.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T4_Mk1.dispersion=0.65625
Def.Weapon_RailVolcano_T4_Mk1.dispersion_max=1.3125
Def.Weapon_RailVolcano_T4_Mk1.dispersion_add=0.13125
Def.Weapon_RailVolcano_T4_Mk1.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T4_Rare.dispersion=0.65625
Def.Weapon_RailVolcano_T4_Rare.dispersion_max=1.3125
Def.Weapon_RailVolcano_T4_Rare.dispersion_add=0.13125
Def.Weapon_RailVolcano_T4_Rare.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T4_Mk3.dispersion=0.65625
Def.Weapon_RailVolcano_T4_Mk3.dispersion_max=1.3125
Def.Weapon_RailVolcano_T4_Mk3.dispersion_add=0.13125
Def.Weapon_RailVolcano_T4_Mk3.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T4_Epic.dispersion=0.65625
Def.Weapon_RailVolcano_T4_Epic.dispersion_max=1.3125
Def.Weapon_RailVolcano_T4_Epic.dispersion_add=0.13125
Def.Weapon_RailVolcano_T4_Epic.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T4_Rel.dispersion=0.65625
Def.Weapon_RailVolcano_T4_Rel.dispersion_max=1.3125
Def.Weapon_RailVolcano_T4_Rel.dispersion_add=0.13125
Def.Weapon_RailVolcano_T4_Rel.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T5_Mk1.dispersion=0.65625
Def.Weapon_RailVolcano_T5_Mk1.dispersion_max=1.3125
Def.Weapon_RailVolcano_T5_Mk1.dispersion_add=0.13125
Def.Weapon_RailVolcano_T5_Mk1.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T5_Rare.dispersion=0.65625
Def.Weapon_RailVolcano_T5_Rare.dispersion_max=1.3125
Def.Weapon_RailVolcano_T5_Rare.dispersion_add=0.13125
Def.Weapon_RailVolcano_T5_Rare.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T5_Mk3.dispersion=0.65625
Def.Weapon_RailVolcano_T5_Mk3.dispersion_max=1.3125
Def.Weapon_RailVolcano_T5_Mk3.dispersion_add=0.13125
Def.Weapon_RailVolcano_T5_Mk3.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T5_Epic.dispersion=0.65625
Def.Weapon_RailVolcano_T5_Epic.dispersion_max=1.3125
Def.Weapon_RailVolcano_T5_Epic.dispersion_add=0.13125
Def.Weapon_RailVolcano_T5_Epic.dispersion_sub=1.3125
Def.Weapon_RailVolcano_T5_Rel.dispersion=0.65625
Def.Weapon_RailVolcano_T5_Rel.dispersion_max=1.3125
Def.Weapon_RailVolcano_T5_Rel.dispersion_add=0.13125
Def.Weapon_RailVolcano_T5_Rel.dispersion_sub=1.3125
]]

--Тяжелый бластер
--Разброс снижен на 25%
--[[
Def.Weapon_Laser_Sniper_T1_Mk1.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Mk2.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Mk3.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Prem.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Rare.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Epic.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T1_Rel.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Mk1.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Mk2.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Mk3.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Prem.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Rare.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Epic.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T2_Rel.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Mk1.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Mk2.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Mk3.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Prem.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Rare.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Epic.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T3_Rel.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Mk1.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Mk2.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Mk3.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Prem.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Rare.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Epic.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T4_Rel.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Mk1.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Mk2.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Mk3.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Prem.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Rare.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Epic.dispersion_max=1.875
Def.Weapon_Laser_Sniper_T5_Rel.dispersion_max=1.875
]]

--Скорострельный бластер
--Скорострельность увеличена на 60%
--[[
Def.Weapon_Plasmagun_Autofire_T1_Mk1.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Mk2.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Mk3.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Prem.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Rare.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Epic.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T1_Rel.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Mk1.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Mk2.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Mk3.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Prem.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Rare.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Epic.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T2_Rel.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Mk1.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Mk2.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Mk3.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Prem.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Rare.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Epic.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T3_Rel.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Mk1.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Mk2.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Mk3.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Prem.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Rare.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Epic.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T4_Rel.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Mk1.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Mk2.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Mk3.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Prem.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Rare.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Epic.fire_rate=400
Def.Weapon_Plasmagun_Autofire_T5_Rel.fire_rate=400
]]
--Урон снижен на 33%
--[[
Def.Weapon_Plasmagun_Autofire_T1_Mk1.damage_emp=102.7
Def.Weapon_Plasmagun_Autofire_T1_Mk1.damage_emp_add=6.9
Def.Weapon_Plasmagun_Autofire_T1_Mk1.damage_emp_sub=128.4
Def.Weapon_Plasmagun_Autofire_T1_Mk1.damage_emp_max=136.6
Def.Weapon_Plasmagun_Autofire_T1_Mk2.damage_emp=113.3
Def.Weapon_Plasmagun_Autofire_T1_Mk2.damage_emp_add=7.6
Def.Weapon_Plasmagun_Autofire_T1_Mk2.damage_emp_sub=141.6
Def.Weapon_Plasmagun_Autofire_T1_Mk2.damage_emp_max=150.7
Def.Weapon_Plasmagun_Autofire_T1_Mk3.damage_emp=118.6
Def.Weapon_Plasmagun_Autofire_T1_Mk3.damage_emp_add=7.9
Def.Weapon_Plasmagun_Autofire_T1_Mk3.damage_emp_sub=148.2
Def.Weapon_Plasmagun_Autofire_T1_Mk3.damage_emp_max=157.7
Def.Weapon_Plasmagun_Autofire_T1_Prem.damage_emp=118.6
Def.Weapon_Plasmagun_Autofire_T1_Prem.damage_emp_add=7.9
Def.Weapon_Plasmagun_Autofire_T1_Prem.damage_emp_sub=148.2
Def.Weapon_Plasmagun_Autofire_T1_Prem.damage_emp_max=157.7
Def.Weapon_Plasmagun_Autofire_T1_Rare.damage_emp=113.3
Def.Weapon_Plasmagun_Autofire_T1_Rare.damage_emp_add=7.6
Def.Weapon_Plasmagun_Autofire_T1_Rare.damage_emp_sub=141.6
Def.Weapon_Plasmagun_Autofire_T1_Rare.damage_emp_max=150.7
Def.Weapon_Plasmagun_Autofire_T1_Epic.damage_emp=122.8
Def.Weapon_Plasmagun_Autofire_T1_Epic.damage_emp_add=8.2
Def.Weapon_Plasmagun_Autofire_T1_Epic.damage_emp_sub=153.5
Def.Weapon_Plasmagun_Autofire_T1_Epic.damage_emp_max=163.4
Def.Weapon_Plasmagun_Autofire_T1_Rel.damage_emp=126.5
Def.Weapon_Plasmagun_Autofire_T1_Rel.damage_emp_add=8.4
Def.Weapon_Plasmagun_Autofire_T1_Rel.damage_emp_sub=158.2
Def.Weapon_Plasmagun_Autofire_T1_Rel.damage_emp_max=168.3
Def.Weapon_Plasmagun_Autofire_T2_Mk1.damage_emp=116.6
Def.Weapon_Plasmagun_Autofire_T2_Mk1.damage_emp_add=7.8
Def.Weapon_Plasmagun_Autofire_T2_Mk1.damage_emp_sub=145.7
Def.Weapon_Plasmagun_Autofire_T2_Mk1.damage_emp_max=155
Def.Weapon_Plasmagun_Autofire_T2_Mk2.damage_emp=121.7
Def.Weapon_Plasmagun_Autofire_T2_Mk2.damage_emp_add=8.1
Def.Weapon_Plasmagun_Autofire_T2_Mk2.damage_emp_sub=152.1
Def.Weapon_Plasmagun_Autofire_T2_Mk2.damage_emp_max=161.8
Def.Weapon_Plasmagun_Autofire_T2_Mk3.damage_emp=126.8
Def.Weapon_Plasmagun_Autofire_T2_Mk3.damage_emp_add=8.5
Def.Weapon_Plasmagun_Autofire_T2_Mk3.damage_emp_sub=158.5
Def.Weapon_Plasmagun_Autofire_T2_Mk3.damage_emp_max=168.6
Def.Weapon_Plasmagun_Autofire_T2_Prem.damage_emp=126.8
Def.Weapon_Plasmagun_Autofire_T2_Prem.damage_emp_add=8.5
Def.Weapon_Plasmagun_Autofire_T2_Prem.damage_emp_sub=158.5
Def.Weapon_Plasmagun_Autofire_T2_Prem.damage_emp_max=168.6
Def.Weapon_Plasmagun_Autofire_T2_Rare.damage_emp=121.7
Def.Weapon_Plasmagun_Autofire_T2_Rare.damage_emp_add=8.1
Def.Weapon_Plasmagun_Autofire_T2_Rare.damage_emp_sub=152.1
Def.Weapon_Plasmagun_Autofire_T2_Rare.damage_emp_max=161.8
Def.Weapon_Plasmagun_Autofire_T2_Epic.damage_emp=130.8
Def.Weapon_Plasmagun_Autofire_T2_Epic.damage_emp_add=8.7
Def.Weapon_Plasmagun_Autofire_T2_Epic.damage_emp_sub=163.6
Def.Weapon_Plasmagun_Autofire_T2_Epic.damage_emp_max=174
Def.Weapon_Plasmagun_Autofire_T2_Rel.damage_emp=134.4
Def.Weapon_Plasmagun_Autofire_T2_Rel.damage_emp_add=9
Def.Weapon_Plasmagun_Autofire_T2_Rel.damage_emp_sub=168
Def.Weapon_Plasmagun_Autofire_T2_Rel.damage_emp_max=178.8
Def.Weapon_Plasmagun_Autofire_T3_Mk1.damage_emp=126.8
Def.Weapon_Plasmagun_Autofire_T3_Mk1.damage_emp_add=8.5
Def.Weapon_Plasmagun_Autofire_T3_Mk1.damage_emp_sub=158.5
Def.Weapon_Plasmagun_Autofire_T3_Mk1.damage_emp_max=168.6
Def.Weapon_Plasmagun_Autofire_T3_Mk2.damage_emp=131.9
Def.Weapon_Plasmagun_Autofire_T3_Mk2.damage_emp_add=8.8
Def.Weapon_Plasmagun_Autofire_T3_Mk2.damage_emp_sub=164.8
Def.Weapon_Plasmagun_Autofire_T3_Mk2.damage_emp_max=175.4
Def.Weapon_Plasmagun_Autofire_T3_Mk3.damage_emp=137
Def.Weapon_Plasmagun_Autofire_T3_Mk3.damage_emp_add=9.1
Def.Weapon_Plasmagun_Autofire_T3_Mk3.damage_emp_sub=171.2
Def.Weapon_Plasmagun_Autofire_T3_Mk3.damage_emp_max=182.2
Def.Weapon_Plasmagun_Autofire_T3_Prem.damage_emp=137
Def.Weapon_Plasmagun_Autofire_T3_Prem.damage_emp_add=9.1
Def.Weapon_Plasmagun_Autofire_T3_Prem.damage_emp_sub=171.2
Def.Weapon_Plasmagun_Autofire_T3_Prem.damage_emp_max=182.2
Def.Weapon_Plasmagun_Autofire_T3_Rare.damage_emp=131.9
Def.Weapon_Plasmagun_Autofire_T3_Rare.damage_emp_add=8.8
Def.Weapon_Plasmagun_Autofire_T3_Rare.damage_emp_sub=164.8
Def.Weapon_Plasmagun_Autofire_T3_Rare.damage_emp_max=175.4
Def.Weapon_Plasmagun_Autofire_T3_Epic.damage_emp=141
Def.Weapon_Plasmagun_Autofire_T3_Epic.damage_emp_add=9.4
Def.Weapon_Plasmagun_Autofire_T3_Epic.damage_emp_sub=176.3
Def.Weapon_Plasmagun_Autofire_T3_Epic.damage_emp_max=187.6
Def.Weapon_Plasmagun_Autofire_T3_Rel.damage_emp=144.6
Def.Weapon_Plasmagun_Autofire_T3_Rel.damage_emp_add=9.6
Def.Weapon_Plasmagun_Autofire_T3_Rel.damage_emp_sub=180.7
Def.Weapon_Plasmagun_Autofire_T3_Rel.damage_emp_max=192.3
Def.Weapon_Plasmagun_Autofire_T4_Mk1.damage_emp=134.4
Def.Weapon_Plasmagun_Autofire_T4_Mk1.damage_emp_add=9
Def.Weapon_Plasmagun_Autofire_T4_Mk1.damage_emp_sub=168
Def.Weapon_Plasmagun_Autofire_T4_Mk1.damage_emp_max=178.8
Def.Weapon_Plasmagun_Autofire_T4_Mk2.damage_emp=139.5
Def.Weapon_Plasmagun_Autofire_T4_Mk2.damage_emp_add=9.3
Def.Weapon_Plasmagun_Autofire_T4_Mk2.damage_emp_sub=174.4
Def.Weapon_Plasmagun_Autofire_T4_Mk2.damage_emp_max=185.5
Def.Weapon_Plasmagun_Autofire_T4_Mk3.damage_emp=144.6
Def.Weapon_Plasmagun_Autofire_T4_Mk3.damage_emp_add=9.6
Def.Weapon_Plasmagun_Autofire_T4_Mk3.damage_emp_sub=180.7
Def.Weapon_Plasmagun_Autofire_T4_Mk3.damage_emp_max=192.3
Def.Weapon_Plasmagun_Autofire_T4_Prem.damage_emp=144.6
Def.Weapon_Plasmagun_Autofire_T4_Prem.damage_emp_add=9.6
Def.Weapon_Plasmagun_Autofire_T4_Prem.damage_emp_sub=180.7
Def.Weapon_Plasmagun_Autofire_T4_Prem.damage_emp_max=192.3
Def.Weapon_Plasmagun_Autofire_T4_Rare.damage_emp=139.5
Def.Weapon_Plasmagun_Autofire_T4_Rare.damage_emp_add=9.3
Def.Weapon_Plasmagun_Autofire_T4_Rare.damage_emp_sub=174.4
Def.Weapon_Plasmagun_Autofire_T4_Rare.damage_emp_max=185.5
Def.Weapon_Plasmagun_Autofire_T4_Epic.damage_emp=148.7
Def.Weapon_Plasmagun_Autofire_T4_Epic.damage_emp_add=9.9
Def.Weapon_Plasmagun_Autofire_T4_Epic.damage_emp_sub=185.8
Def.Weapon_Plasmagun_Autofire_T4_Epic.damage_emp_max=197.7
Def.Weapon_Plasmagun_Autofire_T4_Rel.damage_emp=152.2
Def.Weapon_Plasmagun_Autofire_T4_Rel.damage_emp_add=10.2
Def.Weapon_Plasmagun_Autofire_T4_Rel.damage_emp_sub=190.3
Def.Weapon_Plasmagun_Autofire_T4_Rel.damage_emp_max=202.5
Def.Weapon_Plasmagun_Autofire_T5_Mk1.damage_emp=139.5
Def.Weapon_Plasmagun_Autofire_T5_Mk1.damage_emp_add=9.3
Def.Weapon_Plasmagun_Autofire_T5_Mk1.damage_emp_sub=174.4
Def.Weapon_Plasmagun_Autofire_T5_Mk1.damage_emp_max=185.5
Def.Weapon_Plasmagun_Autofire_T5_Mk2.damage_emp=144.6
Def.Weapon_Plasmagun_Autofire_T5_Mk2.damage_emp_add=9.6
Def.Weapon_Plasmagun_Autofire_T5_Mk2.damage_emp_sub=180.7
Def.Weapon_Plasmagun_Autofire_T5_Mk2.damage_emp_max=192.3
Def.Weapon_Plasmagun_Autofire_T5_Mk3.damage_emp=149.7
Def.Weapon_Plasmagun_Autofire_T5_Mk3.damage_emp_add=10
Def.Weapon_Plasmagun_Autofire_T5_Mk3.damage_emp_sub=187.1
Def.Weapon_Plasmagun_Autofire_T5_Mk3.damage_emp_max=199.1
Def.Weapon_Plasmagun_Autofire_T5_Prem.damage_emp=149.7
Def.Weapon_Plasmagun_Autofire_T5_Prem.damage_emp_add=10
Def.Weapon_Plasmagun_Autofire_T5_Prem.damage_emp_sub=187.1
Def.Weapon_Plasmagun_Autofire_T5_Prem.damage_emp_max=199.1
Def.Weapon_Plasmagun_Autofire_T5_Rare.damage_emp=144.6
Def.Weapon_Plasmagun_Autofire_T5_Rare.damage_emp_add=9.6
Def.Weapon_Plasmagun_Autofire_T5_Rare.damage_emp_sub=180.7
Def.Weapon_Plasmagun_Autofire_T5_Rare.damage_emp_max=192.3
Def.Weapon_Plasmagun_Autofire_T5_Epic.damage_emp=153.8
Def.Weapon_Plasmagun_Autofire_T5_Epic.damage_emp_add=10.3
Def.Weapon_Plasmagun_Autofire_T5_Epic.damage_emp_sub=192.2
Def.Weapon_Plasmagun_Autofire_T5_Epic.damage_emp_max=204.5
Def.Weapon_Plasmagun_Autofire_T5_Rel.damage_emp=157.3
Def.Weapon_Plasmagun_Autofire_T5_Rel.damage_emp_add=10.5
Def.Weapon_Plasmagun_Autofire_T5_Rel.damage_emp_sub=196.7
Def.Weapon_Plasmagun_Autofire_T5_Rel.damage_emp_max=209.3
]]
--Разброс снижен на 10%
--[[
Def.Weapon_Plasmagun_Autofire_T1_Mk1.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Mk1.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Mk1.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Mk2.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Mk2.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Mk2.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Mk3.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Mk3.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Mk3.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Prem.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Prem.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Prem.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Rare.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Rare.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Rare.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Epic.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Epic.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Epic.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T1_Rel.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T1_Rel.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T1_Rel.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk1.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk1.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Mk1.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk2.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk2.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Mk2.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk3.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Mk3.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Mk3.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Prem.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Prem.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Prem.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Rare.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Rare.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Rare.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Epic.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Epic.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Epic.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T2_Rel.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T2_Rel.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T2_Rel.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk1.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk1.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Mk1.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk2.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk2.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Mk2.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk3.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Mk3.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Mk3.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Prem.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Prem.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Prem.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Rare.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Rare.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Rare.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Epic.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Epic.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Epic.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T3_Rel.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T3_Rel.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T3_Rel.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk1.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk1.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Mk1.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk2.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk2.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Mk2.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk3.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Mk3.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Mk3.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Prem.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Prem.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Prem.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Rare.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Rare.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Rare.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Epic.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Epic.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Epic.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T4_Rel.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T4_Rel.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T4_Rel.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk1.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk1.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Mk1.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk2.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk2.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Mk2.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk3.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Mk3.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Mk3.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Prem.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Prem.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Prem.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Rare.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Rare.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Rare.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Epic.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Epic.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Epic.dispersion_sub=1.2
Def.Weapon_Plasmagun_Autofire_T5_Rel.dispersion=1.2
Def.Weapon_Plasmagun_Autofire_T5_Rel.dispersion_max=3.6
Def.Weapon_Plasmagun_Autofire_T5_Rel.dispersion_sub=1.2
]]
--Темп увеличения разброса снижен на 50%
--[[
Def.Weapon_Plasmagun_Autofire_T1_Mk1.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Mk2.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Mk3.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Prem.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Rare.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Epic.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T1_Rel.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Mk1.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Mk2.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Mk3.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Prem.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Rare.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Epic.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T2_Rel.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Mk1.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Mk2.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Mk3.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Prem.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Rare.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Epic.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T3_Rel.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Mk1.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Mk2.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Mk3.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Prem.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Rare.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Epic.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T4_Rel.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Mk1.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Mk2.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Mk3.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Prem.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Rare.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Epic.dispersion_add=0.3733333
Def.Weapon_Plasmagun_Autofire_T5_Rel.dispersion_add=0.3733333
]]

--Импульсный лазер
--Скорострельность увеличена на 30%
--[[
Def.Weapon_Laser_Economic_T1_Mk1.fire_rate=312
Def.Weapon_Laser_Economic_T1_Mk2.fire_rate=312
Def.Weapon_Laser_Economic_T1_Mk3.fire_rate=312
Def.Weapon_Laser_Economic_T1_Prem.fire_rate=312
Def.Weapon_Laser_Economic_T1_Rare.fire_rate=312
Def.Weapon_Laser_Economic_T1_Epic.fire_rate=312
Def.Weapon_Laser_Economic_T1_Rel.fire_rate=312
Def.Weapon_Laser_Economic_T2_Mk1.fire_rate=312
Def.Weapon_Laser_Economic_T2_Mk2.fire_rate=312
Def.Weapon_Laser_Economic_T2_Mk3.fire_rate=312
Def.Weapon_Laser_Economic_T2_Prem.fire_rate=312
Def.Weapon_Laser_Economic_T2_Rare.fire_rate=312
Def.Weapon_Laser_Economic_T2_Epic.fire_rate=312
Def.Weapon_Laser_Economic_T2_Rel.fire_rate=312
Def.Weapon_Laser_Economic_T3_Mk1.fire_rate=312
Def.Weapon_Laser_Economic_T3_Mk2.fire_rate=312
Def.Weapon_Laser_Economic_T3_Mk3.fire_rate=312
Def.Weapon_Laser_Economic_T3_Prem.fire_rate=312
Def.Weapon_Laser_Economic_T3_Rare.fire_rate=312
Def.Weapon_Laser_Economic_T3_Epic.fire_rate=312
Def.Weapon_Laser_Economic_T3_Rel.fire_rate=312
Def.Weapon_Laser_Economic_T4_Mk1.fire_rate=312
Def.Weapon_Laser_Economic_T4_Mk2.fire_rate=312
Def.Weapon_Laser_Economic_T4_Mk3.fire_rate=312
Def.Weapon_Laser_Economic_T4_Prem.fire_rate=312
Def.Weapon_Laser_Economic_T4_Rare.fire_rate=312
Def.Weapon_Laser_Economic_T4_Epic.fire_rate=312
Def.Weapon_Laser_Economic_T4_Rel.fire_rate=312
Def.Weapon_Laser_Economic_T5_Mk1.fire_rate=312
Def.Weapon_Laser_Economic_T5_Mk2.fire_rate=312
Def.Weapon_Laser_Economic_T5_Mk3.fire_rate=312
Def.Weapon_Laser_Economic_T5_Prem.fire_rate=312
Def.Weapon_Laser_Economic_T5_Rare.fire_rate=312
Def.Weapon_Laser_Economic_T5_Epic.fire_rate=312
Def.Weapon_Laser_Economic_T5_Rel.fire_rate=312
Def.Weapon_Laser_Economic_T4_Unique1.fire_rate=312
Def.Weapon_Laser_Economic_T5_Unique3.fire_rate=312
]]
--Урон снижен на 23%
--[[
Def.Weapon_Laser_Economic_T1_Mk1.damage_thermal=132.8
Def.Weapon_Laser_Economic_T1_Mk2.damage_thermal=146.5
Def.Weapon_Laser_Economic_T1_Mk3.damage_thermal=153.3
Def.Weapon_Laser_Economic_T1_Prem.damage_thermal=153.3
Def.Weapon_Laser_Economic_T1_Rare.damage_thermal=146.5
Def.Weapon_Laser_Economic_T1_Epic.damage_thermal=158.8
Def.Weapon_Laser_Economic_T1_Rel.damage_thermal=163.6
Def.Weapon_Laser_Economic_T2_Mk1.damage_thermal=150.7
Def.Weapon_Laser_Economic_T2_Mk2.damage_thermal=157.3
Def.Weapon_Laser_Economic_T2_Mk3.damage_thermal=163.9
Def.Weapon_Laser_Economic_T2_Prem.damage_thermal=163.9
Def.Weapon_Laser_Economic_T2_Rare.damage_thermal=157.3
Def.Weapon_Laser_Economic_T2_Epic.damage_thermal=169.1
Def.Weapon_Laser_Economic_T2_Rel.damage_thermal=173.8
Def.Weapon_Laser_Economic_T3_Mk1.damage_thermal=163.9
Def.Weapon_Laser_Economic_T3_Mk2.damage_thermal=170.5
Def.Weapon_Laser_Economic_T3_Mk3.damage_thermal=177
Def.Weapon_Laser_Economic_T3_Prem.damage_thermal=177
Def.Weapon_Laser_Economic_T3_Rare.damage_thermal=170.5
Def.Weapon_Laser_Economic_T3_Epic.damage_thermal=182.3
Def.Weapon_Laser_Economic_T3_Rel.damage_thermal=186.9
Def.Weapon_Laser_Economic_T4_Mk1.damage_thermal=173.8
Def.Weapon_Laser_Economic_T4_Mk2.damage_thermal=180.3
Def.Weapon_Laser_Economic_T4_Mk3.damage_thermal=186.9
Def.Weapon_Laser_Economic_T4_Prem.damage_thermal=186.9
Def.Weapon_Laser_Economic_T4_Rare.damage_thermal=180.3
Def.Weapon_Laser_Economic_T4_Epic.damage_thermal=192.2
Def.Weapon_Laser_Economic_T4_Rel.damage_thermal=196.8
Def.Weapon_Laser_Economic_T5_Mk1.damage_thermal=180.3
Def.Weapon_Laser_Economic_T5_Mk2.damage_thermal=186.9
Def.Weapon_Laser_Economic_T5_Mk3.damage_thermal=193.5
Def.Weapon_Laser_Economic_T5_Prem.damage_thermal=193.5
Def.Weapon_Laser_Economic_T5_Rare.damage_thermal=186.9
Def.Weapon_Laser_Economic_T5_Epic.damage_thermal=198.8
Def.Weapon_Laser_Economic_T5_Rel.damage_thermal=203.4
Def.Weapon_Laser_Economic_T4_Unique1.damage_thermal=196.8
Def.Weapon_Laser_Economic_T5_Unique3.damage_thermal=203.4
]]

--Система горизонт
--Снижение урона 7%
--[[
Def.ModulePassive_RangeMasterUnit_T1_Mk1.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Mk2.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Prem.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Rare.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Mk3.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Epic.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T1_Rel.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Mk1.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Mk2.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Prem.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Rare.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Mk3.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Epic.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T2_Rel.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Mk1.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Mk2.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Prem.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Rare.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Mk3.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Epic.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Rel.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Mk1.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Mk2.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Prem.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Rare.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Mk3.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Epic.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T4_Rel.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Mk1.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Mk2.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Prem.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Rare.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Mk3.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Epic.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T5_Rel.damage_mul=-0.07
Def.ModulePassive_RangeMasterUnit_T3_Set.damage_mul=-0.035
]]
--+36% к дальности
--[[
Def.ModulePassive_RangeMasterUnit_T1_Mk1.optimal_range_mul=0.204
Def.ModulePassive_RangeMasterUnit_T1_Mk1.max_range_mul=0.204
Def.ModulePassive_RangeMasterUnit_T1_Mk2.optimal_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T1_Mk2.max_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T1_Prem.optimal_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T1_Prem.max_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T1_Rare.optimal_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T1_Rare.max_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T1_Mk3.optimal_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T1_Mk3.max_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T1_Epic.optimal_range_mul=0.3468
Def.ModulePassive_RangeMasterUnit_T1_Epic.max_range_mul=0.3468
Def.ModulePassive_RangeMasterUnit_T1_Rel.optimal_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T1_Rel.max_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T2_Mk1.optimal_range_mul=0.2176
Def.ModulePassive_RangeMasterUnit_T2_Mk1.max_range_mul=0.2176
Def.ModulePassive_RangeMasterUnit_T2_Mk2.optimal_range_mul=0.272
Def.ModulePassive_RangeMasterUnit_T2_Mk2.max_range_mul=0.272
Def.ModulePassive_RangeMasterUnit_T2_Prem.optimal_range_mul=0.3264
Def.ModulePassive_RangeMasterUnit_T2_Prem.max_range_mul=0.3264
Def.ModulePassive_RangeMasterUnit_T2_Rare.optimal_range_mul=0.272
Def.ModulePassive_RangeMasterUnit_T2_Rare.max_range_mul=0.272
Def.ModulePassive_RangeMasterUnit_T2_Mk3.optimal_range_mul=0.3264
Def.ModulePassive_RangeMasterUnit_T2_Mk3.max_range_mul=0.3264
Def.ModulePassive_RangeMasterUnit_T2_Epic.optimal_range_mul=0.3604
Def.ModulePassive_RangeMasterUnit_T2_Epic.max_range_mul=0.3604
Def.ModulePassive_RangeMasterUnit_T2_Rel.optimal_range_mul=0.3808
Def.ModulePassive_RangeMasterUnit_T2_Rel.max_range_mul=0.3808
Def.ModulePassive_RangeMasterUnit_T3_Mk1.optimal_range_mul=0.2312
Def.ModulePassive_RangeMasterUnit_T3_Mk1.max_range_mul=0.2312
Def.ModulePassive_RangeMasterUnit_T3_Mk2.optimal_range_mul=0.2856
Def.ModulePassive_RangeMasterUnit_T3_Mk2.max_range_mul=0.2856
Def.ModulePassive_RangeMasterUnit_T3_Prem.optimal_range_mul=0.34
Def.ModulePassive_RangeMasterUnit_T3_Prem.max_range_mul=0.34
Def.ModulePassive_RangeMasterUnit_T3_Rare.optimal_range_mul=0.2856
Def.ModulePassive_RangeMasterUnit_T3_Rare.max_range_mul=0.2856
Def.ModulePassive_RangeMasterUnit_T3_Mk3.optimal_range_mul=0.34
Def.ModulePassive_RangeMasterUnit_T3_Mk3.max_range_mul=0.34
Def.ModulePassive_RangeMasterUnit_T3_Epic.optimal_range_mul=0.374
Def.ModulePassive_RangeMasterUnit_T3_Epic.max_range_mul=0.374
Def.ModulePassive_RangeMasterUnit_T3_Rel.optimal_range_mul=0.3944
Def.ModulePassive_RangeMasterUnit_T3_Rel.max_range_mul=0.3944
Def.ModulePassive_RangeMasterUnit_T4_Mk1.optimal_range_mul=0.2448
Def.ModulePassive_RangeMasterUnit_T4_Mk1.max_range_mul=0.2448
Def.ModulePassive_RangeMasterUnit_T4_Mk2.optimal_range_mul=0.2992
Def.ModulePassive_RangeMasterUnit_T4_Mk2.max_range_mul=0.2992
Def.ModulePassive_RangeMasterUnit_T4_Prem.optimal_range_mul=0.3536
Def.ModulePassive_RangeMasterUnit_T4_Prem.max_range_mul=0.3536
Def.ModulePassive_RangeMasterUnit_T4_Rare.optimal_range_mul=0.2992
Def.ModulePassive_RangeMasterUnit_T4_Rare.max_range_mul=0.2992
Def.ModulePassive_RangeMasterUnit_T4_Mk3.optimal_range_mul=0.3536
Def.ModulePassive_RangeMasterUnit_T4_Mk3.max_range_mul=0.3536
Def.ModulePassive_RangeMasterUnit_T4_Epic.optimal_range_mul=0.3876
Def.ModulePassive_RangeMasterUnit_T4_Epic.max_range_mul=0.3876
Def.ModulePassive_RangeMasterUnit_T4_Rel.optimal_range_mul=0.408
Def.ModulePassive_RangeMasterUnit_T4_Rel.max_range_mul=0.408
Def.ModulePassive_RangeMasterUnit_T5_Mk1.optimal_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T5_Mk1.max_range_mul=0.2584
Def.ModulePassive_RangeMasterUnit_T5_Mk2.optimal_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T5_Mk2.max_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T5_Prem.optimal_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T5_Prem.max_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T5_Rare.optimal_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T5_Rare.max_range_mul=0.3128
Def.ModulePassive_RangeMasterUnit_T5_Mk3.optimal_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T5_Mk3.max_range_mul=0.3672
Def.ModulePassive_RangeMasterUnit_T5_Epic.optimal_range_mul=0.4012
Def.ModulePassive_RangeMasterUnit_T5_Epic.max_range_mul=0.4012
Def.ModulePassive_RangeMasterUnit_T5_Rel.optimal_range_mul=0.4216
Def.ModulePassive_RangeMasterUnit_T5_Rel.max_range_mul=0.4216
Def.ModulePassive_RangeMasterUnit_T3_Set.max_range_mul=0.374
]]
--Разрешается установить только один модификатор
--[[
Def.ModulePassive_RangeMasterUnit_T1_Mk1.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Mk2.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Prem.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Rare.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Mk3.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Epic.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T1_Rel.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Mk1.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Mk2.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Prem.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Rare.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Mk3.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Epic.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T2_Rel.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Mk1.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Mk2.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Prem.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Rare.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Mk3.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Epic.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T3_Rel.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Mk1.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Mk2.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Prem.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Rare.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Mk3.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Epic.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T4_Rel.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Mk1.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Mk2.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Prem.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Rare.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Mk3.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Epic.unique_equip=true
Def.ModulePassive_RangeMasterUnit_T5_Rel.unique_equip=true
]]--

--Щиты фрегатов прикрытия
--Начальное ускорение спецмодуля снижено до 50%
--[[
Spell.PhaseShield_Speed =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.5,
	duration		= 12,
	period			= 1,
	aura_param_add	= -0.05,
	dispell_flag	= ai.Dispell.ON_DAMAGE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}
Spell.PhaseShield_Phase0.additional_auras[1]=Spell.PhaseShield_Speed
Spell.PhaseShield_Phase1.additional_auras[1]=Spell.PhaseShield_Speed
Spell.PhaseShield_Phase2.additional_auras[1]=Spell.PhaseShield_Speed
Spell.PhaseShield_Phase0_.additional_auras[1]=Spell.PhaseShield_Speed
Spell.PhaseShield_Phase1_.additional_auras[1]=Spell.PhaseShield_Speed
Spell.PhaseShield_Phase2_.additional_auras[1]=Spell.PhaseShield_Speed
Spell.GigantShieldSpeed.aura_param=0.55
]]

--Архангел
--Угол поворота ракет снижен на 35%
--Def.Projectile_RocketWolfhound.angular_velocity=32.5
--Сила озверина увеличена до 30% (x1.2)
--Spell.WolfhoundOvercharge.aura_param=0.3

--Мезонная пушка
--Максимальный разброс снижен на 12.5% (x0.875)
--[[
Def.Weapon_LaserBlaster_T3_Mk1.dispersion_max=2.8
Def.Weapon_LaserBlaster_T3_Mk3.dispersion_max=2.8
Def.Weapon_LaserBlaster_T3_Rare.dispersion_max=2.8
Def.Weapon_LaserBlaster_T3_Epic.dispersion_max=2.8
Def.Weapon_LaserBlaster_T3_Rel.dispersion_max=2.8
Def.Weapon_LaserBlaster_T4_Mk1.dispersion_max=2.8
Def.Weapon_LaserBlaster_T4_Mk3.dispersion_max=2.8
Def.Weapon_LaserBlaster_T4_Rare.dispersion_max=2.8
Def.Weapon_LaserBlaster_T4_Epic.dispersion_max=2.8
Def.Weapon_LaserBlaster_T4_Rel.dispersion_max=2.8
Def.Weapon_LaserBlaster_T5_Mk1.dispersion_max=2.8
Def.Weapon_LaserBlaster_T5_Mk3.dispersion_max=2.8
Def.Weapon_LaserBlaster_T5_Rare.dispersion_max=2.8
Def.Weapon_LaserBlaster_T5_Epic.dispersion_max=2.8
Def.Weapon_LaserBlaster_T5_Rel.dispersion_max=2.8
]]

--Осколочная установка "Кай" 
--Восстановления роя 1500 за 1 попадание
--Spell.Spell_SwarmCloudHeal.aura_param=1500
--Дальность стрельбы снижена до 4500 м
--[[
Def.Weapon_SwarmCloud_T4_Mk1.optimal_range=300
Def.Weapon_SwarmCloud_T4_Mk1.max_range=400
Def.Weapon_SwarmCloud_T4_Rare.optimal_range=300
Def.Weapon_SwarmCloud_T4_Rare.max_range=400
Def.Weapon_SwarmCloud_T4_Mk3.optimal_range=300
Def.Weapon_SwarmCloud_T4_Mk3.max_range=400
Def.Weapon_SwarmCloud_T4_Epic.optimal_range=300
Def.Weapon_SwarmCloud_T4_Epic.max_range=400
Def.Weapon_SwarmCloud_T4_Rel.optimal_range=300
Def.Weapon_SwarmCloud_T4_Rel.max_range=400
Def.Weapon_SwarmCloud_T5_Mk1.optimal_range=300
Def.Weapon_SwarmCloud_T5_Mk1.max_range=400
Def.Weapon_SwarmCloud_T5_Rare.optimal_range=300
Def.Weapon_SwarmCloud_T5_Rare.max_range=400
Def.Weapon_SwarmCloud_T5_Mk3.optimal_range=300
Def.Weapon_SwarmCloud_T5_Mk3.max_range=400
Def.Weapon_SwarmCloud_T5_Epic.optimal_range=300
Def.Weapon_SwarmCloud_T5_Epic.max_range=400
Def.Weapon_SwarmCloud_T5_Rel.optimal_range=300
Def.Weapon_SwarmCloud_T5_Rel.max_range=400
]]

--Сбалансированный рой. Режим атаки
--Минимальная дистанция атаки снижена до 3,7 км
--Def.SwarmPack2.attack_target_range=370
--Рой преследует цель до 4,2 км
--Def.SwarmPack2.attack_target_max_range=450

--Пиратский массовый генератор щита
--Пассивная зарядка щита 90 ед.
--Spell.Passive_ShieldEmitter_T5_Craft.aura_param=90

--Акселераторный модуль "Болид"
--Порог энергии снижен до 50%
--[[
Def.Module_MultiPurposeAdaptor_T4_Mk1.max_energy_percent=0.5
Def.Module_MultiPurposeAdaptor_T4_Rare.max_energy_percent=0.5
Def.Module_MultiPurposeAdaptor_T4_Mk3.max_energy_percent=0.5
Def.Module_MultiPurposeAdaptor_T4_Epic.max_energy_percent=0.5
Def.Module_MultiPurposeAdaptor_T4_Rel.max_energy_percent=0.5
]]

--Waz'Dum
--Вампиризм 15%
--Spell.KineticVamp.aura_param=0.15
--Скорость полёта 4500 м/с
--[[
Def.Weapon_GreenHealRailgun_T3_Mk1.projectile_speed=450
Def.Weapon_GreenHealRailgun_T3_Rare.projectile_speed=450
Def.Weapon_GreenHealRailgun_T3_Mk3.projectile_speed=450
Def.Weapon_GreenHealRailgun_T3_Epic.projectile_speed=450
Def.Weapon_GreenHealRailgun_T3_Rel.projectile_speed=450
Def.Weapon_GreenHealRailgun_T4_Mk1.projectile_speed=450
Def.Weapon_GreenHealRailgun_T4_Rare.projectile_speed=450
Def.Weapon_GreenHealRailgun_T4_Mk3.projectile_speed=450
Def.Weapon_GreenHealRailgun_T4_Epic.projectile_speed=450
Def.Weapon_GreenHealRailgun_T4_Rel.projectile_speed=450
Def.Weapon_GreenHealRailgun_T5_Mk1.projectile_speed=450
Def.Weapon_GreenHealRailgun_T5_Rare.projectile_speed=450
Def.Weapon_GreenHealRailgun_T5_Mk3.projectile_speed=450
Def.Weapon_GreenHealRailgun_T5_Epic.projectile_speed=450
Def.Weapon_GreenHealRailgun_T5_Rel.projectile_speed=450
]]

--Разгон спецмодуля 
--Урон увеличен на 14.29% (x1.1428571)
--[[
Spell.UpgradedSpecial_T3_Mk1_target.aura_param=800
Spell.UpgradedSpecial_T3_Rare_target.aura_param=915
Spell.UpgradedSpecial_T3_Mk3_target.aura_param=970
Spell.UpgradedSpecial_T3_Epic_target.aura_param=1000
Spell.UpgradedSpecial_T3_Rel_target.aura_param=1030
]]

--Процессор "Ехидна"
--Пороговое значение скорости увеличено до 15% (x3)
--Def.Module_PreparationAdaptation.max_speed_percent=0.15

--Аварийное восстановление 
--Восстановление корпуса 390 ед/с 10 секунд
--Spell.BushidoCall_HPS.aura_param=195
--Spell.BushidoCall_HPS.duration=10

--Дестабилизирующее поле 
--Энергопотребление 2000 энергии.
--[[
Def.Module_DestrMovementRestrictor_T5_Mk1.energy_cost=2000
Def.Module_DestrMovementRestrictor_T5_Rare.energy_cost=2000
Def.Module_DestrMovementRestrictor_T5_Mk3.energy_cost=2000
Def.Module_DestrMovementRestrictor_T5_Epic.energy_cost=2000
Def.Module_DestrMovementRestrictor_T5_Rel.energy_cost=2000
]]

--Кинематический адаптер щита 
--Сила восстановления снижена на 30%
--[[
Spell.Lynx2Shield_T2_Mk1.aura_param=169
Spell.Lynx2Shield_T2_Rare.aura_param=178
Spell.Lynx2Shield_T2_Mk3.aura_param=187
Spell.Lynx2Shield_T2_Epic.aura_param=195
Spell.Lynx2Shield_T2_Rel.aura_param=201
Spell.Lynx2Shield_T4_Mk1.aura_param=211
Spell.Lynx2Shield_T4_Rare.aura_param=223
Spell.Lynx2Shield_T4_Mk3.aura_param=234
Spell.Lynx2Shield_T4_Epic.aura_param=244
Spell.Lynx2Shield_T4_Rel.aura_param=251
]]

--Вакуум-резонансный лазер
--Дальность стрельбы увеличена на 15%
--[[
Def.Weapon_DestrResonatingLaser_T5_Mk1.optimal_range=301.875
Def.Weapon_DestrResonatingLaser_T5_Mk1.max_range=402.5
Def.Weapon_DestrResonatingLaser_T5_Rare.optimal_range=301.875
Def.Weapon_DestrResonatingLaser_T5_Rare.max_range=402.5
Def.Weapon_DestrResonatingLaser_T5_Mk3.optimal_range=301.875
Def.Weapon_DestrResonatingLaser_T5_Mk3.max_range=402.5
Def.Weapon_DestrResonatingLaser_T5_Epic.optimal_range=301.875
Def.Weapon_DestrResonatingLaser_T5_Epic.max_range=402.5
Def.Weapon_DestrResonatingLaser_T5_Rel.optimal_range=301.875
Def.Weapon_DestrResonatingLaser_T5_Rel.max_range=402.5
]]

--Термоактивное орудие
--Дальность стрельбы увеличена на 8%
--[[
Def.Weapon_KineticFloatingCrit_T5_Mk1.optimal_range=303.75
Def.Weapon_KineticFloatingCrit_T5_Mk1.max_range=405
Def.Weapon_KineticFloatingCrit_T5_Rare.optimal_range=303.75
Def.Weapon_KineticFloatingCrit_T5_Rare.max_range=405
Def.Weapon_KineticFloatingCrit_T5_Mk3.optimal_range=303.75
Def.Weapon_KineticFloatingCrit_T5_Mk3.max_range=405
Def.Weapon_KineticFloatingCrit_T5_Epic.optimal_range=303.75
Def.Weapon_KineticFloatingCrit_T5_Epic.max_range=405
Def.Weapon_KineticFloatingCrit_T5_Rel.optimal_range=303.75
Def.Weapon_KineticFloatingCrit_T5_Rel.max_range=405
]]
--Скорость полёта снаряда увеличена на 5%
--[[
Def.Weapon_KineticFloatingCrit_T5_Mk1.projectile_speed=472.5
Def.Weapon_KineticFloatingCrit_T5_Rare.projectile_speed=472.5
Def.Weapon_KineticFloatingCrit_T5_Mk3.projectile_speed=472.5
Def.Weapon_KineticFloatingCrit_T5_Epic.projectile_speed=472.5
Def.Weapon_KineticFloatingCrit_T5_Rel.projectile_speed=472.5
]]

--Тяжелый ремонтный дрон
--Сила работы увеличена на 70%
--[[
Spell.DestrMunition_HealBot_T3_Mk3_spl.aura_param=325
Spell.DestrMunition_HealBot_T4_Mk3_spl.aura_param=375
Spell.DestrMunition_HealBot_T5_Mk3_spl.aura_param=430
]]

--Разогнанный бластер 
--Урон +10%
--[[
Def.Weapon_PlasmagunEnergy_T5_Mk1.damage_emp=258.8
Def.Weapon_PlasmagunEnergy_T5_Rare.damage_emp=268.3
Def.Weapon_PlasmagunEnergy_T5_Mk3.damage_emp=277.7
Def.Weapon_PlasmagunEnergy_T5_Epic.damage_emp=285.3
Def.Weapon_PlasmagunEnergy_T5_Rel.damage_emp=291.9
]]

--Кристаллический дрон
--Скорость полёта снаряда увеличена до 6 км/с
--Def.Weapon_CrystalConeDrone.projectile_speed=600

--Инфобарьер
--Линейные размеры барьера увеличены в 2 раза (х2)
--[[
Def.InfoBarrier.model="models/shields/info_barrier_v2"
Def.InfoBarrier.children[1].effect="particles/gadget/info_barrier_v2"
Def.InfoBarrier.death_effect="particles/gadget/info_barrier_end_v2"
Def.InfoBarrier.end_effect="particles/gadget/info_barrier_end_v2"
]]

--Подавитель силовой установки
--Время перезарядки модуля снижено на 16.66% (х0.8333)
--[[
Def.Module_WebPropulsion_T1_Mk1.cooldown=31.6654
Def.Module_WebPropulsion_T1_Mk2.cooldown=31.6654
Def.Module_WebPropulsion_T1_Prem.cooldown=31.6654
Def.Module_WebPropulsion_T1_Rare.cooldown=31.6654
Def.Module_WebPropulsion_T1_Mk3.cooldown=31.6654
Def.Module_WebPropulsion_T1_Epic.cooldown=31.6654
Def.Module_WebPropulsion_T1_Rel.cooldown=31.6654
Def.Module_WebPropulsion_T2_Mk1.cooldown=29.6654
Def.Module_WebPropulsion_T2_Mk2.cooldown=29.6654
Def.Module_WebPropulsion_T2_Prem.cooldown=29.6654
Def.Module_WebPropulsion_T2_Rare.cooldown=29.6654
Def.Module_WebPropulsion_T2_Mk3.cooldown=29.6654
Def.Module_WebPropulsion_T2_Epic.cooldown=29.6654
Def.Module_WebPropulsion_T2_Rel.cooldown=29.6654
Def.Module_WebPropulsion_T3_Mk1.cooldown=27.6654
Def.Module_WebPropulsion_T3_Mk2.cooldown=27.6654
Def.Module_WebPropulsion_T3_Prem.cooldown=27.6654
Def.Module_WebPropulsion_T3_Rare.cooldown=27.6654
Def.Module_WebPropulsion_T3_Mk3.cooldown=27.6654
Def.Module_WebPropulsion_T3_Epic.cooldown=27.6654
Def.Module_WebPropulsion_T3_Rel.cooldown=27.6654
Def.Module_WebPropulsion_T4_Mk1.cooldown=25.6654
Def.Module_WebPropulsion_T4_Mk2.cooldown=25.6654
Def.Module_WebPropulsion_T4_Prem.cooldown=25.6654
Def.Module_WebPropulsion_T4_Rare.cooldown=25.6654
Def.Module_WebPropulsion_T4_Mk3.cooldown=25.6654
Def.Module_WebPropulsion_T4_Epic.cooldown=25.6654
Def.Module_WebPropulsion_T4_Rel.cooldown=25.6654
Def.Module_WebPropulsion_T5_Mk1.cooldown=23.6654
Def.Module_WebPropulsion_T5_Mk2.cooldown=23.6654
Def.Module_WebPropulsion_T5_Prem.cooldown=23.6654
Def.Module_WebPropulsion_T5_Rare.cooldown=23.6654
Def.Module_WebPropulsion_T5_Mk3.cooldown=23.6654
Def.Module_WebPropulsion_T5_Epic.cooldown=23.6654
Def.Module_WebPropulsion_T5_Rel.cooldown=23.6654
Def.Module_WebPropulsion_T3_Set.cooldown=21.6654
]]

--Фазовый демодулятор
--За каждое взятие носителя в прицел, заряд щита дополнительно увеличивается на 996 ед за 6 сек
--[[
Spell.AoETaunt.additional_auras = 
{
	{
		target = ai.SpellTarget.CASTER,
		aura_target = ai.SpellTarget.HOLDER,
		mod_target =
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			--misc			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
		},
		mod_range = 200,
		mod_max	= 4,
		aura = ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
		duration = 6,
		aura_param = 166,
		period = 1,
		isBuff = true,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_ShieldedTaunt", },
		},
	},
}
]]
--Поляризатор покрытия, Система «Эгида»
--Сила модуля при активации увеличена на 30% (х1.3)
--[[
Spell.CommandShieldResist_T1_Mk1.aura_param=52.5
Spell.CommandShieldResist_T1_Mk2.aura_param=67.5
Spell.CommandShieldResist_T1_Prem.aura_param=75
Spell.CommandShieldResist_T1_Rare.aura_param=67.5
Spell.CommandShieldResist_T1_Mk3.aura_param=75
Spell.CommandShieldResist_T1_Epic.aura_param=82.5
Spell.CommandShieldResist_T1_Rel.aura_param=90
Spell.CommandShieldResist_T2_Mk1.aura_param=52.5
Spell.CommandShieldResist_T2_Mk2.aura_param=67.5
Spell.CommandShieldResist_T2_Prem.aura_param=75
Spell.CommandShieldResist_T2_Rare.aura_param=67.5
Spell.CommandShieldResist_T2_Mk3.aura_param=75
Spell.CommandShieldResist_T2_Epic.aura_param=82.5
Spell.CommandShieldResist_T2_Rel.aura_param=90
Spell.CommandShieldResist_T3_Mk1.aura_param=52.5
Spell.CommandShieldResist_T3_Mk2.aura_param=67.5
Spell.CommandShieldResist_T3_Prem.aura_param=75
Spell.CommandShieldResist_T3_Rare.aura_param=67.5
Spell.CommandShieldResist_T3_Mk3.aura_param=75
Spell.CommandShieldResist_T3_Epic.aura_param=82.5
Spell.CommandShieldResist_T3_Rel.aura_param=90
Spell.CommandShieldResist_T4_Mk1.aura_param=52.5
Spell.CommandShieldResist_T4_Mk2.aura_param=67.5
Spell.CommandShieldResist_T4_Prem.aura_param=75
Spell.CommandShieldResist_T4_Rare.aura_param=67.5
Spell.CommandShieldResist_T4_Mk3.aura_param=75
Spell.CommandShieldResist_T4_Epic.aura_param=82.5
Spell.CommandShieldResist_T4_Rel.aura_param=90
Spell.CommandShieldResist_T5_Mk1.aura_param=52.5
Spell.CommandShieldResist_T5_Mk2.aura_param=67.5
Spell.CommandShieldResist_T5_Prem.aura_param=75
Spell.CommandShieldResist_T5_Rare.aura_param=67.5
Spell.CommandShieldResist_T5_Mk3.aura_param=75
Spell.CommandShieldResist_T5_Epic.aura_param=82.5
Spell.CommandShieldResist_T5_Rel.aura_param=90
Spell.CommandShieldResist_T3_Set.aura_param=82.5
Spell.CommandArmorResist_T1_Mk1.aura_param=57
Spell.CommandArmorResist_T1_Mk2.aura_param=73.5
Spell.CommandArmorResist_T1_Prem.aura_param=82.5
Spell.CommandArmorResist_T1_Rare.aura_param=73.5
Spell.CommandArmorResist_T1_Mk3.aura_param=82.5
Spell.CommandArmorResist_T1_Epic.aura_param=90
Spell.CommandArmorResist_T1_Rel.aura_param=97.5
Spell.CommandArmorResist_T2_Mk1.aura_param=57
Spell.CommandArmorResist_T2_Mk2.aura_param=73.5
Spell.CommandArmorResist_T2_Prem.aura_param=82.5
Spell.CommandArmorResist_T2_Rare.aura_param=73.5
Spell.CommandArmorResist_T2_Mk3.aura_param=82.5
Spell.CommandArmorResist_T2_Epic.aura_param=90
Spell.CommandArmorResist_T2_Rel.aura_param=97.5
Spell.CommandArmorResist_T3_Mk1.aura_param=57
Spell.CommandArmorResist_T3_Mk2.aura_param=73.5
Spell.CommandArmorResist_T3_Prem.aura_param=82.5
Spell.CommandArmorResist_T3_Rare.aura_param=73.5
Spell.CommandArmorResist_T3_Mk3.aura_param=82.5
Spell.CommandArmorResist_T3_Epic.aura_param=90
Spell.CommandArmorResist_T3_Rel.aura_param=97.5
Spell.CommandArmorResist_T4_Mk1.aura_param=57
Spell.CommandArmorResist_T4_Mk2.aura_param=73.5
Spell.CommandArmorResist_T4_Prem.aura_param=82.5
Spell.CommandArmorResist_T4_Rare.aura_param=73.5
Spell.CommandArmorResist_T4_Mk3.aura_param=82.5
Spell.CommandArmorResist_T4_Epic.aura_param=90
Spell.CommandArmorResist_T4_Rel.aura_param=97.5
Spell.CommandArmorResist_T5_Mk1.aura_param=57
Spell.CommandArmorResist_T5_Mk2.aura_param=73.5
Spell.CommandArmorResist_T5_Prem.aura_param=82.5
Spell.CommandArmorResist_T5_Rare.aura_param=73.5
Spell.CommandArmorResist_T5_Mk3.aura_param=82.5
Spell.CommandArmorResist_T5_Epic.aura_param=90
Spell.CommandArmorResist_T5_Rel.aura_param=97.5
]]

--Резонирующий щит
--Урон увеличен на 35.13% (х1.3513514)
--[[
Spell.AfterShock_T2_Mk1.aura_param=720
Spell.AfterShock_T2_Rare.aura_param=760
Spell.AfterShock_T2_Mk3.aura_param=800
Spell.AfterShock_T2_Epic.aura_param=840
Spell.AfterShock_T2_Rel.aura_param=860
Spell.AfterShock_T3_Mk1.aura_param=800
Spell.AfterShock_T3_Rare.aura_param=840
Spell.AfterShock_T3_Mk3.aura_param=880
Spell.AfterShock_T3_Epic.aura_param=920
Spell.AfterShock_T3_Rel.aura_param=940
Spell.AfterShock_T4_Mk1.aura_param=860
Spell.AfterShock_T4_Rare.aura_param=900
Spell.AfterShock_T4_Mk3.aura_param=940
Spell.AfterShock_T4_Epic.aura_param=980
Spell.AfterShock_T4_Rel.aura_param=1000
Spell.AfterShock_T5_Mk1.aura_param=900
Spell.AfterShock_T5_Rare.aura_param=940
Spell.AfterShock_T5_Mk3.aura_param=980
Spell.AfterShock_T5_Epic.aura_param=1020
Spell.AfterShock_T5_Rel.aura_param=1040
]]

--Уловитель материи
--Радиус действия увеличен до 1250м
--[[
Def.Module_MatterAbsorber_T2_Mk1.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T2_Rare.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T2_Mk3.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T2_Epic.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T2_Rel.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T3_Mk1.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T3_Rare.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T3_Mk3.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T3_Epic.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T3_Rel.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T4_Mk1.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T4_Rare.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T4_Mk3.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T4_Epic.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T4_Rel.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T5_Mk1.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T5_Rare.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T5_Mk3.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T5_Epic.spell_on_death_trigger_range=125
Def.Module_MatterAbsorber_T5_Rel.spell_on_death_trigger_range=125
]]

--Кристалл возврата Tai'Kin
--Снижение манёвренности ослаблено на 100%
--Def.Module_Return.deactivate_spell=nil
--Время подготовки к прыжку снижено на 33% 
--[[
Def.Projectile_Return_7.teleport_preparation_time=1.7
Def.Projectile_Return_9.teleport_preparation_time=1.7
Def.Projectile_Return_11.teleport_preparation_time=1.7
Def.Projectile_Return_13.teleport_preparation_time=1.7
Def.Projectile_Return_15.teleport_preparation_time=1.7
]]

--Бустер «Конформист»
--Максимальное сопротивление снижено на 21.05%
--Spell.ShieldAdaptation.mod_max = 4

--Защитное ПО «Волна»
--При использовании, дополнительно запрещается использовать модули в течении 7 секунд
--Spell.TurningTide_Self.additional_auras[2].aura = ai.Aura.SILENCE

--Протокол «Раненый зверь»
--Порог увеличения параметров снижен с 50% до 35%
--Def.Module_PassiveOvercharge.max_health_percent = 0.35
--Скорость, маневренность, восстановление энергии, скорострельность +40%
--[[
Spell.TimeBoost_Wolfhound_Mk1.aura_param=0.185
Spell.TimeBoost_Wolfhound_Rare.aura_param=0.231
Spell.TimeBoost_Wolfhound_Mk3.aura_param=0.277
Spell.TimeBoost_Wolfhound_Epic.aura_param=0.323
Spell.TimeBoost_Wolfhound_Rel.aura_param=0.342
]]

--Микропеленгатор
--Перезарядка модуля ускорена на 15%
--[[
Def.Module_SpyBeacon_T1_Mk1.cooldown=49.3
Def.Module_SpyBeacon_T1_Mk2.cooldown=49.3
Def.Module_SpyBeacon_T1_Prem.cooldown=49.3
Def.Module_SpyBeacon_T1_Rare.cooldown=49.3
Def.Module_SpyBeacon_T1_Mk3.cooldown=49.3
Def.Module_SpyBeacon_T1_Epic.cooldown=49.3
Def.Module_SpyBeacon_T1_Rel.cooldown=49.3
Def.Module_SpyBeacon_T2_Mk1.cooldown=46.75
Def.Module_SpyBeacon_T2_Mk2.cooldown=46.75
Def.Module_SpyBeacon_T2_Prem.cooldown=46.75
Def.Module_SpyBeacon_T2_Rare.cooldown=46.75
Def.Module_SpyBeacon_T2_Mk3.cooldown=46.75
Def.Module_SpyBeacon_T2_Epic.cooldown=46.75
Def.Module_SpyBeacon_T2_Rel.cooldown=46.75
Def.Module_SpyBeacon_T3_Mk1.cooldown=44.2
Def.Module_SpyBeacon_T3_Mk2.cooldown=44.2
Def.Module_SpyBeacon_T3_Prem.cooldown=44.2
Def.Module_SpyBeacon_T3_Rare.cooldown=44.2
Def.Module_SpyBeacon_T3_Mk3.cooldown=44.2
Def.Module_SpyBeacon_T3_Epic.cooldown=44.2
Def.Module_SpyBeacon_T3_Rel.cooldown=44.2
Def.Module_SpyBeacon_T4_Mk1.cooldown=41.65
Def.Module_SpyBeacon_T4_Mk2.cooldown=41.65
Def.Module_SpyBeacon_T4_Prem.cooldown=41.65
Def.Module_SpyBeacon_T4_Rare.cooldown=41.65
Def.Module_SpyBeacon_T4_Mk3.cooldown=41.65
Def.Module_SpyBeacon_T4_Epic.cooldown=41.65
Def.Module_SpyBeacon_T4_Rel.cooldown=41.65
Def.Module_SpyBeacon_T5_Mk1.cooldown=39.1
Def.Module_SpyBeacon_T5_Mk2.cooldown=39.1
Def.Module_SpyBeacon_T5_Prem.cooldown=39.1
Def.Module_SpyBeacon_T5_Rare.cooldown=39.1
Def.Module_SpyBeacon_T5_Mk3.cooldown=39.1
Def.Module_SpyBeacon_T5_Epic.cooldown=39.1
Def.Module_SpyBeacon_T5_Rel.cooldown=39.1
Def.Module_SpyBeacon_T3_Set.cooldown=29.75
]]

--Проектор ремонта 4-8
--Ранги модуля изменёны на 4-7
--[[
Def.Module_MatterFlow_T2_Mk1.rank_max=7
Def.Module_MatterFlow_T2_Rare.rank_max=7
Def.Module_MatterFlow_T2_Mk3.rank_max=7
Def.Module_MatterFlow_T2_Epic.rank_max=7
Def.Module_MatterFlow_T2_Rel.rank_max=7
]]

--Кинетическая волна
--Ранги модуля изменёны на 7-9
--[[
Def.Module_StunningSpurt_T3_Mk1.rank_max=9
Def.Module_StunningSpurt_T3_Rare.rank_max=9
Def.Module_StunningSpurt_T3_Mk3.rank_max=9
Def.Module_StunningSpurt_T3_Epic.rank_max=9
Def.Module_StunningSpurt_T3_Rel.rank_max=9
]]

--Саботаж ремонтных систем
--Бонус скорости снижен до 17% (сейчас 35%).
--Spell.LossOfSignatures_Speed.aura_param=0.17
--Саботаж ремонтных систем снижен до 70% (сейчас 80%)
--[[
Spell.LossOfSignatures_HealBan_T3_Mk1.aura_param=0.6
Spell.LossOfSignatures_HealBan_T3_Rare.aura_param=1.4
Spell.LossOfSignatures_HealBan_T3_Mk3.aura_param=1.8
Spell.LossOfSignatures_HealBan_T3_Epic.aura_param=2.4
Spell.LossOfSignatures_HealBan_T3_Rel.aura_param=3.15
Spell.LossOfSignatures_HealBan_T4_Mk1.aura_param=0.6
Spell.LossOfSignatures_HealBan_T4_Rare.aura_param=1.4
Spell.LossOfSignatures_HealBan_T4_Mk3.aura_param=1.8
Spell.LossOfSignatures_HealBan_T4_Epic.aura_param=2.4
Spell.LossOfSignatures_HealBan_T4_Rel.aura_param=3.15
Spell.LossOfSignatures_HealBan_T5_Mk1.aura_param=0.6
Spell.LossOfSignatures_HealBan_T5_Rare.aura_param=1.4
Spell.LossOfSignatures_HealBan_T5_Mk3.aura_param=1.8
Spell.LossOfSignatures_HealBan_T5_Epic.aura_param=2.4
Spell.LossOfSignatures_HealBan_T5_Rel.aura_param=3.15
]]
--Снимает с игрока воздействия контроля, но не мешает наложить новые.
--Spell.LossOfSignatures.spells={ 'LossOfSignatures_Speed','LossOfSignatures_DebuffImmunStart'}

--Аварийный прыжок
--Запрещает прыжки, телепортацию, варпы на 20 секунд
--[[
Spell.Spell_EmergencyJump.additional_auras =
{
	{
		aura				= ai.Aura.DISABLE_WARP,
		target 				= ai.SpellTarget.CASTER,
		duration			= 20,
		gameplay_specific	= true,
		
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_EmergencyJump", },
		},
	},
}
]]

--Прыжковые кристаллы
--Урон от использования спецмодуля увеличен. (+35%)
--[[
Def.Module_CrystalJumpSeries_5.hull_cost=180
Def.Module_CrystalJumpSeries_7.hull_cost=200
Def.Module_CrystalJumpSeries_9.hull_cost=220
Def.Module_CrystalJumpSeries_11.hull_cost=240
Def.Module_CrystalJumpSeries_13.hull_cost=265
Def.Module_CrystalJumpSeries_15.hull_cost=290
]]

--#################### ИМПЛАНТЫ ####################--

--Альфа-ингибитор “SP-25” (5-3)
--Сила импланта увеличена на 233% (новое значение - 10%)
--Talent.TALENT_MAX_SPEED.param1 = 0.1

--Нейроускоритель “Oculus II” (11-1)
--Снижение резистов усилено на 25% (новое значение - 10 ед.)
--Talent.TALENT_WEAPON_PENETRATION.param1 = 10

--Нейроконнектор “WPN-F70” (13-3)
--Максимальный эффект импланта усилен на 50% (новое значение - 15%)
--Шаг наложения эффекта усилен на 50% (новое значение - 1.5%)
--[[
Spell.Talent_KillToMinorDamage_Mk1.aura_param = 0.015
Spell.Talent_KillToMinorDamage_Mk2.aura_param = 0.030
Spell.Talent_KillToMinorDamage_Mk3.aura_param = 0.045
Spell.Talent_KillToMinorDamage_Mk4.aura_param = 0.060
Spell.Talent_KillToMinorDamage_Mk5.aura_param = 0.075
Spell.Talent_KillToMinorDamage_Mk6.aura_param = 0.090
Spell.Talent_KillToMinorDamage_Mk7.aura_param = 0.105
Spell.Talent_KillToMinorDamage_Mk8.aura_param = 0.120
Spell.Talent_KillToMinorDamage_Mk9.aura_param = 0.135
Spell.Talent_KillToMinorDamage_Mk10.aura_param = 0.150
]]

--#################### ИГРОВЫЕ РЕЖИМЫ ####################--

--Автоматические турниры
--Время боя увеличено до 12 минут
--GameplayDef[ai.Gameplay.CAPTURE_THE_BASE].game_duration_tournament=12*60
--GameplayDef[ai.Gameplay.CAPTURE_THE_BASE_2].game_duration_tournament=12*60

--#################### КОРАБЛИ ####################--

--Wolfhound
--Запас щитов уменьшен на 15%
--Def.Ship_Race3_M_T5_Wolfhound.shield_max=5525

--Sawtooth
--Уменьшить бонус к урону основных орудий с 20% до 10%
--Def.Ship_Race2_M_T4_Pirate.damage_mul=0.1
--Уменьшить бонус к дальность модулей заграждения с 50% до 35%.
--ShipSpecBonus.SAWTOOTH.spell_propulsion_jam_range_mul = 0.35

Def.Ship_Preset_R1_L_T1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R1_L_T1_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R1_L_T1_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R1_L_T1_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R1_L_T2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R1_L_T2_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R1_L_T2_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R1_L_T2_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R1_L_T3.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R1_L_T3_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R1_L_T3_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R1_L_T3_Pirate.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R1_L_T3_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R1_L_T4.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R1_L_T4_CraftUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R1_L_T4_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R1_L_T4_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R1_L_T4_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R1_L_T4_PremUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R1_L_T5.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R1_L_T5_Craft.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R1_L_T5_CraftUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R1_L_T5_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R1_L_T5_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R1_L_T5_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R1_L_T5_PremUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R2_L_T1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R2_L_T1_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R2_L_T1_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R2_L_T1_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R2_L_T1_PremiumCraft.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R2_L_T2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R2_L_T2_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R2_L_T2_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R2_L_T2_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R2_L_T2_Steam.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R2_L_T3.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R2_L_T3_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R2_L_T3_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R2_L_T3_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R2_L_T4.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R2_L_T4_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R2_L_T4_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R2_L_T4_Pirate.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R2_L_T4_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R2_L_T5.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Craft.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Francisca.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R2_L_T5_Steam.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R3_L_T1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R3_L_T1_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R3_L_T1_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R3_L_T1_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"
Def.Ship_Preset_R3_L_T2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T2_Mk1"
Def.Ship_Preset_R3_L_T2_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R3_L_T2_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R3_L_T2_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R3_L_T3.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T3_Mk1"
Def.Ship_Preset_R3_L_T3_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R3_L_T3_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R3_L_T3_Pirate.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R3_L_T3_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R3_L_T3_PremUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T3_Mk1"
Def.Ship_Preset_R3_L_T4.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R3_L_T4_CraftUniq.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R3_L_T4_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R3_L_T4_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T4_Mk1"
Def.Ship_Preset_R3_L_T4_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T4_Mk1"
Def.Ship_Preset_R3_L_T5.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R3_L_T5_Comodo.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R3_L_T5_Craft.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R3_L_T5_Faction1.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R3_L_T5_Faction2.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T5_Mk1"
Def.Ship_Preset_R3_L_T5_Premium.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_Plasmagun_Sniper_T5_Mk1"
Def.Ship_Preset_R5_L_ENGINEER_Rank5.default_modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]="Weapon_RailVolcano_T2_Mk1"