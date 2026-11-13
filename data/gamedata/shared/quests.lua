
----------------------------------------
-- alert
----------------------------------------

Quests[ QuestId.ALERT_CHEST_OW2_1041 ] = {
	unlocks_on_account_rank = 3,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T01:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1046 ] = {
	unlocks_on_account_rank = 3,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T04:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "planet_war_waves_T1",
	requiredPveScheduledLevel = "pve_wave_planet_war",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_planet_war", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1052 ] = {
	unlocks_on_account_rank = 3,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T15:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	requiredPveScheduledLevel = "s1550_pve_capture_repairbase",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1057 ] = {
	unlocks_on_account_rank = 4,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T08:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "nalnifan_lumen_waves_T1",
	requiredPveScheduledLevel = "pve_wave_nalnifan_gate_lumen",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1062 ] = {
	unlocks_on_account_rank = 5,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T03:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	requiredPveScheduledLevel = "s1347_geostation",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1067 ] = {
	unlocks_on_account_rank = 6,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T22:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	requiredPveScheduledLevel = "pve_frozen_station",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1072 ] = {
	unlocks_on_account_rank = 6,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T17:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	requiredPveScheduledLevel = "pve_jericho_base",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1077 ] = {
	unlocks_on_account_rank = 7,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T06:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1082 ] = {
	unlocks_on_account_rank = 7,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T21:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	requiredPveScheduledLevel = "s1550_pve_asteroid_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1087 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T013:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_desttown_waves_easy",
	requiredPveScheduledLevel = "pve_desttown",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_desttown", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1092 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T09:00:00Z",
	intervalLongHours = 7,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_empfrontier_waves_T1",
	requiredPveScheduledLevel = "pve_transit_emp_rock_frontier",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_transit_emp_rock_frontier", }, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1097 ] = {
	unlocks_on_account_rank = 6,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T02:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1103 ] = {
	unlocks_on_account_rank = 6,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T14:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "planet_war_waves_T1",
	requiredPveScheduledLevel = "pve_wave_planet_war",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_planet_war", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1108 ] = {
	unlocks_on_account_rank = 7,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T10:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	requiredPveScheduledLevel = "s1550_pve_capture_repairbase",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1113 ] = {
	unlocks_on_account_rank = 7,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T23:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "nalnifan_lumen_waves_T1",
	requiredPveScheduledLevel = "pve_wave_nalnifan_gate_lumen",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1118 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T05:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	requiredPveScheduledLevel = "s1347_geostation",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1123 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T16:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	requiredPveScheduledLevel = "pve_frozen_station",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1128 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T07:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	requiredPveScheduledLevel = "pve_jericho_base",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1133 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T01:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1138 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T12:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	requiredPveScheduledLevel = "s1550_pve_asteroid_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1143 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T18:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_desttown_waves_easy",
	requiredPveScheduledLevel = "pve_desttown",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_desttown", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1148 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T09:00:00Z",
	intervalLongHours = 13,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_empfrontier_waves_T1",
	requiredPveScheduledLevel = "pve_transit_emp_rock_frontier",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_transit_emp_rock_frontier", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1153 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T11:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1158 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T20:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "planet_war_waves_T1",
	requiredPveScheduledLevel = "pve_wave_planet_war",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_planet_war", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1163 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T03:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	requiredPveScheduledLevel = "s1550_pve_capture_repairbase",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1168 ] = {
	unlocks_on_account_rank = 8,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T14:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "nalnifan_lumen_waves_T1",
	requiredPveScheduledLevel = "pve_wave_nalnifan_gate_lumen",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1173 ] = {
	unlocks_on_account_rank = 9,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T05:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	requiredPveScheduledLevel = "s1347_geostation",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1178 ] = {
	unlocks_on_account_rank = 9,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T16:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	requiredPveScheduledLevel = "pve_frozen_station",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1184 ] = {
	unlocks_on_account_rank = 9,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T19:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	requiredPveScheduledLevel = "pve_jericho_base",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1189 ] = {
	unlocks_on_account_rank = 9,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T22:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1194 ] = {
	unlocks_on_account_rank = 10,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T04:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	requiredPveScheduledLevel = "s1550_pve_asteroid_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1199 ] = {
	unlocks_on_account_rank = 10,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T13:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_desttown_waves_easy",
	requiredPveScheduledLevel = "pve_desttown",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_desttown", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1204 ] = {
	unlocks_on_account_rank = 10,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T20:00:00Z",
	intervalLongHours = 27,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_empfrontier_waves_T1",
	requiredPveScheduledLevel = "pve_transit_emp_rock_frontier",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_transit_emp_rock_frontier", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1209 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T06:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1214 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T02:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "planet_war_waves_T1",
	requiredPveScheduledLevel = "pve_wave_planet_war",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_planet_war", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1219 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T08:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	requiredPveScheduledLevel = "s1550_pve_capture_repairbase",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1224 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T19:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "nalnifan_lumen_waves_T1",
	requiredPveScheduledLevel = "pve_wave_nalnifan_gate_lumen",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1229 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T10:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	requiredPveScheduledLevel = "s1347_geostation",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1234 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T07:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	requiredPveScheduledLevel = "pve_frozen_station",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1239 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T12:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	requiredPveScheduledLevel = "pve_jericho_base",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1244 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T21:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1249 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T02:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	requiredPveScheduledLevel = "s1550_pve_asteroid_building",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1254 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T15:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_desttown_waves_easy",
	requiredPveScheduledLevel = "pve_desttown",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_desttown", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1259 ] = {
	unlocks_on_account_rank = 11,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 40,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T01:00:00Z",
	intervalLongHours = 31,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_empfrontier_waves_T1",
	requiredPveScheduledLevel = "pve_transit_emp_rock_frontier",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_transit_emp_rock_frontier", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 20, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1264 ] = {
	unlocks_on_account_rank = 12,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 80,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-03T11:00:00Z",
	intervalLongHours = 41,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "planet_war_waves_T1",
	requiredPveScheduledLevel = "pve_wave_planet_war",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_planet_war", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 25, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1269 ] = {
	unlocks_on_account_rank = 12,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 80,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T18:00:00Z",
	intervalLongHours = 41,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "nalnifan_lumen_waves_T1",
	requiredPveScheduledLevel = "pve_wave_nalnifan_gate_lumen",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 25, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1274 ] = {
	unlocks_on_account_rank = 12,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 80,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-02T07:00:00Z",
	intervalLongHours = 41,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	requiredPveScheduledLevel = "s1347_geostation",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 25, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1279 ] = {
	unlocks_on_account_rank = 12,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 80,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-03T17:00:00Z",
	intervalLongHours = 41,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 25, },
		},
	},},
}

Quests[ QuestId.ALERT_CHEST_OW2_1284 ] = {
	unlocks_on_account_rank = 12,
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_tokens = 150,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	intervalStartHour = "2017-12-01T21:00:00Z",
	intervalLongHours = 41,
	intervalLongEnableHours = 1,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	requiredPveScheduledLevel = "s1550_pve_bigship_building_2",
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.GOLDEN_AURA ] = {
	unlocks_on_account_rank = 3,
	required_account_aura = "Golden_Quest",
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_gold_credits = 200,
	ui_reward = "reward_gold_credits",
	character = "broker",
	intervalStartHour = "2020-09-17T06:00:00Z",
	intervalLongHours = 24,
	intervalLongEnableHours = 24,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.GOLDEN_QUEST_BP ] = {
	group = QuestGroupId.INGAME_TIME_DAILY,
	unlocks_on_account_rank = 3,
	required_account_aura = "Golden_Aura_BattlePass",
	category =  QuestCategory.ALERT,
	tag = ai.QuestTag.CARGO_CONTRACT,
	auto_accept = true,
	reward_gold_credits = 150,
	ui_reward = "reward_gold_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}


----------------------------------------
-- story
----------------------------------------

Quests[ QuestId.CAMPAIGN_QUEST_1  ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	openspace = true,
	reward_tokens = 5,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		marked_zone_id	= { SpaceZone.Precursor_Zona3.zone_id },
		hud_marker_defs = { "C_Campaign_Qeust1_hcil" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Campaign_Qeust1_hcil", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Precursor_Zona3.zone_id, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_1_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_2 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_1 },
	reward_credits        = 100000,
	ui_reward = "reward_credits",
	character = "general",
	give_items = {"ow_TutorialLoot1key"},
	drop_item = "ow_TutorialLoot1",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 3,
		marked_zone_id	= { SpaceZone.Precursor_Zona3.zone_id },
		hud_marker_defs = { "OpenWorld_TutorialLoot1" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_TutorialLoot1", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_2_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_2_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_3 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_2 },
	reward_credits        = 150000,
	ui_reward = "reward_credits",
	character = "emp_major",
	give_items = {"ow_CampaignLoot3key"},
	drop_item = "ow_CampaignLoot3",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		marked_zone_id	= { SpaceZone.ow_bion.zone_id },
		accessibleZoneIds = { SpaceZone.ow_bion.zone_id },
		hud_marker_defs = { "OpenWorld_CampaignLoot3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_CampaignLoot3", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_bion.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_CAMPAIGN_QUEST_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "lamarr",
						text = "quest_CAMPAIGN_QUEST_3_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_4 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_2 },
	reward_credits        = 200000,
	ui_reward = "reward_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_5 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_4 },
	reward_tokens = 10,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_6 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_5 },
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "emp_engineer",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_7 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 4,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_6 },
	reward_tokens = 20,
	ui_reward = "reward_tokens",
	character = "general",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "s1550_pve_capture_repairbase",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.DURATION, max_value = 720,},
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 350, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_8 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 4,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_7 },
	reward_credits        = 300000,
	ui_reward = "reward_credits",
	character = "emp_engineer",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.CARGO_CONTRACT, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_9 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 4,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_8 },
	reward_tokens = 25,
	ui_reward = "reward_tokens",
	character = "lamarr",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.KING_OF_THE_HILL, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_10 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 4,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_9 },
	reward_credits        = 600000,
	ui_reward = "reward_credits",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_11 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 5,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_10 },
	reward_tokens = 30,
	ui_reward = "reward_tokens",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.ACQUIRE_SHIP,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T2", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_12 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 5,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_11 },
	reward_tokens = 30,
	ui_reward = "reward_tokens",
	character = "empire_leader",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "pve_wave_nalnifan_gate_lumen",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_wave_nalnifan_gate_lumen", }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 0, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_13 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 5,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_12 },
	reward_tokens = 30,
	ui_reward = "reward_tokens",
	character = "empire_leader",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "s1550_pve_bigship_building",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 0, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_14 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 6,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_13 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_15 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 6,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_14 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "emp_major",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_16 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 6,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_15 },
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	ui_reward = "reward_items",
	character = "scientist",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_17 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_16 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.MULTI_KILL, ai.MedalType.LITTLE_THING_THAT_KILLED, ai.MedalType.FAST_AND_FURIOUS, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_18 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_17 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "lamarr",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "s1347_geostation",
	stages = {{
		game_event = ai.GameEvent.KILL_OBJECT,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_19 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_18 },
	reward_items = { {"ship_part_craft_armor", 1 }, },
	ui_reward = "reward_items",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.BULLET_SPONGE, ai.MedalType.HIDE_AND_SEEK, ai.MedalType.CATCH_ME_IF_YOU_CAN, ai.MedalType.ANTIDOTE, ai.MedalType.BBQ_SHIP, ai.MedalType.AGAINST_ALL_ODDS, ai.MedalType.DIE_HARD, ai.MedalType.SENTINEL_SURVIVED_AND_WON, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_20 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 8,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_19 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "scientist",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "s1550_pve_bigship_building_2",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.DURATION, max_value = 10*60,},
			{ param = ai.GameEventParam.TAKEDOWNS, min_value = 20, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_21 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 8,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_20 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "federation_officer",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.CARGO_CONTRACT, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_22 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 8,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_21 },
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	ui_reward = "reward_items",
	character = "general",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "pve_jericho_base",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.TAKEDOWNS, min_value = 50, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_23 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_22 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "lamarr",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.PLANT_BOMB, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_24 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_23 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		marked_zone_id	= { SpaceZone.Federation_Frontier.zone_id },
		hud_marker_defs = { "C_Smuggler_S_T3_tfrf" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Smuggler_S_T3_tfrf", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_Frontier.zone_id, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_24_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_24_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_24_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_25 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_24 },
	reward_items = { {"ship_part_craft_shield", 1 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "pve_frozen_station",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.DURATION, max_value = 11*60,},
			{ param = ai.GameEventParam.TAKEDOWNS, min_value = 15, },
			{ param = ai.GameEventParam.DEATHS, max_value = 0, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_26 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 10,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_25 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "federation_officer",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_27 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 10,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_26 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		marked_zone_id	= { SpaceZone.Federation_NalnifanShipyard3.zone_id },
		hud_marker_defs = { "C_MediumCrystallid_L_T4_wfr9" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_MediumCrystallid_L_T4_wfr9", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_27_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_27_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_27_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_28 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 10,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_27 },
	reward_items = { {"ship_part_craft_engine", 1 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.KILLING_SPREE, ai.MedalType.ASSIST_SPREE, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_29 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 11,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_28 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.FIRST_BLOOD, ai.MedalType.DRONE_FIRST_BLOOD, ai.MedalType.SENTINEL_KILLED, ai.MedalType.VITAL_POINT_FIRST_CAPTURE, ai.MedalType.SENTINEL_KILLED_SENTINEL, ai.MedalType.FIRST_BOMB_PICK_UP, ai.MedalType.DANGEROUS_CARRIER, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_30 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 11,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_29 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.CARGO_CONTRACT, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_31 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 11,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_30 },
	reward_items = { {"ship_part_craft_armor", 1 }, },
	ui_reward = "reward_items",
	character = "federation_officer",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.LONG_SHOT, ai.MedalType.HANDSFREE, ai.MedalType.PLASMA_SPIDER, ai.MedalType.BLIND_RAGE, ai.MedalType.LONG_SHOT_ROCKET, ai.MedalType.HATE_CAMPERS_ROCKET, ai.MedalType.SHIELD_PIERCING, ai.MedalType.SHIELD_ABSORPTION, ai.MedalType.SAVED_BY_THE_COCOON, ai.MedalType.NOT_SO_INVULNERABLE, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_32 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 12,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_31 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "jericho_officer",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		marked_zone_id	= { SpaceZone.Jericho_IsidGateMaseera.zone_id },
		hud_marker_defs = { "C_Cyber_M_T5_s_jrp", "C_CyberPatrol_M_T5_s_jrp", "C_CyberAttacker_M_T5_s_jrp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Cyber_M_T5_s_jrp", "C_CyberPatrol_M_T5_s_jrp", "C_CyberAttacker_M_T5_s_jrp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_32_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_32_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_32_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_33 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 12,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_32 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "jericho_officer",
	battleType = ai.QuestBattleType.PVE,
	battleMap = "s1550_pve_asteroid_building",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.DURATION, max_value = 13*60,},
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_34 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 12,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_33 },
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	ui_reward = "reward_items",
	character = "jericho_officer",
	give_items = {"ow_QuestLootLunar_cq34key"},
	drop_item = "ow_QuestLootLunar_cq34",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 3,
		marked_zone_id	= { SpaceZone.ow_lunar.zone_id },
		accessibleZoneIds = { SpaceZone.ow_lunar.zone_id },
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_lunar.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootLunar_cq34", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_lunar.zone_id,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_34_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_34_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_35 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 13,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_34 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "emp_major",
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_empfrontier_waves_T1",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_transit_emp_rock_frontier", }, },
			{ param = ai.GameEventParam.TAKEDOWNS, min_value = 30, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_36 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 13,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_35 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.CARGO_CONTRACT, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_37 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 13,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_36 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.KILL_FROM_THE_GRAVE, ai.MedalType.REVENGE, ai.MedalType.RAM, ai.MedalType.CLOSE_CALL, ai.MedalType.KILLJOY, ai.MedalType.BROS_TO_THE_END, ai.MedalType.AVENGER, ai.MedalType.HATE_CAMPERS, ai.MedalType.HANDSFREE, ai.MedalType.TORERO, ai.MedalType.WHY_SUCH_A_HURRY, ai.MedalType.SPOTTED, ai.MedalType.NEMESIS, ai.MedalType.NEMESIS_REVENGE, ai.MedalType.ONE_SHOT_ROCKET, ai.MedalType.RANK_IS_TOO_DAMN_HIGH, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_38 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 14,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_37 },
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		marked_zone_id	= { SpaceZone.Jericho_Frontier.zone_id },
		accessibleZoneIds = { SpaceZone.Jericho_Frontier.zone_id },
		hud_marker_defs = { "C_AIVesselAngry_S_T5_mjrf" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_AIVesselAngry_S_T5_mjrf", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_Frontier.zone_id,
			dialogs  = {{ character = "jer_captain",
						text = "quest_CAMPAIGN_QUEST_38_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
						text = "quest_CAMPAIGN_QUEST_38_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "jer_captain",
						text = "quest_CAMPAIGN_QUEST_38_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_39 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 14,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_38 },
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	character = "jericho_officer",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_40 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 14,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_39 },
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 15,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_41 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 15,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_40 },
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "emp_major",
	give_items = {"ow_PortalCampaignQuestAkey","ow_PortalCampaignQuestBkey","ow_PortalCampaignQuestCkey","ow_PortalCampaignQuestDkey"},
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value	= 3,
		marked_zone_id	= { SpaceZone.ow_bion.zone_id },
		accessibleZoneIds = { SpaceZone.ow_bion.zone_id },
		hud_marker_defs = { "OpenWorld_PortalCampaignQuest_a", "OpenWorld_PortalCampaignQuest_b", "OpenWorld_PortalCampaignQuest_c", " OpenWorld_PortalCampaignQuest_d" },
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_bion.zone_id, }, },
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_PortalCampaignQuest_a", "OpenWorld_PortalCampaignQuest_b", "OpenWorld_PortalCampaignQuest_c", " OpenWorld_PortalCampaignQuest_d", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_bion.zone_id,
			dialogs  = {{ character = "lamarr",
						text = "quest_CAMPAIGN_QUEST_41_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "federation_officer",
						text = "quest_CAMPAIGN_QUEST_41_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "jericho_officer",
						text = "quest_CAMPAIGN_QUEST_41_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_42 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 15,
	openspace = true,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_41 },
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "lamarr",
	spawn_ai_squad = "cHostile1_Patrol1",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		marked_zone_id	= { SpaceZone.ow_bion.zone_id },
		accessibleZoneIds = { SpaceZone.ow_bion.zone_id },
		hud_marker_defs = { "C_Quest_BadScience_eeeb" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_BadScience_eeeb", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_bion.zone_id, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_bion.zone_id,
			dialogs  = {{ character = "lamarr",
						text = "quest_CAMPAIGN_QUEST_42_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "lamarr",
						text = "quest_CAMPAIGN_QUEST_42_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.CAMPAIGN_QUEST_43 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 15,
	unlocks_after_all        = { QuestId.CAMPAIGN_QUEST_42 },
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "scientist",
	stages = {{
		game_event = ai.GameEvent.ACQUIRE_SHIP,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_H_T4","Ship_Race2_H_T4","Ship_Race3_H_T4", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_1 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 2,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 15000,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_2 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 2,
	locks_on_account_rank = 3,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 10000,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_3 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 4,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_4 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 4,
	locks_on_account_rank = 5,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "scientist",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 1000, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_5 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 5,
	locks_on_account_rank = 6,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 15000,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_6 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 7,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "scientist",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 8,
		restrictions ={
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_7 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 7,
	locks_on_account_rank = 8,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 1500, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_8 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 8,
	locks_on_account_rank = 9,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.TAKEDOWNS, min_value = 50, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_9 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 9,
	locks_on_account_rank = 10,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_10 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 10,
	locks_on_account_rank = 11,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 2000, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_11 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 12,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "federation_officer",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 40,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_12 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 12,
	locks_on_account_rank = 13,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "jericho_officer",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 50000,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_13 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 13,
	locks_on_account_rank = 14,
	reward_rank_up = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 100,
		restrictions ={
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_14 ] = {
	disabled = true,
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 14,
	locks_on_account_rank = 15,
	reward_rank_up = true,
	reward_tokens = 100,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 15,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_15 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 15,
	locks_on_account_rank = 16,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "scientist",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 2500, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_16 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 17,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CLANSHIP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_17 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 17,
	locks_on_account_rank = 18,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 3, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_18 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 18,
	locks_on_account_rank = 19,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.BULLET_SPONGE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 3, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_19 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 19,
	locks_on_account_rank = 20,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 4, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_20 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 20,
	locks_on_account_rank = 21,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.DOUBLE_DOUBLE, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_21 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 21,
	locks_on_account_rank = 22,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.SMALL_CLASS_SPREE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 4, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_22 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 22,
	locks_on_account_rank = 23,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.RAILGUN_SPREE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 3, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_23 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 23,
	locks_on_account_rank = 24,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  14,  },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.KILLING_SPREE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 4, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.LEVEL_UP_CHAIN_24 ] = {
	category = QuestCategory.LEVEL_UP,
	unlocks_on_account_rank = 24,
	locks_on_account_rank = 25,
	reward_rank_up = true,
	reward_tokens = 150,
	reward_account_aura = "Bundle_LevelUp_T5_Discount",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 3500, },
			{ param = ai.GameEventParam.EFFECTIVE_PLACE, max_value = 1, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.BATTLEPASS_TREASURE_QUEST ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	hidden = true,
	stages = {{
		game_event = ai.GameEvent.GAIN_RESOURCE,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "BP_TreasureMap", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.NEW_GROUND_START ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 15,
	openspace = true,
	auto_accept = true,
	auto_complete = true,
	reward_tokens = 100,
	ui_reward = "reward_tokens",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		marked_zone_id	= { SpaceZone.Precursor_Zona3.zone_id },
		hud_marker_defs = { "Adventure_Giver_LarrySeldon" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_NewGround_Device", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.NEW_GROUND_END ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 15,
	auto_accept = true,
	auto_complete = true,
	unlocks_after_all        = { QuestId.NEW_GROUND_START },
	reward_account_aura = "NewGround_End",
	ui_reward = "reward_account_aura",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_NewGround_Lost", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.ROP2025_START ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	openspace = true,
	auto_accept = true,
	auto_complete = true,
	reward_tokens = 125,
	ui_reward = "reward_tokens",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_RoP2025_Device", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "ellidium_girl",
						text = "quest_ROP2025_START_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.ROP2025_END ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	unlocks_after_all        = { QuestId.ROP2025_START },
	reward_account_aura = "NewGround_End",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_NewGround_Lost", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025HintMeter_1 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	event_day_min = 10,
	event_day_max = 24,
	reward_account_aura = "Bundle_RoP2025HintMeter_1",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.RoP2025_Hint, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025HintMeter_2 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	event_day_min = 10,
	event_day_max = 24,
	reward_account_aura = "Bundle_RoP2025HintMeter_2",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 2,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.RoP2025_Hint, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025HintMeter_3 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	event_day_min = 10,
	event_day_max = 24,
	reward_account_aura = "Bundle_RoP2025HintMeter_3",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.RoP2025_Hint, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025HintMeter_4 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	event_day_min = 10,
	event_day_max = 24,
	reward_account_aura = "Bundle_RoP2025HintMeter_4",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 4,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.RoP2025_Hint, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025HintMeter_5 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	event_day_min = 10,
	event_day_max = 24,
	reward_account_aura = "Bundle_RoP2025HintMeter_4",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.RoP2025_Hint, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.RoP2025Hint_1 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.RoP2025_Hint,
	event_day_min = 11,
	event_day_max = 24,
	reward_items = { {"ow_Silicon_wafer", 1 }, },
	ui_reward = "reward_items",
	character = "RoP2025",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.WALL_HUGGER_0, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Hint_1_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Hint_2 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.RoP2025_Hint,
	event_day_min = 12,
	event_day_max = 24,
	reward_items = { {"ow_Impure_iridium", 1 }, },
	ui_reward = "reward_items",
	character = "RoP2025",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.WALL_HUGGER_0, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Hint_2_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Hint_3 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.RoP2025_Hint,
	event_day_min = 13,
	event_day_max = 24,
	reward_items = { {"ow_Osmium_ore", 1 }, },
	ui_reward = "reward_items",
	character = "RoP2025",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.WALL_HUGGER_0, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Hint_3_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Hint_4 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.RoP2025_Hint,
	event_day_min = 14,
	event_day_max = 24,
	reward_items = { {"ow_Tungsten_ore", 1 }, },
	ui_reward = "reward_items",
	character = "RoP2025",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.WALL_HUGGER_0, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Hint_4_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Hint_5 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.RoP2025_Hint,
	event_day_min = 15,
	event_day_max = 24,
	reward_items = { {"ow_Crystal_shard", 1 }, },
	ui_reward = "reward_items",
	character = "RoP2025",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.WALL_HUGGER_0, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Hint_5_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_1 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-09T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 500, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_2 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-10T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_3 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	openspace = true,
	intervalStartHour = "2025-05-11T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.FREE_SPACE, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_4 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-12T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_5 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-13T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 30,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.RANK_IS_TOO_DAMN_HIGH, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 30,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_6 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-14T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.GuidedMissile,  ItemSubtype.ClusterTorpedo,  ItemSubtype.ProtozanTorpedo,  ItemSubtype.Mauler_GuidedMissile,  ItemSubtype.AvengersGuidedMissile, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.RoP2025Ammo_7 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	intervalStartHour = "2025-05-15T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 168,
	reward_items = { {"WeaponMod_Laser_Alien_Killer2", 1 }, {"WeaponMod_Plasma_Alien_Killer2", 1 }, {"WeaponMod_Rail_Alien_Killer2", 1 } },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "RoP2025",
						text = "quest_RoP2025Ammo_dialog", }} },
		}
	},
	},
}

Quests[ QuestId.ROP2025_2_START_HIDDEN ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	openspace = true,
	auto_accept = true,
	auto_complete = true,
	hidden = true,
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_RoP2025_2_Device", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.ROP2025_2_START ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 3,
	openspace = true,
	auto_accept = true,
	auto_complete = true,
	unlocks_after_all        = { QuestId.ROP2025_2_START_HIDDEN },
	reward_tokens = 500,
	ui_reward = "reward_tokens",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_RoP2025_2_Device", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "pve_irodr",
						text = "quest_ROP2025_2_START_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_1 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Iridium_plate", 25 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 70000,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.ParticleExplosion, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_2 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Iridium_monocrystall", 250 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.DEFEND_ALLY,
		required_value	= 25,
		restrictions ={
			{ param = ai.GameEventParam.PVP, num_value = { 1, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_3 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Pure_silicon", 100 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 200000,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.FrigateDrone, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_4 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Explosion", 25 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.APPLY_BUFF,
		required_value	= 250,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.CommandArmorResist, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_5 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Tungsten_plate", 25 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 100000,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.MatterFlow, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  6,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_6 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Aliens_ship_part", 250 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 3,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.KILLJOY, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_7 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	group = QuestGroupId.WeekyKnickers,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.WeekyKnickers_FIN,
	reward_items = { {"Computing_chip", 100 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.APPLY_BUFF,
		required_value	= 100,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.MacheteFury, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  5,  },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.WeekyKnickers_FIN ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 9,
	auto_complete = true,
	intervalStartHour = "2025-09-19T06:00:00Z",
	intervalLongEnableHours = 168,
	intervalLongHours = 168,
	reward_account_aura = "WeekyKnickers_Revard",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 6,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.WeekyKnickers, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.NewbieAffairs_1 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 4,
	reward_account_aura = "NewbieHarpy_Revard",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.COOP, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.NewbieAffairs_2 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	unlocks_after_all        = { QuestId.NewbieAffairs_1 },
	reward_credits        = 200000,
	ui_reward = "reward_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_L_T1", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.NewbieAffairs_3 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	unlocks_after_all        = { QuestId.NewbieAffairs_2 },
	reward_account_aura = "NewbieKingDvergr_Revard",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.ACQUIRE_SHIP,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T1_Faction1", }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.A25FOR30_1 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.A25FOR30OS1,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	event_day_min = 62,
	event_day_max = 69,
	reward_items = { {"Aliens_ship_part", 2000 }, },
	reward_account_aura = "A25FOR30_1",
	ui_reward = "reward_items",
	character = "general",
	spawn_ai_squad = "Pirate_Patrol9",
	battlePoint = "ow_dreadnwreck",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_edw_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_dreadnwreck.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T2_Faction1", }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_dreadnwreck.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_1_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_2 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_1",
	group = QuestGroupId.A25FOR30OS2,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	event_day_min = 63,
	event_day_max = 70,
	reward_account_aura = "A25FOR30_2Rev",
	ui_reward = "reward_account_aura",
	character = "general",
	spawn_ai_squad = "A25FOR30_2_Squad",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race5_L_GUARD_Rank15_promo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T1_Faction1","Ship_Race1_S_T1_Premium", }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_2_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_3 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_2",
	group = QuestGroupId.A25FOR30OS3,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	event_day_min = 64,
	event_day_max = 71,
	reward_account_aura = "A25FOR30_3Rev",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race5_L_GUARD_Rank15_promo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_ancientcomplex.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race2_L_T2", }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_ancientcomplex.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_3_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_4 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	group = QuestGroupId.A25FOR30PV1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.B25FOR30PV1_FIN,
	reward_credits        = 5000000,
	ui_reward = "reward_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 15,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.DEFEND_BEACON, }, },
			{ param = ai.GameEventParam.PVP, num_value = { 1, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  11,  },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_4_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_5 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	group = QuestGroupId.A25FOR30PV1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.B25FOR30PV1_FIN,
	reward_gold_credits = 2000,
	ui_reward = "reward_gold_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 250000,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.CalibrationGrenade, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  11,  },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 25000,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_5_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_6 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	group = QuestGroupId.A25FOR30PV1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.B25FOR30PV1_FIN,
	reward_items = { {"Iridium_monocrystall", 250 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 15,
		restrictions ={
			{ param = ai.GameEventParam.RACE, num_value = { ai.Race.EMPIRE, ai.Race.FEDERATION, ai.Race.JERICHO, ai.Race.SPECIAL, }, },
			{ param = ai.GameEventParam.ENEMY_RACE, num_value = { ai.Race.CRYSTAL, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_6_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_7 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	group = QuestGroupId.A25FOR30PV1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.B25FOR30PV1_FIN,
	reward_tokens = 500,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.RACE, num_value = { ai.Race.CRYSTAL, ai.Race.FEDERATION, }, },
			{ param = ai.GameEventParam.ENEMY_RACE, num_value = { ai.Race.EMPIRE, ai.Race.JERICHO, ai.Race.SPECIAL, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_7_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30PV1_FIN ] = {
	disabled = true,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	auto_accept = true,
	auto_complete = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	ui_reward = "reward_account_aura",
	character = "general",
	hidden = true,
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 12,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.A25FOR30PV1, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.B25FOR30PV1_FIN ] = {
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	auto_accept = true,
	auto_complete = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	ui_reward = "reward_account_aura",
	character = "general",
	hidden = true,
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 12,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.A25FOR30PV1, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.A25FOR30_8 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_3",
	group = QuestGroupId.A25FOR30OS4,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all        = { QuestId.B25FOR30PV1_FIN },
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_account_aura = "A25FOR30_8Rev",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race5_S_T5_Ace_promo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.EnergyLance, ItemSubtype.EnergyLanceAura, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race2_S_T4_Glass", }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_8_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_8_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_9 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_8",
	group = QuestGroupId.A25FOR30OS5,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_account_aura = "A25FOR30_9Rev",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 1,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race2_L_T5_Carolingian_promo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Precursor_Zona2.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona2.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_9_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_9_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_10 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_9",
	group = QuestGroupId.A25FOR30OS6,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_account_aura = "A25FOR30_10Rev",
	ui_reward = "reward_account_aura",
	character = "general",
	give_items = {"ow_A25FOR30_10_cwkey"},
	drop_item = "ow_A25FOR30_10_cw",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateCarib.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_A25FOR30_10_cw", }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_10_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_10_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_10_dialog3", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_11 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_10",
	group = QuestGroupId.A25FOR30PV2,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_credits        = 5000000,
	ui_reward = "reward_credits",
	character = "general",
	give_items = {"ow_A25FOR30_11_cwkey"},
	drop_item = "ow_A25FOR30_11_cw",
	battlePoint = "Jericho_JerichoBase",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 7,
		marked_zone_id	= { SpaceZone.Jericho_JerichoBase.zone_id },
		hud_marker_defs = { "OpenWorld_A25FOR30_11_cw" },
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_JerichoBase.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_A25FOR30_11_cw", }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_JerichoBase.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_11_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_11_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_12 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_10",
	group = QuestGroupId.A25FOR30PV2,
	openspace = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_gold_credits = 2000,
	ui_reward = "reward_gold_credits",
	character = "general",
	give_items = {"ow_A25FOR30_12_cwkey"},
	drop_item = "ow_A25FOR30_12_cw",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_planet_war.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_A25FOR30_12_cw", }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_planet_war.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_12_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_12_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_13 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_10",
	group = QuestGroupId.A25FOR30PV2,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_items = { {"Iridium_monocrystall", 250 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 10,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.ASSIST_BOMBER, }, },
			{ param = ai.GameEventParam.PVP, num_value = { 1, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  11,  },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_13_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_14 ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	required_account_aura = "A25FOR30_10",
	group = QuestGroupId.A25FOR30PV2,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.A25FOR30_FINAL,
	reward_tokens = 500,
	ui_reward = "reward_tokens",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 15,
		restrictions ={
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.KILL_BOMBER, }, },
			{ param = ai.GameEventParam.PVP, num_value = { 1, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_14_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.A25FOR30_FINAL ] = {
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 7,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 62,
	event_day_max = 91,
	intervalStartHour = "2026-06-01T06:00:00Z",
	intervalLongEnableHours = 720,
	intervalLongHours = 720,
	max_completions = 1,
	reward_account_aura = "A25FOR30_FINALRevard",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 25,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.A25FOR30OS1, QuestGroupId.A25FOR30OS2, QuestGroupId.A25FOR30OS3, QuestGroupId.A25FOR30PV1, QuestGroupId.A25FOR30OS4, QuestGroupId.A25FOR30OS5, QuestGroupId.A25FOR30OS6, QuestGroupId.A25FOR30PV2, }, },
		},
		info_events = {
		}
	},
	},
}

Quests[ QuestId.QTEST_1 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	required_account_aura = "QTEST_1",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	intervalStartHour = "2025-12-01T06:00:00Z",
	intervalLongEnableHours = 8640,
	intervalLongHours = 8640,
	reward_items = { {"WeaponMod_Laser_Huge_Killer", 5 }, {"WeaponMod_Plasma_Huge_Killer", 5 }, {"WeaponMod_Rail_Huge_Killer", 5 } },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race1_L_T1","Ship_Race1_L_T2","Ship_Race1_L_T3","Ship_Race1_L_T4","Ship_Race1_L_T1_Faction1","Ship_Race1_L_T1_Faction2","Ship_Race1_L_T2_Faction2","Ship_Race1_L_T1_Premium","Ship_Race1_L_T2_Premium","Ship_Race1_L_T3_Premium","Ship_Race1_L_T4_PremUniq","Ship_Race5_L_T5_Helios","Ship_Race2_L_T2","Ship_Race2_L_T2_Faction1","Ship_Race2_L_T3_Faction1","Ship_Race2_L_T4_Faction1","Ship_Race2_L_T3_Premium","Ship_Race2_L_T1_Exorcist","Ship_Race2_L_T2_Steam","Ship_Race2_L_T3_Dlc","Ship_Preset_R1_L_T3","Ship_Preset_R1_L_T3_Premium","Ship_Preset_R2_L_T3_Faction1","Ship_Preset_R2_L_T4_Faction1","Ship_Preset_R2_L_T3_Premium","Ship_PresetE_R1_L_T5","Ship_PresetE_R1_L_T4_Faction2","Ship_PresetE_R1_L_T4_Premium","Ship_PresetE_R1_L_T5_Premium","Ship_Preset_R1_L_T4","Ship_Race1_L_T4_Glass", }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.ROLE, num_value = { ai.ShipRoles.SNIPER, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  11,  },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_13_dialog1", }} },
		}
	},
	},
}

Quests[ QuestId.QTEST_2 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	required_account_aura = "QTEST_1",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	intervalStartHour = "2025-12-01T06:00:00Z",
	intervalLongEnableHours = 8640,
	intervalLongHours = 8640,
	reward_gold_credits = 150,
	ui_reward = "reward_gold_credits",
	character = "general",
	give_items = {"ow_A25FOR30_12_cwkey"},
	drop_item = "ow_A25FOR30_12_cw",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_planet_war.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_A25FOR30_12_cw", }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_planet_war.zone_id,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_12_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_12_dialog2", }} },
		}
	},
	},
}

Quests[ QuestId.QTEST_3 ] = {
	disabled = true,
	category = QuestCategory.STORY,
	unlocks_on_account_rank = 1,
	required_account_aura = "QTEST_1",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	intervalStartHour = "2025-12-01T06:00:00Z",
	intervalLongEnableHours = 8640,
	intervalLongHours = 8640,
	reward_items = { {"Explosion", 5 }, },
	ui_reward = "reward_items",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 5,
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Ship_Race1_L_T1","Ship_Race1_L_T2","Ship_Race1_L_T3","Ship_Race1_L_T4","Ship_Race1_L_T1_Faction1","Ship_Race1_L_T1_Faction2","Ship_Race1_L_T2_Faction2","Ship_Race1_L_T1_Premium","Ship_Race1_L_T2_Premium","Ship_Race1_L_T3_Premium","Ship_Race1_L_T4_PremUniq","Ship_Race5_L_T5_Helios","Ship_Race2_L_T2","Ship_Race2_L_T2_Faction1","Ship_Race2_L_T3_Faction1","Ship_Race2_L_T4_Faction1","Ship_Race2_L_T3_Premium","Ship_Race2_L_T1_Exorcist","Ship_Race2_L_T2_Steam","Ship_Race2_L_T3_Dlc","Ship_Preset_R1_L_T3","Ship_Preset_R1_L_T3_Premium","Ship_Preset_R2_L_T3_Faction1","Ship_Preset_R2_L_T4_Faction1","Ship_Preset_R2_L_T3_Premium","Ship_PresetE_R1_L_T5","Ship_PresetE_R1_L_T4_Faction2","Ship_PresetE_R1_L_T4_Premium","Ship_PresetE_R1_L_T5_Premium","Ship_Preset_R1_L_T4","Ship_Race1_L_T4_Glass", }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, }, },
			{ param = ai.GameEventParam.ROLE, num_value = { ai.ShipRoles.OVERSEER, }, },
			{ param = ai.GameEventParam.MAX_RANK_IN_SLOT, max_value =  11,  },
		},
		info_events = {
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general",
						text = "quest_A25FOR30_13_dialog1", }} },
		}
	},
	},
}


----------------------------------------
-- checklist
----------------------------------------

Quests[ QuestId.CHECKLIST_EFFICIENCY_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 5000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_EFFICIENCY_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 5000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_EFFICIENCY_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 5000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_EFFICIENCY_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 5000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_EFFICIENCY_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 5000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_WINS_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_WINS_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_WINS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_WINS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_WINS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_DAMAGE_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 100000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_DAMAGE_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 100000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_DAMAGE_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 100000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_DAMAGE_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 100000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_DAMAGE_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 100000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_THERMAL_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_THERMAL_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_THERMAL_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_THERMAL_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_THERMAL_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PLASMA_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PLASMA_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PLASMA_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PLASMA_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PLASMA_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KINET_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KINET_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KINET_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KINET_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KINET_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_KILLS_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_KILLS_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_KILLS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_KILLS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_KILLS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_1,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 30,
		restrictions = {
		},
	},},
}

Quests[ QuestId.CHECKLIST_INTERCEPTORS_2 ] = {
	unlocks_on_account_rank = 8,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.SMALL, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_INTERCEPTORS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.SMALL, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_INTERCEPTORS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.SMALL, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_INTERCEPTORS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Tungsten_ore", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.SMALL, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FRIGATES_2 ] = {
	unlocks_on_account_rank = 8,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FRIGATES_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FRIGATES_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FRIGATES_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FIGHTERS_2 ] = {
	unlocks_on_account_rank = 8,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.MEDIUM, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FIGHTERS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.MEDIUM, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FIGHTERS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.MEDIUM, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_FIGHTERS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.MEDIUM, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_DESTROYERS_2 ] = {
	unlocks_on_account_rank = 8,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_DESTROYERS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_DESTROYERS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_DESTROYERS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_2,
	auto_accept = true,
	reward_items = { {"ow_Osmium_ore", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVP_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVP_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVP_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVP_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Silicon_wafer", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVE_1 ] = {
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVE_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVE_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVE_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_PVE_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Impure_iridium", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_OS_2 ] = {
	unlocks_on_account_rank = 6,
	locks_on_account_rank = 11,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 8 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_OS_3 ] = {
	unlocks_on_account_rank = 11,
	locks_on_account_rank = 16,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_OS_4 ] = {
	unlocks_on_account_rank = 16,
	locks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 12 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.CHECKLIST_OS_5 ] = {
	unlocks_on_account_rank = 21,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.CHECKLIST_GROUP_3,
	auto_accept = true,
	reward_items = { {"ow_Crystal_shard", 15 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.BFS ] = {
	unlocks_on_account_rank = 7,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.BFS,
	reward_items = { {"Iridium_monocrystall", 5 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CLANSHIP, }, },
		},
	},},
}

Quests[ QuestId.SECCON_BATTLE_2 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.BFS,
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 1000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 5, },
		},
	},},
}

Quests[ QuestId.LEAGUES ] = {
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.LEAGUES,
	reward_items = { {"Iridium_monocrystall", 5 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CAPTURE_THE_BASE, }, },
		},
	},},
}

Quests[ QuestId.LEAGUES_1 ] = {
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.LEAGUES_MO,
	reward_items = { {"Iridium_monocrystall", 3 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CAPTURE_THE_BASE, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 700, },
		},
	},},
}

Quests[ QuestId.LEAGUES_2 ] = {
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.LEAGUES_MO,
	reward_items = { {"Aliens_ship_part", 3 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CAPTURE_THE_BASE, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MAX_RACE_RANK_IN_SLOT, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.LEAGUES_3 ] = {
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.LEAGUES_MO,
	reward_items = { {"Aliens_ship_part", 3 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 25,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.CAPTURE_THE_BASE, }, },
		},
	},},
}

Quests[ QuestId.INGAME_TIME_2 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.INGAME_TIME_WEEKLY,
	auto_accept = true,
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.ONLINE,
		required_value	= 14 * 60 * 60 * 1000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.INGAME_TIME_1 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.INGAME_TIME_MONTHLY,
	auto_accept = true,
	reward_account_aura = "Bundle_QuestGoldReplacer",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 60,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.INGAME_TIME_WEEKLY, QuestGroupId.CHECKLIST_GROUP_1, QuestGroupId.CHECKLIST_GROUP_2, QuestGroupId.CHECKLIST_GROUP_3, QuestGroupId.INGAME_TIME_DAILY, }, },
		},
	},},
}

Quests[ QuestId.HUNGER ] = {
	unlocks_on_account_rank = 8,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.HUNGER,
	reward_items = { {"hunger_craft", 4 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.HUNGER_GAMES, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_01 ] = {
	unlocks_on_account_rank = 2,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-27T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 20,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_02 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-26T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.PLANT_BOMB, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_03 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-25T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_04 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-24T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 20000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_05 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-23T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "Bonus_QuadDamage","OpenWorld_Bonus_QuadDamage","Bonus_DM_QuadDamage","Bonus_QuadDamage_Levi","Bonus_PVE_Damage_Self", }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_06 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-22T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Bonus_HealHull", "Bonus_HealHull", "Bonus_DM_HealHull", "Bonus_PVE_Heal_S", "Bonus_PVE_Heal_All", }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_07 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-21T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "Bonus_SpeedUp", "Bonus_DM_SpeedUp", "Bonus_PVE_SpeedUp", }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_08 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-20T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 1000000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_09 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-19T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.KILL_OBJECT,
		required_value	= 5,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_10 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-18T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.DEFEND_ALLY,
		required_value	= 10,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_11 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-17T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 500000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_12 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-16T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.APPLY_BUFF,
		required_value	= 25,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_13 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-15T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.APPLY_DEBUFF,
		required_value	= 25,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_14 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-14T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_15 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-13T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE_BUFFED,
		required_value	= 1500000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_16 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-12T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 5,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_17 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-11T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value	= 20,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_18 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-10T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value	= 20,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_19 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-09T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.TAKE_DAMAGE_BUFFED,
		required_value	= 500000,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_20 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-08T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.SPOTTED, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_21 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-07T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.JOIN_SQUAD,
		required_value	= 1,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_22 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-06T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 5,
		restrictions = {
			{ param = ai.GameEventParam.ROLE, num_value = { ai.ShipRoles.ECM, ai.ShipRoles.SCOUT, ai.ShipRoles.RECON, ai.ShipRoles.ATTACK, ai.ShipRoles.COMMAND, ai.ShipRoles.TACKLER, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, ai.ShipClass.HUGE, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_23 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-05T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.FILL_BATTLE_SLOT,
		required_value	= 8,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_24 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-04T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.LEARN_BLUEPRINT,
		required_value	= 1,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_25 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-03T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.ONLINE,
		required_value	= 1000 * 60 * 60 * 2,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_26 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-02T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.UPGRADE_ITEM,
		required_value	= 20,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_27 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-06-01T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.MAINTAIN_SHIP,
		required_value	= 15,
		restrictions = {
		},
	},},
}

Quests[ QuestId.BP_DAILY_28 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-05-31T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.PICK_UP_BOMB, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_29 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-05-30T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.FIRST_BLOOD, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.BP_DAILY_30 ] = {
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_credits = 25000,
	ui_reward = "reward_credits",
	modify_rewards = true,
	intervalStartHour = "2022-05-29T06:00:00Z",
	intervalLongHours = 102,
	intervalLongEnableHours = 24,
	max_completions = 1,
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.REVENGE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_1_1 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 10000,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  1,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_1_2 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 400000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  1,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_1_3 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 65,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  1,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_2_1 ] = {
	disabled = true,
	unlocks_on_account_rank = 7,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value	= 15000,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  7,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_2_2 ] = {
	disabled = true,
	unlocks_on_account_rank = 7,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 1500000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  7,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVP_2_3 ] = {
	disabled = true,
	unlocks_on_account_rank = 7,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 30,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 100,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  7,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVE_1 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	locks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  1,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVE_2 ] = {
	disabled = true,
	unlocks_on_account_rank = 7,
	locks_on_account_rank = 12,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  7,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_PVE_3 ] = {
	disabled = true,
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  12,  },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_OW_1 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_3,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.XENOCHIPS_OW_2 ] = {
	disabled = true,
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_4,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 15,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVP_1 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.BULLET_SPONGE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVP_2 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVP_3 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 5,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
	},},
}

Quests[ QuestId.EVENT_PVP_4 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_1,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVE_1 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.DEATHS, max_value = 1, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVE_2 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.DURATION, max_value =10*60,},
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.EVENT_PVE_3 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_2,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.EVENT_ALL_1 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_3,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value	= 50,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
		},
	},},
}

Quests[ QuestId.EVENT_ALL_2 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_3,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 800, },
		},
	},},
}

Quests[ QuestId.EVENT_ALL_3 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_3,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value	= 250000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
		},
	},},
}

Quests[ QuestId.EVENT_ALL_4 ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_3,
	reward_event_credits = 5,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value	= 150000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
		},
	},},
}

Quests[ QuestId.EVENT_TASK_COMPLITE ] = {
	unlocks_on_account_rank = 3,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.XENOCHIPS_4,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value	= 5,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.XENOCHIPS_1, QuestGroupId.XENOCHIPS_2, QuestGroupId.XENOCHIPS_3 , }, },
		},
	},},
}


----------------------------------------
-- event
----------------------------------------

Quests[ QuestId.UFO_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest1_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_1 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest2_Discount",
	ui_reward = "reward_account_aura",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_2 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest3_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_3 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest4_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_4 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest5_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_5 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest6_Discount",
	ui_reward = "reward_account_aura",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_6 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest7_Discount",
	ui_reward = "reward_account_aura",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_8 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_7 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest8_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_9 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_8 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest9_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_10 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_9 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest10_Discount",
	ui_reward = "reward_account_aura",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.UFO_11 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.UFO_10 },
	event_day_min = 27,
	event_day_max = 99,
	reward_account_aura = "Bundle_NY2018_Pizza_T1_Chest11_Discount",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 0,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.FRANCISCA_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.FRANCISCA_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 20,
	reward_items = { {"ship_part_Race3_L_T5_Comodo", 15 },  },
	ui_reward = "reward_items",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
			{ param = ai.GameEventParam.IN_SQUAD, num_value = { 0 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.FRANCISCA_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.FRANCISCA_2,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 20,
	reward_items = { {"ship_part_Race3_L_T5_Comodo", 15 },  },
	ui_reward = "reward_items",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
			{ param = ai.GameEventParam.IN_SQUAD, num_value = { 0 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.FRANCISCA_1_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.FRANCISCA_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 20,
	reward_items = { {"ship_part_Race3_L_T5_Comodo", 30 },  },
	ui_reward = "reward_items",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 3, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MAX, max_value = 4, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.FRANCISCA_2_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.FRANCISCA_2,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 20,
	reward_items = { {"ship_part_Race3_L_T5_Comodo", 30 },  },
	ui_reward = "reward_items",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 3, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MAX, max_value = 4, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2018_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.HALLOWEEN_2018,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 22,
	reward_items = { {"Iridium_monocrystall", 8 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.IS_ROCKET, num_value = { 1 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2018_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.HALLOWEEN_2018,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 22,
	reward_items = { {"Iridium_monocrystall", 8 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 30,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2018_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.HALLOWEEN_2018,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 22,
	reward_items = { {"Iridium_monocrystall", 8 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		restrictions = {
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.BIRTHDAY2020 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 4,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 11,
	max_completions = 1,
	reward_account_aura = "Bundle_QuestEvent_Birthday2020",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.STAY_HOME ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 21,
	reward_account_aura = "Bundle_QuestEvent_StayHome",
	ui_reward = "reward_account_aura",
	character = "ellidium_girl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.BRAWL, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.RAVEN_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_temple_of_last_hope",
	event_day_min = 1,
	event_day_max = 9,
	intervalStartHour = "2020-08-24T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 48,
	reward_items = { {"Ship_Race3_L_T5_CraftSpec_part", 1 }, },
	ui_reward = "reward_items",
	character = "fed_major",
	stages = {{
		game_event = ai.GameEvent.KILL_OBJECT,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "PvE_Gen_Wave_Barque_T3", }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_temple_of_last_hope", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.RAVEN_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_temple_of_last_hope",
	event_day_min = 1,
	event_day_max = 9,
	intervalStartHour = "2020-08-25T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 48,
	reward_items = { {"Ship_Race3_L_T5_CraftSpec_part", 1 }, },
	ui_reward = "reward_items",
	character = "fed_engineer",
	stages = {{
		game_event = ai.GameEvent.KILL_OBJECT,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "PvE_Gen_Movement_Asteroid", }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_temple_of_last_hope", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 30,
	event_day_max = 30,
	reward_account_aura = "Bundle_Halloween_2020_1",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.BRAWL, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 400, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 31,
	event_day_max = 31,
	reward_account_aura = "Bundle_Halloween_2020_2",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 32,
	event_day_max = 32,
	reward_account_aura = "Bundle_Halloween_2020_3",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_4,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 33,
	event_day_max = 33,
	reward_account_aura = "Bundle_Halloween_2020_4",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 300, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_5,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 34,
	event_day_max = 34,
	reward_account_aura = "Bundle_Halloween_2020_5",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_6,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 35,
	event_day_max = 35,
	reward_gold_credits = 250,
	ui_reward = "reward_gold_credits",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 25,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 36,
	event_day_max = 36,
	reward_account_aura = "Bundle_Halloween_2020_7",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 1, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_2020_FINAL ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_8,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 30,
	event_day_max = 36,
	reward_account_aura = "Bundle_Halloween_2020_FINAL",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 7,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.MARATHON_1, QuestGroupId.MARATHON_2, QuestGroupId.MARATHON_3, QuestGroupId.MARATHON_4, QuestGroupId.MARATHON_5, QuestGroupId.MARATHON_6, QuestGroupId.MARATHON_7, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEW2021YEAR_GUN_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.NEW2021YEAR_GUN_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 72,
	event_day_max = 107,
	reward_account_aura = "Bundle_NEW2021YEAR_GUN_1",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.KING_OF_THE_HILL, ai.Gameplay.CAPTURE_THE_BASE, ai.Gameplay.CAPTURE_THE_BASE_2, ai.Gameplay.CONTROL, ai.Gameplay.LAST_MAN_STANDING, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEW2021YEAR_GUN_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.NEW2021YEAR_GUN_2,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 72,
	event_day_max = 107,
	reward_account_aura = "Bundle_NEW2021YEAR_GUN_2",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEW2021YEAR_GUN_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.NEW2021YEAR_GUN_3,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 72,
	event_day_max = 107,
	reward_account_aura = "Bundle_NEW2021YEAR_GUN_3",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value = 50000,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 95,
	event_day_max = 95,
	reward_account_aura = "Bundle_NewYear_2021_1",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.ONE_SHOT_ROCKET, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 96,
	event_day_max = 96,
	reward_account_aura = "Bundle_NewYear_2021_2",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 97,
	event_day_max = 97,
	reward_account_aura = "Bundle_NewYear_2021_3",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.ASSIST_SPREE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_4,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 98,
	event_day_max = 98,
	reward_account_aura = "Bundle_NewYear_2021_4",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 300, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_5,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 99,
	event_day_max = 99,
	reward_account_aura = "Bundle_NewYear_2021_5",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_6,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 100,
	event_day_max = 100,
	reward_gold_credits = 250,
	ui_reward = "reward_gold_credits",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 25,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 101,
	event_day_max = 101,
	reward_account_aura = "Bundle_NewYear_2021_7",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 1, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NEWYEAR_2021_FINAL ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_8,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 95,
	event_day_max = 101,
	reward_account_aura = "Bundle_NewYear_2021_FINAL",
	ui_reward = "reward_account_aura",
	character = "snowgirl",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 7,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.MARATHON_1, QuestGroupId.MARATHON_2, QuestGroupId.MARATHON_3, QuestGroupId.MARATHON_4, QuestGroupId.MARATHON_5, QuestGroupId.MARATHON_6, QuestGroupId.MARATHON_7, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SALYUT_XENO_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 21,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 15,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SALYUT_XENO_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 21,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value = 50000,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SALYUT_XENO_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 21,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SALYUT_XENO_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 21,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_START ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 50,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 400, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_LOYALTY_MAIN ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_account_aura = "Bundle_ProtazanEvent",
	ui_reward = "reward_account_aura",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 35,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.PROTOZAN_LOYALTY, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_LOYALTY_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.PROTOZAN_LOYALTY,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	acceptable_during = QuestId.PROTOZAN_LOYALTY_MAIN,
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 20,
	ui_reward = "reward_event_credits",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 50,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race2_S_T5_Faction1","Ship_Race2_S_T5_Premium","Ship_Race2_S_T5_Craft","Ship_Race2_S_T5_CraftUniq","Ship_Race2_M_T5_Faction2","Ship_Race2_M_T5_Premium","Ship_Race2_M_T5_Craft","Ship_Race2_M_T5_Singularity","Ship_Race2_M_T5_CraftSpec","Ship_Race2_L_T5_Faction2","Ship_Race2_L_T5_Premium","Ship_Race2_L_T5_Craft","Ship_Race2_L_T5_Francisca","Ship_Race2_L_T5_CraftUniq","Ship_Race2_L_T5_Protozan","Ship_Race2_H_T5_Relic", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_LOYALTY_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.PROTOZAN_LOYALTY,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	acceptable_during = QuestId.PROTOZAN_LOYALTY_MAIN,
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 18,
	ui_reward = "reward_event_credits",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 40,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race2_S_T5","Ship_Race2_S_T4_Faction1","Ship_Race2_S_T5_Faction2","Ship_Race2_S_T4_Premium","Ship_Race2_S_T4_Pirate","Ship_Race2_M_T5","Ship_Race2_M_T5_Faction1","Ship_Race2_M_T4_Faction2","Ship_Race2_M_T4_Premium","Ship_Race2_L_T5","Ship_Race2_L_T5_Faction1","Ship_Race2_L_T4_Faction2","Ship_Race2_L_T4_Premium","Ship_Race2_L_T5_Steam","Ship_Race2_H_T5","Ship_Race2_S_T5_Doctor", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_LOYALTY_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.PROTOZAN_LOYALTY,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	acceptable_during = QuestId.PROTOZAN_LOYALTY_MAIN,
	battleType = ai.QuestBattleType.PVE,
	battleMap = "pve_jericho_base",
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 22,
	ui_reward = "reward_event_credits",
	character = "jer_captain",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVE_MISSION, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 15, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 500, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_E1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 500, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_E2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value = 250000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_E3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value = 300000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_E4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_H1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 15,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 1000, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_H2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 15,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.BULLET_SPONGE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_H3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 15,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_H4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 15,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.MULTI_KILL, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_H5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 15,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.ONE_SHOT_ROCKET, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SQUAD ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.INGAME_TIME_DAILY_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.PROTOZAN_SKILL_ULTIMATE ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.PROTOZAN_START},
	event_day_min = 1,
	event_day_max = 41,
	reward_event_credits = 150,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.DOUBLE_DOUBLE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.BATTLEPASS_TREASURE_QUEST},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_1},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_2},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_3},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_4},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_5},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_6},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_CRAFT_8 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_7},
	event_day_min = 1,
	event_day_max = 100,
	stages = {{
		game_event = ai.GameEvent.CRAFT_ITEM,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "TreasureMap", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_1},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_1"},
	drop_item = "ow_BP22_Treasure_1",
	openspace = true,
	reward_account_aura = "TreasureMap_1",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_1" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_1", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_2},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_2"},
	drop_item = "ow_BP22_Treasure_2",
	openspace = true,
	reward_account_aura = "TreasureMap_2",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_2" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_2", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_3},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_3"},
	drop_item = "ow_BP22_Treasure_3",
	openspace = true,
	reward_account_aura = "TreasureMap_3",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_3" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_3", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_4},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_4"},
	drop_item = "ow_BP22_Treasure_4",
	openspace = true,
	reward_account_aura = "TreasureMap_4",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_4" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_4", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_5},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_5"},
	drop_item = "ow_BP22_Treasure_5",
	openspace = true,
	reward_account_aura = "TreasureMap_5",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_5" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_5", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_6},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_6"},
	drop_item = "ow_BP22_Treasure_6",
	openspace = true,
	reward_account_aura = "TreasureMap_6",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_6" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_6", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_7},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_7"},
	drop_item = "ow_BP22_Treasure_7",
	openspace = true,
	reward_account_aura = "TreasureMap_7",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_7" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_7", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.TREASURE_8 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.TREASURE_CRAFT_8},
	event_day_min = 1,
	event_day_max = 100,
	give_items = {"BP22_TreasureMap_8"},
	drop_item = "ow_BP22_Treasure_8",
	openspace = true,
	reward_account_aura = "TreasureMap_8",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_BP22_TreasureChest_8" },
		restrictions = {
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BP22_Treasure_8", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	battlePoint = "ow_gasgiant",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_Cultistic_key1","ow_Cultistic_key2"},
	openspace = true,
	reward_tokens = 15,
	ui_reward = "reward_tokens",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 2,
		hud_marker_defs = { "OpenWorld_Cultistic_Sing1", "OpenWorld_Cultistic_Sing2" },
		marked_zone_id  = SpaceZone.ow_gasgiant.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_Sing1", "OpenWorld_Cultistic_Sing2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "halloween",
			text = "quest_HALLOWEEN_WITCH_AGENT_1_dialog1", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_1},
	battlePoint = "ow_anomaly",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_Cultistic_key3","ow_Cultistic_key4"},
	openspace = true,
	reward_tokens = 25,
	ui_reward = "reward_tokens",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 2,
		hud_marker_defs = { "OpenWorld_Cultistic_Sing3", "OpenWorld_Cultistic_Sing4" },
		marked_zone_id  = SpaceZone.ow_anomaly.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_Sing3", "OpenWorld_Cultistic_Sing4", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "halloween",
			text = "quest_HALLOWEEN_WITCH_AGENT_2_dialog1", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_2},
	battlePoint = "ow_aliendebris13",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_Cultistic_key5","ow_Cultistic_key6"},
	openspace = true,
	reward_tokens = 35,
	ui_reward = "reward_tokens",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 2,
		hud_marker_defs = { "OpenWorld_Cultistic_Sing5", "OpenWorld_Cultistic_Sing6" },
		marked_zone_id  = SpaceZone.ow_aliendebris13.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_Sing5", "OpenWorld_Cultistic_Sing6", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_3_dialog1", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_3},
	battlePoint = "ow_bion",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_QuestLootCultistic_Pumpkin_key"},
	openspace = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 30,
		hud_marker_defs = { "OpenWorld_Cultistic_Pumpkin" },
		marked_zone_id  = SpaceZone.ow_bion.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_Pumpkin", "OpenWorld_Cultistic_PumpkinHiden", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_bion.zone_id,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog3", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 15,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog4", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 20,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog5", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 25,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog6", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 30,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_4_dialog7", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_4},
	battlePoint = "Empire_HomeWorld",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_CultisticHangarGate1_key"},
	openspace = true,
	reward_vessel_exp = 5000,
	ui_reward = "reward_vessel_exp",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_Cultistic_HangarGate1" },
		marked_zone_id  = SpaceZone.Empire_HomeWorld.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_HangarGate1", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_HomeWorld.zone_id,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_5_dialog2", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_5},
	battlePoint = "Federation_HomeWorld",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_CultisticHangarGate2_key"},
	openspace = true,
	reward_vessel_exp = 5000,
	ui_reward = "reward_vessel_exp",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_Cultistic_HangarGate2" },
		marked_zone_id  = SpaceZone.Federation_HomeWorld.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_HangarGate2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_HomeWorld.zone_id,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_6_dialog2", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_6},
	battlePoint = "Jericho_HomeWorld",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_CultisticHangarGate3_key"},
	openspace = true,
	reward_vessel_exp = 5000,
	ui_reward = "reward_vessel_exp",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_Cultistic_HangarGate3" },
		marked_zone_id  = SpaceZone.Jericho_HomeWorld.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_HangarGate3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_HomeWorld.zone_id,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_7_dialog2", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_AGENT_2025_8 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_7},
	battlePoint = "ow_alienruins",
	event_day_min = 30,
	event_day_max = 42,
	give_items = {"ow_Cultistic_Temple_key"},
	openspace = true,
	reward_account_aura = "CultisticTitle",
	ui_reward = "reward_account_aura",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_Cultistic_Temple" },
		marked_zone_id  = SpaceZone.ow_alienruins.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_Cultistic_Temple", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_alienruins.zone_id,
			dialogs  = {{ character = "cult_leader",
			text = "quest_HALLOWEEN_WITCH_AGENT_8_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "halloween",
			text = "quest_HALLOWEEN_HUNTER_MAIN_text_new", }} },
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_MAIN ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_CULT_MAIN,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	event_day_min = 30,
	event_day_max = 39,
	reward_account_aura = "Haloween22_Witch_Revard",
	ui_reward = "reward_account_aura",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 6,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.HALLOWEEN_WITCH_1, QuestGroupId.HALLOWEEN_WITCH_2, QuestGroupId.HALLOWEEN_WITCH_3, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_MAIN ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_CULT_MAIN,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	event_day_min = 30,
	event_day_max = 39,
	reward_account_aura = "Haloween22_Hunter_Revard",
	ui_reward = "reward_account_aura",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 6,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.HALLOWEEN_HUNTER_1, QuestGroupId.HALLOWEEN_HUNTER_2, QuestGroupId.HALLOWEEN_HUNTER_3, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_WITCH_1,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_WITCH_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Aliens_ship_part", 4 }, },
	ui_reward = "reward_items",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 25,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.HALLOWEEN_WITCH, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_WITCH_2,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_WITCH_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_WITCH_2,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_WITCH_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.PLANT_BOMB, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_WITCH_3,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_WITCH_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.MULTI_KILL, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_WITCH_2025_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_WITCH_3,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_WITCH_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "cult_leader",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value = 5000,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_HUNTER_1,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_HUNTER_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Aliens_ship_part", 4 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 15,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.HALLOWEEN_HUNTER, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_HUNTER_3,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_HUNTER_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, ai.BattleType.PVE, }, },
			{ param = ai.GameEventParam.IS_ROCKET, num_value = { 1 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_HUNTER_2,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_HUNTER_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.DRONE_KILLING_SPREE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_HUNTER_2,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_HUNTER_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_HUNTER_2025_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_HUNTER_3,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	acceptable_during = QuestId.HALLOWEEN_HUNTER_2025_MAIN,
	event_day_min = 30,
	event_day_max = 39,
	reward_items = { {"Iridium_monocrystall", 2 }, },
	ui_reward = "reward_items",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.EFFECTIVE_POINTS,
		required_value = 5000,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.HALLOWEEN_CULT_2025_END ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.HALLOWEEN_CULT_END,
	auto_accept = true,
	auto_complete = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.HALLOWEEN_WITCH_AGENT_2025_8},
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_alienruins",
	event_day_min = 39,
	event_day_max = 42,
	openspace = true,
	reward_vessel_exp = 10000,
	ui_reward = "reward_vessel_exp",
	character = "halloween",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 15,
		hud_marker_defs = { "AdvShip_WitnessY_M" },
		marked_zone_id  = SpaceZone.ow_alienruins.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "AdvShip_WitnessY_M", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_alienruins.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 15,
			dialogs  = {{ character = "halloween",
			text = "quest_HALLOWEEN_CULT_END_dialog1", }} },
		}
	},},
}

Quests[ QuestId.APRIL_Paper_invasionPVP ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.APRIL_InvasionPVP,
	auto_accept = true,
	event = true,
	battleType = ai.QuestBattleType.PVP,
	reward_event_credits = 10,
	ui_reward = "reward_event_credits",
	character = "broker",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 15,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "PapershipS_T5", "PapershipM_T5", "PapershipL_T5", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_main ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutWing", 10 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 10,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.SpaceDay_A, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_1 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.SpaceDay_A,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.SpaceDay_main,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutCorpse_part", 6 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.QuestBattleType.PVP, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.DRONE_FIRST_BLOOD, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_2 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.SpaceDay_A,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.SpaceDay_main,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutCorpse_part", 6 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.QuestBattleType.PVP, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_FIRST_CAPTURE, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_3 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.SpaceDay_A,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.SpaceDay_main,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutCorpse_part", 6 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.QuestBattleType.PVP, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.FIRST_BLOOD, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	group = QuestGroupId.SpaceDay_A,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	acceptable_during = QuestId.SpaceDay_main,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutCorpse_part", 6 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.QuestBattleType.PVP, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.FIRST_BOMB_PICK_UP, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_5 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_6 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_5},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_7 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_6},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_8 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_7},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_9 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_8},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_10 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_9},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_11 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_10},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_12 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_11},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_13 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_12},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 2 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SpaceDay_14 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 10,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.SpaceDay_13},
	event_day_min = 9,
	event_day_max = 21,
	reward_items = { {"SalyutModule", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 12,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_TAG, num_value = { ai.QuestTag.DAILY_OW, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 7,
	event_day_max = 7,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 8,
	event_day_max = 8,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 9,
	event_day_max = 9,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 10,
	event_day_max = 10,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 11,
	event_day_max = 11,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 12,
	event_day_max = 12,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 13,
	event_day_max = 13,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_8 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 14,
	event_day_max = 14,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_9 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 15,
	event_day_max = 15,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_10 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 16,
	event_day_max = 16,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_11 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 17,
	event_day_max = 17,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_12 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 18,
	event_day_max = 18,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_13 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 19,
	event_day_max = 19,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_14 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 20,
	event_day_max = 20,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_15 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 21,
	event_day_max = 21,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_16 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 22,
	event_day_max = 22,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_17 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 23,
	event_day_max = 23,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_18 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 24,
	event_day_max = 24,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_19 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 25,
	event_day_max = 25,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_20 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 26,
	event_day_max = 26,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_21 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 27,
	event_day_max = 27,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_22 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 28,
	event_day_max = 28,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_23 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 29,
	event_day_max = 29,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_24 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 30,
	event_day_max = 30,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_25 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 31,
	event_day_max = 31,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_26 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 32,
	event_day_max = 32,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_27 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 33,
	event_day_max = 33,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_28 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 34,
	event_day_max = 34,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_29 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 35,
	event_day_max = 35,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_30 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 36,
	event_day_max = 36,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_31 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 31,
	event_day_max = 31,
	reward_items = { {"ship_part_craft_engine", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_32 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 32,
	event_day_max = 32,
	reward_items = { {"ship_part_craft_capacitor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_33 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 33,
	event_day_max = 33,
	reward_items = { {"ship_part_craft_shield", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_34 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 34,
	event_day_max = 34,
	reward_items = { {"ship_part_craft_armor", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_35 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 35,
	event_day_max = 35,
	reward_items = { {"ship_part_craft_cpu", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.Tier15_36 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.Daily_Custom_Quest,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 36,
	event_day_max = 36,
	reward_items = { {"ship_part_craft_base", 1 }, },
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 10,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 1,
	reward_account_aura = "Bundle_Summer_2023_1",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 400, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 2,
	event_day_max = 2,
	reward_account_aura = "Bundle_Summer_2023_2",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 3,
	event_day_max = 3,
	reward_account_aura = "Bundle_Summer_2023_3",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.VITAL_POINT_CAPTURE_CHAIN, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_4,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 4,
	event_day_max = 4,
	reward_account_aura = "Bundle_Summer_2023_4",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 300, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_5,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 5,
	event_day_max = 5,
	reward_account_aura = "Bundle_Summer_2023_5",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_6,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 6,
	event_day_max = 6,
	reward_gold_credits = 250,
	ui_reward = "reward_gold_credits",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 25,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 5,
	group = QuestGroupId.MARATHON_7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 7,
	event_day_max = 7,
	reward_account_aura = "Bundle_Summer_2023_7",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 2,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 10, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.DEATHS, max_value = 1, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.SUMMER_2023_FINAL ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_8,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 1,
	event_day_max = 7,
	reward_account_aura = "Bundle_Summer_2023_FINAL",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 7,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.MARATHON_1, QuestGroupId.MARATHON_2, QuestGroupId.MARATHON_3, QuestGroupId.MARATHON_4, QuestGroupId.MARATHON_5, QuestGroupId.MARATHON_6, QuestGroupId.MARATHON_7, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.ELITE_DONATER_BP12_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	required_account_aura = "Elite_Donater_BP12_2",
	auto_accept = false,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	intervalStartHour = "2023-06-18T05:15:00Z",
	intervalLongEnableHours = 8760,
	intervalLongHours = 8760,
	max_completions = 1,
	reward_event_credits = 300,
	ui_reward = "reward_event_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1,
		restrictions = {
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.BRAVE_PILOT_INTRO ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 9,
	locks_on_account_rank = 16,
	auto_accept = false,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = false,
	reward_gold_credits = 50,
	ui_reward = "reward_gold_credits",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.BRAVE_PILOT ] = {
	category = QuestCategory.EVENT,
	auto_accept = false,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = false,
	unlocks_after_all = { QuestId.BRAVE_PILOT_INTRO},
	reward_account_aura = "Destroyer_Of_Mercy_Revard",
	ui_reward = "reward_account_aura",
	character = "empire_leader",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 111,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 111, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.OWFEST_24_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 14,
	event_day_max = 14,
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_1",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value = 1000000,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.FREE_SPACE, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1000000,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_1_dialog", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 15,
	event_day_max = 15,
	battlePoint = "Empire_SirusDebrissite",
	give_items = {"ow_OWFest_24_2_sdkey"},
	drop_item = "ow_OWFest_24_2_sd",
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_2",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 15,
		hud_marker_defs = { "OpenWorld_OWFest_24_2_sd" },
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_SirusDebrissite.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_OWFest_24_2_sd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 15,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_2_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 16,
	event_day_max = 16,
	battlePoint = "Federation_CaribWaterharvest3",
	spawn_ai_squad = "Pirate_QuestFederation_cw3k",
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_3",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		hud_marker_defs = { "C_Pirate_QuestFederation_cw3k" },
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_cw3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest3.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_3_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_4,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 17,
	event_day_max = 17,
	battlePoint = "Jericho_IsidMiningsite",
	spawn_ai_squad = "Pirate_QuestJericho_msk",
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_4",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		hud_marker_defs = { "C_Pirate_QuestJericho_msk" },
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_msk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_4_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_5,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 18,
	event_day_max = 18,
	battlePoint = "Federation_CaribWaterharvest",
	give_items = {"ow_OWFest_24_5_cwkey"},
	drop_item = "ow_OWFest_24_5_cw",
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_5",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.LOOT_ITEM,
		required_value = 15,
		hud_marker_defs = { "OpenWorld_OWFest_24_5_cw" },
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_OWFest_24_5_cw", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 15,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_5_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_6,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 19,
	event_day_max = 19,
	battlePoint = "ow_concourse",
	openspace = true,
	reward_gold_credits = 250,
	ui_reward = "reward_gold_credits",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		hud_marker_defs = { "C_Fed_Police_M_T5_rpis" },
		marked_zone_id  = SpaceZone.ow_concourse.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Fed_Police_M_T5_rpis", }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_concourse.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_6_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 20,
	event_day_max = 20,
	battlePoint = "ow_alienruins",
	openspace = true,
	reward_account_aura = "Bundle_OWFest_24_7",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 15,
		hud_marker_defs = { "C_Crystallid_Predator_L_T5_rcet" },
		marked_zone_id  = SpaceZone.ow_alienruins.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Crystallid_Predator_L_T5_rcet", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_alienruins.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_alienruins.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 15,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OWFEST_24_7_dialog2", }} },
		}
	},},
}

Quests[ QuestId.OWFEST_24_FINAL ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	group = QuestGroupId.MARATHON_8,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 14,
	event_day_max = 20,
	reward_account_aura = "Bundle_OWFest_24_FINAL",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 7,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.MARATHON_1, QuestGroupId.MARATHON_2, QuestGroupId.MARATHON_3, QuestGroupId.MARATHON_4, QuestGroupId.MARATHON_5, QuestGroupId.MARATHON_6, QuestGroupId.MARATHON_7, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.OW2DESTROYER ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 30,
	event_day_max = 42,
	intervalStartHour = "2024-07-17T06:00:00Z",
	intervalLongEnableHours = 24,
	intervalLongHours = 24,
	openspace = true,
	reward_account_aura = "OW2Destroyer_Revard",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.FREE_SPACE, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.HUGE, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_OW2DESTROYER_dialog", }} },
		}
	},},
}

Quests[ QuestId.TIN10_1 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_1,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 33,
	event_day_max = 33,
	reward_account_aura = "Bundle_Tin10_1",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 11,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  10,  },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 11,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_1_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_2 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_2,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 34,
	event_day_max = 34,
	reward_account_aura = "Bundle_Tin10_2",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value = 500000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race3_L_T5_Hellas","Ship_Race3_L_T2","Ship_Race2_L_T1_Faction2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 500000,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_2_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_3 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_3,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 35,
	event_day_max = 35,
	reward_account_aura = "Bundle_Tin10_3",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.GAIN_MEDAL,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.MEDAL_TYPE, num_value = { ai.MedalType.SPOTTED, ai.MedalType.LONG_SHOT, ai.MedalType.LONG_SHOT_ROCKET, }, },
			{ param = ai.GameEventParam.MEDAL_LEVEL, num_value = { 0, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  7,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_3_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_4 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_4,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 36,
	event_day_max = 36,
	reward_account_aura = "Bundle_Tin10_4",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 11, },
			{ param = ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 300, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_4_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_5 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_5,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 37,
	event_day_max = 37,
	reward_account_aura = "Bundle_Tin10_5",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 11,
		restrictions = {
			{ param = ai.GameEventParam.ITEM_SUBTYPE, num_value = { ItemSubtype.GuidedMissile,  ItemSubtype.ClusterTorpedo,  ItemSubtype.ProtozanTorpedo,  ItemSubtype.Mauler_GuidedMissile,  ItemSubtype.AvengersGuidedMissile, ItemSubtype.Exorcist_GuidedMissile, }, },
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.IS_KILLER, num_value = { 1 } },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 11,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_5_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_6 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_6,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 38,
	event_day_max = 38,
	reward_gold_credits = 250,
	ui_reward = "reward_gold_credits",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.DEAL_DAMAGE,
		required_value = 500000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race2_L_T1_Exorcist","Ship_Race2_S_T1_Faction2","Ship_Race3_S_T1_Faction2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 500000,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_6_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_7 ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_7,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 39,
	event_day_max = 39,
	battlePoint = "Federation_CaribWaterharvest",
	give_items = {"ow_OWFest_24_5_cwkey"},
	drop_item = "ow_OWFest_24_5_cw",
	openspace = true,
	reward_account_aura = "Bundle_Tin10_7",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 11,
		hud_marker_defs = { "C_Crystallid_L_T5_rcii" },
		marked_zone_id  = SpaceZone.Precursor_Zona2.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Crystallid_L_T5_rcii", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Precursor_Zona2.zone_id, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MAX, max_value =  11,  },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona2.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 11,
			dialogs  = {{ character = "eventgirl",
			text = "quest_TIN10_7_dialog2", }} },
		}
	},},
}

Quests[ QuestId.TIN10_FINAL ] = {
	disabled = true,
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 3,
	group = QuestGroupId.MARATHON_8,
	auto_accept = true,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	event_day_min = 33,
	event_day_max = 39,
	reward_account_aura = "Bundle_Tin11_FINAL",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.COMPLETE_QUEST,
		required_value = 7,
		restrictions = {
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.MARATHON_1, QuestGroupId.MARATHON_2, QuestGroupId.MARATHON_3, QuestGroupId.MARATHON_4, QuestGroupId.MARATHON_5, QuestGroupId.MARATHON_6, QuestGroupId.MARATHON_7, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_1 ] = {
	category = QuestCategory.EVENT,
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.NewbieAffairs_3},
	reward_account_aura = "NewbieKnickers_Start",
	ui_reward = "reward_account_aura",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_2 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_1},
	reward_credits = 500000,
	ui_reward = "reward_credits",
	character = "general",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.SMALL, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_3 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_2},
	reward_tokens = 150,
	ui_reward = "reward_tokens",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.MEDIUM, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_4 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_3},
	reward_items = { {"Iridium_monocrystall", 50 }, },
	ui_reward = "reward_items",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 3,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
			{ param = ai.GameEventParam.SHIP_CLASS, num_value = { ai.ShipClass.LARGE, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_5 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_4},
	reward_items = { {"Iridium_plate", 10}, {"Tungsten_plate", 10 } },
	ui_reward = "reward_items",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		hud_marker_defs = { "C_Mercenary_M_T1_mer1" },
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		restrictions = {
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Mercenary_M_T1_mer1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "eventgirl",
			text = "quest_NewbieKnickers_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "eventgirl",
			text = "quest_NewbieKnickers_5_dialog2", }} },
		}
	},},
}

Quests[ QuestId.NewbieKnickers_6 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_5},
	reward_items = { {"Pure_silicon", 10 }, {"Computing_chip", 10 }, {"Explosion", 10 } },
	ui_reward = "reward_items",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.HEAL,
		required_value = 25000,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.PVE, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_7 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_6},
	reward_gold_credits = 500,
	ui_reward = "reward_gold_credits",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_8 ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_on_next_day = true,
	unlocks_after_all = { QuestId.NewbieKnickers_7},
	reward_account_aura = "NewbieKnickers_8",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.GAMEPLAY_ACTION,
		required_value = 1,
		restrictions = {
			{ param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.PICK_UP_BOMB, }, },
		},
		info_events ={
		}
	},},
}

Quests[ QuestId.NewbieKnickers_FIN ] = {
	category = QuestCategory.EVENT,
	unlocks_on_account_rank = 1,
	locks_on_account_rank = 12,
	required_account_aura = "NewbieKnickers_8Rev",
	tag = ai.QuestTag.CUSTOM_EVENT,
	event = true,
	unlocks_after_all = { QuestId.NewbieKnickers_8},
	reward_account_aura = "NewbieKnickers_Revard",
	ui_reward = "reward_account_aura",
	character = "eventgirl",
	stages = {{
		game_event = ai.GameEvent.ONLINE,
		required_value = 1000 * 3,
		restrictions = {
		},
		info_events ={
		}
	},},
}


----------------------------------------
-- resource
----------------------------------------

Quests[ QuestId.RESOURCE_RARERAIDCHEST_1 ] = {
	unlocks_on_account_rank = 7,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_RARERAIDCHEST,
	reward_account_aura = "Bundle_GreenScoutAbility_v2_1_T5_Active",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  6,  },
		},
	},},
}

Quests[ QuestId.RESOURCE_RARERAIDCHEST_2 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_RARERAIDCHEST,
	reward_account_aura = "Bundle_GreenScoutAbility_v2_2_T5_Active",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  10,  },
		},
	},},
}

Quests[ QuestId.RESOURCE_RARERAIDCHEST_3 ] = {
	unlocks_on_account_rank = 13,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_RARERAIDCHEST,
	reward_account_aura = "Bundle_GreenScoutAbility_v2_3_T5_Active",
	ui_reward = "reward_account_aura",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_raid", "pve_raid_waterharvest","s8256_pve_raid_planetoid", }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  13,  },
		},
	},},
}

Quests[ QuestId.RESOURCE_ELLIDIUM_0 ] = {
	unlocks_on_account_rank = 20,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_ELLIDIUM_2,
	reward_items = { {"resource_zeta_final_add_2", 1 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 20,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.SHIP_RANK_MIN, min_value =  15,  },
		},
	},},
}

Quests[ QuestId.RESOURCE_ELLIDIUM_2 ] = {
	unlocks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_ELLIDIUM,
	reward_items = { {"Aliens_ship_part", 5 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.PVE, ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.RESOURCE_ELLIDIUM_3 ] = {
	unlocks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_ELLIDIUM,
	reward_items = { {"Iridium_monocrystall", 5 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, ai.BattleType.PVE, ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.RESOURCE_ELLIDIUM_4 ] = {
	unlocks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_ELLIDIUM_SQUAD,
	reward_items = { {"Aliens_ship_part", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 800, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
	},},
}

Quests[ QuestId.RESOURCE_ELLIDIUM_5 ] = {
	unlocks_on_account_rank = 6,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.RESOURCE_ELLIDIUM_SQUAD,
	reward_items = { {"Iridium_monocrystall", 10 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 2,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 800, },
			{ param = ai.GameEventParam.SQUAD_SIZE_MIN, min_value = 2, },
		},
	},},
}

Quests[ QuestId.SECCON_BATTLE ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.SECTOR_CONQUEST,
	reward_tokens = 25,
	ui_reward = "reward_tokens",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.BFS, }, },
			{ param = ai.GameEventParam.EFFECTIVE_POINTS, min_value = 250, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVP ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	group = QuestGroupId.REL_RESOURCE_1,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 5,
		restrictions = {
			{ param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.BFS, ai.BattleType.LEAGUE, ai.BattleType.TOURNAMENT, }, },
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_1 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-01T01:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "magnificent_seven",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_magnificent_seven", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_2 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-01T21:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "rescue_pirates_base",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_rescue_pirates_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_3 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-02T17:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_4 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-03T13:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_5 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-04T09:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_6 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-05T05:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_7 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-06T01:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_8 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-06T21:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_S_9 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 1 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-07T17:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 30, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_1 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-04T19:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "magnificent_seven",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_magnificent_seven", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_2 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-05T15:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "rescue_pirates_base",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_rescue_pirates_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_3 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-06T11:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_easy",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_4 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-07T07:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "capture_repairbase_t1",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_capture_repairbase", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_5 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-08T03:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "loot_geostation_normal",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1347_geostation", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_6 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-08T23:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_frozen_station_t2",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_frozen_station", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_7 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-09T19:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "pve_jericho_base_t2",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "pve_jericho_base", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_8 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-10T15:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "asteroid_building_t1",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_asteroid_building", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}

Quests[ QuestId.REL_RESOURCE_PVE_H_9 ] = {
	unlocks_on_account_rank = 10,
	category = QuestCategory.CHECKLIST,
	auto_accept = true,
	reward_items = { {"Relics_craft_part", 2 }, },
	ui_reward = "reward_items",
	intervalStartHour = "2022-12-11T11:00:00Z",
	intervalLongHours = 180,
	intervalLongEnableHours = 20,
	battleType = ai.QuestBattleType.PVE,
	battlePoint = "bigship_building_2_easy",
	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value	= 1,
		restrictions = {
			{ param = ai.GameEventParam.WIN, num_value = { 1, }, },
			{ param = ai.GameEventParam.LEVEL_NAME, str_value = { "s1550_pve_bigship_building_2", }, },
			{ param = ai.GameEventParam.UNLIM_PVE_MISSION_LEVEL, min_value = 60, },
		},
	},},
}


----------------------------------------
-- ow
----------------------------------------

Quests[ QuestId.OW_EMPIRE_1 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-06T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	drop_item = "ow_QuestEmpire1_Engine",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire1_rerp", "LootCrate_Quest" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestEmpire1_Engine", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_1_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_1_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_2 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 180000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-02T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayMiningsite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayMiningsite.zone_id,
		hud_marker_defs = { "C_Quest_Pirate_M_T4_oeim" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Pirate_M_T4_oeim", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayMiningsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayMiningsite.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_2_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_2_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_3 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 64000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-04T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayMiningsite",
	spawn_ai_squad = "Pirate_QuestEmpire3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayMiningsite.zone_id,
		hud_marker_defs = { "C_Quest_Pirate_M_T4_oeim" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Pirate_M_T4_oeim", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayMiningsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayMiningsite.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_3_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_4 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 66000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	give_items = {"ow_QuestEmpire4_key"},
	drop_item = "ow_QuestEmpire4_Bomb",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_4" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestEmpire4_Bomb", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_4_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_5 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 1500000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex.zone_id,
		hud_marker_defs = { "C_Quest_Transport_L_T1_wgr1" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestEmpire_grt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_5_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_6 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 70000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-02T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_RexFallenScrapyard",
	spawn_ai_squad = "Pirate_QuestEmpire6",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire6_wgr3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire6_wgr3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_RexFallenScrapyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_6_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_7 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 110000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-02T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "C_Mercenary_M_T1_mer1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_7_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_7_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_8 ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 2,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_8_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_8_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_8_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_9 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	spawn_ai_squad = "Pirate_QuestEmpire9",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire9" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire9", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_9_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_9_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_10 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 120000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-02T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	drop_item = "ow_QuestEmpire10",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire10", "LootCrate_Quest" },
		restrictions ={
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus.zone_id, }, },
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestEmpire10", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_10_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_10_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_10_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_11 ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 2300,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "Transport_QuestEmpire_sdpt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestEmpire_sdpt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_SirusDebrissite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_11_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_11_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_12 ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	give_items = {"ow_QuestEmpire_gr3a", "ow_QuestEmpire_gr3b", "ow_QuestEmpire_gr3c"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 3,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_gr3a", "OpenWorld_QuestEmpire_gr3b", "OpenWorld_QuestEmpire_gr3c" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_gr3a", "OpenWorld_QuestEmpire_gr3b", "OpenWorld_QuestEmpire_gr3c", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_12_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_12_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_12_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_14 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 12000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 5,
	character = "mercenary",
	intervalStartHour = "2017-11-01T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_BigshipBuilding",
	spawn_ai_squad = "Pirate_Patrol8",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_BigshipBuilding.zone_id,
		hud_marker_defs = { "C_IronSideBoss_L_T2_seeb" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_IronSideBoss_L_T2_seeb", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_BigshipBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_BigshipBuilding.zone_id,
			dialogs  = {{ character = "mercenary",
			text = "quest_OW_EMPIRE_14_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "mercenary",
			text = "quest_OW_EMPIRE_14_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_15 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 60000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-01T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_CaptureRepairbase",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_CaptureRepairbase.zone_id,
		hud_marker_defs = { "Turret_Pirate_RocketGun", "Turret_Pirate_FlakGun", "Turret_Pirate_RailGun" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Turret_Pirate_RocketGun", "Turret_Pirate_FlakGun", "Turret_Pirate_RailGun", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_CaptureRepairbase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_CaptureRepairbase.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_15_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_15_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_15_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 102000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-04T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "C_Pirate_M_T1_mer1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_M_T1_mer1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 25000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-02T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "C_CasualBandit_M_T2_ser1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gsmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "C_Pirates_M_T2_wer2", "C_Pirate_QuestEmpire10" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirates, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gsmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gsmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 30000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus3.zone_id,
		hud_marker_defs = { "C_Marauder_L_T2_rer1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Neutral2, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus3.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_sdmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "C_ROMScout_S_T2_rerw" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_SirusDebrissite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s2mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 96000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-02T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "C_AngryMarauder_L_T1_rerp", "C_Marauder_L_T1_rerp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_AngryMarauder_L_T1_rerp", "C_Marauder_L_T1_rerp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_s2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_s2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 82000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-03T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 2,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "C_PoorCrystallid_L_T1_awr1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_grmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-03T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex.zone_id,
		hud_marker_defs = { "C_Marauder_L_T1_wgr1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_grmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_grmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "C_Pirates_S_T1_awr2" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirates, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_rsmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_RexFallenScrapyard",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
		hud_marker_defs = { "C_Pirates_M_wgr3" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirates, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_RexFallenScrapyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_rsmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_rsmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_bbmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 120000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 5,
	character = "empire_leader",
	intervalStartHour = "2017-11-04T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_BigshipBuilding",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		marked_zone_id  = SpaceZone.Empire_BigshipBuilding.zone_id,
		hud_marker_defs = { "C_AIVesselTestWersion_S_T2_seeb" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_AIVesselTestWersion_S_T2_seeb", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_BigshipBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_BigshipBuilding.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_bbmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_bbmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_crmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 76000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-03T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_CaptureRepairbase",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 2,
		marked_zone_id  = SpaceZone.Empire_CaptureRepairbase.zone_id,
		hud_marker_defs = { "C_Pirate_Officer_M_T1_rerc" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Officer_M_T1_rerc", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_CaptureRepairbase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_CaptureRepairbase.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_crmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_crmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ean_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "mercenary",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_anomaly",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 8,
		marked_zone_id  = SpaceZone.ow_anomaly.zone_id,
		hud_marker_defs = { "C_Traveler_M_T2_awlp" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.C_Traveler_M_T2_awlp, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_anomaly.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_anomaly.zone_id,
			dialogs  = {{ character = "mercenary",
			text = "quest_OW_ean_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "mercenary",
			text = "quest_OW_ean_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 8,
			dialogs  = {{ character = "mercenary",
			text = "quest_OW_ean_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_eds_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "general_soldier",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_devilsjaw",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_devilsjaw.zone_id,
		hud_marker_defs = { "C_Legioners_M_T3_rpsd" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Legioners_M_T3_rpsd", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_devilsjaw.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_devilsjaw.zone_id,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_eds_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_eds_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_eds_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_egg_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 7,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_gasgiant",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 9,
		marked_zone_id  = SpaceZone.ow_gasgiant.zone_id,
		hud_marker_defs = { "C_TreasureHunter_S_T3_rpip" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_gasgiant.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_gasgiant.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_egg_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_egg_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 9,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_egg_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_edw_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-04T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_dreadnwreck",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.ow_dreadnwreck.zone_id,
		hud_marker_defs = { "C_Vulture_S_T2_rele" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Vulture_S_T2_rele", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_dreadnwreck.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_dreadnwreck.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_edw_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_edw_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ept_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 7,
	character = "emp_engineer",
	intervalStartHour = "2017-11-02T13:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_da_prototype",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_da_prototype.zone_id,
		hud_marker_defs = { "C_AngrySecuritySDS_M_T3_feia" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_da_prototype.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_da_prototype.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_ept_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_ept_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_eds_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 75000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "general_soldier",
	intervalStartHour = "2017-11-04T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_devilsjaw",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_devilsjaw.zone_id,
		hud_marker_defs = { "C_Sparta_M_T2_rpsd" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Sparta_M_T2_rpsd", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_devilsjaw.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_devilsjaw.zone_id,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_eds_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_eds_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 100000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-06T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	spawn_ai_squad = "Pirate_QuestEmpire_s3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_s3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_s3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 15000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	intervalStartHour = "2017-11-05T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	spawn_ai_squad = "Pirate_QuestEmpire_gs2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_gs2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_gs2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gsk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 15000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	intervalStartHour = "2017-11-05T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	spawn_ai_squad = "Pirate_QuestEmpire_gsk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_gsk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_gsk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gsk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gsk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs3k ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	spawn_ai_squad = "Pirate_QuestEmpire_gs3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_gs3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_gs3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_sdk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	intervalStartHour = "2017-11-03T10:00:00Z",
	intervalLongHours = 157,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	spawn_ai_squad = "Pirate_QuestEmpire_sdk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_sdk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_sdk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_SirusDebrissite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 94000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-04T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	spawn_ai_squad = "Pirate_QuestEmpire_s2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_s2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_s2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3k ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	spawn_ai_squad = "Pirate_QuestEmpire_gr3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "C_Crystallid_QuestEmpire_awr1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Crystallid_QuestEmpire_awr1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_grk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 86000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-05T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex",
	spawn_ai_squad = "Pirate_QuestEmpire_grk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_grk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_grk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_grk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_grk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 78000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-01T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	spawn_ai_squad = "Pirate_QuestEmpire_gr2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_gr2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_gr2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gr2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gr2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_bbk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 12000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 5,
	character = "emp_captain",
	intervalStartHour = "2017-11-06T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_BigshipBuilding",
	spawn_ai_squad = "Pirate_Patrol9",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_BigshipBuilding.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_bbk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_bbk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_BigshipBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_BigshipBuilding.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_bbk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_bbk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_crk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 74000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "general_soldier",
	intervalStartHour = "2017-11-05T01:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_CaptureRepairbase",
	spawn_ai_squad = "Pirate_Patrol4",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_CaptureRepairbase.zone_id,
		hud_marker_defs = { "C_Pirate_QuestEmpire_crk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestEmpire_crk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_CaptureRepairbase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_CaptureRepairbase.zone_id,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_EMPIRE_crk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_EMPIRE_crk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_edw_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 10000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-06T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_dreadnwreck",
	spawn_ai_squad = "Pirate_Patrol9",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_dreadnwreck.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_edw_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_edw_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_dreadnwreck.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_dreadnwreck.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_edw_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_edw_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ept_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 20000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 7,
	character = "general_soldier",
	intervalStartHour = "2017-11-04T01:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_da_prototype",
	spawn_ai_squad = "Pirate_Patrol9",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_da_prototype.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_ept_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_ept_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_da_prototype.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_da_prototype.zone_id,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_ept_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "general_soldier",
			text = "quest_OW_ept_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ean_k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 10000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	intervalStartHour = "2017-11-03T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_anomaly",
	spawn_ai_squad = "Pirate_Patrol9",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_anomaly.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_ean_k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_ean_k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_anomaly.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_anomaly.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_ean_k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_ean_k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_egg_k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 180000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 7,
	character = "empire_leader",
	intervalStartHour = "2017-11-02T01:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_gasgiant",
	spawn_ai_squad = "Pirate_Patrol8",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_gasgiant.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_egg_k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_egg_k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_gasgiant.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_gasgiant.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_egg_k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_egg_k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s3t ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 500000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-06T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T1_mer1" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestEmpire_s3t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s3t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s3t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gst ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 750000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-05T07:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "C_Transport_L_T2_wer2" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestEmpire_gst", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gst_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gst_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_rst ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 500000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-04T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_RexFallenScrapyard",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
		hud_marker_defs = { "C_TransportMarauder_L_T1_wgr3" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestEmpire_rst", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_RexFallenScrapyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_rst_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_rst_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s2pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 98000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-05T19:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T1_rerp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Transport_T1_rerp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 20000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-01T07:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T2_ser1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Transport_T2_ser1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs3pt ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 94000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus3.zone_id,
		hud_marker_defs = { "Transport_QuestEmpire_gs3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestEmpire_gs3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus3.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_sdpt ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 110000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "Transport_QuestEmpire_sdpt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestEmpire_sdpt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_SirusDebrissite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdpt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_sdpt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 84000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-05T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "C_Quest_PT_Transport_T1_awr1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_PT_Transport_T1_awr1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 80000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "C_Pirates_Transport_L_T1_awr2" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirates_Transport_L_T1_awr2", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gr2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gr2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 50000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-03T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	give_items = {"ow_QuestLootEmpire_s3key"},
	drop_item = "ow_QuestLootEmpire_s3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_s3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_s3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_s3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_s3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	intervalStartHour = "2017-11-02T19:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	give_items = {"ow_QuestLootEmpire_gs2key"},
	drop_item = "ow_QuestLootEmpire_gs2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gs2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gs2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gsl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 135000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	give_items = {"ow_QuestLootEmpire_gskey"},
	drop_item = "ow_QuestLootEmpire_gs",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gs" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gs", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gsl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gsl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 30000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	intervalStartHour = "2017-11-02T07:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	give_items = {"ow_QuestLootEmpire_gs3key"},
	drop_item = "ow_QuestLootEmpire_gs3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gs3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gs3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_sdl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "CookCannon_Rev",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T13:00:00Z",
	intervalLongHours = 157,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	give_items = {"ow_QuestLootEmpire_sdkey"},
	drop_item = "ow_QuestLootEmpire_sd",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_sd" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_sd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_sdl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_sdl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-03T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	give_items = {"ow_QuestLootEmpire_s2key"},
	drop_item = "ow_QuestLootEmpire_s2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_s2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_s2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_msl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-02T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayMiningsite",
	give_items = {"ow_QuestLootEmpire_mskey"},
	drop_item = "ow_QuestLootEmpire_ms",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_IlayMiningsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_ms" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_ms", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayMiningsite.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_msl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_msl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	give_items = {"ow_QuestLootEmpire_gr3key"},
	drop_item = "ow_QuestLootEmpire_gr3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gr3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gr3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_grl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 67000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex",
	give_items = {"ow_QuestLootEmpire_grkey"},
	drop_item = "ow_QuestLootEmpire_gr",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 7,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gr" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gr", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_grl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_grl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-01T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	give_items = {"ow_QuestLootEmpire_gr2key"},
	drop_item = "ow_QuestLootEmpire_gr2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_gr2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_gr2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_rsl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 90000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-06T07:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_RexFallenScrapyard",
	give_items = {"ow_QuestLootEmpire_rskey"},
	drop_item = "ow_QuestLootEmpire_rs",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEmpire_rs" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEmpire_rs", }, },
			{ param = ai.GameEventParam.SHIP_NAME, str_value = { "Ship_Race1_S_T4_Glass","Ship_Race1_M_T4_Glass","Ship_Race1_L_T4_Glass","Ship_Race3_S_T4_Glass","Ship_Race3_M_T4_Glass","Ship_Race3_L_T4_Glass","Ship_Race2_S_T4_Glass","Ship_Race2_M_T4_Glass","Ship_Race2_L_T4_Glass", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_rsl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_rsl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s2d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation2",
	give_items = {"ow_QuestEmpire_s2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_s2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_s2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation2.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s2d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_s2d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_msd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 15000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayMiningsite",
	give_items = {"ow_QuestEmpire_msd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayMiningsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_msd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_msd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayMiningsite.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_msd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_msd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_grd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 3000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	intervalStartHour = "2017-11-04T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex",
	give_items = {"ow_QuestEmpire_grd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_grd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_grd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_grd_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	give_items = {"ow_QuestEmpire_gr2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_gr2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_gr2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr2d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr2d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	give_items = {"ow_QuestEmpire_gs2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_gs2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_gs2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs2d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gs2d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gsd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus",
	give_items = {"ow_QuestEmpire_gsd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_gsd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_gsd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gsd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gsd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_sdd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_SirusDebrissite",
	give_items = {"ow_QuestEmpire_sdd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_SirusDebrissite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_sdd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_sdd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_SirusDebrissite.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_sdd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_sdd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	give_items = {"ow_QuestEmpire_gr3d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_gr3d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_gr3d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr3d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_engineer",
			text = "quest_OW_EMPIRE_gr3d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_rsd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_RexFallenScrapyard",
	give_items = {"ow_QuestEmpire_rsd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_rsd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_rsd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_RexFallenScrapyard.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_rsd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_rsd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_s3do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayStation3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayStation3.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Empire_s3do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Empire_s3do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayStation3.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s3do_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_s3do_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs2do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 2,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus2.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gs2do_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr3do ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 12000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "emp_captain",
	intervalStartHour = "2017-11-05T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex3.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Empire_gr3do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Empire_gr3do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3do_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gr3do_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gs3do ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 15000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 6,
	character = "emp_captain",
	intervalStartHour = "2017-11-01T19:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateSirus3.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Empire_gs3do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Empire_gs3do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateSirus3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateSirus3.zone_id,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs3do_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_captain",
			text = "quest_OW_EMPIRE_gs3do_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_gr2do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 3,
	character = "empire_leader",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateRex2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Empire_IlayGateRex2.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Empire_gr2do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Empire_gr2do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Empire_IlayGateRex2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Empire_IlayGateRex2.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_gr2do_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_1 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	drop_item = "ow_QuestFederation1",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation1", "LootCrate_Quest" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestFederation1", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_1_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_1_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_2 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
		hud_marker_defs = { "C_Hermes_Police_M_T4_awr6" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Police, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_2_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_2_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_3 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 6}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite2",
	spawn_ai_squad = "Pirate_QuestFederation3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_3_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_4 ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	give_items = {"ow_QuestFederation4_key"},
	drop_item = "ow_QuestFederation4",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_4" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestFederation4", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_4_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_5 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "C_Transport_T4_sfio" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "C_Transport_T4_sfio", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateCarib.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_5_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_6 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-02T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite",
	spawn_ai_squad = "Pirate_QuestFederation6",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation6" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation6", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_6_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_7 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 15}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	intervalStartHour = "2017-11-04T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "C_MediumCrystallid_L_T4_wfr9" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_7_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_7_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_8 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "C_Transport_QuestFederation_sht" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "C_Transport_QuestFederation_sht", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_8_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_8_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_9 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 15}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-03T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "C_Quest_Trader_Transport_T3_awr7" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestFederation_lc3t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_9_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_9_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_10 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-02T22:00:00Z",
	intervalLongHours = 145,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	spawn_ai_squad = "Pirate_QuestFederation10",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation10" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation10", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateLumen.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_10_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_10_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_11 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-02T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	give_items = {"ow_QuestFederation_sh2a", "ow_QuestFederation_sh2b", "ow_QuestFederation_sh2c"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 3,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_sh2a", "OpenWorld_QuestFederation_sh2b", "OpenWorld_QuestFederation_sh2c" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_sh2a", "OpenWorld_QuestFederation_sh2b", "OpenWorld_QuestFederation_sh2c", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_11_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_11_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_11_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_12 ] = {
			disabled = true,
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "C_Marauder_L_T3_dfr3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Marauder_L_T3_dfr3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_12_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_12_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_12_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_13 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "Transport_QuestFederation_sh3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestFederation_sh3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_13_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_13_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_15 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-06T01:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_Geostation",
	spawn_ai_squad = "Pirate_QuestFederation15",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_Geostation.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_gsk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_gsk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_Geostation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_Geostation.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_15_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_15_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_16 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_AsteroidBuilding",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_AsteroidBuilding.zone_id,
		hud_marker_defs = { "C_Cartel_M_T4_reii" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Cartel_M_T4_reii", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_AsteroidBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_AsteroidBuilding.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_16_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_16_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_16_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh2mk ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "Aliens" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_shmk ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "Aliens" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_shmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_shmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_glmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "default",
	intervalStartHour = "2017-11-03T22:00:00Z",
	intervalLongHours = 169,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "C_Bouncer_M_T4_hfrc" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Bouncer_M_T4_hfrc", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateLumen.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_glmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_glmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_captain",
	intervalStartHour = "2017-11-03T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "C_HermesRenger_S_T3_awr7" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_HermesRenger_S_T3_awr7", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_lc3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lcmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite.zone_id,
		hud_marker_defs = { "C_Hermes_Police_M_T4_awr6" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Hermes_Police_M_T4_awr6", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_lcmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_lcmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	intervalStartHour = "2017-11-05T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "C_Marauder_L_T4_wfr9" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Marauder_L_T4_wfr9", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gcmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 186000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	intervalStartHour = "2017-11-06T07:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "C_Mercenary_M_T3_sfio" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Mercenary_M_T3_sfio", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateCarib.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_gcmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_gcmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw2mk ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 130000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "C_Fed_Miner_S_T3_dfr3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Fed_Miner_S_T3_dfr3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cw2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cw2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 50000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	intervalStartHour = "2017-11-04T19:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		hud_marker_defs = { "C_ScienceShip_S_T3_rfrs" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_ScienceShip_S_T3_rfrs", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cw3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cw3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "C_EngineerFed_T3_sfrw" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_EngineerFed_T3_sfrw", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gsmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	intervalStartHour = "2017-11-04T07:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_Geostation",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_Geostation.zone_id,
		hud_marker_defs = { "C_CartelFighter_S_T3_merv" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_CartelFighter_S_T3_merv", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_Geostation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_gsmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_gsmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_gsmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_abmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 162000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	intervalStartHour = "2017-11-01T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_AsteroidBuilding",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_AsteroidBuilding.zone_id,
		hud_marker_defs = { "C_Cartel_M_T4_reii" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Cartel_M_T4_reii", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_AsteroidBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_AsteroidBuilding.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_abmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_abmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fns_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_northmsite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_northmsite.zone_id,
		hud_marker_defs = { "C_Mercenary_M_T4_mfr1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Mercenary_M_T4_mfr1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_northmsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_northmsite.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fns_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fns_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fns_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_fac_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_asteroidcity",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.ow_asteroidcity.zone_id,
		hud_marker_defs = { "C_TreasureHunter_S_T4_mhfr1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_TreasureHunter_S_T4_mhfr1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_asteroidcity.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_asteroidcity.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fac_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fac_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fac_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_fad_mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_aliendestsatation",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 8,
		marked_zone_id  = SpaceZone.ow_aliendestsatation.zone_id,
		hud_marker_defs = { "C_CrystallidPatrol_L_T4_rplp" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_aliendestsatation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_aliendestsatation.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fad_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 8,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_fad_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fls_mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_livestation",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_livestation.zone_id,
		hud_marker_defs = { "Pirate_Federation" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_livestation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_livestation.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_fls_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_fls_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fac_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 150000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 11,
	character = "default",
	intervalStartHour = "2017-11-05T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_asteroidcity",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_asteroidcity.zone_id,
		hud_marker_defs = { "C_Fed_Miner_S_T4_mhfr1" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Fed_Miner_S_T4_mhfr1", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_asteroidcity.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_asteroidcity.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_fac_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_fac_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ffs_mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_FrozenStation",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_FrozenStation.zone_id,
		hud_marker_defs = { "Pirate_Federation" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_FrozenStation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_FrozenStation.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_ffs_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_ffs_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 210000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-02T01:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	spawn_ai_squad = "Pirate_QuestFederation_sh2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_sh2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_sh2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_shk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 30000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-06T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	spawn_ai_squad = "Pirate_QuestFederation_shk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_shk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_shk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_shk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_shk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_glk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-02T07:00:00Z",
	intervalLongHours = 133,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	spawn_ai_squad = "Pirate_QuestFederation_glk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_glk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_glk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateLumen.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_glk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_glk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 6}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-05T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	spawn_ai_squad = "Pirate_QuestFederation_lc3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_lc3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_lc3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 25000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-01T19:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	spawn_ai_squad = "Pirate_QuestFederation_sh3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_sh3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_sh3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gck ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 174000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-03T01:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	spawn_ai_squad = "Pirate_QuestFederation_gck",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_gck" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_gck", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateCarib.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gck_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gck_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 125000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 8,
	character = "default",
	intervalStartHour = "2017-11-05T01:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	spawn_ai_squad = "Pirate_QuestFederation_cw2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_cw2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_cw2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_cw2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_cw2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 30000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-03T07:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest3",
	spawn_ai_squad = "Pirate_QuestFederation_cw3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_cw3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_cw3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cw3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cw3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-04T13:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	spawn_ai_squad = "Pirate_QuestFederation_cwk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_cwk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_cwk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gsk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-05T13:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_Geostation",
	spawn_ai_squad = "Pirate_QuestFederation_gsk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_Geostation.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_gsk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_gsk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_Geostation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_Geostation.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gsk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gsk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_abk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-02T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_AsteroidBuilding",
	spawn_ai_squad = "Pirate_Patrol8",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_AsteroidBuilding.zone_id,
		hud_marker_defs = { "C_Pirate_QuestFederation_abk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestFederation_abk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_AsteroidBuilding.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_AsteroidBuilding.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_abk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_abk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fad_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 156000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 11,
	character = "fed_engineer",
	intervalStartHour = "2017-11-06T01:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_aliendestsatation",
	spawn_ai_squad = "Pirate_Patrol8",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_aliendestsatation.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_fad_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_fad_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_aliendestsatation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_aliendestsatation.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_fad_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_fad_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fls_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 32000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "default",
	intervalStartHour = "2017-11-04T19:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_livestation",
	spawn_ai_squad = "Hostile1_Patrol1",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_livestation.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_fls_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_fls_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_livestation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_livestation.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_fls_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_fls_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_ffs_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 143000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 8,
	character = "emp_major",
	intervalStartHour = "2017-11-05T19:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_FrozenStation",
	spawn_ai_squad = "Alien_Patrol3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_FrozenStation.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_ffs_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_ffs_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_FrozenStation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_FrozenStation.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_ffs_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_ffs_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_fns_k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 34000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "fed_major",
	intervalStartHour = "2017-11-05T07:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_northmsite",
	spawn_ai_squad = "Hostile1_Patrol1",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_northmsite.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_fns_k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_fns_k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_northmsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_northmsite.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_fns_k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_fns_k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh2t ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-02T19:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "C_Quest_Trader_Transport_T4_awr4" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestFederation_sh2t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh2t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh2t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3t ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "C_Quest_Trader_Transport_T3_awr7" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestFederation_lc3t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gct ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "C_Transport_T4_sfio" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestFederation_gct", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanGateCarib.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gct_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_gct_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc2pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 6}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-03T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
		hud_marker_defs = { "C_Transport_QuestFederation_lc2pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestFederation_lc2pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lcpt ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 6}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-04T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite.zone_id,
		hud_marker_defs = { "Transport_QuestFederation_lcpt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestFederation_lcpt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lcpt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lcpt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw2pt ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 8000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "Transport_QuestFederation_cw2pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "Transport_QuestFederation_cw2pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_cw2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_FEDERATION_cw2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw3pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 97000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-03T19:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		hud_marker_defs = { "C_Quest_AngryScience_Transport_rfrs" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_AngryScience_Transport_rfrs", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cw3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cw3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwpt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_major",
	intervalStartHour = "2017-11-03T01:00:00Z",
	intervalLongHours = 120,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T3_sfrw" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Transport_T3_sfrw", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwpt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_cwpt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh3pt ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "C_Transport_QuestFederation_sh3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestFederation_sh3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_sh3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 216000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	give_items = {"ow_QuestLootFederation_sh2key"},
	drop_item = "ow_QuestLootFederation_sh2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_sh2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_sh2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_sh2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_sh2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_shl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 50000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-03T07:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	give_items = {"ow_QuestLootFederation_shkey"},
	drop_item = "ow_QuestLootFederation_sh",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_sh" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_sh", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_shl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_shl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gll ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 3}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-04T01:00:00Z",
	intervalLongHours = 176,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	give_items = {"ow_QuestLootFederation_glkey"},
	drop_item = "ow_QuestLootFederation_gl",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_gl" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_gl", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gll_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gll_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	intervalStartHour = "2017-11-05T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite2",
	give_items = {"ow_QuestLootFederation_lc2key"},
	drop_item = "ow_QuestLootFederation_lc2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_lc2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_lc2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lc2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lc2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	intervalStartHour = "2017-11-06T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	give_items = {"ow_QuestLootFederation_lc3key"},
	drop_item = "ow_QuestLootFederation_lc3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_lc3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_lc3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lc3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lc3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lcl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	intervalStartHour = "2017-11-04T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite",
	give_items = {"ow_QuestLootFederation_lckey"},
	drop_item = "ow_QuestLootFederation_lc",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_lc" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_lc", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lcl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lcl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-03T19:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	give_items = {"ow_QuestLootFederation_sh3key"},
	drop_item = "ow_QuestLootFederation_sh3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_sh3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_sh3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_sh3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_sh3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gcl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 180000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-04T13:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	give_items = {"ow_QuestLootFederation_gckey"},
	drop_item = "ow_QuestLootFederation_gc",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_gc" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_gc", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gcl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gcl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	intervalStartHour = "2017-11-01T10:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	give_items = {"ow_QuestLootFederation_cw2key"},
	drop_item = "ow_QuestLootFederation_cw2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_cw2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_cw2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cw2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cw2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	intervalStartHour = "2017-11-01T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest3",
	give_items = {"ow_QuestLootFederation_cw3key"},
	drop_item = "ow_QuestLootFederation_cw3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_cw3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_cw3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cw3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cw3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	intervalStartHour = "2017-11-01T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	give_items = {"ow_QuestLootFederation_cwkey"},
	drop_item = "ow_QuestLootFederation_cw",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_cw" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_cw", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cwl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cwl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh2d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard2",
	give_items = {"ow_QuestFederation_sh2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_sh2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_sh2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_sh2d_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc2d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite2",
	give_items = {"ow_QuestFederation_lc2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_lc2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_lc2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite2.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lc2d_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lcd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	intervalStartHour = "2017-11-06T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite",
	give_items = {"ow_QuestFederation_lcd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_lcd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_lcd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lcd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_lcd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gcd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 168000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-05T01:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateCarib",
	give_items = {"ow_QuestFederation_gcd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_gcd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_gcd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateCarib.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gcd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gcd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gld ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 10,
	character = "fed_engineer",
	intervalStartHour = "2017-11-05T19:00:00Z",
	intervalLongHours = 198,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanGateLumen",
	give_items = {"ow_QuestFederation_gld"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_gld" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_gld", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanGateLumen.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gld_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gld_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_gsd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest3",
	give_items = {"ow_QuestFederation_gsd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_gsd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_gsd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest3.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gsd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_gsd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_fsd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_FrozenStation",
	give_items = {"ow_QuestFederation_fsd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_FrozenStation.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_fsd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_fsd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_FrozenStation.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_fsd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_fsd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_shd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 55000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_major",
	intervalStartHour = "2017-11-04T07:00:00Z",
	intervalLongHours = 126,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	give_items = {"ow_QuestFederation_shd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_shd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_shd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_shd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_shd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	give_items = {"ow_QuestFederation_lc3d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_lc3d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_lc3d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_lc3d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_engineer",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 192,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	give_items = {"ow_QuestFederation_cwd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederation_cwd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederation_cwd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cwd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_engineer",
			text = "quest_OW_FEDERATION_cwd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_sh3do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 5200,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 2,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret_T3", "OpenWorld_KiberTurret_T3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh3do_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_sh3do_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cw2do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Federation_cw2do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Federation_cw2do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest2.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cw2do_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_shdo ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 6000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 10,
	character = "fed_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_NalnifanShipyard",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 4,
		marked_zone_id  = SpaceZone.Federation_NalnifanShipyard.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_NalnifanShipyard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_NalnifanShipyard.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_shdo_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_shdo_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_lc3do ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_captain",
	intervalStartHour = "2017-11-06T16:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_LumenConstructionsite3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Federation_lc3do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Federation_lc3do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_LumenConstructionsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_LumenConstructionsite3.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_lc3do_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_lc3do_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_cwdo ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 8,
	character = "fed_captain",
	intervalStartHour = "2017-11-04T22:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Federation_CaribWaterharvest.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Federation_cwdo" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Federation_cwdo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Federation_CaribWaterharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Federation_CaribWaterharvest.zone_id,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cwdo_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_captain",
			text = "quest_OW_FEDERATION_cwdo_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_1 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation2",
	drop_item = "ow_QuestJericho1",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_IsidStation2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho1", "LootCrate_Quest" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestJericho1", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation2.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_1_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_1_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_2 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-02T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGasharvest",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidGasharvest.zone_id,
		hud_marker_defs = { "C_Ronin_M_T5_mjr1" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGasharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGasharvest.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_2_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_2_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_3 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGasharvest",
	spawn_ai_squad = "Pirate_QuestJericho3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGasharvest.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGasharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGasharvest.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_3_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_4 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	give_items = {"ow_QuestJericho4_key"},
	drop_item = "ow_QuestJericho4",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_4" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestJericho4", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_4_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_5 ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "Transport_QuestJericho5" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho5", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_5_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_5_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_6 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	spawn_ai_squad = "Pirate_QuestJericho6",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho6" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho6", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_6_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_6_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_7 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-03T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_IsidStation3.zone_id,
		hud_marker_defs = { "C_Jer_Angry_Miner_S_T5_awr9" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Jer_Angry_Miner_S_T5_awr9", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_7_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_7_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_7_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_8 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 120000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-06T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "C_Transport_QuestJericho_ms3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestJericho_ms3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_8_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_8_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_9 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 95000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-07T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "C_Quest_Transport_ms2t" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_ms2t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_9_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_9_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_10 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-03T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation3",
	give_items = {"ow_QuestJericho_s3a", "ow_QuestJericho_s3b", "ow_QuestJericho_s3c"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 3,
		marked_zone_id  = SpaceZone.Jericho_IsidStation3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_s3a", "OpenWorld_QuestJericho_s3b", "OpenWorld_QuestJericho_s3c" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_s3a", "OpenWorld_QuestJericho_s3b", "OpenWorld_QuestJericho_s3c", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_10_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_10_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_10_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_11 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 50000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		hud_marker_defs = { "C_Pirates_M_T4_rjrs", "C_Pirates_S_T4_rjrs" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirates_M_T4_rjrs", "C_Pirates_S_T4_rjrs", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_11_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_11_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_11_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_12 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 210000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-05T10:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	spawn_ai_squad = "Cyber_Patrol11",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_12" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_12", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_12_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_12_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_13 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 3}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	spawn_ai_squad = "Pirate_QuestJericho_gi3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_gi3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_gi3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_13_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_13_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_15 ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_JerichoBase",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_JerichoBase.zone_id,
		hud_marker_defs = { "C_Escort_Cyber_M_T5_mjlc" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Cyber, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_JerichoBase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_JerichoBase.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_15_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_15_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_15_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s3mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-01T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_IsidStation3.zone_id,
		hud_marker_defs = { "C_Jer_Angry_Miner_S_T5_awr9" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s2mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_IsidStation2.zone_id,
		hud_marker_defs = { "C_Cyber_M_T5_sjrp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Cyber_M_T5_sjrp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_msmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 300000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-02T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		hud_marker_defs = { "C_Mercenary_M_T5_sjrp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Mercenary_M_T5_sjrp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_msmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_msmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms2mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "C_CrystallidPatrol_L_T4_rjrp" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_ms2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_ms2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms3mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "C_Robber_Ronin_M_T5_awr8" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gmmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "C_UnknownCrystallid_L_T5_s_jrp" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_UnknownCrystallid_L_T5_s_jrp", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gmmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gmmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gimk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		hud_marker_defs = { "C_Pirates_S_T4_rjrs" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gimk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gimk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi2mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "C_Cyber_M_T5_rjrs" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Cyber, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi2mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi2mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "C_Crystallid_L_T4_rjrs3" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Crystallid_L_T4_rjrs3", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "C_Overseer_L_T5_hjrt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Overseer_L_T5_hjrt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_jbmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-05T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_JerichoBase",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_JerichoBase.zone_id,
		hud_marker_defs = { "C_Cyber_M_T5_mjlc" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Cyber, }, },
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Cyber_M_T5_mjlc", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_JerichoBase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_JerichoBase.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_jbmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_jbmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jls_dmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 55000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-02T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_lavastone",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_lavastone.zone_id,
		hud_marker_defs = { "C_Emp_Scout_S_T5_rprl" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile2, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_lavastone.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_lavastone.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jls_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_jls_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "default",
			text = "quest_OW_jls_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_jbd_dmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-06T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_barrierdebris",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_barrierdebris.zone_id,
		hud_marker_defs = { "C_Fed_Police_S_T5_rprt" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile3, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_barrierdebris.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_barrierdebris.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jbd_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jbd_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jbd_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_jcc_dmk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_concourse",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_concourse.zone_id,
		hud_marker_defs = { "C_Fed_Police_M_T5_rpis" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile2, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_concourse.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_concourse.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jcc_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_jcc_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_jcc_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_jac_dmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 13,
	character = "default",
	intervalStartHour = "2017-11-02T04:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_ancientcomplex",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		marked_zone_id  = SpaceZone.ow_ancientcomplex.zone_id,
		hud_marker_defs = { "C_Crystallid_Predator_L_T5_reet" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_ancientcomplex.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_ancientcomplex.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jac_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_jac_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "default",
			text = "quest_OW_jac_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_jad_dmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 13,
	character = "jer_captain",
	intervalStartHour = "2017-11-03T10:00:00Z",
	intervalLongHours = 154,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_aliendebris13",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		marked_zone_id  = SpaceZone.ow_aliendebris13.zone_id,
		hud_marker_defs = { "C_Crystallid_L_T5_rpep3" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_aliendebris13.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_aliendebris13.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_jad_dmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_jad_dmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_jad_dmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_jls_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-03T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_lavastone",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_lavastone.zone_id,
		hud_marker_defs = { "C_Fed_Police_L_T5_rprl" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_lavastone.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_lavastone.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jls_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_jls_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jbd_mk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_barrierdebris",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_barrierdebris.zone_id,
		hud_marker_defs = { "C_Emp_Police_S_T5_rprt" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_barrierdebris.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_barrierdebris.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jbd_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jbd_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jth_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 120000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_threshold",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 10,
		marked_zone_id  = SpaceZone.ow_threshold.zone_id,
		hud_marker_defs = { "C_Mercenary_M_T5_rprb" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_threshold.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_threshold.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jth_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "default",
			text = "quest_OW_jth_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jac_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 13,
	character = "jer_engineer",
	intervalStartHour = "2017-11-03T16:00:00Z",
	intervalLongHours = 154,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_ancientcomplex",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_ancientcomplex.zone_id,
		hud_marker_defs = { "C_Crystallid_Predator_L_T5_reet" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_ancientcomplex.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_ancientcomplex.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jac_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jac_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jad_mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 13,
	character = "default",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_aliendebris13",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 7,
		marked_zone_id  = SpaceZone.ow_aliendebris13.zone_id,
		hud_marker_defs = { "C_Crystallid_L_T5_rpep3" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_aliendebris13.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_aliendebris13.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jad_mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "default",
			text = "quest_OW_jad_mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation3",
	spawn_ai_squad = "Pirate_QuestJericho_s3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidStation3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_s3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_s3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-06T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation2",
	spawn_ai_squad = "Pirate_QuestJericho_s2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidStation2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_s2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_s2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_msk ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite",
	spawn_ai_squad = "Pirate_QuestJericho_msk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_msk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_msk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_msk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_msk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 285000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-03T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	spawn_ai_squad = "Pirate_QuestJericho_ms2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_ms2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_ms2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_ms2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_ms2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 240000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-05T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	spawn_ai_squad = "Pirate_QuestJericho_gmk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_gmk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_gmk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gik ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-04T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid",
	spawn_ai_squad = "Pirate_QuestJericho_gik",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_gik" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_gik", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gik_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gik_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi2k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-01T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	spawn_ai_squad = "Pirate_QuestJericho_gi2k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_gi2k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_gi2k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gi2k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gi2k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 3}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-07T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	spawn_ai_squad = "Pirate_QuestJericho_gi3k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_gi3k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_gi3k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gi3k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gi3k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 315000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-06T04:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	spawn_ai_squad = "Pirate_QuestJericho_mtk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_mtk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_mtk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_jbk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 3}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_JerichoBase",
	spawn_ai_squad = "Cyber_Patrol2",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_JerichoBase.zone_id,
		hud_marker_defs = { "C_Pirate_QuestJericho_jbk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_QuestJericho_jbk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_JerichoBase.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_JerichoBase.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_jbk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_jbk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jth_dk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 8}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-03T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_threshold",
	spawn_ai_squad = "Hostile2_Patrol12",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_threshold.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_jth_dk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_jth_dk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_threshold.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_threshold.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jth_dk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_jth_dk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_jcc_k ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-01T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_concourse",
	spawn_ai_squad = "Pirate_Patrol13",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_concourse.zone_id,
		hud_marker_defs = { "C_Pirate_Quest_jcc_k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Pirate_Quest_jcc_k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_concourse.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_concourse.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_jcc_k_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_jcc_k_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s2t ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 36}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-03T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation2",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidStation2.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T5_sjrp" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_s2t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms2t ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 30}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-02T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "C_Quest_Transport_ms2t" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_ms2t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ms2t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ms2t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms3t ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 45}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T5_awr8" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_ms3t", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3t_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3t_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_git ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 60}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		hud_marker_defs = { "C_Transport_QuestJericho_git" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_git", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_git_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_git_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 45}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T5_hjrt" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestJericho_mtt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi2pt ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "C_Quest_Cyber_Transport_L_T5_rjrs" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Quest_Cyber_Transport_L_T5_rjrs", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid2.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gi2pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gi2pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-03T07:00:00Z",
	intervalLongHours = 171,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "C_Transport_QuestJericho_gi3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestJericho_gi3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gi3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gi3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s3pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-04T07:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidStation3.zone_id,
		hud_marker_defs = { "C_Transport_QuestJericho_s3pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestJericho_s3pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidStation3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gmpt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Impure_iridium", 20}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-02T07:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "C_Transport_QuestJericho_gmpt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestJericho_gmpt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gmpt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_gmpt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s3l ] = {
			disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	give_items = {"ow_QuestLootJericho_s3key"},
	drop_item = "ow_QuestLootJericho_s3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_s3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_s3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_s3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 8}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-04T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidStation2",
	give_items = {"ow_QuestLootJericho_s2key"},
	drop_item = "ow_QuestLootJericho_s2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 2,
		marked_zone_id  = SpaceZone.Jericho_IsidStation2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_s2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_s2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidStation2.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_s2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_s2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ghl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 8}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-06T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGasharvest",
	give_items = {"ow_QuestLootJericho_ghkey"},
	drop_item = "ow_QuestLootJericho_gh",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidGasharvest.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_gh" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_gh", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGasharvest.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ghl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ghl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_msl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_major",
	intervalStartHour = "2017-11-05T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite",
	give_items = {"ow_QuestLootJericho_mskey"},
	drop_item = "ow_QuestLootJericho_ms",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_ms" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_ms", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_msl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "jer_major",
			text = "quest_OW_JERICHO_msl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-05T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite2",
	give_items = {"ow_QuestLootJericho_ms2key"},
	drop_item = "ow_QuestLootJericho_ms2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_ms2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_ms2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite2.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gml ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-06T07:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	give_items = {"ow_QuestLootJericho_gmkey"},
	drop_item = "ow_QuestLootJericho_gm",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_gm" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_gm", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gml_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gml_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gil ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 12}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-02T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid",
	give_items = {"ow_QuestLootJericho_gikey"},
	drop_item = "ow_QuestLootJericho_gi",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 7,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_gi" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_gi", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gil_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 7,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gil_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi2l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 10}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-06T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	give_items = {"ow_QuestLootJericho_gi2key"},
	drop_item = "ow_QuestLootJericho_gi2",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_gi2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_gi2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gi2l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gi2l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3l ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-07T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	give_items = {"ow_QuestLootJericho_gi3key"},
	drop_item = "ow_QuestLootJericho_gi3",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 4,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_gi3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_gi3", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 4,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Tungsten_ore", 20}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-02T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	give_items = {"ow_QuestLootJericho_mtkey"},
	drop_item = "ow_QuestLootJericho_mt",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 6,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootJericho_mt" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootJericho_mt", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_mtl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_s3d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	give_items = {"ow_QuestJericho_s3d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_s3d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_s3d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_s3d_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ghd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGasharvest",
	give_items = {"ow_QuestJericho_ghd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGasharvest.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_ghd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_ghd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGasharvest.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ghd_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms3d ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite3",
	give_items = {"ow_QuestJericho_ms3d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_ms3d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_ms3d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite3.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_ms3d_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3d ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 3}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "default",
	intervalStartHour = "2017-11-05T07:00:00Z",
	intervalLongHours = 172,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	give_items = {"ow_QuestJericho_gi3d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_gi3d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_gi3d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3d_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_gi3d_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_msd ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-06T01:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite",
	give_items = {"ow_QuestJericho_msd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_msd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_msd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_msd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_msd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtd ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	give_items = {"ow_QuestJericho_mtd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_mtd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_mtd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_mtd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_mtd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gmd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Osmium_ore", 15}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-05T19:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	give_items = {"ow_QuestJericho_gmd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_gmd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_gmd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gmd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gmd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_jbd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-02T22:00:00Z",
	intervalLongHours = 131,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_JerichoBase",
	give_items = {"ow_QuestJericho_jbd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_JerichoBase.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_jbd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_jbd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_JerichoBase.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_jbd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_jbd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi2d ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-02T10:00:00Z",
	intervalLongHours = 154,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid2",
	give_items = {"ow_QuestJericho_gi2d"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_gi2d" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_gi2d", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gi2d_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_msdo ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 1}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-03T04:00:00Z",
	intervalLongHours = 130,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidMiningsite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidMiningsite.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Jericho_msdo" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Jericho_msdo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidMiningsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidMiningsite.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_msdo_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_msdo_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gmdo ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Silicon_wafer", 5}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_engineer",
	intervalStartHour = "2017-11-03T22:00:00Z",
	intervalLongHours = 163,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Jericho_gmdo" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Jericho_gmdo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGateMaseera.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGateMaseera.zone_id,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gmdo_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "jer_engineer",
			text = "quest_OW_JERICHO_gmdo_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ghdo ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGasharvest",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_IsidGasharvest.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Jericho_ghdo" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Jericho_ghdo", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_IsidGasharvest.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_IsidGasharvest.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_ghdo_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_gi3do ] = {
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraGateIsid3",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		hud_marker_defs = { "OpenWorld_Quest_Jericho_gi3do" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_Quest_Jericho_gi3do", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraGateIsid3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_gi3do_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_mtdo ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 12,
	character = "jer_captain",
	intervalStartHour = "2017-11-01T22:00:00Z",
	intervalLongHours = 171,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 2,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "jer_captain",
			text = "quest_OW_JERICHO_mtdo_dialog1", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_ms3l ] = {
		disabled = true,
				disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 12,
	character = "default",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_MaseeraTerramorphingsite",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 2,
		marked_zone_id  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		hud_marker_defs = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "OpenWorld_KiberRocketTurret", "OpenWorld_KiberTurret", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3l_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 2,
			dialogs  = {{ character = "default",
			text = "quest_OW_JERICHO_ms3l_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_WINTER_WAR_1 ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	save_progress = true,
	event_day_min = 27,
	event_day_max = 99,
	reward_event_credits = 50,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 1,
	character = "emp_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona3",
	give_items = {"ow_QuestEllidium_hcil_key"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.Precursor_Zona3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEllidium_hcil" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEllidium_hcil", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_1_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_1_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_WINTER_WAR_2 ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	save_progress = true,
	event_day_min = 27,
	event_day_max = 99,
	reward_event_credits = 50,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 1,
	character = "scientist",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona3",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.Precursor_Zona3.zone_id,
		hud_marker_defs = { "C_Quest_Transport_T1_hcil" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "C_Quest_Transport_T1_hcil", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Precursor_Zona3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "scientist",
			text = "quest_OW_WINTER_WAR_2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "scientist",
			text = "quest_OW_WINTER_WAR_2_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_WINTER_WAR_3 ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	save_progress = true,
	event_day_min = 27,
	event_day_max = 99,
	reward_event_credits = 50,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 1,
	character = "scientist",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona3",
	give_items = {"ow_QuestLootEllidium_hcilkey"},
	drop_item = "ow_QuestLootEllidium_hcil",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		marked_zone_id  = SpaceZone.Precursor_Zona3.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootEllidium_hcil", "ow_QuestLootEllidium_hcil" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootEllidium_hcil", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_3_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "scientist",
			text = "quest_OW_WINTER_WAR_3_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_WINTER_WAR_4 ] = {
		disabled = true,
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	save_progress = true,
	event_day_min = 27,
	event_day_max = 99,
	reward_event_credits = 50,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 100,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 1,
	character = "emp_major",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona3",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.Precursor_Zona3.zone_id,
		hud_marker_defs = { "Aliens" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Alien, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.Precursor_Zona3.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.Precursor_Zona3.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_4_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_4_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_WINTER_WAR_4_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_tsmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 7,
	character = "empire_leader",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_transstance",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_transstance.zone_id,
		hud_marker_defs = { "C_TreasureHunter_S_T3_met" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_transstance.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_transstance.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_tsmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 3,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_tsmk_dialog2", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_tsmk_dialog3", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_tsk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 7,
	character = "empire_leader",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_transstance",
	spawn_ai_squad = "C_Fed_Technician_Quest_met_k",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_transstance.zone_id,
		hud_marker_defs = { "C_Fed_Technician_Quest_met_k" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Fed_Technician_Quest_met_k", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_transstance.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_transstance.zone_id,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_tsk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "empire_leader",
			text = "quest_OW_EMPIRE_tsk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_aymk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 16,
	character = "ellidium_girl",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_allidium_yard",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 6,
		marked_zone_id  = SpaceZone.ow_allidium_yard.zone_id,
		hud_marker_defs = { "C_Pirate_M_T5_saey" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_allidium_yard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_allidium_yard.zone_id,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_aymk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 6,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_aymk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_ayd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 50000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 16,
	character = "ellidium_girl",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_allidium_yard",
	give_items = {"ow_QuestFederarion_ayd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_allidium_yard.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederarion_ayd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederarion_ayd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_allidium_yard.zone_id,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_ayd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_ayd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_ayt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 45}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 16,
	character = "ellidium_girl",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_allidium_yard",
	stages ={{
		game_event  = ai.GameEvent.DEFEND_CONVOY,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_allidium_yard.zone_id,
		hud_marker_defs = { "C_Transport_Quest_T5_saey" },
		restrictions ={
			{ param = ai.GameEventParam.AI_SQUAD_NAME, str_value = { "Transport_QuestFederation_ayt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_allidium_yard.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_allidium_yard.zone_id,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_ayt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "ellidium_girl",
			text = "quest_OW_FEDERATION_ayt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_od ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 40000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "broker",
	intervalStartHour = "2017-11-03T13:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_omega",
	give_items = {"ow_QuestFederarion_od"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_omega.zone_id,
		hud_marker_defs = { "OpenWorld_QuestFederarion_od" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestFederarion_od", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_omega.zone_id,
			dialogs  = {{ character = "broker",
			text = "quest_OW_FEDERATION_od_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "broker",
			text = "quest_OW_FEDERATION_od_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_ok ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 11,
	character = "broker",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_omega",
	spawn_ai_squad = "C_Marauder_QuestFederation_ok",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_omega.zone_id,
		hud_marker_defs = { "C_Marauder_QuestFederation_ok" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Marauder_QuestFederation_ok", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_omega.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_omega.zone_id,
			dialogs  = {{ character = "broker",
			text = "quest_OW_FEDERATION_ok_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "broker",
			text = "quest_OW_FEDERATION_ok_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_n17mk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 2,
	character = "nemoff",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_smallstation",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_smallstation.zone_id,
		hud_marker_defs = { "C_PiratesBouncer_M_T1_sees" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Pirate, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_smallstation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_smallstation.zone_id,
			dialogs  = {{ character = "nemoff",
			text = "quest_OW_EMPIRE_n17mk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "nemoff",
			text = "quest_OW_EMPIRE_n17mk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_n17pt ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"ow_Crystal_shard", 20}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 2,
	character = "nemoff",
	intervalStartHour = "2017-11-02T07:00:00Z",
	intervalLongHours = 132,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_smallstation",
	stages ={{
		game_event  = ai.GameEvent.KILL_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_smallstation.zone_id,
		hud_marker_defs = { "C_Transport_QuestEmpire_n17pt" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Transport_QuestEmpire_n17pt", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_smallstation.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_smallstation.zone_id,
			dialogs  = {{ character = "nemoff",
			text = "quest_OW_EMPIRE_n17pt_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "nemoff",
			text = "quest_OW_EMPIRE_n17pt_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_dsk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 45000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 14,
	character = "emp_major",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "deathstar",
	spawn_ai_squad = "C_Biomorph_Quest_T5_dsk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.deathstar.zone_id,
		hud_marker_defs = { "C_Biomorph_Quest_T5_dsk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Biomorph_Quest_T5_dsk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.deathstar.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.deathstar.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_EMPIRE_dsk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_EMPIRE_dsk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_dsd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 210000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 14,
	character = "emp_major",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "deathstar",
	give_items = {"ow_QuestEmpire_dsd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.deathstar.zone_id,
		hud_marker_defs = { "OpenWorld_QuestEmpire_dsd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestEmpire_dsd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.deathstar.zone_id,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_EMPIRE_dsd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "emp_major",
			text = "quest_OW_EMPIRE_dsd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_tdl ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-07T01:00:00Z",
	intervalLongHours = 172,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_terminal_d",
	give_items = {"ow_QuestLootFederation_tdlkey"},
	drop_item = "ow_QuestLootFederation_tdl",
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_terminal_d.zone_id,
		hud_marker_defs = { "OpenWorld_QuestLootFederation_tdl" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestLootFederation_tdl", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_terminal_d.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_tdl_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_tdl_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_FEDERATION_tdk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 35000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 9,
	character = "fed_major",
	intervalStartHour = "2017-11-05T22:00:00Z",
	intervalLongHours = 144,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_terminal_d",
	spawn_ai_squad = "C_Smuggler_Quest_tdk",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_terminal_d.zone_id,
		hud_marker_defs = { "C_Smuggler_Quest_tdk" },
		restrictions ={
			{ param = ai.GameEventParam.ENEMY_DEF_NAME, str_value = { "C_Smuggler_Quest_tdk", }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_terminal_d.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_terminal_d.zone_id,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_tdk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "fed_major",
			text = "quest_OW_FEDERATION_tdk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_EMPIRE_asmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Aliens_ship_part", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 7,
	character = "broker",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 172,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_asteroidsatellite",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_asteroidsatellite.zone_id,
		hud_marker_defs = { "C_TreasureHunter_S_T3_mers" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile1, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_asteroidsatellite.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_asteroidsatellite.zone_id,
			dialogs  = {{ character = "broker",
			text = "quest_OW_EMPIRE_asmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "broker",
			text = "quest_OW_EMPIRE_asmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_lhmk ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_items = { {"Iridium_monocrystall", 2}, },
	ui_reward = "reward_items",
	unlocks_on_account_rank = 13,
	character = "sch_jerico",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 172,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_last_hope",
	stages ={{
		game_event  = ai.GameEvent.TAKEDOWN,
		required_value = 5,
		marked_zone_id  = SpaceZone.ow_last_hope.zone_id,
		hud_marker_defs = { "C_Emp_Scout_S_T5_ojrt" },
		restrictions ={
			{ param = ai.GameEventParam.REL_GROUP, num_value = { ai.RelationshipGroups.Hostile2, }, },
			{ param = ai.GameEventParam.ZONE_ID , num_value = { SpaceZone.ow_last_hope.zone_id, }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_last_hope.zone_id,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhmk_dialog0", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhmk_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 5,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhmk_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_lhd ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 168000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 13,
	character = "sch_jerico",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_last_hope",
	give_items = {"ow_QuestJericho_lhd"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_last_hope.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_lhd" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_lhd", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_last_hope.zone_id,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhd_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhd_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_JERICHO_lhd2 ] = {
	category = QuestCategory.ALERT,
	tag = ai.QuestTag.DAILY_OW,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 60000,
	ui_reward = "reward_vessel_exp",
	unlocks_on_account_rank = 13,
	character = "sch_jerico",
	intervalStartHour = "2017-11-02T16:00:00Z",
	intervalLongHours = 143,
	intervalLongEnableHours = 6,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_last_hope",
	give_items = {"ow_QuestJericho_lhd2"},
	stages ={{
		game_event  = ai.GameEvent.INTERACT_OBJECT,
		required_value = 1,
		marked_zone_id  = SpaceZone.ow_last_hope.zone_id,
		hud_marker_defs = { "OpenWorld_QuestJericho_lhd2" },
		restrictions ={
			{ param = ai.GameEventParam.DEF_NAME, str_value = { "OpenWorld_QuestJericho_lhd2", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.ENTER_ZONE, int_param  = SpaceZone.ow_last_hope.zone_id,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhd2_dialog1", }} },
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 1,
			dialogs  = {{ character = "sch_jerico",
			text = "quest_OW_JERICHO_lhd2_dialog2", }} },
		}
	}}
}

Quests[ QuestId.OW_April2021_1 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayGateSirus3",
	drop_item = "ow_QuestApril2021_1",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_1" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_1", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_2 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_Frontier",
	drop_item = "ow_QuestApril2021_2",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_2", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_3 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_IsidGateMaseera",
	drop_item = "ow_QuestApril2021_3",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_3", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_4 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_transstance",
	drop_item = "ow_QuestApril2021_4",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_4" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_4", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_5 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_IlayMiningsite",
	drop_item = "ow_QuestApril2021_5",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_5" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_5", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_6 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_AsteroidBuilding",
	drop_item = "ow_QuestApril2021_6",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_6" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_6", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_7 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_desttown",
	drop_item = "ow_QuestApril2021_7",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_7" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_7", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_8 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona3",
	drop_item = "ow_QuestApril2021_8",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_8" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_8", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_9 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_asteroidcity",
	drop_item = "ow_QuestApril2021_9",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_9" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_9", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_10 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_lunar",
	drop_item = "ow_QuestApril2021_10",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_AprilCar_Loot_10" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_10", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2021_End ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 15000000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 10,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_QuestApril2021_1", "ow_QuestApril2021_2", "ow_QuestApril2021_3", "ow_QuestApril2021_4", "ow_QuestApril2021_5", "ow_QuestApril2021_6", "ow_QuestApril2021_7", "ow_QuestApril2021_8", "ow_QuestApril2021_9", "ow_QuestApril2021_10", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PiratBasePve_Treasure ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "PiratBasePve_TreasureChest",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_foul_ground",
	give_items = {"PirateBasePve_key"},
	drop_item = "ow_PirateBasePve_Treasure",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PirateBasePve_Treasure", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PikabuEvent_0 ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	drop_item = "ow_PikabuEvent_start",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PikabuEvent_start", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PikabuEvent_1 ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_after_all = { QuestId.PikabuEvent_0 },
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	give_items = {"ow_PikabuEvent_1_key"},
	drop_item = "ow_PikabuEvent_1",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_PikabuAstronaut_1" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PikabuEvent_1", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PikabuEvent_2 ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_after_all = { QuestId.PikabuEvent_0 },
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	give_items = {"ow_PikabuEvent_2_key"},
	drop_item = "ow_PikabuEvent_2",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_PikabuAstronaut_2" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PikabuEvent_2", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PikabuEvent_3 ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_after_all = { QuestId.PikabuEvent_0 },
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	give_items = {"ow_PikabuEvent_3_key"},
	drop_item = "ow_PikabuEvent_3",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		hud_marker_defs = { "OpenWorld_PikabuAstronaut_3" },
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PikabuEvent_3", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_PikabuEvent ] = {
		disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_after_all = { QuestId.PikabuEvent_0 },
	unlocks_on_account_rank = 2,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 3,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_1 ] = {
	group = QuestGroupId.BLACKRR1,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_01",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward13", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_2 ] = {
	group = QuestGroupId.BLACKRR2,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_02",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward16", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_3 ] = {
	group = QuestGroupId.BLACKRR3,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_03",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_11,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward17", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_4 ] = {
	group = QuestGroupId.BLACKRR4,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_04",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_11,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward23", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_5 ] = {
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_05",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward31", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_6 ] = {
	group = QuestGroupId.BLACKRR6,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_06",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_11,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward32", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_7 ] = {
	group = QuestGroupId.BLACKRR7,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_07",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_11,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward33", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_8 ] = {
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_08",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward35", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_9 ] = {
	group = QuestGroupId.BLACKRR9,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_09",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	acceptable_during = QuestId.OW_BlackRelayRace_10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_BRRace_Reward36", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_10 ] = {
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_10",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.COMPLETE_QUEST,
		required_value = 2,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.BLACKRR2, QuestGroupId.BLACKRR9, }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_BlackRelayRace_11 ] = {
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_BlackRelayRace_11",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "sch_jerico",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.COMPLETE_QUEST,
		required_value = 5,
		restrictions ={
			{ param = ai.GameEventParam.QUEST_GROUP, num_value = { QuestGroupId.BLACKRR1, QuestGroupId.BLACKRR3, QuestGroupId.BLACKRR4, QuestGroupId.BLACKRR6, QuestGroupId.BLACKRR7, }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_main ] = {
			disabled = true,
	category = QuestCategory.EVENT,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_EggRoller2026",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 7,
	character = "scientist",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 10,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg1", "OW_April2023_egg2", "OW_April2023_egg3", "OW_April2023_egg4", "OW_April2023_egg5", "OW_April2023_egg6", "OW_April2023_egg7", "OW_April2023_egg8", "OW_April2023_egg9", "OW_April2023_egg10", }, },
		},
		info_events ={
			{ event  = ai.QuestInfoEvent.PROGRESS, int_param  = 10,
			dialogs  = {{ character = "scientist",
			text = "OW_April2023_main_complte", }} },
		}
	}}
}

Quests[ QuestId.OW_April2023_1 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_credits = 5000000,
	ui_reward = "reward_credits",
	unlocks_on_account_rank = 7,
	character = "general",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_smallstation",
	give_items = {"OW_April2023_Egg1_Key"},
	drop_item = "OW_April2023_egg1",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg1", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_2 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_HomeWorld",
	give_items = {"OW_April2023_Egg2_Key"},
	drop_item = "OW_April2023_egg2",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg2", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_3 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 202600,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_planet_war_7",
	give_items = {"OW_April2023_Egg3_Key"},
	drop_item = "OW_April2023_egg3",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg3", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_4 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_desttown",
	give_items = {"OW_April2023_Egg4_Key"},
	drop_item = "OW_April2023_egg4",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg4", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_5 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	reward_event_credits = 300,
	openspace = true,
	modify_rewards = true,
	ui_reward = "reward_event_credits",
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_FrozenStation",
	give_items = {"OW_April2023_Egg5_Key"},
	drop_item = "OW_April2023_egg5",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg5", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_6 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Federation_CaribWaterharvest",
	give_items = {"OW_April2023_Egg6_Key"},
	drop_item = "OW_April2023_egg6",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg6", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_7 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_vessel_exp = 202600,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Precursor_Zona2",
	give_items = {"OW_April2023_Egg7_Key"},
	drop_item = "OW_April2023_egg7",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg7", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_8 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "ow_northmsite",
	give_items = {"OW_April2023_Egg8_Key"},
	drop_item = "OW_April2023_egg8",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg8", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_9 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_gold_credits = 1000,
	ui_reward = "reward_gold_credits",
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Jericho_HomeWorld",
	give_items = {"OW_April2023_Egg9_Key"},
	drop_item = "OW_April2023_egg9",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg9", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_April2023_10 ] = {
			disabled = true,
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	unlocks_on_account_rank = 7,
	character = "sch_jerico",
	intervalStartHour = "2026-03-31T05:00:00Z",
	intervalLongHours = 8000,
	intervalLongEnableHours = 408,
	battleType = ai.QuestBattleType.OW,
	battlePoint = "Empire_HomeWorld",
	give_items = {"OW_April2023_Egg10_Key"},
	drop_item = "OW_April2023_egg10",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "OW_April2023_egg10", }, },
		},
		info_events ={
		}
	}}
}

Quests[ QuestId.OW_Ariadna_1 ] = {
	auto_accept = true,
	auto_complete = true,
	save_progress = true,
	openspace = true,
	modify_rewards = true,
	reward_account_aura = "Bundle_Ariadna",
	ui_reward = "reward_account_aura",
	unlocks_on_account_rank = 10,
	character = "emp_captain",
	hidden = true,
	stages ={{
		game_event  = ai.GameEvent.LOOT_ITEM,
		required_value = 1,
		restrictions ={
			{ param = ai.GameEventParam.ITEM_NAME, str_value = { "AdventureItem_Ariadna_Journal", }, },
		},
		info_events ={
		}
	}}
}

