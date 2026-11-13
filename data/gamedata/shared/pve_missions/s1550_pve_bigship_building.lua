--
PvE_BSB_H = {}
-- HARD MISSIONS

PvE_BSB_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				sync_UI_Timer = 5,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_bigship_building_wave1" },
				},		
				nRoundPhase	= 1,	
				waves = 
				{				
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, delay = 5, }, 
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, delay = 5, }, 
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 4, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 4, delay = 5, },
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 4, delay = 10, },
					{	def = "Ship_BB1_ProDefender_R1_L_T1", count = 1, delay = 10, },
				},		
			},
		[ 2 ] = --заглушка
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_bigship_building_wave2" },
				},		
				nRoundPhase	= 1,	
				waves = 
				{				
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 6, delay = 3, },
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 1, delay = 3, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 6, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 3, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 2, delay = 5, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 10, },
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 1, delay = 10, },
					{	def = "Ship_Bot_EasyElite_R2_M_T2", count = 1, delay = 15, },
				},		
			},
		[ 3 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_bigship_building_wave3" },
				},		
				nRoundPhase	= 1,	
				waves = 
				{				
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 5, delay = 10, },
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, delay = 3, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, delay = 3, },
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 3, delay = 15, },
					{	def = "Ship_BB1_Meat_R1_S_T2", count = 3, delay = 5, },
					{	def = "Ship_BB1_ProDefender_R1_L_T1", count = 1, delay = 5, },
					{	def = "Ship_Bot_EasyElite_R2_M_T2", count = 1, delay = 10, },
					{	def = "Ship_Bot_EasyEliteCommander_R1_T2", count = 1, delay = 15, },
				},	
				additionalFunc = {
					Func = function( self, curPhase )
						local railTurs = GetEntitiesByDef( "Turret_Team2_Pve_AiRailgun_shadow" )
						for i, tur in ipairs( railTurs ) do 
							local pos = Entities[ tur ]:GetPos()
							local rot = Entities[ tur ]:GetRot()
							Entities[ tur ]:Remove()
							
							local turretRail = ai.Spawn( "Turret_Team2_Pve_AiRailgun" )
							turretRail:SetPos( pos )
							turretRail:SetRot( rot )	
						end	
						
						local railTurs = GetEntitiesByDef( "PvE_bb2_shadow" )
						for i, tur in ipairs( railTurs ) do 
							local pos = Entities[ tur ]:GetPos()
							local rot = Entities[ tur ]:GetRot()
							Entities[ tur ]:Remove()
							
							local turretRail = ai.Spawn( "Turret_Team2_Pve_TowerStation" )
							turretRail:SetPos( pos )
							turretRail:SetRot( rot )	
						end	
						
						-- отключаем возможность захватывать маяки
						local VitalPoints = {"VitalPoint_PVE_ControlStationA", "VitalPoint_PVE_ControlStationB", "VitalPoint_PVE_ControlStationC"}
						for _, VP_def in pairs( VitalPoints ) do 
							for _, vitalId in ipairs( GetEntitiesByDef( VP_def ) ) do
								local VitalPoint = Entities[ vitalId ]
							
								VitalPoint:ShowInHud( false )							
								VitalPoint:SetHealth( VitalPoint:GetMaxHealth() )							
								VitalPoint:SetDamageable( false )
							end
						end
					SV_Pve_SetSpawnGroup( 10 )
					end				
				},	
			},
		[ 4 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_bigship_building_destroyer" },
				},
				sTargetDef	= { "Turret_Team2_Pve_TowerStation" }, -- целевой деф для уничтожения
				tCount		= 3,
				nRoundPhase	= 2,
				PossibleEvents= {},
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},	
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 0 )
						local ships = GetAllSpaceShips()
						for i, ship in ipairs( ships ) do
							if Entities[ ship ]:GetPlayerIdx() < 0 then
								PvE_Mission.aPhases[ 5 ].progressCount = PvE_Mission.aPhases[ 5 ].progressCount + 1
								table.insert( PvE_Mission.aPhases[ 5 ].tId, ship )
							end	
						end	
				end,	
				},
			},	
		[ 5 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "emp_captain", "pve_bigship_building_kill_all" },
				},		
				nRoundPhase	= 3,	
				waves = 
				{				
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 2, delay = 1, },
					{	def = "Ship_BB1_DefProDefender_R1_L_T1", count = 2,  delay = 5, },
					{	def = "Ship_Bot_EasyElite_R2_M_T2", count = 1, delay = 5, },
					{	def = "Ship_BB1_DefProDefender_R1_L_T1", count = 1 , delay = 10, },
					{ 	def = "Ship_Bot_BossEasy_Elite_R3_T5", count = 1, delay = 15, },
					{	def = "Ship_BB1_Damager_R1_M_T2_Premium", count = 2, delay = 10, },
				},		
			},
		},	
		
	mobs = 
	{
		MeatBots = {  },										
		EliteBots	= {  },
		BossBots	= {  },
	},
		
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 4 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_EasySmallMeat_R3_S_T1", "Ship_Bot_EasyMediumMeat_R2_M_T1" },	
			MeatBots_t2 = { "Ship_Bot_EasyElite_R2_M_T2", },	
			EliteBots = { "Ship_BB1_Damager_R1_M_T2_Premium", "Ship_BB1_DefProDefender_R1_L_T1",  },	
			Executor = {}, 
		},	
	[ 5 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },	
			Executor = {}, 
		},	
	},
}

-- T1 Mission
PvE_Missions.bigship_building_easy = 
{
	levelName = "s1550_pve_bigship_building",
	scenario_description = { "bigship_building_str1", "bigship_building_str2", "bigship_building_str3" },
	need_spawn_warp = true,

	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 1,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 0, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,
	
	turret_health_coef = 0.3,
	turret_damage_coef = 0.6,	--#79539
	
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
			player_spawn_group = 0,
			precache_defs = {
				"Turret_Team2_Pve_AiRailgun",
				"Turret_Team2_Pve_TowerStation",	
				"Ship_Bot_EasyEliteCommander_R1_T2",
				"Ship_BB1_Meat_R1_S_T2",
				"Ship_Bot_EasyElite_R2_M_T2",
				"Ship_Bot_BossEasy_Elite_R3_T5",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
			},
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_bigship_r1_rdesc", 
			start_sentence = "CMDR_BLACKWOOD_DEFENCE",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			modifiers =
			{
				{ spell = "Pve_BuffDamage",	caster_group = 1, }, -- 1 players team, AI team Pve_BuffDamage
				{ spell = "Pve_HealShield",	caster_group = 1, }, 
				{ spell = "Pve_HealHullEasy", caster_group = 1, },  
				
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 12,
				
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 99999999999999999999999999999999999999999999999, }, 
				},
			},
		},	
	},
}

PvE_Mission.nCurPhase = 0

function PvE_BSB_H:OnStart()

	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
	
	PvE_Mission.tId = {}
	local VitalPoints = {"VitalPoint_PVE_ControlStationA", "VitalPoint_PVE_ControlStationB", "VitalPoint_PVE_ControlStationC"}
	for _, VP_def in pairs( VitalPoints ) do 
		for _, def_id in pairs( GetEntitiesByDef( VP_def ) ) do 
			table.insert( PvE_Mission.tId, def_id )
		end
	end
	
	PvE_Mission.iWaveMobs 	= 27
	PvE_Mission.initMobs 	= 27
	PvE_Mission.iMaxMobs 	= 20
	PvE_Mission.iNeed2Boss 	= -1
	PvE_Mission.iNeed2Elite = 27
	PvE_Mission.try			= 1
	PvE_Mission.previousMobId = -1
	PvE_Mission.iKilled = 0
	PvE_Mission.waveCut = 
	{
		[ "iNeed2Boss" ] = 0,
		[ "iNeed2Elite" ] = 0,
		[ "iEventWave" ] = 0,
		[ "repairsGroup" ] = 0,
	}
	
	for i = 1, 3 do
		Entities[ "TowerStation"..i ]:SetDamageable( false )
		Entities[ "TowerStation"..i ]:ShowInHud( false )	
	end	
end	

PvE_Missions.bigship_building_easy.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_BSB_H:OnUpdate( dt )
end	

function PvE_BSB_H:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_BSB_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.bigship_building_easy.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.bigship_building_easy.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.bigship_building_easy.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.bigship_building_easy.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end