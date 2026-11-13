-- ----------------------------------------------------------------------------
--
-- Workfile: hudwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- TODO: надпись "Ракета была сбита"

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudWnd = {}
local hw = UI.HudWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "HudWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hud_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progress_main_2",
						wnd			= "UI.HudPlayerShipInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning_msg",
						wnd			= "UI.HudWarningsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "navigator",
						layer		= "UI.HudWnd.layers.WORK_EFFECT_1",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "map_grid",
						wnd			= "UI.HudVignetteMapWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "map_view",
						wnd			= "UI.HudPlayersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "map_title",
						wnd			= "UI.HudGlobalMapControlsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						wnd			= "UI.HudTimerWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "map_info",
						wnd			= "UI.HudGameplayInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bomb_prog",
						layer		= "UI.HudWnd.layers.PROGRESS_BARS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bomb",
						wnd			= "UI.HudBomberIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "player_name_2",
						wnd			= "UI.HudSpectatedNameWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "killmess",
						wnd			= "UI.HudKillsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "tutor_info",
						wnd			= "UI.HudTutorialInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "map_info_2",
						wnd			= "UI.HudZoneNameWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "damage_indicator",
						wnd			= "UI.HudIncomingStates",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "fps_info",
						wnd			= "UI.HudClientStatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "resurrection",
						layer		= "UI.HudWnd.layers.WORK_EFFECT_2",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "talk_head_2",
						wnd			= "UI.HudQuestDialogWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "talk_head_2",
						wnd			= "UI.HudKillerMottoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "killmess_2",
						wnd			= "UI.HudDeathInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- no use, just legacy from FullScreenWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- PROGRESS_BARS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_progressBars",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT_1
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_workEffect1",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT_2
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_workEffect2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "resurrection",
						wnd			= "UI.HudResurrectWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "who_says",
						wnd			= "UI.HudVoiceChatSpeakersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "quests_finish",
						wnd			= "UI.HudQuestCompleteWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children =
	{
		"UI.HudVignetteTurretWnd",
		"UI.HudVignetteLowHpWnd",
		"UI.HudObjectsMarksWnd",
		"UI.HudPlayerShipInfoWnd",
		"UI.HudCursorWnd",
		"UI.HudTargetViewWnd",
		"UI.HudForcesInfoWnd",
		"UI.HudForcesInfoControlWnd",
		"UI.HudForcesInfoSentinelWnd",
		"UI.HudForcesInfoPveMissionWnd",
		"UI.HudForcesInfoBombWnd",
		"UI.HudForcesInfoCloseDistWnd",
		"UI.HudForcesInfoKingWnd",
		"UI.HudForcesInfoTdmWnd",
		"UI.HudForcesInfoGtdmWnd",
		"UI.HudForcesInfoThreeTdmWnd",
		"UI.HudForcesInfoClanShipWnd",
		"UI.HudForcesInfoCustomWnd",
		"UI.HudForcesInfoHungerWnd",
		"UI.HudForcesinfoOAAWnd",
		"UI.HudWarningsWnd",
		"UI.HudMapWnd_map",
		"UI.HudMapWnd_radar",
		"UI.HudModulesWnd",
		"UI.ShipSelectionWnd",
		"UI.HudAurasWnd_buffs",
		"UI.HudAurasWnd_debuffs",
		"UI.HudWowWnd",
		"UI.HudVignetteMapWnd",
		"UI.HudPlayersWnd",				-- показывается на экране выбора корабля и на тактической карте
		"UI.HudPlayersWnd2_friends",	-- показывается в режиме игры (может показываться отдельно список друзей и врагов)
		"UI.HudPlayersWnd2_enemies",	-- показывается в режиме игры (может показываться отдельно список друзей и врагов)
		"UI.HudGlobalMapControlsWnd",
		"UI.LootWnd",
		"UI.WinLoseWnd",
		"UI.HudEfficiencyWnd",
		"UI.HudMedalsWnd",
		"UI.HudGuidedMissileWnd",
		"UI.HudGuidedMissileCursorWnd",
		"UI.HudTimerWnd",
		"UI.HudGameplayInfoWnd",
		"UI.HudLeaveBattlefieldWnd",
		"UI.HudLeaveSwarmControlZoneWnd",
		"UI.HudSwarmEmergencyTimerWnd",
		"UI.HudNoAlivePlayersWnd",
		"UI.HudObjInteractionWnd",
		"UI.HudBomberIcoWnd",
		"UI.HudDamageDirWnd",
		"UI.HudGameMsg",
		"UI.HudSpectatedNameWnd",
		"UI.HudKillsWnd",
		"UI.HudTutorialInfoWnd",
		"UI.HudFriendlyPlayersWnd",
		"UI.HudCaptureVpWnd",
		"UI.HudCargoWnd",
		"UI.HudPlayerStatusWnd",
		"UI.HudLootNotifyWnd",
		"UI.HudZoneNameWnd",
		"UI.HudIncomingStates",
		"UI.HudClientStatsWnd",
		"UI.HudResurrectWnd",
		"UI.HudBuildingProgressWnd",
		"UI.HudAdditionalCmdProgressWnd",
		"UI.HudQuestDialogWnd",
		"UI.HudQuestTrackerWnd",
		"UI.HudVoiceChatSpeakersWnd",
		"UI.HudQuestCompleteWnd",
		"UI.HudPvpGameplayInfoWnd",
		"UI.HudPveGameplayInfoWnd",
		"UI.HudBossHpWnd",
		"UI.HudKillerMottoWnd",
		"UI.HudDeathInfoWnd",
		"UI.HudMultiLootCrateWnd",

		"UI.HudAdventureWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudWnd:Init()

	self:Reset()

	self.myShip 		= _G.CL_GetLocalPlayerShip()
	self.localPlayerId	= _G.Game_LocalClientNum()

	self.bInited		= true

	UI.HudObjectsMarksWnd:Init()

	local ships = _G.GetAllSpaceShips()
	for idx, shipId in ipairs( ships ) do
		self:OnSpawnSpaceShip( shipId )
	end

	local givers = _G.GetAllAdventureGivers()
	for idx, giverId in ipairs( givers ) do
		self:OnSpawnAdventureGiver( giverId )
	end

	local miskObjects = _G.GetAllHudEntities()
	for idx, entId in ipairs( miskObjects ) do
		self:AddHudObjMark( entId )
	end

	self:SetMode( self:DetectGameMode() )

end


--
function UI.HudWnd:GetMode()

	return self.mode

end


-- вызывается из cpp
function UI.HudWnd:ShowShipSelectionWnd()	

	if self.mode ~= self.modes.SELECT_SHIP then
		self:SetMode( self.modes.SELECT_SHIP )
	end

end


-- вызывается из cpp
function UI.HudWnd:HideShipSelectionWnd()	

	if self.mode == self.modes.SELECT_SHIP then
		self:SetMode( self:DetectGameMode() )
	end

end


-- вызывается из cpp
function UI.HudWnd:ShowWinLoseWnd( status, reason, params )

	UI.WinLoseWnd:Setup( status, reason, params )
	self:SetMode( self.modes.WIN_LOSE )

end


-- вызывается из cpp
function UI.HudWnd:HideWinLoseWnd()

	if self.mode == self.modes.WIN_LOSE then
		self:SetMode( self:DetectGameMode() )
	end

end


-- called from LootWnd and from self
function UI.HudWnd:OnEndGame( gameResult )

	-- #0055647
	-- Определяется, что cpp-код уже не дисконнектнул игрока сам.
	-- При некоторых обстоятельствах эта функция может вызываться уже после того, как cpp дисконнектнул.
	-- Например, если лут был прерван по эскейпу, и время анимации окончания лута <= времени cl_autoDisconnectTime
	-- (но проявляется не всегда).
	-- В этом случае сначала приходит F_OnEventPlayerDisconnected, из него вызывается UI:LoadMainMenuLevel(),
	-- потом окончание анимации в луте, из него эта функция, _G.network.isMultiplayer=false в этом случае, из этой функции снова вызов UI:LoadMainMenuLevel(),
	-- показ ангара и дебрифинга, но затем приход F_OnEventEndLevel (от первого вызова UI:LoadMainMenuLevel()), который скрывает ангар и дебрифинг;
	-- ангар потом восстановится после F_OnEventStartLevel, дебрифинг - нет.
	-- Однако иногда F_OnEventEndLevel приходит сразу после UI:LoadMainMenuLevel(), и в этом случае баг не проявляется, т.к. окно лута после этого скрывается
	
	local bPlayerDisconnected = false

	local playerId = _G.Game_LocalClientNum()
	local playerInfo = _G.GetPlayerInfo( playerId )
	if not playerInfo or playerInfo.status == _G.network.PlayerStatus.PS_LEFT or playerInfo.status == _G.network.PlayerStatus.PS_NONE then
		bPlayerDisconnected = true
	end

	-- TODO: цвар временный
	-- TODO: автодисконнект не работает!
	local bAutoDisconnect = bPlayerDisconnected or ( _G.network.isMultiplayer and ( cvars.cl_autoDisconnectTime == nil or cvars.cl_autoDisconnectTime ~= 0 ) )

	if UI.Tutorial:IsActive() then

    	local localPlayerId = self.localPlayerId
    	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
		if localPlayerTeam == 0 then
			localPlayerTeam = 1
		end

    	if gameResult.winnerTeam == localPlayerTeam then

			if bAutoDisconnect then
    			self:SetMode( self.modes.WAIT_DISCONNECT )
				sys.log( "UI.HudWnd:OnEndGame()[ERROR]: not expected multiplayer in tutorial" )
			else
				UI:LoadMainMenuLevel()
			end

		else
			self:SetMode( self.modes.TUTORIAL_LOSE )
    	end
	
	else

		if bAutoDisconnect then
    		self:SetMode( self.modes.WAIT_DISCONNECT )
		else
			UI:LoadMainMenuLevel()
		end

	end

end


-- вызывается из cpp
function UI.HudWnd:ShowLoot( gameResult )

	if UI.LootWnd:CanShowLoot( gameResult ) then

		UI.LootWnd:Setup( gameResult )
		self:SetMode( self.modes.LOOT )

	else
		self:OnEndGame( gameResult )
	end

end


-- вызывается из биндов
function UI.HudWnd:ToggleVisibility()

	if not self:IsOnScreen() then
		return
	end

	local isVisible = self.mode ~= self.modes.USER_HIDE
	self:SetVisibility( not isVisible )

end


-- вызывается из биндов
function UI.HudWnd:SetVisibility( isVisible )

	if not self:IsOnScreen() then
		return
	end

	local oldMode = self.mode

	if isVisible and self.mode == self.modes.USER_HIDE then
		self:SetMode( self:DetectGameMode() )

	elseif not isVisible and self.mode ~= self.modes.USER_HIDE then
		self:TryUserHide()
	end

	if oldMode ~= self.mode then

    	if _G.Replay_OnToggleHud then
    		_G.Replay_OnToggleHud( isVisible )
    	end

	end

end


-- вызывается из биндов
function UI.HudWnd:OnToggleGlobalMapBind()

	if not self:IsOnScreen() then
		return
	end

	if self.mode == self.modes.GLOBAL_MAP or self.mode == self.modes.GLOBAL_MAP_SPECTATOR then
		self:SetMode( self:DetectGameMode() )
	else
		self:TryShowGlobalMap()
	end

end


-- вызывается из биндов
function UI.HudWnd:OnShowGlobalMapBind()

	if not self:IsOnScreen() then
		return
	end

	if self.mode == self.modes.GLOBAL_MAP or self.mode == self.modes.GLOBAL_MAP_SPECTATOR then
		return
	end

	self:TryShowGlobalMap()

end


-- вызывается из биндов
function UI.HudWnd:OnHideGlobalMapBind()

	if not self:IsOnScreen() then
		return
	end

	if self.mode ~= self.modes.GLOBAL_MAP and self.mode ~= self.modes.GLOBAL_MAP_SPECTATOR then
		return
	end

	self:SetMode( self:DetectGameMode() )

end


-- вызывается из биндов
function UI.HudWnd:MarksFullModeBindOn()

	UI.HudObjectsMarksWnd:MarksFullModeBindOn()

end


-- вызывается из биндов
function UI.HudWnd:MarksFullModeBindOff()

	UI.HudObjectsMarksWnd:MarksFullModeBindOff()

end


-- вызывается из биндов
function UI.HudWnd:OnToggleMarksNamesBind()

	UI.HudObjectsMarksWnd:OnToggleMarksNamesBind()

end


--
function UI.HudWnd:CanShowChat()

	return self.mode ~= self.modes.USER_HIDE and UI.HudEditor:IsWndVisible( "ChatWnd" )

end


-- вызывается из cpp
function UI.HudWnd:OnSpawnSpaceShip( shipId )

	if not self.bInited then
		return
	end

	UI.HudObjectsMarksWnd:OnSpawnSpaceShip( shipId )
	UI.HudMapWnd_map:OnSpawnSpaceShip( shipId )
	UI.HudMapWnd_radar:OnSpawnSpaceShip( shipId )

end


--
function UI.HudWnd:OnSpawnAdventureGiver( giverId )

	if not self.bInited then
		return
	end

	UI.HudObjectsMarksWnd:OnSpawnAdventureGiver( giverId )
	UI.HudMapWnd_map:OnSpawnAdventureGiver( giverId )
	UI.HudMapWnd_radar:OnSpawnAdventureGiver( giverId )

end


-- вызывается из cpp
function UI.HudWnd:OnWaitPlayersTimerChanged()

	UI.ShipSelectionWnd:OnWaitPlayersTimerChanged()

end


-- вызывается из cpp
function UI.HudWnd:OnProduceShipResponse( result, hangarSlot )

	UI.ShipSelectionWnd:OnProduceShipResponse( result, hangarSlot )

end


-- вызывается из cpp
function UI.HudWnd:OnStartProduceShip( playerIdx, hangarSlot, timeLeft )

	UI.ShipSelectionWnd:OnStartProduceShip( playerIdx, hangarSlot, timeLeft )

end


-- вызывается из cpp
function UI.HudWnd:OnStopProduceShip( playerIdx, hangarSlot )

	-- nothing to do

end

-- вызывается из cpp
function UI.HudWnd:OnShipFactoryShipsChanged()

	UI.ShipSelectionWnd:OnShipFactoryShipsChanged()
	UI.HudPlayersWnd:OnShipFactoryShipsChanged()

end

-- вызывается из cpp
function UI.HudWnd:OnWarehouseSlotResponse( result, slotIdx )

	UI.ShipSelectionWnd:OnWarehouseSlotResponse( result, slotIdx )

end


-- вызывается из cpp
function UI.HudWnd:OnApplyAura( spaceShipEntity, auraEntityId )

	UI.HudAurasWnd_buffs:OnApplyAura( spaceShipEntity, auraEntityId )
	UI.HudAurasWnd_debuffs:OnApplyAura( spaceShipEntity, auraEntityId )
	UI.HudIncomingStates:OnApplyAura( spaceShipEntity, auraEntityId )
	UI.HudCursorWnd:OnApplyAura( spaceShipEntity, auraEntityId )
	UI.HudWarningsWnd:OnApplyAura( spaceShipEntity, auraEntityId )
	
end


-- вызывается из cpp
function UI.HudWnd:OnCancelAura( spaceShipEntity, auraEntityId )

	UI.HudAurasWnd_buffs:OnCancelAura( spaceShipEntity, auraEntityId )
	UI.HudAurasWnd_debuffs:OnCancelAura( spaceShipEntity, auraEntityId )
	UI.HudCursorWnd:OnCancelAura( spaceShipEntity, auraEntityId )
	UI.HudWarningsWnd:OnCancelAura( spaceShipEntity, auraEntityId )

end


--
function UI.HudWnd:OnHoldAura( spaceShipEntity, auraEntityId )

	UI.HudAurasWnd_buffs:OnHoldAura( spaceShipEntity, auraEntityId )
	UI.HudAurasWnd_debuffs:OnHoldAura( spaceShipEntity, auraEntityId )

end


--
function UI.HudWnd:OnDropAura( spaceShipEntity, auraEntityId )

	UI.HudAurasWnd_buffs:OnDropAura( spaceShipEntity, auraEntityId )
	UI.HudAurasWnd_debuffs:OnDropAura( spaceShipEntity, auraEntityId )

end


--
function UI.HudWnd:OnAuraStageChanged( auraEntityId )

	UI.HudAurasWnd_buffs:OnAuraStageChanged( auraEntityId )
	UI.HudAurasWnd_debuffs:OnAuraStageChanged( auraEntityId )

end


-- вызывается из cpp
function UI.HudWnd:ShowWowMsg( strId, bGood, priority, params, time )

	UI.HudWowWnd:ShowMsg( strId, bGood, priority, params, time )

end


-- вызывается из cpp
function UI.HudWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )

	UI.HudObjectsMarksWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )
	UI.HudCursorWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )

end


-- вызывается из cpp
function UI.HudWnd:OnLootScanResult( result, attemptsLeft, defName, amount, skipSalvaging, sellRefund, salvagePrice, salvageRefund, salvagePremiumRefund, creditsEarned, tokensEarned, salvagePremiumCantAfford, playerGold )

	if self.mode ~= self.modes.LOOT then
		sys.log( "UI.HudWnd:OnLootScanResult()[ERROR]: not in LOOT mode" )
		return
	end

	UI.LootWnd:OnScanResult( result, attemptsLeft, defName, amount, skipSalvaging, sellRefund, salvagePrice, salvageRefund, salvagePremiumRefund, creditsEarned, tokensEarned, salvagePremiumCantAfford, playerGold )

end


-- вызывается из cpp
function UI.HudWnd:OnLootSalvageResult( result, creditsEarned, tokensEarned )

	if self.mode ~= self.modes.LOOT then
		sys.log( "UI.HudWnd:OnLootSalvageResult()[ERROR]: not in LOOT mode" )
		return
	end

	UI.LootWnd:OnSalvageResult( result, creditsEarned, tokensEarned )

end


-- вызывается из cpp
function UI.HudWnd:OnPlayerBattleReward( playerIdx, reward, rewardReason, value, killedPlayerIdx, worldPos )

	UI.HudEfficiencyWnd:OnPlayerBattleReward( playerIdx, reward, rewardReason, value, killedPlayerIdx, worldPos )

end


-- вызывается из cpp
function UI.HudWnd:OnMedalEarned( medalId, level, exp )

	UI.HudMedalsWnd:OnMedalEarned( medalId, level, exp )

end


--
function UI.HudWnd:OnGuidedMissileDestroyed( playerIdx, killed )

	if playerIdx ~= _G.GetSpectatorTargetIdx() then  
		return
	end

	if not killed then
		return		
	end	

	-- т.к. этот коллбэк приходит до того, как на экране появится окно ворнингов (вследствие смены мода)
	self.bMissileDestroyed = true

end


--
function UI.HudWnd:OnPhaseModulePhaseChanged( playerIdx, moduleSlotId, phase )

	UI.HudModulesWnd:OnPhaseModulePhaseChanged( playerIdx, moduleSlotId, phase )

end


--
function UI.HudWnd:OnVitalPointRespawnTurrets( vitalPointId )

	UI.HudObjectsMarksWnd:OnVitalPointRespawnTurrets( vitalPointId )

end


--
function UI.HudWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.HudForcesInfoSentinelWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudObjectsMarksWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudTargetViewWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudPlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudPlayersWnd2_friends:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudPlayersWnd2_enemies:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudFriendlyPlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudSpectatedNameWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.HudVoiceChatSpeakersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

end


--
function UI.HudWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.HudForcesInfoSentinelWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudObjectsMarksWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudTargetViewWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudPlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudPlayersWnd2_friends:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudPlayersWnd2_enemies:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudFriendlyPlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HudSpectatedNameWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	
end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnAdaptiveMarksSizeOptionChanged()

	UI.HudObjectsMarksWnd:OnAdaptiveMarksSizeOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnHudOnCircleMarksModeOptionChanged()

	UI.HudObjectsMarksWnd:OnHudOnCircleMarksModeOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnAllowDamageDirOptionChanged()

	UI.HudDamageDirWnd:OnAllowDamageDirOptionChanged()

end


-- вызывается из cpp кода - коллбэк на изменение значения cvar-переменной sv_hudPredictionVisible
function UI.HudWnd:OnHudPredictionVisibleChanged()

	UI.HudObjectsMarksWnd:OnHudPredictionVisibleChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnMarksFadeOnDistChanged()

	UI.HudObjectsMarksWnd:OnMarksFadeOnDistChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnMarksElementsChanged()

	UI.HudObjectsMarksWnd:OnMarksElementsChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnGameCursorTypeOptionChanged()

	UI.HudCursorWnd:OnGameCursorTypeOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnGameCursorCrossTypeOptionChanged()

	UI.HudCursorWnd:OnGameCursorCrossTypeOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnGameCursorColorOptionChanged()

	UI.HudCursorWnd:OnGameCursorColorOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnPredictionColorOptionChanged()

	UI.HudObjectsMarksWnd:OnPredictionColorOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnHudPlayerShipInfoAlphaOptionChanged()

	UI.HudPlayerShipInfoWnd:OnHudPlayerShipInfoAlphaOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnHideMarksFramesOutOfShotOptionChanged()

	UI.HudObjectsMarksWnd:OnHideMarksFramesOutOfShotOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnMarksTransparentBehindObstacleOptionChanged()

	UI.HudObjectsMarksWnd:OnMarksTransparentBehindObstacleOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnHudArrowsAreaTypeOptionChanged()

	UI.HudObjectsMarksWnd:OnHudArrowsAreaTypeOptionChanged()

end


--
function UI.HudWnd:OnScalableHealthBarsOptionChanged()

	UI.HudObjectsMarksWnd:OnScalableHealthBarsOptionChanged()

end


--
function UI.HudWnd:OnVpHpAlwaysOptionChanged()

	UI.HudObjectsMarksWnd:OnVpHpAlwaysOptionChanged()
	UI.HudForcesInfoWnd:OnVpHpAlwaysOptionChanged()
	UI.HudForcesInfoControlWnd:OnVpHpAlwaysOptionChanged()
	UI.HudForcesInfoKingWnd:OnVpHpAlwaysOptionChanged()
	UI.HudForcesInfoPveMissionWnd:OnVpHpAlwaysOptionChanged()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudWnd:OnShowIncomingStatesOptionChanged()

	UI.HudIncomingStates:OnShowIncomingStatesOptionChanged()

end


--
function UI.HudWnd:OnAddEntityToHud( entityId )

	if self.mode == self.modes.NONE then
--		sys.log( "UI.HudWnd:OnAddEntityToHud()[ERROR]: hud is not initialized" )
		return
	end

	self:AddHudObjMark( entityId )

end


--
function UI.HudWnd:OnRemoveEntityFromHud( entityId )

	UI.HudObjectsMarksWnd:OnRemoveEntityFromHud( entityId )
	UI.HudMapWnd_map:OnRemoveEntityFromHud( entityId )
	UI.HudMapWnd_radar:OnRemoveEntityFromHud( entityId )

end


--
function UI.HudWnd:OnFreeMouseWhilePressBind( bOn )

	if not self:IsOnScreen() then
		return
	end

	if bOn then
		self:CaptureKeyboardFocus()
	else
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )

	UI.HudDamageDirWnd:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )
	UI.HudIncomingStates:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )

end


--
function UI.HudWnd:OnPlayerGotHeal( healVal, healerEntityId, healerPlayerIdx )

	UI.HudIncomingStates:OnPlayerGotHeal( healVal, healerEntityId, healerPlayerIdx )

end


--
function UI.HudWnd:OnBindsChanged()

	UI.ShipSelectionWnd:OnBindsChanged()
	UI.HudModulesWnd:OnBindsChanged()
	UI.HudGlobalMapControlsWnd:OnBindsChanged()
	UI.HudCargoWnd:OnBindsChanged()
	UI.HudGuidedMissileWnd:OnBindsChanged()
	UI.HudQuestTrackerWnd:OnBindsChanged()

end


--
function UI.HudWnd:ShowGameMsg( strId, params )

	UI.HudGameMsg:ShowMsg( strId, params )

end


--
function UI.HudWnd:HideGameMsg()

	UI.HudGameMsg:HideMsg()

end


--
function UI.HudWnd:GameChat_AddBattleLogMessage( id, params )

	UI.HudKillsWnd:GameChat_AddBattleLogMessage( id, params )
	UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage( id, params )

end


--
function UI.HudWnd:OnLootCrateHarvested( defName, amount )

	UI.HudCargoWnd:OnLootCrateHarvested( defName, amount )	
	
	UI.HudLootNotifyWnd:Setup( defName, amount )
	self:CheckAddWnd( UI.HudLootNotifyWnd, true )

end


--
function UI.HudWnd:OnLootCrateDropped()

	UI.HudCargoWnd:OnLootCrateDropped()

end


--
function UI.HudWnd:OnCargoHoldItemConsumed()

	UI.HudCargoWnd:OnCargoHoldItemConsumed()
	
end


--
function UI.HudWnd:OnCargoHoldResized()

	UI.HudCargoWnd:OnCargoHoldResized()
	
end


--
function UI.HudWnd:ModuleChanged( slotId )

	UI.HudModulesWnd:ModuleChanged( slotId )
	
end


--
function UI.HudWnd:OnPlayerTeamChanged( isLocalPlayer ) 

	if isLocalPlayer then
		UI.HudForcesInfoControlWnd:OnLocalPlayerTeamChanged() 
	end

	UI.HudPlayersWnd:OnPlayerTeamChanged()
	UI.HudPlayersWnd2_friends:OnPlayerTeamChanged()
	UI.HudPlayersWnd2_enemies:OnPlayerTeamChanged()
	UI.LoadingScreen_PlayersWnd:OnPlayerTeamChanged()

end


--
function UI.HudWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled ) 

	UI.HudForcesInfoPveMissionWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled )
	UI.HudForcesInfoControlWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled )

end


--
function UI.HudWnd:OnClientStatsToggleBind()

	UI.HudClientStatsWnd:OnClientStatsToggleBind()

end


--
function UI.HudWnd:ShowResurrectionWndByPlayer( resurrectorPlayerIdx )

	UI.HudResurrectWnd:SetupForResurrectionByPlayer( resurrectorPlayerIdx )
	self:CheckAddWnd( UI.HudResurrectWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end



--
function UI.HudWnd:ShowResurrectionWndByPremium( interval )

	UI.HudResurrectWnd:SetupForResurrectionByPremium( interval )
	self:CheckAddWnd( UI.HudResurrectWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:ShowResurrectionWndByCredits( creditsPrice )

	UI.HudResurrectWnd:SetupForResurrectionByCredits( creditsPrice )
	self:CheckAddWnd( UI.HudResurrectWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:ShowResurrectionWndByNothing()

	UI.HudResurrectWnd:SetupForResurrectionByNothing()
	self:CheckAddWnd( UI.HudResurrectWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:ShowResurrectionWndResurrectOtherPlayer( otherPlayerIdx, creditsPrice )

	UI.HudResurrectWnd:SetupForResurrectionOtherPlayer( otherPlayerIdx, creditsPrice )
	self:CheckAddWnd( UI.HudResurrectWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:HideResurrectionWnd( bResurrect )

	if type( bResurrect ) ~= "boolean" then
		sys.log( "UI.HudWnd:HideResurrectionWnd()[ERROR]: invalid type of the 1-st parameter (\"bResurrect\"); \"boolean\" expected, got \"%s\"", type( bResurrect ) )
		bResurrect = false
	end

	UI.HudResurrectWnd:Reset()
	UI.HudResurrectWnd:UnlinkFromParent()

	if bResurrect then
		if self.mode == self.modes.GLOBAL_MAP or self.mode == self.modes.GLOBAL_MAP_SPECTATOR then
			self:SetMode( self:DetectGameMode() )
		end
	end

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:OnProgressBarVisibilityChanged( wnd )

	self:RecalcProgressBarsLayout()

end


--
function UI.HudWnd:OnShowPredictionUnderMouseOptionChanged()

	UI.HudObjectsMarksWnd:OnShowPredictionUnderMouseOptionChanged()

end


--
function UI.HudWnd:OnShowGameplayInfoOptionChanged()

	local wnds =
	{
		UI.HudPvpGameplayInfoWnd,
		UI.HudPveGameplayInfoWnd,
	}
	
	for idx, wnd in pairs( wnds ) do
	
		local bNeedShow = self:CanAddWnd( wnd )
		local bIsShown = wnd:IsChildOf( self )
		
		if bNeedShow and not bIsShown then
			self:CheckAddWnd( wnd, true )
			
		elseif not bNeedShow and bIsShown then
			wnd:UnlinkFromParent()
			self:RecalcQuestTrackerLayout()
		end
	
	end

end


--
function UI.HudWnd:OnShowQuestTrackeOptionChanged()

	local bNeedShow = self:CanAddWnd_HudQuestTrackerWnd( UI.HudQuestTrackerWnd )
	local bIsShown = UI.HudQuestTrackerWnd:IsChildOf( self )
	
	if bNeedShow and not bIsShown then
		self:CheckAddWnd( UI.HudQuestTrackerWnd, true )
		
	elseif not bNeedShow and bIsShown then
		UI.HudQuestTrackerWnd:UnlinkFromParent()
		self:RecalcQuestTrackerLayout()
	end

end


-- Параметры result и requestId не используются в cpp
function UI.HudWnd:ShowQuestEventWnd( result, requestId, questId, stageIdx, eventIdx )

	local action =
	{
		wndName			= "HudQuestDialogWnd",
		setupFnName		= "ShowDialogForQuest",
		setupFnParams	= { questId, stageIdx, eventIdx },
	}

	self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

end


--
function UI.HudWnd:ShowAdventureEventWnd( result, requestId, atid, stageIdx, eventIdx )

	local action =
	{
		wndName			= "HudQuestDialogWnd",
		setupFnName		= "ShowDialogForAdventure",
		setupFnParams	= { atid, stageIdx, eventIdx },
	}

	self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

end


-- SC-115197
function UI.HudWnd:ShowScriptReward( reason, reward )

	-- перевод в "обычный" формат награды, т.к сразу в обычном передавать не выйдет, заполняется из с++ кода, где нет ряда констант
	local questReward = UI:ScriptRewardToQuestRewards( reward )
	
	-- надо перерисовать трюм, если выдали предметы
	if reward.items ~= nil then		
		UI.HudCargoWnd:UpdateCaption()
		UI.HudCargoWnd:UpdateSlots()
	end
	
	action =
	{
		wndName			= "HudQuestCompleteWnd",
		setupFnName		= "SetupScriptReward",
		setupFnParams	= { reason, questReward }
	}
	
	-- self.enqueueMode.FORCED чтобы сильно не переделывать HudQuestCompleteWnd
	UI.HudWnd:ShowWndEnqueued1( action, self.enqueueMode.FORCED )
end


--
function UI.HudWnd:ShowDialog( data )

	local action =
	{
		wndName			= "HudQuestDialogWnd",
		setupFnName		= "ShowDialog",
		setupFnParams	= { data },
	}

	self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

end


--
function UI.HudWnd:ShowScriptedDialog( dialogId, params )

	local action =
	{
		wndName			= "HudQuestDialogWnd",
		setupFnName		= "ShowScriptedDialog",
		setupFnParams	= { dialogId, params },
	}

	self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

end


--
function UI.HudWnd:HideScriptedDialog( dialogId )

	UI.HudQuestDialogWnd:HideScriptedDialog( dialogId )
	
end


--
function UI.HudWnd:OnToggleCargoModeBind()

	UI.HudCargoWnd:OnToggleCargoModeBind()
	
end


--
function UI.HudWnd:MasterServer_OnNotification( notification, params )

	UI.HudQuestTrackerWnd:MasterServer_OnNotification( notification, params )
	UI.HudObjectsMarksWnd:MasterServer_OnNotification( notification, params )

	if self:IsOnScreen() then
		if notification == _G.MasterServer.ServerNotification.SN_QUEST_COMPLETED then

        	local action =
        	{
        		wndName			= "HudQuestCompleteWnd",
        		setupFnName		= "Setup",
        		setupFnParams	= { params.questId, params.completionData },
        	}

        	self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

		elseif notification == _G.MasterServer.ServerNotification.SN_ADVENTURE_FINAL then

			local action =
			{
				wndName			= "HudQuestCompleteWnd",
				setupFnName		= "SetupAdventure",
				setupFnParams	= { params.completionData },
			}

			self:ShowWndEnqueued1( action, self.enqueueMode.CAN )

		end
	end

end


--
function UI.HudWnd:OnVoiceChatRecording( bSet )

	UI.HudVoiceChatSpeakersWnd:OnVoiceChatRecording( bSet )

end


--
function UI.HudWnd:OnVoiceChatPlayerTalking( playerId, bSet )

	UI.HudVoiceChatSpeakersWnd:OnVoiceChatPlayerTalking( playerId, bSet )

end


--
function UI.HudWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	UI.HudQuestTrackerWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.HudObjectsMarksWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

end


--
function UI.HudWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	UI.HudQuestTrackerWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.HudObjectsMarksWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

end


--
function UI.HudWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	UI.HudQuestTrackerWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.HudObjectsMarksWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

end


--
function UI.HudWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	UI.HudQuestTrackerWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )
	UI.HudObjectsMarksWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

end


function UI.HudWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

	--UI.HudObjectsMarksWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )
	--UI.HudQuestTrackerWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

end


--
function UI.HudWnd:MasterServer_OnNewAdventure( param )

	UI.HudQuestTrackerWnd:MasterServer_OnNewAdventure( param )
	UI.HudObjectsMarksWnd:MasterServer_OnNewAdventure( param )
	UI.HudAdventureWnd:MasterServer_OnNewAdventure( param )

end


--
function UI.HudWnd:MasterServer_OnAdventureFinal( param )

	UI.HudQuestTrackerWnd:MasterServer_OnAdventureFinal( param )
	UI.HudObjectsMarksWnd:MasterServer_OnAdventureFinal( param )
	UI.HudAdventureWnd:MasterServer_OnAdventureFinal( param )

end


--
function UI.HudWnd:MasterServer_OnAdventureStageChange( param )

	UI.HudQuestTrackerWnd:MasterServer_OnAdventureStageChange( param )
	UI.HudObjectsMarksWnd:MasterServer_OnAdventureStageChange( param )

end


--
function UI.HudWnd:OnLootNotifyHide()
	
	UI.HudLootNotifyWnd:UnlinkFromParent()

end


--
function UI.HudWnd:OnQuestCompleteHide()
	
	UI.HudQuestCompleteWnd:UnlinkFromParent()
	self:CheckWndsQueue1()

end


--
function UI.HudWnd:OnQuestDialogHide()

	UI.HudQuestDialogWnd:UnlinkFromParent()
	self:CheckWndsQueue1()

end


--
function UI.HudWnd:OnPlayerSqidChanged( playerIdx, sqid )

	UI.HudObjectsMarksWnd:OnPlayerSqidChanged( playerIdx, sqid )
	UI.HudMapWnd_map:OnPlayerSqidChanged( playerIdx, sqid )
	UI.HudMapWnd_radar:OnPlayerSqidChanged( playerIdx, sqid )
	UI.HudSpectatedNameWnd:OnPlayerSqidChanged( playerIdx, sqid )
	UI.HudFriendlyPlayersWnd:OnPlayerSqidChanged( playerIdx, sqid )

end


--
function UI.HudWnd:OnCargoWndHeightChanged()
	
	self:RecalcCargoLayout()

end


--
function UI.HudWnd:OnPveGameplayInfoSizeChanged()

	if UI.HudQuestTrackerWnd:IsChildOf( self ) then
		self:RecalcQuestTrackerLayout()
	end

end


--
function UI.HudWnd:OnPvpGameplayInfoSizeChanged()

	if UI.HudQuestTrackerWnd:IsChildOf( self ) then
		self:RecalcQuestTrackerLayout()
	end

end


--
function UI.HudWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.HudResurrectWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.HudWnd:OnInvasionInfo( spawned, killed )

	UI.HudQuestTrackerWnd:OnInvasionInfo( spawned, killed )

end


--
function UI.HudWnd:OnKillCamShowKiller( killerPlayerIdx, duration )

	if type( killerPlayerIdx ) ~= "number" then
		sys.log( "UI.HudWnd:OnKillCamShowKiller()[ERROR]: invalid type of the 1-st parameter (\"killerPlayerIdx\"); \"number\" epected, got \"%s\"", type( killerPlayerIdx ) )
		return
	end

	if killerPlayerIdx == -1 then
		return
	end

	local killerPlayerInfo = _G.GetPlayerInfo( killerPlayerIdx )
	if not killerPlayerInfo then
		sys.log( "UI.HudWnd:OnKillCamShowKiller()[ERROR]: cannot find player info for player %d", killerPlayerIdx )
		return
	end

	local motto = ""

	if killerPlayerInfo.motto ~= nil then

    	if type( killerPlayerInfo.motto ) == "string" then
			motto = killerPlayerInfo.motto
		else
    		sys.log( "UI.HudWnd:OnKillCamShowKiller()[ERROR]: invalid type of \"motto\" for player %d; \"string\" or nil epected, got \"%s\"", killerPlayerIdx, type( killerPlayerInfo.motto ) )
    	end

	end

	if motto == "" then
		return
	end

	local localPlayerId = self.localPlayerId
	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	if localPlayerTeam == killerPlayerInfo.team then
		return
	end
	
	-- SC-112574 насмешка от убийцы показывается тоолько если у самого игрока установлена активная насмешка
	local localPlayerInfo = _G.GetPlayerInfo( _G.Game_LocalClientNum() )
	if type( localPlayerInfo.motto ) ~= "string" or localPlayerInfo.motto == "" then
		return
	end

	UI.HudKillerMottoWnd:Setup( killerPlayerIdx )

	if not UI.HudKillerMottoWnd:IsChildOf( self ) then
    	
		self:CheckAddWnd( UI.HudKillerMottoWnd, true )

    	if self:IsOnScreen() then
    		self:UpdateKeyboardFocus()
    	end

	end

end


--
function UI.HudWnd:OnKillCamShowKillerEnd()

	if UI.HudKillerMottoWnd:GetPlayerId() == -1 then
		return
	end

	UI.HudKillerMottoWnd:Reset()

	if UI.HudKillerMottoWnd:IsChildOf( self ) then

		UI.HudKillerMottoWnd:UnlinkFromParent()

    	if self:IsOnScreen() then
    		self:UpdateKeyboardFocus()
    	end

	end

end


--
function UI.HudWnd:OnPveEventAcivate( id )

	UI.HudQuestTrackerWnd:OnPveEventAcivate( id )
	UI.HudObjectsMarksWnd:OnPveEventAcivate( id )

end


--
function UI.HudWnd:OnPveEventComplete( id )

	UI.HudQuestTrackerWnd:OnPveEventComplete( id )
	UI.HudObjectsMarksWnd:OnPveEventComplete( id )

end


--
function UI.HudWnd:OnPveEventProgress( id )

	UI.HudQuestTrackerWnd:OnPveEventProgress( id )

end


--
function UI.HudWnd:UIBossSpawned( id )	

	self:UpdateForcesInfo()

end


--
function UI.HudWnd:UIBossRemoved( id )
	
	self:UpdateForcesInfo()

end


--
function UI.HudWnd:OnChangeStatus()

	UI.HudAurasWnd_buffs:OnChangeStatus()
	UI.HudAurasWnd_debuffs:OnChangeStatus()
	UI.HudForcesInfoSentinelWnd:OnChangeStatus()

end


--
function UI.HudWnd:GetGameplayPveMapPos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjPos( self.effectInfo.main.gameplayPveMapLocator ) or UI:ZeroVec2()

end


--
function UI.HudWnd:OnBattleStationModuleStateChanged()

	UI.HudModulesWnd:OnBattleStationModuleStateChanged()

end


--
function UI.HudWnd:HudEditor_OnParamChanged( curConfigId, editorWndName, paramName )

	local wndInfo = UI.HudEditor.windowsInfo[ editorWndName ]
	
	if wndInfo.parentWnd then
		local wnd = UI[ wndInfo.parentWnd ]
		if wnd and wnd.HudEditor_OnParamChanged then
			wnd:HudEditor_OnParamChanged( curConfigId, editorWndName, paramName )
		end

	else
		for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
			local wnd = UI[ realWndName ]
			if wnd and wnd.HudEditor_OnParamChanged then
				wnd:HudEditor_OnParamChanged( curConfigId, editorWndName, paramName )
			end
		end
	end

	if self:IsOnScreen() then
	
		if curConfigId == UI.HudEditor:GetCurConfig() then
			
			if paramName == UI.HudEditor.POS_PARAM_NAME or paramName == UI.HudEditor.SIZE_PARAM_NAME then
				self:UpdateWindowsEditedPositionsByEditorName( editorWndName )
				
			elseif paramName == UI.HudEditor.VISIBLE_PARAM_NAME then
				self:UpdateWindowsEditedVisibilityByEditorName( editorWndName )
			end
			
		end
		
	end
	
end


--
function UI.HudWnd:HudEditor_OnCurConfigChanged()

	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		if wndInfo.parentWnd then
			local wnd = UI[ wndInfo.parentWnd ]
			if wnd and wnd.HudEditor_OnCurConfigChanged then
				wnd:HudEditor_OnCurConfigChanged()
			end
		else	
			for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
				local wnd = UI[ realWndName ]
				if wnd and wnd.HudEditor_OnCurConfigChanged then
					wnd:HudEditor_OnCurConfigChanged()
				end
			end
		end
		
	end
	
	if self:IsOnScreen() then
		self:UpdateWindowsEditedVisibility()
		self:UpdateWindowsEditedPositions()
	end
	
end


--
function UI.HudWnd:HudEditor_OnCancelChanges()
	
	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		if wndInfo.parentWnd then
			local wnd = UI[ wndInfo.parentWnd ]
			if wnd and wnd.HudEditor_OnCancelChanges then
				wnd:HudEditor_OnCancelChanges()
			end
		else
			for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
				local wnd = UI[ realWndName ]
				if wnd and wnd.HudEditor_OnCancelChanges then
					wnd:HudEditor_OnCancelChanges()
				end
			end
		end
		
	end
	
	if self:IsOnScreen() then
		self:UpdateWindowsEditedVisibility()
		self:UpdateWindowsEditedPositions()
	end
	
end


--
function UI.HudWnd:HudEditor_OnSaveChanges()
	
	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		if wndInfo.parentWnd then
			local wnd = UI[ wndInfo.parentWnd ]
			if wnd and wnd.HudEditor_OnSaveChanges then
				wnd:HudEditor_OnSaveChanges()
			end
		else
			for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
				local wnd = UI[ realWndName ]
				if wnd and wnd.HudEditor_OnSaveChanges then
					wnd:HudEditor_OnSaveChanges()
				end
			end
		end
		
	end
	
end


--
function UI.HudWnd:HudEditor_OnResetConfigToDefault( curConfigId )
	
	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		if wndInfo.parentWnd then
			local wnd = UI[ wndInfo.parentWnd ]
			if wnd and wnd.HudEditor_OnResetConfigToDefault then
				wnd:HudEditor_OnResetConfigToDefault( curConfigId )
			end
		else
			for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
				local wnd = UI[ realWndName ]
				if wnd and wnd.HudEditor_OnResetConfigToDefault then
					wnd:HudEditor_OnResetConfigToDefault( curConfigId )
				end
			end
		end
		
	end
	
	if self:IsOnScreen() then
	
		if curConfigId == UI.HudEditor:GetCurConfig() then
			self:UpdateWindowsEditedVisibility()
			self:UpdateWindowsEditedPositions()
		end
		
	end
	
end


--
function UI.HudWnd:ShowMarkNotify( entId, bYellow )

	if self.mode == self.modes.NONE then
		return
	end

	UI.HudObjectsMarksWnd:ShowMarkNotify( entId, bYellow )
	
end


--
function UI.HudWnd:HideMarkNotify( entId )

	UI.HudObjectsMarksWnd:HideMarkNotify( entId )
	
end


-- вызывается из дизайнерских скриптов
function UI.HudWnd:ShowPhaseProgressBar( strId, param1, param2 )
	
	if self.mode == self.modes.NONE then
		sys.log( "UI.HudWnd:ShowPhaseProgressBar()[ERROR]: hud is not inited" )
		return
	end
	
	UI.HudForcesInfoCustomWnd:Setup( strId, param1, param2 )

end


-- вызывается из дизайнерских скриптов
function UI.HudWnd:HidePhaseProgressBar()
	
	if self.mode == self.modes.NONE then
		return
	end
	
	UI.HudForcesInfoCustomWnd:Reset()
	
end



-- коллбэк, вызвается из UI.HudForcesInfoCustomWnd
function UI.HudWnd:OnHudForcesInfoCustomWndDataChanged()
	
	self:UpdateForcesInfo()
	
end


--
function UI.HudWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	UI.HudPlayersWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.HudPlayersWnd2_friends:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.HudPlayersWnd2_enemies:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.HudTargetViewWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.ShipSelectionWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

end


--
function UI.HudWnd:OnUnlimPveMissionLevelChanged( newLevel )

	UI.ShipSelectionWnd:OnUnlimPveMissionLevelChanged( newLevel )
	UI.HudPlayersWnd:OnUnlimPveMissionLevelChanged( newLevel )
	UI.HudPlayersWnd2_friends:OnUnlimPveMissionLevelChanged( newLevel )
	UI.HudPlayersWnd2_enemies:OnUnlimPveMissionLevelChanged( newLevel )

end


--
function UI.HudWnd:OnWavePveStartWaveChanged( newStartWave )

	UI.ShipSelectionWnd:OnWavePveStartWaveChanged( newStartWave )
	UI.HudPlayersWnd:OnWavePveStartWaveChanged( newStartWave )
	UI.HudPlayersWnd2_friends:OnWavePveStartWaveChanged( newStartWave )
	UI.HudPlayersWnd2_enemies:OnWavePveStartWaveChanged( newStartWave )

end


-- хак, используется HudWarningsWnd для подсчета кораблей, которые залочили корабль игрока
function UI.HudWnd:GetMarks()

	return UI.HudObjectsMarksWnd:GetMarks()
	
end


--
function UI.HudWnd:OnScriptedQuestAdd( questId )

	UI.HudQuestTrackerWnd:OnScriptedQuestAdd( questId )

end


--
function UI.HudWnd:OnScriptedQuestRemove( questId )

	UI.HudQuestTrackerWnd:OnScriptedQuestRemove( questId )
	
end


--
function UI.HudWnd:OnScriptedQuestProgress( questId )

	UI.HudQuestTrackerWnd:OnScriptedQuestProgress( questId )
	
end


--
function UI.HudWnd:OnHudMarkTimersChanged( timers )

	UI.HudObjectsMarksWnd:OnHudMarkTimersChanged( timers )

end


--
function UI.HudWnd:ShowMultiLootCrateWnd()

	if UI.HudMultiLootCrateWnd:IsChildOf( self ) then
		return
	end

	if self.mode == self.modes.NONE then
		sys.log( "UI.HudWnd:ShowMultiLootCrateWnd()[ERROR]: hud is not inited" )
		return
	end
	
	self:CheckAddWnd( UI.HudMultiLootCrateWnd, true )

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:HideMultiLootCrateWnd()

	if not UI.HudMultiLootCrateWnd:IsChildOf( self ) then
		return
	end

	UI.HudMultiLootCrateWnd:Reset()
	UI.HudMultiLootCrateWnd:UnlinkFromParent()

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:ShowAdventureWnd()

	if UI.HudAdventureWnd:IsChildOf( self ) and not UI.HudAdventureWnd:IsActive() then
		return
	end

	if self.mode == self.modes.NONE then
		sys.log( "UI.HudWnd:ShowAdventureWnd()[ERROR]: hud is not inited" )
		return
	end

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:HideAdventureWnd()

	if not UI.HudAdventureWnd:IsChildOf( self ) then
		return
	end

	if self:IsOnScreen() then
		self:UpdateKeyboardFocus()
	end

end


--
function UI.HudWnd:OnInteractionStart( interactionType, crateEnt )

	UI.HudMultiLootCrateWnd:OnInteractionStart( interactionType, crateEnt )
	UI.HudAdventureWnd:OnInteractionStart( interactionType, crateEnt )

end


--
function UI.HudWnd:OnInteractionStop()

	UI.HudMultiLootCrateWnd:OnInteractionStop()
	UI.HudAdventureWnd:OnInteractionStop()

end


--
function UI.HudWnd:OnMultipleLootCrateChanged()

	UI.HudMultiLootCrateWnd:OnMultipleLootCrateChanged()

end


--
function UI.HudWnd:CanReactOnPrimaryFireCmd()

	return self:CanReactOnGameCommand( "primaryFire" )

end


--
function UI.HudWnd:CanReactOnSecondaryFireCmd()
	
	return self:CanReactOnGameCommand( "secondaryFire" )

end


--
function UI.HudWnd:OnHudBossChanged( bossId )
	
	self:UpdateForcesInfo()
	
end


-- ------------------------------
-- const
-- ------------------------------

hw.layers =
{
	MAIN_EFFECT				= 0,
	BG_EFFECT           	= 1,
	PROGRESS_BARS_EFFECT	= 2,
	WORK_EFFECT_1			= 3,
	WORK_EFFECT_2			= 4,
}

hw.enqueueMode =
{
	NONE	= 0,
	CAN		= 1,
	FORCED	= 2,
}

hw.modes =
{
	NONE							= 0,
	SELECT_SHIP						= 1,
	GAME							= 2,
	GLOBAL_MAP						= 3,
	WARP							= 4,
	DEATH							= 5,
	GUIDED_MISSILE					= 6,
	GUIDED_MISSILE_BLOW				= 7,
	GAME_SPECTATOR					= 8,
	GLOBAL_MAP_SPECTATOR			= 9,
	WARP_SPECTATOR					= 10,
	DEATH_SPECTATOR					= 11,
	GUIDED_MISSILE_SPECTATOR		= 12,
	GUIDED_MISSILE_BLOW_SPECTATOR	= 13,
	WIN_LOSE						= 14,
	LOOT							= 15,
	WAIT_DISCONNECT					= 16,
	USER_HIDE						= 17,
	TUTORIAL_LOSE					= 18,
}

hw.IS_FULL_SCREEN	= true

hw.FADE_TIME = 0.1

hw.effectInfo =
{
	main =
	{
		gameplayPveMapLocator	= "map",
		playerStatusLocator		= "karma",
		forcesInfoLocator		= "ratio",
	},

	progressBars =
	{
		slotPrefix	= "prog_1_"
	},

	work1 =
	{
		questTrackerLocator		= "quests_2",
		pveGameplayInfoLocator	= "gmp_info",
	},

	work2 =
	{
		resurrectLocator		= "resurrection",
		voiceChatLocator		= "who_says",
		lootNotifyLocator1		= "loot_found_1",
		lootNotifyLocator2		= "loot_found_2",
		questCompleteLocator	= "quests_finish",
	},
}

hw.windowsOrder =
{
	"HudVignetteTurretWnd",
	"HudVignetteLowHpWnd",
	"HudVignetteMapWnd",
	"HudGuidedMissileWnd",
	"HudClientStatsWnd",
	"HudForcesInfoWnd",
	"HudForcesInfoControlWnd",
	"HudForcesInfoSentinelWnd",
	"HudForcesInfoPveMissionWnd",
	"HudForcesInfoBombWnd",
	"HudForcesInfoCloseDistWnd",
	"HudForcesInfoKingWnd",
	"HudForcesInfoTdmWnd",
	"HudForcesInfoGtdmWnd",
	"HudForcesInfoThreeTdmWnd",
	"HudForcesInfoClanShipWnd",
	"HudForcesInfoCustomWnd",
	"HudForcesInfoHungerWnd",
	"HudForcesinfoOAAWnd",
	"HudBossHpWnd",
	"HudPlayerStatusWnd",
	"HudCargoWnd",
	"HudDamageDirWnd",
	"HudObjInteractionWnd",
	"HudCaptureVpWnd",
	"HudBuildingProgressWnd",
	"HudAdditionalCmdProgressWnd",
	"HudBomberIcoWnd",
	"HudMapWnd_map",
	"HudMapWnd_radar",
	"HudModulesWnd",
	"HudAurasWnd_buffs",
	"HudAurasWnd_debuffs",
	"HudTutorialInfoWnd",
	"HudGameplayInfoWnd",
	"HudZoneNameWnd",
	"HudFriendlyPlayersWnd",
	"HudQuestTrackerWnd",
	"HudPlayersWnd",
	"HudPlayersWnd2_friends",
	"HudPlayersWnd2_enemies",
	"HudLeaveBattlefieldWnd",
	"HudLeaveSwarmControlZoneWnd",
	"HudSwarmEmergencyTimerWnd",
	"HudNoAlivePlayersWnd",
	"HudWowWnd",
	"HudGameMsg",
	"HudMedalsWnd",
	"HudKillsWnd",
	"HudDeathInfoWnd",
	"HudTimerWnd",
	"HudPvpGameplayInfoWnd",
	"HudPveGameplayInfoWnd",
	"HudObjectsMarksWnd",
	"HudWarningsWnd",
	"HudSpectatedNameWnd",
	"HudPlayerShipInfoWnd",
	"HudIncomingStates",
	"ShipSelectionWnd",
	"HudTargetViewWnd",
	"HudGlobalMapControlsWnd",
	"HudVoiceChatSpeakersWnd",
	"HudEfficiencyWnd",
	"HudGuidedMissileCursorWnd",
	"HudCursorWnd",
	"HudResurrectWnd",
	"HudKillerMottoWnd",
	"WinLoseWnd",
	"LootWnd",
	"HudLootNotifyWnd",
	"HudQuestDialogWnd",
	"HudQuestCompleteWnd",
	"HudMultiLootCrateWnd",

	"HudAdventureWnd",
}

hw.windowsByMode =
{
	[ hw.modes.SELECT_SHIP ] =
	{
		[ "HudVignetteMapWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = false,	-- SC-112600#focus=streamItem-4-623632.0-0
		[ "HudBossHpWnd" ] = true,
		[ "HudPlayersWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "ShipSelectionWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
	},

	[ hw.modes.GAME ] =
	{

		[ "HudVignetteTurretWnd" ] = true,
		[ "HudVignetteLowHpWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudMultiLootCrateWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudDamageDirWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true,
		[ "HudCaptureVpWnd" ] = true,
		[ "HudBuildingProgressWnd" ] = true,
		[ "HudAdditionalCmdProgressWnd" ] = true,
		[ "HudBomberIcoWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudModulesWnd" ] = true,
		[ "HudAurasWnd_buffs" ] = true,
		[ "HudAurasWnd_debuffs" ] = true,
		[ "HudLeaveBattlefieldWnd" ] = true,
		[ "HudLeaveSwarmControlZoneWnd" ] = true,
		[ "HudSwarmEmergencyTimerWnd" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTutorialInfoWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudWarningsWnd" ] = true,
		[ "HudPlayerShipInfoWnd" ] = true,
		[ "HudIncomingStates" ] = true,
		[ "HudTargetViewWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudCursorWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,

		[ "HudAdventureWnd" ] = true,
	},

	[ hw.modes.GLOBAL_MAP ] =
	{
		[ "HudVignetteMapWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPlayersWnd" ] = true,
		[ "HudLeaveBattlefieldWnd" ] = true,
		[ "HudLeaveSwarmControlZoneWnd" ] = true,
		[ "HudSwarmEmergencyTimerWnd" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudGlobalMapControlsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
	},

	[ hw.modes.WARP ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,
	},

	[ hw.modes.DEATH ] =
	{

		[ "HudClientStatsWnd" ] = true,
		[ "HudLeaveBattlefieldWnd" ] = true,
		[ "HudLeaveSwarmControlZoneWnd" ] = true,
		[ "HudSwarmEmergencyTimerWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true, -- #0041584
		[ "HudKillerMottoWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudDeathInfoWnd" ] = true,
	},
	
	[ hw.modes.GUIDED_MISSILE_BLOW ] =
	{

		[ "HudClientStatsWnd" ] = true,
		[ "HudLeaveBattlefieldWnd" ] = true,
		[ "HudLeaveSwarmControlZoneWnd" ] = true,
		[ "HudSwarmEmergencyTimerWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true, -- #0041584
		[ "HudKillerMottoWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
	},
	
	[ hw.modes.DEATH_SPECTATOR ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true, -- #0041584
		[ "HudKillerMottoWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
	},
	
	[ hw.modes.GUIDED_MISSILE_BLOW_SPECTATOR ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true, -- #0041584
		[ "HudKillerMottoWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
	},

	[ hw.modes.GAME_SPECTATOR ] =
	{
		[ "HudVignetteTurretWnd" ] = true,
		[ "HudVignetteLowHpWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudDamageDirWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true,
		[ "HudCaptureVpWnd" ] = true,
		[ "HudBuildingProgressWnd" ] = true,
		[ "HudAdditionalCmdProgressWnd" ] = true,
		[ "HudBomberIcoWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudModulesWnd" ] = true,
		[ "HudAurasWnd_buffs" ] = true,
		[ "HudAurasWnd_debuffs" ] = true,
		[ "HudWowWnd" ] = true,
    	[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTutorialInfoWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudWarningsWnd" ] = true,
		[ "HudSpectatedNameWnd" ] = true,
		[ "HudPlayerShipInfoWnd" ] = true,
		[ "HudIncomingStates" ] = true,
		[ "HudTargetViewWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudCursorWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,
	},

	[ hw.modes.GLOBAL_MAP_SPECTATOR ] =
	{
		[ "HudVignetteMapWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPlayersWnd" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudGlobalMapControlsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
	},

	[ hw.modes.WARP_SPECTATOR ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudSpectatedNameWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,
	},

	[ hw.modes.WIN_LOSE ] =
	{
		[ "HudEfficiencyWnd" ] = true,
		[ "WinLoseWnd" ] = true,			-- WinLoseWnd должно быть проинициалазировано заранее, в ShowWinLoseWnd()		
		[ "HudClientStatsWnd" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
	},
		
	[ hw.modes.LOOT ] =
	{
		[ "HudVignetteMapWnd" ] = true,
		[ "LootWnd" ] = true,				-- LootWnd должно быть проинициалазировано заранее, в ShowWinLoseWnd(), в ShowLoot()
		[ "HudClientStatsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
	},	

	[ hw.modes.WAIT_DISCONNECT ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
	},

	[ hw.modes.USER_HIDE ] =
	{
	},


	[ hw.modes.GUIDED_MISSILE ] =
	{
		[ "HudGuidedMissileWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudDamageDirWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true,
		[ "HudCaptureVpWnd" ] = true,
		[ "HudBuildingProgressWnd" ] = true,
		[ "HudAdditionalCmdProgressWnd" ] = true,
		[ "HudBomberIcoWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudLeaveBattlefieldWnd" ] = true,
		[ "HudLeaveSwarmControlZoneWnd" ] = true,
		[ "HudSwarmEmergencyTimerWnd" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTutorialInfoWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudPlayerShipInfoWnd" ] = true,
		[ "HudIncomingStates" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudGuidedMissileCursorWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,
	},

	[ hw.modes.GUIDED_MISSILE_SPECTATOR ] =
	{
		[ "HudGuidedMissileWnd" ] = true,
		[ "HudClientStatsWnd" ] = true,
		[ "HudForcesInfoWnd" ] = true,
		[ "HudForcesInfoControlWnd" ] = true,
		[ "HudForcesInfoSentinelWnd" ] = true,
		[ "HudForcesInfoPveMissionWnd" ] = true,
		[ "HudForcesInfoBombWnd" ] = true,
		[ "HudForcesInfoCloseDistWnd" ] = true,
		[ "HudForcesInfoKingWnd" ] = true,
		[ "HudForcesInfoTdmWnd" ] = true,
		[ "HudForcesInfoGtdmWnd" ] = true,
		[ "HudForcesInfoThreeTdmWnd" ] = true,
		[ "HudForcesInfoClanShipWnd" ] = true,
		[ "HudForcesInfoCustomWnd" ] = true,
		[ "HudForcesInfoHungerWnd" ] = true,
		[ "HudForcesinfoOAAWnd"] = true,
		[ "HudBossHpWnd" ] = true,
		[ "HudCargoWnd" ] = true,
		[ "HudPlayerStatusWnd" ] = true,
		[ "HudDamageDirWnd" ] = true,
		[ "HudObjInteractionWnd" ] = true,
		[ "HudCaptureVpWnd" ] = true,
		[ "HudBuildingProgressWnd" ] = true,
		[ "HudAdditionalCmdProgressWnd" ] = true,
		[ "HudBomberIcoWnd" ] = true,
		[ "HudMapWnd_map" ] = true,
		[ "HudMapWnd_radar" ] = true,
		[ "HudWowWnd" ] = true,
		[ "HudGameMsg" ] = true,
		[ "HudMedalsWnd" ] = true,
		[ "HudKillsWnd" ] = true,
		[ "HudTutorialInfoWnd" ] = true,
		[ "HudTimerWnd" ] = true,
		[ "HudGameplayInfoWnd" ] = true,
		[ "HudZoneNameWnd" ] = true,
		[ "HudFriendlyPlayersWnd" ] = true,
		[ "HudQuestTrackerWnd" ] = true,
		[ "HudPvpGameplayInfoWnd" ] = true,
		[ "HudPveGameplayInfoWnd" ] = true,
		[ "HudObjectsMarksWnd" ] = true,
		[ "HudPlayerShipInfoWnd" ] = true,
		[ "HudIncomingStates" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
		[ "HudEfficiencyWnd" ] = true,
		[ "HudGuidedMissileCursorWnd" ] = true,
		[ "HudResurrectWnd" ] = true,
		[ "HudNoAlivePlayersWnd" ] = true,
		[ "HudQuestDialogWnd" ] = true,
		[ "HudQuestCompleteWnd" ] = true,
		[ "HudLootNotifyWnd" ] = true,
		[ "HudPlayersWnd2_friends" ] = true,
		[ "HudPlayersWnd2_enemies" ] = true,
	},

	[ hw.modes.TUTORIAL_LOSE ] =
	{
		[ "HudClientStatsWnd" ] = true,
		[ "HudVoiceChatSpeakersWnd" ] = true,
	},
}

-- ------------------------------
-- vars
-- ------------------------------

hw.bInited								= false
hw.mode									= -1
hw.bMissileDestroyed					= false
hw.debugHudSavedVal						= 0
hw.bOculus								= cvars.g_oculusVR ~= 0
hw.spaceY_pveGameplayInfo_questTracker	= 0
hw.distX_pveGameplayInfo_questTracker	= 0
hw.distX_forcesInfo_playerStatus		= 0
hw.distY_forcesInfo_playerStatus		= 0
hw.myShip								= nil
hw.localPlayerId						= -1
hw.wndsQueue1							= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:PrepareLayout()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_END_LEVEL )	

end


--
function UI.HudWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local work1Effect	= UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT_1 )
	
	local pveGameplayInfoPos		= work1Effect and work1Effect:GetObjPos( self.effectInfo.work1.pveGameplayInfoLocator ) or Vec2( 0, 0 )
	local questTrackerPos			= work1Effect and work1Effect:GetObjPos( self.effectInfo.work1.questTrackerLocator ) or Vec2( 0, 0 )
	local pveGameplayInfoHeight		= UI.HudPveGameplayInfoWnd:GetMaxHeight()
	local playerStatusPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.playerStatusLocator ) or Vec2( 0, 0 )
	local forcesInfoPos				= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.forcesInfoLocator ) or Vec2( 0, 0 )	
	
	self.spaceY_pveGameplayInfo_questTracker	= questTrackerPos.y - ( pveGameplayInfoPos.y + pveGameplayInfoHeight )
	self.distX_pveGameplayInfo_questTracker		= questTrackerPos.x - pveGameplayInfoPos.x
	self.distX_forcesInfo_playerStatus			= playerStatusPos.x - forcesInfoPos.x
	self.distY_forcesInfo_playerStatus			= playerStatusPos.y - forcesInfoPos.y
	
	-- tODO нужна нормальная позиция для HudMultiLootCrateWnd
	local crateWidth = UI.HudMultiLootCrateWnd:GetWidth()
	local crateHeight = UI.HudMultiLootCrateWnd:GetHeight()
	local crateX = ( 1024 - crateWidth ) / 2
	local crateY = ( 768 - crateHeight ) / 2
	UI.HudMultiLootCrateWnd:SetPos( crateX, crateY )

end


--
function UI.HudWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.bInited = false

	self.myShip			= nil
	self.localPlayerId	= -1

	self:SetMode( self.modes.NONE )

	UI.HudObjectsMarksWnd:Reset()
	UI.HudMapWnd_map:Reset()
	UI.HudMapWnd_radar:Reset()
	UI.HudWowWnd:Reset()
	UI.HudGameMsg:Reset()
	UI.HudEfficiencyWnd:Reset()
	UI.HudResurrectWnd:Reset()
	UI.HudQuestDialogWnd:Reset()
	UI.HudQuestTrackerWnd:Reset()
	UI.HudVoiceChatSpeakersWnd:Reset()
	UI.HudKillerMottoWnd:Reset()
	UI.HudBossHpWnd:ResetOnGameEnd()
	UI.HudQuestCompleteWnd:Reset()
	UI.HudDeathInfoWnd:Reset()
	UI.HudAdventureWnd:Reset()

	self.bMissileDestroyed = false
	self.wndsQueue1 = {}

end


-- oberload from FullScreenWnd
function UI.HudWnd:FullUpdate()
	-- nothing
end


--
function UI.HudWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self.myShip			= _G.CL_GetLocalPlayerShip()
	self.localPlayerId	= _G.Game_LocalClientNum()

	self:UpdateMode()

	if self.bMissileDestroyed then
		UI.HudWarningsWnd:OnGuidedMissileDestroyed()
		self.bMissileDestroyed = false
	end

	local gameMode = _G.GetCurrentGameMode()
	if gameMode == ai.Gameplay.FREE_SPACE then
		UI.HangarWnd:CheckInvite( true )
	end
	
	self:CheckHideHudDeathInfoWnd()

end


--
function UI.HudWnd:UpdateMode()

	if self:IsNonBreakableMode( self.mode ) then
		return
	end

	local mode = self:DetectGameMode()

	local bNeedChange = false

	if mode ~= self.mode then

		if self.mode == self.modes.GLOBAL_MAP or self.mode == self.modes.GLOBAL_MAP_SPECTATOR then
			bNeedChange = mode == self.modes.DEATH or mode == self.modes.DEATH_SPECTATOR or mode == self.modes.GUIDED_MISSILE_BLOW or mode == self.modes.GUIDED_MISSILE_BLOW_SPECTATOR
		else
			bNeedChange = true
		end

	end

	if bNeedChange then
		self:SetMode( mode )
	end

end


--
function UI.HudWnd:IsNonBreakableMode( mode )

	return
		mode == self.modes.NONE or
		mode == self.modes.SELECT_SHIP or
		mode == self.modes.WIN_LOSE or
		mode == self.modes.LOOT or
		mode == self.modes.WAIT_DISCONNECT or
		mode == self.modes.USER_HIDE or
		mode == self.modes.TUTORIAL_LOSE

end


--
function UI.HudWnd:DetectGameMode()

	local playerId		= self.localPlayerId
	local spectateId	= _G.GetSpectatorTargetIdx()
	local ship			= _G.CL_GetPlayerShip( spectateId )

	local bSpectator	= playerId ~= spectateId
	local bWarp			= ship and ship:IsSpawnWarpActive()
	local bDead			= not ship or ship:IsDead()
	local killCamState	= _G.CL_GetKillCamState()
	local bMissile		= ship and ship:IsGuidedMissileMode()
	
	if killCamState == ai.KillCamState.KILL_CAM_GUIDED_ROCKET then
		return bSpectator and self.modes.GUIDED_MISSILE_BLOW_SPECTATOR or self.modes.GUIDED_MISSILE_BLOW
		
	elseif killCamState ~= ai.KillCamState.KILL_CAM_NONE or bDead then
		return bSpectator and self.modes.DEATH_SPECTATOR or self.modes.DEATH

	elseif bWarp then
		return bSpectator and self.modes.WARP_SPECTATOR or self.modes.WARP

	elseif bMissile then
		return bSpectator and self.modes.GUIDED_MISSILE_SPECTATOR or self.modes.GUIDED_MISSILE

	else
		return bSpectator and self.modes.GAME_SPECTATOR or self.modes.GAME
	end

end


--
function UI.HudWnd:SetMode( mode )

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.HudWnd:SetMode()[ERROR]: invalid mode; one of the \"UI.HudWnd.modes\" values expected, got \"%s\"", tostring( mode ) )
		return
	end

	if mode == self.mode then
		return
	end

	local prevMode = self.mode
	self.mode = mode
	
	self:UpdateControls( prevMode )

	self:UpdateKeyboardFocus()
	self:UpdateCameraMode()

	-- переход из- и в- режим управляемой ракеты осуществляется через фэйд
	local isMissile = self.mode == self.modes.GUIDED_MISSILE or self.mode == self.modes.GUIDED_MISSILE_SPECTATOR
	local wasMissile = prevMode == self.modes.GUIDED_MISSILE or prevMode == self.modes.GUIDED_MISSILE_SPECTATOR

	if ( isMissile and not wasMissile ) or ( not isMissile and wasMissile ) then
		self:FadeFromBlack()
	end

	UI:UpdateChatVisibility()

	-- #0027726
	if not UI.bSavingGameState then

		if self.mode == self.modes.USER_HIDE then
			self.debugHudSavedVal = cvars.cl_drawHUD
			cvars.cl_drawHUD = 0

    	elseif prevMode == self.modes.USER_HIDE then
    		cvars.cl_drawHUD = self.debugHudSavedVal
    	end

	end

	if self:IsOnScreen() then
		UI:UpdateFullScreenUIParams()
	end

	UI:SendUiEvent( UI.EV_HUD_MODE_CHANGED, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.mode, prevMode, 0, 0 )

end


--
function UI.HudWnd:UpdateControls( prevMode )

	self:HideControls()
	
	for orderIdx, wndName in ipairs( self.windowsOrder ) do
		self:CheckAddWnd( UI[ wndName ], false )
	end
	
	if self.bOculus and UI.HudCursorWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.HudCursorWnd )
	end
	
end


--
function UI.HudWnd:CheckAddWnd( wnd, bCheckZorder )

	if bCheckZorder == nil then
		bCheckZorder = true
	end
	
	if not self:CanAddWnd( wnd ) then
		return
	end

	self:AddChild( wnd )
	
	-- особые случаи взаимного расположения элементов
	
	if wnd == UI.HudLootNotifyWnd or wnd == UI.HudQuestCompleteWnd or wnd == UI.HudQuestDialogWnd then
		self:RecalcLootNotifyLayout()
	end
	
	if wnd == UI.HudObjInteractionWnd or wnd == UI.HudCaptureVpWnd or wnd == UI.HudBuildingProgressWnd or wnd == UI.HudAdditionalCmdProgressWnd then
		self:RecalcProgressBarsLayout()
	end
	
	if wnd == UI.HudQuestTrackerWnd or wnd == UI.HudPveGameplayInfoWnd or wnd == UI.HudPvpGameplayInfoWnd then
		self:RecalcQuestTrackerLayout()
	end
	
	-- порядок отрисовки
	
	if bCheckZorder then
	
		local orderIdx = -1
		local wndName = wnd:GetName()
		
		for _orderIdx, _wndName in ipairs( self.windowsOrder ) do
			if _wndName == wndName then
				orderIdx = _orderIdx
				break
			end
		end
		
		if orderIdx ~= -1 then
		
			for _orderIdx = orderIdx + 1, #self.windowsOrder  do
			
				local _wndName = self.windowsOrder[ _orderIdx ]
				local _wnd = UI[ _wndName ]
				
				if _wnd and _wnd:IsChildOf( self ) then
					self:MoveChildBefore( wnd, _wnd )
					break
				end
			
			end
		
		end
		
		if self.bOculus and UI.HudCursorWnd:IsChildOf( self ) then
			self:MoveChildToFirstPosition( UI.HudCursorWnd )
		end
		
	end
	
end


--
function UI.HudWnd:CanAddWnd( wnd )

	local windowsForMode = self.windowsByMode[ self.mode ]
	if windowsForMode == nil then
		return false
	end
	
	local realWndName = wnd:GetName()
	if windowsForMode[ realWndName ] ~= true then
		return false
	end
		
	local editorWndName = UI.HudEditor:GetWndEditorName( realWndName )
	if editorWndName ~= "" and not UI.HudEditor:IsWndVisible( editorWndName ) then
		return false
	end
			
	local fnName = string.format( "CanAddWnd_%s", realWndName )
	local fn = self[ fnName ]
	if fn and not fn( self ) then
		return false
	end
	
	return true
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoControlWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoControlWnd

end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoSentinelWnd()
	
	return self:GetForcesInfoWnd() == UI.HudForcesInfoSentinelWnd

end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoPveMissionWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoPveMissionWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoBombWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoBombWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoCloseDistWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoCloseDistWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoKingWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoKingWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoTdmWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoTdmWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoGtdmWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoGtdmWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoThreeTdmWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoThreeTdmWnd

end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoClanShipWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoClanShipWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoCustomWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoCustomWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesInfoHungerWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesInfoHungerWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudForcesinfoOAAWnd()

	return self:GetForcesInfoWnd() == UI.HudForcesinfoOAAWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudBossHpWnd()
	
	return self:GetForcesInfoWnd() == UI.HudBossHpWnd
	
end


--
function UI.HudWnd:CanAddWnd_HudPlayerStatusWnd()
	
	return self:GetForcesInfoWnd() == UI.HudPlayerStatusWnd

end


--
function UI.HudWnd:GetForcesInfoWnd()

	local wnd = nil
	
	if UI.HudForcesInfoCustomWnd:IsDataToShow() then
	
		wnd = UI.HudForcesInfoCustomWnd
		
	else

		local gameplay = _G.GetCurrentGameMode()

		if gameplay == ai.Gameplay.CONTROL or gameplay == ai.Gameplay.APRIL_CONTROL then
			wnd = UI.HudForcesInfoControlWnd

		elseif gameplay == ai.Gameplay.PRACTICE then
			wnd = UI.HudForcesInfoControlWnd

		elseif gameplay == ai.Gameplay.ZOMBIE then
			wnd = UI.HudForcesInfoControlWnd

		elseif gameplay == ai.Gameplay.SENTINEL then
			wnd = UI.HudForcesInfoSentinelWnd

		elseif gameplay == ai.Gameplay.PVE_MISSION then

			if UI:GetPveBossId( true ) == -1 then

				local bShow = true

				local missionDef = _G.PvE_Missions[ _G.CL_PveGetMissionName() ]
				if type( missionDef ) == "table" then
					if missionDef.waves_ui_hide ~= nil then
						if type( missionDef.waves_ui_hide ) == "boolean" then
							if missionDef.waves_ui_hide then
								bShow = false
							end
						else
							sys.log( "UI.HudWnd:GetForcesInfoWnd()[ERROR]: invalid type of _G.PvE_Missions[\"%s\"].waves_ui_hide; \"boolean\" or \"nil\" expected, got \"%s\"", _G.CL_PveGetMissionName(), type( missionDef.waves_ui_hide ) )
						end
					end
				else
					sys.log( "UI.HudWnd:GetForcesInfoWnd()[ERROR]: invalid type of _G.PvE_Missions[\"%s\"]; \"table\" expected, got \"%s\"", _G.CL_PveGetMissionName(), type( missionDef ) )
				end

				if bShow then
					wnd = UI.HudForcesInfoPveMissionWnd
				end
				
			else
				wnd = UI.HudBossHpWnd
			end

		elseif gameplay == ai.Gameplay.BOMB_THE_BASE then
			wnd = UI.HudForcesInfoBombWnd

		elseif gameplay == ai.Gameplay.CLOSE_DISTANCE then
			wnd = UI.HudForcesInfoCloseDistWnd

		elseif gameplay == ai.Gameplay.KING_OF_THE_HILL then
			wnd = UI.HudForcesInfoKingWnd

		elseif gameplay == ai.Gameplay.TDM then
			wnd = UI.HudForcesInfoTdmWnd

		elseif gameplay == ai.Gameplay.GTDM or gameplay == ai.Gameplay.ATDM or gameplay == ai.Gameplay.AUTOGEN_DM then
			wnd = UI.HudForcesInfoGtdmWnd

		elseif gameplay == ai.Gameplay.THREE_TEAMS_DM then
			wnd = UI.HudForcesInfoThreeTdmWnd

		elseif gameplay == ai.Gameplay.CLANSHIP then
			wnd = UI.HudForcesInfoClanShipWnd
			
		elseif gameplay == ai.Gameplay.FOOTBALL then
			wnd = UI.HudForcesInfoTdmWnd
			
		elseif gameplay == ai.Gameplay.HUNGER_GAMES or gameplay == ai.Gameplay.BATTLE_ROYALE then
			wnd = UI.HudForcesInfoHungerWnd
			
		elseif gameplay == ai.Gameplay.ONE_AGAINST_ALL then
			wnd = UI.HudForcesinfoOAAWnd
			
		elseif gameplay == ai.Gameplay.FREE_SPACE then
		
			local bossId = _G.CL_GetHudBossId()
			if bossId ~= -1 then
				wnd = UI.HudBossHpWnd
			else
				wnd = UI.HudPlayerStatusWnd
			end
			
		else
			if gameplay ~= ai.Gameplay.TUTORIAL then
				wnd = UI.HudForcesInfoWnd
			end
		end
		
	end
	
	return wnd

end


--
function UI.HudWnd:UpdateForcesInfo()
		
	-- только одно из этих окон может быть на экране
	local wnds =
	{
		UI.HudForcesInfoWnd,
		UI.HudForcesInfoControlWnd,
		UI.HudForcesInfoSentinelWnd,
		UI.HudForcesInfoPveMissionWnd,
		UI.HudForcesInfoBombWnd,
		UI.HudForcesInfoCloseDistWnd,
		UI.HudForcesInfoKingWnd,
		UI.HudForcesInfoTdmWnd,
		UI.HudForcesInfoGtdmWnd,
		UI.HudForcesInfoThreeTdmWnd,
		UI.HudForcesInfoClanShipWnd,
		UI.HudForcesInfoCustomWnd,
		UI.HudForcesInfoHungerWnd,
		UI.HudForcesinfoOAAWnd,
		UI.HudBossHpWnd,
		UI.HudPlayerStatusWnd,
	}
	
	local wndToShow = self:GetForcesInfoWnd()
	
	for idx, wnd in pairs( wnds ) do
	
		if wnd == wndToShow then
			self:CheckAddWnd( wnd, true )
		else
			wnd:UnlinkFromParent()
		end
	
	end

end


--
function UI.HudWnd:CanAddWnd_HudBomberIcoWnd()

	local gameplay = _G.GetCurrentGameMode()
	return gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE or gameplay == ai.Gameplay.CLANSHIP

end


--
function UI.HudWnd:CanAddWnd_HudTutorialInfoWnd()

	return _G.GetCurrentGameMode() == ai.Gameplay.TUTORIAL

end


--
function UI.HudWnd:CanAddWnd_HudKillsWnd()

	return _G.GetCurrentGameMode() ~= ai.Gameplay.TUTORIAL

end


--
function UI.HudWnd:CanAddWnd_HudPlayersWnd()

	return _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE
	
end


--
function UI.HudWnd:CanAddWnd_HudPlayersWnd2_friends()

	return _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE
	
end


--
function UI.HudWnd:CanAddWnd_HudPlayersWnd2_enemies()

	return _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE
	
end


--
function UI.HudWnd:CanAddWnd_HudCargoWnd()

	local gameplay = _G.GetCurrentGameMode()
	return gameplay == ai.Gameplay.FREE_SPACE or gameplay == ai.Gameplay.BATTLE_ROYALE

end


--
function UI.HudWnd:CanAddWnd_HudLootNotifyWnd()

	return UI.HudLootNotifyWnd:HasContentToShow() and _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE
	
end


--
function UI.HudWnd:CanAddWnd_HudQuestCompleteWnd()

	return UI.HudQuestCompleteWnd:HasContentToShow() and _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE

end


--
function UI.HudWnd:CanAddWnd_HudQuestDialogWnd()

	return UI.HudQuestDialogWnd:HasContentToShow()

end


--
function UI.HudWnd:CanAddWnd_HudGameplayInfoWnd()

	local gameplay = _G.GetCurrentGameMode()
	return gameplay ~= ai.Gameplay.FREE_SPACE and not UI:IsPvpGameplay( gameplay ) and gameplay ~= ai.Gameplay.PRACTICE

end


--
function UI.HudWnd:CanAddWnd_HudPvpGameplayInfoWnd()

	local gameplay = _G.GetCurrentGameMode()
	return
		gameplay == ( ai.Gameplay.PRACTICE or UI:IsPvpGameplay( gameplay ) )
		and UI.Options:GetHudOptionVal( "showGameplayInfo" )

end


--
function UI.HudWnd:CanAddWnd_HudPveGameplayInfoWnd()

	return
		_G.GetCurrentGameMode() == ai.Gameplay.PVE_MISSION
		and UI.Options:GetHudOptionVal( "showGameplayInfo" )

end


--
function UI.HudWnd:CanAddWnd_HudZoneNameWnd()

	 return _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE

end


--
function UI.HudWnd:CanAddWnd_HudResurrectWnd()

	return UI.HudResurrectWnd:GetMode() ~= -1

end


--
function UI.HudWnd:CanAddWnd_HudQuestTrackerWnd()

	local gameplay = _G.GetCurrentGameMode()
	return
		( gameplay == ai.Gameplay.FREE_SPACE or gameplay == ai.Gameplay.PVE_MISSION or UI:IsPvpGameplay( gameplay ) ) and _G.GetCurrentBattleType() ~= ai.BattleType.BRAWL
		and ( gameplay == ai.Gameplay.FREE_SPACE or UI.Options:GetHudOptionVal( "showQuestTracker" ) )

end


--
function UI.HudWnd:CanAddWnd_HudKillerMottoWnd()

	return UI.HudKillerMottoWnd:GetPlayerId() ~= -1

end


--
function UI.HudWnd:CanAddWnd_HudMultiLootCrateWnd()

	return UI.HudMultiLootCrateWnd:IsLootCrateToShow()
	
end


--
function UI.HudWnd:CanAddWnd_HudDeathInfoWnd()

	-- SC-112043 подходит не любая камера смерти, например во время KILL_CAM_WRECK_CAM это окно не показывается
	-- (эта камера включается после KILL_CAM_SHOW_DEATH/KILL_CAM_SHOW_KILLER если нет спектатора, и на ней остается висеть)
	local killCamState = _G.CL_GetKillCamState()
	
	return
		killCamState == ai.KillCamState.KILL_CAM_SHOW_DEATH
		or killCamState == ai.KillCamState.KILL_CAM_SHOW_DEATH_THEN_KILLER
		or killCamState == ai.KillCamState.KILL_CAM_SHOW_KILLER

end


--
function UI.HudWnd:HideControls()

	self:RemoveAllChildren( false )

end


--
function UI.HudWnd:UpdateCameraMode()

	local bNeedLookWorld	= self:IsWorldLookMode( self.mode )
	local lookMode			= _G.CL_GetLookMode()

	if bNeedLookWorld and lookMode ~= UI.LookMode.LOOK_WORLD then
		sys.concmd( "ship_lookWorld true" )

	elseif not bNeedLookWorld and lookMode == UI.LookMode.LOOK_WORLD then
		sys.concmd( "ship_lookWorld false" )
	end	

end


--
function UI.HudWnd:IsWorldLookMode( mode )

	return
		mode == self.modes.SELECT_SHIP or
		mode == self.modes.GLOBAL_MAP or
		mode == self.modes.GLOBAL_MAP_SPECTATOR or
		mode == self.modes.LOOT or
		mode == self.modes.WAIT_DISCONNECT or
		mode == self.modes.TUTORIAL_LOSE

end


--
function UI.HudWnd:F_OnAfterShowOnScreen()

	self.myShip 		= _G.CL_GetLocalPlayerShip()
	self.localPlayerId	= _G.Game_LocalClientNum()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )
	self:UpdateKeyboardFocus()
	self:UpdateWindowsEditedVisibility()
	self:UpdateWindowsEditedPositions()

end


--
function UI.HudWnd:F_OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
		self:UpdateKeyboardFocus()

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.HudWnd:UpdateKeyboardFocus()

	local bNeedFocus = self:IsOnScreen() 
					and ( self:IsKbFocusMode( self.mode )
					or UI.HudResurrectWnd:IsChildOf( self )
					or UI.HudMultiLootCrateWnd:IsChildOf( self )
					or ( UI.HudAdventureWnd:IsChildOf( self ) and UI.HudAdventureWnd:IsActive() ) )

	if bNeedFocus then
		UI.HudWnd:CaptureKeyboardFocus()
	else
		UI.HudWnd:ReleaseKeyboardFocus()
	end

end


--
function UI.HudWnd:IsKbFocusMode( mode )

	return
		mode == self.modes.SELECT_SHIP or
		mode == self.modes.GLOBAL_MAP or
		mode == self.modes.GLOBAL_MAP_SPECTATOR or
		mode == self.modes.WIN_LOSE or
		mode == self.modes.LOOT or
		mode == self.modes.WAIT_DISCONNECT or
		mode == self.modes.DEATH

end


--
function UI.HudWnd:NeedMuteFxSounds()

	return UI.HudWnd:IsKbFocusMode( self.mode ) and self.mode ~= UI.HudWnd.modes.DEATH--[[SC-112144]]
	
end


--
function UI.HudWnd:CaptureKeyboardFocus()

	self:RemoveStyle( UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT )
	self:SetActivationOrder( 0 )

	local hFocus = UI:GetKeyboardFocus()
	if hFocus == self:GetUiHandle() then
		return
	end

	UI:ValidateKeyboardFocus()

end


--
function UI.HudWnd:ReleaseKeyboardFocus()

	self:SetActivationOrder( -1 )
	self:AddStyle( UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT )

	local hFocus = UI:GetKeyboardFocus()
	if hFocus ~= self:GetUiHandle() then
		return
	end

	UI:ValidateKeyboardFocus()

end


--
function UI.HudWnd:F_OnLostKeyboardFocus()

	self:OnLostKeyboardFocus()

	-- потеря фокуса может быть связана с показом месседжбокса;
	-- в этом случае параметры, необходимые для фокуса, не сбрасываются, чтобы после
	-- выхода из месседжбокса фокус восстановился на худе

	if not self:IsOnScreen() then
		self:ReleaseKeyboardFocus()
	end

end


--
function UI.HudWnd:OnEscape()
	
	if UI.HudMultiLootCrateWnd:IsChildOf( self ) then
		self:HideMultiLootCrateWnd()

	elseif self.mode == self.modes.GLOBAL_MAP or self.mode == self.modes.GLOBAL_MAP_SPECTATOR then
		self:SetMode( self:DetectGameMode() )

	elseif self.mode == self.modes.LOOT then
		UI.LootWnd:OnEscape()

	elseif UI.HudAdventureWnd:IsChildOf( self ) and UI.HudAdventureWnd:IsActive() then
		UI.HudAdventureWnd:OnEscape()

	else
		UI:ShowPauseMenu()
	end

	return true

end


--
function UI.HudWnd:OnEnter()

	UI:CheckStartChatInput()
	return true

end


--
function UI.HudWnd:TryUserHide()

    if self:CanUserHide() then
    	self:SetMode( self.modes.USER_HIDE )
    end

end


--
function UI.HudWnd:CanUserHide()

	return
		self.mode == self.modes.GAME or
		self.mode == self.modes.WARP or
		self.mode == self.modes.DEATH or
		self.mode == self.modes.GUIDED_MISSILE or
		self.mode == self.modes.GUIDED_MISSILE_BLOW or
		self.mode == self.modes.GAME_SPECTATOR or
		self.mode == self.modes.WARP_SPECTATOR or
		self.mode == self.modes.DEATH_SPECTATOR or
		self.mode == self.modes.GUIDED_MISSILE_SPECTATOR or
		self.mode == self.modes.GUIDED_MISSILE_BLOW_SPECTATOR

end


--
function UI.HudWnd:TryShowGlobalMap()

	if self:CanShowGlobalMap() then
		self:SetMode( self:IsSpectator() and self.modes.GLOBAL_MAP_SPECTATOR or self.modes.GLOBAL_MAP )
	end

end


--
function UI.HudWnd:CanShowGlobalMap()

	if UI.Tutorial:IsActive() and UI.Tutorial:GetStage() ~= _G.MasterServer.TutorialStage.TUT_FIRST_FIGHT then
		return false
	end

	return
		self.mode == self.modes.GAME or
		self.mode == self.modes.WARP or
		self.mode == self.modes.GUIDED_MISSILE or
		self.mode == self.modes.GAME_SPECTATOR or
		self.mode == self.modes.WARP_SPECTATOR or
		self.mode == self.modes.GUIDED_MISSILE_SPECTATOR

end


--
function UI.HudWnd:IsSpectator()

	local playerId		= self.localPlayerId
	local spectateId	= _G.GetSpectatorTargetIdx()

	return playerId ~= spectateId

end


--
function UI.HudWnd:F_OnEventEndLevel( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.HudWnd:AddHudObjMark( entityId )

	UI.HudObjectsMarksWnd:AddHudObj( entityId )
	UI.HudMapWnd_map:AddHudObj( entityId )
	UI.HudMapWnd_radar:AddHudObj( entityId )

end


--
function UI.HudWnd:F_OnEventSaveUiState()

	UI.store.HudWnd =
	{
		bInited				= self.bInited,
		mode 				= self.mode,
		debugHudSavedVal	= self.debugHudSavedVal,
		wndsQueue1			= self.wndsQueue1,
	}

end


--
function UI.HudWnd:F_OnEventRestoreUiState()

	if UI.store.HudWnd then		

		self.bInited = UI.store.HudWnd.bInited

		if UI.store.HudWnd.mode ~= self.modes.NONE then
			self.myShip 		= _G.CL_GetLocalPlayerShip()
			self.localPlayerId	= _G.Game_LocalClientNum()
		end

		self.debugHudSavedVal	= UI.store.HudWnd.debugHudSavedVal
		self.wndsQueue1			= UI.store.HudWnd.wndsQueue1

		self:SetMode( UI.store.HudWnd.mode )

		UI.store.HudWnd = nil

	end

end


--
function UI.HudWnd:FadeFromBlack()

	-- этот фэйд работает более чем странно - без cl_fadeout cl_fadein не работает

	cvars.fadeOutColor = 0xff000000
	sys.concmd( string.format( "cl_fadeout %f", 0 ) )
	cvars.fadeInColor = 0x00000000
	sys.concmd( string.format( "cl_fadein %f", self.FADE_TIME ) )

end


--
function UI.HudWnd:RecalcProgressBarsLayout()

	self:UpdateWndEditedPosition( UI.HudObjInteractionWnd )
	self:UpdateWndEditedPosition( UI.HudCaptureVpWnd )
	self:UpdateWndEditedPosition( UI.HudBuildingProgressWnd )
	self:UpdateWndEditedPosition( UI.HudAdditionalCmdProgressWnd )

end


--
function UI.HudWnd:RecalcLootNotifyLayout()
	
	local effect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT_2 )
	if not effect then
		return
	end

	local handle = UI.HudLootNotifyWnd:GetUiHandle()

	effect:UnlinkWnd( handle, "" )

	local locator =
		( UI.HudQuestCompleteWnd:IsOnScreen() or UI.HudQuestDialogWnd:IsOnScreen() )
			and self.effectInfo.work2.lootNotifyLocator2
			or self.effectInfo.work2.lootNotifyLocator1

	effect:LinkWnd( handle, locator, UI.EffectAnimParams.POS )

end


--
function UI.HudWnd:RecalcCargoLayout()

	self:UpdateWndEditedPosition( UI.HudCargoWnd )
	
end


--
function UI.HudWnd:RecalcQuestTrackerLayout()
	
	self:UpdateWndEditedPosition( UI.HudQuestTrackerWnd )

end


--
function UI.HudWnd:ShowWndEnqueued1( action, mode )

	local bSetup = false

	local wnd = UI[ action.wndName ]

	if wnd:IsChildOf( self ) and  mode ~= self.enqueueMode.FORCED then

		if action.setupFnName ~= "" then
			wnd[ action.setupFnName ]( wnd, unpack( action.setupFnParams ) )
		end

		bSetup = true

	else

		local altWnds = { "HudQuestCompleteWnd", "HudQuestDialogWnd" }

		local bAltWndActive = false
		for idx, altWndName in pairs( altWnds ) do

			if altWndName ~= action.wndName or mode == self.enqueueMode.FORCED then

				local altWnd = UI[ altWndName ]
				if altWnd and altWnd:HasContentToShow() then
					bAltWndActive = true
					break
				end

			end

		end

		if bAltWndActive then

			if mode ~= self.enqueueMode.NONE then
				table.insert( self.wndsQueue1, action )
			end

		else

    		if action.setupFnName ~= "" then
				wnd[ action.setupFnName ]( wnd, unpack( action.setupFnParams ) )
			end
			
			self:CheckAddWnd( wnd, true )

			bSetup = true

		end

	end

	return bSetup

end


--
function UI.HudWnd:CheckWndsQueue1()

	if not next( self.wndsQueue1 ) then
		return
	end

	local action = self.wndsQueue1[ 1 ]

	if self:ShowWndEnqueued1( action, self.enqueueMode.NONE ) then
		table.remove( self.wndsQueue1, 1 )
	end

end


--
function UI.HudWnd:UpdateWindowsEditedPositions()

	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
		self:UpdateWindowsEditedPositionsByEditorName( editorWndName )
	end

end


--
function UI.HudWnd:UpdateWindowsEditedPositionsByEditorName( editorWndName )

	local wndInfo = UI.HudEditor.windowsInfo[ editorWndName ]
	
	if wndInfo.parentWnd then
	
		local parentWnd = UI[ wndInfo.parentWnd ]
		if parentWnd then
			self:UpdateWndEditedPosition( nil, editorWndName, parentWnd )
		end
		
	else
	
		for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
			local wnd = UI[ realWndName ]
			if wnd then
				self:UpdateWndEditedPosition( wnd, editorWndName )
			end
		end

	end

end


--
function UI.HudWnd:UpdateWndEditedPosition( wnd, editorWndName, parentWnd )

	if editorWndName == nil then
		editorWndName = UI.HudEditor:GetWndEditorName( wnd:GetName() )
	end

	local posRaw	= UI.HudEditor:GetWndPos( editorWndName )
	local pos		= Vec2( UI:XRel2Snapped( posRaw.x ), UI:YRel2Snapped( posRaw.y ) )
	
	if parentWnd then
	
		if parentWnd == UI.HudModulesWnd then
			
			if editorWndName == "HudModulesWnd_weapon" then
				UI.HudModulesWnd:SetWeaponPos( pos )
				
			elseif editorWndName == "HudModulesWnd_rockets" then
				UI.HudModulesWnd:SetRocketsPos( pos )
				
			elseif editorWndName == "HudModulesWnd_activeModules" then
				UI.HudModulesWnd:SetActiveModulesPos( pos )
				
			elseif editorWndName == "HudModulesWnd_passiveModules" then
				UI.HudModulesWnd:SetPassiveModulesPos( pos )
				
			elseif editorWndName == "HudModulesWnd_specModule" then
				UI.HudModulesWnd:SetSpecModulePos( pos )
				
			else
				sys.log( "UI.HudWnd:UpdateWndEditedPosition()[ERROR]: unhandled \"%s\"", editorWndName )
			end
		
		else
			sys.log( "UI.HudWnd:UpdateWndEditedPosition()[ERROR]: unhandled parent wnd for \"%s\"", editorWndName )
		end
	
	else
	
		if wnd == UI.HudQuestTrackerWnd then
		
			local x = UI:XRel2Snapped( posRaw.x + self.distX_pveGameplayInfo_questTracker )
			
			local y = pos.y
			if UI.HudPveGameplayInfoWnd:IsChildOf( self ) then
				y = UI:YRel2Snapped( posRaw.y + UI.HudPveGameplayInfoWnd:GetHeight() + self.spaceY_pveGameplayInfo_questTracker )
			elseif UI.HudPvpGameplayInfoWnd:IsChildOf( self ) then
				y = UI:YRel2Snapped( posRaw.y + UI.HudPvpGameplayInfoWnd:GetHeight() + self.spaceY_pveGameplayInfo_questTracker )
			end

			UI.HudQuestTrackerWnd:SetPos( x, y )
			
		elseif wnd == UI.HudPlayerStatusWnd then
		
			local x = UI:XRel2Snapped( posRaw.x + self.distX_forcesInfo_playerStatus )
			local y = UI:YRel2Snapped( posRaw.y + self.distY_forcesInfo_playerStatus )
			
			UI.HudPlayerStatusWnd:SetPos( x, y )
			
		elseif wnd == UI.HudCargoWnd then
		
			local x = pos.x
			local y = UI:YRel2Snapped( posRaw.y + UI.HudEditor:GetWndSize( editorWndName ).y - UI.HudCargoWnd:GetHeight() )
		
			UI.HudCargoWnd:SetPos( x, y )
			
		elseif wnd == UI.HudEfficiencyWnd then
		
			UI.HudEfficiencyWnd:SetDockedWndPos( pos )
			
		elseif wnd == UI.HudObjInteractionWnd then
			
			local progressBarsEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BARS_EFFECT )
			local slotPos = progressBarsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.progressBars.slotPrefix, 1 ) )
			
			local x = pos.x + slotPos.x
			local y = pos.y + slotPos.y
			
			UI.HudObjInteractionWnd:SetPos( x, y )
			
		elseif wnd == UI.HudCaptureVpWnd then
			
			local slotIdx = 1
			
			if UI.HudObjInteractionWnd:IsChildOf( self ) and UI.HudObjInteractionWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end
			
			local progressBarsEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BARS_EFFECT )
			local slotPos = progressBarsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.progressBars.slotPrefix, slotIdx ) )
			
			local x = pos.x + slotPos.x
			local y = pos.y + slotPos.y
			
			UI.HudCaptureVpWnd:SetPos( x, y )
			
		elseif wnd == UI.HudBuildingProgressWnd then
			
			local slotIdx = 1
			
			if UI.HudObjInteractionWnd:IsChildOf( self ) and UI.HudObjInteractionWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end
			
			if UI.HudCaptureVpWnd:IsChildOf( self ) and UI.HudCaptureVpWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end
			
			local progressBarsEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BARS_EFFECT )
			local slotPos = progressBarsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.progressBars.slotPrefix, slotIdx ) )
			
			local x = pos.x + slotPos.x
			local y = pos.y + slotPos.y
			
			UI.HudBuildingProgressWnd:SetPos( x, y )

		elseif wnd == UI.HudAdditionalCmdProgressWnd then
			
			local slotIdx = 1
			
			if UI.HudObjInteractionWnd:IsChildOf( self ) and UI.HudObjInteractionWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end
			
			if UI.HudCaptureVpWnd:IsChildOf( self ) and UI.HudCaptureVpWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end

			if UI.HudBuildingProgressWnd:IsChildOf( self ) and UI.HudBuildingProgressWnd:IsVisible() then
				slotIdx = slotIdx + 1
			end
			
			local progressBarsEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BARS_EFFECT )
			local slotPos = progressBarsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.progressBars.slotPrefix, slotIdx ) )
			
			local x = pos.x + slotPos.x
			local y = pos.y + slotPos.y
			
			UI.HudAdditionalCmdProgressWnd:SetPos( x, y )
			
		elseif wnd == UI.ChatWnd then
		
			UI.ChatWnd:UpdateEditedPos()
			
		elseif wnd ~= nil then
		
			wnd:SetPos( pos.x, pos.y )
			
		else
			sys.log( "UI.HudWnd:UpdateWndEditedPosition()[ERROR]: nil wnd" )
		end
		
	end

end


--
function UI.HudWnd:UpdateWindowsEditedVisibility()

	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
		self:UpdateWindowsEditedVisibilityByEditorName( editorWndName )
	end

end


--
function UI.HudWnd:UpdateWindowsEditedVisibilityByEditorName( editorWndName )

	local wndInfo = UI.HudEditor.windowsInfo[ editorWndName ]
	
	if wndInfo.parentWnd then
	
		local parentWnd = UI[ wndInfo.parentWnd ]
		if parentWnd then
			self:UpdateWndEditedVisibility( nil, editorWndName, parentWnd )
		end
		
	else
	
		for realWndIdx, realWndName in pairs( wndInfo.wnds ) do
			local wnd = UI[ realWndName ]
			if wnd then
				self:UpdateWndEditedVisibility( wnd, editorWndName )
			end
		end

	end

end


--
function UI.HudWnd:UpdateWndEditedVisibility( wnd, editorWndName, parentWnd )

	if editorWndName == nil then
		editorWndName = UI.HudEditor:GetWndEditorName( wnd:GetName() )
	end
	
	local bNeedVisible = UI.HudEditor:IsWndVisible( editorWndName )
	
	if parentWnd then
	
		if parentWnd == UI.HudModulesWnd then
			
			if editorWndName == "HudModulesWnd_weapon" then
				UI.HudModulesWnd:SetWeaponVisible( bNeedVisible )
				
			elseif editorWndName == "HudModulesWnd_rockets" then
				UI.HudModulesWnd:SetRocketsVisible( bNeedVisible )
				
			elseif editorWndName == "HudModulesWnd_activeModules" then
				UI.HudModulesWnd:SetActiveModulesVisible( bNeedVisible )
				
			elseif editorWndName == "HudModulesWnd_passiveModules" then
				UI.HudModulesWnd:SetPassiveModulesVisible( bNeedVisible )
				
			elseif editorWndName == "HudModulesWnd_specModule" then
				UI.HudModulesWnd:SetSpecModuleVisible( bNeedVisible )
				
			else
				sys.log( "UI.HudWnd:UpdateWndEditedVisibility()[ERROR]: unhandled \"%s\"", editorWndName )
			end
		
		else
			sys.log( "UI.HudWnd:UpdateWndEditedVisibility()[ERROR]: unhandled parent wnd for \"%s\"", editorWndName )
		end
		
	else
	
		if wnd then
		
			if editorWndName == "ChatWnd" then
			
				UI:UpdateChatVisibility()
				
			else
	
				local bIsVisible = wnd:IsChildOf( self )
				
				if bIsVisible and not bNeedVisible then
					wnd:UnlinkFromParent()
					
				elseif not bIsVisible and bNeedVisible then
					self:CheckAddWnd( wnd, true )
				end
				
			end
			
		else
			sys.log( "UI.HudWnd:UpdateWndEditedVisibility()[ERROR]: nul wnd" )
		end
		
	end
	
end


--
function UI.HudWnd:CanReactOnGameCommand( bindName )

	local bCanReact = false

	if	self:IsOnScreen()
		and UI:GetKeyboardFocus() == self:GetUiHandle()
		and ( self.mode == self.modes.DEATH or self.mode == self.modes.GAME_SPECTATOR or self.mode == self.modes.WARP_SPECTATOR or self.mode == self.modes.DEATH_SPECTATOR or self.mode == self.modes.GUIDED_MISSILE_SPECTATOR or self.mode == self.modes.GUIDED_MISSILE_BLOW_SPECTATOR ) then
	
		-- определяем, назначен ли бинд на мышь, если да, то реакции на команду не дожно быть, если под курсором находится реагирующее на мышь окно;
		-- на самом деле биндов может быть несколько на одну команду, и не во всех из них участвовать мышь, но здесь не известно, который из биндов реально сработал,
		-- поэтому для простоты считаем, что если хоть в одном есть мышь, то обрабатываем как для нее
		local bMouseKey = false
	
		local keySets = UI:GetBindKeys( bindName )
		for keySetIdx, keySet in ipairs( keySets ) do
			for keyIdx, keyName in ipairs( keySet ) do
				if keyName == "mouse1" or keyName == "mouse2" or keyName == "mouse3" or keyName == "mwheelup" or keyName == "mwheeldown" then
					bMouseKey = true
					break
				end
			end
		end
		
		-- если команда активируется мышью, то проверяем что под курсором нет окна, реагирующего на мышь;
		-- если такое окно есть, то команда не должна сработать
		if bMouseKey then
	
			local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
			if not wndUnderMouse or wndUnderMouse == UI.Root or wndUnderMouse == self then	-- стиль WS_NOT_MOUSE_REACT зачем-то выставляется в CaptureKeyboardFocus(), поэтому проверка на self
				bCanReact = true
			end
			
		else
			bCanReact = true
		end
	
	end
	
	return bCanReact

end


--
function UI.HudWnd:CheckHideHudDeathInfoWnd()

	if self.mode == self.modes.DEATH and UI.HudDeathInfoWnd:IsChildOf( self ) and not self:CanAddWnd_HudDeathInfoWnd() then
		UI.HudDeathInfoWnd:UnlinkFromParent()
	end

end