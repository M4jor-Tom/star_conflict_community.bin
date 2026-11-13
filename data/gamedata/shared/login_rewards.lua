DailyAuras =
{
	"Daily_Pvp",
	"Daily_Pve",
	"Daily_Coop",
	"Daily_Brawl",

	"Daily_Pvp_2x",
	"Daily_Pve_2x",
	"Daily_Coop_2x",
	"Daily_Brawl_2x",
}

DailyLoginRewards =
{
	{	aura 	= "First_Day_Bundle_Discount",	},
	{	aura 	= "First_Day_Bundle_Discount",	},
	{	aura 	= "First_Day_Bundle_Discount",	},
	{	aura 	= "Five_Days_Bundle_Discount",	},
}

-- offerId нельзя менять после заливки на live
Offers =
{
	-- daily login reward
	{
		groupId = 1,

		offers = 
		{
			-- выдается в 1, 2, 3 - ий день
			{
				offerId = 1,
				priority = 10,
				cooldown = 0,
				bundle = "Bundle_DailyChest_T1",
				conditions =
				{
				},
			},

			-- выдается в 5-ый день, OFF
			{
				offerId = 2,
				priority = 100,
				cooldown = 5,
				bundle = "Bundle_Secret_Chest_T5",
				conditions =
				{
					{
						-- dailyLoginLevel == 4
						param = MasterServer.OfferConditionParam.DAILY_LOGIN_LEVEL, -- 0..4
						compare = MasterServer.OfferConditionCompare.EQUAL,
						value = 4,
					},
				},
			},
			
			-- выдается в 4-ый день, бесплатный сундук
			{
				offerId = 11,
				priority = 100,
				cooldown = 5,
				bundle = "Bundle_Secret_Chest_T5",
				conditions =
				{
					{
						-- dailyLoginLevel == 3
						param = MasterServer.OfferConditionParam.DAILY_LOGIN_LEVEL, -- 0..4
						compare = MasterServer.OfferConditionCompare.EQUAL,
						value = 3,
					},
				},
			},
		},
	},
	
	-- предложение
	{
		groupId = 2,
		
		offers = 
		{
			-- Первый оферный бандл, 5 уровень, внутри фиолетовые модули/пушки на все классы+ракеты золотые
			{
				offerId = 3,
				priority = 20,
				cooldown = 9999,
				aura = "Bundle_StarterPack_Offer_T3_chest",
				conditions =
				{
					-- четный uid
					{ 	param = MasterServer.OfferConditionParam.UID_DIVISIBLE_BY_TWO, compare = MasterServer.OfferConditionCompare.EQUAL, value = MasterServer.OfferBoolean.TRUE,	},
					-- ранг игрока по кораблям = 5
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.EQUAL, value = 5, },
					
				},
			},
			
			-- Бандл 8 уровня, бустер пак с модулями
			{
				offerId = 4,
				priority = 20,
				cooldown = 9999,
				aura = "Bundle_Rank8_BoosterPack_Offer_T3_chest",
				conditions =
				{
					-- четный uid
					{ 	param = MasterServer.OfferConditionParam.UID_DIVISIBLE_BY_TWO, compare = MasterServer.OfferConditionCompare.EQUAL, value = MasterServer.OfferBoolean.TRUE,	},
					-- ранг игрока по кораблям = 8
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.EQUAL, value = 8, },
					
				},
			},
			
			-- Бандл 8 уровня, офер на эсминец
			{
				offerId = 5,
				priority = 20,
				cooldown = 9999,
				aura = "Bundle_Rank8_SupressorPack_Offer_T3_chest",
				conditions =
				{
					-- нечетный uid
					{ 	param = MasterServer.OfferConditionParam.UID_DIVISIBLE_BY_TWO, compare = MasterServer.OfferConditionCompare.EQUAL, value = MasterServer.OfferBoolean.FALSE,	},
					-- ранг игрока по кораблям = 8
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.EQUAL, value = 8, },
					
				},
			},
			
			 -- Офер на ауру +25% голды
			{
				offerId = 6,
				priority = 20,
				cooldown = 7,
				aura = "Gold_bonus_offer_25",
				conditions =
				{
					-- дней с последнего платежа
					{ 	param = MasterServer.OfferConditionParam.LAST_GOLD_PAYMENT_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 14,},
					-- дней с последнего платежа
					{ 	param = MasterServer.OfferConditionParam.LAST_GOLD_PAYMENT_DAYS, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 19,},
					
				},
			},
			
			-- Офер на ауру +50% голды
			{
				offerId = 7,
				priority = 20,
				cooldown = 30,
				aura = "Gold_bonus_offer_50",
				conditions =
				{
					-- дней с последнего платежа
					{ 	param = MasterServer.OfferConditionParam.LAST_GOLD_PAYMENT_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 30,},
					
				},
			},
			
			-- Офер на ауру +50% голды для повышения конверсии в платящих на ранних рангах 
			{
				offerId = 8,
				priority = 20,
				cooldown = 9999,
				aura = "Gold_bonus_offer_50",
				conditions =
				{
					-- дней с даты регистрации
					{ 	param = MasterServer.OfferConditionParam.FIRST_LOGIN_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 5,},
					-- дней с даты регистрации
					{ 	param = MasterServer.OfferConditionParam.FIRST_LOGIN_DAYS, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 8,},
					-- всего куплено голды
					{ 	param = MasterServer.OfferConditionParam.TOTAL_BOUGHT_GOLD, compare = MasterServer.OfferConditionCompare.EQUAL, value = 0,},
					-- четный uid
					{ 	param = MasterServer.OfferConditionParam.UID_DIVISIBLE_BY_TWO, compare = MasterServer.OfferConditionCompare.EQUAL, value = MasterServer.OfferBoolean.TRUE,	},					
					
				},
			},
			
			-- Скидка на ксеночипы для догоняющих
			{
				offerId = 12,
				priority = 20,
				cooldown = 7,
				aura = "Event_credits_discount_50",
				conditions =
				{
					-- дней с последнего логина
					{ 	param = MasterServer.OfferConditionParam.LAST_LOGIN_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 5,},
					-- всего куплено голды
					{ 	param = MasterServer.OfferConditionParam.TOTAL_BOUGHT_GOLD, compare = MasterServer.OfferConditionCompare.GREATER, value = 0,},
					
				},
			},
			
			-- Буст вернувшихся
			{
				offerId = 13,
				priority = 30,
				cooldown = 30,
				aura = "Returned_boost_50",
				conditions =
				{
					-- дней с даты регистрации
					{ 	param = MasterServer.OfferConditionParam.FIRST_LOGIN_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 6,},
					-- дней с последнего логина
					{ 	param = MasterServer.OfferConditionParam.LAST_LOGIN_DAYS, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 7,},
					-- всего куплено голды
					{ 	param = MasterServer.OfferConditionParam.TOTAL_BOUGHT_GOLD, compare = MasterServer.OfferConditionCompare.EQUAL, value = 0,},
				},
			},
			
			-- Оффер для 3го ранга, детали Палома
			{
				offerId = 14,
				priority = 40,
				cooldown = 9999,
				aura = "Palom_new_player",
				conditions =
				{
					-- ранг 3-4
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 3, },
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 4, },
				},
			},
			
			-- Оффер для 5го ранга, дубликаторы
			{
				offerId = 15,
				priority = 40,
				cooldown = 9999,
				aura = "Palom_new_player",
				conditions =
				{
					-- ранг 5-6
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 5, },
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 6, },
				},
			},
			
			-- Оффер для 7го ранга, модули с синергией
			{
				offerId = 16,
				priority = 40,
				cooldown = 9999,
				aura = "Rank_9_builds_All",
				conditions =
				{
					-- ранг 7-8
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 7, },
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 8, },
				},
			},
			
		},
	},

	-- выдача случайных сундуков с деталями эсминцев для покупки
	-- #0107019: Переработка системы сундуков за ирридиум.
	{
		groupId = 3,

		offers =
		{
			{
				offerId = 17,
				priority = 1,
				cooldown = 0,
				bundle = "Bundle_Iridium_Overseer_T3",
				conditions =
				{
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 5, },
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 6, },
				},
			},
			{
				offerId = 18,
				priority = 1,
				cooldown = 0,
				bundle = "Bundle_Iridium_Overseer_T4",
				conditions =
				{
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 7, },
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.LESS_EQUAL, value = 9, },
				},
			},
			{
				offerId = 19,
				priority = 1,
				cooldown = 0,
				bundle = "Bundle_Iridium_Overseer_T5",
				conditions =
				{
					{	param = MasterServer.OfferConditionParam.PLAYER_RANK, compare = MasterServer.OfferConditionCompare.GREATER_EQUAL, value = 10, },
				},
			},
		},
	},
}
