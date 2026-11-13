-- ----------------------------------------------------------------------------
--
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- Ui function for designers
--
-- ----------------------------------------------------------------------------
--  $Id: uipublic.lua 3528 2011-06-14 07:55:51Z $
-- ----------------------------------------------------------------------------

--
function UI:Preview( effectName, bTree, bAspectDependent )

	UI.EffectTreePreviewWnd:Show( effectName, bTree, bAspectDependent )

end


-- called from .cpp code
function UI:ShowGameHud()

	if not UI.HudWnd then
		sys.log( "UI:ShowGameHud()[ERROR]: table \"UI.HudWnd\" not found" )
		return
	end

	UI:InitDamageTypes()

	UI.HudWnd:Init()
	UI.HudWnd:Show()		

end


-- called from .cpp code
function UI:HideHud()

	if UI.HudWnd then
		UI.HudWnd:Hide()
	end

end


--
function UI:OnSpawnSpaceShip( shipEntityId )

	if not UI.HudWnd then
		return
	end

	UI.HudWnd:OnSpawnSpaceShip( shipEntityId )

end


--
function UI:OnSpawnAdventureGiver( giverId )

	if not UI.HudWnd then
		return
	end

	UI.HudWnd:OnSpawnAdventureGiver( giverId )

end


--
function UI:MasterServer_OnServerInfo( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )

end


-- 
function UI:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

	self:UpdateServerData_OnPlayerCredentials( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )
	UI.LinkSteamAccountWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnPlayerCredits" )

	self:UpdateServerData_OnPlayerCredits( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.GameplayShipSelectWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	end

end


--
function UI:MasterServer_OnPremiumStatus( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnPremiumStatus" )	

	self:UpdateServerData_OnPremiumStatus( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnPremiumStatus( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnOwnedVessels" )

	self:UpdateServerData_OnOwnedVessels( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnBattleSlots( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnBattleSlots" )

	self:UpdateServerData_OnBattleSlots( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnChangeEquipment" )

	self:UpdateServerData_OnChangeEquipment( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnStripEquipment( result, requestId, param1, param2, u64Param )

--	sys.out( "^5UI:GameStore_OnStripEquipment" )

	UI:UpdateServerData_OnStripEquipment( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnStripEquipment( result, requestId, param1, param2, u64Param )

end


--
function UI:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

--	sys.out( "^5UI:GameStore_OnTransferEquipment" )

	self:UpdateServerData_OnTransferEquipment( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

end


--
function UI:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnVesselEquipment" )

	self:UpdateServerData_OnVesselEquipment( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

end


-- ВНИМАНИЕ! индексы в vids с 0
function UI:GameStore_OnVesselsEquipment( vids )

--	sys.out( "^5UI:GameStore_OnVesselsEquipment" )

	self:UpdateServerData_OnVesselsEquipment( vids )
	UI.HangarWnd:GameStore_OnVesselsEquipment( vids )

end


--
function UI:GameStore_OnInventory( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnInventory" )

	self:UpdateServerData_OnInventory( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnAutogenInventory" )

	self:UpdateServerData_OnAutogenInventory( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnChangeBattleSlotVessel" )

	self:UpdateServerData_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnSwapBattleSlotVessels" )

	self:UpdateServerData_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	sys.log( "^5UI:MasterServer_OnEnterMMQueue" )

	UI.Squad:ReloadSquadList()
	UI.Universe:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	UI.HangarWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

end


--
function UI:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	sys.out( "^5UI:MasterServer_OnLeaveMMQueue" )

	UI.Universe:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	--UI.Squad:ReloadSquadList()

	if result == 0 then
	
		local reason = param2
	
		if reason == _G.MasterServer.MMLeaveReason.MMLR_OPPONENT_LEFT or reason == _G.MasterServer.MMLeaveReason.MMLR_PVE_OUT_OF_SCHEDULE then
		
			local reasonName = UI:Val2Key( _G.MasterServer.MMLeaveReason, reason )
			local strName = string.format( "msg_mmQueueLeave_text_%s", reasonName )
			local msg = UI:GetStringByName( strName )
		
			UI:MessageBox( UI:GetStringByName( "msg_mmQueueLeave_caption" ), msg, UI.MBS_OK )
			
		end
		
	end

end


--
function UI:MasterServer_OnUniverseConflictExpired( result, requestId, unused, unused, unused )

	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_battle_phase_expired" ), UI.MBS_OK )

end


--
function UI:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	
end


--
function UI:GameStore_OnLoadingComplete( storeSize )

	self:ServerDataUpdate_OnLoadingComplete( storeSize )
	UI.LoginWnd:GameStore_OnLoadingComplete()
	UI.HangarWnd:GameStore_OnLoadingComplete( storeSize )

end


--
function UI:GameStore_OnLoadingTimeout()

	UI.LoginWnd:GameStore_OnLoadingTimeout()
	UI.HangarWnd:GameStore_OnLoadingTimeout()

end


--
function UI:GameStore_OnChangeMunition( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnChangeMunition" )

	self:UpdateServerData_OnChangeMunition( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

--	sys.out( "^5UI:GameStore_OnTransferMunition" )

	self:UpdateServerData_OnTransferMunition( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

end


--
function UI:SkillManager_OnUpdate( result, requestId, param1, param2 )

--	sys.out( "^5UI:SkillManager_OnUpdate" )

end


--
function UI:SkillManager_OnLevelup( result, requestId, param1, param2 )

--	sys.out( "^5UI:SkillManager_OnLevelup" )

end


--
function UI:SkillManager_OnReset( result, requestId, param1, param2 )

--	sys.out( "^5UI:SkillManager_OnReset" )

end


--
function UI:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

--	sys.out( "^5UI:GameStore_OnBuyItem" )

	self:UpdateServerData_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId == 0 and result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		UI:ShowMsgOnBuyError( result )
	end

end


--
function UI:GameStore_OnSellItem( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnSellItem" )

	self:UpdateServerData_OnSellItem( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnSellItems( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnSellItems" )

	self:UpdateServerData_OnSellItems( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnSalvageItem( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnSalvageItem" )

	self:UpdateServerData_OnSalvageItem( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnDisassembleItem" )

	self:UpdateServerData_OnDisassembleItem( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnSellVessel( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnSellVessel" )

	self:UpdateServerData_OnSellVessel( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	
end


--
function UI:GameStore_OnExchangeGold( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnExchangeGold" )
	UI.HangarWnd:GameStore_OnExchangeGold( result, requestId, param1, param2 )	

end


--
function UI:MasterServer_OnBuyPremium( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnBuyPremium" )
	
	self:UpdateServerData_OnBuyPremium( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )	

end


--
function UI:GameStore_OnBuyGold( result, requestId, param1, param2 )

--	sys.out( "^5UI::GameStore_OnBuyGold" )
	UI.HangarWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	

end


--
function UI:MasterServer_GameEnded()

--	sys.out( "^5UI:MasterServer_GameEnded" )

	--UI.Chat:LeaveBattleChannel()
	UI.HangarWnd:MasterServer_GameEnded()

end


--
function UI:MasterServer_OnRejoinGame( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnRejoinGame" )

	UI.Chat:JoinBattleChannel()
	UI.HangarWnd:MasterServer_OnRejoinGame( result, requestId, param1, param2 )

end



--
function UI:MasterServer_OnNotification( notification, params )

	sys.out( string.format( "^5UI:MasterServer_OnNotification: %d", notification ) )
	dprint( params )

	if notification == MasterServer.ServerNotification.SN_REFEREE_ADDED then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end

	if notification == MasterServer.ServerNotification.SN_TEACHING_NOTIFICATION then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end

	UI:UpdateServerData_OnNotification( notification, params )
	UI.HangarWnd:MasterServer_OnNotification( notification, params )
	UI.AchievementWnd:MasterServer_OnNotification( notification, params )
	UI.Profile:MasterServer_OnNotification( notification, params )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnNotification( notification, params )
	end

end


--
function UI:MasterServer_OnNewsFeed( errcode, items )

--	sys.out( string.format( "^5UI:MasterServer_OnNewsFeed: code %d", errcode ) )
--	dprint( items )

	UI.LoginWnd:MasterServer_OnNewsFeed( errcode, items )
	
end


--
function UI:MasterServer_OnServerStatus( errcode, status )

--	sys.out( string.format( "^5UI:MasterServer_OnServerStatus: code %d", errcode ) )
--	dprint( status )

	UI.LoginWnd:MasterServer_OnServerStatus( errcode, status )
	
end


--
function UI:MasterServer_OnServerVersion( errcode, version )

--	sys.out( string.format( "^5UI:MasterServer_OnServerVersion: code %d", errcode ) )
--	dprint( version )

	UI.LoginWnd:MasterServer_OnServerVersion( errcode, version )
	
end


--
function UI:MasterServer_OnServerAddresess( errcode, servers )

--	sys.out( string.format( "^5UI:MasterServer_OnServerAddresess: code %d", errcode ) )
--	dprint( servers )

	UI.LoginWnd:MasterServer_OnServerAddresess( errcode, servers )
	
end


--
function UI:MasterServer_OnSteamIDLinked( errcode, isLinked )	
end


--
function UI:MasterServer_OnSetUserdata( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnSetUserdata" )
	UI:UpdateServerData_OnSetUserdata( result, requestId, param1, param2 )
	UI.AgreementWnd:MasterServer_OnSetUserdata( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnGetUserdata( result, requestId, param1, param2 )

--	sys.out( "^5UI:MasterServer_OnGetUserdata" )

	self:UpdateServerData_OnGetUserdata( result, requestId, param1, param2 )
	
end


--
function UI:GameStore_OnRefillMunition( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnRefillMunition" )

	self:UpdateServerData_OnRefillMunition( result, requestId, param1, param2 )	
	UI.HangarWnd:GameStore_OnRefillMunition( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnRefillBattleVessels( result, requestId, param1, param2 )

--	sys.out( "^5UI:GameStore_OnRefillBattleVessels" )

	self:UpdateServerData_OnRefillBattleVessels( result, requestId, param1, param2 )	
	UI.HangarWnd:GameStore_OnRefillBattleVessels( result, requestId, param1, param2 )

end


-- called from .cpp code
function UI:OnWaitPlayersTimerChanged()

	if UI.HudWnd then
		UI.HudWnd:OnWaitPlayersTimerChanged()
	end

end


-- called from .cpp code (асинхронный результат вызова CL_RequestProduceShip() )
function UI:OnProduceShipResponse( result, hangarSlot )

	if UI.HudWnd then
		UI.HudWnd:OnProduceShipResponse( result, hangarSlot )
	end

end


-- called from .cpp code
function UI:OnStartProduceShip( playerIdx, hangarSlot, timeLeft )

	if UI.HudWnd then
		UI.HudWnd:OnStartProduceShip( playerIdx, hangarSlot, timeLeft )
	end

end


-- called from .cpp code
function UI:OnStopProduceShip( playerIdx, hangarSlot )

	if UI.HudWnd then
		UI.HudWnd:OnStopProduceShip( playerIdx, hangarSlot )
	end

end


-- called from .cpp code
function UI:OnShipFactoryShipsChanged()

	if UI.HudWnd then
		UI.HudWnd:OnShipFactoryShipsChanged()
	end

end


-- called from .cpp code (асинхронный результат вызова CL_RequestWarehouseSlot() )
function UI:OnWarehouseSlotResponse( result, slotIdx )

	if UI.HudWnd then
		UI.HudWnd:OnWarehouseSlotResponse( result, slotIdx )
	end

end


-- called from .cpp code
function UI:OnLootDefNames( defNames )


end


-- called from .cpp code
function UI:OnRollWinners( winnerNames )


end


-- called from .cpp code
function UI:ShowShipSelectionWnd()

	if not UI.HudWnd then
		sys.log( "UI:ShowShipSelectionWnd()[ERROR]: table \"UI.HudWnd\" not found" )
		return
	end

	UI.HudWnd:ShowShipSelectionWnd()
	UI.HudWnd:Show()

end


-- called from .cpp code
function UI:HideShipSelectionWnd()

	if UI.HudWnd then
		UI.HudWnd:HideShipSelectionWnd()
	end

end


-- called from .cpp code
function UI:ShowWinLoseWnd( winnerTeam, finishReason, winReason, params )

	if not UI.HudWnd then
		sys.log( "UI:ShowWinLoseWnd()[ERROR]: table \"UI.HudWnd\" not found" )
		return
	end
	--sys.log( "ShowWinLoseWnd() winReason = %d %s", winReason, UI:Val2Key( ai.WinReason, winReason ) )
	
	UI.HudWnd:ShowWinLoseWnd( winnerTeam, winReason, params )
	UI.HudWnd:Show()		

end


-- called from .cpp code
function UI:HideWinLoseWnd()

	if UI.HudWnd then
		UI.HudWnd:HideWinLoseWnd()
	end

end


-- called from .cpp code 
-- (в текущей реaлизации spaceShipEntity - это всегда корабль наблюдаемого игрока)
-- вызывается когда аура начинает действовать на корабль
function UI:OnApplyAura( spaceShipEntity, auraEntityId )

	if UI.HudWnd then
		UI.HudWnd:OnApplyAura( spaceShipEntity, auraEntityId )
	end
	
end


-- called from .cpp code 
-- вызывается когда аура прекращает действовать на корабль
function UI:OnCancelAura( spaceShipEntity, auraEntityId )

	if UI.HudWnd then
		UI.HudWnd:OnCancelAura( spaceShipEntity, auraEntityId )
	end

end


-- called from .cpp code 
-- вызывается когда аура прикрепляется на корабль (она может действовать на него, а может и не действовать)
function UI:OnHoldAura( spaceShipEntity, auraEntityId )

	if UI.HudWnd then
		UI.HudWnd:OnHoldAura( spaceShipEntity, auraEntityId )
	end

end


-- called from .cpp code 
-- вызывается когда аура открепляется от корабля
function UI:OnDropAura( spaceShipEntity, auraEntityId )

	if UI.HudWnd then
		UI.HudWnd:OnDropAura( spaceShipEntity, auraEntityId )
	end

end


--
function UI:OnAuraStageChanged( auraEntityId )

	if UI.HudWnd then
		UI.HudWnd:OnAuraStageChanged( auraEntityId )
	end

end


-- called from binds
function UI:OnEscapeMenuBind()

	if UI:IsEditWndActive() then
		return
	end
	
	local interactionType = _G.CL_GetLocalPlayerInteraction()
	
	if interactionType == ai.InteractionType.FREE_SPACE_SAVE then
		_G.CL_RequestFreeSpaceSaveCancel()
		
	elseif interactionType == ai.InteractionType.SPACE_STATION_PORTAL then
		_G.CL_RequestSpaceStationPortalCancel()
		
	-- отмена интеракции с обломками корабля
	elseif interactionType == ai.InteractionType.RESURRECT
		or interactionType == ai.InteractionType.ADVENTURE_GIVER then

		_G.CL_RequestStopInteraction()
		
	else
		UI:ShowPauseMenu()
	end

end


-- called from binds
function UI:OnFreeMouseBind()

	if UI:IsEditWndActive() then
		return
	end

	self:CheckStartChatInput()

end


-- called from binds
function UI:OnFreeMouseWhilePressBind( bOn )

	if UI:IsEditWndActive() and bOn then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnFreeMouseWhilePressBind( bOn )
	end

end


-- called from binds
function UI:OnControlsBind()

	if UI:IsEditWndActive() then
		return
	end

	self:TryUserToggleContextHelp()

end


-- called from binds
function UI:OnToggleHudBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:ToggleVisibility()
	end

end


-- called from binds
function UI:OnShowHudBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:SetVisibility( true )
	end

end


-- called from binds
function UI:OnHideHudBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:SetVisibility( false )
	end

end


-- called from binds
function UI:OnToggleGlobalMapBind()

	if UI:IsEditWndActive() then
		return
	end

	-- #0045774 - игнорировать нажатия во время экрана загрузки,
	-- иначе при двойном нажатии будет глюк с камерой, 
	-- потому что в эту функцию зайдет повторно еще до ее окончания при выполнении sys.concmd() из UI.HudWnd:UpdateCameraMode(),
	-- которая начнет выполнять не только непосредственно вызванную команду, а всё, что в консоли накопилось невыполненного

	if UI:IsLoadingWndOnScreen() then
		return
	end	

	-- И чтобы таб не работал когда открыта карта мира. ( #38870 )
	if UI.GameplayPveMapHudContainerWnd:IsOnScreen() then
		return
	end
	
	if UI.HudEditorWnd and UI.HudEditorWnd:IsOnScreen() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnToggleGlobalMapBind()
	end

end


--
function UI:OnShowGlobalMapBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnShowGlobalMapBind()
	end

end


--
function UI:OnHideGlobalMapBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnHideGlobalMapBind()
	end

end


--
function UI:OnChatSlashBind()

	if cvars.cl_debugChat ~= 0 then
		return
	end

	if UI:IsChatInput() then
		return
	end

	UI:CheckStartChatInput()

	if UI:IsChatInput() then
		UI.Chat:OnAfterActivateWithSlash()
	end

end


--
function UI:OnChatPageUpBind()

	if cvars.cl_debugChat ~= 0 then
		return
	end

	if UI:IsChatVisible() then
		UI.Chat:OnChatPageUpBind()
	end

end


--
function UI:OnChatPageDownBind()

	if cvars.cl_debugChat ~= 0 then
		return
	end

	if UI:IsChatVisible() then
		UI.Chat:OnChatPageDownBind()
	end

end


-- called from .cpp code 
function UI:ShowWowMsg( strId, bGood, priority, params, time )

	--sys.out( "call UI:ShowWowMsg( %s, %s, %s )", tostring( strId ), tostring( bGood ), tostring( priority ) )

	if UI.HudWnd then
		UI.HudWnd:ShowWowMsg( strId, bGood, priority, params, time )
	end

end


-- called from .cpp code (нотификация когда локальный игрок наносит повреждения)
function UI:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )

	if UI.HudWnd then
		UI.HudWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )
	end

end


-- called from .cpp code (нотификация когда локальный игрок получает повреждения)
function UI:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )

	if UI.HudWnd then	
		UI.HudWnd:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )
	end

end


-- called from .cpp code (нотификация когда локальный игрок получает лечение)
function UI:OnPlayerGotHeal( healVal, healerEntityId, healerPlayerIdx )

	if UI.HudWnd then	
		UI.HudWnd:OnPlayerGotHeal( healVal, healerEntityId, healerPlayerIdx )
	end

end


--
function UI:ShowMainMenu( bForce )

	if UI.MenuWnd:IsOnScreen() and UI.MenuWnd:HasLevelOnStack( "main" ) then
		return
	end

	if not bForce then
    	if not UI.HangarWnd:IsOnScreen() then
    		sys.log( "UI:ShowMainMenu()[ERROR]: cannot show; hangar is not on screen")
    		return
    	end
	end

	UI:ShowMenuInternal( "main", {}, nil, true )

end


-- called from binds
function UI:ShowPauseMenu( bForce )

	if self.frames_afterLoading ~= -1 then
		return
	end	

	if UI.MenuWnd:IsOnScreen() and UI.MenuWnd:HasLevelOnStack( "Pause" ) then
		return
	end

	if not bForce then

    	if not( UI.HudWnd and UI.HudWnd:IsOnScreen() ) then
			return
		end

	end

	-- TODO: sound
	UI:ShowMenuInternal( "Pause", {}, nil, true )

end


-- called from cpp code
function UI:OnHackChatExit()
	
	self:StopChatInput()	
	
end


-- called from cpp code
function UI:GameChat_OnConnect()

	UI:ChatCheckSetDefaultChannel()

end


-- called from cpp code
function UI:GameChat_OnDisconnect()

	-- nothing
	--

end


-- called from cpp code
function UI:GameChat_AddMessage( uid, nickName, channel, text, isGm )

	if UI.Chat then
		UI.Chat:AddMessage( uid, nickName, channel, text, isGm )
	end

end


-- called from cpp code
function UI:GameChat_AddPrivateMessageFrom( uid, nickName, text, isGm )

	if UI.Chat then
		UI.Chat:AddPrivateMessage( uid, nickName, text, false, isGm )
	end

end

-- called from cpp code
function UI:GameChat_AddPrivateMessageTo( uid, nickName, text, isGm )

	if UI.Chat then
		UI.Chat:AddPrivateMessage( uid, nickName, text, true, isGm )
	end

end


-- called from cpp code
function UI:GameChat_AddSystemMessage( text )

	if UI.Chat then
		UI.Chat:AddSystemMessage( text )
	end

end


-- called from cpp code

function UI:GameChat_AddBattleLogMessage( id, params )
	-- valid id: "kill", "kill_assist"
	-- "kill" - params = { killer={isDef, name, uid, isShip}, victim{isDef, name, uid}, itemDefName(str), (numAssists(int)), (damagePercent(float) - if numAssists deffined ) }
	-- "kill_assist" - params = { assistant={isDef, name, uid}, (damage(float)), (buffs(array of {aura(string), entity(string)})), (debuffs(array of {aura(string), entity(string)})) }
	UI.Chat:AddBattleLogMsg( id, params )
	if ( params.killer and params.killer.uid and params.killer.uid ~= UI.INVALID_U64_ID ) or ( params.victim and params.victim.uid and params.victim.uid ~= UI.INVALID_U64_ID ) then
		killTable__DEBUG = params
	end
	if UI.HudWnd then
		UI.HudWnd:GameChat_AddBattleLogMessage( id, params )
	end

end


-- called from cpp code
function UI:GameChat_ClearMessages()

	if UI.Chat then
		UI.Chat:ClearMessages()
	end
	
end   


-- called from cpp code
function UI:GameChat_ClearTab()

	if UI.Chat then
		UI.Chat:ClearTab()
	end

end


-- called from cpp code
function UI:GameChat_OnUserJoin( uid, nickName, channel )

	if UI.Chat then
		UI.Chat:OnUserJoin( uid, nickName, channel )
	end

end


-- called from cpp code
function UI:GameChat_OnUserLeave( uid, nickName, channel )

	if UI.Chat then
		UI.Chat:OnUserLeave( uid, nickName, channel )
	end

end


-- called from cpp code
function UI:GameChat_OnMuted( time, channel )

	if UI.Chat then

		if channel == nil or channel == "" then
			UI.Chat:OnMuted( time )
		else

			local text = UI:GetStringByName( "chat_playerIgnored" )
			text = string.gsub( text, "%$time%$", UI:Time2Str45( time or 0 ) )

			UI.Chat:AddSystemMessageForChannel( text, channel, UI.Chat.colorIds.IGNORED )

		end

	end

end


-- called from cpp code
function UI:GameChat_OnNickList( uid, nickName, channel )

	if UI.Chat then
		UI.Chat:OnNickList( uid, nickName, channel )
	end

end


-- called from cpp code
function UI:GameChat_OnFinishNickList( channel, usersCount )

	if UI.Chat then
		UI.Chat:OnFinishNickList( channel, usersCount )
	end

end


-- called from cpp code
function UI:GameChat_OnGetLobbyInvite( data )
	
	if UI.Chat then
		local text
		if data.lobbyName ~= "" then
			text = UI:GetStringByName( "chat_lobby_invite_msg_with_Name" )
			text = string.gsub( text, "%$lobbyName%$", UI:ShieldSpecSymbolsForMetatext( data.lobbyName ) )
		else
			text = UI:GetStringByName( "chat_lobby_invite_msg" )
		end
		UI.Chat:AddLobbyInviteMessage( data.uid, data.nick, text, { lid = data.lid, password = data.password, roleMask = data.roleMask, rankMask = data.rankMask } )
	end

end


--
function UI:GameStore_OnRepairVessel( result, requestId, param1, param2 )

	UI.HangarWnd:GameStore_OnRepairVessel( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnRepairBattleVessels( result, requestId, param1, param2 )

	UI.HangarWnd:GameStore_OnRepairBattleVessels( result, requestId, param1, param2 )

end


--
function UI:GameChat_OnDebugChatCVarChanged()

	if cvars.cl_debugChat ~= 0 then
		if UI.Chat then
			UI.Chat:Hide()		
		end
	end

	UI:UpdateChatVisibility()

end


-- called from cpp code
function UI:ShowDebriefingWnd( gameResult )

	-- for debug
--[[
	dprint( gameResult )
	local str = "gameResult = ".. sys.tostring( gameResult, true )
	ScriptWriteFile( "game_result.lua", str )		
]]

	UI.debriefingData = gameResult
	UI:CheckModidyGameRewardNotification()

	if UI.Tutorial then
		UI.Tutorial:OnDebriefingResult( gameResult )
	end

	UI.HangarWnd:OnDebriefing( gameResult )

	if UI.HudWnd then
		UI.HudWnd:ShowLoot( gameResult )
		UI.HudWnd:Show()		
	end
	
end


--
function UI:MasterServer_OnChooseStartingStation( result, requestId, param1, param2 )

-- sys.log( "UI:MasterServer_OnChooseStartingStation%d", _G.MasterServer_GetPlayerRace() )	

end


-- вызывается из биндов
function UI:ShowMarkNames()

	if UI:IsChatInput() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:MarksFullModeBindOn()
	end

end


-- вызывается из биндов
function UI:HideMarkNames()

	if UI:IsChatInput() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:MarksFullModeBindOff()
	end

end


-- вызывается из биндов
function UI:OnToggleMarksNamesBind()

	if UI:IsChatInput() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnToggleMarksNamesBind()
	end

end


--
function UI:OnScanResult( result, attemptsLeft, defName, amount, skipSalvaging, sellRefund, salvagePrice, salvageRefund, salvagePremiumRefund, creditsEarned, tokensEarned, salvagePremiumCantAfford, playerGold )

	if UI.HudWnd then
		UI.HudWnd:OnLootScanResult( result, attemptsLeft, defName, amount, skipSalvaging, sellRefund, salvagePrice, salvageRefund, salvagePremiumRefund, creditsEarned, tokensEarned, salvagePremiumCantAfford, playerGold )
	end

end


--
function UI:OnSalvageResult( result, creditsEarned, tokensEarned )

	if UI.HudWnd then
		UI.HudWnd:OnLootSalvageResult( result, creditsEarned, tokensEarned )
	end	

end


--
function UI:HangarReloadShips()

	sys.execscript( "scripts/hangar.lua" )

	if UI.HangarWnd and UI.HangarWnd:IsOnScreen() then
		UI.HangarWnd:Hide()
		UI.HangarWnd:Show()		
	end

end


--
function UI:HangarSetShip( slotId, shipDefName )

	if not UI.HangarWnd or not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI:HangarSetShip()[ERROR]: UI.HangarWnd is not on screen" )
		return
	end

	UI.HangarWnd:HackedSetShip( slotId, shipDefName )

end


--
function UI:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	UI:UpdateServerData_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	UI:UpdateServerData_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

end


-- вызывается из биндов
function UI:OnHangarTabShipsBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabShipsBind()
	end	

end


-- вызывается из биндов
function UI:OnHangarTabSkillsBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabSkillsBind()
	end	

end


-- вызывается из биндов
function UI:OnHangarTabShopBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabShopBind()
	end	

end


-- вызывается из биндов
function UI:OnHangarTabItemCraftBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabItemCraftBind()
	end	

end


-- вызывается из биндов
function UI:OnHangarTabLeaderboardsBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabLeaderboardsBind()
	end	

end

-- вызывается из биндов
function UI:OnHangarTabHelpBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnTabHelpBind()
	end	

end

-- вызывается из биндов
function UI:OnHangarProfileBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnProfileBind()
	end	

end

-- вызывается из биндов
function UI:OnHangarClanBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnClanBind()
	end	

end


-- может быть вызвано из cpp кода
function UI:IsEditWndActive()

	local hFocusWnd = UI:GetKeyboardFocus()

	if hFocusWnd == UI.INVALID_UI_HANDLE then
		return false
	end

	local focusWnd = UI:GetUiObjByHandleT( hFocusWnd )
	if not focusWnd then
		return false		
	end

	return focusWnd:GetClassName() == "EditWnd"

end


--
function UI:MasterServer_OnSquadInfo( result, requestId, param1, param2 )

	self:UpdateServerData_OnSquadInfo( result, requestId, param1, param2 )
	UI.Squad:ReloadSquadList()
	UI.HangarWnd:MasterServer_OnSquadInfo( result, requestId, param1, param2 )
	UI.LoginWnd:MasterServer_OnSquadInfo( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnSquadInviteAccept( result, requestId, uid, param2 )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_INVITE_ACCEPT", result, "_G.MasterServer.SquadOpResult" )
	end

	UI:UpdateServerData_OnSquadInviteAccept( result, requestId, uid, param2 )
	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.INVITE_ACCEPT )
	if result == 0 then
		UI.Squad:ReloadSquadList()
	end
	UI.HangarWnd:MasterServer_OnSquadInviteAccept( result, requestId, uid, param2 )

end


--
function UI:MasterServer_OnSquadKick( result, requestId, uid )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_KICK_FROM_SQUAD", result, "_G.MasterServer.SquadOpResult" )
	end

	UI:UpdateServerData_OnSquadKick( result, requestId, uid )
	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.KICK_FROM_SQUAD )
	if result == 0 then
		UI.Squad:ReloadSquadList()
	end

end


--
function UI:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_INVITE_TO_SQUAD", result, "_G.MasterServer.SquadOpResult" )
	end

	UI:UpdateServerData_OnSquadInviteSend( result, requestId, param1, param2 )
	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.INVITE_TO_SQUAD )
	UI.Squad:ReloadSquadList()
	UI.HangarWnd:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )
	UI.SquadFinder:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnSquadInviteDecline( result, requestId, uid )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_INVITE_REJECT", result, "_G.MasterServer.SquadOpResult" )
	end

	if result == _G.MasterServer.SquadOpResult.SOR_OK then 
		UI.Squad:ReloadSquadList()
	end

	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.INVITE_REJECT )

end


--
function UI:MasterServer_OnSquadInviteCancel( result, requestId, unused1, unused2, uid )

	if result == _G.MasterServer.SquadOpResult.SOR_OK then 
		UI.Squad:ReloadSquadList()
	end

	UI.HangarWnd:MasterServer_OnSquadInviteCancel( result, requestId, unused1, unused2, uid )

end


--
function UI:MasterServer_OnSquadLeave( result, requestId, param1, param2 )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_LEAVE_SQUAD", result, "_G.MasterServer.SquadOpResult" )
	end

	UI:UpdateServerData_OnSquadLeave( result, requestId, param1, param2 )
	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.LEAVE_SQUAD )

	if result == 0 then
		UI.Squad:CheckReadyCancel()
		UI.Squad:ReloadSquadList()
	end

	UI.HangarWnd:MasterServer_OnSquadLeave( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnSquadReady( result, requestId, param1, param2 )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_CHECK_READY_REQUEST", result, "_G.MasterServer.SquadOpResult" )
	end

	UI:UpdateServerData_OnSquadReady( result, requestId, param1, param2 )
	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, param1, param2, uid, UI.InviteFriendWnd.SquadRequestType.CHECK_READY_REQUEST )
	--UI.Squad:MasterServer_OnSquadReady( result, requestId, param1, param2 )
	-- update list only if user accept readycheck
	if param1 == 1 then
		UI.Squad:CheckReadyUpdate( result, requestId, param1, param2 )
	else
		UI.Squad:CheckReadyFail( _G.MasterServer_GetLocalUserId() )
	end

end

--
function UI:MasterServer_OnSquadConvertToWing( result, requestId, param1, param2 )

	if result ~= 0 then
		UI:ShowErrorMsg( "error_squad_CONVERT_TO_WING", result, "_G.MasterServer.SquadOpResult" )
	end

	UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, UI.InviteFriendWnd.SquadRequestType.CONVERT_TO_WING )
	if result == 0 then
		UI.Squad:ReloadSquadList()
	end

end


--
function UI:GameStore_OnStripImproperBattleVessels( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		UI:ShowMsgOnBuyError( result )
	end
	
	UI.LoginWnd:GameStore_OnStripImproperBattleVessels( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnRewardTutorial( data )

--	sys.log( "^5MasterServer_OnRewardTutorial %s", sys.tostring( data ) )  	

	UI.Tutorial:MasterServer_OnRewardTutorial( data )

end


--
function UI:OnHangarSlotBind( slotIdx )

	if UI:IsEditWndActive() then
		return
	end

	if UI.HangarWnd then
		UI.HangarWnd:OnHangarSlotBind( slotIdx )
	end

end


--
function UI:OnScreenshotGrabbed( filename )

	UI.Chat:AddScreenshotMessage( filename )

end


--
function UI:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

--	sys.out( "^5UI:MasterServer_OnNickNameUpdate:" )
--	local grouped = { result, requestId, uid, nickName }
--	dprint( grouped )

	
	UI.Social:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.Notifications:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.InviteFriendWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.Squad:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.Clan:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.Arena:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.HangarWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.GameplayCustomWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.GameplayCustomLobbyWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	--UI.PlayersLeaderboard_ListWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	UI.ClansMembersLeaderboard_ListWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	UI.Leaderboard_PlayersListWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	UI.Leaderboard_DailyListWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	UI.Leaderboard_ClansListWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	UI.Clans_FindWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )

end


--
function UI:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	
	if result ~= 0 then
		sys.log( "UI:MasterServer_OnClanNameUpdate() result=%d, cid=%s", result, _G.U64ToStr( cid ) )
	end

	UI.Clan:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.Profile_CommonWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.HangarWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.ClansMembersLeaderboard_ListWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.Leaderboard_PlayersListWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.Leaderboard_DailyListWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.Leaderboard_ClansListWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.GameplayCustomWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.GameplayCustomLobbyWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.MapZoneTooltipWnd_shared:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.GameplayPveMapWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	UI.Hangar_ClanBtn:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	end

	if result == 0 then
		UI:CheckShowZoneEnterMsg()
	else
		if requestId == self.zoneOwnerNameRequestId then
			self.bShowZoneEnterMsg = false
		end 
	end

	if requestId == self.zoneOwnerNameRequestId then
		self.zoneOwnerNameRequestId = 0
	end

end


--[[
вызывается при получении награды игроком во время боя
   reward          - тип награды, значение из таблицы ai.Reward
   rewardReason    - причина награды, значение из таблицы ai.RewardReason
   killedPlayerIdx - индекс убитого игрока, только если rewardReason == ai.RewardReason.KILL или rewardReason == ai.RewardReason.ASSIST 
   worldPos        - мировые координаты позиции, в которой произошло событие, за которое начислили награду (nil если такой позиции нет)
]]
function UI:OnPlayerBattleReward( playerIdx, reward, rewardReason, value, killedPlayerIdx, worldPos )

--[[
	-- нас интерсует только наблюдаемый игрок, о других игроках сообщения игнорируем
	if playerIdx ~= _G.GetSpectatorTargetIdx() then  
		return
	end
	
	local str = nil 
	if reward == ai.Reward.EXP then
		str = string.format( "[COMBAT] reward %d experience for %s", value, UI:Val2Key( ai.RewardReason, rewardReason ) )
		
	elseif reward == ai.Reward.CREDIT then
		str = string.format( "[COMBAT] reward %d credits for %s", value, UI:Val2Key( ai.RewardReason, rewardReason ) )
		
	elseif reward == ai.Reward.REPUTATION then
		str = string.format( "[COMBAT] reward %d reputation for %s", value, UI:Val2Key( ai.RewardReason, rewardReason ) )
		
	elseif reward == ai.Reward.EFFECTIVE_POINTS then
		str = string.format( "[COMBAT] reward %d points for %s", value, UI:Val2Key( ai.RewardReason, rewardReason ) )
		
 	end

	if str then
		UI:GameChat_AddBattleLogMessage( str )
	end
]]

	if UI.HudWnd then
		UI.HudWnd:OnPlayerBattleReward( playerIdx, reward, rewardReason, value, killedPlayerIdx, worldPos )
	end
	
end


--
function UI:OnMedalEarned( medalType, medalLevel, exp )

	if UI.HudWnd then
		UI.HudWnd:OnMedalEarned( medalType, medalLevel, exp )
	end

end


--
function UI:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

	sys.log( "^5UI:MasterServer_OnAttachSteamAccount: %s", sys.tostring( param1 ) ) 

	UI:UpdateServerData_OnAttachSteamAccount( result, requestId, param1, param2 )
	UI.LinkSteamAccountWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnAttachEmail( result, requestId, param1, param2 )

	UI.MenuWnd:MasterServer_OnAttachEmail( result, requestId, param1, param2 )

end


--
function UI:OnGuidedMissileDestroyed( playerIdx, killed )	

	if UI.HudWnd then
		UI.HudWnd:OnGuidedMissileDestroyed( playerIdx, killed )
	end
	
end


--
function UI:OnPhaseModulePhaseChanged( playerIdx, moduleSlotId, phase )

	if UI.HudWnd then
		UI.HudWnd:OnPhaseModulePhaseChanged( playerIdx, moduleSlotId, phase )
	end

end


--
function UI:OnSetSpawnGroupResponse( result, spawnGroup )


end


--
function UI:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI:UpdateServerData_OnAccountAuras( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI:UpdateServerData_OnAddAccountAura( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI:UpdateServerData_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

end


-- 
function UI:OnVitalPointRespawnTurrets( vitalPointId )

	if UI.HudWnd then
		UI.HudWnd:OnVitalPointRespawnTurrets( vitalPointId )
	end

end


--
function UI:MasterServer_OnGalaxyRaceStats( result, requestId, stats )
end


--
function UI:MasterServer_OnReplaceChatMsg( uid, chatType )

	if UI.Chat then
		UI.Chat:ReplacePlayerMsg( uid, chatType )
	end

end


--
function UI:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	UI:ServerDataUpdate_OnVesselFreeCustomElements( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnBuyVesselCustomElements( result, requestId, buyData )

	-- sys.log("^5UI:GameStore_OnBuyVesselCustomElements result %d",result)

	UI.HangarWnd:GameStore_OnBuyVesselCustomElements( result, requestId, buyData )

end


--
function UI:GameStore_OnVesselCustomElementsExpired( result, requestId, expiredData )

	UI.HangarWnd:GameStore_OnVesselCustomElementsExpired( result, requestId, expiredData )

end


--
function UI:GameplayRules_CL_OnStart()

	UI.Chat:JoinBattleChannel()

end


--
function UI:OnTeamCoordinationMessage( playerIndex, msgId, targetEntityId )

	local playerInfo	= _G.GetPlayerInfo( playerIndex )
	local fromName		= playerInfo.nickName
	local uid			= playerInfo.uid

	local friendColor = "@ff01ccec"
	local enemyColor = "@fff12600"

	local targetName = nil
	local msg = nil
	local color = nil

	if msgId == "TCM_TARGET_ENTITY" then
	
		local ent = _G.Entities[ targetEntityId ]
		if ent then
			local entDef = ent:GetDefName()

			if UI:IsEntityOfClass( ent, "JumpDockLocation" ) then	-- врата или докстанция
				local bLeadToAnotherZone = not ent:IsDockLocation()
				if bLeadToAnotherZone then
					local zoneId = ent:GetTargetZoneReal()
					local zoneName = UI:ZoneId2Name( zoneId )
					targetName = UI:Zone2Str( zoneName )
					msg = UI:GetStringByName( "log_msg_checkout_gate_to_zone" )
				else
					local curZoneId = _G.CL_GetCurrentSpaceZoneId()
					local curZoneName = UI:ZoneId2Name( curZoneId )
					targetName = UI:ZoneStation2Str( curZoneName )  
					msg = UI:GetStringByName( "log_msg_checkout_gate_to_location" )
				end
			elseif UI:IsEntityOfClass( ent, "SpaceShip" ) then	-- корабль
		    	local playerId = ent:GetPlayerIdx()
				if playerId ~= -1 then
			    	targetName = UI:MakePlayerNameById( playerId, false, false )
				else
					targetName = UI:GetBotName( ent:GetId() )
				end
				local localPlayerId = _G.Game_LocalClientNum()
				local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
				if ent:GetRelationshipGroup() == friendTeam then
					color = friendColor
				else
					color = enemyColor
				end
				msg = UI:GetStringByName( "log_msg_checkout_SpaceShip" )
				
			elseif UI:IsEntityOfClass( ent, "VitalPoint" ) then	-- виталпоинт
				targetName = UI:GetEntityLocalizedName( ent )
				local localPlayerId = _G.Game_LocalClientNum()
				local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
				if ent:GetRelationshipGroup() == friendTeam then
					color = friendColor
				else
					color = enemyColor
				end
				-- #0049588
				if _G.GetCurrentGameMode() == ai.Gameplay.CLANSHIP then
					msg = UI:GetStringByName( "log_msg_checkout_ClanShipGenerator" )
				else
					msg = UI:GetStringByName( "log_msg_checkout_VitalPoint" )
				end

			elseif UI:IsEntityOfClass( ent, "VitalPointTurret" ) then	-- дрон
				targetName = UI:GetEntityLocalizedName( ent )
				local localPlayerId = _G.Game_LocalClientNum()
				local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
				if ent:GetRelationshipGroup() == friendTeam then
					color = friendColor
				else
					color = enemyColor
				end
				local parent = ent:GetParent()
				if parent and UI:IsEntityOfClass( parent, "VitalPoint" ) then
					msg = UI:GetStringByName( "log_msg_checkout_Dron_VitalPoint" )
					local vitalPointName = UI:GetEntityLocalizedName( parent )
					local normalColor = UI.Chat:GetMsgTypeColor( UI.Chat.msgTypes.GAMEPLAY )
					local color2 = UI.ChatWnd:GetColorByColorType( normalColor )
					local colorStr = UI:Color2Str( color2 )
					msg = string.gsub( msg, "%$point_name%$", color..vitalPointName..colorStr )
				else
					msg = UI:GetStringByName( "log_msg_checkout_Other")
				end

			elseif entDef and UI:GetDef( entDef ) and UI:GetDef( entDef ).hudType == "bomb_site" then	-- станция 
				targetName = UI:GetEntityLocalizedName( ent )
				local localPlayerId = _G.Game_LocalClientNum()
				local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
				if ent:GetRelationshipGroup() == friendTeam then
					msg = UI:GetStringByName( "log_msg_checkout_bombBase" )
					color = friendColor
				else
					msg = UI:GetStringByName( "log_msg_checkout_bombBase" )
					color = enemyColor
				end

			else	-- другое
				targetName = UI:GetEntityLocalizedName( ent )
				msg = UI:GetStringByName( "log_msg_checkout_Other" )

			end

		end
	elseif msgId == "TCM_PLATFORM_INVITE" then
		local ent = _G.Entities[ targetEntityId ]
		if ent then
			local playerId = ent:GetPlayerIdx()
			if playerId ~= -1 then
				targetName = UI:MakePlayerNameById( playerId, false, false )
			else
				targetName = UI:GetBotName( ent:GetId() )
			end
			color = friendColor
			msg = UI:GetStringByName( "log_msg_platform_invite" )
		end
	else
		-- unknown message, ignore
	end

	--
	if msg and targetName then
		targetName = UI:ShieldSpecSymbolsForMetatext( targetName )
		if color then
			local normalColor = UI.Chat:GetMsgTypeColor( UI.Chat.msgTypes.GAMEPLAY )
			local color2 = UI.ChatWnd:GetColorByColorType( normalColor )
			local colorStr = UI:Color2Str( color2 )
			msg = string.gsub( msg, "%$name%$", color..targetName..colorStr )
		else
			msg = string.gsub( msg, "%$name%$", targetName )
		end
		UI.Chat:AddGameplayMessage( uid, fromName, msg )
	end

end

--
function UI:MasterServer_OnReferrals()
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
end

--
function UI:MasterServer_OnSocialList( result, requestId )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
	UI.LoginWnd:MasterServer_OnSocialList( result, requestId, 0, 0 )
end


--
function UI:MasterServer_OnSocialNotification( type, uid )
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
end


--
function UI:MasterServer_OnSocialFriendsSendRequest( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.FRIEND_REQUEST )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialFriendsAcceptRequest( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.FRIEND_REQUEST_ACCEPT )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialFriendsRejectRequest( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.FRIEND_REQUEST_REJECT )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialFriendsRemove( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.FRIEND_REMOVE )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialIgnoreAdd( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.ADD_TO_IGNORE )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialIgnoreRemove( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.REMOVE_FROM_IGNORE )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialWatchAdd( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.ADD_TO_WATCH )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSocialWatchRemove( result, requestId, unused, unused, uid )
	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, UI.InviteFriendWnd.SocialRequestType.REMOVE_FROM_WATCH )
	if result == 0 then
		UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )
	end
end


--
function UI:MasterServer_OnSquadNotification( type, squad, uid, params )

	UI:UpdateServerData_OnSquadNotification( type, squad, uid, params )

	--sys.log( "type: %s, suad: %s, uid: %s", UI:Val2Key( MasterServer.SquadNotification, type ), _G.U64ToStr( squad ), _G.U64ToStr( uid ) )
	--dprint( params )
	if type == MasterServer.SquadNotification.SQN_INVITE_ADD then
		UI.Squad:ReloadSquadList()
		local invite = {}
		invite.squad = squad
		invite.uid = uid
		invite.gid = params.gid or 0
		UI.Squad:AddInvite( invite )
	elseif type == MasterServer.SquadNotification.SQN_INVITE_CANCELED then

		UI.Squad:ReloadSquadList()

		if uid == UI:GetLocalPlayerUid() then
			UI.Squad:RemoveInvite( squad )
		end

	elseif type == MasterServer.SquadNotification.SQN_JOINED or type == MasterServer.SquadNotification.SQN_LEFT or type == MasterServer.SquadNotification.SQN_KICKED then
		UI.Squad:CheckReadyCancel()
		UI.Squad:ReloadSquadList()
	elseif type == MasterServer.SquadNotification.SQN_READY_CHECK_REQUEST then
		UI.Squad:ReadyCheckRequested( params.rcType )
	elseif type == MasterServer.SquadNotification.SQN_READY_CHECK_CANCEL then
		UI.Squad:CheckReadyFail( UI.Squad:GetLeaderUid() )
	elseif type == MasterServer.SquadNotification.SQN_PILOT_READY then
		UI.Squad:CheckReadyUpdate( 0 )
	elseif type == MasterServer.SquadNotification.SQN_PILOT_NOT_READY then

		UI.Squad:CheckReadyFail( uid )

		local playerName = UI:MakePlayerNameByUid( uid, false, false )
		playerName = UI:ShieldSpecSymbolsForMetatext( playerName )

		local msg = UI:GetStringByName( "msg_readyCheckFail_text" )
		msg = string.gsub( msg, "%$player%$", playerName )		

		UI:MessageBox( UI:GetStringByName( "msg_readyCheckFail_caption" ), msg, UI.MBS_OK )

	elseif type == MasterServer.SquadNotification.SQN_CONVERTED_TO_WING then
		UI.Squad:ReloadSquadList()
		UI.Squad:CheckReadyCancel()
	elseif type == MasterServer.SquadNotification.SQN_WING_DISBAND then
		UI.Squad:CheckReadyCancel()
		UI.Squad:ReloadSquadList()
		UI:MessageBox( UI:GetStringByName( "msg_wing_disband_caption" ), UI:GetStringByName( "msg_wing_disband_text" ), UI.MBS_OK )
	elseif type == MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_PLAYER_OFFLINE or type == MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_SQUAD_MEMBER_HAS_ISSUES 
			or type == MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_PREMIUM_REQUIRED or type == MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_OTHER then
		UI.Squad:ReloadSquadList()
		local text = UI:LocalizeSquadNotification( type, uid, params.result, true, false, params )
		UI.Chat:AddSystemMessage( text )
		if not UI.Squad:IsLeader() and uid == _G.MasterServer_GetLocalUserId() then
			if type == MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_SQUAD_MEMBER_HAS_ISSUES then
				text = UI:LocalizeSquadNotification( type, uid, params.result, false, true, params )
			else
				text = UI:LocalizeSquadNotification( type, uid, params.result, false, false, params )
			end
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text, UI.MBS_OK )
		end
	elseif type == MasterServer.SquadNotification.SQN_MM_ALL_LEFT or type == MasterServer.SquadNotification.SQN_TMT_ALL_LEFT then

		local reason = params.reason

		if reason == _G.MasterServer.MMLeaveReason.MMLR_CLAN_RESET or reason == _G.MasterServer.MMLeaveReason.MMLR_SQUAD_CHANGE then

			local msgStrId = string.format( "msgBattleCancel_text_%s", UI:Val2Key( _G.MasterServer.MMLeaveReason, reason ) )
			UI:MessageBox( UI:GetStringByName( "msgBattleCancel_caption" ), UI:GetStringByName( msgStrId ), UI.MBS_OK )

		end

	elseif type == MasterServer.SquadNotification.SQN_MM_PILOT_LEFT or type == MasterServer.SquadNotification.SQN_TMT_PILOT_LEFT then

		local text = UI:LocalizeSquadNotification( type, uid, params.result, true )
		UI.Chat:AddSystemMessage( text )
		if UI.Squad:IsLeader() or uid == _G.MasterServer_GetLocalUserId() then
			text = UI:LocalizeSquadNotification( type, uid, params.result, false, uid == _G.MasterServer_GetLocalUserId() )
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text, UI.MBS_OK )
		end

	end

	UI.HangarWnd:MasterServer_OnSquadNotification( type, squad, uid, params )

end


--
function UI:MasterServer_OnClanRequestDesc( result, requestId )

	UI.Clan:ReloadList( result, requestId )

	UI.LoginWnd:MasterServer_OnClanRequestDesc( result, requestId )

	if result == 0 and requestId == 0 then

		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )

	end
	
end


--
function UI:MasterServer_OnClanCreate( result, requestId )

	UI.ClanCreateWnd:MasterServer_OnClanCreate( result, requestId )
	if result == MasterServer.ClanOpResult.CLR_OK then
		UI.Clan:ReloadList( result, requestId )
		UI.GameplayPveMapWnd:UpdateUniverse()
		UI.ClansMainWnd:Update( "CLAN" )
	end

	UI.HangarWnd:MasterServer_OnClanCreate( result, requestId )

end


--
function UI:MasterServer_OnClanSetRole( result, requestId, role, unused, uid )

	UI.Clan:ReloadList( result, requestId )

end


--
function UI:MasterServer_OnClanInviteSend( result, requestId, unused, unused, uid )
	
	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused, unused, UI.InviteFriendWnd.ClanRequestType.INVITE_TO_CLAN )

end


--
function UI:MasterServer_OnClanInviteAccept( result, requestId, unused, unused, cid )

	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused, unused, UI.InviteFriendWnd.ClanRequestType.INVITE_ACCEPT )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	end

	UI.HangarWnd:MasterServer_OnClanInviteAccept( result, requestId, unused, unused, cid )

end


--
function UI:MasterServer_OnClanInviteCancel( result, requestId, unused, unused, cid )

	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused, unused, UI.InviteFriendWnd.ClanRequestType.INVITE_REJECT )
	--[[dprint( result )
	dprint( requestId )
	dprint( cid )]]

end


--
function UI:MasterServer_OnClanKick( result, requestId, unused, unused, uid )

	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused, unused, UI.InviteFriendWnd.ClanRequestType.KICK_FROM_CLAN )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
	end

end


--
function UI:MasterServer_OnClanLeave( result, requestId )

	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused, unused, UI.InviteFriendWnd.ClanRequestType.LEAVE_CLAN )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
		UI.GameplayPveMapWnd:UpdateUniverse()
		UI.ClansMainWnd:Update( "CLAN" )
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	end

	UI.HangarWnd:MasterServer_OnClanLeave( result, requestId )

end


--
function UI:MasterServer_OnClanUpgrade( result, requestId, unused, param1 )

	UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, param1, unused, UI.InviteFriendWnd.ClanRequestType.CLAN_UPGRADE )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
	end

end


--
function UI:MasterServer_OnClanChangeName( result, requestId, name )

	UI.ClanCreateWnd:MasterServer_OnClanCreate( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
	end

end


--
function UI:MasterServer_OnClanChangeTag( result, requestId, tag )

	UI.ClanCreateWnd:MasterServer_OnClanCreate( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( result, requestId )
	end

end


--
function UI:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )

--	sys.log( "^5UI:MasterServer_OnClanBankTransfer()" )

	UI.HangarWnd:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )
	UI.ClanTokenDeposit_Wnd:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )
	if result == 0 then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	end

end


--
function UI:MasterServer_OnResourceConvert( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnResourceConvert()" )

	UI.HangarWnd:MasterServer_OnResourceConvert( result, requestId, param1, param2 )
	if result == 0 then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	end

end


--
function UI:MasterServer_OnClanChangeMotD( result, requestId )

	UI.ClanCreateWnd:MasterServer_OnClanChangeMotD( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	end

end



--
function UI:MasterServer_OnClanChangeDesc( result, requestId )

	UI.ClanCreateWnd:MasterServer_OnClanChangeDesc( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	end

end


--
function UI:MasterServer_OnClanNotification( type, cid, uid, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnClanNotification %d", type )

	if type == MasterServer.ClanNotification.CLN_YOU_INVITED_TO_A_CLAN then
		local invite = {}
		invite.cid = cid
		invite.uid = uid
		UI.Clan:AddInvite( invite )
	elseif type == MasterServer.ClanNotification.CLN_INVITED_TO_A_CLAN then

	elseif type == MasterServer.ClanNotification.CLN_INVITE_ACCEPTED then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
		UI.ClansMainWnd:Update( "CLAN" )
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	elseif type == MasterServer.ClanNotification.CLN_INVITE_CANCEL then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_SET_ROLE then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_KICKED then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
		UI.ClansMainWnd:Update( "CLAN" )
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	elseif type == MasterServer.ClanNotification.CLN_LEAVE then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
		UI.ClansMainWnd:Update( "CLAN" )
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	elseif type == MasterServer.ClanNotification.CLN_UPGRADE then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_BANK_TRANSFER then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )		
	elseif type == MasterServer.ClanNotification.CLN_RESOURCE_ADDED then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_RESOURCE_SPENT then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )

	-- эта нотификация есть, но не посылается
	elseif type == MasterServer.ClanNotification.CLN_UNIVERSE_BATTLE_REWARD then
		-- ничего

	elseif type == MasterServer.ClanNotification.CLN_RECRUITING_CHANGED then
	elseif type == MasterServer.ClanNotification.CLN_DESC_CHANGED then
	elseif type == MasterServer.ClanNotification.CLN_NEW_JOINREQ or type == MasterServer.ClanNotification.CLN_JOINREQ_CANCELLED then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_SHIP_BUILDING_CHANGED then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	elseif type == MasterServer.ClanNotification.CLN_EMBLEM_ASSIGNED then
		UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
		UI.GameplayPveMapWnd:UpdateUniverse()
	elseif type == MasterServer.ClanNotification.CLN_NEW_HIGH_RANK then
	elseif type == MasterServer.ClanNotification.CLN_UNIVERSE_MOVE then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
		UI.GameplayPveMapWnd:UpdateUniverse()

	-- напрямую ничего не обновляет (придет полный набор данных клана в MasterServer_OnClanRequestDesc)
	elseif type == MasterServer.ClanNotification.CLN_NAME_CHANGED then
		-- ничего

	-- напрямую ничего не обновляет (придет полный набор данных клана в MasterServer_OnClanRequestDesc)
	elseif type == MasterServer.ClanNotification.CLN_TAG_CHANGED then
		-- ничего

	-- напрямую ничего не обновляет (придет полный набор данных клана в MasterServer_OnClanRequestDesc)
	elseif type == MasterServer.ClanNotification.CLN_MOTD_CHANGED then
		-- ничего

	-- данные клана не обновляет, просто уведомляет о том, что через UniverseSettings.conflict_notif_time минут начнется конфликт бзс,
	-- в котором мы участвуем (приходит только офицерам и выше);
	-- в ui не обрабатывается
	elseif type == MasterServer.ClanNotification.CLN_UNIVERSE_CONFLICT_SOON then
		-- ничего

	-- данные клана не обновляет, просто уведомляет о том, что через UniverseSettings.conflict_notif_time минут начнется конфликт бзс,
	-- в котором мы участвуем (приходит только офицерам и выше);
	-- в ui не обрабатывается нотификация
	elseif type == MasterServer.ClanNotification.CLN_UNIVERSE_CONFLICT_START then
		-- ничего

	-- эта нотификация есть, но не посылается
	elseif type == MasterServer.ClanNotification.CLN_UNIVERSE_ZONE_CAPTURED then
		-- ничего
		
	-- вместо этой нотификации есть реакция на коллбэк MasterServer_OnClanShipUpdateCurrent()
	elseif type == MasterServer.ClanNotification.CLN_SHIP_SET_CURRENT then
		-- ничего

	else
		sys.log( "UI:MasterServer_OnClanNotification()[ERROR]: unknown type(%d)", type )
	end

	UI.HangarWnd:MasterServer_OnClanNotification( type, cid, uid, param1, param2 )

end


--
function UI:MasterServer_OnLoadBalancerQueueInfo( position, guesstimate )

	sys.out( "OnLoadBalancerQueueInfo: position %d, guesstimate: %3.5f", position, guesstimate )
	UI.LoginWnd:MasterServer_OnLoadBalancerQueueInfo( position, guesstimate )

end


--
function UI:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	-- sys.log("^5MasterServer_OnUserProfileUpdate result %d, requestId %d, uid %s, field %d", result, requestId, _G.U64ToStr( uid ), field)
	
	UI:UpdateServerData_OnUserProfileUpdate( result, requestId, uid, field )

	UI.Social:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Clan:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ClansMyClan_Wnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Squad:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Profile:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ProfileAchievements_CategoriesListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Profile_CommonWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Profile_MedalsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ProfileTitles_Wnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Arena:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.HangarWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.GameplayCustomLobbyWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.GameplayShipSelectWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ClansMembersLeaderboard_ListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Leaderboard_PlayersListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Leaderboard_DailyListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Leaderboard_ClansListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.GameplayCustomWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.LoginWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Hangar_ProfileBtn:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Hangar_ClanBtn:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	
	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	end

end

--
function UI:MasterServer_OnAvatarsSetActive( retCode, requestId )

	UI.ProfileChangeAvatar_Wnd:MasterServer_OnAvatarsSetActive( retCode, requestId )
	if retCode == 0 then
		UI.Profile_CommonWnd:UpdateAvatar( _G.MasterServer_GetLocalUserId() )
		UI.Hangar_ProfileBtn:UpdateAvatar()
	end
	
end


--
function UI:MasterServer_OnMottosSetActive( retCode, requestId )

	UI.ProfileTitles_Wnd:MasterServer_OnMottosSetActive( retCode, requestId )

end


--
function UI:SkillManager_OnTalentsAcquisition( result, requestId, talentNames, talentSetId )

--	sys.out( "^5UI:SkillManager_OnTalentsAcquisition: %d", result )
--	dprint( talentNames )

	UI:UpdateServerData_OnTalentsAcquisition( result, requestId, talentNames, talentSetId )
	UI.HangarWnd:SkillManager_OnTalentsAcquisition( result, requestId, talentNames, talentSetId )

end


--
function UI:SkillManager_OnTalentsUpdate( result, requestId )

--	sys.out( "^5UI:SkillManager_OnTalentsUpdate" )

	UI:UpdateServerData_OnTalentsUpdate( result, requestId )
	UI.HangarWnd:SkillManager_OnTalentsUpdate( result, requestId )

end


--
function UI:SkillManager_OnTalentsReset( result, requestId, talentSetId )

--	sys.out( "^5UI:SkillManager_OnTalentsReset: %d", result )

	UI:UpdateServerData_OnTalentsReset( result, requestId, talentSetId )
	UI.HangarWnd:SkillManager_OnTalentsReset( result, requestId, talentSetId )

end


--
function UI:MasterServer_OnChangePlayerNickName( result, requestId, nickName )

	UI.ClanCreateWnd:MasterServer_ChangePlayerNickName( result, requestId, nickName )
	UI:UpdateServerData_OnChangePlayerNickName( result, requestId, nickName )
	UI.HangarWnd:MasterServer_OnChangePlayerNickName( result, requestId )

end


-- вызывается из cpp кода - коллбэк на изменение значения cvar-переменной sv_hudMarksVisible
function UI:OnHudMarksVisibleChanged()
	--TODO: убрать из cpp
end


-- вызывается из cpp кода - коллбэк на изменение значения cvar-переменной sv_hudPredictionVisible
function UI:OnHudPredictionVisibleChanged()

	if UI.HudWnd then
		UI.HudWnd:OnHudPredictionVisibleChanged()
	end

end


-- вызывается из cpp кода - коллбэк на изменение значения cvar-переменной cl_hudPlayerHpFormat
function UI:OnHudPlayerHpFormatChanged()
end


--
function UI:MasterServer_OnSteamUserInfo( result, requestId )

	UI:UpdateServerData_OnSteamUserInfo( result, requestId )

	UI.Yup2GoldWnd:MasterServer_OnSteamUserInfo( result, requestId )

end

--
function UI:MasterServer_OnNewSurvey( result )

	if result[ "0" ] == 0 then
		if result[ "1" ].sid ~= nil then
			UI.Vote:AddVote( result[ "1" ] )
		else
			_G.MasterServer_SurveyResults()
		end
	end

end

--
function UI:MasterServer_OnSurveyResults( result, requestId, table )

	if result[ "0" ] == 0 then
		if result[ "1" ].sid ~= nil then
			UI.Vote:AddResults( result[ "1" ] )
			return
		end
	end
	UI.Vote:AddResults( nil )

end

--
function UI:MasterServer_OnSurveyVote( result )

	UI.Vote:OnRecieveVoteCompleate()

end


--
function UI:OnAddEntityToHud( entityId )

	if not UI.HudWnd then
		return
	end

	UI.HudWnd:OnAddEntityToHud( entityId )

end


--
function UI:OnRemoveEntityFromHud( entityId )

	if not UI.HudWnd then
		return
	end

	UI.HudWnd:OnRemoveEntityFromHud( entityId )

end


--
function UI:MasterServer_OnInitialPlayerData( result, requestId )

	UI:UpdateServerData_OnInitialPlayerData( result, requestId )
	UI.LoginWnd:MasterServer_OnInitialPlayerData( result, requestId )
	
end


--
function UI:MasterServer_OnReportPlayer( result, requestId )
	if result ~= 0 then
		sys.log( "UI:MasterServer_OnReportPlayer(): failed with result: %d", result )
	end
end


--
function UI:MasterServer_OnMailGet( result, requestId )

	UI:UpdateServerData_OnMailGet( result, requestId )
	UI.LoginWnd:MasterServer_OnMailGet( result, requestId )
	UI.HangarWnd:MasterServer_OnMailGet( result, requestId )

end


--
function UI:MasterServer_OnMailDeliver( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnMailDeliver( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnMailDeliver( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnMailSend( result, requestId, param1, param2, u64Param )

	-- sys.out( "^5MasterServer_OnMailSend %d %d", result, requestId ) 

	UI.HangarWnd:MasterServer_OnMailSend( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnMailRemove( result, requestId, unused, unused, mailId )

	UI:UpdateServerData_OnMailRemove( result, requestId, unused, unused, mailId )
	UI.HangarWnd:MasterServer_OnMailRemove( result, requestId, unused, unused, mailId )

end


--
function UI:MasterServer_OnMailExpired( result, requestId, unused, unused, mailId )

	UI:UpdateServerData_OnMailExpired( result, requestId, unused, unused, mailId )
	UI.HangarWnd:MasterServer_OnMailExpired( result, requestId, unused, unused, mailId )

end


--
function UI:GameStore_OnSpoiled( result, requestId )	

	UI.HangarWnd:GameStore_OnSpoiled( result, requestId )

end


--
function UI:MasterServer_OnUniverseGet( result, requestId )

	UI.Universe:MasterServer_OnUniverseGet( result, requestId )
	UI.GameplayPveMapWnd:MasterServer_OnUniverseGet( result, requestId )
	UI.HangarWnd:MasterServer_OnUniverseGet( result, requestId )
	UI.MapZoneTooltipWnd_shared:MasterServer_OnUniverseGet( result, requestId )

	if requestId == self.universeRequestId then

		self.universeRequestId = 0

		if result == 0 then
			UI:CheckShowZoneEnterMsg()
		else
    		sys.log( "UI:MasterServer_OnUniverseGet()[ERROR]: error result %d", result )
			self.bShowZoneEnterMsg = false
		end

	end

end


--
function UI:MasterServer_OnClanUniverseMove( result, requestId )

	UI.GameplayPveMapWnd:MasterServer_OnClanUniverseMove( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
		UI.Universe:MasterServer_OnUniverseGet( 0, 0 )
	end
end


--
function UI:MasterServer_OnDisconnect( reason )

	-- #0029640
	-- так как EVENT_MASTER_SERVER_DISCONNECTED посылается асинхронно, то ui успевает проапдейтится пока он придет, в результате возникают ошибки;
	-- поэтому здесь эмулируется его синхнронная версия

	if UI:IsReconnectEnable( reason ) then
		return
	end

	self:SendUiEvent( UI.EV_MASTER_SERVER_DISCONNECTED_SYNC, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, reason, 0, 0, 0 )

end


--[[
	опциональный параметр. подставляет значения, в зависимости от типа, в строку
	params = 
	{	
		{ name = "zoneName", 		type = ai.GameMsgParamType.STR_ID, 		value = "Jerico_HomeWorld", },
		{ name = "interactBind",	type = ai.GameMsgParamType.BIND, 		value = "interact", },
		{ name = "distance", 		type = ai.GameMsgParamType.FLOAT,		value = 50.0, },
		{ name = "enemyName",		type = ai.GameMsgParamType.ENTITY_ID,	value = 89, },
		{ name = "lootCrate", 		type = ai.GameMsgParamType.DEF_NAME,	value = "LootCrate_SpaceJunk", },
	}
]]
function UI:ShowGameMsg( strId, params )

	if UI.HudWnd then
		UI.HudWnd:ShowGameMsg( strId, params )
	else
		sys.log( "UI:ShowGameMsg()[ERROR]: table \"UI.HudWnd\" not found" )
	end

end


--
function UI:HideGameMsg()

	if UI.HudWnd then
		UI.HudWnd:HideGameMsg()
	end

end


--
function UI:MasterServer_OnLobbyList( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyList(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	--dprint( _G.MasterServer_GetLobbies() )
	UI.Lobby:MasterServer_OnLobbyList( result, requestId )
	UI.GameplayCustomWnd:MasterServer_OnLobbyList( result, requestId )
end


--
function UI:MasterServer_OnLobbyJoin( result, requestId, badEquipment )
	UI.GameplayCustomWnd:MasterServer_OnLobbyJoin( result, requestId, badEquipment )
	UI.GameplayCustomLobby_EnterPass:MasterServer_OnLobbyJoin( result, requestId, badEquipment )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_JOIN", result, badEquipment )
	else
		UI.Lobby:UpdateLobby()
	end
end


--
function UI:MasterServer_OnLobbyCreate( result, requestId, badEquipment )
	--sys.log( "^5UI:MasterServer_OnLobbyCreate(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	--dprint( _G.MasterServer_GetLobby() )
	UI.GameplayCustomCreateWnd:MasterServer_OnLobbyCreate( result, requestId, badEquipment )
	if result ~= 0 then
		--UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_CREATE", result )
	else
		UI.Lobby:UpdateLobby()
	end
end


--
function UI:MasterServer_OnLobbyInfo( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyInfo(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	--dprint( _G.MasterServer_GetLobby() )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_INFO", result )
	else
		UI.Lobby:UpdateLobby()
	end
	UI.LoginWnd:MasterServer_OnLobbyInfo( result, requestId )
end


--
function UI:MasterServer_OnLobbyKick( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyKick(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_KICK", result )
	else
		UI.Lobby:UpdateLobby()
	end
end


--
function UI:MasterServer_OnLobbyLeave( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyLeave(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	--dprint( _G.MasterServer_GetLobby() )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_LEAVE", result )
	else
		UI.Lobby:UpdateLobby()
	end
end


--
function UI:MasterServer_OnLobbyInvite( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyInvite(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_INVITE", result )
	end
end


--
function UI:MasterServer_OnLobbyModify( result, requestId )
	--sys.log( "^5UI:MasterServer_OnLobbyModify(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	--dprint( _G.MasterServer_GetLobby() )
	UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyModify( result, requestId )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_MODIFY", result )
	else
		--UI.Lobby:UpdateLobby()
	end
end


--
function UI:MasterServer_OnLobbyStart( result, requestId, auxErrorParams )
	--sys.log( "^5UI:MasterServer_OnLobbyStart(); result=%s", UI:Val2Key( MasterServer.LobbyOpResult, result ) )
	UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart( result, requestId, auxErrorParams )
end


--
function UI:MasterServer_OnMultipleAccountOptions()
	sys.log( "^5UI:MasterServer_OnMultipleAccountOptions();" )
	dprint( _G.MasterServer_GetAccountOptions() )
end


--
function UI:MasterServer_OnSteamNotAttached()

	UI.LoginWnd:MasterServer_OnSteamNotAttached()

end


--
function UI:MasterServer_OnArcNotAttached()

	UI.LoginWnd:MasterServer_OnArcNotAttached()

end


--
function UI:MasterServer_OnQuests( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnQuests")

	UI:UpdateServerData_OnQuests( result, requestId, param1, param2 )
	UI.LoginWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	end

end


--
function UI:MasterServer_OnAdventures( result, requestId, param1, param2 )

	--sys.log("^5UI:MasterServer_OnAdventures")

	UI:UpdateServerData_OnAdventures( result, requestId, param1, param2 )
	UI.LoginWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )
	end

end


--
function UI:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

	--sys.out("^5UI:MasterServer_OnAdventureCancel")

	UI:UpdateServerData_OnAdventures( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )
	-- if result ~= 0 then
	-- 	sys.log("^1UI:MasterServer_OnAdventures: failed " )
	-- else
	-- 	sys.log("^5UI:MasterServer_OnAdventures: adventure canceled " )
	-- end

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )
	end

end

--
function UI:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnAcceptQuest")

	UI:UpdateServerData_OnAcceptQuest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	end

end


--
function UI:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnCompleteQuest")

	UI:UpdateServerData_OnCompleteQuest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	end

end


--
function UI:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnChangeQuest")

	UI:UpdateServerData_OnChangeQuest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnChangeIntervalQuests()

--	sys.log("^5UI:MasterServer_OnChangeIntervalQuests")

	-- #0099961
	-- хак: при логине этот вызов зачем-то приходит еще до того, как пришли основные данные по квестам в MasterServer_OnQuests();
	-- убрана реакция в Ui, чтобы ругань в лог не раздражала тестеров
	if not UI.serverData.bQuestsInited then
		return
	end

	UI:UpdateServerData_OnChangeIntervalQuests()	
	UI.HangarWnd:MasterServer_OnChangeIntervalQuests()

end


--
function UI:MasterServer_OnQuestGroupsCooldownEnd( groups )

--	sys.log("^5UI:MasterServer_OnQuestGroupsCooldownEnd")

	UI.HangarWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

end


--
function UI:MasterServer_OnAutoPilotSpaceStation( result, requestId )

	--sys.out( "MasterServer_OnAutoPilotSpaceStation() new spaceZoneId %d, new hangar_map '%s'", _G.MasterServer_GetSpaceStationZoneId(), UI:GetRightMainMenuLevelName() )

	local levelName = UI:GetCurLevelName()
	local rightMainMenuLevelName = UI:GetRightMainMenuLevelName()
	if UI:IsValidMainMenuLevelName( levelName ) and rightMainMenuLevelName ~= levelName then
		UI:LoadMainMenuLevel()
	end
	
end


--
function UI:MasterServer_OnTitlesSetActive( result, requestId, title )
	UI.ProfileTitles_Wnd:MasterServer_OnTitlesSetActive( result, requestId )
end


--
function UI:MasterServer_OnWebAdvertisement( result, desc )
	if result == 0 then
		UI.SaleAdvert:MasterServer_OnWebAdvertisement( result, desc )	
	end
end

--
function UI:MasterServer_OnWebAdvertImage( result, textureNames, thumbnailNames )
	if result == 0 then
		UI.SaleAdvert:MasterServer_OnWebAdvertImage( result, textureNames, thumbnailNames )
	end
end

--
function UI:MasterServer_OnSpaceStationsPopulation( result, requestId )
	UI.MapHangarTooltipWnd_shared:MasterServer_OnSpaceStationsPopulation( result, requestId )
end

--
function UI:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	UI:UpdateServerData_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnExtractVesselExp( result, requestId, vids )

	UI:UpdateServerData_OnExtractVesselExp( result, requestId, vids )
	UI.HangarWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

end


--
function UI:MasterServer_OnSetReferrer( result, requestId, param1, param2, u64Param )

	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )

end


--
function UI:MasterServer_OnFreeSpaceDebriefing( data )

	UI.HangarWnd:MasterServer_OnFreeSpaceDebriefing( data )

end

--
function UI:MasterServer_OnUndockSpaceStation( result, requestId )

	UI.LoginWnd:MasterServer_OnUndockSpaceStation( result, requestId )
	UI.HangarWnd:MasterServer_OnUndockSpaceStation( result, requestId )

end

--
function UI:MasterServer_OnClanAssignEmblem( result, requestId )

	UI.Clan:ReloadList( result, requestId )
	UI.ClanEmblem_Wnd:MasterServer_OnClanAssignEmblem( result, requestId )
	UI.Hangar_ClanBtn:RequestClanNameIfNeed( true )
	
end


--
function UI:GameStore_OnUpgradeItems( result, requestId, iids )

	UI:UpdateServerData_OnUpgradeItems( result, requestId, iids )
	UI.HangarWnd:GameStore_OnUpgradeItems( result, requestId, iids )

end


--
function UI:MasterServer_OnBeforeUpgradeAutogenItem( result, requestId, param1, param2, u64Param )

	UI.HangarWnd:MasterServer_OnBeforeUpgradeAutogenItem( result, requestId, param1, param2, u64Param )
	
end


--
function UI:GameStore_OnUpgradeAutogenItem( result, requestId, params )
	
	UI:UpdateServerData_OnUpgradeAutogenItem( result, requestId, params )
	UI.HangarWnd:GameStore_OnUpgradeAutogenItem( result, requestId, params )

end


--
function UI:MasterServer_OnKarmaReset( result, requestId )

	UI.Profile_CommonWnd:MasterServer_OnKarmaReset( result, requestId )

end


--
function UI:MasterServer_OnFactionRepReset( result, requestId )

	UI.Profile_CommonWnd:MasterServer_OnFactionRepReset( result, requestId )

end


--
function UI:ToggleShowDefNames()

	UI:ShowDefNames( not UI.showDefNames )

end


-- вызывается, когда локальный игрок подбирает LootCrate во FreeSpace. параметром передается - что он за это получил
function UI:OnLootCrateHarvested( harvestedItemDef, amount )	

	if UI.HudWnd then
		UI.HudWnd:OnLootCrateHarvested( harvestedItemDef, amount )
	end
	
end


-- SC-115197: вызывается как нотификация на клиенте от вызова SV_FreeSpace_GiveReward
function UI:OnScriptReward( reason, reward )

	if UI.HudWnd then
		UI.HudWnd:ShowScriptReward( reason, reward )
	end

end


-- вызывается, когда локальный игрок выбрасывает что-то из своего трюма во FreeSpace
function UI:OnLootCrateDropped()

	if UI.HudWnd then
		UI.HudWnd:OnLootCrateDropped()
	end

end


--
function UI:OnCargoHoldItemConsumed()

	if UI.HudWnd then
		UI.HudWnd:OnCargoHoldItemConsumed()
	end

end


--
function UI:OnCargoHoldResized()

	if UI.HudWnd then
		UI.HudWnd:OnCargoHoldResized()
	end
	
end


--
function UI:ModuleChanged( slotId )

	if UI.HudWnd then
		UI.HudWnd:ModuleChanged( slotId )
	end

end


--
function UI:OnPlayerTeamChanged( isLocalPlayer )

	UI.Chat:JoinBattleChannel()
	if UI.HudWnd then
		UI.HudWnd:OnPlayerTeamChanged( isLocalPlayer )
	end

end


--
function UI:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled ) 

	if UI.HudWnd then
		UI.HudWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled ) 
	end

end


--
function UI:MasterServer_OnLeaderboardGet( result, requestId, entries )

	--sys.log( "^1UI:MasterServer_OnLeaderboardGet(): %d", result )
	--[[dprint( entries )]]
	UI.Leaderboards:MasterServer_OnLeaderboardGet( result, requestId, entries )

end

--
function UI:MasterServer_OnLeaderboardGetDescs( result, requestId )

	UI.LoginWnd:MasterServer_OnLeaderboardGetDescs( result, requestId )

end

--
function UI:MasterServer_OnAdminCmd( result, requestId )

	UI.Complaint_Wnd:MasterServer_OnAdminCmd( result, requestId )

end


-- вызывается из биндов
function UI:OnToggleCargoModeBind()

	if UI:IsEditWndActive() then
		return
	end

	if UI.HudWnd then
		UI.HudWnd:OnToggleCargoModeBind()
	end

end


-- вызывается из биндов
function UI:OnToggleMapBind()

	if UI:IsEditWndActive() then
		return
	end
	
	if UI.HudEditorWnd and UI.HudEditorWnd:IsOnScreen() then
		return
	end
	
	UI.GameplayChoice_OWMapSlotWnd:UpdateDisabledByRankStatus()
	if UI.GameplayChoice_OWMapSlotWnd.bDisabledByRank then
		return
	end

	if not UI:IsMenuWindowsOnScreen() then
		if UI.HudWnd and UI.HudWnd:IsOnScreen() then
			local gameMode = _G.GetCurrentGameMode()
			if gameMode == ai.Gameplay.FREE_SPACE then
				if UI.QuestInfoWnd and not UI.QuestInfoWnd:IsOnScreen() then
					if UI.GameplayPveMapHudContainerWnd:IsOnScreen() then

						UI.GameplayPveMapHudContainerWnd:Hide()
						UI.ContextMenu:Hide()	-- #0076874

					else

						-- Если открыто окно приключений, то закрываем его
						if UI.HudAdventureWnd and UI.HudAdventureWnd:IsActive() then
							UI.HudAdventureWnd:Cancel()
						end

						UI.GameplayPveMapHudContainerWnd:Show()

					end
				end
			end
		else
			if UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.MATCHMAKING then
				UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, true, false )
			end
		end
	end

end


--
function UI:FB_OnEvent( eventId, success, errorCode )

--	sys.log("^5UI:FB_OnEvent: %s, %d, %d", UI:Val2Key( FBEventType, eventId ), success, errorCode )

	UI.OptionsWnd:FB_OnEvent( eventId, success, errorCode )
	UI.HangarWnd:FB_OnEvent( eventId, success, errorCode )

	if not UI:IsTrueEx( success ) and eventId ~= _G.FBEventType.FBET_NONE then
		UI:ShowMsgOnFacebookError( eventId, errorCode )
	end

	if eventId == FBEventType.FBET_SCREENSHOT_POSTED and UI:IsTrueEx( success ) then
		UI.Chat:AddSystemMessage( UI:GetStringByName( "chat_screenshot_posted_to_facebook" ) )
	end

end


--
function UI:VK_OnEvent( eventId, success, errorCode )

--	sys.log("^5UI:VK_OnEvent: %s, %d, %d", UI:Val2Key( FBEventType, eventId ), success, errorCode )

	UI.OptionsWnd:VK_OnEvent( eventId, success, errorCode )
	UI.HangarWnd:VK_OnEvent( eventId, success, errorCode )

	if not UI:IsTrueEx( success ) and eventId ~= _G.FBEventType.FBET_NONE then
		UI:ShowMsgOnVKontakteError( eventId, errorCode )
	end

	if eventId == FBEventType.FBET_SCREENSHOT_POSTED and UI:IsTrueEx( success ) then
		UI.Chat:AddSystemMessage( UI:GetStringByName( "chat_screenshot_posted_to_vk" ) )
	end

end


--
function UI:OnClientStatsToggleBind()

	if UI:IsEditWndActive() then
		return
	end
	
	UI.HangarWnd:OnClientStatsToggleBind()

	if UI.HudWnd then
		UI.HudWnd:OnClientStatsToggleBind()
	end

end


--
function UI:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnFreeSpaceAccess")

	UI.HangarWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnCraftResources( result, requestId, param1, param2 )

--	sys.log("^5UI:MasterServer_OnCraftResources")

	UI:UpdateServerData_OnCraftResources( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	UI:UpdateServerData_OnUseCraftResource( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	UI:UpdateServerData_OnSellCraftResource( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	UI:UpdateServerData_OnSellCraftResources( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	UI:UpdateServerData_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.HangarWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

end


-- вызывается из c++. #36816 когда надо показать окно предложение воскреснуть с помощью игрока
function UI:ShowResurrectionWndByPlayer( resurrectorPlayerIdx )

	if UI.HudWnd then
		UI.HudWnd:ShowResurrectionWndByPlayer( resurrectorPlayerIdx )
	end

end


--
function UI:ShowResurrectionWndByPremium( interval )

	if UI.HudWnd then
		UI.HudWnd:ShowResurrectionWndByPremium( interval )
	end

end


--
function UI:ShowResurrectionWndByCredits( creditsPrice )

	if UI.HudWnd then
		UI.HudWnd:ShowResurrectionWndByCredits( creditsPrice )
	end

end


--
function UI:ShowResurrectionWndByNothing()

	if UI.HudWnd then
		UI.HudWnd:ShowResurrectionWndByNothing()
	end

end


--
function UI:ShowResurrectionWndResurrectOtherPlayer( otherPlayerIdx, creditsPrice )

	if UI.HudWnd then
		UI.HudWnd:ShowResurrectionWndResurrectOtherPlayer( otherPlayerIdx, creditsPrice )
	end

end


-- вызывается из c++. #36816 когда надо скрыть окно воскрешения
function UI:HideResurrectionWnd( bSuccessResurrected )

	if UI.HudWnd then
		UI.HudWnd:HideResurrectionWnd( bSuccessResurrected )
	end

end


--
function UI:ShowQuestEventWnd( result, requestId, questId, stageIdx, eventIdx )

	if UI.HudWnd then
		UI.HudWnd:ShowQuestEventWnd( result, requestId, questId, stageIdx, eventIdx )
	end

end


--
function UI:ShowAdventureEventWnd( result, requestId, atid, stageIdx, eventIdx )

	if UI.HudWnd then
		UI.HudWnd:ShowAdventureEventWnd( result, requestId, atid, stageIdx, eventIdx )
	end

end


--
function UI:ShowHudDialog( data )

	if UI.HudWnd then
		UI.HudWnd:ShowDialog( data )
	end

end


--
function UI:SpecialMailNotify( callParams )

	sys.log("^5UI:SpecialMailNotify:" )
	dprint( callParams )

	table.insert( UI.specialNotifiesQueue, callParams )
	UI:CheckShowNextSpecialNotify()
	
end


--
function UI:OnPlayerBoughPremiumVesselSpam( def, uid, nickName )

	local text = UI:GetStringByName( "chat_msg_brawado" )
	--text = string.gsub( text, "%$shipName%$", UI:GetEntityLocalizedNameByDef( def ) )
	UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, { def } )
	
end


--
function UI:OnPlayerCraftedVesselSpam( def, uid, nickName )

	local text = UI:GetStringByName( "chat_msg_shipCraft" )
	--text = string.gsub( text, "%$shipName%$", UI:GetEntityLocalizedNameByDef( def ) )
	UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, { def } )
	
end


-- игрок не в сети
function UI:GameChat_AddPrivateMessageNotFound( uid, nickName, bIsGm )

	local text = UI:GetStringByName( "chat_msg_playerisNotOnline" )
	UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, {} )

end


-- находитесь в чёрном списке у игрока
function UI:GameChat_AddPrivateMessageIgnored( uid, nickName, bIsGm )

	local text = UI:GetStringByName( "chat_msg_playerIgnored" )
	UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, {} )

end


-- чат отключён
function UI:GameChat_AddPrivateMessageChatDisable( channel )

	local text = UI:GetStringByName( "chat_notAvailable" )
	UI.Chat:AddSystemMessageForChannel( text, channel )

end


-- недостаточно боёв для отправки сообщений
function UI:GameChat_AddPrivateMessageMinBattles( channel, minBattles )

	local playerBattles = _G.MasterServer_GetAntibotCounter()

	local text = UI:GetStringByName( "chat_invalidNumBattles" )
	local strNumBattles = string.format( "%d/%d", playerBattles, minBattles )

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$num_battles%$", strNumBattles )
	if numSubst == 0 then
		sys.log( "UI:GameChat_AddPrivateMessageMinBattles()[ERROR]: cannot find placeholder '$num_battles$' in string 'chat_invalidNumBattles'" )
		text = string.format( "[INVALID STRING]Num battles required: %s", strNumBattles )
	end

	UI.Chat:AddSystemMessageForChannel( text, channel )

end


-- такого игрока не существует
function UI:GameChat_AddPrivateMessageNotExits( nickName )

	local text = UI:GetStringByName( "chat_msg_playerisNotExist" )

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$nickName%$", nickName )

	if numSubst == 0 then
		text = string.format( "[INVALID STRING] Player with nickname %s not exists", nickName )
	end

	-- здесь никнэйм не является ссылкой (в отличие от UI:GameChat_AddPrivateMessageNotFound())
	UI.Chat:AddSystemMessage( text )

end


--
function UI:OnPlayerUnlockedAchievement( achvId, rank, uid, nickName )

	if type( achvId ) ~= "number" then
		sys.log( "UI:OnPlayerUnlockedAchievement()[ERROR]: invalid type of the 1-st parameter (\"achvId\"); \"number\" expected, got \"%s\"", type( achvId ) )
		return
	end
	
	if type( rank ) ~= "number" then
		sys.log( "UI:OnPlayerUnlockedAchievement()[ERROR]: invalid type of the 2-nd parameter (\"rank\"); \"number\" expected, got \"%s\"", type( rank ) )
		return
	end
	
	if type( uid ) ~= "userdata" then
		sys.log( "UI:OnPlayerUnlockedAchievement()[ERROR]: invalid type of the 3-rd parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end
	
	if type( nickName ) ~= "string" then
		sys.log( "UI:OnPlayerUnlockedAchievement()[ERROR]: invalid type of the 4-th parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		return
	end

	local text = UI:GetStringByName( "chat_msg_achievement" )
	
	local achvName = UI:Achievement2Str( achvId, rank, false )
	
	local numSubst = 0
	text, numSubst = string.gsub( text, "%$achievement%$", achvName )
	
	if numSubst == 0 then
		sys.log( "UI:OnPlayerUnlockedAchievement()[ERROR]: cannot find placeholder \"$achievement$\" in string \"chat_msg_achievement\"" )
		text = string.format( "%s INVALID STRING Achievemtnt: %s", text, achvName )
	end

	UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, {} )

end


--
function UI:OnVoiceChatRecording( bSet )

--	sys.out( bSet and "VoiceChat: start recording" or "VoiceChat: stop recording" )
	UI.HudWnd:OnVoiceChatRecording( bSet )

end


--
function UI:OnVoiceChatPlayerTalking( playerIdx, bSet )

--	sys.out( bSet and "VoiceChat: player %d start talking" or "VoiceChat: player %d stop talking", playerIdx )
	UI.HudWnd:OnVoiceChatPlayerTalking( playerIdx, bSet )

end

--
function UI:OnPlayerSqidChanged( playerIdx, sqid )

--	sys.out( "OnPlayerSqidChanged: player %d, sqid %d", playerIdx, sqid.l )

	if UI.HudWnd then
		UI.HudWnd:OnPlayerSqidChanged( playerIdx, sqid )		
	end

end


--
function UI:OnJoyControlChanged()

	UI:OnBindsChanged()

end


-- called from c++. 
-- #39236 если кнопка взаимодействия не назначена, то нужно выводить другую строку при interaction. решил что проще и правильнее будет использовать ту же функцию, которая уже используется в UI
function UI:IsBindAssigned( bindName, bFitInputTypeOnly )

	local keys = UI:GetBindKeys( bindName, bFitInputTypeOnly )
	if keys and next( keys ) then
		return true
	else
		return false
	end

end

--
function UI:MasterServer_OnClanJoinReqGetPlayers( result, requestId )

	UI.ClansMyClan_Wnd:MasterServer_OnClanJoinReqGetPlayers( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( result )
	end

end

--
function UI:MasterServer_OnClanChangeRecruiting( result, requestId )

	UI.ClansMyClan_Wnd:MasterServer_OnClanChangeRecruiting( result, requestId )
	if result == 0 then
		UI.Clan:ReloadList( result )
	end

end

--
function UI:MasterServer_OnClanListRecruiting( result, requestId, list )

	UI.Clans_FindWnd:MasterServer_OnClanListRecruiting( result, requestId, list )

end


--
function UI:MasterServer_OnClanJoinReqAccept( result, requestId )

	UI.ClansMyClan_Wnd:MasterServer_OnClanJoinReqAccept( result, requestId )
	--if result == 0 then
		UI.Clan:ReloadList( result )
	--end

end


--
function UI:MasterServer_OnClanJoinReqCreate( result, requestId, param1, param2, cid )

	UI.Clans_FindWnd:MasterServer_OnClanJoinReqCreate( result, requestId, param1, param2, cid )

	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_request_to_clan" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

end


--
function UI:MasterServer_OnClanJoinReqCancel( result, requestId, param1, param2, cid )

	UI.Clans_FindWnd:MasterServer_OnClanJoinReqCancel( result, requestId, param1, param2, cid )
	if result == 0 then
		UI.Clan:ReloadList( result )
	end

end


--
function UI:MasterServer_OnTeachingList( result, requestId )

	UI.LoginWnd:MasterServer_OnTeachingList( result, requestId )

end


--
function UI:MasterServer_OnTeachingRequestToTeacher( result, requestId )

	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, unused, UI.InviteFriendWnd.SocialRequestType.REQUEST_TO_TEACHER )
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )

end


--
function UI:MasterServer_OnTeachingRequestToStudent( result, requestId )

	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, unused, UI.InviteFriendWnd.SocialRequestType.REQUEST_TO_STUDENT )
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )

end


--
function UI:MasterServer_OnTeachingAccept( result, requestId )

	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, unused, UI.InviteFriendWnd.SocialRequestType.TEACHING_ACCEPT )
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )

end


--
function UI:MasterServer_OnTeachingReject( result, requestId )

	UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, unused, UI.InviteFriendWnd.SocialRequestType.TEACHING_REJECT )
	UI.Social:ReloadSocialList( _G.MasterServer_GetSocial() )

end


--
function UI:MasterServer_OnReconnectAttempt()

	UI.LoginWnd:MasterServer_OnReconnectAttempt()

end


--
function UI:MasterServer_OnForcedUndock()

	UI.LoginWnd:MasterServer_OnForcedUndock()

end


--
function UI:GameStore_OnCraftVessel( result, requestId, param1, param2 )

	UI.HangarWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

end


--
function UI:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnBlueprints( result, requestId, param1, param2 )

	UI:UpdateServerData_OnBlueprints( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI:UpdateServerData_OnLearnBlueprints( result, requestId, defName )
	UI.HangarWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

end


--
function UI:GameStore_OnBuyArcDLC( result, requestId, param1, param2 )

	UI.HangarWnd:GameStore_OnBuyArcDLC( result, requestId, param1, param2 )
	
end


--
function UI:MasterServer_OnSocialSuggestFB( result, requestId, uidList )
	sys.out( "^5UI:MasterServer_OnSocialSuggestFB:" )
	dprint( uidList )
end


--
function UI:MasterServer_OnSocialSuggestVK( result, requestId, uidList )
	sys.out( "^5UI:MasterServer_OnSocialSuggestVK:" )
	dprint( uidList )
end


--
function UI:OnInvasionInfo( spawned, killed )

	UI.HangarWnd:OnInvasionInfo( spawned, killed )

	if UI.HudWnd then
		UI.HudWnd:OnInvasionInfo( spawned, killed )
	end

end


--
function UI:SkillManager_OnBuyTalentSet( result, requestId, param1, param2 )

	UI.HangarWnd:SkillManager_OnBuyTalentSet( result, requestId, param1, param2 )

end


--
function UI:SkillManager_OnSetTalentBindings( result, requestId, param1, param2 )

	UI:UpdateServerData_OnSetTalentBindings( result, requestId, param1, param2 )
	UI.HangarWnd:SkillManager_OnSetTalentBindings( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnWarThunderPromo()

	UI.bShowWarThunderPromo = true
	UI:CheckShowWarThunderPromo()

end


--
function UI:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	UI:UpdateServerData_OnShipQuests( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	UI:UpdateServerData_OnStartShipQuest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	UI:UpdateServerData_OnEndShipQuest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnShipQuestTime( retCode, requestId, questId )

	UI.HangarWnd:MasterServer_OnShipQuestTime( retCode, requestId, questId )

end


--
function UI:MasterServer_OnClanShipInfo( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnClanShipInfo()" )
	UI.HangarWnd:MasterServer_OnClanShipInfo( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnClanShipBuildingChanged( shipName )

--	sys.log( "^5UI:MasterServer_OnClanShipBuildingChanged()" )
	UI.HangarWnd:MasterServer_OnClanShipBuildingChanged( shipName )

end


--
function UI:MasterServer_OnClanShipBuild( result, requestId, shipName, partName, slotName )

--	sys.log( "^5UI:MasterServer_OnClanShipBuild() result %d", result )
	UI.HangarWnd:MasterServer_OnClanShipBuild( result, requestId, shipName, partName, slotName )

end


--
function UI:MasterServer_ClanShipBuildingComplete( shipName )

--	sys.log( "^5UI:MasterServer_ClanShipBuildingComplete()" )

	UI.Clan:ReloadList( MasterServer.ClanOpResult.CLR_OK, 0 )
	UI.GameplayPveMapWnd:UpdateUniverse()

	UI.HangarWnd:MasterServer_ClanShipBuildingComplete( shipName )

end


--
function UI:MasterServer_OnClanShipFit( result, requestId, shipName )

--	sys.log( "^5UI:MasterServer_OnClanShipFit()" )
	UI.HangarWnd:MasterServer_OnClanShipFit( result, requestId, shipName )

end


--
function UI:MasterServer_OnClanShipLeave( shipName, zoneId )

	UI.HangarWnd:MasterServer_OnClanShipLeave( shipName, zoneId )

end


--
function UI:MasterServer_OnEnterTournament( result, requestId, params )

	UI.HangarWnd:MasterServer_OnEnterTournament( result, requestId, params )

end


--
function UI:MasterServer_OnLeaveTournament( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnLeaveTournament( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnTournamentTeamsInfo( result, requestId, round )

--	sys.log( "^5UI:MasterServer_OnTournamentTeamsInfo()" )
	UI.HangarWnd:MasterServer_OnTournamentTeamsInfo( result, requestId, round )

end


--
function UI:MasterServer_OnTournamentRoundStarted( result, requestId, round )

	UI.HangarWnd:MasterServer_OnTournamentRoundStarted( result, requestId, round )

end


--
function UI:MasterServer_OnTournamentRoundEnded( result, requestId, round )

	UI.HangarWnd:MasterServer_OnTournamentRoundEnded( result, requestId, round )

end


--
function UI:MasterServer_OnTournamentTeamAssigned()

	UI.HangarWnd:MasterServer_OnTournamentTeamAssigned()

end


--
function UI:MasterServer_OnTournamentFinished()

	UI.HangarWnd:MasterServer_OnTournamentFinished()

end


--
function UI:MasterServer_OnTournamentStarted( result, requestId, param1, param2 )

    --sys.log( "UI:MasterServer_OnTournamentStarted( result, requestId, param1, param2 )" )

    if not UI:IsInTournament() then
        local roundInfo = _G.MasterServer_GetTournamentNextRoundTime()
        if roundInfo then
            if roundInfo.idx ~= nil or param1 == 0 then
                local minRank, maxRank = 1, UI:GetMaxRank()
                if param1 == 0 then
                    minRank, maxRank = UI:GetTournamentRanks( param2 )
                else
                    minRank, maxRank = UI:GetTournamentRanks( roundInfo.idx )
                end
                if UI:Reputation2Rank( UI:GetPlayerMaxReputationForRace() ) >= minRank then
                    local str = ""
                    if param1 == 0 then
                        str = UI:GetStringByName( "tournament_start_soon" )
                    else
                        str = UI:GetStringByName( "tournament_round_start_soon" )
                    end
                    str = string.gsub( str, "%$min_rank%$", minRank )
                    str = string.gsub( str, "%$max_rank%$", maxRank )
                    UI:GameChat_AddSystemMessage( str )
                end
            else
                sys.log( "UI:MasterServer_OnTournamentStarted()[ERROR]: roundInfo.idx is nil and param1 not 0" )
            end
        else
            sys.log( "UI:MasterServer_OnTournamentStarted()[ERROR]: _G.MasterServer_GetTournamentNextRoundTime() return nil" )
        end
    end

end


--
function UI:MasterServer_OnClanShipBoostBuilding( result, requestId, shipName )

--	sys.log( "^5UI:MasterServer_OnClanShipBoostBuilding() result %d", result )

	UI.HangarWnd:MasterServer_OnClanShipBoostBuilding( result, requestId, shipName )

end	


--
function UI:OnKillCamShowKiller( killerPlayerIdx, duration )

	if UI.HudWnd then
		UI.HudWnd:OnKillCamShowKiller( killerPlayerIdx, duration )
	end

end


--
function UI:OnKillCamShowKillerEnd()

	if UI.HudWnd then
		UI.HudWnd:OnKillCamShowKillerEnd()
	end

end


--
function UI:MasterServer_OnPtrServerStatus( requestId, errcode, status )

	UI.OptionsWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

end


--
function UI:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

	UI.OptionsWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

end


--
function UI:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

	UI.OptionsWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

end


--
function UI:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

	UI.OptionsWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnPVERaidStarted()

	self:AddChatMsgOnPveRaidStarted()

end


--
function UI:MasterServer_OnLeagueTeamInfo( result, requestId )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamInfo() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamInfo( result, requestId )
	UI.LoginWnd:MasterServer_OnLeagueTeamInfo( result, requestId )
	
end


--
function UI:MasterServer_OnLeagueTeamCreate( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamCreate() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamCreate( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamLeave( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamLeave() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamLeave( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamInviteSend( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamInviteSend() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamInviteSend( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamInviteCancel( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamInviteCancel() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamInviteCancel( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamInviteAccept( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamInviteAccept() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamInviteAccept( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamInviteDecline( result, requestId, param1, param2 )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamInviteDecline() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamInviteDecline( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnLeagueTeamKick( result, requestId, param1, param2, u64Param )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamKick() result %d", result )

	UI.Arena:MasterServer_OnLeagueTeamKick( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLeagueTeamNotif( notificationType, teamId, fromUid, paramU64, paramInt )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamNotif() %d(%s)", notificationType, UI:Val2Key( _G.MasterServer.LeagueTeamNotification, notificationType ) )

	UI.Arena:MasterServer_OnLeagueTeamNotif( notificationType, teamId, fromUid, paramU64, paramInt )

end


--
function UI:MasterServer_OnLeagueTeamNameUpdate( result, requestId, ltid, teamName )

--	sys.log( "^5UI:MasterServer_OnLeagueTeamNameUpdate ltid=%s teamName=%s", _G.U64ToStr( ltid ), teamName )

	UI.HangarWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, ltid, teamName )
	UI.Leaderboard_PlayersListWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, cid, nickName )
	UI.Leaderboard_DailyListWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, uid, field )
	UI.Leaderboard_ClansListWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, uid, field )

end


--
function UI:MasterServer_OnLeagueStarted()

	if UI:GetPlayerRank() >= UI.Arena:GetRequiredRank() then
		UI.Chat:AddSystemMessage( UI:GetStringByName( "chat_arenaStarted" ) )
	end

end


--
function UI:MasterServer_OnFootballStarted()

	-- #0097396
	-- UI.Chat:AddSystemMessage( UI:GetStringByName( "chat_footballStarted" ) )

end


--
function UI:MasterServer_OnSelectZone( result, requestId, param1, param2 ) 

	if result ~= _G.MasterServer.SelectZoneResult.SZR_OK then

		local msg = UI:GetStringByName( "msg_selectError" )

		local resultName = UI:Val2Key( _G.MasterServer.SelectZoneResult, result )
		local resultStr = UI:GetStringByName( resultName )
	
		msg = string.format( msg, resultStr )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

	end

end


--
function UI:MasterServer_OnVesselBudgetLevelUp( result, requestId, param1, param2, u64Param )

	self:UpdateServerData_OnVesselBudgetLevelUp( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnVesselBudgetLevelUp( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnVesselBudgetChanged( vid )

	self:UpdateServerData_OnVesselBudgetChanged( vid )
	UI.HangarWnd:MasterServer_OnVesselBudgetChanged( vid )

end


--
function UI:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	UI.HangarWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnAddThumbUp( result, requestId, param1, param2, u64Param )

	UI.HangarWnd:MasterServer_OnAddThumbUp( result, requestId, param1, param2, u64Param )

end


--
function UI:GameChat_OnObscenityMessage()

	UI.Chat:AddSystemMessage( UI:GetStringByName( "chat_obscenityMessageWarning" ), UI.Chat.colorIds.RED )

end


--
function UI:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

end


--
function UI:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupList( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupList( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupJoinReqCreate( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCreate( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupJoinReqCancel( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqCancel( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupUpdated( gid )

	UI.SquadFinder:MasterServer_OnLobbyGroupUpdated( gid )

end


--
function UI:MasterServer_OnLobbyGroupCreate( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupCreate( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupInfo( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupInfo( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupJoinReqReject( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupJoinReqReject( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupDelete( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupDelete( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupModify( result, requestId, param1, param2, u64Param )

	UI.SquadFinder:MasterServer_OnLobbyGroupModify( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnDealsNumChanged( result, requestId, param1, param2, u64Param )

	UI.HangarWnd:MasterServer_OnDealsNumChanged( result, requestId, param1, param2, u64Param )

end


--
function UI:UIBossSpawned( id )

	if UI.HudWnd then
		UI.HudWnd:UIBossSpawned( id )
	end

end


--
function UI:UIBossRemoved()

	if UI.HudWnd then
		UI.HudWnd:UIBossRemoved( id )
	end

end


--
function UI:OnChangeStatus()

	if UI.HudWnd then
		UI.HudWnd:OnChangeStatus()
	end

end


--
function UI:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnAdvertHeaderGetData( data )

	UI.HangarWnd:MasterServer_OnAdvertHeaderGetData( data )	

end


--
function UI:MasterServer_OnAdvertGetData( data )

	UI.HangarWnd:MasterServer_OnAdvertGetData( data )

end


--
function UI:MasterServer_OnBuyProductFromAdvert( result, requestId, param1, param2, u64Param )
	
	UI.HangarWnd:MasterServer_OnBuyProductFromAdvert( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnEMMChangeReady( result, requestId, isReady )

	sys.out( "^5UI:MasterServer_OnEMMChangeReady: result=%d, isReady=%d", result, isReady )

	UI.HangarWnd:MasterServer_OnEMMChangeReady( result, requestId, isReady )

end


--
function UI:MasterServer_OnEMMChangeExistOpponent( result, requestId, existOpponent )

	sys.out( "^5UI:MasterServer_OnEMMChangeExistOpponent: result=%d, existOpponent=%d", result, existOpponent )

	UI.HangarWnd:MasterServer_OnEMMChangeExistOpponent( result, requestId, existOpponent )

end


--
function UI:OnBattleStationModuleStateChanged()

--	sys.out( "^5OnBattleStationModuleStateChanged" )
	
	if UI.HudWnd then
		UI.HudWnd:OnBattleStationModuleStateChanged()
	end

end


--
function UI:MasterServer_OnQuestTime( result, requestId, questId )

	UI.HangarWnd:MasterServer_OnQuestTime( result, requestId, questId )

end


--
function UI:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	UI.HangarWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	
	if UI.HudWnd then
		UI.HudWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	end

end


--
function UI:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	UI.HangarWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )
	UI.ExpUpWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )
	
end


--
function UI:MasterServer_OnMaxVesselRankChange( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnMaxVesselRankChange( result, requestId, param1, param2 )
	
end


-- показ иконки "восклицательный знак" на маркере
function UI:ShowHudMarkNotify( entId, bYellow )

	if UI.HudWnd then
		UI.HudWnd:ShowMarkNotify( entId, bYellow )
	end

end


--
function UI:HideHudMarkNotify( entId )

	if UI.HudWnd then
		UI.HudWnd:HideMarkNotify( entId )
	end

end


--
function UI:ShowPhaseProgressBar( strId, param1, param2 )

	if UI.HudWnd then
		UI.HudWnd:ShowPhaseProgressBar( strId, param1, param2 )
	else
		sys.log( "UI:ShowPhaseProgressBar()[ERROR]: no hud yet" )
	end
	
end


--
function UI:HidePhaseProgressBar()

	if UI.HudWnd then
		UI.HudWnd:HidePhaseProgressBar()
	end

end


--
function UI:MasterServer_OnUniverseSetCivilianZone( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnUniverseSetCivilianZone( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnRewardSchedule( result, requestId, param1, param2, u64Param )

	UI.RewardSchedule:MasterServer_OnRewardSchedule( result, requestId, param1, param2, u64Param )
	
end


--
function UI:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )

	sys.log( "UI:MasterServer_OnPveScheduledLevels levels:" )
	dprint( _G.MasterServer_GetPveScheduledLevels() )

	UI.HangarWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	
end


-- поменялся доступный уровень миссии для локального игрока
function UI:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )

	UI.HangarWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )
	UI.PveMissionLevelWowWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )
	
	UI.Notifications:AddNotification( UI.Notifications.types.UNLIM_PVE_MISSION_LEVEL_UP, { mission = missionName, level = level } )

end


-- поменялся текущий уровень миссии в геймплее
function UI:OnUnlimPveMissionLevelChanged( newLevel )

	if UI.HudWnd then
		UI.HudWnd:OnUnlimPveMissionLevelChanged( newLevel )
	end

end


--
function UI:OnWavePveStartWaveChanged( newStartWave )

	if UI.HudWnd then
		UI.HudWnd:OnWavePveStartWaveChanged( newStartWave )
	end

end


--
function UI:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )

	UI.HangarWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )
	
end


-- приходит как ответ тому, кто посылал на запрос на смену корабля
function UI:MasterServer_OnClanShipSetCurrent( result, requestId, param1, param2 )

	UI.Clan:ReloadList( result, requestId )
	UI.HangarWnd:MasterServer_OnClanShipSetCurrent( result, requestId, param1, param2 )
	
end


-- приходит всем членам клана
function UI:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )

	UI.Clan:ReloadList( result, requestId )
	UI.HangarWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )

end


-- показ "говорящей головы" в худе
--[[
	params =
	{
		portrait_id		= <string>,		-- ид картинки
		name_text_id	= <string>,		-- ид заголовка
		text_id			= <string>,		-- ид текста
		time			= <number>,		-- время в секундах, опциональный, по умолчанию 10 сек.
		sound			= <string>,		-- зыук (голос), опцпиональный
	}
]]	
function UI:ShowDialogScript( params )

	local dialogId = -1
	
	if not UI.HudWnd then
		sys.log( "UI:ShowDialogScript()[ERROR]: no hud" )
		return dialogId
	end
	
	dialogId = UI.scriptedDialogs_nextId
	UI.scriptedDialogs_nextId = UI.scriptedDialogs_nextId + 1
	
	UI.HudWnd:ShowScriptedDialog( dialogId, params )
	
	return dialogId

end


--
function UI:HideDialogScript( dialogId )

	if type( dialogId ) ~= "number" then
		sys.log( "UI:HideDialogScript()[ERROR]: invalid type of the 1-st parameter (\"dialogId\"); \"number\" expected, got \"%s\"", type( dialogId ) )
		return
	end
	
	if UI.HudWnd then
		UI.HudWnd:HideScriptedDialog( dialogId )
	end

end


-- добавление задания в квесттрэкер в худе
--[[
	--
	progress =
	{
		cur		= <number>,		-- текущее значение
		max		= <number>,		-- максимальное значение
		success	= <boolean>,	-- завершен успешно, опциональный (success и fail не могут быть одновременно true)
		fail	= <boolean>,	-- завершен провалом, опциональный
	}
	
	--
	icoType - тип восклицательного знака (голубой/желтый), значение из таблицы 
		UI.questIcoTypes =
		{
			YELLOW	= 1,
			BLUE	= 2,
		}
		опциональный, по умолчанию голубой
]]
function UI:AddTask( textId, progress, icoType )
	
	if type( textId ) ~= "string" then
		sys.log( "UI:AddTask()[ERROR]: invalid type of the 1-st parameter (\"textId\"); \"string\" expected, got \"%s\"", type( textId ) )
		textId = ""
	end
	
	progress = UI:ValidateScriptedQuestProgress( progress )	
	
	if icoType ~= nil then
	
		if type( icoType ) == "number" then
		
			if UI:Val2Key( UI.questIcoTypes, icoType ) == "" then
				sys.log( "UI:AddTask()[ERROR]: invalid icoType=%d; a value from UI.questIcoTypes expected", icoType )
				icoType = nil
			end
		
		else
			sys.log( "UI:AddTask()[ERROR]: invalid type of the 3-rd parameter (\"icoType\"); \"number\" or \"nil\" expected, got \"%s\"", type( icoType ) )
			icoType = nil
		end
		
	end
	
	if icoType == nil then
		icoType = UI.questIcoTypes.BLUE
	end
	
	local questId = UI.scriptedQuests_nextId
	UI.scriptedQuests_nextId = UI.scriptedQuests_nextId + 1
	
	local questData =
	{
		questId			= questId,
		textId			= textId,
		curVal			= progress.cur,
		maxVal			= progress.max,
		bCompleted		= progress.success or progress.fail,
		bSuccess		= progress.success,
		icoType			= icoType,
	}
	
	table.insert( UI.scriptedQuests, questData )
	
	if UI.HudWnd then
		UI.HudWnd:OnScriptedQuestAdd( questId )
	else
		sys.log( "UI:AddTask()[ERROR]: no hud" )
	end
	
	return questId
	
end


--
function UI:RemoveTask( questId )
	
	if type( questId ) ~= "number" then
		sys.log( "UI:RemoveTask()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end
	
	local bFound = false
	
	for idx, questData in pairs( UI.scriptedQuests ) do
		if questData.questId == questId then
			table.remove( UI.scriptedQuests, idx )
			bFound = true
			break
		end
	end
	
	if bFound then
		if UI.HudWnd then
			UI.HudWnd:OnScriptedQuestRemove( questId )
		end
	end
	
end


--[[
	progress =
	{
		cur		= <number>,		-- текущее значение
		max		= <number>,		-- максимальное значение
		success	= <boolean>,	-- завершен успешно, опциональный (success и fail не могут быть одновременно true)
		fail	= <boolean>,	-- завершен провалом, опциональный
	}
]]
function UI:UpdateTask( questId, progress )
	
	if type( questId ) ~= "number" then
		sys.log( "UI:UpdateTask()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end
	
	progress = UI:ValidateScriptedQuestProgress( progress )	
	
	local questData = UI:GetScriptedQuestData( questId )
	if not questData then
		sys.log( "UI:UpdateTask()[ERROR]: quest %d not found", questId )
		return
	end
	
	questData.curVal		= progress.cur
	questData.maxVal		= progress.max
	questData.bCompleted	= progress.success or progress.fail
	questData.bSuccess		= progress.success
	
	if UI.HudWnd then
		UI.HudWnd:OnScriptedQuestProgress( questId )
	else
		sys.log( "UI:UpdateTask()[ERROR]: no hud" )
	end
	
end


-- показ в чате сообщения с параметрами
--[[
	--
	messageType - тип сообщения, значение из таблицы
		UI.scriptedChatMsgTypes =
		{
			REWARD	= 1,
			EVENT	= 2,
		}
		в зависимости от типа будет разный цвет сообщения
		
	--
	params - опциональный параметр, массив из параметров, которые подставляют значения в строку;
	поля в каждом параметре:
	{
		name	= <string>, -- соответствует плэйсхолдеру в строке,
		type	= <number>,	-- из энума ai.GameMsgParamType,
		value	= any,		-- может быть разным, в зависимости от поля type
	}
	
	пример:
	params = 
	{	
		{ name = "credits", 		type = ai.GameMsgParamType.INT, 		value = 100, },							-- value - число; нарисуется всегда как целое
		{ name = "distance", 		type = ai.GameMsgParamType.FLOAT,		value = 50.5, },						-- value - число; нарисуется как дробное если есть дробная чать, или как целое если нет дробной части
		{ name = "zoneName", 		type = ai.GameMsgParamType.STR_ID, 		value = "Jerico_HomeWorld", },			-- value - id строки; нарисуется локализованная строка
		{ name = "interactBind",	type = ai.GameMsgParamType.BIND, 		value = "interact", },					-- value - имя бинда из UserBindings; нарисуется назначенная на бинд клавиша(-ши)
		{ name = "enemyName",		type = ai.GameMsgParamType.ENTITY_ID,	value = 89, },							-- value - id энтити; нарисуется локализованное имя
		{ name = "lootCrate", 		type = ai.GameMsgParamType.DEF_NAME,	value = "LootCrate_SpaceJunk", },		-- value - имя дефа; нарисуется локализованное имя
		{ name = "time", 			type = ai.GameMsgParamType.TIME,		value = 10.5, },						-- value - время в секундах; нарисуется в формате "1 день 2 минуты" (пропускает нулевые промежутки времени, локализованные единицы склоняются)
		{ name = "quest", 			type = ai.GameMsgParamType.QUEST_NAME,	value = QuestId.CAMPAIGN_QUEST_1, },	-- value - id обычного квеста (число); нарисуется имя квеста
		{ name = "task", 			type = ai.GameMsgParamType.QUEST_TASK,	value = QuestId.CAMPAIGN_QUEST_1, },	-- value - id обычного квеста (число); нарисуется задание квеста в том виде, в котором оно в квесттрэкере
		{ name = "player", 			type = ai.GameMsgParamType.PLAYER_NAME, value = 1, },							-- value - индекс игрока в геймплее (от 0 до 31); нарисуется имя игрока
	}
]]
function UI:AddLogMessage( messageType, textId, params )
	
	if type( messageType ) == "number" then	
		if UI:Val2Key( UI.scriptedChatMsgTypes, messageType ) == "" then
			sys.log( "UI:AddLogMessage()[ERROR]: invalid messageType %d; expected from UI.scriptedChatMsgTypes", messageType )
			messageType = -1
		end
	else
		sys.log( "UI:AddLogMessage()[ERROR]: invalid type of the 1-st parameter (\"messageType\"); \"number\" expected, got \"%s\"", type( messageType ) )
		messageType = -1
	end	
	
	if type( textId ) ~= "string" then
		sys.log( "UI:AddLogMessage()[ERROR]: invalid type of the 2-nd parameter (\"textId\"); \"string\" expected, got \"%s\"", type( textId ) )
		textId = ""
	end
	
	if params ~= nil then
		if type( params ) ~= "table" then
			sys.log( "UI:AddLogMessage()[ERROR]: invalid type of the 3-rd parameter (\"params\"); \"table\" or \"nil\" expected, got \"%s\"", type( params ) )
			params = nil
		end
	end
	
	local str = UI:SubstituteHudMsgParams( textId, params )
	
	local colorId = nil
	
	if messageType == UI.scriptedChatMsgTypes.REWARD then
		colorId = UI.Chat.colorIds.SCRIPTED_REWARD
	elseif messageType == UI.scriptedChatMsgTypes.EVENT then
		colorId = UI.Chat.colorIds.SCRIPTED_EVENT
	else
		sys.log( "UI:AddLogMessage()[ERROR]: unhandled messageType %d", messageType )
	end
	
	UI.Chat:AddSystemMessage( str, colorId )
	
end


--
function UI:MasterServer_OnClanHistoryGet( data )

	UI.HangarWnd:MasterServer_OnClanHistoryGet( data )

end


--
function UI:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )

	UI.LoginWnd:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )

end


--
function UI:MasterServer_OnWarStart( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnWarStart( result, requestId, param1, param2 )
	
end


--
function UI:MasterServer_OnWarClanRevive( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnWarClanRevive( result, requestId, param1, param2 )
	
end


--
function UI:FormatLeagueForbiddenEquipmetnMsg( text, badEquipment, badAutogenEquipment )

	-- сначала корабли, потом модули
	local function fnSort( def1, def2 )
	
		local isShip1 = UI:IsDefShip( def1 )
		local isShip2 = UI:IsDefShip( def2 )
		
		if isShip1 ~= isShip2 then
			return isShip1
		end
		
		return def1 < def2
		
	end
	
	table.sort( badEquipment, fnSort )
	
	local strBadEquipment = ""
	for badIdx, defName in ipairs( badEquipment ) do
	
		local strName = UI:GetEntityLocalizedNameByDef( defName, useColor, false )
		if useColor then
			strName = string.format( "%s%s", strName, UI:Color2Str( UI.WHITE_COLOR ) )
		end
		
		strBadEquipment = string.format( "%s%s%s", strBadEquipment, strBadEquipment ~= "" and ", " or "", strName )
		
	end

	local numSubst = 0
	text, numSubst = string.gsub( text, "%$bad_equipment%$", strBadEquipment )
	if numSubst == 0 then
		sys.log( "UI:FormatLeagueForbiddenEquipmetnMsg()[ERROR]: cannot find placeholde '$bad_equipment$' in string '%s'", errorStringId )
		text = string.format( "%s [INVALID STRING] Bad equipment: %s", text, strBadEquipment )
	end
	
	return text
	
end	


--
function UI:MasterServer_OnLeagueEquipmentConstraints()
	
	UI:UpdateItemIconsOnLeagueForbiddenEquipmentChanged()

end


--
function UI:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )

	UI:UpdateServerData_OnVesselChangeEquipMulti( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )

	--sys.log( "MasterServer_OnUserNotes %d %d", result, requestId )
	UI.LoginWnd:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )
	UI:UpdateServerData_OnUserNotes( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

	--sys.log( "MasterServer_OnUserNotesAdd %d %d", result, requestId )
	UI:UpdateServerData_OnUserNotesAdd( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnUserNotesDelete( result, requestId, uids )

--	sys.log( "MasterServer_OnUserNotesDelete %d %d", result, requestId )
	UI:UpdateServerData_OnUserNotesDelete( result, requestId, uids )
	UI.HangarWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )

end


--
function UI:MasterServer_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )

	-- sys.log( "MasterServer_OnBattlePassUnlockLevel result:%d(%s) requestId:%d stage:%d", result, UI:Val2Key( _G.MasterServer.BattlePassResult, result ), requestId, param1 )
	UI:UpdateServerData_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )

	-- sys.log( "MasterServer_OnBattlePassUnlockPremium result:%d(%s) requestId:%d", result, UI:Val2Key( _G.MasterServer.BattlePassResult, result ), requestId )
	UI:UpdateServerData_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnBattlePassActivation( result, requestId, param1, param2, u64Param )

	-- sys.log( "UI:MasterServer_OnBattlePassActivation" )
	UI:UpdateServerData_OnBattlePassActivation( result, requestId, param1, param2, u64Param )
	UI.HangarWnd:MasterServer_OnBattlePassActivation( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )

	UI.HangarWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )
	UI.ChatWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )

end


--
function UI:MasterServer_OnLobbyGroupCreated( params )

	-- SC-111516 убрано
	--UI.Chat:AddSquadFinderGroupCreateMessage( params )

end


--
function UI:OnHudMarkTimersChanged( timers )

	-- sys.log( "^5UI:OnHudMarkTimersChanged" )
	-- dprint( timers )

	UI.hudMarkTimers = timers
	
	if UI.HudWnd then
		UI.HudWnd:OnHudMarkTimersChanged( timers )
	end

end


--
function UI:MasterServer_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )

	-- sys.log( "UI:MasterServer_OnZonesLuaActiveEventsUpdate() result=%s(%d)", UI:Val2Key( _G.MasterServer.VariableSyncResult, result ), result )

	UI:UpdateServerData_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )

end


--
function UI:OnInteractionStart( interactionType, crateEnt )

	if UI.HudWnd then
		UI.HudWnd:OnInteractionStart( interactionType, crateEnt )
	end
	
end


--
function UI:OnInteractionStop()

	if UI.HudWnd then
		UI.HudWnd:OnInteractionStop()
	end
	
end


--
function UI:OnMultipleLootCrateChanged()

	if UI.HudWnd then
		UI.HudWnd:OnMultipleLootCrateChanged()
	end
	
end


--
function UI:CanReactOnPrimaryFireCmd()

	if UI.HudWnd then
		return UI.HudWnd:CanReactOnPrimaryFireCmd()
	else
		return false
	end

end


--
function UI:CanReactOnSecondaryFireCmd()

	if UI.HudWnd then
		return UI.HudWnd:CanReactOnSecondaryFireCmd()
	else
		return false
	end

end


--
function UI:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )

	UI:UpdateServerData_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )
	UI.HangarWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )
	
end


--
function UI:GameStore_OnAutogenDestroy( result, requestId, params )	
	
	UI:UpdateServerData_OnAutogenDestroy( result, requestId, params )
	UI.HangarWnd:GameStore_OnAutogenDestroy( result, requestId, params )
	
end


--
function UI:GameStore_OnAutogenDismantle( result, requestId, params )
	
	UI:UpdateServerData_OnAutogenDismantle( result, requestId, params )
	UI.HangarWnd:GameStore_OnAutogenDismantle( result, requestId, params )
	
end


--
function UI:MasterServer_OnTradeMoneyChanged( result, requestId, param1, param2 )

	UI.HangarWnd:MasterServer_OnTradeMoneyChanged( result, requestId, param1, param2 )

end


--
function UI:OnHudBossChanged( bossId )

	if UI.HudWnd then
		UI.HudWnd:OnHudBossChanged( bossId )
	end

end


-- called from native code
function UI:MasterServer_OnLeadingAdvertTimerActivation()

	UI.HangarWnd:MasterServer_OnCurrentEventStateChanged()

end


-- called from native code
function UI:MasterServer_OnLeadingAdvertTimerExpired()

	UI.HangarWnd:MasterServer_OnCurrentEventStateChanged()

end


--
function UI:MasterServer_OnNewAdventure( params )
	
	UI:UpdateAdventuresData()

	for idx, param in pairs( params ) do
		UI.HangarWnd:MasterServer_OnNewAdventure( param )

		if UI.HudWnd then
			UI.HudWnd:MasterServer_OnNewAdventure( param )
		end
	end
	
end


--
function UI:MasterServer_OnAdventureProgress( params )
	
	UI:UpdateAdventuresData()
	
end


--
function UI:MasterServer_OnAdventureStageChange( params )
	
	UI:UpdateAdventuresData()
	
	for idx, param in pairs( params ) do
		--UI.HangarWnd:MasterServer_OnAdventureStageChange( param )

		if UI.HudWnd then
			UI.HudWnd:MasterServer_OnAdventureStageChange( param )
		end
	end

end


--
function UI:MasterServer_OnAdventureFinal( params )
	
	UI:UpdateAdventuresData()

	for idx, param in pairs( params ) do
		UI.HangarWnd:MasterServer_OnAdventureFinal( param )

		if UI.HudWnd then
			UI.HudWnd:MasterServer_OnAdventureFinal( param )
		end
	end
	
end


--
function UI:OnUpdateAdventureOffers( giverObject )

	UI.HangarWnd:OnUpdateAdventureOffers( giverObject )

end
