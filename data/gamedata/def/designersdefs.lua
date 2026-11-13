sys.execscript( 'scripts/system.lua' )

--
sys.execscript( 'gamedata/preparedvessels.lua' )
sys.execscript( 'gamedata/gameplaysettings.lua' )
sys.execscript( 'gamedata/trade.lua' )
sys.execscript( 'gamedata/misc_settings.lua' )
sys.execscript ( 'gamedata/music_states.lua' )

-- изменение этих файлов влечет за собой ребилд shared данных для серверов
sys.execscript( 'gamedata/shared/reputation.lua' )
sys.execscript( 'gamedata/shared/item_subtypes.lua' )
sys.execscript( 'gamedata/shared/zones.lua' )
sys.execscript( 'gamedata/shared/secret_document_schedule.lua' )
sys.execscript( 'gamedata/shared/titles.lua' )
sys.execscript( 'gamedata/shared/unlim_pve.lua' )
sys.execscript( 'gamedata/shared/autogen.lua' )
sys.execscript( 'gamedata/shared/battle_pass.lua' )
sys.execscript( 'gamedata/shared/league_equipment_lists.lua' )
sys.execscript( 'gamedata/shared/bot_preset_exclusion_list.lua' )

sys.execscript( 'gamedata/shared/def_ids.lua' )

-- квесты и контракты
sys.execscript( 'gamedata/shared/quests_base.lua' )
sys.execscript( 'gamedata/shared/quests.lua' )
sys.execscript( 'gamedata/shared/quests_resource.lua' )
sys.execscript( 'gamedata/shared/quests_ship.lua' )
-- sys.execscript( 'gamedata/shared/quests_alert.lua' )
-- sys.execscript( 'gamedata/shared/quests_checklist.lua' )
-- sys.execscript( 'gamedata/shared/quests_event.lua' )
-- sys.execscript( 'gamedata/shared/quests_resource.lua' )
-- sys.execscript( 'gamedata/shared/quests_ow.lua' )

sys.execscript( 'gamedata/shared/entity_tags.lua' )
sys.execscript( 'gamedata/shared/situations.lua' )
sys.execscript( 'gamedata/shared/situation_scripts.lua' )
sys.execscript( 'gamedata/shared/adventures.lua' )
sys.execscript( 'gamedata/shared/adventure_stages.lua' )
sys.execscript( 'gamedata/def/objects/adventure_objects.lua' )

sys.execscript( 'gamedata/shared/clan_quests.lua' )

sys.execscript( 'gamedata/shared/sc_achievements.lua' )
sys.execscript( 'gamedata/shared/talents.lua' )
sys.execscript( 'gamedata/shared/starter_pack.lua' )
sys.execscript( 'gamedata/shared/vessel_grades_progression.lua' )
sys.execscript( 'gamedata/shared/account_auras.lua' )
sys.execscript( 'gamedata/shared/universe.lua' )
sys.execscript( 'gamedata/shared/war.lua' )
sys.execscript( 'gamedata/shared/lobby_settings.lua' )
sys.execscript( 'gamedata/shared/vessel_custom_elements.lua' )
sys.execscript( 'gamedata/shared/teaching.lua' )
sys.execscript( 'gamedata/shared/rank_rewards.lua' )
sys.execscript( 'gamedata/shared/login_rewards.lua' )

VesselTree = {}
sys.execscript( 'gamedata/shared/vessel_tree.lua' )

ModulePresets = {}
sys.execscript( 'gamedata/shared/module_presets.lua' )
sys.execscript( 'gamedata/shared/destr_presets.lua' )

sys.execscript( 'gamedata/shared/karma.lua' )
sys.execscript( 'gamedata/shared/faction_rep.lua' )
sys.execscript( 'gamedata/shared/pve_missions/aid.lua' )

sys.execscript( 'gamedata/shared/pve_missions/buff_by_agro.lua' )

sys.execscript( 'gamedata/shared/pve_missions/base.lua' )
sys.execscript( 'gamedata/shared/loot_tables.lua' )
sys.execscript( 'gamedata/def/objects/ow_loot_tables.lua' )


--

sys.execscript( 'gamedata/designers_tools.lua' )
sys.execscript( 'gamedata/automats.lua' )
sys.execscript( 'gamedata/ui_properties.lua' )
sys.execscript( 'gamedata/def/effects.lua' )
sys.execscript( 'gamedata/def/spawnspots.lua' )
sys.execscript( 'gamedata/def/objects/misc.lua' )
sys.execscript( 'gamedata/def/objects/modules.lua' )

--Дефы автогенов
sys.execscript( 'gamedata/def/def_autogen.lua' )
sys.execscript( 'gamedata/autogen_tooltips.lua' )

sys.execscript( 'gamedata/def/objects/backgrounds.lua' )

sys.execscript( 'gamedata/def/objects/drugs.lua' )

sys.execscript( 'gamedata/def/objects/bundles.lua' )
sys.execscript( 'gamedata/def/objects/bundles_events.lua' )
sys.execscript( 'gamedata/def/objects/bundles_parts.lua' )
--sys.execscript( 'gamedata/def/objects/bundles_pass.lua' )
sys.execscript( 'gamedata/def/ex/bundles_pass.lua' )
sys.execscript( 'gamedata/def/objects/bundles_dlc.lua' )

sys.execscript( 'gamedata/def/objects/avatars.lua' )
sys.execscript( 'gamedata/def/objects/mottos.lua' )
sys.execscript( 'gamedata/def/objects/modules_capacitor.lua' )
sys.execscript( 'gamedata/def/ex/capacitor.lua' )
sys.execscript( 'gamedata/def/objects/modules_engine.lua' )
sys.execscript( 'gamedata/def/ex/engine.lua' )
sys.execscript( 'gamedata/def/ex/cpu.lua' )
sys.execscript( 'gamedata/def/ex/armor.lua' )
sys.execscript( 'gamedata/def/ex/shield.lua' )
sys.execscript( 'gamedata/def/objects/modules_armor.lua' )
sys.execscript( 'gamedata/def/objects/modules_shield.lua' )
sys.execscript( 'gamedata/def/objects/modules_misc.lua' )
sys.execscript( 'gamedata/def/objects/modules_special.lua' )
sys.execscript( 'gamedata/def/objects/ships.lua' )
sys.execscript( 'gamedata/def/objects/ship_test.lua' )



sys.execscript( 'gamedata/def/ex/ship_preset.lua' )
sys.execscript( 'gamedata/def/ex/ship_preset_e.lua' )
sys.execscript( 'gamedata/def/ex/bot_preset.lua' )
sys.execscript( 'gamedata/def/ex/ow_preset.lua' )
sys.execscript('gamedata/def/ex/pvebot_preset.lua')
sys.execscript('gamedata/def/ex/ow_bot_preset.lua')
sys.execscript( 'gamedata/def/objects/vitalpoints.lua' )
sys.execscript( 'gamedata/def/objects/special_gameplay_objects.lua' )
sys.execscript( 'gamedata/def/objects/weapons.lua' )

sys.execscript( 'gamedata/def/objects/weapons_projectiles.lua' )

sys.execscript( 'gamedata/def/objects/weapons_secondary_deathray.lua' )

sys.execscript( 'gamedata/def/objects/space_junk.lua' )
sys.execscript( 'gamedata/def/objects/quest_items.lua' )

sys.execscript( 'gamedata/def/objects/craft_base.lua' )

sys.execscript( 'gamedata/def/objects/ship_explosions.lua' )
sys.execscript( 'gamedata/def/objects/anomaly.lua' )
sys.execscript( 'gamedata/def/objects/turret.lua' )
sys.execscript( 'gamedata/def/objects/cargoship.lua' )
sys.execscript( 'gamedata/def/objects/loot_crate.lua' )
sys.execscript( 'gamedata/def/objects/secret_loot_crate.lua' )
sys.execscript( 'gamedata/def/objects/bonus.lua' )
sys.execscript( 'gamedata/def/objects/shader_modes.lua' )

sys.execscript( 'gamedata/def/ex/laser.lua' )
sys.execscript( 'gamedata/def/ex/plasma.lua' )
sys.execscript( 'gamedata/def/ex/railgun.lua' )
sys.execscript( 'gamedata/def/ex/green_weapon.lua' )
sys.execscript( 'gamedata/def/ex/weapon_mod.lua' )
sys.execscript( 'gamedata/def/ex/rockets.lua' )
sys.execscript( 'gamedata/def/ex/rockets_blastwave.lua' )
sys.execscript( 'gamedata/def/ex/deathray.lua' )
sys.execscript( 'gamedata/def/ex/deathray_blastwave.lua' )
sys.execscript( 'gamedata/def/ex/minefield.lua' )
sys.execscript( 'gamedata/def/ex/minefield_blastwave.lua' )
sys.execscript( 'gamedata/def/ex/drons.lua' )

sys.execscript( 'gamedata/def/ex/active.lua' )
sys.execscript( 'gamedata/def/ex/active_blastwave.lua' )
sys.execscript( 'gamedata/def/ex/passive.lua' )
sys.execscript( 'gamedata/def/ex/green_engine.lua' )
sys.execscript( 'gamedata/def/ex/green_passive.lua' )
sys.execscript( 'gamedata/shared/green_nodes_price.lua' )
sys.execscript( 'gamedata/def/ex/ship.lua' )
--sys.execscript( 'gamedata/def/ex/shipadd.lua' )
sys.execscript( 'gamedata/def/ex/ship_green.lua' )
VesselProgress ={}
sys.execscript( 'gamedata/def/ex/ship_green_progress.lua' )
sys.execscript( 'gamedata/def/ex/green_active.lua' )
sys.execscript( 'gamedata/def/ex/green_active_prj.lua' )
sys.execscript( 'gamedata/def/ex/green_active_blastwave.lua' )
sys.execscript( 'gamedata/def/ex/green_active_entity1.lua' )
sys.execscript( 'gamedata/def/ex/green_active_entity2.lua' )

sys.execscript( 'gamedata/def/ex/capacitor_mod.lua' )
sys.execscript( 'gamedata/def/ex/shield_mod.lua' )
sys.execscript( 'gamedata/def/ex/armor_mod.lua' )
sys.execscript( 'gamedata/def/ex/cpu_mod.lua' )
sys.execscript( 'gamedata/def/ex/engine_mod.lua' )

sys.execscript( 'gamedata/def/ex/capacitor_mod_t.lua' )
sys.execscript( 'gamedata/def/ex/shield_mod_t.lua' )
sys.execscript( 'gamedata/def/ex/armor_mod_t.lua' )
sys.execscript( 'gamedata/def/ex/cpu_mod_t.lua' )
sys.execscript( 'gamedata/def/ex/engine_mod_t.lua' )
sys.execscript( 'gamedata/def/ex/passive_t.lua' )
sys.execscript( 'gamedata/def/ex/active_t.lua' )
sys.execscript( 'gamedata/def/ex/laser_t.lua' )
sys.execscript( 'gamedata/def/ex/laser_projectile.lua' )
sys.execscript( 'gamedata/def/ex/plasma_t.lua' )
sys.execscript( 'gamedata/def/ex/plasma_projectile.lua' )
sys.execscript( 'gamedata/def/ex/railgun_t.lua' )
sys.execscript( 'gamedata/def/ex/railgun_projectile.lua' )
sys.execscript( 'gamedata/def/ex/active_projectile.lua' )
sys.execscript( 'gamedata/def/ex/active_drone.lua' )

sys.execscript( 'gamedata/def/ex/special.lua' )

sys.execscript( 'gamedata/def/ex/junk.lua' )
sys.execscript( 'gamedata/def/ex/craft.lua' )

sys.execscript( 'gamedata/def/objects/item_sets.lua' )

sys.execscript( 'gamedata/shop_info.lua' )

sys.execscript( 'gamedata/sentence.lua' )
sys.execscript( 'gamedata/medals.lua' )
sys.execscript( 'gamedata/ship_decals.lua' )
sys.execscript( 'gamedata/ship_dyes.lua' )
sys.execscript( 'gamedata/ship_armors.lua' )
sys.execscript( 'gamedata/ship_crystals.lua' )
sys.execscript( 'gamedata/tutorial_missions/tutorial.lua' )

sys.execscript( 'gamedata/eula.lua' )

sys.execscript( 'gamedata/def/def_extension.lua' )

sys.execscript( 'gamedata/def/objects/pve_entities.lua' )
sys.execscript( 'gamedata/def/objects/openworld_entities.lua' )
sys.execscript( 'gamedata/def/objects/clanship_entities.lua' )
sys.execscript( 'gamedata/def/objects/entity_builder.lua' )

sys.execscript( 'gamedata/item_tooltips.lua' )
sys.execscript( 'gamedata/aura_tooltips.lua' )
sys.execscript( 'gamedata/ship_tooltips.lua' )
sys.execscript( 'gamedata/role_descriptions.lua' )

-- gameplay specific
sys.execscript( 'gamedata/def/objects/gameplay_close.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_football.lua' )
sys.execscript( 'gamedata/def/objects/ships4brawl.lua' )
sys.execscript(	'gamedata/def/objects/gameplay_battleroyale.lua' )
sys.execscript(	'gamedata/def/objects/gameplay_hungergames.lua' )
sys.execscript(	'gamedata/def/objects/gameplay_one_against_all.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_leviathan.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_paperplanes.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_mechfight.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_zombiemode.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_closedistance.lua' )
sys.execscript( 'gamedata/def/objects/gameplay_gamepad.lua' )

sys.execscript( 'gamedata/shared/clan_emblems.lua' )
sys.execscript( 'gamedata/shared/clan_upgrades.lua' )
sys.execscript( 'gamedata/shared/clan_ship.lua' )
sys.execscript( 'gamedata/shared/referrals.lua' )
sys.execscript( 'gamedata/shared/tutorials.lua' )
sys.execscript( 'gamedata/shared/tournaments.lua' )
sys.execscript( 'gamedata/def/module_prices.lua' )
sys.execscript( 'gamedata/shared/module_upgrade_chain.lua' ) -- depends on defs themselves

-- open space
sys.execscript( 'gamedata/def/objects/open_space_objects.lua' )

sys.execscript( 'gamedata/shared/ai_settings.lua' )

sys.execscript( 'gamedata/shared/account_rank.lua' )

sys.execscript( 'gamedata/atlas_defs.lua' )
sys.execscript( 'gamedata/autogen_defs.lua' )


--OW евенты 2019
sys.execscript( 'scripts/general/constants.lua' )
sys.execscript( 'gamedata/designers_constants.lua' )
sys.execscript( 'scripts/general/events.lua' )            -- главные эвенты (там внутри прогружаются эвенты СС), этот файл грузится и на сс сервере
sys.execscript( 'scripts/general/quests.lua' )
--sys.execscript( 'scripts/general/events_mining.lua' )          -- все камни майнинга
--sys.execscript( 'scripts/general/events_common.lua' )          -- приколюхи - рандомные эвенты
--sys.execscript( 'scripts/general/events_greenwave.lua' )  -- эвенты для ДД зеленого нашествия

--Дефы автогенерируемых баз
sys.execscript( 'gamedata/def/objects/module_base.lua' )

--[[НГ блокировка/разблокировка продажи модулей по ролям.
sys.execscript( 'gamedata/def/ex/command2017.lua' )
sys.execscript( 'gamedata/def/ex/sniper2017.lua' )
sys.execscript( 'gamedata/def/ex/tackler2017.lua' )
sys.execscript( 'gamedata/def/ex/attack2017.lua' )
sys.execscript( 'gamedata/def/ex/recon2017.lua' )
sys.execscript( 'gamedata/def/ex/guard2017.lua' )
sys.execscript( 'gamedata/def/ex/ecm2017.lua' )
]]

--- Это устарело насколько  я понимаю. переделали рекрафт и все ушло в эксель!
--sys.execscript( 'gamedata/shared/ship_craft_ext.lua' ) -- include craft information to craftable ship def
-- корабль который создается "по умолчанию", прописан в c++ коде
Def.Ship_Default = 
{
	inherit		= 	"Ship_Test",
}

Def.Craft_Crap =
{

}

--#73628, #SC-116198 April's fool day


-- --Katana
-- Def.Ship_Race2_M_T3.default_custom_elements = nil
-- Def.Ship_Race2_M_T3.model="models/ships/race_2/m/race2_m_t3_precursor"
-- Def.Ship_Race2_M_T3.hangarIco="Ship_biomorph"
-- Def.Ship_Race2_M_T3.default_icon="shopIco_Ship_Race2_M_T3_april1st"
-- Def.Ship_Race2_M_T3.hangarIcoSmall="Race2_M_T3_small_april1st"
-- Def.Ship_Race2_M_T3.capacitor_grades=designers.capacitor_alien_r2_m_grades
-- Def.Ship_Race2_M_T3.engine_grades=designers.engine_alien_r2_m_grades
-- Def.Ship_Race2_M_T3.damage_mul=0.33 
-- Def.Ship_Race2_M_T3.weapon_slots=3
-- Def.Ship_Race2_M_T3.death_effect = "particles/explosions/alien_explosion_small_01"
-- Def.Ship_Race2_M_T3.customization_groups[ ai.VesselCustomSlot.MATERIAL_0 ]={}
-- Def.Ship_Race2_M_T3.customization_groups[ ai.VesselCustomSlot.MATERIAL_1 ]={}
-- Def.Ship_Race2_M_T3.customization_groups[ ai.VesselCustomSlot.MATERIAL_2 ]={}
-- Def.Ship_Race2_M_T3.customization_groups[ ai.VesselCustomSlot.MPRESET_0 ]={}
-- --Styx
-- Def.Ship_Race1_L_T3_Faction1.skin=nil
-- Def.Ship_Race1_L_T3_Faction1.default_custom_elements=nil
-- Def.Ship_Race1_L_T3_Faction1.model="models/ships/race_2/l/race2_l_t5_precursor"
-- Def.Ship_Race1_L_T3_Faction1.hangarIco="Race1_L_T3_Skin2_april1st"
-- Def.Ship_Race1_L_T3_Faction1.default_icon="shopIco_Ship_Race1_L_T3_april1st"
-- Def.Ship_Race1_L_T3_Faction1.hangarIcoSmall="Race1_L_T3_small_april1st"
-- Def.Ship_Race1_L_T3_Faction1.capacitor_grades=designers.capacitor_alien_r2_m_grades
-- Def.Ship_Race1_L_T3_Faction1.engine_grades=designers.engine_alien_kiber_grades
-- Def.Ship_Race1_L_T3_Faction1.slot_bones[ ai.SpaceShipModuleSlot.CAPACITOR ] = "main"
-- Def.Ship_Race1_L_T3_Faction1.death_effect = "particles/explosions/alien_explosion_small_01"
-- Def.Ship_Race1_L_T3_Faction1.customization_groups[ ai.VesselCustomSlot.MATERIAL_0 ]={}
-- Def.Ship_Race1_L_T3_Faction1.customization_groups[ ai.VesselCustomSlot.MATERIAL_1 ]={}
-- Def.Ship_Race1_L_T3_Faction1.customization_groups[ ai.VesselCustomSlot.MATERIAL_2 ]={}
-- Def.Ship_Race1_L_T3_Faction1.customization_groups[ ai.VesselCustomSlot.MPRESET_0 ]={}

-- Lion Mk2
-- Def.Ship_Race3_M_T5_Faction2.default_custom_elements = nil
-- Def.Ship_Race3_M_T5_Faction2.model="models/objects/ships_huge/prec_interceptor/prec_interceptor"
-- Def.Ship_Race3_M_T5_Faction2.hangarIco="Ship_Leviathan_M"
-- Def.Ship_Race3_M_T5_Faction2.default_icon="shopIco_Ship_Leviathan_M"
-- Def.Ship_Race3_M_T5_Faction2.hangarIcoSmall="Ship_Leviathan_M_small"
-- Def.Ship_Race3_M_T5_Faction2.capacitor_grades=designers.capacitor_alien_grades
-- Def.Ship_Race3_M_T5_Faction2.engine_grades=designers.engine_alien_interceptor_grades
-- Def.Ship_Race3_M_T5_Faction2.cam_config="cam_ship_ufo"
-- --Def.Ship_Race3_M_T5_Faction2.damage_mul=0.33 
-- -- Def.Ship_Race3_M_T5_Faction2.weapon_slots=1
-- Def.Ship_Race3_M_T5_Faction2.death_effect = "particles/explosions/alien_explosion_big_01"
-- Def.Ship_Race3_M_T5_Faction2.skin=nil
-- Def.Ship_Race3_M_T5_Faction2.customization_groups[ ai.VesselCustomSlot.MATERIAL_0 ]={}
-- Def.Ship_Race3_M_T5_Faction2.customization_groups[ ai.VesselCustomSlot.MATERIAL_1 ]={}
-- Def.Ship_Race3_M_T5_Faction2.customization_groups[ ai.VesselCustomSlot.MATERIAL_2 ]={}
-- Def.Ship_Race3_M_T5_Faction2.customization_groups[ ai.VesselCustomSlot.MPRESET_0 ]={}
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "gun_2"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "gun_1"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "gun_2"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.ACTIVE_03 ] = "gun_3"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.ACTIVE_04 ] = "gun_4"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.SPECIAL ] = "fx1"
-- Def.Ship_Race3_M_T5_Faction2.slot_bones[ ai.SpaceShipModuleSlot.CAPACITOR ] = "engine"

 
--#73628


--#106323
--Brokk
--[[
Def.Ship_Race1_L_T5_PremUniq.health = 1.0
Def.Ship_Race1_L_T5_PremUniq.weapon_slots = 2
Def.Ship_Race1_L_T5_PremUniq.model="models/ships/specialships/event_aprile/ship_event_aprile"
Def.Ship_Race1_L_T5_PremUniq.death_blast_wave = "SmallShipExplodeBlastWave"
Def.Ship_Race1_L_T5_PremUniq.death_wreck = "Wreck_R1_S"
Def.Ship_Race1_L_T5_PremUniq.death_effect = "particles/explosions/shp_exp_small_02"
Def.Ship_Race1_L_T5_PremUniq.fire_sector_incline = -45
Def.Ship_Race1_L_T5_PremUniq.fire_sectors = { 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 }
Def.Ship_Race1_L_T5_PremUniq.laser_damage_mul = 0.7
Def.Ship_Race1_L_T5_PremUniq.plasma_damage_mul = 0.7
Def.Ship_Race1_L_T5_PremUniq.railgun_damage_mul = 0.7
Def.Ship_Race1_L_T5_PremUniq.hangarIco="ship_event_aprile"
Def.Ship_Race1_L_T5_PremUniq.default_icon="shopIco_ship_event_aprile"
Def.Ship_Race1_L_T5_PremUniq.hangarIcoSmall="shopIco_ship_event_aprile_small"
Def.Ship_Race1_L_T5_PremUniq.capacitor_grades=designers.capacitor_large_r1_t5_PU_april
Def.Ship_Race1_L_T5_PremUniq.engine_grades=designers.engine_large_r1_t5_PU_April
Def.Ship_Race1_L_T5_PremUniq.default_custom_elements[ai.VesselCustomSlot.MATERIAL_0]="Default_specialships_april_r1"
Def.Ship_Race1_L_T5_PremUniq.default_custom_elements[ai.VesselCustomSlot.MATERIAL_1]="Default_specialships_april_g1"
Def.Ship_Race1_L_T5_PremUniq.default_custom_elements[ai.VesselCustomSlot.MATERIAL_2]="Default_specialships_april_b1"
]]--
--#106323

--Def.SpaceMissile_April_T5.delete_from_inventory=true
--Def.Module_AprilDrone_T5_Epic.delete_from_inventory=true

--#112011
--Def.GuardDrone.children[5] = { model  = "models/objects/vital_point/drone/drone_pumkin_mask", joint = "yaw" }

--SC-115765 Вооружение от корпорации “Klauss Inc.” (отключение): в новогодний марафон закомментировать 3 строки (ниже), после окончания ("в 1й патч после НГ") - раскомментировать (см SC-119413)
  Def.Weapon_SmartRocketLauncher_NY.delete_from_inventory=true
  Def.Weapon_SuppressingGun_NY.delete_from_inventory=true
  Def.Weapon_Minigun_NY.delete_from_inventory=true

-- tests
--- проверка продажности #56059
if false then -- должно быть отключено "false", чтобы не проверять каждый запуск
	_t = {
		Module_SpyDrone=1,
		Module_ShieldVampire=2,
		Module_SpyBeacon=2,
		Module_FakeShips=3,
		Module_AchillesTargetingUnit=1,
		Module_EcmJammer=3,
		Module_Chameleon=2,
		Module_EnergyLance=2,
		Module_EnergyVampire=2,
		Module_FocusedEMI=2,
		Module_IonRay=1,
		Module_HackSystems=3,
		Module_Afterburner=2,
		Module_CommandShieldResist=1,
		Module_CommandWeaknessAnalyzer=2,
		Module_WebPropulsion=1,
		Module_BoostBan=3,
		Module_GuidedDronRL=3,
		Module_RemoteRepairDrones=2,
		Module_ShieldEmitter=1,
		Module_RepairRay_l=3,
		Module_ShieldRay_l=2,
		Module_WarpGate=2,
		Module_Screen=3,
		Module_BoostJammerAOE=1,
		Module_AOE_EMI=3,
		Module_ShieldChargeLarge=3,
		Module_SmartBomb=2,
		Module_ShelterField=4,
		Module_Flash=3,
		Module_SniperOverload=1,
		Module_InertialStabilizer=4,
		Module_RotationThruster=2,
		Module_KatalizatorInjector=2,
		Module_BoostersOverloader=3,
		Module_EngineGenerator=1,
		Module_ExternalCooler=3,
		Module_ExtCapacitorBattary=1,
		Module_CpctrPwrRelay=4,
		Module_CptrEnrgBridge=3,
		ModulePassive_WeaponCoolant=3,
		ModulePassive_AccelerationCoil=2,
		Module_ExtShld=2,
		Module_AdaptiveForceField=3,
		Module_CuttedShieldHolder=3,
		Module_SubMatterShield=4,
		ModulePassive_Recuperator=3,
		ModulePassive_ResistShieldEMP=2,
		ModulePassive_ResistShieldKin=2,
		ModulePassive_ShieldExtender=1,
		ModulePassive_HeavyArmor=2,
		ModulePassive_CompositeArmor=3,
		ModulePassive_PassiveArmor=3,
		ModulePassive_ResistHullKinetic=2,
		ModulePassive_FastMissileRacks=3,
		ModulePassive_ScoutScanner=1,
		ModulePassive_CoProcessor=4,
		Weapon_Laser_Basic=1,
		Weapon_Laser_Sniper=2,
		Weapon_Laser_Heavy=2,
		Weapon_SuppressingFire=3,
		Weapon_Nanobots_Cloud=3,
		Weapon_Plasmagun_Basic=1,
		Weapon_Plasmagun_Autofire=2,
		Weapon_Railgun_Autofire=2,
		Weapon_Railgun_Heavy=2,
		Weapon_Sparks_Cannon=3,
		Module_ShieldRestoreSmall=1,
		Module_ShieldRestoreLarge=1,
		Module_AdaptiveShieldBoost=2,
		Module_RepairDrones_s=1,
		Module_RepairDrones_l=1,
		Module_AdaptiveArmorBoost=1,
	}

	for id, lt in pairs(LootTable) do
		for i = 1, #lt do
			item = lt[i].item
			if not Def[item] then
				sys.log("!!!!!!!! item ["..item.."] not found in Def, LootTable "..id)
			else
				for st, tier in pairs(_t) do
					if string.sub(item,1,string.len(st)) == st then
						if not Def[item].tier then
							sys.log("item ["..item.."] no tier, LootTable "..id.." "..tier)
						elseif Def[item].tier <= tier then
							sys.log("item ["..item.."] invalid tier, LootTable "..id.." "..tier)
						end
					end
				--sys.log("item ["..item.."] cant_be_bought, LootTable "..id)
				end
			end
		end
	end
end

-- проверка таблиц ревардов в шип-квестах #60513
if false then -- должно быть отключено "false", чтобы не проверять каждый запуск
	for qid, q in pairs(ShipQuests) do
		sys.out("quest id=%d", qid)
		for bid, b in pairs(q.bonus_reward) do
			if Def then
				if Def[b[1]] then
					m = string.sub(b[1],1,string.len(b[1])-2) .. 'Mk1'
					if Def[m] and Def[m].cant_be_bought then
						sys.out("invalid tier %s", b[1])
					end
				else
					sys.out("quest id=%d not found def for bonus: %s", qid, b[1])
				end
			end
		end
	end
end


-- автоматическая корректировка патронов в пресетах под класс пушки #85568
local sShip, aPreset, w,c,t,st
for sShip, aPreset in pairs( ModulePresets ) do
	if aPreset.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] then 
		w = Def[aPreset.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]]
		c = w.weapon_class
		t = w.tier
		st= Def[aPreset.munition[ai.MunitionBayType.MBT_PRIMARY]].tier	-- тир старых патронов
		t = math.min(t, st) -- новые патроны должны быть того же тира, даже если пушка выше

		if c == ai.WeaponClass.LASER then
			if not (aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] == "WeaponMod_LaserUp1_Basic_T"..t.."_Mk3") then
				--sys.out(" ammo is changed Laser on ship = %s, from = %s, to = %s", sShip, aPreset.munition[ai.MunitionBayType.MBT_PRIMARY], "WeaponMod_LaserUp1_Basic_T"..t.."_Mk3")
			end
			aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_LaserUp1_Basic_T"..t.."_Mk3"
		elseif c == ai.WeaponClass.PLASMAGUN then
			if not (aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] == "WeaponMod_PlasmaUp1_Basic_T"..t.."_Mk3") then
				--sys.out(" ammo is changed Plasma on ship = %s, from = %s, to = %s", sShip, aPreset.munition[ai.MunitionBayType.MBT_PRIMARY], "WeaponMod_PlasmaUp1_Basic_T"..t.."_Mk3")
			end
			aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_PlasmaUp1_Basic_T"..t.."_Mk3"
		else --weapon_class=ai.WeaponClass.RAILGUN
			if not (aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] == "WeaponMod_RailUp1_Basic_T"..t.."_Mk3") then
				--sys.out(" ammo is changed Rail on ship = %s, from = %s, to = %s", sShip, aPreset.munition[ai.MunitionBayType.MBT_PRIMARY], "WeaponMod_RailUp1_Basic_T"..t.."_Mk3")
			end
			aPreset.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T"..t.."_Mk3"
		end
	end
end

sys.execscript( 'scripts/dummymenuadv.lua' )