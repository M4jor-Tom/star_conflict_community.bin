-- Базовые группы геймплеев (исп-ся для ограничений в контрактах/ачивментах/медалях/аккаунт-аурах)
ai.GameplayGroups =
{
    pvp =
    {
		ai.Gameplay.CAPTURE_THE_BASE,
        ai.Gameplay.CAPTURE_THE_BASE_2, -- 23
        ai.Gameplay.CONTROL,
        ai.Gameplay.BOMB_THE_BASE,      -- 3
        ai.Gameplay.KING_OF_THE_HILL, 
        ai.Gameplay.TDM,
        ai.Gameplay.LAST_MAN_STANDING,
        ai.Gameplay.CAPTURE_THE_FRAG,
        ai.Gameplay.CAPTURE_THE_FLAG,
        ai.Gameplay.PVP_MISSION,
    },

    pve =
    {
        ai.Gameplay.PVE_MISSION,
    },

    non_open_world =
    {
        ai.Gameplay.CAPTURE_THE_BASE,
        ai.Gameplay.CAPTURE_THE_BASE_2,
        ai.Gameplay.CONTROL,
        ai.Gameplay.SENTINEL,
        ai.Gameplay.BOMB_THE_BASE,
        ai.Gameplay.KING_OF_THE_HILL,
        ai.Gameplay.PVE_MISSION,
        ai.Gameplay.TDM,
        ai.Gameplay.GTDM,
        ai.Gameplay.LAST_MAN_STANDING,
        ai.Gameplay.CAPTURE_THE_FRAG,
        ai.Gameplay.CAPTURE_THE_FLAG,
        ai.Gameplay.FOOTBALL,
		ai.Gameplay.HUNGER_GAMES,
		ai.Gameplay.ONE_AGAINST_ALL,
		ai.Gameplay.ATDM,
		ai.Gameplay.ZOMBIE,
		ai.Gameplay.AUTOGEN_DM,
		ai.Gameplay.CLOSE_DISTANCE,
		ai.Gameplay.THREE_TEAMS_DM,
		ai.Gameplay.APRIL_CONTROL,
		ai.Gameplay.BATTLE_ROYALE,
    },
	
    non_open_world_or_fast =
    {
        ai.Gameplay.CAPTURE_THE_BASE,
        ai.Gameplay.CAPTURE_THE_BASE_2,
        ai.Gameplay.CONTROL,
        ai.Gameplay.SENTINEL,
        ai.Gameplay.BOMB_THE_BASE,
        ai.Gameplay.KING_OF_THE_HILL,
        ai.Gameplay.PVE_MISSION,
        ai.Gameplay.TDM,
        ai.Gameplay.GTDM,
        ai.Gameplay.LAST_MAN_STANDING,
        ai.Gameplay.CAPTURE_THE_FRAG,
        ai.Gameplay.CAPTURE_THE_FLAG,
        ai.Gameplay.FOOTBALL,
		ai.Gameplay.HUNGER_GAMES,
		ai.Gameplay.ONE_AGAINST_ALL,
		ai.Gameplay.ZOMBIE,
		ai.Gameplay.AUTOGEN_DM,
		ai.Gameplay.CLOSE_DISTANCE,
		ai.Gameplay.THREE_TEAMS_DM,
		ai.Gameplay.APRIL_CONTROL,
		ai.Gameplay.BATTLE_ROYALE,
    },

    brawl =
    {
        ai.Gameplay.FOOTBALL,
        ai.Gameplay.CAPTURE_THE_BASE,
        ai.Gameplay.SENTINEL,
        ai.Gameplay.GTDM,
		ai.Gameplay.HUNGER_GAMES,
		ai.Gameplay.ONE_AGAINST_ALL,
		ai.Gameplay.ATDM,
		ai.Gameplay.ZOMBIE,
		ai.Gameplay.CLOSE_DISTANCE,
		ai.Gameplay.AUTOGEN_DM,
		ai.Gameplay.THREE_TEAMS_DM,
		ai.Gameplay.APRIL_CONTROL,
		ai.Gameplay.BATTLE_ROYALE,
    },
	
	april =
	{
		ai.Gameplay.ATDM,
		ai.Gameplay.APRIL_CONTROL,
	}
}


-- Расчет вознаграждения за бой
-- 1. Расчитываем iLvl_Ships - среднее значение iLvl кораблей, которые были в бою, т.е. хотя бы раз спаунились на карте.
-- 2. Определяем значение cred_reward в зависимости от исхода битвы ( cred_reward_win или cred_reward_loss )
-- 3. Серебро_базовое = cred_reward * ( cred_reward_power_coeff_a * iLvl_Ships + cred_reward_power_coeff_b ) * ( среднее арифметическое от ( 1 + silverbonus ) выведенных в бой кораблей )
-- 4. Фиксируем AVp - количество очков эффективности игрока
-- 5. Вычисляем AV - среднее арифметическое эффективностей всех игроков команды игрока.
-- 6. Серебро_итоговое = Серебро_базовое * ( cred_reward_guaranteed_reward + ( 1 - cred_reward_guaranteed_reward ) * sqrt ( AVp / AV ) )
-- 7. Серебро_итоговое_бонусное = Серебро_итоговое * ( бонусы от бустеров + бонусы от аур + другие возможные бонусы )
-- 8. Серебро_итоговое_премиум = ( Серебро_итоговое + Серебро_итоговое_бонусное ) * ( премиум бонус )
-- 9. Серебро_финальное = Серебро_итоговое + Серебро_итоговое_бонусное + Серебро_итоговое_премиум
-- 10. Если игрок выходит из игры по каким-то причинам (дисконнект, лив и т.д.) значение в п.2 не расчитывать.
local cred_reward_win               = 20000 -- игрок должен получать 50к за победу в начале, 150 за победу в конце без точек с премом (16.7 - 26.2).
local cred_reward_loss              = 15000 -- игрок должен получать 30к за поражение в начале, 90 за поражение в конце без точек с премом.
local cred_reward_power_coeff_a     = 0.275
local cred_reward_power_coeff_b     = -3.34
local cred_reward_guaranteed_reward = 0.7

local pve_cred_reward_win               = 45000
local pve_cred_reward_loss              = 30000
local pve_cred_reward_power_coeff_a     = 0.1
local pve_cred_reward_power_coeff_b     = 0
local pve_cred_reward_guaranteed_reward = 0.7

local zm_cred_reward_win               = 200000 -- игрок должен получать 50к за победу в начале, 150 за победу в конце без точек с премом (16.7 - 26.2).
local zm_cred_reward_loss              = 150000 -- игрок должен получать 30к за поражение в начале, 90 за поражение в конце без точек с премом.
local zm_cred_reward_power_coeff_a     = 0.275
local zm_cred_reward_power_coeff_b     = -3.34
local zm_cred_reward_guaranteed_reward = 0.7

local dm_cred_reward_win               = 200000 
local dm_cred_reward_loss              = 150000
local dm_cred_reward_power_coeff_a     = 0.275
local dm_cred_reward_power_coeff_b     = -3.34
local dm_cred_reward_guaranteed_reward = 0.4

local ttdm_cred_reward_win               = 45000 -- игрок должен получать 50к за победу в начале, 150 за победу в конце без точек с премом (16.7 - 26.2).
local ttdm_cred_reward_loss              = 30000 -- игрок должен получать 30к за поражение в начале, 90 за поражение в конце без точек с премом.
local ttdm_cred_reward_power_coeff_a     = 0.275
local ttdm_cred_reward_power_coeff_b     = -3.34
local ttdm_cred_reward_guaranteed_reward = 0.7

-- Диапазон итем левелов, по которому определяется возможный лут:
local loot_spots_shown                          = 8 -- кол-во точек, показываемых на экране лута
local loot_attempts_win                         = 4 -- кол-во попыток при выигрыше
local loot_attempts_loose                       = 2 -- кол-во попыток при поражении
local loot_attempts_premium_bonus               = 2 -- кол-во доп. попыток для премиума
local loot_attempts_assured_drop                = 1 -- кол-во попыток с гарантированным дропом (входит в loot_attempts или loot_attempts_premium_bonus)
local coop_vs_ai_loot_attempts_win              = 3
local coop_vs_ai_loot_attempts_loose            = 1
local coop_vs_ai_loot_attempts_premium_bonus    = 2
local coop_vs_ai_loot_attempts_assured_drop     = 1
local coop_vs_ai_exp_reward_coef                = 0.75
local coop_vs_ai_cred_reward_coef               = 0.9


-- this table used in prepare shared data to set bonus to quests and other game entities
GlobalGameSettings = 
{
    premium_cred_bonus      = 1.0,
    premium_exp_bonus       = 1.0,
    premium_rep_bonus       = 0.5,
    premium_resource_bonus  = 0.5,
}
local premium_cred_bonus      = GlobalGameSettings.premium_cred_bonus
local premium_exp_bonus       = GlobalGameSettings.premium_exp_bonus
local premium_rep_bonus       = GlobalGameSettings.premium_rep_bonus
local premium_resource_bonus  = GlobalGameSettings.premium_resource_bonus

local game_duration_tournament = 8 * 60 --- 10 * 60


-- настройки компенсирующих баффов  --#66975
RankBuff ={}
sys.execscript( 'gamedata/def/ex/rank_buffs.lua' )
BuffByRank = {}
for i,v in pairs( RankBuff ) do
	if v.max_rank and v.children and #v.children > 0 then 
		BuffByRank[ v.max_rank ] = {}
		local last_spell = nil
		for j, spell in pairs( v.children ) do
			BuffByRank[ v.max_rank ][ v.max_rank - j + 1 ] = spell
			last_spell = spell
		end
		for j = 1, v.max_rank do 
			if j < v.max_rank and last_spell and not BuffByRank[ v.max_rank ][ j ] then 
				BuffByRank[ v.max_rank ][ j ] = last_spell
			end
		end
	end
end
if RankBuff["PVE_15"] then 
	BuffByRankPVE = {}
	for i = 2, 17 do
		BuffByRankPVE[i] = {}
		for j, spell in pairs( RankBuff["PVE_15"].children ) do
			BuffByRankPVE[ i ][ 16 - j + 1 ] = spell
		end
	end
end
NoobScaleSpells = {}
for i = 1, 10 do 
	NoobScaleSpells[ i ] = "TestKPMNormalizer_".. tostring( i )
end
RankBuff = nil



GameplayDef = {}

GameplayDef[ ai.Gameplay.SPACE_BATTLE ] =
{
	special_loot_tables_coop		= {"RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_9_10","RareRanks_9_10","RareRanks_11_12","RareRanks_11_12","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15"},
	special_loot_tables				= {"RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_7_8","RareRanks_9_10","RareRanks_9_10","RareRanks_11_12","RareRanks_11_12","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15","RareRanks_13_15"},

	rank_scale_spells = BuffByRank,
	noob_scale_spells = NoobScaleSpells,
	consider_battle_rank_to_choose_talents = true,

	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef,
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	add_bots_delay_arcade			= 5, -- Время, после которого добираются в игру боты 53812#c221399
	countdown_duration				= 10,
	first_spawn_delay				= 12, -- участвует только на 1 спавне, не требует настроек!!!1
	game_duration					= 720,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	spawn_time_penalty_per_death	= 3,
	spawn_time_penalty_reset_period	= 90,
	max_ship_rank_diff 				= {18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,}, --#72260 -- НО правило "везде 3" пока не меняем до матча про мачмекер

    -- опыт корабля или синергия
    exp_reward_kill			= 65,   -- При факте кила врага - полное значение exp_reward_kill
    exp_reward_assist_damage= 26,   --  При смерти врага, если был по нему прямой дамаг, полное значение exp_reward_assist_damage
    exp_reward_damage 		= 104,  -- за нанесенный дамаг даем скалированный exp_reward_damage.
    exp_reward_assist_debuff= 26,
    exp_reward_assist_buff	= 26,
    exp_reward_vp_capture	= 365,  -- опыт за захват VitalPoint'а (единоразово в конце захвата)
    exp_reward_win			= 650,
    exp_reward_loss			= 260,
    exp_reward_drone_kill   = 13,
    exp_reward_drone_assist = 7,
    exp_reward_drone_damage = 13,
    exp_reward_assist_heal	= 26,
    exp_reward_drone_heal 	= 7,
    exp_reward_heal 		= 13,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	--"эффективность в бою"
	points_per_kill			= 30,   -- киллеру
	points_per_assist_damage= 120,  -- % от дамага 
	points_per_assist_debuff= 20,
	points_per_assist_buff	= 20,
	points_vp_capture		= 600,	-- "вклад" в победу за захват VitalPoint'а 
	points_per_drone_kill	= 5,
	points_per_drone_assist	= 10,
	points_per_assist_heal  = 80, --50, --SC-111552

	battlefield_leave_timeout = 20.0,		-- время до того как игрока кикнет когда он вылетел за пределы поля боя

	ai_difficulty_medium_item_lvl	= 18,
	ai_difficulty_hard_item_lvl		= 22,	---19 #58972 
	bot_item_lvl_deviation			= 1.5,		-- #16541 для ботов выставляются корабли из наборов PreparedVessels того же item_lvl что игроки +-bot_item_lvl_deviation
	bot_presets						= PreparedVessels,

	-- Invasion in PvP
	squads =
	{
		{
			name = "Invasion",
			 relationship_group = ai.RelationshipGroups.Alien, -- На хелувин
			--relationship_group = ai.RelationshipGroups.Pirate, --На первое Апреля
			invasion_pvp = true,
			spawn_spot = { "invasion1", },
			squad_type = ai.AISquadType.SWAT,
			respawn_time = 900,
			members =
			{
	-- Хелувин Корабли чужих
				-- {
					-- { "Alien_T1" , Vec3( 0, 0, 0 ) },
					-- { "Alien_T1" , Vec3( 0, 20, 0 ) },
					-- { "Alien_T1" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Alien_T2" , Vec3( 0, 0, 0 ) },
					-- { "Alien_T2" , Vec3( 0, 20, 0 ) },
					-- { "Alien_T2" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Alien_T3" , Vec3( 0, 0, 0 ) },
					-- { "Alien_T3" , Vec3( 0, 20, 0 ) },
					-- { "Alien_T3" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Alien_T4" , Vec3( 0, 0, 0 ) },
					-- { "Alien_T4" , Vec3( 0, 20, 0 ) },
					-- { "Alien_T4" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Alien_T5" , Vec3( 0, 0, 0 ) },
					-- { "Alien_T5" , Vec3( 0, 20, 0 ) },
					-- { "Alien_T5" , Vec3( 0, 0, 20 ) },
				-- },			
	-- Первое апреля Бумажные корабли
				{
					{ "PapershipS_T5" , Vec3( 0, 0, 0 ) },
					{ "PapershipS_T5" , Vec3( 0, 20, 0 ) },
					{ "PapershipM_T5" , Vec3( 0, 0, 20 ) },
					{ "PapershipM_T5" , Vec3( 20, 0, 0 ) },
					{ "PapershipL_T5" , Vec3( 0, 0, -20 ) },
				},
								{
					{ "PapershipS_T5" , Vec3( 0, 0, 0 ) },
					{ "PapershipS_T5" , Vec3( 0, 20, 0 ) },
					{ "PapershipM_T5" , Vec3( 0, 0, 20 ) },
					{ "PapershipM_T5" , Vec3( 20, 0, 0 ) },
					{ "PapershipL_T5" , Vec3( 0, 0, -20 ) },
				},
								{
					{ "PapershipS_T5" , Vec3( 0, 0, 0 ) },
					{ "PapershipS_T5" , Vec3( 0, 20, 0 ) },
					{ "PapershipM_T5" , Vec3( 0, 0, 20 ) },
					{ "PapershipM_T5" , Vec3( 20, 0, 0 ) },
					{ "PapershipL_T5" , Vec3( 0, 0, -20 ) },
				},
								{
					{ "PapershipS_T5" , Vec3( 0, 0, 0 ) },
					{ "PapershipS_T5" , Vec3( 0, 20, 0 ) },
					{ "PapershipM_T5" , Vec3( 0, 0, 20 ) },
					{ "PapershipM_T5" , Vec3( 20, 0, 0 ) },
					{ "PapershipL_T5" , Vec3( 0, 0, -20 ) },
				},
								{
					{ "PapershipS_T5" , Vec3( 0, 0, 0 ) },
					{ "PapershipS_T5" , Vec3( 0, 20, 0 ) },
					{ "PapershipM_T5" , Vec3( 0, 0, 20 ) },
					{ "PapershipM_T5" , Vec3( 20, 0, 0 ) },
					{ "PapershipL_T5" , Vec3( 0, 0, -20 ) },
				},
			},
		},
		-- {
			-- name = "Invasion",
			-- relationship_group = ai.RelationshipGroups.Alien,
			-- invasion_pvp = true,
			-- spawn_spot = { "invasion1", },
			-- squad_type = ai.AISquadType.SWAT,
			-- respawn_time = 900,
			-- members =
			-- {
				-- {
					-- { "Ship_Gen_Meat_Silence_S" , Vec3( 0, 0, 0 ) },
					-- { "Ship_Pirate_Tank_M1_T1" , Vec3( 0, 20, 0 ) },
					-- { "Ship_Pirate_Debuff_M2_T1" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Ship_Gen_Meat_Silence_S" , Vec3( 0, 0, 0 ) },
					-- { "Ship_Pirate_Tank_M1_T2" , Vec3( 0, 20, 0 ) },
					-- { "Ship_Pirate_Debuff_M2_T2" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Ship_Pirate_Snip_M2_T3" , Vec3( 0, 0, 0 ) },
					-- { "Ship_Pirate_Tank_M1_T2" , Vec3( 0, 20, 0 ) },
					-- { "Ship_Pirate_Debuff_M2_T3" , Vec3( 0, 0, 20 ) },
				-- },
				-- {
					-- { "Ship_Pirate_Snip_M2_T3" , Vec3( 0, 0, 0 ) },
					-- { "Ship_Gen_Elite_Tackler_Invisible_M" , Vec3( 0, 20, 0 ) },
					-- { "Ship_Pirate_Debuff_M2_T3" , Vec3( 0, 0, 20 ) },
					-- { "Ship_Pirate_Gravity_M1_Elite_T3" , Vec3( 0, 0, -20 ) },
				-- },
				-- {  
					-- --{ "Ship_Pirate_Healer_M1_T3" , Vec3( 0, 0, 0 ) }, -- cлишком  живучий и 
					-- { "Ship_Gen_Meat_Silence_S" , Vec3( 0, 0, 0 ) },
					-- { "Ship_Gen_Elite_Tackler_Invisible_M" , Vec3( 0, 20, 0 ) },
					-- { "Ship_Pirate_Debuff_M2_T3" , Vec3( 0, 0, 20 ) }, 
					-- { "Ship_Pirate_Gravity_M1_Elite_T3" , Vec3( 0, 0, -20 ) },
					-- { "Ship_Pirate_Tank_M1_T3" , Vec3( 0, -20, 0 ) },
				-- },
			-- },
		-- },
	},
	
	invasion_min_players	= 1,
	invasion_item_levels	= { 18, 20, 22, 24, },
	invasion_time_base		= 120,
	invasion_time_deviation	= 60,
}


--"Захват маяков" 3х3 маяка, конечные корабли "Уничтожить все маяки или корабли противника"  корабли кончаются
local CAPTURE_THE_BASE_coefficient = 4  --SC-114719 обнаружилось что эффенктивности в минуту на этом геймплее в 3 раза меньше, решили пока давать награды в 2 раза больше. 19.08.2013
GameplayDef[ ai.Gameplay.CAPTURE_THE_BASE ] =
{
	rank_scale_spells	= ai.DONT_INHERIT,--GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells 	= ai.DONT_INHERIT,--GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, --0.6,
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore =  {15, 10, 10,},  
	jipSkilledDiffScoreMin =  {12, 8, 8,},  
			-- 7-15 ранги. Разница в счете - 10 фрагов.
			-- 5-7 ранги. Разница в счете - 10 фрагов
			-- 1-5 ранги. Разница в счете - 10 фрагов.

	jipDiffVitalPoint = {1, 1, 1,},
	jipSkilledDiffVitalPointMin =  {1, 1, 1,},

	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,
	special_loot_tables_brawl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	add_bots_delay_arcade	= 5,
	countdown_duration		= 25,
	first_spawn_delay		= 12,

	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,
	--spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,
	max_ship_rank_diff 				= {18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,}, --#72260

	max_game_duration_to_scale_reward = 7 * 60,
	game_duration			= 12 * 60,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	can_reuse_ships		= false, -- можно ли повторно вылетать на одном и том же корабле (по умолчанию true)
	max_spawns = 4,	-- максимальное количество вылетов на игрока (если 0, то неограничено; по умолчанию 0)

    --1000-1500 за бой примерно должно быть без премиума в мат ожидании. эти цифры без премиума
    exp_reward_kill             = 65 * CAPTURE_THE_BASE_coefficient, -- средний игрок должен убивать 2+  врага за бой 
    exp_reward_assist_damage    = 26 * CAPTURE_THE_BASE_coefficient ,
    exp_reward_damage           = 104 * CAPTURE_THE_BASE_coefficient ,
    exp_reward_assist_debuff    = 26 * CAPTURE_THE_BASE_coefficient,
    exp_reward_assist_buff      = 26 * CAPTURE_THE_BASE_coefficient,
    exp_reward_vp_capture       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture,  -- захват маяка. 365 SC-114049# убрал х2 добавил 2й тип награды
	exp_reward_vp_capture_participation = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * 2,  -- захват маяка. 365
	exp_reward_vp_heal_participation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * 2,--- SC-115117 максимальная награда в очках опыта за отхил маяка
    exp_reward_win              = 650,  -- * CAPTURE_THE_BASE_coefficient, --  
    exp_reward_loss             = 260 * 2,  -- * CAPTURE_THE_BASE_coefficient,
    exp_reward_drone_kill       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill  * 2,
    exp_reward_drone_assist     = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist  * 2,
    exp_reward_drone_damage     = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage  * 2,
    exp_reward_assist_heal      = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * CAPTURE_THE_BASE_coefficient,
    exp_reward_drone_heal       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * CAPTURE_THE_BASE_coefficient,
    exp_reward_heal             = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * CAPTURE_THE_BASE_coefficient,

	defend_bonus			= 2.5,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"

    cred_reward_win                         = cred_reward_win * CAPTURE_THE_BASE_coefficient, --SC-114719
    cred_reward_loss                        = cred_reward_loss * CAPTURE_THE_BASE_coefficient, --SC-114719
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,

    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill * 2, --SC-114719
	points_per_assist_damage	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage * 2,
	points_per_assist_debuff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff * 2,
	points_per_assist_buff		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff * 2,
	points_vp_capture		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.25, --SC-114049# убрал х2 добавил 2й тип награды
	points_vp_capture_participation		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.5,
	points_vp_heal_participation		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.5, --- SC-115117 максимальная награда в очках эффективности за отхил маяка

	points_per_drone_kill		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal * 2,

	pressure_vp_capture		= 400,	--500
	pressure_vp_defend		= 200,	--250
	pressure_per_duration	= 100,	-- 50 SC-114719

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}


-- "Четыре жизни" 3х3 маяка 4 жизни, можно выбирать корабли повторно  
-- очки растут вверх, выигрыш по маякам живым, если поровну то по очкам
GameplayDef[ ai.Gameplay.CAPTURE_THE_BASE_2 ] =
{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, --0.6,
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore =  {15, 10, 10,},
	jipSkilledDiffScoreMin =  {12, 8, 8,},
			-- 7-15 ранги. Разница в счете - 10 фрагов. gameLvl = 0
			-- 5-7 ранги. Разница в счете - 10 фрагов   gameLvl = 1
			-- 1-5 ранги. Разница в счете - 10 фрагов.  gameLvl = 2

	jipDiffVitalPoint = {1, 1, 1,},
	jipSkilledDiffVitalPointMin =  {1, 1, 1,},  

	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,
	special_loot_tables_brawl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	add_bots_delay_arcade	= 5,
	countdown_duration		= 10,
	first_spawn_delay		= 12,

	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,
	--spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,
	max_ship_rank_diff 				= {18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,}, --#72260

	game_duration			= 12 * 60,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	can_reuse_ships		= true, -- можно ли повторно вылетать на одном и том же корабле (по умолчанию true)
	max_spawns = 4,	-- максимальное количество вылетов на игрока (если 0, то неограничено; по умолчанию 0)
	
	--1000-1500 за бой примерно должно быть без премиума в мат ожидании. эти цифры без премиума
	exp_reward_kill			= 65 * CAPTURE_THE_BASE_coefficient, -- средний игрок должен убивать 2+  врага за бой 
	exp_reward_assist_damage	= 26 * CAPTURE_THE_BASE_coefficient ,
	exp_reward_damage 		= 104 * CAPTURE_THE_BASE_coefficient ,
	exp_reward_assist_debuff	= 26 * CAPTURE_THE_BASE_coefficient,
	exp_reward_assist_buff		= 26 * CAPTURE_THE_BASE_coefficient,
    exp_reward_vp_capture       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture,  -- захват маяка. 365 SC-114049# убрал х2 добавил 2й тип награды
	exp_reward_vp_capture_participation = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * 2,  -- захват маяка. 365
	exp_reward_vp_heal_participation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * 2,--- SC-115117 максимальная награда в очках опыта за отхил маяка
	exp_reward_win			= 650,  -- * CAPTURE_THE_BASE_coefficient, --  
	exp_reward_loss			= 260 * 2,  -- * CAPTURE_THE_BASE_coefficient,
	exp_reward_drone_kill   	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill  * 2,
	exp_reward_drone_assist 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist  * 2,
	exp_reward_drone_damage 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage  * 2,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * CAPTURE_THE_BASE_coefficient,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * CAPTURE_THE_BASE_coefficient,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * CAPTURE_THE_BASE_coefficient,

	defend_bonus			= 2.5,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"

    cred_reward_win                         = cred_reward_win * CAPTURE_THE_BASE_coefficient,
    cred_reward_loss                        = cred_reward_loss * CAPTURE_THE_BASE_coefficient,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill * 2,
	points_per_assist_damage	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage * 2,
	points_per_assist_debuff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff * 2,
	points_per_assist_buff		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff * 2,
	points_vp_capture		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.25, --SC-114049# убрал х2 добавил 2й тип награды
	points_vp_capture_participation		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.5,
	points_vp_heal_participation		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture *0.5, --- SC-115117 максимальная награда в очках эффективности за отхил маяка
	points_per_drone_kill		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal * 2,

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},

}



--"контроль", бой за 3 маяка
-- очки растут вниз 999 до 0, есть бонус очки за киллы и много маяков
GameplayDef[ ai.Gameplay.CONTROL ] = 
{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, --0.6,
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore =  { 270, 250, 150, },
	jipMinimumScore = { 500, 400, 300 }, -- если у какой то команды осталось очков меньше этого, то не закидываем в бой 
	jipSkilledDiffScoreMin =  { 200, 200, 125, },
	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	add_bots_delay_arcade					= 5,
	control_score_to_win					= { 999, 750, 500 }, -- 10-15, 5-10, 1-5,
	control_score_for_vitalpoint_per_second	= 1,
	control_score_for_kill					= 10,

	can_reuse_ships						= true,

	full_control_bonus						= 2.5,	-- бонус за контроль всех vitalpoint'ов (за каждый команда получит control_score_for_vitalpoint_per_second * full_control_bonus)

	countdown_duration				= 10,
	first_spawn_delay				= 12,
	game_duration					= { 12 * 60, 9 * 60, 6 * 60, }, -- 10-15, 5-10, 1-5,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606

	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,
	
	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_debuff= 26,
	exp_reward_assist_buff	= 26,
	exp_reward_vp_capture	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture / 2 * 1.3,  -- захват маяка.
	exp_reward_win			= 650,
	exp_reward_loss			= 260,
	exp_reward_drone_kill   = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
	exp_reward_drone_assist = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
	exp_reward_drone_damage = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_vp_capture		= 500,
	points_per_drone_kill	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
	defend_bonus			= 2.0,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl, --18
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl, --22

	bot_item_lvl_deviation			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}


--"Охота на маяк"
GameplayDef[ ai.Gameplay.KING_OF_THE_HILL ] = 
{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, --0.6,
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore 			= { 70, 50, 35 },
	jipMinimumScore 		= { 100, 75, 50 }, 
	jipSkilledDiffScoreMin 	= { 60, 40, 30 },
	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	hill_score_to_win				= { 200, 150, 100 },  -- сколько очков нужно набрать для победы, 140
	hill_score_per_second			= 1, 	-- сколько очков в секунду дает захваченный маяк
	hill_change_interval			= 70,	-- in seconds, через сколько секунд маяк перемещается, до этого было 80 

	can_reuse_ships						= true,
	full_control_bonus						= 2.5,	-- бонус за контроль всех vitalpoint'ов (за каждый команда получит control_score_for_vitalpoint_per_second * full_control_bonus)

	add_bots_delay_arcade			= 5,
	countdown_duration				= 10,
	first_spawn_delay				= 12,
	game_duration					= {12 * 60, 9 * 60, 6 * 60,}, --720, --420,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	
	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,	-- Это время плюсуется за каждую смерть 
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,  	-- если игрок не умирает в течении этого времени, то счетчик обнуляется.  
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,
	
	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_debuff= 26,
	exp_reward_assist_buff	= 26,
	exp_reward_vp_capture	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture / 2 * 1.3,  -- захват маяка.
	exp_reward_win			= 650,
	exp_reward_loss			= 260,
	exp_reward_drone_kill   = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
	exp_reward_drone_assist = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
	exp_reward_drone_damage = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_vp_capture		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture,
	points_per_drone_kill	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
	defend_bonus			= 2.0,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}


--"полигон"
GameplayDef[ ai.Gameplay.PRACTICE ] =
{
	control_score_to_win					= 200,
	control_score_for_vitalpoint_per_second	= 1,
	control_score_for_kill					= 10,
	--full_control_bonus						= 1.5,	-- бонус за контроль всех vitalpoint'ов (за каждый команда получит control_score_for_vitalpoint_per_second * full_control_bonus)

	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	countdown_duration				= 10,
	first_spawn_delay				= 12,
	spawn_time_penalty_per_death	= 0,
	game_duration					= 300,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606

	exp_reward_kill			= 10,
	exp_reward_assist_damage= 5,
	exp_reward_damage 		= 40,
	exp_reward_assist_debuff= 5,
	exp_reward_assist_buff	= 5,
	exp_reward_vp_capture	= 100,
	exp_reward_win			= 1000,
	exp_reward_loss			= 1000,
	exp_reward_drone_kill   = 5,
	exp_reward_drone_assist = 5,
	exp_reward_drone_damage = 10,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal,

    cred_reward_win                         = 0,
    cred_reward_loss                        = 0,
    cred_reward_power_coeff_a               = 0,
    cred_reward_power_coeff_b               = 0,
    cred_reward_guaranteed_reward           = 0,

    loot_spots_shown                        = 0,
    loot_attempts_win                       = 0,
    loot_attempts_loose                     = 0,
    loot_attempts_premium_bonus             = 0,
    loot_attempts_assured_drop              = 0,
    coop_vs_ai_loot_attempts_win            = 0,
    coop_vs_ai_loot_attempts_loose          = 0,
    coop_vs_ai_loot_attempts_premium_bonus  = 0,
    coop_vs_ai_loot_attempts_assured_drop   = 0,


	points_per_kill			= 30,
	points_per_assist_damage= 120,
	points_per_assist_debuff= 20,
	points_per_assist_buff	= 20,
	points_vp_capture		= 300,
	points_per_drone_kill	= 5,
	points_per_drone_assist	= 10,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

	bot_presets					= PracticeBotVessels,
}


--обучение
GameplayDef[ ai.Gameplay.TUTORIAL ] =
{
	need_spawn_warp 				= false,
	countdown_duration				= 10,
	first_spawn_delay				= 12,
	spawn_time_penalty_per_death	= 0,
	game_duration					= 600,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606

	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	exp_reward_kill			= 0,
	exp_reward_assist_damage= 0,
	exp_reward_assist_debuff= 0,
	exp_reward_assist_buff	= 0,
	exp_reward_vp_capture	= 0,
	exp_reward_win			= 0,
	exp_reward_loss			= 0,
	exp_reward_drone_kill   = 0,
	exp_reward_drone_assist = 0,
	exp_reward_drone_damage = 0,
	exp_reward_assist_heal	= 0,
	exp_reward_drone_heal 	= 0,
	exp_reward_heal 		= 0,

    cred_reward_win                         = 0,
    cred_reward_loss                        = 0,
    cred_reward_power_coeff_a               = 0,
    cred_reward_power_coeff_b               = 0,
    cred_reward_guaranteed_reward           = 0,

    loot_spots_shown                        = 0,
    loot_attempts_win                       = 0,
    loot_attempts_loose                     = 0,
    loot_attempts_premium_bonus             = 0,
    loot_attempts_assured_drop              = 0,
    coop_vs_ai_loot_attempts_win            = 0,
    coop_vs_ai_loot_attempts_loose          = 0,
    coop_vs_ai_loot_attempts_premium_bonus  = 0,
    coop_vs_ai_loot_attempts_assured_drop   = 0,

	points_per_kill			= 0,
	points_per_assist_damage= 0,
	points_per_assist_debuff= 0,
	points_per_assist_buff	= 0,

	points_vp_capture		= 0,
	points_per_drone_kill	= 0,
	points_per_drone_assist	= 0,
	points_per_assist_heal  = 0,

	bot_presets					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,
	
	designator_beam_fx		= "particles/other/tutorial_arrow",
	
	missions = 
	{
		tutorial_leviathan = "basic_controls",
		s1550_tutorial2 = "basic_battle_system",
	},
}



GameplayDef[ ai.Gameplay.PVE_MISSION ] =
{
    -- прописано в каждой миссии, отсюда не берется. , но по факту работает поэтому тут коммент
    --rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,  
    --noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,

    need_spawn_warp     = false,
    time_between_waves  = 10, -- in seconds
    respawn_time        = 15, -- респавн игроков в начале "каждого раунда"

	-- those are NOT used by dedicated server when creating a match-maked game!
	missions =
	{
		pve_wave_nalnifan_gate_lumen = { "nalnifan_lumen_waves_T1" },
		pve_desttown = { "pve_desttown_waves_easy" },
		pve_transit_emp_rock_frontier = { "pve_empfrontier_waves_T1" },
		pve_rescue_pirates_base = { "rescue_pirates_base" },
		pve_magnificent_seven = { "magnificent_seven" },
		pve_stealth = { "stealth" },
		pve_wave_planet_war = { "planet_war_waves_T1" },
		s1550_pve_bigship_building = { "bigship_building_easy" },
		s1550_pve_bigship_building_2 = { "bigship_building_2_easy" },
		s1550_pve_asteroid_building = { "asteroid_building_t1" },
		s1550_pve_capture_repairbase = { "capture_repairbase_t1" }, 
		s1347_geostation = { "loot_geostation_normal" },
		s1515_piratebay = { "piratebay_hard" },
		pve_jericho_base = { "pve_jericho_base_t2" }, 
		pve_raid = { "pve_raid" },
		s8256_pve_raid_planetoid = { "pve_planetoidraid" },
		pve_raid_waterharvest = { "pve_raid_waterharvest_t4", "pve_raid_waterharvest_t3", "pve_raid_waterharvest_t5" },
		pve_frozen_station = { "pve_frozen_station_t2" },
		s1550_bigship_newbie_mission = { "bigship_newbie_mission" },
		pve_temple_of_last_hope = { "pve_temple_of_last_hope" },
		--sirius_debrissite_2 = { "sirius_debrissite_2_easy", "sirius_debrissite_2_normal", "sirius_debrissite_2_hard", },
		--empire_sirus_debrissite = { "pve_debrissite_t2" },
		--pve_dreadnought_defense = { "pve_dreadnought_defense_t2" },
		test_ai	= { "TestMission" },
	},

	countdown_duration				= 20,
	game_duration					= 60 * 20,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	
	max_game_duration_to_scale_reward = 5 * 60,

	exp_reward_kill			= 10,
	exp_reward_assist_damage= 5,
	--exp_reward_damage		= 5,
	exp_reward_assist_debuff= 1,
	exp_reward_assist_buff	= 1,
	exp_reward_vp_capture	= 100,
	exp_reward_win			= 1250, 
	exp_reward_loss			= 1100,
	exp_reward_drone_kill   = 0,
	exp_reward_drone_assist = 0,
	exp_reward_drone_damage = 0,
	exp_reward_assist_heal	= 1,
	exp_reward_drone_heal 	= 0,
	exp_reward_heal 		= 1,

    cred_reward_win                         = pve_cred_reward_win,
    cred_reward_loss                        = pve_cred_reward_loss,
    cred_reward_power_coeff_a               = pve_cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = pve_cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = pve_cred_reward_guaranteed_reward,

    loot_spots_shown                        = 10,
    loot_attempts                           = 0,
    loot_attempts_premium_bonus             = 2,
    loot_attempts_assured_drop              = 1,
    coop_vs_ai_loot_attempts                = 0,
    coop_vs_ai_loot_attempts_premium_bonus  = 2,
    coop_vs_ai_loot_attempts_assured_drop   = 1,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= 15,
	points_per_assist_damage= 5,
	points_per_assist_debuff= 5,
	points_per_assist_buff	= 5,
	points_vp_capture		= 100,
	points_per_drone_kill	= 0,
	points_per_drone_assist	= 0,
	points_per_assist_heal  = 0.5,

	bot_presets					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	--Miss Summer Event
	event_label_counts = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,},

	-- bomb params
	bomb_take_time					= 3,		-- in seconds
	bomb_take_points				= 1,

	bomb_detonation_blastwave		= "RW_Bomb_Blastwave",

	bomb_carrier_sound_take			= "sound/game/bomb_carrier_sound_take",
}


--капитан
local SENTINEL_time_coefficient = 1
GameplayDef[ ai.Gameplay.SENTINEL ] =
{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, 
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore 					=  {12, 10, 6,},
	jipSkilledDiffScoreMin 			=  {8, 6, 5,},
	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,
	special_loot_tables_brawl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	initial_period_duration			= {0, 0, 0,}, -- #63623 #65018 -- 200, 200, 120
	
	add_bots_delay_arcade			= 5,
	countdown_duration				= 20,
	first_spawn_delay				= 12,
	game_duration					= { 12 * 60, 9 * 60, 6 * 60,}, -- #41720 720  было
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	can_reuse_ships					= true,
	delay_before_leader_switch		= 15,
	
	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,	-- Это время плюсуется за каждую смерть 
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,  	-- если игрок не умирает в течении этого времени, то счетчик обнуляется.  
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,
	
	--1000-1500 за бой примерно должно быть без премиума в мат ожидании. эти цифры без премиума
	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_buff	= 26,
	exp_reward_win			= 650 * SENTINEL_time_coefficient, --  
	exp_reward_loss			= 260 * SENTINEL_time_coefficient,
	exp_sentinel_kill		= 650,
	exp_sentinel_kill_assist= 260,
	exp_sentinel_survived	= 975,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win * SENTINEL_time_coefficient,
    cred_reward_loss                        = cred_reward_loss * SENTINEL_time_coefficient,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_sentinel_kill			= 500,
	points_sentinel_kill_assist		= 200,
	points_sentinel_survived		= 750,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}


--Детонация 
GameplayDef[ ai.Gameplay.BOMB_THE_BASE ] =
{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	
	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, 
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,
	jipDiffScore 					= {1, 1, 1,},
	jipMaximumScore					= {1, 1, 1,}, -- если  у какой то команды  очков уже больше этого, то не закидываем в бой 
	jipSkilledDiffScoreMin 			= {1, 1, 1,},
	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	bomb_score_to_win				= 3,
	bomb_max_active					= 2,
	bomb_spawn_delay				= 60,
	
	bomb_first_spawn_delay			= 60,

	bomb_take_time					= 2,		-- in seconds
	--bomb_take_points				= 150,

	bomb_plant_time					= 6,		-- in seconds
	bomb_plant_points				= 600,

	bomb_carrier_kill_points		= 150,
	bomb_carrier_assist_points		= 100,

	bomb_detonation_blastwave		= "Gameplay_BombExplosion",

	bomb_carrier_sound_take			= "sound/game/bomb_carrier_sound_take",
	bomb_carrier_sound_plant		= "sound/game/bomb_carrier_sound_plant",

	can_reuse_ships				= true,

	add_bots_delay_arcade			= 5,
	countdown_duration				= 10,
	first_spawn_delay				= 12,
	game_duration					= { 12 * 60, 9 * 60,  6 * 60,}, -- #41720 720  было
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,	-- Это время плюсуется за каждую смерть 
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,  	-- если игрок не умирает в течении этого времени, то счетчик обнуляется.  	
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,

	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_debuff= 26,
	exp_reward_assist_buff	= 26,
	exp_reward_win			= 650,
	exp_reward_loss			= 260,
	bomb_plant_exp			= 390,
	bomb_take_exp			= 195,
	exp_bomb_carrier_kill	= 195,
	exp_bomb_carrier_kill_assist = 130,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}




--
GameplayDef[ ai.Gameplay.TDM ] =
{
	--player_vessels = { "Ship_Shooter_Damager", "Ship_Shooter_Healer", "Ship_Shooter_Sniper", "Ship_Shooter_Rogue", },

	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = true,
	jipDiffScore 				= { 10, 8, 5 },
	jipMinimumScore  			= { 12, 10, 6 }, -- если у какой то команды осталось очков меньше этого, то не закидываем в бой
	jipSkilledDiffScoreMin 		= { 8, 6, 4 },
	tdm_starting_points				= 20,
	tdm_starting_points_scaled = function (self, gameLvl)
		if gameLvl == 2 then
			return { 10,
				10, 10, 10, 10,  --4
				10, 10, 15, 15,  --8
				15, 15, 15, 15,  --12
				20, 20, 20, 20,  --16
				20, 20, 25, 25,  --20
				25, 25, 25, 25,  --24
				30, 30, 30, 30,  --28
				35, 35, 35, 35,  --32  
		}
		elseif gameLvl == 1  then
			return { 20,
				20, 20, 20, 20,  --4
				20, 20, 25, 25,  --8
				25, 25, 25, 25,  --12
				30, 30, 30, 30,  --16
				35, 35, 35, 35,  --20
				40, 40, 40, 40,  --24
				50, 50, 50, 50,  --28
				55, 55, 55, 55,  --32
		}
		elseif gameLvl == 0 then
			return { 25,
				25, 25, 25, 25,  --4
				25, 25, 30, 30,  --8
				35, 35, 35, 35,  --12
				40, 40, 40, 40,  --16
				45, 45, 45, 45,  --20
				50, 50, 50, 50,  --24
				60, 60, 60, 60,  --28
				65, 65, 65, 65,  --32
			}
		end
	end,

	coop_vs_ai_exp_reward_coef		= coop_vs_ai_exp_reward_coef, 
	coop_vs_ai_cred_reward_coef		= coop_vs_ai_cred_reward_coef,

	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,
	
	tdm_kill_score					= 1,
	respawn_kill_time				= 15,
	tdm_kill_score_respawn			= 1, -- решили отказаться от механики #84059 
	
	can_reuse_ships				= true,

	add_bots_delay_arcade			= 5,
	countdown_duration				= 10,
	first_spawn_delay				= 12,
	game_duration					= { 12 * 60, 9 * 60, 6 * 60, }, --420
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	
	spawn_time_penalty_per_death	= 0,	-- Это время плюсуется за каждую смерть 
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,  	-- если игрок не умирает в течении этого времени, то счетчик обнуляется.  	
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,

	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_debuff= 26,
	exp_reward_assist_buff	= 26,
	exp_reward_win			= 650,
	exp_reward_loss			= 260,
	exp_bomb_carrier_kill	= 190,
	exp_bomb_carrier_kill_assist = 130,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}

--
GameplayDef[ ai.Gameplay.GTDM ] = sys.new( GameplayDef[ ai.Gameplay.TDM ] )
GameplayDef[ ai.Gameplay.GTDM ].special_loot_tables_brawl = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables
----- Коэффициенты увеличения награды (введеня для потасовки "Стальные Шары" SC-120359) НАЧАЛО БЛОКА
-- GameplayDef[ ai.Gameplay.GTDM ].cred_reward_win = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_win * 5 -- в 5 раза увеличиваем награду в среднем на игрока за победу (без учета премиума)
-- GameplayDef[ ai.Gameplay.GTDM ].cred_reward_loss= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_loss* 3 -- в 3 раз увеличиваем награду в среднем на игрока за поражение (без учета премиума)
----- Коэффициенты увеличения награды (введеня для потасовки "Стальные Шары" SC-120359) КОНЕЦ БЛОКА
--GameplayDef[ ai.Gameplay.GTDM ].tdm_starting_points = 0 ---#66077 делаем точную копию - но с х3 уроном через ауру на карте и своим сообщением на входе (это текста)
GameplayDef[ ai.Gameplay.GTDM ].global_damage_coef = 1 -- коэффициент увеличеня урона ("стандартный" = 3; для "промо" = 1)
GameplayDef[ ai.Gameplay.GTDM ].jipDiffScore =  {15, 12, 6,}
GameplayDef[ ai.Gameplay.GTDM ].jipSkilledDiffScoreMin =  {13, 10, 5,}
GameplayDef[ ai.Gameplay.GTDM ].player_vessels = { --[["Ship1_GTDMBrawl", "Ship2_GTDMBrawl", "Ship3_GTDMBrawl", "Ship4_GTDMBrawl"]] "ShipH_GTDMBrawl", "ShipL_GTDMBrawl", "ShipM_GTDMBrawl", "ShipS_GTDMBrawl" }  -- фиксированные корабли для потасовки /// "стандартная" до AUT24 были "Ship1(/2/3/4)_GTDMBrawl"; "промо": "ShipS(/M/L/H)_GTDMBrawl"  ///  #97282
GameplayDef[ ai.Gameplay.GTDM ].disable_talents = true -- отключил импланты SC-116100

GameplayDef[ ai.Gameplay.ATDM ] = sys.new( GameplayDef[ ai.Gameplay.GTDM ] )
GameplayDef[ ai.Gameplay.ATDM ].player_vessels = { "Ship_Paperplane_Small", "Ship_Paperplane_Medium", "Ship_Paperplane_Large" }  -- фиксированные корабли для потасовки
GameplayDef[ ai.Gameplay.ATDM ].need_spawn_warp = false
GameplayDef[ ai.Gameplay.ATDM ].disable_talents = true
GameplayDef[ ai.Gameplay.ATDM ].spell_spawn_invulnerability = "SpawnWarpInvulnerabilityApril"

GameplayDef[ ai.Gameplay.PVP_MISSION ] = {
	need_spawn_warp 				= false,
	player_vessels 					= { "Ship_Close_S", "Ship_Close_M", "Ship_Close_L", },
	countdown_duration				= 3,
	first_spawn_delay				= 3, -- участвует только на 1 спавне, не требует настроек!!!1
	game_duration					= 600,
	--game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
-- не настраивалось  то что ниже!
	spawn_time_penalty_per_death	= 0,
	spawn_time_penalty_reset_period	= 1,
	max_ship_rank_diff 				= {18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,}, --#72260 -- НО правило "везде 3" пока не меняем до матча про мачмекер

	-- опыт корабля или синергия
	exp_reward_kill			= 50,   -- При факте кила врага - полное значение exp_reward_kill
	exp_reward_assist_damage= 20,   --  При смерти врага, если был по нему прямой дамаг, полное значение exp_reward_assist_damage
	exp_reward_damage 		= 80,   -- за нанесенный дамаг даем скалированный exp_reward_damage.
	exp_reward_assist_debuff= 20,
	exp_reward_assist_buff	= 20,
	exp_reward_vp_capture	= 300,	-- опыт за захват VitalPoint'а (единоразово в конце захвата)
	exp_reward_win			= 500,
	exp_reward_loss			= 200,
	exp_reward_drone_kill   = 10,
	exp_reward_drone_assist = 5,
	exp_reward_drone_damage = 10,
	exp_reward_assist_heal	= 20, --20,
	exp_reward_drone_heal 	= 5, --5,
	exp_reward_heal 		= 10, --10,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	--"эффективность в бою"
	points_per_kill			= 30,   -- киллеру
	points_per_assist_damage= 120,  -- % от дамага 
	points_per_assist_debuff= 20,
	points_per_assist_buff	= 20,
	points_vp_capture		= 600,	-- "вклад" в победу за захват VitalPoint'а 
	points_per_drone_kill	= 5,
	points_per_drone_assist	= 10,
	points_per_assist_heal  = 50, --20,

	battlefield_leave_timeout = 20.0,		-- время до того как игрока кикнет когда он вылетел за пределы поля боя

	ai_difficulty_medium_item_lvl	= 18,
	ai_difficulty_hard_item_lvl		= 22,	---19 #58972 
	bot_item_lvl_deviation			= 1.5,		-- #16541 для ботов выставляются корабли из наборов PreparedVessels того же item_lvl что игроки +-bot_item_lvl_deviation
	bot_presets						= PreparedVessels,

}

GameplayDef[ ai.Gameplay.FOOTBALL ] =
{
    player_vessels = { "Ship_Footballer", },

    goal_score_to_win = 5,
    disable_talents = true,
    need_spawn_warp = false,

    cred_reward_win                 = cred_reward_win,
    cred_reward_loss                = cred_reward_loss / 5,
    cred_reward_power_coeff_a       = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 3,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    --"эффективность в бою"
    points_per_ball_take = 10,
    points_per_goal = 500,

    --эффекты
    goal_effect1 = "particles/weapons/fireworks/football_firework1",
    goal_effect2 = "particles/weapons/fireworks/football_firework2",
    goal_effect3 = "particles/weapons/fireworks/football_firework3",
    goal_effect4 = "particles/weapons/fireworks/football_firework4",
    goal_effect5 = "particles/weapons/fireworks/football_firework5",
    bound_effect = "particles/materials/football_wall",
    max_distance_to_bound_effect = 30.0,
    goal_effect_sound = "sound/weapons/football/fb_explosion", 
    goal_sound = "sound/game/football_siren",
    countdown_sound = "sound/ui/FootballCount",

    goal_effect_delay_after_goal = 0.5,
    goal_effect_rate = 128.0, -- частота появления эффектов
    goal_effect_height_min = -110.0,
    goal_effect_height_max = 110.0,
    goal_effect_radius_min = 133.0,
    goal_effect_radius_max = 266.0,
}

GameplayDef[ ai.Gameplay.HUNGER_GAMES ] =
{
    rank_scale_spells = BuffByRank,
    noob_scale_spells = NoobScaleSpells,
    consider_battle_rank_to_choose_talents = true,

    can_reuse_ships = false,
    need_spawn_warp = false,
    countdown_sound = "sound/ui/FootballCount",
    countdown_duration = 20,
    max_spawns = 1,

    cred_reward_win                 = cred_reward_win,
    cred_reward_loss                = cred_reward_loss / 5,
    cred_reward_power_coeff_a       = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 3,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill                 = 200,
    exp_reward_assist_damage        = 100,
    exp_reward_damage               = 100,
    exp_reward_assist_debuff        = 20,
    exp_reward_assist_buff          = 20,
    exp_reward_win                  = 1000,
    exp_reward_loss                 = 200,
    exp_reward_drone_kill           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
    exp_reward_drone_assist         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
    exp_reward_drone_damage         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
    exp_reward_assist_heal          = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
    exp_reward_drone_heal           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
    exp_reward_heal                 = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
    points_per_kill                 = 200, -- киллеру
    points_per_assist_damage        = 100, -- % от дамага
    points_per_assist_debuff        = 20,
    points_per_assist_buff          = 20,
    points_per_drone_kill           = 5,
    points_per_drone_assist         = 10,
    points_per_assist_heal          = 50,
}

GameplayDef[ ai.Gameplay.BATTLE_ROYALE ] = {
	warehouse_vessels				= { "Ship_BR_Race3_M_T5_Craft", "Ship_BR_Race3_L_T5_Mole", "Ship_BR_Race1_S_T5_Herald",},
	--player_vessels					= { --[["Ship_BR_Level1",]] "Ship_BR_Singularity", "Ship_BR_Race3_L_T5_CraftUniq", "Ship_BR_Race1_S_T5_Herald", },
	max_spawns						= 1,
	can_reuse_ships					= true, -- чтобы можно было респавнить через ResurrectionBeacon

	disable_talents					= true,
	need_spawn_warp					= false,
	countdown_sound					= "sound/ui/FootballCount",
	wait_players_duration			= 60,
	warehouse_choise_time			= 5,
	countdown_duration				= 3,
	knockdown_time					= 60,
	can_be_resurrected				= 60,
	max_game_duration_to_scale_reward = 5 * 60,
	--first_spawn_delay				= 10,
	
	cred_reward_win                 = cred_reward_win,
    cred_reward_loss                = cred_reward_loss / 5,
    cred_reward_power_coeff_a       = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 3,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill                 = 200,
    exp_reward_assist_damage        = 100,
    exp_reward_damage               = 100,
    exp_reward_assist_debuff        = 20,
    exp_reward_assist_buff          = 20,
    exp_reward_win                  = 1000,
    exp_reward_loss                 = 200,
    exp_reward_drone_kill           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
    exp_reward_drone_assist         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
    exp_reward_drone_damage         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
    exp_reward_assist_heal          = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
    exp_reward_drone_heal           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
    exp_reward_heal                 = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
    points_per_kill                 = 200, -- киллеру
    points_per_assist_damage        = 100, -- % от дамага
    points_per_assist_debuff        = 20,
    points_per_assist_buff          = 20,
    points_per_drone_kill           = 5,
    points_per_drone_assist         = 10,
    points_per_assist_heal          = 50,
}

GameplayDef[ ai.Gameplay.ONE_AGAINST_ALL ] =
{
	rank_scale_spells	= BuffByRank, -- баффы игроков "под ранг"
	noob_scale_spells	= NoobScaleSpells, --
	boss_scale_spell	= "BossPassive_dynamic_AllBodyResistOAA", -- 15% хп за стак и 6% урона 
	--boss_scale_mods	= { 0,1,2,3,3,4,4,5,6,6,7,7,8,9,10,10,11,11,12,12,13,13,14,15,15,15,15,15,15 }, -- модификатор спела. Первый элемент соответствует одному игроку.
	boss_scale_mods		= { 0,0,0,0,0,0,0,0,1,2,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4 }, -- модификатор спела. Первый элемент соответствует одному игроку. 9-13 игроков, 11 оптимальное
	
	player_vessels		= { "Ship_Leviathan_S", "Ship_Leviathan_M", "Ship_Leviathan_L", "Ship_Leviathan_H", },
	can_reuse_ships		= false,
	max_spawns			= 1,
	disable_talents		= false,
	consider_battle_rank_to_choose_talents = true,
	need_spawn_warp		= false,
	countdown_sound		= "sound/ui/FootballCount",
	end_sound_playlist = "OneAgainstAll_final",
	end_sound_main_target_min_health_percent = 0.99,
	end_sound_boss_min_health_percent = 0.25,
	end_sound_min_players_percent = 0.25,	
    countdown_duration = 40,

    cred_reward_win                 = cred_reward_win,
    cred_reward_loss                = cred_reward_loss / 5,
    cred_reward_power_coeff_a       = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 3,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill                 = 200,
    exp_reward_assist_damage        = 100,
    exp_reward_damage               = 100,
    exp_reward_assist_debuff        = 20,
    exp_reward_assist_buff          = 20,
    exp_reward_win                  = 1000,
    exp_reward_loss                 = 200,
    exp_reward_drone_kill           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
    exp_reward_drone_assist         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
    exp_reward_drone_damage         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
    exp_reward_assist_heal          = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
    exp_reward_drone_heal           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
    exp_reward_heal                 = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
    points_per_kill                 = 200, -- киллеру
    points_per_assist_damage        = 100, -- % от дамага
    points_per_assist_debuff        = 20,
    points_per_assist_buff          = 20,
    points_per_drone_kill           = 5,
    points_per_drone_assist         = 10,
    points_per_assist_heal          = 50,
}

GameplayDef[ ai.Gameplay.ZOMBIE ] =
{
	player_vessels					= { "Ship_ZM_Humans", },
	zombie_vessels					= { "Ship_ZM_Aliens", },
	
	can_reuse_ships					= true,
	max_spawns						= 0,
	
	disable_talents					= true,

	need_spawn_warp					= false,
	
	first_zombie_delay				= 20,
	
	countdown_duration				= 10,
	game_duration					= 12 * 60,
	
	zombie_scale_spell				= "Spell_ZM_ZombieDynamicBuff",
	zombie_scale_mods				= { 20, 14, 8, 8, 4, 3, 3, 3, 2, 2, 1 }, -- Индекс = размер_массива * количество_зомби / количество_ всех_игроков.
	
	vp_game_duration_coefs			= { 0.85, 0.7 }, -- массив коэффициентов. Если один маяк захвачен, то время геймплея становится равным текущее время * на первый коэффициент. Если второй маяк захвачен, то время уменьшается в соответствии со вторым коэффициентом и т. д. Если коэффициента с необходимым индексом нет, то берется последний.
	
	zombie_cred_reward_win_fraction	= 0.4, -- коэффициент в формуле для вычисления награды для игрока, если он в выигравшей команде зомби: cred = cred_reward_loss + zombie_cred_reward_win_fraction * ( cred_reward_win - cred_reward_loss )
	max_game_duration_to_scale_reward = 5 * 60,

	vital_points_players_percent	= 0.5,
	vital_points_delay				= 4 * 60,

    cred_reward_win                 = zm_cred_reward_win,
    cred_reward_loss                = zm_cred_reward_loss / 5,
    cred_reward_power_coeff_a       = zm_cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = zm_cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = zm_cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 4,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,
	zombie_loot_attempts_win		= 2,
	zombie_loot_attempts_loose		= 1,
	

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill                 = 200,
    exp_reward_assist_damage        = 100,
    exp_reward_damage               = 100,
    exp_reward_assist_debuff        = 20,
    exp_reward_assist_buff          = 20,
    exp_reward_win                  = 1000,
    exp_reward_loss                 = 200,
    exp_reward_drone_kill           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
    exp_reward_drone_assist         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
    exp_reward_drone_damage         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
    exp_reward_assist_heal          = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
    exp_reward_drone_heal           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
    exp_reward_heal                 = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
    points_per_kill                 = 200, -- киллеру
    points_per_assist_damage        = 100, -- % от дамага
    points_per_assist_debuff        = 20,
    points_per_assist_buff          = 20,
    points_per_drone_kill           = 5,
    points_per_drone_assist         = 10,
    points_per_assist_heal          = 50,
	
	start_dialog = { portrait_id = "quest_character_broker_medium", name_text_id = "quest_character_broker_name_short", text_id = "pvp_zombie_start_dialog" },
	first_zombie_dialog = { portrait_id = "quest_character_broker_medium", name_text_id = "quest_character_broker_name_short", text_id = "pvp_zombie_first_zombie_dialog" },
	capture_points_dialog = { portrait_id = "quest_character_broker_medium", name_text_id = "quest_character_broker_name_short", text_id = "pvp_zombie_capture_points_dialog" },
	protect_points_dialog = { portrait_id = "quest_character_sch_crystallid_medium", name_text_id = "Alien_enforcer", text_id = "pvp_zombie_protect_points_dialog" },
}

GameplayDef[ ai.Gameplay.AUTOGEN_DM ] =
{
    rank_scale_spells = BuffByRank,
    noob_scale_spells = NoobScaleSpells,
    consider_battle_rank_to_choose_talents = true,

    can_reuse_ships = true,
    need_spawn_warp = false,
    countdown_duration	= 10,
	first_spawn_delay 	= 15,
	dm_kill_score 	= 30,
	max_game_duration_to_scale_reward = 7 * 60,

    cred_reward_win                 = dm_cred_reward_win,
    cred_reward_loss                = dm_cred_reward_loss / 5,
    cred_reward_power_coeff_a       = dm_cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = dm_cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = dm_cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 4,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill                 = 200,
    exp_reward_assist_damage        = 100,
    exp_reward_damage               = 100,
    exp_reward_assist_debuff        = 20,
    exp_reward_assist_buff          = 20,
    exp_reward_win                  = 1000,
    exp_reward_loss                 = 200,
    exp_reward_drone_kill           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
    exp_reward_drone_assist         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
    exp_reward_drone_damage         = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
    exp_reward_assist_heal          = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
    exp_reward_drone_heal           = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
    exp_reward_heal                 = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
    points_per_kill                 = 500, -- киллеру
    points_per_assist_damage        = 100, -- % от дамага
    points_per_assist_debuff        = 20,
    points_per_assist_buff          = 20,
    points_per_drone_kill           = 5,
    points_per_drone_assist         = 10,
    points_per_assist_heal          = 50,
}

GameplayDef[ ai.Gameplay.THREE_TEAMS_DM ] =
{
    rank_scale_spells = BuffByRank,
    noob_scale_spells = NoobScaleSpells,
    consider_battle_rank_to_choose_talents = true,
	spell_spawn_invulnerability = "SpawnWarpInvulnerability",

    can_reuse_ships = true,
    need_spawn_warp = false,
    countdown_duration	= 10,
	first_spawn_delay 	= 15,
	three_tdm_kill_score 	= 30,
	max_game_duration_to_scale_reward = 7 * 60,
	game_duration					= 12 * 60,

    cred_reward_win                 = ttdm_cred_reward_win,
    cred_reward_loss                = ttdm_cred_reward_loss / 5,
    cred_reward_power_coeff_a       = ttdm_cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = ttdm_cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = ttdm_cred_reward_guaranteed_reward,

    loot_spots_shown                = 8,
    loot_attempts_win               = 4,
    loot_attempts_loose             = 1,
    loot_attempts_premium_bonus     = 2,
    loot_attempts_assured_drop      = 1,

    premium_cred_bonus              = premium_cred_bonus,
    premium_exp_bonus               = premium_exp_bonus,
    special_loot_tables_brawl       = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

    -- опыт корабля или синергия
    exp_reward_kill					= 65,
	exp_reward_assist_damage		= 26,
	exp_reward_damage 				= 104,
	exp_reward_assist_debuff		= 26,
	exp_reward_assist_buff			= 26,
	exp_reward_win					= 650,
	exp_reward_loss					= 260,
	exp_bomb_carrier_kill			= 190,
	exp_bomb_carrier_kill_assist 	= 130,
	exp_reward_assist_heal			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    --"эффективность в бою"
	points_per_kill					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_per_assist_heal 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
}

GameplayDef[ ai.Gameplay.APRIL_CONTROL ] = 
{
	player_vessels = { "Ship_Paperplane_Small", "Ship_Paperplane_Medium", "Ship_Paperplane_Large" },  -- фиксированные корабли для потасовки
	disable_talents = true,
	need_spawn_warp = false,
	spell_spawn_invulnerability = "SpawnWarpInvulnerability",
	global_damage_coef = 3, --х3 уроном через ауру на карте и своим сообщением на входе (это текста) -- было в atdm, не стал убирать

	-- jipDiffScore =  { 270, 250, 150, }, -- не уверен, что в потасовке должен быть дозаброс
	-- jipMinimumScore = { 500, 400, 300 }, -- если у какой то команды осталось очков меньше этого, то не закидываем в бой 
	-- jipSkilledDiffScoreMin =  { 200, 200, 125, },
	
	special_loot_tables_brawl = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	control_score_to_win					= { 999, 750, 500 }, -- 10-15, 5-10, 1-5,
	control_score_for_vitalpoint_per_second	= 1,
	control_score_for_kill					= 10,

	can_reuse_ships						= true,

	full_control_bonus						= 2.5,	-- бонус за контроль всех vitalpoint'ов (за каждый команда получит control_score_for_vitalpoint_per_second * full_control_bonus)

	countdown_duration				= 10,
	first_spawn_delay				= 12,
	game_duration					= 12 * 60,

	exp_reward_kill			= 65,
	exp_reward_assist_damage= 26,
	exp_reward_damage 		= 104,
	exp_reward_assist_debuff= 26,
	exp_reward_assist_buff	= 26,
	exp_reward_vp_capture	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture / 2 * 1.3,  -- захват маяка.
	exp_reward_win			= 650,
	exp_reward_loss			= 260,
	exp_reward_drone_kill   = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2 * 1.3,
	exp_reward_drone_assist = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2 * 1.3,
	exp_reward_drone_damage = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_damage / 2 * 1.3,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * 1.3,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * 1.3,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * 1.3,

    cred_reward_win                         = cred_reward_win,
    cred_reward_loss                        = cred_reward_loss,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,

    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_vp_capture		= 500,
	points_per_drone_kill	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
	defend_bonus			= 2.0,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"
}

local CLOSE_DISTANCE_coefficient = 4  --SC-114719 обнаружилось что эффенктивности в минуту на этом геймплее в 3 раза меньше, решили пока давать награды в 2 раза больше. 19.08.2013
GameplayDef[ ai.Gameplay.CLOSE_DISTANCE ] = 
{
	player_vessels					= { "Ship_CD_Middle", "Ship_CD_Big", "Ship_CD_Fast", }, --"Ship_CD_Engineering", "Ship_CD_Guard", "Ship_CD_Tackler" },
	can_reuse_ships					= true,
	disable_talents					= true,
	need_spawn_warp					= true,
	
	countdown_duration				= 15,
	first_spawn_delay				= 12,
	game_duration					= 10 * 60,
	
	spawn_time_penalty_per_death	= 0,		-- Это время плюсуется за каждую смерть   	
	
	bomb_score_to_win				= 3,
	bomb_max_active					= 1,
	bomb_spawn_delay				= 45,
	
	bomb_first_spawn_delay			= 10,
	
	bomb_take_time					= 2,		-- in seconds
	
	bomb_plant_time					= 8,		-- in seconds
	bomb_plant_points				= 2000,
	
	bomb_carrier_kill_points		= 400,
	bomb_carrier_assist_points		= 200,
	
	bomb_detonation_blastwave		= "Gameplay_BombExplosion",
	
	bomb_carrier_sound_take			= "sound/game/bomb_carrier_sound_take",
	bomb_carrier_sound_plant		= "sound/game/bomb_carrier_sound_plant",
	
	exp_reward_kill					= 65 * CLOSE_DISTANCE_coefficient,
	exp_reward_assist_damage		= 26 * CLOSE_DISTANCE_coefficient,
	exp_reward_damage 				= 104 * CLOSE_DISTANCE_coefficient,
	exp_reward_assist_debuff		= 26 * CLOSE_DISTANCE_coefficient,
	exp_reward_assist_buff			= 26 * CLOSE_DISTANCE_coefficient,
	exp_reward_win					= 650, --* CLOSE_DISTANCE_coefficient,
	exp_reward_loss					= 260 * 2, -- * CLOSE_DISTANCE_coefficient,
	bomb_plant_exp					= 390 * CLOSE_DISTANCE_coefficient,
	bomb_take_exp					= 195 * CLOSE_DISTANCE_coefficient,
	exp_bomb_carrier_kill			= 195 * CLOSE_DISTANCE_coefficient,
	exp_bomb_carrier_kill_assist	= 130 * CLOSE_DISTANCE_coefficient,
	exp_reward_assist_heal			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * CLOSE_DISTANCE_coefficient,
	exp_reward_drone_heal 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * CLOSE_DISTANCE_coefficient,
	exp_reward_heal 				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * CLOSE_DISTANCE_coefficient,
	
    cred_reward_win                         = cred_reward_win * CLOSE_DISTANCE_coefficient,
    cred_reward_loss                        = cred_reward_loss * CLOSE_DISTANCE_coefficient,
    cred_reward_power_coeff_a               = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b               = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward           = cred_reward_guaranteed_reward,
    loot_spots_shown                        = loot_spots_shown,
    loot_attempts_win                       = loot_attempts_win,
    loot_attempts_loose                     = loot_attempts_loose,
    loot_attempts_premium_bonus             = loot_attempts_premium_bonus,
    loot_attempts_assured_drop              = loot_attempts_assured_drop,
    coop_vs_ai_loot_attempts_win            = coop_vs_ai_loot_attempts_win,
    coop_vs_ai_loot_attempts_loose          = coop_vs_ai_loot_attempts_loose,
    coop_vs_ai_loot_attempts_premium_bonus  = coop_vs_ai_loot_attempts_premium_bonus,
    coop_vs_ai_loot_attempts_assured_drop   = coop_vs_ai_loot_attempts_assured_drop,
	
    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	special_loot_tables_brawl				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,
	points_per_kill							= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_per_assist_heal  				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

	ai_difficulty_medium_item_lvl			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 					= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets								= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,
	
	max_game_duration_to_scale_reward		= 4 * 60,
}

--
--переменные определения
local delay_mobs 			= 150 -- промежуток между сквадами (время респауна)
local delay_mobs_start 		= 15 -- стартовая задержка
local delay_mobs_wave 		= 50 -- задержка между волнами
local CLANSHIP_coefficient = 2  --обнаружилось что эффективности в минуту на этом геймплее в 3 раза меньше, решили пока давать награды в 2 раза больше. 21.07.2017
GameplayDef[ ai.Gameplay.CLANSHIP ] =
{
	rank_scale_spells 		= BuffByRank,
	consider_battle_rank_to_choose_talents = true, -- подравниваем корабли под уровень боя

	need_spawn_warp  		= false,
	countdown_duration		= 10,
	first_spawn_delay		= 12,

	tdm_starting_points 	= 2000,
	tdm_kill_score			= 25, -- 20 #105183 на время эвента было х1.5 #51956 #65691 
	--wind 					= Vec3( 3, 0, 0 ),

	bomb_plant_points		= 100,
	bomb_plant_exp			= 100,

	exp_reward_kill			= 50 * CLANSHIP_coefficient,
	exp_reward_assist_damage= 20 * CLANSHIP_coefficient,
	exp_reward_damage 		= 80 * CLANSHIP_coefficient,
	exp_reward_assist_debuff= 20 * CLANSHIP_coefficient,
	exp_reward_assist_buff	= 20 * CLANSHIP_coefficient,
	exp_reward_win			= 500 * CLANSHIP_coefficient + 2500,	-- # 101000
	exp_reward_loss			= 200 * CLANSHIP_coefficient,
	exp_reward_vp_capture	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * CLANSHIP_coefficient * 0.5, --SC-114049# убрал х2 добавил 2й тип награды
	exp_reward_vp_capture_participation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture * CLANSHIP_coefficient,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal * CLANSHIP_coefficient,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal * CLANSHIP_coefficient,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal * CLANSHIP_coefficient,

	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_vp_capture		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture * 0.5, --SC-114049# убрал х2 добавил 2й тип награды
	points_vp_capture_participation		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture,

	-- #51721 дроны
	exp_reward_drone_kill   = 20 * CLANSHIP_coefficient,
	exp_reward_drone_assist = 100 * CLANSHIP_coefficient,
	points_per_drone_kill	= 20,
	points_per_drone_assist	= 100,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,

    cred_reward_win                 = cred_reward_win * 1.2 * CLANSHIP_coefficient,
    cred_reward_loss                = cred_reward_loss * 1.2 * CLANSHIP_coefficient,
    cred_reward_power_coeff_a       = cred_reward_power_coeff_a,
    cred_reward_power_coeff_b       = cred_reward_power_coeff_b,
    cred_reward_guaranteed_reward   = cred_reward_guaranteed_reward,


    premium_cred_bonus                      = premium_cred_bonus,
    premium_exp_bonus                       = premium_exp_bonus,
	max_game_duration_to_scale_reward = 7 * 60,
	game_duration			= 60*12,	---#56920 #65691 #67206
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	min_armor_amount		= 0.01,

	can_reuse_ships		= true, 	-- #105183 в Эвенте было false

	spawn_time_penalty_per_death	= 15,	--GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,
	spawn_time_penalty_reset_period	= 120,	--GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,
	-- а то дивер раш по кд
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,

	potal_def				= "ClanShip_Portal",

	squads = {
	},

	warning_sentences = 
 {
    [ 0.5 ] = { "CMDR_ENEMY_MANY_CLANSHIP_TICKETS", "CMDR_ALLY_MANY_CLANSHIP_TICKETS" },
    [ 0.15 ] = { "CMDR_ALLY_FEW_CLANSHIP_TICKETS", "CMDR_ENEMY_FEW_CLANSHIP_TICKETS" },
 },

	-- #56483
	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,
}

-- TDM for newbies
GameplayDef[ ai.Gameplay.CAPTURE_THE_FRAG ] = sys.new(GameplayDef[ ai.Gameplay.TDM ])
GameplayDef[ ai.Gameplay.CAPTURE_THE_FRAG ].game_duration = 7*60
GameplayDef[ ai.Gameplay.CAPTURE_THE_FRAG ].game_duration_tournament = game_duration_tournament
GameplayDef[ ai.Gameplay.CAPTURE_THE_FRAG ].tdm_starting_points = 20
GameplayDef[ ai.Gameplay.CAPTURE_THE_FRAG ].tdm_starting_points_scaled = {
				25, 25, 25, 25,  --4
				25, 25, 30, 30,  --8
				35, 35, 35, 35,  --12
				40, 40, 40, 40,  --16
				45, 45, 45, 45,  --20
				50, 50, 50, 50,  --24
				60, 60, 60, 60,  --28
				65, 65, 65, 65,  --32
	}

--[[{

	countdown_duration		= 0,
	first_spawn_delay		= 0,

	frag_penalty_aura = "FragSlow",
	frag_bonus_aura = "FragDamage",
	frag_count_for_bonus = 3,

}
]]

-- GTDM (survival) for newbies
GameplayDef[ ai.Gameplay.CAPTURE_THE_FLAG ] = sys.new(GameplayDef[ ai.Gameplay.GTDM ])
GameplayDef[ ai.Gameplay.CAPTURE_THE_FLAG ].game_duration = 4 * 60
GameplayDef[ ai.Gameplay.CAPTURE_THE_FLAG ].tdm_starting_points = 10
GameplayDef[ ai.Gameplay.CAPTURE_THE_FLAG ].tdm_starting_points_scaled	= {
		10, 10, 10, 10,  --4
		10, 10, 15, 15,  --8
		15, 15, 15, 15,  --12
		20, 20, 20, 20,  --16
		20, 20, 25, 25,  --20
		25, 25, 25, 25,  --24
		30, 30, 30, 30,  --28
		35, 35, 35, 35,  --32  
	}

--[[{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = false,
	
	ctf_score_to_win				= 3,
	ctf_flag_reset_timeout			= 60,		-- in seconds
	
	ctf_base_capture_interaction_time 	= 0.0,
	ctf_base_take_interaction_time	 	= 0.0,
	
	ctf_flag_take_interaction_time		= 0.0,
	ctf_flag_return_interaction_time	= 0.0,
	
	can_reuse_ships				= true,

	countdown_duration				= 30,
	first_spawn_delay				= 15,
	game_duration					= 7*60, --720,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	spawn_time_penalty_per_death	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,
	
	special_loot_tables_coop		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables_coop,
	special_loot_tables				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].special_loot_tables,

	exp_reward_kill			= 50,
	exp_reward_assist_damage= 20,
	exp_reward_damage 		= 80,
	exp_reward_assist_debuff= 20,
	exp_reward_assist_buff	= 20,
	exp_reward_vp_capture	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_vp_capture / 2,  -- захват маяка.
	exp_reward_win			= 500,
	exp_reward_loss			= 200,
	exp_reward_drone_kill   = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_kill / 2,
	exp_reward_drone_assist = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_assist / 2,
	exp_reward_assist_heal	= 20,
	exp_reward_drone_heal 	= 5,
	exp_reward_heal 		= 10,
	
	cred_reward_win			= cred_per_t1 / ( GlobalGameSettings.premium_cred_bonus + 1 ), -- /1.5 
	cred_reward_loss		= cred_per_t1 / ( GlobalGameSettings.premium_cred_bonus + 1 ),  -- /1.5

	
	cred_reward_power_coeff_a = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_power_coeff_a, --#17978  параметры линейной функции от  f(iLVLврагов) - коэффициент на который умножается золото 1-15
	cred_reward_power_coeff_b = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_power_coeff_b, --#17978
	cred_reward_guaranteed_reward = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_guaranteed_reward, --#17978   30% делится поровну 70% по заслугам

	
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_vp_capture		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_vp_capture,
	points_per_drone_kill	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_kill,
	points_per_drone_assist	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_drone_assist,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
	defend_bonus			= 2.0,	-- #16971.5 За убийство игрока с маркой "Участник захвата", начисляется очки/опыт умноженные на коэффициент "defend_bonus"
	
	-- Диапазон итем левелов, по которому определяется возможный лут:
	loot_spots_shown			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_spots_shown,				-- кол-во точек, показываемых на экране лута
	loot_attempts				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts,				-- кол-во попыток
	loot_attempts_premium_bonus	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts_premium_bonus,	-- кол-во доп. попыток для премиума
	loot_attempts_assured_drop	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts_assured_drop,	-- кол-во попыток с гарантированным дропом
	coop_vs_ai_loot_attempts				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts,
	coop_vs_ai_loot_attempts_premium_bonus	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts_premium_bonus,
	coop_vs_ai_loot_attempts_assured_drop	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts_assured_drop,
	
	premium_cred_bonus 	= GlobalGameSettings.premium_cred_bonus,
	premium_exp_bonus 	= GlobalGameSettings.premium_exp_bonus,
	
	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}
]]


for i= 1, 3 do
	for npath = 1, 4 do
		
		local a = {
			name = "Team2_Attackdrone"..npath,
			relationship_group = 1,
			spawn_spot = "02_Group"..npath,
			route = { "02_drone_right_start"..npath, "drone_right_end" },
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = delay_mobs_start + delay_mobs_wave * (i-1),
			npc_first = true,
			respawn_interval = delay_mobs,
		}
		if (i == npath) or (i+2 == npath) or (i-2 == npath) then --- #56920 боты идут не по 3 в волне а только по 2 (через 1 путь)
			-- не будет в этой волне этого дрона, уменьшаем число дронов
		else
			table.insert(GameplayDef[ ai.Gameplay.CLANSHIP ].squads, a)
		end
	end
end	


for i= 1, 3 do
	for npath = 1, 4 do
		
		local z = {
			name = "Team1_Attackdrone"..npath,
			relationship_group = 2,
			spawn_spot = "01_Group"..npath,
			route = { "01_drone_left_start"..npath, "drone_left_end" },
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = delay_mobs_start + delay_mobs_wave * (i-1),
			npc_first = true,
			respawn_interval = delay_mobs,
		}
		if (i == npath) or (i+2 == npath) or (i-2 == npath) then --- #56920 боты идут не по 3 в волне а только по 2 (через 1 путь)
			-- не будет в этой волне этого дрона, уменьшаем число дронов
		else
			table.insert(GameplayDef[ ai.Gameplay.CLANSHIP ].squads, z)
		end
	end
end	


-- dummy
GameplayDef[ ai.Gameplay.MISSION_SCRIPT ] = {}  


GameplayDef[ ai.Gameplay.FREE_SPACE ] =
{
	jump_to_zone_price_type	= GameStore.CreditsType.CT_TOKENS, --#0071213 Допустимые значени: CT_INVALID, CT_CREDITS, CT_GOLD, CT_TOKENS, CT_EVENT, CT_GOLD_BUYING_PTS, CT_EXP, CT_VESSEL_EXP 
	jump_to_zone_price_value = 5, --96304 занулил стоимость перелета

	need_spawn_warp 		= false,
	
	-- for precache
	upgrades_defs = 
	{
		"OpenWorld_LootMailer", "Test_MineStation", "Test_RepairStation"
	},
	cargo_hold_capacity = 16,

	-- появляются, если есть хоть одна постройка
	squads = {
		{
			name = "EvilPirates" ,
			relationship_group = ai.RelationshipGroups.Pirate,
			squad_type = ai.AISquadType.PATROL,
			route = "DynamicPiratePath",
			spawn_spot = "DynamicPirateSpawnSpot",
			first_spawn_delay = 20,
			respawn_time = 60,
			members = {{
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 0, 0, 0 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 15, 0, 0 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( -15, 0, 0 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 0, 15, 0 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 0, -15, 0 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 0, 0, 15 ) },
				{ "Pirate_Fast_Patrol_Lvl2_T3" , Vec3( 0, 0, -15 ) },
			}},
		}
	},
	
	--Miss Summer Event
	event_label_counts = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,},

	-- random loot from gold-scaner
	minZoneRank = 7,
	maxRespawnTime = 3.5 * 60,

	unfitZoneId = { 197, 198, 199, 244 } -- список zone_id, где не нужно генерировать случайный лут #59439
}

--
GameplayDef[ ai.Gameplay.TRANSPORT_ESCORT ] =
{
	coefMinSpeed = 0.1,
	transportStopTime = 20,
	spellHeal = "GuardHeal_Transport",
}

--Control for Newbies
GameplayDef[ ai.Gameplay.LAST_MAN_STANDING ] = sys.new(GameplayDef[ ai.Gameplay.CONTROL ])
GameplayDef[ ai.Gameplay.LAST_MAN_STANDING ].game_duration = 5 * 60
GameplayDef[ ai.Gameplay.LAST_MAN_STANDING ].control_score_to_win	= 500

--[[{
	rank_scale_spells	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].rank_scale_spells,
	noob_scale_spells = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].noob_scale_spells,
	consider_battle_rank_to_choose_talents = false,
	
	battlefield_radius = 1500.0,
	battlefield_squeeze_value = 0.0,
	battlefield_squeeze_tick = 10000.0,
	battlefield_leave_timeout = 15,
	--battlefield_squeeze_aura = "LMS_Pulsar",
	can_reuse_ships = true,
	
	add_bots_delay_arcade			= 5,
	countdown_duration				= 15,
	first_spawn_delay				= 15,
	game_duration					= 60 * 5,
	game_duration_tournament		= game_duration_tournament, -- продолжительность геймплея в турнире #49606
	
	spawn_time_penalty_per_death	= 0,---GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_per_death,	-- Это время плюсуется за каждую смерть 
	spawn_time_penalty_reset_period	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].spawn_time_penalty_reset_period,  	-- если игрок не умирает в течении этого времени, то счетчик обнуляется.  	
	max_ship_rank_diff				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].max_ship_rank_diff,

	exp_reward_kill			= 50,
	exp_reward_assist_damage= 20,
	exp_reward_damage 		= 80,
	exp_reward_assist_debuff= 20,
	exp_reward_assist_buff	= 20,
	exp_reward_win			= 500,
	exp_reward_loss			= 200,
	exp_reward_assist_heal	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_assist_heal,
	exp_reward_drone_heal 	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_drone_heal,
	exp_reward_heal 		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].exp_reward_heal,
	
	cred_reward_win			= cred_per_t1 / ( GlobalGameSettings.premium_cred_bonus + 1 ), -- /1.5 
	cred_reward_loss		= cred_per_t1 / ( GlobalGameSettings.premium_cred_bonus + 1 ),  -- /1.5
	
	cred_reward_power_coeff_a = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_power_coeff_a, --#17978  параметры линейной функции от  f(iLVLврагов) - коэффициент на который умножается золото 1-15
	cred_reward_power_coeff_b = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_power_coeff_b, --#17978
	cred_reward_guaranteed_reward = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].cred_reward_guaranteed_reward, --#17978   30% делится поровну 70% по заслугам
	
	points_per_kill			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_kill,
	points_per_assist_damage= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_damage,
	points_per_assist_debuff= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_debuff,
	points_per_assist_buff	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_buff,
	points_per_assist_heal  = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].points_per_assist_heal,
	
	-- Диапазон итем левелов, по которому определяется возможный лут:
	loot_spots_shown			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_spots_shown,				-- кол-во точек, показываемых на экране лута
	loot_attempts				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts,				-- кол-во попыток
	loot_attempts_premium_bonus	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts_premium_bonus,	-- кол-во доп. попыток для премиума
	loot_attempts_assured_drop	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].loot_attempts_assured_drop,	-- кол-во попыток с гарантированным дропом
	coop_vs_ai_loot_attempts				= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts,
	coop_vs_ai_loot_attempts_premium_bonus	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts_premium_bonus,
	coop_vs_ai_loot_attempts_assured_drop	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].coop_vs_ai_loot_attempts_assured_drop,
	
	premium_cred_bonus 	= GlobalGameSettings.premium_cred_bonus,
	premium_exp_bonus 	= GlobalGameSettings.premium_exp_bonus,
	
	ai_difficulty_medium_item_lvl	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_medium_item_lvl,
	ai_difficulty_hard_item_lvl		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].ai_difficulty_hard_item_lvl,

	bot_item_lvl_deviation 			= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_item_lvl_deviation,
	bot_presets						= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].bot_presets,

	-- Invasion in PvP
	squads = GameplayDef[ ai.Gameplay.SPACE_BATTLE ].squads,
	invasion_min_players	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_min_players,
	invasion_item_levels	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_item_levels,
	invasion_time_base		= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_base,
	invasion_time_deviation	= GameplayDef[ ai.Gameplay.SPACE_BATTLE ].invasion_time_deviation,
	
	--Miss Summer Event
	event_label_counts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,},
}
]]	

--
GameplayNotifications = 
{
	StartGameplay				= { dbg_message = "StartGameplay", },
	ClOnStart					= { sound = "sound/ui/ClOnStart", },
	YouDestroyVitalPoint		= { wow_message = "YouDestroyVitalPoint", wow_bGood = true, priority = 30, },
	AllyVitalPointFirstDamage	= { dbg_message = "AllyVitalPointFirstDamage", },
	EnemyVitalPointFirstDamage	= { dbg_message = "EnemyVitalPointFirstDamage", },
	AllyVitalPointUnderAttack	= {},
	EnemyVitalPointUnderAttack  = {},
	AllyVitalPointAllDronesKilled = { dbg_message = "AllyVitalPointAllDronesKilled", },
	EnemyVitalPointAllDronesKilled = { dbg_message = "EnemyVitalPointAllDronesKilled", },
	AllyVitalPointDestroyed 	= { wow_message = "AllyVitalPointDestroyed", wow_bGood = false, priority = 10, },
	AllAllyVitalPointDestroyed	= {},
	EnemyVitalPointDestroyed 	= { wow_message = "EnemyVitalPointDestroyed", wow_bGood = true, priority = 20, },
	AllEnemyVitalPointDestroyed	= {},
	ShipShieldDestroyed			= {},
--	ShipShieldRestored			= {},
	ShipHullLowHp				= {},
	IncomingRocket				= {},
	YouDestroyEnemyShip			= {},
	EnemyShipDestroyed			= {},
	AllyShipDestroyed			= {},
	AllyGainVitalPoint			= { wow_message = "AllyGainVitalPoint", wow_bGood = true, priority = 20, },
	EnemyGainVitalPoint			= { wow_message = "EnemyGainVitalPoint", wow_bGood = false, priority = 20, },
	SentinelEnemyLeaderDead		= { wow_message = "SentinelEnemyLeaderDead", wow_bGood = true, },
	SentinelAllyLeaderDead		= { wow_message = "SentinelAllyLeaderDead", wow_bGood = false, },
	SentinelEnemyLeaderChanged	= { wow_message = "SentinelEnemyLeaderChanged", wow_bGood = false, },
	SentinelAllyLeaderChanged	= { wow_message = "SentinelAllyLeaderChanged", wow_bGood = true, },
	VictoryNoShipsLeft			= { dbg_message = "VictoryNoShipsLeft", },
	DefeatNoShipsLeft			= { dbg_message = "DefeatNoShipsLeft", },
	PveWaveIncoming				= { wow_message = "PveWaveIncoming", wow_bGood = false, },
	PvePackSpawned				= { wow_message = "PvePackSpawned", priority = 90, wow_bGood = false, },
	PvePlayerHasChanceNextRound = { wow_message = "PvePlayerHasChanceNextRound", wow_bGood = true, },
	PveResurrectSelf			= { wow_message = "playerResurrected_self", priority = 110, wow_bGood = true, },
	PveResurrectOther			= { wow_message = "playerResurrected_other", priority = 110, wow_bGood = true, },
	PveEnemyTransportSpawn		= { wow_message = "PveEnemyTransportSpawn", priority = 80, wow_bGood = false, },
	PveAllyTransportSpawn		= { wow_message = "PveAllyTransportSpawn", priority = 80, wow_bGood = true, },
	PveEnemyTransportDead		= { wow_message = "PveEnemyTransportDead", priority = 50, wow_bGood = true, },
	PveAllyTransportDead		= { wow_message = "PveAllyTransportDead", priority = 50, wow_bGood = false, },
	PveEnemyTransportArrived	= { wow_message = "PveEnemyTransportArrived", priority = 70, wow_bGood = false, },
	PveAllyTransportArrived		= { wow_message = "PveAllyTransportArrived", priority = 70, wow_bGood = true, },
	KingHillChanged				= { wow_message = "KingHillChanged", priority = 90, wow_bGood = true, },
	
	--ClanShip
	
	EnemyGenDestroyed_CS			= { wow_message = "EnemyGenDestroyed", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_SHIELD_GENERATOR_DESTROYED", },
	AllyGenDestroyed_CS				= { wow_message = "AllyGenDestroyed", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_SHIELD_GENERATOR_DESTROYED", },
	
	EnemyShieldGenerator_CS			= { wow_message = "EnemyShieldGenerator", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_SHIELD_GENERATOR_DESTROYED", },
	AllyShieldGenerator_CS			= { wow_message = "AllyShieldGenerator", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_SHIELD_GENERATOR_DESTROYED", },
	EnemyShieldMultiphased_CS		= { wow_message = "EnemyShieldMultiphased", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_SHIELD_GENERATOR_DESTROYED", },
	AllyShieldMultiphased_CS		= { wow_message = "AllyShieldMultiphased", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_SHIELD_GENERATOR_DESTROYED", },	
	EnemyShieldHard_CS				= { wow_message = "EnemyShieldHard", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_SHIELD_GENERATOR_DESTROYED", },
	AllyShieldHard_CS				= { wow_message = "AllyShieldHard", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_SHIELD_GENERATOR_DESTROYED", },
	
	EnemyTurretPowerDestroyed_CS	= { wow_message = "EnemyTurretPowerDestroyed", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_TURRET_POWER_DESTROYED", },
	AllyTurretPowerDestroyed_CS		= { wow_message = "AllyTurretPowerDestroyed", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_TURRET_POWER_DESTROYED", },
	
	EnemyCannonControl_CS			= { wow_message = "EnemyCannonControl", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_TURRET_POWER_DESTROYED", },
	AllyCannonControl_CS			= { wow_message = "AllyCannonControl", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_TURRET_POWER_DESTROYED", },
	EnemyArmorPenetration_CS		= { wow_message = "EnemyArmorPenetration", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_TURRET_POWER_DESTROYED", },
	AllyArmorPenetration_CS			= { wow_message = "AllyArmorPenetration", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_TURRET_POWER_DESTROYED", },		
	
	EnemyTicketDestroyed_CS			= { wow_message = "EnemyTicketDestroyed", wow_bGood = true, priority = 20, sentence = "CMDR_ENEMY_TICKET_TOWER_DESTROYED", },
	AllyTicketDestroyed_CS			= { wow_message = "AllyTicketDestroyed", wow_bGood = false, priority = 10, sentence = "CMDR_ALLY_TICKET_TOWER_DESTROYED", },	
	
	-- Capture the Flag
	AllyFlagTaken				= { wow_message = "AllyFlagTaken",		wow_bGood = false,	priority = 90 },
	EnemyFlagTaken				= { wow_message = "EnemyFlagTaken",		wow_bGood = true,	priority = 90 },
	AllyFlagCaptured			= { wow_message = "AllyFlagCaptured",	wow_bGood = false,	priority = 85 },
	EnemyFlagCaptured			= { wow_message = "EnemyFlagCaptured",	wow_bGood = true,	priority = 85 },
	AllyFlagDropped				= { wow_message = "AllyFlagDropped",	wow_bGood = true,	priority = 80 },
	EnemyFlagDropped			= { wow_message = "EnemyFlagDropped",	wow_bGood = false,	priority = 80 },
	AllyFlagReturned			= { wow_message = "AllyFlagReturned", 	wow_bGood = true,	priority = 75 },
	EnemyFlagReturned			= { wow_message = "EnemyFlagReturned",	wow_bGood = false,	priority = 75 },

	-- Bomb the Base
	BombSpawned					= { wow_message = "BombSpawned",		priority = 85 },
	AllyBombTaken				= { wow_message = "AllyBombTaken",		priority = 90,		wow_bGood = true 	},
	EnemyBombTaken				= { wow_message = "EnemyBombTaken",		priority = 90,		wow_bGood = false	},
	BombDropped					= { wow_message = "BombDropped",		priority = 85 },
	BombReturned				= { wow_message = "BombReturned",		priority = 85 },
	AllyBombPlanted				= { wow_message = "AllyBombPlanted",	priority = 90,		wow_bGood = true	},
	EnemyBombPlanted			= { wow_message = "EnemyBombPlanted",	priority = 90,		wow_bGood = false	},

	-- Sentinel #65913
	SentinelRespawnAnnounce_Long		 = { wow_message = "SentinelRespawnAnnounce_Long",			priority = 85, wow_bGood = true  }, -- для всех кроме капитанов
	SentinelRespawnAnnounce_Long_Leader	 = { wow_message = "SentinelRespawnAnnounce_Long_Leader",	priority = 90, wow_bGood = true  }, -- для капитанов
	--За 20 секунд:
	SentinelRespawnAnnounce_Soon		 = { wow_message = "SentinelRespawnAnnounce_Soon",			priority = 85, wow_bGood = true  },
	SentinelRespawnAnnounce_Soon_Leader	 = { wow_message = "SentinelRespawnAnnounce_Soon_Leader",	priority = 90, wow_bGood = true  },
	--В момент снятия:
	SentinelRespawnAnnounce_Now			 = { wow_message = "SentinelRespawnAnnounce_Now",			priority = 85, wow_bGood = true  },
	SentinelRespawnAnnounce_Now_Leader	 = { wow_message = "SentinelRespawnAnnounce_Now_Leader",	priority = 90, wow_bGood = true  },
	
	-- Tutorial
	--TutorialObjectiveStarted	= { wow_message = "TutorialObjectiveStarted",		priority = 85 },
	TutorialObjectiveProgress	= { wow_message = "TutorialObjectiveProgress",		sound = "sound/ui/hudShowQuest", priority = 55 },
	TutorialObjectiveCompleted	= { wow_message = "TutorialObjectiveCompleted",		priority = 85 },
	
	ModuleActivate_FAILED		= { wow_message = "ModuleActivate_FAILED",      sound = "sound/ui/failed", },
	ModuleActivate_NO_AMMO		= { wow_message = "ModuleActivate_NO_AMMO", 	dbg_message = "Out of ammo", 	sound = "sound/ui/failed", },
	ModuleActivate_NO_ENERGY	= { wow_message = "ModuleActivate_NO_ENERGY", 	dbg_message = "Not enough energy", },
	ModuleActivate_NO_HULL 		= { wow_message = "ModuleActivate_NO_HULL", 	dbg_message = "Not enough health", },
	ModuleActivate_NO_TARGET	= { wow_message = "ModuleActivate_NO_TARGET", 	dbg_message = "No target locked", },
	ModuleActivate_OUT_OF_RANGE = { wow_message = "ModuleActivate_OUT_OF_RANGE",dbg_message = "Out of range", },
	ModuleActivate_NO_LOS		= { wow_message = "ModuleActivate_NO_LOS",		dbg_message = "Target not visible", },
	ModuleActivate_ON_COOLDOWN	= { wow_message = "ModuleActivate_ON_COLDDOWN", dbg_message = "Module is not ready", sound = "sound/ui/failed", },
	ModuleActivate_NOT_READY	= { wow_message = "ModuleActivate_NOT_READY", 	dbg_message = "Module is not ready", sound = "sound/ui/failed", },
	ModuleActivate_SILENCED		= { wow_message = "ModuleActivate_SILENCED", },
	ModuleActivate_AT_CONTROL_LIMIT = { wow_message = "ModuleActivate_AT_CONTROL_LIMIT", sound = "sound/ui/failed", },
	ModuleActivate_AT_SATELLITE_LIMIT = { wow_message = "ModuleActivate_AT_SATELLITE_LIMIT", sound = "sound/ui/failed", },
	ModuleActivate_COLLISION 	= { wow_message = "ModuleActivate_COLLISION", 	sound = "sound/ui/failed", },
	

	Module_READY_BossSmartBombT5 = { wow_message = "BossSmartBombT5",	priority = 120,	sound = "", },
	Module_DEACTIVATED_BossSmartBombT5 = { wow_message = "BossSmartBombT5_End", priority = 100, sound = "", },

	LockFailed_NO_TARGET		= { sound = "sound/ui/failed", },
	LockFailed_DISABLED			= { sound = "sound/ui/failed", },
	LockFailed_TARGET_IN_WARP	= { sound = "sound/ui/failed", },

	ModuleActivate_OVERHEAT		= { wow_message = "ModuleActivate_OVERHEAT",	sound = "sound/ui/failed", },
	Weapon_Overheat				= { wow_message = "Weapon_Overheat",			sound = "sound/ui/failed", },

	ModuleActivate_DISABLED		= { wow_message = "ModuleActivate_DISABLED",	sound = "sound/ui/failed", },

	ActivateWeaponExtension		= { sound = "", },
	DeactivateWeaponExtension	= { sound = "sound/ui/failed", },
	SelectRocketSlot		= { sound = "", },
	SelectRocketSlotFailed		= { sound = "", },
	ToggleOnLookWorld		= { sound = "", },
	
	DockRequestSuccess			= { wow_message = "Dock_Success",  },
	DockRequestFailed 			= { wow_message = "Dock_Failed", 	sound = "sound/ui/failed", priority = 1, },
	JumpRequestSuccess			= { wow_message = "Jump_in_progress",  },
	JumpRequestFailed 			= { wow_message = "Jump_Failed", 	sound = "sound/ui/failed", priority = 1, },
	
	LootCrateResultSuccess				= { sound = "sound/game/bomb_carrier_sound_take", },
	LootCrateResultFailed_cargoFull		= { wow_message = "LootCrate_Failed_cargoFull",		sound = "sound/ui/lootScanFail", },
	LootCrateResultFailed_nothingFound	= { wow_message = "LootCrate_Failed_nothingFound",	sound = "sound/ui/lootScanFail", },
	LootCrateResultFailed_hasUnique		= { wow_message = "LootCrate_Failed_hasUnique",		sound = "sound/ui/lootScanFail", },

	pveRaid_CruiserSpawn		= { wow_message = "pveRaid_CruiserSpawn",	priority = 100,	 },
	pveRaid_PortalSpawn			= { wow_message = "pveRaid_PortalSpawn",	priority = 100,	 },
	pveRaid_ShieldOff			= { wow_message = "pveRaid_ShieldOff",		priority = 100,	 },
	pveRaid_FinishHim			= { wow_message = "pveRaid_FinishHim",		priority = 100,	 }, --"sound/ui/hudShowQuest"
	pveRaid_BombSpawn			= { wow_message = "pveRaid_BombSpawn",		priority = 100,	 },
	pveRaid_CruiserEnrage		= { wow_message = "pveRaid_CruiserEnrage",	priority = 100,	 },

	RW_CruiserEnrage			= { wow_message = "RW_CruiserEnrage",		priority = 100,	 },
	RW_CruiserSpawn				= { wow_message = "pveRaid_CruiserSpawn",	priority = 100,	 },
	RW_ShieldOn					= { wow_message = "RW_ShieldOn",			priority = 100,	 },
	RW_ShieldOff				= { wow_message = "RW_ShieldOff",			priority = 100,	 },
	RW_GunSpawn					= { wow_message = "RW_GunSpawn",			priority = 100,	 },
	RW_TorpedSpawn				= { wow_message = "RW_TorpedSpawn",			priority = 100,	 },
	RW_LaserSpawn				= { wow_message = "RW_LaserSpawn",			priority = 100,	 },
	RW_RocketSpawn				= { wow_message = "RW_RocketSpawn",			priority = 100,	 },
	RW_StunSpawn				= { wow_message = "RW_StunSpawn",			priority = 100,	 },
	RW_FinishHim				= { wow_message = "pveRaid_FinishHim",		priority = 100,	 },
	RW_AvanpostDead				= { wow_message = "RW_AvanpostDead",		priority = 100,	 },
	RW_AvanpostDead7			= { wow_message = "RW_AvanpostDead7",		priority = 100,	 },
	RW_AvanpostDead6			= { wow_message = "RW_AvanpostDead6",		priority = 100,	 },
	RW_AvanpostDead5			= { wow_message = "RW_AvanpostDead5",		priority = 100,	 },
	RW_AvanpostDead4			= { wow_message = "RW_AvanpostDead4",		priority = 100,	 },
	RW_AvanpostDead3			= { wow_message = "RW_AvanpostDead3",		priority = 100,	 },
	RW_AvanpostDead2			= { wow_message = "RW_AvanpostDead2",		priority = 100,	 },
	RW_AvanpostDead1			= { wow_message = "RW_AvanpostDead1",		priority = 100,	 },
	RW_AvanpostDead0			= { wow_message = "RW_AvanpostDead0",		priority = 100,	 },

	pve_Meat					= { wow_message = "pve_Meat",				priority = 100,	 },
	pve_EndMeat					= { wow_message = "msg_gameEnded",			priority = 100,	 },
	pve_Kamikadze				= { wow_message = "pve_Kamikadze",			priority = 100,	 },
	pve_Aliens					= { wow_message = "pve_Aliens",				priority = 100,	 },
	W_EngineDead				= { wow_message = "W_EngineDead",			priority = 100,	 },
	
	--PvE dialogs
	PvE_Start					= { hud_dialog = 0, },
	PvE_Inside					= { hud_dialog = 1, },
	PvE_Cruiser					= { hud_dialog = 1, },
	PvE_PW_Cruiser				= { hud_dialog = 2, },
	
	--scripted PvE dialogs
	PvE_Phase0					= { hud_dialog = 0,		priority = 100,},
	PvE_Phase1					= { hud_dialog = 1,		priority = 100, },
	PvE_Phase2					= { hud_dialog = 2,		priority = 100, },
	PvE_Phase3					= { hud_dialog = 3,		priority = 100, },
	PvE_Phase4					= { hud_dialog = 4,		priority = 100, },
	PvE_Phase5					= { hud_dialog = 5,		priority = 100, },
	PvE_Phase6					= { hud_dialog = 6,		priority = 100, },
	PvE_Phase7					= { hud_dialog = 7,		priority = 100, },
	PvE_Phase8					= { hud_dialog = 8,		priority = 100, },
	PvE_Phase9					= { hud_dialog = 9,		priority = 100, },
	PvE_Phase10					= { hud_dialog = 10,	priority = 100, },

	PvE_Event1S					= { hud_dialog = 11,	priority = 70, },
	PvE_Event1F					= { hud_dialog = 12,	priority = 60, },
	PvE_Event1C					= { hud_dialog = 13,	priority = 50, },
	PvE_Event2S					= { hud_dialog = 14,	priority = 70,  },
	PvE_Event2F					= { hud_dialog = 15,	priority = 60, },
	PvE_Event2C					= { hud_dialog = 16,	priority = 50, },
	PvE_Event3S					= { hud_dialog = 17,	priority = 70,  },
	PvE_Event3F					= { hud_dialog = 18,	priority = 60, },
	PvE_Event3C					= { hud_dialog = 19,	priority = 50, },
	PvE_Event4S					= { hud_dialog = 20,	priority = 70,  },
	PvE_Event4F					= { hud_dialog = 21,	priority = 60, },
	PvE_Event4C					= { hud_dialog = 22,	priority = 50, },
	PvE_Event5S					= { hud_dialog = 23,	priority = 70,  },
	PvE_Event5F					= { hud_dialog = 24,	priority = 60, },
	PvE_Event5C					= { hud_dialog = 25,	priority = 50, },

	PvE_RandomEvent1S			= { hud_dialog = 26,	priority = 40, },
	PvE_RandomEvent1F			= { hud_dialog = 27,	priority = 30, },
	PvE_RandomEvent1C			= { hud_dialog = 28,	priority = 20, },
	PvE_RandomEvent2S			= { hud_dialog = 29,	priority = 40, },
	PvE_RandomEvent2F			= { hud_dialog = 30,	priority = 30, },
	PvE_RandomEvent2C			= { hud_dialog = 31,	priority = 20, },
	PvE_RandomEvent3S			= { hud_dialog = 32,	priority = 40, },
	PvE_RandomEvent3F			= { hud_dialog = 33,	priority = 30, },
	PvE_RandomEvent3C			= { hud_dialog = 34,	priority = 20, },
	PvE_RandomEvent4S			= { hud_dialog = 35,	priority = 40, },
	PvE_RandomEvent4F			= { hud_dialog = 36,	priority = 30, },
	PvE_RandomEvent4C			= { hud_dialog = 37,	priority = 20, },
	PvE_RandomEvent5S			= { hud_dialog = 38,	priority = 40, },
	PvE_RandomEvent5F			= { hud_dialog = 39,	priority = 30, },
	PvE_RandomEvent5C			= { hud_dialog = 40,	priority = 20, },
	PvE_RandomEvent6S			= { hud_dialog = 41,	priority = 40, },
	PvE_RandomEvent6F			= { hud_dialog = 42,	priority = 30, },
	PvE_RandomEvent6C			= { hud_dialog = 43,	priority = 20, },
	PvE_RandomEvent7S			= { hud_dialog = 44,	priority = 40, },
	PvE_RandomEvent7F			= { hud_dialog = 45,	priority = 30, },
	PvE_RandomEvent7C			= { hud_dialog = 46,	priority = 20, },
	PvE_RandomEvent8S			= { hud_dialog = 47,	priority = 40, },
	PvE_RandomEvent8F			= { hud_dialog = 48,	priority = 30, },
	PvE_RandomEvent8C			= { hud_dialog = 49,	priority = 20, },
	PvE_RandomEvent9S			= { hud_dialog = 50,	priority = 40, },
	PvE_RandomEvent9F			= { hud_dialog = 51,	priority = 30, },
	PvE_RandomEvent9C			= { hud_dialog = 52,	priority = 20, },
	PvE_RandomEvent10S			= { hud_dialog = 53,	priority = 40, },
	PvE_RandomEvent10F			= { hud_dialog = 54,	priority = 30, },
	PvE_RandomEvent10C			= { hud_dialog = 55,	priority = 20, },
}


ai.ShipVisualParamsMax = 
{
	CAPACITOR ={
	energy_max = 2000,
	},
	ENGINE = {
	max_speed = 45,
	},
	ARMOR = {
	hull_health  = 15000,
	},
	SHIELD = {
	shield_max = 15000,
	},
}

ItemMarks =
{
	[ 1 ]	= { name = "Mk1",	prefix = false },
	[ 2 ]	= { name = "Mk2",	prefix = false },
	[ 3 ]	= { name = "Mk3",	prefix = false },
	[ 4 ]	= { name = "Prem",	prefix = false },
	[ 5 ]	= { name = "Rel",	prefix = true },
	[ 6 ]	= { name = "Rare",	prefix = true },
	[ 7 ]	= { name = "Epic",	prefix = true },
}


MarketPlaceTypes =
{
	NATIVE			= 0,
	STEAM_BUNDLE	= 1,	
}