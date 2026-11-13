--
WarSettings =
{
	warClanReviveCost = 10000, -- цена ремонта корпы, иридиум корпы
	warBaseReward = 10000, -- базовая награда за участие в войне, иридиум корпы
}


--
MilitarySettings =
{
	militaryRankMax = 15,

	militaryRankUpReward = 
	{
		-- militaryRank -> 1
		{	
			{
				type = MasterServer.RewardType.RT_CREDITS,
				value = 1000000,
			},
		},

		-- militaryRank -> 2
		{
			{
				type = MasterServer.RewardType.RT_VESSEL_EXP_POOL,
				value = 100000,
			},
		},

		-- militaryRank -> 3
		{
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS,
				--type = MasterServer.RewardType.RT_ITEM,
				--def = "Special_recreation",
				value = 100,
			},
		},

		-- militaryRank -> 4
		{
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "Aliens_ship_part",
				value = 50,
			},
		},

		-- militaryRank -> 5
		{
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "Iridium_monocrystall",
				value = 25,
			},
		},

		-- militaryRank -> 6
		{
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 500,
			},
		},
		
		-- militaryRank -> 7
		{
			{
				type = MasterServer.RewardType.RT_TITLE ,
				value = PlayerTitleId.MICHMAN,
			},
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 700,
			},
		},
		
		-- militaryRank -> 8
		{
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Plasma_Alien_Killer",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Laser_Alien_Killer",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Rail_Alien_Killer",
				value = 100,
			},
		},
		
		-- militaryRank -> 9
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_1",
			},
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "Camouflage_CanadianDesert",
			},
		},

		-- militaryRank -> 10
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_2",
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Plasma_Huge_Killer",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Laser_Huge_Killer",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "WeaponMod_Rail_Huge_Killer",
				value = 100,
			},
		},

		-- militaryRank -> 11 Старший лейтенант SC-111555
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_3",
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "SpaceMissile_MagnetMine_T5_Mk3",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "Expendable_BattleDroneMedium_T5_Mk3",
				value = 100,
			},
			{
				type = MasterServer.RewardType.RT_ITEM,
				def = "Expendable_BattleDroneLarge_T5_Mk3",
				value = 100,
			},
		},

		-- militaryRank -> 12 Капитан-лейтенант SC-107153
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_4",
			},
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 1000,
			},
		},

		-- militaryRank -> 13 Капитан 3-го ранга
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_5",
			},
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 1500,
			},
		},

		-- militaryRank -> 14 Капитан 2-го ранга
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_6",
			},
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 2000,
			},
		},

		-- militaryRank -> 15 Капитан 1-го ранга
		{
			{
				type = MasterServer.RewardType.RT_CUSTOM_ELEMENT,
				def = "rank_7",
			},
			{
				type = MasterServer.RewardType.RT_GOLD_CREDITS ,
				value = 2500,
			},
		},
	}
}
