-- профиль по умолчанию
default_profile = 
{
	-- общая статистика по игре
	Stats = 
	{
		game_time_total = 0,				-- суммарное время, проведенное за игрой
		game_time_multiplayer = 0,
		
		gameplay_total = 0,					-- общее количество заездов (включая мультиплеерные)
		gameplay_multiplayer = 0,			-- общее количество мультиплеерных заездов
		
		gameplay_win_total = 0,				-- общее кол-во побед
		gameplay_win_multiplayer = 0,		-- кол-во побед в мультиплеере
		
	},
	
	-- информация об уже полученных достижениях
	Achievement = 
	{
--[[	
		COMPLETED_LEVEL_GUM = 
		{
			completed = false,
		},
		PICK_ALL_WEAPONS = 
		{
			completed = true,
		},
]]
	},

	-- если игрок получил награду за первый логин в день, но мы по какой-то причине не можем её показать - сохраняем уровень награды и покажем позже
	daily_reward_last_level = nil,

	-- язык глобального чата игры
	chat_global_language = nil,

	-- регион
	game_region = nil,
}
