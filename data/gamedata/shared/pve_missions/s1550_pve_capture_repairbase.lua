--
PvE_CRB_H = {}

PvE_CRB_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_capture_repairbase_vitals1" },
				},
				count		= 2,
				nRoundPhase	= 1,
				sTargetDef	= "PvE_Gen_VitalGenerator",
					
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ "PlasmaCannon1" ]:ActivateShield( false )
						Entities[ "PlasmaCannon2" ]:ActivateShield( false )
						Entities[ "PlasmaCannon3" ]:ActivateShield( false )
						Entities[ "PlasmaCannon4" ]:ActivateShield( false )
					end
				},		
			},
		[ 2 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_capture_repairbase_destroy_turrets1" },
				},
				sTargetDef	= { "Turret_Team2_Pve_Pirate_PlasmaCannon", }, -- целевой деф для уничтожения
				tCount		= 4,
				nRoundPhase	= 2,
				PossibleEvents= {},
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},		
			},	
		[ 3 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_capture_repairbase_vitals2" },
				},
				count		= 1,
				sTargetDef	= "PvE_Gen_VitalGenerator",
				nRoundPhase	= 3,	
				additionalFunc = {
					Func = function( self, curPhase )
						Mission:SwitchTurretUpdate()
					end
				},	
			},
		[ 4 ] =
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_capture_repairbase_destroy_turrets2" },
				},
				sTargetDef	= { "Turret_Team2_Pve_Void_T1_RocketGun", "Turret_Team2_Pve_Cruise_T1_RocketGun", "Turret_Team2_Pve_Standart_T1_RocketGun" }, -- целевой деф для уничтожения
				tCount		= 3,
				nRoundPhase	= 4,
				PossibleEvents= {},
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
			},	
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = { "Ship_CR1_DefProDefender_R1_L_T1", "Ship_CR1_DefMeat_R1_S_T2" },	
			MeatBots_t2 = { "Ship_CR1_DefDamager_R1_M_T2_Premium", },	
			EliteBots = { "Ship_CR1_DefCasualElite_R3_S_T2", "Ship_CR1_Elite_R2_M_T3", "Ship_CR1_Elite_R1_M_T4" },	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { "Ship_CR1_DefProDefender_R1_L_T1", "Ship_CR1_DefMeat_R1_S_T2" },	
			MeatBots_t2 = { "Ship_CR1_DefDamager_R1_M_T2_Premium", },	
			EliteBots = { "Ship_CR1_DefCasualElite_R3_S_T2", "Ship_CR1_Elite_R2_M_T3", "Ship_CR1_Elite_R1_M_T4" },	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = { "Ship_CR1_DefProDefender_R1_L_T1", "Ship_CR1_DefMeat_R1_S_T2" },	
			MeatBots_t2 = { "Ship_CR1_DefDamager_R1_M_T2_Premium", },	
			EliteBots = { "Ship_CR1_DefCasualElite_R3_S_T2", "Ship_CR1_Elite_R2_M_T3", "Ship_CR1_Elite_R1_M_T4" },	
			Executor = {}, 
		},
	[ 4 ] = 
		{
			MeatBots_t1 = { "Ship_CR1_DefProDefender_R1_L_T1", "Ship_CR1_DefMeat_R1_S_T2" },	
			MeatBots_t2 = { "Ship_CR1_DefDamager_R1_M_T2_Premium", },	
			EliteBots = { "Ship_CR1_DefCasualElite_R3_S_T2", "Ship_CR1_Race1_L_T3_Boss",  },	
			Executor = {}, 
		},	
	},
}


--easy mission
PvE_Missions.capture_repairbase_t1 = 
{
	levelName = "s1550_pve_capture_repairbase",
	scenario_description = { "capture_repairbase_str1", "capture_repairbase_str2", "capture_repairbase_str3" },
	need_spawn_warp = true,

	desc = "",
	resurrection_attempts = 5,
	accountRank = 3,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	item_lvl = 10, -- параметр для начисления награды.
	bot_difficulty = 0, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,
	
	turret_health_coef = 0.2,	--#79539
	turret_damage_coef = 0.1,
	
	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	event_loot_attempts = 3,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			exp_reward_portion = 2,
			cred_reward_portion = 2,
			loot_attempts_reward = 3,

			uiRoundDesc = "pve_capture_repairbase_r1_rdesc", 
			start_sentence = "CMDR_PVE_START_ROUND_SECTOR_CAPTURE",
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			modifiers =
			{
				{ spell = "Pve_HealHull",	caster_group = 1, }, -- 1 players team, AI team 
				{ spell = "Pve_BuffDamage",	caster_group = 1, },
				{ spell = "Pve_HealShield",	caster_group = 1, },
				
			},
			
			sabotage_list = { "ControlStationA1", "ControlStationB1", "ControlStationC1", },
			
			precache_defs = {
				"Ship_CR1_DefProDefender_R1_L_T1", 
				"Ship_CR1_DefMeat_R1_S_T2", 
				"Ship_CR1_DefDamager_R1_M_T2_Premium", 
				"Ship_CR1_DefCasualElite_R3_S_T2", 
				"Ship_CR1_Elite_R2_M_T3", 
				"Ship_CR1_Elite_R1_M_T4", 
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
			},
			
			start_event = 
			{
			},
			
			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 14,	
					{	def = "Ship_CR1_DefProDefender_R1_L_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 99999999, }, 
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

--easy update
PvE_Missions.capture_repairbase_t1.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_CRB_H:OnUpdate( dt )
end

--info for game
PvE_Mission.nCurPhase = 0

function PvE_CRB_H:OnStart()
	PvE_Mission.nVitalCurrent = 0

	PvE_Mission.vitals = GetEntitiesByDef( "PvE_Gen_VitalGenerator" )
	
	for i, vital in ipairs( PvE_Mission.vitals ) do
		PvE_Mission.aVitalsInGame[ i ] = {}
		PvE_Mission.aVitalsInGame[ i ].id = vital
		PvE_Mission.aVitalsInGame[ i ].pos = Entities[ vital ]:GetPos()
	--	PvE_Func:RemoveFromList( PvE_Mission.vitals, vital )
	end
	
	for i, vitals in pairs( PvE_Mission.aVitalsInGame ) do
		Entities[ PvE_Mission.aVitalsInGame[ i ].id ]:FullActivate( false )
		local pos = Entities[ PvE_Mission.aVitalsInGame[ i ].id ]:GetPos()
		local obj = ai.Spawn( "PvE_Gen_StationShadow" )
		obj:SetPos( pos )
		PvE_Mission.aVitalsInGame[ i ].shadow = obj:GetId()
	end

	PvE_Func:PhasesSelector()
	PvE_Mission:OnStart()
end

function PvE_CRB_H:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )

end

for i, phase in ipairs( PvE_CRB_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.capture_repairbase_t1.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.capture_repairbase_t1.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.capture_repairbase_t1.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.capture_repairbase_t1.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end