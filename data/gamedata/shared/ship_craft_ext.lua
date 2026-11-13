-- настройки крафтов кораблей
local SpecialModulesVariants = {}
--обычный блекаут генератор.  Стан Действует дальше, но меньшее время,   Неуязвимость действует дольше на 2 сек стан короче.
SpecialModulesVariants[ ai.ShipRoles.ECM ]  		= { "Module_BlackoutGenerator_T5_Base", "Module_BlackoutGenerator_T5_Faction1", "Module_BlackoutGenerator_T5_Faction2" }
--обычная сеть.   сеть слабже на 10% но уменьшает весь хил в 2 раза. сеть ввисит дольше на 2 тика
SpecialModulesVariants[ ai.ShipRoles.RECON ]  		= { "Module_PlasmaWeb_T5_Base", "Module_PlasmaWeb_T5_Faction1", "Module_PlasmaWeb_T5_Faction2" }
-- обычный отварп. --меньше время подготовки но больше кд. --сбивает всем лок в радиусе, но больше кд
SpecialModulesVariants[ ai.ShipRoles.SCOUT ]  		= { "Module_MicroWarp_Basic_T5_Mk1", "Module_MicroWarp_Basic_T5_Mk2", "Module_MicroWarp_Basic_T5_Mk3" } 



-- обычная клока. --12 сек невидимость (-1/3). но перезарядка 35  --нельзя выбить из клоки повреждениями, но перезарядка немного дольше
SpecialModulesVariants[ ai.ShipRoles.TACKLER ]  	= { "Module_CloakingDevice_Basic_T5_Mk1", "Module_CloakingDevice_Basic_T5_Mk2", "Module_CloakingDevice_Basic_T5_Mk3" }
--Обычный моуль. на 6 сек больше перезарядка + 30 ресистов всего. +6 сек перезарядки + вывод из любого контроля
SpecialModulesVariants[ ai.ShipRoles.ATTACK ]  		= { "Module_TimeBoost_T5_Base", "Module_TimeBoost_T5_Faction1", "Module_TimeBoost_T5_Faction2" }
--Обычный моуль.  10 (-5)секунд, но урон уменьшается в 10(+2) раз.   10 (-5)секунд, но перезарядка быстрее на 10 секунд.
SpecialModulesVariants[ ai.ShipRoles.COMMAND ]  	= { "Module_EnergyShieldCommander_T5_Base", "Module_EnergyShieldCommander_T5_Faction1", "Module_EnergyShieldCommander_T5_Faction2" }

-- повышеный хил (х2)  -- 3 дрона вместо 2, немного быстрее восстановление дронов(35 - 25)  --повышенное ХП дронов, позволяет выдержать 1 ракету (206 - 3500) + активация дронов "лечит" сильнее  (4300 - 6500 (х1.5))
SpecialModulesVariants[ ai.ShipRoles.ENGINEER ]		= { "Module_FrigateDrone_T5_Base", "Module_FrigateDrone_T5_Faction1", "Module_FrigateDrone_T5_Faction2" }
-- обычный фазовый щит,  -20 ресиста +5% повреждений при поглощении повреждений,  -20 ресиста 15% принятого урона идут на восстановление корпуса.
SpecialModulesVariants[ ai.ShipRoles.GUARD ]  		= { "Module_PhaseShield_T5_Base", "Module_PhaseShield_T5_Faction1", "Module_PhaseShield_T5_Faction2" }
--обычная диза --обычная торпеда -- диза дамаг х.85 + 4 тика по 200 энергобурна.
SpecialModulesVariants[ ai.ShipRoles.SNIPER ]  		= { "Module_Disintegrator_T5_Faction1", "Module_GuidedMissile_T5_Base", "Module_Disintegrator_T5_Faction2" }

SpecialModulesVariants[ ai.ShipRoles.OVERSEER ]  		= { "Module_EnergyReroute", "Module_EnergyReroute_FWeapon", "Module_EnergyReroute_FEngine" }

local slots_cost = {
--  для перехвата надо много шилда и СПУ, чить больше двигателя и капаситора, совсем мало корпуса.
	[ ai.ShipClass.SMALL ] = {
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 	= { resource = "ship_part_craft_shield", amount = 2 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ] 	= { resource = "ship_part_craft_shield", amount = 3 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ] 	= { resource = "ship_part_craft_shield", amount = 4 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	= { resource = "ship_part_craft_armor", amount = 1 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	= { resource = "ship_part_craft_armor", amount = 1 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	= { resource = "ship_part_craft_armor", amount = 2 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	= { resource = "ship_part_craft_engine", amount = 1 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ] 	= { resource = "ship_part_craft_engine", amount = 3 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ] 	= { resource = "ship_part_craft_engine", amount = 3 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= { resource = "ship_part_craft_capacitor", amount = 1 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= { resource = "ship_part_craft_capacitor", amount = 3 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= { resource = "ship_part_craft_capacitor", amount = 3 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= { resource = "ship_part_craft_cpu", amount = 2 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]		= { resource = "ship_part_craft_cpu", amount = 3 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]		= { resource = "ship_part_craft_cpu", amount = 4 },
	},
--  для штурма надо много армора и капаситора
	[ ai.ShipClass.MEDIUM ] = {
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 	= { resource = "ship_part_craft_shield", amount = 1 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ] 	= { resource = "ship_part_craft_shield", amount = 2 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ] 	= { resource = "ship_part_craft_shield", amount = 3 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	= { resource = "ship_part_craft_armor", amount = 2 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	= { resource = "ship_part_craft_armor", amount = 3 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	= { resource = "ship_part_craft_armor", amount = 4 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	= { resource = "ship_part_craft_engine", amount = 1 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ] 	= { resource = "ship_part_craft_engine", amount = 2 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ] 	= { resource = "ship_part_craft_engine", amount = 3 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= { resource = "ship_part_craft_capacitor", amount = 2 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= { resource = "ship_part_craft_capacitor", amount = 3 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= { resource = "ship_part_craft_capacitor", amount = 4 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= { resource = "ship_part_craft_cpu", amount = 1 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]		= { resource = "ship_part_craft_cpu", amount = 2 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]		= { resource = "ship_part_craft_cpu", amount = 3 },
	},
--  для фрегата надо много армора и корпуса
	[ ai.ShipClass.LARGE ] = {
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 	= { resource = "ship_part_craft_shield", amount = 1 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ] 	= { resource = "ship_part_craft_shield", amount = 2 },
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ] 	= { resource = "ship_part_craft_shield", amount = 3 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	= { resource = "ship_part_craft_armor", amount = 2 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	= { resource = "ship_part_craft_armor", amount = 3 },
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	= { resource = "ship_part_craft_armor", amount = 4 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	= { resource = "ship_part_craft_engine", amount = 1 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ] 	= { resource = "ship_part_craft_engine", amount = 2 },
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ] 	= { resource = "ship_part_craft_engine", amount = 3 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= { resource = "ship_part_craft_capacitor", amount = 1 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= { resource = "ship_part_craft_capacitor", amount = 2 },
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= { resource = "ship_part_craft_capacitor", amount = 3 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= { resource = "ship_part_craft_cpu", amount = 1 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]		= { resource = "ship_part_craft_cpu", amount = 2 },
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]		= { resource = "ship_part_craft_cpu", amount = 3 },
	},	
}

--for i, ship in pairs( Def ) do 		
local test_craft_ships = { "Ship_Race1_S_T5_Craft", "Ship_Race1_M_T5_Craft", "Ship_Race1_L_T5_Craft", "Ship_Race2_S_T5_Craft", "Ship_Race2_M_T5_Craft", "Ship_Race2_L_T5_Craft", "Ship_Race3_S_T5_Craft", "Ship_Race3_M_T5_Craft", "Ship_Race3_L_T5_Craft" }
for i, s in pairs( test_craft_ships ) do 		
	local ship = Def[s]
	--if ship.class == "SpaceShip" then -- and ship.craftable and ship.ship_class and ship.role then
	if ship and ship.craftable and ship.ship_class and ship.role then
		ship.craft_resource 			= "ship_part_craft_base" --основной ресурс и его количество
		if 		ship.ship_class == ai.ShipClass.LARGE then
			ship.craft_resource_amount	= 5
		elseif 	ship.ship_class == ai.ShipClass.MEDIUM then
			ship.craft_resource_amount	= 3
		else 
			ship.craft_resource_amount	= 2
		end
		if slots_cost[ ship.ship_class ] then
			ship.craftable_slots 		= slots_cost[ ship.ship_class ] -- ссылка на необходимые ресурсы по пассивным слотам
		end		
		if SpecialModulesVariants[ ship.role ] then
			ship.SpecialModulesVariants 	= SpecialModulesVariants[ ship.role ] --ссылка на варианты спец модулей для данной роли
		end
	end
end
