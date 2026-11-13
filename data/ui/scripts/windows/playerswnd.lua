-- ----------------------------------------------------------------------------
--
-- Workfile: playerswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.PlayersWnd = {}
local pw = UI.PlayersWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayersWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "PlayersWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		isPrototype		= true,
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
				defName 			= "players_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn_slot",
						layer		= "UI.PlayersWnd.layers.VIEW_MODE_BUTTONS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- VIEW_MODE_BUTTONS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "players_viewModeButtons",
				defaultAnimation	= "idle",
			}}
		}
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PlayersWnd:GetMode()

	return self.mode

end


--
function UI.PlayersWnd:GetViewMode()

	return self.viewMode

end


--
function UI.PlayersWnd:GetMaxNumShipSlotByPlayer()

	return self.numShipSlots 

end


--
function UI.PlayersWnd:PlayerStatus2Str( status )

	if status == _G.network.PlayerStatus.PS_CONNECTED or status == _G.network.PlayerStatus.PS_MAP_LOAD or status == _G.network.PlayerStatus.PS_RESERVED then
		return UI:GetStringByName( "players_playerStatus_loading" )

	elseif status == _G.network.PlayerStatus.PS_LEFT then
		return UI:GetStringByName( "players_playerStatus_disconnected" )
	else
		sys.log( "UI:PlayerStatus2Str()[ERROR]: unhandled status %s", tostring( status ) )
		return ""
	end

end   


--
function UI.PlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self.friendsList then
	
		for recordIdx = 1, self.friendsList:GetNumRecords() do

			local data = self.friendsList:GetRecordData( recordIdx )
			if data and UI:GetPlayerClanById( data.playerInfo.playerId ) == cid then

				local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:OnClanNameChanged()
				end

			end

		end    
		
	end

	if self.enemiesList then
	
		for recordIdx = 1, self.enemiesList:GetNumRecords() do

			local data = self.enemiesList:GetRecordData( recordIdx )
			if data and UI:GetPlayerClanById( data.playerInfo.playerId ) == cid then

				local slotWnd = self.enemiesList:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:OnClanNameChanged()
				end

			end

		end
	end

end


--
function UI.PlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end

	if self.friendsList then
	
		for recordIdx = 1, self.friendsList:GetNumRecords() do

			local data = self.friendsList:GetRecordData( recordIdx )
			if data then
			
				local playerUid = data.playerInfo.isBot and data.playerInfo.botUid or data.playerInfo.uid
				if playerUid == uid then

					local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
					if slotWnd then
						slotWnd:OnClanNameChanged()
					end
					
				end

			end

		end    
		
	end

	if self.enemiesList then
	
		for recordIdx = 1, self.enemiesList:GetNumRecords() do

			local data = self.enemiesList:GetRecordData( recordIdx )
			if data then
			
				local playerUid = data.playerInfo.isBot and data.playerInfo.botUid or data.playerInfo.uid
				if playerUid == uid then

					local slotWnd = self.enemiesList:GetButtonForRecord( recordIdx )
					if slotWnd then
						slotWnd:OnClanNameChanged()
					end
					
				end

			end

		end
	end
	
end


--
function UI.PlayersWnd:NeedShowShip( playerId, shipInfo )

	-- #0060301 - задисэйбленные по рангу корабли не рисуются
	return _G.CL_GetHangarStatus( playerId, shipInfo.hangarIdx ) ~= ai.HangarStatus.DISABLED

end


--
function UI.PlayersWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if self.friendsList then
	
		for recordIdx = 1, self.friendsList:GetNumRecords() do

			local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnAccountRankChanged()
			end

		end
		
	end

	if self.enemiesList then
	
		for recordIdx = 1, self.enemiesList:GetNumRecords() do

			local slotWnd = self.enemiesList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnAccountRankChanged()
			end

		end
		
	end

end


--
function UI.PlayersWnd:F_OnEventPlayerInfoChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	local result = iParam0
	local playerId = iParam1
	
	if result ~= 0 then
		return
	end
	
	if self.friendsList then
		
		for recordIdx = 1, self.friendsList:GetNumRecords() do
		
			local data = self.friendsList:GetRecordData( recordIdx )
			if data and data.playerInfo.playerId == playerId then
			
				data.playerInfo.playerSettings = _G.GetPlayerInfo( playerId ).playerSettings
			
				local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:OnPlayerSettingsChanged()
				end
				
				break

			end

		end
		
	end
	
end


--
function UI.PlayersWnd:OnUnlimPveMissionLevelChanged( newLevel )

	if not self:IsOnScreen() then
		return
	end
	
	if self.friendsList then
		
		for recordIdx = 1, self.friendsList:GetNumRecords() do
			
			local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnUnlimPveMissionLevelChanged()
			end

		end
		
	end

end


--
function UI.PlayersWnd:OnWavePveStartWaveChanged( newStartWave )

	if not self:IsOnScreen() then
		return
	end
	
	if self.friendsList then
		
		for recordIdx = 1, self.friendsList:GetNumRecords() do
			
			local slotWnd = self.friendsList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnUnlimPveMissionLevelChanged()
			end

		end
		
	end

end


-- ------------------------------
-- const
-- ------------------------------

pw.layers =
{
	MAIN_EFFECT					= 0,
	VIEW_MODE_BUTTONS_EFFECT	= 1,
	
}

pw.MAX_SHIP_SLOTS = 4
pw.MIN_SHIP_SLOTS = 3

pw.friendsListPrototypeName	= "PlayersListWnd"
pw.enemiesListPrototypeName	= "PlayersListWnd"

pw.modes =
{
	LOADING_SCREEN	= 1,
	HUD				= 2,
	HUD_2_FRIENDS	= 3,
	HUD_2_ENEMIES	= 4,
}

pw.mode = -1

pw.viewModes =
{
	HIDDEN		= 1,
	BRIEF		= 2,
	MEDIUM		= 3,
	FULL_SCORE	= 4,	
	FULL_KILLS	= 5,
}

pw.DEFAULT_VIEW_MODE = pw.viewModes.BRIEF

pw.sounds =
{
	viewModeChanged	= "sound/ui/btnClick"
}

pw.effectInfo =
{
	main =
	{
		friendsListLocator				= "players_slot_left",

		enemiesListLocator_FULL_SCORE_4	= "long_4",
		enemiesListLocator_FULL_SCORE_3	= "long_3",
		enemiesListLocator_FULL_KILLS_4	= "s_long_4",
		enemiesListLocator_FULL_KILLS_3	= "s_long_3",
		enemiesListLocator_MEDIUM_4		= "mid_4",
		enemiesListLocator_MEDIUM_3		= "mid_3",
		enemiesListLocator_BRIEF		= "short_4_name",
	},

	viewModeBtns =
	{	
		viewMode2Locator =
		{
			[ pw.viewModes.HIDDEN ]		= "btn_1",
			[ pw.viewModes.BRIEF ]		= "btn_2",
			[ pw.viewModes.MEDIUM ]		= "btn_3",
			[ pw.viewModes.FULL_SCORE ]	= "btn_4",
			[ pw.viewModes.FULL_KILLS ]	= "btn_5",
		}
	}
}

-- ------------------------------
-- vars
-- ------------------------------

pw.friendsList				= nil
pw.enemiesList				= nil
pw.viewMode					= -1
pw.viewModeBtns				= {}
pw.numShipSlots				= pw.MAX_SHIP_SLOTS
pw.sentinelLeaderId_friend	= -1
pw.sentinelLeaderId_enemy	= -1
pw.bomberMask				= 0
pw.bShowFriends				= true
pw.bShowEnemies				= true
pw.bShowViewModeBtns		= true

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayersWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self.viewModeBtns = {}

	if self:IsPrototype() then
		return
	end
	
	if self.mode == self.modes.LOADING_SCREEN then
	
		self.bShowViewModeBtns	= false

	elseif self.mode == self.modes.HUD_2_FRIENDS then
		
		self.bShowEnemies		= false
		self.bShowViewModeBtns	= false

	elseif self.mode == self.modes.HUD_2_ENEMIES then
	
		self.bShowFriends		= false
		self.bShowViewModeBtns	= false

	end
	
	if not self.bShowViewModeBtns then
		self:SetLayerVisible( false, self.layers.VIEW_MODE_BUTTONS_EFFECT )
	end

	self:CreateControls()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ON_REMOVE_PLAYER )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_GAMEPLAY_RULES_INITIALIZED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_PLAYER_STATUS_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_PLAYER_INFO_CHANGED )

end


--
function UI.PlayersWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self.bShowFriends then
	
		self.friendsList = UI:CreateChildWnd( self, UI[ self.friendsListPrototypeName ], "friends" )
		self:AddChild( self.friendsList )
		self.friendsList:Setup( true )
		
		if self.mode ~= self.modes.HUD_2_FRIENDS then
			mainEffect:LinkWnd( self.friendsList:GetUiHandle(), self.effectInfo.main.friendsListLocator, UI.EffectAnimParams.POS )
		end
		
	end

	if self.bShowEnemies then
	
		self.enemiesList = UI:CreateChildWnd( self, UI[ self.enemiesListPrototypeName ], "enemies" )
		self.enemiesList:Setup( false )
		
	end

	if self.bShowViewModeBtns then
	
		local btnsEffect = UI:GetEffectFromLayer( self, self.layers.VIEW_MODE_BUTTONS_EFFECT )
	
		for viewModeName, viewMode in pairs( self.viewModes ) do
		
			local btn = UI:CreateChildWnd( self, UI.Players_ViewModeBtn, viewModeName )
			btn:Setup( viewMode )
			
			local locatorName = self.effectInfo.viewModeBtns.viewMode2Locator[ viewMode ] or ""
			UI:AddChildAndLink( self, btn, btnsEffect, locatorName, UI.EffectAnimParams.POS )
			
			self.viewModeBtns[ viewMode ] = btn
			
		end
		
	end

end


--
function UI.PlayersWnd:Reset()

	self:ResetPlayerLists()
	
	for viewMode, btn in pairs( self.viewModeBtns ) do
		btn:Check( false )
	end

	self.viewMode					= -1
	self.numShipSlots				= self.MAX_SHIP_SLOTS
	self.sentinelLeaderId_friend	= -1
	self.sentinelLeaderId_enemy		= -1
	self.bomberMask					= 0

end


--
function UI.PlayersWnd:ResetPlayerLists()

	if self.friendsList then
		self.friendsList:Reset()
		self.friendsList:UnlinkFromParent()
	end
	
	if self.enemiesList then
	
		self.enemiesList:Reset()
		self.enemiesList:UnlinkFromParent()
		
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.enemiesList:GetUiHandle(), "" )
		end

	end

end


--
function UI.PlayersWnd:FullUpdate()

	self:Reset()

	self:UpdateSentinelLeaders()
	self:UpdateBomber()
	self:UpdateViewModeButtonsState()
	self:UpdateViewMode()
	self:UpdatePlayerLists()

end


--
function UI.PlayersWnd:UpdateViewMode()

	local viewMode = self.DEFAULT_VIEW_MODE
	
	if self.mode ~= self.modes.HUD_2_FRIENDS and self.mode ~= self.modes.HUD_2_ENEMIES then
	
		local profile = _G.GetProfileTable()
		
		if type( profile.playersListMode ) == "number" and UI:Val2Key( self.viewModes, profile.playersListMode ) ~= "" then
			viewMode = profile.playersListMode
		end
	
	end

	self:SetViewMode( viewMode )

end


--
function UI.PlayersWnd:SetViewMode( viewMode )

	if viewMode == self.viewMode then
		return
	end

	if UI:Val2Key( self.viewModes, viewMode ) == "" then
		sys.log( "UI.PlayersWnd:SetViewMode()[ERROR]: invalid mode %s", tostring( viewMode ) )
		return
	end

	self.viewMode = viewMode
	self:SaveViewMode()

	self:OnViewModeChanged()

end


--
function UI.PlayersWnd:SaveViewMode()

	if self.mode == self.modes.HUD_2_FRIENDS or self.mode == self.modes.HUD_2_ENEMIES then
		return
	end

	if self.viewMode == -1 then
		return
	end

	local profile = _G.GetProfileTable()
	local savedViewMode = profile.playersListMode or self.DEFAULT_VIEW_MODE

	if self.viewMode ~= savedViewMode then
		profile.playersListMode = self.viewMode
		Profile:Save()
	end

end


--
function UI.PlayersWnd:OnViewModeChanged()

	self:UpdatePlayerLists()
	self:UpdateViewModeButtonsState()
	
end


--
function UI.PlayersWnd:UpdateViewModeButtonsState()

	for viewMode, btn in pairs( self.viewModeBtns ) do
		btn:Check( viewMode == self.viewMode )
	end

end


--
function UI.PlayersWnd:UpdatePlayerLists()

	self:ResetPlayerLists()
	
	if self.viewMode == self.viewModes.HIDDEN then
		return
	end

	local localPlayerId		= _G.Game_LocalClientNum()
	local localPlayerTeam	= _G.CL_GetPlayerTeam( localPlayerId )

	local data_friends = {}
	local data_enemies = {}

	local gameplay = self:GetGameplay()

	local playersInfo = _G.GetAllPlayersInfo() or {}
	for idx, playerInfo in pairs( playersInfo ) do
	
		local bFriend = self:IsTeamFriend( playerInfo.team, localPlayerTeam, gameplay )
		
		if bFriend and self.bShowFriends or not bFriend and self.bShowEnemies then

			if self:NeedPlayerSlot( playerInfo ) then

				local data = {}

				data.playerInfo			= playerInfo
				data.bLocal				= playerInfo.playerId == localPlayerId
				data.ships				= _G.CL_GetAvailableShips( playerInfo.playerId ) or {}
				data.shipsSummaryLevel = self:GetPlayerShipsSummaryLevel( data.ships, playerInfo.playerId )	-- нужно для сортировки			
				data.bLeader 			= playerInfo.playerId == self.sentinelLeaderId_friend or playerInfo.playerId == self.sentinelLeaderId_enemy
				data.bBomber			= UI:BitTst( self.bomberMask, playerInfo.playerId )

				if not bFriend and gameplay == ai.Gameplay.THREE_TEAMS_DM then
					local bSecondEnemy = UI:IsThreeTeamsDMSecondEnemy( localPlayerTeam, playerInfo.team )
					data.enemyTeamIdx = bSecondEnemy and 2 or 1
				end

				if bFriend then
					table.insert( data_friends, data )
				else
					table.insert( data_enemies, data )
				end

			end
			
		end

	end

	local fnSort = function( data1, data2 )
		if data1.enemyTeamIdx and data2.enemyTeamIdx and data1.enemyTeamIdx ~= data2.enemyTeamIdx then
			return data1.enemyTeamIdx < data2.enemyTeamIdx
		end

		return data1.shipsSummaryLevel > data2.shipsSummaryLevel
	end

	table.sort( data_friends, fnSort )
	table.sort( data_enemies, fnSort )


	self.numShipSlots = self.MIN_SHIP_SLOTS
	
	local allData = { data_friends, data_enemies }

	for relationshipIdx, dataByRelationship in pairs( allData ) do
		for playerIdx, playerData in pairs( dataByRelationship ) do
			for shipIdx, shipInfo in pairs( playerData.ships ) do

				if self:NeedShowShip( playerData.playerInfo.playerId, shipInfo ) then

    				if shipInfo.hangarIdx + 1 >= self.MAX_SHIP_SLOTS then
    					self.numShipSlots = self.MAX_SHIP_SLOTS
    					break
    				end

				end

			end
		end
	end
	
	if self.friendsList then
		self:AddChild( self.friendsList )
		self.friendsList:AddRecords( data_friends )
	end
	
	-- #0046550 - в pve список врагов не показывается
	-- SC-112497 - в геймплее ONE_AGAINST_ALL для рядовых игроков не показывается список вражеских игроков, где нахоится игрок-босс

	if self.enemiesList and gameplay ~= ai.Gameplay.PVE_MISSION and not( gameplay == ai.Gameplay.ONE_AGAINST_ALL and localPlayerTeam ~= 1--[[елси team=1, значит босс]] ) then
		self:AddChild( self.enemiesList )
		self.enemiesList:AddRecords( data_enemies )
		self:RecalcEnemiesLayout()
	end

end


-- может быть перегружена; например, во время экрана загрузки геймплей берется из сивара
function UI.PlayersWnd:GetGameplay()

	return _G.GetCurrentGameMode()

end


--
function UI.PlayersWnd:GetPlayerShipsSummaryLevel( ships, playerId )

	local summaryLevel = 0

	for idx, shipInfo in pairs( ships ) do

		if self:NeedShowShip( playerId, shipInfo ) then

    		if not UI:IsStrEmpty( shipInfo.baseDef ) then

    			local def = UI:GetDef( shipInfo.baseDef )
    			if def and def.ship_tier then
    				summaryLevel = math.max( summaryLevel, def.ship_tier )
    			end

    		end

		end

	end

	return summaryLevel

end


--
function UI.PlayersWnd:OnPlayerStatusChanged( playerIdx )

	local playerInfo = _G.GetPlayerInfo( playerIdx )

	local gameplay = playerInfo.team == 0 and self:GetGameplay() or ai.Gameplay.NONE -- gameplay нужен только для обсервера
	local bFriend = self:IsTeamFriend( playerInfo.team, _G.CL_GetPlayerTeam( _G.Game_LocalClientNum() ), gameplay )

	if bFriend and not self.bShowFriends or not bFriend and not self.bShowEnemies then
		return
	end
	
	local listWnd = bFriend and self.friendsList or self.enemiesList
	local recordIdx	= self:GetRecordForPlayer( playerIdx, listWnd )

	local needSlot	= self:NeedPlayerSlot( playerInfo )
	local isSlot	= recordIdx ~= -1

	if ( needSlot and not isSlot ) or ( not needSlot and isSlot ) then
		self:UpdatePlayerLists()

	elseif isSlot then

		local data = listWnd:GetRecordData( recordIdx )
		data.playerInfo.status = playerInfo.status

    	local slotWnd = listWnd:GetButtonForRecord( recordIdx )
    	if slotWnd then
    		slotWnd:OnPlayerStatusChanged()	
    	end

	end

end 


--
function UI.PlayersWnd:OnGameplayRulesInitialized()

	local lists = { self.friendsList, self.enemiesList }

	for listIdx, listWnd in pairs( lists ) do
		for recordIdx = 1, listWnd:GetNumRecords() do

			local slotWnd = listWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnGameplayRulesInitialized()
			end

		end
	end

end     


--
function UI.PlayersWnd:GetRecordForPlayer( playerIdx, listWnd )

	for recordIdx = 1, listWnd:GetNumRecords() do

		local data = listWnd:GetRecordData( recordIdx )
		if data.playerInfo.playerId == playerIdx then
			return recordIdx
		end

	end

	return -1

end


--
function UI.PlayersWnd:IsTeamFriend( playerTeam, localPlayerTeam, gameplay )

	local bFriend = false

	-- команда 0 может быть у обсервера; в этом случае синим цветом рисуются игроки команды 1 - см.#0042193, комм.(0156022)
	if localPlayerTeam == 0 then
		if gameplay == ai.Gameplay.THREE_TEAMS_DM then
			bFriend = playerTeam == ai.ThreeTeamsDMTeam1
		else
			bFriend = playerTeam == 1
		end
	else
		bFriend = playerTeam == localPlayerTeam
	end
	
	return bFriend

end


--
function UI.PlayersWnd:NeedPlayerSlot( playerInfo )

	if playerInfo.status == network.PlayerStatus.PS_NONE then
		return false
	end
	
	local playerTeam = _G.CL_GetPlayerTeam( playerInfo.playerId )	

	local bObserver = false

	if playerInfo.status == network.PlayerStatus.PS_OBSERVER then
		bObserver = true
	else
		-- во время загрузки статус обвервера может быть PS_CONNECTED или PS_MAP_LOAD, поэтому PS_OBSERVER - ненадежный признак;
		-- с другой стороны, утверждается, что у обсервера должна быть team=0 - см.#0042193, комм.(0155910)
    	if playerTeam == 0 then
			bObserver = true
    	end
	end

	if bObserver then
		return false
	end
	
	
	-- SC-112497 - в геймплее ONE_AGAINST_ALL для рядовых игроков не показывается список вражеских игроков, где нахоится игрок-босс
	if self:GetGameplay() == ai.Gameplay.ONE_AGAINST_ALL then
		
		local isBoss = playerTeam == 1
		if isBoss and playerInfo.playerId ~= _G.Game_LocalClientNum() then
			return false
		end
	
	end

	return true

end


function UI.PlayersWnd:OnShipFactoryShipsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdatePlayerLists()

end


--
function UI.PlayersWnd:OnPlayerTeamChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdatePlayerLists()

end


--
function UI.PlayersWnd:F_OnEventRemovePlayer( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:UpdatePlayerLists()

end


--
function UI.PlayersWnd:F_OnEventGameplayRulesInitialized( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:OnGameplayRulesInitialized()

end


--
function UI.PlayersWnd:F_OnEventPlayerStatusChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:OnPlayerStatusChanged( iParam0 )

end


--
function UI.PlayersWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


--
function UI.PlayersWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w.VIEW_MODE_BTN then

		local viewMode = w:GetViewMode()
		if viewMode ~= self.viewMode then

			self:SetViewMode( viewMode )
			UI:PlayGlobalSound( self.sounds.viewModeChanged )

		end

		return  true

	elseif UI:IsWndKindOf( w, "PlayerSlot_NameWnd" ) then

		if _G.Game_IsObserverMode() then

			local data = w:GetData()
			_G.CL_SetSpectatorTarget( data.playerInfo.playerId )

		end

	end


	return false

end


--
function UI.PlayersWnd:RecalcEnemiesLayout()

	if not self.enemiesList or not self.enemiesList:IsChildOf( self ) or self.mode == self.modes.HUD_2_ENEMIES then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local enemiesLocator = ""

	if self.viewMode == self.viewModes.FULL_SCORE then
		enemiesLocator = self.numShipSlots == self.MAX_SHIP_SLOTS and self.effectInfo.main.enemiesListLocator_FULL_SCORE_4 or self.effectInfo.main.enemiesListLocator_FULL_SCORE_3

	elseif self.viewMode == self.viewModes.FULL_KILLS then
		enemiesLocator = self.numShipSlots == self.MAX_SHIP_SLOTS and self.effectInfo.main.enemiesListLocator_FULL_KILLS_4 or self.effectInfo.main.enemiesListLocator_FULL_KILLS_3

	elseif self.viewMode == self.viewModes.MEDIUM then
		enemiesLocator = self.numShipSlots == self.MAX_SHIP_SLOTS and self.effectInfo.main.enemiesListLocator_MEDIUM_4 or self.effectInfo.main.enemiesListLocator_MEDIUM_3

	elseif self.viewMode == self.viewModes.BRIEF then
		enemiesLocator = self.effectInfo.main.enemiesListLocator_BRIEF

	elseif self.viewMode == self.viewModes.HIDDEN then
		-- элемент не виден
	else
		sys.log( "UI.PlayersWnd:RecalcEnemiesLayout()[ERROR]: unhandled viewMode %s", tostring( self.viewMode ) )
	end

	if enemiesLocator ~= "" then
		mainEffect:UnlinkWnd( self.enemiesList:GetUiHandle(), "" )
		mainEffect:LinkWnd( self.enemiesList:GetUiHandle(), enemiesLocator, UI.EffectAnimParams.POS )	
	end

end


--
function UI.PlayersWnd:UpdateSentinelLeaders()

	local gameplay = _G.GetCurrentGameMode()

	if gameplay ~= ai.Gameplay.SENTINEL then
		return
	end

	local friendTeam	= _G.CL_GetPlayerTeam( _G.Game_LocalClientNum() )
	if friendTeam == 0 then
		friendTeam = 1
	end

	local enemyTeam		= friendTeam == 1 and 2 or 1

	local leaderId_friend, bLeaderDead_friend	= _G.CL_SentinelGetTeamLeader( friendTeam )
	local leaderId_enemy, bLeaderDead_enemy		= _G.CL_SentinelGetTeamLeader( enemyTeam )

	if leaderId_friend ~= self.sentinelLeaderId_friend then
	
		if self.friendsList then
			self:UpdateListOnSentinelLeaderChanged( self.friendsList, self.sentinelLeaderId_friend, leaderId_friend )
		end
		
		self.sentinelLeaderId_friend = leaderId_friend
		
	end

	if leaderId_enemy ~= self.sentinelLeaderId_enemy then
	
		if self.enemiesList then
			self:UpdateListOnSentinelLeaderChanged( self.enemiesList, self.sentinelLeaderId_enemy, leaderId_enemy )
		end
		
		self.sentinelLeaderId_enemy = leaderId_enemy
		
	end

end


--
function UI.PlayersWnd:UpdateBomber()

	local gameplay = _G.GetCurrentGameMode()

	if gameplay ~= ai.Gameplay.BOMB_THE_BASE and gameplay ~= ai.Gameplay.CLOSE_DISTANCE and gameplay ~= ai.Gameplay.CLANSHIP then
		return
	end

	local bomberMask = 0

	if gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then
		bomberMask = _G.CL_BombTheBaseGetCarrier() 

	elseif gameplay == ai.Gameplay.CLANSHIP then
		bomberMask = _G.CL_ClanShipGetBombCarriers() 
	end

	if bomberMask ~= self.bomberMask then
	
		self.bomberMask = bomberMask
		
		if self.friendsList then
			self:UpdateListOnBomberChanged( self.friendsList )
		end
		
		if self.enemiesList then
			self:UpdateListOnBomberChanged( self.enemiesList )
		end
		
	end

end


--
function UI.PlayersWnd:UpdateListOnSentinelLeaderChanged( listWnd, oldLeaderId, newLeaderId )

	local oldRecordIdx = self:FindRecordByPlayerId( listWnd, oldLeaderId )
	local newRecordIdx = self:FindRecordByPlayerId( listWnd, newLeaderId )

	if oldRecordIdx ~= -1 then

		local data = listWnd:GetRecordData( oldRecordIdx )
		data.bLeader = false		

		local slotWnd = listWnd:GetButtonForRecord( oldRecordIdx )
		if slotWnd then
			slotWnd:OnLeadershipChanged()
		end

	end

	if newRecordIdx ~= -1 then

		local data = listWnd:GetRecordData( newRecordIdx )
		data.bLeader = true

		local slotWnd = listWnd:GetButtonForRecord( newRecordIdx )
		if slotWnd then
			slotWnd:OnLeadershipChanged()
		end

	end

end


--
function UI.PlayersWnd:UpdateListOnBomberChanged( listWnd )

	for recordIdx = 1, listWnd:GetNumRecords() do

		local data = listWnd:GetRecordData( recordIdx )

		local bOldBomber = data.bBomber
		data.bBomber = UI:BitTst( self.bomberMask, data.playerInfo.playerId )

		if bOldBomber ~= data.bBomber then
			local slotWnd = listWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnBomberChanged()
			end
		end

	end

end


--
function UI.PlayersWnd:FindRecordByPlayerId( listWnd, playerId )

	for recordIdx = 1, listWnd:GetNumRecords() do

		local data = listWnd:GetRecordData( recordIdx )
		if data.playerInfo and data.playerInfo.playerId == playerId then
			return recordIdx
		end

	end

	return -1

end


--
function UI.PlayersWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateSentinelLeaders()
	self:UpdateBomber()

end


-- ---------------------------------------------------------
-- UI.PlayersListWnd
-- ---------------------------------------------------------

UI.PlayersListWnd = {}
local pl = UI.PlayersListWnd

-- --------------------------------
-- window definition
-- --------------------------------

UI.PlayersListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "PlayersListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
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
				defName 			= "playersList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "hader",
						layer		= "UI.PlayersListWnd.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
    		}}
		},

		-- HEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playersList_header",

				links =
				{
				 	-- не линкуется по цвету, цвет будет подставлен в зависимости от релейшеншипа
					{
						objName		= "vol_1",
						layer		= "UI.PlayersListWnd.layers.COLUMN_HEADER_NAMES",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

				 	-- не линкуется по цвету, цвет будет подставлен в зависимости от релейшеншипа
					{
						objName		= "vol_2",
						layer		= "UI.PlayersListWnd.layers.COLUMN_HEADER_SHIPS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

				 	-- не линкуется по цвету, цвет будет подставлен в зависимости от релейшеншипа
					{
						objName		= "vol_4",
						layer		= "UI.PlayersListWnd.layers.COLUMN_HEADER_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

				 	-- не линкуется по цвету, цвет будет подставлен в зависимости от релейшеншипа
					{
						objName		= "vol_5",
						layer		= "UI.PlayersListWnd.layers.COLUMN_HEADER_ASSISTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

				 	-- не линкуется по цвету, цвет будет подставлен в зависимости от релейшеншипа
					{
						objName		= "vol_6",
						layer		= "UI.PlayersListWnd.layers.COLUMN_HEADER_SCORE_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- COLUMN_HEADER_NAMES
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COLUMN_HEADER_SHIPS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COLUMN_HEADER_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COLUMN_HEADER_ASSISTS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^players_assists",
		},

		-- COLUMN_HEADER_SCORE_2
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^players_score",
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.PlayersListWnd:Setup( bFriend )

	self.bFriend = bFriend

	self:UpdateHeaderColor()
	self:UpdateHeaderNameColumnText()

end


--
function UI.PlayersListWnd:AddRecords( datas )

	for idx = 1, #datas do
		self:AddRecord( datas[ idx ] )
	end

	self:UpdateHeaderForViewMode()

end


--
function UI.PlayersListWnd:GetRelationshipColor()

	return self.bFriend and self.color_friend or self.color_enemy

end


--
function UI.PlayersListWnd:Reset()

	self:Clear()
	self:ResetHeader()

end


--
function UI.PlayersListWnd:IsFriend()

	return self.bFriend

end


-- --------------------------------
-- const
-- --------------------------------

pl.listStyle =	UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION
pl.btnPrototypeName = "PlayerSlotWnd"

pl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
		colorLocator_enemy	= "color_2",
		colorLocator_friend	= "color_1",
	},

	header =
	{
		anim_FULL_SCORE_4	= "long_4",
		anim_FULL_SCORE_3	= "long_3",
		anim_FULL_KILLS_4	= "s_long_4",
		anim_FULL_KILLS_3	= "s_long_3",
		anim_MEDIUM_4		= "mid_4",
		anim_MEDIUM_3		= "mid_3",
		anim_BRIEF			= "short_4_name",
	}
}

pl.MAX_SLOTS = 24

pl.layers =
{
	MAIN_EFFECT				= 0,
    HEADER_EFFECT			= 1,
    COLUMN_HEADER_NAMES		= 2,
    COLUMN_HEADER_SHIPS		= 3,
    COLUMN_HEADER_SCORE		= 4,
    COLUMN_HEADER_ASSISTS	= 5,
    COLUMN_HEADER_SCORE_2	= 6,
}

-- --------------------------------
-- vars
-- --------------------------------

pl.bFriend		= false
pl.color_enemy	= UI.WHITE_COLOR
pl.color_friend	= UI.WHITE_COLOR
pl.parent		= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.PlayersListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.color_enemy = mainEffect:GetObjColor( self.effectInfo.main.colorLocator_enemy )
		self.color_friend = mainEffect:GetObjColor( self.effectInfo.main.colorLocator_friend )
	end

end


--
function UI.PlayersListWnd:ResetHeader()

	self:SetLayerVisible( false, self.layers.HEADER_EFFECT )
	self:SetLayerVisible( false, self.layers.COLUMN_HEADER_NAMES )
	self:SetLayerVisible( false, self.layers.COLUMN_HEADER_SHIPS )
	self:SetLayerVisible( false, self.layers.COLUMN_HEADER_SCORE )
	self:SetLayerVisible( false, self.layers.COLUMN_HEADER_ASSISTS )
	self:SetLayerVisible( false, self.layers.COLUMN_HEADER_SCORE_2 )

end


--
function UI.PlayersListWnd:UpdateHeaderColor()

	local color = self:GetRelationshipColor()

	self:SetColor( color, self.layers.COLUMN_HEADER_NAMES )
	self:SetColor( color, self.layers.COLUMN_HEADER_SHIPS )
	self:SetColor( color, self.layers.COLUMN_HEADER_SCORE )
	self:SetColor( color, self.layers.COLUMN_HEADER_ASSISTS )
	self:SetColor( color, self.layers.COLUMN_HEADER_SCORE_2 )

end


--
function UI.PlayersListWnd:UpdateHeaderNameColumnText()

	local strId = self.bFriend and "players_names_friends" or "players_names_enemies"
	local text = UI:GetStringByName( strId )

	self:SetText( text, self.layers.COLUMN_HEADER_NAMES )

end


--
function UI.PlayersListWnd:UpdateHeaderForViewMode()

	local viewMode = self.parent:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		self:ResetHeader()
		return
	end

	self:SetLayerVisible( true, self.layers.HEADER_EFFECT )
	self:SetLayerVisible( true, self.layers.COLUMN_HEADER_NAMES )
	self:SetLayerVisible( viewMode == UI.PlayersWnd.viewModes.MEDIUM or viewMode == UI.PlayersWnd.viewModes.FULL_SCORE or viewMode == UI.PlayersWnd.viewModes.FULL_KILLS or viewMode == UI.PlayersWnd.viewModes.BRIEF, self.layers.COLUMN_HEADER_SHIPS )
	self:SetLayerVisible( viewMode == UI.PlayersWnd.viewModes.FULL_SCORE or viewMode == UI.PlayersWnd.viewModes.FULL_KILLS, self.layers.COLUMN_HEADER_SCORE )
	self:SetLayerVisible( viewMode == UI.PlayersWnd.viewModes.FULL_KILLS, self.layers.COLUMN_HEADER_ASSISTS )
	self:SetLayerVisible( viewMode == UI.PlayersWnd.viewModes.FULL_KILLS, self.layers.COLUMN_HEADER_SCORE_2 )

	local headerEffect = UI:GetEffectFromLayer( self, self.layers.HEADER_EFFECT )
	if headerEffect then

		local maxShipSlots = self.parent:GetMaxNumShipSlotByPlayer()
		local anim = ""

		if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.header.anim_FULL_SCORE_4 or self.effectInfo.header.anim_FULL_SCORE_3

		elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.header.anim_FULL_KILLS_4 or self.effectInfo.header.anim_FULL_KILLS_3

		elseif viewMode == UI.PlayersWnd.viewModes.MEDIUM then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.header.anim_MEDIUM_4 or self.effectInfo.header.anim_MEDIUM_3

		elseif viewMode == UI.PlayersWnd.viewModes.BRIEF then
			anim = self.effectInfo.header.anim_BRIEF

		else
			sys.log( "UI.PlayersListWnd:UpdateHeaderForViewMode()[ERROR]: unhandled mode %s", tostring( viewMode ) )
		end

		headerEffect:StartAnimation( anim )

	end

	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
		self:SetText( UI:GetStringByName( "players_score" ), self.layers.COLUMN_HEADER_SCORE )

	elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
		self:SetText( UI:GetStringByName( "players_kills" ), self.layers.COLUMN_HEADER_SCORE )
	end

	if self:IsLayerVisible( self.layers.COLUMN_HEADER_SHIPS ) then

		local strHeaderShips = ""

		if viewMode == UI.PlayersWnd.viewModes.BRIEF then
			strHeaderShips = UI:GetStringByName( "players_ship" )
		else
			strHeaderShips = UI:GetStringByName( "players_ships" )
		end

		self:SetText( strHeaderShips, self.layers.COLUMN_HEADER_SHIPS )

	end

end    


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.PlayersListWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()
	self.parent = self:GetParent()

end


--
function UI.PlayersListWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- -----------------------------------------------------------------------------
-- UI.PlayerSlotWnd
-- -----------------------------------------------------------------------------

UI.PlayerSlotWnd = {}
local ps = UI.PlayerSlotWnd

-- ----------------------------------------
-- window definition
-- ----------------------------------------

ps.layers =
{
    MAIN_EFFECT				= 0,
	LOCAL_PLAYER_BG_EFFECT  = 1, 
	PLAYER_SCORE			= 2, 
	ASSISTS					= 3, 
	PLAYER_SCORE_2			= 4, 
	UNLIM_PVE_BUFFS			= 5,
	INACTIVE_EFFECT			= 6,
	INACTIVE_TEXT			= 7,
}  


UI.PlayerSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "PlayerSlotWnd",
		isPrototype		= true,
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = ps.layers.INACTIVE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "playerSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "score",
						layer		= "UI.PlayerSlotWnd.layers.PLAYER_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_1",
						layer		= "UI.PlayerSlotWnd.layers.ASSISTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_2",
						layer		= "UI.PlayerSlotWnd.layers.PLAYER_SCORE_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "current_player",
						layer		= "UI.PlayerSlotWnd.layers.LOCAL_PLAYER_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.PlayerSlotWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "status_value",
						layer		= "UI.PlayerSlotWnd.layers.INACTIVE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "status_value1",
						layer		= "UI.PlayerSlotWnd.layers.UNLIM_PVE_BUFFS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- LOCAL_PLAYER_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			

			effects =
			{{
				defName 			= "playerSlot_localPlayerBg",
			}}
		},

		-- PLAYER_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ASSISTS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PLAYER_SCORE_2
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- UNLIM_PVE_BUFFS
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerSlot_inactive",
			}}
		},

		-- INACTIVE_TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		
	}
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.PlayerSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.nameWnd:Reset()
	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.PLAYER_SCORE )
	self:SetLayerVisible( false, self.layers.ASSISTS )
	self:SetLayerVisible( false, self.layers.PLAYER_SCORE_2 )
	self:SetLayerVisible( false, self.layers.LOCAL_PLAYER_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.UNLIM_PVE_BUFFS )
	self:ResetShips()
	self:HideInactiveStatusControls()		

	self.prevScore = -1
	self.prevAssists = -1
	self.prevScore2 = -1
	self.prevHangarIdx = -1
	self.inactiveStatus = self.inactiveStatuses.NONE
	self.playerStatus = -1
	self.clanName = nil
	self.kills = nil
	

end


--
function UI.PlayerSlotWnd:OnPlayerStatusChanged()

	if not self:IsOnScreen() then
		return
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	local data			= self:GetRecordData()
	local maxShipSlots	= playerWnd:GetMaxNumShipSlotByPlayer()

	self:UpdateInactiveStatus( data, viewMode, maxShipSlots )
	self.nameWnd:OnPlayerStatusChanged()

end


--
function UI.PlayerSlotWnd:OnGameplayRulesInitialized()

	if not self:IsOnScreen() then
		return
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	local data = self:GetRecordData()
	self:UpdateShips( data, viewMode )

end


--
function UI.PlayerSlotWnd:OnLeadershipChanged()

	if not self:IsOnScreen() then
		return
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	self.nameWnd:OnLeadershipChanged()

end


--
function UI.PlayerSlotWnd:OnBomberChanged()

	if not self:IsOnScreen() then
		return
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	self.nameWnd:OnBomberChanged()

end


--
function UI.PlayerSlotWnd:OnClanNameChanged()

	if not self:IsOnScreen() then
		return
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	self.nameWnd:OnClanNameChanged()

end


--
function UI.PlayerSlotWnd:OnAccountRankChanged()

	if not self:IsOnScreen() then
		return
	end
	
	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end
	
	for shipSlotIdx, shipWnd in pairs( self.shipWnds ) do
		if shipWnd:IsChildOf( self ) then
			shipWnd:OnAccountRankChanged()
		end
	end

end


--
function UI.PlayerSlotWnd:OnPlayerSettingsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end
	
	self.nameWnd:OnPlayerSettingsChanged()
	
end


--
function UI.PlayerSlotWnd:OnUnlimPveMissionLevelChanged()

	if not self:IsOnScreen() then
		return
	end
	
	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end
	
	self.nameWnd:OnUnlimPveMissionLevelChanged()

end


-- ----------------------------------------
-- const
-- ----------------------------------------

ps.effectInfo =
{
	main =
	{
		anim_FULL_SCORE_4	= "long_4",
		anim_FULL_SCORE_3	= "long_3",
		anim_FULL_KILLS_4	= "s_long_4",
		anim_FULL_KILLS_3	= "s_long_3",
		anim_MEDIUM_4		= "mid_4",
		anim_MEDIUM_3		= "mid_3",
		anim_BRIEF			= "short_4_name",

		statusIcoLocator	= "status_ico",
		shipLocatorPrefix	= "slot_",
		nameLocator			= "player_name",
	},

	inactive =
	{
		anim_FULL_SCORE_4	= "long_4",
		anim_FULL_SCORE_3	= "long_3",
		anim_FULL_KILLS_4	= "s_long_4",
		anim_FULL_KILLS_3	= "s_long_3",
		anim_MEDIUM_4		= "mid_4",        
		anim_MEDIUM_3		= "mid_3",        
		anim_BRIEF			= "short_4_name", 
	},

	localPlayerBg =
	{
		anim_FULL_SCORE_4	= "long_4",
		anim_FULL_SCORE_3	= "long_3",
		anim_FULL_KILLS_4	= "s_long_4",
		anim_FULL_KILLS_3	= "s_long_3",
		anim_MEDIUM_4		= "mid_4",        
		anim_MEDIUM_3		= "mid_3",        
		anim_BRIEF			= "short_4_name", 
	},
}

ps.inactiveStatuses =
{
	NONE				= 1,
	BY_PLAYER_STATUS	= 2,
	NO_SHIPS			= 3,
}

-- ----------------------------------------
-- vars
-- ----------------------------------------  

ps.prevScore			= -1
ps.prevAssists 			= -1
ps.prevScore2			= -1
ps.parent				= nil
ps.prevHangarIdx		= -1
ps.inactiveStatusIco	= nil
ps.inactiveStatus		= ps.inactiveStatuses.NONE
ps.playerStatus			= -1
ps.shipWnds				= {}
ps.nameWnd				= nil
ps.clanName				= nil
ps.kills				= nil

-- ----------------------------------------
-- work funcrions
-- ----------------------------------------  

--
function UI.PlayerSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.shipWnds = {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:Reset()

end


--
function UI.PlayerSlotWnd:CreateControls()

	self.inactiveStatusIco = UI:CreateChildWnd( self, UI.PlayerSlot_PlayerStatusIco, "" )

	for shipSlotIdx = 1, UI.PlayersWnd.MAX_SHIP_SLOTS do

		local shipWnd = UI:CreateChildWnd( self, UI.PlayerSlot_ShipWnd, tostring( shipSlotIdx ) )
		table.insert( self.shipWnds, shipWnd )

	end

	self.nameWnd = UI:CreateChildWnd( self, UI.PlayerSlot_NameWnd, "" )
    self:AddControl( self.nameWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.nameLocator )

end


--
function UI.PlayerSlotWnd:FullUpdate()

	local data = self:GetRecordData()
	self:UpdateForData( data, false )

end


--
function UI.PlayerSlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	self:TryShowContextMenu()
	
	return true
	
end


--
function UI.PlayerSlotWnd:TryShowContextMenu()

	local data = self:GetRecordData()

	local uid = data.playerInfo.isBot and data.playerInfo.botUid or data.playerInfo.uid
	if uid == UI.INVALID_U64_ID then
		return
	end

	local localPlayerUid = UI:GetLocalPlayerUid()
	local localPlayerNickname = UI:GetPlayerNicknameByUid( localPlayerUid )
	
	UI.ContextMenu:Clear()
	UI.ContextMenu:SetName( data.playerInfo.nickName )
	
	local menuTypes = UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.COMPLAINT_CHAT
	if UI.GameplayCustomLobbyWnd:IsOnScreen() then
		menuTypes = menuTypes + UI.ContextMenuType.LOBBY
	end
	
	UI:FillContextMenuForPlayer( menuTypes, uid, { fromName = localPlayerNickname, toName = data.playerInfo.nickName, tabId = UI.Chat:GetCurrentTab() }, data.playerInfo.isBot )
	UI.ContextMenu:Show( mouseX, mouseY )
	
end


--
function UI.PlayerSlotWnd:UpdateForData( data, bAnimated )

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()
	local maxShipSlots	= playerWnd:GetMaxNumShipSlotByPlayer()

	self:Reset()

	if viewMode == UI.PlayersWnd.viewModes.HIDDEN then
		return
	end

	self:UpdateMainAnimation( data, viewMode, maxShipSlots )
	self:UpdateInactiveStatus( data, viewMode, maxShipSlots )
	self:UpdateShips( data, viewMode )
	self:UpdateLocalPlayerBg( data, viewMode, maxShipSlots )

	self.nameWnd:Setup( data )

	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
		self:UpdateScore( data, self.layers.PLAYER_SCORE ) 

	elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
		self:UpdateKills( data ) 
		self:UpdateAssists( data )
		self:UpdateScore( data, self.layers.PLAYER_SCORE_2 )
	end
	
	if viewMode == UI.PlayersWnd.viewModes.BRIEF then
		self:UpdateUnlimPveBuffs( data )
	end

end


--
function UI.PlayerSlotWnd:UpdateMainAnimation( data, viewMode, maxShipSlots )

	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
		anim = maxShipSlots == 4 and self.effectInfo.main.anim_FULL_SCORE_4 or self.effectInfo.main.anim_FULL_SCORE_3

	elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
		anim = maxShipSlots == 4 and self.effectInfo.main.anim_FULL_KILLS_4 or self.effectInfo.main.anim_FULL_KILLS_3

	elseif viewMode == UI.PlayersWnd.viewModes.MEDIUM then
		anim = maxShipSlots == 4 and self.effectInfo.main.anim_MEDIUM_4 or self.effectInfo.main.anim_MEDIUM_3

	elseif viewMode == UI.PlayersWnd.viewModes.BRIEF then
		anim = self.effectInfo.main.anim_BRIEF

	else
		sys.log( "UI.PlayerSlotWnd:UpdateMainAnimation()[ERROR]: unhandled mode %s", tostring( viewMode ) )
	end

	mainEffect:StartAnimation( anim )

end


--
function UI.PlayerSlotWnd:HideInactiveStatusControls()

	self:SetLayerVisible( false, self.layers.INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.INACTIVE_TEXT )

	self.inactiveStatusIco:Reset()
	self:RemoveControl( self.inactiveStatusIco, self.layers.MAIN_EFFECT )

end


--
function UI.PlayerSlotWnd:UpdateInactiveStatus( data, viewMode, maxShipSlots )

	local prevInactiveStatus = self.inactiveStatus
	local prevPlayerStatus = self.playerStatus

	self.inactiveStatus, self.playerStatus = self:DetectInactiveStatus( data )

	local bNeedUpdate = false
	if self.inactiveStatus ~= prevInactiveStatus or ( self.inactiveStatus == self.inactiveStatuses.BY_PLAYER_STATUS and self.playerStatus ~= prevPlayerStatus ) then
		bNeedUpdate = true
	end

	if not bNeedUpdate then
		return
	end

	self:HideInactiveStatusControls()

	if self.inactiveStatus == self.inactiveStatuses.NONE then
		return
	end

	-- bg

	self:SetLayerVisible( true, self.layers.INACTIVE_EFFECT )

	local inactiveEffect = UI:GetEffectFromLayer( self, self.layers.INACTIVE_EFFECT )
	if inactiveEffect then

    	local anim = ""

    	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
    		anim = maxShipSlots == 4 and self.effectInfo.inactive.anim_FULL_SCORE_4 or self.effectInfo.inactive.anim_FULL_SCORE_3

    	elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
    		anim = maxShipSlots == 4 and self.effectInfo.inactive.anim_FULL_KILLS_4 or self.effectInfo.inactive.anim_FULL_KILLS_3

    	elseif viewMode == UI.PlayersWnd.viewModes.MEDIUM then
    		anim = maxShipSlots == 4 and self.effectInfo.inactive.anim_MEDIUM_4 or self.effectInfo.inactive.anim_MEDIUM_3

    	elseif viewMode == UI.PlayersWnd.viewModes.BRIEF then
    		anim = self.effectInfo.inactive.anim_BRIEF

    	else
    		sys.log( "UI.PlayerSlotWnd:UpdateInactiveStatus()[ERROR]: unhandled viewMode %s", tostring( viewMode ) )
    	end

    	inactiveEffect:StartAnimation( anim )

	end

	if self.inactiveStatus == self.inactiveStatuses.BY_PLAYER_STATUS then

    	-- ico

    	self:AddControl( self.inactiveStatusIco, self.layers.MAIN_EFFECT, self.effectInfo.main.statusIcoLocator )
    	self.inactiveStatusIco:Setup( data.playerInfo.status, viewMode == UI.PlayersWnd.viewModes.BRIEF )

    	-- text

    	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE or viewMode == UI.PlayersWnd.viewModes.FULL_KILLS or viewMode == UI.PlayersWnd.viewModes.MEDIUM then

    		self:SetLayerVisible( true, self.layers.INACTIVE_TEXT )
    		local text = UI.PlayersWnd:PlayerStatus2Str( data.playerInfo.status )
    		self:SetText( text, self.layers.INACTIVE_TEXT )

    	end

	end

end


--
function UI.PlayerSlotWnd:DetectInactiveStatus( data )

	if data.playerInfo.status ~= _G.network.PlayerStatus.PS_ACTIVE then
		return self.inactiveStatuses.BY_PLAYER_STATUS, data.playerInfo.status

	elseif not self:HasLiveShips( data ) then
		return self.inactiveStatuses.NO_SHIPS, -1		

	else
		return self.inactiveStatuses.NONE, -1
	end

end


--
function UI.PlayerSlotWnd:HasLiveShips( data )

	for hangarIdx = 0, UI.PlayersWnd.MAX_SHIP_SLOTS - 1 do

		local state = data.lobby and ai.HangarStatus.AVAILABLE or _G.CL_GetHangarStatus( data.playerInfo.playerId, hangarIdx )

		if state ~= ai.HangarStatus.KILLED and state ~= ai.HangarStatus.NONE and state ~= ai.HangarStatus.DISABLED and state ~= ai.HangarStatus.SUSPENDED then
			return true
		end

	end

	return false

end


--
function UI.PlayerSlotWnd:ResetShips()

	for slotIdx = 1, UI.PlayersWnd.MAX_SHIP_SLOTS do
		self:ResetShipSlot( slotIdx )
	end

end


--
function UI.PlayerSlotWnd:ResetShipSlot( slotIdx )

	local shipWnd = self.shipWnds[ slotIdx ]
	if shipWnd then

		shipWnd:Reset()
		shipWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( shipWnd:GetUiHandle(), "" )
		end
		
	end	

end


--
function UI.PlayerSlotWnd:UpdateShips( data, viewMode )

	self:ResetShips()

	if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE or viewMode == UI.PlayersWnd.viewModes.FULL_KILLS or viewMode == UI.PlayersWnd.viewModes.MEDIUM then

    	for idx, shipInfo in pairs( data.ships ) do

			if UI.PlayersWnd:NeedShowShip( data.playerInfo.playerId, shipInfo ) then
    			self:ShowShipSlot( shipInfo.hangarIdx + 1, shipInfo, data.playerInfo )
			end

    	end

	elseif viewMode == UI.PlayersWnd.viewModes.BRIEF then

		self:UpdateShips_BRIEF( data )

	end

end


--
function UI.PlayerSlotWnd:ShowShipSlot( slotIdx, shipInfo, playerInfo )	

	local shipWnd = self.shipWnds[ slotIdx ]
	if not shipWnd then
		sys.log( "UI.PlayerSlotWnd:ShowShipSlot()[ERROR]: cannot find ship wnd for slot %s", tostring( slotIdx ) )
		return
	end

	self:AddChild( shipWnd )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( shipWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.shipLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
	end

	shipWnd:Setup( shipInfo, playerInfo )

end


--
function UI.PlayerSlotWnd:UpdateShipState( slotIdx )

	local shipWnd = self.shipWnds[ slotIdx ]
	if not shipWnd then
		return
	end

	shipWnd:UpdateState()

end


--
function UI.PlayerSlotWnd:UpdateShips_BRIEF( data )

	local curShipInfo = nil	

    for idx, shipInfo in pairs( data.ships ) do

		if UI.PlayersWnd:NeedShowShip( data.playerInfo.playerId, shipInfo ) then

			local state = _G.CL_GetHangarStatus( data.playerInfo.playerId, shipInfo.hangarIdx )

			if state == ai.HangarStatus.ACTIVE or state == ai.HangarStatus.BUILDING then
				curShipInfo = shipInfo
				break
			end

		end

	end

	local curHangarIdx = curShipInfo and curShipInfo.hangarIdx or -1

	if curHangarIdx ~= self.prevHangarIdx then

		self.prevHangarIdx = curHangarIdx

		self:ResetShipSlot( 1 )	

		if curHangarIdx ~= -1 then
	    	self:ShowShipSlot( 1, curShipInfo, data.playerInfo )
		end
		
	end

	if curHangarIdx ~= -1 then
		self:UpdateShipState( 1 )
	end

	local playerWnd		= self.parent.parent
	local viewMode		= playerWnd:GetViewMode()
	local maxShipSlots	= playerWnd:GetMaxNumShipSlotByPlayer()

	self:UpdateInactiveStatus( data, viewMode, maxShipSlots )

end


--
function UI.PlayerSlotWnd:UpdateLocalPlayerBg( data, viewMode, maxShipSlots )

	if not data.bLocal then
		self:SetLayerVisible( false, self.layers.LOCAL_PLAYER_BG_EFFECT )
		return
	end

	self:SetLayerVisible( true, self.layers.LOCAL_PLAYER_BG_EFFECT )

	local effect = UI:GetEffectFromLayer( self, self.layers.LOCAL_PLAYER_BG_EFFECT )
	if effect then

		local anim = ""

		if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.localPlayerBg.anim_FULL_SCORE_4 or self.effectInfo.localPlayerBg.anim_FULL_SCORE_3

		elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.localPlayerBg.anim_FULL_KILLS_4 or self.effectInfo.localPlayerBg.anim_FULL_KILLS_3

		elseif viewMode == UI.PlayersWnd.viewModes.MEDIUM then
			anim = maxShipSlots == UI.PlayersWnd.MAX_SHIP_SLOTS and self.effectInfo.localPlayerBg.anim_MEDIUM_4 or self.effectInfo.localPlayerBg.anim_MEDIUM_3

		elseif viewMode == UI.PlayersWnd.viewModes.BRIEF then
			anim = self.effectInfo.localPlayerBg.anim_BRIEF

		else
			sys.log( "UI.PlayerSlotWnd:UpdateLocalPlayerBg()[ERROR]: unhandled mode %s", tostring( viewMode ) )
		end

		effect:StartAnimation( anim )

	end	

end


--
function UI.PlayerSlotWnd:UpdateScore( data, layer )

	local score = _G.CL_GetPlayerEffectivePoints( data.playerInfo.playerId )

	local prevScore = layer == self.layers.PLAYER_SCORE and self.prevScore or self.prevScore2

	if score ~= prevScore then

		self:SetLayerVisible( true, layer )

		local text = tostring( score )
		self:SetText( text, layer )

	end

	if layer == self.layers.PLAYER_SCORE then
		self.prevScore = score
	else
		self.prevScore2 = score
	end

end


--
function UI.PlayerSlotWnd:UpdateKills( data )

	local score = _G.CL_GetPlayerKills( data.playerInfo.playerId )

	if score ~= self.prevScore then

		self:SetLayerVisible( true, self.layers.PLAYER_SCORE )

		local text = tostring( score )
		self:SetText( text, self.layers.PLAYER_SCORE )

	end

	self.prevScore = score

end


--
function UI.PlayerSlotWnd:UpdateAssists( data )

	local assists = _G.CL_GetPlayerAssists( data.playerInfo.playerId )

	if assists ~= self.prevAssists then

		self:SetLayerVisible( true, self.layers.ASSISTS )

		local text = tostring( assists )
		self:SetText( text, self.layers.ASSISTS )

	end

	self.prevAssists = assists

end


--
function UI.PlayerSlotWnd:UpdateUnlimPveBuffs( data )
	
	if not _G.CL_IsUnlimPve() and not _G.CL_IsWavePve() then
		self:SetLayerVisible( false, self.layers.UNLIM_PVE_BUFFS )
		return
	end
	
	self:SetLayerVisible( true, self.layers.UNLIM_PVE_BUFFS )
	
	local level1 = _G.CL_GetUnlimPvePlayerLevel( data.playerInfo.playerId, 1 )
	local level2 = _G.CL_GetUnlimPvePlayerLevel( data.playerInfo.playerId, 2 )
	
	local str = string.format( "%d/%d", level1, level2 )
	self:SetText( str, self.layers.UNLIM_PVE_BUFFS )

end


--
function UI.PlayerSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.parent and self.parent.parent and self.parent.parent.GetViewMode then
		local viewMode = self.parent.parent:GetViewMode()
		local data = self:GetRecordData()

		if viewMode == UI.PlayersWnd.viewModes.FULL_SCORE then
			self:UpdateScore( data, self.layers.PLAYER_SCORE )

		elseif viewMode == UI.PlayersWnd.viewModes.FULL_KILLS then
			self:UpdateKills( data )
			self:UpdateAssists( data )
			self:UpdateScore( data, self.layers.PLAYER_SCORE_2 )
		end

		if viewMode == UI.PlayersWnd.viewModes.BRIEF then
			self:UpdateShips_BRIEF( data )		

		elseif viewMode ~= UI.PlayersWnd.viewModes.HIDDEN then

			local playerWnd		= self.parent.parent
			local viewMode		= playerWnd:GetViewMode()
			local maxShipSlots	= playerWnd:GetMaxNumShipSlotByPlayer()

	    	for idx, shipInfo in pairs( data.ships ) do
	    		self:UpdateShipState( shipInfo.hangarIdx + 1 )
	    	end

			self:UpdateInactiveStatus( data, viewMode, maxShipSlots )

		end
	end

end


--
function UI.PlayerSlotWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.PlayerSlotWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.PlayerSlotWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()
	self.parent = self:GetParent()

end


--
function UI.PlayerSlotWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- ------------------------------------------------------------------------
-- UI.PlayerSlot_PlayerStatusIco
-- ------------------------------------------------------------------------

UI.PlayerSlot_PlayerStatusIco = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.PlayerSlot_PlayerStatusIco.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PlayerSlot_PlayerStatusIco",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "playerSlot_playerStatusIco",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	},
}

-- -----------------------------------------
-- interface fnctions
-- -----------------------------------------

--
function UI.PlayerSlot_PlayerStatusIco:Setup( status, bNeedTooltip )

	self:Reset()

	self.status			= status
	self.bNeedTooltip	= bNeedTooltip

	self:FullUpdate()

end


--
function UI.PlayerSlot_PlayerStatusIco:GetTooltipData()

	return self.tooltipData

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.PlayerSlot_PlayerStatusIco.layers =
{
	MAIN_EFFECT	 = 0
}

UI.PlayerSlot_PlayerStatusIco.effectInfo =
{
	ico =
	{
    	status2Anim =
    	{
			PS_CONNECTED	= "1",
    		PS_MAP_LOAD		= "1",
    		PS_LEFT			= "3",
    		PS_RESERVED		= "1",
    	}
	}
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.PlayerSlot_PlayerStatusIco.status 		= -1
UI.PlayerSlot_PlayerStatusIco.bNeedTooltip	= false
UI.PlayerSlot_PlayerStatusIco.tooltipData	= nil

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.PlayerSlot_PlayerStatusIco:Reset()

	self.status = -1
	self.bNeedTooltip = false
	self.tooltipData = nil	
	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )

end


--
function UI.PlayerSlot_PlayerStatusIco:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltipData()

end


--
function UI.PlayerSlot_PlayerStatusIco:UpdateIco()

	local statusName = UI:Val2Key( _G.network.PlayerStatus, self.status )
	local anim = self.effectInfo.ico.status2Anim[ statusName ]

	if anim then

		self:SetLayerVisible( true, self.layers.MAIN_EFFECT )	

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:StartAnimation( anim )
		end

	else
		sys.log( "UI.PlayerSlot_PlayerStatusIco:UpdateIco()[ERROR]: cannot fid anim for status %s", tostring( self.status ) )
	end

end


--
function UI.PlayerSlot_PlayerStatusIco:UpdateTooltipData()

	if not self.bNeedTooltip then
		return
	end

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI.PlayersWnd:PlayerStatus2Str( self.status ),
	}		

end


-- -----------------------------------------------------------------
-- UI.PlayerSlot_ShipWnd
-- -----------------------------------------------------------------

UI.PlayerSlot_ShipWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.PlayerSlot_ShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PlayerSlot_ShipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "playerSlot_ship",
				defaultAnimation	= "live",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ship_type",
						layer		= "UI.PlayerSlot_ShipWnd.layers.ROLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "ship_status",
						layer		= "UI.PlayerSlot_ShipWnd.layers.BUILDING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ROLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipType_small",
				defaultAnimation	= "idle",
			}}
		},

		-- BUILDING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerSlot_ship_building",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerSlot_ShipWnd:Reset()

	self.playerInfo		= nil
	self.shipInfo		= nil
	self.tooltipData	= nil

	self:SetLayerVisible( false, self.layers.ROLE_EFFECT )
	self:SetLayerVisible( false, self.layers.BUILDING_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.shipIcoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.PlayerSlot_ShipWnd:Setup( shipInfo, playerInfo )

	self:Reset()

	self.playerInfo	= playerInfo
	self.shipInfo	= shipInfo

	if not self.shipInfo or not self.playerInfo then
		sys.log( "UI.PlayerSlot_ShipWnd:Setup()[ERROR]: nil shipInfo or playerInfo" )
		return
	end

	self:UpdateIco()
	self:UpdateRole()
	self:UpdateTooltip()
	self:UpdateState()

end


--
function UI.PlayerSlot_ShipWnd:UpdateState()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if not self.shipInfo or not self.playerInfo then
		return
	end

	local state = self.shipInfo.lobby and ai.HangarStatus.AVAILABLE or _G.CL_GetHangarStatus( self.playerInfo.playerId, self.shipInfo.hangarIdx )

	local needAnimId = -1

	if state == ai.HangarStatus.ACTIVE then
		needAnimId = self.mainAnimId_ready

	elseif state == ai.HangarStatus.BUILDING then
		needAnimId = self.mainAnimId_ready

	elseif state == ai.HangarStatus.AVAILABLE then
		needAnimId = self.mainAnimId_available

	elseif state == ai.HangarStatus.KILLED then
		needAnimId = self.mainAnimId_killed

	elseif state == ai.HangarStatus.SUSPENDED then
		needAnimId = self.mainAnimId_disabled

	else
		sys.log( "UI.PlayerSlot_ShipWnd:UpdateState()[ERROR]: unhandled state %s", tostring( state ) )
	end

	local curAnimId = mainEffect:GetCurAnimationId()
	if needAnimId ~= -1 and curAnimId ~= needAnimId then
		mainEffect:StartAnimationById( needAnimId )
	end

	self:SetLayerVisible( state == ai.HangarStatus.BUILDING, self.layers.BUILDING_EFFECT )

end


--
function UI.PlayerSlot_ShipWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.PlayerSlot_ShipWnd:OnAccountRankChanged()

	self:UpdateTooltip()
	
end


-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerSlot_ShipWnd.layers =
{
    MAIN_EFFECT			= 0,
    ROLE_EFFECT			= 1,
    BUILDING_EFFECT		= 2,
}

UI.PlayerSlot_ShipWnd.effectInfo =
{
	main =
	{
		shipIcoSpriteName	= "ico",

		animReady			= "white",
		animKilled			= "friend_dead",
		animAvailable		= "friend_live",
		animDisabled		= "friend_dead",
	},

	role =
	{
		icoSpriteName	= "ico"
	},
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.PlayerSlot_ShipWnd.mainAnimId_ready		= -1
UI.PlayerSlot_ShipWnd.mainAnimId_killed		= -1
UI.PlayerSlot_ShipWnd.mainAnimId_available	= -1
UI.PlayerSlot_ShipWnd.mainAnimId_disabled	= -1
UI.PlayerSlot_ShipWnd.playerInfo			= nil
UI.PlayerSlot_ShipWnd.shipInfo				= nil
UI.PlayerSlot_ShipWnd.tooltipData			= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerSlot_ShipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.mainAnimId_ready		= mainEffect:GetAnimationId( self.effectInfo.main.animReady )
		self.mainAnimId_killed		= mainEffect:GetAnimationId( self.effectInfo.main.animKilled )
		self.mainAnimId_available	= mainEffect:GetAnimationId( self.effectInfo.main.animAvailable )
		self.mainAnimId_disabled	= mainEffect:GetAnimationId( self.effectInfo.main.animDisabled )
	end

	self:Reset()

end


--
function UI.PlayerSlot_ShipWnd:UpdateIco()

	if not self.shipInfo then
		sys.log( "UI.PlayerSlot_ShipWnd:UpdateIco()[ERROR]: nil shipInfo" )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end
	
	local hTex = UI:GetShipSmallIco( self.shipInfo.baseDef )
	mainEffect:SetSpriteTexture( self.effectInfo.main.shipIcoSpriteName, hTex )

end


--
function UI.PlayerSlot_ShipWnd:UpdateRole()

	if not self.shipInfo then
		sys.log( "UI.PlayerSlot_ShipWnd:UpdateRole()[ERROR]: nil shipInfo" )
		return
	end

	self:SetLayerVisible( true, self.layers.ROLE_EFFECT )

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if not roleEffect then
		return
	end

	local role = UI:GetItemRole( self.shipInfo.baseDef )

	local hTex = UI:GetRoleIco4( role )
	roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, hTex )

end


--
function UI.PlayerSlot_ShipWnd:UpdateTooltip()

	self.tooltipData = nil

	if not self.shipInfo or not self.playerInfo then
		sys.log( "UI.PlayerSlot_ShipWnd:UpdateTooltip()[ERROR]: nil shipInfo or playerInfo" )
		return
	end
	
	local bCanShowTooltip = true
	if _G.MasterServer_IsConnected() then
		if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
			bCanShowTooltip = false
		end
	end
	
	if not bCanShowTooltip then
		return
	end

	self.tooltipData =
	{
		tooltipType			= UI.tooltipTypes.SHIP,
		defName				= self.shipInfo.baseDef,
		shipInfo			= self.shipInfo,
		playerId			= self.playerInfo.playerId,
		playerUid			= self.playerInfo.uid,
		logEvent			= _G.MasterServer.PlayerAction.PA_VESSEL_TOOLTIP_BATTLE,
	}	

	if self.shipInfo.lobby then
		self.tooltipData.shipInfo = nil
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerSlot_NameWnd
-- ------------------------------------------------------------------------

UI.PlayerSlot_NameWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.PlayerSlot_NameWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PlayerSlot_NameWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "playerSlot_name",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "player_name",
						layer		= "UI.PlayerSlot_NameWnd.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.PlayerSlot_NameWnd:Reset()

	self.nameMetaText:SetText( "", true )

	self.data = nil
	self.tooltipData = nil

end


--
function UI.PlayerSlot_NameWnd:Setup( data )

	self:Reset()

	self.data = data

	self:UpdateName()

end


--
function UI.PlayerSlot_NameWnd:OnClanNameChanged()

	self:UpdateName()

end


--
function UI.PlayerSlot_NameWnd:OnLeadershipChanged()

	self:UpdateName()

end


--
function UI.PlayerSlot_NameWnd:OnBomberChanged()

	self:UpdateName()

end


--
function UI.PlayerSlot_NameWnd:GetData()

	return self.data

end


--
function UI.PlayerSlot_NameWnd:OnPlayerSettingsChanged()

	self:UpdateName()

end


--
function UI.PlayerSlot_NameWnd:OnPlayerStatusChanged()

	self:UpdateName()
	
end


--
function UI.PlayerSlot_NameWnd:OnUnlimPveMissionLevelChanged()
	
	if self.data and self.data.playerInfo.isBot then
		self:UpdateName()
	end
	
end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.PlayerSlot_NameWnd.layers =
{
	MAIN_EFFECT	= 0,
	PLAYER_NAME	= 1,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.PlayerSlot_NameWnd.nameMetaText	= nil
UI.PlayerSlot_NameWnd.tooltipData	= nil
UI.PlayerSlot_NameWnd.data			= nil

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.PlayerSlot_NameWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.nameMetaText = UI.MetaText.GetNewInstance()	
	self.nameMetaText:InitFromLayer( self, self.layers.PLAYER_NAME ) 

end


--
function UI.PlayerSlot_NameWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.PlayerSlot_NameWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.PlayerSlot_NameWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.PlayerSlot_NameWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.PLAYER_NAME )

end


--
function UI.PlayerSlot_NameWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PLAYER_NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end 


--
function UI.PlayerSlot_NameWnd:UpdateName()

	local bFriend = self:GetParent().parent:IsFriend()

	local name = ""

	if self.data.playerInfo.lobby then
		name = UI:MakePlayerNameByUid( self.data.playerInfo.uid, true, false )
		if self.data.playerInfo.lobbyLeader then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			local color = mainEffect:GetObjColor( "color_host" )
			name = UI:Color2Str( color )..name
		end
	else
		name = UI:MakePlayerNameById( self.data.playerInfo.playerId, true, false )
	end

	if self.data.bLeader then

		local colorScheme = bFriend and UI.gameObjColorSchemes.FRIEND or UI.gameObjColorSchemes.ENEMY
		name = string.format( "%s%s", UI:GetSentinelLeaderIcoMetaString( colorScheme, false ), name )

	elseif self.data.bBomber then

		local colorScheme = bFriend and UI.gameObjColorSchemes.FRIEND or UI.gameObjColorSchemes.ENEMY
		name = string.format( "%s%s", UI:GetBomberIcoMetaString( colorScheme, false ), name )

	end

	-- желаемый уровень миссии в бесконечном пве (временно здесь, надо сделать отдельной колонкой)
	
	local bIsUnlimPve = _G.CL_IsUnlimPve()
	local bIsWavePve = _G.CL_IsWavePve()

	if( bIsUnlimPve or bIsWavePve ) and UI.HudWnd:IsOnScreen() and UI.HudWnd:GetMode() == UI.HudWnd.modes.SELECT_SHIP and self.data.playerInfo.status == _G.network.PlayerStatus.PS_ACTIVE then
	
		local wantedMissionLevel = 1
		
		if self.data.playerInfo.isBot then
		
			-- для ботов в качестве якобы выбранного уровня отображается текущий уровень миссии
			if bIsUnlimPve then
				wantedMissionLevel = _G.CL_GetUnlimPveMissionLevel()
			elseif bIsWavePve then
				wantedMissionLevel = _G.CL_GetWavePveStartWave()
			end
		
		else
		
			if self.data.playerInfo.playerSettings then
			
				if bIsUnlimPve then
			
					if self.data.playerInfo.playerSettings.unlimPve_wantedMissionLevel then
						wantedMissionLevel = self.data.playerInfo.playerSettings.unlimPve_wantedMissionLevel
						
					elseif self.data.playerInfo.playerSettings.unlimPve_missionLevel then
						wantedMissionLevel = self.data.playerInfo.playerSettings.unlimPve_missionLevel
					end
					
				elseif bIsWavePve then
				
					if self.data.playerInfo.playerSettings.wavePve_wantedStartWave then
						wantedMissionLevel = self.data.playerInfo.playerSettings.wavePve_wantedStartWave
						
					elseif self.data.playerInfo.playerSettings.wavePve_availableWave then
						wantedMissionLevel = self.data.playerInfo.playerSettings.wavePve_availableWave
					end
				
				end
				
			end

		end
		
		-- SC-108585 если игра была сматчена для игроков, пришедших из квеста с прописанным в нем минимальным уровнем миссии,
		-- то меньше него выбрать уровень нельзя
		local minLevel = bIsUnlimPve and _G.CL_GetUnlimPveMinMissionLevel() or 1
		if wantedMissionLevel < minLevel then
			wantedMissionLevel = minLevel
		end
		
		local availableMissionLevel = 1
		
		if self.data.playerInfo.isBot then
		
			-- для ботов в качестве якобы максимально доступного отображается максимально доступный уровень из всех живых игроков
			
			local totalAvailableLevel = 1
			
			local allPlayersInfo = _G.GetAllPlayersInfo()
			for playerIdx, playerInfo in pairs( allPlayersInfo ) do
			
				if not playerInfo.isBot then
				
					local playerAvailableLevel = 1
					
					if bIsUnlimPve then
						playerAvailableLevel = playerInfo.playerSettings and playerInfo.playerSettings.unlimPve_missionLevel or 1
					elseif bIsWavePve then
						playerAvailableLevel = playerInfo.playerSettings and playerInfo.playerSettings.wavePve_availableWave or 1
					end
					
					if playerAvailableLevel > totalAvailableLevel then
						totalAvailableLevel = playerAvailableLevel
					end
					
				end
				
			end
			
			availableMissionLevel = totalAvailableLevel
		
		else
		
			if bIsUnlimPve then
				availableMissionLevel = self.data.playerInfo.playerSettings and self.data.playerInfo.playerSettings.unlimPve_missionLevel or 1
			elseif bIsWavePve then
				availableMissionLevel = self.data.playerInfo.playerSettings and self.data.playerInfo.playerSettings.wavePve_availableWave or 1
			end
			
		end
		
		name = string.format( "%s[%d/%d] %s%s", UI:Color2Str( 0xff888888 ), wantedMissionLevel, availableMissionLevel, UI:Color2Str( self:GetColor( self.layers.PLAYER_NAME ) ), name )
		
	end
	
	local squadName = UI:MakePlayerSquadName( self.data.playerInfo.playerId )
	if squadName ~= "" then

		local squadColor = bFriend and UI.FRIEND_COLOR or UI.ENEMY_COLOR
		local baseColor = self:GetColor( self.layers.PLAYER_NAME )

		name = string.format( "%s%s) %s%s", UI:Color2Str( squadColor ), squadName, UI:Color2Str( baseColor ), name )

	end

	if self.data.enemyTeamIdx then
		local baseColor = self:GetColor( self.layers.PLAYER_NAME )
		local teamColor = self.data.enemyTeamIdx == 1 and UI.ENEMY_COLOR or UI.ALIEN_COLOR

		local enemyTeamName = self.data.enemyTeamIdx == 1 and "1" or "2"
		name = string.format( "%s%s) %s%s", UI:Color2Str( teamColor ), enemyTeamName, UI:Color2Str( baseColor ), name )
	end
	
	self.nameMetaText:SetText( name, true )

	local maxWidth		= self:GetLayerWidth( self.layers.PLAYER_NAME )
	local hFont			= self:GetFont( self.layers.PLAYER_NAME )

	-- если текст будет не влезать до такой степени, что будет попытка отрезать иконку лидера/бомбера,
	-- которая находится в начале строки, то все сглючит, т.к. там спецсимволы
	self.nameMetaText.text_formatted = UI:GetCutTextWithEllipses( self.nameMetaText.text_formatted, maxWidth, hFont )

end


--
function UI.PlayerSlot_NameWnd:GetClanName()

	local clanName = ""

	if self.data.playerInfo.cid ~= nil and self.data.playerInfo.cid ~= UI.INVALID_U64_ID then
		clanName = UI:GetClanName( self.data.playerInfo.cid ) or ""
	end

	return clanName

end


--
function UI.PlayerSlot_NameWnd:GetClan( bRequestStats )

	local cid = UI.INVALID_U64_ID

	if self.data.playerInfo.cid ~= nil then
		return self.data.playerInfo.cid
	end

	if self.data.playerInfo.uid ~= UI.INVALID_U64_ID then

    	if bRequestStats then
    		_G.MasterServer_UserProfileRequestField( self.data.playerInfo.uid, _G.MasterServer.UserProfileField.UPF_CLAN_ID )
    	end

        local profile = _G.MasterServer_UserProfileGet( self.data.playerInfo.uid )
    	if profile and profile.clanId ~= nil then
    		self.data.playerInfo.cid = profile.clanId
    	end

	end

end     


-- -----------------------------------------------------------------
-- UI.Players_ViewModeBtn
-- -----------------------------------------------------------------

UI.Players_ViewModeBtn = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Players_ViewModeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Players_ViewModeBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
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
				defName 			= "players_viewModeBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "mode_icon",
						layer		= "UI.Players_ViewModeBtn.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "players_viewModeBtn_ico",
			}}
		}
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Players_ViewModeBtn:Setup( viewMode )

	self:Reset()

	self.viewMode = viewMode
	self:FullUpdate()

end


--
function UI.Players_ViewModeBtn:GetViewMode()

	return self.viewMode

end


--
function UI.Players_ViewModeBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.Players_ViewModeBtn.layers =
{
    MAIN_EFFECT		= 0,
    ICO_EFFECT		= 1,
}

UI.Players_ViewModeBtn.effectInfo =
{
	ico =
	{
		viewMode2Anim =
		{
			[ pw.viewModes.HIDDEN ]		= "close",
			[ pw.viewModes.BRIEF ]		= "1",
			[ pw.viewModes.MEDIUM ]		= "2",
			[ pw.viewModes.FULL_SCORE ]	= "3",
			[ pw.viewModes.FULL_KILLS ]	= "3",
		},
	},

	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "sel_over",
		animationPressed	= "sel_over",
		animationDisabled	= "",
	},
}

UI.Players_ViewModeBtn.VIEW_MODE_BTN = true

-- ----------------------------------
-- vars
-- ----------------------------------

UI.Players_ViewModeBtn.viewMode		= -1
UI.Players_ViewModeBtn.tooltipData	= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Players_ViewModeBtn:Reset()

	self.viewMode		= -1
	self.tooltipData	= nil

end


--
function UI.Players_ViewModeBtn:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.Players_ViewModeBtn:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	local anim = self.effectInfo.ico.viewMode2Anim[ self.viewMode ]
	if anim then
		icoEffect:StartAnimation( anim ) 
	else
		sys.log( "UI.Players_ViewModeBtn:UpdateIco()[ERROR]: cannot find animation for view mode %s", tostring( self.viewMode ) )
	end

end


--
function UI.Players_ViewModeBtn:UpdateTooltip()

	local viewModeName = UI:Val2Key( UI.PlayersWnd.viewModes, self.viewMode )
	local strId = string.format( "players_viewMode_%s", viewModeName )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( strId )
	}

end