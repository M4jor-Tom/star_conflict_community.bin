--Этот комментарий чтобы не плодить в описаниях сущностей копии единиц измерения и параметров
-- Единицы измерения в магазине:
--	units	Измеряем ХП и Дамаг
--	sec  	Время
--	MV   	Потребляемая мощность
--	m   		расстояние, метры
--	percent	проценты - мультипликатор параметра.
--	ShPM		выстрелов в минуту

-- Параметры в магазине: уникальная минииконка и тултип
--	time 	Время работы модуля	( sec )
--	recharge 	Время перезарядки модуля 	( sec )
--	plus 	Восстанавливаем какой-то параметр навсегда 
--	minus 	Уменьшаем параметр
--	plus_mul	Мультипликатор восстановления
--	max_mul	Увеличение максимума
--	energy_cost	Стоимость одной активации 	( MV )
--	energy_cost_mul	мультипликатор энергопотребления 	( percent )
--	energyPerSecond	Стоимость в секунду 	( MV )
--	damage_thermal	повреждения 	( units )
--	damage_kinetic	повреждения 	( units )
--	damage_emp	повреждения 	( units )
--	damage_mul	мультипликатор повреждений 	( percent )
--	radius	радиус работы модуля	( m )
--	radius_mul	мультипликатор радиус работы 	( percent )
--	projectile_speed_mul	мультипликатор скорости полета частиц 	( percent )
--	fire_rate	темп стрельбы (ShPS)
--	resist_thermal	защита от термических повреждений 	( units )
--	resist_kinetic	защита от кинетических повреждений 	( units )
--	resist_emp	защита от ЭМИ повреждений 	( units )


--Дерево магазина
StoreInfo =
{
    categories =
    {
        {
            name = "WEAPONS",
            moduleType = ai.ModuleType.WEAPON,
            subCategories =
            {
                { name = "LASERS", },
                { name = "RAIL_GUNS", },
                { name = "PLASMA_GUNS", },
            },
            equipment = true,
        },
        {
            name = "WEAPON_MOD",
            moduleType = ai.ModuleType.WEAPON_MOD,
            subCategories =
            {
                { name = "LASER_MOD", },
                { name = "RAIL_MOD", },
                { name = "PLASMA_MOD", },
            },
            equipment = true,
            sellOnly = true,
        },
        {
            name = "SECONDRY_WEAPON",
            moduleType = ai.ModuleType.ROCKET,
            subCategories =
            {
                { name = "AIMED_MISSILES", },
                { name = "MISSILES", },
                { name = "OTHERS", },
            },
            equipment = true,
            sellOnly = true,
        },
        {
            name = "ACTIVE_MODULES",
            moduleType = ai.ModuleType.ACTIVE,
            subCategories =
            {
                { name = "ACTIVE_SURVIVAL", },
                { name = "ACTIVE_SCOUT", },
                { name = "ACTIVE_ECM", },
                { name = "ACTIVE_RECON", },
                { name = "ACTIVE_TACKLER", },
                { name = "ACTIVE_COMMANDER", },
                { name = "ACTIVE_ATTACK", },
                { name = "ACTIVE_ENGINEER", },
                { name = "ACTIVE_GUARD", },
                { name = "ACTIVE_SNIPER", },
                { name = "ACTIVE_OVERSEER", },
            },
            equipment = true,
        },
        {
            name = "SHIP_MOD",
            subCategories =
            {
                { name = "HULL_MOD", moduleType = ai.ModuleType.ARMOR_MOD },
                { name = "SHIELD_MOD", moduleType = ai.ModuleType.SHIELD_MOD },
                { name = "ENGINE_MOD", moduleType = ai.ModuleType.ENGINE_MOD },
                { name = "CAPACITOR_MOD", moduleType = ai.ModuleType.CAPACITOR_MOD },
                { name = "COMP_MOD", moduleType = ai.ModuleType.CPU_MOD },
            },
            equipment = true,
        },
        {
            name = "AUTOGEN",
            --equipment = true,
            sellOnly = true,
        },
        {
            name = "TOKEN",
            subCategories =
            {
                { name = "RARE" },
                { name = "EPIC" },
            },
            sellOnly = true,
        }, 
        {
            name = "CRAFT",
            subCategories =
            {
                { name = "RESOURCE_T0", sellOnly = true, },
                { name = "RESOURCE_T1", sellOnly = true, },
                { name = "RESOURCE_OLD", sellOnly = true, },
                { name = "SHIP_PARTS", sellOnly = true, },
            },
            sellOnly = true,
        },
    }
}


-- вспомогательный массив, используемый для сортировки товаров
StoreInfo.categoryName2Idx = {}

function StoreInfo:MakeCategoryName2Idx()

    self.categoryName2Idx = {}

    for mainIdx, mainInfo in pairs( StoreInfo.categories ) do

        local mainIdxInfo = { idx = mainIdx, sub = {} }
        self.categoryName2Idx[ mainInfo.name ] = mainIdxInfo

        if mainInfo.subCategories then
            for subIdx, subInfo in pairs( mainInfo.subCategories ) do
                mainIdxInfo.sub[ subInfo.name ] = subIdx
            end
        end
    end
end



StoreInfo:MakeCategoryName2Idx()
