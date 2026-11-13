-- Workfile: Credits.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: credits.lua 7049 2011-03-15 11:10:33Z $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.Credits = {}

-- -------------------------------------------
-- настройки кредитсов
-- -------------------------------------------

UI.Credits.styles =
{
	HEADER_LARGE		= 1,
	HEADER_MEDIUM		= 2,
	SIMPLE_MEDIUM		= 3,
	SIMPLE_SMALL		= 4,
}

UI.Credits.styleInfo = 
{
	[ UI.Credits.styles.HEADER_LARGE ] =
	{
		font		= UI:GetFontPattern( "Large" ),
		color		= 0xffffdeb4,
		blend		= "ALPHA",
	},

	[ UI.Credits.styles.HEADER_MEDIUM ] =
	{
		font		= UI:GetFontPattern( "Medium" ),
		color		= 0xffffdeb4,
		blend		= "ALPHA",
	},

	[ UI.Credits.styles.SIMPLE_MEDIUM ] =
	{
		font		= UI:GetFontPattern( "Medium" ),
		color		= 0xffffffff,
		blend		= "ALPHA",
	},

	[ UI.Credits.styles.SIMPLE_SMALL ] =
	{
		font		= UI:GetFontPattern( "VerySmall" ),
		color		= 0xffffffff,
		blend		= "ALPHA",
	},
} 

UI.Credits.scrollSpeed		= UI:YTo1024x768( 70, { x = 1280, y = 720 } )	-- скорость скроллирования (пикс/сек)
UI.Credits.space			= UI:YTo1024x768( 30, { x = 1280, y = 720 } )	-- единичный интервал расстояния между записями (пикс)

-- -------------------------------------------
-- кредитсы
-- -------------------------------------------

--[[
формат записи:

{ text = <string>, style = <UI.Credits.styles> }
	или
{ image = <string>, scale = <number>(опционально, по умолчанию 1), blend = "ALPHA"|COLOR"(опционально, по умолчанию "ALPHA") }
	или
{ space = <number>(количество пустых интервалов; размер одного интервала см в UI.Credits.space ) ) }

]]


UI.Credits.records =
{
	{ text = "stargem",				style = UI.Credits.styles.HEADER_LARGE },	-- Star Gem Inc.
	{ space = 2 },
	{ text = "credits_producer",	style = UI.Credits.styles.HEADER_MEDIUM },  -- Продюсер
	{ text = "credits_01",			style = UI.Credits.styles.SIMPLE_MEDIUM },	-- Станислав Скорб
	{ space = 1 },
	{ text = "credits_manager",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Менеджеры проекта
	{ text = "credits_02",			style = UI.Credits.styles.SIMPLE_MEDIUM },	-- Николай Селезнев
	{ text = "credits_03",			style = UI.Credits.styles.SIMPLE_MEDIUM },  -- Алексей Целищев
	{ space = 1 },
	{ text = "credits_CTO", 		style = UI.Credits.styles.HEADER_MEDIUM },	-- Технический директор
	{ text = "credits_38",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Алексей Скрябин
	{ space = 1 },
	-- { text = "credits_DesignLead",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Главный дизайнер
	-- --Убирал подраздел в связи с переносом Александра Абрамова в "Особую благодарность" тикетом SC-112392
	-- { space = 1 },
	{ space = 1 },
	{ text = "credits_Designers",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Дизайнеры
	{ text = "credits_20",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Андрей Каторгин
	{ text = "credits_05",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Антонов
	{ text = "credits_55",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Алексей Виноградов
	{ text = "credits_138",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Речкалов Алексей
	{ text = "credits_139",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Антом Мищенко
	{ text = "credits_145",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Константин Екимовских
	{ text = "credits_120",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Максим PrimeTerr Захаров
	{ text = "credits_148",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Андрей Беляев	
	
	{ space = 1 },
	{ text = "credits_Programmers",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Программисты
	{ text = "credits_95",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Николай Бравилов
	{ text = "credits_23",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Дмитрий Коршунов
	{ text = "credits_70",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Дмитрий Есарев
	{ text = "credits_106",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Максим Лящов
	{ text = "credits_141",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Иван Галиханов
	{ space = 1 },
	{ text = "credits_Art",			style = UI.Credits.styles.HEADER_MEDIUM },	-- Художники
	{ text = "credits_40",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Иван Снигирев
	{ text = "credits_123",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Дмитрий Соковнин
	{ text = "credits_60",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Артем Баянкин
	{ text = "credits_30",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей Митряев
	{ text = "credits_74",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Мария Лаптева
	{ text = "credits_136",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Чеклецов Константин
	{ text = "credits_149",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Ксения Устинова
	{ text = "credits_150",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Илья Сычев
	{ space = 1 },
	{ text = "credits_Sound",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Звукорежиссер
	{ text = "credits_37",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Samoiloff
	{ space = 1 },
	{ text = "credits_OS_Voice_c3",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Озвучание
	{ text = "credits_44",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Антон Худяков
	{ text = "credits_51",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Юлия Оводова
	{ text = "credits_37",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Samoiloff
	{ text = "credits_54",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Медведев
	{ text = "credits_29",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей «Skan» Маханьков
	{ space = 1 },
	{ text = "credits_Editor",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Тексты и локализация
	{ text = "credits_06",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Алексей Байдало
	{ text = "credits_outSrc_01",	style = UI.Credits.styles.SIMPLE_SMALL },   -- 
	{ text = "credits_32",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Евгений Нестеров
	{ text = "credits_63",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Никита Кончин
	{ text = "credits_53",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Попов
	{ text = "credits_24",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Елена «ashley» Кругликова
	{ text = "credits_29",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей «Skan» Маханьков
	{ text = "credits_64",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Мищенко
	{ text = "credits_99",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Ксения Дорогавцева
	{ text = "credits_144",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александр Попов
	{ space = 1 },
	{ text = "credits_Support",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Техническая поддержка
	{ text = "credits_41",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Константин Соколов
	{ space = 1 },
	{ text = "credits_PR",		 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Связи с общественностью
	{ text = "credits_79",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Станислав Смирнов
	{ text = "credits_137",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Мищенко Владислав
	{ space = 1 },
	{ text = "credits_CommLead", 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Комьюнити-менеджер
	{ text = "credits_62",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Павел Самарин
	{ text = "credits_134",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Агеева Анастасия
	{ text = "credits_140",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александр Март
	{ text = "credits_142",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Алексей «Shedi» Иорданский
	{ text = "credits_146",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Феликс  «Flikz» Гарибов 
	{ text = "credits_147",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Сергей Вербовчук 
	{ space = 1 },
	{ text = "credits_QA",		 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Обеспечение качества
	{ text = "credits_12",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Мария Глухова
	{ text = "credits_53",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Попов
	{ text = "credits_98",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Андрей Грабежев
	{ text = "credits_120",			style = UI.Credits.styles.SIMPLE_SMALL },	-- PrimeTerr 
	{ text = "credits_135",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Бакунин Александр
	{ text = "credits_143",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Юрий Глазков
	{ text = "credits_151",			style = UI.Credits.styles.SIMPLE_SMALL },	-- KEEREN
	{ space = 1 },
	{ text = "credits_OfficeManager", style = UI.Credits.styles.HEADER_MEDIUM },--Офис-менеджер
	{ text = "credits_96",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Елена Волкова
	{ space = 1 },
	{ text = "credits_Special",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Особая благодарность
	-- действующие сотрудники
	{ text = "credits_07",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Дмитрий Балтин
	{ text = "credits_08",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Иван Бизяев
	{ text = "credits_09",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Марина Бушкова
	{ text = "credits_10",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Евгений Бушуев
	{ text = "credits_17",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Григорий Иванов
	{ text = "credits_19",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Ищук
	{ text = "credits_21",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Клевакин
	{ text = "credits_24",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Елена «ashley» Кругликова
	{ text = "credits_25",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Михаил Кузнецов
	{ text = "credits_26",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Луканин
	{ text = "credits_27",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Макухин
	{ text = "credits_28",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Маргушин
	{ text = "credits_29",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей «Skan» Маханьков
	{ text = "credits_32",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Евгений Нестеров
	{ text = "credits_35",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Ольга Прохорова
	{ text = "credits_36",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Речкин
	{ text = "credits_39",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Борис Смирнов
	{ text = "credits_43",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Егор Тиганов
	{ text = "credits_44",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Худяков
	{ text = "credits_45",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Алексей Честных
	{ text = "credits_48",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей Шеломенцев
	{ text = "credits_57",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Богослов
	{ text = "credits_64",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Мищенко
	{ text = "credits_67",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Артем Барышев
	{ text = "credits_72",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Козин
	{ text = "credits_77",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Сергей Савкин
	{ text = "credits_80",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Иван Суханов
	{ text = "credits_81",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Владислав Сухов
	{ text = "credits_83",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Уваров
	{ text = "credits_87",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Сергей Глушков
	{ text = "credits_89",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Арсен Мартиросян
	{ text = "credits_91",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Андрей Пургин
	{ text = "credits_92",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Григорий Сидорук	
	{ text = "credits_94",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Глеб Багняк
	{ text = "credits_97",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Олеся Гилёва
	{ text = "credits_100",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Иван Загидулин
	{ text = "credits_101",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Юрий Заикин
	{ text = "credits_102",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Анастасия Комарова
	{ text = "credits_104",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Игорь Кушнарев
	{ text = "credits_107",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Игорь Маренин
	{ text = "credits_108",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Игорь Маринкин
	{ text = "credits_109",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Тарас Марченко
	{ text = "credits_110",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Борис Мелехин
	{ text = "credits_111",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Валерий Мелехин
	{ text = "credits_113",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Анна Павленко
	{ text = "credits_114",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Сергей Паламарчук
	{ text = "credits_115",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Николай Пантелеев
	{ text = "credits_116",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Екатерина Печерских
	{ text = "credits_117",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александр Плюснин
	{ text = "credits_118",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Роман Решетников
	{ text = "credits_119",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Евгений Свердлов
	{ text = "credits_121",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Анна Скрипова
	--{ text = "credits_122",			style = UI.Credits.styles.SIMPLE_SMALL },	-- empty
	{ text = "credits_124",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александр Степашев
	{ text = "credits_125",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Антон Устюжанин
	{ text = "credits_126",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Максим Ушаков
	{ text = "credits_127",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Андрей Шабуров
	{ text = "credits_128",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Тимур Шараев
	{ text = "credits_129",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Ринат Шафиков
	{ text = "credits_130",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Алексей Шпортун
	{ text = "credits_131",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Тимофей Шудегов
	{ text = "credits_132",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Эльдар Юсуфли
	{ text = "credits_133",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Иван Якушев
	{ text = "credits_105",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Иван Ладейщиков
	{ text = "credits_14",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Елена Евдокимова
	{ text = "credits_103",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Антон Кучеров
	{ text = "credits_34",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Пономарев
	
	-- бывшие сотрудники
	{ text = "credits_04",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Акулов
	{ text = "credits_11",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Дмитрий Глазков
	{ text = "credits_13",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Игорь Дегтярев
	{ text = "credits_15",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Игорь Жарков
	{ text = "credits_16",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Зырянов
	{ text = "credits_18",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александра Исакова
	{ text = "credits_22",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Кирилл Корепанов
	{ text = "credits_31",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Генрик Мурадян
	{ text = "credits_33",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Вячеслав Останин
	{ text = "credits_42",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Константин Сохарев
	{ text = "credits_46",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Светлана Честных
	{ text = "credits_47",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Виктория Шатилова
	{ text = "credits_49",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Алексей Яковлев
	{ text = "credits_50",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Василий Дейнега
	{ text = "credits_51",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Юлия Оводова
	{ text = "credits_52",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Кирилл Катаев
	{ text = "credits_54",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Антон Медведев
	{ text = "credits_56",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Егор Бартош
	{ text = "credits_59",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Анна Елькина
	{ text = "credits_63",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Никита Кончин
	{ text = "credits_66",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Виталий Мальцев
	{ text = "credits_65",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Игнат Малыгин
	{ text = "credits_68",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Анна Водопьянова
	{ text = "credits_69",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Андрей Волков
	{ text = "credits_71",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Наталия Качина
	{ text = "credits_75",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Николай Мосунов
	{ text = "credits_76",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Александр Павлов
	{ text = "credits_78",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Татьяна Синенькая
	{ text = "credits_82",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Дмитрий Терентьев
	{ text = "credits_85",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Ирина Шмаль
	{ text = "credits_88",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Петр Манохин
	{ text = "credits_93",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Марина Смирнова
	{ text = "credits_90",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Алиса Моисеева
	{ text = "credits_84",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Дмитрий Шамриков
	{ text = "credits_112",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александра Онохина
	{ text = "credits_73",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Руслан Кутдусов
	{ text = "credits_86",			style = UI.Credits.styles.SIMPLE_SMALL },	-- Александр Абрамов
	{ text = "credits_61",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Игорь «Kapukw» Фролов
	{ text = "credits_58",			style = UI.Credits.styles.SIMPLE_SMALL },   -- Анастасия Соколова
	{ space = 4 },
	
	{ text = "credits_Gaijin",		style = UI.Credits.styles.HEADER_LARGE },	-- Gaijin Entertaiment
	{ space = 2 },
	{ text = "credits_producers",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Продюсер
	{ text = "credits_Gaijin_01",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_Gaijin_02",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_Gaijin_03",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ space = 1 },
	{ text = "credits_CTO", 		style = UI.Credits.styles.HEADER_MEDIUM },	-- Технический директор
	{ text = "credits_Gaijin_04",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_business", 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Коммерческий директор
	{ text = "credits_Gaijin_05",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_PR"		, 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Связи с общественностью
	{ text = "credits_Gaijin_06",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_07",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_08",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_09",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_10",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_17",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_CommLead"	, 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Комьюнити-менеджер
	{ text = "credits_Gaijin_13",	style = UI.Credits.styles.SIMPLE_SMALL },
	--{ text = "credits_Gaijin_12",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_11",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_Support",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Техническая поддержка
	{ text = "credits_Gaijin_14",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_15",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_23",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_18",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_16",	style = UI.Credits.styles.SIMPLE_SMALL },
	-- { text = "credits_Gaijin_19",	style = UI.Credits.styles.SIMPLE_SMALL },
	-- { text = "credits_Gaijin_20",	style = UI.Credits.styles.SIMPLE_SMALL },
	-- { text = "credits_Gaijin_21",	style = UI.Credits.styles.SIMPLE_SMALL },
	-- { text = "credits_Gaijin_22",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_QA",		 	style = UI.Credits.styles.HEADER_MEDIUM },	-- Обеспечение качества
	{ text = "credits_Gaijin_24",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_25",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_26",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_27",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_IT",		 	style = UI.Credits.styles.HEADER_MEDIUM },	-- IT отдел
	{ text = "credits_Gaijin_28",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_29",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_30",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_31",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_32",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_33",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_34",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_35",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_36",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_WEB",		 	style = UI.Credits.styles.HEADER_MEDIUM },	-- WEB
	{ text = "credits_Gaijin_37",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_38",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_39",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_40",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_Testing",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Тестирование
	{ text = "credits_Gaijin_41",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_BackOffice",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Операционный отдел
	{ text = "credits_Gaijin_42",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_43",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_44",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_45",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_OfficeManager", style = UI.Credits.styles.HEADER_MEDIUM },-- Офис-менеджер
	{ text = "credits_Gaijin_46",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_Europe",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Европейское отделение
	{ text = "credits_Gaijin_47",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_GaijinSound",	style = UI.Credits.styles.HEADER_MEDIUM },	-- Gaijin Sound
	{ text = "credits_Gaijin_48",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_Gaijin_49",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_Special",		style = UI.Credits.styles.HEADER_MEDIUM },	-- Особая благодарность
	{ text = "credits_Gaijin_50",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 3},
	{ text = "credits_Outsourcing",	style = UI.Credits.styles.HEADER_LARGE },	-- Аутсорсеры
	{ space = 1 },
	{ text = "credits_OS_localize",	style = UI.Credits.styles.HEADER_MEDIUM },		-- Локализация
	{ space = 1 },
	{ text = "credits_OS_LOC_01",	style = UI.Credits.styles.SIMPLE_SMALL },			-- ABBY
	{ text = "credits_OS_LOC_02",	style = UI.Credits.styles.SIMPLE_SMALL },			-- AllCorrectGames
	{ text = "credits_OS_LOC_14",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Le Hong Thai
	{ text = "credits_OS_LOC_15",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Viet Tran Hoang
	{ text = "credits_OS_LOC_16",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Karel Vasmucius
	{ text = "credits_OS_LOC_17",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Rakza Fael
	{ text = "credits_OS_LOC_18",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Etienne LAFOUGE
	{ text = "credits_OS_LOC_19",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Daniel Rettenmaier
	{ text = "credits_OS_LOC_20",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Sebastian Dalkner
	{ text = "credits_OS_LOC_21",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Jurgen Neubauer
	{ text = "credits_OS_LOC_22",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Mezny Gyorgy
	{ text = "credits_OS_LOC_23",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Tibor Vereb
	{ text = "credits_OS_LOC_24",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Peter Vigh
	{ text = "credits_OS_LOC_25",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Sergio Goncalves
	{ text = "credits_OS_LOC_26",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Rodoxter Woorooboo
	{ text = "credits_OS_LOC_27",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Marcus Feltrin
	{ text = "credits_OS_LOC_28",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Hubert Gabryel
	{ text = "credits_OS_LOC_29",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Arkadiusz Lech Zielinski
	{ text = "credits_OS_LOC_30",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Omer Faruk
	{ text = "credits_OS_LOC_31",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Doan Thanh Hung
	{ text = "credits_OS_LOC_32",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Владислав Кургуз
	{ space = 1 },
	{ text = "credits_OS_3D",		style = UI.Credits.styles.HEADER_MEDIUM },		-- Моделирование
	{ space = 1 },
	{ text = "credits_OS_3D_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_02",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_03",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_04",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_05",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_06",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_3D_07",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_OS_2D",		style = UI.Credits.styles.HEADER_MEDIUM },			-- 2D арт
	{ space = 1 },
	{ text = "credits_OS_2D_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_2D_02",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_2D_03",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_2D_04",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_2D_05",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_2D_06",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },              
	{ text = "credits_OS_Music",	style = UI.Credits.styles.HEADER_MEDIUM },			-- Музыка
	{ space = 1 },              
	{ text = "credits_OS_Music_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_Music_02",	style = UI.Credits.styles.SIMPLE_SMALL },
	
	{ space = 1 },              
	{ text = "credits_OS_Voice",	style = UI.Credits.styles.HEADER_MEDIUM },			-- Озвучка
	{ space = 1 },
	{ text = "credits_OS_Voice_c7",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Елена Ивасишина
	{ text = "credits_OS_Voice_c8",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Сергей Колесников
	{ text = "credits_OS_Voice_c9",	style = UI.Credits.styles.SIMPLE_SMALL },	-- Юрий Ленин
	{ text = "credits_OS_Voice_c10",style = UI.Credits.styles.SIMPLE_SMALL },	-- Никита Прозоровский
	{ text = "credits_OS_Voice_c11",style = UI.Credits.styles.SIMPLE_SMALL },	-- Константин Карасик
	{ text = "credits_OS_Voice_c12",style = UI.Credits.styles.SIMPLE_SMALL },	-- Игорь Томилов
	{ space = 1 },
	{ text = "credits_OS_Voice_c1",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_OS_Voice_c2",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ space = 1 },
	{ text = "credits_OS_Voice_c3",	style = UI.Credits.styles.SIMPLE_MEDIUM },			-- Voice Actors
	{ text = "credits_OS_Voice_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_Voice_02",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_Voice_03",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_OS_Voice_04",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_OS_Voice_c4",	style = UI.Credits.styles.SIMPLE_MEDIUM },			-- Sound director
	{ text = "credits_OS_Voice_05",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1 },
	{ text = "credits_OS_Voice_c5",	style = UI.Credits.styles.SIMPLE_MEDIUM },			-- Intro voiceover recorded
	{ text = "credits_OS_Voice_c6",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ space = 3},
	-- Вырезано по тикету #0063048
	--[[{ text = "credits_ST",			style = UI.Credits.styles.HEADER_LARGE },	-- Супертестеры
	{ space = 1 },
	{ text = "credits_ST_73",		style = UI.Credits.styles.SIMPLE_SMALL },		--- SeraX
	{ text = "credits_ST_17",		style = UI.Credits.styles.SIMPLE_SMALL },		--- MoonLight
	{ text = "credits_ST_76",		style = UI.Credits.styles.SIMPLE_SMALL },		--- DerpBananza
	{ text = "credits_ST_75",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Rakza
	{ text = "credits_ST_85",		style = UI.Credits.styles.SIMPLE_SMALL },		--- OmegaFighter
	{ text = "credits_ST_86",		style = UI.Credits.styles.SIMPLE_SMALL },		--- BlackLoTus
	{ text = "credits_ST_87",		style = UI.Credits.styles.SIMPLE_SMALL },		--- nomand45
	{ text = "credits_ST_88",		style = UI.Credits.styles.SIMPLE_SMALL },		--- alfred0
	{ text = "credits_ST_89",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Gaasse
	{ text = "credits_ST_90",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Fedman47
	{ text = "credits_ST_91",		style = UI.Credits.styles.SIMPLE_SMALL },		--- ASCENDED
	{ text = "credits_ST_92",		style = UI.Credits.styles.SIMPLE_SMALL },		--- ProSteeck
	{ text = "credits_ST_93",		style = UI.Credits.styles.SIMPLE_SMALL },		--- weegee
	{ text = "credits_ST_94",		style = UI.Credits.styles.SIMPLE_SMALL },		--- TheDivineShadow
	{ text = "credits_ST_95",		style = UI.Credits.styles.SIMPLE_SMALL },		--- LEV
	{ space = 3},
	{ text = "credits_GM",			style = UI.Credits.styles.HEADER_LARGE },		-- ГМ caption
	{ space = 1},
	{ text = "credits_GM_RU",		style = UI.Credits.styles.SIMPLE_MEDIUM },		-- Lezort
	{ space = 1},
	{ text = "credits_GM_RU_15",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 216750, nickname:CBAT
	{ text = "credits_GM_RU_16",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 216750, nickname:AlbertGlimma
	{ text = "credits_GM_RU_17",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 216750, nickname:Polina
	{ text = "credits_GM_RU_18",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 216750, nickname:Triche
	{ text = "credits_GM_EN_08",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 120996, nickname:MrTwiddlez
	{ text = "credits_GM_EN_14",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 303142, nickname:rakza
	{ text = "credits_GM_EN_15",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 351640, nickname:Vecrox
	{ text = "credits_GM_EN_24",	style = UI.Credits.styles.SIMPLE_SMALL },		-- Aggressor
	{ text = "credits_GM_EN_25",	style = UI.Credits.styles.SIMPLE_SMALL },		-- BlackStorm
	{ text = "credits_GM_EN_26",	style = UI.Credits.styles.SIMPLE_SMALL },		-- XofJSA
	{ text = "credits_GM_EN_27",	style = UI.Credits.styles.SIMPLE_SMALL },		-- Seraphym
	{ text = "credits_GM_EN_28",	style = UI.Credits.styles.SIMPLE_SMALL },		-- OmegaFighter
	{ space = 3},
	{ text = "credits_FM",			style = UI.Credits.styles.HEADER_LARGE },		-- Форум caption
	{ space = 1},
	{ text = "credits_FM_RU",		style = UI.Credits.styles.SIMPLE_MEDIUM },		-- Lezort
	{ space = 1},
	{ text = "credits_FM_RU_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_02",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_03",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_ST_17",		style = UI.Credits.styles.SIMPLE_SMALL },		-- MoonL
	{ text = "credits_FM_RU_11",	style = UI.Credits.styles.SIMPLE_SMALL },		-- FifthRom
	{ text = "credits_FM_RU_12",	style = UI.Credits.styles.SIMPLE_SMALL },		-- ASCENDED
	{ text = "credits_FM_EN_03",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 3}, 
	-- Благодарность отдельным игрокам
	{ text = "credits_SpcThank",	style = UI.Credits.styles.HEADER_LARGE },		
	{ text = "credits_ST_17",		style = UI.Credits.styles.SIMPLE_MEDIUM },		--- UID: 2119 MoonLight
	{ text = "credits_GM_EN",		style = UI.Credits.styles.SIMPLE_MEDIUM },		-- Error
	{ text = "credits_FM_EN_01",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_05",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_07",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_08",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_09",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_EN_10",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_04",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_05",	style = UI.Credits.styles.SIMPLE_SMALL },	
	{ text = "credits_FM_RU_06",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_07",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_08",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_09",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_10",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_FM_RU_11",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ text = "credits_GM_EN_01",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 180   , nickname:klop41SYN
	{ text = "credits_GM_EN_02",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 974   , nickname:Gentaei
	{ text = "credits_GM_EN_03",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 28335 , nickname:Thacador
	{ text = "credits_GM_EN_04",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 51844 , nickname:capkoko
	{ text = "credits_GM_EN_05",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 84615 , nickname:JPhack
	{ text = "credits_GM_EN_06",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 91699 , nickname:Summer5
	{ text = "credits_GM_EN_07",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 92411 , nickname:Benache
	{ text = "credits_GM_EN_09",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 172774, nickname:ZEIK
	{ text = "credits_GM_EN_10",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 172886, nickname:CensoredbyAdmin
	{ text = "credits_GM_EN_11",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 191063, nickname:FunkyDonut
	{ text = "credits_GM_EN_12",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 209089, nickname:Tealc
	{ text = "credits_GM_EN_13",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 291113, nickname:residente
	{ text = "credits_GM_EN_16",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 416078, nickname:semTex
	{ text = "credits_GM_EN_17",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 436764, nickname:EvilTactician
	{ text = "credits_GM_EN_18",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 467142, nickname:Skadoodle
	{ text = "credits_GM_EN_19",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 468665, nickname:I3ones
	{ text = "credits_GM_EN_20",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 541454, nickname:petitpihey
	{ text = "credits_GM_EN_21",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 742078, nickname:Eviscerador
	{ text = "credits_GM_EN_22",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 462399, nickname:Hitalo				
	{ text = "credits_GM_EN_23",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 349702, nickname:Shephred	
	{ text = "credits_GM_RU_19",	style = UI.Credits.styles.SIMPLE_SMALL },		-- Bazinga
	{ text = "credits_GM_RU_01",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 194,	nickname:Varzhak
	{ text = "credits_GM_RU_02",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 287,	nickname:Strongrus
	{ text = "credits_GM_RU_03",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 339,	nickname:Simba
	{ text = "credits_GM_RU_04",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 403,	nickname:Dronza
	{ text = "credits_GM_RU_05",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 9766,	nickname:TensiWT
	{ text = "credits_GM_RU_06",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 26667,	nickname:ComradTroY
	{ text = "credits_GM_RU_07",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 35889,	nickname:Sky
	{ text = "credits_GM_RU_08",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 82847,	nickname:wCELENw
	{ text = "credits_GM_RU_09",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 97783,	nickname:Alisa
	{ text = "credits_GM_RU_10",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 408688,nickname:Filraen
	{ text = "credits_GM_RU_11",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: Amella
	{ text = "credits_GM_RU_12",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: BETEPAHK
	{ text = "credits_GM_RU_13",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: Fomir
	{ text = "credits_GM_RU_14",	style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: zmb_ghost		
	{ text = "credits_OS_LOC_03",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Peter Moronval
	{ text = "credits_OS_LOC_04",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Nicolas Melin
	{ text = "credits_OS_LOC_05",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Eduard Gerzen
	{ text = "credits_OS_LOC_06",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Daniel R. (Vecrox) 
	{ text = "credits_OS_LOC_07",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Darius A?mann
	{ text = "credits_OS_LOC_08",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Martin Duran
	{ text = "credits_OS_LOC_09",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Amprimo Sebastian
	{ text = "credits_OS_LOC_10",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Miguel Alia
	{ text = "credits_OS_LOC_11",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Alberto Fernandez Arias
	{ text = "credits_OS_LOC_13",	style = UI.Credits.styles.SIMPLE_SMALL },			-- Steffen Pflugk
	{ text = "credits_ST_01",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 29
	{ text = "credits_ST_02",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 28
	{ text = "credits_ST_03",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 165
	{ text = "credits_ST_04",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 54
	{ text = "credits_ST_05",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 60
	{ text = "credits_ST_06",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 157
	{ text = "credits_ST_07",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 194
	{ text = "credits_ST_08",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 287
	{ text = "credits_ST_09",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 362
	{ text = "credits_ST_10",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 403
	{ text = "credits_ST_11",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 481
	{ text = "credits_ST_12",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 514
	{ text = "credits_ST_13",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 770
	{ text = "credits_ST_14",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 902
	{ text = "credits_ST_15",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 974
	{ text = "credits_ST_16",		style = UI.Credits.styles.SIMPLE_SMALL },		--- letir
	{ text = "credits_ST_18",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 12930
	{ text = "credits_ST_19",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 13247
	{ text = "credits_ST_20",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 18007
	{ text = "credits_ST_21",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Zerk1
	{ text = "credits_ST_22",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 22756
	{ text = "credits_ST_23",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 26667
	{ text = "credits_ST_24",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 68
	{ text = "credits_ST_25",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 133
	{ text = "credits_ST_26",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 38
	{ text = "credits_ST_27",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 90
	{ text = "credits_ST_28",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 71
	{ text = "credits_ST_29",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 105
	{ text = "credits_ST_30",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 3153
	{ text = "credits_ST_31",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 30187
	{ text = "credits_ST_32",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 375
	{ text = "credits_ST_33",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 36
	{ text = "credits_ST_34",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 3271
	{ text = "credits_ST_35",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 1679
	{ text = "credits_ST_36",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 217
	{ text = "credits_ST_37",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 17723
	{ text = "credits_ST_38",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 9483
	{ text = "credits_ST_39",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 78423
	{ text = "credits_ST_40",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 102
	{ text = "credits_ST_41",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 30740
	{ text = "credits_ST_42",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 104936
	{ text = "credits_ST_43",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 64394
	{ text = "credits_ST_44",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 71083
	{ text = "credits_ST_45",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 9507
	{ text = "credits_ST_46",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 26995
	{ text = "credits_ST_47",		style = UI.Credits.styles.SIMPLE_SMALL }, 		--- UID: 184
	{ text = "credits_ST_48",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 95432
	{ text = "credits_ST_49",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 88430
	{ text = "credits_ST_50",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 111487
	{ text = "credits_ST_51",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 27410
	{ text = "credits_ST_52",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 69577
	{ text = "credits_ST_53",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 3458
	{ text = "credits_ST_54",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 66898
	{ text = "credits_ST_55",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 474576
	{ text = "credits_ST_56",		style = UI.Credits.styles.SIMPLE_SMALL },		--- iROOT
	{ text = "credits_ST_57",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 60895
	{ text = "credits_ST_58",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 465160
	{ text = "credits_ST_59",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 373499
	{ text = "credits_ST_60",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 87697
	{ text = "credits_ST_61",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 97783
	{ text = "credits_ST_62",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 281
	{ text = "credits_ST_63",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 89381
	{ text = "credits_ST_64",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 
	{ text = "credits_ST_65",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 
	{ text = "credits_ST_66",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 
	{ text = "credits_ST_67",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 
	{ text = "credits_ST_68",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 
	{ text = "credits_ST_69",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 3219
	{ text = "credits_ST_70",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 33154
	{ text = "credits_ST_71",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Atlantic
	{ text = "credits_ST_72",		style = UI.Credits.styles.SIMPLE_SMALL },		--- CBAT
	{ text = "credits_ST_74",		style = UI.Credits.styles.SIMPLE_SMALL },		--- UID: 708
	{ text = "credits_ST_77",		style = UI.Credits.styles.SIMPLE_SMALL },		--- millanbel
	{ text = "credits_ST_78",		style = UI.Credits.styles.SIMPLE_SMALL },		--- ECMnoob
	{ text = "credits_ST_79",		style = UI.Credits.styles.SIMPLE_SMALL },		--- StormPetrel
	{ text = "credits_ST_80",		style = UI.Credits.styles.SIMPLE_SMALL },		--- wlast
	{ text = "credits_ST_81",		style = UI.Credits.styles.SIMPLE_SMALL },		--- CerberusS
	{ text = "credits_ST_82",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Donnie
	{ text = "credits_ST_83",		style = UI.Credits.styles.SIMPLE_SMALL },		--- starcore
	{ text = "credits_ST_84",		style = UI.Credits.styles.SIMPLE_SMALL },		--- Maximum997	
	{ space = 3}, ]]                                                    
	{ text = "credits_SpecialThank",style = UI.Credits.styles.HEADER_MEDIUM },	-- Благодарность участникам ЗБТ и ОБТ+
	{ space = 6}, 
	{ text = "credits_midware",		style = UI.Credits.styles.HEADER_LARGE }, 	-- Использованный софт: wiki/Cosmmos:Middleware
	{ space = 3},
	{ text = "credits_midware_01",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_01_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_02",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_02_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_03",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_03_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_04",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_04_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_05",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_05_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_06",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_06_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_07",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_07_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_08",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_08_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_09",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_09_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_10",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_10_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_11",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_11_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_12",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_12_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_13",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_13_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_14",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_14_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_15",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_15_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_16",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_16_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	-- { text = "credits_midware_17",	style = UI.Credits.styles.SIMPLE_MEDIUM },		--- DirectX
	-- { text = "credits_midware_17_rights",	style = UI.Credits.styles.SIMPLE_SMALL },		--- DirectX
	-- { space = 1},
	-- { text = "credits_midware_18",	style = UI.Credits.styles.SIMPLE_MEDIUM },		--- OpenGL
	-- { text = "credits_midware_18_rights",	style = UI.Credits.styles.SIMPLE_SMALL },		--- OpenGL
	-- { space = 1},
	{ text = "credits_midware_19",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_19_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_20",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_20_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_21",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_21_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_22",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_22_rights",	style = UI.Credits.styles.SIMPLE_SMALL },
	{ space = 1},
	{ text = "credits_midware_23",	style = UI.Credits.styles.SIMPLE_MEDIUM },
	{ text = "credits_midware_23_rights",	style = UI.Credits.styles.SIMPLE_SMALL },	
}



















