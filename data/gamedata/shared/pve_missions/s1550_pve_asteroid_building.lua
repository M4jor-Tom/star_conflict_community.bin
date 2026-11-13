PvE_AB_H = {}

PvE_AB_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "pve_briggs", "pve_asteroid_building_destroy_turrets" },
				},
				sTargetDef	= { "Turret_Team2_Pve_Void_T3_RocketGun", }, -- целевой деф для уничтожения
				tCount		= 9,
				nRoundPhase	= 1,
				PossibleEvents= {},
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "SpaceShield_Gen" ]:SetDamageable( true )
						Entities[ "SpaceShield_Gen" ]:ShowInHud( true )
				end,	
				},
			},
		[ 2 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "pve_briggs", "pve_asteroid_building_deactivate_generators" },
				},
				specificDef	= "PvE_Gen_VitalGenerator",
				count		= 3,
				nRoundPhase	= 2,
					
				additionalFunc = {
					Func = function( self, curPhase )
						local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret" )
						for i, turId in pairs( mainTur ) do
							Entities[ turId ]:Stop()
						end
					end
				},		
			},
		[ 3 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "pve_briggs", "pve_asteroid_building_kill_all1" },
				},		
				nRoundPhase	= 3,	
				waves = 
				{				
					{	def = "Ship_Bot_XLow_R1_S_T3", count = 2, delay = 0, },
					{	def = "Ship_Bot_XMiddle_R3_S_T4", count = 2, delay = 5, },
					{	def = "Ship_Bot_XMiddle_R1_M_T3", count = 2, delay = 10, },
					{	def = "Ship_Bot_XHigh_R1_M_T4", count = 2, delay = 15, },

					{	def = "Ship_Bot_XLow_R1_S_T3", count = 2, delay = 30, },
					{	def = "Ship_Bot_XMiddle_R1_M_T3", count = 2, delay = 5, },
					{	def = "Ship_Bot_XHigh_R1_M_T4", count = 1, delay = 8, },
					{	def = "Ship_Bot_XHigh_R3_L_T3", count = 1, delay = 10, },

					{	def = "Ship_Bot_XLow_R1_S_T3", count = 2, delay = 30, },
					{	def = "Ship_Bot_XMiddle_R3_S_T4", count = 2, delay = 10, },
					{	def = "Ship_Bot_XMiddle_R1_M_T3", count = 1, delay = 10, },
					
					{	def = "Ship_Bot_XMiddle_R3_S_T4", count = 2, delay = 30, },
					{	def = "Ship_Bot_XMiddle_R1_M_T3", count = 2, delay = 5, },
					{	def = "Ship_Bot_XHigh_R1_M_T4", count = 1, delay = 10, },
					{	def = "Ship_Bot_XHigh_R3_L_T3", count = 1, delay = 0, },	
				},	
			},
		[ 4 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				nRoundPhase	= 4,	
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "pve_briggs", "pve_asteroid_building_kill_all2" },
				},		
				waves = 
				{						
					{	def = "Ship_Bot_XHigh_R3_L_T3", count = 1, delay = 5, },				
					{	def = "Ship_Bot_XHigh_R1_M_T4", count = 2, delay = 20, },	
					{	def = "Ship_Bot_XHigh_R1_L_T3", count = 1, delay = 15, }, 				
					{	def = "Ship_Race2_XbossT5", count = 1, delay = 25, },
				},	
			},			
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Wmiddle_R1_M_T1", "Ship_Bot_Wmiddle_R3_S_T1", "Ship_Bot_Wlow_R1_S_T1" },	
			MeatBots_t2 = {},
			EliteBots = { "Ship_Bot_Whigh_R1_M_T1", "Ship_Bot_Whigh_R3_L_T1" },	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Wmiddle_R1_M_T1", "Ship_Bot_Wmiddle_R3_S_T1", "Ship_Bot_Wlow_R1_S_T1" },	
			MeatBots_t2 = {},
			EliteBots = { "Ship_Bot_Whigh_R1_M_T1", "Ship_Bot_Whigh_R3_L_T1" },	
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
			MeatBots_t1 = {},	
			MeatBots_t2 = {},
			EliteBots = {},	
			Executor = {}, 
		}		
	},
}


PvE_Missions.asteroid_building_t1 = 
{
	levelName = "s1550_pve_asteroid_building",
	scenario_description = { "asteroid_building_str1", "asteroid_building_str2", "asteroid_building_str3" },
	need_spawn_warp = true,
	desc = "",
	resurrection_attempts = 5,
	item_lvl  = 10,
	accountRank = 7,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 0, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,
	turret_health_coef = 0.6,	--#79539
	
	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	event_loot_attempts = 3,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Bot_Wmiddle_R1_M_T1",
				"Ship_Bot_Wmiddle_R3_S_T1",
				"Ship_Bot_Wlow_R1_S_T1",
				"Ship_Bot_Whigh_R1_M_T1",
				"Ship_Bot_WHigh_R3_L_T3",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"Ship_Bot_XLow_R1_S_T3",
				"Ship_Bot_XMiddle_R3_S_T4",
				"Ship_Bot_XMiddle_R1_M_T3",
				"Ship_Bot_XHigh_R1_M_T4",
				"Ship_Bot_XHigh_R3_L_T3",
				"Ship_Bot_XHigh_R1_L_T3",
				"Ship_Race2_XbossT5",		
			},
			exp_reward_portion = 2,
			cred_reward_portion = 2,
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_asteroid_r1_rdesc", 
			start_sentence = "CMDR_PVE_START_ROUND_SABOTAGE",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			modifiers =
			{
				{ spell = "Pve_HealShield",	caster_group = 1, },
				{ spell = "Pve_HealHullEasy",	caster_group = 1, },
				{ spell = "Pve_HullResist_Thermal",	caster_group = 1, }, -- чтобы туррели ракетные не делать отдельные + скрипт их подмены
			},
			
			sabotage_list = { "RocketGun1", "RocketGun2", "RocketGun3", "RocketGun4", "RocketGun5", "RocketGun6", "RocketGun7", "RocketGun8", "RocketGun9",},

			start_event = 
			{
			},
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
            },
			
			waves =
			{
				[ 1 ] = -- 25
				{
						max_agents_at_same_time = 12,
					{	def = "Ship_Bot_Wmiddle_R1_M_T1", count = 1, spawn_group = 13, spawn_warp = true, delay = 999999999999999999999999999999999, }, 	
				},
			},
		},
	},
}

PvE_Mission.nCurPhase = 0

PvE_Missions.asteroid_building_t1.rounds[1].SV_OnUpdateRound = function ( self, dt, curPhase )
	return PvE_AB_H:OnUpdate( dt )
end

function PvE_AB_H:OnStart()
	
	Entities[ "SpaceShield_Gen" ]:ShowInHud( false )
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600

end

function PvE_AB_H:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_AB_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.asteroid_building_t1.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.asteroid_building_t1.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.asteroid_building_t1.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.asteroid_building_t1.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end