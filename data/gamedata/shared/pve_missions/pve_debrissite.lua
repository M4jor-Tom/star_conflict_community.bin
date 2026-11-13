--
PvE_Missions.pve_debrissite_t2 = 
{
	levelName = "empire_sirus_debrissite",
	scenario_description = { "pve_debrissite_str1", "pve_debrissite_str2", "pve_debrissite_str3" },
	need_spawn_warp = true,

	desc = "",
	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 4,  -- параметр для попадания в очередь.
	item_lvl = 20, -- параметр для начисления награды.
	rank_max = 9, -- параметр для выбора миссии на карте галактики.
	bot_difficulty = 1, -- параметр задающий сложность ботов.

	turret_health_coef = 1,
	turret_damage_coef = 1,
	
	rounds = 
	{
		[ 1 ] = 
	
		{
			type = "SABOTAGE",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 0,
			player_spawn_group = 1,
			
			uiRoundName = "pve_debrissite_r1_rname",
			uiRoundDesc = "pve_debrissite_r1_rdesc", 
			uiAnomalydDesc = "pve_debrissite_r1_adesc", 
			
			start_sentence = "CMDR_PVE_START_ROUND_BREACH",
			
			modifiers =
			{
				{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealShield_T2",	caster_group = 1, },
			},

			sabotage_list = { "Tower1", "Tower2", "Tower3", "Tower4", },
			
			start_event = -- заполняется скриптом ниже
			{
			},

			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 8,
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 3, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 2, spawn_group = 4, spawn_warp = true, delay = 0 },
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 60 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 3, spawn_warp = true, delay = 60 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 60 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 60 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 60 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 3, spawn_warp = true, delay = 60 },
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 3, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 120 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 120 },
				},
				
			},
		},
		
		[ 2 ] = -- 36
				{
			type = "TRANSPORT_ATTACK",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 1,
			player_spawn_group = 2,
		
			uiRoundName = "pve_debrissite_r2_rname",
			uiRoundDesc = "pve_debrissite_r2_rdesc", 
			uiAnomalydDesc = "pve_debrissite_r2_adesc", 
			
			start_sentence = "CMDR_PVE_START_ROUND_JERICHO_TRANSPORT",		
			
			modifiers =
			{
				{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealShield_T2",	caster_group = 1, },
			},

			start_event = -- заполняется скриптом ниже
			{
			},
			
			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 16,	
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 5, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 0 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 3, spawn_group = 3, spawn_warp = true, delay = 0 },
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 90 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 3, spawn_warp = true, delay = 90 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 90 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 90 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 90 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 3, spawn_warp = true, delay = 90 },
					
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 180 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 4, spawn_warp = true, delay = 180 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 180 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 180 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 3, spawn_warp = true, delay = 180 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 180 },

					{	def = "Ship_Bot_Debrissite_L_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 240 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 240 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 4, spawn_group = 0, spawn_warp = true, delay = 240 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 2, spawn_group = 4, spawn_warp = true, delay = 240 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 2, spawn_group = 5, spawn_warp = true, delay = 240 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 4, spawn_group = 3, spawn_warp = true, delay = 240 },
				},
			},

			
			transport_to_fail = 3,  
			transport = 
			{
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 0, warp_in_effect = true, warp_out_effect = true, },
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 15, warp_in_effect = true, warp_out_effect = true, },
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 25, warp_in_effect = true, warp_out_effect = true, },
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 115, warp_in_effect = true, warp_out_effect = true, },
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 125, warp_in_effect = true, warp_out_effect = true, },
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 135, warp_in_effect = true, warp_out_effect = true, },				
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 140, warp_in_effect = true, warp_out_effect = true, },				
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 145, warp_in_effect = true, warp_out_effect = true, },				
				{	def = "CargoShipTeam2_Debrissite_T2", path = "transport_path_pve1", delay = 150, warp_in_effect = true, warp_out_effect = true, },				
			},
		},
		
		[ 3 ] = 
	
		{
			type = "SABOTAGE",
			exp_reward_portion = 2,
			cred_reward_portion = 2,
			loot_attempts_reward = 2,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			player_spawn_group = 3,
			
			uiRoundName = "pve_debrissite_r3_rname",
			uiRoundDesc = "pve_debrissite_r3_rdesc", 
			uiAnomalydDesc = "pve_debrissite_r3_adesc",
			
			start_sentence = "CMDR_PVE_START_ROUND_BREACH",
			
			sabotage_list = {},

			modifiers =
			{
				{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealShield_T2",	caster_group = 1, },
			},

			start_event = -- заполняется скриптом ниже
			{
			},
			
			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 16,	
					
					{	def = "Ship_Bot_Debrissite_L_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 0, repeat_time = 70 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 0, spawn_warp = true, delay = 0, repeat_time = 60 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 2, spawn_group = 0, spawn_warp = true, delay = 0, repeat_time = 80 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 3, spawn_group = 0, spawn_warp = true, delay = 0, repeat_time = 60 },
					
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 0, repeat_time = 60 },
					{	def = "Ship_Bot_Debrissite_L_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 0, repeat_time = 80 },
					{	def = "Ship_Bot_Debrissite_M_T2", count = 1, spawn_group = 4, spawn_warp = true, delay = 0, repeat_time = 70 },
					{	def = "Ship_Bot_Debrissite_CM_T2", count = 2, spawn_group = 5, spawn_warp = true, delay = 0, repeat_time = 80 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 2, spawn_group = 3, spawn_warp = true, delay = 0, repeat_time = 70 },
					{	def = "Ship_Bot_Debrissite_S_T2", count = 1, spawn_group = 5, spawn_warp = true, delay = 0, repeat_time = 60 },
				},
			},
		},
		
	}	
}

-- заполнение начальных установок раундов
function insert_events( aTable, cTarget, nCount, cAction )
	for i = 1, nCount do
		table.insert( aTable, { target = cTarget..i, action = cAction } )
	end
end

local nTurretCount = 17
local nGeneratorCount = 5	-- всего х2
local nBombCount = 10	-- всего х2

insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "Platform_Build",		 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "Turret_Build",		 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "EntityBuilderTrigger", nTurretCount,	 "DeactivateTrigger" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "Bomb",				 nBombCount*2,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "BombBuild",			 nBombCount*2,	 "FullDeactivate" )

insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Tower",				 4,				 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Platform",			 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Platform_Build",		 nTurretCount,	 "FullActivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Turret",				 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Turret_Build",		 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "EntityBuilderTrigger", nTurretCount,	 "ActivateTrigger" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[2].start_event, "Generator",			 nGeneratorCount*2, "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "Bomb",				 nBombCount*2,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "BombBuild",			 nBombCount*2,	 "FullDeactivate" )

insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Tower",				 4,				 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Platform",			 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Platform_Build",		 nTurretCount,	 "FullActivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Turret",				 nTurretCount,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Turret_Build",		 nTurretCount,	 "DisableAi" )	-- не срабатывает, по крайней мере на вновь построенные
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "EntityBuilderTrigger", nTurretCount,	 "DeactivateTrigger" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, "Generator",			 nGeneratorCount*2,			 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "Bomb",				 nBombCount*2,	 "FullDeactivate" )
insert_events( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, "BombBuild",			 nBombCount*2,	 "FullDeactivate" )

-- выбираем рандомно из пары взаимозаменяемых генераторов, какой будет целью, второй прячем сразу
local nTarget
local nRemove
for i = 1, nGeneratorCount do
	if math.random() < 0.5 then
		nTarget = i*2-1
		nRemove = i*2
	else
		nTarget = i*2
		nRemove = i*2-1
	end
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[1].sabotage_list, "Generator"..nTarget)
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[1].start_event, { target = "Generator"..nRemove, action = "FullDeactivate" })
end

-- выбираем рандомно из пары взаимозаменяемых ящиков, какой будет целью, второй прячем сразу
for i = 1, nBombCount do
	if math.random() < 0.5 then
		nTarget = i*2-1
		nRemove = i*2
	else
		nTarget = i*2
		nRemove = i*2-1
	end
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[3].sabotage_list, "Bomb"..nTarget)
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, { target = "Bomb"..nTarget, action = "FullActivate" })
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, { target = "Bomb"..nRemove, action = "FullDeactivate" })
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, { target = "BombBuilderTrigger"..nTarget, action = "ActivateTrigger" })
	table.insert( PvE_Missions.pve_debrissite_t2.rounds[3].start_event, { target = "BombBuilderTrigger"..nRemove, action = "DeactivateTrigger" })
end

