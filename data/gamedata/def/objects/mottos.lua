--
local MottosStoreItemIdCounter = 120000
local function Mottos_GetNextStoreItemId()
	MottosStoreItemIdCounter = MottosStoreItemIdCounter + 1
	return MottosStoreItemIdCounter
end
--
Def.MottoBase = 
{
	in_editor		= false,
	is_motto		= true,
	stacks			= false,
	shopCategory	= "OFFICE",
	shopSubCategory	= "MOTTO",
}

Def.Taunt_Custom = 
{
	inherit				= "MottoBase",
	premiumPrice		= 50,
	storeItemId			= Mottos_GetNextStoreItemId(),
	depends_on_uid 		= true,
	stringPrefix 		= "user_custom_motto_"
}

for i = 1, 74 do -- в принципе можно расширять при необходимости
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 75, 86 do -- #0109936: Battle Pass. Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 87, 102 do -- SC-113075 Баттлпасс лето 2020
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 103, 114 do -- SC-114427 Новогодний баттлпасс 2021
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 115, 126 do -- SC-114427 Летний баттлпасс 2021
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 127, 138 do -- Новогодний баттлпасс 2021-2022
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 139, 148 do -- SC-115938 Уникальные насмешки для СТ
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 149, 160 do -- SC-116210 Баттлпасс весна 2022
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 161, 164 do -- SC-115986 Колаб с Пикабу 12 апреля. Три насмешки от Пикабу + запасная
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 165, 178 do -- SC-116462 Баттлпасс лето 2022
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 179, 183 do -- SC-116432 Награды к Приключению "Черная эстафета"
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 184, 197 do -- SC-116816 Контент Боевой пропуск осень 2022 / Battlepass autumn 2022 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 198, 216 do -- SC-116895 Контент для наборов за голду и для БЗС / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 217, 230 do -- SC-117102 Контент Боевой пропуск зима 2022-23 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 231, 233 do -- SC-117283 Насмешки для DLC перезапуск Dragonfly
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 234, 237 do -- SC-117304 Контент Боевой пропуск весна 2023 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 241, 250 do -- SC-117304 Контент Боевой пропуск весна 2023 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 238, 240 do -- SC-117350 DLC Star Conflict: Wasp. Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 251, 262 do -- SC-117790 Контент Боевой пропуск лето 2023 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 263, 274 do -- SC-117664 насмешки за участие в турнирах "Уютного Уголка"
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 275, 278 do -- SC-118135 Контент Боевой пропуск осень 2023 / Насмешки
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 279, 282 do -- SC-118458 Насмешки. Боевой пропуск "Секреты предтечей. Первая фаза": BP14_1 / NY24_1 Зима 2023-2024.
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 283, 286 do -- SC-118723 Насмешки. Боевой пропуск "Скачок в бездну. Первая/Вторая фаза": BP15_1(2) / SPR15_1(2). Весна 2024.
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 287, 292 do -- SC-118861 насмешки и звания, которые будут доступны в качестве наград за турниры Уютного Уголка.
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 293, 296 do -- SC-118977 Насмешки. Боевой пропуск "Неведомые горизонты. Первая/Вторая фаза": BP16_1(2) / SUM24_1(2).
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 297, 300 do -- SC-118977 Насмешки. Боевой пропуск "Неведомые горизонты. Первая/Вторая фаза": BP16_1(2) / SUM24_1(2).
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 301, 302 do -- SC-119246 Турнирные насмешки в патч 1.12.9. 
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 303, 306 do -- SC-119416 Насмешки. Боевой пропуск "Забытые звезды". BP18_1(2) / NY25_1(2). Зима 2025. Первая/Вторая фаза"
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 307, 309 do -- SC-119485 Турнирные насмешки в патч 1.13.0а 
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 310, 313 do -- SC-119416 Насмешки. Боевой пропуск "Забытые звезды". BP18_1(2) / NY25_1(2). Зима 2025. Первая/Вторая фаза"
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 314, 317 do -- SC-119796 Звания и насмешки 1.13.7 БП "Предания древних". BP20_1(2) - SUM25_1(2) + ИП "Сезон штормов" EP20_3 - SUM25_3. Лето 2025
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 318, 331 do -- SC-119885 Конкурс насмешек в дискорде
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 332, 335 do -- SC-120020 Звания и насмешки 1.13.10 БП "Опустошенные миры". BP21_1(2) - AUT25_1(2) + ИП "Сезон штормов" EP21_3 - AUT25_3. Осень 2025
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

Def.Taunt_336 = 
{
	inherit				= "MottoBase",
    cant_be_bought  = true,	
	premiumPrice		= 500,
	storeItemId			= Mottos_GetNextStoreItemId(),
	stringId 			= "killmessage_336"
}

for i = 337, 340 do -- SC-120195 Звания и насмешки 1.13.13 (1.14.0) БП "Перекрёсток галактик". BP22_1(2) - NY26_1(2) + ИП "Утраченные созвездия" EP22_3 - NY26_3. Зима 2025 - 26
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 341, 344 do -- SC-120401 Звания и насмешки 1.14.05: БП "Раскол альянсов". BP22_1(2) - SPR26_1(2) + ИП "Кровь Фронтира" EP23_3 - SPR26_3. Весна 2026.
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end

for i = 345, 348 do -- SC-120503 Звания и насмешки 1.14.10: БП "Наследие предтеч". BP24_1(2) - SUM26_1(2) + ИП "Осколки Эдема" EP24_3 - SUM26_3. Лето 2026. 
    Def[ "Taunt_" .. i ] = {
        inherit         = "MottoBase",
        cant_be_bought  = true,
        premiumPrice    = 500,
        storeItemId     = Mottos_GetNextStoreItemId(),
        stringId        = "killmessage_"..i,
    }
end