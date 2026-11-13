PvE_PB_H = {}
--
PvE_PB_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "broker", "pve_piratebay_break_generators1_1" },
					{ 1, "umc_dispatch", "pve_piratebay_break_generators1_2" },
				},
				sTargetDef	= { "PvE_EnergyGeneratorBig", "PvE_EnergyGeneratorTriple", "PvE_EnergyGeneratorLong", }, -- целевой деф для уничтожения
				tCount		= 3,
				nRoundPhase	= 1,
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
				additionalFunc = { 
					Func = function( self, curPhase )
						sys.concmd( "e_event SpaceShield1 Fadeout" )
				end,	
				},
			},
		[ 2 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "broker", "pve_piratebay_break_generators2" },
				},
				sTargetDef	= { "PvE_PrisonGenerator", "PvE_HangarGenerator", }, -- целевой деф для уничтожения
				tCount		= 3,
				nRoundPhase	= 2,
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},	
				additionalFunc = { 
					Func = function( self, curPhase )
						local roketTurs = GetEntitiesByDef( "Turret_Team2_Pve_RocketGun_shadow" )
						for i, tur in ipairs( roketTurs ) do
							local pos = Entities[ tur ]:GetPos()
							local rot = Entities[ tur ]:GetRot()
							Entities[ tur ]:Remove()
							
							local turretRocket = ai.Spawn( "Turret_PvePirate_RocketGun" )
							turretRocket:SetPos( pos )
							turretRocket:SetRot( rot )	
							SV_Pve_SetSpawnGroup( 1 )
						end				
					end,	
				},
			},
		[ 3 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "umc_dispatch", "pve_piratebay_save_transport_1" },
					{ 1, "broker", "pve_piratebay_save_transport_2" },
				},
				nRoundPhase	= 3,	
				bCountBar	= true,
				transport 	= { "Transport1" },
				nextSpawn	= { 1 },
				sTargetDef 	= "CargoShipPirateTeam1", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= true, -- флаг на результат ухода транспорта
				bDeadResult	= false, -- флаг на результат смерти транспорта
				timer		= 20,
				tId			= nil,	
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 2 )
				end,	
				},
			},
		[ 4 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "umc_dispatch", "pve_piratebay_kill_all_1" },
					{ 43, "broker", "pve_piratebay_kill_all_2" },
				},		
				nRoundPhase	= 4,	
				waves = 
				{			

					{	def = "Ship_Captain_Pirate_bot", count = 4, delay = 5 },
					{	def = "Ship_Commander_Pirate_bot", count = 2, delay = 15 },
					{	def = "Ship_Captain_Pirate_bot", count = 3, delay = 20 },
					{	def = "Ship_Boss_Pirate_bot", count = 1, delay = 3 },
					{	def = "Ship_Commander_Pirate_bot", count = 2, delay = 15 },
				},	
			},			
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = { "Ship_Small1_Pirate_bot", "Ship_Medium_Pirate_bot" },	
			MeatBots_t2 = {},
			EliteBots = { "Ship_Captain_Pirate_bot" },	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { "Ship_Small1_Pirate_bot", "Ship_Medium_Pirate_bot" },	
			MeatBots_t2 = {},
			EliteBots = { "Ship_Captain_Pirate_bot" },	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = { "Ship_Small1_Pirate_bot", "Ship_Medium_Pirate_bot" },	
			MeatBots_t2 = {},
			EliteBots = { "Ship_Captain_Pirate_bot" },	
			Executor = {}, 
		},
	[ 4 ] = 
		{ 
			MeatBots_t1 = {},	
			MeatBots_t2 = {},
			EliteBots = {},		
			Executor = {}, 
		}
	},
}


PvE_Missions.piratebay_hard = 
{
	levelName = "s1515_piratebay",
	scenario_description = { "piratebay_str1", "piratebay_str2", "piratebay_str3" },
	need_spawn_warp = true,
	
	event_loot_attempts = 1,
	desc = "",
	resurrection_attempts = 5,
	accountRank = 12,
	rank  = 6,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	item_lvl = 28, -- параметр для начисления награды.
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)

	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	squads = {				
		{
			name = "Transport1",
	 		relationship_group = 1,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipPirateTeam1", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
	},	
	rounds = 
	{
		[ 1 ] = 
	
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Small1_Pirate_bot", 
				"Ship_Medium_Pirate_bot",
				"Ship_Captain_Pirate_bot",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"Ship_Boss_Pirate_bot",
				"Ship_Commander_Pirate_bot",
			},			
			exp_reward_portion = 2,
			cred_reward_portion = 3,
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_piratebay_r1_rdesc", 
			start_sentence = "CMDR_PVE_START_ROUND_SABOTAGE",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			--[[modifiers =
			{
				{ spell = "Pve_CritChance",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealHull",	caster_group = 1, },
				{ spell = "Pve_HealShield",	caster_group = 1, },
			},--]]
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 8,
					
					{	def = "Ship_Small1_Pirate_bot", count = 1, spawn_group = 13, spawn_warp = true, delay = 999999999999999999999999999999999, }, 		
				},
			},
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
            },
		},
	},	
}

PvE_Mission.nCurPhase = 0


PvE_Missions.piratebay_hard.rounds[ 1 ].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_PB_H:OnUpdate( dt )
end

function PvE_PB_H:OnStart()

	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
end

function PvE_PB_H:OnUpdate( dt )
	
	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_PB_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.piratebay_hard.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.piratebay_hard.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.piratebay_hard.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.piratebay_hard.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end