--
UniverseSettings = 
{
	-- время длительности БЗС, минуты
	conflictDurationTime = 50,	-- #67206 одновременно сдвинутся начала в Т4 и Т5 на 20 и 35 минут соответсвенно

	--#92657 снятие защиты
	civilianZoneCost = 1000, -- цена, иридиум корпы 1000
	civilianZoneDuration = 3600*12, -- длительность, секунды 3600*12

	-- цена перемещения дредноута, иридиум (+5 идёт откуда-то)
	move_coef_far			= 95,	--40 #110670
	move_coef_close			= 45,	--20

	--
	NewYearStages =
	{
		-- stage -> day
		[1] = 0,
		[2] = 7,
		[3] = 11,
		[4] = 13,
		[5] = 17,
		[6] = 22,
		[7] = 27, -- last stage indicate that event is end
	}
}
