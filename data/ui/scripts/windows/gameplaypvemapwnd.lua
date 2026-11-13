-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
--
-- Workfile: gameplaypvemapwnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.GameplayPveMapWnd
-- -----------------------------------------------------------------

UI.GameplayPveMapWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.GameplayPveMapWnd.layers =
{
    MAIN_EFFECT		= 0,
	CONTROLS_EFFECT	= 1,
    LOADING_EFFECT	= 2,
}


--
UI.GameplayPveMapWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "GameplayPveMapWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.GameplayPveMapWnd.layers.CONTROLS_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	

			effects =
			{{
				defName 			= "gameplay_map_pve_main",
				defaultAnimation	= "idle",
		
				links =
				{
					{
						objName		= "q_map_win",
						layer		= "UI.GameplayPveMapWnd.layers.CONTROLS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "sector_info",
						wnd			= "UI.GameplayPveMap_BfsSectorStatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CONTROLS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_controls",
				defaultAnimation	= "idle",
		
				links =
				{
					{
						objName		= "q_map2",
						wnd			= "UI.GameplayPveMap_QuestsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- LOADING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",
			}}
		},
	},

	children =
	{
		"UI.GameplayPveMap_MapViewWnd",
		"UI.GameplayPveMap_MapModeBtn",
		"UI.GameplayPveMap_QuestsWnd",
		"UI.GameplayPveMap_CurrentLocationBtn",
		"UI.GameplayPveMap_BfsSectorStatsWnd",
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMapWnd:MasterServer_OnNotification( notification, params )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and notification == MasterServer.ServerNotification.SN_QUEST_PROGRESS then
		self:UpdateFreespaceQuests()
	end
	
	UI.GameplayPveMap_QuestsWnd:MasterServer_OnNotification( notification, params )

end
	

--
function UI.GameplayPveMapWnd:Unlink()

	local parent = self:GetParent()
	if parent then

		if parent.HideGameplayPveMap then
			parent:HideGameplayPveMap()
		else
			self:UnlinkFromParent()
		end

	end

end


--
function UI.GameplayPveMapWnd:HandleEscape()

	if UI.Quests_CharacterInfoWnd:IsOnScreen() then
		UI.Quests_CharacterInfoWnd:Hide()
		
	elseif UI.GameplayPveMap_QuestsWnd:IsOnScreen() and UI.GameplayPveMap_QuestsWnd:IsOpen() then
		UI.GameplayPveMap_QuestsWnd:Close()
		
	else
		self:CloseAndContinue()
	end
	
	return true

end


--
function UI.GameplayPveMapWnd:GetMapScale()

	return self.mapScale

end


--
function UI.GameplayPveMapWnd:GetMapMinScale()

	return self.mapMinScale

end


--
function UI.GameplayPveMapWnd:GetMapMaxScale()

	return self.mapMaxScale

end


--
function UI.GameplayPveMapWnd:GetQuests()

	return self.quests

end


--
function UI.GameplayPveMapWnd:HasQuests()

	local bHasQuests = false

	for category, questsForCategory in pairs( self.quests ) do
	
		if next( questsForCategory ) then
			bHasQuests = true
			break
		end
		
	end
	
	return bHasQuests
	
end


--
function UI.GameplayPveMapWnd:GetAdventures()

	return self.adventures

end


--
function UI.GameplayPveMapWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.GameplayPveMap_QuestsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	
	self.quests = {}
	self.questsBlink = {}
	self.zoneCivilianChangeRequestId = 0
	self.zoneEventsRequestId = 0

end


--
function UI.GameplayPveMapWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

end


--
function UI.GameplayPveMapWnd:OnInvasionInfo( spawned, killed )

	UI.GameplayPveMap_QuestsWnd:OnInvasionInfo( spawned, killed )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnQuestTime( result, requestId, questId )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnQuestTime( result, requestId, questId )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	
end


--
function UI.GameplayPveMapWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnChangeIntervalQuests()

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnChangeIntervalQuests()

end


--
function UI.GameplayPveMapWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnShipQuestTime( result, requestId, questId )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnShipQuestTime( result, requestId, questId )

end


--
function UI.GameplayPveMapWnd:ShowQuest( questId, questType, bSelect )

	if not self:IsOnScreen() then
		sys.log( "UI.GameplayPveMapWnd:ShowQuest()[ERROR]: not on screen" )
		return
	end

	if UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		UI.GameplayPveMap_QuestsWnd:ShowQuest( questId, questType, bSelect )
	else
		sys.log( "UI.GameplayPveMapWnd:ShowQuest()[ERROR]: quests wnd is not on screen" )
	end

end


--
function UI.GameplayPveMapWnd:ShowAdventure( aiid, questType, bSelect )

	if not self:IsOnScreen() then
		sys.log( "UI.GameplayPveMapWnd:ShowAdventure()[ERROR]: not on screen" )
		return
	end

	if UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		UI.GameplayPveMap_QuestsWnd:ShowAdventure( questId, questType, bSelect )
	else
		sys.log( "UI.GameplayPveMapWnd:ShowAdventure()[ERROR]: adventures wnd is not on screen" )
	end

end


--
function UI.GameplayPveMapWnd:ShowRankUpQuest( bSelect )

	if not self:IsOnScreen() then
		sys.log( "UI.GameplayPveMapWnd:ShowRankUpQuest()[ERROR]: not on screen" )
		return
	end

	if UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		UI.GameplayPveMap_QuestsWnd:ShowRankUpQuest( bSelect )
	else
		sys.log( "UI.GameplayPveMapWnd:ShowRankUpQuest()[ERROR]: quests wnd is not on screen" )
	end

end


--
function UI.GameplayPveMapWnd:ShowQuestCategory( category )

	if not self:IsOnScreen() then
		sys.log( "UI.GameplayPveMapWnd:ShowQuestCategory()[ERROR]: not on screen" )
		return
	end

	if UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		UI.GameplayPveMap_QuestsWnd:ShowQuestCategory( category )
	else
		sys.log( "UI.GameplayPveMapWnd:ShowQuestCategory()[ERROR]: quests wnd is not on screen" )
	end
	
end


--
function UI.GameplayPveMapWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	
	UI.GameplayPveMap_QuestsWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	
end


--
function UI.GameplayPveMapWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	
	UI.GameplayPveMap_QuestsWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	
	UI.GameplayPveMap_QuestsWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	
end


--
function UI.GameplayPveMapWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	
	UI.GameplayPveMap_QuestsWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	
end


-- коллбэк, вызывается из окна типа UI.BuyWnd
function UI.GameplayPveMapWnd:OnBuyWndResult( result, mode, data )

	if mode == UI.BuyWnd.modes.ZONE_JUMP then

    	if result == true then
		
			if _G.CL_RequestJumpToZone( data.zoneId ) then
				self:CloseAndContinue()
			else
				self.hMsgJumpError = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_jumpToZoneError_text" ), UI.MBS_OK )
			end

    	end
		
	elseif mode == UI.BuyWnd.modes.ZONE_CIVILIAN_CHANGE then
	
		if result == true then
		
			self.zoneCivilianChangeRequestId = _G.MasterServer_UniverseSetCivilianZone( data.zoneId, false )
			if self.zoneCivilianChangeRequestId == 0 then
				UI:ShowErrorMsg( "msg_zoneCivilianChangeError", _G.MasterServer.SetCivilianZoneResult.SCZR_ERROR, "_G.MasterServer.SetCivilianZoneResult" )
			end
			
		end

	else
		sys.log( "UI.GameplayPveMapWnd:OnBuyWndResult()[ERROR]: unhandled mode %d", mode )
	end

end


--
function UI.GameplayPveMapWnd:GetSubRegionZones( subRegionName )

	local zones = {}
	
	if type( subRegionName ) ~= "string" then
		sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones()[ERROR]: invalid type of the 1-st parameter (\"subRegionName\"); \"string\" expected, got \"%s\"", type( subRegionName ) )
		return zones
	end

	if type( _G.FreeSpaceMap ) == "table" then
	
		if type( _G.FreeSpaceMap.SubRegions ) == "table" then
		
			local subRegionInfo = _G.FreeSpaceMap.SubRegions[ subRegionName ]
			if type( subRegionInfo ) == "table" then
			
				if type( subRegionInfo.zones ) == "table" then
				
					for idx, zoneName in pairs( subRegionInfo.zones ) do
					
						if type( idx ) == "number" and type( zoneName ) == "string" then
							local zoneId = UI:ZoneName2Id( zoneName )
							table.insert( zones, zoneId )
						else
							sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones()[ERROR]: invalid format of table of _G.FreeSpaceMap.SubRegions[\"%s\"].zones; <number>=<string> expected, got <%s>=<%s>", subRegionName, type( idx ), type( zoneName ) )
							zones = {}
							break
						end
					
					end
				
				else
					sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[\"%s\"].zones; \"table\" expected, got \"%s\"", subRegionName, type( subRegionInfo.zones ) )
				end
			
			else
				sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[\"%s\"]; \"table\" expected, got \"%s\"", subRegionName, type( subRegionInfo ) )
			end
		
		else
			sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions; \"table\" expected, got \"%s\"", type( _G.FreeSpaceMap.SubRegions ) )
		end
	
	else
		sys.log( "UI.GameplayPveMapWnd:GetSubRegionZones[ERROR]: invalid type of _G.FreeSpaceMap; \"table\" expected, got \"%s\"", type( _G.FreeSpaceMap ) )
	end
	
	return zones

end


--
function UI.GameplayPveMapWnd:ShowZone( zoneId, mode )

	if self.regionName ~= nil then
		sys.log( "UI.GameplayPveMapWnd:ShowZone()[ERROR]: invalid mode" )
		return
	end
	
	if mode ~= nil and mode ~= self.mode then
		self:SetMode( mode )
	end
	
	self:SetMapScaleInternal( self.mapDefaultScale, false )

	local zoneInfo = _G.SpaceZoneById[ zoneId ]
	if zoneInfo and zoneInfo.dbg_pos_x and zoneInfo.dbg_pos_y then
		self:CenterOnMapPos( zoneInfo.dbg_pos_x, zoneInfo.dbg_pos_y )
	else
		self:SetMapPos( UI:ZeroVec2() )	
	end

	self:SaveMapLayout()

end


--
function UI.GameplayPveMapWnd:ShowSubRegion( subRegionName, mode )

	if self.regionName ~= nil then
		sys.log( "UI.GameplayPveMapWnd:ShowSubRegion()[ERROR]: invalid mode" )
		return
	end
	
	if mode ~= nil and mode ~= self.mode then
		self:SetMode( mode )
	end
	
	self:SetMapScaleInternal( self.mapDefaultScale, false )

	local subRegionInfo = _G.FreeSpaceMap.SubRegions[ subRegionName ]
	if subRegionInfo and subRegionInfo.posX and subRegionInfo.posY then
		self:CenterOnMapPos( subRegionInfo.posX, subRegionInfo.posY )
	else
		self:SetMapPos( UI:ZeroVec2() )	
	end

	self:SaveMapLayout()

end


-- устанавливается максимальный масштаб, карта центрируется на указанных координатах (с учетом наличия на экране окна квестов)
function UI.GameplayPveMapWnd:CenterOnMapPos( worldX, worldY )
	
	local freeViewWidth = 0
	
	-- если окно квестов на экране, то центрирование по свободному пространству (#0087092)
	if UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		freeViewWidth = ( UI.GameplayPveMap_QuestsWnd:GetLeft() - self:GetMapViewPos().x )
	else
		freeViewWidth = self:GetMapViewWidth()
	end
	
	local mapPos = UI:Vec2(
		worldX - self:XRel2World( freeViewWidth * 0.5 ),
		worldY - self:YRel2World( self:GetMapViewHeight() * 0.5 )
	)

	self:SetMapPos( mapPos )

end


-- Нет собственной подписки на событие EV_ARENA_MAJOR_CHANGED, вызывается из HangarWnd, чтобы иметь строго определенный порядок обработки,
-- (если оба окна будут подписаны индивидуально, то неизвестно, к кому ивент придет раньше, а здесь апдейтятся квесты, которые потом используются в ангаре)
function UI.GameplayPveMapWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) then
		self:UpdateFreespaceQuests()
	end
	
	UI.GameplayPveMap_QuestsWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.GameplayPveMapWnd:IsQuestToBlink( category, bForceUpdateQuests )

	-- квесты апдейтятся только если ангар на экране,
	-- поэтому в сам момент показа ангара, когда надо апдейтить кнопку старта, они невалидны,
	-- параметр bForceUpdateQuests заставляет немедленно проапдейтить квесты

	if bForceUpdateQuests then
		self:UpdateFreespaceQuests()
	end
	
	local bNeedBlink = false
	
	if category ~= nil then
		if type( category ) ~= "number" then
			sys.log( "UI.GameplayPveMapWnd:IsQuestToBlink()[ERROR]: invalid type of the 1-st parameter (\"category\"); \"number\" or \"nil\" expected, got \"%s\"", type( category ) )
			return bNeedBlink
		end
	end
	
	if category and category ~= -1 then
		bNeedBlink = self.questsBlink[ category ] == true
	else
		for _category, _bNeedBlink in pairs( self.questsBlink ) do
			if _bNeedBlink then
				bNeedBlink = true
				break
			end
		end
	end
	
	return bNeedBlink
	
end


--
function UI.GameplayPveMapWnd:MasterServer_OnUniverseSetCivilianZone( result, requestId, param1, param2 )

	if requestId == self.zoneCivilianChangeRequestId then
	
		-- апдейт происходит не здесь а в MasterServer_OnUniverseGet, который приходит сразу после этого

		if result ~= _G.MasterServer.SetCivilianZoneResult.SCZR_OK then
			UI:ShowErrorMsg( "msg_zoneCivilianChangeError", result, "_G.MasterServer.SetCivilianZoneResult" )
		end
		
		self.zoneCivilianChangeRequestId = 0
		
	end

end


--
function UI.GameplayPveMapWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	
end


--
function UI.GameplayPveMapWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	
end


--
function UI.GameplayPveMapWnd:OnHangarPrepareStateChanged()

	UI.GameplayPveMap_QuestsWnd:OnHangarPrepareStateChanged()
	
end


--
function UI.GameplayPveMapWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
		return
	end
	
	if self.mode == self.modes.BATTLE_FOR_SECTOR then
		self:SetupForRegion( self.regionName )
	end
	
end


--
function UI.GameplayPveMapWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	
end


--
function UI.GameplayPveMapWnd:ZoneConflictTime2Str( conflictServerTime )

	local str = "error"
	
	if type( conflictServerTime ) ~= "userdata" then
		sys.log( "UI.GameplayPveMapWnd:ZoneConflictTime2Str()[ERROR]: invalid type of the 1-st param ('conflictServerTime'); 'userdata' expected, got '%s'", type( conflictServerTime ) )
		return str
	end
	
	if conflictServerTime == UI.INVALID_U64_ID then
		sys.log( "UI.GameplayPveMapWnd:ZoneConflictTime2Str()[ERROR]: invalid conflictServerTime" )
		return str
	end
	
	local curServerTime = _G.MasterServer_GetServerTime()
	
	-- SC-112041 локальное или серверное - зависит от опции
	local curDateTime = UI.INVALID_U64_ID
	local conflictDateTime = UI.INVALID_U64_ID
	
	if UI:NeedShowServerTime() then
	
		curDateTime = _G.PlatformTimeToTable( curServerTime )
		conflictDateTime = _G.PlatformTimeToTable( conflictServerTime )
		
	else
	
		local curLocalTime = _G.MasterServer_ServerTimeToLocalTime( curServerTime )	
		local conflictLocalTime = _G.MasterServer_ServerTimeToLocalTime( conflictServerTime )

		curDateTime = _G.PlatformTimeToTable( curLocalTime )
		conflictDateTime = _G.PlatformTimeToTable( conflictLocalTime )
		
	end

	-- округляем до минут, т.к. количество секунд может незначительно варьироваться, и время будет "скакать"
	local conflictTimeOfDaySec = UI:Round( ( conflictDateTime.hour * 60 * 60 + conflictDateTime.minute * 60 + conflictDateTime.second ) / 60 ) * 60
	local conflictDayOfWeek = ( conflictDateTime.dayOfWeek == 0 ) and 6 or conflictDateTime.dayOfWeek - 1	-- в данных воскресенье=0, переводим на понедельник=0
	
	-- если в данных пришло без нескольких секунд полуночь, то выше это было округлено до 24 часов; превращаем это в 0 часов следующего дня
	if conflictTimeOfDaySec == 24 * 60 * 60 then
		conflictTimeOfDaySec = 0
		conflictDayOfWeek = math.fmod( conflictDayOfWeek + 1, 7 )
	end
	
	local str = UI:Time2Str7( conflictTimeOfDaySec )
	
	-- если начало не сегодня, то пишется еще день недели
	local curDayOfWeek = ( curDateTime.dayOfWeek == 0 ) and 6 or curDateTime.dayOfWeek - 1
	local bThisDay = curDayOfWeek == conflictDayOfWeek
	if not bThisDay then
	
		local dayOfWeekNames =
		{
			"monday",
			"tuesday",
			"wednesday",
			"thursday",
			"friday",
			"saturday",
			"sunday",
		}
		
		local strDayOfWeek = UI:GetStringByName( string.format( "dayOfWeek_%s", dayOfWeekNames[ conflictDayOfWeek + 1 ] ) )
		str = string.format( "%s (%s)", str, strDayOfWeek )
	
	end
	
	return str

end


--
function UI.GameplayPveMapWnd:GetZoneEvents( zoneId )

	local events = {}
	
	if type( zoneId ) ~= "number" then
		sys.log( "UI.GameplayPveMapWndUI.GameplayPveMapWnd:GetZoneEvents()[ERROR]: invalid type of the 1-st param ('zoneId'); 'number' expected, got '%s'", type( zoneId ) )
		return events
	end
	
	if UI.serverData.zoneEvents[ zoneId ] ~= nil then
	
		if type( UI.serverData.zoneEvents[ zoneId ] ) == "table" then
			events = UI.serverData.zoneEvents[ zoneId ]
		else
			sys.log( "UI.GameplayPveMapWndUI.GameplayPveMapWnd:GetZoneEvents()[ERROR]: invalid type of UI.serverData.zoneEvents[%d]; 'table' or 'nil' expected, got '%s'", type( UI.serverData.zoneEvents[ zoneId ] ) )
		end
		
	end
	
	return events

end


--
function UI.GameplayPveMapWnd:MasterServer_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )

	if result == _G.MasterServer.VariableSyncResult.NEED_UPDATE and self:IsOnScreen() then
		self:UpdateZoneEventsControls()
	end
	
	if requestId ~= 0 and requestId == self.zoneEventsRequestId then
		self.zoneEventsRequestId = 0
	end

end


--
function UI.GameplayPveMapWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	
	if self:IsOnScreen() and result == 0 and self.mode == self.modes.FREE_SPACE then
		for idx, zoneWnd in pairs( self.zoneWnds ) do
			zoneWnd:OnBattlePassUnlockPremium()
		end
	end

end


--
function UI.GameplayPveMapWnd:OnShowServerTimeOptionChanged()

	if not self:IsOnScreen() then
		return
	end
	
	if self.mode == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		for idx, subRegionWnd in pairs( self.subRegionWnds ) do
			subRegionWnd:OnShowServerTimeOptionChanged()
		end
	end
	
end


--
function UI.GameplayPveMapWnd:GetBfsSectorColor( zoneName )

	local color = nil
	local race = -1
	
	local zoneId = UI:ZoneName2Id( zoneName )
	local bIsUniverseZone = UI:IsUniverseZone( zoneId )	-- если сектор прописан, то показывается даже если зона не для бзс SC-112046#focus=streamItem-4-616168.0-0
	local ownerCid = bIsUniverseZone and UI.Universe:GetSectorOwner( zoneId ) or UI.INVALID_U64_ID
	local clanShipRace = bIsUniverseZone and UI.Universe:GetSectorClanShipRace( zoneId ) or -1
	
	-- определение, есть ли цвет из события
	local eventColor = nil
	
	local events = UI.GameplayPveMapWnd:GetZoneEvents( zoneId )
	for eventId, eventVal in pairs( events ) do
		
		if not( type( eventVal ) == "number" and eventVal <= ai.ScriptsServer.DISABLE_EVENT ) then
		
			local visualMap = UI:GetZoneEventVisualMap( eventId )
			if visualMap then
			
				if visualMap.bfs_sector_color ~= nil then
				
					if type( visualMap.bfs_sector_color ) == "number" then
						eventColor = visualMap.bfs_sector_color
						break	-- предполагается, что таких событий будет одно
					else
						sys.log( "UI.GameplayPveMapWnd:GetBfsSectorColor()[ERROR]: invalid type of _G.Events[%d].visualMap.bfs_sector_color; 'number' or 'nil' expected, got '%s'", eventId, type( visualMap.bfs_sector_color ) )
					end
					
				end
				
			end

		end
	
	end
	
	-- если есть цвет из события, то красится им
	if eventColor then
	
		color = eventColor
	
	-- если зона завхвачена каким-то кланом и у него есть дредноут - красится цветом расы дредноута
	elseif ownerCid ~= UI.INVALID_U64_ID and clanShipRace ~= -1 then
		
		race = clanShipRace
		color = self:GetBfsSectorColorByRace( race )
	
	end
	
	-- во всех остальных случаях красится цветом расы зоны
	if not color then
	
		local zoneDef = _G.SpaceZone[ zoneName ]
		if zoneDef then
		
			if type( zoneDef.bfs_sector_race ) == "number" then
				race = zoneDef.bfs_sector_race
				color = self:GetBfsSectorColorByRace( race )
			else
				sys.log( "UI.GameplayPveMapWnd()[ERROR]: invalid type of _G.SpaceZone['%s'].bfs_sector_race; 'number' expected, got '%s'", zoneName, type( zoneDef.bfs_sector_race ) )
			end
			
		else
			sys.log( "UI.GameplayPveMapWnd()[ERROR]: cannot find _G.SpaceZone['%s']", zoneName )
		end
		
	end
	
	if not color then
		color = UI.WHITE_COLOR
	end

	return color, race
	
end


--
function UI.GameplayPveMapWnd:GetBfsSectorColorByRace( race )

	local color = UI.WHITE_COLOR

	if type( race ) ~= "number" then
		sys.log( "UI.GameplayPveMapWnd:GetBfsSectorColorByRace()[ERROR]: invalid type of the 1-st param ('race'), 'number' expected, got '%s'", type( race )  )
		return color
	end
	
	if type( _G.BfsSectorColor ) ~= "table" then
		sys.log( "UI.GameplayPveMapWnd:GetBfsSectorColorByRace()[ERROR]: invalid type of _G.BfsSectorColor; 'table' expected, got '%s'", type( _G.BfsSectorColor ) )
		return color
	end

	if type( _G.BfsSectorColor[ race ] ) == "number" then
		color = _G.BfsSectorColor[ race ]
	else
		sys.log( "UI.GameplayPveMapWnd:GetBfsSectorColorByRace()[ERROR]: invalid type of _G.BfsSectorColor[%d]; 'number' expected, got '%s'", race, type( _G.BfsSectorColor[ race ] ) )
	end
	
	return color

end


--
function UI.GameplayPveMapWnd:GetBfsSectorAlphaFill()

	return UI.GameplayPveMap_BfsSectorsWnd.BASE_ALPHA_FILL
	
end


--
function UI.GameplayPveMapWnd:GetBfsSectorAlphaOutline()

	return UI.GameplayPveMap_BfsSectorsWnd.BASE_ALPHA_OUTLINE
	
end


--
function UI.GameplayPveMapWnd:GetNumBfsSectorsByRace( race )

	local numSectors = 0
	
	if type( race ) ~= "number" then
		sys.log( "UI.GameplayPveMapWnd:GetNumBfsSectorsByRace()[ERROR]: invalid type of the 1-st param ('race'), 'number' expected, got '%s'", type( race )  )
		return numSectors
	end
	
	if race == -1 then
		sys.log( "UI.GameplayPveMapWnd:GetNumBfsSectorsByRace()[ERROR]: invalid race -1" )
		return numSectors
	end
	
	local allSectors = UI.GameplayPveMap_BfsSectorsWnd:GetSectors()
	
	for idx, zoneName in pairs( allSectors ) do
		local color, sectorRace = self:GetBfsSectorColor( zoneName )
		if sectorRace == race then
			numSectors = numSectors + 1 
		end
	end

	return numSectors

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMapWnd.modes = 
{
	FREE_SPACE 				= 0,
	BATTLE_FOR_SECTOR 		= 1,
}

UI.GameplayPveMapWnd.DELAY = 15
UI.GameplayPveMapWnd.LinkEffectType = 
{
	SOLID 		= 0,
	DASH 		= 1,
	STAR_SOLID	= 2,
	STAR_DASH	= 3,
}

UI.GameplayPveMapWnd.LinkType2Anim =
{
	[ UI.GameplayPveMapWnd.LinkEffectType.DASH ] = "idle",
	[ UI.GameplayPveMapWnd.LinkEffectType.STAR_DASH ] = "idle",
}

UI.GameplayPveMapWnd.SCALE_ANIM_TIME	= 0.0	-- [секунд] время анимации появления/скрытия элементов при переходе масштаба через значения mapScaleThres_region/mapScaleThres_zone/mapScaleThres_zoneName и т.д.

UI.GameplayPveMapWnd.questUnfitReasons =
{
	WRONG_CATEGORY				= 0,	-- неподходящая категория
	LOW_RANK					= 1,	-- слишком низкий ранг игрока
	HIGH_RANK					= 2,	-- слишком высокий ранг игрока
	LOCKING_SHIP				= 3,	-- у игрока есть корабль, наличие которого делает квест недоступным для взятия
	NO_MAJOR_LEAGUE				= 4,	-- взять квест для "первой лиги" можно только если игрок когда-либо достигал ее (#0060294,комм.(0262106))
	NO_EVENT					= 5,	-- нет ивента
	OPEN_WORLD_DISABLED			= 6,	-- для опенворлдовских квестов - запрещен вылет в опернворлд
	FORCE_DISABLED				= 7,	-- квест задисэйблен дизайнерами
	COMPLETED					= 8,	-- завершен
	PREV_QUESTS_NOT_COMPLETED	= 9,	-- не выполнены предшествующие в цепочке квесты
	NOT_OFFERED					= 10,	-- для групповых квестов - не предложен для взятия
	WRONG_INTERVAL				= 11,	-- для интервальных квестов - неподходящее время
	WRONG_EVENT_DAY				= 12,	-- для ивентовых квестов - не подходящий день
	GROUP_COOLDOWN				= 13,	-- для мануал-оффер квестов - группа на кулдауне
	GROUP_HAS_ACTIVE_QUEST		= 14,	-- для мануал-оффер квестов - в группе уже взят квест (можно одновременно взять только один)
	RANK_UP_LOW_EXP				= 15,	-- для квеста на поднятие ранга - не хватает опыта на поднятие ранга (#0090799)
	PVE_LEVEL_NOT_IN_SCHEDULE	= 16,	-- для квеста требуется, чтобы была активна в расписании определенная пве-карта, но ее нет в расписании
	UNAVAILABLE					= 17,	-- не доступен по иным причинам
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayPveMapWnd.inited = false
UI.GameplayPveMapWnd.wait = false
UI.GameplayPveMapWnd.requestId = nil
UI.GameplayPveMapWnd.mode = nil
UI.GameplayPveMapWnd.freeSpaceDelay = -1
UI.GameplayPveMapWnd.zoneWnds = {}
UI.GameplayPveMapWnd.cachedZoneWnds = {}
UI.GameplayPveMapWnd.linkEffects = {}
UI.GameplayPveMapWnd.cachedLinkEffects = {}
UI.GameplayPveMapWnd.link2Effects = {}
UI.GameplayPveMapWnd.cachedLink2Effects = {}
UI.GameplayPveMapWnd.link3Effects = {}
UI.GameplayPveMapWnd.cachedLink3Effects = {}
UI.GameplayPveMapWnd.linkStarSolidEffects = {}
UI.GameplayPveMapWnd.cachedLinkStarSolidEffects = {}
UI.GameplayPveMapWnd.linkStarDashEffects = {}
UI.GameplayPveMapWnd.cachedLinkStarDashEffects = {}
UI.GameplayPveMapWnd.linkedRegions = {}
UI.GameplayPveMapWnd.subRegionWnds = {}
UI.GameplayPveMapWnd.freeSubRegionWnds = {}
UI.GameplayPveMapWnd.starWnds = {}
UI.GameplayPveMapWnd.cachedStarWnds = {}
UI.GameplayPveMapWnd.dragWnd = nil
-- enable map editor mode
UI.GameplayPveMapWnd.isDragAndropEnable = false
UI.GameplayPveMapWnd.offset = nil
UI.GameplayPveMapWnd.linkedZones = {}
UI.GameplayPveMapWnd.raidZone = ""
UI.GameplayPveMapWnd.raidZoneWnd = nil
UI.GameplayPveMapWnd.waitClanNameResolve = false
UI.GameplayPveMapWnd.hMsgJumpError = UI.INVALID_UI_HANDLE
UI.GameplayPveMapWnd.quests = {}
UI.GameplayPveMapWnd.questsBlink = {}
UI.GameplayPveMapWnd.zoneCivilianChangeRequestId = 0

UI.GameplayPveMapWnd.bMapInited					= false
UI.GameplayPveMapWnd.mapLayers					= {}
UI.GameplayPveMapWnd.mapPos						= Vec2( 0, 0 )
UI.GameplayPveMapWnd.bMapMoving					= false
UI.GameplayPveMapWnd.mapCapturedPos				= Vec2( 0, 0 )
UI.GameplayPveMapWnd.lastMapClickPos			= nil
UI.GameplayPveMapWnd.lastWndHandleClicked		= UI.INVALID_UI_HANDLE
UI.GameplayPveMapWnd.mapScale					= -1
UI.GameplayPveMapWnd.mapMinScale				= 1
UI.GameplayPveMapWnd.mapMaxScale				= 10
UI.GameplayPveMapWnd.mapDefaultScale			= 1
UI.GameplayPveMapWnd.worldRect					= Quat( 0, 0, 0, 0 )
UI.GameplayPveMapWnd.mapMinSize 				= Vec2( 0, 0 )
UI.GameplayPveMapWnd.mapMinSize_abs 			= Vec2( 0, 0 )
UI.GameplayPveMapWnd.savedMapScale				= nil
UI.GameplayPveMapWnd.savedMapPos				= nil
UI.GameplayPveMapWnd.mapScaleSteps				= {}
UI.GameplayPveMapWnd.mapScaleThres_region		= 1		-- при таком масштабе появляются	регионы
UI.GameplayPveMapWnd.mapScaleThres_zone			= 1		--									зоны
UI.GameplayPveMapWnd.mapScaleThres_zoneName		= 1		-- 									имена зон
UI.GameplayPveMapWnd.mapScaleThres_bfsSectors	= 1		-- 									сектора бзс
UI.GameplayPveMapWnd.mapScaleThresMin_star		= 1		-- 									звезды
UI.GameplayPveMapWnd.mapScaleThresMax_star		= UI.GameplayPveMapWnd.mapMaxScale	-- при таком масштабе исчезают звезды
UI.GameplayPveMapWnd.mapScaleBase_star			= UI.GameplayPveMapWnd.mapMaxScale	-- при таком масштабе звезды рисуютя 1:1
UI.GameplayPveMapWnd.mapScaleAlpha_region		= 1
UI.GameplayPveMapWnd.mapScaleAlpha_zone			= 1
UI.GameplayPveMapWnd.mapScaleAlpha_zoneName		= 1
UI.GameplayPveMapWnd.mapScaleAlpha_star			= 1
UI.GameplayPveMapWnd.mapScaleAlpha_bfsSectors	= 1
UI.GameplayPveMapWnd.mapDstScaleAlpha_region	= nil
UI.GameplayPveMapWnd.mapDstScaleAlpha_zone		= nil
UI.GameplayPveMapWnd.mapDstScaleAlpha_zoneName	= nil
UI.GameplayPveMapWnd.mapDstScaleAlpha_star		= nil
UI.GameplayPveMapWnd.mapDstScaleAlpha_bfsSectors= nil
UI.GameplayPveMapWnd.bDirty						= false

-- zone events
UI.GameplayPveMapWnd.zoneEventsRequestId		= 0

-- adventures
UI.GameplayPveMapWnd.adventures	= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

local aspect = ( cvars.r_width / 1024 ) / ( cvars.r_height / 768 )

--
function UI.GameplayPveMapWnd:TryToOpenBFSForZone( zoneId )

	--if self:GetMode() ~= self.modes.BATTLE_FOR_SECTOR then
	self:SetMode( self.modes.BATTLE_FOR_SECTOR )
	--end

	self:SetupForRegion( nil )
	self:ShowZone( zoneId )

end


--
function UI.GameplayPveMapWnd:GetRegionForZoneId( zoneId )
	for k, v in pairs( FreeSpaceMap.Regions ) do
		for kk, vv in pairs( v.zones ) do
			if SpaceZone[ vv ].zone_id == zoneId then
				return k
			end
		end
	end
end

--
function UI.GameplayPveMapWnd:StartDragAndDrop( wnd, offset )
	if self.isDragAndropEnable then
		self.offset = offset
		self.dragWnd = wnd
	end
end

--
function UI.GameplayPveMapWnd:MasterServer_OnClanUniverseMove( result, requestId )
	if self:IsOnScreen() then
		if result ~= 0 then
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "universe_cant_send_ship" ).." "..UI:GetStringByName( UI:Val2Key( MasterServer.ClanOpResult, result ) ), UI.MBS_OK )
		end
	end
end

--
function UI.GameplayPveMapWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )
	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return false
	end

	if self.isDragAndropEnable and self.dragWnd then
		local left, top = self.dragWnd:GetLeft(), self.dragWnd:GetTop()
		local centerX, centerY = self.dragWnd:GetCenter()
		local pos = self:WindowPos2Rel( UI:Vec2( mouseX - centerX, mouseY - centerY ) )
		self.dragWnd:SetPos( pos.x, pos.y )
	end
		
	if not self.bMapMoving then	
		if self.lastMapClickPos then
			if self:CanMoveMap() then
				self:StartMoveMap( self.lastMapClickPos.x, self.lastMapClickPos.y )
			end
		end
	end
	
	if self.bMapMoving then
		self:MoveMap( mouseX, mouseY )
	end	

	return false
end


--
function UI.GameplayPveMapWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	local lastWndHandleClicked_old = self.lastWndHandleClicked

	self.lastMapClickPos		= nil
	self.lastWndHandleClicked	= UI.INVALID_UI_HANDLE

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	if self.bMapMoving then
		self:StopMoveMap()
		return true
	end
	
	if self.isDragAndropEnable then
		return true
	end
	
	if wndThatReceivedInput ~= lastWndHandleClicked_old then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "GameplayPveMap_ZoneWnd" ) then
		
		local gameMode = _G.GetCurrentGameMode()
		if gameMode == ai.Gameplay.NONE then
		
			if self:GetMode() == self.modes.FREE_SPACE and not self:IsWait() and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

				if wnd:IsEnabled() then

					UI.GameplayShipSelectWnd:Setup( wnd:GetZoneId() )
					UI.GameplayShipSelectWnd:Show()
					UI:PlayGlobalSound( UI.sounds.btnClick )

				end

			end

		elseif gameMode == ai.Gameplay.FREE_SPACE then
		
			local interactionType = _G.CL_GetLocalPlayerInteraction()
			if interactionType ~= ai.InteractionType.JUMP_TO_ZONE then
			
				local myShip = _G.CL_GetLocalPlayerShip()
				if myShip and myShip:IsControllable() then
		
					if wnd:IsEnabled() then
						
						if not wnd:IsCurrent() then
							self:LaunchBuyWnd( UI.BuyWnd.modes.ZONE_JUMP, { zoneId = wnd:GetZoneId() } )
						end
						
					end
					
				end
				
			end
			
		end
		
	elseif UI:IsWndKindOf( wnd, "GameplayPveMap_StarWnd" ) then
	
		self:ShowSubRegion( wnd:GetSubRegionName(), nil )
		
	elseif UI:IsWndKindOf( wnd, "GameplayPveMapElement_MissionWnd" ) then
		
		local parent = wnd.parent
		if parent then
			if UI:IsWndKindOf( parent, "GameplayPveMap_StarWnd" ) then
				UI.GameplayPveMapWnd:ShowSubRegion( parent:GetSubRegionName() )
			else
				if parent.GetQuests then
					local quests = parent:GetQuests()
					if #quests == 1 then
						UI.GameplayPveMapWnd:ShowQuest( quests[ 1 ].id, quests[ 1 ].type, true )
					else
						UI.ContextMenu:Clear()
						-- fill context menu
						UI.ContextMenu:SetName( UI:GetStringByName( "context_menu_quests" ) )
						for i = 1, #quests do
							UI.ContextMenu:AddRecord( { action = UI.ContextMenu_SlotWnd.actions.QUEST, quest_id = quests[ i ].id, questType = quests[ i ].type, questState = quests[ i ].myInternalState } )
						end
						UI.ContextMenu:Show( mouseX, mouseY )
					end
				end
			end
		end
		
	end

	return true

end


--
function UI.GameplayPveMapWnd:F_OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self.dragWnd then
		self.dragWnd:SaveCoord()
	end
	self.dragWnd = nil
	return true
end

--
function UI.GameplayPveMapWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	
	UI.GameplayPveMap_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end

--
function UI.GameplayPveMapWnd:MasterServer_OnUniverseGet( result, requestId )

	if self:IsOnScreen() then
		UI.GameplayPveMapWnd:UpdateUniverse()
	end

end

--
function UI.GameplayPveMapWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	if self:IsOnScreen() and self.waitClanNameResolve then
		self.waitClanNameResolve = false
		self:UpdateUniverse()
	end
end

--
function UI.GameplayPveMapWnd:GetMode()
	return self.mode
end

--
function UI.GameplayPveMapWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateMapScaleAlphaAnimation( dt_sys )

end

--
function UI.GameplayPveMapWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	self.lastMapClickPos		= Vec2( mouseX, mouseY )
	self.lastWndHandleClicked	= wndThatReceivedInput
	
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.GameplayPveMap_MapModeBtn then

		UI:PlayGlobalSound( UI.sounds.btnClick )
		if self:GetMode() == self.modes.BATTLE_FOR_SECTOR then
			self:SetMode( self.modes.FREE_SPACE )
		else
			self:SetMode( self.modes.BATTLE_FOR_SECTOR )
		end
		
	elseif wnd == UI.GameplayPveMap_CurrentLocationBtn then
	
		local curZoneId = ( _G.GetCurrentGameMode() == ai.Gameplay.NONE ) and _G.MasterServer_GetSpaceStationZoneId() or _G.CL_GetCurrentSpaceZoneId()
		self:ShowZone( curZoneId, self.modes.FREE_SPACE )
		
	end

	return true
	
end

--
function UI.GameplayPveMapWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

end

--
function UI.GameplayPveMapWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

end

--
function UI.GameplayPveMapWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceQuests()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	
	self:CheckBlinkZoneOnQuestTake( param1 )

end

--
function UI.GameplayPveMapWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )	

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceAdventures()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) and result == 0 then
		self:UpdateFreespaceAdventures()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnAdventureFinal( params )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) then
		self:UpdateFreespaceAdventures()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnAdventureFinal( params )

end


--
function UI.GameplayPveMapWnd:MasterServer_OnNewAdventure( params )

	if ( self:IsOnScreen() or UI.HangarWnd:IsOnScreen() ) then
		self:UpdateFreespaceAdventures()
	end

	UI.GameplayPveMap_QuestsWnd:MasterServer_OnNewAdventure( params )

end


--
function UI.GameplayPveMapWnd:SetWait( wait )
	self.wait = wait
	if wait then
		self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
	end
end

--
function UI.GameplayPveMapWnd:IsWait()
	return self.wait
end

--
function UI.GameplayPveMapWnd:UpdateFreespaceQuests( bUpdateControls )

	-- данные о квестах могут приходить и после загрузки ангара;
	-- экран логина ждет некоторое время данных квестов, и если оно истекло, то загружает ангар, и это не считается ошибкой
	if not UI.serverData.bQuestsInited then
		return
	end
	
	if bUpdateControls == nil then
		bUpdateControls = true
	end

	self.quests				= self:DetectQuests()
	self.questsBlink		= self:DetectQuestsBlink()

	if self:IsOnScreen() and bUpdateControls then
		
		if self.mode == self.modes.FREE_SPACE then
			self:SetupForRegion( self.regionName )
		end
		
	end
	
	UI.HangarWnd:OnGameplayPveMapUpdateQuests()
	
end

--
function UI.GameplayPveMapWnd:UpdateFreespaceAdventures( bUpdateControls )

	if not UI.serverData.bAdventuresInited then
		return
	end
	
	if bUpdateControls == nil then
		bUpdateControls = true
	end
	
	self.adventures	= _G.MasterServer_GetActiveAdventures()

	if self:IsOnScreen() and bUpdateControls then
		
		if self.mode == self.modes.FREE_SPACE then
			self:SetupForRegion( self.regionName )
		end
		
	end
	
	UI.HangarWnd:OnGameplayPveMapUpdateQuests()
	
end

--
function UI.GameplayPveMapWnd:FullUpdate( mode )

	self:InitMap()
	self:RecalcLayout()

	self:SetWait( false )
	self.requestId = nil
	self.freeSpaceDelay = -1

	self:UpdateMapModeBtn()
	self:UpdateQuestsWnd()
	
	self:RequestZoneEvents()		-- данные об ивентах приходят периодически, но при открытии карты обновляем их немедленно

	if self.mode == self.modes.BATTLE_FOR_SECTOR then
		self:UpdateUniverse( false )
	
	elseif self.mode == self.modes.FREE_SPACE then
		self:SetupForRegion( nil, true )
	end	

end

--
function UI.GameplayPveMapWnd:SetMode( mode, skipUpdate )

	if mode ~= nil and mode ~= self.modes.FREE_SPACE and _G.GetCurrentGameMode() ~= ai.Gameplay.NONE then
		sys.log( "UI.GameplayPveMapWnd:SetMode()[ERROR]: cannot set %s mode in gameplay", tostring( mode ) )
		return
	end

	local lastMode = self.mode
	self.mode = mode
	if not skipUpdate then
		self:FullUpdate( lastMode )
	end
end

--
function UI.GameplayPveMapWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	
end

--
function UI.GameplayPveMapWnd:F_Shutdown()
	for k, v in pairs( self.linkEffects ) do
		_G.UI_DestroyEffect( v.effect )
	end
	for k, v in pairs( self.cachedLinkEffects ) do
		_G.UI_DestroyEffect( v )
	end
	for k, v in pairs( self.link2Effects ) do
		_G.UI_DestroyEffect( v.effect )
	end
	for k, v in pairs( self.cachedLink2Effects ) do
		_G.UI_DestroyEffect( v )
	end
	for k, v in pairs( self.link3Effects ) do
		_G.UI_DestroyEffect( v.effect )
	end
	for k, v in pairs( self.cachedLink3Effects ) do
		_G.UI_DestroyEffect( v )
	end	
	for k, v in pairs( self.linkStarSolidEffects ) do
		_G.UI_DestroyEffect( v.effect )
	end
	for k, v in pairs( self.cachedLinkStarSolidEffects ) do
		_G.UI_DestroyEffect( v )
	end
	for k, v in pairs( self.linkStarDashEffects ) do
		_G.UI_DestroyEffect( v.effect )
	end
	for k, v in pairs( self.cachedLinkStarDashEffects ) do
		_G.UI_DestroyEffect( v )
	end
	UI.Wnd.F_Shutdown( self )

end

--
function UI.GameplayPveMapWnd:UpdateUniverse( forceHome )
	if self:IsOnScreen() and self.mode == self.modes.BATTLE_FOR_SECTOR then
		self:SetWait( false )
		local allCached = true
		if not UI.Universe:IsInited() then
			UI.Universe:Request()
			allCached = false
		end
		if allCached then
			local sectors = UI.Universe:GetSectors()
			if sectors then
				for k, v in pairs( sectors ) do
					if v.owner and v.owner ~= UI.INVALID_U64_ID then
						local nickName, bCached, requestId, tag = _G.MasterServer_GetClanName( v.owner )
						if not bCached then
							self.waitClanNameResolve = true
							allCached = false
						end
					end
				end
			end
		end
		if not allCached then
			self:SetWait( true )
		end
		if forceHome then
			self:SetupForRegion()
		else
			if allCached then
				self:SetupForRegion( self.regionName )
			end
		end
	end
end

--
function UI.GameplayPveMapWnd:SendShip( zoneId, shipDef, cost )
	local price = { val = cost, priceType = UI.exPriceTypes.CLAN_IRIDIUM, basePrice = 0, defName = "", bIsBuyPrice = true }
	UI.ClanConfirmWnd:Show( UI.ClanConfirmWnd.Modes.BFS_SHIP_SEND, UI:GetStringByName( "bfs_ship_send_confirm_text" ), { price }, { zoneId = zoneId, shipDef = shipDef } )
end

--
function UI.GameplayPveMapWnd:OnClanConfirmWndResult( result, mode, data )
	self.wait = false
	if result == true and data.zoneId then
		_G.MasterServer_UniverseMove( data.zoneId )
	end
end


--
function UI.GameplayPveMapWnd:GetLinkEffect( linkEffectType, count )
	local effect = nil
	local effectInfo = nil
	if linkEffectType == self.LinkEffectType.SOLID then
		if #self.cachedLink3Effects > 0 then
			effect = self.cachedLink3Effects[ #self.cachedLink3Effects ]
			self.cachedLink3Effects[ #self.cachedLink3Effects ] = nil
		else
			effect = _G.UI_SpawnEffect( "gameplay_map_pve_zone_link", UI.GameplayPveMap_LinksWnd:GetUiHandle() )
		end
		effectInfo = { effect = effect }
		table.insert( self.link3Effects, effectInfo )
	elseif linkEffectType == self.LinkEffectType.DASH then
		if #self.cachedLink2Effects > 0 then
			effect = self.cachedLink2Effects[ #self.cachedLink2Effects ]
			self.cachedLink2Effects[ #self.cachedLink2Effects ] = nil
		else
			effect = _G.UI_SpawnEffect( "gameplay_map_pve_zone_link_2", UI.GameplayPveMap_LinksWnd:GetUiHandle() )
		end
		effectInfo = { effect = effect }
		table.insert( self.link2Effects, effectInfo )
		effect:StartAnimationSpeed( UI.GameplayPveMapWnd.LinkType2Anim[ linkEffectType ], 0 )

	elseif linkEffectType == self.LinkEffectType.STAR_SOLID then
	
		local idx = nil
		idx, effect = next( self.cachedLinkStarSolidEffects )
		
		if effect then
			self.cachedLinkStarSolidEffects[ idx ] = nil
		else
			effect = _G.UI_SpawnEffect( "gameplay_map_pve_link_star_solid", UI.GameplayPveMap_LinksWnd:GetUiHandle() )
		end
		
		effectInfo = { effect = effect }
		table.insert( self.linkStarSolidEffects, effectInfo )

	elseif linkEffectType == self.LinkEffectType.STAR_DASH then
	
		local idx = nil
		idx, effect = next( self.cachedLinkStarDashEffects )
		
		if effect then
			self.cachedLinkStarDashEffects[ idx ] = nil
		else
			effect = _G.UI_SpawnEffect( "gameplay_map_pve_link_star_dash", UI.GameplayPveMap_LinksWnd:GetUiHandle() )
		end
		
		effectInfo = { effect = effect }
		table.insert( self.linkStarDashEffects, effectInfo )
		effect:StartAnimationSpeed( UI.GameplayPveMapWnd.LinkType2Anim[ linkEffectType ], 0 )
		
	else
		if #self.cachedLinkEffects > 0 then
			effect = self.cachedLinkEffects[ #self.cachedLinkEffects ]
			self.cachedLinkEffects[ #self.cachedLinkEffects ] = nil
		else
			effect = _G.UI_SpawnEffect( "gameplay_map_pve_zone_link_dots", UI.GameplayPveMap_LinksWnd:GetUiHandle() )
		end
		effectInfo = { effect = effect }
		table.insert( self.linkEffects, effectInfo )
		if count ~= nil and count > 1 then
			effect:StartAnimationSpeed( UI.GameplayPveMapWnd.LinkType2Anim[ linkEffectType ].."_"..tostring( count ), 0 )
		else
			effect:StartAnimationSpeed( UI.GameplayPveMapWnd.LinkType2Anim[ linkEffectType ], 0 )
		end
	end
	return effectInfo
end

local solidLinkMaxSize = nil
local dashLinkMaxSize = nil
local dotLinkMaxSize = nil
local starSolidLinkMaxSize = nil
local starDashLinkMaxSize = nil
local zoneRadius_abs = nil
local starRadius_abs = nil
--
function UI.GameplayPveMapWnd:SetLinkEffectPos( linkEffect, linkEffectType, beginPosX, beginPosY, endPosX, endPosY, bStar )

	if bStar == nil then
		bStar = false
	end
	
	local radius_abs = 0
	
	if bStar then
	
		if not starRadius_abs then
			local idx, starWnd = next( self.starWnds )
			starRadius_abs = starWnd and starWnd:GetLinkRadius() or 0
		end
		
		radius_abs = starRadius_abs

	else
	
		if not zoneRadius_abs then
			local idx, zoneWnd = next( self.zoneWnds )
			zoneRadius_abs = zoneWnd and zoneWnd:GetLinkRadius() or 0
		end
		
		radius_abs = zoneRadius_abs
		
	end
	
	local elementScale = bStar and self.mapScale / self.mapScaleBase_star or self.mapScale / self.mapMaxScale
	
	local dir		= Vec2( UI:XToAbs( endPosX ) - UI:XToAbs( beginPosX ), UI:YToAbs( endPosY ) - UI:YToAbs( beginPosY ) )
	local width		= UI:XToRel( UI:V2Length( dir ) - radius_abs * 2 * elementScale )
	local height	= 0
	local rotCenter	= Vec2( 0, 0 )
	
	if linkEffectType == self.LinkEffectType.SOLID then
		if solidLinkMaxSize == nil then
			solidLinkMaxSize = linkEffect:GetObjSize( "self133" )
		end
		local scale = width / solidLinkMaxSize.x
		linkEffect:SetScale( UI:Vec2( scale, 1 ) )
		height = solidLinkMaxSize.y
		rotCenter = Vec2( solidLinkMaxSize.x / 2, height / 2 )
		
	elseif linkEffectType == self.LinkEffectType.STAR_SOLID then
		if starSolidLinkMaxSize == nil then
			starSolidLinkMaxSize = linkEffect:GetObjSize( "self133" )
		end
		local scale = width / starSolidLinkMaxSize.x
		linkEffect:SetScale( UI:Vec2( scale, 1 ) )
		height = starSolidLinkMaxSize.y
		rotCenter = Vec2( starSolidLinkMaxSize.x / 2, height / 2 )

	else
		local baseWidth = 1
		if linkEffectType == self.LinkEffectType.DASH then
			if not dashLinkMaxSize then
				dashLinkMaxSize = linkEffect:GetObjSize( "self" )
			end
			baseWidth = dashLinkMaxSize.x
			height = dashLinkMaxSize.y
		elseif linkEffectType == self.LinkEffectType.STAR_DASH then
			if not starDashLinkMaxSize then
				starDashLinkMaxSize = linkEffect:GetObjSize( "self" )
			end
			baseWidth = starDashLinkMaxSize.x
			height = starDashLinkMaxSize.y
		else
			if not dotLinkMaxSize then
				dotLinkMaxSize = linkEffect:GetObjSize( "self" )
			end
			baseWidth = dotLinkMaxSize.x
			height = dotLinkMaxSize.y
		end
		linkEffect:SetAnimationTime( width / baseWidth )
		rotCenter = Vec2( width / 2, height / 2 )
	end
	
	linkEffect:SetPos( UI:Vec2( UI:Lerp( beginPosX, endPosX, 0.5 ) - width / 2, UI:Lerp( beginPosY, endPosY, 0.5 ) - height / 2 ) )
	
	local dirNorm = UI:V2GetNormalized( dir )
	local rot = math.atan2( dirNorm.y, dirNorm.x )
	linkEffect:SetRotation( rot, rotCenter )

end


--
function UI.GameplayPveMapWnd:ClearMap()

	--Clear
	local effectsPool = UI.GameplayPveMap_LinksWnd:GetEffectsPool( UI.GameplayPveMap_LinksWnd.layers.LINKS )
	for k, v in pairs( self.linkEffects ) do
		effectsPool:RemoveEffect( v.effect )
		table.insert( self.cachedLinkEffects, v.effect )
	end
	self.linkEffects = {}

	for k, v in pairs( self.link2Effects ) do
		effectsPool:RemoveEffect( v.effect )
		table.insert( self.cachedLink2Effects, v.effect )
	end
	self.link2Effects = {}

	for k, v in pairs( self.link3Effects ) do
		effectsPool:RemoveEffect( v.effect )
		table.insert( self.cachedLink3Effects, v.effect )
	end
	self.link3Effects = {}
	
	for k, v in pairs( self.linkStarSolidEffects ) do
		effectsPool:RemoveEffect( v.effect )
		table.insert( self.cachedLinkStarSolidEffects, v.effect )
	end
	self.linkStarSolidEffects = {}
	
	for k, v in pairs( self.linkStarDashEffects ) do
		effectsPool:RemoveEffect( v.effect )
		table.insert( self.cachedLinkStarDashEffects, v.effect )
	end
	self.linkStarDashEffects = {}

	for k, v in pairs( self.subRegionWnds ) do
		v:UnlinkFromParent()
		table.insert( self.freeSubRegionWnds, v )
	end
	self.subRegionWnds = {}

	for k, v in pairs( self.zoneWnds ) do
		v:Reset()
		v:UnlinkFromParent()
		table.insert( self.cachedZoneWnds, v )
	end
	self.zoneWnds = {}
	
	for k, v in pairs( self.starWnds ) do
		v:Reset()
		v:UnlinkFromParent()
		table.insert( self.cachedStarWnds, v )
	end
	self.starWnds = {}
	
	UI.GameplayPveMap_BfsSectorsWnd:Reset()
	UI.GameplayPveMap_BfsSectorStatsWnd:Clear()
	UI.GameplayPveMap_BfsSectorStatsWnd:UnlinkFromParent()

	self:StopMoveMap()

	self:SetMapScaleInternal( self.mapDefaultScale, false )
	self:SetMapScaleAlpha_region( 1 )
	self:SetMapScaleAlpha_zone( 1 )
	self:SetMapScaleAlpha_zoneName( 1 )
	self:SetMapScaleAlpha_star( 1 )
	self:SetMapScaleAlpha_bfsSectors( 1 )
	self:UpdateMapWndSize()	

	self.worldRect = Quat( 0, 0, _G.FreeSpaceMap.sizeX, _G.FreeSpaceMap.sizeY )
	self:SetMapPos( UI:Vec2( self.worldRect.x, self.worldRect.y ) )

	UI.GameplayPveMap_MapWnd:SetLayerVisible( false, UI.GameplayPveMap_MapWnd.layers.BG )

end

--
function UI.GameplayPveMapWnd:GetRegionNameForZone( zoneId )
	for k, v in pairs( FreeSpaceMap.Regions ) do
		for kk, vv in pairs( v.zones ) do
			if SpaceZone[ vv ].zone_id == zoneId then
				return k
			end
		end
	end
	return nil
end

--
function UI.GameplayPveMapWnd:GetMissionZones()
	local missionsZones = {}
	
	local activeOwQuests = {}
	
	if _G.MasterServer_HasFreeSpaceAccess and _G.MasterServer_HasFreeSpaceAccess() then

		for questIdx, questInfo in pairs( UI.serverData.activeQuests ) do
		
			local questId = questInfo.id
			local bFit = false
		
			if UI:IsQuestOpenWorld( questId ) then
			
				bFit = true
			
				-- для интервальных квестов - если время не подходит, не показываются даже взятые квесты - #0087726
				if UI:IsQuestInterval( questId ) then
					if UI.serverData.intervalQuestsById[ questId ] == nil then
						bFit = false
					end
				end
				
				-- для опенворлдовских квестов - запрещены квесты в локации - SC-112151, SC-113605, SC-113723
				if UI:IsQuestLockedByZone( questId ) then
					bFit = false
				end
				
			end
			
			if bFit then
				table.insert( activeOwQuests, questInfo )
			end
			
		end
		
	end
	
	for k, v in pairs( activeOwQuests ) do
		if Quests[ v.id ] then
			if Quests[ v.id ] and Quests[ v.id ].stages[ v.stage ] and Quests[ v.id ].stages[ v.stage ].marked_zone_id then
				local stage = Quests[ v.id ].stages[ v.stage ]
				if v.progress >= stage.required_value and v.stage == #Quests[ v.id ].stages then
					local space_station_race = nil 
					if Quests[ v.id ].space_station_race then
						space_station_race = Quests[ v.id ].space_station_race
					elseif QuestGroups[ Quests[ v.id ].group ] and QuestGroups[ Quests[ v.id ].group ].space_station_race then
						space_station_race = QuestGroups[ Quests[ v.id ].group ].space_station_race
					end
					if space_station_race then
						for k1, v1 in pairs( SpaceZone ) do
							if v1.station_race == space_station_race then
								table.insert( missionsZones, { id = v.id, zone_id = v1.zone_id, stage = v.stage, progress = v.progress, type = UI.questTypes.REGULAR } )
								break
							end
						end
					end
				else
					if type( stage.marked_zone_id ) == "table" then
						for kk, vv in pairs( stage.marked_zone_id ) do
							if SpaceZoneById[ vv ] then
								table.insert( missionsZones, { id = v.id, zone_id = vv, stage = v.stage, progress = v.progress, type = UI.questTypes.REGULAR } )
							else
								sys.log( "UI.GameplayPveMapWnd:GetMissionZones()[ERROR]: wrong space zone id '%d' for quest: %d", stage.marked_zone_id, v.id )
							end
						end
					else
						if SpaceZoneById[ stage.marked_zone_id ] then
							table.insert( missionsZones, { id = v.id, zone_id = stage.marked_zone_id, stage = v.stage, progress = v.progress, type = UI.questTypes.REGULAR } )
						else
							sys.log( "UI.GameplayPveMapWnd:GetMissionZones()[ERROR]: wrong space zone id '%d' for quest: %d", stage.marked_zone_id, v.id )
						end
					end
				end
			end
		end
	end

	return missionsZones
end


-- аналог UI.GameplayPveMapWnd:GetMissionZones()
function UI.GameplayPveMapWnd:GetAdventureZones()

	local adventureZones = {}

	if _G.MasterServer_HasFreeSpaceAccess and _G.MasterServer_HasFreeSpaceAccess() then

		for adventureIdx, adventureInfo in pairs( UI.serverData.activeAdventures ) do

			local zones = UI:GetAdventureZonesForStageT( adventureInfo.aiid )

			dprint( zones )

			for zoneIdx, zoneId in pairs( zones ) do

				if SpaceZoneById[ zoneId ] then
					-- table.insert( adventureZones, { id = v.id, zone_id = stage.marked_zone_id, stage = v.stage, progress = v.progress, type = UI.questTypes.REGULAR } )
					table.insert( adventureZones, { 
						atid = adventureInfo.atid, 
						aiid = adventureInfo.aiid,
						zone_id = zoneId, 
						stage = adventureInfo.stage, 
						progress = adventureInfo.progress, 
						--type = UI.questTypes.REGULAR 
					} )
				else
					sys.log( "UI.GameplayPveMapWnd:GetAdventureZones()[ERROR]: wrong space zone id '%d' for adventure atid: %d", zoneId, adventureInfo.atid )
				end

			end
		end

	end

	return adventureZones

end


--
function UI.GameplayPveMapWnd:GetZoneWnd()

	local zone = {}
	if #self.cachedZoneWnds > 0 then
		zone = self.cachedZoneWnds[ #self.cachedZoneWnds ]
		self.cachedZoneWnds[ #self.cachedZoneWnds ] = nil
	else
		zone = UI:CreateChildWnd( self, UI.GameplayPveMap_ZoneWnd, tostring( #self.zoneWnds + #self.cachedZoneWnds ) )
	end
	table.insert( self.zoneWnds, zone )
	return zone	

end


--
function UI.GameplayPveMapWnd:GetStarWnd()

	local idx, starWnd = next( self.cachedStarWnds )
	
	if starWnd then
		self.cachedStarWnds[ idx ] = nil
	else
		starWnd = UI:CreateChildWnd( self, UI.GameplayPveMap_StarWnd, tostring( #self.starWnds + #self.cachedStarWnds ) )
	end	
	
	table.insert( self.starWnds, starWnd )
	
	return starWnd
	
end


-- мир -> окно карты
function UI.GameplayPveMapWnd:GetMapRealCoord( posX, posY )

	local relPos = self:WorldPos2Rel( UI:Vec2( posX, posY ) )
	return relPos.x, relPos.y

end


-- мир -> окно карты
function UI.GameplayPveMapWnd:World2Rel( worldDist )

	return Vec2( self:XWorld2Rel( worldDist.x ), self:YWorld2Rel( worldDist.y ) )

end


-- мир -> окно карты
function UI.GameplayPveMapWnd:XWorld2Rel( worldDistX )

	return self.worldRect.z ~= 0 and worldDistX / self.worldRect.z * self.mapMinSize.x * self.mapScale or 0

end


-- мир -> окно карты
function UI.GameplayPveMapWnd:YWorld2Rel( worldDistY )

	return self.worldRect.w ~= 0 and worldDistY / self.worldRect.w * self.mapMinSize.y * self.mapScale or 0

end


-- окно карты -> мир
function UI.GameplayPveMapWnd:Rel2World( relDist )

	return Vec2( self:XRel2World( relDist.x ), self:YRel2World( relDist.y ) )

end


-- окно карты -> мир
function UI.GameplayPveMapWnd:XRel2World( relDistX, mapScale )

	if mapScale == nil then
		mapScale = self.mapScale
	end

	return self.mapMinSize.x ~= 0 and relDistX / self.mapMinSize.x * self.worldRect.z / mapScale or 0

end


-- окно карты -> мир
function UI.GameplayPveMapWnd:YRel2World( relDistY, mapScale )

	if mapScale == nil then
		mapScale = self.mapScale
	end

	return self.mapMinSize.y ~= 0 and relDistY / self.mapMinSize.y * self.worldRect.w / mapScale or 0

end


--
function UI.GameplayPveMapWnd:GetMapViewWidth()

	return math.min( UI.GameplayPveMap_MapViewWnd:GetWidth(), self:GetMapRelSize().x )	

end


--
function UI.GameplayPveMapWnd:GetMapViewHeight()

	return math.min( UI.GameplayPveMap_MapViewWnd:GetHeight(), self:GetMapRelSize().y )

end


--
function UI.GameplayPveMapWnd:GetMapViewPos()
	
	local mapSize = self:GetMapRelSize()

	local x = math.max( ( UI.GameplayPveMap_MapViewWnd:GetWidth() - mapSize.x ) / 2, 0 ) + UI.GameplayPveMap_MapViewWnd:GetLeft()
	local y = math.max( ( UI.GameplayPveMap_MapViewWnd:GetHeight() - mapSize.y ) / 2, 0 ) + UI.GameplayPveMap_MapViewWnd:GetTop()

	return Vec2( x, y )

end


-- мир -> окно карты
function UI.GameplayPveMapWnd:WorldPos2Rel( worldPos )

	return self:World2Rel( worldPos - UI:Vec2( self.worldRect.x, self.worldRect.y ) )

end


-- окно карты -> мир
function UI.GameplayPveMapWnd:RelPos2World( relPos )

	return self:Rel2World( relPos ) + UI:Vec2( self.worldRect.x, self.worldRect.y )

end


-- главное окно -> мир
function UI.GameplayPveMapWnd:WindowPos2World( windowPos )

	return self.mapPos + self:Rel2World( self:WindowPos2MapView( windowPos ) )

end


-- главное окно -> окно карты
function UI.GameplayPveMapWnd:WindowPos2Rel( windowPos )

	return self:WorldPos2Rel( self:WindowPos2World( windowPos ) )

end


-- окно карты -> главное окно
function UI.GameplayPveMapWnd:RelPos2Window( mapRelPos )

	return mapRelPos - ( self:WorldPos2Rel( self.mapPos ) - self:GetMapViewPos() )

end


-- главное окно -> окно маски карты
function UI.GameplayPveMapWnd:WindowPos2MapView( windowPos )

	return windowPos - self:GetMapViewPos()

end


--
local WindowWidth = nil
local WindowHeight = 768
local Border = 0
	
function UI.GameplayPveMapWnd:ClampScreenCoord( posX, posY, startPosX, startPosY, targetPosX, targetPosY, widht, height, border )

	if WindowWidth == nil then
		WindowWidth = self:GetWidth()
		WindowHeight = self:GetHeight()
	end
	local intersect = {}
	if border == nil then
		border = Border
	end
	if posX < 0 or posX > WindowWidth - widht or posY < 0 or posY > WindowHeight - height then
		intersect[ 1 ] = UI:IntersectSegments( UI:Vec2( border, border ), UI:Vec2( WindowWidth - border, border ), UI:Vec2( targetPosX, targetPosY ), UI:Vec2( startPosX, startPosY ) )
		--if intersect == nil then
		intersect[ 2 ] = UI:IntersectSegments( UI:Vec2( border, WindowHeight - border ), UI:Vec2( WindowWidth - border, WindowHeight - border ), UI:Vec2( targetPosX, targetPosY ), UI:Vec2( startPosX, startPosY ) )
		--if intersect == nil then
		intersect[ 3 ] = UI:IntersectSegments( UI:Vec2( border, border ), UI:Vec2( border, WindowHeight - border ), UI:Vec2( targetPosX, targetPosY ), UI:Vec2( startPosX, startPosY ) )
		--if intersect == nil then
		intersect[ 4 ] = UI:IntersectSegments( UI:Vec2( WindowWidth - border, border ), UI:Vec2( WindowWidth - border, WindowHeight - border ), UI:Vec2( targetPosX, targetPosY ), UI:Vec2( startPosX, startPosY ) )
	else 
		return posX, posY
	end
	local min = 999999999999
	local value = false
	local realPosX = nil
	local realPosY = nil
	for k, v in pairs( intersect ) do
		if v then
			local dist2 = math.pow( v.x - posX, 2 ) + math.pow( v.y - posY, 2 )
			if dist2 < min then
				value = true
				min = dist2
				realPosX = v.x - ( widht / 2 )
				realPosY = v.y - ( height / 2 )
			end
		end
	end
	return realPosX, realPosY
end


--
function UI.GameplayPveMapWnd:NeedShowZone( zoneId )

	local bShow = true
		
	-- построенные верфи всех дредноутов #0104977
	local shipyardRace = UI:GetZoneClanShipStationRace( zoneId )
	if shipyardRace ~= -1 then
	
		local bCanShowShipyard =
			UI.Clan:IsInClan()
			and UI.Clan:IfShipyardBuilded( shipyardRace )
			
		if not bCanShowShipyard then
			bShow = false
		end
		
	end

	if bShow then

		if self.mode == self.modes.BATTLE_FOR_SECTOR then
			if not UI:IsUniverseZone( zoneId ) then
				bShow = false
			end
		end
		
	end
		
	return bShow
	
end


--
function UI.GameplayPveMapWnd:SetupForRegion( regionName, bResetMapLayoutToDefault )

	-- #0105931 чтобы тормоза при апдейте не были заметны во время перемещения карты мышью, не апдейтим, пока перемещаем
	if self.bMapMoving and regionName == self.regionName and not bResetMapLayoutToDefault then
		self.bDirty = true
		return
	end

	if regionName ~= nil and regionName ~= "PVP" then
		sys.log( "UI.GameplayPveMapWnd:SetupForRegion()[ERROR]: invalid \"regionName\"; nil or \"PVP\" expected, got \"%s\"", tostring( regionName ) )
		regionName = nil
	end

	local oldMapScale	= self.mapScale
	local oldMapPos		= UI:Vec2CopyStable( self.mapPos )
	local bOldMapMoving	= self.bMapMoving
	
	if oldMapScale == -1 then
		bResetMapLayoutToDefault = true
	end

	self:ClearMap()

	self.raidZone = ""
	self.raidZoneWnd = nil
	self.regionName = regionName

	local effectsPool = UI.GameplayPveMap_LinksWnd:GetEffectsPool( UI.GameplayPveMap_LinksWnd.layers.LINKS )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local realPosX, realPosY
	local linkSize
	local link2SizeMaxSize

	local currentRegion = nil
	local currentZoneId = ( _G.GetCurrentGameMode() == ai.Gameplay.NONE ) and _G.MasterServer_GetSpaceStationZoneId() or _G.CL_GetCurrentSpaceZoneId()

	if not currentZoneId then
		sys.log( "UI.GameplayPveMapWnd:SetupForRegion()[ERROR]: currentZoneId is nil" )
	else
		currentRegion = self:GetRegionNameForZone( currentZoneId )
	end

	local missionsZones = {}
	local adventuresZones = {}
	if self.mode == self.modes.FREE_SPACE then
		missionsZones = self:GetMissionZones()
		adventuresZones = self:GetAdventureZones()
	end
	
	local questsByZoneId = {}
	for idx, questInfo in pairs( missionsZones ) do
		if not questsByZoneId[ questInfo.zone_id ] then
			questsByZoneId[ questInfo.zone_id ] = {}
		end
		table.insert( questsByZoneId[ questInfo.zone_id ], questInfo )
	end

	local adventuresByZoneId = {}
	for idx, adventureInfo in pairs( adventuresZones ) do
		if not adventuresByZoneId[ adventureInfo.zone_id ] then
			adventuresByZoneId[ adventureInfo.zone_id ] = {}
		end
		table.insert( adventuresByZoneId[ adventureInfo.zone_id ], adventureInfo )
	end
	

	if UI:IsStrEmpty( regionName ) then
		self.worldRect = UI:QuatCopyStable( self:CalcFreeSpaceWorldRect() )

		if bResetMapLayoutToDefault then

			if self.savedMapScale and self.savedMapPos then

	    		self:SetMapScaleInternal( self.savedMapScale, false )
				self:SetMapPos( self.savedMapPos )

			else

    			local curZoneId = UI:GetCurZone()
    			if curZoneId == -1 then
    				curZoneId = UI:GetCurSpaceStationZone()
    			end

    			self:ShowZone( curZoneId )

			end

		else

			self.bMapMoving = bOldMapMoving
    		self:SetMapScaleInternal( oldMapScale, false )
			self:SetMapPos( oldMapPos )

		end

		self:SaveMapLayout()

		UI.GameplayPveMap_MapWnd:SetLayerVisible( true, UI.GameplayPveMap_MapWnd.layers.BG )

		-- subregions
		local index 
		for v, subRegionInfo in pairs( FreeSpaceMap.SubRegions ) do
			local subRegion = nil
			if #self.freeSubRegionWnds > 0 then
				subRegion = self.freeSubRegionWnds[ #self.freeSubRegionWnds ]
				self.freeSubRegionWnds[ #self.freeSubRegionWnds ] = nil
			else
				subRegion = UI:CreateChildWnd( self, UI.GameplayPveMap_SubRegionWnd, tostring( #self.subRegionWnds ) )
			end
			table.insert( self.subRegionWnds, subRegion )
			subRegion:UpdateForData( v )
			UI.GameplayPveMap_MapWnd:AddChild( subRegion )
		end
		
		-- звезды
		
		local starWndsByName = {}

		for subRegionName, subRegionInfo in pairs( _G.FreeSpaceMap.SubRegions ) do
		
			local starWnd = self:GetStarWnd()
			
			starWnd:Setup( subRegionName )
			UI.GameplayPveMap_MapWnd:AddChild( starWnd )
			
			starWndsByName[ subRegionName ] = starWnd
			
			-- квесты
			
			local zones = self:GetSubRegionZones( subRegionName )
			for zoneIdx, zoneId in pairs( zones ) do
			
				local quests = questsByZoneId[ zoneId ]
				if quests and next( quests ) then
					starWnd:AddQuests( quests )
				end

				local adventures = adventuresByZoneId[ zoneId ]
				if adventures and next( adventures ) then
					starWnd:AddAdventures( adventures )
				end

			end
			
		end
		
		-- связи между звездами
		
		if self.mode == self.modes.FREE_SPACE then
		
			for starIdx, starWnd in pairs( self.starWnds ) do
			
				local subRegionName = starWnd:GetSubRegionName()
				local subRegionInfo = _G.FreeSpaceMap.SubRegions[ subRegionName ]
				
				local nextSubRegionNames = {}
				
				if subRegionInfo.next_subregion ~= nil then
					if type( subRegionInfo.next_subregion ) == "string" then
						nextSubRegionNames = { subRegionInfo.next_subregion }
					elseif type( subRegionInfo.next_subregion ) == "table" then
						nextSubRegionNames = subRegionInfo.next_subregion
					else
						sys.log( "UI.GameplayPveMapWnd:SetupForRegion()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[\"%s\"].next_subregion; \"string\", \"table\" or \"nil\" expected, got \"%s\"", subRegionName, type( subRegionInfo.next_subregion ) )
					end
				end
				
				if #nextSubRegionNames > 0 then
					
					for _, regionName in ipairs( nextSubRegionNames ) do
					
						local nextSubRegionInfo = _G.FreeSpaceMap.SubRegions[ regionName ]
						if nextSubRegionInfo then
						
							local nextStarWnd = starWndsByName[ regionName ]
							if nextStarWnd then
							
								local linkEffectType = nextStarWnd:IsDisabled() and self.LinkEffectType.STAR_DASH or self.LinkEffectType.STAR_SOLID
								
								local linkEffectInfo = self:GetLinkEffect( linkEffectType )
								linkEffectInfo.effectType	= linkEffectType
								linkEffectInfo.beginPosX	= subRegionInfo.posX
								linkEffectInfo.beginPosY	= subRegionInfo.posY
								linkEffectInfo.endPosX		= nextSubRegionInfo.posX
								linkEffectInfo.endPosY		= nextSubRegionInfo.posY
								
								effectsPool:PushEffect( linkEffectInfo.effect )
								
							else
								sys.log( "UI.GameplayPveMapWnd:SetupForRegion()[ERROR]: cannot find wnd for star %s", regionName )
							end
						
						else
							sys.log( "UI.GameplayPveMapWnd:SetupForRegion()[ERROR]: cannot find _G.FreeSpaceMap.SubRegions[\"%s\"]", regionName )
						end
						
					end
				end
			
			end

		end
		

		local centerX, centerY
		self.linkedZones = {}

		local playerAccountRank = UI:GetPlayerAccountRank()

		local zones = {}
		for zoneName, zoneInfo in pairs( _G.SpaceZone ) do
			if zoneInfo.dbg_pos_x and zoneInfo.dbg_pos_y and UI:IsStrEmpty( zoneInfo.pvp_level_name ) then
				table.insert( zones, zoneName )
			end
		end

		for k, v in pairs( zones ) do
		
			-- сектор БЗС
			-- SC-112046#focus=streamItem-4-616168.0-0
			-- если сектор прописан, то показывается даже если зона не видна
			if self.mode == self.modes.BATTLE_FOR_SECTOR then
				UI.GameplayPveMap_BfsSectorsWnd:AddSector( v )
			end

			local zone = nil
			
			if self:NeedShowZone( SpaceZone[ v ].zone_id ) then
			
				zone = self:GetZoneWnd()
       			zone:UpdateForData( v )

			end

			if zone ~= nil then

				UI.GameplayPveMap_MapWnd:AddChild( zone )
				
				if self.mode == self.modes.FREE_SPACE then
					local quests = questsByZoneId[ SpaceZone[ v ].zone_id ]
					if quests and next( quests ) then
						zone:AddQuests( quests )
					end

					local adventures = adventuresByZoneId[ SpaceZone[ v ].zone_id ]
					if adventures and next( adventures ) then
						zone:AddAdventures( adventures )
					end
				end
				
				if self.mode == self.modes.FREE_SPACE and SpaceZone[ v ].link_zones then
					for kk, vv in pairs( SpaceZone[ v ].link_zones ) do
						-- skip single-side link
						local need = false
						if SpaceZoneById[ vv ].link_zones then
							for k2, v2 in pairs( SpaceZoneById[ vv ].link_zones ) do
								if v2 == SpaceZone[ v ].zone_id then
									need = true
								end
							end
						end

						-- скрытые линки (с любого конца) не показываются

						if need then

    						local bHidden = false

    						if SpaceZone[ v ].link_hidden then							
    							for hiddenIdx, hiddenLinkZoneId in pairs( SpaceZone[ v ].link_hidden ) do
    								if hiddenLinkZoneId == vv then
    									bHidden = true
    									break
    								end
    							end
    						end

							if not bHidden then

        						if SpaceZoneById[ vv ].link_hidden then							
        							for hiddenIdx, hiddenLinkZoneId in pairs( SpaceZoneById[ vv ].link_hidden ) do
        								if hiddenLinkZoneId == SpaceZone[ v ].zone_id then
        									bHidden = true
        									break
        								end
        							end

        						end
							end

							if bHidden then
								need = false
							end

						end

						-- линки к скрытым зонам не показываются
						if need then
							if not UI.GameplayPveMapWnd:NeedShowZone( SpaceZoneById[ vv ].zone_id ) then
								need = false
							end
						end
						
						-- линки к зонам и от зон, которые не доступны по рангу, не показываются
						if need then
							
							local zone1RankFit = UI:GetZoneUnlockRank( SpaceZone[ v ].zone_id ) <= playerAccountRank
							local zone2RankFit = UI:GetZoneUnlockRank( SpaceZoneById[ vv ].zone_id ) <= playerAccountRank
							
							if not zone1RankFit or not zone2RankFit then
								need = false
							end

						end

						-- skip redundance link
						-- TODO в O(1)
						if need then
							for kkk, vvv in pairs( self.linkedZones ) do
								if vvv == vv then
									need = false
									break
								end
							end
						end

						if need then
							local linkEffectInfo
							local linkEffect
							local bActive1 = true -- раньше здесь была проверка на посещенность, но в #0098713 это условие убрали
							local bActive2 = true
							local secondEffect = not bActive1 or not bActive2
							
							linkEffectInfo = self:GetLinkEffect( secondEffect and self.LinkEffectType.DASH or self.LinkEffectType.SOLID )
							linkEffect = linkEffectInfo.effect
							effectsPool:PushEffect( linkEffect )
							linkEffectInfo.effectType	= secondEffect and self.LinkEffectType.DASH or self.LinkEffectType.SOLID
							linkEffectInfo.beginPosX	= SpaceZone[ v ].dbg_pos_x
							linkEffectInfo.beginPosY	= SpaceZone[ v ].dbg_pos_y
							linkEffectInfo.endPosX		= SpaceZoneById[ vv ].dbg_pos_x
							linkEffectInfo.endPosY		= SpaceZoneById[ vv ].dbg_pos_y

						end

					end
				end
				table.insert( self.linkedZones, SpaceZone[ v ].zone_id )
			end

		end

	end	
	
	self:SetMapScaleInternal( self.mapScale, false )
	
	if self.mode == self.modes.BATTLE_FOR_SECTOR then
		self:AddChild( UI.GameplayPveMap_BfsSectorStatsWnd )
		UI.GameplayPveMap_BfsSectorStatsWnd:Update()
	end

end

--
function UI.GameplayPveMapWnd:F_OnAfterShowOnScreen()

	-- ввызывается до всего остального, т.к. из self:OnAfterShowOnScreen() будет вызван адпейт дочернего окна квестов, где эти квесты понадобятся
	self:UpdateFreespaceQuests( false )
	self:UpdateFreespaceAdventures( false )
	
	self:OnAfterShowOnScreen()
	
	self.lastMapClickPos = nil

    if self.mode == nil or self.mode ~= self.modes.FREE_SPACE and _G.GetCurrentGameMode() ~= ai.Gameplay.NONE then
		self:SetMode( self.modes.FREE_SPACE )
	else
		self:FullUpdate()
	end

	return true
end

--
function UI.GameplayPveMapWnd:SaveMapLayout()

	self.savedMapScale	= self.mapScale
	self.savedMapPos	= UI:Vec2CopyStable( self.mapPos )

end


--
function UI.GameplayPveMapWnd:GetMinShipsRank()
	local minRank = 15
	local ships = UI:GetAllEquippedShips()
	for i = 1, #ships do
		local rank = UI:GetDef( ships[ i ].defName ).rank
		minRank = rank < minRank and rank or minRank
	end
	return minRank
end

--
function UI.GameplayPveMapWnd:GetPvEScenarioIdx( missionName )
	if not missionName then
		return nil
	end
	local scenarios = _G.MasterServer_GetPVEQueues()
	for k, v in pairs( scenarios ) do
		if v == missionName then
			return k - 1
		end
	end
	return nil
end

--
function UI.GameplayPveMapWnd:GetPvERaidIdx( missionName )
	if not missionName then
		return nil
	end
	local raids = _G.MasterServer_GetPVERaidQueues()
	for k, v in pairs( raids ) do
		if v.missionName == missionName then
			return k - 1
		end
	end
	return nil
end

--
function UI.GameplayPveMapWnd:GetMode()
	return self.mode
end


--
function UI.GameplayPveMapWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:ScaleMap( ticks, mouseX, mouseY )

	return true

end   


--
function UI.GameplayPveMapWnd:CanMoveMap()

	return --[[self.regionName and]] self.regionName ~= "PVP" and not self.dragWnd

end


--
function UI.GameplayPveMapWnd:StartMoveMap( mouseX, mouseY )

	if self.bMapMoving then
		sys.log( "UI.GameplayPveMapWnd:StartMoveMap()[ERROR]: already moving" )
		return
	end

	self.bMapMoving = true
	self.mapCapturedPos = UI:Vec2CopyStable( self:WindowPos2World( UI:Vec2( mouseX, mouseY ) ) )

	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.GameplayPveMapWnd:StopMoveMap()

	if not self.bMapMoving then
		return
	end

	self.bMapMoving = false

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end
	
	-- #0105931 чтобы тормоза при апдейте не были заметны во время перемещения карты мышью, не апдейтим, пока перемещаем
	if self.bDirty then
	
		self.bDirty = false
		
		if self:IsOnScreen() then
			UI.GameplayPveMapWnd:SetupForRegion( self.regionName )
		end
		
	end

end


--
function UI.GameplayPveMapWnd:MoveMap( mouseX, mouseY )

	if not self.bMapMoving then
		sys.log( "UI.GameplayPveMapWnd:StartMoveMap()[ERROR]: not moving" )
		return
	end

	local mapPos = self.mapCapturedPos - self:Rel2World( self:WindowPos2MapView( UI:Vec2( mouseX, mouseY ) ) )
	self:SetMapPos( mapPos )

	self:SaveMapLayout()

end


--
function UI.GameplayPveMapWnd:SetMapPos( mapPos )

	local oldMapPos = UI:Vec2CopyStable( self.mapPos )

	self.mapPos = UI:Vec2CopyStable( mapPos )

	local mapViewWorldWidth		= self:XRel2World( self:GetMapViewWidth() )
	local mapViewWorldHeight	= self:YRel2World( self:GetMapViewHeight() )

	if self.mapPos.x < self.worldRect.x then
		self.mapPos.x = self.worldRect.x

	elseif self.mapPos.x + mapViewWorldWidth > self.worldRect.x + self.worldRect.z then
		self.mapPos.x = ( self.worldRect.x + self.worldRect.z ) - mapViewWorldWidth
	end

	if self.mapPos.y < self.worldRect.y then
		self.mapPos.y = self.worldRect.y

	elseif self.mapPos.y + mapViewWorldHeight > self.worldRect.y + self.worldRect.w then
		self.mapPos.y = ( self.worldRect.y + self.worldRect.w ) - mapViewWorldHeight
	end

	local mapRelPos = -self:World2Rel( self.mapPos - UI:Vec2( self.worldRect.x, self.worldRect.y ) )
	local pos = mapRelPos + ( self:GetMapViewPos() - UI:Vec2( UI.GameplayPveMap_MapViewWnd:GetLeft(), UI.GameplayPveMap_MapViewWnd:GetTop() ) )
	UI.GameplayPveMap_MapWnd:SetPos( pos.x, pos.y )
	self:UpdateMapLayersTexRects()

end


--
function UI.GameplayPveMapWnd:RecalcMapLayout()

	self:UpdateMapWndSize()	
	
	local zoneScale = self.mapScale / self.mapMaxScale
	for k, v in pairs( self.zoneWnds ) do
		v:Scale( zoneScale )
		self:UpdateZoneWndPos( v )
		v:UpdateQuestPos()
		v:UpdateZoneEventsPos()
	end

	for k, v in pairs( self.subRegionWnds ) do
		v:RecalcLayout()
	end
	
	local starScale = self.mapScale / self.mapScaleBase_star
	for k, v in pairs( self.starWnds ) do
		v:Scale( starScale )
		self:UpdateStarWndPos( v )
		v:UpdateQuestPos()
	end


	local zoneLinks =
	{
		self.linkEffects,
		self.link2Effects,
		self.link3Effects,
	}

	for linkTableIdx, links in pairs( zoneLinks ) do
	
		for linkIdx, linkEffectInfo in pairs( links ) do

			if linkEffectInfo.effect and linkEffectInfo.effectType and linkEffectInfo.beginPosX and linkEffectInfo.beginPosY and linkEffectInfo.endPosX and linkEffectInfo.endPosY then

				local beginPosX, beginPosY	= self:GetMapRealCoord( linkEffectInfo.beginPosX, linkEffectInfo.beginPosY )
				local endPosX, endPosY		= self:GetMapRealCoord( linkEffectInfo.endPosX, linkEffectInfo.endPosY )

				self:SetLinkEffectPos( linkEffectInfo.effect, linkEffectInfo.effectType, beginPosX, beginPosY, endPosX, endPosY, false )
				linkEffectInfo.effect:SetScale( UI:Vec2( linkEffectInfo.effect:GetScale().x, zoneScale ) )
				
			end

		end
		
	end
	
	local starLinks =
	{
		self.linkStarSolidEffects,
		self.linkStarDashEffects,
	}
	
	for linkTableIdx, links in pairs( starLinks ) do
	
		for linkIdx, linkEffectInfo in pairs( links ) do

			if linkEffectInfo.effect and linkEffectInfo.effectType and linkEffectInfo.beginPosX and linkEffectInfo.beginPosY and linkEffectInfo.endPosX and linkEffectInfo.endPosY then

				local beginPosX, beginPosY	= self:GetMapRealCoord( linkEffectInfo.beginPosX, linkEffectInfo.beginPosY )
				local endPosX, endPosY		= self:GetMapRealCoord( linkEffectInfo.endPosX, linkEffectInfo.endPosY )

				self:SetLinkEffectPos( linkEffectInfo.effect, linkEffectInfo.effectType, beginPosX, beginPosY, endPosX, endPosY, true )
				linkEffectInfo.effect:SetScale( UI:Vec2( linkEffectInfo.effect:GetScale().x, starScale ) )

			end

		end
		
	end
	
	UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorsScale()
	UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorsPos()

end


--
function UI.GameplayPveMapWnd:UpdateZoneWndPos( zoneWnd )

	local zoneName = zoneWnd:GetZoneName()
	if zoneName ~= "" then

		local centerX, centerY = zoneWnd:GetCenter()

		local x_world = SpaceZone[ zoneName ].dbg_pos_x
		local y_world = SpaceZone[ zoneName ].dbg_pos_y

    	local x_rel, y_rel = self:GetMapRealCoord( x_world, y_world )

		x_rel = UI:XRel2Snapped( x_rel - centerX )
		y_rel = UI:YRel2Snapped( y_rel - centerY )

    	zoneWnd:SetPos( x_rel, y_rel )

	end

end


--
function UI.GameplayPveMapWnd:UpdateStarWndPos( starWnd )

	local subRegionName = starWnd:GetSubRegionName()
	if subRegionName ~= "" then

		local centerX, centerY = starWnd:GetCenter()

		local x_world = _G.FreeSpaceMap.SubRegions[ subRegionName ].posX
		local y_world = _G.FreeSpaceMap.SubRegions[ subRegionName ].posY

    	local x_rel, y_rel = self:GetMapRealCoord( x_world, y_world )

		x_rel = UI:XRel2Snapped( x_rel - centerX )
		y_rel = UI:YRel2Snapped( y_rel - centerY )

    	starWnd:SetPos( x_rel, y_rel )

	end

end


--
function UI.GameplayPveMapWnd:UpdateMapWndSize()	

	local size = self:GetMapRelSize()

	UI.GameplayPveMap_MapWnd:SetWidth( size.x )
	UI.GameplayPveMap_MapWnd:SetHeight( size.y )

	UI.GameplayPveMap_MissionsWnd:SetWidth( size.x )
	UI.GameplayPveMap_MissionsWnd:SetHeight( size.y )

	UI.GameplayPveMap_LinksWnd:SetWidth( size.x )
	UI.GameplayPveMap_LinksWnd:SetHeight( size.y )
	
	UI.GameplayPveMap_BfsSectorsWnd:SetWidth( size.x )
	UI.GameplayPveMap_BfsSectorsWnd:SetHeight( size.y )

end


--
function UI.GameplayPveMapWnd:GetMapRelSize()

	return UI:Vec2( self.mapMinSize.x * self.mapScale, self.mapMinSize.y * self.mapScale )	

end


--
function UI.GameplayPveMapWnd:SetMapScaleInternal( scale, bAnimateAlpha )

	if bAnimateAlpha == nil then
		bAnimateAlpha = false
	end

	scale = UI:Clamp( scale, self.mapMinScale, self.mapMaxScale )

	self.mapScale = scale

	self:RecalcMapLayout()

	local alpha_region		= ( self.mapScale >= self.mapScaleThres_region ) and 1 or 0	
	local alpha_zone		= ( self.mapScale >= self.mapScaleThres_zone ) and 1 or 0
	local alpha_zoneName	= ( self.mapScale >= self.mapScaleThres_zoneName ) and 1 or 0
	local alpha_star		= ( self.mapScale >= self.mapScaleThresMin_star and self.mapScale <= self.mapScaleThresMax_star ) and 1 or 0
	local alpha_bfsSectors	= ( self.mapScale >= self.mapScaleThres_bfsSectors ) and 1 or 0

	if bAnimateAlpha then

		self.mapDstScaleAlpha_region		= alpha_region
		self.mapDstScaleAlpha_zone			= alpha_zone
		self.mapDstScaleAlpha_zoneName		= alpha_zoneName
		self.mapDstScaleAlpha_star			= alpha_star
		self.mapDstScaleAlpha_bfsSectors	= alpha_bfsSectors

	else

		self.mapDstScaleAlpha_region		= nil
		self.mapDstScaleAlpha_zone			= nil
		self.mapDstScaleAlpha_zoneName		= nil
		self.mapDstScaleAlpha_star			= nil
		self.mapDstScaleAlpha_bfsSectors	= nil

		self:SetMapScaleAlpha_region( alpha_region )
		self:SetMapScaleAlpha_zone( alpha_zone )
		self:SetMapScaleAlpha_zoneName( alpha_zoneName )
		self:SetMapScaleAlpha_star( alpha_star )
		self:SetMapScaleAlpha_bfsSectors( alpha_bfsSectors )

	end

	self:UpdateMapLayersAlpha()
	self:UpdateMapLayersTexRects()

end


--
function UI.GameplayPveMapWnd:SetMapScaleAlpha_region( alpha )

	self.mapScaleAlpha_region = alpha

	for k, v in pairs( self.subRegionWnds ) do
		v:UpdateScaleAlpha_region()
	end

end


--
function UI.GameplayPveMapWnd:SetMapScaleAlpha_zone( alpha )

	self.mapScaleAlpha_zone = alpha

	for k, v in pairs( self.zoneWnds ) do
		v:UpdateScaleAlpha_zone()
	end
	
	self:SetLinksAlpha( self.linkEffects, alpha )
	self:SetLinksAlpha( self.link2Effects, alpha )
	self:SetLinksAlpha( self.link3Effects, alpha )

end


--
function UI.GameplayPveMapWnd:SetMapScaleAlpha_zoneName( alpha )

	self.mapScaleAlpha_zoneName = alpha

	for k, v in pairs( self.zoneWnds ) do
		v:UpdateScaleAlpha_zoneName()
	end

end


--
function UI.GameplayPveMapWnd:SetMapScaleAlpha_star( alpha )

	self.mapScaleAlpha_star = alpha

	for k, v in pairs( self.starWnds ) do
		v:UpdateScaleAlpha_star()
	end
	
	self:SetLinksAlpha( self.linkStarSolidEffects, alpha )
	self:SetLinksAlpha( self.linkStarDashEffects, alpha )

end


--
function UI.GameplayPveMapWnd:SetMapScaleAlpha_bfsSectors( alpha )

	self.mapScaleAlpha_bfsSectors = alpha
	UI.GameplayPveMap_BfsSectorsWnd:UpdateScaleAlpha_bfsSectors()

end


--
function UI.GameplayPveMapWnd:SetLinksAlpha( links, alpha )

	local alpha255 = alpha * 255
	
	for linkIdx, linkEffectInfo in pairs( links ) do
		if linkEffectInfo.effect then
			linkEffectInfo.effect:SetAlpha( alpha255 )
		end
	end

end


--
function UI.GameplayPveMapWnd:GetMapScaleAlpha_region()

	return self.mapScaleAlpha_region

end


--
function UI.GameplayPveMapWnd:GetMapScaleAlpha_zone()

	return self.mapScaleAlpha_zone

end


--
function UI.GameplayPveMapWnd:GetMapScaleAlpha_zoneName()

	return self.mapScaleAlpha_zoneName

end


--
function UI.GameplayPveMapWnd:GetMapScaleAlpha_star()

	return self.mapScaleAlpha_star

end


--
function UI.GameplayPveMapWnd:GetMapScaleAlpha_bfsSectors()

	return self.mapScaleAlpha_bfsSectors

end


--
function UI.GameplayPveMapWnd:UpdateMapScaleAlphaAnimation( dt )

	if self.mapDstScaleAlpha_region then

		local alpha = self.mapDstScaleAlpha_region

		if self.mapScaleAlpha_region ~= self.mapDstScaleAlpha_region then
        	local alphaDiff	= dt / self.SCALE_ANIM_TIME 
        	alpha = self.mapScaleAlpha_region > self.mapDstScaleAlpha_region and self.mapScaleAlpha_region - alphaDiff or self.mapScaleAlpha_region + alphaDiff
        	alpha = UI:Clamp( alpha, 0, 1 )
		end

    	if math.abs( alpha - self.mapDstScaleAlpha_region ) < 1e-3 then
    		alpha = self.mapDstScaleAlpha_region
    		self.mapDstScaleAlpha_region = nil
    	end

    	self:SetMapScaleAlpha_region( alpha )

	end

	if self.mapDstScaleAlpha_zone then

		local alpha = self.mapDstScaleAlpha_zone

		if self.mapScaleAlpha_zone ~= self.mapDstScaleAlpha_zone then
        	local alphaDiff	= dt / self.SCALE_ANIM_TIME 
        	alpha = self.mapScaleAlpha_zone > self.mapDstScaleAlpha_zone and self.mapScaleAlpha_zone - alphaDiff or self.mapScaleAlpha_zone + alphaDiff
        	alpha = UI:Clamp( alpha, 0, 1 )
		end

    	if math.abs( alpha - self.mapDstScaleAlpha_zone ) < 1e-3 then
    		alpha = self.mapDstScaleAlpha_zone
    		self.mapDstScaleAlpha_zone = nil
    	end

    	self:SetMapScaleAlpha_zone( alpha )

	end

	if self.mapDstScaleAlpha_zoneName then

		local alpha = self.mapDstScaleAlpha_zoneName

		if self.mapScaleAlpha_zoneName ~= self.mapDstScaleAlpha_zoneName then
        	local alphaDiff	= dt / self.SCALE_ANIM_TIME 
        	alpha = self.mapScaleAlpha_zoneName > self.mapDstScaleAlpha_zoneName and self.mapScaleAlpha_zoneName - alphaDiff or self.mapScaleAlpha_zoneName + alphaDiff
        	alpha = UI:Clamp( alpha, 0, 1 )
		end

    	if math.abs( alpha - self.mapDstScaleAlpha_zoneName ) < 1e-3 then
    		alpha = self.mapDstScaleAlpha_zoneName
    		self.mapDstScaleAlpha_zoneName = nil
    	end

    	self:SetMapScaleAlpha_zoneName( alpha )

	end
	
	if self.mapDstScaleAlpha_star then

		local alpha = self.mapDstScaleAlpha_star

		if self.mapScaleAlpha_star ~= self.mapDstScaleAlpha_star then
        	local alphaDiff	= dt / self.SCALE_ANIM_TIME 
        	alpha = self.mapScaleAlpha_star > self.mapDstScaleAlpha_star and self.mapScaleAlpha_star - alphaDiff or self.mapScaleAlpha_star + alphaDiff
        	alpha = UI:Clamp( alpha, 0, 1 )
		end

    	if math.abs( alpha - self.mapDstScaleAlpha_star ) < 1e-3 then
    		alpha = self.mapDstScaleAlpha_star
    		self.mapDstScaleAlpha_star = nil
    	end

    	self:SetMapScaleAlpha_star( alpha )

	end
	
	if self.mapDstScaleAlpha_bfsSectors then

		local alpha = self.mapDstScaleAlpha_bfsSectors

		if self.mapScaleAlpha_bfsSectors ~= self.mapDstScaleAlpha_bfsSectors then
			local alphaDiff	= dt / self.SCALE_ANIM_TIME 
			alpha = self.mapScaleAlpha_bfsSectors > self.mapDstScaleAlpha_bfsSectors and self.mapScaleAlpha_bfsSectors - alphaDiff or self.mapScaleAlpha_bfsSectors + alphaDiff
			alpha = UI:Clamp( alpha, 0, 1 )
		end
	
		if math.abs( alpha - self.mapDstScaleAlpha_bfsSectors ) < 1e-3 then
			alpha = self.mapDstScaleAlpha_bfsSectors
			self.mapDstScaleAlpha_bfsSectors = nil
		end
	
		self:SetMapScaleAlpha_bfsSectors( alpha )

	end

end


--
function UI.GameplayPveMapWnd:ScaleMap( ticks, mouseX, mouseY )

	if not self:CanScaleMap() then
		return
	end

	local worldAnchorPos = self:WindowPos2World( UI:Vec2( mouseX, mouseY ) )

	local scale = self.mapScale
	
	if next( self.mapScaleSteps ) then
	
		if ticks > 0 then
		
			local numScaleSteps = #self.mapScaleSteps
			
			local prevStepIdx = 0
			for stepIdx = numScaleSteps, 1, -1 do
				local stepScale = self.mapScaleSteps[ stepIdx ]
				if scale >= stepScale then
					prevStepIdx = stepIdx
					break
				end
			end
			
			local nextStepIdx = math.min( prevStepIdx + ticks, numScaleSteps )
			scale = self.mapScaleSteps[ nextStepIdx ]
	
		else
		
			local numScaleSteps = #self.mapScaleSteps
			
			local nextStepIdx = numScaleSteps + 1
			for stepIdx = 1, numScaleSteps do
				local stepScale = self.mapScaleSteps[ stepIdx ]
				if stepScale >= scale then
					nextStepIdx = stepIdx
					break
				end
			end
			
			local prevStepIdx = math.max( nextStepIdx + ticks, 1 )
			scale = self.mapScaleSteps[ prevStepIdx ]
		
		end
		
	end
	
	scale = UI:Clamp( scale, self.mapMinScale, self.mapMaxScale )

	if scale == self.mapScale then
		return
	end		

	self:SetMapScaleInternal( scale, true )

	local mapPos = worldAnchorPos - self:Rel2World( self:WindowPos2MapView( UI:Vec2( mouseX, mouseY ) ) )
	self:SetMapPos( mapPos )

	self:SaveMapLayout()

end


--
function UI.GameplayPveMapWnd:CanScaleMap()

	return --[[self.regionName ~= nil and ]] self.regionName ~= "PVP" and not self.bMapMoving

end


--
function UI.GameplayPveMapWnd:CalcFreeSpaceWorldRect()

	local worldRect = UI:Quat( 0, 0, _G.FreeSpaceMap.sizeX, _G.FreeSpaceMap.sizeY )

	local SPACE = 0

	local function fnEmbraceCoord( zoneX, zoneY )

		if zoneX and zoneY then

    		if zoneX - SPACE < worldRect.x then
    			worldRect.z = ( worldRect.x + worldRect.z ) - ( zoneX - SPACE )
    			worldRect.x = zoneX - SPACE
    		end

    		if zoneX + SPACE > worldRect.x + worldRect.z then
    			worldRect.z = ( zoneX + SPACE ) - worldRect.x
    		end

    		if zoneY - SPACE < worldRect.y then
    			worldRect.w = ( worldRect.y + worldRect.w ) - ( zoneY - SPACE )
    			worldRect.y = zoneY - SPACE
    		end

    		if zoneY + SPACE > worldRect.y + worldRect.w then
    			worldRect.w = ( zoneY + SPACE ) - worldRect.y
    		end

		end

	end

	for zoneName, zoneInfo in pairs( _G.SpaceZone ) do
		fnEmbraceCoord( zoneInfo.dbg_pos_x, zoneInfo.dbg_pos_y )
	end

	local aspect = UI:XToAbs( self.mapMinSize.x ) / UI:YToAbs( self.mapMinSize.y )

	local worldWidth = worldRect.w * aspect
	if worldWidth >= worldRect.z then

		worldRect.x = worldRect.x + worldRect.z * 0.5 - worldWidth * 0.5
		worldRect.z = worldWidth

	else

		local worldHeight = worldRect.z / aspect

		worldRect.y = worldRect.y + worldRect.w * 0.5 - worldHeight * 0.5
		worldRect.w = worldHeight

	end

	return worldRect

end


--
function UI.GameplayPveMapWnd:F_OnReleaseMouseCapture()

	self:StopMoveMap()

end


--
function UI.GameplayPveMapWnd:RecalcLayout()

	-- собственный размер
	
	local selfX = self:GetLeft()
	local selfX1 = UI.HangarWnd:XToWindow( 1024 )
	local selfWidth = selfX1 - selfX
	self:SetWidth( selfWidth )

	local selfBtm = self:IsChildOf( UI.HangarWnd ) and UI.HangarWnd:GetBottomPanelY() or 768
	local selfHeight = selfBtm - self:GetTop()
	self:SetHeight( selfHeight )
	
	-- размер и позиция окна маски, внутри которого скроллируется карта

	local viewTop = 0
	local viewHeight = selfHeight - viewTop
	local viewRect = Quat( self:XToWindow( 0 ), viewTop, 1024, viewHeight )
	UI.GameplayPveMap_MapViewWnd:SetRect( viewRect )

	-- размер карты в минимальном масштабе

	self.mapMinSize.x = UI:XToRel( self.mapMinSize_abs.x )
	self.mapMinSize.y = UI:YToRel( self.mapMinSize_abs.y )
	
	-- позиция крутяшки
	
	local loadingEffect = UI:GetEffectFromLayer( self, self.layers.LOADING_EFFECT )
	if loadingEffect then
		loadingEffect:SetPos( UI:Vec2( UI.HangarWnd:XToWindow( 1024 * 0.5 ) - self:GetLeft(), UI.HangarWnd:YToWindow( 768 * 0.5 ) - self:GetTop() ) )
	end

end


--
function UI.GameplayPveMapWnd:InitMap()

	if self.bMapInited then
		return
	end

	self.bMapInited = true

	if type( _G.WorldMap ) ~= "table" then
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap; \"table\" expected, got \"%s\"", type( _G.WorldMap ) )
		return
	end


	-- размер карты в минимальном масштабе

	if type( _G.WorldMap.base_width ) == "number" then
		self.mapMinSize_abs.x = _G.WorldMap.base_width
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.base_width; \"number\" expected, got \"%s\"", type( _G.WorldMap.base_width ) )
	end

	if type( _G.WorldMap.base_height ) == "number" then
		self.mapMinSize_abs.y = _G.WorldMap.base_height
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.base_height; \"number\" expected, got \"%s\"", type( _G.WorldMap.base_height ) )
	end


	-- минимальный и максимальный масштаб

	if type( _G.WorldMap.min_scale ) == "number" then
		self.mapMinScale = _G.WorldMap.min_scale
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.min_scale; \"number\" expected, got \"%s\"", type( _G.WorldMap.min_scale ) )
	end

	if type( _G.WorldMap.max_scale ) == "number" then
		self.mapMaxScale = _G.WorldMap.max_scale
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.max_scale; \"number\" expected, got \"%s\"", type( _G.WorldMap.max_scale ) )
	end
	
	
	-- масштаб по умолчанию
	
	if type( _G.WorldMap.default_scale ) == "number" then
		self.mapDefaultScale = _G.WorldMap.default_scale
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.default_scale; \"number\" expected, got \"%s\"", type( _G.WorldMap.default_scale ) )
	end


	-- шаги скроллирования

	if type( _G.WorldMap.scale_step ) == "table" then
	
		if next( _G.WorldMap.scale_step ) then
		
			local bValid = true
			
			for stepIdx, stepScale in pairs( _G.WorldMap.scale_step ) do
				if type( stepIdx ) ~= "number" or type( stepScale ) ~= "number" then
					sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid format of table _G.WorldMap.scale_step; <number>=<number> expected, got <%s>=<%s>", type( stepIdx ), type( stepScale ) )
					bValid = false
					break
				end
			end
			
			if bValid then
				self.mapScaleSteps = _G.WorldMap.scale_step
			end
		
		else
			sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: empty _G.WorldMap.scale_step" )
		end
		
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_step; \"table\" expected, got \"%s\"", type( _G.WorldMap.scale_step ) )
	end	


	-- значения масштаба, при которых показываются элементы

	if type( _G.WorldMap.scale_threshold_system_picture_min ) == "number" then
		self.mapScaleThres_region = _G.WorldMap.scale_threshold_system_picture_min
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_system_picture_min; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_system_picture_min ) )
	end

	if type( _G.WorldMap.scale_threshold_map_min ) == "number" then
		self.mapScaleThres_zone = _G.WorldMap.scale_threshold_map_min
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_map_min; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_map_min ) )
	end	

	if type( _G.WorldMap.scale_threshold_map_name_min ) == "number" then
		self.mapScaleThres_zoneName = _G.WorldMap.scale_threshold_map_name_min
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_map_name_min; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_map_name_min ) )
	end
	
	if type( _G.WorldMap.scale_threshold_region_min ) == "number" then
		self.mapScaleThres_bfsSectors = _G.WorldMap.scale_threshold_region_min
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_region_min; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_region_min ) )
	end
	
	if type( _G.WorldMap.scale_threshold_system_min ) == "number" then
		self.mapScaleThresMin_star = _G.WorldMap.scale_threshold_system_min
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_system_min; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_system_min ) )
	end
	
	if type( _G.WorldMap.scale_threshold_system_max ) == "number" then
		self.mapScaleThresMax_star = _G.WorldMap.scale_threshold_system_max
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.scale_threshold_system_max; \"number\" expected, got \"%s\"", type( _G.WorldMap.scale_threshold_system_max ) )
	end
	
	if type( _G.WorldMap.system_base_scale ) == "number" then
		self.mapScaleBase_star = _G.WorldMap.system_base_scale
	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.system_base_scale; \"number\" expected, got \"%s\"", type( _G.WorldMap.system_base_scale ) )
	end


	-- слои

	if type( _G.WorldMap.layers ) == "table" then

		local bValidLayerTable = true

		for layerIdx, layerInfo in pairs( _G.WorldMap.layers ) do
			if type( layerIdx ) ~= "number" or type( layerInfo ) ~= "table" then
				sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid format of tablbe _G.WorldMap.layers; <number>=<table> expected, got <%s>=<%s>", type( layerIdx ), type( layerInfo ) )
				bValidLayerTable = false
				break
			end
		end

		if bValidLayerTable then

        	local function fnAlphaInfoSort( ainfo1, ainfo2 )
        		return ainfo1.scale < ainfo2.scale
        	end

    		for layerIdx, layerInfo in ipairs( _G.WorldMap.layers ) do

				local layer =
				{
					texPartSize	= Vec2( 0, 0 ),		-- оазмер части текстуры (все текстуры предполагаются одинакового размера) (разбиение на части необходимо для текстур > 4096 пикс., т.к. они не поддерживаются движком)
					texNumCols	= 1,				-- количество текстур по горизонтали
					texNumRows	= 1,				-- количество текстур по вертикали
					bTexWrap	= false,			-- зацикленная текстура; для таких texNumCols и texNumCols игнорируются
					alphaInfo	= {},				-- правила изменения альфы в зависимости от масштаба
					baseScale	= 1,				-- масштаб, в котором текстура рисуется 1:1
					moveCf		= 1,				-- коэффициент смещения при скроллировании карты
					blendMode	= UI.BM_ALPHA,		-- режим бленда

					texParts	= {},				-- текущие параметры текстурных частей
					alpha		= 0,				-- текущая альфа
				}

				-- содается сраpу первая текстура, и из нее получаются некоторые необходимые параметры				

    			local function fnAddTex( row, col )

        			local texName = string.format( "mapBg_layer%d_%d_%d", layerIdx, row, col )
        			local hTex = UI:GetTex( texName )

    				local tex =
    				{
    					hTex	= hTex,
    					row		= row,
    					col		= col,
    					rect	= Quat( 0, 0, 0, 0 ),	-- вычисляется в зависимости от текущего масштаба и смещения
    					u0		= 0,					-- для зацикленных текстур вычисляется в зависимости от текущего масштаба и смещения
    					v0		= 0,
    					u1		= 1,
    					v1		= 1,
    				}

    				table.insert( layer.texParts, tex )

    				return tex

    			end

				local tex = fnAddTex( 1, 1 )


				-- texPartSize, bTexWrap

				local texRc = UI:GetResourceByHandle( tex.hTex )
				if texRc then

					-- texPartSize

    				layer.texPartSize.x	= texRc:GetTextureWidth() * ( texRc:GetU1() - texRc:GetU0() )
    				layer.texPartSize.y	= texRc:GetTextureHeight() * ( texRc:GetV1() - texRc:GetV0() )

					-- bTexWrap

					local bHorzWrap = texRc:IsHorizontalWrap()
					local bVertWrap = texRc:IsVerticalWrap()

					if bHorzWrap == bVertWrap then
						layer.bTexWrap = bHorzWrap
					else
						sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: unhandled case - texture wrap only on one axis" )
					end

					if not layer.bTexWrap then

        				-- texNumCols, texNumRows

                    	if type( layerInfo.width_in_parts ) == "number" then
        					layer.texNumCols = layerInfo.width_in_parts
        				else
                    		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].width_in_parts; \"number\" expected, got \"%s\"", layerIdx, type( layerInfo.width_in_parts ) )
        				end

                    	if type( layerInfo.height_in_parts ) == "number" then
        					layer.texNumRows = layerInfo.height_in_parts
        				else
                    		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].height_in_parts; \"number\" expected, got \"%s\"", layerIdx, type( layerInfo.height_in_parts ) )
        				end

        				-- texParts

                    	for row = 1, layer.texNumRows do
                    		for col = 1, layer.texNumCols do
								if row ~= 1 or col ~= 1 then	-- самая первая текстура уже создана выше
									fnAddTex( row, col )
								end
                			end
                		end

					end

				end


				-- alphaInfo

            	local alphaInfo = layerInfo.scale_alpha
            	if type( alphaInfo ) == "table" then

					local bValidAlphaTable = true

                	for aidx, ainfo in pairs( alphaInfo ) do

                		if type( aidx ) ~= "number" or type( ainfo ) ~= "table" then
                			sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid format of tablbe _G.WorldMap.layers[%d].scale_alpha; <number>=<table> expected, got <%s>=<%s>", layerIdx, type( aidx ), type( ainfo ) )
							bValidAlphaTable = false
                			break
                		end

						if type( ainfo.scale ) ~= "number" then
            				sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].scale_alpha[%d].scale; \"number\" expected, got \"%s\"", layerIdx, aidx, type( ainfo.scale ) )
							bValidAlphaTable = false
                			break
						end

						if type( ainfo.alpha ) ~= "number" then
            				sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].scale_alpha[%d].alpha; \"number\" expected, got \"%s\"", layerIdx, aidx, type( ainfo.alpha ) )
							bValidAlphaTable = false
                			break
						end

                	end

					if bValidAlphaTable then
						layer.alphaInfo = UI:CopyTable2( alphaInfo )
						table.sort( layer.alphaInfo, fnAlphaInfoSort )
					end					

				else
            		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].scale_alpha; \"table\" expected, got \"%s\"", layerIdx, type( alphaInfo ) )
            	end


				-- baseScale

            	if type( layerInfo.base_scale ) == "number" then
					layer.baseScale = layerInfo.base_scale
				else
            		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].base_scale; \"number\" expected, got \"%s\"", layerIdx, type( layerInfo.base_scale ) )
				end


				-- moveCf

            	if type( layerInfo.parallax ) == "number" then
					layer.moveCf = layerInfo.parallax
				else
            		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].parallax; \"number\" expected, got \"%s\"", layerIdx, type( layerInfo.parallax ) )
				end


				-- blendMode

				if layerInfo.blend ~= nil then
                	if type( layerInfo.blend ) == "number" then
    					layer.blendMode = layerInfo.blend
    				else
                		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers[%d].blend; \"number\" or \"nil\" expected, got \"%s\"", layerIdx, type( layerInfo.blend ) )
    				end
				end


				table.insert( self.mapLayers, layer )

    		end

		end

	else
		sys.log( "UI.GameplayPveMapWnd:InitMap()[ERROR]: invalid type of _G.WorldMap.layers; \"table\" expected, got \"%s\"", type( _G.WorldMap.layers ) )
	end

end


--
function UI.GameplayPveMapWnd:UpdateMapLayersAlpha()

	for layerIdx, layer in pairs( self.mapLayers ) do

		local alpha = 0

		for aidx, ainfo in ipairs( layer.alphaInfo ) do

			if self.mapScale == ainfo.scale then
				alpha = ainfo.alpha
				break
			end

			if self.mapScale < ainfo.scale then

				local ainfo_prev = layer.alphaInfo[ aidx - 1 ]
				if ainfo_prev then
					local t = ainfo.scale ~= ainfo_prev.scale and ( self.mapScale - ainfo_prev.scale ) / ( ainfo.scale - ainfo_prev.scale ) or 1
					alpha = UI:Lerp( ainfo_prev.alpha, ainfo.alpha, t )
				else
					alpha = ainfo.alpha
				end

				break

			end

			alpha = ainfo.alpha

		end

		layer.alpha = alpha

	end

end


--
function UI.GameplayPveMapWnd:UpdateMapLayersTexRects()

	local mapRect		= UI.GameplayPveMap_MapWnd:GetRect()		-- (UI.GameplayPveMap_MapWnd является чайлдом UI.GameplayPveMap_MapViewWnd)
	local viewRect		= UI.GameplayPveMap_MapViewWnd:GetRect()
	local mapCenteredX	= ( viewRect.z - mapRect.z ) / 2
	local mapCenteredY	= ( viewRect.w - mapRect.w ) / 2
	local mapDeltaX		= mapRect.x - mapCenteredX
	local mapDeltaY		= mapRect.y - mapCenteredY

	for layerIdx, layer in pairs( self.mapLayers ) do

		if layer.bTexWrap then

			local tex = layer.texParts[ 1 ]
			if tex then

    			tex.rect = Quat( -mapRect.x, -mapRect.y, viewRect.z, viewRect.w )	-- на весь вьюпорт

				-- текстурные координаты

        		local texPartWidth	= UI:XToRel( layer.texPartSize.x, false )
        		local texPartHeight	= UI:YToRel( layer.texPartSize.y, false )
        		texPartWidth	= layer.baseScale ~= 0 and texPartWidth / layer.baseScale * self.mapScale or 0
        		texPartHeight	= layer.baseScale ~= 0 and texPartHeight / layer.baseScale * self.mapScale or 0

    			local centerTexPartX = ( mapRect.z - texPartWidth ) / 2
    			local centerTexPartY = ( mapRect.w - texPartHeight ) / 2
        		centerTexPartX  = centerTexPartX - ( mapDeltaX - mapDeltaX * layer.moveCf )
        		centerTexPartY = centerTexPartY - ( mapDeltaY - mapDeltaY * layer.moveCf )

				tex.u0 = -( mapRect.x + centerTexPartX ) / texPartWidth
				tex.v0 = -( centerTexPartY + mapRect.y ) / texPartHeight

				local texCoordWidth		= tex.rect.z / texPartWidth
				local texCoordHeight	= tex.rect.w / texPartHeight
				tex.u1 = tex.u0 + texCoordWidth
				tex.v1 = tex.v0 + texCoordHeight

			end			

		else

    		local texPartWidth	= UI:XToRel( layer.texPartSize.x, false )
    		local texPartHeight	= UI:YToRel( layer.texPartSize.y, false )
    		texPartWidth	= layer.baseScale ~= 0 and texPartWidth / layer.baseScale * self.mapScale or 0
    		texPartHeight	= layer.baseScale ~= 0 and texPartHeight / layer.baseScale * self.mapScale or 0

    		local bigTexWidth	= texPartWidth * layer.texNumCols
    		local bigTexHeight	= texPartHeight * layer.texNumRows

    		local bigTexX = ( mapRect.z - bigTexWidth ) / 2
    		local bigTexY = ( mapRect.w - bigTexHeight ) / 2
        	bigTexX = bigTexX - ( mapDeltaX - mapDeltaX * layer.moveCf )
        	bigTexY = bigTexY - ( mapDeltaY - mapDeltaY * layer.moveCf )

    		for texIdx, tex in pairs( layer.texParts ) do

        		tex.rect.x = bigTexX + ( tex.col - 1 ) * texPartWidth
        		tex.rect.y = bigTexY + ( tex.row - 1 ) * texPartHeight
        		tex.rect.z = texPartWidth
        		tex.rect.w = texPartHeight

    		end

		end

	end

end


--
function UI.GameplayPveMapWnd:UpdateMapModeBtn()

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		self:AddChild( UI.GameplayPveMap_MapModeBtn )
	    UI.GameplayPveMap_MapModeBtn:UpdateMode()
	else
		UI.GameplayPveMap_MapModeBtn:UnlinkFromParent()
	end
	
	self:RecalcBtnsPositions()

end


--
function UI.GameplayPveMapWnd:CloseAndContinue()

	if not self:IsOnScreen() then
		return
	end

	if self:IsChildOf( UI.HangarWnd ) then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )

	elseif self:IsChildOf( UI.GameplayPveMapHudContainerWnd ) then
		UI.GameplayPveMapHudContainerWnd:Hide()

	else
		self:Unlink()
	end

end


--
function UI.GameplayPveMapWnd:UpdateQuestsWnd()

	if self:CanShowQuests() then
		self:AddChild( UI.GameplayPveMap_QuestsWnd )
	else
		UI.GameplayPveMap_QuestsWnd:UnlinkFromParent()
	end

end


-- можно ли принципиально показывать квесты в данном режиме карты или по другим обстоятельствам; сейчас можно всегда
function UI.GameplayPveMapWnd:CanShowQuests()

	return UI:GetPlayerAccountRank() >= UI.rankLocks.quests or self:HasQuests()	-- #0106339

end


--
function UI.GameplayPveMapWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not self.bSavingGameState then
		_G.Profile:Save()
	end
	
	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
	
		if self.hMsgJumpError ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgJumpError )
		end
		
		UI.GameplayPveMap_BuyWnd:Hide()

	end
	
	self.hMsgJumpError = UI.INVALID_UI_HANDLE
	
	self.lastMapClickPos = nil
	self.lastWndHandleClicked = UI.INVALID_UI_HANDLE

end


--
function UI.GameplayPveMapWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgJumpError then

		self.hMsgJumpError = UI.INVALID_UI_HANDLE
		
		if self:IsOnScreen() then
			self:CloseAndContinue()
		end

	end

end


--
function UI.GameplayPveMapWnd:LaunchBuyWnd( mode, data )

	UI.GameplayPveMap_BuyWnd:Setup( mode, nil, data )
	UI.GameplayPveMap_BuyWnd:Show()
	UI:PlayGlobalSound( UI.sounds.btnClick )

end


--
function UI.GameplayPveMapWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )
	
	self:UpdateZOrder()

end


--
function UI.GameplayPveMapWnd:UpdateZOrder()

	if UI.GameplayPveMap_QuestsWnd and UI.GameplayPveMap_QuestsWnd.w and UI.GameplayPveMap_QuestsWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayPveMap_QuestsWnd )
	end

end


--
function UI.GameplayPveMapWnd:DetectQuests()

	local allQuests					= {}
	local manualOfferQuestsByGroup	= {}

	local bIsCustomEvent	= _G.MasterServer_IsEventCustomEvent()
	local bWasInMajorTeam	= _G.MasterServer_IsInMajorLeague()	-- достигал ли игрок когда-либо "первой лиги", это не равнозначно MasterServer_GetLeagueTeam().major, в котором текущее состояние
	local playerAccountRank	= UI:GetPlayerAccountRank()
	local playerAccountExp	= UI:GetPlayerAccountExp()

	local function fnMakeEmptyQuestInfo()

		local questInfo =
		{
			questId				= -1,
			questType			= -1,
			bTaken				= false,
			bCompleted			= false,
			bCanBeCompleted		= false,
			bCanBeTaken			= false,
			progress			= 0,
			timeDisable			= UI.INVALID_U64_ID,
			groupId				= -1,

			-- для bManualOffer
			bFit				= true,
			unfitReasonsMask	= 0,
			bVisible			= false,
			bDisabled			= false,
			groupQuests			= nil,
		}

		return questInfo

	end

	-- регулярные квесты

	for questId, questInfo in pairs( _G.Quests ) do

		local bFit				= true		
		local unfitReasonsMask	= 0

		local bRecurrent		= UI:IsQuestRecurrent( questId )
		local bManualOffer		= bRecurrent and UI:IsQuestManuallyOfferable( questId )
		local bInterval			= UI:IsQuestInterval( questId )
		local bCustomEventQuest	= UI:GetQuestTag( questId ) == ai.QuestTag.CUSTOM_EVENT
		local bTaken			= UI:IsQuestTaken( questId )
		local category			= UI:GetQuestCategory( questId )
		local groupId			= UI:GetQuestGroup( questId )

		local bCompleted = false
		if bRecurrent or bInterval then
			bCompleted = not bTaken and UI:GetQuestNumCompletions( questId ) >= UI:GetQuestMaxCompletions( questId )
		else
			bCompleted = UI:IsQuestCompleted( questId )
		end
		
		-- неподходящая категория
		if bFit or bManualOffer then
			if UI:Val2Key( _G.QuestCategory, category ) == "" then
				bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.WRONG_CATEGORY )
			end
		end

		-- нет ивента
		if bFit or bManualOffer then
    		if bCustomEventQuest and not bIsCustomEvent then
    			bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.NO_EVENT )
    		end
		end

    	-- для опенворлдовских квестов - запрещен вылет в опенворлд
    	if bFit or bManualOffer then
    		if UI:IsQuestOpenWorld( questId ) and not _G.MasterServer_HasFreeSpaceAccess() then
    			bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.OPEN_WORLD_DISABLED )
    		end
    	end
		
    	-- для опенворлдовских квестов - запрещены квесты в локации - SC-112151, SC-113605, SC-113723
    	if bFit or bManualOffer then
			if UI:IsQuestOpenWorld( questId ) and UI:IsQuestLockedByZone( questId ) then
    			bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.FORCE_DISABLED )
    		end
    	end

		-- квест задисэйблен дизайнерами
    	if bFit or bManualOffer then
    		if UI:IsQuestDisabled( questId ) then
    			bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.FORCE_DISABLED )
    		end
    	end
		
		-- для интервальных квестов - неподходящее время (не показываются даже взятые квесты - #0087726)
		if bFit or bManualOffer then
			if bInterval and UI.serverData.intervalQuestsById[ questId ] == nil then
				bFit = false
				unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.WRONG_INTERVAL )
			end
		end

		-- показываются взятые и доступные для взятия

        if not bTaken then

			-- завершен
			if bFit or bManualOffer then
				if bCompleted then
					bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.COMPLETED )
				end
			end

			-- не выполнены предшествующие в цепочке квесты
        	if bFit or bManualOffer then
        		if not UI:IsTutotialQuestPrevCompleted( questId ) then
        			bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.PREV_QUESTS_NOT_COMPLETED )
        		end
        	end

			-- для групповых квестов - не предложен для взятия
			if bFit or bManualOffer then
            	if bRecurrent and not bManualOffer and UI.serverData.offeredQuestsById[ questId ] == nil then
            		bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.NOT_OFFERED )
				end
			end

        	-- слишком низкий ранг игрока
        	if bFit or bManualOffer then
				local questMinRank = UI:GetQuestMinAccountRank( questId )
				if questMinRank ~= -1 and playerAccountRank < questMinRank then
        			bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.LOW_RANK )
        		end
        	end

			-- слишком высокий ранг игрока
        	if bFit or bManualOffer then
				local questMaxRank = UI:GetQuestMaxAccountRank( questId )
				if questMaxRank ~= -1 and playerAccountRank > questMaxRank then
        			bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.HIGH_RANK )
        		end
        	end
			
			-- для квеста на поднятие ранга - не хватает опыта на поднятие ранга (#0090799)
			if bFit or bManualOffer then
			
				if UI:IsQuestRankUp( questId ) then
				
					local qustUnlockRank = UI:GetQuestMinAccountRank( questId )
					if qustUnlockRank ~= -1 then
					
						if playerAccountRank == qustUnlockRank then
					
							if playerAccountExp < UI:GetPlayerAccountRankExpCost( qustUnlockRank + 1 ) then
								bFit = false
								unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.RANK_UP_LOW_EXP )
							end
							
						end
						
					else
						sys.log( "UI.GameplayPveMapWnd:DetectQuests()[ERROR]: cannot find min unlock rank for quest %d", questId )
					end

				end
				
			end

        	-- у игрока есть корабль, наличие которого делает квест недоступным для взятия
        	if bFit or bManualOffer then
        		local shipDefName = UI:GetQuestLockingShip( questId )
        		if shipDefName ~= "" then
        			if UI:GetShipItemByDef( shipDefName, true ) ~= nil then
        				bFit = false    					
						unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.LOCKING_SHIP )
        			end
        		end
        	end

        	-- взять квест для "первой лиги" можно только если игрок когда-либо достигал ее (#0060294,комм.(0262106))
        	if bFit or bManualOffer then
        		if UI:IsQuestForMajorTeamOnly( questId ) and not bWasInMajorTeam then
        			bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.NO_MAJOR_LEAGUE )
        		end
        	end

			-- для ивентовых квестов - не подходящий день
			if bFit or bManualOffer then
        		if bCustomEventQuest and not UI:IsCustomEventQuestAvailableByDay( questId ) then
    				bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.WRONG_EVENT_DAY )
				end
			end
			
			-- для мануал-оффер квестов - группа на кулдауне
			if bManualOffer then
				if UI:GetQuestGroupCooldown( groupId ) > 0 then
					bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.GROUP_COOLDOWN )
				end
			end
			
			-- для мануал-оффер квестов - в группе уже взят квест (можно одновременно взять только один)
			if bManualOffer then
				if UI:HasGroupActiveQuest( groupId ) then
					bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.GROUP_HAS_ACTIVE_QUEST )
				end
			end
			
			-- для квеста требуется, чтобы была активна в расписании определенная пве-карта
			if bFit or bManualOffer then
			
				local requiredLevelName = UI:GetQuestRequiredPveScheduledLevel( questId )
				if requiredLevelName ~= "" then
				
					local bIsInSchedule = false
					
					local scheduledLevelNames = _G.MasterServer_GetPveScheduledLevels()
					for levelIdx, levelName in pairs( scheduledLevelNames ) do
						if levelName == requiredLevelName then
							bIsInSchedule = true
							break
						end
					end
					
					if not bIsInSchedule then
						bFit = false
						unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.PVE_LEVEL_NOT_IN_SCHEDULE )
					end
					
				end
				
			end

			-- не активен указанный квест в acceptable_during
			if bFit or bManualOffer then
				if UI:IsQuestUnavailable( questId ) then
					bFit = false
					unfitReasonsMask = UI:BitSet( unfitReasonsMask, self.questUnfitReasons.UNAVAILABLE )
				end
			end
			
		end

		if not bFit and unfitReasonsMask == 0 then
			sys.log( "UI.GameplayPveMapWnd:DetectQuests()[ERROR]: unfitReasonsMask not set" )
		end

		if bFit or bManualOffer then
		
			local questInfo = fnMakeEmptyQuestInfo()

			questInfo.questId			= questId
			questInfo.questType			= UI.questTypes.REGULAR
			questInfo.bTaken			= bTaken
			questInfo.bCompleted		= bCompleted
			questInfo.bCanBeCompleted	= bTaken and UI:CanQuestBeCompleted( questId )
			questInfo.bCanBeTaken		= bFit and not bTaken and not bCompleted
			questInfo.progress			= 0 -- см. ниже
			questInfo.timeDisable		= bInterval and UI:GetIntervalQuestDisableTime( questId ) or UI.INVALID_U64_ID
			questInfo.groupId			= bManualOffer and groupId or -1

			-- для bManualOffer
			questInfo.bFit				= bFit
			questInfo.unfitReasonsMask	= unfitReasonsMask
			questInfo.bVisible			= true		-- определяется позднее
			questInfo.bDisabled			= false		-- определяется позднее
			questInfo.groupQuests		= nil		-- определяется позднее

			if bTaken then
				local curVal = UI:GetQuestTaskCurVal( questId )
				local maxVal = UI:GetQuestTaskMaxVal( questId, UI:GetQuestStage( questId ) )
				questInfo.progress = maxVal ~= 0 and curVal / maxVal or 0
			end

			if bManualOffer then

    			if not manualOfferQuestsByGroup[ questInfo.groupId ] then
    				manualOfferQuestsByGroup[ questInfo.groupId ] = {}
    			end

    			-- в allQuests будет добавлено позднее, после обработки состояния всех членов группы
    			table.insert( manualOfferQuestsByGroup[ questInfo.groupId ], questInfo )

			else
			
				local questsForCategory = allQuests[ category ]
				if questsForCategory == nil then
					questsForCategory = {}
					allQuests[ category ] = questsForCategory
				end

				table.insert( questsForCategory, questInfo )
				
			end			

		end

	end


	-- Обработка мануал-оффекр групп. Особенности:
	-- некоторые квесты в группе могут не отображаться или быть задисэйбленными;
	-- если все невидимые или задисэйбленные, то группа не отображается;
	-- если квесты из группы входят в разные категории, то группа отображается целиком во всех этих катеориях (в лог пишется ошибка);
	-- в общий список для сортировки добавляется только один квест из группы (взятый, если есть, либо видимый меньший по id, если нет взятого).

	-- вообще не показывать в списке
	local invisibleReasons =
	{
		self.questUnfitReasons.WRONG_CATEGORY,
		self.questUnfitReasons.HIGH_RANK,
		self.questUnfitReasons.NO_EVENT,
		self.questUnfitReasons.OPEN_WORLD_DISABLED,
		self.questUnfitReasons.FORCE_DISABLED,
		self.questUnfitReasons.COMPLETED,
		self.questUnfitReasons.PREV_QUESTS_NOT_COMPLETED,
		self.questUnfitReasons.NOT_OFFERED,
		self.questUnfitReasons.WRONG_INTERVAL,
		self.questUnfitReasons.WRONG_EVENT_DAY,
		self.questUnfitReasons.PVE_LEVEL_NOT_IN_SCHEDULE,
		self.questUnfitReasons.UNAVAILABLE,
	}

	-- показывать, но задисэйбленным
	local disableReasons =
	{
		self.questUnfitReasons.LOW_RANK,
		self.questUnfitReasons.LOCKING_SHIP,
		self.questUnfitReasons.NO_MAJOR_LEAGUE,
		self.questUnfitReasons.GROUP_COOLDOWN,
		self.questUnfitReasons.GROUP_HAS_ACTIVE_QUEST,
	}

	for groupId, qroupQuests in pairs( manualOfferQuestsByGroup ) do

		local bHasValidQuest	= false
		local groupCategories	= {}

		for questIdx, questInfo in pairs( qroupQuests ) do
		
			local category = UI:GetQuestCategory( questInfo.questId )
			groupCategories[ category ] = true

			if questInfo.bFit then			

				bHasValidQuest = true

			else

				for reasonIdx, reason in pairs( invisibleReasons ) do
					if UI:BitTst( questInfo.unfitReasonsMask, reason ) then
						questInfo.bVisible = false
						break
					end
				end

				if questInfo.bVisible then
					for reasonIdx, reason in pairs( disableReasons ) do
						if UI:BitTst( questInfo.unfitReasonsMask, reason ) then
							questInfo.bDisabled = true
							break
						end
					end
				end

    			if questInfo.bVisible and not questInfo.bDisabled then

    				bHasValidQuest = true

					if questInfo.unfitReasonsMask ~= 0 then
						sys.log( "UI.GameplayPveMapWnd:DetectQuests()[ERROR]: unhandled reason for quest to unfit" )
					end

    			end

			end

		end
		
		if UI:GetTableLength( groupCategories ) > 1 then
		
			local strQuests = ""
			for questIdx, questInfo in pairs( qroupQuests ) do
				strQuests =  string.format( "%s%s%d", strQuests, strQuests ~= "" and ", " or "", questInfo.questId )
			end
			
			sys.log( "UI.GameplayPveMapWnd:DetectQuests()[ERROR]: different categories for quests in the same manual-offer group (quests: %s)", strQuests )
			
		end

		if bHasValidQuest then

			local questToSort = nil

			local takenQuest = nil
			for idx, questInfo in pairs( qroupQuests ) do
				if questInfo.bTaken then
					takenQuest = questInfo
					break
				end
			end

			if takenQuest then
				questToSort = takenQuest
			else
				local minQuest = nil
				for idx, questInfo in pairs( qroupQuests ) do
					if questInfo.bVisible and ( not minQuest or questInfo.questId < minQuest.questId ) then
						minQuest = questInfo
					end
				end
				questToSort = minQuest
			end			

			if questToSort then

				questToSort.groupQuests = {}

				for groupQuestIdx, groupQuestInfo in pairs( qroupQuests ) do
					if groupQuestInfo.bVisible then
						table.insert( questToSort.groupQuests, groupQuestInfo )
					end
				end

				local function fnSortGroupQuests( questInfo1, questInfo2 )
					return questInfo1.questId < questInfo2.questId
				end

				table.sort( questToSort.groupQuests, fnSortGroupQuests )
				
				for category, dummy in pairs( groupCategories ) do
				
					if UI:Val2Key( _G.QuestCategory, category ) ~= "" then
				
						local questsForCategory = allQuests[ category ]
						if questsForCategory == nil then
							questsForCategory = {}
							allQuests[ category ] = questsForCategory
						end
						
						table.insert( questsForCategory, questToSort )
						
					end

				end

			else
				sys.log( "UI.GameplayPveMapWnd:DetectQuests()[ERROR]: cannot be here - cannot find quest to sort" )
			end			
			
		end		

	end


	-- корабельные квесты

	for shipQuestIdx, shipQuestData in pairs( UI.serverData.shipQuests ) do

    	local questId = shipQuestData.id
		
		if UI:Val2Key( _G.QuestCategory, UI:GetShipQuestCategory( questId ) ) ~= "" then
		
			local bTaken	= UI:IsShipQuestTaken( questId )
			local questInfo	= fnMakeEmptyQuestInfo()

			questInfo.questId			= questId
			questInfo.questType			= UI.questTypes.SHIP
			questInfo.bTaken			= bTaken
			questInfo.bCompleted		= false
			questInfo.bCanBeCompleted	= bTaken and UI:IsShipQuestCompleted( questId )
			questInfo.bCanBeTaken		= not bTaken and UI:IsShipQuestAvailable( questId )
			questInfo.progress			= 0 -- см. ниже

			if bTaken then
				local maxVal = UI:GetShipQuestMaxTime( questId )
				local curVal = maxVal - UI:GetShipQuestTimeLeft( questId )
				questInfo.progress = maxVal ~= 0 and curVal / maxVal or 0
			end
			
			local category = UI:GetShipQuestCategory( questId )
			local questsForCategory = allQuests[ category ]
			if questsForCategory == nil then
				questsForCategory = {}
				allQuests[ category ] = questsForCategory
			end

			table.insert( questsForCategory, questInfo )
			
		end

	end


	-- сортировка

	local function l_fnSort( questInfo1, questInfo2 )

		--[[ порядок сортировки:

			- взятые гoтовые
			- не взятые
			- взятые не готовые

			- в каждой группе (взятые гoтовые/не взятые/взятые не готовые) - по типу квеста: сначала корабельные, потом обычные	-- #0087507,комм.(0392447)
			
			- среди взятых не готовых - по прогрессу выполнения (чем больше выполнено, тем выше квест)
			- среди взятых готовых и не взятых - по времени деактивации (чем меньше осталось времени, тем выше квест)

			- при совпадении всех остальных параметров - по id
		]]


		-- взятые гoтовые
		if questInfo1.bCanBeCompleted ~= questInfo2.bCanBeCompleted then
			return questInfo1.bCanBeCompleted
		end

		-- не взятые
		if questInfo1.bTaken ~= questInfo2.bTaken then
			return not questInfo1.bTaken
		end

		-- в каждой группе (взятые гoтовые/не взятые/взятые не готовые) - по типу квеста: сначала корабельные, потом обычные	-- #0087507,комм.(0392447)
		if questInfo1.questType ~= questInfo2.questType then 
			return questInfo1.questType == UI.questTypes.SHIP
		end

		-- среди взятых не готовых - по прогрессу выполнения (чем больше выполнено, тем выше квест)
		if questInfo1.bTaken and not questInfo1.bCanBeCompleted then
    		if questInfo1.progress ~= questInfo2.progress then
    			return questInfo1.progress > questInfo2.progress
    		end
		end
	
		-- среди взятых готовых и не взятых - по времени деактивации (чем меньше осталось времени, тем выше квест)
		if not questInfo1.bTaken or questInfo1.bTaken and questInfo1.bCanBeCompleted then

    		if questInfo1.timeDisable ~= questInfo2.timeDisable then

				-- время деактивации 0 означает, что квест не деактивируется по времени, такие рисуются в конце
				if questInfo1.timeDisable == UI.INVALID_U64_ID then
					return false
				elseif questInfo2.timeDisable == UI.INVALID_U64_ID then
					return true
    			else
					return questInfo1.timeDisable < questInfo2.timeDisable
				end

    		end

		end

		-- по id
		return questInfo1.questId < questInfo2.questId		

	end

	for category, questsForCategory in pairs( allQuests ) do
		table.sort( questsForCategory, l_fnSort )
	end

	return allQuests

end


--
function UI.GameplayPveMapWnd:DetectQuestsBlink()

	local questsBlink = {}
	
	for category, questsForCategory in pairs( self.quests ) do
	
		local bNeedBlink = false

		for _questIdx, _questInfo in pairs( questsForCategory ) do
			
			local questsInSlot = {}
			if _questInfo.groupId == -1 then
				questsInSlot = { _questInfo }
			else
				questsInSlot = _questInfo.groupQuests
			end
			
			for questIdx, questInfo in pairs( questsInSlot ) do
		
				if questInfo.bTaken then
				
					if questInfo.bCanBeCompleted then
						bNeedBlink = true
					end
					
				else
				
					if questInfo.bCanBeTaken then
						
						-- #0087997,комм.(0398030) - если в квестах есть репик, но нельзя репикнуть (но он все еще непринят), то не моргать ромбиком из-за такого квеста
						
						local bCanRefusePrincipal =
							questInfo.questType == UI.questTypes.REGULAR
							and UI:IsQuestRecurrent( questInfo.questId )
							and not UI:IsQuestUnchangeable( questInfo.questId )
							and not UI:IsQuestTheOnlyInGroup( questInfo.questId )
							
						if bCanRefusePrincipal then
							
							local bCanRefuseNow = UI:IsQuestManuallyOfferable( questInfo.questId ) or _G.MasterServer_CanChangeQuest()
							
							if bCanRefuseNow then
								bNeedBlink = true
							end
						
						else
							bNeedBlink = true
						end
					
						if bCanRefuse then
							bNeedBlink = true
						end
						
					end
					
				end
				
				if bNeedBlink then
					break
				end
				
			end
			
			if bNeedBlink then
				break
			end
		
		end
		
		questsBlink[ category ] = bNeedBlink
		
	end
	
	return questsBlink
	
end


--
function UI.GameplayPveMapWnd:RecalcBtnsPositions()

	-- Кнопки расположены в порядке слева направо: 1) текущая позиция, 2) переключение режима, 3) квесты.
	-- Кнопок переключения режима и квестов может не быть, кнопка текущей позиции дожна сместиться вправо.
	
	local controlsEffect = UI:GetEffectFromLayer( self, self.layers.CONTROLS_EFFECT )
	
	local questsBtnPos				= controlsEffect and controlsEffect:GetObjPos( "quest_btn" ) or Vec2( 0, 0 )	-- #0107058 кнопка квестов убрана, но старая логика сохранена, чтобы не ломать позицию
	local questsBtnSize				= controlsEffect and controlsEffect:GetObjSize( "quest_btn" ) or Vec2( 0, 0 )
	local currentLocationBtnPos		= controlsEffect and controlsEffect:GetObjPos( "current_btn" ) or Vec2( 0, 0 )
	local currentLocationBtnWidth	= UI.GameplayPveMap_CurrentLocationBtn:GetWidth()
	local mapModeBtnPos				= controlsEffect and controlsEffect:GetObjPos( "clan_war" ) or Vec2( 0, 0 )
	local mapModeBtnWidth			= UI.GameplayPveMap_MapModeBtn:GetWidth()
	local controlsEffectPos			= controlsEffect:GetPos()

	local constrolsRight	= questsBtnPos.x + questsBtnSize.x + controlsEffectPos.x
	local space				= mapModeBtnPos.x - ( currentLocationBtnPos.x + currentLocationBtnWidth )
	
	-- кнопка переключения режима
	
	if UI.GameplayPveMap_MapModeBtn:IsChildOf( self ) then
	
		local x = constrolsRight - mapModeBtnWidth
		UI.GameplayPveMap_MapModeBtn:SetPos( x, mapModeBtnPos.y + controlsEffectPos.y )
		
	end
	
	-- кнопка текущей позиции
	
	if UI.GameplayPveMap_CurrentLocationBtn:IsChildOf( self ) then
	
		local x = 0
	
		if UI.GameplayPveMap_MapModeBtn:IsChildOf( self ) then
			x = UI.GameplayPveMap_MapModeBtn:GetLeft() - space - currentLocationBtnWidth
		else
			x = constrolsRight - currentLocationBtnWidth
		end
		
		UI.GameplayPveMap_CurrentLocationBtn:SetPos( x, currentLocationBtnPos.y + controlsEffectPos.y )
	
	end

end


--
function UI.GameplayPveMapWnd:CheckBlinkZoneOnQuestTake( questId )
	
	local transferZoneId = UI:GetQuestZoneToTransfer( questId )
	if transferZoneId ~= -1 then
	
		for idx, zoneWnd in pairs( self.zoneWnds ) do
		
			if zoneWnd:GetZoneId() == transferZoneId then
				zoneWnd:Blink()
				break
			end
			
		end
		
	end
	
end


--
function UI.GameplayPveMapWnd:RequestZoneEvents()
	
	if self.zoneEventsRequestId == 0 then
		self.zoneEventsRequestId = _G.MasterServer_ZonesLuaActiveEventsRequest()
	end
	
end


--
function UI.GameplayPveMapWnd:UpdateZoneEventsControls()

	if self.mode == self.modes.FREE_SPACE then
		for idx, zoneWnd in pairs( self.zoneWnds ) do
			zoneWnd:OnZoneEventsChanged()
		end
		
	elseif self.mode == self.modes.BATTLE_FOR_SECTOR then
		UI.GameplayPveMap_BfsSectorsWnd:OnZoneEventsChanged()
		UI.GameplayPveMap_BfsSectorStatsWnd:Update()
	end

end


--
function UI.GameplayPveMapWnd:F_OnEventSaveUiState()

	UI.store.GameplayPveMapWnd =
	{
		zoneEventsRequestId	= self.zoneEventsRequestId,
	}

end


--
function UI.GameplayPveMapWnd:F_OnEventRestoreUiState()

	if UI.store.GameplayPveMapWnd then
	
		self.zoneEventsRequestId = UI.store.GameplayPveMapWnd.zoneEventsRequestId
		
		UI.store.GameplayPveMapWnd = nil
		
	end

end


-- -----------------------------------------------------------------
-- UI.GameplayPveMap_MapViewWnd
-- -----------------------------------------------------------------

UI.GameplayPveMap_MapViewWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_MapViewWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "GameplayPveMap_MapViewWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- BLACK_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "Black",
		}
	},

	children = { "UI.GameplayPveMap_MapWnd" }
}


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.GameplayPveMap_MapViewWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.GameplayPveMap_MapViewWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.GameplayPveMap_MapViewWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = UI.GameplayPveMapWnd:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- -----------------------------------------------------------------
-- UI.GameplayPveMap_MapWnd
-- -----------------------------------------------------------------

UI.GameplayPveMap_MapWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_MapWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "GameplayPveMap_MapWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	},

	children = { "UI.GameplayPveMap_BfsSectorsWnd", "UI.GameplayPveMap_LinksWnd", "UI.GameplayPveMap_MissionsWnd" }
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMap_MapWnd.layers =
{
	BG		= 0,
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMap_MapWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	if UI:IsWndKindOf( child, "GameplayPveMap_SubRegionWnd" ) then
		self:MoveChildBefore( child, UI.GameplayPveMap_LinksWnd )
	end

	self:MoveChildToLastPosition( UI.GameplayPveMap_MissionsWnd )

end


--
function UI.GameplayPveMap_MapWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local space = 100
	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0 - space, clipY0 - space, clipWidth + space * 2, clipHeight + space * 2 ) )	                                                                              	
	
end


--
function UI.GameplayPveMap_MapWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.BG then
		self:DrawBg()
	end	

end


--
function UI.GameplayPveMap_MapWnd:DrawBg()

	-- #0082921,комм.(0364139)
	-- текстура жожет быть больше формальной области, отведенной на фон карты в данном масштабе,
	-- она не обрезается этой областью, а обрезается только вьюпортом карты (максимальной возможной областью, где карта может показываться)

	local clipRect = UI.GameplayPveMapWnd:ToScreen( UI.GameplayPveMap_MapViewWnd:GetRect() )
		
	for layerIdx = #UI.GameplayPveMapWnd.mapLayers, 1, -1 do

		local layer = UI.GameplayPveMapWnd.mapLayers[ layerIdx ]
		if layer.alpha > 0 then

    		for texIdx, tex in ipairs( layer.texParts ) do

				local color = UI.WHITE_COLOR

				if layer.blendMode == UI.BM_ALPHA then
					color = UI:SetAlpha( UI.WHITE_COLOR, layer.alpha )

				elseif layer.blendMode == UI.BM_COLOR then
					color = UI:ARGB( layer.alpha, layer.alpha, layer.alpha, layer.alpha )

				elseif layer.blendMode == UI.BM_SCREEN then
					-- TODO: как определять цвет при бленде UI.BM_SCREEN? 
					color = UI:SetAlpha( UI.WHITE_COLOR, layer.alpha )
				end

				if layer.blendMode ~= UI.BM_ALPHA then
					UI.drawer:SetBlendMode( layer.blendMode )
				end
				
            	UI.drawer:DrawImagedRect(
               		self:XToScreen( tex.rect.x ), self:YToScreen( tex.rect.y ), tex.rect.z, tex.rect.w,
               		clipRect.x, clipRect.y, clipRect.z, clipRect.w,
            		tex.hTex,
               		color,
               		tex.u0, tex.v0, tex.u1, tex.v1,
            		false
            	)		

				if layer.blendMode ~= UI.BM_ALPHA then
					UI.drawer:SetBlendMode( UI.BM_ALPHA )
				end

    		end

		end

	end

end


-- -----------------------------------------------------------------
-- UI.MapZone_TooltipWnd
-- -----------------------------------------------------------------

UI.MapZone_TooltipWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.MapZone_TooltipWnd.def =
{
	className = "Wnd",
	props =
	{
		name			= "MapZone_TooltipWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
		isPrototype		= true,
	},
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,
			effects =
			{{
				defName 			= "gameplay_map_pve_sector_tooltip",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
           				objName		= "title",
           				layer		= "UI.MapZone_TooltipWnd.layers.TITLE_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "map_ico",
           				layer		= "UI.MapZone_TooltipWnd.layers.MAP_EFFECT",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "text_ship_1",
           				layer		= "UI.MapZone_TooltipWnd.layers.DESC_SHORT_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "reward_descript",
           				layer		= "UI.MapZone_TooltipWnd.layers.INFO_METATEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "loading_small",
           				layer		= "UI.MapZone_TooltipWnd.layers.WAIT_EFFECT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "text_13",
           				layer		= "UI.MapZone_TooltipWnd.layers.OWNER_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           		}
           	}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		-- DESC_SHORT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			--text			= "^pve_map_hangar_tooltip_desc_short"
		},
		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bfs_element_tooltip_spacer",
				defaultAnimation	= "idle",
			}}
		},
		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bfs_element_tooltip_spacer",
				defaultAnimation	= "idle",
			}}
		},
		-- SEPARATOR_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bfs_element_tooltip_spacer",
				defaultAnimation	= "idle",
			}}
		},
		-- SEPARATOR_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bfs_element_tooltip_spacer",
				defaultAnimation	= "idle",
			}}
		},
		-- SEPARATOR_5_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bfs_element_tooltip_spacer",
				defaultAnimation	= "idle",
			}}
		},
		-- MAP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_scenario_slot",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "map_ico",	
						layer		= "UI.MapZone_TooltipWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "rank",	
						layer		= "UI.MapZone_TooltipWnd.layers.RANK_EFFECT",
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
				defName				= "saleadvert_wnd_tab_btn",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "ico13",
						layer		= "UI.MapZone_TooltipWnd.layers.IMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- IMAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_map_ico",
				defaultAnimation    = "idle",
			}}
		},
		-- RANK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_map_pve_scenario_slot_rank",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "title_10",
						layer		= "UI.MapZone_TooltipWnd.layers.RANK_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- RANK_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		-- OWNER_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		-- INFO_METATEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "hangar_waitCircleSmall",
				defaultAnimation    = "idle",
			}}
		},
		-- WAIT_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "hangar_waitCircleSmall",
				defaultAnimation    = "idle",
			}}
		},
	}
}


-- -----------------------------------
-- consts
-- -----------------------------------
--
UI.MapZone_TooltipWnd.layers = 
{
	MAIN_EFFECT				= 0,
	TITLE_TEXT				= 1,
	DESC_SHORT_TEXT			= 2,
	SEPARATOR_1_EFFECT		= 3,
	SEPARATOR_2_EFFECT		= 4,
	SEPARATOR_3_EFFECT		= 5,
	SEPARATOR_4_EFFECT		= 6,
	SEPARATOR_5_EFFECT		= 7, 
	MAP_EFFECT 				= 8, 
	ICO_EFFECT 				= 9, 
	IMAGE_EFFECT 			= 10,
	RANK_EFFECT  			= 11,
	RANK_TEXT 				= 12,
	OWNER_TEXT 				= 13,
	INFO_METATEXT 			= 14,
	WAIT_EFFECT 			= 15,
	WAIT_2_EFFECT 			= 16,
}

UI.MapZone_TooltipWnd.NUM_SEPARATORS = 5

-- -----------------------------------
-- vars
-- -----------------------------------
--
UI.MapZone_TooltipWnd.data = nil
UI.MapZone_TooltipWnd.name = nil
UI.MapZone_TooltipWnd.bCanFly = nil
UI.MapZone_TooltipWnd.requestId = nil
UI.MapZone_TooltipWnd.emblemWnd = nil
UI.MapZone_TooltipWnd.metaText = nil
UI.MapZone_TooltipWnd.metaTextPos = Vec2( 0, 0 )
UI.MapZone_TooltipWnd.metaText2 = nil
UI.MapZone_TooltipWnd.metaText2Pos = Vec2( 0, 0 )
UI.MapZone_TooltipWnd.clanNameRequestId = nil
UI.MapZone_TooltipWnd.rivalsListWnd = nil
UI.MapZone_TooltipWnd.myRivalSlotWnd = nil

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.MapZone_TooltipWnd:Setup( _data )
	--self:Reset()
	if type( _data ) ~= "table" then
		sys.log( "UI.MapZone_TooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end
	self.data = UI:CopyTable2( _data )
	self.name = _data.name
	self.bCanFly = _data.bCanFly
	self:FullUpdate()
	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		self:PlaceOnScreen()
	end
end

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MapZone_TooltipWnd:MasterServer_OnUniverseGet( result, requestId )
	if self:IsOnScreen() and requestId == self.requestId then
		self.requestId = nil
		self:FullUpdate()
		self:PlaceOnScreen()
	end
end

--
function UI.MapZone_TooltipWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if self:IsOnScreen() then

    	if self.clanNameRequestId == requestId or self.waitClanNameResolve then
    		if self.clanNameRequestId == requestId then
    			self.clanNameRequestId = nil
    		else
    			self.waitClanNameResolve = false
    		end
    		self:FullUpdate()
    		self:PlaceOnScreen()

		else

			if self.rivalsListWnd:IsChildOf( self ) then

				for recordIdx = 1, self.rivalsListWnd:GetNumRecords() do

					local data = self.rivalsListWnd:GetRecordData( recordIdx )
					if data.cid == cid then

    					local slotWnd = self.rivalsListWnd:GetButtonForRecord( recordIdx )
    					if slotWnd then
    						slotWnd:OnClanNameChanged()
    					end

						break

					end

				end

			end

			if self.myRivalSlotWnd:IsChildOf( self ) and cid == UI.Clan:GetCid() then
				self.myRivalSlotWnd:OnClanNameChanged()
			end
			
		end

	end

end

--
function UI.MapZone_TooltipWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.emblemWnd = UI:CreateChildWnd( self, UI.GameplayMapGalaxyClanOwnerShifted, "_clan" )
	self.emblemWnd.showDefaultEmblem = true
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.INFO_METATEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.INFO_METATEXT ), self:GetLayerHeight( self.layers.INFO_METATEXT ) ), true )
	self.metaText:SetParentWindow( self )
	self.metaText2 = UI.MetaText.GetNewInstance()
	self.metaText2:InitFromLayer( self, self.layers.INFO_METATEXT ) 
	self.metaText2:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.INFO_METATEXT ), self:GetLayerHeight( self.layers.INFO_METATEXT ) ), true )
	self.metaText2:SetParentWindow( self )

	self.rivalsListWnd = UI:CreateChildWnd( self, UI.MapZoneTooltip_BfsRivalsListWnd, "" )
	self.myRivalSlotWnd = UI:CreateChildWnd( self, UI.MapZoneTooltip_BfsRivalSlotWnd, "" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.rivalsListWnd:SetLeft( mainEffect:GetObjPos( "applicants_list" ).x )
	self.myRivalSlotWnd:SetLeft( mainEffect:GetObjPos( "applicants_slot" ).x )	

end

--
function UI.MapZone_TooltipWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	if self.metaText2 then
		self.metaText2:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.MapZone_TooltipWnd:Reset()
	self.waitClanNameResolve = false
	self:SetLayerVisible( false, self.layers.RANK_EFFECT )
	self:SetLayerVisible( false, self.layers.RANK_TEXT )
	for sepIdx = 1, self.NUM_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end
	self:SetLayerVisible( false, self.layers.OWNER_TEXT )
	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_2_EFFECT )
	self.metaText:SetText( "", true )
	self.metaText2:SetText( "", true )
	self.emblemWnd:UnlinkFromParent()
	self.rivalsListWnd:Clear()
	self.rivalsListWnd:UnlinkFromParent()
	self.myRivalSlotWnd:Reset()
	self.myRivalSlotWnd:UnlinkFromParent()

end

--
function UI.MapZone_TooltipWnd:FullUpdate()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local width = mainEffect:GetObjSize( "self" ).x
	local height = mainEffect:GetObjSize( "dist_min" ).y
	local minHeight = mainEffect:GetObjSize( "dist_min" ).y
	local maxHeight = mainEffect:GetObjSize( "self" ).y
	self:Reset()
	local zone = SpaceZone[ self.name ]
	if zone then
		self:SetText( UI:GetLevelLocalizedName( zone.level_name ), self.layers.TITLE_TEXT )	
		self:SetText( UI:GetZoneDescShort( self.name, self:GetColor( self.layers.DESC_SHORT_TEXT ), true ), self.layers.DESC_SHORT_TEXT )
		local icoEffect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )
		icoEffect:SetSpriteTexture( "ico", UI:GetMapIco( zone.level_name ) )
		if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and zone.conflictIntervalStart and zone.universe_zone and not zone.clan_ship_race then
			self:SetLayerVisible( true, self.layers.RANK_EFFECT )
			self:SetLayerVisible( true, self.layers.RANK_TEXT )
			
			local conflictTime = UI:GetZoneNextConflictTime( zone.zone_id )
			local strConflictTime = UI.GameplayPveMapWnd:ZoneConflictTime2Str( conflictTime )
			self:SetText( strConflictTime, self.layers.RANK_TEXT )
			
		end

		if UI.Universe:IsInited() then
			if zone.universe_zone then

				local owner = UI.Universe:GetSectorOwner( zone.zone_id )
				if owner then
					if owner ~= UI.INVALID_U64_ID then

        				-- иконка клана и текст справа от нее (название клана, влияние зоны, жетоны)

        				local blockText = ""
        				local bWait = false

						local nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( owner )
						if bCached then
							self:ShowSeparator( height )
							UI:AddChildAndLink( self, self.emblemWnd, mainEffect, "clan_ico", UI.EffectAnimParams.POS )
							self.emblemWnd:SetClan( owner, self )
							local nameText = UI:GetStringByName( "gameplay_map_bfs_sector_zone_owner" )
							nameText = string.gsub( nameText, "%$clan_name%$", UI:GetFullClanName( owner ) )
							blockText = string.format( "%s%s%s", blockText, blockText ~= "" and "|" or "", nameText )
						else
							self.clanNameRequestId = requestId
							bWait = true
						end

            			if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and not zone.station_race and not zone.clan_ship_race then

        					local sector = UI.Universe:GetSectorById( zone.zone_id )
        					if sector then
							
								-- влияние владельца
								
        						if sector.ownerPressureReal ~= nil then

        							local influenceText = UI:GetStringByName( "tooltip_gameplay_map_bfs_health" )
        							local color = sector.ownerPressureReal > 0 and 0xff00ff00 or 0xffff0000
        							local colorStr = UI:Color2Str( color )

									if sector.ownerPressureVirtual and sector.ownerPressureVirtual > 0 then
										local strVal = string.format( "%s (+%s)", tostring( math.ceil( sector.ownerPressureReal ) ), tostring( math.ceil( sector.ownerPressureVirtual ) ) )
        								influenceText = string.gsub( influenceText, "%$val%$", colorStr..strVal )
									else
										influenceText = string.gsub( influenceText, "%$val%$", colorStr..tostring( math.ceil( sector.ownerPressureReal ) ) )
									end
        							influenceText = influenceText.."@ffffffff"

        							blockText = string.format( "%s%s%s", blockText, blockText ~= "" and "|" or "", influenceText )

        						end
								
								-- retentionFactor
								
								local retention = UI:Round( ( sector.retentionFactor or 0 ) * 100 )
								local strRetentionVal = tostring( retention )
								
								local strRetention = UI:GetStringByName( "tooltip_gameplay_map_bfs_retention" )
								
								local numSubst = 0
								strRetention, numSubst = string.gsub( strRetention, "%$val%$", strRetentionVal )
								
								if numSubst == 0 then
									sys.log( "UI.MapZone_TooltipWnd:FullUpdate()[ERROR]: cannot find placeholder \"$val$\" in string \"tooltip_gameplay_map_bfs_retention\"" )
									strRetention = string.format( "[INVALID STRING] Retention: %s", strRetentionVal )
								end
								
								blockText = string.format( "%s%s%s", blockText, blockText ~= "" and "|" or "", strRetention )
								
        					end

						end

        				if blockText ~= "" then

        					self:SetLayerVisible( true, self.layers.OWNER_TEXT )
        					self:SetText( blockText, self.layers.OWNER_TEXT )

                        	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.OWNER_TEXT ), 10000000 )
                            local textHeight = _G.MeasureText(
                           		blockText,
                           		self:GetFont( self.layers.OWNER_TEXT ),
                            	formatRect,
                           		self:GetTextFormatFlags( self.layers.OWNER_TEXT ),
                            	formatRect ).w

        					self:SetLayerHeight( textHeight, self.layers.OWNER_TEXT )

        					local blockBtm = mainEffect:GetObjPos( "text_13" ).y + textHeight
        					if self.emblemWnd:IsChildOf( self ) then
        						blockBtm = math.max( blockBtm, self.emblemWnd:GetTop() + self.emblemWnd:GetHeight() )
        					end

        					local space_block_sep = mainEffect:GetObjPos( "spacer_3" ).y - ( mainEffect:GetObjPos( "text_13" ).y + mainEffect:GetObjSize( "text_13" ).y )
        					height = blockBtm + space_block_sep

        				elseif bWait then 

        					self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
        					height = mainEffect:GetObjPos( "text_13" ).y + mainEffect:GetObjSize( "text_13" ).y

        				end

					end

				end

			end
		else
			self.requestId = UI.Universe:Request( true )
		end


		-- список кланов, влияющих на зону

		if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and not zone.station_race and not zone.clan_ship_race then

			local rivals = UI.Universe:GetRivalsForZone( zone.zone_id )

			if rivals and next( rivals ) then

				self:ShowSeparator( height )

				self:AddChild( self.rivalsListWnd )

				local space_sep_rivalsTop = mainEffect:GetObjPos( "applicants_list" ).y - mainEffect:GetObjPos( "spacer_3" ).y
				local rivalsY = height + space_sep_rivalsTop
				self.rivalsListWnd:SetTop( rivalsY )

				rivals = UI:CopyTable2( rivals )

				local function fnSort( rival1, rival2 )

					if rival1.pressureReal ~= rival2.pressureReal then
						return rival1.pressureReal > rival2.pressureReal
					end

					return rival1.cid < rival2.cid

				end

				table.sort( rivals, fnSort )

				local RIVALS_TOP_NUM = self.rivalsListWnd.MAX_SLOTS

				for rivalIdx = 1, math.min( #rivals, RIVALS_TOP_NUM ) do

					local rival = rivals[ rivalIdx ] 

					local data =
					{
						place		= rivalIdx,
						cid			= rival.cid,
						pointsReal	= rival.pressureReal,
						pointsVirt	= rival.pressureVirtual,
					}

					self.rivalsListWnd:AddRecord( data )

				end				

				local space_rivalsBtm_sep = mainEffect:GetObjPos( "spacer_1_54" ).y - ( mainEffect:GetObjPos( "applicants_list" ).y + UI:GetEffectFromLayer( self.rivalsListWnd, self.rivalsListWnd.layers.MAIN_EFFECT ):GetObjSize( "self" ).y )
				height = self.rivalsListWnd:GetTop() + self.rivalsListWnd:GetHeight() + space_rivalsBtm_sep


				-- слот для влияния моего клана, если он не вошел в топ-5

				local myCid = UI.Clan:IsInClan() and UI.Clan:GetCid() or UI.INVALID_U64_ID
				if myCid ~= UI.INVALID_U64_ID and UI.Universe:GetSectorOwner( zone.zone_id ) ~= myCid then

					local myRivalIdx = -1

					for rivalIdx, rival in pairs( rivals ) do
						if rival.cid == myCid then
							myRivalIdx = rivalIdx
							break
						end
					end

					if myRivalIdx == -1 or myRivalIdx > RIVALS_TOP_NUM then

						self:ShowSeparator( height )

        				self:AddChild( self.myRivalSlotWnd )

        				local space_sep_myRivalSlotTop = mainEffect:GetObjPos( "applicants_slot" ).y - mainEffect:GetObjPos( "spacer_1_54" ).y
        				local myRivalSlotY = height + space_sep_myRivalSlotTop
        				self.myRivalSlotWnd:SetTop( myRivalSlotY )

    					local data =
    					{
    						place		= myRivalIdx,
    						cid			= myCid,
    						pointsReal	= myRivalIdx ~= -1 and rivals[ myRivalIdx ].pressureReal or 0,
    						pointsVirt	= myRivalIdx ~= -1 and rivals[ myRivalIdx ].pressureVirtual or 0,
    					}

    					self.myRivalSlotWnd:UpdateForData( data )

						local space_myRivalSlotBtm_sep = mainEffect:GetObjPos( "spacer_1_55" ).y - ( mainEffect:GetObjPos( "applicants_slot" ).y + self.myRivalSlotWnd:GetHeight() )
						height = self.myRivalSlotWnd:GetTop() + self.myRivalSlotWnd:GetHeight() + space_myRivalSlotBtm_sep

					end

				end				

			end

		end

		-- common vars
		self:ShowSeparator( height )
		local space = mainEffect:GetObjPos( "reward_descript" ).y - mainEffect:GetObjPos( "spacer_1_55" ).y
		self.metaTextPos.x = mainEffect:GetObjPos( "reward_descript" ).x
		self.metaTextPos.y = height + space
		height = height + space
		local text = ""
		
		do

			if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR or UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.FREE_SPACE then
				-- BFS element
				if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and zone.universe_zone and not zone.clan_ship_race then

					local rewardText = self:GetBfsRewardString( zone )
					text = text..rewardText
					
					-- ранг кораблей
					local rankRestrictionText = UI:GetStringByName( "gameplay_map_bfs_sector_tier_restriction" )

					-- SC-111154 - про ранги
					local minRank, maxRank = UI:GetZoneShipRanks( UI:ZoneName2Id( self.name ) )
					
					local strRanks = string.format( "%d-%d", minRank, maxRank )
					rankRestrictionText = string.gsub( rankRestrictionText, "%$ranks%$", strRanks )
					text = text.."||"..rankRestrictionText
				
					-- используемое оборудование SC-111565 SC-111565#focus=streamItem-4-579349.0-0
					if zone.universe_type == _G.MasterServer.UniverseType.UT_BFS then
					
						local tier = zone.tier	-- для подстроки "Дредноуты используют оборудование $tier$ уровня" по-прежнему исопльзуется тир, а не ранги ( SC-111154#focus=streamItem-4-572742.0-0 )
						if not tier then
							tier = -1
							sys.log( "UI.MapZone_TooltipWnd:FullUpdate()[ERROR]: can't find field tier for zone SpaceZone[ %s ]", self.name )
						end
						
						local strTier = tostring( tier )
						local strDrednoughtEquipment = UI:GetStringByName( "gameplay_map_bfs_dreadnought" )
						
						local numSubst = 0
						strDrednoughtEquipment, numSubst = string.gsub( strDrednoughtEquipment, "%$tier%$", strTier )
						
						if numSubst == 0 then
							sys.log( "UI.MapZone_TooltipWnd:FullUpdate()[ERROR]: cannot find placeholde '$tier$' in string 'gameplay_map_bfs_dreadnought'" )
							strDrednoughtEquipment = string.format( "[INVALID STRING] Drednought equipment tier: %s", strTier )
						end
						
						text = text.."|"..strDrednoughtEquipment
					
					elseif zone.universe_type == _G.MasterServer.UniverseType.UT_ARENA then
					
						local strPlayerEquipment = UI:GetStringByName( "gameplay_map_bfs_player" )
						text = text.."|"..strPlayerEquipment
					
					else
						sys.log( "UI.MapZone_TooltipWnd:FullUpdate()[ERROR]: unhandled zone 'universe_type' %s for zone %s", tostring( zone.universe_type ), self.name )
					end

					self.metaText:SetText( text, true )
					local formatRect	= self:GetLayerRect( self.layers.INFO_METATEXT )
					local hFont			= self:GetFont( self.layers.INFO_METATEXT )
					local fontHeight	= _G.GetFontSymbolHeight( hFont )
					local formatFlags = self:GetTextFormatFlags( self.layers.INFO_METATEXT )
					local textSize = _G.MeasureText( self.metaText:GetFormattedText(), hFont, formatRect, formatFlags, formatRect )
					height = height + textSize.w + space

				else
					-- common elements in FREE_SPACE mode
					if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.FREE_SPACE then
						
						-- лорное описание
						text = UI:GetLevelDesc( zone.level_name )
						text = string.format( "%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), text )
						
						self.metaText:SetText( text, true )
						local formatRect	= self:GetLayerRect( self.layers.INFO_METATEXT )
						formatRect.w = 100000
						local hFont			= self:GetFont( self.layers.INFO_METATEXT )
						local fontHeight	= _G.GetFontSymbolHeight( hFont )
						local formatFlags = self:GetTextFormatFlags( self.layers.INFO_METATEXT )
						local textSize = _G.MeasureText( text, hFont, formatRect, formatFlags, formatRect )
						height = height + textSize.w + space
						
						-- стоимость перелета
						
						local costText = ""
						local costFromatFlags = self:GetTextFormatFlags( self.layers.INFO_METATEXT )
						
						if self.bCanFly then

							local priceInfo = UI:GetTransferToZonePrice( zone.zone_id )
							
							local strPriceVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.INFO_METATEXT ), false, true, true, nil )
							costText = string.format( "%s %s", UI:GetStringByName( "pve_map_hangar_tooltip_price" ), strPriceVal )
							
							costFromatFlags = FONT.TF_TOP + FONT.TF_RIGHT + FONT.TF_SINGLELINE + FONT.TF_NOCLIP
							
						else
						
							if UI:IsZoneAllowedForTransfer( zone.zone_id ) then
								
								local zoneRank = UI:GetZoneUnlockRank( zone.zone_id )
								if zoneRank > UI:GetPlayerAccountRank() then
								
									local strRankVal = tostring( zoneRank )
									
									costText = UI:GetStringByName( "pve_map_hangar_tooltip_price_rankRequired" )
									
									local numSubst = 0
									costText, numSubst = string.gsub( costText, "%$rank%$", strRankVal )
									
									if numSubst == 0 then
										sys.log( "UI.MapZone_TooltipWnd:FullUpdate()[ERROR]: cannot find placeholder \"$rank$\" in string \"pve_map_hangar_tooltip_price_rankRequired\"" )
										costText = string.format( "[INVALID STRING] Rank required: %s", strRankVal )
									end
									
									costText = string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), costText )
									
								end
								
							end
							
							costFromatFlags = FONT.TF_TOP + FONT.TF_RIGHT + FONT.TF_WORDBREAK
							
						end
						
						if costText ~= "" then
						
							self:ShowSeparator( height )
							self.metaText2Pos.x = mainEffect:GetObjPos( "reward_descript" ).x
							self.metaText2Pos.y = height + space
							height = height + space
						
							self.metaText2:SetFormatFlags( costFromatFlags, false )
							self.metaText2:SetText( costText, true )
							textSize = _G.MeasureText( self.metaText2:GetFormattedText(), hFont, formatRect, costFromatFlags, formatRect )
							height = height + textSize.w + space
							
						end
						
					else
						self.metaText:SetText( UI:GetStringByName( "gameplay_map_pve_zone_non_bfs" ), true )
						local formatRect	= self:GetLayerRect( self.layers.INFO_METATEXT )
						local hFont			= self:GetFont( self.layers.INFO_METATEXT )
						local fontHeight	= _G.GetFontSymbolHeight( hFont )
						local formatFlags = self:GetTextFormatFlags( self.layers.INFO_METATEXT )
						local textSize = _G.MeasureText( text, hFont, formatRect, formatFlags, formatRect )
						height = height + textSize.w + space
					end
				end
			end
		end
	end
	self:SetWidth( width )
	self:SetHeight( height )
	mainEffect:SetAnimationTime( ( height - minHeight ) / ( maxHeight - minHeight ) )
	self:UpdateEffects()
end


--
function UI.MapZone_TooltipWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	-- в этой строке может быть время до окончания смены режима civilian, его надо апдейтить каждый кадр
	local zone = SpaceZone[ self.name ]
	if zone then
		self:SetText( UI:GetZoneDescShort( self.name, self:GetColor( self.layers.DESC_SHORT_TEXT ), true ), self.layers.DESC_SHORT_TEXT )
	end

end


--
function UI.MapZone_TooltipWnd:PlaceOnScreen()
	UI:PlaceTooltipOnScreen( self, self.data )
end

--
function UI.MapZone_TooltipWnd:UpdateEffects()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end
	for sepIdx = 1, self.NUM_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:Update( 0 )
		end
	end
	local waitEffect = UI:GetEffectFromLayer( self, self.layers.WAIT_2_EFFECT )
	waitEffect:Update( 0 )
	local x = self:XToScreen( self.metaTextPos.x )
	local y = self:YToScreen( self.metaTextPos.y )
	self.metaText:SetScreenOrg( UI:Vec2( x, y ) )
	local x = self:XToScreen( self.metaText2Pos.x )
	local y = self:YToScreen( self.metaText2Pos.y )
	self.metaText2:SetScreenOrg( UI:Vec2( x, y ) )
end

--
function UI.MapZone_TooltipWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateEffects()
end

--
function UI.MapZone_TooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
	self:OnScreenPosChanged( oldScreenX, oldScreenY )
	if self:GetNumLayers() == 0 then
		return
	end
	if self:IsOnScreen() then
		self:UpdateEffects()
	end
end

--
function UI.MapZone_TooltipWnd:ShowSeparator( y )

	local freeSepIdx = -1

	for sepIdx = 1, self.NUM_SEPARATORS do
		if not self:IsLayerVisible( self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 ) then
			freeSepIdx = sepIdx
			break
		end
	end

	if freeSepIdx  ~= -1 then

    	local sepLayer = self.layers.SEPARATOR_1_EFFECT + freeSepIdx - 1
    	self:SetLayerVisible( true, sepLayer )
    	local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
    	if sepEffect then
    		local pos = sepEffect:GetPos()
    		pos.y = y
    		sepEffect:SetPos( pos )
    	end

	else
		sys.log( "UI.MapZone_TooltipWnd:ShowSeparator()[ERROR]: no free separator" )
	end

end

--
function UI.MapZone_TooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.INFO_METATEXT then
		self.metaText:Draw( 0, 0, 1024, 768 )
		self.metaText2:Draw( 0, 0, 1024, 768 )
	end
end


--
function UI.MapZone_TooltipWnd:GetBfsRewardString( zone )

	local strRewardInfo = UI:GetStringByName( "tooltip_gameplay_map_bfs_coinsDesc" )


	local strRewardVal = "unknown reward"

	if zone.ownage_reward_resource then

		local strName = "unknown resource"

		if type( zone.ownage_reward_resource ) == "string" then

			strName = UI:GetEntityLocalizedNameByDef( zone.ownage_reward_resource, true, false, true, false )

			local baseColor = self.metaText:GetColor()
			strName = string.format( "%s%s", strName, UI:Color2Str( baseColor ) )

		else
			sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: invalid type of _G.SpaceZone.%s.ownage_reward_resource; \"string\" expected, got \"%s\"", self.name, type( zone.ownage_reward_resource ) )
		end

		local amount = 0

		if type( zone.ownage_reward_amount ) == "number" then
			amount = zone.ownage_reward_amount
		else
			sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: invalid type of _G.SpaceZone.%s.ownage_reward_amount; \"number\" expected, got \"%s\"", self.name, type( zone.ownage_reward_amount ) )
		end

		if amount > 1 then
			local strAmount = UI:Num2StrSeparatedBy3( amount )
			strRewardVal = string.format( "%s[%s]", strName, strAmount )
		else
			strRewardVal = strName
		end			

	elseif zone.ownage_reward_type then

		local strIco = "unknown money type"

		if type( zone.ownage_reward_type ) == "number" then

        	if zone.ownage_reward_type == _G.GameStore.CreditsType.CT_CREDITS then
        		strIco = "$credits_big$"

        	elseif zone.ownage_reward_type == _G.GameStore.CreditsType.CT_GOLD then
        		strIco = "$gold_big$"

        	elseif zone.ownage_reward_type == _G.GameStore.CreditsType.CT_TOKENS then
        		strIco = "$tokens_big$"

			else
        		sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: unhandled money type %d in _G.SpaceZone.%s.ownage_reward_type", zone.ownage_reward_type, self.name )
			end

		else
			sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: invalid type of _G.SpaceZone.%s.ownage_reward_type; \"number\" expected, got \"%s\"", self.name, type( zone.ownage_reward_type ) )
		end

		local amount = 0

		if type( zone.ownage_reward_amount ) == "number" then
			amount = zone.ownage_reward_amount
		else
			sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: invalid type of _G.SpaceZone.%s.ownage_reward_amount; \"number\" expected, got \"%s\"", self.name, type( zone.ownage_reward_amount ) )
		end

		local strAmount = UI:Num2StrSeparatedBy3( amount )

		strRewardVal = string.format( "%s%s", strAmount, strIco )

	else
		sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: no reward for zone \"%s\"", self.name )
	end	


	local tSubst =
	{
		reward		= strRewardVal,
	}

	local numSubst = 0
	strRewardInfo, numSubst = string.gsub( strRewardInfo, "%$([%w_]+)%$", tSubst )

	if numSubst < 1 then
		sys.log( "UI.MapZone_TooltipWnd:GetBfsRewardString()[ERROR]: invalid placeholders in string \"tooltip_gameplay_map_bfs_coinsDesc\"; \"$reward$\" expected" )
		strRewardInfo = string.format( "[INVALID_STRING]Reward with coins: %s", strRewardVal )
	end

	return strRewardInfo

end

-- -------------------------------------------------------------------
-- UI.MapZoneTooltip_BfsRivalsListWnd
-- -------------------------------------------------------------------

UI.MapZoneTooltip_BfsRivalsListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.MapZoneTooltip_BfsRivalsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",
	
	props =
	{
		name		= "MapZoneTooltip_BfsRivalsListWnd",
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
				defName 			= "gameplay_map_pve_sector_tooltip_rivalsList",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},

           			{
						objName		= "title",
						layer		= "UI.MapZoneTooltip_BfsRivalsListWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tooltip_gameplay_map_bfs_rivals" )
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.MapZoneTooltip_BfsRivalsListWnd:AddRecord( data )

	UI.ButtonsListWnd.AddRecord( self, data )

	self:RecalcLayout()

end


--
function UI.MapZoneTooltip_BfsRivalsListWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self:RecalcLayout()

end


-- ---------------------------
-- const
-- ---------------------------

UI.MapZoneTooltip_BfsRivalsListWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.MapZoneTooltip_BfsRivalsListWnd.btnPrototypeName		= "MapZoneTooltip_BfsRivalSlotWnd"
UI.MapZoneTooltip_BfsRivalsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.MapZoneTooltip_BfsRivalsListWnd.MAX_SLOTS			= 5

UI.MapZoneTooltip_BfsRivalsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.MapZoneTooltip_BfsRivalsListWnd:RecalcLayout()

	local selfHeight = 0

	local numSlots = self:GetNumVisibleSlots()
	if numSlots > 0 then
		local lastSlotWnd = self:GetButtonForSlot( numSlots )
		if lastSlotWnd then
			selfHeight = lastSlotWnd:GetTop() + lastSlotWnd:GetHeight()
		end
	end

	self:SetHeight( selfHeight )

end


-- -------------------------------------------------------------------
-- UI.MapZoneTooltip_BfsRivalSlotWnd
-- -------------------------------------------------------------------

UI.MapZoneTooltip_BfsRivalSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.MapZoneTooltip_BfsRivalSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",
	
	props =
	{
		name		= "MapZoneTooltip_BfsRivalSlotWnd",
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
				defName 			= "gameplay_map_pve_sector_tooltip_rivalSlot",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},

           			{
						objName		= "num",
						layer		= "UI.MapZoneTooltip_BfsRivalSlotWnd.layers.PLACE",
						animParams	= UI.EffectAnimParams.ALL,
					},

           			{
						objName		= "name",
						layer		= "UI.MapZoneTooltip_BfsRivalSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

           			{
						objName		= "vol",
						layer		= "UI.MapZoneTooltip_BfsRivalSlotWnd.layers.POINTS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PLACE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- POINTS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.MapZoneTooltip_BfsRivalSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self:SetText( "", self.layers.PLACE )
	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.POINTS )

end


--
function UI.MapZoneTooltip_BfsRivalSlotWnd:OnClanNameChanged()

	local data = self:GetRecordData()
	self:UpdateName( data )	

end


-- ---------------------------
-- const
-- ---------------------------

UI.MapZoneTooltip_BfsRivalSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    PLACE		= 1,
    NAME		= 2,
    POINTS		= 3,
}

UI.MapZoneTooltip_BfsRivalSlotWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animMyClan	= "local_pl",
	}
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.MapZoneTooltip_BfsRivalSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdatePlace( data )
	self:UpdateName( data )
	self:UpdatePoints( data )

end


--
function UI.MapZoneTooltip_BfsRivalSlotWnd:UpdateMainAnimation( data )

	local bMyClan = UI.Clan:IsInClan() and data.cid == UI.Clan:GetCid()
	local anim = bMyClan and self.effectInfo.main.animMyClan or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.MapZoneTooltip_BfsRivalSlotWnd:UpdatePlace( data )

	local strPlace = data.place ~= -1 and tostring( data.place ) or "-"
	self:SetText( strPlace, self.layers.PLACE )

end


--
function UI.MapZoneTooltip_BfsRivalSlotWnd:UpdateName( data )

	local name = UI:GetFullClanName( data.cid )
	self:SetText( name, self.layers.NAME )

end


--
function UI.MapZoneTooltip_BfsRivalSlotWnd:UpdatePoints( data )

	local strPoints = ""

	if data.place ~= -1 then

		if data.pointsVirt and data.pointsVirt > 0 then
			strPoints = string.format( "%s (+%s)", UI:Num2StrSeparatedBy3( math.ceil( data.pointsReal ) ), UI:Num2StrSeparatedBy3( math.ceil( data.pointsVirt ) ) )
		else
			strPoints = UI:Num2StrSeparatedBy3( math.ceil( data.pointsReal ) )
		end

	else
		strPoints = UI:GetStringByName( "tooltip_gameplay_map_bfs_rivals_noPoints" )
	end

	self:SetText( strPoints, self.layers.POINTS )

end


-- -------------------------------------------------------------------
-- инстанс тултипа UI.MapZoneTooltipWnd_shared
-- -------------------------------------------------------------------

UI.MapZoneTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "MapZone_TooltipWnd",

    	props =
    	{
    		name		= "MapZoneTooltipWnd_shared",
    	},	
	}
}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_SubRegionWnd = 
{
	def =
	{
		className = "Wnd",
		props =
		{
			name			= "GameplayPveMap_SubRegionWnd",
			style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
					defName 			= "gameplay_map_pve_subregion_main",
	       			defaultAnimation	= "idle",
	           		links =
	           		{
	           			{
	           				objName		= "text_36",
	           				layer		= "UI.GameplayPveMap_SubRegionWnd.layers.NAME_TEXT",
	           				animParams	= UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.SIZE,
	           			},
	           		}
	           	}}
			},
			-- BG
			{
				layerType	= UI.LAYER_INVALID,
				layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
	       	},
	       	-- NAME_TEXT
			{
				layerType		= UI.LAYER_TEXT,
	   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_TOP + FONT.TF_HCENTER,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		},
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMap_SubRegionWnd:OnShowServerTimeOptionChanged()

	self:UpdateForData( self.name )
	
end


-- -----------------------------------
-- consts
-- -----------------------------------
--
UI.GameplayPveMap_SubRegionWnd.layers = 
{
	MAIN_EFFECT		= 0,
	BG 				= 1,
	NAME_TEXT		= 2,
}

-- -----------------------------------
-- vars
-- -----------------------------------
--
UI.GameplayPveMap_SubRegionWnd.name = ""
UI.GameplayPveMap_SubRegionWnd.mainEffect = nil
UI.GameplayPveMap_SubRegionWnd.bgTex = nil

--
function UI.GameplayPveMap_SubRegionWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.GameplayPveMap_SubRegionWnd:UpdateForData( name )

	self.name = name

	local subRegionName = UI:SubRegion2Str( name, true )

	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then

		local conflictTime = UI.INVALID_U64_ID
		local minRank = -1
		local maxRank = -1

		local subRegionInfo = _G.FreeSpaceMap.SubRegions[ name ]
		if subRegionInfo then

			if subRegionInfo.tier ~= nil then
				if type( subRegionInfo.tier ) == "number" then
					tier = subRegionInfo.tier
				else
					sys.log( "UI.GameplayPveMap_SubRegionWnd:UpdateForData()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[%s].tier; \"number\" expected, got \"%s\"", name, type( subRegionInfo.tier ) )
				end
			end
			
			if type( subRegionInfo.zones == "table" ) then
			
				for zoneIdx, zoneName in pairs( subRegionInfo.zones ) do
					if type( zoneName ) == "string" then
					
						local zoneId = UI:ZoneName2Id( zoneName )
						if zoneId ~= -1 then
						
							local zoneConflictTime = UI:GetZoneNextConflictTime( zoneId )
							
							-- у зон может быть разное время начала конфликта, в субрегионе показывается наименьшее из них
							if zoneConflictTime ~= UI.INVALID_U64_ID then
								if conflictTime == UI.INVALID_U64_ID or zoneConflictTime < conflictTime then
									conflictTime = zoneConflictTime
								end
							end
							
							if minRank == -1 and maxRank == -1 then
								minRank, maxRank = UI:GetZoneShipRanks( zoneId )	-- ранги можно взять с лбдой зоны региона - SC-111154#focus=streamItem-4-572652.0-0
							end
						
						else
							sys.log( "UI.GameplayPveMap_SubRegionWnd:UpdateForData()[ERROR]: invalid zone '%s' in subregion '%s'", zoneName, name )
						end
					
					else
						sys.log( "UI.GameplayPveMap_SubRegionWnd:UpdateForData()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[%s].zones[%s]; \"string\" expected, got \"%s\"", name, tostring( zoneIdx ), type( zoneName ) )
					end
				end
			
			else
				sys.log( "UI.GameplayPveMap_SubRegionWnd:UpdateForData()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[%s].zones; \"table\" expected, got \"%s\"", name, type( subRegionInfo.zones ) )
			end

		else
			sys.log( "UI.GameplayPveMap_SubRegionWnd:UpdateForData()[ERROR]: cannot find _G.FreeSpaceMap.SubRegions[%s]", name )
		end

		if minRank ~= -1 and maxRank ~= -1 then
			subRegionName = string.format( "%s (%d-%d)", subRegionName, minRank, maxRank )
		end

		if conflictTime ~= UI.INVALID_U64_ID then
			local strConflictTime = UI.GameplayPveMapWnd:ZoneConflictTime2Str( conflictTime )
			subRegionName = string.format( "%s %s", subRegionName, strConflictTime )
		end

	end

	self:SetText( subRegionName, self.layers.NAME_TEXT )


	local texTame = string.format( "%s_tex", name )
	local hBgTex = UI:GetTex( texTame )

	self.bgTex =
	{
		hTex	= hBgTex,
		rect	= Quat( 0, 0, 0, 0 ),
		alpha	= 0,
	}

	self:RecalcLayout()
	self:UpdateScaleAlpha_region()

end


--
function UI.GameplayPveMap_SubRegionWnd:RecalcLayout()

	local name = self.name

	local centerPos = UI.GameplayPveMapWnd:WorldPos2Rel( UI:Vec2( FreeSpaceMap.SubRegions[ name ].posX, FreeSpaceMap.SubRegions[ name ].posY ) )

	-- размеры текстуры в абсолютных координатах для состояния, когда она рисутесся 1:1 (при максимальном масштабе)
	local texWidth_base		= 0
	local texHeight_base	= 0

	if self.bgTex then

		if self.bgTex.hTex ~= UI.INVALID_RESOURCE_HANDLE then

			local bgTexRc = UI:GetResourceByHandle( self.bgTex.hTex )
			if bgTexRc then

				texWidth_base	= bgTexRc:GetTextureWidth() * ( bgTexRc:GetU1() - bgTexRc:GetU0() )
				texHeight_base	= bgTexRc:GetTextureHeight() * ( bgTexRc:GetV1() - bgTexRc:GetV0() )

			end

		end
    	
	end

	-- размер текстуры в относительных координатах (1024/768) при текущем масштабе
	local mapScale			= UI.GameplayPveMapWnd:GetMapScale() / UI.GameplayPveMapWnd:GetMapMaxScale()
	local texWidth_real		= UI:XToRel( texWidth_base * mapScale )
	local texHeight_real	= UI:YToRel( texHeight_base * mapScale )

	self.bgTex.rect.z = texWidth_real
	self.bgTex.rect.w = texHeight_real

	local selfWidth = texWidth_real
	local selfHeight = texHeight_real

	self:SetRect( UI:Quat( centerPos.x - selfWidth * 0.5, centerPos.y - selfHeight * 0.5, selfWidth, selfHeight ) )
	
	local textSpace = ( self.mainEffect:GetObjPos( "text_36" ).y + self:GetLayerHeight( self.layers.NAME_TEXT ) ) * mapScale
	self:SetLayerTop( selfHeight - textSpace, self.layers.NAME_TEXT )
	self:SetLayerLeft( ( selfWidth - self:GetLayerWidth( self.layers.NAME_TEXT ) ) * 0.5, self.layers.NAME_TEXT )

end


--
function UI.GameplayPveMap_SubRegionWnd:UpdateScaleAlpha_region()

	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_region()
	local alpha = alphaCf * 255

	self.mainEffect:SetAlpha( alpha )

	if self.bgTex then
		self.bgTex.alpha = alpha
	end
	
	local nameColor = self:GetColor( self.layers.NAME_TEXT )
	nameColor = UI:SetAlpha( nameColor, alpha )
	self:SetColor( nameColor, self.layers.NAME_TEXT )

end


--
function UI.GameplayPveMap_SubRegionWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.BG then
		self:DrawBg( clipX0, clipY0, clipWidth, clipHeight )
	end	

end


--
function UI.GameplayPveMap_SubRegionWnd:DrawBg( clipX0, clipY0, clipWidth, clipHeight )

	if self.bgTex and self.bgTex.hTex ~= UI.INVALID_RESOURCE_HANDLE and self.bgTex.alpha ~= 0 then
		
    	UI.drawer:DrawImagedRect(
       		self:XToScreen( self.bgTex.rect.x ), self:YToScreen( self.bgTex.rect.y ), self.bgTex.rect.z, self.bgTex.rect.w,
       		clipX0, clipY0, clipWidth, clipHeight,
    		self.bgTex.hTex,
       		UI:SetAlpha( UI.WHITE_COLOR, self.bgTex.alpha ),
       		0, 0, 1, 1,
    		false
    	)

	end

end


-- -----------------------------------------------------------------
-- UI.GameplayPveMap_ZoneWnd
-- -----------------------------------------------------------------

UI.GameplayPveMap_ZoneWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_ZoneWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "GameplayPveMap_ZoneWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "gameplay_map_pve_element",
       			defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "sector_point",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "clan_ico",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.REGULAR_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "race_ico",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.STATION_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "sector_point3",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.SHIPYARD_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "point_current",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.CURRENT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_4",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.CAPTION_TEXT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE - UI.EffectAnimParams.COLOR - UI.EffectAnimParams.ALPHA - UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "dread_ico",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.DREADNOUGHT_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg_2",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.BFS_FIGHT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "sector_point_2",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.CIRCLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "blink",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg_7",
						layer		= "UI.GameplayPveMap_ZoneWnd.layers.BFS_ONLY_WING_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_bg",
			defaultAnimation	= "idle",
			}}
		},

		-- CIRCLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_circle",
				defaultAnimation	= "visit",
			}}
		},
		
		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_blink",
				defaultAnimation	= "idle",
			}}
		},
		
		-- REGULAR_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_regularIco",
				defaultAnimation	= "idle",
			}}
		},

		-- STATION_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_stationIco",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SHIPYARD_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_bzs_sector_shipyard",
				defaultAnimation	= "idle",
			}}
		},

		-- CURRENT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_current",
				defaultAnimation	= "idle",
			}}
		},

		-- CAPTION_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- DREADNOUGHT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_dreadnought",
				defaultAnimation	= "idle",
			}}
		},

		-- BFS_FIGHT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_bfs_fight",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_mouseOver",
				defaultAnimation	= "idle",
			}}
		},

		-- BFS_ONLY_WING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_bfs_only_wing",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMap_ZoneWnd:UpdateForData( name )

	self:Reset()

	self.name = name
	
	self:UpdateEnabledState()

	self:UpdateBg()
	self:UpdateIco()
	self:UpdateCircleEffect()
	self:UpdateCurrentEffect()
	self:UpdateCaption()
	self:UpdateDreadnought()
	self:UpdateBfsFightEffect()
	self:UpdateBfsOnlyWingEffect()
	self:UpdateTooltip()
	self:UpdateMouseOver()
	self:UpdateZoneEvents()

	self:UpdateScaleAlpha_zone()
	self:UpdateScaleAlpha_zoneName()

	self:RecalcLayout()

end


--
function UI.GameplayPveMap_ZoneWnd:Reset()

	self.name			= ""
	self.quests			= {}
	self.tooltipData	= nil
	self.bEnabled		= false

	self.adventures		= {}

	if self.missionWnd then
		self.missionWnd:UnlinkFromParent()
	end

	self:SetLayerVisible( false, self.layers.BG_EFFECT )
	self:SetLayerVisible( false, self.layers.REGULAR_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.STATION_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.SHIPYARD_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.CIRCLE_EFFECT )
	self:SetLayerVisible( false, self.layers.CURRENT_EFFECT )
	self:SetLayerVisible( false, self.layers.CAPTION_TEXT )
	self:SetLayerVisible( false, self.layers.DREADNOUGHT_EFFECT )
	self:SetLayerVisible( false, self.layers.BFS_FIGHT_EFFECT )
	self:SetLayerVisible( false, self.layers.MOUSE_OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )
	self:SetLayerVisible( false, self.layers.BFS_ONLY_WING_EFFECT )

	
	self:ResetZoneEvents()

end


--
function UI.GameplayPveMap_ZoneWnd:AddQuests( quests )

	for idx, questInfo in pairs( quests ) do
		table.insert( self.quests, questInfo )
	end

	if not self.missionWnd then
		self.missionWnd = UI:CreateChildWnd( self, UI.GameplayPveMapElement_MissionWnd, tostring( #UI.GameplayPveMap_MissionsWnd.allMissionWnds ) )
		table.insert( UI.GameplayPveMap_MissionsWnd.allMissionWnds, self.missionWnd )
	end

	self.missionWnd:SetParentAndUpdate( self )
	UI.GameplayPveMap_MissionsWnd:AddChild( self.missionWnd ) -- #0051339

	self:UpdateQuestPos()
	self:UpdateQuestScale()
	self.missionWnd:SetAlpha( UI.GameplayPveMapWnd:GetMapScaleAlpha_zone() )
	
	if self:HasStyle( UI.WS_DISABLE ) then
		self.missionWnd:AddStyle( UI.WS_DISABLE )
	else
		self.missionWnd:RemoveStyle( UI.WS_DISABLE )
	end	
	
	local bEnabled_old = self.bEnabled
	self:UpdateEnabledState()
	if self.bEnabled ~= bEnabled_old then
		self:OnEnableStateChanged()
	end

end


--
function UI.GameplayPveMap_ZoneWnd:AddAdventures( adventures )

	for idx, adventureInfo in pairs( adventures ) do
		table.insert( self.adventures, adventureInfo )
	end

	if not self.missionWnd then
		self.missionWnd = UI:CreateChildWnd( self, UI.GameplayPveMapElement_MissionWnd, tostring( #UI.GameplayPveMap_MissionsWnd.allMissionWnds ) )
		table.insert( UI.GameplayPveMap_MissionsWnd.allMissionWnds, self.missionWnd )
	end

	self.missionWnd:SetParentAndUpdate( self )
	UI.GameplayPveMap_MissionsWnd:AddChild( self.missionWnd ) -- #0051339

	self:UpdateQuestPos()
	self:UpdateQuestScale()
	self.missionWnd:SetAlpha( UI.GameplayPveMapWnd:GetMapScaleAlpha_zone() )
	
	if self:HasStyle( UI.WS_DISABLE ) then
		self.missionWnd:AddStyle( UI.WS_DISABLE )
	else
		self.missionWnd:RemoveStyle( UI.WS_DISABLE )
	end	
	
	local bEnabled_old = self.bEnabled
	self:UpdateEnabledState()
	if self.bEnabled ~= bEnabled_old then
		self:OnEnableStateChanged()
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateQuestPos()

	if not self.missionWnd then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.questLocator ) or UI:ZeroVec2()

	self.missionWnd:SetLeft( self:GetLeft() + pos.x - UI.GameplayPveMap_MissionsWnd:GetLeft() )
	self.missionWnd:SetTop( self:GetTop() + pos.y - UI.GameplayPveMap_MissionsWnd:GetTop() )

end


--
function UI.GameplayPveMap_ZoneWnd:SaveCoord()

	local centerX, centerY = self:GetCenter()
	local worldPos = UI.GameplayPveMapWnd:RelPos2World( UI:Vec2( self:GetLeft() + centerX, self:GetTop() + centerY ) )

	local zone = _G.SpaceZone[ self.name ]
	if zone then
		zone.dbg_pos_x = worldPos.x
		zone.dbg_pos_y = worldPos.y
	end
	
	self:UpdateTooltip()

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateScaleAlpha_zone()

	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_zone()
	local alpha = alphaCf * 255

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		mainEffect:SetAlpha( alpha )
		mainEffect:SetColor( UI:ARGB( alpha, alpha, alpha, alpha ) )
	end

	if self.missionWnd then
		self.missionWnd:SetAlpha( alphaCf )
	end

	local bDisabled		= self:HasStyle( UI.WS_DISABLE )
	local bNeedDisable	= alpha < 1e-3

	if bNeedDisable ~= bDisabled then

    	if alpha < 1e-3 then
    		self:AddStyle( UI.WS_DISABLE )
    		if self.missionWnd then
    			self.missionWnd:AddStyle( UI.WS_DISABLE )
    		end
    	else
    		self:RemoveStyle( UI.WS_DISABLE )
    		if self.missionWnd then
    			self.missionWnd:RemoveStyle( UI.WS_DISABLE )
    		end
    	end	

    	self:UpdateMouseOver()

	end
	
	self:UpdateZoneEventsAlpha()

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateScaleAlpha_zoneName()

	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_zoneName()
	local alpha = alphaCf * 255

	local color = self:GetColor( self.layers.CAPTION_TEXT )
	color = UI:SetAlpha( color, alpha )

	self:SetColor( color, self.layers.CAPTION_TEXT )

end


--
function UI.GameplayPveMap_ZoneWnd:GetCenter()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.centerLocator ) or UI:ZeroVec2()

	return pos.x, pos.y

end


--
function UI.GameplayPveMap_ZoneWnd:GetZoneName()

	return self.name

end


--
function UI.GameplayPveMap_ZoneWnd:GetZoneId()

	local zone = _G.SpaceZone[ self.name ]
	return zone and zone.zone_id or -1

end


--
function UI.GameplayPveMap_ZoneWnd:GetQuests()

	return self.quests

end


--
function UI.GameplayPveMap_ZoneWnd:GetAdventures()

	return self.adventures

end


--
function UI.GameplayPveMap_ZoneWnd:GetLinkRadius()
	
	return self:GetCircleRadius()

end


--
function UI.GameplayPveMap_ZoneWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.GameplayPveMap_ZoneWnd:Scale( scale )
	
	for layerIdx = 0, self:GetNumLayers() - 1 do
		local layer = self:GetLayer( UI.LAYER_INVALID, layerIdx )
		if layer and layer:GetLayerType() == UI.LAYER_EFFECT then
			local effect = UI:GetEffectFromLayer( self, layerIdx )
			if effect then
				effect:SetScale( UI:Vec2( scale, scale ) )
			end
		end
	end
	
	self:UpdateQuestScale()
	self:UpdateQuestPos()
	self:UpdateZoneEventsScale()
	self:UpdateZoneEventsPos()
	self:RecalcLayout()

end


--
function UI.GameplayPveMap_ZoneWnd:IsCurrent()

	local currentZoneId = ( _G.GetCurrentGameMode() == ai.Gameplay.NONE ) and _G.MasterServer_GetSpaceStationZoneId() or _G.CL_GetCurrentSpaceZoneId()
	return self:GetZoneId() == currentZoneId

end


--
function UI.GameplayPveMap_ZoneWnd:IsEnabled()

	return self.bEnabled
	
end


--
function UI.GameplayPveMap_ZoneWnd:Blink()
	
	self:SetLayerVisible( true, self.layers.BLINK_EFFECT )
	
	local blinkEffect = UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT )
	blinkEffect:RestartAnimation()
	
end


--
function UI.GameplayPveMap_ZoneWnd:OnZoneEventsChanged()
	
	self:UpdateZoneEvents()
	
end


--
function UI.GameplayPveMap_ZoneWnd:OnBattlePassUnlockPremium()

	local bEnabled_old = self.bEnabled
	self:UpdateEnabledState()
	if self.bEnabled ~= bEnabled_old then
		self:OnEnableStateChanged()
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMap_ZoneWnd.layers = 
{
	MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
	CIRCLE_EFFECT		= 2,
	BLINK_EFFECT		= 3,
	REGULAR_ICO_EFFECT	= 4,
	STATION_ICO_EFFECT	= 5,
	SHIPYARD_ICO_EFFECT	= 6,
	CURRENT_EFFECT 		= 7, 
	CAPTION_TEXT		= 8,
	DREADNOUGHT_EFFECT	= 9,
	BFS_FIGHT_EFFECT	= 10,
	MOUSE_OVER_EFFECT 	= 11,
	BFS_ONLY_WING_EFFECT= 12,
}

UI.GameplayPveMap_ZoneWnd.effectInfo =
{
	main =
	{
        colorCaptionNeutralLocator	= "title_4",
        colorCaptionDisableLocator	= "color_title_1",
		captionLocator				= "title_4",
		centerLocator				= "center",
		questLocator				= "exclamatory",
		dreadnoughtLocator			= "dread_ico",
	},

	bg =
	{
		animNeutral	= "idle",
		animDisable	= "not_visit",
		animFriend	= "clan_frend",
		animEnemy	= "clan_enemy",
	},

	circle =
	{
		animEnabled		= "visit",
		animDisabled	= "not_visit",
	},

	regularIco =
	{
		spriteName	= "ico"
	},
	
	stationIco =
	{
		spriteName	= "ico"
	}
}

UI.GameplayPveMap_ZoneWnd.captionLayout =
{
	UP		= 1,
	DOWN	= 2,
	LEFT	= 3,
	RIGHT	= 4,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayPveMap_ZoneWnd.name					= ""
UI.GameplayPveMap_ZoneWnd.quests				= {}
UI.GameplayPveMap_ZoneWnd.missionWnd			= nil
UI.GameplayPveMap_ZoneWnd.tooltipData			= nil 
UI.GameplayPveMap_ZoneWnd.bEnabled				= false
UI.GameplayPveMap_ZoneWnd.colorCaptionNeutral	= 0xffffffff
UI.GameplayPveMap_ZoneWnd.colorCaptionDisable	= 0xff555555
UI.GameplayPveMap_ZoneWnd.zoneEventWnds			= {}

UI.GameplayPveMap_ZoneWnd.adventures			= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMap_ZoneWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.quests 	= {}
	self.adventures = {}

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

        self.colorCaptionNeutral	= mainEffect:GetObjColor( self.effectInfo.main.colorCaptionNeutralLocator )
        self.colorCaptionDisable	= mainEffect:GetObjColor( self.effectInfo.main.colorCaptionDisableLocator )

	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateEnabledState()

	self.bEnabled = false
	
	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		self.bEnabled = true
		return
	end
	
	local zoneId = self:GetZoneId()
	
	local bFit = true
	
	if not self:IsCurrent() and not UI:IsZoneAlwaysAccessible( zoneId ) then
	
		-- флаг 'allowed_jump' в дефе
		if not UI:IsZoneAllowedForTransfer( zoneId ) then
			bFit = false
		end
			
		-- аккаунт ранг
		if bFit then
	
			local bNeedCheckRank = true
		
			local bAccessibleByQuest = false
			for questIdx, questInfo in pairs( self.quests ) do
			
				local accessibleZones = UI:GetQuestAccessibleZonesForStage( questInfo.id, questInfo.stage )
				for accessibleIdx, accessibleZoneId in pairs( accessibleZones ) do
					if accessibleZoneId == zoneId then
						bAccessibleByQuest = true
						break
					end
				end
				
				if bAccessibleByQuest then
					break
				end
				
			end
			
			if bAccessibleByQuest then
				bNeedCheckRank = false
			end
			
			if bNeedCheckRank then
				if UI:GetZoneUnlockRank( zoneId ) > UI:GetPlayerAccountRank() then
					bFit = false
				end
			end
			
		end
	
	end
	
	self.bEnabled = bFit
	
end


--
function UI.GameplayPveMap_ZoneWnd:OnEnableStateChanged()
	
	self:UpdateBg()
	self:UpdateIco()
	self:UpdateCircleEffect()
	self:UpdateCaption()
	self:UpdateTooltip()
	self:UpdateMouseOver()
	
end


--
function UI.GameplayPveMap_ZoneWnd:UpdateBg()

	self:SetLayerVisible( false, self.layers.BG_EFFECT )
	
	local anim = ""

	if not self:IsStation() then
		 
		local mapMode = UI.GameplayPveMapWnd:GetMode()
	
		if mapMode == UI.GameplayPveMapWnd.modes.FREE_SPACE then
	
			anim = self.bEnabled and self.effectInfo.bg.animNeutral or self.effectInfo.bg.animDisable
	
		elseif mapMode == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		
			if not self:IsShipyard() then
	
				if self:IsBfsZone() then
		
					local ownerCid = UI.Universe:GetSectorOwner( self:GetZoneId() ) or UI.INVALID_U64_ID
		
					if ownerCid ~= UI.INVALID_U64_ID then
						anim = ( UI.Clan:IsInClan() and ownerCid == UI.Clan:GetCid() ) and self.effectInfo.bg.animFriend or self.effectInfo.bg.animEnemy
					else
						anim = self.effectInfo.bg.animNeutral
					end
		
				else
					anim = self.effectInfo.bg.animNeutral
				end
				
			end
	
		else
			sys.log( "UI.GameplayPveMap_ZoneWnd:UpdateBg()[ERROR]: unhandled map mode %s", tostring( mapMode ) )
		end

	end
	
	if anim ~= "" then
	
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
	
		local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
		if bgEffect then
			bgEffect:StartAnimation( anim )
		end
		
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateIco()

	self:SetLayerVisible( false, self.layers.REGULAR_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.STATION_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.SHIPYARD_ICO_EFFECT )

	if self:IsStation() then

		self:SetLayerVisible( true, self.layers.STATION_ICO_EFFECT )

		local race = self:GetStationRace()

		local texName = string.format( "race_map_color_%s%s", UI:Val2Key( ai.Race, race ), self.bEnabled and "" or "_grey" )
		local hTex = UI:GetTex( texName )

		local icoEffect = UI:GetEffectFromLayer( self, self.layers.STATION_ICO_EFFECT )
		if icoEffect then
			icoEffect:SetSpriteTexture( self.effectInfo.stationIco.spriteName, hTex )
		end

	else

    	local mapMode = UI.GameplayPveMapWnd:GetMode()

    	if mapMode == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then

			if self:IsShipyard() then

				self:SetLayerVisible( true, self.layers.SHIPYARD_ICO_EFFECT )

			elseif self:IsBfsZone() then

				local ownerCid = UI.Universe:GetSectorOwner( self:GetZoneId() ) or UI.INVALID_U64_ID
				if ownerCid ~= UI.INVALID_U64_ID then

					self:SetLayerVisible( true, self.layers.REGULAR_ICO_EFFECT )

					local hTex = UI:GetClanIco( ownerCid )

					local icoEffect = UI:GetEffectFromLayer( self, self.layers.REGULAR_ICO_EFFECT )
					if icoEffect then
						icoEffect:SetSpriteTexture( self.effectInfo.regularIco.spriteName, hTex )
					end

				end

			end

		end

	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateCircleEffect()

	self:SetLayerVisible( false, self.layers.CIRCLE_EFFECT )

	local mapMode = UI.GameplayPveMapWnd:GetMode()

	if mapMode == UI.GameplayPveMapWnd.modes.FREE_SPACE then
	
		if UI:GetZoneUnlockRank( self:GetZoneId() ) <= UI:GetPlayerAccountRank() then

			self:SetLayerVisible( true, self.layers.CIRCLE_EFFECT )
			
			local anim = self.bEnabled and self.effectInfo.circle.animEnabled or self.effectInfo.circle.animDisabled

			local circleEffect = UI:GetEffectFromLayer( self, self.layers.CIRCLE_EFFECT )
			if circleEffect then
				circleEffect:StartAnimation( anim )
			end
			
		end

	elseif mapMode == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		self:SetLayerVisible( false, self.layers.CIRCLE_EFFECT )

	else
		sys.log( "UI.GameplayPveMap_ZoneWnd:UpdateCircleEffect()[ERROR]: unhandled map mode %s", tostring( mapMode ) )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateCurrentEffect()

	self:SetLayerVisible( self:IsCurrent(), self.layers.CURRENT_EFFECT )

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateCaption()

	self:SetLayerVisible( true, self.layers.CAPTION_TEXT )
	
	local levelName = UI:GetZoneLevel( self.name )
	local levelLocalizedName = UI:GetLevelLocalizedName( levelName, false )

	if not UI:IsZoneCivilian( self.name ) then
		levelLocalizedName = string.format( "%s%s", levelLocalizedName, UI:GetStringByName( "gameplay_map_pve_zone_pvp_postfix" ) )
	end
	
	self:SetText( levelLocalizedName, self.layers.CAPTION_TEXT )

	local color = self.bEnabled and self.colorCaptionNeutral or self.colorCaptionDisable
	self:SetColor( color, self.layers.CAPTION_TEXT )
	
	self:UpdateScaleAlpha_zoneName()

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateDreadnought()

	local bNeedDreadnought =
		UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR
		and UI.Clan:IsInClan()
		and UI.Clan:GetCurrentDreadnoughtZoneId() == self:GetZoneId()

	self:SetLayerVisible( bNeedDreadnought, self.layers.DREADNOUGHT_EFFECT )

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateBfsFightEffect()

	local bNeedBfsFight = false

	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and self:IsBfsZone() then
		local sector = UI.Universe:GetSectorById( self:GetZoneId() )
		if sector and sector.hasConflict then
			bNeedBfsFight = true
		end
	end

	self:SetLayerVisible( bNeedBfsFight, self.layers.BFS_FIGHT_EFFECT )

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateBfsOnlyWingEffect()

	local bNeedOnlyWing = false

	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR and self:IsBfsZone() then
		local sector = UI.Universe:GetSectorById( self:GetZoneId() )
		if sector and sector.hasConflict then

			local zone = _G.SpaceZone[ self.name ]

			if zone and zone.only_for_wing == true then
				bNeedOnlyWing = true
			end

		end
	end
	self:SetLayerVisible( bNeedOnlyWing, self.layers.BFS_ONLY_WING_EFFECT )

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateTooltip()

	self.tooltipData = nil	

	if UI.GameplayPveMapWnd.isDragAndropEnable then

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= self.name.." ("..SpaceZone[ self.name ].zone_id..")",
			text		= string.format( "PosX: %d|PosY: %d", SpaceZone[ self.name ].dbg_pos_x, SpaceZone[ self.name ].dbg_pos_y )
		}

	else

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.MAP_ZONE,
			name		= self.name,
			bCanFly		= self.bEnabled,
		}

	end

end


--
function UI.GameplayPveMap_ZoneWnd:RecalcLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local centerX, centerY	= self:GetCenter()
	
	-- заголовок (позиция x/y и размер)
	
	local captionPos	= mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.captionLocator ) or Vec2( 0, 0 )
	local captionSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.captionLocator ) or Vec2( 0, 0 )
	local captionLayout	= self.captionLayout.DOWN
	
	local zone = _G.SpaceZone[ self.name ]
	if zone then
	
		if zone.label_pos ~= nil then

			if type( zone.label_pos ) == "string" then
			
				if zone.label_pos == "up" then
					captionLayout = self.captionLayout.UP
					
				elseif zone.label_pos == "down" then
					captionLayout = self.captionLayout.DOWN
					
				elseif zone.label_pos == "left" then
					captionLayout = self.captionLayout.LEFT
					
				elseif zone.label_pos == "right" then
					captionLayout = self.captionLayout.RIGHT
					
				else
					sys.log( "UI.GameplayPveMap_ZoneWnd:RecalcLayout()[ERROR]: unhandled value \"%s\" in _G.SpaceZone[\"%s\"].label_pos", zone.label_pos, self.name )
				end
			
			else
				sys.log( "UI.GameplayPveMap_ZoneWnd:RecalcLayout()[ERROR]: invalid type of _G.SpaceZone[\"%s\"].label_pos; \"string\" or \"nil\" expected, got \"%s\"", self.name, type( zone.label_pos ) )
			end
			
		end
		
		if zone.lable_size_x ~= nil then
			if type( zone.lable_size_x ) == "number" then
				captionSize.x = UI:XToRel( zone.lable_size_x, true )
			else
				sys.log( "UI.GameplayPveMap_ZoneWnd:RecalcLayout()[ERROR]: invalid type of _G.SpaceZone[\"%s\"].lable_size_x; \"number\" or \"nil\" expected, got \"%s\"", self.name, type( zone.lable_size_x ) )
			end
		end
	
		if zone.lable_size_y ~= nil then
			if type( zone.lable_size_y ) == "number" then
				captionSize.y = UI:YToRel( zone.lable_size_y, true )
			else
				sys.log( "UI.GameplayPveMap_ZoneWnd:RecalcLayout()[ERROR]: invalid type of _G.SpaceZone[\"%s\"].lable_size_y; \"number\" or \"nil\" expected, got \"%s\"", self.name, type( zone.lable_size_y ) )
			end
		end

	end
	
	local captionSpaceY		= captionPos.y - centerY
	local captionSpaceX		= UI:XToRel( UI:YToAbs( captionSpaceY ) )
	local hAlignment 		= FONT.TF_HCENTER
	local vAlignment 		= FONT.TF_TOP
	
	if captionLayout == self.captionLayout.UP then
	
		captionPos.x	= centerX - captionSize.x * 0.5
		captionPos.y	= centerY - captionSpaceY - captionSize.y
		hAlignment		= FONT.TF_HCENTER
		vAlignment		= FONT.TF_BOTTOM
		
	elseif captionLayout == self.captionLayout.DOWN then
	
		captionPos.x	= centerX - captionSize.x * 0.5
		captionPos.y	= centerY + captionSpaceY
		hAlignment		= FONT.TF_HCENTER
		vAlignment		= FONT.TF_TOP

	elseif captionLayout == self.captionLayout.LEFT then
	
		captionPos.x	= centerX - captionSpaceX - captionSize.x
		captionPos.y	= centerY - captionSize.y * 0.5
		hAlignment		= FONT.TF_RIGHT
		vAlignment		= FONT.TF_VCENTER

	elseif captionLayout == self.captionLayout.RIGHT then
	
		captionPos.x	= centerX + captionSpaceX
		captionPos.y	= centerY - captionSize.y * 0.5
		hAlignment		= FONT.TF_LEFT
		vAlignment		= FONT.TF_VCENTER

	end

	self:SetLayerRect( UI:Quat( captionPos.x, captionPos.y, captionSize.x, captionSize.y ), self.layers.CAPTION_TEXT )
	self:SetTextFormatFlags( FONT.TF_WORDBREAK + hAlignment + vAlignment, self.layers.CAPTION_TEXT )
	
	
	-- иконка дредноута (позиция y)
	
	local dreadEffect = UI:GetEffectFromLayer( self, self.layers.DREADNOUGHT_EFFECT )
	
	local dreadPos		= mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.dreadnoughtLocator ) or Vec2( 0, 0 )	
	local dreadSpaceY	= math.abs( dreadPos.y - centerY )
	
	if captionLayout == self.captionLayout.UP then
		dreadPos.y = centerY + dreadPos.y
	else
		local dreadHeight = dreadEffect and dreadEffect:CalcApproximateRect().w * dreadEffect:GetScale().y or 0
		dreadPos.y = centerY - dreadPos.y - dreadHeight
	end
	
	if dreadEffect then
		dreadEffect:SetPos( dreadPos )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:IsBfsZone()

	local zone = _G.SpaceZone[ self.name ]
	return zone ~= nil and zone.universe_zone == true

end


--
function UI.GameplayPveMap_ZoneWnd:IsShipyard()

	return UI:GetZoneClanShipStationRace( self:GetZoneId() ) ~= -1

end


--
function UI.GameplayPveMap_ZoneWnd:IsStation()

	return self:GetStationRace() ~= -1

end


--
function UI.GameplayPveMap_ZoneWnd:GetStationRace()

	local zone = _G.SpaceZone[ self.name ]
	return zone and zone.station_race or -1

end


--
function UI.GameplayPveMap_ZoneWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	
	if layerIdx == self.layers.CAPTION_TEXT then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ), layerIdx )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	self:UpdateMouseOver()

	return true

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput) then
		return true
	end

	self:UpdateMouseOver()

	return true

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateMouseOver()

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
	local bMouseOver = false
		
	local bAlreadyHere = false
	if not UI.HangarWnd:IsOnScreen() then
		bAlreadyHere = self:IsCurrent()
	end

	if not bAlreadyHere and self.bEnabled then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end
	
	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )
	
	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if UI.GameplayPveMapWnd.isDragAndropEnable then
		UI.GameplayPveMapWnd:StartDragAndDrop( self, UI:Vec2( mouseX, mouseY ) )
		return true
	end

	if UI.HangarWnd:IsOnScreen() and self:IsBfsZone() then
		self:ShowContextMenuForBfsZone( mouseX, mouseY )
	end

	return true

end


--
function UI.GameplayPveMap_ZoneWnd:ShowContextMenuForBfsZone( mouseX, mouseY )

	local menuItems = {}
	
	local zoneId = self:GetZoneId()

	if UI.Clan:IsInClan() and UI.Clan:HasPermission( _G.MasterServer.ClanActionPrivileges.CAP_UNIVERSE_ACTION ) then

		-- перелет дредноута

		if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then 

			local dreadnoughtDef, dreadnought = UI.Clan:GetCurrentDreadnought( false )
			if dreadnought then
				
				if dreadnought.curZone ~= zoneId then
					
    				if self:IsShipyard() then
					
						if UI:GetZoneClanShipStationRace( zoneId ) == UI.Clan:GetDreadnoughtRace( dreadnoughtDef ) then

							local menuItem =
							{
								action	= UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE_TO_HANGAR,
								zone	= zoneId,
								cost	= _G.GameStore_GetClanShipMoveCost( dreadnought.curZone, zoneId )
							}								

							table.insert( menuItems, menuItem )
							
						end

    				elseif not self:IsStation() then

    					local menuItem =
    					{
    						action	= UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE,
    						zone	= zoneId,
    						cost	= _G.GameStore_GetClanShipMoveCost( dreadnought.curZone, zoneId )
    					}

    					table.insert( menuItems, menuItem )

    				end

				end

			end

		end

		-- открытие окна верфи дредноута

		if self:IsShipyard() then	-- рисуется только верфь подходящей расы и только если верфь построена, поэтому здесь дополнительные проверки верфи не проводятся
			table.insert( menuItems, { action = UI.ContextMenu_SlotWnd.actions.OPEN_SHIPYARD } )
		end

	end
	
	-- снятия флага civilian с зоны
	
	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR
		and UI.Clan:IsInClan()
		and UI.Universe:GetSectorById( zoneId ) ~= nil
		and UI.Universe:GetSectorOwner( zoneId ) == UI.Clan:GetCid()
		and UI:IsZoneCivilian( self.name )
		and UI.Clan:HasPermission( _G.MasterServer.ClanActionPrivileges.CAP_UNIVERSE_CIVILIAN ) then
		
			local menuItem =
			{
				action	= UI.ContextMenu_SlotWnd.actions.ZONE_CIVILIAN_CHANGE,
				zoneId	= zoneId,
			}

			table.insert( menuItems, menuItem )
		end

	if next( menuItems ) then

		UI.ContextMenu:Clear()
		UI.ContextMenu:SetName( UI:GetLevelLocalizedName( UI:GetZoneLevel( self.name ) ) )

		for idx, item in ipairs( menuItems ) do
			UI.ContextMenu:AddRecord( item )
		end

		UI.ContextMenu:Show( mouseX, mouseY )

	end

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if self.missionWnd then
		self.missionWnd:UnlinkFromParent()
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateQuestScale()
	
	if self.missionWnd then
	
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local scale = mainEffect and mainEffect:GetScale() or UI:Vec2( 1, 1 )
	
		for layerIdx = 0, self.missionWnd:GetNumLayers() - 1 do
			local layer = self.missionWnd:GetLayer( UI.LAYER_INVALID, layerIdx )
			if layer and layer:GetLayerType() == UI.LAYER_EFFECT then
				local effect = UI:GetEffectFromLayer( self.missionWnd, layerIdx )
				if effect then
					effect:SetScale( scale )
				end
			end
		end
		
	end

end


--
function UI.GameplayPveMap_ZoneWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT ) then
		self:SetLayerVisible( false, self.layers.BLINK_EFFECT )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateZoneEvents()
	
	self:ResetZoneEvents()	
	
	if UI.GameplayPveMapWnd:GetMode() ~= UI.GameplayPveMapWnd.modes.FREE_SPACE then
		return
	end
	
	local zoneId = self:GetZoneId()
	local events = UI.GameplayPveMapWnd:GetZoneEvents( zoneId )
	
	if not next( events ) then
		return
	end
	
	for eventId, eventVal in pairs( events ) do
	
		-- иконки показываются только если есть visualMap в дефе ивента;
		if not( type( eventVal ) == "number" and eventVal <= ai.ScriptsServer.DISABLE_EVENT ) and UI:GetZoneEventVisualMap( eventId ) then
			
			local zoneEventWnd = UI.GameplayPveMap_MissionsWnd:ObtainZoneEventWnd()
			table.insert( self.zoneEventWnds, zoneEventWnd )
			
			self:AddChild( zoneEventWnd )
			zoneEventWnd:Setup( eventId, eventVal )

		end
	
	end
	
	self:UpdateZoneEventsScale()
	self:UpdateZoneEventsPos()
	self:UpdateZoneEventsAlpha()
	
end


--
function UI.GameplayPveMap_ZoneWnd:ResetZoneEvents()
	
	for idx, wnd in pairs( self.zoneEventWnds ) do
		UI.GameplayPveMap_MissionsWnd:ReleaseZoneEventWnd( wnd )
	end
	
	self.zoneEventWnds = {}
	
end


--
function UI.GameplayPveMap_ZoneWnd:UpdateZoneEventsScale()

	if not next( self.zoneEventWnds ) then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scale = mainEffect and mainEffect:GetScale() or UI:Vec2( 1, 1 )
	
	for idx, zoneEventWnd in pairs( self.zoneEventWnds ) do
		zoneEventWnd:SetScale( scale )
	end

end


--
function UI.GameplayPveMap_ZoneWnd:UpdateZoneEventsPos()
	
	if not next( self.zoneEventWnds ) then
		return
	end
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scale = mainEffect and mainEffect:GetScale() or UI:Vec2( 1, 1 )
	
	local circleRadius_abs			= self:GetCircleRadius() * scale.x -- scale.x и scale.y должны быть равны
	local zoneCenterX, zoneCenterY	= self:GetCenter()
	local icoCenterX, icoCenterY	= self.zoneEventWnds[ 1 ]:GetCenter()
	
	for idx, zoneEventWnd in pairs( self.zoneEventWnds ) do	
		
		-- позиция на окружности под заданным углом
		
		local eventId	= zoneEventWnd:GetEventId()
		local visualMap	= UI:GetZoneEventVisualMap( eventId )
		
		local angle = 0
		
		if visualMap then
			if type( visualMap.angle ) == "number" then
				angle = math.rad( -visualMap.angle + 90 )	-- угол прописывается в градусах, по часовой стрелке, 0 вверху; переводим в стандарт: радианы, против часовой стрелки, 0 справа
			else
				sys.log( "UI:GetZoneEventVisualMap()[ERROR]: invalid type of _G.Events[%d].visualMap.angle; 'number' expected, got '%s'", eventId, type( visualMap.angle ) )
			end
		end
		
		local xFromCenter_abs	= math.cos( angle ) * circleRadius_abs
		local yFromCenter_abs	= -math.sin( angle ) * circleRadius_abs		-- y в игре направлен вниз
		
		-- позиция внутри зоны
		local x = zoneCenterX + UI:XToRel( xFromCenter_abs ) - icoCenterX
		local y = zoneCenterY + UI:YToRel( yFromCenter_abs ) - icoCenterY
		
		-- переводим в позицию внутри реального родительскоого для иконки окна (UI.GameplayPveMap_MissionsWnd)
		x = x + self:GetLeft() - UI.GameplayPveMap_MissionsWnd:GetLeft()
		y = y + self:GetTop() - UI.GameplayPveMap_MissionsWnd:GetTop()
		
		zoneEventWnd:SetPos( x, y )
		
	end
	
end


--
function UI.GameplayPveMap_ZoneWnd:UpdateZoneEventsAlpha()

	if not next( self.zoneEventWnds ) then
		return
	end
	
	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_zone()
	local bDisabled = self:HasStyle( UI.WS_DISABLE )
	
	for idx, zoneEventWnd in pairs( self.zoneEventWnds ) do
		
		zoneEventWnd:SetAlpha( alphaCf )

		if bDisabled then
			zoneEventWnd:AddStyle( UI.WS_DISABLE )
		else
			zoneEventWnd:RemoveStyle( UI.WS_DISABLE )
		end
		
	end
	
end


--
function UI.GameplayPveMap_ZoneWnd:GetCircleRadius()

	local radius = 0

	local circleEffect = UI:GetEffectFromLayer( self, self.layers.CIRCLE_EFFECT )
	if circleEffect then
		local circleSize = circleEffect:GetObjSize( "self" )
		radius = math.max( UI:XToAbs( circleSize.x ) / 2, UI:YToAbs( circleSize.y ) / 2 )
	end
	
	return radius

end


-- -----------------------------------------------------------------
-- UI.GameplayPveMap_StarWnd
-- -----------------------------------------------------------------

UI.GameplayPveMap_StarWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_StarWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "GameplayPveMap_StarWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "gameplay_map_pve_star",
       			defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "star_ico",
						layer		= "UI.GameplayPveMap_StarWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "title_5",
						layer		= "UI.GameplayPveMap_StarWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "over",
						layer		= "UI.GameplayPveMap_StarWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "current",
						layer		= "UI.GameplayPveMap_StarWnd.layers.CURRENT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
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
				defName 			= "gameplay_map_pve_star_ico",
				defaultAnimation	= "idle",
			}}
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- CURRENT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_map_pve_star_current",
				defaultAnimation	= "idle",
			}}
		},
		
		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			effects =
			{{
				defName 			= "gameplay_map_pve_element_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMap_StarWnd:Setup( subRegionName )

	self:Reset()

	self.subRegionName = subRegionName
	self:FullUpdate()
	
end


--
function UI.GameplayPveMap_StarWnd:Reset()

	self.subRegionName	= ""
	self.bDisabled		= false
	self.quests			= {}
	
	self.adventures		= {}
	
	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	
	if self.missionWnd then
		self.missionWnd:UnlinkFromParent()
	end
	
	self:SetLayerVisible( false, self.layers.CURRENT_EFFECT )

end


--
function UI.GameplayPveMap_StarWnd:GetSubRegionName()

	return self.subRegionName

end


--
function UI.GameplayPveMap_StarWnd:IsDisabled()

	return self.bDisabled

end


--
function UI.GameplayPveMap_StarWnd:GetCenter()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.centerLocator ) or UI:ZeroVec2()

	return pos.x, pos.y

end


--
function UI.GameplayPveMap_StarWnd:GetQuests()

	return self.quests

end


--
function UI.GameplayPveMap_StarWnd:GetAdventures()

	return self.adventures

end


--
function UI.GameplayPveMap_StarWnd:AddQuests( quests )

	for idx, questInfo in pairs( quests ) do
		table.insert( self.quests, questInfo )
	end
	
	if not self.missionWnd then
		self.missionWnd = UI:CreateChildWnd( self, UI.GameplayPveMapElement_MissionWnd, tostring( #UI.GameplayPveMap_MissionsWnd.allMissionWnds ) )
		table.insert( UI.GameplayPveMap_MissionsWnd.allMissionWnds, self.missionWnd )
	end

	self.missionWnd:SetParentAndUpdate( self )
	UI.GameplayPveMap_MissionsWnd:AddChild( self.missionWnd ) -- #0051339

	self:UpdateQuestPos()
	self.missionWnd:SetAlpha( UI.GameplayPveMapWnd:GetMapScaleAlpha_star() )
	
	if self:HasStyle( UI.WS_DISABLE ) then
		self.missionWnd:AddStyle( UI.WS_DISABLE )
	else
		self.missionWnd:RemoveStyle( UI.WS_DISABLE )
	end

end


-- аналог UI.GameplayPveMap_StarWnd:AddQuests()
function UI.GameplayPveMap_StarWnd:AddAdventures( adventures )

	for idx, adventureInfo in pairs( adventures ) do
		table.insert( self.adventures, adventureInfo )
	end

	if not self.missionWnd then
		self.missionWnd = UI:CreateChildWnd( self, UI.GameplayPveMapElement_MissionWnd, tostring( #UI.GameplayPveMap_MissionsWnd.allMissionWnds ) )
		table.insert( UI.GameplayPveMap_MissionsWnd.allMissionWnds, self.missionWnd )
	end

	self.missionWnd:SetParentAndUpdate( self )
	UI.GameplayPveMap_MissionsWnd:AddChild( self.missionWnd ) -- #0051339

	self:UpdateQuestPos()
	self.missionWnd:SetAlpha( UI.GameplayPveMapWnd:GetMapScaleAlpha_star() )
	
	if self:HasStyle( UI.WS_DISABLE ) then
		self.missionWnd:AddStyle( UI.WS_DISABLE )
	else
		self.missionWnd:RemoveStyle( UI.WS_DISABLE )
	end

end


--
function UI.GameplayPveMap_StarWnd:UpdateQuestPos()

	if not self.missionWnd then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.questLocator ) or UI:ZeroVec2()

	self.missionWnd:SetLeft( self:GetLeft() + pos.x - UI.GameplayPveMap_MissionsWnd:GetLeft() )
	self.missionWnd:SetTop( self:GetTop() + pos.y - UI.GameplayPveMap_MissionsWnd:GetTop() )

end


--
function UI.GameplayPveMap_StarWnd:UpdateScaleAlpha_star()

	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_star()
	local alpha = alphaCf * 255

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		mainEffect:SetAlpha( alpha )
		mainEffect:SetColor( UI:ARGB( alpha, alpha, alpha, alpha ) )
	end

	if self.missionWnd then
		self.missionWnd:SetAlpha( alphaCf )
	end

	local bDisabled		= self:HasStyle( UI.WS_DISABLE )
	local bNeedDisable	= alpha < 1e-3

	if bNeedDisable ~= bDisabled then

    	if alpha < 1e-3 then
    		self:AddStyle( UI.WS_DISABLE )
    		if self.missionWnd then
    			self.missionWnd:AddStyle( UI.WS_DISABLE )
    		end
    	else
    		self:RemoveStyle( UI.WS_DISABLE )
    		if self.missionWnd then
    			self.missionWnd:RemoveStyle( UI.WS_DISABLE )
    		end
    	end
		
		self:UpdateMouseOver()

	end

end


--
function UI.GameplayPveMap_StarWnd:GetLinkRadius()

	return 0	-- #0087414,комм.(0392435) - "вести линию из под текстуры звезды, из центра звезды"

end


--
function UI.GameplayPveMap_StarWnd:Scale( scale )
	
	for layerIdx = 0, self:GetNumLayers() - 1 do
		local layer = self:GetLayer( UI.LAYER_INVALID, layerIdx )
		if layer and layer:GetLayerType() == UI.LAYER_EFFECT then
			local effect = UI:GetEffectFromLayer( self, layerIdx )
			if effect then
				effect:SetScale( UI:Vec2( scale, scale ) )
			end
		end
	end
	
	self:UpdateQuestPos()
	
	if self.missionWnd then
	
		for layerIdx = 0, self.missionWnd:GetNumLayers() - 1 do
			local layer = self.missionWnd:GetLayer( UI.LAYER_INVALID, layerIdx )
			if layer and layer:GetLayerType() == UI.LAYER_EFFECT then
				local effect = UI:GetEffectFromLayer( self.missionWnd, layerIdx )
				if effect then
					effect:SetScale( UI:Vec2( scale, scale ) )
				end
			end
		end
		
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMap_StarWnd.layers =
{
	MAIN_EFFECT			= 0,
	ICO_EFFECT			= 1,
	NAME				= 2,
	CURRENT_EFFECT		= 3,
	MOUSE_OVER_EFFECT	= 4,
}

UI.GameplayPveMap_StarWnd.effectInfo =
{
	main =
	{
		centerLocator	= "center",
		questLocator	= "exclamatory_2",
	},
	
	ico =
	{
		spriteName	= "ico"
	},
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayPveMap_StarWnd.subRegionName	= ""
UI.GameplayPveMap_StarWnd.bDisabled		= false
UI.GameplayPveMap_StarWnd.missionWnd	= nil
UI.GameplayPveMap_StarWnd.quests		= {}

UI.GameplayPveMap_StarWnd.adventures	= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMap_StarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self.quests 	= {}
	self.adventures = {}

end


--
function UI.GameplayPveMap_StarWnd:FullUpdate()

	self:UpdateDisabledState( false )
	self:UpdateIco()
	self:UpdateName()
	self:UpdateCurrentEffect()
	
	self:UpdateScaleAlpha_star()

end


--
function UI.GameplayPveMap_StarWnd:UpdateDisabledState( bUpdateControls )
	
	if bUpdateControls == nil then
		bUpdateControls = true
	end	
	
	local bOldDisabled = self.bDisabled
	self.bDisabled = false
	
	local mapMode = UI.GameplayPveMapWnd:GetMode()
	
	if mapMode == UI.GameplayPveMapWnd.modes.FREE_SPACE then
		
		local bHasZoneFitByRank = false
		
		local zones = UI.GameplayPveMapWnd:GetSubRegionZones( self.subRegionName )
		local playerRank = UI:GetPlayerAccountRank()
		
		for idx, zoneId in pairs( zones ) do
			if UI.GameplayPveMapWnd:NeedShowZone( zoneId ) and UI:GetZoneUnlockRank( zoneId ) <= playerRank then
				bHasZoneFitByRank = true
				break
			end	
		end
		
		self.bDisabled = not bHasZoneFitByRank
		
	elseif mapMode == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		self.bDisabled = false
		
	else
		sys.log( "UI.GameplayPveMap_StarWnd:UpdateDisableState()[ERROR]: unhandled map mode: %s", tostring( mapMode ) )
	end
	
	if bOldDisabled ~= self.bDisabled and bUpdateControls then
		self:UpdateIco()
	end
	
end


--
function UI.GameplayPveMap_StarWnd:UpdateIco()
	
	local hTex = UI.INVALID_RESOURCE_HANDLE
	
	local texName = ""
	
	if type( _G.FreeSpaceMap ) == "table" then
	
		if type( _G.FreeSpaceMap.SubRegions ) == "table" then
		
			local subRegionInfo = _G.FreeSpaceMap.SubRegions[ self.subRegionName ]
			if type( subRegionInfo ) == "table" then
			
				if type( subRegionInfo.star_pic ) == "string" then
					texName = subRegionInfo.star_pic
				else
					sys.log( "UI.GameplayPveMap_StarWnd:UpdateIco()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[\"%s\"].star_pic; \"string\" expected, got \"%s\"", self.subRegionName, type( subRegionInfo.star_pic ) )
				end
			
			else
				sys.log( "UI.GameplayPveMap_StarWnd:UpdateIco()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions[\"%s\"]; \"table\" expected, got \"%s\"", self.subRegionName, type( subRegionInfo ) )
			end
		
		else
			sys.log( "UI.GameplayPveMap_StarWnd:UpdateIco()[ERROR]: invalid type of _G.FreeSpaceMap.SubRegions; \"table\" expected, got \"%s\"", type( _G.FreeSpaceMap.SubRegions ) )
		end
	
	else
		sys.log( "UI.GameplayPveMap_StarWnd:UpdateIco()[ERROR]: invalid type of _G.FreeSpaceMap; \"table\" expected, got \"%s\"", type( _G.FreeSpaceMap ) )
	end
	
	if texName ~= "" then
	
		if self.bDisabled then
			texName = string.format( "%s_disabled", texName )
		end
		
		hTex = UI:GetTex( texName )
	
	else
		hTex = UI:GetTex( "NoData" )
	end
	
	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end
	
end


--
function UI.GameplayPveMap_StarWnd:UpdateName()

	local str = UI:SubRegion2Str( self.subRegionName, true )
	self:SetText( str, self.layers.NAME )

end


--
function UI.GameplayPveMap_StarWnd:UpdateCurrentEffect()

	self:SetLayerVisible( self:IsCurrent(), self.layers.CURRENT_EFFECT )

end


--
function UI.GameplayPveMap_StarWnd:IsCurrent()

	local bCurrent = false
	
	local currentZoneId = ( _G.GetCurrentGameMode() == ai.Gameplay.NONE ) and _G.MasterServer_GetSpaceStationZoneId() or _G.CL_GetCurrentSpaceZoneId()
	
	local zones = UI.GameplayPveMapWnd:GetSubRegionZones( self.subRegionName )
	for idx, zoneId in pairs( zones ) do
	
		if zoneId == currentZoneId then
			bCurrent = true
			break
		end
		
	end
	
	return bCurrent

end


--
function UI.GameplayPveMap_StarWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if self.missionWnd then
		self.missionWnd:UnlinkFromParent()
	end

end


--
function UI.GameplayPveMap_StarWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	
	if layerIdx == self.layers.NAME then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ), layerIdx )
	end

end


--
function UI.GameplayPveMap_StarWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	self:SetMouseOver( true )
	return true

end


--
function UI.GameplayPveMap_StarWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput) then
		return true
	end

	self:SetMouseOver( false )
	return true

end


--
function UI.GameplayPveMap_StarWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


--
function UI.GameplayPveMap_StarWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
	
	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )
	
	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.GameplayPveMap_StarWnd:UpdateMouseOver()

	local bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	self:SetMouseOver( bMouseOver )

end


-- -----------------------------------------------------------------
-- UI.GameplayPveMapHudContainerWnd
-- -----------------------------------------------------------------

UI.GameplayPveMapHudContainerWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMapHudContainerWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "GameplayPveMapHudContainerWnd",
	},
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMapHudContainerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI.GameplayPveMapWnd:Unlink()	-- UI.GameplayPveMapWnd может быть чайлдом другого окна (UI.GameplayPveMapHudContainerWnd), в функции Unlink() оно отлинковывается, в т.ч. и от эффекта

	self:AddChild( UI.GameplayPveMapWnd )

	-- худ сделан в разрешении 1280*720, а карта в 1920*1080, поэтому берется локатор из ангара
	local pos = UI.HangarWnd:GetGameplayPveMapPos()
	UI.GameplayPveMapWnd:SetPos( pos.x, 0 )

	UI.GameplayPveMapWnd:SetMode( UI.GameplayPveMapWnd.modes.FREE_SPACE )

	UI:PlayGlobalSound( "sound/ui/tacticalView" )

end


--
function UI.GameplayPveMapHudContainerWnd:OnEscape()

	self:UnlinkFromParent()
	return true

end


--
function UI.GameplayPveMapHudContainerWnd:OnEnter()

	UI:OnFreeMouseBind()
	return true

end


-- -----------------------------------------------------------------
-- UI.GameplayPveMapElement_MissionWnd
-- -----------------------------------------------------------------

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMapElement_MissionWnd = 
{
	def =
	{
		className = "Wnd",
		props =
		{
			name			= "GameplayPveMapElement_MissionWnd",
			style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
					defName 			= "gameplay_map_pve_element_mission2",
	       			defaultAnimation	= "idle",
	       			links =
	           		{
	           			{
	           				objName		= "self137",
	           				animParams	= UI.EffectAnimParams.SIZE,
	           			},
	           		}
	       		}}
			}
		}
	}
}

UI.GameplayPveMapElement_MissionWnd.layers = 
{
	MAIN_EFFECT = 0,
}

UI.GameplayPveMapElement_MissionWnd.QuestState = 
{
	WIN 					= 1,
	MAIN 					= 2,
	AUTO 					= 3,
}

UI.GameplayPveMapElement_MissionWnd.parent = nil
UI.GameplayPveMapElement_MissionWnd.questState = -1

--
function UI.GameplayPveMapElement_MissionWnd:UpdateAnimation()

	local bStar = self.parent ~= nil and UI:IsWndKindOf( self.parent, "GameplayPveMap_StarWnd" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.mouseOver then
		if self.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.WIN then
			mainEffect:StartAnimation( "tick_over" )
		elseif self.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.MAIN then
			mainEffect:StartAnimation( bStar and "idle_4_over" or "over" )
		else
			mainEffect:StartAnimation( bStar and "idle_3_over" or "over_3" )
		end
	else
		if self.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.WIN then
			mainEffect:StartAnimation( "tick" )
		elseif self.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.MAIN then
			mainEffect:StartAnimation( bStar and "idle_4" or "idle" )
		else
			mainEffect:StartAnimation(  bStar and "idle_3" or "idle_2" )
		end
	end
end

--
function UI.GameplayPveMapElement_MissionWnd:GetTooltipData()

	if not( self.parent and UI:IsWndKindOf( self.parent, "GameplayPveMap_StarWnd" ) ) then
		local caption = UI:GetStringByName( "tooltip_freespace_missions_caption" )
		local text = UI:GetStringByName( "tooltip_freespace_missions_text" )
		return { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = caption, text = text }
	else
		return nil
	end
end

--
function UI.GameplayPveMapElement_MissionWnd:TrySetState( state )
	if self.questState > state  then
		self.questState = state
	end
end

--
function UI.GameplayPveMapElement_MissionWnd:SetParentAndUpdate( wnd )
	self.parent = wnd
	self.questState = UI.GameplayPveMapElement_MissionWnd.QuestState.AUTO
	local parent = self.parent
	if parent and parent.GetQuests then
		local quests = parent:GetQuests()
		for i = 1, #quests do
			quests[ i ].myInternalState = UI.GameplayPveMapElement_MissionWnd.QuestState.AUTO
			if quests[ i ].type == UI.questTypes.REGULAR then
				if not UI:IsQuestAuto( quests[ i ].id ) then
					self:TrySetState( UI.GameplayPveMapElement_MissionWnd.QuestState.MAIN )
					quests[ i ].myInternalState = UI.GameplayPveMapElement_MissionWnd.QuestState.MAIN
				end
				local stage = Quests[ quests[ i ].id ] and Quests[ quests[ i ].id ].stages[ quests[ i ].stage ]
				if stage then
					if quests[ i ].progress >= stage.required_value and quests[ i ].stage == #Quests[ quests[ i ].id ].stages then
						self:TrySetState( UI.GameplayPveMapElement_MissionWnd.QuestState.WIN )
						quests[ i ].myInternalState = UI.GameplayPveMapElement_MissionWnd.QuestState.WIN
					end
				end
			end
		end
		local function comp(w1,w2)
		    if ( w1.myInternalState < w2.myInternalState ) then
		        return true
		    end
		end
		table.sort( quests, comp )
	end
	
	self:UpdateAnimation()
end


--
function UI.GameplayPveMapElement_MissionWnd:SetAlpha( alphaCf )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAlpha( alphaCf * 255 )
	end

end

--
function UI.GameplayPveMapElement_MissionWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self.mouseOver = true
	self:UpdateAnimation()
	UI:PlayGlobalSound( "sound/ui/btnMouseOver" )
	return true
end

--
function UI.GameplayPveMapElement_MissionWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput) then
		return true
	end
	self.mouseOver = false
	self:UpdateAnimation()
	return true
end

-- -------------------------------------------------------------------
-- UI.GameplayMapGalaxyClanOwnerShifted
-- -------------------------------------------------------------------
UI.GameplayMapGalaxyClanOwnerShifted =
{
    def =
    {
    	className	= "Wnd",
    	prototype 	= "GameplayMapGalaxyClanOwner",
    	props = 
    	{
    		style		= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
    		name		= "GameplayMapGalaxyClanOwnerShifted",
    		isPrototype = true,
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
					defName				= "gameplay_select_galaxy_clan_owner_2",
					defaultAnimation    = "idle_big",
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			},
		}
    }
}

--
function UI.GameplayMapGalaxyClanOwnerShifted:SetAlpha( alphaCf )

	local alpha = alphaCf * 255

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAlpha( alpha )
	end

end

-- -------------------------------------------------------------
-- UI.GameplayPveMap_ZoneEventWnd
-- -------------------------------------------------------------

UI.GameplayPveMap_ZoneEventWnd = {}

-- ------------------------------------
-- window definition
-- -----------------------------------

UI.GameplayPveMap_ZoneEventWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "GameplayPveMap_ZoneEventWnd",
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
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
		
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMap_ZoneEventWnd:Setup( eventId, eventVal )

	self:Reset()
	
	self.eventId	= eventId
	self.eventVal	= eventVal
	
	self:FullUpdate()

end


--
function UI.GameplayPveMap_ZoneEventWnd:Reset()

	self.eventId					= -1
	self.eventVal					= 0
	self.tooltipData				= nil
	self.bUpdateTooltipEveryFrame	= false
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:SetSpriteTexture( self.effectInfo.main.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )	-- не используется, но надо скрыть дефолтную текстуру в спрайте
	end
	
end


--
function UI.GameplayPveMap_ZoneEventWnd:GetEventId()

	return self.eventId

end


--
function UI.GameplayPveMap_ZoneEventWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.GameplayPveMap_ZoneEventWnd:SetScale( scale )
	
	for layerIdx = 0, self:GetNumLayers() - 1 do
	
		local layer = self:GetLayer( UI.LAYER_INVALID, layerIdx )
		if layer and layer:GetLayerType() == UI.LAYER_EFFECT then
		
			local effect = UI:GetEffectFromLayer( self, layerIdx )
			if effect then
				effect:SetScale( scale )
			end
			
		end
		
	end

end


--
function UI.GameplayPveMap_ZoneEventWnd:SetAlpha( alphaCf )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAlpha( alphaCf * 255 )
	end

end


--
function UI.GameplayPveMap_ZoneEventWnd:GetCenter()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPosWithRotAndScale( self.effectInfo.main.centerLocator ) or UI:ZeroVec2()

	return pos.x, pos.y

end


--
function UI.GameplayPveMap_ZoneEventWnd:HandleTooltip( targetWnd, tooltipData )

	if targetWnd ~= self then
		return false
	end
	
	-- Эта функция вызывается непосредственно перед показом тултипа;
	-- если в тултипе должно быть время, то нужно прямо здесь апдейтить текст тултипа,
	-- иначе тултип может сразу при показе показать устаревшее время время, пока не вызовется F_OnNewFrame
	if self.bUpdateTooltipEveryFrame then
		self:UpdateTooltip()
	end

	-- не надо сами инициализировать окно тултипа, дефолтный обработчик инициализирует его таблицей self.tooltipData, которую мы вернули в GetTooltipData(),
	-- тултип будет инициализирован не копией, а ссылкой на эту таблицу, поэтому обновленные только что данные туда попадут
	return false

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMap_ZoneEventWnd.layers =
{
	MAIN_EFFECT = 0
}

UI.GameplayPveMap_ZoneEventWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
		bgSpriteName	= "ico_bg",
		centerLocator	= "center",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayPveMap_ZoneEventWnd.eventId					= -1
UI.GameplayPveMap_ZoneEventWnd.eventVal					= 0
UI.GameplayPveMap_ZoneEventWnd.tooltipData				= nil
UI.GameplayPveMap_ZoneEventWnd.bUpdateTooltipEveryFrame	= false

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMap_ZoneEventWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.GameplayPveMap_ZoneEventWnd:UpdateIco()
	
	local visualMap = UI:GetZoneEventVisualMap( self.eventId )
	if not visualMap then
		return
	end	
	
	local hTex = UI.INVALID_RESOURCE_HANDLE
	
	if type( visualMap.ico ) == "string" then
		hTex = UI:GetTex( visualMap.ico )
	else
		sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateIco()[ERROR]: invalid type of _G.Events[%d].visualMap.ico; 'string' expected, got '%s'", self.eventId, type( visualMap.ico ) )
		hTex = UI:GetTex( "NoData" )
	end
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end
	
end


--
function UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()

	self.tooltipData = nil
	self.bUpdateTooltipEveryFrame = nil

	local visualMap = UI:GetZoneEventVisualMap( self.eventId )
	if not visualMap then
		return
	end
	
	local bShowProgress = false
	
	if visualMap.showProgress ~= nil then
		if type( visualMap.showProgress ) == "boolean" then
			bShowProgress = visualMap.showProgress
		else
			sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: invalid type of _G.Events[%d].visualMap.showProgress; 'boolean' or 'nil' expected, got '%s'", self.eventId, type( visualMap.showProgress ) )
		end
	end
	
	local bShowTimer = false
	
	if visualMap.showTimer ~= nil then
		if type( visualMap.showTimer ) == "boolean" then
			bShowTimer = visualMap.showTimer
		else
			sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: invalid type of _G.Events[%d].visualMap.showTimer; 'boolean' or 'nil' expected, got '%s'", self.eventId, type( visualMap.showTimer ) )
		end
	end
	
	if bShowProgress and bShowTimer then
		sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: both 'showProgress' and 'showTimer' are specified in _G.Events[%d].visualMap", self.eventId )
		return
	end
	
	if bShowTimer then
		if type( self.eventVal ) ~= "userdata" then		-- изначально eventVal типа "number" (таймер до окончания в сек),  и только если это валидное время, то преобразуется в "userdata" (время окончания в млсек)
			return
		end
	end
	
	if bShowTimer then
		self.bUpdateTooltipEveryFrame = true
	end
	
	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= "",
		text		= "",
	}
	
	-- заголовок
	
	if type( visualMap.uiName ) == "string" then
		tooltipData.caption = UI:GetStringByName( visualMap.uiName )
	else
		sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: invalid type of _G.Events[%d].visualMap.uiName; 'string' expected, got '%s'", self.eventId, type( visualMap.uiName ) )
		tooltipData.caption = string.format( "[INVALID STRING] Event %d", self.eventId ) 
	end

	-- описание
	
	local descStrId = ""
	
	if type( visualMap.uiDesc ) == "string" then
		descStrId = visualMap.uiDesc
		tooltipData.text = UI:GetStringByName( descStrId )
	else
		sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: invalid type of _G.Events[%d].visualMap.uiDesc; 'string' expected, got '%s'", self.eventId, type( visualMap.uiDesc ) )
		tooltipData.text = "[INVALID STRING] No description."
	end

	-- в описание подставляется прогресс
	if bShowProgress then
	
		-- Прогресс приходит числом от 0 до 1000. Надо его перевести в процент от 1000 и отобразить со знаком процента. Например "45,6%"
		local progressFixed = self.eventVal / 1000 * 100
		local strProgress = string.format( "%.1f%%", progressFixed )
		
		local bInserted = false
		
		if descStrId ~= "" then
	
			local tSubst =
			{
				progress = strProgress
			}
			
			local numSubst = 0
			tooltipData.text, numSubst = string.gsub( tooltipData.text, "%$([%w_]+)%$", tSubst )
			
			if numSubst ~= 0 then
				bInserted = true
			else
				sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: cannot find placeholder '$progress$' in string '%s'", descStrId )
			end
			
		end
			
		if not bInserted then
			tooltipData.text = string.format( "%s%s", tooltipData.text, strProgress )
		end
		
	-- в описание подставляется таймер
	elseif bShowTimer then
	
		local curTime = _G.MasterServer_GetServerTime() or u64( 0 )
		local endTime = self.eventVal
	
		local timeSecLeft = 0
		if endTime > curTime then
			timeSecLeft = ( ( endTime - curTime ) * 0.001 ).l
		end
		
		local strTimeLeft = UI:Time2Str2( timeSecLeft )
	
		local bInserted = false
		
		if descStrId ~= "" then
	
			local numSubst = 0
			tooltipData.text, numSubst = string.gsub( tooltipData.text, "%$time%$", strTimeLeft )
			
			if numSubst ~= 0 then
				bInserted = true
			else
				sys.log( "UI.GameplayPveMap_ZoneEventWnd:UpdateTooltip()[ERROR]: cannot find placeholder '$time$' in string '%s'", descStrId )
			end
			
		end
			
		if not bInserted then
			tooltipData.text = string.format( "%s%s", tooltipData.text, strTimeLeft )
		end
	
	end
	
	self.tooltipData = tooltipData

end


--
function UI.GameplayPveMap_ZoneEventWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.bUpdateTooltipEveryFrame and UI:GetCurTooltipTarget() == self then
	
		self:UpdateTooltip()
		
		local tooltipWnd = UI:GetCurTooltip()
		if tooltipWnd then
			tooltipWnd:Setup( self.tooltipData )
		end
		
	end

end


-- Техничекое окно.
-- Предназначено для того, чтобы окна типа UI.GameplayPveMap_ZoneWnd
-- прилинковывали к нему чайлдами свои missionWnd.
-- Изначально missionWnd прилинковывались к тому же паренту, что и сами UI.GameplayPveMap_ZoneWnd
-- Т.к. в функции F_OnAfterHideFromScreen() окна UI.GameplayPveMap_ZoneWnd
-- отлинковывают missionWnd, то возникала нездоровая ситуация, когда во время прохода по списку чайлдов
-- (в окне парента UI.GameplayPveMapWnd) одни чайлды отлинковывали других, в результате чего
-- процесс прохода останавливался после первой же такой операции.
-- Это привело к багу #0051339.
-- (к зоне нельзя прилинковать, т.к. не попадает в ее self, и поэтому не будет наводится мышью и кликаться)

-- -------------------------------------------------------------
-- UI.GameplayPveMap_MissionsWnd
-- -------------------------------------------------------------

UI.GameplayPveMap_MissionsWnd =
{
	def =
	{
    	className = "Wnd",

    	props =
    	{
    		name	= "GameplayPveMap_MissionsWnd",
    		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT
    	}
	},
	
	allMissionWnds 		= {},
	allZoneEventWnds	= {},
	
}


--
function UI.GameplayPveMap_MissionsWnd:ObtainZoneEventWnd()

	local freeWnd = nil
	
	for idx, wnd in pairs( self.allZoneEventWnds ) do
		if not wnd:GetParent() then
			freeWnd = wnd
			break
		end
	end

	if not freeWnd then
	
		freeWnd = UI:CreateChildWnd( self, UI.GameplayPveMap_ZoneEventWnd, tostring( #self.allZoneEventWnds + 1 ) )
		
		if freeWnd then
			table.insert( self.allZoneEventWnds, freeWnd )
		end

	end
	
	if freeWnd then
		self:AddChild( freeWnd )
	end
	
	return freeWnd
	
end


--
function UI.GameplayPveMap_MissionsWnd:ReleaseZoneEventWnd( wnd )
	
	wnd:UnlinkFromParent()
	wnd:Reset()
	
end


-- Техничекое окно.
-- Предназначено для обеспечения правильного порядка отрисовки объектов - чтобы субрегионы могли рисоваться ниже линков, а зоны - выше.

-- -------------------------------------------------------------
-- UI.GameplayPveMap_LinksWnd
-- -------------------------------------------------------------

UI.GameplayPveMap_LinksWnd =
{
	def =
	{
    	className = "Wnd",

    	props =
    	{
    		name	= "GameplayPveMap_LinksWnd",
    		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT
    	},

		layers =
		{
    		-- LINKS
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    		},
		}
	}
}

UI.GameplayPveMap_LinksWnd.layers =
{
	LINKS	= 0,
}

-- здесь рисуются сектора БЗС в виде цветных полигонов
-- -------------------------------------------------------------
-- UI.GameplayPveMap_BfsSectorsWnd
-- -------------------------------------------------------------

UI.GameplayPveMap_BfsSectorsWnd =
{
	def =
	{
		className = "Wnd",
	
		props =
		{
			name	= "GameplayPveMap_BfsSectorsWnd",
			style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT
		},
	
		layers =
		{
			-- SECTORS
			{
				layerType	= UI.LAYER_VERTEX_STREAM,
				layerStyle	= UI.WLS_RESIZABLE,
			},
		}
	}
}

-- ------------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayPveMap_BfsSectorsWnd:Reset()

	local layer = self:GetLayer( UI.LAYER_VERTEX_STREAM, self.layers.SECTORS )
	layer:Clear()
	
	self.vertexStreams = {}

end


--
function UI.GameplayPveMap_BfsSectorsWnd:AddSector( zoneName )
	
	if self.vertexStreams[ zoneName ] then
		sys.log( "UI.GameplayPveMap_BfsSectorsWnd:AddSector()[ERROR]: sector for zone %s was already added", zoneName )
		return
	end
	
	local zoneDef = _G.SpaceZone[ zoneName ]
	if not zoneDef then
		sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: cannot find _G.SpaceZone['%s']", zoneName )
		return
	end
	
	if zoneDef.bfs_sector_points == nil then
		return
	end
	
	if zoneDef.bfs_sector_points ~= nil then
		if type( zoneDef.bfs_sector_points ) ~= "table" then
			sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: invalid type of _G.SpaceZone['%s'].bfs_sector_points; 'table' or 'nil' expected, got '%s'", zoneName, type( zoneDef.bfs_sector_points ) )
			return
		end
	end
	
	local zonePos_world = Vec2( zoneDef.dbg_pos_x, zoneDef.dbg_pos_y )
	
	local points = {}
	for pointIdx, tPt in ipairs( zoneDef.bfs_sector_points ) do
		
		if type( tPt ) ~= "table" or type( tPt[1] ) ~= "number" or type( tPt[2] ) ~= "number" or #tPt ~= 2 then
			sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: invalid format of _G.SpaceZone['%s'].bfs_sector_points; usage: { {<x>,<y>}, ... }", zoneName )
			return
		end
		
		table.insert( points, Vec2( tPt[1], tPt[2] ) )	-- записывается прямо в мировых координатах, перевод в относительные будет одновременно со скейлом
	
	end
	
	if not next( points ) then
		sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: no sector points for zone %s", zoneName )
		return
	end
	
	local color = UI.GameplayPveMapWnd:GetBfsSectorColor( zoneName )
	
	local layer = self:GetLayer( UI.LAYER_VERTEX_STREAM, self.layers.SECTORS )
	
	self.vertexStreams[ zoneName ] = { poligon = nil, outline = nil }
	
	-- многоугольник
	local triangles = UI:TriangulatePoligon( points )
	if next( triangles ) then
	
		layer:AddVertexStream()
		local vertexStream_poligon = layer:GetVertexStream( layer:GetNumVertexStreams() - 1 )
		
		vertexStream_poligon:SetTexture( UI:GetTex( "white" ) )	
		
		local tcs = UI:Vec2( 0, 0 )	
		for triangleIdx, triangle in ipairs( triangles ) do
			vertexStream_poligon:PushQuad( triangle[1], triangle[2], triangle[3], triangle[3], tcs, tcs, tcs, tcs, color )
		end
		
		self.vertexStreams[ zoneName ].poligon = vertexStream_poligon
		
	else
		sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: fail to triangulate sector points for zone %s", zoneName )
	end
	
	-- обводка
	local outlineWidth_rel = UI:XTo1024x768( self.OUTLINE_WIDTH )
	local outlineWidth_world = UI.GameplayPveMapWnd:XRel2World( outlineWidth_rel, UI.GameplayPveMapWnd:GetMapMaxScale() )
	
	local outlineQuads = UI:MakeThickLine( points, outlineWidth_world, true )

	if next( outlineQuads ) then
	
		layer:AddVertexStream()
		local vertexStream_outline = layer:GetVertexStream( layer:GetNumVertexStreams() - 1 )
		
		vertexStream_outline:SetTexture( UI:GetTex( "smooth_line" ) )
	
		for quadIdx, quad in ipairs( outlineQuads ) do
			vertexStream_outline:PushQuad( quad.pos[1], quad.pos[2], quad.pos[3], quad.pos[4], quad.tcs[1], quad.tcs[2], quad.tcs[3], quad.tcs[4], color )
		end
		
		self.vertexStreams[ zoneName ].outline = vertexStream_outline
		
	else
		sys.log( "UI.GameplayPveMap_BfsSectorsWnd()[ERROR]: fail to make outline for zone %s", zoneName )
	end

	self:UpdateSectorScale( zoneName )
	self:UpdateSectorPos( zoneName )
	self:UpdateSectorAlpha( zoneName )

end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorsScale()
	
	for zoneName, vertexStreamsForZone in pairs( self.vertexStreams ) do
		self:UpdateSectorScale( zoneName )
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorsPos()
	
	for zoneName, vertexStreamsForZone in pairs( self.vertexStreams ) do
		self:UpdateSectorPos( zoneName )
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateScaleAlpha_bfsSectors()
	
	for zoneName, vertexStreamsForZone in pairs( self.vertexStreams ) do
		self:UpdateSectorAlpha( zoneName )
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:OnZoneEventsChanged()

	for zoneName, vertexStreamsForZone in pairs( self.vertexStreams ) do
		self:UpdateSectorColor( zoneName )
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:GetSectors()

	local zoneNames = {}

	for zoneName, zoneVertexStreams in pairs( self.vertexStreams ) do
		table.insert( zoneNames, zoneName )
	end
	
	return zoneNames

end


-- ------------------------------------
-- const
-- -----------------------------------

UI.GameplayPveMap_BfsSectorsWnd.layers =
{
	SECTORS = 0,
}

UI.GameplayPveMap_BfsSectorsWnd.BASE_ALPHA_FILL		= 0.1
UI.GameplayPveMap_BfsSectorsWnd.BASE_ALPHA_OUTLINE	= 0.5
UI.GameplayPveMap_BfsSectorsWnd.OUTLINE_WIDTH		= 8		-- пикселы (в абсолютой системе координат)

-- ------------------------------------
-- vars
-- -----------------------------------

UI.GameplayPveMap_BfsSectorsWnd.vertexStreams = {}

-- ------------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorScale( zoneName )

	-- в многоугольнике хранятся мировые координаты; здесь перевод в относительные совмещен со скейлом карты
	local scale = UI.GameplayPveMapWnd:World2Rel( UI:Vec2( 1, 1 ) )
	
	if self.vertexStreams[ zoneName ].poligon then
		self.vertexStreams[ zoneName ].poligon:SetScale( scale )
	end
	
	if self.vertexStreams[ zoneName ].outline then
		self.vertexStreams[ zoneName ].outline:SetScale( scale )
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorPos( zoneName )

	-- [0;0] многоугольника ставится в мировое начало координат
	local mapOrg_rel = UI:Vec2( UI.GameplayPveMapWnd:GetMapRealCoord( 0, 0 ) )
	
	if self.vertexStreams[ zoneName ].poligon then
		self.vertexStreams[ zoneName ].poligon:SetPos( mapOrg_rel )
	end
	
	if self.vertexStreams[ zoneName ].outline then
		self.vertexStreams[ zoneName ].outline:SetPos( mapOrg_rel )
	end
	
end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorAlpha( zoneName )

	local alphaCf = UI.GameplayPveMapWnd:GetMapScaleAlpha_bfsSectors()

	local vertexStream_poligon = self.vertexStreams[ zoneName ].poligon
	if vertexStream_poligon then
	
		local alphaCf_poligon = alphaCf * self.BASE_ALPHA_FILL
		local color = vertexStream_poligon:GetVertexColor( 0 )
		color = UI:SetAlpha( color, alphaCf_poligon * 255 )
		
		vertexStream_poligon:SetColorOnQuadRange( 0, vertexStream_poligon:GetNumQuads(), color )
		
	end
	
	local vertexStream_outline = self.vertexStreams[ zoneName ].outline
	if vertexStream_outline then

		local alphaCf_outline = alphaCf * self.BASE_ALPHA_OUTLINE
		local color = vertexStream_outline:GetVertexColor( 0 )
		color = UI:SetAlpha( color, alphaCf_outline * 255 )
		
		vertexStream_outline:SetColorOnQuadRange( 0, vertexStream_outline:GetNumQuads(), color )
		
	end

end


--
function UI.GameplayPveMap_BfsSectorsWnd:UpdateSectorColor( zoneName )

	local color = UI.GameplayPveMapWnd:GetBfsSectorColor( zoneName )
	
	local vertexStream_poligon = self.vertexStreams[ zoneName ].poligon
	if vertexStream_poligon then
		vertexStream_poligon:SetColorOnQuadRange( 0, vertexStream_poligon:GetNumQuads(), color )
	end
	
	local vertexStream_outline = self.vertexStreams[ zoneName ].outline
	if vertexStream_outline then
		vertexStream_outline:SetColorOnQuadRange( 0, vertexStream_outline:GetNumQuads(), color )
	end
	
	self:UpdateSectorAlpha( zoneName )
	
end

-- ---------------------------------------------------------------------------------
-- UI.GameplayPveMap_MapModeBtn
-- ---------------------------------------------------------------------------------
UI.GameplayPveMap_MapModeBtn = {}
-- ------------------------------------
-- window definition
-- -----------------------------------
UI.GameplayPveMap_MapModeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayPveMap_MapModeBtn",
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
				defName 			= "gameplay_map_pve_toggle_mode",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

UI.GameplayPveMap_MapModeBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "select",
		animationSelect			= "select_over",
		animationPressed		= "select_over",
		animationDisabled		= "select",
		animationIdle_focus 	= "select",
		animationSelect_focus	= "select_over",
		animationPressed_focus	= "select_over",
	},
}

--
function UI.GameplayPveMap_MapModeBtn:GetTooltipData()
	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetStringByName( "gameplay_map_toogle_mode_BFS_text" ),
			caption = UI:GetStringByName( "gameplay_map_toogle_mode_BFS_caption" )
		}
	else
		return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetStringByName( "gameplay_map_toogle_mode_FreeSpace_text" ),
			caption = UI:GetStringByName( "gameplay_map_toogle_mode_FreeSpace_caption" )
		}
	end
end

--
function UI.GameplayPveMap_MapModeBtn:UpdateMode()
	if UI.GameplayPveMapWnd:GetMode() == UI.GameplayPveMapWnd.modes.BATTLE_FOR_SECTOR then
		self.effectInfo =
		{
			main =
			{
				animationIdle 			= "select",      
				animationSelect			= "select_over", 
				animationPressed		= "select_over", 
				animationDisabled		= "select",      
				animationIdle_focus 	= "select",      
				animationSelect_focus	= "select_over", 
				animationPressed_focus	= "select_over", 
			},
		}
		self:SetText( UI:GetStringByName( "gameplay_map_pve_free_space" ), self.layers.TEXT )
	else
		self.effectInfo =
		{
			main =
			{
				animationIdle 			= "idle",
				animationSelect			= "over",
				animationPressed		= "over",
				animationDisabled		= "idle",
				animationIdle_focus 	= "idle",
				animationSelect_focus	= "over",
				animationPressed_focus	= "over",
			},
		}
		self:SetText( UI:GetStringByName( "gameplay_map_pve_bfs" ), self.layers.TEXT )
	end
	local curTooltipWnd = UI:GetCurTooltip()	
	if curTooltipWnd and curTooltipWnd:IsOnScreen() and UI:GetCurTooltipTarget() == self then
		curTooltipWnd:Setup( self:GetTooltipData() )
	end
	self:F_UpdateAppearance()
end

-- -----------------------------------------------------------------------
-- UI.QuestsWnd
-- -----------------------------------------------------------------------

UI.QuestsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.QuestsWnd.layers =
{
	MAIN_EFFECT		= 0,
    WAIT_EFFECT		= 1,
    WAIT_TEXT		= 2,
}

--
UI.QuestsWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "QuestsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.QuestsWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "gameplay_map_pve_quests",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "loading",
						layer		= "UI.QuestsWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.QuestsWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= "^hangar_loading"
		},
	},
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.QuestsWnd:IsOpen()

	return self:GetSelTab() ~= -1

end


--
function UI.QuestsWnd:Close()

	self.tabsWnd:SelectTab( -1 )

end


--
function UI.QuestsWnd:ShowQuest( questId, questType, bSelect )

	if not self:IsOnScreen() then
		sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: not on screen" )
		return
	end

	if type( questId ) ~= "number" then
		sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end

	if type( questType ) ~= "number" then
		sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: invalid type of the 2-nd parameter (\"questType\"); \"number\" expected, got \"%s\"", type( questType ) )
		return
	end

	if questId == -1 then
		sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: invalid questId" )
		return
	end

	if questType ~= UI.questTypes.REGULAR and questType ~= UI.questTypes.SHIP then
		sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: invalid questType" )
		return
	end
	
	if bSelect ~= nil then
		if type( bSelect ) ~= "boolean" then
			sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: invalid type of the 3-rd parameter (\"bSelect\"); \"boolean\" or \"boolean\" expected, got \"%s\"", type( bSelect ) )
			bSelect = nil
		end
	end
	
	if bSelect == nil then
		bSelect = false
	end

	local category = -1

	if questType == UI.questTypes.REGULAR then
		category = UI:GetQuestCategory( questId )

	elseif questType == UI.questTypes.SHIP then
		category = UI:GetShipQuestCategory( questId )
	end

	if category ~= self:GetSelTab() then

		self.tabsWnd:SelectTab( category )

		if category ~= self:GetSelTab() then
			sys.log( "UI.QuestsWnd:ShowQuest()[ERROR]: cannot set category %d for quest %d type %d", category, questId, questType )
			return
		end

	end

	self.questsList:ShowQuest( questId, questType, bSelect )

end


--
function UI.QuestsWnd:ShowAdventure( questId, questType, bSelect )

	self.adventuresList:ShowAdventure( questId, questType, bSelect )

end


--
function UI.QuestsWnd:ShowRankUpQuest( bSelect )
	
	if not self:IsOnScreen() then
		sys.log( "UI.QuestsWnd:ShowRankUpQuest()[ERROR]: not on screen" )
		return
	end
	
	if bSelect ~= nil then
		if type( bSelect ) ~= "boolean" then
			sys.log( "UI.QuestsWnd:ShowRankUpQuest()[ERROR]: invalid type of the 1-st parameter (\"bSelect\"); \"boolean\" or \"boolean\" expected, got \"%s\"", type( bSelect ) )
			bSelect = nil
		end
	end
	
	if bSelect == nil then
		bSelect = false
	end
	
	local rankQuestId = -1
	
	for category, questsForCategory in pairs( self.quests ) do
	
		for questIdx, questInfo in pairs( questsForCategory ) do
		
			if questInfo.groupId == -1 then
			
				if UI:IsQuestRankUp( questInfo.questId ) then
					rankQuestId = questInfo.questId
					break
				end
			
			else
			
				for groupQuestIdx, groupQuestInfo in pairs( questInfo.groupQuests ) do
					if UI:IsQuestRankUp( groupQuestInfo.questId ) and not groupQuestInfo.bDisabled then
						rankQuestId = groupQuestInfo.questId
						break
					end
				end
				
				if rankQuestId ~= -1 then
					break
				end
			
			end
			
		end
	
	end

	if rankQuestId ~= -1 then
		self:ShowQuest( rankQuestId, UI.questTypes.REGULAR, bSelect )
	else
		sys.log( "UI.QuestsWnd:ShowRankUpQuest()[ERROR]: cannot find a rankup quest" )
	end
	
end


--
function UI.QuestsWnd:ShowQuestCategory( category )

	if type( category ) ~= "number" then
		sys.log( "UI.QuestsWnd:ShowQuestCategory()[ERROR]: invalid type of the 1-st parameter (\"category\"); \"number\" or \"boolean\" expected, got \"%s\"", type( category ) )
		return
	end
	
	if category ~= self:GetSelTab() then

		self.tabsWnd:SelectTab( category )

		if category ~= self:GetSelTab() then
			sys.log( "UI.QuestsWnd:ShowQuestCategory()[ERROR]: cannot set category", category )
		end

	end

end


-- вызывается из UI.Quests_TabsWnd
function UI.QuestsWnd:OnSelTabChanged()

	if not self:IsOnScreen() then
		return
	end
	
	if self.tabsWnd:GetSelTab() ~= -1 then

		if self.tabsWnd:IsAdventureTab() then
			self:AddChild( self.adventuresList )
			self:MoveChildToFirstPosition( self.adventuresList )
			self:UpdateAdventuresList()
		else
			self:AddChild( self.questsList )
			self:MoveChildToFirstPosition( self.questsList )
			self:UpdateQuestsList()
		end

	else

		self:UnlinkLists()

	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.QuestsWnd:UnlinkLists()

	if self.questsList:IsChildOf( self ) then
		self.questsList:Reset()
		self.questsList:UnlinkFromParent()
	end

	if self.adventuresList:IsChildOf( self ) then
		self.adventuresList:Reset()
		self.adventuresList:UnlinkFromParent()
	end

end


--
function UI.QuestsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.takeRequestId				= 0
	self.completeRequestId			= 0
	self.refuseRequestId			= 0
	self.endShipQuestRequestId		= 0
	self.leaveQueueRequestId		= 0
	self.questIdForNewGameplay		= nil
	self.btnActionForNewGameplay	= nil

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then
		if self:IsOnScreen() then
			self:OnQuestsChanged()
		end
	else
		if requestId == self.takeRequestId then
			UI:ShowMsgOnTakeQuestError( result )
		end		
	end

	if requestId == self.takeRequestId then
		self.takeRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestsWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then

		if self:IsOnScreen() then

			self:OnQuestsChanged()

			if requestId ~= 0 and requestId == self.completeRequestId then
				self:CheckLaunchBundlesAfterQuestComplete( param1 )
			end

		end

	else
		if requestId == self.completeRequestId then
			self:ShowMsgOnCompleteQuestError( result )
		end		
	end

	if requestId == self.completeRequestId then
		self.completeRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestsWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then

		if self:IsOnScreen() then
			self:OnQuestsChanged()
		end

	else
		if requestId == self.refuseRequestId then
			self:ShowMsgOnRefuseQuestError( result )
		end		
	end

	if requestId == self.refuseRequestId then
		self.refuseRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestsWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	if self:IsOnScreen() then
		self:OnQuestsChanged()
	end

end


--
function UI.QuestsWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then

		if self:IsOnScreen() or self.adventuresList:IsOnScreen() then
			self:OnQuestsChanged()
			self.adventuresList:UpdateWaitingEffect()
		end

		--self:UpdateWaitingEffect()

	end

end


--
function UI.QuestsWnd:MasterServer_OnAdventureFinal( param )

	if self:IsOnScreen() or self.adventuresList:IsOnScreen() then
		self:OnQuestsChanged()
	end

end


--
function UI.QuestsWnd:MasterServer_OnNewAdventure( param )

	if self:IsOnScreen() or self.adventuresList:IsOnScreen() then
		self:OnQuestsChanged()
	end

end


--
function UI.QuestsWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

	if not self:IsOnScreen() then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnNotification( notification, params )

	if notification ~= _G.MasterServer.ServerNotification.SN_QUEST_PROGRESS then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnQuestsChanged()
	
end


--
function UI.QuestsWnd:OnInvasionInfo( spawned, killed )

	if not self:IsOnScreen() then
		return
	end

	self.questsList:OnInvasionInfo()

end


--
function UI.QuestsWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return	
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnQuestTime( result, requestId, questId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestsWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestsWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestsWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	-- бывают квесты, которые должны пропасть из списка, если у игрока есть определенный корабль
	-- OnGameplayLaunchContextChanged() не вызывается, т.к. OnQuestsChanged() делает полный апдейт списка
	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnChangeIntervalQuests()

	if not self:IsOnScreen() then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ShipQuestOpResult.SQOR_OK then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.ShipQuestOpResult.SQOR_OK then

		if self:IsOnScreen() then
			self:OnQuestsChanged()
		end

	else
		if requestId == self.endShipQuestRequestId then
			self:ShowMsgOnEndShipQuestError( result )
		end		
	end

	if requestId == self.endShipQuestRequestId then
		self.endShipQuestRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestsWnd:MasterServer_OnShipQuestTime( result, requestId, questId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()
	
end


--
function UI.QuestsWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	if result == 0 then
	
		if requestId ~= 0 and requestId == self.leaveQueueRequestId then
		
			if self.questIdForNewGameplay then
	
				if self.btnActionForNewGameplay == UI.Quests_QuestSlotWnd.actions.TRANSFER_TO_ZONE then
					self:TransferToZone( self.questIdForNewGameplay )
				elseif self.btnActionForNewGameplay == UI.Quests_QuestSlotWnd.actions.LAUNCH_PVE then
					self:LaunchPveMission( self.questIdForNewGameplay )
				else
					sys.log( "UI.QuestsWnd:MasterServer_OnLeaveMMQueue()[ERROR]: unhandled btnAction to launch gameplay - %s", tostring( self.btnActionForNewGameplay ) )
				end
				
			else
				sys.log( "UI.QuestsWnd:MasterServer_OnLeaveMMQueue()[ERROR]: no quest id saved to launch gameplay" )
			end
			
		end
		
		if self:IsOnScreen() then
			self:OnGameplayLaunchContextChanged()
		end
		
	else
		if requestId ~= 0 and requestId == self.leaveQueueRequestId then
			UI:ShowMsgOnLeaveQueueError()
		end
	end

	if requestId ~= 0 and requestId == self.leaveQueueRequestId then
		self.leaveQueueRequestId = 0
		self.questIdForNewGameplay = nil
		self.btnActionForNewGameplay = nil
	end

end


--
function UI.QuestsWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()
	
end


--
function UI.QuestsWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()

end


--
function UI.QuestsWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()

end


--
function UI.QuestsWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()
	
end


--
function UI.QuestsWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnGameplayLaunchContextChanged()

end


--
function UI.QuestsWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:OnGameplayLaunchContextChanged()

end


--
function UI.QuestsWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:OnQuestsChanged()

end


--
function UI.QuestsWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self.questsList:OnBattlePassUnlockPremium()

end


-- ----------------------------
-- const
-- ----------------------------

UI.QuestsWnd.mainWndName = ""

UI.QuestsWnd.ACCOUNT_AURA_MAX_WAIT_TIME	= UI.MAX_WAITING_REQUEST_TIME_OUT

UI.QuestsWnd.effectInfo =
{
	main =
	{
		tabsLocator			= "tab",
		questsListLocator	= "list",
	},
}

-- ----------------------------
-- vars
-- ----------------------------

UI.QuestsWnd.tabsWnd					= nil
UI.QuestsWnd.questsList					= nil
UI.QuestsWnd.takeRequestId				= 0
UI.QuestsWnd.completeRequestId			= 0
UI.QuestsWnd.refuseRequestId			= 0
UI.QuestsWnd.bPremium					= false
UI.QuestsWnd.waitedAccountAura			= ""
UI.QuestsWnd.accountAuraWaitTime		= -1
UI.QuestsWnd.waitAccountAuraDataToSet	= nil
UI.QuestsWnd.shipQuestIdToEnd			= nil
UI.QuestsWnd.hMsgEndShipQuest			= UI.INVALID_UI_HANDLE
UI.QuestsWnd.endShipQuestRequestId		= 0
UI.QuestsWnd.quests						= {}
UI.QuestsWnd.leaveQueueRequestId		= 0
UI.QuestsWnd.hMsgLeaveQueue				= UI.INVALID_UI_HANDLE
UI.QuestsWnd.questIdForNewGameplay		= nil
UI.QuestsWnd.btnActionForNewGameplay	= nil

UI.QuestsWnd.adventuresList				= nil
UI.QuestsWnd.adventures					= {}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.QuestsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end
	
	self.quests = {}
	self.adventures = {}
	
	self:CreateControls()
	self.questsList:UnlinkFromParent()
	self.adventuresList:UnlinkFromParent()

	self:UpdateWaitingEffect()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.QuestsWnd:CreateControls()

	self.tabsWnd		= UI:CreateChildWnd( self, UI.Quests_TabsWnd, "" )
	self.questsList		= UI:CreateChildWnd( self, UI.Quests_QuestsListWnd, "" )
	self.adventuresList = UI:CreateChildWnd( self, UI.AdventureWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.tabsWnd, mainEffect, self.effectInfo.main.tabsLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.questsList, mainEffect, self.effectInfo.main.questsListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.adventuresList, mainEffect, self.effectInfo.main.questsListLocator, UI.EffectAnimParams.POS )

end


--
function UI.QuestsWnd:Reset()

	self.tabsWnd:SelectTab( -1 )

	self.quests			= {}
	self.premiumTime	= 0

	self.adventures 	= {}

	self:StopWaitingAccountAura()

end


--
function UI.QuestsWnd:FullUpdate()

	self:Reset()

	if self.waitAccountAuraDataToSet then
		self.waitedAccountAura		= self.waitAccountAuraDataToSet.waitedAccountAura
    	self.accountAuraWaitTime	= self.waitAccountAuraDataToSet.accountAuraWaitTime
		self:UpdateWaitingEffect()
		self.waitAccountAuraDataToSet = nil
	end
	
	self.quests		= self:GetQuests()
	self.bPremium	= UI:IsPremium()

	self.adventures	= self:GetAdventures()
	
	self:UpdateTabs()
	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:GetSelTab()

	return self.tabsWnd:GetSelTab()

end


--
function UI.QuestsWnd:UpdateQuestsList()

	local selTab = self.tabsWnd:GetSelTab()
	local quests = self.quests[ selTab ] or {}
	
	self.questsList:SetQuests( selTab, quests )

end


--
function UI.QuestsWnd:UpdateAdventuresList()

	self.adventuresList:SetAdventures( self.adventures )

end


--
function UI.QuestsWnd:OnQuestsChanged()

	self.adventures = self:GetAdventures()

	self.quests = self:GetQuests()
	
	local selTab = self:GetSelTab()
	local questLayout = self.questsList:GetQuestLayout()
	
	self:UpdateTabs()
	
	if selTab ~= -1 then
	
		local bFound = false
	
		local tabs = self.tabsWnd:GetTabs()
		for tabIdx, tab in pairs( tabs ) do
			if tab == selTab then
				bFound = true
				break
			end
		end
		
		if not bFound then
			selTab = -1
		end
		
	end
	
	if selTab ~= -1 then
		self.tabsWnd:SelectTab( selTab )
		self.questsList:SetQuestLayout( questLayout )
	end

end


--
function UI.QuestsWnd:OnAccountAurasChanged()

	self.questsList:OnAccountAurasChanged()

	if self.waitedAccountAura ~= "" then
		if UI:HasAccountAura( self.waitedAccountAura ) then
			self:LaunchBundlesForAccountAura( self.waitedAccountAura )
			self:StopWaitingAccountAura()
		end
	end

end


--
function UI.QuestsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Quests_RefuseQuestBtn" ) then

		if not wnd:IsGray() then

    		if not self:IsWaiting() then

				if self.tabsWnd:IsAdventureTab() then

					local slotWnd		= UI:GetAncestorKindOf( wnd, "AdventureSlotWnd" )
					local adventureAiid = slotWnd:GetAdventureAiid()
					--dprint( adventureAiid )

					self.adventuresList:RefuseAdventure( adventureAiid )
					self.adventuresList:UpdateWaitingEffect()

				else

					local slotWnd	= UI:GetAncestorKindOf( wnd, "Quests_QuestSlotWnd" )
					local questId	= slotWnd:GetQuestId()

					self:RefuseQuest( questId )

				end
            	UI:PlayGlobalSound( "sound/ui/cancel" )

    		end

		end

	elseif UI:IsWndKindOf( wnd, "Quests_EndShipQuestBtn" ) then

		if not self:IsWaiting() then

			local slotWnd	= UI:GetAncestorKindOf( wnd, "Quests_QuestSlotWnd" )
			local questId	= slotWnd:GetQuestId()

			self:TryPrematurelyEndShipQuest( questId )

		end
		
	elseif UI:IsWndKindOf( wnd, "Quests_CharacterIcoWnd" ) then
			
		UI.Quests_CharacterInfoWnd:Setup( wnd:GetCharacter() )
		UI.Quests_CharacterInfoWnd:Show()
		UI:PlayGlobalSound( UI.sounds.btnClick )
		
	elseif UI:IsWndKindOf( wnd, "Quests_QuestActionBtn" ) then
	
		if not self:IsWaiting() then
	
			local slotWnd = UI:GetAncestorKindOf( wnd, "Quests_QuestSlotWnd" )
			local action = wnd:GetAction()
			
			if action == UI.Quests_QuestSlotWnd.actions.TAKE then
				
				self:TakeQuest( slotWnd:GetQuestId() )
				UI:PlayGlobalSound( "sound/ui/apply" )
			
			elseif action == UI.Quests_QuestSlotWnd.actions.COMPLETE then

				self:CompleteQuest( slotWnd:GetQuestId(), slotWnd:GetQuestType() )
				UI:PlayGlobalSound( UI.sounds.btnClick )
		
			elseif action == UI.Quests_QuestSlotWnd.actions.TRANSFER_TO_ZONE then
			
				self:TryLaunchGameplay( slotWnd:GetQuestId(), action )
				UI:PlayGlobalSound( UI.sounds.btnClick )
		
			elseif action == UI.Quests_QuestSlotWnd.actions.LAUNCH_PVE then

				self:TryLaunchGameplay( slotWnd:GetQuestId(), action )
				UI:PlayGlobalSound( UI.sounds.btnClick )
				
			elseif action == UI.Quests_QuestSlotWnd.actions.SHIPS then
			
				self:LaunchShipsWnd( slotWnd:GetQuestId() )

			else
				sys.log( "UI.QuestsWnd:F_OnMouseLButtonDown()[ERROR]: unhandled action %s", tostring( action ) )
			end

		end
		
	elseif UI:IsWndKindOf( wnd, "Quests_CloseBtn" ) then
		
		self.tabsWnd:SelectTab( -1 )
		UI:PlayGlobalSound( UI.sounds.btnClick )

	end

	return true

end


--
function UI.QuestsWnd:TakeQuest( questId )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:TakeQuest()[ERROR]: invalid param" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.QuestsWnd:TakeQuest()[ERROR]: is waiting for another request" )
		return
	end

	self.takeRequestId = _G.MasterServer_AcceptQuest( questId )

	if self.takeRequestId == 0 then
		UI:ShowMsgOnTakeQuestError( _G.MasterServer.QuestResult.QR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:CompleteQuest( questId, questType )

	if questType == UI.questTypes.REGULAR then
		self:CompleteRegularQuest( questId )

	elseif questType == UI.questTypes.SHIP then
		self:DoEndShipQuest( questId )
	end

end


--
function UI.QuestsWnd:CompleteRegularQuest( questId )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:CompleteRegularQuest()[ERROR]: invalid param" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.QuestsWnd:CompleteRegularQuest()[ERROR]: is waiting for another request" )
		return
	end

	self.completeRequestId = _G.MasterServer_CompleteQuest( questId )

	if self.completeRequestId == 0 then
		self:ShowMsgOnCompleteQuestError( _G.MasterServer.QuestResult.QR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:RefuseQuest( questId )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:RefuseQuest()[ERROR]: invalid param" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.QuestsWnd:RefuseQuest()[ERROR]: is waiting for another request" )
		return
	end

	self.refuseRequestId = _G.MasterServer_ChangeQuest( questId )

	if self.refuseRequestId == 0 then
		self:ShowMsgOnRefuseQuestError( _G.MasterServer.QuestResult.QR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:TransferToZone( questId )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:TransferToZone()[ERROR]: invalid param" )
		return
	end

	local zoneId = UI:GetQuestZoneToTransfer( questId )
	if zoneId ~= -1 then
	
		if UI.GameplayPveMapWnd:IsOnScreen() then
			UI.GameplayPveMapWnd:ShowZone( zoneId, UI.GameplayPveMapWnd.modes.FREE_SPACE )
		end
		
		UI.GameplayShipSelectWnd:Setup( zoneId )
		UI.GameplayShipSelectWnd:Show()
		
	else
		sys.log( "UI.QuestsWnd:TransferToZone()[ERROR]: cannot find zone to transfer to" )
	end

end


--
function UI.QuestsWnd:LaunchPveMission( questId )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:LaunchPveMission()[ERROR]: invalid param" )
		return
	end
	
	local missionName = UI:GetQuestPveMission( questId )
	
	if missionName == "" then
	
		local pveLevelName = UI:GetQuestPveLevel( questId )
		if pveLevelName ~= "" then
			
			missionName = UI:GetPveMissionToLaunchForLevel( pveLevelName, false, "easy" )
			
			if missionName == "" then
				UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_VESSEL_RANK_INAPPROPRIATE_PVE" ), UI.MBS_OK )
			end
			
		else
			sys.log( "UI.QuestsWnd:LaunchPveMission()[ERROR]: neither battlePoint nor battleMap for quest %d", questId )
		end
		
	end
	
	if missionName ~= "" then
	
		local unlimPve_minMissionLevel = UI:GetQuestUnlimPveMinMissionLevel( questId )
		
		if UI.GameplayPveMapWnd:IsOnScreen() then
			UI.GameplayWnd:SetGameplay( { mmParams = { pve = 1, pve_mission = missionName, region = UI:GetGameRegion(), from_quest = 1, unlimPve_minMissionLevel = unlimPve_minMissionLevel }, bQuests_map = true } )
		else
			UI.GameplayWnd:SetGameplay( { mmParams = { pve = 1, pve_mission = missionName, region = UI:GetGameRegion(), from_quest = 1, unlimPve_minMissionLevel = unlimPve_minMissionLevel }, bQuests_hangar = true } )
		end
		
		UI.GameplayWnd:StartMatchMaking()
		
	end

end


--
function UI.QuestsWnd:TryLaunchGameplay( questId, btnAction )

	if questId == -1 then
		sys.log( "UI.QuestsWnd:TryLaunchGameplay()[ERROR]: invalid param" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.QuestsWnd:TryLaunchGameplay()[ERROR]: is waiting for another request" )
		return
	end
	
	if not self:CanLaunchGameplay() then
		sys.log( "UI.QuestsWnd:TryLaunchGameplay()[ERROR]: cannot launch gameplay now" )
		return
	end
	
	-- если в очереди, то запрашиваем у игрока согласие на выход из очереди
	if UI:IsEnqueued() then
	
		self.questIdForNewGameplay = questId
		self.btnActionForNewGameplay = btnAction
		
		if not self:TryLeaveQueue() then
			self.questIdForNewGameplay = nil
			self.btnActionForNewGameplay = nil
			sys.log( "UI.QuestsWnd:TryLaunchGameplay()[ERROR]: cannot leave queue now" )
		end
		
		return
		
	end
	
	-- если состояние MATCHMAKING и не в очереди - значит, что игра уже сматчена, и выйти из нее уже нельзя (это состояние сохраняется в ангаре вплоть до запуска геймплея)
	if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.MATCHMAKING then
		return
	end
	
	-- если идет подготовка к бою, то прекращаем ее
	if prepareState ~= UI.HangarWnd.prepareStates.NONE then
		UI.HangarWnd:SetPrepareState( UI.HangarWnd.prepareStates.NONE )
	end
	
	-- можно запускать геймплей
	if btnAction == UI.Quests_QuestSlotWnd.actions.TRANSFER_TO_ZONE then
		self:TransferToZone( questId )
	elseif btnAction == UI.Quests_QuestSlotWnd.actions.LAUNCH_PVE then
		self:LaunchPveMission( questId )
	else
		sys.log( "UI.QuestsWnd:TryLaunchGameplay()[ERROR]: unhandled btnAction - %s", tostring( btnAction ) )
	end

end


-- можно ли в данный момент запустить какой-либо геймплей
function UI.QuestsWnd:CanLaunchGameplay()

	-- уже в бою
	if UI:IsInBattle() then
		return false
	end
	
	-- если в очереди, то сначала можно выйти из очереди, потом начать новый геймплей
	-- если состояние MATCHMAKING и не в очереди - значит, что игра уже сматчена, и выйти из нее уже нельзя (это состояние сохраняется в ангаре вплоть до запуска геймплея)
	if not UI:IsEnqueued() and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.MATCHMAKING then
		return false
	end
	
	return true

end


--
function UI.QuestsWnd:TryLeaveQueue()
	
	if not UI:IsEnqueued() then
		sys.log( "UI.QuestsWnd:TryLeaveQueue()[ERROR]: not enqueued" )
		return false
	end

	if self.leaveQueueRequestId ~= 0 then
		return false
	end

	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then
		return false
	end
	
	self.hMsgLeaveQueue = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_exitMatchMaking" ), UI.MBS_YES_NO )
	return true

end


--
function UI.QuestsWnd:DoLeaveQueue()

	self.leaveQueueRequestId = _G.MasterServer_LeaveMatchmakingQueue()

	if self.leaveQueueRequestId == 0 then
		UI:ShowMsgOnLeaveQueueError()
		self.questIdForNewGameplay = nil
		self.btnActionForNewGameplay = nil
	end

end


--
function UI.QuestsWnd:ShowMsgOnCompleteQuestError( result )

	UI:ShowErrorMsg( "msg_questCompleteError", result, "_G.MasterServer.QuestResult" )

end


--
function UI.QuestsWnd:ShowMsgOnRefuseQuestError( result )

	UI:ShowErrorMsg( "msg_questRefuseError", result, "_G.MasterServer.QuestResult" )

end


--
function UI.QuestsWnd:F_OnEventSaveUiState()

	local tableName = self:GetScriptTableName()	

	UI.store[ tableName ] =
	{
		takeRequestId				= self.takeRequestId,
		completeRequestId			= self.completeRequestId,
		refuseRequestId				= self.refuseRequestId,
		endShipQuestRequestId		= self.endShipQuestRequestId,
		zoneCivilianChangeRequestId	= self.zoneCivilianChangeRequestId,
		leaveQueueRequestId			= self.leaveQueueRequestId,
		questIdForNewGameplay		= self.questIdForNewGameplay,
		btnActionForNewGameplay		= self.btnActionForNewGameplay,

	}

	if self:IsOnScreen() then
		UI.store[ tableName ].waitedAccountAura		= self.waitedAccountAura
		UI.store[ tableName ].accountAuraWaitTime	= self.accountAuraWaitTime
	end
	
	self:HideChildModals()

end


--
function UI.QuestsWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()	
	local t = UI.store[ tableName ]

	if t then

		self.takeRequestId					= t.takeRequestId
		self.completeRequestId				= t.completeRequestId
		self.refuseRequestId				= t.refuseRequestId
		self.endShipQuestRequestId			= t.endShipQuestRequestId
		self.zoneCivilianChangeRequestId	= t.zoneCivilianChangeRequestId
		self.leaveQueueRequestId			= t.leaveQueueRequestId
		self.questIdForNewGameplay			= t.questIdForNewGameplay
		self.btnActionForNewGameplay		= t.btnActionForNewGameplay

		self:UpdateWaitingEffect()
		
		if self:IsOnScreen() then
			self.waitedAccountAura		= t.waitedAccountAura
			self.accountAuraWaitTime	= t.accountAuraWaitTime
			self:UpdateWaitingEffect()
		else
			if t.waitedAccountAura ~= nil and t.waitedAccountAura ~= "" then
    			self.waitAccountAuraDataToSet =
    			{
    				waitedAccountAura	= t.waitedAccountAura,
    				accountAuraWaitTime	= t.accountAuraWaitTime,
    			}
			end
		end

		UI.store[ tableName ] = nil

	end

end


--
function UI.QuestsWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting() and self.questsList:IsChildOf( self )

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.QuestsWnd:IsWaiting()

	return
		self.takeRequestId ~= 0
		or self.completeRequestId ~= 0
		or self.refuseRequestId ~= 0
		or self.endShipQuestRequestId ~= 0
		or self.waitedAccountAura ~= ""
		or self.leaveQueueRequestId ~= 0

end


--
function UI.QuestsWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	-- крутяшка рисуется поверх списка (хотя не его чайлд), поэтому когда списка нет, она скрывается
	if child == self.questsList then
	--if child == self.questsList or child == self.adventuresList then
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestsWnd:F_OnAfterRemoveChild( child )

	self:OnAfterRemoveChild( child )
	
	-- крутяшка рисуется поверх списка (хотя не его чайлд), поэтому когда списка нет, она скрывается
	if child == self.questsList then
	--if child == self.questsList or child == self.adventuresList then
		self:UpdateWaitingEffect()
	end
	
end


--
function UI.QuestsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()
	
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.QuestsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end
	
	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.QuestsWnd:UpdatePremium()

	local bPremiumOld = self.bPremium
	self.bPremium = UI:IsPremium()

	if self.bPremium ~= bPremiumOld then
		self:OnPremiumChanged()
	end

end


--
function UI.QuestsWnd:OnPremiumChanged()

	self.questsList:OnPremiumChanged()

end


--
function UI.QuestsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdatePremium()
	self:UpdateAccountAuraWaitTime( dt_sys )
	
end


--
function UI.QuestsWnd:CheckLaunchBundlesAfterQuestComplete( questId )

	if self.waitedAccountAura ~= "" then
		sys.log( "UI.QuestsWnd:CheckLaunchBundlesAfterQuestComplete()[ERROR]: still waiting for another account aura" )
	end

	self:StopWaitingAccountAura()

	local accountAura	= ""

	local rewards = UI:GetQuestRewards( questId, false, false, false, nil )	-- TODO: проверить параметры
	for rewardIdx, reward in pairs( rewards ) do

		if reward.rewardType == UI.questRewardTypes.ACCOUNT_AURA then

			local itemDefName, bIsLicense = UI:GetAccountAuraDiscountedItem( reward.defName )
			if itemDefName ~= "" and not bIsLicense and UI:IsDefBundle( itemDefName ) then
				accountAura = reward.defName
				break
			end

		end

	end

	if accountAura ~= "" then
    	if UI:HasAccountAura( accountAura ) then
    		self:LaunchBundlesForAccountAura( accountAura )
    	else
			self:StartWaitingAccountAura( accountAura )
    	end
	end

end


--
function UI.QuestsWnd:LaunchBundlesForAccountAura( accountAura )

	local bundleDefName = UI:GetAccountAuraDiscountedItem( accountAura )

	if bundleDefName == "" or not UI:IsDefBundle( bundleDefName ) then
		sys.log( "UI.QuestsWnd:LaunchBundlesForAccountAura()[ERROR]: account aura \"%s\" does not discount any bundle", accountAura )
		return
	end

	if UI:IsItemVisibleInBundlesWndByDef( bundleDefName ) then
		UI.HangarWnd:OpenBundle( bundleDefName, true, self:GetBundleLaunchData() )
	else
		sys.log( "UI.QuestsWnd:LaunchBundlesForAccountAura()[ERROR]: bundle \"%s\" discounted by account aura \"%s\" is not visible in bundles window", bundleDefName, accountAura )
	end	

end


-- для перегрузки
function UI.QuestsWnd:GetBundleLaunchData()

	sys.log( "UI.QuestsWnd:GetBundleLaunchData()[ERROR]: must be overloaded" )
	return nil

end


--
function UI.QuestsWnd:UpdateAccountAuraWaitTime( dt )

	if self.waitedAccountAura == "" then
		return
	end

	self.accountAuraWaitTime = self.accountAuraWaitTime + dt

	if self.accountAuraWaitTime >= self.ACCOUNT_AURA_MAX_WAIT_TIME then
		self:StopWaitingAccountAura( true )
	end

end


--
function UI.QuestsWnd:StartWaitingAccountAura( accountAura )

	self.waitedAccountAura		= accountAura
	self.accountAuraWaitTime	= 0

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:StopWaitingAccountAura( bTimeExpired )

	if bTimeExpired == nil then
		bTimeExpired = false
	end

	self.waitedAccountAura		= ""
	self.accountAuraWaitTime	= -1

	self:UpdateWaitingEffect()

	if bTimeExpired then
		sys.log( "UI.QuestsWnd:StopWaitingAccountAura()[ERROR]: waiting for account aura time expired" )
	end

end


--
function UI.QuestsWnd:TryPrematurelyEndShipQuest( questId )

	if self:IsWaiting() then
		return
	end

	self.shipQuestIdToEnd = questId
	self.hMsgEndShipQuest = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "tutorialQuest_endShipQuestConfirm" ), UI.MBS_YES_NO )

end


--
function UI.QuestsWnd:DoEndShipQuest( questId )

	if self:IsWaiting() then
		sys.log( "UI.QuestsWnd:DoEndShipQuest()[ERROR]: is waiting for another request" )
		return
	end

	self.endShipQuestRequestId = _G.MasterServer_EndShipQuest( questId )

	if self.endShipQuestRequestId == 0 then
		self:ShowMsgOnEndShipQuestError( _G.MasterServer.ShipQuestOpResult.SQOR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.QuestsWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.QuestsWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	if self.hMsgEndShipQuest ~= UI.INVALID_UI_HANDLE then

		UI:RemoveUiObj( self.hMsgEndShipQuest )

		self.hMsgEndShipQuest = UI.INVALID_UI_HANDLE
		self.shipQuestIdToEnd = nil

	end
	
	UI.Quests_CharacterInfoWnd:Hide()
	
	if self.hMsgLeaveQueue ~= UI.INVALID_UI_HANDLE then

		UI:RemoveUiObj( self.hMsgLeaveQueue ) 
		
		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE
		self.questIdForNewGameplay = nil
		self.btnActionForNewGameplay = nil

	end

end


--
function UI.QuestsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgEndShipQuest then

		if retCode == UI.MBRET_YES then
			if self.shipQuestIdToEnd then
				self:DoEndShipQuest( self.shipQuestIdToEnd )
			else
				sys.log( "UI.QuestsWnd:F_OnEventMsgBoxRet()[ERROR]: no stored quest" )
			end
		end

		self.hMsgEndShipQuest = UI.INVALID_UI_HANDLE
		self.shipQuestIdToEnd = nil
		
	elseif boxHandle == self.hMsgLeaveQueue then
	
		if retCode == UI.MBRET_YES then
			self:DoLeaveQueue()
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		else
			self.questIdForNewGameplay = nil
			self.btnActionForNewGameplay = nil
		end
		
		self.hMsgLeaveQueue = UI.INVALID_UI_HANDLE
		
	end

end  


--
function UI.QuestsWnd:ShowMsgOnEndShipQuestError( result )

	UI:ShowErrorMsg( "msg_endShipQuestError", result, "_G.MasterServer.ShipQuestOpResult" )

end


--
function UI.QuestsWnd:LaunchShipsWnd( questId )

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.QuestsWnd:LaunchShipsWnd()[ERROR]: hangar HangarWnd is not on screen" )
		return
	end

	local launchData = self:GetShipsLaunchData()
	
	if not launchData then
		launchData = {}
	end	
	
	launchData.questId		= questId
	launchData.questType	= UI.questTypes.SHIP

	UI.HangarWnd:OpenShipsForQuest( questId, launchData, nil, true )

end


-- для перегрузки
function UI.QuestsWnd:GetShipsLaunchData()

	sys.log( "UI.QuestsWnd:GetShipsLaunchData()[ERROR]: must be overloaded" )
	return launchData

end


--
function UI.QuestsWnd:GetQuests()

	-- списоком квестов заведует карта галактики, даже если они показываются не в ней, а в другом месте, так исторически сложилось
	return UI.GameplayPveMapWnd:GetQuests()

end


--
function UI.QuestsWnd:GetAdventures()

	return UI.GameplayPveMapWnd:GetAdventures()

end


--
function UI.QuestsWnd:UpdateTabs()

	local tabs = {}
	for category, questsForCategory in pairs( self.quests ) do
		table.insert( tabs, category )
	end	

	if next( self.adventures ) then
		table.insert( tabs, _G.QuestCategory.ADVENTURE )
	end

	table.sort( tabs )
	
	self.tabsWnd:SetTabs( tabs )

end


--
function UI.QuestsWnd:OnGameplayLaunchContextChanged()
	
	self.questsList:OnGameplayLaunchContextChanged()
	
end


--
function UI.QuestsWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- скрытие по клику мимо окна
	if self:GetSelTab() ~= -1 then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		
		if wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) and not UI:GetFirstOverlayWnd() then
			self.tabsWnd:SelectTab( -1 )
		end
		
	end

end


-- -----------------------------------------------------------------------
-- UI.Quests_TabsWnd
-- -----------------------------------------------------------------------

UI.Quests_TabsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_TabsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_TabsWnd",
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
				defName 			= "gameplay_map_pve_quests_tabs2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_TabsWnd:SetTabs( tabs )

	self:Reset()

	self.tabs = tabs

	for idx, tab in ipairs( tabs ) do
		local btn = self:ObtainBtn()
		if btn then
			btn:Setup( tab )
		end
	end

	self:RecalcLayout()
	
end


--
function UI.Quests_TabsWnd:GetTabs()

	return self.tabs

end


--
function UI.Quests_TabsWnd:GetSelTab()

	return self.selTab

end


--
function UI.Quests_TabsWnd:SelectTab( tab )

	if tab == self.selTab then
		return
	end
	
	if tab ~= -1 then
	
		local bFound = false
		for idx, _tab in pairs( self.tabs ) do
			if _tab == tab then
				bFound = true
				break
			end
		end
		
		if not bFound then
			sys.log( "UI.Quests_TabsWnd:SelectTab()[ERROR]: invalid tab %s", tostring( tab ) )
			return
		end
		
	end

	local bNeedUnlinkLists = false
	if self:IsAdventureTab() or self:IsAdventureTab( tab ) then
		bNeedUnlinkLists = true
	end

	self.selTab = tab
	
	self:UpdateBtnsStates()
	
	local parent = self:GetParent()
	if parent then
	
		if UI:IsWndKindOf( parent, "QuestsWnd" ) then

			if bNeedUnlinkLists == true then
				parent:UnlinkLists()
			end

			parent:OnSelTabChanged()

		else
			sys.log( "UI.Quests_TabsWnd:SelectTab()[ERROR]: invalid parent; kind of QuestsWnd expected" )
		end
	
	end
	
end

--
function UI.Quests_TabsWnd:IsAdventureTab( tab )

	if tab ~= nil then
		return tab == _G.QuestCategory.ADVENTURE
	else
		return self.selTab == _G.QuestCategory.ADVENTURE
	end
end

-- ---------------------------
-- const
-- ---------------------------

UI.Quests_TabsWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Quests_TabsWnd.effectInfo =
{
	main =
	{
		btnLocatorPrefix	= "tab_btn_",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_TabsWnd.tabs			= {}
UI.Quests_TabsWnd.allBtns		= {}
UI.Quests_TabsWnd.btns			= {}
UI.Quests_TabsWnd.selTab		= -1
UI.Quests_TabsWnd.space_btns	= 0
UI.Quests_TabsWnd.btnHeight		= 0
UI.Quests_TabsWnd.btnsX			= 0

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_TabsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.tabs		= {}
	self.allBtns	= {}
	self.btns		= {}

	self:InitBtns()
	self:PrepareLayout()

end


--
function UI.Quests_TabsWnd:InitBtns()

	for idx = 1, 1 do
		self:CreateBtn()
	end

end


--
function UI.Quests_TabsWnd:Reset()

	self:SelectTab( -1 )
	
	self.tabs = {}

	for idx, btn in pairs( self.btns ) do
		btn:Reset()
		btn:UnlinkFromParent()
	end
	self.btns = {}

end


--
function UI.Quests_TabsWnd:ObtainBtn()

	local freeBtn = nil

	for idx, btn in pairs( self.allBtns ) do
		if not btn:IsChildOf( self ) then
			freeBtn = btn
			break
		end
	end

	if not freeBtn then
		freeBtn = self:CreateBtn()
	end

	if freeBtn then
		table.insert( self.btns, freeBtn )
		self:AddChild( freeBtn )
	end

	return freeBtn

end


--
function UI.Quests_TabsWnd:CreateBtn()

	local btn = UI:CreateChildWnd( self, UI.Quests_TabBtn, tostring( #self.allBtns + 1 ) )
	table.insert( self.allBtns, btn )
	return btn

end


--
function UI.Quests_TabsWnd:UpdateBtnsStates()

	for idx, btn in pairs( self.btns ) do
		btn:Check( btn:GetTab() == self.selTab )
		btn:UpdateBlink()
	end

end


--
function UI.Quests_TabsWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local btn			= self.allBtns[ 1 ]	

	local firstBtnPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.btnLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondBtnPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.btnLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local btnHeight		= btn and btn:GetHeight() or 0

	self.space_btns = secondBtnPos.y - ( firstBtnPos.y + btnHeight )
	self.btnHeight	= btnHeight
	self.btnsX		= firstBtnPos.x

end


--
function UI.Quests_TabsWnd:RecalcLayout()

	if not next( self.btns ) then
		return
	end

	local btnHeight = self.btns[ 1 ]:GetHeight()
	local numBtns = #self.btns
	local btnsHeight = btnHeight * numBtns + self.space_btns * ( numBtns - 1 )

	local btnsY = ( self:GetHeight() - btnsHeight ) / 2

	for idx, btn in pairs( self.btns ) do
		local y = btnsY + ( btnHeight + self.space_btns ) * ( idx - 1 )
		btn:SetPos( self.btnsX, UI:YRel2Snapped( y ) )
	end

end


--
function UI.Quests_TabsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Quests_TabBtn" ) then

		if not wnd:IsChecked() then
			self:SelectTab( wnd:GetTab() )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		else
			self:SelectTab( -1 )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	end

	return true

end


-- -----------------------------------------------------------------------
-- UI.Quests_TabBtn
-- -----------------------------------------------------------------------

UI.Quests_TabBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.Quests_TabBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	BLINK_EFFECT	= 2,
}

--
UI.Quests_TabBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Quests_TabBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Quests_TabBtn.layers ),
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_tab",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "blink",
						layer		= "UI.Quests_TabBtn.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- BLINK_EFFECT
		{
			id			= UI.Quests_TabBtn.layers.BLINK_EFFECT,
			
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_menu_btn_notify",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_TabBtn:Setup( tab )

	self:Reset()

	self.tab = tab

	self:UpdateIco()
	self:UpdateTooltip()
	self:UpdateBlink()

end


--
function UI.Quests_TabBtn:Reset()

	self.tab			= -1
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_unchecked, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_checked, UI.INVALID_RESOURCE_HANDLE )
	end
	
	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

end


--
function UI.Quests_TabBtn:GetTab()

	return self.tab

end


--
function UI.Quests_TabBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Quests_TabBtn:UpdateBlink()

	-- списоком квестов заведует карта галактики, даже если они показываются не в ней, а в другом месте, так исторически сложилось
	local bNeedBlink = not self:IsChecked() and UI.GameplayPveMapWnd:IsQuestToBlink( self.tab )	-- #0107058(0499621) - проверка на IsChecked(), т.к. если вкладка открыта, то мигалка не должна показываться
	self:SetLayerVisible( bNeedBlink, self.layers.BLINK_EFFECT )
	
end


-- ----------------------------
-- const
-- ----------------------------


UI.Quests_TabBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "idle",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "select",
		animationPressed	= "select",
		animationDisabled	= "select",
	},

	icoSpriteName_unchecked	= "ico_idle",
	icoSpriteName_checked	= "ico_select",
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_TabBtn.tab			= -1
UI.Quests_TabBtn.tooltipData	= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Quests_TabBtn:UpdateIco()

	local tabName = UI:Val2Key( _G.QuestCategory, self.tab ) 

	local texName_unchecked	= string.format( "questCategory%s_idle", tabName )
	local texName_checked	= string.format( "questCategory%s_select", tabName )

	local hTex_unchecked	= UI:GetTex( texName_unchecked )
	local hTex_checked		= UI:GetTex( texName_checked )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_unchecked, hTex_unchecked )
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_checked, hTex_checked )
	end

end


--
function UI.Quests_TabBtn:UpdateTooltip()

	local tabName = UI:Val2Key( _G.QuestCategory, self.tab )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:QuestCategory2Str( self.tab ),
		text		= UI:GetStringByName( string.format( "questCategory_tooltipText_%s", tabName ) ),
	}

end

-- -----------------------------------------------------------------------
-- UI.Quests_QuestsListWnd
-- -----------------------------------------------------------------------

UI.Quests_QuestsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_QuestsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_QuestsListWnd",
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
				defName 			= "gameplay_map_pve_quests_questsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.Quests_QuestsListWnd.layers.CATEGORY_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

				}
			}}
		},
		
		-- CATEGORY_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_QuestsListWnd:SetQuests( category, quests )
	
	self.bLockRecalcLayout = true
	self:Reset()
	
	self.category	= category
	self.quests		= quests
	
	for idx, questInfo in ipairs( self.quests ) do

		local slotWnd = self:ObtainSlot()
		if slotWnd then

			if questInfo.groupId ~= -1 then
				slotWnd:SetupForGroup( questInfo.groupId, questInfo.groupQuests )
			else
				slotWnd:SetupForQuest( questInfo )
			end

		end

	end

	self.bLockRecalcLayout = false
	self:RecalcLayout()
	
	self:UpdateCategoryName()

end


--
function UI.Quests_QuestsListWnd:Reset()

	self.category		= -1
	self.quests			= {}
	self.selQuestId		= -1
	self.selQuestType	= -1

	if next( self.curSlots ) then

		self.bLockRecalcLayout = true
		for slotIdx, slotWnd in pairs( self.curSlots ) do
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
		self.curSlots = {}

		self.bLockRecalcLayout = false
		self:RecalcLayout()

	end
	
	self:SetText( "", self.layers.CATEGORY_NAME )

end


--
function UI.Quests_QuestsListWnd:GetQuestLayout()

	local layout =
	{
		scrollPos		= self:GetScrollPos(),
		selQuestId		= self.selQuestId,
		selQuestType	= self.selQuestType,
	}
	
	return layout

end


--
function UI.Quests_QuestsListWnd:SetQuestLayout( layout )

	if not layout then
		return
	end
	
	self:SetScrollPos( layout.scrollPos )
	
	if layout.selQuestId ~= -1 then
	
		local slotWnd = self:GetSlotByQuest( layout.selQuestId, layout.selQuestType )
		if slotWnd then
			self:SelectQuest( layout.selQuestId, layout.selQuestType )
		end
		
	end

end


--
function UI.Quests_QuestsListWnd:ShowQuest( questId, questType, bSelect )

	local slotWnd = self:GetSlotByQuest( questId, questType )
	if slotWnd then
	
		self:SetScrollPos( slotWnd:GetTop() )
		
		if bSelect then
			self:SelectQuest( questId, questType )
		else
			self:SelectQuest( -1, -1 )
		end

	else
		sys.log( "UI.Quests_QuestsListWnd:ShowQuest()[ERROR]; cannot find slot for quest %d type %d", questId, questType )
	end

end


--
function UI.Quests_QuestsListWnd:OnPremiumChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPremiumChanged()
	end

end


--
function UI.Quests_QuestsListWnd:OnInvasionInfo()

	self.bLockRecalcLayout = true
	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnInvasionInfo()
	end
	
	self.bLockRecalcLayout = false
	self:RecalcLayout()

end


--
function UI.Quests_QuestsListWnd:OnAccountAurasChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnAccountAurasChanged()
	end

end


--
function UI.Quests_QuestsListWnd:OnSlotLayoutChanged( slotWnd )

	if slotWnd:IsChildOf( self ) then
		self:RecalcLayout()
	end

end


--
function UI.Quests_QuestsListWnd:OnGameplayLaunchContextChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnGameplayLaunchContextChanged()
	end

end


--
function UI.Quests_QuestsListWnd:OnBattlePassUnlockPremium()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnBattlePassUnlockPremium()
	end

end


-- ----------------------------
-- const
-- ----------------------------

UI.Quests_QuestsListWnd.layers =
{
	MAIN_EFFECT		= 0,
	CATEGORY_NAME	= 1,
}

UI.Quests_QuestsListWnd.effectInfo =
{
	main =
	{
		scrollLocaror		= "scroll",
		slotLocatorPrefix	= "q_slot_",
		closeBtnLocator		= "btn_x4",
	}
}

UI.Quests_QuestsListWnd.SCROLL_STEP			= UI:YToRel( 30, true )
UI.Quests_QuestsListWnd.WHEEL_SCROLL_STEP	= UI:YToRel( 100, true )

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_QuestsListWnd.category			= -1
UI.Quests_QuestsListWnd.quests				= {}

UI.Quests_QuestsListWnd.maskWnd				= nil
UI.Quests_QuestsListWnd.slotsWnd			= nil
UI.Quests_QuestsListWnd.scrollBar			= nil
UI.Quests_QuestsListWnd.closeBtn			= nil
UI.Quests_QuestsListWnd.allSlots			= {}
UI.Quests_QuestsListWnd.curSlots			= {}
UI.Quests_QuestsListWnd.space_slots			= 0
UI.Quests_QuestsListWnd.bLockRecalcLayout	= false
UI.Quests_QuestsListWnd.selQuestId			= -1
UI.Quests_QuestsListWnd.selQuestType		= -1

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Quests_QuestsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.quests		= {}
	self.allSlots	= {}
	self.curSlots	= {}
	
	self:InitControls()
	self:PrepareLayout()

	local uiHandle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.Quests_QuestsListWnd:InitControls()

	self.maskWnd	= UI:CreateChildWnd( self, UI.ButtonsList3_SlotsWnd, "" )
	self.slotsWnd	= UI:CreateChildWnd( self, UI.Quests_QuestsList_SlotsWnd, "" )
	
	self:AddChild( self.maskWnd )
	self.maskWnd:AddChild( self.slotsWnd )

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_3, "" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollLocaror, UI.EffectAnimParams.POS )	

	for idx = 1, 1 do
		self:CreateSlot()
	end
	
	self.closeBtn = UI:CreateChildWnd( self, UI.Quests_CloseBtn, "" )
	UI:AddChildAndLink( self, self.closeBtn, mainEffect, self.effectInfo.main.closeBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.Quests_QuestsListWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd = self.allSlots[ 1 ]

	local scrollSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollLocaror ) or Vec2( 0, 0 )
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local slotSize		= Vec2( slotWnd:GetWidth(), slotWnd:GetBaseHeight() )

	self.space_slots = secondSlotPos.y - ( firstSlotPos.y + slotSize.y )

	local maskRect = Quat( firstSlotPos.x, firstSlotPos.y, slotSize.x, self:GetHeight() - firstSlotPos.y )
	self.maskWnd:SetRect( maskRect )

	self.slotsWnd:SetWidth( slotSize.x )

	self.scrollBar:SetHeight( scrollSize.y )
	self.scrollBar:SetPageSize( maskRect.w )
	self.scrollBar:SetStepSize( self.SCROLL_STEP )

end


--
function UI.Quests_QuestsListWnd:RecalcLayout()

	if self.bLockRecalcLayout then
		return
	end

	-- позиции слотов

	local slotsBtm = 0

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		local slotY = slotsBtm + ( slotIdx > 1 and self.space_slots or 0 )
		slotWnd:SetTop( UI:YRel2Snapped( slotY ) )

		slotsBtm = slotY + slotWnd:GetHeight()

	end


	-- размер окна слотов
	
	self.slotsWnd:SetHeight( slotsBtm )


	-- скролбар - видимость, max range

	local scrollSize = self.slotsWnd:GetHeight() - self.maskWnd:GetHeight()

	if scrollSize > 1e-3 then
		self.scrollBar:SetRange( 0, scrollSize )
		self:AddChild( self.scrollBar )
	else
		self.scrollBar:SetRange( 0, 0 )
		self.scrollBar:UnlinkFromParent()
	end

	self:OnScrollPosChanged()

end


--
function UI.Quests_QuestsListWnd:OnScrollPosChanged()

	self.slotsWnd:SetTop( -UI:YRel2Snapped( self:GetScrollPos() ) )

end


--
function UI.Quests_QuestsListWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:OnScrollPosChanged()

end


--
function UI.Quests_QuestsListWnd:GetScrollPos()

	return self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0

end


--
function UI.Quests_QuestsListWnd:SetScrollPos( scrollPos )

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( scrollPos )
	end

end


--
function UI.Quests_QuestsListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Quests_QuestSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	else
		sys.log( "UI.Quests_QuestsListWnd:CreateSlot()[ERROR]: cannot create slot" )
	end

	return slotWnd

end


--
function UI.Quests_QuestsListWnd:ObtainSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	if freeSlotWnd then
		table.insert( self.curSlots, freeSlotWnd )
		self.slotsWnd:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.Quests_QuestsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.scrollBar:IsChildOf( self ) then
		self:SetScrollPos( self:GetScrollPos() - self.WHEEL_SCROLL_STEP * ticks )
	end

	return true

end


--
function UI.Quests_QuestsListWnd:GetSlotByQuest( questId, questType )

	local foundSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.curSlots ) do
	
		if slotWnd:GetGroupId() ~= -1 then
		
			if questType == UI.questTypes.REGULAR then
				for questIdx, questInfo in pairs( slotWnd:GetGroupQuests() ) do
					if questInfo.questId == questId then
						foundSlotWnd = slotWnd
						break
					end
				end
			end
		
		else
		
			if slotWnd:GetQuestId() == questId and slotWnd:GetQuestType() == questType then
				foundSlotWnd = slotWnd
			end

		end
		
		if foundSlotWnd then
			break
		end
	
	end
	
	return foundSlotWnd

end


--
function UI.Quests_QuestsListWnd:SelectQuest( questId, questType )

	if questId == self.selQuestId and questType == self.selQuestType then
		return
	end
	
	if questId ~= -1 then
	
		local selSlotWnd = self:GetSlotByQuest( questId, questType )
		
		if selSlotWnd then
			selSlotWnd:Select( true )
		else
			sys.log( "UI.Quests_QuestsListWnd:SelectQuest()[ERROR]; cannot find slot for quest %d type %d", questId, questType )
		end

	end
	
	if self.selQuestId ~= -1 then
	
		local oldSelSlotWnd = self:GetSlotByQuest( self.selQuestId, self.selQuestType )
		
		if oldSelSlotWnd then
			oldSelSlotWnd:Select( false )
		end
		
	end
	
	self.selQuestId		= questId
	self.selQuestType	= questType
	
end


--
function UI.Quests_QuestsListWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end
	
	-- при движении мышью временное выделение сбрасывается
	self:SelectQuest( -1, -1 )
	
	return true
	
end


--
function UI.Quests_QuestsListWnd:UpdateCategoryName()

	local str = ""

	if self.category ~= -1 then
		str = UI:QuestCategory2Str( self.category )
	end

	self:SetText( str, self.layers.CATEGORY_NAME )

end


-- -----------------------------------------------------------------------
-- UI.Quests_QuestsList_SlotsWnd
-- -----------------------------------------------------------------------

UI.Quests_QuestsList_SlotsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_QuestsList_SlotsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_QuestsList_SlotsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true
	},
}

-- -----------------------------------------------------------------------
-- UI.Quests_QuestSlotWnd
-- -----------------------------------------------------------------------

UI.Quests_QuestSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_QuestSlotWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "Quests_QuestSlotWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "descript_2",
						layer		= "UI.Quests_QuestSlotWnd.layers.TASK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
		
					{
						objName		= "descript_1",
						layer		= "UI.Quests_QuestSlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
		
					{
						objName		= "title64",
						layer		= "UI.Quests_QuestSlotWnd.layers.PROGRESS_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
		
					{
						objName		= "try_text",
						layer		= "UI.Quests_QuestSlotWnd.layers.NUM_COMPLETIONS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "over",
						layer		= "UI.Quests_QuestSlotWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "completed",
						layer		= "UI.Quests_QuestSlotWnd.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "title",
						layer		= "UI.Quests_QuestSlotWnd.layers.QUEST_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "spacer_2",
						layer		= "UI.Quests_QuestSlotWnd.layers.SEPARATOR_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "title_2",
						layer		= "UI.Quests_QuestSlotWnd.layers.CHOICE_CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_frame",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_select",
				defaultAnimation	= "idle",
			}}
		},
		
		-- QUEST_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- TASK
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- CHOICE_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "quests_rewardChoiceLabel" ),
		},

		-- PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NUM_COMPLETIONS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_separator1",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_separator2",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_QuestSlotWnd:SetupForGroup( groupId, groupQuests )

	self:Reset()

	self.groupId		= groupId
	self.groupQuests	= groupQuests

	self:FullUpdate()

end


--
function UI.Quests_QuestSlotWnd:SetupForQuest( questInfo )

	self:Reset()

	self.questId	= questInfo.questId
	self.questType	= questInfo.questType
	self.questInfo	= questInfo

	self:FullUpdate()

end


--
function UI.Quests_QuestSlotWnd:Select( bSelected )
	
	self.bSelected = bSelected
	self:UpdateSelState()

end


--
function UI.Quests_QuestSlotWnd:Reset()

	self.groupId		= -1
	self.groupQuests	= nil
	self.questId		= -1
	self.questType		= -1
	self.questInfo		= nil
	self.bSelected		= false

    self.choiceList:Reset()
	self.choiceList:UnlinkFromParent()

	self:ResetQuestControls()	

end


--
function UI.Quests_QuestSlotWnd:GetGroupId()

	return self.groupId

end


--
function UI.Quests_QuestSlotWnd:GetGroupQuests()

	return self.groupQuests

end


--
function UI.Quests_QuestSlotWnd:GetQuestId()

	return self.questId

end


--
function UI.Quests_QuestSlotWnd:GetQuestType()

	return self.questType

end


--
function UI.Quests_QuestSlotWnd:GetBaseHeight()

	return self.maxHeight

end


--
function UI.Quests_QuestSlotWnd:IsSelected()

	return self.bSelected
	
end


--
function UI.Quests_QuestSlotWnd:OnSelChoiceChanged( selQuestId )

	local selQuestInfo = nil

	if selQuestId ~= -1 then

    	if self.groupQuests then
    		for idx, questInfo in pairs( self.groupQuests ) do
    			if questInfo.questId == selQuestId then
    				selQuestInfo = questInfo
    				break
    			end
    		end
    	end

    	if not selQuestInfo then
    		sys.log( "UI.Quests_QuestSlotWnd:OnSelChoiceChanged()[ERROR]: cannot find quest info" )
			selQuestId = -1
    	end

	end

	self.questId	= selQuestId
	self.questType	= UI.questTypes.REGULAR
	self.questInfo	= selQuestInfo

	self:UpdateQuestControls()

end


--
function UI.Quests_QuestSlotWnd:OnPremiumChanged()

	if self.questId ~= -1 then
		self:UpdateReward()
	end

	if self.choiceList:IsChildOf( self ) then
		self.choiceList:OnPremiumChanged()
	end

end


--
function UI.Quests_QuestSlotWnd:OnInvasionInfo()

	if self.questId ~= -1 and self.questType == UI.questTypes.REGULAR then
    	if UI:GetQuestEventForStage( self.questId, UI:GetQuestStage( self.questId ) ) == ai.GameEvent.REPEL_INVASION then
    		self:UpdateTask()
    		self:UpdateProgress()
    		self:RecalcLayout()
    	end
	end

end


--
function UI.Quests_QuestSlotWnd:OnAccountAurasChanged()

	if self.questId ~= -1 then
		self:UpdateReward()
		self:UpdateBtns()
	end

end


--
function UI.Quests_QuestSlotWnd:OnGameplayLaunchContextChanged()

	if self.actionBtn:IsChildOf( self ) then
		local action = self.actionBtn:GetAction()
		if action == self.actions.TRANSFER_TO_ZONE or action == self.actions.LAUNCH_PVE then
			self:UpdateBtns()
		end
	end
	
end


--
function UI.Quests_QuestSlotWnd:OnBattlePassUnlockPremium()

	if self.actionBtn:IsChildOf( self ) then
		local action = self.actionBtn:GetAction()
		if action == self.actions.TRANSFER_TO_ZONE then
			self:UpdateBtns()
			self:UpdateTask()
		end
	end

end


-- ----------------------------
-- const
-- ----------------------------

UI.Quests_QuestSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	FRAME_EFFECT		= 1,
	SELECT_EFFECT		= 2,
	QUEST_NAME			= 3,
	TASK				= 4,
	DESC				= 5,
	CHOICE_CAPTION		= 6,
	PROGRESS_VAL		= 7,
	NUM_COMPLETIONS		= 8,
	SEPARATOR_1_EFFECT	= 9,
	SEPARATOR_2_EFFECT	= 10,
}

UI.Quests_QuestSlotWnd.actions =
{
	TAKE				= 1,
	COMPLETE			= 2,
	TRANSFER_TO_ZONE	= 3,
	LAUNCH_PVE			= 4,
	SHIPS				= 5,
}

UI.Quests_QuestSlotWnd.effectInfo =
{
	main =
	{
		characterLocator						= "pers_slot",
		rewardLocator							= "item_ico",
		questNameLocator_isCharacter_isReward	= "title",
		questNameLocator_noCharacter_noReward	= "title_3",
		taskLocator_isCharacter_isReward		= "descript_3",
		taskLocator_noCharacter_noReward		= "descript_2",
		descLocator								= "descript_1",
		choiceListLocator						= "diffiulty",
		sep1Locator								= "spacer",
		progressPbLocator						= "progr",
		minSizeLocator							= "dist_min",
		maxSizeLocator							= "self155",
		timeLocator								= "timer2",
		refuseBtnLocator						= "btn_x",
		endShipQuestBtnLocator					= "btn_x",
		groupQuestTaskLocator					= "descript_7",
		footerLocator							= "dist_min_2",
		characterIcoLocator						= "pers_slot",
		actionBtnLocator						= "status",
	},

	characterIco =
	{
		spriteName = "ico"
	},
	
	frame =
	{
		anim_TAKE		= "unlock",
		anim_COMPLETE	= "idle",
		anim_SHIPS		= "assign",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_QuestSlotWnd.groupId							= -1
UI.Quests_QuestSlotWnd.groupQuests						= nil
UI.Quests_QuestSlotWnd.questInfo						= nil
UI.Quests_QuestSlotWnd.bSelected						= false
		
UI.Quests_QuestSlotWnd.questId							= -1
UI.Quests_QuestSlotWnd.questType						= -1
UI.Quests_QuestSlotWnd.rewardIco						= nil
UI.Quests_QuestSlotWnd.shipPartRewardIco				= nil
UI.Quests_QuestSlotWnd.timeWnd							= nil
UI.Quests_QuestSlotWnd.choiceList						= nil
UI.Quests_QuestSlotWnd.refuseBtn						= nil
UI.Quests_QuestSlotWnd.endShipQuestBtn					= nil
UI.Quests_QuestSlotWnd.actionBtn						= nil
UI.Quests_QuestSlotWnd.characterIco						= nil
UI.Quests_QuestSlotWnd.numCompletionsMetaText			= nil
UI.Quests_QuestSlotWnd.nameMetaText						= nil
UI.Quests_QuestSlotWnd.taskMetaText						= nil

UI.Quests_QuestSlotWnd.questNameLeft_isCharacter		= 0
UI.Quests_QuestSlotWnd.questNameLeft_noCharacter		= 0
UI.Quests_QuestSlotWnd.questNameRight_isReward			= 0
UI.Quests_QuestSlotWnd.questNameRight_isReward_shipPart	= 0
UI.Quests_QuestSlotWnd.questNameRight_noReward			= 0
UI.Quests_QuestSlotWnd.taskLeft_isCharacter				= 0
UI.Quests_QuestSlotWnd.taskLeft_noCharacter				= 0
UI.Quests_QuestSlotWnd.taskRight_isReward				= 0
UI.Quests_QuestSlotWnd.taskRight_isReward_shipPart		= 0
UI.Quests_QuestSlotWnd.taskRight_noReward				= 0
UI.Quests_QuestSlotWnd.space_top_questName				= 0
UI.Quests_QuestSlotWnd.space_questName_task				= 0
UI.Quests_QuestSlotWnd.space_topPart_sep				= 0
UI.Quests_QuestSlotWnd.space_sep_desc					= 0
UI.Quests_QuestSlotWnd.footerHeight						= 0
UI.Quests_QuestSlotWnd.minHeight						= 0
UI.Quests_QuestSlotWnd.maxHeight						= 0
UI.Quests_QuestSlotWnd.characterIcoHeight				= 0
UI.Quests_QuestSlotWnd.groupQuestTaskRect				= Quat( 0, 0, 0, 0 )
UI.Quests_QuestSlotWnd.space_timer_actionBtn			= 0
UI.Quests_QuestSlotWnd.space_actionBtn_right			= 0
UI.Quests_QuestSlotWnd.space_timer_btm					= 0

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Quests_QuestSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end
	
	self.groupQuestTaskRect = Quat( 0, 0, 0, 0 )
	
	self.numCompletionsMetaText = UI.MetaText.GetNewInstance()
	self.numCompletionsMetaText:InitFromLayer( self, self.layers.NUM_COMPLETIONS )
	
	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.QUEST_NAME )
	
	self.taskMetaText = UI.MetaText.GetNewInstance()
	self.taskMetaText:InitFromLayer( self, self.layers.TASK )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.Quests_QuestSlotWnd:F_Shutdown()

	if self.numCompletionsMetaText then
		self.numCompletionsMetaText:Clear()
	end
	
	if self.nameMetaText then
		self.nameMetaText:Clear()
	end
	
	if self.taskMetaText then
		self.taskMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Quests_QuestSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Quests_QuestSlotWnd:UpdateMetaTextPos()

	self.numCompletionsMetaText:UpdateScreenOrgFromLayer( self, self.layers.NUM_COMPLETIONS )
	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.QUEST_NAME )
	self.taskMetaText:UpdateScreenOrgFromLayer( self, self.layers.TASK )

end


--
function UI.Quests_QuestSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NUM_COMPLETIONS then
		self.numCompletionsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.QUEST_NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.TASK then
		self.taskMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Quests_QuestSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMetaTextPos()

end


--
function UI.Quests_QuestSlotWnd:CreateControls()

    self.rewardIco			= UI:CreateChildWnd( self, UI.Quests_RewardIco, "" )
	self.shipPartRewardIco	= UI:CreateChildWnd( self, UI.ShipPartIcoWnd, "" )
    self.timeWnd			= UI:CreateChildWnd( self, UI.Quests_TimeWnd, "" )
    self.choiceList			= UI:CreateChildWnd( self, UI.Quests_ChoiceListWnd, "" )
    self.refuseBtn			= UI:CreateChildWnd( self, UI.Quests_RefuseQuestBtn, "" )
	self.endShipQuestBtn	= UI:CreateChildWnd( self, UI.Quests_EndShipQuestBtn, "" )
	self.actionBtn			= UI:CreateChildWnd( self, UI.Quests_QuestActionBtn, "" )
	self.characterIco		= UI:CreateChildWnd( self, UI.Quests_CharacterIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.rewardIco, mainEffect, self.effectInfo.main.rewardLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.refuseBtn, mainEffect, self.effectInfo.main.refuseBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.endShipQuestBtn, mainEffect, self.effectInfo.main.endShipQuestBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.actionBtn, mainEffect, self.effectInfo.main.actionBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.choiceList, mainEffect, self.effectInfo.main.choiceListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.characterIco, mainEffect, self.effectInfo.main.characterIcoLocator, UI.EffectAnimParams.POS )

end


--
function UI.Quests_QuestSlotWnd:FullUpdate()

	if self.groupId ~= -1 then
		self:UpdateChoice()
	else
		self:UpdateQuestControls()
	end
	
	self:UpdateSelState()

end


--
function UI.Quests_QuestSlotWnd:ResetQuestControls()

	self:SetText( "", self.layers.TASK )
	self:SetText( "", self.layers.PROGRESS_VAL )

	self:SetLayerVisible( false, self.layers.QUEST_NAME )
	self:SetLayerVisible( false, self.layers.DESC )
	self:SetLayerVisible( false, self.layers.CHOICE_CAPTION )
	self:SetLayerVisible( false, self.layers.NUM_COMPLETIONS )
	self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT )
	self:SetLayerVisible( false, self.layers.SEPARATOR_2_EFFECT )
	
	self.numCompletionsMetaText:SetText( "", true )
	self.nameMetaText:SetText( "", true )
	self.taskMetaText:SetText( "", true )

    self.rewardIco:Reset()
	self.rewardIco:UnlinkFromParent()
	
	self.shipPartRewardIco:Reset()
	self.shipPartRewardIco:UnlinkFromParent()

    self.timeWnd:Reset()
	self.timeWnd:UnlinkFromParent()
	
	self.characterIco:Reset()
	self.characterIco:UnlinkFromParent()
	
	self:ResetBtns()

end


--
function UI.Quests_QuestSlotWnd:UpdateQuestControls()

	self:ResetQuestControls()

	if self.questId ~= -1 then
		
    	self:UpdateCharacterIco()
		self:UpdateQuestName()
    	self:UpdateTask()
    	self:UpdateReward()
    	self:UpdateDesc()
		self:UpdateChoiceCaption()
    	self:UpdateProgress()
    	self:UpdateTime()
    	self:UpdateNumCompletions()
    	self:UpdateBtns()
		self:UpdateFrame()
		
	end

	self:RecalcLayout()

end


--
function UI.Quests_QuestSlotWnd:UpdateChoice()

	if self.groupId == -1 then
		return
	end

	self:AddChild( self.choiceList )
	self.choiceList:Setup( self.groupId, self.groupQuests )

end


--
function UI.Quests_QuestSlotWnd:UpdateCharacterIco()

	if self.questId == -1 or self.groupId ~= -1 then
		return
	end

	local character = ""

	if self.questType == UI.questTypes.REGULAR then
		character = UI:GetQuestCharacter( self.questId )

	elseif self.questType == UI.questTypes.SHIP then
		character = UI:GetShipQuestCharacter( self.questId )
	end

	if character ~= "" then
		self:AddChild( self.characterIco )
		self.characterIco:Setup( character )
	end

end


--
function UI.Quests_QuestSlotWnd:UpdateQuestName()
	
	local str = self:GetQuestName()
	
	if str ~= "" then
	
		self:SetLayerVisible( true, self.layers.QUEST_NAME )
		
		-- SC-111541 во время BattlePass перед названием квеста рисуется иконка ивентовой валюты; если названия нет, то перед описанием
		-- SC-115457 добавил проверку not UI:IsQuestDisabled( _G.QuestId.IMAGINARY )
		if ( not UI:IsQuestDisabled( _G.QuestId.IMAGINARY ) ) and ( self.questType == UI.questTypes.REGULAR ) and ( _G.MasterServer_BattlePassIsActive() or _G.GameStore_IsCreditsEventActive() ) then
			str = string.format( "$event_credits$%s", str )
		end
		
		self.nameMetaText:SetText( str, true )
		
	else
		self:SetLayerVisible( false, self.layers.QUEST_NAME )
	end
	
end


--
function UI.Quests_QuestSlotWnd:GetQuestName()

	if self.questId == -1 or self.questType ~= UI.questTypes.REGULAR or self.groupId ~= -1 then
		return ""
	end
	
	return UI:Quest2Str( self.questId, true, true )	

end


--
function UI.Quests_QuestSlotWnd:UpdateTask()

	if self.questId == -1 then
		return
	end

	local str = ""

	if self.questType == UI.questTypes.REGULAR then
	
		str = UI:GetQuestTaskDesc( self.questId, UI:GetQuestStage( self.questId ), true, self:GetColor( self.layers.TASK ) )
		
		-- надпись о недоступности зоны

		local stage 	= UI:GetQuestStage( self.questId )
		local allZones 	= UI:GetQuestZonesForStage( self.questId, stage )
		
		if next( allZones ) then

			local bHasFitZone	= false
			local minLockRank	= -1
			
			local accessibleZones	= UI:GetQuestAccessibleZonesForStage( self.questId, stage )
			local playerRank		= UI:GetPlayerAccountRank()
			local currentZoneId		= ( _G.GetCurrentGameMode() == ai.Gameplay.NONE ) and _G.MasterServer_GetSpaceStationZoneId() or _G.CL_GetCurrentSpaceZoneId()
			
			for idx, zoneId in pairs( allZones ) do
			
				local bFit = true
				
				if zoneId ~= currentZoneId and not UI:IsZoneAlwaysAccessible( zoneId ) then
				
					-- флаг 'allowed_jump' в дефе
					if not UI:IsZoneAllowedForTransfer( zoneId ) then
						bFit = false
					end
					
					-- аккаунт ранг
					if bFit then
					
						local bNeedCheckRank = true
					
						local bAccessibleByQuest = false
						for accessibleIdx, accessibleZoneId in pairs( accessibleZones ) do
							if accessibleZoneId == zoneId then
								bAccessibleByQuest = true
								break
							end
						end
						
						if bAccessibleByQuest then
							bNeedCheckRank = false
						end
						
						if bNeedCheckRank then
						
							local zoneRank = UI:GetZoneUnlockRank( zoneId )
							if zoneRank > playerRank then
							
								bFit = false
								
								if minLockRank == -1 or zoneRank < minLockRank then
									minLockRank = zoneRank
								end

							end
							
						end
						
					end
				
				end
				
				if bFit then
					bHasFitZone = true
					break
				end
				
			end
			
			if not bHasFitZone then
				
				if minLockRank ~= -1 then
				
					local strLockedZone, numSubst = string.gsub( UI:GetStringByName( "quests_lockedZone" ), "%$rank%$", tostring( minLockRank ) )
					
					if numSubst == 0 then
						sys.log( "UI.Quests_QuestSlotWnd:UpdateTask()[ERROR]: cannot find placeholder \"$rank$\" in string \"quests_lockedZone\"" )
						strLockedZone = string.format( "[INVALID STRING] Zone will be accessible on rank %d", minLockRank )
					end
					
					strLockedZone = string.format( "%s%s%s", UI:Color2Str( UI.RED_COLOR ), strLockedZone, UI:Color2Str( self:GetColor( self.layers.TASK ) ) )
					
					str = string.format( "%s|%s", str, strLockedZone )
				
				else
					sys.log( "UI.Quests_QuestSlotWnd:UpdateTask()[ERROR]: unhandled zone lock reason" )
				end
				
			end
		
		end
		
	elseif self.questType == UI.questTypes.SHIP then
		str = UI:GetShipQuestTaskDesc( self.questId )
	end
	
	if self.questInfo.bTaken and self.questInfo.bCanBeCompleted and _G.GetCurrentGameMode() ~= ai.Gameplay.NONE then
		str = string.format( "%s|%s%s", str, UI:Color2Str( UI.RED_COLOR ), UI:GetStringByName( "quests_returnToHangarToComplete" ) )
	end
	
	-- SC-111541 во время BattlePass перед названием квеста рисуется иконка ивентовой валюты; если названия нет, то перед описанием
	-- SC-115457 добавил проверку not UI:IsQuestDisabled( _G.QuestId.IMAGINARY )
	if ( not UI:IsQuestDisabled( _G.QuestId.IMAGINARY ) ) and ( self.questType == UI.questTypes.REGULAR ) and ( _G.MasterServer_BattlePassIsActive() or _G.GameStore_IsCreditsEventActive() ) then
	
		local strName = self:GetQuestName()
		if strName == "" then
			str  = string.format( "$event_credits$%s", str )
		end
		
	end

	self.taskMetaText:SetText( str, true )

end


--
function UI.Quests_QuestSlotWnd:UpdateReward()

	if self.questId == -1 or self.groupId ~= -1 then
		return
	end

	local reward = nil

	if self.questType == UI.questTypes.REGULAR then
		reward = UI:GetQuestSingleReward( self.questId, false, false, false, nil )

	elseif self.questType == UI.questTypes.SHIP then
		reward = UI:GetShipQuestSingleReward( self.questId )
	end

	if reward then
	
		if reward.rewardType == UI.questRewardTypes.ITEM and UI:IsDefShipPart( reward.defName ) then
			self:AddChild( self.shipPartRewardIco )
			self.shipPartRewardIco:Setup( reward.defName, reward.count )
		else
			self:AddChild( self.rewardIco )
			self.rewardIco:Setup( reward )
		end
		
	else
		sys.log( "UI.Quests_QuestSlotWnd:UpdateReward()[ERROR]: cannot find reward for quest %d", self.questId )
	end

end


--
function UI.Quests_QuestSlotWnd:UpdateDesc()

	local str = ""

	if self.questId ~= -1 and self.questType == UI.questTypes.REGULAR and self.groupId == -1 then
		str = UI:GetQuestLoreDesc( self.questId, self.questInfo.bCanBeCompleted or self.questInfo.bCompleted, self:GetColor( self.layers.DESC ), true )
	end
	
	if str ~= "" then
		self:SetLayerVisible( true, self.layers.DESC )
		self:SetText( str, self.layers.DESC )
	else
		self:SetLayerVisible( false, self.layers.DESC )
	end

end


--
function UI.Quests_QuestSlotWnd:UpdateChoiceCaption()

	local bNeedChoiceCaption =
		self.questId ~=-1
		and self.questType == UI.questTypes.REGULAR
		and self.groupId ~= -1
		and not self.choiceList:HasGroupTakenQuest()
		
	self:SetLayerVisible( bNeedChoiceCaption, self.layers.CHOICE_CAPTION )

end


--
function UI.Quests_QuestSlotWnd:UpdateProgress()

	if self.questId == -1 then
		return
	end

	local stage = self.questType == UI.questTypes.REGULAR and UI:GetQuestStage( self.questId ) or -1

	local curVal = 0
	local maxVal = 0

	if self.questType == UI.questTypes.REGULAR then

		maxVal = UI:GetQuestTaskMaxVal( self.questId, stage )

		if self.questInfo.bTaken then
			curVal = UI:GetQuestTaskCurVal( self.questId )

		elseif self.questInfo.bCompleted then
			curVal = maxVal
		end

	elseif self.questType == UI.questTypes.SHIP then

    	maxVal = UI:GetShipQuestMaxTime( self.questId )

		if self.questInfo.bTaken then
			curVal = maxVal - UI:GetShipQuestTimeLeft( self.questId )

		elseif self.questInfo.bCompleted then
			curVal = maxVal
		end

	end
	

	local str = ""

	if self.questType == UI.questTypes.REGULAR and UI:GetQuestEventForStage( self.questId, stage ) == ai.GameEvent.ONLINE or self.questType == UI.questTypes.SHIP then

		local timeLeft = -1

		if self.questInfo.bTaken then
			if not self.questInfo.bCanBeCompleted then
				timeLeft = math.max( maxVal - curVal, 0 )
			end
		else
			if not self.questInfo.bCompleted then
				timeLeft = maxVal
			end
		end

		if timeLeft ~= -1 then
			str = UI:Time2Str45( timeLeft )
		end

	else
		str = string.format( "%s/%s", UI:Num2StrSeparatedBy3( curVal ), UI:Num2StrSeparatedBy3( maxVal ) )
	end

	self:SetText( str, self.layers.PROGRESS_VAL )

end


--
function UI.Quests_QuestSlotWnd:UpdateTime()

	if self.questId == -1 then
		return
	end

	local timeDisable = ( self.questType == UI.questTypes.REGULAR and UI:IsQuestInterval( self.questId ) ) and UI:GetIntervalQuestDisableTime( self.questId ) or UI.INVALID_U64_ID

	if timeDisable ~= UI.INVALID_U64_ID then
		self:AddChild( self.timeWnd )
		self.timeWnd:Setup( timeDisable )
	else
    	self.timeWnd:Reset()
		self.timeWnd:UnlinkFromParent()
	end

end


--
function UI.Quests_QuestSlotWnd:UpdateNumCompletions()

	if self.questId == -1 then
		return
	end

	if self.questType == UI.questTypes.REGULAR and ( UI:IsQuestInterval( self.questId ) or UI:IsQuestRecurrent( self.questId ) ) then
    	
    	local maxCompletions = UI:GetQuestMaxCompletions( self.questId )
		if maxCompletions > 1 then
		
			self:SetLayerVisible( true, self.layers.NUM_COMPLETIONS )
			
			local numCompletions = UI:GetQuestNumCompletions( self.questId )
			
			local str = string.format( "%s/%s", UI:Num2StrSeparatedBy3( numCompletions ), UI:Num2StrSeparatedBy3( maxCompletions ) )
			local color = self:GetColor( self.layers.NUM_COMPLETIONS )
			
			local strLink = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", tooltipTextId=\"quests_numCompletions_tooltipText\", tooltipCaptionId=\"quests_numCompletions_tooltipCaption\", colorSel=%u, colorUnsel=%u}]$", str, color, color )
			self.numCompletionsMetaText:SetText( strLink, true )

		else
			self:SetLayerVisible( false, self.layers.NUM_COMPLETIONS )
			self.numCompletionsMetaText:SetText( "", true )
		end

	end

end


--
function UI.Quests_QuestSlotWnd:ResetBtns()

	self.refuseBtn:UnlinkFromParent()
	self.refuseBtn:Enable( true )
	self.refuseBtn:SetGray( false )
	self.refuseBtn:SetTooltipData( nil )
	
	self.endShipQuestBtn:UnlinkFromParent()
	self.endShipQuestBtn:Enable( true )
	self.endShipQuestBtn:SetGray( false )

	self.actionBtn:UnlinkFromParent()
	self.actionBtn:Enable( true )
	self.actionBtn:SetGray( false )

end


--
function UI.Quests_QuestSlotWnd:UpdateBtns()

	if self.questId == -1 then
		return
	end

	self:ResetBtns()

	if self.questType == UI.questTypes.REGULAR then
	
		-- кнопка отказа от предложенного повторяемого квеста (сменить его на другой)
	
		if	UI:IsQuestRecurrent( self.questId )
			and not UI:IsQuestUnchangeable( self.questId )
			and not self.questInfo.bCompleted
			and ( self.questInfo.bTaken or not UI:IsQuestManuallyOfferable( self.questId ) )
			and not UI:IsQuestTheOnlyInGroup( self.questId ) then
	
			self:AddChild( self.refuseBtn )
	
			if UI:IsQuestManuallyOfferable( self.questId ) then
	
				local refuseTooltipData =
				{
					tooltipType	= UI.tooltipTypes.TEXT_LARGE,
					caption		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipCaption" ),
					text		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipText_cancelQuest" ),
				}
				self.refuseBtn:SetTooltipData( refuseTooltipData )
	
			else
	
				if _G.MasterServer_CanChangeQuest() then
	
					local refuseTooltipData =
					{
						tooltipType	= UI.tooltipTypes.TEXT_LARGE,
						caption		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipCaption" ),
						text		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipText" ),
					}
					self.refuseBtn:SetTooltipData( refuseTooltipData )
				
				else
	
					self.refuseBtn:SetGray( true )
	
					local refuseTooltipData =
					{
						tooltipType	= UI.tooltipTypes.TEXT_LARGE,
						caption		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipCaption" ),
						text		= UI:GetStringByName( "tutorialQuest_refuseBtn_tooltipText_cantRefuse" ),
					}
					self.refuseBtn:SetTooltipData( refuseTooltipData )
	
				end
	
			end
	
		end
	
		-- кнопка основного действия
		
		if self.questInfo.bTaken then
		
			if self.questInfo.bCanBeCompleted then
			
				-- завершить
				self:AddChild( self.actionBtn )
				self.actionBtn:SetAction( self.actions.COMPLETE )
				
			else
				
				-- перелететь в зону открытого мира
				if next( UI:GetQuestZonesForStage( self.questId, UI:GetQuestStage( self.questId ) ) ) then
					
					self:AddChild( self.actionBtn )
					self.actionBtn:SetAction( self.actions.TRANSFER_TO_ZONE )
					
					local bEnable = UI:GetQuestZoneToTransfer( self.questId ) ~= -1
					if bEnable then
						local questsWnd = UI:GetAncestorKindOf( self, "QuestsWnd" )
						if questsWnd then
							if not questsWnd:CanLaunchGameplay() then
								bEnable = false
							end
						end
					end
					self.actionBtn:Enable( bEnable )
				
				-- запустить пве-миссию
				elseif UI:GetQuestPveMission( self.questId ) ~= "" or UI:GetQuestPveLevel( self.questId ) ~= "" then
				
					self:AddChild( self.actionBtn )
					self.actionBtn:SetAction( self.actions.LAUNCH_PVE )
					
					local bEnable = true
					local questsWnd = UI:GetAncestorKindOf( self, "QuestsWnd" )
					if questsWnd then
						if not questsWnd:CanLaunchGameplay() then
							bEnable = false
						end
					end
					self.actionBtn:Enable( bEnable )

				end
				
			end
			
		else
		
			-- взять
			self:AddChild( self.actionBtn )
			self.actionBtn:SetAction( self.actions.TAKE )
			self.actionBtn:Enable( self.questInfo.bCanBeTaken )
			
		end

	elseif self.questType == UI.questTypes.SHIP then

		-- кнопка досрочного прерывания

		if self.questInfo.bTaken and not self.questInfo.bCanBeCompleted then
			self:AddChild( self.endShipQuestBtn )
		end
		
		-- кнопка основного действия
		
		if self.questInfo.bTaken then
		
			if self.questInfo.bCanBeCompleted then
				-- завершить
				self:AddChild( self.actionBtn )
				self.actionBtn:SetAction( self.actions.COMPLETE )
			end
		
		else
			-- назначить корабли
			self:AddChild( self.actionBtn )
			self.actionBtn:SetAction( self.actions.SHIPS )
		end

	end
	
	-- во время геймплея все кнопки неактивны
	
	if _G.GetCurrentGameMode() ~= ai.Gameplay.NONE then
	
		if self.refuseBtn:IsChildOf( self ) then
			self.refuseBtn:Enable( false )
		end
		
		if self.endShipQuestBtn:IsChildOf( self ) then
			self.endShipQuestBtn:Enable( false )
		end
		
		if self.actionBtn:IsChildOf( self ) then
			self.actionBtn:Enable( false )
		end

	end
	
end


--
function UI.Quests_QuestSlotWnd:UpdateFrame()
	
	if self.questId == -1 then
		return
	end
	
	local anim = ""
	
	if self.questInfo.bCanBeCompleted then
		anim = self.effectInfo.frame.anim_COMPLETE
		
	elseif not self.questInfo.bTaken then
		anim = self.questType == UI.questTypes.SHIP and self.effectInfo.frame.anim_SHIPS or self.effectInfo.frame.anim_TAKE
	end
	
	if anim ~= "" then
	
		self:SetLayerVisible( true, self.layers.FRAME_EFFECT )
		
		local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
		if frameEffect then
		
			local animTime = frameEffect:GetAnimationTime()
			frameEffect:StartAnimation( anim )
			frameEffect:SetAnimationTimeAndUpdate( animTime )
			
		end
	
	else
		self:SetLayerVisible( false, self.layers.FRAME_EFFECT )
	end
	
end


--
function UI.Quests_QuestSlotWnd:UpdateSelState()

	self:SetLayerVisible( self.bSelected, self.layers.SELECT_EFFECT )
	
end


--
function UI.Quests_QuestSlotWnd:PrepareLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( 1 )
	end

	local characterPos							= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.characterLocator ) or Vec2( 0, 0 )
	local characterSize							= Vec2( self.characterIco:GetWidth(), self.characterIco:GetHeight() )
	local rewardPos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.rewardLocator ) or Vec2( 0, 0 )
	local rewardSize							= Vec2( self.rewardIco:GetWidth(), self.rewardIco:GetHeight() )
	local rewardShiPartSize						= Vec2( self.shipPartRewardIco:GetWidth(), self.shipPartRewardIco:GetHeight() )
	local questNamePos_isCharacter_isReward		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.questNameLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local questNameSize_isCharacter_isReward	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.questNameLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local questNamePos_noCharacter_noReward		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.questNameLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	local questNameSize_noCharacter_noReward	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.questNameLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	local taskPos_isCharacter_isReward			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.taskLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local taskSize_isCharacter_isReward			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.taskLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local taskPos_noCharacter_noReward			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.taskLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	local taskSize_noCharacter_noReward			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.taskLocator_noCharacter_noReward ) or Vec2( 0, 0 )	
	local groupQuestTaskPos						= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.groupQuestTaskLocator ) or Vec2( 0, 0 )
	local groupQuestTaskSize					= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.groupQuestTaskLocator ) or Vec2( 0, 0 )
	local footerSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.footerLocator ) or Vec2( 0, 0 )
	local descPos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descSize								= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local sep1Pos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.sep1Locator ) or Vec2( 0, 0 )
	local selfMinSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local selfMaxSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )
	local actionBtnPos							= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.actionBtnLocator ) or Vec2( 0, 0 )
	local actionBtnWidth						= self.actionBtn:GetWidth()
	local timePos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.timeLocator ) or Vec2( 0, 0 )
	local timeSize								= Vec2( self.timeWnd:GetWidth(), self.timeWnd:GetHeight() )

	self.questNameLeft_isCharacter			= questNamePos_isCharacter_isReward.x
	self.questNameLeft_noCharacter			= questNamePos_noCharacter_noReward.x
	self.questNameRight_isReward			= questNamePos_isCharacter_isReward.x + questNameSize_isCharacter_isReward.x
	self.questNameRight_isReward_shipPart	= self.questNameRight_isReward - ( rewardShiPartSize.x - rewardSize.x )
	self.questNameRight_noReward			= questNamePos_noCharacter_noReward.x + questNameSize_noCharacter_noReward.x
    self.taskLeft_isCharacter				= taskPos_isCharacter_isReward.x
    self.taskLeft_noCharacter				= taskPos_noCharacter_noReward.x
    self.taskRight_isReward					= taskPos_isCharacter_isReward.x + taskSize_isCharacter_isReward.x
	self.taskRight_isReward_shipPart		= self.taskRight_isReward - ( rewardShiPartSize.x - rewardSize.x )
    self.taskRight_noReward					= taskPos_noCharacter_noReward.x + taskSize_noCharacter_noReward.x
	self.space_top_questName				= questNamePos_isCharacter_isReward.y
	self.space_questName_task				= taskPos_isCharacter_isReward.y - ( questNamePos_isCharacter_isReward.y + questNameSize_isCharacter_isReward.y )
    self.space_topPart_sep					= sep1Pos.y - math.max( math.max( ( taskPos_noCharacter_noReward.y + taskSize_noCharacter_noReward.y ), characterPos.y + characterSize.y ), rewardPos.y + rewardSize.y )
    self.space_sep_desc						= descPos.y - sep1Pos.y
    self.footerHeight						= footerSize.y
    self.minHeight							= selfMinSize.y
    self.maxHeight							= selfMaxSize.y
	self.characterIcoHeight					= characterSize.y
	self.groupQuestTaskRect					= Quat( groupQuestTaskPos.x, groupQuestTaskPos.y, groupQuestTaskSize.x, groupQuestTaskSize.y )
	self.space_timer_actionBtn				= actionBtnPos.x - ( timePos.x + timeSize.x )
	self.space_actionBtn_right				= selfMaxSize.x - ( actionBtnPos.x + actionBtnWidth )
	self.space_timer_btm			= selfMaxSize.y - ( timePos.y + timeSize.y )

	self:SetLayerTop( questNamePos_isCharacter_isReward.y, self.layers.QUEST_NAME )
	self:SetLayerLeft( descPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )

	local sep1Effect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_1_EFFECT )
	if sep1Effect then
		sep1Effect:SetPos( UI:Vec2( sep1Pos.x, 0 ) )
	end
	
	local space_reward_right = selfMaxSize.x - ( rewardPos.x + rewardSize.x )
	local rewardShipPartX = selfMaxSize.x - space_reward_right - rewardShiPartSize.x
	local rewardShipPartY = rewardPos.y
	self.shipPartRewardIco:SetPos( rewardShipPartX, rewardShipPartY )

	self:SetWidth( selfMaxSize.x )

end


--
function UI.Quests_QuestSlotWnd:RecalcLayout()

	-- общий низ для всех элементов, кроме "подвала"
	
	local topPartBtm = self.space_top_questName
	
	-- квест без выбора награды
	if self.groupId == -1 then
	
		-- имя квеста (позиция x, ширина, высота)
	
		if self:IsLayerVisible( self.layers.QUEST_NAME ) then
		
			local questNameLeft	= self.characterIco:IsChildOf( self ) and self.questNameLeft_isCharacter or self.questNameLeft_noCharacter
			
			local questNameRight = self.questNameRight_noReward
			if self.rewardIco:IsChildOf( self ) then
				questNameRight = self.questNameRight_isReward
			elseif self.shipPartRewardIco:IsChildOf( self ) then
				questNameRight = self.questNameRight_isReward_shipPart
			end

			local questNameWidth = questNameRight - questNameLeft

			local questNameFormatRect = UI:Quat( 0, 0, questNameWidth, 1000000 )
			self.nameMetaText:SetFormatRectSize( UI:Vec2( questNameFormatRect.z, questNameFormatRect.w ), true )	-- формат текста надо сделать еще ДО MeasureText

			local questNameHeight = _G.MeasureText(
				self.nameMetaText:GetFormattedText(),
				self:GetFont( self.layers.QUEST_NAME ),
				questNameFormatRect,
				self:GetTextFormatFlags( self.layers.QUEST_NAME ),
				questNameFormatRect ).w

			self:SetLayerLeft( questNameLeft, self.layers.QUEST_NAME )
			self:SetLayerWidth( questNameWidth, self.layers.QUEST_NAME )
			self:SetLayerHeight( questNameHeight, self.layers.QUEST_NAME )
		
		end
	

		-- задание (позиция x, позиция y, ширина, высота)

		local taskLeft	= self.characterIco:IsChildOf( self ) and self.taskLeft_isCharacter or self.taskLeft_noCharacter
		
		local taskRight = self.taskRight_noReward
		if self.rewardIco:IsChildOf( self ) then
			taskRight = self.taskRight_isReward
		elseif self.shipPartRewardIco:IsChildOf( self ) then
			taskRight = self.taskRight_isReward_shipPart
		end

		local taskWidth = taskRight - taskLeft

		local taskFormatRect = UI:Quat( 0, 0, taskWidth, 1000000 )
		self.taskMetaText:SetFormatRectSize( UI:Vec2( taskFormatRect.z, taskFormatRect.w ), true )	-- формат текста надо сделать еще ДО MeasureText

		local taskHeight = _G.MeasureText(
			self.taskMetaText:GetFormattedText(),
			self:GetFont( self.layers.TASK ),
			taskFormatRect,
			self:GetTextFormatFlags( self.layers.TASK ),
			taskFormatRect ).w
			
		local taskTop = self.space_top_questName
		
		if self:IsLayerVisible( self.layers.QUEST_NAME ) then
			local questNameRect = self:GetLayerRect( self.layers.QUEST_NAME )
			taskTop = questNameRect.y + questNameRect.w + self.space_questName_task
		end
		
		self:SetLayerRect( UI:Quat( taskLeft, taskTop, taskWidth, taskHeight ), self.layers.TASK )


		-- общий низ для верхних элементов до разделителя (задание, иконка персонажа, иконка награды)

		local headerBtm = self:GetLayerTop( self.layers.TASK ) + taskHeight

		if self.characterIco:IsChildOf( self ) then

			local characterIcoBtm = self.characterIco:GetTop() + self.characterIcoHeight
			if characterIcoBtm > headerBtm then
				headerBtm = characterIcoBtm
			end

		end

		if self.rewardIco:IsChildOf( self ) then
			local rewardIcoBtm = self.rewardIco:GetTop() + self.rewardIco:GetHeight()
			if rewardIcoBtm > headerBtm then
				headerBtm = rewardIcoBtm
			end
		elseif self.shipPartRewardIco:IsChildOf( self ) then
			local rewardIcoBtm = self.shipPartRewardIco:GetTop() + self.shipPartRewardIco:GetHeight()
			if rewardIcoBtm > headerBtm then
				headerBtm = rewardIcoBtm
			end
		end

		headerBtm = headerBtm + self.space_topPart_sep
		topPartBtm = headerBtm


		-- разделительная линия между заданием и описанием (позиция y)

		local sep1Y = 0

		if self:IsLayerVisible( self.layers.DESC ) then

			self:SetLayerVisible( true, self.layers.SEPARATOR_1_EFFECT )

			sep1Y = headerBtm
			
			local sep1Effect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_1_EFFECT )
			if sep1Effect then
				sep1Effect:SetPos( UI:Vec2( sep1Effect:GetPos().x, UI:YRel2Snapped( sep1Y ) ) )
			end

		else
			self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT )
		end


		-- описание (позиция y, высота)

		if self:IsLayerVisible( self.layers.DESC ) then

			local descY = sep1Y + self.space_sep_desc

			local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 1000000 )

			local descHeight = _G.MeasureText(
				self:GetText( self.layers.DESC ),
				self:GetFont( self.layers.DESC ),
				descFormatRect,
				self:GetTextFormatFlags( self.layers.DESC ),
				descFormatRect ).w

			self:SetLayerTop( UI:YRel2Snapped( descY ), self.layers.DESC )
			self:SetLayerHeight( descHeight, self.layers.DESC )

			local descBtm = descY + descHeight + self.space_sep_desc
			topPartBtm = descBtm

		end
		
	-- квест c выбором награды
	else
	
		-- разделитель
		self:SetLayerVisible( true, self.layers.SEPARATOR_2_EFFECT )
	
		-- задание (позиция x, позиция y, ширина, высота)

		local taskFormatRect = UI:Quat( 0, 0, self.groupQuestTaskRect.z, 1000000 )
		self.taskMetaText:SetFormatRectSize( UI:Vec2( taskFormatRect.z, taskFormatRect.w ), true )	-- формат текста надо сделать еще ДО MeasureText

		local taskHeight = _G.MeasureText(
			self.taskMetaText:GetFormattedText(),
			self:GetFont( self.layers.TASK ),
			taskFormatRect,
			self:GetTextFormatFlags( self.layers.TASK ),
			taskFormatRect ).w
		
		self:SetLayerRect( UI:Quat( self.groupQuestTaskRect.x, self.groupQuestTaskRect.y, self.groupQuestTaskRect.z, taskHeight ), self.layers.TASK )
		
		topPartBtm = self.groupQuestTaskRect.y + taskHeight + self.space_sep_desc
		
	end
	
	
	-- высота окна и все, что на нее завязано

	-- высота окна
	local selfHeight = topPartBtm + self.footerHeight
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )	
	
	self:SetHeight( selfHeight )
	
	-- анимация фона
	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end
	
	-- анимация выделения
	local selectEffect = UI:GetEffectFromLayer( self, self.layers.SELECT_EFFECT )
	if selectEffect then
		selectEffect:SetAnimationTimeAndUpdate( animTime )
	end
	
	-- анимация рамки
	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetAnimationTimeAndUpdate( animTime )
	end
	
	-- позиция метатекста количества выполнений
	self:UpdateMetaTextPos()
	
	
	-- позиция x и y таймера
	if self.timeWnd:IsChildOf( self ) then
		
		local timerRight = self.actionBtn:IsChildOf( self ) and ( self.actionBtn:GetLeft() - self.space_timer_actionBtn ) or ( self:GetWidth() - self.space_actionBtn_right )
		local timerLeft = timerRight - self.timeWnd:GetWidth()
		self.timeWnd:SetLeft( timerLeft )
		
		local timerY = selfHeight - self.space_timer_btm - self.timeWnd:GetHeight()
		self.timeWnd:SetTop( timerY )
	
	end
	
	
	-- оповещение списка, чтобы при изменении размера слота он мог сместить нижележащие слоты
	local questsListWnd = UI:GetAncestorKindOf( self, "Quests_QuestsListWnd" )
	if questsListWnd then
		questsListWnd:OnSlotLayoutChanged( self )
	end
	
end


--
function UI.Quests_QuestSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.questId ~= -1 then
		if self.questType == UI.questTypes.REGULAR and UI:GetQuestEventForStage( self.questId, UI:GetQuestStage( self.questId ) ) == ai.GameEvent.ONLINE or self.questType == UI.questTypes.SHIP then
			self:UpdateProgress()
		end
	end

end


-- -----------------------------------------------------------------------
-- UI.Quests_RefuseQuestBtn
-- -----------------------------------------------------------------------

UI.Quests_RefuseQuestBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_RefuseQuestBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Quests_RefuseQuestBtn",
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
				defName 			= "gameplay_map_pve_quests_refuseQuestBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_RefuseQuestBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Quests_RefuseQuestBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.Quests_RefuseQuestBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_RefuseQuestBtn.tooltipData	= nil

-- ------------------------------------------------------------------------
-- UI.Quests_EndShipQuestBtn
-- ------------------------------------------------------------------------

UI.Quests_EndShipQuestBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_EndShipQuestBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Quests_EndShipQuestBtn",
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
				defName 			= "gameplay_map_pve_quests_refuseQuestBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_EndShipQuestBtn:GetTooltipData()
	
	return self.tooltipData
	
end

-- ----------------------------
-- const
-- ----------------------------

UI.Quests_EndShipQuestBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

UI.Quests_EndShipQuestBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "tutorialQuest_endShipQuestBtn_tooltipCaption" ),
	text		= UI:GetStringByName( "tutorialQuest_endShipQuestBtn_tooltipText" ),
}

-- -----------------------------------------------------------------------
-- UI.Quests_QuestActionBtn
-- -----------------------------------------------------------------------

UI.Quests_QuestActionBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_QuestActionBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

UI.Quests_QuestActionBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	
	props =
	{
		name		= "Quests_QuestActionBtn",
		isPrototype	= true,
	},
	
	layers =
	{
		numLayers = UI:GetTableLength( UI.Quests_QuestActionBtn.layers ),
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_actionBtn",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "try_text2",
						layer		= "UI.Quests_QuestActionBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- TEXT
		{
			id				= UI.Quests_QuestActionBtn.layers.TEXT,
			
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_QuestActionBtn:SetAction( action )

	self.action = action
	
	self:UpdateEffectAnimation()
	self:UpdateText()

end


--
function UI.Quests_QuestActionBtn:GetAction()

	return self.action

end


--
function UI.Quests_QuestActionBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Quests_QuestActionBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.Quests_QuestActionBtn.effectInfo =
{
	anims =
	{
		[ UI.Quests_QuestSlotWnd.actions.TAKE ] =
		{
			animationIdle 			= "accept",
			animationSelect			= "accept_over",
			animationPressed		= "accept_press",
			animationDisabled		= "accept_disable",
			animationIdle_focus 	= "accept",
			animationSelect_focus	= "accept_over",
			animationPressed_focus	= "accept_press",
		},

		[ UI.Quests_QuestSlotWnd.actions.COMPLETE ] =
		{
			animationIdle 			= "completed",
			animationSelect			= "completed_over",
			animationPressed		= "completed_press",
			animationDisabled		= "completed_disable",
			animationIdle_focus 	= "completed",
			animationSelect_focus	= "completed_over",
			animationPressed_focus	= "completed_press",
		},
		
		[ UI.Quests_QuestSlotWnd.actions.TRANSFER_TO_ZONE ] =
		{
			animationIdle 			= "undock",
			animationSelect			= "undock_over",
			animationPressed		= "undock_press",
			animationDisabled		= "undock_disable",
			animationIdle_focus 	= "undock",
			animationSelect_focus	= "undock_over",
			animationPressed_focus	= "undock_press",
		},
		
		[ UI.Quests_QuestSlotWnd.actions.LAUNCH_PVE ] =
		{
			animationIdle 			= "launch",
			animationSelect			= "launch_over",
			animationPressed		= "launch_press",
			animationDisabled		= "launch_disable",
			animationIdle_focus 	= "launch",
			animationSelect_focus	= "launch_over",
			animationPressed_focus	= "launch_press",
		},
		
		[ UI.Quests_QuestSlotWnd.actions.SHIPS ] =
		{
			animationIdle 			= "assign",
			animationSelect			= "assign_over",
			animationPressed		= "assign_press",
			animationDisabled		= "assign_disable",
			animationIdle_focus 	= "assign",
			animationSelect_focus	= "assign_over",
			animationPressed_focus	= "assign_press",
		},
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_QuestActionBtn.action			= -1
UI.Quests_QuestActionBtn.tooltipData	= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Quests_QuestActionBtn:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	self.effectInfo.main = self.action ~= -1 and self.effectInfo.anims[ self.action ] or self.effectInfo.anims[ 1 ]

	UI.EffectButtonWnd.UpdateEffectAnimation( self )

end


--
function UI.Quests_QuestActionBtn:UpdateText()
	
	local str = ""
	
	if self.action ~= -1 then
	
		if self.action == UI.Quests_QuestSlotWnd.actions.TAKE then
			str = UI:GetStringByName( "tutorialQuest_takeBtn" )
		
		elseif self.action == UI.Quests_QuestSlotWnd.actions.COMPLETE then
			str = UI:GetStringByName( "tutorialQuest_completeBtn" )
		
		elseif self.action == UI.Quests_QuestSlotWnd.actions.TRANSFER_TO_ZONE then
			str = UI:GetStringByName( "hangar_undock_btn_text" )
			
		elseif self.action == UI.Quests_QuestSlotWnd.actions.LAUNCH_PVE then
			str = UI:GetStringByName( "tutorialQuest_launchPveBtn" )
			
		elseif self.action == UI.Quests_QuestSlotWnd.actions.SHIPS then
			str = UI:GetStringByName( "tutorialQuest_shipsBtn" )
			
		else
			sys.log( " UI.Quests_QuestActionBtn:UpdateText()[ERROR]: unhandled mode %s", tostring( self.action ) )
		end
		
	end
	
	self:SetText( str, self.layers.TEXT )

end


-- -----------------------------------------------------------------------
-- UI.Quests_TimeWnd
-- -----------------------------------------------------------------------

UI.Quests_TimeWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Quests_TimeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_TimeWnd",
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
				defName 			= "gameplay_map_pve_quests_time",
				defaultAnimation	= "idle_2",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "timer",
						layer		= "UI.Quests_TimeWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Quests_TimeWnd:Setup( timeDisable )

	self.timeDisable = timeDisable

	if self:IsOnScreen() then
		self:UpdateTimeLeft()
	end

end


--
function UI.Quests_TimeWnd:Reset()

	self.timeDisable	= UI.INVALID_U64_ID
	self.timeLeftFixed	= -1
	self.bCallback 		= false

	self:UpdateText()
	self:UpdateAnimation()

end


--
function UI.Quests_TimeWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Quests_TimeWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.Quests_TimeWnd:SetCallback( bCallback )

	self.bCallback = bCallback

end


-- ----------------------------
-- const
-- ----------------------------

UI.Quests_TimeWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.Quests_TimeWnd.effectInfo =
{
	main =
	{
		aminIdle		= "idle_2",
		animLowTime		= "idle",
	}
}

UI.Quests_TimeWnd.LOW_TIME_THRESHOLD = 10*60	-- [сек]

UI.Quests_TimeWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "questDisableTime_tooltipCaption" ),
	text		= UI:GetStringByName( "questDisableTime_tooltipText" ),
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Quests_TimeWnd.timeDisable	= UI.INVALID_U64_ID
UI.Quests_TimeWnd.timeLeftFixed	= -1
UI.Quests_TimeWnd.curAnim		= UI.Quests_TimeWnd.effectInfo.main.aminIdle
UI.Quests_TimeWnd.bCallback		= false

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Quests_TimeWnd:UpdateTimeLeft()

	local timeLeftFixed_old = self.timeLeftFixed

	local timeCur = _G.MasterServer_GetServerTime()
	local timeLeft = ( self.timeDisable > timeCur ) and ( self.timeDisable - timeCur ).l * 0.001 or 0

	self.timeLeftFixed = UI:Round( timeLeft )

	if self.timeLeftFixed ~= timeLeftFixed_old then
		self:UpdateText()
		self:UpdateAnimation()
	end

	if self.bCallback == true and timeLeft == 0 then

		self.bCallback = false

		local parent = self:GetParent()
		if parent then
			parent:OnTimerExpired()
		end

	end

end


--
function UI.Quests_TimeWnd:UpdateText()

	local str = self.timeLeftFixed == -1 and "" or UI:Time2Str45( self.timeLeftFixed )
	self:SetText( str, self.layers.TEXT )	

end


--
function UI.Quests_TimeWnd:UpdateAnimation()

	local anim = ( self.timeLeftFixed == -1 or self.timeLeftFixed >= self.LOW_TIME_THRESHOLD ) and self.effectInfo.main.aminIdle or self.effectInfo.main.animLowTime

	if anim ~= self.curAnim then

    	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    	if mainEffect then
    		mainEffect:StartAnimation( anim )
    	end

		self.curAnim = anim

	end

end


--
function UI.Quests_TimeWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimeLeft()

end


--
function UI.Quests_TimeWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateTimeLeft()

end


-- ----------------------------------------------------------------------------
-- UI.Quests_CharacterIcoWnd
-- ----------------------------------------------------------------------------

UI.Quests_CharacterIcoWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_CharacterIcoWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "Quests_CharacterIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},
	
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_characterIco_main",
				defaultAnimation	= "idle",	

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",
						layer		= "UI.Quests_CharacterIcoWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "over",
						layer		= "UI.Quests_CharacterIcoWnd.layers.MOUSE_OVER_EFFECT",
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
				defName 			= "gameplay_map_pve_quests_questSlot_characterIco_ico",
				defaultAnimation	= "idle",
			}}
		},
		
		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_characterIco_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_CharacterIcoWnd:Setup( character )

	self.character = character
	self:UpdateIco()
	
end


--
function UI.Quests_CharacterIcoWnd:Reset()

	self.character = ""

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	
end


--
function UI.Quests_CharacterIcoWnd:GetCharacter()

	return self.character

end


--
function UI.Quests_CharacterIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------
-- const
-- ---------------------------

UI.Quests_CharacterIcoWnd.layers =
{
	MAIN_EFFECT			= 0,
	ICO_EFFECT			= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.Quests_CharacterIcoWnd.effectInfo =
{
	ico =
	{
		spriteName	= "ico"
	}
}

UI.Quests_CharacterIcoWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "quests_characterIco_tooltip" ),
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_CharacterIcoWnd.character	= ""

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_CharacterIcoWnd:UpdateIco()

	local hTex = UI:GetQuestCharacterIcoSmall2( self.character )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.Quests_CharacterIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMouseOver()

end


--
function UI.Quests_CharacterIcoWnd:UpdateMouseOver()
	
	local bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	self:SetMouseOver( bMouseOver )
	
end


--
function UI.Quests_CharacterIcoWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
	
	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )
	
	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Quests_CharacterIcoWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Quests_CharacterIcoWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ----------------------------------------------------------------------------
-- UI.Quests_ChoiceListWnd
-- ----------------------------------------------------------------------------

UI.Quests_ChoiceListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_ChoiceListWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "Quests_ChoiceListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "gameplay_map_pve_quests_choiceList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_ChoiceListWnd:Setup( groupId, groupQuests )

	self:Reset()

	self.groupId		= groupId
	self.groupQuests	= groupQuests

	self:FullUpdate()

end


--
function UI.Quests_ChoiceListWnd:Reset()

	self.groupId		= -1
	self.groupQuests	= {}

	self:ResetSlots()

end


--
function UI.Quests_ChoiceListWnd:GetSelQuest()

	local selQuestId = -1

	if self.selSlotIdx ~= -1 then
		local selSlotWnd = self.curSlots[ self.selSlotIdx ]
		if selSlotWnd then
			selQuestId = selSlotWnd:GetQuestId()
		end
	end

	return selQuestId

end


--
function UI.Quests_ChoiceListWnd:SelectQuest( questId )

	local slotIdx = -1

	if questId ~= -1 then
		slotIdx = self:GetSlotByQuest( questId )
		if slotIdx == -1 then
			sys.log( "UI.Quests_ChoiceListWnd:SelectQuest()[ERROR]: cannot find slot for quest %d", questId )
		end		
	end

	self:SelectSlot( slotIdx )

end


--
function UI.Quests_ChoiceListWnd:HasGroupTakenQuest()

	for questIdx, questInfo in pairs( self.groupQuests ) do
		if questInfo.bTaken then
			return true
		end
	end

	return false

end


--
function UI.Quests_ChoiceListWnd:OnPremiumChanged()

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPremiumChanged()
	end

end


-- ---------------------------
-- const
-- ---------------------------

UI.Quests_ChoiceListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Quests_ChoiceListWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "diffiulty_slot_"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_ChoiceListWnd.groupId		= -1
UI.Quests_ChoiceListWnd.groupQuests	= {}
UI.Quests_ChoiceListWnd.allSlots	= {}
UI.Quests_ChoiceListWnd.curSlots	= {}
UI.Quests_ChoiceListWnd.selSlotIdx  = -1
UI.Quests_ChoiceListWnd.space_slots	= 0
UI.Quests_ChoiceListWnd.slotsY		= 0
UI.Quests_ChoiceListWnd.slotWidth	= 0

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_ChoiceListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.groupQuests	= {}
	self.allSlots		= {}
	self.curSlots		= {}

	if self:IsPrototype() then
		return
	end

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.Quests_ChoiceListWnd:InitSlots()

	for idx = 1, 2 do
		self:CreateSlot()
	end

end


--
function UI.Quests_ChoiceListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Quests_ChoiceSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	else
		sys.log( "UI.Quests_ChoiceListWnd:CreateSlot()[ERROR]; cannot create slot" )
	end

	return slotWnd	

end


--
function UI.Quests_ChoiceListWnd:ObtainSlot()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.curSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	if freeSlotWnd then
		table.insert( self.curSlots, freeSlotWnd )
		self:AddChild( freeSlotWnd )
	end	

	return freeSlotWnd

end


--
function UI.Quests_ChoiceListWnd:ResetSlots()

	self:SelectSlot( -1 )

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.Quests_ChoiceListWnd:FullUpdate()

	self:ResetSlots()

	for idx, questInfo in ipairs( self.groupQuests ) do
		local slotWnd = self:ObtainSlot()
		if slotWnd then
			slotWnd:Setup( questInfo )
		end
	end

	self:ValidateSelection()
	self:RecalcLayout()

end


--
function UI.Quests_ChoiceListWnd:ValidateSelection()

	local selSlotIdx = -1

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd:GetQuestInfo().bTaken then
			selSlotIdx = slotIdx
			break
		end
	end

	if selSlotIdx == -1 then
		for slotIdx, slotWnd in pairs( self.curSlots ) do
			if not slotWnd:IsDisabled() then
				selSlotIdx = slotIdx
				break
			end
		end
	end

	self:SelectSlot( selSlotIdx )

end


--
function UI.Quests_ChoiceListWnd:SelectSlot( slotIdx )

	if slotIdx == self.selSlotIdx then
		return
	end

	if self.selSlotIdx ~= -1 then
		local oldSelSlot = self.curSlots[ self.selSlotIdx ]
		if oldSelSlot then
			oldSelSlot:Select( false )
		end
	end

	self.selSlotIdx = slotIdx

	if slotIdx ~= -1 then
		local newSelSlot = self.curSlots[ slotIdx ]
		if newSelSlot then
			newSelSlot:Select( true )
		end
	end	

	self:NotifyParentOnSelSlotChanged()

end


--
function UI.Quests_ChoiceListWnd:NotifyParentOnSelSlotChanged()

	local questSlotWnd = UI:GetAncestorKindOf( self, "Quests_QuestSlotWnd" )
	if questSlotWnd then
		questSlotWnd:OnSelChoiceChanged( self:GetSelQuest() )
	end

end


--
function UI.Quests_ChoiceListWnd:GetSlotByQuest( questId )

	local foundSlotIdx = -1

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd:GetQuestId() == questId then
			foundSlotIdx = slotIdx
			break
		end
	end

	return foundSlotIdx

end


--
function UI.Quests_ChoiceListWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd = self.allSlots[ 1 ]

	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth		= slotWnd and slotWnd:GetWidth() or 0

	self.space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	self.slotsY			= firstSlotPos.y
	self.slotWidth		= slotWidth

end


--
function UI.Quests_ChoiceListWnd:RecalcLayout()

	if not next( self.curSlots ) then
		return
	end

	local numSlots = #self.curSlots
	local slotsWidth = self.slotWidth * numSlots + self.space_slots * ( numSlots - 1 )
	local slotsX = ( self:GetWidth() - slotsWidth ) / 2

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		local x = slotsX + ( slotIdx - 1 ) * ( self.slotWidth + self.space_slots )
		slotWnd:SetPos( UI:XRel2Snapped( x ), self.slotsY )
	end

end


--
function UI.Quests_ChoiceListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Quests_ChoiceSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Quests_ChoiceSlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "Quests_ChoiceSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Quests_ChoiceSlotWnd" )

		if not slotWnd:IsDisabled() and not slotWnd:IsSelected() then
			self:SelectQuest( slotWnd:GetQuestId() )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	end

	return true

end


-- ----------------------------------------------------------------------------
-- UI.Quests_ChoiceSlotWnd
-- ----------------------------------------------------------------------------

UI.Quests_ChoiceSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_ChoiceSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_ChoiceSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "gameplay_map_pve_quests_choiceSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "select_2",	
						layer		= "UI.Quests_ChoiceSlotWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_choiceSlot_select",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_ChoiceSlotWnd:Setup( questInfo )

	self:Reset()

	self.questId	= questInfo.questId
	self.questInfo	= questInfo

	self:FullUpdate()

end


--
function UI.Quests_ChoiceSlotWnd:Select( bSelect )

	self.bSelected = bSelect

	self:UpdateSelectedEffect()
	self:UpdateDisabledState()
	self:UpdateMouseOver()

end


--
function UI.Quests_ChoiceSlotWnd:GetQuestId()

	return self.questId


end


--
function UI.Quests_ChoiceSlotWnd:GetQuestInfo()

	return self.questInfo

end


--
function UI.Quests_ChoiceSlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.Quests_ChoiceSlotWnd:IsDisabled()

	return self.bDisabled

end


--
function UI.Quests_ChoiceSlotWnd:Reset()

	self.questId		= -1
	self.questInfo		= nil
	self.bSelected		= false
	self.bDisabled		= false
	self.bMouseOver		= false
	self.tooltipData	= nil

	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
	self.icoWnd:Reset()

end


--
function UI.Quests_ChoiceSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Quests_ChoiceSlotWnd:OnPremiumChanged()

	self:UpdateReward()

end


-- ---------------------------
-- const
-- ---------------------------

UI.Quests_ChoiceSlotWnd.layers =
{
	MAIN_EFFECT		= 0,
	SELECT_EFFECT	= 1,
}

UI.Quests_ChoiceSlotWnd.effectInfo =
{
	main =
	{
		rewardLocator = "item_ico",
	},
	
	select =
	{
		animTaken		= "idle_2",
		animNotTaken	= "idle",
	}
}

UI.Quests_ChoiceSlotWnd.BONUS_COLOR = UI.GOLD_COLOR

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_ChoiceSlotWnd.questId			= -1
UI.Quests_ChoiceSlotWnd.questInfo		= nil
UI.Quests_ChoiceSlotWnd.bSelected		= false
UI.Quests_ChoiceSlotWnd.bDisabled		= false
UI.Quests_ChoiceSlotWnd.icoWnd			= nil
UI.Quests_ChoiceSlotWnd.bMouseOver		= false
UI.Quests_ChoiceSlotWnd.tooltipData		= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_ChoiceSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Quests_ChoiceSlotWnd:CreateControls()
	
	self.icoWnd = UI:CreateChildWnd( self, UI.Quests_RewardIco, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.rewardLocator, UI.EffectAnimParams.POS )

end


--
function UI.Quests_ChoiceSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Quests_ChoiceSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.Quests_ChoiceSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.Quests_ChoiceSlotWnd:UpdateMouseOver()

	if not self:IsOnScreen() then
		return
	end

	local bMouseOver = false

	if not self.bDisabled and not self.bSelected then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		if wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) then
			bMouseOver = true
		end
	end

	self:SetMouseOver( bMouseOver )	

end


--
function UI.Quests_ChoiceSlotWnd:SetMouseOver( bMouseOver )

	local bMouseOverOld = self.bMouseOver
	self.bMouseOver = bMouseOver
	
	self.icoWnd:SetMouseOver( bMouseOver )

	if bMouseOver and not bMouseOverOld and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Quests_ChoiceSlotWnd:FullUpdate()

	self:UpdateReward()
	self:UpdateSelectedEffect()
	self:UpdateDisabledState()
	self:UpdateDisabledTooltip()
	self:UpdateMouseOver()

end


--
function UI.Quests_ChoiceSlotWnd:UpdateReward()

	local reward = UI:GetQuestSingleReward( self.questId, false, false, false, nil )
	
	if reward then
		self.icoWnd:Setup( reward )
	else
		sys.log( "UI.Quests_ChoiceSlotWnd:UpdateReward()[ERROR]: cannot find reward for quest %d", self.questId )
	end

end


--
function UI.Quests_ChoiceSlotWnd:UpdateSelectedEffect()

	self:SetLayerVisible( self.bSelected, self.layers.SELECT_EFFECT )
	
	if self.bSelected then
		self:SetLayerVisible( true, self.layers.SELECT_EFFECT )
		
		local selectEffect = UI:GetEffectFromLayer( self, self.layers.SELECT_EFFECT )
		if selectEffect then
			selectEffect:StartAnimation( self.questInfo.bTaken and self.effectInfo.select.animTaken or self.effectInfo.select.animNotTaken )
		end
		
	else
		self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
	end

end


--
function UI.Quests_ChoiceSlotWnd:UpdateDisabledState()

	self.bDisabled = self.questInfo.bDisabled
	self.icoWnd:Disable( self.bDisabled )

end


--
function UI.Quests_ChoiceSlotWnd:UpdateDisabledTooltip()

	local tooltipData = nil

	if self.questInfo.bDisabled then

    	tooltipData =
    	{
    		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:GetStringByName( "lockedQuest_tooltipCaption" ),
    	}

    	local text = ""

    	if UI:BitTst( self.questInfo.unfitReasonsMask, UI.GameplayPveMapWnd.questUnfitReasons.LOW_RANK ) then

    		text = UI:GetStringByName( "lockedQuest_tooltipText_LOW_RANK" )

			local rank = UI:GetQuestMinAccountRank( self.questId )

			local strRank = tostring( rank )

    		local numSubst = 0
    		text, numSubst = string.gsub( text, "%$rank%$", strRank )

    		if numSubst == 0 then
    			sys.log( "UI.Quests_ChoiceSlotWnd:UpdateDisabledTooltip()[ERROR]: cannot find placeholder \"rank\" in string \"lockedQuest_tooltipText_LOW_RANK\"" )
    			text = string.format( "[INVALID STRING] Quest is unlocked on %s rank", strRank )
    		end
			
			text = string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), text )
			

    	elseif UI:BitTst( self.questInfo.unfitReasonsMask, UI.GameplayPveMapWnd.questUnfitReasons.LOCKING_SHIP ) then

    		text = UI:GetStringByName( "lockedQuest_tooltipText_LOCKING_SHIP" )

			local shipDefName = UI:GetQuestLockingShip( self.questId )

    		local shipLocalizedName = UI:GetEntityLocalizedNameByDef( shipDefName, true )
    		shipLocalizedName = string.format( "%s%s", UI:Color2Str( UI.TooltipWnd_shared:GetTextColor() ), shipLocalizedName )

    		local numSubst = 0
    		text, numSubst = string.gsub( text, "%$ship%$", shipLocalizedName )

    		if numSubst == 0 then
    			sys.log( "UI.Quests_ChoiceSlotWnd:UpdateDisabledTooltip()[ERROR]: cannot find placeholder \"ship\" in string \"lockedQuest_tooltipText_LOCKING_SHIP\"" )
    			text = string.format( "[INVALID STRING] Ship %s is bought", shipLocalizedName )
    		end
			

    	elseif UI:BitTst( self.questInfo.unfitReasonsMask, UI.GameplayPveMapWnd.questUnfitReasons.NO_MAJOR_LEAGUE ) then
		
    		text = UI:GetStringByName( "lockedQuest_tooltipText_NO_MAJOR_LEAGUE" )
			text = string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), text )
			
			
		elseif UI:BitTst( self.questInfo.unfitReasonsMask, UI.GameplayPveMapWnd.questUnfitReasons.GROUP_COOLDOWN ) then
    		text = UI:GetStringByName( "tutorialQuest_takeBtn_tooltipText_onCooldown" )
			
			
		elseif UI:BitTst( self.questInfo.unfitReasonsMask, UI.GameplayPveMapWnd.questUnfitReasons.GROUP_HAS_ACTIVE_QUEST ) then
			text = UI:GetStringByName( "tutorialQuest_takeBtn_tooltipText_onCooldown" )
			
		
    	else
    		sys.log( "UI.Quests_ChoiceSlotWnd:UpdateDisabledTooltip()[ERROR]: unhandled lock reasons %d", self.questInfo.unfitReasonsMask )
    		text = "unknown reason"
    	end

    	tooltipData.text = text

	end
	
	self.icoWnd:SetDisabledTooltip( tooltipData )

end


--
function UI.Quests_ChoiceSlotWnd:HasGroupTakenQuest()

	local parent = self:GetParent()
	if parent then
		return parent:HasGroupTakenQuest()
	end

	return false

end


-- ----------------------------------------------------------------------------
-- UI.Quests_RewardIco
-- ----------------------------------------------------------------------------

UI.Quests_RewardIco = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_RewardIco.def =
{
	className	= "Wnd",
	prototype	= "ItemIcoWnd_1080",

	props =
	{
		name		= "Quests_RewardIco",	
		isPrototype	= true,
	},
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_RewardIco:Setup( reward )

	self:Reset()

	self.reward = reward

	local rewardTypeName = UI:Val2Key( UI.questRewardTypes, self.reward.rewardType )

	local fnUpdateName = string.format( "Update_%s", rewardTypeName )
	local fnUpdate = self[ fnUpdateName ]

	if fnUpdate then
		fnUpdate( self )
	else
		sys.log( "UI.Quests_RewardIco:Setup()[ERROR]: cannot find function \"%s()\"", fnUpdateName )
	end

end


--
function UI.Quests_RewardIco:Reset()

	UI.ItemIcoWnd.Reset( self )

	self:HideMain()
	self:HideIcoMain()

	self.reward					= nil
	self.disabledTooltipData	= nil
	self.rewardTooltipData		= nil

end


--
function UI.Quests_RewardIco:Disable( bDisabled )

	if bDisabled then
		self:ShowDarkening()
	else
		self:HideDarkening()
	end

end


--
function UI.Quests_RewardIco:SetMouseOver( bMouseOver )

	if bMouseOver then
		self:ShowMouseOver()
	else
		self:HideMouseOver()
	end

end


--
function UI.Quests_RewardIco:SetDisabledTooltip( disabledTooltipData )

	self.disabledTooltipData = disabledTooltipData
	
	if disabledTooltipData then
		self:SetTooltipData( disabledTooltipData )
	else
		self:SetTooltipData( self.rewardTooltipData )
	end

end

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_RewardIco.reward				= nil
UI.Quests_RewardIco.disabledTooltipData	= nil
UI.Quests_RewardIco.rewardTooltipData	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_RewardIco:Update_ITEM()

	local defName = self.reward.defName
	local count = self.reward.count

	-- иконка

	self:SetupForItem( defName )

	if count > 1 then
		self:SetCountResourcesText( UI:Price2Str2( count ) )
	end

	-- тултип

	local tooltipData = UI:GetTooltipForItem( defName )
		
	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_ACCOUNT_AURA()

	local defName = self.reward.defName

	-- иконка

	local hTex = UI:GetMailAttachmentAccountAuraIco( defName )
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	

	-- тултип

	local tooltipData = {}
	tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption		= UI:AccountAura2Str( defName )
	tooltipData.text		= UI:GetAccountAuraDesc( defName )

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_GOLD()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentGoldIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ), UI.GOLD_COLOR )

	-- тултип

	local tooltipData = {}

	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_CREDITS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentCreditsIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_TOKENS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentTokensIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_SYNERGY()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyShipIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип
	
	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.SYNERGY,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end

--
function UI.Quests_RewardIco:Update_FREE_SYNERGY()
	-- UI.questRewardTypes.FREE_SYNERGY добавлено для SC-115197, сами квесты свободный опыт не должны выдавать,
	-- поэтому эта функция не должна вызываться в нормальных условиях. Но раз пришлось добавить значение в "enum" она добавлена.
	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyFreeIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип
	
	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.FREE_SYNERGY,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_CLAN_IRIDIUM()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentClanIridiumIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end


--
function UI.Quests_RewardIco:Update_EVENT_CREDITS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentEventCreditsIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_EVENT,
		val			= val,
		bIsBuyPrice	= false,
	}

	self.rewardTooltipData = tooltipData
	if not self.disabledTooltipData then
		self:SetTooltipData( tooltipData )
	end

end

-- -------------------------------------------------------------------
-- UI.Quests_CharacterInfoWnd
-- -------------------------------------------------------------------

UI.Quests_CharacterInfoWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Quests_CharacterInfoWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "Quests_CharacterInfoWnd",
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
				defName 			= "help_main",
				defaultAnimation	= "screen",

				links =
				{
					{
						objName		= "pers_info",	
						layer		= "UI.HelpWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- legacy from FullScreenSelectionWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "quests_characterInfo_work",
				defaultAnimation	= "idle",
	
				links =
				{
					{
						objName		= "pers_ico",	
						layer		= "UI.Quests_CharacterInfoWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title52",	
						layer		= "UI.Quests_CharacterInfoWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title53",	
						layer		= "UI.Quests_CharacterInfoWnd.layers.QUEST_TYPES_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "descript",	
						wnd			= "UI.Quests_CharacterInfo_DescTextBoxWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_4",	
						wnd			= "UI.Quests_CharacterInfo_CloseBtn",
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
				defName 			= "quests_characterInfo_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- QUEST_TYPES_DESC
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},
	
	children = { "UI.Quests_CharacterInfo_DescTextBoxWnd", "UI.Quests_CharacterInfo_CloseBtn" }
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Quests_CharacterInfoWnd:Setup( character )

	self:Reset()

    self.character = character

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Quests_CharacterInfoWnd.layers =
{
	MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	ICO_EFFECT			= 3,
	NAME				= 4,
	QUEST_TYPES_DESC	= 5,
}

UI.Quests_CharacterInfoWnd.effectInfo =
{
	ico =
	{
		spriteName	= "ico"
	},

	-- наследие от FullScreenWnd
	main =
	{
		animIdle = "screen"
	},
}

UI.Quests_CharacterInfoWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Quests_CharacterInfoWnd.character	= ""
UI.Quests_CharacterInfoWnd.descTextBox	= nil
UI.Quests_CharacterInfoWnd.closeBtn		= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Quests_CharacterInfoWnd:PostLoad()

	UI.FullScreenWnd.PostLoad( self )
	
	self.descTextBox	= UI.Quests_CharacterInfo_DescTextBoxWnd
	self.closeBtn		= UI.Quests_CharacterInfo_CloseBtn

end


--
function UI.Quests_CharacterInfoWnd:Reset()

	self.character = ""

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.QUEST_TYPES_DESC )

	self.descTextBox:Reset()

end


--
function UI.Quests_CharacterInfoWnd:FullUpdate()

	if not self.character == "" then
		self:Reset()
		return
	end

	self:UpdateIco()
	self:UpdateName()
	self:UpdateQuestTypesDesc()
	self:UpdateDesc()

end


--
function UI.Quests_CharacterInfoWnd:UpdateIco()

	local hTex = UI:GetQuestCharacterIcoBig( self.character )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.Quests_CharacterInfoWnd:UpdateName()

	local str = UI:GetQuestCharacterNameFull( self.character )
	self:SetText( str, self.layers.NAME )	

end


--
function UI.Quests_CharacterInfoWnd:UpdateQuestTypesDesc()

	local str = UI:GetQuestCharacterQuestTypesDesc( self.character )
	self:SetText( str, self.layers.QUEST_TYPES_DESC )

end


--
function UI.Quests_CharacterInfoWnd:UpdateDesc()

	local str = UI:GetQuestCharacterDesc( self.character )
	self.descTextBox:SetScrollText( str )

end


--
function UI.Quests_CharacterInfoWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	return true

end


--
function UI.Quests_CharacterInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.closeBtn then
		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )
	end

	return true

end


-- -------------------------------------------------------------------
-- UI.Quests_CharacterInfo_DescTextBoxWnd
-- -------------------------------------------------------------------

UI.Quests_CharacterInfo_DescTextBoxWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectTextBox2Wnd",
	
		props =
		{
			name		= "Quests_CharacterInfo_DescTextBoxWnd",
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
					defName 			= "quests_characterInfo_textBox",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						-- не линкуется по ALIGNMENT
						{
							objName		= "description15",	
							layer		= "UI.EffectTextBoxWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
		},
	},

	effectInfo =
	{
		main =
		{
			scrollObjName		= "scroll_",
			textObjName			= "description15"
		}
	},

	scrollBarPrototypeName = "EffectScrollWnd_Vrt_2",
}


-- -------------------------------------------------------------------
-- UI.Quests_CharacterInfo_CloseBtn
-- -------------------------------------------------------------------

UI.Quests_CharacterInfo_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name		= "Quests_CharacterInfo_CloseBtn"
		}
	},

	textId = "close"
}

-- ----------------------------------------------------------------------------
-- UI.Quests_CloseBtn
-- ----------------------------------------------------------------------------

UI.Quests_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "Quests_CloseBtn",
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
					defName 			= "gameplay_map_pve_quests_closeBtn",
					defaultAnimation	= "idle",
					
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	},
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "idle",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- ----------------------------------------------------------------------------
-- UI.GameplayPveMap_QuestsWnd
-- ----------------------------------------------------------------------------

UI.GameplayPveMap_QuestsWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.GameplayPveMap_QuestsWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "QuestsWnd",

	props =
	{
		name		= "GameplayPveMap_QuestsWnd",
	},
}

-- ---------------------------
-- const
-- ---------------------------

UI.GameplayPveMap_QuestsWnd.mainWndName = "GameplayPveMapWnd"

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.GameplayPveMap_QuestsWnd:GetBundleLaunchData()

	local launchData =
	{
		bGameplayPveMap	= true,
		mode			= UI.GameplayPveMapWnd:GetMode(),
	}
	
	return launchData

end


--
function UI.GameplayPveMap_QuestsWnd:GetShipsLaunchData()

	local launchData =
	{
		bGameplayPveMap	= true,
		mode			= UI.GameplayPveMapWnd:GetMode(),
	}
	
	return launchData

end


-- ----------------------------------------------------------------------------
-- GameplayPveMap_BuyWnd
-- ----------------------------------------------------------------------------

UI.GameplayPveMap_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "GameplayPveMap_BuyWnd",
    	},
	},

	mainWndName = "GameplayPveMapWnd",
}

-- ---------------------------------------------------------------------
-- UI.GameplayPveMap_CurrentLocationBtn
-- ---------------------------------------------------------------------

UI.GameplayPveMap_CurrentLocationBtn = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayPveMap_CurrentLocationBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	
	props =
	{
		name		= "GameplayPveMap_CurrentLocationBtn",
		selectSound	= UI.sounds.btnMouseOver,
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
				defName 			= "gameplay_map_pve_currentLocationBtn",
				defaultAnimation	= "idle",
		
				links =
				{
					{
						objName		= "self170",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

function UI.GameplayPveMap_CurrentLocationBtn:GetTooltipData()

	return self.tooltipData

end

-- --------------------------------
-- const
-- --------------------------------

UI.GameplayPveMap_CurrentLocationBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

UI.GameplayPveMap_CurrentLocationBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_SMALL,
	text		= UI:GetStringByName( "galaxyMap_currentLocation_tooltip" ),
}


-- ---------------------------------------------------------------------
-- UI.GameplayPveMap_BfsSectorStatsWnd
-- ---------------------------------------------------------------------

UI.GameplayPveMap_BfsSectorStatsWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayPveMap_BfsSectorStatsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",
	
	props =
	{
		name		= "GameplayPveMap_BfsSectorStatsWnd",
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
				defName 			= "gameplay_map_pve_sectorStats_main",
				defaultAnimation	= "idle",
			
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
			
					{
						objName		= "title14",
						layer		= "UI.GameplayPveMap_BfsSectorStatsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "galaxyMap_sectorStats_caption" )
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayPveMap_BfsSectorStatsWnd:Update()

	self:Clear()
	
	local races = UI:GetRaces()
	
	for raceIdx, race in ipairs( races ) do
		if race ~= ai.Race.CRYSTAL and race ~= ai.Race.SPECIAL then
			self:AddRecord( { race = race } )
		end
	end

end


--
function UI.GameplayPveMap_BfsSectorStatsWnd:GetTooltipData()

	return self.tooltipData

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayPveMap_BfsSectorStatsWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.GameplayPveMap_BfsSectorStatsWnd.btnPrototypeName	= "GameplayPveMap_BfsSectorStats_SlotWnd"
UI.GameplayPveMap_BfsSectorStatsWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.GameplayPveMap_BfsSectorStatsWnd.MAX_SLOTS			= 3

UI.GameplayPveMap_BfsSectorStatsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "info_slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}


UI.GameplayPveMap_BfsSectorStatsWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "galaxyMap_sectorStats_tooltipCaption" ),
	text		= UI:GetStringByName( "galaxyMap_sectorStats_tooltipText" ),
}

-- ---------------------------------------------------------------------
-- UI.GameplayPveMap_BfsSectorStats_SlotWnd
-- ---------------------------------------------------------------------

UI.GameplayPveMap_BfsSectorStats_SlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayPveMap_BfsSectorStats_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",
	
	props =
	{
		name		= "GameplayPveMap_BfsSectorStats_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "gameplay_map_pve_sectorStats_slot",
				defaultAnimation	= "idle",
			
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "bg",
						layer		= "UI.GameplayPveMap_BfsSectorStats_SlotWnd.layers.COLOR_BG",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "frame",
						layer		= "UI.GameplayPveMap_BfsSectorStats_SlotWnd.layers.COLOR_FRAME",
						animParams	= UI.EffectAnimParams.POS,
					},
			
					{
						objName		= "count",
						layer		= "UI.GameplayPveMap_BfsSectorStats_SlotWnd.layers.NUM_SECTORS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "title",
						layer		= "UI.GameplayPveMap_BfsSectorStats_SlotWnd.layers.RACE_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- COLOR_BG
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	

			effects =
			{{
				defName 			= "gameplay_map_pve_sectorStats_slot_colorBg",
				defaultAnimation	= "idle",
			}}
		},
		
		-- COLOR_FRAME
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	

			effects =
			{{
				defName 			= "gameplay_map_pve_sectorStats_slot_colorFrame",
				defaultAnimation	= "idle",
			}}
		},

		-- NUM_SECTORS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- RACE_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayPveMap_BfsSectorStats_SlotWnd:Reset()
	
	local bgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_BG )
	if bgEffect then
		bgEffect:SetColor( 0 )
		bgEffect:SetAlpha( 0 )
	end
	
	local frameEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME )
	if frameEffect then
		frameEffect:SetColor( 0 )
		frameEffect:SetAlpha( 0 )
	end
	
	self:SetText( "", self.layers.NUM_SECTORS )
	self:SetText( "", self.layers.RACE_NAME )
	
end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayPveMap_BfsSectorStats_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	COLOR_BG	= 1,
	COLOR_FRAME	= 2,
	NUM_SECTORS	= 3,
	RACE_NAME	= 4,
}

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayPveMap_BfsSectorStats_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()
	
	self:UpdateColor( data )
	self:UpdateNumSectors( data )
	self:UpdateRaceName( data )
	
end


--
function UI.GameplayPveMap_BfsSectorStats_SlotWnd:UpdateColor( data )
	
	local color = UI.GameplayPveMapWnd:GetBfsSectorColorByRace( data.race )
	
	local alpha_fill = UI.GameplayPveMapWnd:GetBfsSectorAlphaFill() * 255
	local alpha_outline = UI.GameplayPveMapWnd:GetBfsSectorAlphaOutline() * 255
	
	local bgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_BG )
	if bgEffect then
		bgEffect:SetColor( color )
		bgEffect:SetAlpha( alpha_fill )
	end
	
	local frameEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME )
	if frameEffect then
		frameEffect:SetColor( color )
		frameEffect:SetAlpha( alpha_outline )
	end

end


--
function UI.GameplayPveMap_BfsSectorStats_SlotWnd:UpdateNumSectors( data )

	local numSectors = UI.GameplayPveMapWnd:GetNumBfsSectorsByRace( data.race )
	self:SetText( tostring( numSectors ), self.layers.NUM_SECTORS )

end


--
function UI.GameplayPveMap_BfsSectorStats_SlotWnd:UpdateRaceName( data )

	local str = UI:Race2Str( data.race, false )
	self:SetText( str, self.layers.RACE_NAME )
	
end