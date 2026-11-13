-- файл читается на сервисе

-- индексы скриптовых стадий, используются в дефах приключений, поэтому определены тут.
ai.AdventureStageType.TestStageAlpha	= ai.AdventureStageType.SCRIPT_FIRST
ai.AdventureStageType.TestStageBeta		= ai.AdventureStageType.SCRIPT_FIRST + 1
ai.AdventureStageType.SITUATION_RESULT	= ai.AdventureStageType.SCRIPT_FIRST + 2
ai.AdventureStageType.PIKABU			= ai.AdventureStageType.SCRIPT_FIRST + 3
ai.AdventureStageType.CHECK_ZONE		= ai.AdventureStageType.SCRIPT_FIRST + 4

-- Индексы дефов приключений.
-- Приключения храняются в базе ссылаясь на дефы по индексам, так что просто удалить приключение N и на его место впихнуть другое - черевато, если оно у кого-то еще в базе есть.
ai.Adventures = {
	NONE = 0,
	TestScriptStages	= 1,
	TestNativeStages	= 2,
	TestSituations		= 3,
	TestSingletone		= 4,
	TestRestrictions	= 5,
	-- Империя - Страж-17
	Empire_Guardian17_1	= 6,
	Empire_Guardian17_2	= 7,
	Empire_Guardian17_3	= 8,
	-- Федерация - Новый эдем
	Federation_NewEdem_1	= 9,
	Federation_NewEdem_2	= 10,
	Federation_NewEdem_3	= 11,
	-- Иерихон - Мендес XI
	Jericho_MendesXI_1	= 12,
	Jericho_MendesXI_2	= 13,
	Jericho_MendesXI_3	= 14,
	
	TestMechanics		= 15,
	
	Federation_NewEdem_feia_1	= 16,
	Empire_Guardian17_wgr3_1	= 17,
	Jericho_MendesXI_MJR_1 		= 18,
	
	PikabuEvent 	= 19,
	New_ground_1	= 20,
	New_ground_2	= 21,
	New_ground_3	= 22,
	New_ground_4	= 23,
	New_ground_5	= 24,
	New_ground_6	= 25,
	New_ground_7	= 26,
	
	BlackRelayRace	= 27,
	
	AriadnaTest = 28,
	Prefinal_Emp = 29,
	Prefinal_Fed = 30,
	Prefinal_Jer = 31,
	FelixFlex_2025_Radar = 32,
	FelixFlex_2025_Car = 33,
	FelixFlex_2025_Man = 34,
	RoP2025_Final = 35,
	RoP2025_2_Final = 36,
}

Milestones =
{
	New_ground_1	= 0,
	AriadnaTest	= 1,
	Prefinal_Emp = 2,
	Prefinal_Fed = 3,
	Prefinal_Jer = 4,
	Prefinal_Emp2025 = 5,
	Prefinal_Fed2025 = 6,
	Prefinal_Jer2025 = 7,
	RoP2025_Final = 8,
	RoP2025_2_Final = 9,
}

Adventures = {}


Adventures[ ai.Adventures.TestScriptStages ] = {

	atid = ai.Adventures.TestScriptStages,
	
	generator = function ( player ) return {1, CL_GetCurrentSpaceZoneId(), 30, 4, 3} end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.TestStageAlpha,
			required_progress = 9,
		},
	},
	
	final_on_cancel = ai.AdventureStage.ROUTE_FIRST + 1,

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			gold 			= 1000,
			credits 		= 1000,
			eventCredits 	= 1000,
			items 			= { {"ow_Osmium_ore", 20 }, },
		},

		[ ai.AdventureStage.ROUTE_FIRST + 1 ] = 
		{
			gold 			= 228,
			credits 		= 228,
			eventCredits 	= 228,
			items 			= { {"ow_Osmium_ore", 28 }, },
		},
	},
	
}


Adventures[ ai.Adventures.TestNativeStages ] = {

	atid = ai.Adventures.TestNativeStages,
	
	generator = function ( player ) return { CL_GetCurrentSpaceZoneId(), 0, 0, 0, 0 } end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.DAMAGE,
			required_progress = 500,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_Adventure_A" } },
			},
			
			situation_def	= "AdventureTest_SpawnNPC",
			situation_args	= { shipDef = "Ship_Adventure_A", shipName = "Bite me" },
		},
		
	[2] =
		{
			stage_type = ai.AdventureStageType.HEAL,
			required_progress = 500,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_Adventure_B" } },
			},
			
			situation_def	= "AdventureTest_SpawnNPC",
			situation_args	= { shipDef = "Ship_Adventure_B", shipName = "Heal me", spawnHealth = 1, friendly = true },
		},
		
	[3] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 2,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_Adventure_A" } },
			},
			
			situation_def	= "AdventureTest_SpawnNPC",
			situation_args	= { shipDef = "Ship_Adventure_A", shipName = "Kill me", spawnHealth = 1, respawnsNum = 2 },
		},
		
	[4] =
		{
			stage_type = ai.AdventureStageType.KILL,
			required_progress = 2,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_Adventure_A" } },
			},
			
			situation_def	= "AdventureTest_SpawnNPC",
			situation_args	= { shipDef = "Ship_Adventure_A", shipName = "Last hit me", spawnHealth = 1, respawnsNum = 2 },
		},
		
	[5] =
		{
			stage_type = ai.AdventureStageType.ENTER_ZONE,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { ai.Placeholders[1] } },
			},
		},
		
	[6] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 2,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
			},
			-- нужно выдавать еще и квестовые предметы
			situation_def	= "AdventureTest_SpawnEntity",
			situation_args	= { entityDef = "Adventure_Object_A", isInteractive = true, countdownTime = 5 },
			
		},
		
	[7] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 2,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "Adventure_Loot_A" } },
			},
			
			situation_def	= "AdventureTest_LootCrate",
			next_on_success	= ai.AdventureStage.WIN,
			--next_on_success	= 1, -- )))
			
			situation_args	=
			{
				entityDef	= "Adventure_LootCrate_Generic",
				lootDef		= "Adventure_Loot_A",
				lootCount	= 3,
				ttl			= 60,
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			gold 			= 1000,
			credits 		= 1000,
			eventCredits 	= 1000,
			items 			= { {"ow_Osmium_ore", 20 }, },
		},

		[ ai.AdventureStage.LOSS ] = 
		{
			gold 			= 1,
			credits 		= 1,
			eventCredits 	= 1,
			items 	 		= { {"ow_Osmium_ore", 1 }, },
		},

		[ ai.AdventureStage.ROUTE_FIRST ] = 
		{
			gold 			= 100,
			credits 		= 100,
			eventCredits 	= 100,
			items 			= { {"ow_Osmium_ore", 10 }, },
		},
	},
}

Adventures[ ai.Adventures.TestSituations ] = {

	atid = ai.Adventures.TestSituations,
	
	generator = function ( player ) return {1, CL_GetCurrentSpaceZoneId(), 2, 3, 4} end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.TestStageBeta,
			required_progress = 3,
			
			situation_def = "Beta",
			situation_args = { testArg = 4, testArg2 = 23 },
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.ROUTE_FIRST,
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				-- [ ai.SituationResult.CODE_2 ]	= 2, переход на вторую стадию, а её нет.
				default							= ai.AdventureStage.ROUTE_2,
			},
		},
	},
	
	final_on_cancel = ai.AdventureStage.ROUTE_FIRST + 1,

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			gold 			= 1000,
			credits 		= 1000,
			eventCredits 	= 1000,
			items 			= { {"ow_Osmium_ore", 20 }, },
		},
		[ ai.AdventureStage.ROUTE_FIRST + 1 ] = 
		{
			gold 			= 333,
			credits 		= 333,
			eventCredits 	= 333,
			items 			= { {"ow_Osmium_ore", 33 }, },
		},
	},
	
}


Adventures[ ai.Adventures.TestSingletone ] = {

	atid = ai.Adventures.TestSingletone,
	
	generator = function ( player ) return {1, CL_GetCurrentSpaceZoneId(), 2, 3, 4} end,
	
	stages = {
	[1] =
		{
			stage_type 			= ai.AdventureStageType.DAMAGE,
			required_progress 	= 500,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ALL, 	values = { "alpha" } },
			},
			
			situation_def				= "Single",
			situation_args				= { bossDef = "Ship_Adventure_A" },
			next_on_situation_result	= { default = ai.AdventureStage.LOSS },
		},
	},
	
	final_on_cancel = ai.AdventureStage.ROUTE_FIRST + 1,

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			gold 			= 1000,
			credits 		= 1000,
			eventCredits 	= 1000,
			items 			= { {"ow_Osmium_ore", 20 }, },
		},
		[ ai.AdventureStage.ROUTE_FIRST + 1 ] = 
		{
			gold 			= 21,
			credits 		= 21,
			eventCredits 	= 21,
			items 			= { {"ow_Osmium_ore", 21 }, },
		},
	},
}

Adventures[ ai.Adventures.TestMechanics ] = {

	atid = ai.Adventures.TestMechanics,
	
	generator = function ( player ) return {1, CL_GetCurrentSpaceZoneId(), 2, 3, 4} end,
	
	stages = {
	[1] =
		{
			stage_type 			= ai.AdventureStageType.DAMAGE,
			required_progress 	= 500,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ALL, 	values = { "alpha" } },
			},

			next_on_situation_result	= { default = ai.AdventureStage.LOSS },
		},
	},
	
	final_on_cancel = ai.AdventureStage.ROUTE_FIRST + 1,

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			gold 			= 1000,
			credits 		= 1000,
			eventCredits 	= 1000,
			items 			= { {"ow_Osmium_ore", 20 }, },
		},
	},
}

Adventures[ ai.Adventures.TestRestrictions ] = {

	atid = ai.Adventures.TestRestrictions,
	
	generator = function ( player ) return { CL_GetCurrentSpaceZoneId(), 0, 0, 0, 0} end,
	
	restrictions = {
	
		account_rank		= { min = 3, max = 15 },
		karma_level			= { min = 1, max = 4 },
		
		reputation_level	= {
			[ ai.Faction.EMPIRE  ]	= { min = -3, max = 4 },
			[ ai.Faction.JERICHO ]	= { min = -3, max = 4 },
		},
	},
	
	generator_restriction = function ( player, params )
	
		if params ~= nil then
			return params[ 1 ] == 231
		else
			return CL_GetCurrentSpaceZoneId() == 231
		end
		
	end,
	
	stages = {
	[1] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 1 } },
			},
			
			timeout 		= 100, -- время, по завершении которого стадия закончится
			next_on_timeout = ai.AdventureStage.SUCCESS
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 40000,
		},
	},

}

--

Adventures[ ai.Adventures.Empire_Guardian17_1 ] = {

	atid = ai.Adventures.Empire_Guardian17_1,
	
	generator = function ( player )
		local required_progress  = math.random( 7, 10 )
		return { required_progress, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Empire_Guardian17_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = ai.Placeholders[1],
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_Pirates_M_T1_wgr1" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 14 } },--SpaceZone.Empire_IlayGateRex.zone_id
			},
			marked_zones = { 14 },--SpaceZone.Empire_IlayGateRex.zone_id
			hud_marker_defs = { "C_Pirates_M_T1_wgr1" },
		},
	},
	
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 100000,
		},
	},
}

Adventures[ ai.Adventures.Empire_Guardian17_2 ] = {

	atid = ai.Adventures.Empire_Guardian17_2,
	
	generator = function ( player )
		return { 0, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Empire_Guardian17_2 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_EIS3_SearchCargo" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 106 } },--SpaceZone.Empire_IlayStation3.zone_id,
			},
			marked_zones = { 106 },--SpaceZone.Empire_IlayStation3.zone_id
			hud_marker_defs = { "AdventureInteractObject_EIS3_SearchCargo" },
			
			situation_def	= "Adventure_QuestCollect",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef	= "AdventureInteractObject_EIS3_SearchCargo",
				lootDef		= "AdventureItem_EIS3_SearchCargo",
				lootCount	= 1,
				chance		= 40,
				failIncChanceOn = 60,
			},
		},
	},
	
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 85000,
		},
	},
}

-- взаимодействие со станцией в зоне 
Adventures[ ai.Adventures.Empire_Guardian17_3 ] = {

	atid = ai.Adventures.Empire_Guardian17_3,
	
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Empire_Guardian17_3 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 105 } },--SpaceZone.Empire_IlayStation2.zone_id,
			},
			marked_zones = { 105 },--SpaceZone.Empire_IlayStation2.zone_id
			hud_marker_defs = { "AdventureInteractObject_EIS2_EnergyStation" },
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_EIS2_EnergyStation",
			},
			
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 90000,
		},
	},
}


Adventures[ ai.Adventures.Federation_NewEdem_1 ] = {

	atid = ai.Adventures.Federation_NewEdem_1,
	
	generator = function ( player )
		local required_progress  = math.random( 8, 12 )
		return { required_progress, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Federation_NewEdem_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = ai.Placeholders[1],
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_TreasureHunter_S_T4_mhfr1" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 225 } },--SpaceZone.ow_asteroidcity.zone_id=225
			},
			marked_zones = { 225 },
			hud_marker_defs = { "C_TreasureHunter_S_T4_mhfr1" },
			next_on_success	= ai.AdventureStage.WIN,
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 130000,
		},
	},
}

Adventures[ ai.Adventures.Federation_NewEdem_2 ] = {

	atid = ai.Adventures.Federation_NewEdem_2,
	
	generator = function ( player )
		return { 0, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Federation_NewEdem_2 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 3,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_FF_Container" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 202 } },--Federation_Frontier.zone_id=202
			},
			marked_zones = { 202 },--Federation_Frontier.zone_id=202
			hud_marker_defs = { "AdventureInteractObject_FF_Container" },
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_FF_Container",
			},	
		},
	},
	
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 110000,
		},
	},
}

Adventures[ ai.Adventures.Federation_NewEdem_3 ] = {

	atid = ai.Adventures.Federation_NewEdem_3,
	
	generator = function ( player )
		return { 0, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Federation_NewEdem_3 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_FNS_CartelClue" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 21 } },--SpaceZone.Federation_NalnifanShipyard.zone_id=21
			},
			marked_zones = { 21 },--SpaceZone.Federation_NalnifanShipyard.zone_id=21
			hud_marker_defs = { "AdventureInteractObject_FNS_FedShipWreck" },
			
			situation_def	= "Adventure_QuestCollect",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef	= "AdventureInteractObject_FNS_FedShipWreck",
				lootDef		= "AdventureItem_FNS_CartelClue",
				lootCount	= 1,
				chance		= 20,
				failIncChanceOn = 30,
			},
		},
	},
	
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 120000,
		},
	},
}

Adventures[ ai.Adventures.Jericho_MendesXI_1 ] = {

	atid = ai.Adventures.Jericho_MendesXI_1,
	
	generator = function ( player )
		local required_progress  = math.random( 10, 15 )
		return { required_progress, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Jericho_MendesXI_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = ai.Placeholders[1],
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_Crystallid_L_T4_rjrs3" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 136 } },--SpaceZone.Jericho_MaseeraGateIsid3.zone_id=136
			},
			marked_zones = { 136 },
			hud_marker_defs = { "C_Crystallid_L_T4_rjrs3" },
			next_on_success	= ai.AdventureStage.WIN,
		},
	},
	--final_on_cancel = ai.AdventureStage.WIN,
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 150000,
		},
	},
}

Adventures[ ai.Adventures.Jericho_MendesXI_2 ] = {

	atid = ai.Adventures.Jericho_MendesXI_2,
	
	generator = function ( player )
		return { 0, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Jericho_MendesXI_2 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 33 } },--SpaceZone.Jericho_IsidGateMaseera.zone_id=33
			},
			marked_zones = { 33 },
			hud_marker_defs = { "AdventureInteractObject_JIGM_Tracker" },
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_JIGM_Tracker",
			},
			
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 125000,
		},
	},
}


Adventures[ ai.Adventures.Jericho_MendesXI_3 ] = {

	atid = ai.Adventures.Jericho_MendesXI_3,
	
	generator = function ( player )
		return { 5, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Jericho_MendesXI_3 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = ai.Placeholders[1],
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_JIS_Mineral" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 134 } },--SpaceZone.Jericho_IsidStation3.zone_id=134
			},
			marked_zones = { 134 },--SpaceZone.Jericho_IsidStation3.zone_id=134
			hud_marker_defs = { "AdventureInteractObject_JIS_Mineral" },
			
			situation_def	= "Adventure_QuestCollect",
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_args	=
			{
				entityDef	= "AdventureInteractObject_JIS_Mineral",
				lootDef		= "AdventureItem_JIS_Mineral",
				lootCount	= 1,
			},
		},
	},
	
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 135000,
		},
	},
}

Adventures[ ai.Adventures.Federation_NewEdem_feia_1 ] = {

	atid = ai.Adventures.Federation_NewEdem_feia_1,
	
	generator = function ( player )
		return { 0, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Federation_NewEdem_feia_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 2,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_FEIA_MineCrystal" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 229 } },
			},
			marked_zones = { 229 },
			hud_marker_defs = { "AdventureInteractObject_FEIA_MineCrystal" },
			
			situation_def	= "Adventure_QuestInteract",
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_FEIA_MineCrystal",
				multiuse		= true,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 229,
					dialogs		= {{
						character	= "default",
						text		= "quest_Adv_FedNE_feia_1_dialog_1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param	= 2,
					dialogs		= {{
						character	= "default",
						text		= "quest_Adv_FedNE_feia_1_dialog_2",
					}}
				},
			},
			
		},
	[2] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 10,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_AngrySecuritySDS_M_feia" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 229 } },
			},
			
			hud_marker_defs = { "AdvShip_AngrySecuritySDS_M_feia" },
			marked_zones = { 229 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true, -- провал если игрок покинет карту
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = "AdvShip_AngrySecuritySDS_M_feia",
						amount = 2,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_FEIA_1_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				default							= 3,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param	= 6,
					dialogs		= {{
						character	= "default",
						text		= "quest_Adv_FedNE_feia_1_dialog_3",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param	= 10,
					dialogs		= {{
						character	= "default",
						text		= "quest_Adv_FedNE_feia_1_dialog_4",
					}}
				},
			},
		},		
	[3] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 229 } },
			},
			hud_marker_defs = { "AdventureInteractObject_FEIA_1_Escape", },
			marked_zones = { 229 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200,
				needZones	= { 229, },
				pointDef = "AdventureInteractObject_FEIA_1_Escape",
				fail_ifEscapeZone = true,
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "default",
						text		= "quest_Adv_FedNE_feia_1_dialog_5",
					}}
				},
			},
		},
	},	
	-- factory_emp_iridium_alpha_l_ow
	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 130000,
			items 			= { {"ow_Crystal_shard", 7 }, },
		},
	},
}


Adventures[ ai.Adventures.Empire_Guardian17_wgr3_1 ] = {

	atid = ai.Adventures.Empire_Guardian17_wgr3_1,
	
	generator = function ( player ) return { CL_GetCurrentSpaceZoneId(), 0, 0, 0, 0 } end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Empire_Guardian17_wgr3_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] = --стадия с активацией шпионского зонда и шансом попасть в засаду
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 16 } }, -- wreck_generic_rock_03_r_ow
			},
			marked_zones = { 16 },
			hud_marker_defs = { "AdventureInteractObject_WGR_Tracker", },
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, -- только одна засада может быть запущена одновременно
				ambush_Chance = 15, -- шанс, что засада на игрока сработает %
				triggerDef = "AdventureInteractObject_WGR_Tracker",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_L_wgr3",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_WGR_1_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 16,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_2",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_3",
					}}
				},
			},
		},
	[2] = -- стадия в коотрой нужно зачистить всех мобов с определенными дефами
		{ -- избавтесь от засады пиратов
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 16 } },
			},
			marked_zones = { 16 },
			hud_marker_defs = { "AdvShip_AmbushPirate_M_wgr3", "AdvShip_AmbushPirate_L_wgr3", },
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_AmbushPirate_M_wgr3", "AdvShip_AmbushPirate_L_wgr3", }, -- строка или таблица мобов которых нужно истребить
				fail_ifEscapeZone	= true,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_4",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.FAIL,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_5",
					}}
				},
			},
			
		},
	[3] = -- стадия на уничтожение транспортника пиратов
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_Transport_QuestEmpire_n17pt" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 250 } },
			},
			marked_zones = { 250 },
			hud_marker_defs = { "C_Transport_QuestEmpire_n17pt", },
			next_on_success	= ai.AdventureStage.WIN,
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param	= 1,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Adv_EmpG17_wgr3_1_dialog_6",
					}}
				},
			},
			
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 100000,
			items 			= { {"ow_Tungsten_ore", 5 }, },
		},
	},
}

Adventures[ ai.Adventures.Jericho_MendesXI_MJR_1 ] = {

	atid = ai.Adventures.Jericho_MendesXI_MJR_1,
	
	generator = function ( player ) return { CL_GetCurrentSpaceZoneId(), 0, 0, 0, 0 } end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Jericho_MendesXI_MJR_1 then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 31 } },
			},
			hud_marker_defs = { "AdventureInteractObject_MJR_GazStation", },
			marked_zones = { 31 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 500,  
				needZones	= { 31, },
				pointDef = "AdventureInteractObject_MJR_GazStation",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 2,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "jer_captain",
						text		= "quest_Adv_MenIX_mjr_1_dialog_1",
					}}
				},
			},
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 20,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Ronin_S_mjr" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 31 } },
			},
			
			hud_marker_defs = { "AdventureObject_MJR_BigBattery", "AdvShip_Ronin_S_mjr", },
			marked_zones = { 31 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true, -- провал если игрок покинет карту
				forseEntityDefs = { "AdventureObject_MJR_BigBattery", },
				protectionTarget = "AdventureObject_MJR_BigBattery",
				mobPacksTable = {
					{
						def = "AdvShip_Ronin_S_mjr",
						amount = 3,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_MJR_1_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				[ ai.SituationResult.SUCCESS ]	= 3,
				default							= 3,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param	= 20,
					dialogs		= {{
						character	= "jer_captain",
						text		= "quest_Adv_MenIX_mjr_1_dialog_2",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.FAIL,
					dialogs		= {{
						character	= "jer_captain",
						text		= "quest_Adv_MenIX_mjr_1_dialog_3",
					}}
				},
			},
		},	
	[3] = -- стадия в коотрой нужно зачистить всех мобов с определенными дефами
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 10,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Ronin_S_mjr" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 31 } },
			},
			
			marked_zones = { 31 },
			hud_marker_defs = { "AdventureObject_MJR_BigBattery", "AdvShip_Ronin_S_mjr", },
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_Ronin_S_mjr", }, -- строка или таблица мобов которых нужно истребить
				protectionTarget	= "AdventureObject_MJR_BigBattery",
				fail_ifEscapeZone	= true,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "jer_captain",
						text		= "quest_Adv_MenIX_mjr_1_dialog_4",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.FAIL,
					dialogs		= {{
						character	= "jer_captain",
						text		= "quest_Adv_MenIX_mjr_1_dialog_3",
					}}
				},
			},
			
		},	
	},
	
	-- mininggas_jer_rock_01_r_ow

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 160000,
			items 			= { {"ow_Osmium_ore", 8 }, },
		},
	},
}

Adventures[ ai.Adventures.PikabuEvent ] = {

	atid = ai.Adventures.PikabuEvent,
	
	generator = function ( player )
		local clues  = math.random( 1, 3 )
		return { clues, 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.PikabuEvent then
				return false
			end
		end
		return true	
	end,
	
	no_cancel = true,
	
	stages = {
	[1] = -- ooo
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_start", } },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_1", },
			next_on_success	= 11,
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "ow_PikabuEvent_start",
			},
		},	
	----------
	[2] = -- 1 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[3] = -- 1 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 4,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[4] = -- 1 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_1", },
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_4",
						spawn = "OpenWorld_PikabuAstronaut_1",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= 14,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},
	----------
	[5] = -- 2 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 6,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[6] = -- 2 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 7,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[7] = -- 2 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_2", },
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_4",
						spawn = "OpenWorld_PikabuAstronaut_2",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= 14,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 11,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				default						= 1,
			},
		},
	----------
	[8] = -- 3 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 9,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[9] = -- 3 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 10,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[10] = -- 3 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_3", },
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_4",
						spawn = "OpenWorld_PikabuAstronaut_3",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= 14,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 11,
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				default						= 1,
			},
		},
	----------
	[11] = -- other2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 12,
				default						= 1,
			},
		},	
	[12] = -- other3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 5,
				[ ai.SituationResult.CODE_3 ]	= 8,
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},	
	[13] = -- other4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 14,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 11,
				default						= 1,
			},
		},
	----------
	----------
	[14] = -- xoo
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= ai.AdventureStage.LOSS,
			},
		},	
	----------
	[15] = -- 1 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 16,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[16] = -- 1 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 17,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[17] = -- 1 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_1", },
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_4",
						spawn = "OpenWorld_PikabuAstronaut_1",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},
	----------
	[18] = -- 2 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 19,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[19] = -- 2 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 20,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[20] = -- 2 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_2", },
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_4",
						spawn = "OpenWorld_PikabuAstronaut_2",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= 27,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},
	----------
	[21] = -- 3 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 22,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[22] = -- 3 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 23,
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},	
	[23] = -- 3 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_3", },
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_4",
						spawn = "OpenWorld_PikabuAstronaut_3",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= 27,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 24,
				default						= 14,
			},
		},
	----------
	[24] = -- other2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 15,
				[ ai.SituationResult.CODE_2 ]	= 18,
				[ ai.SituationResult.CODE_3 ]	= 21,
				[ ai.SituationResult.CODE_4 ]	= 14,
				default						= 14,
			},
		},	
	[25] = -- other3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 26,
				default						= 14,
			},
		},	
	[26] = -- other4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= 27,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 14,
				default						= 14,
			},
		},
	----------
	----------
	[27] = -- xxo
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= ai.AdventureStage.LOSS,
			},
		},	
	----------
	[28] = -- 1 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 29,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[29] = -- 1 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 30,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[30] = -- 1 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_1", },
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_4",
						spawn = "OpenWorld_PikabuAstronaut_1",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= ai.AdventureStage.WIN,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},
	----------
	[31] = -- 2 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 32,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[32] = -- 2 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 33,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[33] = -- 2 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_2", },
			--marked_zones = { 31 },
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_second_4",
						spawn = "OpenWorld_PikabuAstronaut_2",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= ai.AdventureStage.WIN,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},
	----------
	[34] = -- 3 2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,

			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_2",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 35,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[35] = -- 3 3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_3",
						result = ai.SituationResult.SUCCESS,
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 36,
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},	
	[36] = -- 3 4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			hud_marker_defs = { "OpenWorld_PikabuAstronaut_3", },

			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_third_4",
						spawn = "OpenWorld_PikabuAstronaut_3",
					},
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_success	= ai.AdventureStage.WIN,
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 37,
				default						= 27,
			},
		},
	----------
	[37] = -- other2
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = "_first_1",
						result = ai.SituationResult.CODE_1,
					},
					{
						def = "_second_1",
						result = ai.SituationResult.CODE_2,
					},
					{
						def = "_third_1",
						result = ai.SituationResult.CODE_3,
					},
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 28,
				[ ai.SituationResult.CODE_2 ]	= 31,
				[ ai.SituationResult.CODE_3 ]	= 34,
				[ ai.SituationResult.CODE_4 ]	= 27,
				default						= 27,
			},
		},	
	[38] = -- other3
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 39,
				default						= 27,
			},
		},	
	[39] = -- other4
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			timeout 		= 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"ow_PikabuEvent_1", "ow_PikabuEvent_2", "ow_PikabuEvent_3",} },
			},
			next_on_success	= ai.AdventureStage.WIN,
			situation_def	= "Adventure_PikabuEvent",
			situation_args	= { 
				beacons = {
					{
						def = { "_other", 
								"_first_1", "_first_2", "_first_3", "_first_4",
								"_second_1", "_second_2", "_second_3", "_second_4",
								"_third_1", "_third_2", "_third_3", "_third_4", },
						result = ai.SituationResult.CODE_4,
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_4 ]	= 27,
				default						= 27,
			},
		},	
		
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 15000000,
		},
	},
}


Adventures[ ai.Adventures.New_ground_1 ] = {

	atid = ai.Adventures.New_ground_1,
	
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	restrictions = {
	
		account_rank		= { min = 15, },
		
	},
	
	no_cancel = true,
	
	stages = {
	[1] =
		{ -- стадия нужна чтобы закрыть сюжетный квест
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_NewGround_Device", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_NewGround_Device",
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "quest_New_ground_1_dialog1",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "quest_New_ground_1_dialog2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "quest_New_ground_1_dialog3",
					},
				},
			},
		},
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 213 } },
			},
			marked_zones = { 213 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 213, },
				pointDef = "AdventureInteractObject_NewGroundQuest_1",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_1_dialog4",
					}}
				},
			},
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_1" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 213 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_1", },
			marked_zones = { 213 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_1",
				lootDef		= "AdventureItem_NewGround_1",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_2,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 35,
						text = "ow_EventStory2020_Story1_1_1",
						sound_file = "es/EventStory2020_Story1_1",
					},
					{
						character = "larry_seldon_unknown",
						timer = 15,
						text = "ow_EventStory2020_Story1_1_2",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			milestone 		= Milestones.New_ground_1,
			credits 		= 100000,
			gold 			= 25,
			items 			= { {"Iridium_monocrystall", 10 }, },
		},
	},
}

Adventures[ ai.Adventures.New_ground_2 ] = {

	atid = ai.Adventures.New_ground_2,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 50400,
			event_filters = {
			},
			next_on_timeout = 2,
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 11 } },
			},
			marked_zones = { 11 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 11, },
				pointDef = "AdventureInteractObject_NewGroundQuest_2",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 11,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_2_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_2_dialog2",
					}}
				},
			},
			
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_2" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 11 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_2", },
			marked_zones = { 11 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_2",
				lootDef		= "AdventureItem_NewGround_2",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_3,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 35,
						text = "ow_EventStory2020_Story1_2_1",
						sound_file = "es/EventStory2020_Story1_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 15,
						text = "ow_EventStory2020_Story1_2_2",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 200000,
			gold 			= 35,
			items 			= { {"Aliens_ship_part", 10 }, },
		},
	},

}

Adventures[ ai.Adventures.New_ground_3 ] = {

	atid = ai.Adventures.New_ground_3,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 50400,
			event_filters = {
			},
			next_on_timeout = 2,
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 224 } },
			},
			marked_zones = { 224 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 224, },
				pointDef = "AdventureInteractObject_NewGroundQuest_3",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_3_dialog1",
					}}
				},
			},
			
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_3" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 224 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_3", },
			marked_zones = { 224 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_3",
				lootDef		= "AdventureItem_NewGround_3",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_4,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 45,
						text = "ow_EventStory2020_Story1_3_1",
						sound_file = "es/EventStory2020_Story1_3",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_3_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_3_3",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 300000,
			gold 			= 45,
			items 			= { {"Iridium_monocrystall", 25 }, },
		},
	},
}


Adventures[ ai.Adventures.New_ground_4 ] = {

	atid = ai.Adventures.New_ground_4,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 50400,
			event_filters = {
			},
			next_on_timeout = 2,
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 234 } },
			},
			marked_zones = { 234 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 234, },
				pointDef = "AdventureInteractObject_NewGroundQuest_4",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 234,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_4_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_4_dialog2",
					}}
				},
			},
			
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_4" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 234 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_4", },
			marked_zones = { 234 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_4",
				lootDef		= "AdventureItem_NewGround_4",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_5,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 45,
						text = "ow_EventStory2020_Story1_4_1",
						sound_file = "es/EventStory2020_Story1_4",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_4_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_4_3",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 400000,
			gold 			= 55,
			items 			= { {"Aliens_ship_part", 25 }, },
		},
	},
}

Adventures[ ai.Adventures.New_ground_5 ] = {

	atid = ai.Adventures.New_ground_5,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 50400,
			event_filters = {
			},
			next_on_timeout = 2,
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 152 } },
			},
			marked_zones = { 152 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 152, },
				pointDef = "AdventureInteractObject_NewGroundQuest_5",
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 152,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_5_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_5_dialog2",
					}}
				},
			},
			
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_5" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 152 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_5", },
			marked_zones = { 152 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_5",
				lootDef		= "AdventureItem_NewGround_5",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_6,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 45,
						text = "ow_EventStory2020_Story1_5_1",
						sound_file = "es/EventStory2020_Story1_5",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_5_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_5_3",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 500000,
			gold 			= 65,
			items 			= { {"Iridium_monocrystall", 45 }, },
		},
	},
}

Adventures[ ai.Adventures.New_ground_6 ] = {

	atid = ai.Adventures.New_ground_6,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 50400,
			event_filters = {
			},
			next_on_timeout = 2,
		},	
	[2] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 198 } },
			},
			marked_zones = { 198 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 198, },
				pointDef = "AdventureInteractObject_NewGroundQuest_6",
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 198,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_6_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_6_dialog2",
					}}
				},
			},
			
		},
	[3] =
		{
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = { "AdventureItem_NewGround_6" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 198 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_6", },
			marked_zones = { 198 },
			situation_def	= "Adventure_QuestTake",
			situation_args	= { 
				entityDef	= "AdventureInteractObject_NewGroundQuest_6",
				lootDef		= "AdventureItem_NewGround_6",
				lootCount	= 1,
				
				giveQuestAtTheEnd = ai.Adventures.New_ground_7,
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 45,
						text = "ow_EventStory2020_Story1_6_1",
						sound_file = "es/EventStory2020_Story1_6",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_6_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_6_3",
					},
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
			gold 			= 75,
			items 			= { {"Aliens_ship_part", 45 }, },
		},
	},
}

Adventures[ ai.Adventures.New_ground_7 ] = {

	atid = ai.Adventures.New_ground_7,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 222 } },
			},
			hud_marker_defs = { "AdventureInteractObject_NewGroundQuest_End", },
			marked_zones = { 222 },
			situation_def	= "Adventure_NewGround_Ambush",
			situation_args	= { 
				dialog_params = 
				{
					{
						character = "larry_seldon_unknown",
						timer = 75,
						text = "ow_EventStory2020_Story1_7_1",
						sound_file = "es/EventStory2020_Story1_7",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_7_2",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_7_3",
					},
					{
						character = "larry_seldon_unknown",
						timer = 10,
						text = "ow_EventStory2020_Story1_7_4",
					},
				},
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.LOSS,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 222,
					dialogs		= {{
						character	= "larry_seldon_unknown",
						text		= "quest_New_ground_7_dialog1",
					}}
				},
			},
			
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 10000000,
		},
	},
}

Adventures[ ai.Adventures.BlackRelayRace ] = {

	atid = ai.Adventures.BlackRelayRace,
	generator = function ( player )
		local zones		= {218,248,198,199,221} --Ледяной риф, Хранилище 15, Крушение «Northstar», Комплекс Наберия-392, Челюсть Дьявола
		local number	= math.random( 1, 5 )
		
		return { zones[number], 0, 0, 0, 0 } 
	end,
	
	generator_restriction = function ( player, params )
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.BlackRelayRace then
				return false
			end
		end
		return true	
	end,
	
	stages = {
	[1] = -- прилететь в зону Комплекс "Посейдон", спавн курьера, подлететь к месту встречи с курьером
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 122 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			marked_zones = { 122 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 30,
				needZones	= { 122, },
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 2,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "BRR_Carrier",
						text		= "quest_Adv_BlackRelayRace_dialog_1", -- привет. давай груз
					}}
				},
			},
			
		},
		
	[2] = -- передать курьеру груз
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_GiveCase" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 122 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_GiveCase", },
			marked_zones = { 122 },
			situation_def	= "Adventure_QuestInteract",
			situation_args	= { 
				entityDef		= "AdventureInteractObject_BRRace_GiveCase",
				multiuse		= true, 
				fail_ifEscapeZone	= true,
				fail_ifTriggerOutOfRange	= true,
				triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 30, -- тригер должен быть в радиусе для взаимодействия
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
			},
			next_on_success	= 3,
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]	= 1, -- курьер улетел до передачи груза или игрок вышел с локации
				default						= 3,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "BRR_Carrier",
						text		= "quest_Adv_BlackRelayRace_dialog_2",-- груз принял. проводишь до выхода?
					}}
				},
			},
		},
		
	[3] = -- сопроводить курьера до вылета из зоны
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 122 } },
			},
			hud_marker_defs = { "AdvShip_BlackRelayRace_Carrier", },
			marked_zones = { 122 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 5000,
				needZones	= { 122, },
				pointDef = "AdventureSpawnPoint_BRRace_PathEnd",
				triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"},
					setNewBehavior = true,
				},
				fail_ifEscapeZone = true,
				dialog_params = 
				{
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_3",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_4",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 4, -- игрок отправляется в погоню
				[ ai.SituationResult.FAIL ]	= 25, -- игрок покинул локацию до конца сопровождения, переход на стадию с атакой курьера у базы
				default						= 4,
			},
		},
	
	[4] = -- найти локацию через которую пролетает курьер
	{ 
			stage_type = ai.AdventureStageType.CHECK_ZONE,
			required_progress = 1,
			timeout	= 600,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { ai.Placeholders[1] } },
			},
			
			next_on_success	= 5,
			next_on_timeout = 7, -- Переход к стадии атаки курьера у базы
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "FedDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_5",
					}}
				},
			},
	},
		
	[5] = -- убить курьера несущего груз, провал если курьер/игрок покинул локацию
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { ai.Placeholders[1] } },
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_CarrierRiding" } },
				
			},
			hud_marker_defs = { "AdvShip_BlackRelayRace_CarrierRiding", },
			marked_zones = { ai.Placeholders[1] },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 5000, 
				pointDef = "AdventureSpawnPoint_BRRace_PathEnd",
				triggerEntDef	= "AdvShip_BlackRelayRace_CarrierRiding",
				triggerDropOnDeath = "AdventureInteractObject_BRRace_CaseDrop",
				triggerEntRange = 40,
				triggerSettings = {
					spawnspot = "Adv_spawn_BRR",
					path_config = {"Adv_Path_BRR_1", "remove"},
				},
				fail_ifEscapeZone = true,
				
			},
			next_on_success	= 6, -- игрок убил курьера, нужно подобрать груз
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 7, -- курьер вышел из зоны, переход на стадию с атакой курьера у базы
				[ ai.SituationResult.FAIL ]		= 7, -- игрок вышел из зоны, переход на стадию с атакой курьера у базы
				default						= 6,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "FedDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_8",
					}}
				},
			},
			
		},
		
	[6] = -- подобрать выпавший из курьера контейнер
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_CaseDrop" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { ai.Placeholders[1] } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_CaseDrop", },
			marked_zones = { ai.Placeholders[1] },
			situation_def	= "Adventure_QuestInteract", --Adventure_QuestTake
			situation_args	= { 
				entityDef		= "AdventureInteractObject_BRRace_CaseDrop",
				removeAfterUse	= true,
				remove_ifEscapeZone = true,
				fail_ifEscapeZone = true,
				dialog_params = 
				{
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_6",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_7",
					},
				},
			},
			next_on_success	= 24, --  груз подобран нужно везти его Федерации
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]	= 38, -- игрок вышел из зоны, пираты подобрали контейнер и нужно лететь уничтожать базу пиратов
				default						= 24,
			},
			
		},
		
	[7] = -- прилететь в локацию Обломки дредноута и убить патрулирующего курьера
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_CarrierPatrole" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 219 } },
			},
			marked_zones = { 219 },
			hud_marker_defs = { "AdvShip_BlackRelayRace_CarrierPatrole", },
			--timeout	= 7200,
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				spawnPeriod	= 15,
				needZones	= { 219, },
				mobPacksTable = {
					{
						def = { "AdvShip_BlackRelayRace_CarrierPatrole", },
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
						packAvt = "Adv_AttackAndPatrol",
					},
				},
			},
			next_on_success	= 8, -- игрок убил курьера
			--next_on_timeout = ai.AdventureStage.LOSS, -- игрок не успел уничтожить курьера до истечения таймера
			
						info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 219,
					dialogs		= {{
						character	= "FedDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_5",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "FedDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_9",
					}}
				},
			},
		},
		
	[8] = -- контейнер уже доставлен на базу - уничтожить базу
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_PirateBase" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 219 } },
			},
			--timeout	= 7200,
			marked_zones = { 219 },
			hud_marker_defs = { "AdventureInteractObject_BRRace_PirateBase", },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				spawnPeriod	= 10,
				forseAdwOwner = true,
				needZones	= { 219, },
				mobPacksTable = {
					{
						def = { "AdvShip_BlackRelayRace_PirateM", 
								"AdvShip_BlackRelayRace_PirateM", 
								"AdvShip_BlackRelayRace_PirateM", },
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
						packAvt = "Adv_AttackAndRun",
					},
					{
						def = { "AdvShip_BlackRelayRace_PirateM", 
								"AdvShip_BlackRelayRace_PirateM", 
								"AdvShip_BlackRelayRace_PirateS", },
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn2",
						packAvt = "Adv_AttackAndRun",
					},
				},
			},
			
			--next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел
			next_on_success	= 9, -- помог уничтожить базу
			
			info_events = {
				-- Начало: А вот и груз. Подбирай и вези его ко мне (феды)
				-- Успех: 
				-- Провал: 
			},
		},
	
			
	[9] = -- подбор кейса выпавшего с базы
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			timeout	= 120,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_Case" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 219 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_Case", },
			marked_zones = { 219 },
			situation_def	= "Adventure_QuestInteract",
			situation_args	= { 
				entityDef		= "AdventureInteractObject_BRRace_Case",
				dialog_params = 
				{
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_6",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_7",
					},
				},
			},
			next_on_timeout = 8,
			next_on_success	= 10,

		},
		
	[10] = -- Перед игроком стоит выбор куда везти груз
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104, 23 } },-- локации проверить
			},
			
			marked_zones = { 104, 23 },
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntRange = 150,
				needZones	= { 104, 23 },
				
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				
				zonesAreSwitch = true,
				triggerSwitchEntDef	= { "AdvShip_BlackRelayRace_EmpDestroyer", "AdvShip_BlackRelayRace_FedDestroyer"},
				dialog_params = 
				{
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 5,
						text = "quest_Adv_BlackRelayRace_dialog_10",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_11",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_14",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_15",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 12, --Импреия
				[ ai.SituationResult.CODE_2 ]	= 19, --Федерация
				default						= ai.AdventureStage.LOSS,
			},
			
		},
		
	[11] = -- сбежал от Империи (после разгрома базы)
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 30,
			event_filters = {
			},
			next_on_timeout = 14,
		},
		
	[12] = -- Эсминцец Империи (после разгрома базы) нападает на игрока
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_EmpDestroyer" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_EmpDestroyer", },
			marked_zones = { 104 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				forseAdwOwner = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_EmpDestroyer",
				castSpellOnProtectionTarget = "BlackRelayRace_H",
				forceProtectionTargetAttackPlayer = true,
				needZones	= { 104, },
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_Emp", 
						amount = 3,
						settings = {
							relationship = ai.RelationshipGroups.Neutral3,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1", 
					},
				},
			},
			next_on_success = 14, -- Игрок убивает эсминец
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 11, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 13, -- игрока убивают, он теряет груз
				[ ai.SituationResult.CODE_6 ]	= 14, -- эсминец кто-то убил
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: Хорошо, что ты принес груз, но жаль что ты доставил слишком много проблем
			},
		},
		
	[13] =
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward13", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward13",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
		
	[14] = -- прилет на место встречи с эсминцем Федерации (после разгрома базы и имперцев)
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 23 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			marked_zones = { 23 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntDef	= "AdvShip_BlackRelayRace_FedDestroyer",
				triggerEntRange = 150,
				needZones	= { 23, },
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				dialog_params = 
				{
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						timer = 5,
						text = "quest_Adv_BlackRelayRace_dialog_12",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_13",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 15,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: 
				-- Успех: Решил передать его нам, но мы узнали о твоей связи с империей. умри
				-- Провал: 
			},
			
		},
		
	[15] = -- Эсминцец Федерации (после разгрома базы и имперцев) нападает на игрока
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_FedDestroyer" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 23 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_FedDestroyer", },
			marked_zones = { 23 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_FedDestroyer",
				castSpellOnProtectionTarget = "BlackRelayRace_H",
				forceProtectionTargetAttackPlayer = true,
				needZones	= { 23, },
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_Fed", 
						amount = 3,
						settings = {
							relationship = ai.RelationshipGroups.Neutral3,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
					},
				},
			},
			next_on_success = 16, -- Игрок убивает эсминец
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 29, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 17, -- игрока убивают, он теряет груз
				[ ai.SituationResult.CODE_6 ]	= 16, -- кто-то убивает эсминец
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: Хорошо, что ты принес груз, но жаль что ты доставил слишком много проблем
			},
		},
		
	[16] = -- игрок отбился от федерации
		{ -- покинуть локацию и убедиться, что нет погони (выйти в ом)
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward16", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward16",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
	
	[17] = -- игрока убили корабли федерации
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward17", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward17",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
		
	[18] = -- сбежал от Федерации и чужих (после разгрома базы)
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 30,
			event_filters = {
			},
			next_on_timeout = 21,
		},
		
	[19] = -- Эсминцец Федерации (после разгрома базы и имперцев) на эсм нападают чужие
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 20,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_Al", "AdvShip_BlackRelayRace_Al_S" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 23 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_Al", "AdvShip_BlackRelayRace_Al_S" },
			marked_zones = { 23 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_FedDestroyer",
				needZones	= { 23, },
				forseEntityDefs = { "AdvShip_BlackRelayRace_FedDestroyer", },
				mobPacksTable = {
					{
						def = { "AdvShip_BlackRelayRace_Al", 
								"AdvShip_BlackRelayRace_Al_S", 
								"AdvShip_BlackRelayRace_Al_S",
								"AdvShip_BlackRelayRace_Al_S",},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn2",
					},
				},
			},
			next_on_success = 20, -- Игрок убивает всех пришельцев
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 18, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 32, -- игрока убивают, груз взрывается
				[ ai.SituationResult.CODE_6 ]	= 21, -- эсм умирает
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: О нет на нас нападают чужие
				-- Успех: кажется это был последний. теперь отдавай груз
			},
		},
		
	[20] = -- передать груз эсминцу Федерации
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_GiveCase" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 23 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_GiveCase", },
			marked_zones = { 23 },
			situation_def	= "Adventure_QuestInteract",
			situation_args	= { 
				entityDef		= "AdventureInteractObject_BRRace_GiveCase",
				multiuse		= true, 
				fail_ifEscapeZone	= true,
				triggerEntDef	= "AdvShip_BlackRelayRace_FedDestroyer",
				triggerEntRange = 150, -- тригер должен быть в радиусе для взаимодействия
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
			},
			next_on_success	= 31, -- игрок отдал груз
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]	= 37, -- игрок вышел с локации
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "FedDestroyer",
						text	= "quest_Adv_BlackRelayRace_dialog_20",
					}}
				},
			},
		},
		
	[21] = -- прилет на место встречи с эсминцем Империи (после разгрома базы и Федерации)
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			marked_zones = { 104 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntDef	= "AdvShip_BlackRelayRace_EmpDestroyer",
				triggerEntRange = 150,
				needZones	= { 104, },
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				dialog_params = {
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_16",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_17",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 22,
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				default							= ai.AdventureStage.LOSS,
			},
		},	
		
	[22] = -- Эсминцец Империи (после разгрома базы и Федерации)
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_EmpDestroyer" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_EmpDestroyer", },
			marked_zones = { 104 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_EmpDestroyer",
				forseAdwOwner = true,
				castSpellOnProtectionTarget = "BlackRelayRace_H",
				forceProtectionTargetAttackPlayer = true,
				needZones	= { 104, },
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_Emp",
						amount = 3,
						settings = {
							relationship = ai.RelationshipGroups.Neutral3,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
					},
				},
			},
			next_on_success = 36, -- Игрок убивает эсминец
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 29, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 23, -- игрока убивают, он теряет груз
				[ ai.SituationResult.CODE_6 ]	= 36, -- эсм убивают
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: Решил передать груз федерации? ты выбрал свою сторону
			},
		},	
		
	[23] = -- игрока убили корабли Империи
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward23", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward23",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
		
	[24] = -- Перед игроком стоит выбор куда везти груз
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104, 23 } },-- локации проверить
			},
			
			marked_zones = { 104, 23 },
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntRange = 150,
				needZones	= { 104, 23 },
				
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				
				zonesAreSwitch = true,
				triggerSwitchEntDef	= { "AdvShip_BlackRelayRace_EmpDestroyer", "AdvShip_BlackRelayRace_FedDestroyer"},
				dialog_params = 
				{
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_18",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_19",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_14",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_15",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 26,
				[ ai.SituationResult.CODE_2 ]	= 19,
				default						= ai.AdventureStage.LOSS,
			},
			
		},
		
	[25] = -- игрок покинул локацию и ждет ответа от координатора
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 30,
			event_filters = {
			},
			next_on_timeout = 4,
		},
		
	[26] = -- Эсминцец Империи, на эсм нападают чужие
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 20,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_Al", "AdvShip_BlackRelayRace_Al_S" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_Al", "AdvShip_BlackRelayRace_Al_S" },
			marked_zones = { 104 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_EmpDestroyer",
				needZones	= { 104, },
				forseEntityDefs = { "AdvShip_BlackRelayRace_EmpDestroyer", },
				mobPacksTable = {
					{
						def = { "AdvShip_BlackRelayRace_Al", 
								"AdvShip_BlackRelayRace_Al_S", 
								"AdvShip_BlackRelayRace_Al_S",
								"AdvShip_BlackRelayRace_Al_S",},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn2",
					},
				},
			},
			next_on_success = 27, -- Игрок убивает всех пришельцев
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 11, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 32, -- игрока убивают, груз взрывается
				[ ai.SituationResult.CODE_6 ]	= 14, -- эсм убивают
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				-- Начало: О нет на нас нападают чужие
				-- конец: уф. отбились. давай груз
			},
		},
		
	[27] = -- передать груз эсминцу Империи
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_GiveCase" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_GiveCase", },
			marked_zones = { 104 },
			situation_def	= "Adventure_QuestInteract",
			situation_args	= { 
				entityDef		= "AdventureInteractObject_BRRace_GiveCase",
				multiuse		= true, 
				fail_ifEscapeZone	= true,
				triggerEntDef	= "AdvShip_BlackRelayRace_EmpDestroyer",
				triggerEntRange = 150, -- тригер должен быть в радиусе для взаимодействия
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
			},
			next_on_success	= 31, -- игрок отдал груз
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]	= 28, -- игрок вышел с локации
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "EmpDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_22",
					}}
				},
			},
		},	
		
	[28] = -- Перед игроком стоит выбор куда везти груз
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104, 23 } },-- локации проверить
			},
			
			marked_zones = { 104, 23 },
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntRange = 150,
				needZones	= { 104, 23 },
				
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				
				zonesAreSwitch = true,
				triggerSwitchEntDef	= { "AdvShip_BlackRelayRace_EmpDestroyer", "AdvShip_BlackRelayRace_FedDestroyer"},
				dialog_params = 
				{
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_12",
					},
					{
						character = "FedDestroyer",
						portrait = "FedDestroyer",
						param = 2,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_13",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 27,
				[ ai.SituationResult.CODE_2 ]	= 30,
				default						= ai.AdventureStage.LOSS,
			},
			
		},
		
	[29] = -- сбежал от Фракции второй раз, идем к Иерихону
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 30,
			event_filters = {
			},
			next_on_timeout = 34,
		},
		
	[30] = -- Эсминцец Федерации нападает на игрока (после спасения корабля Империи)
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_FedDestroyer" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 23 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_FedDestroyer", },
			marked_zones = { 23 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_FedDestroyer",
				castSpellOnProtectionTarget = "BlackRelayRace_H",
				forceProtectionTargetAttackPlayer = true,
				forseAdwOwner = true,
				needZones	= { 23, },
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_Fed",
						amount = 3,
						settings = {
							relationship = ai.RelationshipGroups.Neutral3,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
					},
				},
			},
			next_on_success = 21, -- Игрок убивает эсминец
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 18, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 33, -- игрока убивают, он теряет груз
				[ ai.SituationResult.CODE_6 ]	= 21, -- кто-то убивает эсминец
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				
			},
		},	
		
	[31] = -- игрок успешно передал груз фракции
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward31", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward31",
			},
			next_on_success = ai.AdventureStage.WIN,
		},
		
	[32] = -- игрок взорвал груз
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward32", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward32",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
		
	[33] = -- игрок перемудрил и умер
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward33", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward33",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},
		
	[34] = -- прилет на место встречи с координатором Иерихона
				{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdventureInteractObject_BRRace_GiveCase" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 3 } },
			},
			hud_marker_defs = { "AdventureInteractObject_BRRace_GiveCase", },
			marked_zones = { 3 },
			situation_def	= "Adventure_QuestInteract",
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_BRRace_GiveCase",
			},
			next_on_success	= 35, -- игрок отдал груз

			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "JerDestroyer",
						portrait = "JerDestroyer",
						text		= "quest_Adv_BlackRelayRace_dialog_21",
					}}
				},
			},
		},
		
	[35] = -- игрок сбежал от последней фракции
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward35", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward35",
			},
			next_on_success = ai.AdventureStage.ROUTE_FIRST,
		},
		
	[36] = -- игрок отбился от империи
		{ -- награждение игрока, завершение квеста
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_BRRace_Reward36", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_BRRace_Reward36",
			},
			next_on_success = ai.AdventureStage.LOSS,
		},	
		
	[37] = -- Перед игроком стоит выбор куда везти груз
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104, 23 } },-- локации проверить
			},
			
			marked_zones = { 104, 23 },
			hud_marker_defs = { "AdventureInteractObject_BRRace_MeetingPoint", },
			
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 60, 
				pointDef = "AdventureInteractObject_BRRace_MeetingPoint",
				triggerEntRange = 150,
				needZones	= { 104, 23 },
				
				triggerSettings = {
					spawnspot = "Adv_MeetingPoint_Spawn",
					path_config = {"Adv_Path_BRR_1", "stop"},
				},
				
				zonesAreSwitch = true,
				triggerSwitchEntDef	= { "AdvShip_BlackRelayRace_EmpDestroyer", "AdvShip_BlackRelayRace_FedDestroyer"},
				dialog_params = 
				{
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 7,
						text = "quest_Adv_BlackRelayRace_dialog_16",
					},
					{
						character = "EmpDestroyer",
						portrait = "EmpDestroyer",
						param = 1,
						timer = 10,
						text = "quest_Adv_BlackRelayRace_dialog_17",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 39,
				[ ai.SituationResult.CODE_2 ]	= 20,
				default						= ai.AdventureStage.LOSS,
			},
		},
		
	[38] = -- Оставил контейнер на трупе курьера
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 30,
			event_filters = {
			},
			next_on_timeout = 8,
		},
		
	[39] = -- Эсминцец Империи нападает на игрока (после спасения корабля Федерации)
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_EmpDestroyer" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_EmpDestroyer", },
			marked_zones = { 104 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				fail_ifEscapeZone = true,
				needZones	= { 104, },
				altEnd_ifDie = true,
				altEnd_protectionTargetDie = true,
				protectionTarget = "AdvShip_BlackRelayRace_EmpDestroyer",
				castSpellOnProtectionTarget = "BlackRelayRace_H",
				forceProtectionTargetAttackPlayer = true,
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_Emp",
						amount = 3,
						settings = {
							relationship = ai.RelationshipGroups.Neutral3,
						},
						spawnpoint = "AdventureSpawnPoint_BRRace_Spawn1",
					},
				},
			},
			next_on_success = 14, -- Игрок убивает эсминец
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= 11, -- Игрок сбегает с локации
				[ ai.SituationResult.CODE_5 ]	= 33, -- игрока убивают, он теряет груз
				[ ai.SituationResult.CODE_6 ]	= 14, -- кто-то убивает эсминец
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				
			},
		},		
		
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
		},
		[ ai.AdventureStage.ROUTE_FIRST ] = 
		{
			credits 		= 300000,
		},
	},
}
---------------------------------------------------------------------------
Adventures[ ai.Adventures.AriadnaTest ] = {

	atid = ai.Adventures.AriadnaTest,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	no_cancel = true,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		for i = 1, #milestones do

			if milestones[ i ] == Milestones.AriadnaTest then
				return false
			end

		end

		return true
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 220, 215 } },
			},
			--marked_zones = { 220, 215 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 220, 215 },
				pointDef = "AdventureInteractObject_AriadnaSun",
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 2,
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 220,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 215,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog2",
					}}
				},
			},
			
		},	
	[2] = -- стадия в коотрой нужно зачистить всех мобов с определенными дефами
		{
			stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 10,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_PirateM" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 225 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_PirateM" },
			marked_zones = { 225 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 225, },
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_PirateM",
						amount = 2,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Ariadna_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.FAIL ]		= ai.AdventureStage.LOSS,
				[ ai.SituationResult.SUCCESS ]		= 3,
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 225,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog3",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 10,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog4",
					}}
				},
			},
		},	
	[3] = --стадия с активацией шпионского зонда и шансом попасть в засаду
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 35 } }, -- wreck_generic_rock_03_r_ow
			},
			marked_zones = { 35 },
			hud_marker_defs = { "AdventureInteractObject_WGR_Tracker", },
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, -- только одна засада может быть запущена одновременно
				ambush_Chance = 100, -- шанс, что засада на игрока сработает %
				triggerDef = "AdventureInteractObject_WGR_Tracker",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_M_wgr3",
							"AdvShip_AmbushPirate_M_wgr3",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Ariadna_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 4,
				[ ai.SituationResult.CODE_2 ]	= 4,
				default						= ai.AdventureStage.LOSS,
			},
		},
	[4] = -- стадия в коотрой нужно зачистить всех мобов с определенными дефами
		{ -- избавтесь от засады пиратов
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 35 } },
			},
			marked_zones = { 35 },
			hud_marker_defs = { "AdvShip_AmbushPirate_M_wgr3"},
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 5,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_AmbushPirate_M_wgr3"}, -- строка или таблица мобов которых нужно истребить
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog5",
					}}
				},
			},
			
		},
	
	[5] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 203 } },
			},
			marked_zones = { 203 },
			next_on_success	= 6,
		},
	
	[6] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 233 } },
			},
			marked_zones = { 207, 201, 247, 257, 31, 131, 214, 234, 233, 203 },
			next_on_success	= 7,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 203,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog6",
					}}
				},
			},
		},
	
	[7] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 234 } },
			},
			marked_zones = { 207, 201, 247, 257, 31, 131, 214, 234, 233},
			next_on_success	= 8,
		},
	
	[8] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 214 } },
			},
			marked_zones = { 207, 201, 247, 257, 31, 131, 214, 234,},
			next_on_success	= 9,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 234,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog7",
					}}
				},
			},
		},
	
	[9] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 131 } },
			},
			marked_zones = { 207, 201, 247, 257, 31, 131, 214,},
			next_on_success	= 10,
		},
	
	[10] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 31 } },
			},
			marked_zones = { 207, 201, 247, 257, 31, 131,},
			next_on_success	= 11,
		},
	
	[11] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 257 } },
			},
			marked_zones = { 207, 201, 247, 257, 31,},
			next_on_success	= 12,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 31,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog8",
					}}
				},
			},
		},
	
	[12] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 247 } },
			},
			marked_zones = { 207, 201, 247, 257,},
			next_on_success	= 13,
		},
	
	[13] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 201 } },
			},
			marked_zones = { 207, 201, 247,},
			next_on_success	= 15,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 247,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog9",
					}}
				},
			},
		},
	
	[14] =
		{
			stage_type 			= ai.AdventureStageType.ENTER_ZONE,
			required_progress 	= 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 207 } },
			},
			marked_zones = { 207, 201,},
			next_on_success	= 15,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 201,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog10",
					}}
				},
			},
		},
	
	[15] =
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 207 } },
			},
			marked_zones = { 207, 201, },
			hud_marker_defs = { "AdventureInteractObject_AriadnaSignal" },
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= 16,
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 207,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Ariadna_dialog10",
					}}
				},
			},
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_AriadnaSignal",
			},
		},
	[16] =
		{ -- стадия нужна чтобы закрыть сюжетный квест
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_Ariadna_Journal", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_Ariadna_Journal",
			},
			next_on_success	= ai.AdventureStage.WIN,
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			
			milestone 		= Milestones.AriadnaTest,
			credits 		= 600000,
			items 			= { {"Relics_craft_part", 10 }, },
		},
	},
}
---------------------------------------------------------------------------приключения для предфинального ивента - разовые
Adventures[ ai.Adventures.Prefinal_Emp ] = {

	atid = ai.Adventures.Prefinal_Emp,
	no_cancel = false, -- возможность отменить приключение (чтобы можно было взять другое, см тикет SC-119766 )
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		for i = 1, #milestones do
			if milestones[ i ] == Milestones.Prefinal_Emp2025 then
				return false
			end
		end
		
		local adventures = SV_FreeSpace_GetPlayerAdventures(player) -- проверяет у игрока на аккаунте не взяты повторно приключения по которым не закрыт квесты (чтобы не забивать лимит "взятых приключений")
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Prefinal_Emp then
				return false
			end
		end
		
		return true
	end,
	
	stages = {
	[1] =
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 8,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Prefinal_Emp_PirateS" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 11 } },
			},
			
			hud_marker_defs = { "AdvShip_Prefinal_Emp_PirateS" },
			marked_zones = { 11 },
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 11, },
				mobPacksTable = {
					{
						def = "AdvShip_Prefinal_Emp_PirateS",
						amount = 2,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Emp_MobSpawn",
					},
				},
			},	
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 2,
				default						= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 8,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog1",
					}}
				},
			},
		},
		
	[2] = 
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 11 } }, 
			},
			marked_zones = { 11 }, 
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Emp_Ship" },
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= 3, 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Emp_Ship",
			},
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "pirate_agent",
						portrait = "default",
						text		= "quest_Prefinal_Emp_dialog2",
					}}
				},
			},
		},	
	[3] = 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 201 } }, 
			},
			marked_zones = { 201 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Avanpost", },
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, 
				ambush_Chance = 100, 
				triggerDef = "AdventureInteractObject_Prefinal_Avanpost",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_Prefinal_Emp_PirateM",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Emp_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 4,
				[ ai.SituationResult.CODE_2 ]	= 4,
				default						= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "pirate_agent",
						text		= "quest_Prefinal_Emp_dialog3",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "pirate_agent",
						text		= "quest_Prefinal_Emp_dialog3",
					}}
				},
			},
		},
	[4] = 
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 201 } },
			},
			marked_zones = { 201 },
			hud_marker_defs = { "AdvShip_Prefinal_Emp_PirateM"},
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 5,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_Prefinal_Emp_PirateM"}, 
			},
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 5,
				default						= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog4",
					}}
				},
			},
			
		},
	
	[5] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 247 } },
			},
			--marked_zones = { 220, 215 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 247 },
				pointDef = "AdventureInteractObject_Prefinal_Runaway",
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 6,
				default							= ai.AdventureStage.LOSS,
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 247,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog5",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog6",
					}}
				},
			},
			
		},
	
	[6] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 247 } }, 
			},
			marked_zones = { 247 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Runaway", },
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, 
				ambush_Chance = 100, 
				triggerDef = "AdventureInteractObject_Prefinal_Runaway",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_Prefinal_Emp_PirateS",
							"AdvShip_Prefinal_Emp_PirateS",
							"AdvShip_Prefinal_Emp_PirateM",
							"AdvShip_Prefinal_Emp_PirateL",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Emp_MobSpawn",
					},
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 7,
				[ ai.SituationResult.CODE_2 ]	= 7,
				default						= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "pirate_agent",
						text		= "quest_Prefinal_Emp_dialog7",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "pirate_agent",
						text		= "quest_Prefinal_Emp_dialog7",
					}}
				},
			},
		},
	
	[7] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 247 } },
			},
			marked_zones = { 247 },
			hud_marker_defs = { "AdvShip_Prefinal_Emp_PirateL"},
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 8,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_Prefinal_Emp_PirateL"}, 
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog8",
					}}
				},
			},
			
		},
	
	[8] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 1 } },
			},
			marked_zones = { 1 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Emp_Freighter" },
			
			situation_def	= "Adventure_QuestInteract",
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Emp_Freighter",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 1,
					dialogs		= {{
						character	= "emp_captain",
						text		= "quest_Prefinal_Emp_dialog9",
					}}
				},
			},
			
			next_on_situation_result = { 
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				default							= ai.AdventureStage.LOSS,
			},
			
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
			items 			= { {"Relics_craft_part", 10 }, },
			milestone 		= Milestones.Prefinal_Emp2025,
		},
	},
}

Adventures[ ai.Adventures.Prefinal_Fed ] = {

	atid = ai.Adventures.Prefinal_Fed,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		for i = 1, #milestones do
			if milestones[ i ] == Milestones.Prefinal_Fed2025 then
				return false
			end
		end

		local adventures = SV_FreeSpace_GetPlayerAdventures(player) -- проверяет у игрока на аккаунте не взяты повторно приключения по которым не закрыт квесты (чтобы не забивать лимит "взятых приключений")
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Prefinal_Fed then
				return false
			end
		end		
		
		return true
	end,
	
	stages = {
	[1] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 249 } }, 
			},
			marked_zones = { 249 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Container", },
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, 
				ambush_Chance = 100, 
				triggerDef = "AdventureInteractObject_Prefinal_Container",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_Prefinal_Fed_WarriorS",
							"AdvShip_Prefinal_Fed_WarriorS",
							"AdvShip_Prefinal_Fed_WarriorS",
							"AdvShip_Prefinal_Fed_WarriorS",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Fed_MobSpawn",
					},
				},
			},
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog1",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog1",
					}}
				},
			},
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 2,
				[ ai.SituationResult.CODE_2 ]	= 2,
				default						= ai.AdventureStage.LOSS,
			},
		
		},	
	[2] = 
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 249 } },
			},
			marked_zones = { 249 },
			hud_marker_defs = { "AdvShip_Prefinal_Fed_WarriorS"},
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 3,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_Prefinal_Fed_WarriorS"}, 
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog2",
					}}
				},
			},
			
		},	
	[3] = 
		{stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 7,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Prefinal_Emp_PirateM" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 205 } },
			},
			
			hud_marker_defs = { "AdvShip_Prefinal_Emp_PirateM" },
			marked_zones = { 205 },
			situation_def	= "Adventure_SpawnMobPack",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 4,
				default						= ai.AdventureStage.LOSS,
			},
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 205, },
				mobPacksTable = {
					{
						def = "AdvShip_Prefinal_Emp_PirateM",
						amount = 2,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Fed_MobSpawn",
					},
				},
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 7,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog3",
					}}
				},
			},
		},
	[4] = 
		{stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 205 } },
			},
			marked_zones = { 205 },
			situation_def	= "Adventure_ReachThePoint",
			situation_args	= { 
				achiveDistance = 200, 
				needZones	= { 205 },
				pointDef = "AdventureInteractObject_Prefinal_Fed_Freighter",
				
			},
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 5,
				default							= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog4",
					}}
				},
			},
		},
	
	[5] =
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 227 } }, 
			},
			marked_zones = { 227 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Fed_Agent", }, 
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true,
				ambush_Chance = 100, 
				triggerDef = "AdventureInteractObject_Prefinal_Fed_Agent",
				forseAdwOwner = true,
				mobPacksTable = {
					{
						def = {
							"AdvShip_Prefinal_Fed_WarriorM",
							"AdvShip_Prefinal_Fed_WarriorM",
							"AdvShip_Prefinal_Fed_WarriorM",
							"AdvShip_Prefinal_Fed_WarriorM",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Fed_MobSpawn", 
					},
				},
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 227,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog5",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog6",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog6",
					}}
				},
			},
			
			next_on_situation_result = {
				[ ai.SituationResult.CODE_1 ]	= 6,
				[ ai.SituationResult.CODE_2 ]	= 6,
				default						= ai.AdventureStage.LOSS,
			},
		},
	
	[6] =
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 227 } },
			},
			marked_zones = { 227 },
			hud_marker_defs = { "AdvShip_Prefinal_Fed_WarriorM"},
			
			situation_def	= "Adventure_KillAllMobs",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 7,
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				def		= { "AdvShip_Prefinal_Fed_WarriorM"}, 
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog7",
					}}
				},
			},
			
		},
	
	[7] =
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_BlackRelayRace_PirateM" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 24 } },
			},
			
			hud_marker_defs = { "AdvShip_BlackRelayRace_PirateM" },
			marked_zones = { 24 },
			situation_def	= "Adventure_SpawnMobPack",
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				default						= ai.AdventureStage.LOSS,
			},
			situation_args	=
			{
				loopedSpawn = false,
				forseAdwOwner = true,
				needZones	= { 24, },
				mobPacksTable = {
					{
						def = "AdvShip_BlackRelayRace_PirateM",
						amount = 1,
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Fed_MobSpawn",
					},
				},
			},	
			
			info_events = {
				{
					
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 24,
					dialogs		= {{
						character	= "fed_major",
						text		= "quest_Prefinal_Fed_dialog8",
					}}
				},
			},
		},
	},

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
			items 			= { {"Relics_craft_part", 10 }, },
			milestone 		= Milestones.Prefinal_Fed2025,
		},
	},
}

Adventures[ ai.Adventures.Prefinal_Jer ] = { -- Фазы приключения Иерихонской ветки

	atid = ai.Adventures.Prefinal_Jer,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		for i = 1, #milestones do
			if milestones[ i ] == Milestones.Prefinal_Jer2025 then
				return false
			end
		end

		local adventures = SV_FreeSpace_GetPlayerAdventures(player) -- проверяет у игрока на аккаунте не взяты повторно приключения по которым не закрыт квесты (чтобы не забивать лимит "взятых приключений")
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.Prefinal_Jer then
				return false
			end
		end				
		
		return true
	end,
	
	stages = {
	[1] = -- Описание: Отбить атаку пиратов | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: станция терраморфинга | Целефой DEF: | аналог Fed/Emp: E1 | zone_id: 35 | level_name: hub_jer_rock_terramorph_e_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 8, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Prefinal_Jer_PirateM" } },
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 35 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Станция терраморфинга" level_name="hub_jer_rock_terramorph_e_ow" / zone_id=35) 
			},
			
			hud_marker_defs = { "AdvShip_Prefinal_Jer_PirateM" },
			marked_zones = { 35 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Станция терраморфинга" level_name="hub_jer_rock_terramorph_e_ow" / zone_id=35)
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 35, }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Станция терраморфинга" level_name="hub_jer_rock_terramorph_e_ow" / zone_id=35)
				mobPacksTable = {
					{
						def = "AdvShip_Prefinal_Jer_PirateM",
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Jer_MobSpawn",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 8,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog1",
					}}
				},
			},
		},

	[2] = -- Описание: Перехватить сигнал пиратского корабля | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: станция терраморфинга | Целефой DEF: | аналог Fed/Emp: E2 | zone_id: 35 | level_name: hub_jer_rock_terramorph_e_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 35 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Станция терраморфинга" level_name="hub_jer_rock_terramorph_e_ow" / zone_id=35)
			},
			marked_zones = { 35 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Jer_Ship" }, -- в данном случае взят корабль Иерихона (как базовый квестгивер Иерихона)
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 35,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
					}}
				},
			},
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Jer_Ship",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog2",
					}}
				},
			},
		},		

	[3] = -- Описание: Уничтожить киберов | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Разрушенная станция ...
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 8, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Prefinal_Jer_CyberPatrol" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 34 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="ruins_jer_rock_station_u_ow" / zone_id=34) 
			},
			
			hud_marker_defs = { "AdvShip_Prefinal_Jer_CyberPatrol" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			marked_zones = { 34 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="ruins_jer_rock_station_u_ow" / zone_id=34)
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 34, }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="ruins_jer_rock_station_u_ow" / zone_id=34)
				mobPacksTable = {
					{
						def = "AdvShip_Prefinal_Jer_CyberPatrol", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Jer_MobSpawn",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 8,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog3",
					}}
				},
			},
		},
		
	[4] = -- Описание: Исследование | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Иридиевый поток ...
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 214 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Иридиевый поток" level_name="ruinsalien_precursor_iridium_spheres_l_ow" / zone_id=214)
			},
			marked_zones = { 214 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Jer_Beacon" }, -- в данном случае взят корабль Иерихона (как базовый квестгивер Иерихона) >>> заменено на маяк
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= 5, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке") Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog4",
					}}
				},
			},
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Jer_Beacon", -- в данном случае взят корабль Иерихона (как базовый квестгивер Иерихона) >>> заменено на маяк
			},
		},	

	[5] = -- Описание: Атака на киберов | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Оранжевый гигант ...
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 8, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_Prefinal_Jer_CyberAttacker" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 135 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Оранжевый гигант" level_name="ruinssmall_jer_rock_storage_e_ow" / zone_id=135) 
			},
			
			hud_marker_defs = { "AdvShip_Prefinal_Jer_CyberAttacker" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			marked_zones = { 135 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Оранжевый гигант" level_name="ruinssmall_jer_rock_storage_e_ow" / zone_id=135)
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 135, }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Оранжевый гигант" level_name="ruinssmall_jer_rock_storage_e_ow" / zone_id=135)
				mobPacksTable = {
					{
						def = "AdvShip_Prefinal_Jer_CyberAttacker", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Jer_MobSpawn",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 8,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog5",
					}}
				},
			},
		},

	[6] = -- Описание: Получение информации от киберов | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Оранжевый гигант ...
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 135 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Оранжевый гигант" level_name="ruinssmall_jer_rock_storage_e_ow" / zone_id=135)
			},
			marked_zones = { 135 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Jer_Beacon" }, -- в данном случае взят корабль Иерихона (как базовый квестгивер Иерихона) >>> заменено на маяк
			
			situation_def	= "Adventure_QuestInteract",
			next_on_success	= 7, -- описывает номер фазы на который переходит при успешном выполнении required_progress = и что делать в случае неудачи (фаза повторяется). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog6",
					}}
				},
			},
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Jer_Beacon", -- в данном случае взят корабль Иерихона (как базовый квестгивер Иерихона) >>> заменено на маяк
			},
		},			

	[7] = -- Описание: Исследование | Тип фазы: SITUATION_RESULT | Подтип/situation: Adventure_Ambush | Зона: Область раскопок №6 ...
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 244 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Область раскопок №6" level_name="excavation_elyd_empty_lunar_l_ow" / zone_id=244)
			},
			marked_zones = { 244 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Jer_Cryst", }, ---- некий новый объект объект взаимодействия (зелёный маяк киберов)
			situation_def	= "Adventure_Ambush",
			situation_args	= { 
				ambush_Single = true, -- только одна засада может быть запущена одновременно
				ambush_Chance = 100, -- шанс, что засада на игрока сработает %
				triggerDef = "AdventureInteractObject_Prefinal_Jer_Cryst",
				forseAdwOwner = true,
				mobPacksTable = { -- таблица def'ов кораблей и их количество которые будут вылетать в 1 "паке" засады (в блоке ниже)
					{
						def = {
							"AdvShip_Prefinal_Jer_CrystallidP",
							"AdvShip_Prefinal_Jer_CrystallidP",
							"AdvShip_Prefinal_Jer_CrystallidP",
							"AdvShip_Prefinal_Jer_CrystallidP",
						},
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_Prefinal_Jer_MobSpawn", -- def точки спавна (её типа), котоорый будем выбирать при расстановке в editor_local.bat ("ПротоAnvil'е")
					},
				},
			},
			next_on_situation_result = { -- здесь можно было бы завести просто вместо "{" поставить номер фазы на которую переходить ("8,") а весь юлок не формировать. CODE_1/CODE_2 - как пример параметров, которые возникают при разных сценариях (как в приключении ai.Adventures.PikabuEvent, фаза [2] = -- 1 2, строки 1418-1463, выше) в данном случае оба ведут на фазу 8
				[ ai.SituationResult.CODE_1 ]	= 8, 
				[ ai.SituationResult.CODE_2 ]	= 8,
				default						= ai.AdventureStage.LOSS,
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_1,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog7",
					}}
				},
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.CODE_2,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog7",
					}}
				},
			},
		},

	[8] = -- Описание: Битва с кристаллидами | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_KillAllMobs | Зона: Область раскопок №6 ...
		{ 
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, values = { 244 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Область раскопок №6" level_name="excavation_elyd_empty_lunar_l_ow" / zone_id=244)
			},
			marked_zones = { 244 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdvShip_Prefinal_Jer_CrystallidP"}, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			
			situation_def	= "Adventure_KillAllMobs", -- подтип задачи / "ситуация" (задача: "взаимодействие с объектами", подтип/ситуация: "убить их всех")
			next_on_situation_result = { -- описывает номер фазы на который переходит при успешном выполнении required_progress = и что делать в случае неудачи (фаза повторяется). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей.  
				[ ai.SituationResult.SUCCESS ]	= 9,
				[ai.SituationResult.FAIL ]	= 7, -- в случае неудачи онправляет в фазу 7
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				fail_ifDie = true, -- вариант FAIL (ai.SituationResult.FAIL) = если игрок умрёт/погибнет
				fail_ifEscapeZone = true, -- вариант FAIL (ai.SituationResult.FAIL) = если покидаешь зону
				def		= { "AdvShip_Prefinal_Jer_CrystallidP"}, -- строка или таблица мобов которых нужно истребить (которые были прописаны в предыдущей фазе, блок mobPacksTable =)
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog8",
					}}
				},
			},
			
		},
	
	[9] = -- Описание: Исследование | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Область раскопок №6 ...
		{
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 244 } },
			},
			marked_zones = { 244 },
			hud_marker_defs = { "AdventureInteractObject_Prefinal_Jer_Cryst2" },
			
			situation_def	= "Adventure_QuestInteract",
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_Prefinal_Jer_Cryst2",
			},
			next_on_situation_result = { -- в последней фазе должен быть этот блок (при удаче = "WIN", т.е. "приключение пройдено, можно давать награду", при неудаче "LOSS", или "долби ишшо" )
				[ ai.SituationResult.SUCCESS ]	= ai.AdventureStage.WIN,
				default							= ai.AdventureStage.LOSS,
			},
			
		},
	}, 

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
			items 			= { {"Relics_craft_part", 10 }, },
			milestone 		= Milestones.Prefinal_Jer2025,
		},
	},
}

-- SC-119558 FelixFlex_2025. Добавить в ОМ несколько сущностей. Февральская суета 2025. (НАЧАЛО БЛОКА)

Adventures[ ai.Adventures.FelixFlex_2025_Radar ] = { -- НАЙТИ СТАНЦИЮ СВЯЗИ на Пустошах Соляриса

	atid = ai.Adventures.FelixFlex_2025_Radar,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params ) -- посмотреть все приключения которые есть у игрока, если у него уже принят квест с таким дефом, то не давать его повторно.
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.FelixFlex_2025_Radar then
				return false
			end
		end
		return true	
	end,
	
	stages = {

	[1] = -- НАЙТИ СТАНЦИЮ СВЯЗИ на Пустошах Соляриса. | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Пустоши Солариса | Целефой DEF: AdventureInteractObject_FelixFlex_2025_Radar | zone_id: 136 | level_name: ruinssmall_jer_rock_storage03_e_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 136 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Пустоши Солариса" level_name="ruinssmall_jer_rock_storage03_e_ow" / zone_id=136)
			},
			-- marked_zones = { 136 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_FelixFlex_2025_Radar" }, -- в данном случае взята малая Радарная станция models\objects\global_world\radar_station\radar_station_01
			
			situation_def	= "Adventure_QuestInteract",
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 136,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_FelixFlex_2025_Radar",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "broker", --  Персонаж от имени которого пойдёт текст.
						text		= "quest_FelixFlex_2025_dialog1", -- id строки в string.txt = диалог который будет бубнить персонаж (гивер) при выполнении задания
					}}
				},
			},
		},		

	}, 

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			--credits 		= 500000, -- Серебро (Кредиты)
			eventCredits 	= 5, -- Ксеночипы
			--gold 			= 5, -- Голда (Галактические Стандарты)
			--items 			= { {"Iridium_monocrystall", 10 }, }, -- Монокристаллы
			--items 			= { {"Aliens_ship_part", 10 }, }, -- Ксенокристаллы			
			--items 			= { {"Relics_craft_part", 10 }, }, -- Синтетические поликристаллы
			--milestone 		= Milestones.Prefinal_Jer2025,
		},
	},
}

Adventures[ ai.Adventures.FelixFlex_2025_Car ] = { -- НАЙТИ ОСТАНКИ Tesla Roadster на Свалке

	atid = ai.Adventures.FelixFlex_2025_Car,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params ) -- посмотреть все приключения которые есть у игрока, если у него уже принят квест с таким дефом, то не давать его повторно.
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.FelixFlex_2025_Car then
				return false
			end
		end
		return true	
	end,
	
	stages = {

	[1] = -- НАЙТИ ОСТАНКИ Tesla Roadster на Свалке | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Свалка | Целефой DEF: AdventureInteractObject_FelixFlex_2025_Car | zone_id: 16 | level_name: wreck_generic_rock_03_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 16 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Свалка" level_name="wreck_generic_rock_03_r_ow" / zone_id=16)
			},
			--marked_zones = { 16 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_FelixFlex_2025_Car" }, -- в данном случае взят останки Tesla Roadster models\objects\gameplay\car\car_wreck
			
			situation_def	= "Adventure_QuestInteract",
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 16,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_FelixFlex_2025_Car",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "broker", --  Персонаж от имени которого пойдёт текст.
						text		= "quest_FelixFlex_2025_dialog2", -- id строки в string.txt = диалог который будет бубнить персонаж (гивер) при выполнении задания
					}}
				},
			},
		},		

	}, 

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 5, -- Серебро (Кредиты)
			--eventCredits 	= 100, -- Ксеночипы
			--gold 			= 5, -- Голда (Галактические Стандарты)
			--items 			= { {"Iridium_monocrystall", 10 }, }, -- Монокристаллы
			--items 			= { {"Aliens_ship_part", 10 }, }, -- Ксенокристаллы			
			--items 			= { {"Relics_craft_part", 10 }, }, -- Синтетические поликристаллы
			--milestone 		= Milestones.Prefinal_Jer2025,
		},
	},
}

Adventures[ ai.Adventures.FelixFlex_2025_Man ] = { -- НАЙТИ ОСТАНКИ КОСМОНАВТА (Максим "Комета") на Колонист-11

	atid = ai.Adventures.FelixFlex_2025_Man,
	no_cancel = true,
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params ) -- посмотреть все приключения которые есть у игрока, если у него уже принят квест с таким дефом, то не давать его повторно.
		local adventures = SV_FreeSpace_GetPlayerAdventures(player)

		local i, adv, p
		for i, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.FelixFlex_2025_Man then
				return false
			end
		end
		return true	
	end,
	
	stages = {
		
	[1] = -- ОСТАНКИ КОСМОНАВТА... Описание: Перехватить сигнал пиратского корабля | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Колонист-11 | Целефой DEF: | zone_id: 251 | level_name: shipyard_allidium_empty_yard_e_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 251 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Колонист-11" level_name="shipyard_allidium_empty_yard_e_ow" / zone_id=251)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_FelixFlex_2025_Man" }, -- в данном случае взят скрюченый космонавт models\objects\gameplay\car\man_wreck
			
			situation_def	= "Adventure_QuestInteract",
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_FelixFlex_2025_Man",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= {{
						character	= "broker", --  Персонаж от имени которого пойдёт текст.
						text		= "quest_FelixFlex_2025_dialog3", -- id строки в string.txt = диалог который будет бубнить персонаж (гивер) при выполнении задания
					}}
				},
			},
		},		


	}, 

	rewards = {
		[ ai.AdventureStage.WIN ] = 
		{
			--credits 		= 500000, -- Серебро (Кредиты)
			--eventCredits 	= 5, -- Ксеночипы
			--gold 			= 5, -- Голда (Галактические Стандарты)
			items 			= { {"Iridium_monocrystall", 1 }, }, -- Монокристаллы
			--items 			= { {"Aliens_ship_part", 1 }, }, -- Ксенокристаллы			
			--items 			= { {"Relics_craft_part", 10 }, }, -- Синтетические поликристаллы
			--milestone 		= Milestones.Prefinal_Jer2025,
		},
	},
}

-- SC-119558 FelixFlex_2025. Добавить в ОМ несколько сущностей. Февральская суета 2025. (КОНЕЦ БЛОКА)

----------------------------------------------------------------------------------------------
-- SC-118793 Финальный рейд-приключение "Возвращение Предтеч". Этапы Приключений ReturnOfPrecursors2025 (НАЧАЛО БЛОКА)

Adventures[ ai.Adventures.RoP2025_Final ] = { -- Фазы Финального рейда-приключения "Возвращение Предтеч" (2025)

	atid = ai.Adventures.RoP2025_Final,
	no_cancel = true, -- возможность отменить приключение (false = отменяемое), чтобы можно было взять другое (см тикет SC-119766)
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		for i = 1, #milestones do
			if milestones[ i ] == Milestones.RoP2025_Final then
				return false
			end
		end

		local adventures = SV_FreeSpace_GetPlayerAdventures(player) -- проверяет у игрока на аккаунте не взяты повторно приключения по которым не закрыт квесты (чтобы не забивать лимит "взятых приключений")
		for _, adv in pairs( adventures ) do
			if adv.atid == ai.Adventures.RoP2025_Final then
				return false
			end
		end				

		return true
	end,
	
	stages = 
	{
	[1] =
		{ -- стадия нужна чтобы закрыть сюжетный квест (Гивер выдал предмет - получение которого и закрывает "Квест" (прописанный в Quests Table) и переводит дальше в "Приключения" (сюда).
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			-- timeout 		= 300,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_RoP2025_Device", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_RoP2025_Device", -- Должна быть заранее прописана в ...work_version\pc\data\gamedata\def\objects\quest_items.lua. Иконка "гаринитуры", которую выдал Игроку гивер в качестве предмета на завершение квеста (и перевод в приключения) типа "возьми рацию - будем на связи".
				dialog_params = 
				{
					{
						character = "broker", -- Посредник *нанят "втёмную" Агентом Энигма
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog2",
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog3",
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog4",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St01_dialog5",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St01_dialog6",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog7",
					},
				},
			},
		},

	[2] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. Встретить Агента «Энигма»
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 3,
		},	

	[3] = -- НАЙТИ СВЯЗНОГО Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Область раскопок №6 | Целефой DEF: | zone_id: 244 | level_name: excavation_elyd_empty_lunar_l_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			 
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 244 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Область раскопок №6" level_name="excavation_elyd_empty_lunar_l_ow" / zone_id=44)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			situation_def	= "Adventure_QuestInteract",
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St03_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St03_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St03_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St03_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St03_dialog5",
						},
					}
				},
			},
		},

	[4] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 5,
		},			

	[5] = -- ВСТРЕТИТЬ КУРЬЕРА Описание: Взаимодействие с подвижным Объектом в "Комплексе Посейдон" | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Комплексе Посейдон | Целефой DEF: | zone_id: 122 | level_name: ruinssmall_fed_rock_storage_u_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 6,
--				[ai.SituationResult.CODE_6 ]	= 5, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 122 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Станция терраморфинга" level_name="ruinssmall_fed_rock_storage_u_ow" / zone_id=122)
			},
			marked_zones = { 122 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 122,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
--[[			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.CODE_6, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St05_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, ]] -- раскомментировать (убрать кв.скобки перед "--"), если нужно будет запускать диалоги в случае провала квеста.				
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St03_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 50, -- На какой дистанции появится счётчик
				nearby_timer	= 7, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 2, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 50, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St05_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				--shallNotDieDef   =  "AdvShip_RoP2025_St03_Courier", -- раскомментировать если нужно бкдет сделать что при потере пилота квест "Провален" и Игрок отправляется на повтор или стороннюю ветку 
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},

	[6] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 7,
		},			

	[7] = -- НАЙТИ И УБЕДИТЬ. Описание: Уничтожить Лазутчиков Предтеч | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Ледяной пояс (ruinsdread_emp_ice_icebelt_l_ow > zone_id=208) + Центр колонизации (hangar_fed_rock_colony_e_ow > zone_id=208)
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 5, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St07_ScoutEmptySt071", "AdvShip_RoP2025_St07_ScoutEmptySt072", "AdvShip_RoP2025_St07_ScoutEmptySt073", "AdvShip_RoP2025_St07_ScoutEmptySt074", "AdvShip_RoP2025_St07_ScoutEmptySt075" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 208, 126, 22 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="ruins_jer_rock_station_u_ow" / zone_id=34) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 208, 126, 22 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St07_ScoutEmptySt071", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt071",
					},
					{
						def = "AdvShip_RoP2025_St07_ScoutEmptySt072", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt072",
					},
					{
						def = "AdvShip_RoP2025_St07_ScoutEmptySt073", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt073",
					},
					{
						def = "AdvShip_RoP2025_St07_ScoutEmptySt074", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt074",
					},		
					{
						def = "AdvShip_RoP2025_St07_ScoutEmptySt075", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt075",
					},						
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St07_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 5,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St07_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog5", 
						},
					},
					
				},
			},
		},

	[8] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 9,
		},	

	[9] = -- НАЛАДИТЬ КОНТАКТ Описание: Встретить Лей-та Рамиреса в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St09_Ramirez" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			-- next_on_success	= 10, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 230,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St09_Ramirez",
				lootDef		= "WeaponMod_Laser_Alien_Killer2", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog2",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog3",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog4",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog5",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St09_dialog6",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St09_dialog7",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St09_dialog8",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St09_dialog9",
						},
					}
				},
			},
		},

	[10] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 11,
		},			

	[11] = -- В ОКРЕСТНОСТЯХ ПЕГАСА Описание: Уничтожить Лазутчиков Предтеч | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Комплекс «Альфа-7» (factory_emp_iridium_alpha_l_ow > zone_id=229)
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 5, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St11_Scout01", "AdvShip_RoP2025_St11_Scout02", "AdvShip_RoP2025_St11_Scout03", "AdvShip_RoP2025_St11_Scout04", "AdvShip_RoP2025_St11_Scout05" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 229 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="factory_emp_iridium_alpha_l_ow" / zone_id=229) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 229 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St11_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 5,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St11_dialog2", 
						},
						{
						character = "pve_irodr",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St11_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St11_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St11_dialog5", 
						},
					},
					
				},
			},
		},		

	[12] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!! После 22.05.2025 (переход Рейда через "экватор") кулдаун этапов 2-16 сделать 24 часа (86400 сек)
			event_filters = {
			},
			next_on_timeout = 13,
		},

	[13] = -- ВСТРЕТИТЬ КУРЬЕРА Описание: Взаимодействие с подвижным Объектом в "Восточная добывающая станция" | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Восточная добывающая станция | Целефой DEF: | zone_id: 225 | level_name: mininghub_fed_rock_01_l_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 14,
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 225 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Восточная добывающая станция" level_name="mininghub_fed_rock_01_l_ow" / zone_id=225)
			},
			-- marked_zones = { 225 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие) если не нужно подсвечивать - комментируем
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 225,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St13_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St13_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St13_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St13_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St13_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 35, -- На какой дистанции появится счётчик
				nearby_timer	= 10, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 3, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 35, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St13_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},		

	[14] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 15,
		},				

	[15] = -- DIA DE MUERTOS Описание: Уничтожить Стражников Предтеч | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St00_RoP2025_Guard" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="factory_emp_iridium_alpha_l_ow" / zone_id=229) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St15_dialog2", 
						},
						{
						character = "pve_irodr",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St15_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog5", 
						},
					},
					
				},
			},
		},		

	[16] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!! После 22.05.2025 (переход Рейда через "экватор") кулдаун этапов 2-16 сделать 24 часа (86400 сек)
			event_filters = {
			},
			next_on_timeout = 17,
		},			

	[17] = -- В ДАЛЬНИЙ ПУТЬ Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Форт Муэрто (Вега) | Целефой DEF: | zone_id: 204 | level_name: hub_pirate_empty_muerto_l_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
		
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 204 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Форт Муэрто" level_name="hub_pirate_empty_muerto_l_ow" / zone_id=204)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 204, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "WeaponMod_Plasma_Alien_Killer2", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St17_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St17_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St17_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St17_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St17_dialog5",
						},
					}
				},
			},
		},

	[18] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!! После 22.05.2025 (переход Рейда через "экватор") кулдаун этапов 2-16 сделать 24 часа (86400 сек)
			event_filters = {
			},
			next_on_timeout = 19,
		},	
	
	[19] = -- СЕРДЦЕ СКОРПИОНА Описание: Уничтожить Лазутчиков Предтеч | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: 3 сектора в системе "Антаресс": Храм (234) + Храм последней надежды (153) + Древние Руины (212)
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 6, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St19_Scout01", "AdvShip_RoP2025_St19_Scout02", "AdvShip_RoP2025_St19_Scout03", "AdvShip_RoP2025_St19_Scout04", "AdvShip_RoP2025_St19_Scout05", "AdvShip_RoP2025_St19_Scout06" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 234, 153, 212 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае 3 сектора в системе "Антаресс": Храм (234) + Храм последней надежды (153) + Древние Руины (212) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 234, 153, 212 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St19_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St19_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St19_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St19_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St19_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout05",
					},
					{
						def = "AdvShip_RoP2025_St19_Scout06", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St19_Scout06",
					},					
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St19_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 6,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St19_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St19_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St19_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St19_dialog5", 
						},
					},
					
				},
			},
		},		

	[20] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 21,
		},	
	
	[21] = -- |Повтор Stage 17| НА ТОМ ЖЕ МЕСТЕ... НУ ПОЧТИ Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Форт Муэрто (Вега) | Целефой DEF: | zone_id: 204 | level_name: hub_pirate_empty_muerto_l_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
		
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 204 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Форт Муэрто" level_name="hub_pirate_empty_muerto_l_ow" / zone_id=204)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 204, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "WeaponMod_Rail_Alien_Killer2", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St21_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St21_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St21_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St21_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St21_dialog5",
						},
					}
				},
			},
		},

	[22] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 23,
		},	
	
	[23] = -- ВСТРЕТИТЬ КУРЬЕРА Описание: Взаимодействие с подвижным Объектом в "Пустоши Cолариса" | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Пустоши Cолариса | Целефой DEF: | zone_id: 136 | level_name: ruinssmall_jer_rock_storage03_e_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 24,
				[ai.SituationResult.CODE_6 ]	= 62, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 136 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Пустоши Cолариса" >>> ruinssmall_jer_rock_storage03_e_ow >>> zone_id=136)
			},
			-- marked_zones = { 136 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 136,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 8,
						text = "quest_RoP2025_St23_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St23_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St23_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St23_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.CODE_6, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St23_dialog5", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St23_dialog6", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, -- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.				
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St23_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 35, -- На какой дистанции появится счётчик
				nearby_timer	= 12, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 3, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 35, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St23_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				shallNotDieDef   =  "AdvShip_RoP2025_St23_Courier", -- раскомментировать если нужно бкдет сделать что при потере пилота квест "Провален" и Игрок отправляется на повтор или стороннюю ветку 
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},

	[24] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 25,
		},	
	
	[25] = -- | копия Stage 15 | ФОРТ ПОРОСЁНКА Описание: Уничтожить Пиратские Турели | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Форт Муэрто (Вега) | Целефой DEF: | zone_id: 204 | level_name: hub_pirate_empty_muerto_l_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 15, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "OpenWorld_PirateTurret", "OpenWorld_PirateRocketTurret" } }, -- деф турелей, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 204 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Форт Муэрто" level_name="hub_pirate_empty_muerto_l_ow" / zone_id=204) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			marked_zones = { 204 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St25_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 15,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St25_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St25_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St25_dialog4", 
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog5", 
						},]]
					},
					
				},
			},
		},

	[26] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 27,
		},	
	
	[27] = -- |аналог Stage 15| НУЖНЫ БОЛЬШИЕ... Описание: Уничтожить Больших Кристаллидов в РВ-42 | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: РВ42 | Целефой DEF: | zone_id: 245 | level_name: excavation_elyd_empty_bion_l_ow
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 15, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_Crystallid_L_T5_eeeb" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 245 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "РВ42" level_name="excavation_elyd_empty_bion_l_ow" / zone_id=245) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St27_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 15,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St27_dialog2", 
						},
						{
						character = "RoP2025",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St27_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St27_dialog4", 
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog5", 
						},]]
					},
					
				},
			},
		},

	[28] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 29,
		},	
	
	[29] = -- |повтор Stage 15| ОПОЗНАТЬ НЕОПОЗНАННОЕ Описание: Уничтожить Стражников Предтеч | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 5, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)			
	
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St00_RoP2025_Guard" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="factory_emp_iridium_alpha_l_ow" / zone_id=229) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St29_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 5,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St29_dialog2", 
						},
						{
						character = "pve_irodr",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St29_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St29_dialog4", 
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog5", 
						},]]
					},
					
				},
			},
		},

	[30] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 31,
		},	
	
	[31] = -- ПОСЛЕДОВАТЕЛЬ КРАСНОГО БЕКОНА Описание: Встретить Лей-та Рамиреса в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St09_Ramirez" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			-- next_on_success	= 10, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 230,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St09_Ramirez",
				lootDef		= "WeaponMod_Laser_Alien_Killer2", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog2",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog3",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog4",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog5",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St31_dialog6",
						},
						--[[{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog7",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog8",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog9",
						},]]
					}
				},
			},
		},

	[32] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 33,
		},	
	
	[33] = -- СТЫД ДОНА РОБЕРТО Описание: Взаимодействие с подвижным Объектом в "Крушение "Northstar"" | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Крушение "Northstar" | Целефой DEF: | zone_id: 198 | level_name: hub_emp_rock_northstar_l_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 34,
				[ai.SituationResult.CODE_6 ]	= 63, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
				--[ai.SituationResult.FAIL ]	= 63, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 198 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Крушение «Northstar» >>> hub_emp_rock_northstar_l_ow >>> zone_id=198)
			},
			-- marked_zones = { 136 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 198,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 8,
						text = "quest_RoP2025_St33_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St33_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St33_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.CODE_6, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog5", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog6", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, -- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.
				
--[[    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.FAIL, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog7", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog8", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, ]]-- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.	
				
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St33_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 20, -- На какой дистанции появится счётчик
				nearby_timer	= 15, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 4, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 20, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St33_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				shallNotDieDef   =  "AdvShip_RoP2025_St33_Courier", -- раскомментировать если нужно бкдет сделать что при потере пилота квест "Провален" и Игрок отправляется на повтор или стороннюю ветку 
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},

	[34] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 35,
		},	
	
	[35] = -- ПРОВЕРКА ДОКУМЕНТОВ Описание: Уничтожить Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Бывш погр.секторах / достижение "Картография как...": Форт Муэрто (204) + Убежище контрабандистов (202)
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)			
	
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St35_Scout01", "AdvShip_RoP2025_St35_Scout02", "AdvShip_RoP2025_St35_Scout03" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 202 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае 2 Бывш погр.сектора / достижение "Картография как...": Форт Муэрто (204) + Убежище контрабандистов (202) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 202 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St35_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St35_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St35_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St35_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St35_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St35_Scout03",
					},				
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St35_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St35_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St35_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St35_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St35_dialog5", 
						},
					},
					
				},
			},
		},		

	[36] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 37,
		},	
	
	[37] = -- ОТЦЫ И ДЕТИ Описание: Встретить Лей-та Рамиреса в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St09_Ramirez" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			-- next_on_success	= 10, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 230,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St09_Ramirez",
				lootDef		= "WeaponMod_Plasma_Alien_Killer2", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog2",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog3",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog4",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog5",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog6",
						},
						--[[{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog7",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog8",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog9",
						},]]
					}
				},
			},
		},

	[38] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 39,
		},	
	
	[39] = -- ЦОЙ - ЖИВ! Описание: Взаимодействие с подвижным Объектом в "Крушение "Northstar"" | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Комплекс Наберия-392 (Идра) | Целефой DEF: | zone_id: 199 | level_name: factory_emp_rock_planetwar_l_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 40,
				[ai.SituationResult.CODE_6 ]	= 64, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
				--[ai.SituationResult.FAIL ]	= 63, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 199 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Комплекс Наберия-392 (Идра) >>> factory_emp_rock_planetwar_l_ow >>> zone_id=199)
			},
			-- marked_zones = { 136 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 199,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 8,
						text = "quest_RoP2025_St39_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St39_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St39_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St39_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.CODE_6, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St39_dialog5", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St39_dialog6", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, -- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.
				
--[[    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.FAIL, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog7", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog8", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, ]]-- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.	
				
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St39_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 20, -- На какой дистанции появится счётчик
				nearby_timer	= 10, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 2, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 20, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St39_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				shallNotDieDef   =  "AdvShip_RoP2025_St39_Courier", -- раскомментировать если нужно бкдет сделать что при потере пилота квест "Провален" и Игрок отправляется на повтор или стороннюю ветку 
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},

	[40] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 41,
		},	
	
	[41] = -- КРАЙ АСТРОГРАФИИ Описание: Уничтожить Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Бывш погр.секторах / достижение "Картография как...": Форт Муэрто (204) + Убежище контрабандистов (202)
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St41_Scout01", "AdvShip_RoP2025_St41_Scout02", "AdvShip_RoP2025_St41_Scout03" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 204 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае 2 Бывш погр.сектора / достижение "Картография как...": Форт Муэрто (204) + Убежище контрабандистов (202) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 204 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St41_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St41_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St41_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St41_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St41_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St41_Scout03",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St41_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St41_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St41_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St41_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St41_dialog5", 
						},
					},
					
				},
			},
		},		

	[42] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 43,
		},	
	
	[43] = -- | Повтор Stage 17 | НАЙТИ СВЯЗНОГО Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 230, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "Module_HerConcentration_T1_Mk1", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза) 
				lootCount	= 1, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St43_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St43_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St43_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St43_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St43_dialog5",
						},
					}
				},
			},
		},

	[44] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 45,
		},	
	
	[45] = -- | аналог Stage 27 | ЗЕЛЁНЫЙ ДОЗОР Описание: ЛИЧНО Уничтожить Кристаллидов-дозорных в Уничтоженная станция | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Уничтоженная станция (Корса Триама) | Целефой DEF: | zone_id: 222 | level_name: ruinsalien_precursor_lava_platform02_r_ow  
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 20, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
	
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "C_CrystallidPatrol_L_T4_rplp" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 222 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Уничтоженная станция" (Корса Триама) >>> ruinsalien_precursor_lava_platform02_r_ow >>>  zone_id=222) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St45_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 20,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St45_dialog2", 
						},
						{
						character = "RoP2025",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St45_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St45_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St45_dialog5", 
						},
					},
					
				},
			},
		},

	[46] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 47,
		},	
	
	[47] = -- ВНЕБРАЧНЫЙ СЫН И МАТЬ ВСЕХ ЗВЁЗД Описание: Уничтожить 5 Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Пустошь (Фелони) >>> ruinsdread_emp_rock_01_r_ow >>> zone_id=104
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 5, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St47_Scout01", "AdvShip_RoP2025_St47_Scout02", "AdvShip_RoP2025_St47_Scout03", "AdvShip_RoP2025_St47_Scout04", "AdvShip_RoP2025_St47_Scout05" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 104 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Пустошь (Фелони) >>> ruinsdread_emp_rock_01_r_ow >>> zone_id=104 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 104 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 900, -- через какоре время заспавнится следующий
				firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St47_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St47_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St47_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St47_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St47_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St47_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St47_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St47_Scout04",
					},
					{
						def = "AdvShip_RoP2025_St47_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St47_Scout05",
					},					
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St47_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 5,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St47_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St47_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St47_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St47_dialog5", 
						},
					},
					
				},
			},
		},		

	[48] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 49,
		},	
	
	[49] = -- | Повтор Stage 43 | НАЙТИ СВЯЗНОГО Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 230, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "Weapon_ForkLaser_T1_Mk1", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза) 
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St49_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St49_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St49_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St49_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St49_dialog5",
						},
					}
				},
			},
		},

	[50] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 24 ЧАСА (86400 сек)!!!
			event_filters = {
			},
			next_on_timeout = 51,
		},	
	
	[51] = -- ГОНКА БОМБАРДИРОВ Описание: Уничтожить 3 Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Полигон рейдеров (Кейд) >>> transit_emp_rock_frontier_e_ow >>> zone_id=201
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St51_Scout01", "AdvShip_RoP2025_St51_Scout02", "AdvShip_RoP2025_St51_Scout03" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 201 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Полигон рейдеров (Кейд) >>> transit_emp_rock_frontier_e_ow >>> zone_id=201 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 201 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 1800, -- через какоре время заспавнится следующий
				firstSpawnDelay = 20, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St51_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St51_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St51_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St51_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St51_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St51_Scout03",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St51_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St51_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St51_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St51_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St51_dialog5", 
						},
					},
					
				},
			},
		},		

	[52] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 53,
		},	
	
	[53] = -- ДОГОНЯЛКИ В ВОДОСБОРЕ! Описание: Взаимодействие с подвижным Объектом в "Водосбор" (Велорум) | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_FlyNearby | Зона: Водосбор (Велорум) | Целефой DEF: | zone_id: 25 | level_name: shipyard_fed_rock_waterharvest_e_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT, -- не смотря на то что это "взаимодействие", но всё таки тип не  ...INTERACT_OBJECT а именно ...SITUATION_RESULT т.к взаимодействие на выполнение скрипта (по времени)
			required_progress = 1,
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 54,
				[ai.SituationResult.CODE_6 ]	= 65, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
				--[ai.SituationResult.FAIL ]	= 63, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 25 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Водосбор (Велорум) >>> shipyard_fed_rock_waterharvest_e_ow >>> zone_id=25)
			},
			-- marked_zones = { 136 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			-- hud_marker_defs = { "AdvShip_RoP2025_St03_Courier" }, -- Комментируем если не хотим получить видимость на всю карту и восклицательный знак ("Цель задания") над мобом. В данном случае взят Федератский Разведчик R8 Nightingale и пилот к нему pve_briggs (тоже Федерат)
			
			situation_def	= "Adventure_FlyNearby", -- НОВАЯ СИТУАЦИЯ 2025, см. SC-119600 - "Взаимодействие с подвижнм объектом". Для неподвижного situation_def = "Adventure_QuestInteract".
			--сnext_on_success	= 3, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 25,

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "jackson",
						timer = 8,
						text = "quest_RoP2025_St53_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St53_dialog2", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
				{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.SUCCESS, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста,

					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St53_dialog3", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St53_dialog4", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				},
    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.CODE_6, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St53_dialog5", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St53_dialog6", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, -- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.
				
--[[    			{
					event = ai.AdventureInfoEvent.SITUATION_RESULT, -- здесь происходит оценка выполнения обновного квеста, и, в случае успеха запускает серию диалогов "по выполнении"
					int_param 	= ai.SituationResult.FAIL, -- запускает диалоги в случае провала квеста (CODE_6 = убийство триггера (или FAIL = если квест провален)

					dialogs		= 
					{
						{
						character = "pve_briggs", -- Курьер Штаба Объединённых Флотов
						--portrait = "sch_jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog7", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_briggs",
						--portrait = "jackson",
						timer = 10,
						text = "quest_RoP2025_St33_dialog8", -- диалог который будет бубнить персонаж (гивер) при поздравлении с успешным завершением фазы (создаётся в строках)
						},
					}					
				}, ]]-- раскомментировано (убраны кв.скобки перед "--"), т.к. нужно запускать диалоги в случае провала квеста.	
				
			},
					
			situation_args	=
			{
				-- entityDef		= "AdventureInteractObject_RoP2025_St03_Сourier", -- Деф объекта для взаимодействии, если неподвижный
				--[[triggerEntDef	= "AdvShip_BlackRelayRace_Carrier",
				triggerEntRange = 50,
				triggerSettings = {
					spawnspot = "alien_spawn_spotX",
					path_config = {"Adv_Path_BRR_2", "remove"}, 
					setNewBehavior = true,]] -- ЭТОТ БЛОК (от triggerEntDef) взят из Приключениий где описывается полёт кораблей с путями. 				
				pointDef		= "AdvShip_RoP2025_St53_Courier", -- Деф обьекта от которого будет считывать приближение
				achiveDistance	= 25, -- На какой дистанции появится счётчик
				nearby_timer	= 12, -- Какой счетчик нужно заполнить, чтобы выполнить цель, секунд рядом. По умолчанию 10
				nearby_dec  	= 2, -- Сколько отнимается в секунду от счетчика когда игрок не рядом с целью. По умолчанию 0, те прогресс не теряется
				achiveDistance	= 25, -- дистанция на которую надо подлететь для активации
				nearby_text_progress = "quest_RoP2025_St53_Timer", -- Текст прогресса счетчика в процентах от максимума, значение указыватся в строке полем $nearby_progress$
				shallNotDieDef   =  "AdvShip_RoP2025_St53_Courier", -- раскомментировать если нужно бкдет сделать что при потере пилота квест "Провален" и Игрок отправляется на повтор или стороннюю ветку 
				
			},
			
--[[			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1, -- количество завершёных действий (взаимодействий, убийств или ассистов) необходимых для завершения квеста
					dialogs		= 
					{
						{
						character	= "sch_jackson", -- персонаж, который будет общаться с игроком (в даном случае Ревенант	Джексон)
						text		= "quest_RoP2025_St05_dialog3",
						}
					}
				},
			},]]
		},

	[54] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 55,
		},	
	
	[55] = -- | Повтор Stage 49 | НАЙТИ СВЯЗНОГО Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)	
			 
			event_filters = 
			{
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			-- next_on_success	= 2, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 230, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "Ship_Race2_L_T1_Exorcist_part", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза) 
				lootCount	= 4, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St55_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St55_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St55_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St55_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St55_dialog5",
						},
					}
				},
			},
		},

	[56] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 57,
		},	
	
	[57] = -- ЖЕМЧУЖИНА УДАЧИ - СЧАСТЛИВАЯ МЕСТЬ Описание: Уничтожить Пиратские эсминцы «Удача» (Jer) + «Месть» (Fed) + "Счастливый" (Jer2) + "Жемчужина" (Fed2) в Граница Фелони | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Граница Фелони | Целефой DEF: | zone_id: 103 | level_name: service_emp_rock_01_u_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_OW_Boss_Jericho_Destroyer", "Ship_OW_Boss_Federation_Destroyer", "Ship_OW_Boss_Jericho_Destroyer2", "Ship_OW_Boss_Federation_Destroyer2" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 103 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Граница Фелони" (Фелони) level_name="service_emp_rock_01_u_ow" / zone_id=103) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St57_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St57_dialog2", 
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St57_dialog3", 
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St57_dialog4", 
						},						
					},
				},
				
			},
		},		

	[58] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 59,
			
		},
	
	[59] = -- ВСЕМ ВЫЙТИ ИЗ СУМРАКА! Описание: Уничтожить 5 Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: "Ледяной риф" (Троя) >>> ruinsalien_precursor_ice_platform_r_ow >>> zone_id=218
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 5, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
	
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 60,
				--[ai.SituationResult.CODE_6 ]	= 65, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
				[ai.SituationResult.FAIL ]	= 59, -- в случае неудачи (FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St59_Scout01", "AdvShip_RoP2025_St59_Scout02", "AdvShip_RoP2025_St59_Scout03", "AdvShip_RoP2025_St59_Scout04", "AdvShip_RoP2025_St59_Scout05" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 218 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Ледяной риф" (Троя) >>> ruinsalien_precursor_ice_platform_r_ow >>> zone_id=218) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 218 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--fail_ifDie = true, -- вариант FAIL (ai.SituationResult.FAIL) = если игрок умрёт/погибнет
				fail_ifEscapeZone = true, -- вариант FAIL (ai.SituationResult.FAIL) = если покидаешь зону
				spawnPeriod = 450, -- через какоре время заспавнится следующий (тут поставил 7,5 минут - чтобы игрокам всё таки было поменьше ждать спавна следующего моба, если его убьют соперники)
				firstSpawnDelay = 10, -- задержка первого спавна (в данном случае 10 секунд - боты должны спаввниться практически сразу)
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St59_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St59_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St59_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St59_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St59_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St59_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St59_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St59_Scout04",
					},
					{
						def = "AdvShip_RoP2025_St59_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St59_Scout05",
					},					
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St59_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 5,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St59_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St59_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St59_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St59_dialog5", 
						},
					},
					
				},
			},
		},		

	[60] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек) ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" = 1с!!!
			event_filters = {
			},
			next_on_timeout = 61,
			
		},
	
	[61] = -- | Повтор Stage 55 | СТАРЫЕ ЯВКИ В ИЗЛЮБЛЕННОМ МЕСТЕ Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			next_on_success	= 66, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 230, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "Weapon_Railgun_HeavyRaid_T1_Mk1", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза) 
				lootCount	= 3, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St61_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St61_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St61_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St61_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St61_dialog5",
						},
					}
				},
			},
		},

----- ПУСТЫЕ СТАДИИ = ЗАДЕРЖКИ при провале задапния (CODE_6 = убийство триггера, или FAIL = если квест провален) (НАЧАЛО БЛОКА)

	[62] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, -- Кулдаун при провале Stage [21] = -- ДОГНАТЬ КУРЬЕРА
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 2 мин (120 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 1 ЧАС (3600 сек)!!!
			event_filters = {
			},
			next_on_timeout = 23,
		},	
		
	[63] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, -- Кулдаун при провале Stage [33] = -- ДОГНАТЬ КУРЬЕРА
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 2 мин (120 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 1 ЧАС (3600 сек)!!!
			event_filters = {
			},
			next_on_timeout = 33,
		},

	[64] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, -- Кулдаун при провале Stage [39] = -- ДОГНАТЬ КУРЬЕРА
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 2 мин (120 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 1 ЧАС (3600 сек)!!!
			event_filters = {
			},
			next_on_timeout = 39,
			
		},

	[65] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА.
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, -- Кулдаун при провале Stage [39] = -- ДОГНАТЬ КУРЬЕРА
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 2 мин (120 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 1 ЧАС (3600 сек)!!!
			event_filters = {
			},
			next_on_timeout = 53,
			
		},			

----- ПУСТЫЕ СТАДИИ = ЗАДЕРЖКИ при провале задапния (CODE_6 = убийство триггера, или FAIL = если квест провален) (КОНЕЦ БЛОКА)

	[66] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 67,
			
		},

	[67] = -- | Копия Stage 37 | ПАНОПТИКУМ БЛОГЕРА Описание: Достать часы в Коолонист-11 (Виор) | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: "Колонист-11" (Виор) | Целефой DEF: | zone_id: 251 | level_name: shipyard_allidium_empty_yard_e_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 251 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Колонист-11" (Виор) >>> shipyard_allidium_empty_yard_e_ow >>> zone_id=251)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St67_Clock" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			-- next_on_success	= 10, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 230,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St67_Clock",
				lootDef		= "SpaceMissile_DisMissile_T5_Epic", -- «Диссонирующая торпеда» Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 5, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St67_dialog1", 
						},
						{
						character = "RoP2025", 
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St67_dialog2",
						},
						{
						character = "RoP2025", 
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St67_dialog3",
						},
						{
						character = "RoP2025", 
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St67_dialog4",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St67_dialog5",
						},
						--[[{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St37_dialog6",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog7",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog8",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog9",
						},]]
					}
				},
			},
		},

	[68] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 69,
			
		},

	[69] = -- | Копия Stage 37 | ОТЦЫ И ДЕТИ Описание: Встретить Лей-та Рамиреса в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St09_Ramirez" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			-- next_on_success	= 10, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 230,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				entityDef		= "AdventureInteractObject_RoP2025_St09_Ramirez",
				lootDef		= "SpaceMissile_DisMissile_T5_Epic", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 10, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog2",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog3",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog4",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog5",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St69_dialog6",
						},
						--[[{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog7",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog8",
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 10,
						text = "quest_RoP2025_St31_dialog9",
						},]]
					}
				},
			},
		},

	[70] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- ЗДЕСЬ КОРОТКИЙ КУЛДАУН, ВСЕГО 2 ЧАСА (7200 сек) - ЧТОБЫ ЛЮДИ СМОГЛИ ПОМЕНЯТЬ РАКЕТЫ И ОТДОХНУТЬ!!!
			event_filters = {
			},
			next_on_timeout = 71,
			
		},

	[71] = -- |Похожа на Stage 31| ТРИСТА ТРИДЦАТЬ... РАЗ! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 72,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St71_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St71_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[72] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 73,
			
		},

	[73] = -- ПРИЮТ ДОКТОРА ПАВЛОВА Описание: Уничтожить 5 Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: "Левиафан.Катакомбы" (Сияние) >>> science_precursor_empty_deathstar_e_ow >>> zone_id=152
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			next_on_situation_result = 
			{
				[ ai.SituationResult.SUCCESS ]	= 74,
				--[ai.SituationResult.CODE_6 ]	= 65, -- в случае неудачи (CODE_6 = убийство триггера, или FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
				[ai.SituationResult.FAIL ]	= 73, -- в случае неудачи (FAIL = если квест провален) отправляет в указанную фазу. Раскомментировать если потребуется "двойной исход"
			},
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St73_Scout01", "AdvShip_RoP2025_St73_Scout02", "AdvShip_RoP2025_St73_Scout03" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 152 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Левиафан.Катакомбы" (Сияние) >>> science_precursor_empty_deathstar_e_ow >>> zone_id=152) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 152  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 152 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--fail_ifDie = true, -- вариант FAIL (ai.SituationResult.FAIL) = если игрок умрёт/погибнет
				fail_ifEscapeZone = true, -- вариант FAIL (ai.SituationResult.FAIL) = если покидаешь зону
				spawnPeriod = 450, -- через какоре время заспавнится следующий (тут поставил 7,5 минут - чтобы игрокам всё таки было поменьше ждать спавна следующего моба, если его убьют соперники)
				firstSpawnDelay = 10, -- задержка первого спавна (в данном случае 10 секунд - боты должны спаввниться практически сразу)
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St73_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St73_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St73_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St73_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St73_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Hostile2, -- ВРАГ всем игрокам но друг всей карте. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St73_Scout03",
					},

				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St73_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St73_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St73_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St73_dialog4", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St73_dialog5", 
						},
					},
					
				},
			},
		},		

	[74] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 75,
			
		},

	[75] = -- |Копия Stage 71| ТРИСТА ТРИДЦАТЬ... ДВА! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 76,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St75_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St75_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[76] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 77,
			
		},

	[77] = -- |Повтор Stage 17| ДРУЗЬЯ РАСПОЗНАЮТСЯ ВЕЗДЕ Описание: Встретить Агента «Энигма» | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Форт Муэрто (Вега) | Целефой DEF: | zone_id: 204 | level_name: hub_pirate_empty_muerto_l_ow
		{
		stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)

			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 204 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Форт Муэрто" level_name="hub_pirate_empty_muerto_l_ow" / zone_id=204)
			},
			-- marked_zones = { 251 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_St02_Enigma" }, -- в данном случае взят Космонавт models\modules\decorative\bp19_astronaut\astronaut
			
			--situation_def	= "Adventure_QuestInteract", -- раскомментируем если просто выполнить этап без приза
			situation_def	= "Adventure_QuestCollect", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже)			
			--next_on_success	= 78, -- номер фазы на какую переключится при прохождении данной фазы (в данном случае банально "следующая в списке"). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей. 
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.ENTER_ZONE,
					int_param 	= 251,
					dialogs		= {{
						character	= "jer_captain", -- персонаж, который будет общаться с игроком (в даном случае Виктор Де Торо)
						text		= "quest_Ariadna_dialog10", -- диалог который будет бубнить персонаж (гивер) при вхождении в нужную локацию (создаётся в строках)
					}}
				},
			}, ]] 
			
			situation_args	=
			{
				needZones = { 204, }, -- параметр, проверяющий зону, в которой игрок взаимодействует с обьектом. Если он будет не в зоне, то у него не будет разрешения на взаимодействие с entityDef
				entityDef		= "AdventureInteractObject_RoP2025_St02_Enigma",
				lootDef		= "Ship_Race5_L_T5_Salamander_part", -- Def призового объекта, получаемого за выполнение этапа (квеста). Может быть только 1 (т.е. 1 вид приза)
				lootCount	= 4, -- Количество едениц призового объекта получаемых в трюм
				--chance		= 100, -- шанс выпадения, в %. По умолчанию = 100%, т.е. можно не прописывать если требуется "Гарантировванная выдача"
				-- failIncChanceOn = 60, -- увеличение шанса получения с каждой попыткой на заданную величину (пока не ыпадет или не дойдёт до 100. НЕ обнуляется, если предмет в итоге был получен				
			},
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St77_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St77_dialog2",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St77_dialog3",
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St77_dialog4",
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 7,
						text = "quest_RoP2025_St77_dialog5",
						},]]
					}
				},
			},
		},

	[78] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 79,
			
		},

	[79] = -- |Копия Stage 75| ТРИСТА ТРИДЦАТЬ... ТРИ!  Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 80,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St79_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St79_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St79_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St79_dialog2",
						},
					}
				},
			},]]
		},

	[80] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- ЗДЕСЬ КОРОТКИЙ КУЛДАУН, ВСЕГО 3 ЧАСА (10800 сек) - ЧТОБЫ ЛЮДИ СМОГЛИ ОТВЕЗТИ ЛУТ В АНГАР И ОТДОХНУТЬ!!!
			event_filters = {
			},
			next_on_timeout = 81,
			
		},

	[81] = -- |Копия Stage 71| ТРИСТА ТРИДЦАТЬ... ЧЕТЫРЕ!  Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 82,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St81_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St81_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[82] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 83,
			
		},

	[83] = -- |Копия Stage 51| БЛОКЧЕЙН ДЛЯ КРИПТОЛАЗУТЧИКА Описание: Уничтожить 3 Лазутчиков Предтеч ЛИЧНО | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Иридиевый поток (Прокссима) >>> ruinsalien_precursor_iridium_spheres_l_ow >>> zone_id=214
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 3, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста
			
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St83_Scout01", "AdvShip_RoP2025_St83_Scout02", "AdvShip_RoP2025_St83_Scout03" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 214 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае Иридиевый поток (Прокссима) >>> ruinsalien_precursor_iridium_spheres_l_ow >>> zone_id=214 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			situation_def	= "Adventure_SpawnMobPack",
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 214 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				spawnPeriod = 1800, -- через какоре время заспавнится следующий
				firstSpawnDelay = 20, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St83_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St83_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St83_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St83_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St83_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St83_Scout03",
					},
				},
			},	
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St83_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 3,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St83_dialog2", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St83_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St83_dialog4", 
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St83_dialog5", 
						},]]
					},
					
				},
			},
		},		

	[84] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 85,
			
		},

	[85] = -- |Копия Stage 31| ТРИСТА ТРИДЦАТЬ... ПЯТЬ! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,		

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 86,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St85_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St85_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[86] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- ЗДЕСЬ КОРОТКИЙ КУЛДАУН, ВСЕГО 3 ЧАСА (10800 сек) - ЧТОБЫ ЛЮДИ СМОГЛИ ОТВЕЗТИ ЛУТ В АНГАР И ОТДОХНУТЬ!!!
			event_filters = {
			},
			next_on_timeout = 87,
			
		},

	[87] = -- |Копия Stage 71| ТРИСТА ТРИДЦАТЬ... ШЕСТЬ! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 88,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St87_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St87_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[88] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 89,
			
		},

	[89] = -- |Копия Stage 57| ...ЧТОБЫ ЧУЖИЕ БОЯЛИСЬ! Описание: Уничтожить Пиратский эсминец «Золотая Лань» (Emp) в Древние Руины или Заброшенный комплекс (Антаресс) (zone_id = 212, 213) | Тип фазы: ASSIST_KILL | Подтип/situation: Adventure_SpawnMobPack | Зона:  Древние Руины или Заброшенный комплекс (Антаресс)  | Целефой DEF: | zone_id: 212, 213 | level_name: service_emp_rock_01_u_ow
		{ 
		stage_type = ai.AdventureStageType.ASSIST_KILL,
			required_progress = 1, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "Ship_OW_Boss_Empire_Destroyer2" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 212, 213 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае  Древние Руины или Заброшенный комплекс (Антаресс)  level_name= ruinsalien_precursor_empty_platform03_r_ow + ruinsbig_expanse_empty_tube_l_ow  / zone_id=212, 213) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St89_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St89_dialog2", 
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St89_dialog3", 
						},
						{
						character = "RoP2025", -- Агент «Энигма»
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St89_dialog4", 
						},						
					},
				},
				
			},
		},	

	[90] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 91,
			
		},

	[91] = -- |Копия Stage 31| ТРИСТА ТРИДЦАТЬ... СЕМЬ! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 92,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St91_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St91_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[92] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- ЗДЕСЬ КОРОТКИЙ КУЛДАУН, ВСЕГО 3 ЧАСА (10800 сек) - ЧТОБЫ ЛЮДИ СМОГЛИ ОТВЕЗТИ ЛУТ В АНГАР И ОТДОХНУТЬ!!!
			event_filters = {
			},
			next_on_timeout = 93,
			
		},

	[93] = -- |Копия Stage 71| ТРИСТА ТРИДЦАТЬ... ВОСЕМЬ! Описание: Взаимодействие с Пункт Управления Батареей в Инверторе | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_QuestInteract | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{
		stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,	

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_TAG_ANY, 	values = { "alpha" } },
				{ filter =  ai.AdventureFilter.ZONE, 		values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Инвертор" level_name="ruinsalien_crystal_iridium_invertor_r_ow" / zone_id=230)
			},
			-- marked_zones = { 230 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdventureInteractObject_RoP2025_CannonTrigger" }, -- в данном случае взят models/weapons/drones/spyradar/spyradar

			situation_def	= "Adventure_ShotMainTurretsAfterInteract", -- раскомментируем, если по результату взаимодействия мы планируем выдавать награду (см. lootDef = в блоке situation_args, ниже) 
			
			next_on_situation_result = {
				[ ai.SituationResult.SUCCESS ]	= 94,
			},
			
			situation_args	=
			{
				interactionDef	= "AdventureInteractObject_RoP2025_CannonTrigger", -- обьект взаимодействия для стрельбы
				mainTurretDef	= "ReturnOfPrecursors_AllidiumMainTurret", -- Def пушки которая должна стрелять
				existenceTime	= 21, -- время в секундах (по умолчанию 5сек), после которого объект entityDef (триггер выстрела) убирается с карты  !!! Корабль будет пытаться делать выстрелы в течении этого времени !!!
				dialog_params = 
				{
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St93_dialog1",
					},
					{
						character = "pve_irodr",
						portrait = "pve_irodr",
						--uiName	= "quest_character_pve_irodr",
						timer = 10,
						text = "quest_RoP2025_St93_dialog2",
					},
				},
			},
			
			--[[info_events = {
				{
					event		= ai.AdventureInfoEvent.PROGRESS,
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Лейтенант Рамирес
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						{
						character = "pve_irodr",
						--portrait = "quest_character_pve_irodr_medium",
						timer = 8,
						text = "quest_RoP2025_St71_dialog2",
						},
					}
				},
			},]]
		},

	[94] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 1, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 95,
			
		},

	[95] = -- |Копия Stage 29| Gr20. ЗЕЛЁНАЯ ДВАДЦАТКА Описание: Уничтожить ЛИЧНО Стражников Предтеч | Тип фазы: KILL | Подтип/situation: Adventure_SpawnMobPack | Зона: Инвертор | Целефой DEF: | zone_id: 230 | level_name: ruinsalien_crystal_iridium_invertor_r_ow
		{ 
		stage_type = ai.AdventureStageType.KILL,
			required_progress = 20, -- количество завершёных действий (в данном случае убийств или ассистов) необходимых для завершения квеста

			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НАЧАЛО БЛОКА)
			timeout	= 1, -- Добьавляем таймер ТУТ ПЛОХО РАБОТАЕТ: таймер запускается сразу после кулдауна - и гоняет цикл "Кулдаун межфазный" > "Таймер" > "Кулдаун на провал таймера" > итп по кругу
			next_on_timeout = ai.AdventureStage.LOSS, -- таймер вышел, -- ai.AdventureStage.LOSS = 98 - финал, на который по умолчанию переходит приключение, если не указано иного в condition'ах и при отмене
			-- ДЛЯ СОКРЫТИЯ ПРИКЛЮЧЕНИЯ "ПРОВАЛОМ" (в сл. раз Прикл. начнётся сначала) ДОБАВЛЯЕМ ЭТОТ БЛОК ("Loss за 1 сек."). ПРИ ОТКРЫТИИ - ЗАКОММЕНТИРУЕМ. (НКОНЕЦ БЛОКА)
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ENTITY_DEF, 	values = { "AdvShip_RoP2025_St00_RoP2025_Guard" } }, -- деф мобов, которх нужно будет уничтожить для прохождения миссии (в даном случае и как правило соответствует тому что и запускается из точки спавна + будет отражаться в HUD)
				{ filter =  ai.AdventureFilter.ZONE, 	values = { 230 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Разрушенная станция" level_name="factory_emp_iridium_alpha_l_ow" / zone_id=229) 
			},
			
			--hud_marker_defs = { "AdvShip_RoP2025_ScoutEmpty" }, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			--marked_zones = { 208, 126, 22  }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, если не нужно подсвечивать - комментируем
			--[[situation_def	= "Adventure_SpawnMobPack", -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.
			situation_args	=
			{
				loopedSpawn = true,
				forseAdwOwner = true,
				needZones	= { 230 }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua.
				--spawnPeriod = 900, -- через какоре время заспавнится следующий
				--firstSpawnDelay = 120, -- задержка первого спавна (для тестов 20 сек, в игру 120 (2 мин), чтобы игрокам казалось что при повторном влёте - не спавнится
				mobPacksTable = {
					{
						def = "AdvShip_RoP2025_St11_Scout01", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout01",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout02", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout02",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout03", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout03",
					},
					{
						def = "AdvShip_RoP2025_St11_Scout04", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = ai.RelationshipGroups.Neutral1, -- Neutral1 означает что нейтрален к игроку пока его не атакует. (relationship = nil - это "ничего", пустое значение, т.е. когда моб создается, берется значение по умолчанию = ai.RelationshipGroups.Pirate)
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout04",
					},		
					{
						def = "AdvShip_RoP2025_St11_Scout05", -- деф мобов, который будет запускаться из точки спавна (в даном случае и как правило соответствует тому что и будет отражаться в HUD)
						amount = 1, -- количество коhаблей, вылетающих из одной точки спавна (их может быть несколько - но расставляется они на карте, здесь не регламентируются)
						settings = {
							relationship = nil,
						},
						spawnpoint = "AdventureSpawnPoint_RoP2025_St11_Scout05",
					},						
				},
			},]] -- БЛОКИ situation_def + situation_args НУЖНЫ ТОЛЬКО ЕСЛИ МОБЫ НЕ ПРОПИСАНЫ В ...\documents\campaign\OW_campaign_luaset.ods Если же мобы в таблице прописаны то это можно удалить или комментировать.	
			
			info_events = 
			{
				{
					event		= ai.AdventureInfoEvent.PROGRESS,					
					int_param 	= 1,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Курьер Штаба Объединённых Флотов
						--portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St95_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
						},
						--[[{
						character = "pve_briggs",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St07_dialog2", 
						},]]
					},
				},
				
				{
					event		= ai.AdventureInfoEvent.PROGRESS,								
					int_param 	= 20,
					dialogs		= 
					{
						{
						character = "pve_irodr", -- Агент «Энигма»
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St95_dialog2", 
						},
						{
						character = "pve_irodr",
						--portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St95_dialog3", 
						},
						{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St95_dialog4", 
						},
						--[[{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St15_dialog5", 
						},]]
					},
					
				},
			},
		},
		
		
	},
	rewards = 
	{
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 10000000,
			items 			= { {"Relics_craft_part", 50 }, },
			milestone 		= Milestones.RoP2025_Final,
		},

	},
}
----------------------------------------------------------------------------------------------
-- Финальный рейд-приключение "Возвращение Предтеч" ВТОРАЯ ЧАСТЬ. Этапы Приключений ReturnOfPrecursors2025_2 (НАЧАЛО БЛОКА)
--[[
Adventures[ ai.Adventures.RoP2025_2_Final ] = 
{ -- Фазы Финального рейда-приключения "Возвращение Предтеч" ВТОРАЯ ЧАСТЬ (если пртребуетсмя перевести из одного в другое, при достижении лимита этапов 64 >>> 96 SC-119865)

	atid = ai.Adventures.RoP2025_2_Final,
	no_cancel = true, -- возможность отменить приключение (false = отменяемое), чтобы можно было взять другое (см тикет SC-119766)
	generator = function ( player ) return { 0, 0, 0, 0, 0} end,
	generator_restriction = function ( player, params )
		local milestones = SV_FreeSpace_GetPlayerAdventureMilestones( player )
		local permission = false
		for i = 1, #milestones do
			if milestones[ i ] == Milestones.RoP2025_Final then
				permission = true
			end
		end
		
		for i = 1, #milestones do

			if milestones[ i ] == Milestones.RoP2025_2_Final then
				permission = false
			end

		end

		return permission
	end,		
	
	stages = 
	{
	[1] = -- можно сделать кулдан (то есть тут, во 2й части кулдаунами будут чётные стадии. А можно какую то реальную активность прописать (найти удить итп)
		{ -- стадия нужна чтобы закрыть сюжетный квест (Гивер выдал предмет - получение которого и закрывает "Квест" (прописанный в Quests Table) и переводит дальше в "Приключения" (сюда).
			stage_type = ai.AdventureStageType.LOOT,
			required_progress = 1,
			-- timeout 		= 300,
			event_filters = {
				{ filter =  ai.AdventureFilter.ITEM_DEF, 	values = {"AdventureItem_RoP2025_2_Device", } },
			},
			situation_def	= "Adventure_GiveItems",
			situation_args	= { 
				itemDef = "AdventureItem_RoP2025_2_Device", -- Должна быть заранее прописана в ...work_version\pc\data\gamedata\def\objects\quest_items.lua. Иконка "гаринитуры", которую выдал Игроку гивер в качестве предмета на завершение квеста (и перевод в приключения) типа "возьми рацию - будем на связи".
				dialog_params = 
				{
					{
						character = "broker", -- Посредник *нанят "втёмную" Агентом Энигма
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog1", -- по аналогии с quest_New_ground_1_dialog1 (выше, Ларри Селдон)
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog2",
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog3",
					},
					{
						character = "broker",
						-- portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog4",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St01_dialog5",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 10,
						text = "quest_RoP2025_St01_dialog6",
					},
					{
						character = "RoP2025",
						portrait = "RoP2025",
						timer = 8,
						text = "quest_RoP2025_St01_dialog7",
					},
				},
			},
		},

	[2] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. Встретить Агента «Энигма»
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT,
			required_progress = 1,
			timeout 		= 300, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 3,
		},	


	},

	[3] = -- Описание: Битва с кристаллидами | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_KillAllMobs | Зона: Область раскопок №6 ...
		{ 
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, values = { 244 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Область раскопок №6" level_name="excavation_elyd_empty_lunar_l_ow" / zone_id=244)
			},
			marked_zones = { 244 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdvShip_Prefinal_Jer_CrystallidP"}, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			
			situation_def	= "Adventure_KillAllMobs", -- подтип задачи / "ситуация" (задача: "взаимодействие с объектами", подтип/ситуация: "убить их всех")
			next_on_situation_result = { -- описывает номер фазы на который переходит при успешном выполнении required_progress = и что делать в случае неудачи (фаза повторяется). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей.  
				[ ai.SituationResult.SUCCESS ]	= 9,
				[ai.SituationResult.FAIL ]	= 7, -- в случае неудачи онправляет в фазу 7
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				fail_ifDie = true, -- вариант FAIL (ai.SituationResult.FAIL) = если игрок умрёт/погибнет
				fail_ifEscapeZone = true, -- вариант FAIL (ai.SituationResult.FAIL) = если покидаешь зону
				def		= { "AdvShip_Prefinal_Jer_CrystallidP"}, -- строка или таблица мобов которых нужно истребить (которые были прописаны в предыдущей фазе, блок mobPacksTable =)
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog8",
					}}
				},
			},
			
		},	

	[4] = -- ПУСТАЯ СТАДИЯ = ЗАДЕРЖКА ВЫДАЧИ СЛЕДУЮЩЕГО КВЕСТА. 
		{
			stage_type = ai.AdventureStageType.SITUATION_RESULT, 
			required_progress = 1,
			timeout 		= 300, -- Для Тестирования сделано 5 мин (300 сек) НА ЛАЙВ - НЕ ЗАБЫТЬ ПОМЕНЯТЬ НА 60 ЧАСОВ (216000 сек)!!!
			event_filters = {
			},
			next_on_timeout = 5,
			
		},

	[5] = -- Описание: Битва с кристаллидами | Тип фазы: INTERACT_OBJECT | Подтип/situation: Adventure_KillAllMobs | Зона: Область раскопок №6 ...
		{ 
			stage_type = ai.AdventureStageType.INTERACT_OBJECT,
			required_progress = 1,
			
			event_filters = {
				{ filter =  ai.AdventureFilter.ZONE, values = { 244 } }, -- номер зоны, в которой будет проходить событие (по zone_id=... в zones.lua, в данном случае "Область раскопок №6" level_name="excavation_elyd_empty_lunar_l_ow" / zone_id=244)
			},
			marked_zones = { 244 }, -- зона, помеченная на карте ОМ (в данном случае = зоне где событие)
			hud_marker_defs = { "AdvShip_Prefinal_Jer_CrystallidP"}, -- деф мобов, который будет отражаться в HUD (в даном случае и как правило соответствует тому что и запускается)
			
			situation_def	= "Adventure_KillAllMobs", -- подтип задачи / "ситуация" (задача: "взаимодействие с объектами", подтип/ситуация: "убить их всех")
			next_on_situation_result = { -- описывает номер фазы на который переходит при успешном выполнении required_progress = и что делать в случае неудачи (фаза повторяется). Может быть опущен - тогда по умолчанию в случае успеха = переход на следующую по порядку фау а в случае неудачи = повторенрие текущей.  
				[ ai.SituationResult.SUCCESS ]	= 9,
				[ai.SituationResult.FAIL ]	= 7, -- в случае неудачи онправляет в фазу 7
				default						= ai.AdventureStage.LOSS,
			},
			
			situation_args	=
			{
				fail_ifDie = true, -- вариант FAIL (ai.SituationResult.FAIL) = если игрок умрёт/погибнет
				fail_ifEscapeZone = true, -- вариант FAIL (ai.SituationResult.FAIL) = если покидаешь зону
				def		= { "AdvShip_Prefinal_Jer_CrystallidP"}, -- строка или таблица мобов которых нужно истребить (которые были прописаны в предыдущей фазе, блок mobPacksTable =)
			},
			
			info_events = {
				{
					event		= ai.AdventureInfoEvent.SITUATION_RESULT,
					int_param 	= ai.SituationResult.SUCCESS,
					dialogs		= {{
						character	= "jer_major",
						text		= "quest_Prefinal_Jer_dialog8",
					}}
				},
			},
			
		},					

	rewards = 
	{
		[ ai.AdventureStage.WIN ] = 
		{
			credits 		= 600000,
			items 			= { {"Relics_craft_part", 10 }, },
			milestone 		= Milestones.RoP2025_2_Final,
		},

	},
}
-- Финальный рейд-приключение "Возвращение Предтеч" ВТОРАЯ ЧАСТЬ. Этапы Приключений ReturnOfPrecursors2025_2 (КОНЕЦ БЛОКА) закоментировано до возникновения необходимости >>> ]]		

-- SC-118793 Финальный рейд-приключение "Возвращение Предтеч". Этапы Приключений ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)
----------------------------------------------------------------------------------------------