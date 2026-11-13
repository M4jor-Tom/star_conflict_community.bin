-- ----------------------------------------------------------------------------
--
-- Workfile: hudobjectsmarks.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

function l_fnDummy() return true; end

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudObjectsMarksWnd = {}
local om = UI.HudObjectsMarksWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectsMarksWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudObjectsMarksWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_objectsMarks",
				defaultAnimation	= "idle",
			}}
		},
	},

	children = { "UI.HudObjectsMarks_MarksWnd", "UI.HudObjectsMarks_PredictionsWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectsMarksWnd:Init()

	self:Reset()

	self:UpdateFitQuests()
	self:UpdateFitAdventures()

end


--
function UI.HudObjectsMarksWnd:AddVitalPoint( entityId )

	local objType = _G.GetCurrentGameMode() == ai.Gameplay.CLANSHIP and self.objTypes.CLANSHIP_VITAL_POINT or self.objTypes.VITAL_POINT
	self:AddMark( entityId, objType )

	self:AddTurretsForVitalPoint( entityId )

end


--
function UI.HudObjectsMarksWnd:OnSpawnSpaceShip( shipId )

	self:AddMark( shipId, -1 )

end


--
function UI.HudObjectsMarksWnd:OnSpawnAdventureGiver( giverId )

	self:AddMark( giverId, -1 )

end


--
function UI.HudObjectsMarksWnd:AddHudObj( entId )

	self:AddMark( entId, -1 )

end


-- called from *.cpp code
function UI.HudObjectsMarksWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )

	if not self:IsOnScreen() then
		return
	end

	local hudMode = UI.HudWnd:GetMode()

	if UI.HudWnd:IsWorldLookMode( hudMode ) then
		return
	end

	local mark = self.marks[ victimEntityId ]
	if not mark then
		return
	end

	if mark.bDead then
		return
	end
	
	self:AddDamageRecord( mark, damageVal, damageFlags )

end


-- вызывается из биндов
function UI.HudObjectsMarksWnd:MarksFullModeBindOn()

	if not UI.HudWnd:IsOnScreen() then
		return
	end

	self.bMarksFullBindOn = true

end


-- вызывается из биндов
function UI.HudObjectsMarksWnd:MarksFullModeBindOff()

	if not UI.HudWnd:IsOnScreen() then
		return
	end

	self.bMarksFullBindOn = false

end


-- вызывается из биндов
function UI.HudObjectsMarksWnd:OnToggleMarksNamesBind()

	if not UI.HudWnd:IsOnScreen() then
		return
	end

	self.bMarksFullBindOn = not self.bMarksFullBindOn

end


-- если true, то показывать режим FULL для всех кораблей и турелей
function UI.HudObjectsMarksWnd:IsMarksFullBindNameOn()

	return self.bMarksFullBindOn

end


--
function UI.HudObjectsMarksWnd:OnVitalPointRespawnTurrets( vitalPointId )

	self:AddTurretsForVitalPoint( vitalPointId )

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for entId, mark in pairs( self.marks ) do

		if mark.wnd and mark.wnd:GetWndType() == self.wndTypes.INSIDE_SHIP then

			if mark.objType == self.objTypes.PLAYER then

				local playerCid = UI:GetPlayerClanById( mark.playerId )
				if cid == playerCid then
	
					local bFirstUpdateSaved = mark.data.bFirstUpdate
					mark.data.bFirstUpdate = true
	
					self:CheckEntValid( mark )
					mark.wnd:UpdateName( -1 )
	
					mark.data.bFirstUpdate = bFirstUpdateSaved
	
				end

			end
	
		end

	end	

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end
	
	for entId, mark in pairs( self.marks ) do

		if mark.wnd and mark.wnd:GetWndType() == self.wndTypes.INSIDE_SHIP then

			if mark.objType == self.objTypes.PLAYER then
			
				local playerInfo = _G.GetPlayerInfo( mark.playerId )
				local playerUid = playerInfo.isBot and playerInfo.botUid or playerInfo.uid
				
				if uid == playerUid then
	
					local bFirstUpdateSaved = mark.data.bFirstUpdate
					mark.data.bFirstUpdate = true
	
					self:CheckEntValid( mark )
					mark.wnd:UpdateName( -1 )
	
					mark.data.bFirstUpdate = bFirstUpdateSaved
	
				end

			end
	
		end

	end
	
end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnAdaptiveMarksSizeOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateAdaptiveMarksSize()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnHudOnCircleMarksModeOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateOnCircleMarksMode()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnMarksElementsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateMarksElements()
	self:ResetVisibleMarks()	-- чтобы произошел полный апдейт всего

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnHideMarksFramesOutOfShotOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateHideFramesOutOfShot()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnMarksTransparentBehindObstacleOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateTransparentBehindObstacle()

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnHudArrowsAreaTypeOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateArrowsAreaType()

end


--
function UI.HudObjectsMarksWnd:OnRemoveEntityFromHud( entityId )

	local mark = self.marks[ entityId ]
	if not mark then
		return
	end

	if mark.lastDamageRecordIdx == -1 then
		self:DeleteMarkForEntity( entityId )
	else
		mark.bNeedRemove = true
	end

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudObjectsMarksWnd:OnMarksFadeOnDistChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateFadeOnDist()

end


--
function UI.HudObjectsMarksWnd:OnScalableHealthBarsOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateScalableHealthBars()
	self:ResetVisibleMarks()	-- чтобы 	произошел полный апдейт всего

end


--
function UI.HudObjectsMarksWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateVpHpAlways()

end


--
function UI.HudObjectsMarksWnd:OnPlayerSqidChanged( playerIdx, sqid )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	local mySqid = _G.CL_GetPlayerSquad( UI.HudWnd.localPlayerId )

	for entId, mark in pairs( self.marks ) do

    	if mark.playerId ~= -1 then

    		local playerSqid = _G.CL_GetPlayerSquad( mark.playerId )
			mark.bMySquad = mySqid ~= UI.INVALID_U64_ID and playerSqid == mySqid

		end

	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnNotification( notification, params )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_QUEST_PROGRESS then

		if type( params.questId ) ~= "number" then
			sys.log( "UI.HudObjectsMarksWnd:MasterServer_OnNotification()[ERROR]: invalid type of \"params.questId\" in notification \"SN_QUEST_PROGRESS\"; \"number\" expected, got \"%s\"", type( params.questId ) )
			return
		end

		self:OnQuestStateChanged( params.questId, UI.questTypes.REGULAR )

	elseif notification == _G.MasterServer.ServerNotification.SN_ADVENTURE_PROGRESS then

		if type( params.aiid ) ~= "userdata" then
			sys.log( "UI.HudObjectsMarksWnd:MasterServer_OnNotification()[ERROR]: invalid type of \"params.aiid\" in notification \"SN_ADVENTURE_PROGRESS\"; \"userdata\" expected, got \"%s\"", type( params.aiid ) )
			return
		end

		self:OnAdventureStateChanged( params.aiid )

	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	local questId = param1

	self:OnQuestStateChanged( questId, UI.questTypes.REGULAR )

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnAdventureFinal( param )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if param and param.aiid then
		self:OnAdventureStateChanged( param.aiid )
	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnAdventureStageChange( param )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if param and param.aiid then
		self:OnAdventureStateChanged( param.aiid )
	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	local questId = param1

	self:OnQuestStateChanged( questId, UI.questTypes.REGULAR )

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnNewAdventure( param )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if param and param.aiid then
		self:OnAdventureStateChanged( param.aiid )
	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateFitQuests()

	for entId, mark in pairs( self.marks ) do
		self:UpdateMarkQuests( mark )
	end

end


--
function UI.HudObjectsMarksWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateFitAdventures()

	for entId, mark in pairs( self.marks ) do
		self:UpdateMarkAdventures( mark )
	end

end


--
function UI.HudObjectsMarksWnd:GetQuestForIco( quests )

	local questForIcoId		= -1
	local questForIcoType	= -1

	local questForIco = nil

	for idx, quest in ipairs( quests ) do

		local bBetter = false

		if questForIco == nil then
			bBetter = true

		elseif questForIco.bCompleted and not quest.bCompleted then
			bBetter = true

		else

			local bQuestForIcoAuto	= ( questForIco.questType == UI.questTypes.REGULAR and UI:IsQuestAuto( questForIco.questId ) ) or ( questForIco.questType == UI.questTypes.CUSTOM and questForIco.questId == UI.questIcoTypes.BLUE )
			local bAuto				= ( quest.questType == UI.questTypes.REGULAR and UI:IsQuestAuto( quest.questId ) ) or ( quest.questType == UI.questTypes.CUSTOM and quest.questId == UI.questIcoTypes.BLUE )

			if bQuestForIcoAuto and not bAuto then
				bBetter = true
			end

		end

		if bBetter then
			questForIco = quest
		end

	end

	if questForIco then
		questForIcoId	= questForIco.questId
		questForIcoType	= questForIco.questType
	end

	return questForIcoId, questForIcoType

end


--
function UI.HudObjectsMarksWnd:GetMarkQuestIco( mark )

	if mark.quests[ 1 ] then
		local questId, questType = self:GetQuestForIco( mark.quests )
		return UI:GetHudMarkQuestIcoByQuestId( questId, questType )

	else
		return UI.INVALID_RESOURCE_HANDLE
	end

end


--
function UI.HudObjectsMarksWnd:GetMarkAdventureIco( mark )

	if mark.adventures[ 1 ] then
		-- return UI:GetTex( "ques_gate_ico" )
		return UI:GetTex( "questIco_auto" )
		--return UI:GetTex( "questIco" )
	else
		return UI.INVALID_RESOURCE_HANDLE
	end

end


--
function UI.HudObjectsMarksWnd:GetMarkQuestIcoName( mark )

	if mark.quests[ 1 ] then
		local questId, questType = self:GetQuestForIco( mark.quests )
		return UI:GetHudMarkQuestIcoNameByQuestId( questId, questType )

	else
		return ""
	end

end


--
function UI.HudObjectsMarksWnd:GetMarkAdventureIcoName( mark )

	if mark.adventures[ 1 ] then
		--return "questIco"
		return "questIco_auto"
	else
		return ""
	end

end


--
function UI.HudObjectsMarksWnd:OnHudPredictionVisibleChanged()

	if not self:IsOnScreen() then
		return
	end

	for entId, mark in pairs( self.visibleMarks ) do

		if mark.predictionWnd then
			mark.predictionWnd:OnHudPredictionVisibleChanged()
		end

	end

end


--
function UI.HudObjectsMarksWnd:OnPredictionColorOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	for entId, mark in pairs( self.visibleMarks ) do

		if mark.predictionWnd then
			mark.predictionWnd:OnPredictionColorOptionChanged()
		end

	end

end


--
function UI.HudObjectsMarksWnd:OnShowPredictionUnderMouseOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateShowPredictionUnderMouse()

end


--
function UI.HudObjectsMarksWnd:HasMarkQuests( entId )

	local mark = self.marks[ entId ]
	return mark ~= nil and mark.quests[ 1 ] ~= nil

end


--
function UI.HudObjectsMarksWnd:HasMarkAdventures( entId )

	local mark = self.marks[ entId ]
	return mark ~= nil and mark.adventures[ 1 ] ~= nil

end


--
function UI.HudObjectsMarksWnd:OnPveEventAcivate( id )

	self:OnQuestStateChanged( id, UI.questTypes.PVE_EVENT )

end


--
function UI.HudObjectsMarksWnd:OnPveEventComplete( id )

	self:OnQuestStateChanged( id, UI.questTypes.PVE_EVENT )

end


--
function UI.HudObjectsMarksWnd:ShowMarkNotify( entId, bYellow )

	if type( entId ) ~= "number" then
		sys.log( "UI.HudObjectsMarksWnd:ShowMarkNotify()[ERROR]: invalid type of the 1-st parameter (\"entId\"); \"number\" expected, got \"%s\"", type( entId ) )
		return
	end
	
	if bYellow ~= nil then
		if type( bYellow ) ~= "boolean" then
			sys.log( "UI.HudObjectsMarksWnd:ShowMarkNotify()[ERROR]: invalid type of the 2-nd parameter (\"bYellow\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bYellow ) )
			bYellow = nil
		end
	end
	
	if bYellow == nil then
		bYellow = false
	end
	
	local mark = self.marks[ entId ]
	if not mark then
		sys.log( "UI.HudObjectsMarksWnd:ShowMarkNotify()[ERROR]: no mark for object %d", entId )
	end

	local questId 		= bYellow and UI.questIcoTypes.YELLOW or UI.questIcoTypes.BLUE
	local oldQuestId	= self.customQuestEntities[ entId ] or -1
	
	if questId ~= oldQuestId then
	
		self.customQuestEntities[ entId ] = questId
		
		if oldQuestId ~= -1 then
			self.fitQuests[ UI.questTypes.CUSTOM ][ oldQuestId ] = self:GetQuestInfo( oldQuestId, UI.questTypes.CUSTOM )
		end
		
		self.fitQuests[ UI.questTypes.CUSTOM ][ questId ] = self:GetQuestInfo( questId, UI.questTypes.CUSTOM )
		
		if mark then
			self:UpdateMarkQuests( mark )
			--self:UpdateMarkAdventures( mark )
		end
		
	end

end


--
function UI.HudObjectsMarksWnd:HideMarkNotify( entId )

	if type( entId ) ~= "number" then
		sys.log( "UI.HudObjectsMarksWnd:HideMarkNotify()[ERROR]: invalid type of the 1-st parameter (\"entId\"); \"number\" expected, got \"%s\"", type( entId ) )
		return
	end
	
	local oldQuestId = self.customQuestEntities[ entId ]
	
	if oldQuestId then
	
		self.customQuestEntities[ entId ] = nil
		
		self.fitQuests[ UI.questTypes.CUSTOM ][ oldQuestId ] = self:GetQuestInfo( oldQuestId, UI.questTypes.CUSTOM )
		
		local mark = self.marks[ entId ]
		if mark then
			self:UpdateMarkQuests( mark )
		end
		
	end
	
end


-- хак, используется HudWarningsWnd для подсчета кораблей, которые залочили корабль игрока
function UI.HudObjectsMarksWnd:GetMarks()

	return self.marks

end



--
function UI.HudObjectsMarksWnd:OnHudMarkTimersChanged( timers )
	-- ничего не делаем, таймеры апдейтятся каждый кадр
end


-- ------------------------------
-- const
-- ------------------------------

UI.HudObjectsMarksWnd.MIN_ALPHA_DIST 			= 5000 / 10	-- расстояние между моим и чужим кораблем, на котором марка наиболее прозрачна (если она не в радиусе стрельбы)
UI.HudObjectsMarksWnd.MIN_ALPHA					= 0.3 		-- минимальная альфа марки
UI.HudObjectsMarksWnd.FIRE_DIST_ALPHA			= 0.6		-- альфа на расстоянии выстрела (альфа интерполируется от MIN_ALPHA до FIRE_DIST_ALPHA, прямо на расстоянии выстрела резко перескакивает на 1 )
UI.HudObjectsMarksWnd.BEHIND_OBSTACLE_ALPHA		= 0.3		-- альфа объекта за препятствием

UI.HudObjectsMarksWnd.MINOR_OBJECTS_DIST		= UI.MINOR_OBJECTS_DIST

om.layers =
{
	MAIN_EFFECT		= 0,
}

om.objTypes =
{
	DEFAULT					= 1, 
	PLAYER					= 2,
	VITAL_POINT				= 3,
	BOMB					= 4, 
	BOMB_SITE				= 5, 
	TARGET					= 6, 
	LOOT					= 7,
	JUMP_GATE				= 8,
	MISSILE					= 9,
	CLANSHIP_VITAL_POINT	= 10,	
}

om.visibilityTypes =
{
	MAJOR	= 1,	-- отображается сразу как входит в зону видимости (по умолчанию)
	MINOR	= 2,	-- отображается только при приближении на некоторое константное расстояние ( MINOR_OBJECTS_DIST ); на круге стрелка рисуется только при залочке
}

om.wndTypes =
{
	INSIDE_SHIP					= 1,
	INSIDE_VITAL_POINT			= 2,
	OUTSIDE_SHIP				= 3,
	OUTSIDE_VP					= 4,
	INSIDE_CLANSHIP_VITAL_POINT	= 5,
}

om.effectInfo =
{
	main =
	{
		circleDrawRadiusVpObjName		= "dist_out_base",
		circleDrawRadiusShipObjName		= "dist_out_ship",
		circleAlphaNearRadiusVpObjName	= "dist_out_base_2",
		circleAlphaNearRadiusShipObjName= "dist_out_ship_2",
		circleAlphaFarRadiusVpObjName	= "dist_out_base_alpha",
		circleAlphaFarRadiusShipObjName	= "dist_out_ship_3_alpha",
		mouseRadiusObjName				= "area_lock",
		damageRecordsHeightObjName		= "dist_indic_damage",
		nearBorderRadiusVpObjName		= "dist_base",
		nearBorderRadiusShipObjName		= "dist_ship",
	},

	damageRecordsParams =
	{
		fontLocator		= "text",
		fontLocatorBig	= "text_size",

		colorLocators =
		{
			GENERIC	= "text",
			KINETIC	= "color_2",
			EMP		= "color_3",
			THERMAL	= "color_1",
		}
	},
}

om.DAMAGE_RECORD_SPEED		= 50	-- pix/sec
om.DAMAGE_ALPHA_THRES		= 0.75	-- процент макс. расстояния отлета цифры дамага, после которого начинается уход в альфу
om.MARK_HIDE_TIME			= 1
om.MARK_SHOW_ON_CIRCLE_TIME	= 0.7
om.MARK_HIDE_ON_CIRCLE_TIME	= 0.3

om.centerModes =
{
	CAMERA		= 1,
	SHIP		= 2,
	MISSILE		= 3,
	DRONE		= 4,
	CLONE		= 5,
	SWARM		= 6,
}

om.AIM_BORDERS_WORLD_SIZE = 5

om.strCriticalDamage = "" -- UI:GetStringByName( "hud_marks_criticalDamage" )	-- #0034236

om.centerPos = Vec2( 1024 * 0.5, 768 * 0.5 )

om.MAX_MARKS_BY_PASS = 20

om.sounds =
{
	markClick	= "sound/ui/btnClick",
}


om.objType2WndType =
{
	[ om.objTypes.DEFAULT ]					= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = om.wndTypes.OUTSIDE_SHIP }, 
	[ om.objTypes.PLAYER ]					= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = om.wndTypes.OUTSIDE_SHIP },
	[ om.objTypes.VITAL_POINT ]				= { regular = om.wndTypes.INSIDE_VITAL_POINT,			onCircle = om.wndTypes.OUTSIDE_VP },
	[ om.objTypes.BOMB ]					= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = om.wndTypes.OUTSIDE_SHIP }, 
	[ om.objTypes.BOMB_SITE ]				= { regular = om.wndTypes.INSIDE_VITAL_POINT ,			onCircle = om.wndTypes.OUTSIDE_VP }, 
	[ om.objTypes.TARGET ]					= { regular = -1,										onCircle = om.wndTypes.OUTSIDE_SHIP }, 
	[ om.objTypes.LOOT ]					= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = om.wndTypes.OUTSIDE_SHIP },
	[ om.objTypes.JUMP_GATE ]				= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = om.wndTypes.OUTSIDE_SHIP },
	[ om.objTypes.MISSILE ]					= { regular = om.wndTypes.INSIDE_SHIP,					onCircle = -1 },
	[ om.objTypes.CLANSHIP_VITAL_POINT ]	= { regular = om.wndTypes.INSIDE_CLANSHIP_VITAL_POINT,	onCircle = om.wndTypes.OUTSIDE_SHIP },	
}

om.GATE_ID_DOCK	= -2		-- фэйковый id зоны (для унификации обработки), используемый для врат, которые не ведут в зону, а пристыковывают к ангару

-- ------------------------------
-- vars
-- ------------------------------

om.marks							= {}
om.visibleMarks						= {}
om.visibleMarksArr					= {}
om.numVisibleMarks					= 0
om.wndsPool							= {}
om.totalNumWndsOfType				= {}
om.sortedWnds						= {}
om.numSortedWnds					= 0
om.bMarksHidden						= false
om.bMarksHiddenForce				= false
om.rotationRadius_abs				= 0
om.nearBorderGuard_abs				= 0
om.circleDrawRadiusVp_abs			= 0
om.circleDrawRadiusShip_abs			= 0
om.circleAlphaNearRadiusVp_abs		= 0
om.circleAlphaNearRadiusShip_abs	= 0
om.circleAlphaFarRadiusVp_abs		= 0
om.circleAlphaFarRadiusShip_abs		= 0
om.nearBorderRadiusVp_abs			= 0
om.nearBorderRadiusShip_abs			= 0
om.nearBorderRadiusShipLock_abs		= 0
om.mouseRadius_abs					= 0
om.damageRecordSpeed_abs			= 0
om.damageRecordsHeight_abs			= 0
om.markUnderMouse					= nil
om.lastMarkWithPredictionUnderMouse	= nil
om.bMarksFullBindOn					= false
om.bAdaptiveMarksSize				= UI.hudOptionsDefaultVals.adaptiveMarksSize
om.onCircleMarksMode				= UI.hudOptionsDefaultVals.onCircleMarksMode
om.bFadeOnDist						= UI.hudOptionsDefaultVals.marksFadeOnDist
om.bHideFramesOutOfShot				= UI.hudOptionsDefaultVals.hideMarksFramesOutOfShot
om.bTransparentBehindObstacle		= UI.hudOptionsDefaultVals.marksTransparentBehindObstacle
om.bLockOnCircleAnimation			= false
om.numMarks							= 0
om.pass								= 1
om.numPasses						= 1
om.marksByPass						= { [1] = { numMarks = 0, marks = {} } }
om.marksElements					= { [ false ] = {}, [ true ] = {} }
om.arrowsAreaType					= UI.hudOptionsDefaultVals.hudArrowsAreaType
om.bScalableHealthBars				= UI.hudOptionsDefaultVals.scalableHealthBars
om.bVpHpAlways						= UI.hudOptionsDefaultVals.vpHpAlways
om.bOculus							= cvars.g_oculusVR ~= 0		-- при изменении этого сивара вызывается перезагрузка ресурсов ui, так что достаточнго узнать его значение один раз, при инициализации окна
om.fitQuests						= {}
om.damageRecordColors				= nil
om.damageRecordFont					= -1
om.damageRecordFontBig				= -1
om.mouseTargetRadius_abs			= Vec2( 0, 0 )
om.predictionsPool					= {}
om.totalNumPredictions				= 0
om.showPredictionUnderMouse			= UI.hudOptionsDefaultVals.showPredictionUnderMouse
om.bEnableFriendlyFire				= false
om.shipEntId						= -1
om.fnIsMarkInFireRange				= {}
om.fnNeedMarkVisible				= {}
om.weaknessRadius					= 0
om.customQuestEntities				= {}

om.fitAdventures					= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectsMarksWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:UpdateAbsValues()

	for typeName, typeId in pairs( self.wndTypes ) do
		self.wndsPool[ typeId ] = { wnds = {}, numWnds = 0 }
		self.totalNumWndsOfType[ typeId ] = 0
	end

	self.fnIsMarkInFireRange =
	{
		[ self.objTypes.DEFAULT ]				= self.IsMarkInFireRange_byFireRange,
		[ self.objTypes.PLAYER ]				= self.IsMarkInFireRange_byFireRange,
		[ self.objTypes.VITAL_POINT ]			= self.IsMarkInFireRange_VITAL_POINT,
		[ self.objTypes.BOMB ]					= self.IsMarkInFireRange_byInteractionDist,
		[ self.objTypes.BOMB_SITE ]				= self.IsMarkInFireRange_byInteractionDist,
		[ self.objTypes.TARGET ]				= self.IsMarkInFireRange_byFireRange,
		[ self.objTypes.LOOT ]					= self.IsMarkInFireRange_byInteractionDist,
		[ self.objTypes.JUMP_GATE ]				= self.IsMarkInFireRange_JUMP_GATE,
		[ self.objTypes.MISSILE ]				= self.IsMarkInFireRange_byFireRange,
		[ self.objTypes.CLANSHIP_VITAL_POINT ]	= self.IsMarkInFireRange_byInteractionDist,
	}

	self.fnNeedMarkVisible =
	{
		[ self.objTypes.DEFAULT ]				= self.NeedMarkVisible_DEFAULT,
		[ self.objTypes.PLAYER ]				= self.NeedMarkVisible_PLAYER,
		[ self.objTypes.VITAL_POINT ]			= self.NeedMarkVisible_VITAL_POINT,
		[ self.objTypes.BOMB ]					= self.NeedMarkVisible_BOMB,
		[ self.objTypes.BOMB_SITE ]				= self.NeedMarkVisible_BOMB_SITE,
		[ self.objTypes.TARGET ]				= self.NeedMarkVisible_TARGET,
		[ self.objTypes.LOOT ]					= self.NeedMarkVisible_default,
		[ self.objTypes.JUMP_GATE ]				= self.NeedMarkVisible_default,
		[ self.objTypes.MISSILE ]				= self.NeedMarkVisible_MISSILE,
		[ self.objTypes.CLANSHIP_VITAL_POINT ]	= self.NeedMarkVisible_default,
	}

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_END_LEVEL )	

end


--
function UI.HudObjectsMarksWnd:F_Shutdown()

	for entId, mark in pairs( self.marks ) do
		self:ResetDamageRecords( mark )	
	end

	self:Shutdown()

end


--
function UI.HudObjectsMarksWnd:Reset()

	for entId, mark in pairs( self.marks ) do
		self:DeleteMarkForEntity( entId )
	end	

	self.bMarksFullBindOn = false

	self.numMarks				= 0
	self.pass					= 1
	self.numPasses				= 1
	self.marksByPass			= { [1] = { numMarks = 0, marks = {} } }
	self.fitQuests				= {}
	self.bEnableFriendlyFire	= false
	self.shipEntId				= -1
	self.weaknessRadius			= 0

	self.fitAdventures			= {}

end


--
function UI.HudObjectsMarksWnd:AddMark( entId, objType )

	if type( entId ) ~= "number" then
		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: invalid type of the 1-st parameter (\"entId\"); \"number\" expected, got \"%s\"", type( entId ) )
		return
	end

	if type( objType ) == "number" then
		if objType ~= -1 then
        	if UI:Val2Key( self.objTypes, objType ) == "" then
        		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: invalid 2-nd parameter (\"objType\"); one of the \"UI.HudObjectsMarksWnd.objTypes\" values or -1 expected, got \"%s\"", tostring( objType ) )
				objType = -1
        	end
		end
	else
		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: invalid type of the 2-nd parameter (\"objType\"); \"number\" expected, got \"%s\"", type( objType ) )
		objType = -1
	end

	local existingMark = self.marks[ entId ]
	if existingMark then
		existingMark.bNeedRemove = false
		return
	end

	local ent = _G.Entities[ entId ]
	if not ent then
		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: cannot find entity with id %d", entId )
		return
	end

	local playerId = ent:GetPlayerIdx() or -1

	local defName = ent:GetDefName()
	local def = UI:GetDef( defName )

	if objType == -1 then
		objType = self:DetectObjType( defName, playerId )
	end

	if objType == -1 then
		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: cannot detect obj type" )
		return
	end

	if playerId == -1 and objType == self.objTypes.PLAYER then
		sys.log( "UI.HudObjectsMarksWnd:AddMark()[ERROR]: invalid playerId for PLAYER obj type" )
		return
	end

	local mark = {}

	mark.entId					= entId
	mark.ent					= ent
	mark.defName				= defName
	mark.objType				= objType
	mark.playerId				= playerId
	mark.wnd					= nil
	mark.onCircleWnd			= nil
	mark.bInsideScreen			= false
	mark.damageRecords			= nil
	mark.lastDamageRecordIdx	= -1
	mark.lastEntPos				= Vec3( 0, 0, 0 )	-- необходимо, когда энтити уже уничтожена, но надо закончить показ отлетающего дамага
	mark.bDead					= false
	mark.hideAnimTime			= -1
	mark.hideAnimStartTime		= -1
	mark.onCircleAlpha			= 1
	mark.bMySquad				= false
	mark.interactionDist		= 0
	mark.bNeedRemove			= false
	mark.visibilityType			= self:DetectVisibiltyType( defName, objType )
	mark.bIsShip				= _G.IsClassKindOf( def.class, "SpaceShip" )
	mark.bIsCargoShip			= _G.IsClassKindOf( def.class, "CargoShip" )
	mark.bIsLootCrate			= _G.IsClassKindOf( def.class, "LootCrate" ) or _G.IsClassKindOf( def.class, "PersonalLootCrate" )
	mark.bIsQuestObject			= _G.IsClassKindOf( def.class, "QuestObject" )
	mark.bPreview				= false
	mark.icoName				= ""
	mark.bDamagable				= true
	mark.bHideHpBar				= false
	mark.bHideDamageRecords		= false
	mark.quests					= self:GetMarkQuests( mark )
	mark.predictionWnd			= nil
	mark.bNoPrediction			= def.class == "Turret" or def.class == "ScBaseEntity" or def.class == "DestroyableAsteroid"
	mark.bVp					= mark.objType == self.objTypes.VITAL_POINT or mark.objType == self.objTypes.BOMB_SITE or mark.objType == self.objTypes.CLANSHIP_VITAL_POINT
	mark.boundSphereRadius		= mark.ent:GetMarkFramesSize()
	mark.sortIdx				= -1

	mark.adventures				= self:GetMarkAdventures( mark )

	-- используются только для превью в опциях
	mark.previewName			= nil
	mark.previewHp				= nil
	mark.previewMaxHp           = nil
	mark.previewShield			= nil
	mark.previewMaxShield		= nil
	mark.previewSize			= nil

	if playerId ~= -1 then

		local playerSqid = _G.CL_GetPlayerSquad( playerId )
		if playerSqid ~= UI.INVALID_U64_ID then

			local mySqid = _G.CL_GetPlayerSquad( UI.HudWnd.localPlayerId )
			mark.bMySquad = playerSqid == mySqid

		end

	end

	if objType == self.objTypes.BOMB then

		if ent then
			mark.interactionDist = type( def.interaction_distance ) == "number" and def.interaction_distance or 0
		end		

	elseif objType == self.objTypes.LOOT then

		if ent then
			mark.interactionDist = type( def.interaction_distance ) == "number" and def.interaction_distance or 0
		end		

	elseif objType == self.objTypes.BOMB_SITE then

		if ent then
			mark.interactionDist = type( def.interaction_distance ) == "number" and def.interaction_distance or 0
		end		

	elseif objType == self.objTypes.CLANSHIP_VITAL_POINT then

		if ent then
			mark.interactionDist = type( def.interaction_distance ) == "number" and def.interaction_distance or 0
		end		

	elseif objType == self.objTypes.DEFAULT then

		if type( def.hud_ico ) == "string" and def.hud_ico ~= "" then
			mark.icoName = def.hud_ico
		end

		if type( def.damageable ) == "boolean" then
			mark.bDamagable = def.damageable
		end
		
		if type( def.hide_hp_bar ) == "boolean" then
			mark.bHideHpBar = def.hide_hp_bar
		end
		
		if type( def.hide_damage_records ) == "boolean" then
			mark.bHideDamageRecords = def.hide_damage_records
		end

	end

	-- некоторые оперативные данные, необходимые для апдейта;
	-- запоминаются здесь, чтобы повторно не вычислять, особенно если это связано с выделением памяти;
	-- действительны только в пределах одного кадра
	mark.data = {}

	self.marks[ entId ] = mark

	self.numMarks = self.numMarks + 1

	self:UpdateNumPasses()
	self:UpdateMarkPass( mark )

end   


--
function UI.HudObjectsMarksWnd:DetectObjType( defName, playerId )

	local objType = -1

	local def = UI:GetDef( defName )
	if not def then
		return objType
	end

	-- прописан явно

	if def.hudType == "bomb" then
		objType = self.objTypes.BOMB

	elseif def.hudType == "bomb_site" then
		objType = self.objTypes.BOMB_SITE

	elseif def.hudType == "target" then
		objType = self.objTypes.TARGET

	elseif def.hudType == "loot_crate" then
		objType = self.objTypes.LOOT

	elseif def.hudType == "default" then
		objType = self.objTypes.DEFAULT
	end 

	-- по умолчанию

	if objType == -1 then

		if def.class == "VitalPoint" then
			objType = _G.GetCurrentGameMode() == ai.Gameplay.CLANSHIP and self.objTypes.CLANSHIP_VITAL_POINT or self.objTypes.VITAL_POINT

		elseif _G.IsClassKindOf( def.class, "SpaceShip" ) and playerId ~= -1 then
			objType = self.objTypes.PLAYER

		elseif def.class == "LootCrate" then
			objType = self.objTypes.LOOT

		elseif def.class == "JumpDockLocation" then
			objType = self.objTypes.JUMP_GATE

		else
			objType = self.objTypes.DEFAULT
		end

	end

	return objType

end


--
function UI.HudObjectsMarksWnd:DetectVisibiltyType( defName, objType )

	local visibilityType = -1

	local def = UI:GetDef( defName )
	if not def then
		return visibilityType
	end

	-- прописан явно

	if def and def.hud_visibility_type ~= nil then

		if type( def.hud_visibility_type ) == "string" then

			if def.hud_visibility_type == "major" then
				visibilityType = self.visibilityTypes.MAJOR

			elseif def.hud_visibility_type == "minor" then
				visibilityType = self.visibilityTypes.MINOR

			else
				sys.log( "UI.HudObjectsMarksWnd:DetectVisibiltyType()[ERROR]: unrecognized hud_visibility_type \"%s\" for \"%s\"", def.hud_visibility_type, defName )
			end

		else
			sys.log( "UI.HudObjectsMarksWnd:DetectVisibiltyType()[ERROR]: invalid type of \"_G.Def[%s].hud_visibility_type\"; \"string\" or \"nil\" expected, got \"%s\"", defName, type( def.hud_visibility_type ) )
		end		

	end

	-- по умолчанию

	if visibilityType == -1 then

		if def.class == "VitalPointTurret" then
			visibilityType = self.visibilityTypes.MINOR

		elseif def.class == "Turret" then
			visibilityType = self.visibilityTypes.MINOR

		else
			visibilityType = self.visibilityTypes.MAJOR
		end
	end

	return visibilityType

end


--
function UI.HudObjectsMarksWnd:GetDefaultVisibiltyType( ent, objType )

	if UI:IsEntityOfClass( ent, "VitalPointTurret" ) or UI:IsEntityOfClass( ent, "Turret" ) then
		return self.visibilityTypes.MINOR
	end

	return self.visibilityTypes.MAJOR

end


--
function UI.HudObjectsMarksWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate( dt_sys )

end

--
local l_vec3_temp		= Vec3( 0, 0, 0 )
local l_vec3_temp2		= Vec3( 0, 0, 0 )
local l_marksToDelete	= {}
local l_data			= {}
local l_markData		= {}
local dummy				= nil


local l_SortFunctionContainer = {}
function l_SortFunctionContainer:GetSortFunc()
	
	local myShip = UI.HudWnd.myShip
	local myShipSpeed = myShip and math.abs( _G.CL_GetShipSpeed( myShip ) ) or 0
	local frameTime = 1 / ( UI:GetFps() + 1e-9 )
	local myShipSpeedPerFrame = myShipSpeed * frameTime

	local function fnSortWnds( wnd1, wnd2 )

		local dist1 = wnd1.mark.data.dist
		local dist2 = wnd2.mark.data.dist
		
		if dist1 ~= -1 and dist2 ~= -1 then
		
			--#097150 - предотвращение "мигания" при определенных условиях из-за устаревших данных о дистанции (т.к. маркеры апдейтятся не каждый кадр)
			local framesDelta = math.max( ( wnd1.mark.pass - wnd2.mark.pass ) % UI.HudObjectsMarksWnd.numPasses, ( wnd2.mark.pass - wnd1.mark.pass ) % UI.HudObjectsMarksWnd.numPasses )
			local distInaccuracy = myShipSpeedPerFrame * framesDelta
		
			if math.abs( dist1 - dist2 ) > distInaccuracy then
				return dist1 < dist2
			end	
			
			local prevSortIdx1 = wnd1.mark.sortIdx or -1
			local prevSortIdx2 = wnd2.mark.sortIdx or -1
			
			if prevSortIdx1 ~= -1 and prevSortIdx2 ~= -1 then
				return prevSortIdx1 < prevSortIdx2
			end
			
		end
		
		return wnd1.mark.entId < wnd2.mark.entId

	end
	
	return fnSortWnds

end


--
function UI.HudObjectsMarksWnd:FullUpdate( dt )

	local oldShipEntId = self.shipEntId
	local myShip = UI.HudWnd.myShip
	self.shipEntId = myShip and myShip:GetId() or -1

	local missile = myShip and myShip:GetGuidedMissile()

	if missile then

		local missileId = missile:GetId()
		if not self.marks[ missileId ] then
			self:AddMark( missileId, self.objTypes.MISSILE )
		end

	end

	if self.bMarksHiddenForce then
		return
	end

	local gameplay = _G.GetCurrentGameMode()

	local localPlayerId = UI.HudWnd.localPlayerId

	local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if friendTeam == 0 then
		if gameplay == ai.Gameplay.THREE_TEAMS_DM then
			friendTeam = ai.ThreeTeamsDMTeam1
		else
			friendTeam = 1
		end
	end

	local enemyTeam = friendTeam == 1 and 2 or 1

	local myRelationshipGroup = friendTeam
	local hudMode = UI.HudWnd:GetMode()
	local bWorldLookMode = UI.HudWnd:IsWorldLookMode( hudMode )
	
	local controlMode = _G.CL_GetLocalPlayerControlMode()
	
	local drone = nil
	if controlMode == UI.ShipControlModes.REMOTE_TURRET and myShip then
		drone = myShip:GetDisintegratorDrone()
	end
	
	local clone = ( myShip and myShip:IsGuidedCloneMode() ) and myShip:GetGuidedClone()
	local swarm = ( myShip and myShip:IsRemoteSwarmMode() ) and myShip:GetSwarm()

	local centerMode = self.centerModes.CAMERA

	if missile and not bWorldLookMode then
		centerMode = self.centerModes.MISSILE
		
	elseif drone and not bWorldLookMode then
		centerMode = self.centerModes.DRONE
		
	elseif clone and not bWorldLookMode then
		centerMode = self.centerModes.CLONE
		
	elseif swarm and not bWorldLookMode then
		centerMode = self.centerModes.SWARM
		
	elseif myShip then
		centerMode = self.centerModes.SHIP
	end


	local myPos_world = l_vec3_temp
	local myShipPos = l_vec3_temp2

	if myShip then
		myShipPos.x, myShipPos.y, myShipPos.z = _G.GetEntityChestPos3( myShip )
	else
		myShipPos.x, myShipPos.y, myShipPos.z = 0, 0, 0
	end

	if centerMode == self.centerModes.MISSILE then
		myPos_world.x, myPos_world.y, myPos_world.z = _G.GetEntityChestPos3( missile )
		
	elseif centerMode == self.centerModes.DRONE then
		myPos_world.x, myPos_world.y, myPos_world.z = _G.GetEntityChestPos3( drone )
		
	elseif centerMode == self.centerModes.CLONE then
		myPos_world.x, myPos_world.y, myPos_world.z = _G.GetEntityChestPos3( clone )
		
	elseif centerMode == self.centerModes.SWARM then
		myPos_world.x, myPos_world.y, myPos_world.z = _G.GetEntityChestPos3( swarm )

	elseif centerMode == self.centerModes.SHIP then
		myPos_world = myShipPos

	else
		myPos_world.x, myPos_world.y, myPos_world.z =_G.GetCameraPos3()
	end


	local fireRange = 0

	if centerMode == self.centerModes.MISSILE then
		fireRange = missile:GetDistanceLeft()
		
	elseif centerMode == self.centerModes.DRONE then
		fireRange = drone:GetFireRange()
		
	elseif centerMode == self.centerModes.CLONE then
		fireRange = myShip:GetFireRange()	-- #0088274,комм.(0420704) - состояние "в зоне поражения" считается от основного корабля, а не от клона
		
	elseif centerMode == self.centerModes.SWARM then
		fireRange = swarm:GetFireRange()

	elseif centerMode == self.centerModes.SHIP then
		fireRange = myShip:GetFireRange()
	end

	local lockEnt		= myShip and myShip:GetTargetLockDirect()
	local lockId		= lockEnt and lockEnt:GetId() or -1
	local isLocking		= lockEnt and myShip:GetTargetLockTimer() > 0

	local lockEntAlly	= myShip and myShip:GetTargetLockAlly()
	local lockIdAlly	= lockEntAlly and lockEntAlly:GetId() or -1
	local isLockingAlly	= false

	local screenCenterX_abs = UI.screenWidth * 0.5
	local screenCenterY_abs = UI.screenHeight * 0.5

	local sentinelLeaderId_friend = -1
	local sentinelLeaderId_enemy = -1
	local bSentinelLeaderDead_friend = false
	local bSentinelLeaderDead_enemy = false
	local bLocalIsSentinelLeader = false
	local bomberPlayerMask = 0

	local centerPos_abs_x = UI:XToAbs( self.centerPos.x )
	local centerPos_abs_y = UI:YToAbs( self.centerPos.y )

	if gameplay == ai.Gameplay.SENTINEL then

		sentinelLeaderId_friend, bSentinelLeaderDead_friend = _G.CL_SentinelGetTeamLeader( friendTeam )
		sentinelLeaderId_enemy, bSentinelLeaderDead_enemy = _G.CL_SentinelGetTeamLeader( enemyTeam )

		if sentinelLeaderId_friend == -1 then
			bSentinelLeaderDead_friend = false
		end

		if sentinelLeaderId_enemy == -1 then
			bSentinelLeaderDead_enemy = false
		end

		bLocalIsSentinelLeader = sentinelLeaderId_friend == localPlayerId	

	elseif gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then
		bomberPlayerMask = _G.CL_BombTheBaseGetCarrier() 

	elseif gameplay == ai.Gameplay.CLANSHIP then
		bomberPlayerMask = _G.CL_ClanShipGetBombCarriers() 
	end  


	local halfScreenWidth_abs	= UI.screenWidth * 0.5
	local halfScreenHeight_abs	= UI.screenHeight * 0.5

	local aimX_abs = 0
	local aimY_abs = 0

	if bWorldLookMode then
		
		aimX_abs = UI:XToAbs( UI:GetMouseX() )
		aimY_abs = UI:YToAbs( UI:GetMouseY() )

	-- TODO: функция возвращает не для спектатора, а именно для локального игрока
	elseif controlMode == UI.ShipControlModes.FOLLOWING or controlMode == UI.ShipControlModes.ROCKET or controlMode == UI.ShipControlModes.COMBINED then

    	local aimX, aimY = _G.CL_GetLocalPlayerControllerMouseState()

    	aimX_abs = halfScreenWidth_abs + aimX * halfScreenWidth_abs
    	aimY_abs = halfScreenHeight_abs - aimY * halfScreenHeight_abs

	else

		aimX_abs = halfScreenWidth_abs
		aimY_abs = halfScreenHeight_abs

	end

   	local mouseRadiusSq_abs = self.mouseRadius_abs * self.mouseRadius_abs

	local bDisableLock = myShip ~= nil and myShip:CheckAura( ai.Aura.DISABLE_LOCK )

	if self.shipEntId ~= oldShipEntId then

    	self.bEnableFriendlyFire = false
		self.weaknessRadius = 0

    	if myShip then

    		local weaponEnt = myShip:GetModule( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
    		if weaponEnt then

    			local weaponDefName = weaponEnt:GetDefName()
    			local weaponDef = UI:GetDef( weaponDefName )

    			if weaponDef then
    				self.bEnableFriendlyFire = weaponDef.friendly_fire == true
    			end

    		end

			self.weaknessRadius = UI:GetShipWeaknessAreaRadius( myShip:GetDefName() )

    	end		

	end

	local curTime = _G.TimerGetGameTime()
	local markMyShip = nil

    l_data.myShip						= myShip
    l_data.markMyShip					= markMyShip
    l_data.curTime						= curTime
    l_data.bWorldLookMode				= bWorldLookMode
    l_data.mouseRadiusSq_abs			= mouseRadiusSq_abs
	l_data.centerPos_abs_x				= centerPos_abs_x
	l_data.centerPos_abs_y				= centerPos_abs_y
	l_data.aimX_abs						= aimX_abs
	l_data.aimY_abs						= aimY_abs
	l_data.lockId						= lockId
	l_data.isLocking					= isLocking
	l_data.lockIdAlly					= lockIdAlly
	l_data.isLockingAlly				= isLockingAlly
	l_data.centerMode					= centerMode
	l_data.fireRange					= fireRange
	l_data.sentinelLeaderId_friend		= sentinelLeaderId_friend
	l_data.sentinelLeaderId_enemy		= sentinelLeaderId_enemy
	l_data.bSentinelLeaderDead_friend	= bSentinelLeaderDead_friend
	l_data.bSentinelLeaderDead_enemy	= bSentinelLeaderDead_enemy
	l_data.bLocalIsSentinelLeader		= bLocalIsSentinelLeader
	l_data.bomberPlayerMask				= bomberPlayerMask
	l_data.gameplay						= gameplay
	l_data.missile						= missile
	l_data.drone						= drone
	l_data.clone						= clone
	l_data.swarm						= swarm
	l_data.bDisableLock					= bDisableLock
	l_data.myShipPos					= myShipPos

	local marks		= self.marksByPass[ self.pass ].marks
	local numMarks	= self.marksByPass[ self.pass ].numMarks
	
	for idx = 1, numMarks do

		local mark = marks[ idx ]
		local entId = mark.entId

		if not _G.IsEntIdValid( entId ) then
			mark.ent = nil
		end

		local ent = mark.ent

		local bDead = ent == nil or ent:IsDead() or mark.bNeedRemove	-- если IsDead() то может еще ожить
		local bNeedRemove = ent == nil or mark.bNeedRemove

		if bNeedRemove and mark.lastDamageRecordIdx == -1 then
			table.insert( l_marksToDelete, entId )

		else

    		mark.bDead = bDead

			-- #0068868 - объект может поменять playerId (например, SpyBeacon может быть перехвачен с помощью HackSystems)
			-- Внимание! Локализованное имя не проапдейтится. Если понадобится менять имя, то это надо делать ниже, где устанавливается поле bNameChanged

			local oldPlayerId = mark.playerId
			mark.playerId = mark.ent and mark.ent:GetPlayerIdx() or mark.playerId

			if mark.playerId ~= oldPlayerId then

				mark.bMySquad = false

				local mySqid = _G.CL_GetPlayerSquad( localPlayerId )
				if mySqid ~= UI.INVALID_U64_ID then

					local playerSqid = mark.playerId ~= -1 and _G.CL_GetPlayerSquad( mark.playerId ) or -1
					mark.bMySquad = playerSqid == mySqid

				end

			end

			local isVisible = self.visibleMarks[ entId ] ~= nil
			local bMyShip = ent and ent == myShip

			local relationshipGroup	= mark.data.relationshipGroup or -1
			local relationship		= mark.data.relationship or ai.RelatioshipType.NEUTRAL

			relationshipGroup		= ent and ent:GetRelationshipGroup() or relationshipGroup
			relationship			= ent and ai.Relationship:GetRelationship( relationshipGroup, myRelationshipGroup ) or relationship                               

			local bSecondEnemy = false
			if gameplay == ai.Gameplay.THREE_TEAMS_DM and relationship == UI.gameObjColorSchemes.ENEMY then
				--bSecondEnemy = relationshipGroup ~= threeTeamsFirstEnemyTeam
				bSecondEnemy = UI:IsThreeTeamsDMSecondEnemy( friendTeam, relationshipGroup )
			end

			mark.bEventAgent = mark.ent ~= nil and mark.ent.IsEventAgentForLocalPlayer ~= nil and mark.ent:IsEventAgentForLocalPlayer()
			
			local bCloseDistanceMode = false
			if gameplay == ai.Gameplay.CLOSE_DISTANCE then
				bCloseDistanceMode = true
			end

			local bIsShipBombCarrier = mark.objType == self.objTypes.PLAYER and mark.bIsShip and mark.playerId ~= -1
				and UI:BitTst( bomberPlayerMask, mark.playerId ) and mark.ent and mark.ent == _G.CL_GetPlayerShip( mark.playerId )

			l_markData.bInsideScreen					= false
			l_markData.screenPos_abs_x					= 0
			l_markData.screenPos_abs_y					= 0
			l_markData.screenPos_abs_z					= 0
			l_markData.objDist_abs						= 0
			l_markData.dirNorm_abs_x					= 0
			l_markData.dirNorm_abs_y					= 0
			l_markData.angle							= 0
			l_markData.arrowsAreaDist_abs				= 0
			l_markData.arrowsAreaAlphaNearDeltaDist_abs	= 0
			l_markData.arrowsAreaAlphaFarDeltaDist_abs	= 0
			l_markData.isVisible						= isVisible
			l_markData.bNeedWnd							= false
			l_markData.bNeedOnCircleWnd					= false
			l_markData.bMyShip							= bMyShip
			l_markData.dist_world						= -1	-- расстояние от объекта, которым игрок управляет (дрона, ракеты, клона и т.п.)
			l_markData.fireDist_world					= -1	-- расстояние от той точки, откуда отсчитывается зона поражения (для режима клона это основной корабль - #0088274,комм.(0420704), для остальных режимов совпадает с dist_world)
			l_markData.relationship						= relationship
			l_markData.relationshipGroup				= relationshipGroup
			l_markData.secondEnemy						= bSecondEnemy
			l_markData.bVisibleByLeaderOnly				= false
			l_markData.bCloseDistanceMode				= bCloseDistanceMode
			l_markData.bIsShipBombCarrier				= bIsShipBombCarrier

			-- виден ли объект по логике?
			local bNeedVisible, bVisibleByLeaderOnly = self.fnNeedMarkVisible[ mark.objType ]( self, mark, l_data, l_markData )
			l_markData.bVisibleByLeaderOnly = bVisibleByLeaderOnly

			-- предназначенная для скрытия марка может быть видима некоторое время, пока проигрывается анимация скрытия

			local bNeedHideAnim	= not bNeedVisible and isVisible and not bMyShip and ent ~= drone
			local bIsHideAnim	= mark.hideAnimTime ~= -1

			dummy =
				bNeedHideAnim
					and
					(
						not bIsHideAnim
							and self:StartMarkHideAnim( mark, curTime )
							or self:UpdateMarkHideAnim( mark, curTime )
					)
					or
					(
						bIsHideAnim
							and self:StopMarkHideAnim( mark )
					)

			bNeedVisible = bNeedVisible or ( mark.hideAnimTime ~= -1 and mark.hideAnimTime < self.MARK_HIDE_TIME )

			dummy =
				( not bDead and mark.hideAnimTime == -1 )
					and UI:Vec3Set( mark.lastEntPos, _G.GetEntityChestPos3( mark.ent ) )

			-- нужно ли отображать обычную марку?

			l_markData.dist_world =				
				( bNeedVisible and centerMode ~= self.centerModes.CAMERA )
					and UI:VLength3( mark.lastEntPos.x - myPos_world.x, mark.lastEntPos.y - myPos_world.y, mark.lastEntPos.z - myPos_world.z )
					or l_markData.dist_world
					
			l_markData.fireDist_world =
				( bNeedVisible and centerMode == self.centerModes.CLONE )
					and UI:VLength3( mark.lastEntPos.x - myShipPos.x, mark.lastEntPos.y - myShipPos.y, mark.lastEntPos.z - myShipPos.z )
					or l_markData.dist_world

			l_markData.bNeedWnd = bNeedVisible and self:NeedMarkWndByPos( mark, l_data, l_markData )

			dummy =
				l_markData.bNeedWnd
					and self:CheckIsUnderMouseCandidate( mark, l_markData.screenPos_abs_x, l_markData.screenPos_abs_y, l_data.aimX_abs, l_data.aimY_abs, l_data.mouseRadiusSq_abs )

			local bLock = entId == lockId or entId == lockIdAlly

			local bHideAsMinor =
				l_markData.bNeedWnd
				and mark.visibilityType == UI.HudObjectsMarksWnd.visibilityTypes.MINOR
				and ( l_markData.dist_world == -1 or l_markData.dist_world > UI.HudObjectsMarksWnd.MINOR_OBJECTS_DIST )
				-- and mark.quests[ 1 ] == nil
				and ( mark.quests[ 1 ] == nil and mark.adventures[ 1 ] == nil )
				and not bLock
				and mark.lastDamageRecordIdx == -1
				and not self.bMarksFullBindOn
				and not mark.data.bUnderMouseCandidate

			l_markData.bNeedWnd = l_markData.bNeedWnd and not bHideAsMinor
			
			l_markData.bNeedWnd = l_markData.bNeedWnd and self.objType2WndType[ mark.objType ].regular ~= -1


			-- нужно ли отображать марку на круге?

			l_markData.bNeedOnCircleWnd =
				bNeedVisible
				and not self.bOculus
				and not bWorldLookMode
				and not bDead 
				and self:NeedMarkOnCircleWndByOption( mark, gameplay, relationship, bLock, entId, sentinelLeaderId_friend, sentinelLeaderId_enemy, bIsShipBombCarrier )
				and self:NeedMarkOnCircleWndByPos( mark, l_data, l_markData )
				
			l_markData.bNeedOnCircleWnd = l_markData.bNeedOnCircleWnd and self.objType2WndType[ mark.objType ].onCircle ~= -1

			bNeedVisible = bNeedVisible and ( l_markData.bNeedWnd or l_markData.bNeedOnCircleWnd )

			dummy =
				( not bNeedVisible and isVisible )
					and self:HideMark( mark )

			dummy =
				bNeedVisible
					and self:UpdateMarkVisibleFitPass( mark, l_data, l_markData )

		end

	end


	for idx = 1, self.numVisibleMarks do

		local mark = self.visibleMarksArr[ idx ]

		dummy =
			mark.pass ~= self.pass
				and self:UpdateMarkVisibleNonFitPass( mark, l_data )

	end

	for idx, entId in ipairs( l_marksToDelete ) do
		self:DeleteMarkForEntity( entId )
		l_marksToDelete[ idx ] = nil
	end
	

	self.markUnderMouse = nil
	local bUnderMouseCompareLess = bWorldLookMode
	local underMouseBestVal = bUnderMouseCompareLess and math.huge or 0

	for idx = 1, self.numVisibleMarks do

		local mark = self.visibleMarksArr[ idx ]		
		
		if mark.wnd and mark.data.bUnderMouseCandidate then
		
			local bIsBest = false
			
			if bUnderMouseCompareLess then
				bIsBest = mark.data.underMouseCompareVal < underMouseBestVal
			else
				bIsBest = mark.data.underMouseCompareVal > underMouseBestVal
			end
			
			if bIsBest then
				underMouseBestVal = mark.data.underMouseCompareVal
				self.markUnderMouse = mark
			end

		end

	end


	dummy =
		self.markUnderMouse
			and self:UpdateMarkPrediction( self.markUnderMouse, l_data )

	self.lastMarkWithPredictionUnderMouse = ( self.markUnderMouse and self.markUnderMouse.predictionWnd ) and self.markUnderMouse or self.lastMarkWithPredictionUnderMouse

	local bNeedResetLastPrediction = self.lastMarkWithPredictionUnderMouse and not self.lastMarkWithPredictionUnderMouse.predictionWnd	
	self.lastMarkWithPredictionUnderMouse = not bNeedResetLastPrediction and self.lastMarkWithPredictionUnderMouse or nil

	for idx = 1, self.numVisibleMarks do

		local mark = self.visibleMarksArr[ idx ]

		dummy =
			( mark.wnd and mark.pass == self.pass )
				and mark.wnd:Update()

		dummy =
			( mark.onCircleWnd and mark.pass == self.pass )
				and mark.onCircleWnd:Update()

		dummy =
			( mark.onCircleWnd and mark.pass ~= self.pass and mark.onCircleWnd.UpdateOnMissedPass )
				and mark.onCircleWnd:UpdateOnMissedPass()

		dummy =
			( mark.pass == self.pass and mark ~= self.markUnderMouse )
				and self:UpdateMarkPrediction( mark, l_data )

	end

	self.bLockOnCircleAnimation = false

	self.pass = self.pass % self.numPasses + 1
	
	
	-- сортировка для отрисовки (в зависимости от расстояния)
	-- (маркеры на круге не сортируются, они все вместе рисуются выше маркеров-рамок)
	
	table.sort( self.sortedWnds, l_SortFunctionContainer:GetSortFunc() )
	
	for idx, wnd in ipairs( self.sortedWnds ) do
		if wnd.mark then
			wnd.mark.sortIdx = idx
		end
		UI.HudObjectsMarks_MarksWnd:MoveChildToFirstPosition( wnd )
	end

	dummy =
		( markMyShip and markMyShip.wnd )
			and UI.HudObjectsMarks_MarksWnd:MoveChildToLastPosition( markMyShip.wnd )

	dummy =
		( self.markUnderMouse and self.markUnderMouse.wnd and bWorldLookMode )
			and UI.HudObjectsMarks_MarksWnd:MoveChildToLastPosition( self.markUnderMouse.wnd )

end


--
function UI.HudObjectsMarksWnd:UpdateMarkVisibleFitPass( mark, data, markData )

	dummy =
		not markData.isVisible
			and self:ShowMark( mark ) 

	mark.data.bFirstUpdate			= false
	mark.data.bFirstUpdateOnCircle	= false

	dummy =
		( markData.bNeedWnd and not mark.wnd )
			and self:AddMarkWnd( mark, self.objType2WndType[ mark.objType ].regular )

	dummy =
		( not markData.bNeedWnd and mark.wnd )
			and self:ReleaseMarkWnd( mark )

	dummy =
		( markData.bNeedOnCircleWnd and not mark.onCircleWnd )
			and self:AddMarkOnCircleWnd( mark, self.objType2WndType[ mark.objType ].onCircle )

	dummy =
		( not markData.bNeedOnCircleWnd and mark.onCircleWnd )
			and self:ReleaseMarkOnCircleWnd( mark )


	data.markMyShip = data.bMyShip and mark or data.markMyShip


	dummy =
		mark.lastDamageRecordIdx ~= -1
			and self:UpdateDamageRecords( mark, data.curTime )


	-- (при приближении к границе экрана марка моего корабля не пропадает, а продолжает рисоваться на границе)
	local bNeedClampCoord = data.bWorldLookMode and not self.bOculus

	dummy =
		mark.wnd
			and mark.wnd:SetPos(
				( bNeedClampCoord and UI:Clamp( markData.screenPos_abs_x, self.nearBorderRadiusVp_abs, UI.screenWidth - self.nearBorderRadiusVp_abs ) or markData.screenPos_abs_x ) * UI.abs2Rel_x - mark.wnd.center.x,
				( bNeedClampCoord and UI:Clamp( markData.screenPos_abs_y, self.nearBorderRadiusVp_abs, UI.screenHeight - self.nearBorderRadiusVp_abs ) or markData.screenPos_abs_y ) * UI.abs2Rel_y - mark.wnd.center.y
			)

	dummy =
		mark.onCircleWnd
			and mark.onCircleWnd:SetPos(
				( data.centerPos_abs_x + markData.dirNorm_abs_x * markData.arrowsAreaDist_abs ) * UI.abs2Rel_x - mark.onCircleWnd.center.x,
				( data.centerPos_abs_y + markData.dirNorm_abs_y * markData.arrowsAreaDist_abs ) * UI.abs2Rel_y - mark.onCircleWnd.center.y
			)


	-- получение всяких разных параметров, необходимых маркам					

	local isInFireRange	= data.centerMode ~= self.centerModes.CAMERA and self.fnIsMarkInFireRange[ mark.objType ]( self, mark, data, markData )
	local rotAngle		= mark.onCircleWnd and ( -markData.angle + math.pi * 0.5 ) or 0

	local bOldLeader		= mark.data.bLeader == true
	local bOldBomber		= mark.data.bBomber == true
	local bOldAggressor		= mark.data.bAggressor == true
	local bOldCriminal		= mark.data.bCriminal == true
	local bOldCivilian		= mark.data.bCivilian == true
	local bOldEventAgent	= mark.bEventAgent == true

	mark.data.relationship			= markData.relationship
	mark.data.relationshipGroup		= markData.relationshipGroup
	mark.data.secondEnemy			= markData.secondEnemy
	mark.data.dist					= markData.dist_world
	mark.data.fireDist				= markData.fireDist_world
	mark.data.isInFireRange			= isInFireRange
	mark.data.isLock				= data.lockId == mark.entId or data.lockIdAlly == mark.entId
	mark.data.isLocking				= ( data.lockId == mark.entId and data.isLocking ) or ( data.lockIdAlly == mark.entId and data.isLockingAlly )
	mark.data.angle					= rotAngle
	mark.data.bMyShip				= markData.bMyShip
	mark.data.bVisibleByLeaderOnly	= markData.bVisibleByLeaderOnly
	mark.data.bLeader				= false
	mark.data.bBomber				= markData.bIsShipBombCarrier
	mark.data.bAggressor			= false
	mark.data.bCriminal				= false
	mark.data.bCivilian				= false
	mark.data.bNameChanged			= false
	mark.data.fireRange				= data.fireRange
	mark.data.bBehindObstacle		= false
	mark.data.bCloseDistanceMode	= markData.bCloseDistanceMode
	mark.onCircleAlpha				= 1

	-- если марка только на ободе, и нет марки регулярной, то прямая видимость не считается, потому что не используется
	-- #0034269, комм.(0120672) - для маяков не нужно
	-- из камеры сейчас видимость не считается	
	if mark.wnd and mark.ent and not mark.bVp and not mark.bPreview then
	
		if data.centerMode == self.centerModes.SHIP then
			mark.data.bBehindObstacle = mark.ent ~= data.myShip and not data.myShip:IsDirectTraceVision( mark.ent )

		elseif data.centerMode == self.centerModes.MISSILE then 
			mark.data.bBehindObstacle = mark.ent ~= data.missile and not data.missile:IsDirectTraceVision( mark.ent )
			
		elseif data.centerMode == self.centerModes.DRONE then 
			mark.data.bBehindObstacle = mark.ent ~= data.drone and not data.drone:IsDirectTraceVision( mark.ent )
			
		elseif data.centerMode == self.centerModes.CLONE then 
			mark.data.bBehindObstacle = mark.ent ~= data.clone and not data.clone:IsDirectTraceVision( mark.ent )
			
		elseif data.centerMode == self.centerModes.SWARM then 
			mark.data.bBehindObstacle = mark.ent ~= data.swarm and not data.swarm:IsDirectTraceVision( mark.ent )
		end
		
	end

	dummy =
		mark.playerId ~= -1
			and self:FillMarkPlayerData( mark, data )

	local oldColorScheme = mark.data.colorScheme
	mark.data.colorScheme = UI:GetGameObjColorSchemeInternal( mark.data.relationship, mark.data.relationshipGroup, mark.data.secondEnemy, data.gameplay, mark.bMySquad, mark.data.bAggressor, mark.data.bCriminal, mark.data.bCivilian, mark.playerId )
	mark.data.bAlly = mark.data.colorScheme == UI.gameObjColorSchemes.FRIEND or mark.data.colorScheme == UI.gameObjColorSchemes.SQUAD or mark.data.colorScheme == UI.gameObjColorSchemes.ME

	mark.data.bColorSchemeChanged = mark.data.colorScheme ~= oldColorScheme

	-- апдейт анимации появления/скрытия на круге
	mark.onCircleAlpha = ( markData.bInsideScreen and mark.onCircleWnd ) and UI:Clamp( ( markData.objDist_abs - ( markData.arrowsAreaDist_abs + markData.arrowsAreaAlphaNearDeltaDist_abs ) ) / ( ( markData.arrowsAreaDist_abs + markData.arrowsAreaAlphaFarDeltaDist_abs ) - ( markData.arrowsAreaDist_abs + markData.arrowsAreaAlphaNearDeltaDist_abs ) ), 0, 1 ) or mark.onCircleAlpha

	-- если у моего корабля прописан weakness_area_radius и противник находится в пределах этого радиуса

	local bOldInWeaknessRadius = mark.data.bInWeaknessRadius

	mark.data.bInWeaknessRadius =
		self.weaknessRadius > 0
		and mark.objType == self.objTypes.PLAYER	-- показывается только для игроков (и замещающих их ботов)
		and mark.data.relationship == ai.RelatioshipType.ENEMY
		and UI:VLengthSq( UI:Vec3Sub( data.myShipPos, mark.lastEntPos ) ) < self.weaknessRadius * self.weaknessRadius

	mark.data.bNameChanged =
		bOldEventAgent ~= mark.bEventAgent
		or
		(
			mark.objType == self.objTypes.PLAYER
			and
			(
            	bOldLeader ~= mark.data.bLeader
            	or bOldBomber ~= mark.data.bBomber
            	or bOldAggressor ~= mark.data.bAggressor
            	or bOldCriminal ~= mark.data.bCriminal
            	or bOldCivilian ~= mark.data.bCivilian
			)
		)
		or bOldInWeaknessRadius ~= mark.data.bInWeaknessRadius
end


--
function UI.HudObjectsMarksWnd:UpdateMarkVisibleNonFitPass( mark, data )

	local entId = mark.entId

	if not _G.IsEntIdValid( entId ) then
		mark.ent = nil
	end

	local ent = mark.ent

	local bDead = ent == nil or ent:IsDead() or mark.bNeedRemove	-- если IsDead() то может еще ожить
	local bNeedRemove = ent == nil or mark.bNeedRemove

	if bNeedRemove and mark.lastDamageRecordIdx == -1 then
		table.insert( l_marksToDelete, entId )

	else

		mark.bDead = bDead

		local bMyShip = ent and ent == data.myShip
		data.markMyShip = bMyShip and mark or data.markMyShip

		dummy =
			mark.lastDamageRecordIdx ~= -1
				and self:UpdateDamageRecords( mark, data.curTime )

		-- позиция и угол поворота - апдейтятся независимо от прохода,
		-- остальное (в том числе видимость) - только если номер прохода марки соответствует текущему проходу

		dummy =
			( not bDead and mark.hideAnimTime == -1 )
				and UI:Vec3Set( mark.lastEntPos, _G.GetEntityChestPos3( mark.ent ) )

		dummy =
			mark.wnd
				and self:UpdateMarkVisibleNonFitPass_UpdateWnd( mark, data )

		dummy =
			mark.onCircleWnd
				and self:UpdateMarkVisibleNonFitPass_UpdateOnCircleWnd( mark, data )

	end

end


--
function UI.HudObjectsMarksWnd:UpdateMarkVisibleNonFitPass_UpdateWnd( mark, data )

	local screenPos_abs_x, screenPos_abs_y, screenPos_abs_z = _G.ProjectPointToScreen( mark.lastEntPos )

	-- при приближении к границе экрана марка моего корабля не пропадает, а продолжает рисоваться на границе
	if data.bWorldLookMode and not self.bOculus then

		local nearBorderRadius_abs = self.nearBorderRadiusVp_abs
		screenPos_abs_x = UI:Clamp( screenPos_abs_x, nearBorderRadius_abs, UI.screenWidth - nearBorderRadius_abs )
		screenPos_abs_y = UI:Clamp( screenPos_abs_y, nearBorderRadius_abs, UI.screenHeight - nearBorderRadius_abs )

	end

	mark.wnd:SetPos( screenPos_abs_x * UI.abs2Rel_x - mark.wnd.center.x, screenPos_abs_y * UI.abs2Rel_y - mark.wnd.center.y )


	-- в радиусе действия мыши?
	self:CheckIsUnderMouseCandidate( mark, screenPos_abs_x, screenPos_abs_y, data.aimX_abs, data.aimY_abs, data.mouseRadiusSq_abs )
	
end


--
function UI.HudObjectsMarksWnd:UpdateMarkVisibleNonFitPass_UpdateOnCircleWnd( mark, data )

	local dirNorm_abs_x, dirNorm_abs_y	= _G.GetDirToPoint2d( mark.lastEntPos )
	local angle							= math.atan2( -dirNorm_abs_y, dirNorm_abs_x )

	local arrowsAreaPos_abs_x			= 0
	local arrowsAreaPos_abs_y			= 0

	if self.arrowsAreaType == UI.hudArrowsAreaTypes.CIRCLE then

		arrowsAreaPos_abs_x, arrowsAreaPos_abs_y = data.centerPos_abs_x + dirNorm_abs_x * self.circleDrawRadiusVp_abs, data.centerPos_abs_y + dirNorm_abs_y * self.circleDrawRadiusVp_abs

	elseif self.arrowsAreaType == UI.hudArrowsAreaTypes.MOUSE_RADIUS then

		local areaPos_abs_x, areaPos_abs_y = self:GetOnMouseRadiusPos( angle )
		arrowsAreaPos_abs_x, arrowsAreaPos_abs_y = areaPos_abs_x + data.centerPos_abs_x, areaPos_abs_y + data.centerPos_abs_y

	elseif self.arrowsAreaType == UI.hudArrowsAreaTypes.SCREEN_RECT then
		
		local nearBorderRadius_abs = mark.bVp and self.nearBorderRadiusVp_abs or ( ( data.lockId == mark.entId or data.lockIdAlly == mark.entId ) and self.nearBorderRadiusShipLock_abs or self.nearBorderRadiusShip_abs )
		local areaPos_abs_x, areaPos_abs_y = self:GetOnScreenRectPos( angle, nearBorderRadius_abs )
		arrowsAreaPos_abs_x, arrowsAreaPos_abs_y = areaPos_abs_x + data.centerPos_abs_x, areaPos_abs_y + data.centerPos_abs_y

	end

	mark.onCircleWnd:SetPos( arrowsAreaPos_abs_x * UI.abs2Rel_x - mark.onCircleWnd.center.x, arrowsAreaPos_abs_y * UI.abs2Rel_y - mark.onCircleWnd.center.y )

	-- угол поворота
	-- начальное положение эффекта 90 градусов против часовой стрелки

    mark.data.angle = -angle + math.pi * 0.5

end


--
function UI.HudObjectsMarksWnd:StartMarkHideAnim( mark, curTime )

	mark.hideAnimTime = 0
	mark.hideAnimStartTime = curTime

	return true	-- необходимо в вызывающей функции в конструкции <bool> and <> or <>

end


--
function UI.HudObjectsMarksWnd:UpdateMarkHideAnim( mark, curTime )

	mark.hideAnimTime = curTime - mark.hideAnimStartTime
	mark.hideAnimTime = math.min( mark.hideAnimTime, self.MARK_HIDE_TIME )

	return true	-- необходимо в вызывающей функции в конструкции <bool> and <> or <>

end


--
function UI.HudObjectsMarksWnd:StopMarkHideAnim( mark )

	mark.hideAnimTime = -1

end


--
function UI.HudObjectsMarksWnd:AddMarkWnd( mark, wndType )

	self:ReleaseWnd( mark.wnd )
	mark.wnd = self:AddWndOfType( wndType, true )
	mark.wnd:Setup( mark )
	mark.data.bFirstUpdate = true
	

end


--
function UI.HudObjectsMarksWnd:ReleaseMarkWnd( mark )

	self:ReleaseWnd( mark.wnd )
	mark.wnd = nil

end


--
function UI.HudObjectsMarksWnd:AddMarkOnCircleWnd( mark, wndTypeOnCircle )

	self:ReleaseWnd( mark.onCircleWnd )
	mark.onCircleWnd = self:AddWndOfType( wndTypeOnCircle, false )
	mark.onCircleWnd:Setup( mark )
	mark.data.bFirstUpdateOnCircle = true

end


--
function UI.HudObjectsMarksWnd:ReleaseMarkOnCircleWnd( mark )

	self:ReleaseWnd( mark.onCircleWnd )
	mark.onCircleWnd = nil

end


--
function UI.HudObjectsMarksWnd:FillMarkPlayerData( mark, data )

	mark.data.bLeader	= ( mark.playerId == data.sentinelLeaderId_friend or mark.playerId == data.sentinelLeaderId_enemy )

	if data.gameplay == ai.Gameplay.FREE_SPACE then
		mark.data.bAggressor, mark.data.bCriminal, mark.data.bCivilian = _G.CL_GetFreeSpacePlayerFlags( mark.playerId )
	end

end


--
function UI.HudObjectsMarksWnd:IsMarkInFireRange_byFireRange( mark, data, markData )

	return data.fireRange >= markData.fireDist_world

end


--
function UI.HudObjectsMarksWnd:IsMarkInFireRange_byInteractionDist( mark, data, markData )

	local cf = 1
	
	-- некоторые корабли могут подбирать лут на расстоянии, отличном от стандартного, для этого в корабле прописан loot_radius_coef (#0059232)

	if	( mark.bIsLootCrate or mark.bIsQuestObject )														-- коэффициент действует только на классы LootCrate, PersonalLootCrate и QuestObject, def.hudType="loot_crate", и, следовательно, mark.objType=objTypes.LOOT - не замена, т.к. в cpp коде проверяется именно класс
		and ( data.centerMode == self.centerModes.SHIP or data.centerMode == self.centerModes.CLONE )then	-- #0088274,комм.(0420704) - в режиме клона расстояние отсчитывается от основного корабля
			cf = data.myShip:GetLootRadiusCoef()
	end

	return mark.interactionDist * cf >= markData.fireDist_world

end


--
function UI.HudObjectsMarksWnd:IsMarkInFireRange_VITAL_POINT( mark, data, markData )

	return data.centerMode == self.centerModes.SHIP and mark.ent ~= nil and _G.CL_GetVitalPointDecayDistance( mark.ent ) >= markData.fireDist_world

end


--
function UI.HudObjectsMarksWnd:IsMarkInFireRange_JUMP_GATE( mark, data, markData )

	return false

end


--
function UI.HudObjectsMarksWnd:NeedMarkWndByPos( mark, data, markData )

	markData.screenPos_abs_x, markData.screenPos_abs_y, markData.screenPos_abs_z = _G.ProjectPointToScreen( mark.lastEntPos )

	markData.bInsideScreen = true

	if not self.bOculus then
		markData.bInsideScreen =
			markData.screenPos_abs_z > 0
			and markData.screenPos_abs_x >= -self.nearBorderGuard_abs
			and markData.screenPos_abs_x <= UI.screenWidth + self.nearBorderGuard_abs
			and markData.screenPos_abs_y >= -self.nearBorderGuard_abs
			and markData.screenPos_abs_y <= UI.screenHeight + self.nearBorderGuard_abs
	end

	return markData.bInsideScreen or data.bWorldLookMode

end


--
function UI.HudObjectsMarksWnd:CheckIsUnderMouseCandidate( mark, screenPos_abs_x, screenPos_abs_y, aimX_abs, aimY_abs, mouseRadiusSq_abs )

	-- в режиме тактической карты мышью выделяется маркер по принципу: ближайший (в 2d) к курсору из тех, которые входят в зону действия курсора
	if UI.HudWnd:IsWorldLookMode( UI.HudWnd:GetMode() ) then
	
		local dirX_abs = screenPos_abs_x - aimX_abs
		local dirY_abs = screenPos_abs_y - aimY_abs

		local radiusSq_abs = dirX_abs * dirX_abs + dirY_abs * dirY_abs
		
		mark.data.bUnderMouseCandidate = radiusSq_abs <= mouseRadiusSq_abs
		mark.data.underMouseCompareVal = radiusSq_abs

	-- в режиме боя мышью выделяется маркер по принципу: ближайший (в 3d) к камере из тех, на баундинг-бокс которого попадает курсор (#0104614)
	else
	
		mark.data.bUnderMouseCandidate = false
		
		if mark.ent then
		
			local bUnderMouse, dot = _G.IsEntityUnderCursor( mark.ent, aimX_abs, aimY_abs )
			if bUnderMouse then
			
				mark.data.bUnderMouseCandidate = true
				mark.data.underMouseCompareVal = dot
				
			end
			
		end
	
	end

end


--
function UI.HudObjectsMarksWnd:NeedMarkOnCircleWndByPos( mark, data, markData )

	markData.dirNorm_abs_x, markData.dirNorm_abs_y = _G.GetDirToPoint2d( mark.lastEntPos )
	markData.angle = math.atan2( -markData.dirNorm_abs_y, markData.dirNorm_abs_x )

	markData.arrowsAreaAlphaNearDeltaDist_abs	= mark.bVp and ( self.circleAlphaNearRadiusVp_abs - self.circleDrawRadiusVp_abs ) or ( self.circleAlphaNearRadiusShip_abs - self.circleDrawRadiusShip_abs )
	markData.arrowsAreaAlphaFarDeltaDist_abs	= mark.bVp and ( self.circleAlphaFarRadiusVp_abs - self.circleDrawRadiusVp_abs ) or ( self.circleAlphaFarRadiusShip_abs - self.circleDrawRadiusShip_abs )

	if self.arrowsAreaType == UI.hudArrowsAreaTypes.CIRCLE then

		markData.arrowsAreaDist_abs = self.circleDrawRadiusVp_abs

	elseif self.arrowsAreaType == UI.hudArrowsAreaTypes.MOUSE_RADIUS then

		local areaPos_abs_x, areaPos_abs_y = self:GetOnMouseRadiusPos( markData.angle )
		markData.arrowsAreaDist_abs = UI:V2Length2( areaPos_abs_x, areaPos_abs_y )

	elseif self.arrowsAreaType == UI.hudArrowsAreaTypes.SCREEN_RECT then

		local nearBorderRadius_abs = mark.bVp and self.nearBorderRadiusVp_abs or ( ( data.lockId == mark.entId or data.lockIdAlly == mark.entId ) and self.nearBorderRadiusShipLock_abs or self.nearBorderRadiusShip_abs )
		local areaPos_abs_x, areaPos_abs_y = self:GetOnScreenRectPos( markData.angle, nearBorderRadius_abs )
		markData.arrowsAreaDist_abs = UI:V2Length2( areaPos_abs_x, areaPos_abs_y )

	end

	markData.objDist_abs = markData.bInsideScreen and UI:V2Length2( markData.screenPos_abs_x - data.centerPos_abs_x, markData.screenPos_abs_y - data.centerPos_abs_y ) or 0

	return not markData.bInsideScreen or markData.objDist_abs > markData.arrowsAreaDist_abs + markData.arrowsAreaAlphaNearDeltaDist_abs

end


--
function UI.HudObjectsMarksWnd:NeedPredictionForMark( mark )

	return
		mark.wnd
		and
		(
			mark.data.relationship ~= ai.RelatioshipType.FRIEND
			or self.bEnableFriendlyFire
		)
		and mark.objType ~= self.objTypes.LOOT
		and mark.objType ~= self.objTypes.VITAL_POINT
		and mark.objType ~= self.objTypes.BOMB_SITE
		and mark.objType ~= self.objTypes.CLANSHIP_VITAL_POINT
		and mark.objType ~= self.objTypes.JUMP_GATE
		and not mark.bNoPrediction
		and not mark.data.bCloseDistanceMode
		and
		(
			(
				mark.data.isLock
				and not mark.data.isLocking
			)
			or
			(
				self.showPredictionUnderMouse
				and
				(
					self.bMarksFullBindOn
					or mark == self.markUnderMouse
					or
					(
						mark.predictionWnd
						and mark == self.lastMarkWithPredictionUnderMouse
					)					
				)				
			)
		)

end


--
function UI.HudObjectsMarksWnd:UpdateMarkPrediction( mark, data )

	local bNeedPrediction = not data.bWorldLookMode and UI.HudObjectsMarksWnd:NeedPredictionForMark( mark )

	dummy =
		( bNeedPrediction and not mark.predictionWnd )
			and self:InitMarkPrediction( mark )

	dummy =
		( not bNeedPrediction and mark.predictionWnd )
			and self:ResetMarkPrediction( mark ) 

end


--
function UI.HudObjectsMarksWnd:InitMarkPrediction( mark )

	mark.predictionWnd = self:AddPrediction()
	mark.predictionWnd:SetupForMark( mark )

end


--
function UI.HudObjectsMarksWnd:ResetMarkPrediction( mark )

	self:ReleasePrediction( mark.predictionWnd )
	mark.predictionWnd = nil

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_DEFAULT( mark, data, markData )

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and not data.bDisableLock
		and not( mark.ent ~= nil and mark.ent == data.drone )
		and not( mark.ent ~= nil and mark.ent == data.swarm and data.centerMode == self.centerModes.SWARM )

	local bUseInVision =
		--mark.quests[ 1 ] == nil
		( mark.quests[ 1 ] == nil and mark.adventures[ 1 ] == nil )
		and mark.ent ~= nil

	local visibleInt = bUseInVision and ( _G.CL_IsInVision( mark.ent ) and 1 or 0 ) or 1
	bVisible = bVisible and visibleInt ~= 0

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_PLAYER( mark, data, markData )

	-- проверки на квест нет, т.к. для игроков, в отличие от мобов, не работает правило,
	-- что квестовые должны показываться всегда, даже если невидимы (#0054256,комм.(0218298))

	local bVisibleByLeaderOnly = false

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and not( mark.ent == data.myShip and not data.bWorldLookMode )
		and not( mark.ent ~= nil and mark.ent:IsSpawnWarpActive() )
		and not data.bDisableLock

	if data.gameplay == ai.Gameplay.FREE_SPACE then

		local bUseInVision = mark.ent ~= nil
		local visibleInt = bUseInVision and ( _G.CL_IsInVision( mark.ent ) and 1 or 0 ) or 1
		bVisible = bVisible and visibleInt ~= 0

	elseif data.gameplay == ai.Gameplay.SENTINEL then

		-- вражеский лидер виден всегда
		-- если вражеский лидер мертв, то все враги видны
		-- еслия я - лидер, то видны все враги

		local bUseInVisionByMates =
			markData.relationship == ai.RelatioshipType.ENEMY		-- друзья видны всегда
			and mark.playerId ~= data.sentinelLeaderId_enemy		-- вражеский лидер виден всегда
			and not data.bSentinelLeaderDead_enemy					-- если вражеский лидер мертв, то все враги видны
			and mark.ent ~= nil

		local bUseInVision =
			bUseInVisionByMates
			and not data.bLocalIsSentinelLeader

		local inVisionInt = ( mark.ent ~= nil and _G.CL_IsInVision( mark.ent ) ) and 1 or 0
		local visibleInt = bUseInVision and inVisionInt or 1

		bVisible = bVisible and visibleInt ~= 0
	
		local visibleByMatesInt = bUseInVisionByMates and inVisionInt or 1
		local bVisibleByMates = bVisible and visibleByMatesInt ~= 0

		bVisibleByLeaderOnly = bVisible and data.bLocalIsSentinelLeader and not bVisibleByMates

	elseif data.gameplay == ai.Gameplay.ATDM or data.gameplay == ai.Gameplay.APRIL_CONTROL then

		bVisible = false

	else

		local bUseInVision =
			markData.relationship == ai.RelatioshipType.ENEMY		-- друзья видны всегда
			and mark.ent ~= nil

		local visibleInt = bUseInVision and ( _G.CL_IsInVision( mark.ent ) and 1 or 0 ) or 1
		bVisible = bVisible and visibleInt ~= 0

	end

	return bVisible, bVisibleByLeaderOnly

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_VITAL_POINT( mark, data, markData )

	local bVisible = not( mark.bDead and mark.lastDamageRecordIdx == -1 )

	bVisible =
		bVisible
		and not( mark.ent ~= nil and mark.ent:IsHidden() )	-- #0034457

	-- в геймплее "Царь горы" виден только активный маяк,
	-- во всех остальных видны все маяки всегда

	if data.gameplay == ai.Gameplay.KING_OF_THE_HILL then

		local vpId, nextVpId = _G.CL_KingGetCurrentHill()

    	bVisible =
    		bVisible
			and mark.entId == vpId
	end

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_BOMB( mark, data, markData )

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and not( mark.ent ~= nil and mark.ent:IsHidden() )
		and not( data.gameplay == ai.Gameplay.CLANSHIP and markData.relationship ~= ai.RelatioshipType.FRIEND )

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_BOMB_SITE( mark, data, markData )

	local bVisible = not( mark.bDead and mark.lastDamageRecordIdx == -1 )
	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_TARGET( mark, data, markData )

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and not( mark.ent ~= nil and mark.ent:IsHidden() )

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_MISSILE( mark, data, markData )

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and data.bWorldLookMode

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkVisible_default( mark, data, markData )

	local bVisible =
		not( mark.bDead and mark.lastDamageRecordIdx == -1 )
		and not( mark.ent ~= nil and mark.ent == data.drone )
		and not( mark.ent ~= nil and mark.ent == data.swarm and data.centerMode == self.centerModes.SWARM )

	local bUseInVision =
		--mark.quests[ 1 ] == nil
		( mark.quests[ 1 ] == nil and mark.adventures[ 1 ] == nil )
		and mark.ent ~= nil

	local visibleInt = bUseInVision and ( _G.CL_IsInVision( mark.ent ) and 1 or 0 ) or 1
	bVisible = bVisible and visibleInt ~= 0

	return bVisible, false

end


--
function UI.HudObjectsMarksWnd:NeedMarkOnCircleWndByOption( mark, gameplay, relationship, bLock, entId, sentinelLeaderId_friend, sentinelLeaderId_enemy, bIsShipBombCarrier )

	local onCircleMarksMode = self.onCircleMarksMode
	-- local bMinor = mark.visibilityType == self.visibilityTypes.MINOR and mark.quests[ 1 ] == nil
	local bMinor = mark.visibilityType == self.visibilityTypes.MINOR and ( mark.quests[ 1 ] == nil and mark.adventures[ 1 ] == nil )

	-- #0031338, комм.(0104485) - в туториале все маркеры показываются всегда, не зависимо от опции
	if gameplay == ai.Gameplay.TUTORIAL then
		onCircleMarksMode = UI.hudOnCircleMarksModes.ALL
	end        

	-- показываются все кроме минорных
	if self.onCircleMarksMode == UI.hudOnCircleMarksModes.ALL then

		if bMinor then
			return false
		end

	-- не показываеется ничего
	elseif self.onCircleMarksMode == UI.hudOnCircleMarksModes.NONE then
		return false

	-- не показывются минорные;
	-- не показываются дружеские объекты, в которые можно стрелять (корабли, транспортники и т.п.)
	elseif self.onCircleMarksMode == UI.hudOnCircleMarksModes.NOT_FRIENDLY then

		if bMinor then
			return false
		end

		if relationship == ai.RelatioshipType.FRIEND then

			local bCanBeShootAt = mark.objType == self.objTypes.PLAYER or mark.objType == self.objTypes.DEFAULT
			if bCanBeShootAt then
				return false
			end

		end

	-- показываются марки, внешний вид которых имеет какие-то особенности
	-- (залоченный/залачиваемый объект, базы, бомба, грузовые корабли, корабли босса/капитана/бомбера и т.п.);
	-- минорные показывются только если залоченные
	elseif self.onCircleMarksMode == UI.hudOnCircleMarksModes.SPECIAL then

		if not bLock then

    		if bMinor then
    			return false
    		end

			if mark.objType == self.objTypes.PLAYER then

				local bLeader = mark.playerId == sentinelLeaderId_friend or mark.playerId == sentinelLeaderId_enemy

				if not bLeader and not bIsShipBombCarrier then
					return false
				end

			elseif mark.objType == self.objTypes.MISSILE then
				return false	-- этой марки вообще не может быть на круге никогда, потому что она только на тактической карте рисуется

			elseif mark.objType == self.objTypes.DEFAULT then

				if mark.icoName == "" then
					return false
				end

			end	

		end

	end

	return true

end


--
function UI.HudObjectsMarksWnd:DeleteMarkForEntity( entId )

	local mark = self.marks[ entId ]
	if not mark then
		return
	end

	if mark == self.markUnderMouse then
		self.markUnderMouse = nil
	end

	if mark == self.lastMarkWithPredictionUnderMouse then
		self.lastMarkWithPredictionUnderMouse = nil
	end

	self:ReleaseWnd( mark.wnd )
	self:ReleaseWnd( mark.onCircleWnd )
	self:ReleasePrediction( mark.predictionWnd )

	mark.wnd = nil
	mark.onCircleWnd = nil
	mark.predictionWnd = nil

	self:ResetDamageRecords( mark )

	if self.marksByPass[ mark.pass ] then

		local numMarks = self.marksByPass[ mark.pass ].numMarks
		for idx = 1, numMarks do

			if self.marksByPass[ mark.pass ].marks[ idx ].entId == entId then

				self.marksByPass[ mark.pass ].marks[ idx ] = self.marksByPass[ mark.pass ].marks[ numMarks ]
				self.marksByPass[ mark.pass ].marks[ numMarks ] = nil

				self.marksByPass[ mark.pass ].numMarks = self.marksByPass[ mark.pass ].numMarks - 1

				break

			end

		end

	end	

	self.visibleMarks[ entId ] = nil

	for idx = 1, self.numVisibleMarks do

		local mark = self.visibleMarksArr[ idx ]
		if mark.entId == entId then

			self.visibleMarksArr[ idx ] = self.visibleMarksArr[ self.numVisibleMarks ]
			self.visibleMarksArr[ self.numVisibleMarks ] = nil

			self.numVisibleMarks = self.numVisibleMarks - 1

			break

		end

	end

	self.marks[ entId ] = nil
	self.numMarks = self.numMarks - 1

	self:UpdateNumPasses()
	
	-- удаление кастомного восклицательного знака, т.к., возможно, это больше никто не сделает при смерти объекта;
	-- при этом, если маркера нет, то информация о восклицательном знаке не удалится до окончания уровня ... (TODO - надо что-то сделать с этим);
	-- если энтити все еще жива, то информация о кастомном восклицательном знаке при удалении маркера не удаляется,
	-- чтобы она могла сохраниться, если резетнуть худ и показать заново (при этом будет вызвано удаление всех маркеров)
	if not _G.IsEntIdValid( mark.entId ) then
		self:HideMarkNotify( entId )
	end
	
end


--
function UI.HudObjectsMarksWnd:ResetVisibleMarks()

	for entId, mark in pairs( self.visibleMarks ) do
		self:HideMark( mark )
	end

	self.visibleMarks		= {}	
	self.visibleMarksArr	= {}
	self.numVisibleMarks	= 0

end


--
function UI.HudObjectsMarksWnd:HideMarks( bForce )

	if self.bMarksHidden then
		return
	end

	for entId, mark in pairs( self.visibleMarks ) do
		self:HideMark( mark )
	end

	self.visibleMarks		= {}	
	self.visibleMarksArr	= {}
	self.numVisibleMarks	= 0

	self.bMarksHidden = true
	self.bMarksHiddenForce = bForce

end


--
function UI.HudObjectsMarksWnd:HideMark( mark )

	if not self.visibleMarks[ mark.entId ] then
		return
	end

	if mark == self.markUnderMouse then
		self.markUnderMouse = nil
	end

	if mark == self.lastMarkWithPredictionUnderMouse then
		self.lastMarkWithPredictionUnderMouse = nil
	end

	self:ReleaseWnd( mark.wnd )
	self:ReleaseWnd( mark.onCircleWnd )
	self:ReleasePrediction( mark.predictionWnd )

	mark.wnd = nil
	mark.onCircleWnd = nil
	mark.predictionWnd = nil

	mark.hideAnimTime			= -1
	mark.hideAnimStartTime		= -1
	mark.onCircleAlpha			= 1

	self.visibleMarks[ mark.entId ] = nil

	for idx = 1, self.numVisibleMarks do

		local visibleMark = self.visibleMarksArr[ idx ]
		if visibleMark.entId == mark.entId then

			self.visibleMarksArr[ idx ] = self.visibleMarksArr[ self.numVisibleMarks ]
			self.visibleMarksArr[ self.numVisibleMarks ] = nil

			self.numVisibleMarks = self.numVisibleMarks - 1

			break

		end

	end

end


--
function UI.HudObjectsMarksWnd:ShowMarks()

	if not self.bMarksHidden then
		return
	end

	self.bMarksHidden = false
	self.bMarksHiddenForce = false

end


--
function UI.HudObjectsMarksWnd:ShowMark( mark )

	if self.bMarksHidden then
		return
	end

	if self.visibleMarks[ mark.entId ] then
		return
	end

	self.visibleMarks[ mark.entId ]	= mark	

	table.insert( self.visibleMarksArr, mark )
	self.numVisibleMarks = self.numVisibleMarks + 1

end


--
function UI.HudObjectsMarksWnd:ReleaseWnd( wnd )

	if not wnd then
		return
	end
	
	if wnd.mark then
		wnd.mark.sortIdx = -1
	end

	wnd:UnlinkFromParent()
	wnd:Reset()

	table.insert( self.wndsPool[ wnd.wndType ].wnds, wnd )
	self.wndsPool[ wnd.wndType ].numWnds = self.wndsPool[ wnd.wndType ].numWnds + 1
	
	for idx, sortedWnd in ipairs( self.sortedWnds ) do
	
		if sortedWnd == wnd then
		
			self.sortedWnds[ idx ] = self.sortedWnds[ self.numSortedWnds ]
			self.sortedWnds[ self.numSortedWnds ] = nil
			self.numSortedWnds = self.numSortedWnds - 1
			
			break
			
		end
		
	end

end


--
function UI.HudObjectsMarksWnd:AddWndOfType( wndType, bSorted )

	local wnd = self:GetWndOfType( wndType )
	if wnd then
	
		UI.HudObjectsMarks_MarksWnd:AddChild( wnd )
		
		if bSorted then
			table.insert( self.sortedWnds, wnd )
			self.numSortedWnds = self.numSortedWnds + 1
		end

	end

	return wnd

end


--
function UI.HudObjectsMarksWnd:GetWndOfType( wndType )

	local wndsPool = self.wndsPool[ wndType ]
	if not wndsPool then
		return nil
	end

	local wnd = wndsPool.numWnds > 0 and wndsPool.wnds[ wndsPool.numWnds ] or self:CreateWndOfType( wndType )

	wndsPool.wnds[ wndsPool.numWnds ] = nil
	wndsPool.numWnds = wndsPool.numWnds - 1	

	return wnd

end


--
function UI.HudObjectsMarksWnd:CreateWndOfType( wndType )

	local proto = nil

	if wndType == self.wndTypes.INSIDE_SHIP then
		proto = UI.HudObjectMarkWnd_InsideShip

	elseif wndType == self.wndTypes.INSIDE_VITAL_POINT then
		proto = UI.HudObjectMarkWnd_InsideVp
	
	elseif wndType == self.wndTypes.OUTSIDE_SHIP then
		proto = UI.HudObjectMarkWnd_OutsideShip

	elseif wndType == self.wndTypes.OUTSIDE_VP then
		proto = UI.HudObjectMarkWnd_OutsideVp

	elseif wndType == self.wndTypes.INSIDE_CLANSHIP_VITAL_POINT then
		proto = UI.HudObjectMarkWnd_InsideClanshipVp
	end

	if not proto then
		return nil
	end

	local numWnds = self.totalNumWndsOfType[ wndType ]
	numWnds = numWnds + 1
	self.totalNumWndsOfType[ wndType ] = numWnds

	local wnd = UI:CreateChildWnd( self, proto, tostring( numWnds ) )

	local wndsPool = self.wndsPool[ wndType ]
	table.insert( wndsPool.wnds, wnd )
	wndsPool.numWnds = wndsPool.numWnds + 1

	return wnd

end


--
function UI.HudObjectsMarksWnd:ReleasePrediction( wnd )

	if not wnd then
		return
	end

	wnd:UnlinkFromParent()
	wnd:Reset()	

	table.insert( self.predictionsPool, wnd )

end


--
function UI.HudObjectsMarksWnd:AddPrediction()

	local wnd = self:GetPrediction()
	if wnd then
		UI.HudObjectsMarks_PredictionsWnd:AddChild( wnd )
	end

	return wnd

end


--
function UI.HudObjectsMarksWnd:GetPrediction()

	local idx, wnd = next( self.predictionsPool )

	if not wnd then
		wnd = self:CreatePrediction()
	else
		self.predictionsPool[ idx ] = nil
	end

	return wnd

end


--
function UI.HudObjectsMarksWnd:CreatePrediction()

	self.totalNumPredictions = self.totalNumPredictions + 1
	return UI:CreateChildWnd( self, UI.HudObjectMark_PredictionWnd, tostring( self.totalNumPredictions ) )

end


--
function UI.HudObjectsMarksWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self.bLockOnCircleAnimation = true
	self:ShufflePasses()

	self:InitDamageRecordParams()

	self:UpdateAdaptiveMarksSize()
	self:UpdateOnCircleMarksMode()
	self:UpdateFadeOnDist()
	self:UpdateHideFramesOutOfShot()
	self:UpdateTransparentBehindObstacle()
	self:UpdateArrowsAreaType()
	self:UpdateScalableHealthBars()
	self:UpdateVpHpAlways()
	self:UpdateShowPredictionUnderMouse()
	self:UpdateMarksElements()

end


--
function UI.HudObjectsMarksWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:ResetAllDamageRecords()
	self:ResetVisibleMarks()

end


--
function UI.HudObjectsMarksWnd:UpdateAbsValues()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local circleDrawRadiusVp_rel = mainEffect:GetObjSize( self.effectInfo.main.circleDrawRadiusVpObjName ).x
		self.circleDrawRadiusVp_abs = UI:XToAbs( circleDrawRadiusVp_rel )

		local circleDrawRadiusShip_rel = mainEffect:GetObjSize( self.effectInfo.main.circleDrawRadiusShipObjName ).x
		self.circleDrawRadiusShip_abs = UI:XToAbs( circleDrawRadiusShip_rel )

		local circleAlphaNearRadiusVp_rel = mainEffect:GetObjSize( self.effectInfo.main.circleAlphaNearRadiusVpObjName ).x
		self.circleAlphaNearRadiusVp_abs = UI:XToAbs( circleAlphaNearRadiusVp_rel )

		local circleAlphaNearRadiusShip_rel = mainEffect:GetObjSize( self.effectInfo.main.circleAlphaNearRadiusShipObjName ).x
		self.circleAlphaNearRadiusShip_abs = UI:XToAbs( circleAlphaNearRadiusShip_rel )

		local circleAlphaFarRadiusVp_rel = mainEffect:GetObjSize( self.effectInfo.main.circleAlphaFarRadiusVpObjName ).x
		self.circleAlphaFarRadiusVp_abs = UI:XToAbs( circleAlphaFarRadiusVp_rel )

		local circleAlphaFarRadiusShip_rel = mainEffect:GetObjSize( self.effectInfo.main.circleAlphaFarRadiusShipObjName ).x
		self.circleAlphaFarRadiusShip_abs = UI:XToAbs( circleAlphaFarRadiusShip_rel )

		local nearBorderGuard_rel = 100
		self.nearBorderGuard_abs = UI:YToAbs( nearBorderGuard_rel )

		local mouseRadius_rel = mainEffect:GetObjSize( self.effectInfo.main.mouseRadiusObjName ).y
		self.mouseRadius_abs = UI:YToAbs( mouseRadius_rel )		

		local damageRecordsHeight_rel = mainEffect:GetObjSize( self.effectInfo.main.damageRecordsHeightObjName ).y
		self.damageRecordsHeight_abs = UI:YToAbs( damageRecordsHeight_rel )

		local nearBorderRadiusVp_rel = mainEffect:GetObjSize( self.effectInfo.main.nearBorderRadiusVpObjName ).y
		self.nearBorderRadiusVp_abs = UI:YToAbs( nearBorderRadiusVp_rel )

		local nearBorderRadiusShip_rel = mainEffect:GetObjSize( self.effectInfo.main.nearBorderRadiusShipObjName ).y
		self.nearBorderRadiusShip_abs = UI:YToAbs( nearBorderRadiusShip_rel )

		-- TODO: нужен локатор
		local nearBorderRadiusShipLock_rel = nearBorderRadiusShip_rel +	20
		self.nearBorderRadiusShipLock_abs = UI:YToAbs( nearBorderRadiusShipLock_rel )

	end

	self.damageRecordSpeed_abs = UI:XToAbs( UI:XTo1024x768( self.DAMAGE_RECORD_SPEED, { x = 1280, y = 720 } ) )

	self.mouseTargetRadius_abs = Vec2( cvars.ship_mouseRadiusX * UI.screenWidth * 0.5, cvars.ship_mouseRadiusY * UI.screenHeight * 0.5 )

end


--
function UI.HudObjectsMarksWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:UpdateAbsValues()	

end


--
function UI.HudObjectsMarksWnd:F_OnEventSaveUiState()

	for entId, mark in pairs( self.marks ) do
		mark.wnd = nil
		mark.onCircleWnd = nil
		mark.predictionWnd = nil
	end

	UI.store.HudObjectsMarksWnd =
	{
		marks				= self.marks,
		bMarksHiddenForce	= self.bMarksHiddenForce,
		numMarks			= self.numMarks,
		marksByPass			= self.marksByPass,
		numPasses			= self.numPasses,
		fitQuests			= self.fitQuests,
		customQuestEntities	= self.customQuestEntities,

		fitAdventures		= self.fitAdventures
	}

end


--
function UI.HudObjectsMarksWnd:F_OnEventRestoreUiState()

	if UI.store.HudObjectsMarksWnd then

		self.marks					= UI.store.HudObjectsMarksWnd.marks    
		self.bMarksHiddenForce		= UI.store.HudObjectsMarksWnd.bMarksHiddenForce
		self.numMarks				= UI.store.HudObjectsMarksWnd.numMarks
		self.marksByPass			= UI.store.HudObjectsMarksWnd.marksByPass
		self.numPasses				= UI.store.HudObjectsMarksWnd.numPasses
		self.fitQuests				= UI.store.HudObjectsMarksWnd.fitQuests
		self.customQuestEntities	= UI.store.HudObjectsMarksWnd.customQuestEntities

		self.fitAdventures			= UI.store.HudObjectsMarksWnd.fitAdventures

		UI.store.HudObjectsMarksWnd = nil

	end

end


--
function UI.HudObjectsMarksWnd:F_OnEventEndLevel( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()
	
	-- кастомные восклицательные знаки не очищаются в общем резете, т.к. они должны сохраниться даже если худ резетнуть, и потом заново показать
	self.customQuestEntities = {}

end


--
function UI.HudObjectsMarksWnd:AddDamageRecord( mark, damageVal, damageFlags )

	if mark.bHideDamageRecords then
		return
	end

	local curTime = _G.TimerGetGameTime()
	self:UpdateDamageRecords( mark, curTime )

	local record = {}

	damageVal = UI:RoundClampOne( damageVal )

	record.dir_abs = Vec2( UI:Lerp( -0.25, 0.25, math.random() ), -1 )
	UI:V2NormalizeInplace( record.dir_abs )

	record.addTime		= curTime
	record.maxTime		= self.damageRecordsHeight_abs / self.damageRecordSpeed_abs	
	record.endPos_abs	= Vec2( record.dir_abs.x * record.maxTime * self.damageRecordSpeed_abs, record.dir_abs.y * record.maxTime * self.damageRecordSpeed_abs )

	record.pos_abs		= Vec2( 0, 0 )
	record.alpha		= 0	

	if not mark.damageRecords then
		mark.damageRecords = {}
	end

	local recordIdx = mark.lastDamageRecordIdx == -1 and 1 or mark.lastDamageRecordIdx + 1
	mark.damageRecords[ recordIdx ] = record
	mark.lastDamageRecordIdx = recordIdx

	record.damageType, record.bCritical = UI:DamageFlags2DamageType( damageFlags )

	record.metaText = UI.MetaText.GetNewInstance()
	record.metaText:SetFormatParams( self.damageRecordFont, FONT.TF_HCENTER + FONT.TF_TOP + FONT.TF_NOCLIP, UI:Vec2( 1000, 1000 ), false )
	record.metaText:SetPixelSnap( false )

	local color = self.damageRecordColors[ record.damageType ] or UI.WHITE_COLOR
	color = UI:SetAlpha( color, record.alpha )
	record.metaText:SetColor( color )

	-- TODO: сейчас строка "crit" не подставляется (см.0034236); нужно отказаться от метатекста здесь вообще
	local str = ""
	if record.bCritical then
		str = string.format( "%s$text [fontId %d][text %s][alignment BASELINE]$", self.strCriticalDamage, self.damageRecordFontBig, tostring( damageVal ) )
	else
		str = tostring( damageVal )
	end
	record.metaText:SetText( str, true )

end


--
function UI.HudObjectsMarksWnd:RemoveDamageRecord( mark, recordIdx )

	if not mark.damageRecords then
		return
	end

	local record = mark.damageRecords[ recordIdx ]
	if not record then
		return
	end

	if record.mataText then
		record.mataText:Clear()
	end

	mark.damageRecords[ recordIdx ] = nil

	if recordIdx == mark.lastDamageRecordIdx then

		if next( mark.damageRecords ) then

			while true do
				mark.lastDamageRecordIdx = mark.lastDamageRecordIdx - 1
				if mark.damageRecords[ mark.lastDamageRecordIdx ] then
					break
				end			
			end

		else
			mark.lastDamageRecordIdx = -1
		end

	end

end


--
function UI.HudObjectsMarksWnd:ResetDamageRecords( mark )

	if not mark.damageRecords then
		return
	end

	for idx, record in pairs( mark.damageRecords ) do
    	if record.mataText then
    		record.mataText:Clear()
    	end
	end

	mark.damageRecords			= nil
	mark.lastDamageRecordIdx	= -1

end


--
function UI.HudObjectsMarksWnd:UpdateDamageRecords( mark, curTime )

	if mark.lastDamageRecordIdx == -1 then
		return
	end

	for recordIdx, record in pairs( mark.damageRecords ) do

		local deltaTime = curTime - record.addTime
		if deltaTime <= record.maxTime then

    		local t = deltaTime / record.maxTime

			record.pos_abs.x	= record.endPos_abs.x * t
			record.pos_abs.y	= record.endPos_abs.y * t
			record.alpha		= 255 * ( 1 - t )

    		record.metaText:SetAlpha( record.alpha )

		else
    		self:RemoveDamageRecord( mark, recordIdx )
		end

	end	

end


--
function UI.HudObjectsMarksWnd:ResetAllDamageRecords()

	for entId, mark in pairs( self.marks ) do
		self:ResetDamageRecords( mark )
	end

end


--
function UI.HudObjectsMarksWnd:AddTurretsForVitalPoint( entityId )

	local vp = _G.Entities[ entityId ]
	if vp then

		for turretIdx = 1, vp:GetTurretCount() do
			local turret = vp:GetTurret( turretIdx - 1 )
			if turret then
				self:AddMark( turret:GetId(), self.objTypes.DEFAULT )
			end
		end

	end

end


--
function UI.HudObjectsMarksWnd:UpdateAdaptiveMarksSize()

	self.bAdaptiveMarksSize = UI.Options:GetHudOptionVal( "adaptiveMarksSize" )
	
end


--
function UI.HudObjectsMarksWnd:UpdateOnCircleMarksMode()

	self.onCircleMarksMode = UI.Options:GetHudOptionVal( "onCircleMarksMode" )

end


--
function UI.HudObjectsMarksWnd:UpdateFadeOnDist()

	self.bFadeOnDist = UI.Options:GetHudOptionVal( "marksFadeOnDist" )

end


--
function UI.HudObjectsMarksWnd:UpdateArrowsAreaType()

	self.arrowsAreaType = UI.Options:GetHudOptionVal( "hudArrowsAreaType" )

end


--
function UI.HudObjectsMarksWnd:UpdateMarksElements()

    self.marksElements = { [ false ] = {}, [ true ] = {} }

	local function l_GetModeElements( mode, modeName, bAlly )
	
		local modeElements = {}
		self.marksElements[ bAlly ][ mode ] = modeElements

		modeElements.isName		= UI.Options:GetHudMarkOptionVal( modeName, "name" )
		modeElements.isRole		= UI.Options:GetHudMarkOptionVal( modeName, "role" )
		modeElements.isSpecIco	= UI.Options:GetHudMarkOptionVal( modeName, "specIco" )
		modeElements.isHpShield	= UI.Options:GetHudMarkOptionVal( modeName, "hpShield" )
		modeElements.isDist		= UI.Options:GetHudMarkOptionVal( modeName, "dist" )
		modeElements.isFrame	= UI.Options:GetHudMarkOptionVal( modeName, "frame" )
		modeElements.isRank		= UI.Options:GetHudMarkOptionVal( modeName, "rank" )
		modeElements.isShipName	= UI.Options:GetHudMarkOptionVal( modeName, "shipName" )

	end

	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.BRIEF, "brief", false )
	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.FULL, "full", false )
	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.LOCK, "lock", false )
	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.BRIEF, "brief_ally", true )
	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.FULL, "full_ally", true )
	l_GetModeElements( UI.HudObjectMarkWnd_InsideShip.modes.LOCK, "lock_ally", true )

end


--
function UI.HudObjectsMarksWnd:UpdateHideFramesOutOfShot()

	self.bHideFramesOutOfShot = UI.Options:GetHudOptionVal( "hideMarksFramesOutOfShot" )
	
end


--
function UI.HudObjectsMarksWnd:UpdateTransparentBehindObstacle()

	self.bTransparentBehindObstacle = UI.Options:GetHudOptionVal( "marksTransparentBehindObstacle" )
	
end


--
function UI.HudObjectsMarksWnd:UpdateScalableHealthBars()
	
	self.bScalableHealthBars = UI.Options:GetHudOptionVal( "scalableHealthBars" )

end


--
function UI.HudObjectsMarksWnd:UpdateVpHpAlways()
	
	self.bVpHpAlways = UI.Options:GetHudOptionVal( "vpHpAlways" )

end


--
function UI.HudObjectsMarksWnd:UpdateShowPredictionUnderMouse()

	self.showPredictionUnderMouse = UI.Options:GetHudOptionVal( "showPredictionUnderMouse" )

end


--
function UI.HudObjectsMarksWnd:UpdateNumPasses()

	local numPassesOld = self.numPasses

	self.numPasses = math.ceil( self.numMarks / self.MAX_MARKS_BY_PASS )
	self.numPasses = math.max( self.numPasses, 1 )

	if self.numPasses > numPassesOld then

		for pass = numPassesOld + 1, self.numPasses do
			self.marksByPass[ pass ] = { numMarks = 0, marks = {} }
		end

	elseif self.numPasses < numPassesOld then

		local freePasses = self:GetFreePasses()

		for pass = self.numPasses + 1, numPassesOld do
	
			for markIdx = 1, self.marksByPass[ pass ].numMarks do
				self:UpdateMarkPass( self.marksByPass[ pass ].marks[ markIdx ], freePasses )
			end

			self.marksByPass[ pass ] = nil

		end
	
	end	

	self.pass = math.min( self.pass, self.numPasses )

end


--
function UI.HudObjectsMarksWnd:UpdateMarkPass( mark, freePasses )

	if mark.pass == nil or mark.pass == -1 or mark.pass > self.numPasses then

		local bExternalFreePasses = freePasses ~= nil
		freePasses = freePasses or self:GetFreePasses()

		local freePassIdx = math.random( 1, #freePasses )
		mark.pass = freePasses[ freePassIdx ]

		table.insert( self.marksByPass[ mark.pass ].marks, mark )
		self.marksByPass[ mark.pass ].numMarks = self.marksByPass[ mark.pass ].numMarks + 1

    	dummy =
    		( bExternalFreePasses and self.marksByPass[ mark.pass ].numMarks >= self.MAX_MARKS_BY_PASS )
    			and table.remove( freePasses, freePassIdx )

	end		

end


--
function UI.HudObjectsMarksWnd:GetFreePasses()

	local freePasses = {}

	for pass = 1, self.numPasses do

		dummy =
			self.marksByPass[ pass ].numMarks < self.MAX_MARKS_BY_PASS
				and table.insert( freePasses, pass )

	end

	return freePasses

end


--
function UI.HudObjectsMarksWnd:ShufflePasses()

	for pass = 1, self.numPasses do
		self.marksByPass[ pass ].marks		= {}
		self.marksByPass[ pass ].numMarks	= 0
	end

	local freePasses = self:GetFreePasses()

	for entId, mark in pairs( self.marks ) do
		mark.pass = -1
		self:UpdateMarkPass( mark, freePasses )
	end

end


-- точа на эллипсе прицеливания мыши, в абсолютных координатах, с центром 0/0
function UI.HudObjectsMarksWnd:GetOnMouseRadiusPos( angle )

	local tn = math.tan( angle )

	-- (a*b) / sqrt( b^2 + (a*tn)^2 )

	local x = ( self.mouseTargetRadius_abs.x * self.mouseTargetRadius_abs.y ) / math.sqrt( self.mouseTargetRadius_abs.y * self.mouseTargetRadius_abs.y + self.mouseTargetRadius_abs.x * self.mouseTargetRadius_abs.x * tn * tn )
	if math.abs( angle ) > math.pi * 0.5 then
		x = -x
	end

	local y = - tn * x

	return x, y

end


-- точка на бордюре экрана, в абсолютных координатах, с центром 0/0
function UI.HudObjectsMarksWnd:GetOnScreenRectPos( angle, edge )

	angle		= UI:AngleNormalizePI( angle )

	local w		= UI.screenWidth * 0.5 - edge
	local h		= UI.screenHeight * 0.5 - edge
	local tn	= math.tan( angle )
	local a		= math.atan( h / w )

	local x		= 0
	local y		= 0

	-- сверху

	if angle >= a and angle <=  math.pi - a then
		x = h / tn
		y = -h

	-- снизу
	elseif angle <= -a and angle >= -math.pi + a then
		x = - h / tn
		y = h

	-- слева
	elseif math.abs( angle ) > math.pi - a then
		x = -w
		y = w * tn

	-- справа
	else
		x = w
		y = - w * tn
	end

	return x, y	

end


--
function UI.HudObjectsMarksWnd:UpdateFitQuests()

	self.fitQuests = {}

	local curZoneId = UI:GetCurZone()

	for idx, questInfo in ipairs( UI.serverData.activeQuests ) do		

		local questId = questInfo.id

		if self:IsQuestFit( questId, UI.questTypes.REGULAR ) then

			if not self.fitQuests[ UI.questTypes.REGULAR ] then
				self.fitQuests[ UI.questTypes.REGULAR ] = {}
			end

			self.fitQuests[ UI.questTypes.REGULAR ][ questId ] = self:GetQuestInfo( questId, UI.questTypes.REGULAR, curZoneId )

		end		

	end

	for idx, pveEvent in pairs( _G.PvE_Common.UI.PveEvents:GetEvents() ) do

		local questId = pveEvent.id

		if self:IsQuestFit( questId, UI.questTypes.PVE_EVENT ) then

			if not self.fitQuests[ UI.questTypes.PVE_EVENT ] then
				self.fitQuests[ UI.questTypes.PVE_EVENT ] = {}
			end

			self.fitQuests[ UI.questTypes.PVE_EVENT ][ questId ] = self:GetQuestInfo( questId, UI.questTypes.PVE_EVENT )

		end

	end
	
	self.fitQuests[ UI.questTypes.CUSTOM ] =
	{
		[ UI.questIcoTypes.YELLOW ]	= self:GetQuestInfo( UI.questIcoTypes.YELLOW, UI.questTypes.CUSTOM ),
		[ UI.questIcoTypes.BLUE ]	= self:GetQuestInfo( UI.questIcoTypes.BLUE, UI.questTypes.CUSTOM ),
	}

end


--
function UI.HudObjectsMarksWnd:UpdateFitAdventures()

	self.fitAdventures = {}

	local curZoneId = UI:GetCurZone()

	for idx, adventureInfo in ipairs( UI.serverData.activeAdventures ) do

		local aiid = adventureInfo.aiid

		if self:IsAdventureFit( aiid ) then
			if not self.fitAdventures[ aiid.h ] then
				self.fitAdventures[ aiid.h ] = {}
			end
			self.fitAdventures[ aiid.h ][ aiid.l ] = self:GetAdventureInfo( aiid, curZoneId )

		end

	end

end


--
function UI.HudObjectsMarksWnd:GetQuestInfo( questId, questType, curZoneId )

	local questInfo =
	{
		bCurZone		= false,
		stage			= -1,
		objectDefNames	= nil,
		entIds			= nil,
		gateId			= nil,
		bCompleted		= false,
	}

	if questType == UI.questTypes.REGULAR then

    	if not curZoneId then
    		curZoneId = UI:GetCurZone()
    	end

    	local stage = UI:GetQuestStage( questId )
    	local questZones = UI:GetQuestZonesForStage( questId, stage )

    	local bCurZone = false

    	local curVal		= UI:GetQuestTaskCurVal( questId ) or 0
    	local maxVal		= UI:GetQuestTaskMaxVal( questId, stage ) or 0
    	local bCompleted	= curVal >= maxVal

		if not bCompleted then

        	if questZones[ 1 ] == nil then
        		bCurZone = true
        	else
        		for idx, zoneId in ipairs( questZones ) do
        			if zoneId == curZoneId then
        				bCurZone = true
        				break
        			end
        		end
        	end

		end

		questInfo.bCompleted	= bCompleted
    	questInfo.stage			= stage

    	if bCurZone then

    		questInfo.bCurZone			= true
    		questInfo.objectDefNames	= UI:GetQuestMarkDefsForStage( questId, stage )

    	else

    		questInfo.bCurZone = false

			if bCompleted then

				local questHangarRace	= UI:GetQuestHangarRace( questId )
				local questHangarZoneId	= UI:GetSpaceStationForRace( questHangarRace )

				if curZoneId == questHangarZoneId then
					questInfo.gateId = self.GATE_ID_DOCK	-- фэйковый id для врат пристыковки к ангару
				else
					questInfo.gateId = UI:GetNearestGateToZone( curZoneId, questHangarZoneId )
				end

			else

        		local minPathLength	= math.huge
        		local minGateId		= -1

        		for idx, zoneId in ipairs( questZones ) do

    				local gateId, pathLength = UI:GetNearestGateToZone( curZoneId, zoneId )

        			if gateId ~= -1 then

            			if pathLength < minPathLength then
            				minPathLength = pathLength
            				minGateId = gateId
            			end

        			end

        		end

    			questInfo.gateId = minGateId

			end

    	end

	elseif questType == UI.questTypes.PVE_EVENT then

		questInfo.bCurZone = true

		questInfo.objectDefNames = {}
		local defs = _G.PvE_Common.UI.PveEvents:GetEventTargetDefs( questId )
    	for idx, defName in ipairs( defs ) do
    		questInfo.objectDefNames[ defName ] = true
    	end
		
	elseif questType == UI.questTypes.CUSTOM then
	
		questInfo.bCurZone = true
		
		questInfo.entIds = {}
		for _entId, _questId in pairs( self.customQuestEntities ) do
			if _questId == questId then
				questInfo.entIds[ _entId ] = true
			end
		end

	end

	return questInfo

end


--
function UI.HudObjectsMarksWnd:GetAdventureInfo( aiid, curZoneId )

	local adventureInfo =
	{
		bCurZone		= false,
		aiid			= -1,
		stage			= -1,
		objectDefNames	= nil,
		--entIds			= nil,
		--gateId			= nil,
		bCompleted		= false,
	}

	if not curZoneId then
		curZoneId = UI:GetCurZone()
	end

	local stage 			= UI:GetAdventureStage( aiid )
	local adventureZones 	= UI:GetAdventureZonesForStageT( aiid )

	local bCurZone 			= false

	local curVal			= UI:GetAdventureTaskCurVal( aiid ) or 0
	local maxVal			= UI:GetAdventureTaskMaxVal( aiid ) or 0

	local bCompleted		= curVal >= maxVal

	if not bCompleted then

		for idx, zoneId in ipairs( adventureZones ) do
			if zoneId == curZoneId then
				bCurZone = true
				break
			end
		end

	end

	adventureInfo.bCompleted	= bCompleted
	adventureInfo.stage			= stage
	adventureInfo.aiid			= aiid

	if bCurZone then

		adventureInfo.bCurZone			= true
		adventureInfo.objectDefNames	= UI:GetAdventureMarkDefsForStage( aiid )

	end

	return adventureInfo

end


--
function UI.HudObjectsMarksWnd:IsQuestFit( questId, questType )

	if questType == UI.questTypes.REGULAR then

    	if not UI:IsQuestOpenWorld( questId ) then
    		return false
    	end

    	if not UI:IsQuestUnlockedByRank( questId ) then
    		return false
    	end

    	local questHangarRace	= UI:GetQuestHangarRace( questId )
    	local hangarRace		= UI:GetCurSpaceStationRace()

    	if not( questHangarRace == -1 or questHangarRace == hangarRace ) then
    		return false
    	end

    	if not UI:IsQuestTaken( questId ) then
    		return false
    	end

    	local stage		= UI:GetQuestStage( questId )

    	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE or UI:IsQuestAuto( questId ) then

        	local curZoneId		= UI:GetCurZone()
    		local questZones	= UI:GetQuestZonesForStage( questId, stage )
			
			-- для опенворлдовских квестов - запрещены квесты в локации - SC-112151, SC-113605, SC-113723
			if UI:IsQuestLockedByZone( questId ) then
				return false
			end

        	local bCurZone = false

        	if questZones[ 1 ] == nil then
        		bCurZone = true
        	else
        		for idx, zoneId in ipairs( questZones ) do
        			if zoneId == curZoneId then
        				bCurZone = true
        				break
        			end
        		end
        	end

    		if not bCurZone then
    			return false
    		end

    	end

		return true

	elseif questType == UI.questTypes.PVE_EVENT then

		if not _G.PvE_Common.UI.PveEvents:IsEventActive( questId ) then
			return false
		end

		return true
		
	elseif questType == UI.questTypes.CUSTOM then
		
		return true
		
	end

	return false

end


--
function UI.HudObjectsMarksWnd:IsAdventureFit( aiid )

	-- пока не понятно
	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return false
	end

	if not UI:IsAdventureTaken( aiid ) then
		return false
	end

	return true

end


--
function UI.HudObjectsMarksWnd:GetMarkQuests( mark )

	local markQuests = {}

	local gateId = -1

	if mark.objType == self.objTypes.JUMP_GATE then

		if mark.ent then
			if mark.ent:IsDockLocation() then
				gateId = self.GATE_ID_DOCK	-- фэйковый id для врат пристыковки к ангару
			else
				gateId = mark.ent:GetTargetZoneReal()
			end
		end

	end

	for questType, questsByType in pairs( self.fitQuests ) do

    	for questId, questInfo in pairs( questsByType ) do

    		if questInfo.bCurZone then

				if questInfo.objectDefNames then
					if questInfo.objectDefNames[ mark.defName ] == true then
						table.insert( markQuests, { questId = questId, questType = questType } )
					end
				end
				
				if questInfo.entIds then
					if questInfo.entIds[ mark.entId ] == true then
						table.insert( markQuests, { questId = questId, questType = questType } )
					end
				end

    		else

        		if gateId ~= -1 and gateId == questInfo.gateId then
    				table.insert( markQuests, { questId = questId, questType = questType } )
        		end

    		end

    	end

	end

	return markQuests

end


--
function UI.HudObjectsMarksWnd:GetMarkAdventures( mark )

	local markAdventures = {}

	for h, adventures in pairs( self.fitAdventures ) do

		for l, adventureInfo in pairs( adventures ) do

			if adventureInfo.bCurZone then

				if adventureInfo.objectDefNames then
					if adventureInfo.objectDefNames[ mark.defName ] == true then
						table.insert( markAdventures, { aiid = adventureInfo.aiid } )
					end
				end

			end
		end
	end

	return markAdventures

end


--
function UI.HudObjectsMarksWnd:UpdateMarkQuests( mark, changedQuestId, questType )

	local oldMarkQuests	= mark.quests
	local newMarkQuests	= self:GetMarkQuests( mark )

	if changedQuestId ~= nil then

		local bWasQuest	= false
		local bIsQuest	= false

		for idx, quest in ipairs( oldMarkQuests ) do
			if quest.questType == questType and quest.questId == changedQuestId then
				bWasQuest = true
				break
			end
		end

		for idx, quest in ipairs( newMarkQuests ) do
			if quest.questType == questType and quest.questId == changedQuestId then
				bIsQuest = true
				break
			end
		end

		if bWasQuest == bIsQuest then
			return
		end

	end

	mark.quests = newMarkQuests

	if mark.wnd then
	
		local wndType = mark.wnd:GetWndType()
		if wndType == self.wndTypes.INSIDE_SHIP or wndType == self.wndTypes.INSIDE_VITAL_POINT then

			local bFirstUpdateSaved = mark.data.bFirstUpdate
			mark.data.bFirstUpdate = true

			self:CheckEntValid( mark )
			mark.wnd:Update()

			mark.data.bFirstUpdate = bFirstUpdateSaved
			
		end

	end

	if mark.onCircleWnd then
	
		local wndType = mark.onCircleWnd:GetWndType()
		if wndType == self.wndTypes.OUTSIDE_SHIP or wndType == self.wndTypes.OUTSIDE_VP then

			local bFirstUpdateOnCircleSaved = mark.data.bFirstUpdateOnCircle
			mark.data.bFirstUpdateOnCircle = true

			self:CheckEntValid( mark )
			mark.onCircleWnd:Update()

			mark.data.bFirstUpdateOnCircle = bFirstUpdateOnCircleSaved
			
		end

	end

end


--
function UI.HudObjectsMarksWnd:UpdateMarkAdventures( mark, aiid )

	local oldMarkAdventures	= mark.adventures
	local newMarkAdventure	= self:GetMarkAdventures( mark )

	if aiid ~= nil then

		local bWasAdventure	= false
		local bIsAdventure	= false

		for idx, adventure in ipairs( oldMarkAdventures ) do
			if adventure.aiid == aiid then
				bWasAdventure = true
				break
			end
		end

		for idx, adventure in ipairs( newMarkAdventure ) do
			if adventure.aiid == aiid then
				bIsAdventure = true
				break
			end
		end

		if bWasAdventure == bIsAdventure then
			return
		end

	end

	mark.adventures = newMarkAdventure

	-- пока не знаю зачем
	if mark.wnd then

		local wndType = mark.wnd:GetWndType()
		if wndType == self.wndTypes.INSIDE_SHIP or wndType == self.wndTypes.INSIDE_VITAL_POINT then

			local bFirstUpdateSaved = mark.data.bFirstUpdate
			mark.data.bFirstUpdate = true

			self:CheckEntValid( mark )
			mark.wnd:Update()

			mark.data.bFirstUpdate = bFirstUpdateSaved

		end

	end

	if mark.onCircleWnd then

		local wndType = mark.onCircleWnd:GetWndType()
		if wndType == self.wndTypes.OUTSIDE_SHIP or wndType == self.wndTypes.OUTSIDE_VP then

			local bFirstUpdateOnCircleSaved = mark.data.bFirstUpdateOnCircle
			mark.data.bFirstUpdateOnCircle = true

			self:CheckEntValid( mark )
			mark.onCircleWnd:Update()

			mark.data.bFirstUpdateOnCircle = bFirstUpdateOnCircleSaved

		end

	end

end


--
function UI.HudObjectsMarksWnd:OnQuestStateChanged( questId, questType )

	local bChanged	= false
	local bFit		= self:IsQuestFit( questId, questType )

	if bFit then		

		if not self.fitQuests[ questType ] then
			self.fitQuests[ questType ] = {}
		end

		-- не было, надо добавить
		if not self.fitQuests[ questType ][ questId ] then
			bChanged = true

		else

			-- был, надо поменять состояние

			-- у регулярных квестов могла поменяться стадия или могло выполниться условие для завершения
			if questType == UI.questTypes.REGULAR then

        		local stage			= UI:GetQuestStage( questId )
        		local stageOld		= self.fitQuests[ UI.questTypes.REGULAR ][ questId ].stage

				local bCompleted	= UI:CanQuestBeCompleted( questId )
				local bCompletedOld	= self.fitQuests[ UI.questTypes.REGULAR ][ questId ].bCompleted

            	if stage ~= stageOld or bCompleted ~= bCompletedOld then
            		bChanged = true
            	end

			-- pve-ивент мог быть переактивирован для других дефов
			elseif questType == UI.questTypes.PVE_EVENT then
				bChanged = true
				
			elseif questType == UI.questTypes.CUSTOM then
				bChanged = true
			end

		end

		if bChanged then
			self.fitQuests[ questType ][ questId ] = self:GetQuestInfo( questId, questType )
		end

	else	

		-- был, надо убрать
		if self.fitQuests[ questType ] and self.fitQuests[ questType ][ questId ] then

			self.fitQuests[ questType ][ questId ] = nil
			bChanged = true

			if not next( self.fitQuests[ questType ] ) then
				self.fitQuests[ questType ] = nil
			end

		end

	end

	if bChanged then
    	for entId, mark in pairs( self.marks ) do
    		self:UpdateMarkQuests( mark, questId, questType )
    	end
	end

end


function UI.HudObjectsMarksWnd:OnAdventureStateChanged( aiid )

	local bChanged	= false
	local bFit		= self:IsAdventureFit( aiid )

	if bFit then

		if not self.fitAdventures[ aiid.h ] then
			self.fitAdventures[ aiid.h ] = {}
		end

		if not self.fitAdventures[ aiid.h ][ aiid.l ] then
			-- не было, надо добавить
			bChanged = true
		else
			-- был, надо поменять состояние
			local stage			= UI:GetAdventureStage( aiid )
			local stageOld		= self.fitAdventures[ aiid.h ][ aiid.l ].stage

			if stage ~= stageOld  then
				bChanged = true
			end

		end

		if bChanged then
			self.fitAdventures[ aiid.h ][ aiid.l ] = self:GetAdventureInfo( aiid )
		end

	else
		-- был, надо убрать
		if self.fitAdventures[ aiid.h ] and self.fitAdventures[ aiid.h ][ aiid.l ] then

			self.fitAdventures[ aiid.h ][ aiid.l ] = nil
			bChanged = true

			if not next( self.fitAdventures[ aiid.h ] ) then
				self.fitAdventures[ aiid.h ] = nil
			end

		end

	end

	if bChanged then
		for entId, mark in pairs( self.marks ) do
			self:UpdateMarkAdventures( mark, aiid )
		end
	end

end


--
function UI.HudObjectsMarksWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local hudMode = UI.HudWnd:GetMode()
	if hudMode == UI.HudWnd.modes.GLOBAL_MAP or hudMode == UI.HudWnd.modes.GLOBAL_MAP_SPECTATOR or hudMode == UI.HudWnd.modes.SELECT_SHIP then

		local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
		if UI:IsWndKindOf( wnd, "HudObjectMarkWnd_InsideShip" ) then

			local mark = wnd:GetMark()

			if mark.objType == self.objTypes.PLAYER then

				local playerInfo = _G.GetPlayerInfo( mark.playerId )
				if not playerInfo.isBot then
					UI:ChatWisperByNickname( playerInfo.nickName )
					UI:PlayGlobalSound( self.sounds.markClick )
				end

			end

			return true

		end
	end

	return false

end


--
function UI.HudObjectsMarksWnd:CheckEntValid( mark )

 	if not _G.IsEntIdValid( mark.entId ) then
 		mark.ent = nil
 	end

end


--
function UI.HudObjectsMarksWnd:InitDamageRecordParams()

	if self.damageRecordColors then
		return
	end

	self.damageRecordColors = {}

	local damageRecordsParamsEffect = _G.UI_SpawnEffect( "hud_objectsMark_insideShip_damageRecords", self:GetUiHandle() )
	if damageRecordsParamsEffect then

		for damageName, locatorName in pairs( self.effectInfo.damageRecordsParams.colorLocators ) do

			local damageType = ai.DamageType[ damageName ]
			if damageType then
				self.damageRecordColors[ damageType ] = damageRecordsParamsEffect:GetObjColor( locatorName )
			else
				sys.log( "UI.HudObjectsMarksWnd:InitDamageRecordParams()()[ERROR]: invalid damage type name: %s", damageName )
			end

		end

		local fontName = damageRecordsParamsEffect:GetObjFontName( self.effectInfo.damageRecordsParams.fontLocator )
		self.damageRecordFont = _G.ObtainFont( fontName )

		local fontNameBig = damageRecordsParamsEffect:GetObjFontName( self.effectInfo.damageRecordsParams.fontLocatorBig )
		self.damageRecordFontBig = _G.ObtainFont( fontNameBig )

		_G.UI_DestroyEffect( damageRecordsParamsEffect )

	end

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudObjectMarkWnd",
		style		= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},   
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd:Reset()
	
	self.mark	= nil
	self.alpha	= -1

end


--
function UI.HudObjectMarkWnd:Setup( mark )

	if mark == nil then
		sys.log( "UI.HudObjectMarkWnd:Setup()[ERROR]: nil mark" )
	end
	
	self.mark = mark

end


--
function UI.HudObjectMarkWnd:Update()

	self:UpdateAlpha()

end


--
function UI.HudObjectMarkWnd:GetCenter()

	return self.center

end


--
function UI.HudObjectMarkWnd:SetRot( angle )

	self.mainEffect:SetRotation( angle, self.center )

end


--
function UI.HudObjectMarkWnd:GetWndType()

	return self.wndType

end


--
function UI.HudObjectMarkWnd:GetMark()

	return self.mark

end

-- ------------------------------
-- const
-- ------------------------------

UI.HudObjectMarkWnd.layers =
{
	MAIN_EFFECT		= 0
}

UI.HudObjectMarkWnd.effectInfo =
{
	main =
	{
		centerObjName	= "center"
	}
}  

UI.HudObjectMarkWnd.wndType = -1

-- ------------------------------
-- vars
-- ------------------------------

UI.HudObjectMarkWnd.center		= Vec2( 0, 0 )
UI.HudObjectMarkWnd.mark		= nil
UI.HudObjectMarkWnd.mainEffect	= nil
UI.HudObjectMarkWnd.alpha		= -1
UI.HudObjectMarkWnd.optionsSrc	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.center = Vec2( 0, 0 )

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.mainEffect then
		self.center = self.mainEffect:GetObjPos( self.effectInfo.main.centerObjName )
	end

	self.optionsSrc = UI.HudObjectsMarksWnd
	
end  


--
function UI.HudObjectMarkWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	-- фильтруем окна без self.mark
	if not self.mark then
		self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
		return
	end

	local drawInVR = UI.HudObjectsMarksWnd.bOculus and self ~= self.mark.onCircleWnd and not self.mark.bPreview and not UI.HudWnd:IsWorldLookMode( UI.HudWnd:GetMode() )
	if drawInVR then
		UI.drawer:BeginVR3dDraw( x0, y0, x0 + self.center.x, y0 + self.center.y, width, height, self.mark.lastEntPos );

		-- убираем клиппинг экраном всех марков - рисуем марки везде и всегда
		clipX0 = -10000;
		clipY0 = -10000;
		clipWidth = 20000;
		clipHeight = 20000;
	end	

	-- all text with elements draw w/o snapping
	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( false, false )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )

	if drawInVR then
		UI.drawer:EndVRDraw();
	end

end


--
function UI.HudObjectMarkWnd:UpdateAlpha()
	
	local logicHideAlphaCf =
		self.mark.hideAnimTime ~= -1
			and UI:Clamp( 1 - self.mark.hideAnimTime / UI.HudObjectsMarksWnd.MARK_HIDE_TIME, 0, 1 )
			or 1

	local onCircleAlphaCf =
		self == self.mark.onCircleWnd
			and self.mark.onCircleAlpha
			or 1

	local bUseDistAlpha =
		self.optionsSrc.bFadeOnDist
		and self:AllowFadeForCurMode()
		and ( self.mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER or self.mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT )
		and not self.mark.data.bMyShip
		--and ( self.mark.quests[ 1 ] == nil or self.mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER )	-- квестовые игроки уходят в альфу, мобы - нет (#0054256,комм.(0218367))
		and ( ( self.mark.quests[ 1 ] == nil and self.mark.adventures[ 1 ] == nil ) or self.mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER )	-- квестовые игроки уходят в альфу, мобы - нет (#0054256,комм.(0218367))
		and self.mark.data.fireDist ~= -1
		and self.mark.data.fireDist > self.mark.data.fireRange

	local distAlphaCf =
		bUseDistAlpha
    		and UI:Clamp(
    			UI:Lerp(
    				UI.HudObjectsMarksWnd.FIRE_DIST_ALPHA,
    				UI.HudObjectsMarksWnd.MIN_ALPHA,
    				( self.mark.data.fireRange < UI.HudObjectsMarksWnd.MIN_ALPHA_DIST )
						and ( self.mark.data.fireDist - self.mark.data.fireRange ) / ( UI.HudObjectsMarksWnd.MIN_ALPHA_DIST - self.mark.data.fireRange )
						or 1
    			),
    			UI.HudObjectsMarksWnd.MIN_ALPHA,
    			UI.HudObjectsMarksWnd.FIRE_DIST_ALPHA
    		)
			or 1
			
	local behindObstacleAlphaCf =
		( self == self.mark.wnd and self.mark.data.bBehindObstacle and self.optionsSrc.bTransparentBehindObstacle )
			and UI.HudObjectsMarksWnd.BEHIND_OBSTACLE_ALPHA
			or 1
			

	local alpha = math.floor( logicHideAlphaCf * onCircleAlphaCf * distAlphaCf * behindObstacleAlphaCf * 255 )

	dummy =
		alpha ~= self.alpha
			and _G.UI_Effect_SetAlphaColor( self.mainEffect, alpha )

	self.alpha = alpha

end


-- for override
function UI.HudObjectMarkWnd:AllowFadeForCurMode()

	return true

end


--
function UI.HudObjectMarkWnd:IsUnderMouse()

	return self.mark and self.mark == UI.HudObjectsMarksWnd.markUnderMouse

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_InsideShip
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_InsideShip = {}
local is = UI.HudObjectMarkWnd_InsideShip

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd_InsideShip.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd",

	props =
	{
		name		= "HudObjectMarkWnd_InsideShip",
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
				defName				= "hud_objectsMark_insideShip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "angle_1",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.AIM_BORDER_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_2",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.AIM_BORDER_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_3",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.AIM_BORDER_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_4",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.AIM_BORDER_4_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_1",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.LOCK_US_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_2",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.LOCK_US_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_3",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.LOCK_US_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "angle_4",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.LOCK_US_4_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "name",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.NAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "dist",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.DISTANCE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "center",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.VISIBLE_BY_LEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "center",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.MY_SHIP_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "center",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.MY_MISSILE_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_icon_1",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_icon_2",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.QUEST_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "timer",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.TIMER",
						animParams	= UI.EffectAnimParams.ALL,
					},

				}
			}}
		},  

		-- AIM_BORDER_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_aimBorder1",
			}}
		},

		-- AIM_BORDER_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_aimBorder2",
			}}
		},

		-- AIM_BORDER_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_aimBorder3",
			}}
		},

		-- AIM_BORDER_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_aimBorder4",
			}}
		},

		-- LOCK_US_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_lockUs1",
			}}
		}, 

		-- LOCK_US_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_lockUs2",
			}}
		}, 

		-- LOCK_US_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_lockUs3",
			}}
		}, 

		-- LOCK_US_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_lockUs4",
			}}
		}, 

		-- MY_SHIP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_myShip",
				defaultAnimation	= "idle",
			}}
		},

		-- MY_MISSILE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_myMissile",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
			}}
		},

		-- QUEST_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_name",

				links =
				{
					{
						objName		= "name2",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- DISTANCE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_name",

				links =
				{
					{
						objName		= "name1",
						layer		= "UI.HudObjectMarkWnd_InsideShip.layers.DISTANCE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- DISTANCE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
		
		-- TIMER
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz 	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- DAMAGE_RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- VISIBLE_BY_LEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_visibleByLeader",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideShip:Reset()

	UI.HudObjectMarkWnd.Reset( self )

	self.mode				= -1
	self.bCustomizableMode	= false

	for layerIdx = 0, self:GetNumLayers() - 1 do
		if layerIdx ~= self.layers.MAIN_EFFECT then

			self:SetLayerVisible( false, layerIdx )
			self.mainEffect:UnlinkLayer( self.uiHandle, layerIdx, "" )			

		end
	end

    self.bAimBorderVisible				= false
    self.bLockUsVisible					= false
    self.bMyShipVisible					= false
    self.bMyMissileVisible				= false
    self.bIcoVisible					= false
    self.bQuestIcoVisible				= false
    self.bNameVisible					= false
    self.bDistanceVisible				= false
	self.dist							= -1
	self.distBackColor					= -1
    self.bVisibleByLeaderVisible		= false
	self.bDamageRecordsVisible			= false
	self.mainAnimTime					= -1
	self.bHpVisible						= false
	self.bShieldVisible					= false
	self.activeShieldId					= -1

	if self.mainEffect then
   		self.mainEffect:SetAnimationTimeAndUpdate( 0 )
	end

	self.hpBarWnd:Reset()
	self:RemoveControl( self.hpBarWnd, self.mainEffect )

	self.shieldBarWnd:Reset()
	self:RemoveControl( self.shieldBarWnd, self.mainEffect )

	self:ResetNameMetaText()

end


--
function UI.HudObjectMarkWnd_InsideShip:Update()

	UI.HudObjectMarkWnd.Update( self )

	local oldMode = self.mode
	self:UpdateMode()
	
	local fn = UI.HudObjectMarkWnd_InsideShip.updateFuncs[ self.mark.objType ]
	if fn then
		fn( self, oldMode )
	end

end


-- ------------------------------
-- const
-- ------------------------------

is.layers =
{
    MAIN_EFFECT					= 0,
    AIM_BORDER_1_EFFECT			= 1,
    AIM_BORDER_2_EFFECT			= 2,
    AIM_BORDER_3_EFFECT			= 3, 
    AIM_BORDER_4_EFFECT			= 4, 
	LOCK_US_1_EFFECT      		= 5, 
	LOCK_US_2_EFFECT      		= 6, 
	LOCK_US_3_EFFECT      		= 7, 
	LOCK_US_4_EFFECT      		= 8, 
	MY_SHIP_EFFECT          	= 9, 
	MY_MISSILE_EFFECT       	= 10, 
	ICO_EFFECT					= 11,
	QUEST_ICO_EFFECT			= 12,
    NAME_EFFECT					= 13, 
    NAME						= 14, 
	DISTANCE_EFFECT				= 15,
    DISTANCE					= 16,
	TIMER						= 17,
    DAMAGE_RECORDS				= 18,
	VISIBLE_BY_LEADER_EFFECT	= 19,
}

is.effectInfo =
{
	main =
	{
		damageRecordsStartObjName_FULL	= "center",
		damageRecordsStartObjName_BRIEF	= "center",
		centerObjName					= "center",
		minSizeLocator					= "min_dist",
		maxSizeLocator					= "max_dist",
		hpLocatorHasShield				= "shd_progr",
		hpLocatorNoShield				= "arm_progr",
		shieldLocator					= "arm_progr",
		aimBorderLocatorPrefix			= "angle_",
		lockUsLocatorPrefix				= "angle_",
		myShipLocator					= "center",
		myLissileLocator				= "center",
		icoLocator						= "gmp_icon_1",
		questIcoLocator					= "gmp_icon_2",
		nameLocator						= "name",
		distanceLocator					= "dist",
		visibleByLeader					= "center",
		timer							= "timer",
	},

	aimBorder =
	{
        enemyInRange		= "enemy_shot",
        enemyOutRange		= "enemy",
        neutralInRange		= "neutral_shot",
        neutralOutRange		= "neutral",
        friendInRange		= "friend_shot",
        friendOutRange		= "friend",
		agressiveInRange	= "agressiv_shot",
		agressiveOutRange	= "agressiv",
		alienInRange		= "nlo_shot",
		alienOutRange		= "nlo",
        mySquadInRange		= "squad_shot",
        mySquadOutRange		= "squad",
		meInRange			= "me_shot",
		meOutRange			= "me",
	},

	myShip =
	{
		orgObjName	= "center"
	},

	myMissile =
	{
		orgObjName	= "center"
	},

	name =
	{
        enemyInRange				= "enemy_shot",
        enemyOutRange				= "enemy",
        neutralInRange				= "neutral_shot",
        neutralOutRange				= "neutral",
        friendInRange				= "friend_shot",
        friendOutRange				= "friend",
		agressiveInRange			= "agressiv_shot",
		agressiveOutRange			= "agressiv",
		alienInRange				= "nlo_shot",
		alienOutRange				= "nlo",
        mySquadInRange				= "squad_shot",
        mySquadOutRange				= "squad",
		meInRange					= "me_shot",
		meOutRange					= "me",

		backColorEnemyLocator		= "name_outl",
		backColorFriendLocator		= "name_outl2",
		backColorAgressiveLocator	= "name_outl3",
		backColorAlienLocator		= "objectNamewfwfw3",
		backColorSquadLocator		= "name_color_squad_shot",
		backColorMeLocator			= "name_color_me_shot",
	},

	lockUs =
	{
		enemyInRange			= "lock_me_shot",
		enemyOutRange			= "lock_me",
        friendInRange			= "friend_shot",
        friendOutRange			= "friend",
        neutralInRange			= "neutral_shot",
        neutralOutRange			= "neutral",
		agressiveInRange		= "agressiv_shot",
		agressiveOutRange		= "agressiv",
		alienInRange			= "nlo_shot",
		alienOutRange			= "nlo",
	},

	dist =
	{
        enemyInRange				= "enemy_shot",
        enemyOutRange				= "enemy",
        neutralInRange				= "neutral_shot",
        neutralOutRange				= "neutral",
        friendInRange				= "friend_shot",
        friendOutRange				= "friend",
		agressiveInRange			= "agressiv_shot",
		agressiveOutRange			= "agressiv",
		alienInRange				= "nlo_shot",
		alienOutRange				= "nlo",
        mySquadInRange				= "squad_shot",
        mySquadOutRange				= "squad",
		meInRange					= "me_shot",
        meOutRange					= "me",

		backColorEnemyLocator		= "name_outl",
		backColorFriendLocator		= "name_outl2",
		backColorAgressiveLocator	= "name_outl3",
		backColorAlienLocator		= "objectNamewfwfw3",
		backColorSquadLocator		= "name_color_squad_shot",
		backColorMeLocator			= "name_color_me_shot",
	},

	ico =
	{
        enemyInRange			= "enemy_shot",
        enemyOutRange			= "enemy",
		neutralInRange			= "neutral_shot",			
		neutralOutRange			= "neutral",			
        friendInRange			= "friend_shot",
        friendOutRange			= "friend",
        agressiveInRange		= "agressiv_shot",
        agressiveOutRange		= "agressiv",
		alienInRange			= "nlo_shot",
		alienOutRange			= "nlo",
        mySquadInRange			= "squad_shot",
        mySquadOutRange			= "squad",
		meInRange				= "me_shot",
        meOutRange				= "me",
		quest					= "white",

		orgObjName				= "center",
		spriteIcoName			= "ico",
		spriteIcoNameOutline	= "ico_bg",
	},
}

is.strM	= UI:GetStringByName( "meter" )

is.wndType = UI.HudObjectsMarksWnd.wndTypes.INSIDE_SHIP

is.modes =
{
	FULL		= 1,
	BRIEF		= 2,
	DEAD		= 3,	
	DAMAGE_ONLY	= 4,
	LOCK		= 5,
}

is.MY_SHIP_ORIGINAL_ANGLE = math.rad( 90 )
is.MY_MISSILE_ORIGINAL_ANGLE = math.rad( 90 )

-- ------------------------------
-- vars
-- ------------------------------

is.mode								= -1
is.bCustomizableMode				= false

is.animId_name_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_name_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_dist_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_dist_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_aimBorder_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_aimBorder_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}


is.animId_lockUs_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_lockUs_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_ico_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_ico_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

is.animId_ico_quest					= -1

is.damageRecordsStart_FULL			= Vec2( 0, 0 )
is.damageRecordsStart_BRIEF			= Vec2( 0, 0 )
is.centerPos						= Vec2( 0, 0 )
is.myShipOrgPos						= Vec2( 0, 0 )
is.myMissileOrgPos					= Vec2( 0, 0 )
is.nameMetaText						= nil
is.minSize							= 0
is.maxSize							= 0
is.nameEffect						= nil
is.aimBorderEffects					= {}
is.myShipEffect						= nil
is.myMissileEffect					= nil
is.lockUsEffects					= {}
is.distEffect						= nil
is.icoEffect						= nil
is.questIcoEffect					= nil
is.hpShipEffect						= nil
is.hpTurretEffect 					= nil
is.shieldEffect						= nil
is.updateFuncs						= {}
is.distLayer						= nil
is.hpBarWnd							= nil
is.shieldBarWnd						= nil
is.uiHandle							= UI.INVALID_UI_HANDLE
is.bAimBorderVisible				= false
is.bLockUsVisible					= false
is.bMyShipVisible					= false
is.bMyMissileVisible				= false
is.bIcoVisible						= false
is.bQuestIcoVisible					= false
is.bNameVisible						= false
is.bDistanceVisible					= false
is.dist								= -1
is.distBackColor					= -1
is.bVisibleByLeaderVisible			= false
is.bDamageRecordsVisible			= false
is.nameAnimId						= -1
is.aimBorderAnimId					= -1
is.icoAnimId						= -1
is.lockUsAnimId						= -1
is.distEffectAnimId					= -1
is.fnNeedDist						= {}
is.mainAnimTime						= -1
is.bHpVisible						= false
is.bShieldVisible					= false
is.activeShieldId					= -1
is.timer							= -1

is.nameBackColor =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= 0,
	[ UI.gameObjColorSchemes.ENEMY ]		= 0,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= 0,
	[ UI.gameObjColorSchemes.SQUAD ]		= 0,
	[ UI.gameObjColorSchemes.ME ]			= 0,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= 0,
}

is.distBackColors =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= 0,
	[ UI.gameObjColorSchemes.ENEMY ]		= 0,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= 0,
	[ UI.gameObjColorSchemes.SQUAD ]		= 0,
	[ UI.gameObjColorSchemes.ME ]			= 0,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= 0,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideShip:F_PostLoad()

	UI.HudObjectMarkWnd.F_PostLoad( self )

	if self == UI.HudObjectMarkWnd_InsideShip then

		for objTypeName, objType in pairs( UI.HudObjectsMarksWnd.objTypes ) do

			local fnName = string.format( "Update_%s", objTypeName )
			local fn = self[ fnName ]

			if fn then
				self.updateFuncs[ objType ] = fn
			end

		end

    	self.fnNeedDist =
    	{
    		[ UI.HudObjectsMarksWnd.objTypes.DEFAULT ]				= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.PLAYER ]				= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.VITAL_POINT ]			= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.BOMB ]					= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.BOMB_SITE ]			= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.TARGET ]				= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.LOOT ]					= self.NeedDist_LOOT,
    		[ UI.HudObjectsMarksWnd.objTypes.JUMP_GATE ]			= self.NeedDist_JUMP_GATE,
    		[ UI.HudObjectsMarksWnd.objTypes.MISSILE ]				= self.NeedDist_default,
    		[ UI.HudObjectsMarksWnd.objTypes.CLANSHIP_VITAL_POINT ]	= self.NeedDist_default,
    	}

	end 

	if self:IsPrototype() then
		return
	end

	self.uiHandle = self:GetUiHandle()

	if self.mainEffect then

		self.mainEffect:Update( 0 )

		self.damageRecordsStart_FULL		= self.mainEffect:GetObjPos( self.effectInfo.main.damageRecordsStartObjName_FULL )
		self.damageRecordsStart_BRIEF		= self.mainEffect:GetObjPos( self.effectInfo.main.damageRecordsStartObjName_BRIEF )

		self.centerPos = self.mainEffect:GetObjPos( self.effectInfo.main.centerObjName )

		self.minSize = self.mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y
		self.maxSize = self.mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y		
	
	end

	self.aimBorderEffects = {}
	for idx = 1, 4 do
		local aimBorderEffect = UI:GetEffectFromLayer( self, self.layers.AIM_BORDER_1_EFFECT + idx - 1 )
		self.aimBorderEffects[ idx ] = aimBorderEffect
	end

	local aimBorderEffect = self.aimBorderEffects[ 1 ]
	if aimBorderEffect then

		self.animId_aimBorder_inRange = {}
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.FRIEND ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.friendInRange )
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.ENEMY ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.enemyInRange )
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.NEUTRAL ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.neutralInRange )
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.SQUAD ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.mySquadInRange )
		self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.ME ]			= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.meInRange )
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.agressiveInRange )
        self.animId_aimBorder_inRange[ UI.gameObjColorSchemes.ALIEN ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.alienInRange )

		self.animId_aimBorder_outRange = {}
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.FRIEND ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.friendOutRange )
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.ENEMY ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.enemyOutRange )
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.NEUTRAL ]	= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.neutralOutRange )
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.SQUAD ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.mySquadOutRange )
		self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.ME ]			= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.meOutRange )
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.agressiveOutRange )
        self.animId_aimBorder_outRange[ UI.gameObjColorSchemes.ALIEN ]		= aimBorderEffect:GetAnimationId( self.effectInfo.aimBorder.alienOutRange )

	end

	self.myShipEffect = UI:GetEffectFromLayer( self, self.layers.MY_SHIP_EFFECT )
	if self.myShipEffect then

		self.myShipOrgPos = self.myShipEffect:GetObjPos( self.effectInfo.myShip.orgObjName )

		local pos = UI:Vec2( self.centerPos.x - self.myShipOrgPos.x, self.centerPos.y - self.myShipOrgPos.y )
		self.myShipEffect:SetPos( pos )

	end

	self.myMissileEffect = UI:GetEffectFromLayer( self, self.layers.MY_MISSILE_EFFECT )
	if self.myMissileEffect then

		self.myMissileOrgPos = self.myMissileEffect:GetObjPos( self.effectInfo.myMissile.orgObjName )

		local pos = UI:Vec2( self.centerPos.x - self.myMissileOrgPos.x, self.centerPos.y - self.myMissileOrgPos.y )
		self.myMissileEffect:SetPos( pos )

	end

	self.nameEffect = UI:GetEffectFromLayer( self, self.layers.NAME_EFFECT )
	if self.nameEffect then

		self.animId_name_inRange = {}
        self.animId_name_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.friendInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.enemyInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.neutralInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.SQUAD ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.mySquadInRange )
		self.animId_name_inRange[ UI.gameObjColorSchemes.ME ]			= self.nameEffect:GetAnimationId( self.effectInfo.name.meInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.nameEffect:GetAnimationId( self.effectInfo.name.agressiveInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.ALIEN ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.alienInRange )

		self.animId_name_outRange = {}
        self.animId_name_outRange[ UI.gameObjColorSchemes.FRIEND ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.friendOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.enemyOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.neutralOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.SQUAD ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.mySquadOutRange )
		self.animId_name_outRange[ UI.gameObjColorSchemes.ME ]			= self.nameEffect:GetAnimationId( self.effectInfo.name.meOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.nameEffect:GetAnimationId( self.effectInfo.name.agressiveOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.ALIEN ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.alienOutRange )

		self.nameBackColor = {}
    	self.nameBackColor[ UI.gameObjColorSchemes.FRIEND ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorFriendLocator )
    	self.nameBackColor[ UI.gameObjColorSchemes.ENEMY ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorEnemyLocator )
    	self.nameBackColor[ UI.gameObjColorSchemes.NEUTRAL ]			= 0	-- нет цвета (черный по умолчанию)
    	self.nameBackColor[ UI.gameObjColorSchemes.SQUAD ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorSquadLocator )
		self.nameBackColor[ UI.gameObjColorSchemes.ME ]					= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorMeLocator )
    	self.nameBackColor[ UI.gameObjColorSchemes.AGGRESSIVE ]			= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorAgressiveLocator )
    	self.nameBackColor[ UI.gameObjColorSchemes.ALIEN ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorAlienLocator )

	end	

	self.lockUsEffects = {}
	for idx = 1, 4 do
		local lockUsEffect = UI:GetEffectFromLayer( self, self.layers.LOCK_US_1_EFFECT + idx - 1 )
		self.lockUsEffects[ idx ] = lockUsEffect
	end

	local lockUsEffect = self.lockUsEffects[ 1 ]
	if lockUsEffect then

		self.animId_lockUs_inRange = {}
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.FRIEND ]		= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.friendInRange )
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.ENEMY ]		= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.enemyInRange )
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.NEUTRAL ]	= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.neutralInRange )
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.SQUAD ]		= -1	-- нет анимации
		self.animId_lockUs_inRange[ UI.gameObjColorSchemes.ME ]			= -1	-- нет анимации
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.agressiveInRange )
        self.animId_lockUs_inRange[ UI.gameObjColorSchemes.ALIEN ]		= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.alienInRange )

		self.animId_lockUs_outRange = {}
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.FRIEND ]	= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.friendOutRange )
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.ENEMY ]		= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.enemyOutRange )
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.NEUTRAL ]	= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.neutralOutRange )
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.SQUAD ]		= -1	-- нет анимации
		self.animId_lockUs_outRange[ UI.gameObjColorSchemes.ME ]		= -1	-- нет анимации
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.AGGRESSIVE ]= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.agressiveOutRange )
        self.animId_lockUs_outRange[ UI.gameObjColorSchemes.ALIEN ]		= lockUsEffect:GetAnimationId( self.effectInfo.lockUs.alienOutRange )

	end

	self.distEffect = UI:GetEffectFromLayer( self, self.layers.DISTANCE_EFFECT )
	if self.distEffect then

		self.animId_dist_inRange = {}
        self.animId_dist_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.friendInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.enemyInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.neutralInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.SQUAD ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.mySquadInRange )
		self.animId_dist_inRange[ UI.gameObjColorSchemes.ME ]			= self.distEffect:GetAnimationId( self.effectInfo.dist.meInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.distEffect:GetAnimationId( self.effectInfo.dist.agressiveInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.ALIEN ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.alienInRange )

		self.animId_dist_outRange = {}
        self.animId_dist_outRange[ UI.gameObjColorSchemes.FRIEND ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.friendOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.enemyOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.neutralOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.SQUAD ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.mySquadOutRange )
		self.animId_dist_outRange[ UI.gameObjColorSchemes.ME ]			= self.distEffect:GetAnimationId( self.effectInfo.dist.meOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.distEffect:GetAnimationId( self.effectInfo.dist.agressiveOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.ALIEN ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.alienOutRange )

		self.distBackColors = {}
    	self.distBackColors[ UI.gameObjColorSchemes.FRIEND ]			= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorFriendLocator )
    	self.distBackColors[ UI.gameObjColorSchemes.ENEMY ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorEnemyLocator )
    	self.distBackColors[ UI.gameObjColorSchemes.NEUTRAL ]			= 0	-- нет цвета (черный по умолчанию)
    	self.distBackColors[ UI.gameObjColorSchemes.SQUAD ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorSquadLocator )
		self.distBackColors[ UI.gameObjColorSchemes.ME ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorMeLocator )
    	self.distBackColors[ UI.gameObjColorSchemes.AGGRESSIVE ]		= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorAgressiveLocator )
    	self.distBackColors[ UI.gameObjColorSchemes.ALIEN ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorAlienLocator )

	end

	self.distLayer = self:GetLayer( UI.LAYER_TEXT, self.layers.DISTANCE, 0 )

	self.icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if self.icoEffect then

		self.animId_ico_inRange = {}
        self.animId_ico_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.friendInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.ENEMY ]			= self.icoEffect:GetAnimationId( self.effectInfo.ico.enemyInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.neutralInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.SQUAD ]			= self.icoEffect:GetAnimationId( self.effectInfo.ico.mySquadInRange )
		self.animId_ico_inRange[ UI.gameObjColorSchemes.ME ]			= self.icoEffect:GetAnimationId( self.effectInfo.ico.meInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.icoEffect:GetAnimationId( self.effectInfo.ico.agressiveInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.ALIEN ]			= self.icoEffect:GetAnimationId( self.effectInfo.ico.alienInRange )

		self.animId_ico_outRange = {}
        self.animId_ico_outRange[ UI.gameObjColorSchemes.FRIEND ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.friendOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.enemyOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.NEUTRAL ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.neutralOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.SQUAD ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.mySquadOutRange )
		self.animId_ico_outRange[ UI.gameObjColorSchemes.ME ]			= self.icoEffect:GetAnimationId( self.effectInfo.ico.meOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.icoEffect:GetAnimationId( self.effectInfo.ico.agressiveOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.ALIEN ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.alienOutRange )

		self.animId_ico_quest = self.icoEffect:GetAnimationId( self.effectInfo.ico.quest )

	end

	self.questIcoEffect = UI:GetEffectFromLayer( self, self.layers.QUEST_ICO_EFFECT )

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 
	self.nameMetaText:SetPixelSnap( false )

	self.hpBarWnd		= UI:CreateChildWnd( self, UI.HudObjectMarkWnd_InsideShip_BarWnd, "hp" )
	self.shieldBarWnd	= UI:CreateChildWnd( self, UI.HudObjectMarkWnd_InsideShip_BarWnd, "shield" )

	self.hpBarWnd:Setup( UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.HP )
	self.shieldBarWnd:Setup( UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.SHIELD )

    self.nameAnimId			= self.nameEffect:GetCurAnimationId()
    self.aimBorderAnimId	= self.aimBorderEffects[ 1 ]:GetCurAnimationId()
    self.icoAnimId			= self.icoEffect:GetCurAnimationId()
    self.lockUsAnimId		= self.lockUsEffects[ 1 ]:GetCurAnimationId()
    self.distEffectAnimId	= self.distEffect:GetCurAnimationId()

	self:Reset()

end


--
function UI.HudObjectMarkWnd_InsideShip:F_Shutdown()

	if not self:IsPrototype() then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_PLAYER( oldMode )

	self:UpdateName( oldMode )
	self:UpdateAimBorders( oldMode )
	self:UpdateLockUs( oldMode )
	self:UpdateDist( oldMode )		

	dummy =
		(
			self.mark.data.bFirstUpdate
			or self.mode ~= oldMode
			or self.bHpVisible
		)
			and self:UpdateHp( oldMode )

	dummy =
		(
			self.mark.data.bFirstUpdate
			or self.mode ~= oldMode
			or self.bShieldVisible
		)
			and self:UpdateShield( oldMode )
	
	self:UpdateVisibleOnlyByLeader( oldMode )
	self:UpdateDamageRecords( oldMode )
   	self:UpdateMyShipIco( oldMode )
	self:UpdateMainAnimation( oldMode )	-- необходимо вызывать после UpdateAimBorders()

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_MISSILE( oldMode )

	self:UpdateVisibleOnlyByLeader(oldMode )
	self:UpdateDamageRecords( oldMode )
	self:UpdateMissileIco( oldMode )

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_DEFAULT( oldMode )

	self:UpdateName( oldMode )
	self:UpdateAimBorders( oldMode )

	dummy =
		self.mark.bIsShip
			and self:UpdateLockUs( oldMode )

	self:UpdateDist( oldMode )

	dummy =
		(
			(
				self.mark.bDamagable
				and not self.mark.bHideHpBar
			)
			and
			(
				self.mark.data.bFirstUpdate
				or self.mode ~= oldMode
				or self.bHpVisible
			)
		)
			and self:UpdateHp( oldMode )

	dummy =
		(
			(
				self.mark.bDamagable
				and not self.mark.bHideHpBar
			)
			and
			(
				self.mark.bIsShip
				or self.mark.bIsCargoShip
			)
			and
			(
				self.mark.data.bFirstUpdate
				or self.mode ~= oldMode
				or self.bShieldVisible
			)
		)
			and self:UpdateShield( oldMode )

	self:UpdateVisibleOnlyByLeader( oldMode )
	self:UpdateDamageRecords( oldMode )
	self:UpdateMainAnimation( oldMode )	-- необходимо вызывать после UpdateAimBorders()

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_BOMB( oldMode )

	self:UpdateDist( oldMode )
	self:UpdateBombIco( oldMode )
	self:UpdateTimer( oldMode )

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_LOOT( oldMode )

	self:UpdateName( oldMode )
	self:UpdateDist( oldMode )
	self:UpdateLootIco( oldMode )

end


--
function UI.HudObjectMarkWnd_InsideShip:Update_JUMP_GATE( oldMode )

	self:UpdateName( oldMode )
	self:UpdateDist( oldMode )
	self:UpdateJumpGateIco( oldMode )
	--self:UpdateQuestIco( oldMode )
	self:UpdateIco( oldMode )

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMode()
	
	self.mode = -1

	self.mode =
		(
			self.mode == -1
			and self.mark.bDead
		)
			and self.modes.DEAD
			or self.mode

	self.mode =
		(
			self.mode == -1
			and ( UI.HudObjectsMarksWnd:IsMarksFullBindNameOn() or self.mark == UI.HudObjectsMarksWnd.markUnderMouse )
		)
			and self.modes.FULL
			or self.mode

	self.mode =
		(
			self.mode == -1
			and self.mark.data.isLock 
			and not self.mark.data.isLocking
		)
			and self.modes.LOCK
			or self.mode

	self.mode =
		(
			self.mode == -1
			and self.mark.visibilityType == UI.HudObjectsMarksWnd.visibilityTypes.MINOR
			--and self.mark.quests[ 1 ] == nil
			and ( self.mark.quests[ 1 ] == nil and self.mark.adventures[ 1 ] == nil )
			and ( self.mark.data.dist == -1 or self.mark.data.dist > UI.HudObjectsMarksWnd.MINOR_OBJECTS_DIST )
		)
			and self.modes.DAMAGE_ONLY
			or self.mode

	self.mode =
		(
			self.mode == -1
			and ( self.mark.objType == UI.HudObjectsMarksWnd.objTypes.BOMB or self.mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE )
		)
			and self.modes.FULL
			or self.mode

	self.mode =
		self.mode == -1
			and self.modes.BRIEF
			or self.mode

	self.bCustomizableMode = self.mode == self.modes.FULL or self.mode == self.modes.BRIEF or self.mode == self.modes.LOCK

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateName( oldMode )

	local mark = self.mark

	-- видимость

	local bNameVisible		= false
	local bRoleVisible		= false
	local bSpecIcoVisible	= false
	local bRankVisible		= false
	local bShipNameVisible	= false
	local bQuestVisible		= false
	local bAdventureVisible = false

	local bVisible = self.bNameVisible
	local bOldVisible = bVisible

	if( mark.data.bFirstUpdate or mark.data.bNameChanged or mark.data.bColorSchemeChanged or self.mode ~= oldMode ) and self.bCustomizableMode then

		local marksElements = self.optionsSrc.marksElements

    	-- видимость имени

    	local bNameApplicable = true
    	if bNameApplicable then

			if mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then
				bNameVisible = true

			elseif mark.objType == UI.HudObjectsMarksWnd.objTypes.LOOT then
				bNameVisible = self.mode ~= self.modes.DAMAGE_ONLY

			else
	    		bNameVisible = marksElements[ mark.data.bAlly ][ self.mode ].isName
			end

    	end

    	-- видимость роли

    	local bRoleApplicable = mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER
    	if bRoleApplicable then
    		bRoleVisible = marksElements[ mark.data.bAlly ][ self.mode ].isRole
    	end

    	-- видимость спец.иконки

    	local bSpecIcoApplicable =
			(
    			mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER
    			and
    			(
    				mark.data.bLeader
    				or mark.data.bBomber
    				or mark.data.bAggressor
    				or mark.data.bCriminal
    			)
			)
			or
			(
				mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT
				and mark.icoName ~= ""
			)
			or
			(
				(
					mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER
					or mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT
				)
				and mark.bEventAgent
			)

    	if bSpecIcoApplicable then
        	bSpecIcoVisible = marksElements[ mark.data.bAlly ][ self.mode ].isSpecIco
    	end

    	-- видимость ранга

    	local bRankApplicable = mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER and mark.bIsShip
    	if bRankApplicable then
    		bRankVisible = marksElements[ mark.data.bAlly ][ self.mode ].isRank
    	end

    	-- видимость имени корабля

    	local bShipNameApplicable = mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER and mark.bIsShip
    	if bShipNameApplicable then
    		bShipNameVisible = marksElements[ mark.data.bAlly ][ self.mode ].isShipName
    	end


		-- видимость иконки квеста

    	local bQuestApplicable = mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT or mark.objType == UI.HudObjectsMarksWnd.objTypes.LOOT or mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER
    	if bQuestApplicable then
    		bQuestVisible = mark.quests[ 1 ] ~= nil
			bAdventureVisible = mark.adventures[ 1 ] ~= nil
    	end

		bVisible = bNameVisible or bRoleVisible or bSpecIcoVisible or bRankVisible or bShipNameVisible or bQuestVisible or bAdventureVisible

	end

	if bVisible ~= bOldVisible then

		self:SetLayerVisible( bVisible, self.layers.NAME_EFFECT )
		self:SetLayerVisible( bVisible, self.layers.NAME )
		self.bNameVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.NAME_EFFECT, self.effectInfo.main.nameLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
			self.nameMetaText:UpdateEffectsPos()
			self.nameMetaText:UpdateWindowsPos()
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.NAME_EFFECT, "" )
		end

	end

	if self.mode == self.modes.DEAD then
		return
	end


	-- анимация - определяет цвет, который зависит от цветовой схемы и расстояния

	if bVisible then

    	local animId	= -1
    	local backColor	= 0

    	if mark.data.isInFireRange then
    		animId		= self.animId_name_inRange[ mark.data.colorScheme ] or -1
    		backColor	= self.nameBackColor[ mark.data.colorScheme ] or 0
    	else
    		animId		= self.animId_name_outRange[ mark.data.colorScheme ] or -1
    	end

    	if animId ~= self.nameAnimId then
    		self.nameEffect:StartAnimationById( animId )
			self.nameAnimId = animId
    	end

    	self.nameMetaText:SetBackColor( backColor, true )

	end


	-- собственно имя (может включать разные иконки)

	if mark.data.bFirstUpdate or mark.data.bNameChanged or mark.data.bColorSchemeChanged or self.mode ~= oldMode then

		self:ResetNameMetaText()

    	local name = ""  

		-- спец.статус (капитан, бомбер, босс и т.п.)
		
		if bSpecIcoVisible then

			local strSpecStatus = ""

	    	if mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER then

        		if mark.data.bLeader then
        			strSpecStatus = UI:GetSentinelLeaderIcoMetaString( mark.data.colorScheme, false )

        		elseif mark.data.bBomber then
        			strSpecStatus = UI:GetBomberIcoMetaString( mark.data.colorScheme, false )

				elseif mark.bEventAgent then
					strSpecStatus = UI:GetEventAgentIcoMetaString( mark.data.colorScheme, false )
        		end

				if not mark.bEventAgent then

    				if mark.data.bAggressor then
    					local strAggressor = UI:GetAggressorIcoMetaString( mark.data.colorScheme, false )
    					strSpecStatus = string.format( "%s%s", strSpecStatus, strAggressor )
    				end

    				if mark.data.bCriminal then
    					local strCriminal = UI:GetCriminalIcoMetaString( mark.data.colorScheme, false )
    					strSpecStatus = string.format( "%s%s", strSpecStatus, strCriminal )
    				end

				end

			elseif mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT then

				if mark.icoName ~= "" then
    	        	strSpecStatus = UI:GetHudIcoMetaString( mark.icoName, mark.data.colorScheme, false )

				elseif mark.bEventAgent then
					strSpecStatus = UI:GetEventAgentIcoMetaString( mark.data.colorScheme, false )
				end

			end

			if strSpecStatus ~= "" then
				name = string.format( "%s%s", name, strSpecStatus )
			end

		end

		-- имя игрока/название объекта

		if bNameVisible then

			local strObjName = ""

	    	if mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER then

				if mark.previewName then
					strObjName = mark.previewName
				else        		
            	    strObjName = UI:MakePlayerNameById( mark.playerId, true, true, false )
				end

			elseif mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then

				if mark.ent then

					local bLeadToAnotherZone = not mark.ent:IsDockLocation()
					if bLeadToAnotherZone then

						local zoneId = mark.ent:GetTargetZoneReal()
						local zoneName = UI:ZoneId2Name( zoneId )

						local strZone = UI:Zone2Str( zoneName )
						strObjName = UI:GetStringByName( "hud_jumpGateDestination_otherZone" )
						strObjName = string.gsub( strObjName, "%$zone%$", strZone )							

					else

						local curZoneId = _G.CL_GetCurrentSpaceZoneId()
						local curZoneName = UI:ZoneId2Name( curZoneId )

						local strSation = UI:ZoneStation2Str( curZoneName )  
						strObjName = UI:GetStringByName( "hud_jumpGateDestination_thisZone" )
						strObjName = string.gsub( strObjName, "%$station%$", strSation )

					end

				end

			elseif mark.objType == UI.HudObjectsMarksWnd.objTypes.LOOT then
				strObjName = UI:GetEntityLocalizedNameByDef( mark.defName, false, false, true, false )

			else
    			strObjName = UI:GetBotName( mark.entId )
			end

			if strObjName ~= "" then
				name = string.format( "%s%s", name, strObjName )
			end

		end    

		-- имя корабля

		if bShipNameVisible then

			local strShipName = UI:GetEntityLocalizedNameByDef( mark.defName, false, false, false, false )
			if strShipName ~= "" then
				name = string.format( "%s%s%s", name, name ~= "" and "|" or "", strShipName )
			end

		end
		

		-- иконка квеста, ранг и роль, иконка нахождения в моей зоне уязвимости в отдельной строке

		if bQuestVisible or bRankVisible or bRoleVisible or bAdventureVisible then

			local secondString = ""

			-- иконка квеста

    		if bQuestVisible then

				local hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( mark )
				local strQuest = UI:QuestIco2MetaString( hTex )

    			if strQuest ~= "" then
    				secondString = string.format( "%s%s", secondString, strQuest )
    			end

			elseif bAdventureVisible then

				local hTex = UI.HudObjectsMarksWnd:GetMarkAdventureIco( mark )
				local strAdventures = UI:QuestIco2MetaString( hTex )

				if strAdventures ~= "" then
					secondString = string.format( "%s%s", secondString, strAdventures )
				end

			end

			-- ранг (в бесконечном пве также уровень баффов игроков)

    		if bRankVisible then

    			local rank = UI:GetShipRank( mark.defName )
    			local strRank = tostring( rank )
				
				-- уровень баффов для игроков в бесконечном пве
				if _G.CL_IsUnlimPve() and mark.playerId and mark.playerId ~= -1 then
					
					local level1 = _G.CL_GetUnlimPvePlayerLevel( mark.playerId, 1 )
					local level2 = _G.CL_GetUnlimPvePlayerLevel( mark.playerId, 2 )
					strRank = string.format( "%s (%d/%d)", strRank, level1, level2 )
				
				end

    			if strRank ~= "" then
    				secondString = string.format( "%s%s", secondString, strRank )
    			end

    		end

    		-- роль и иконка нахождения в моей зоне уязвимости (под ролью)

    		if bRoleVisible then

    			local strRole = ""

	    		if mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER then

        			local role = UI:GetItemRole( mark.defName )
        			if role ~= -1 then
        				strRole = self:GetRoleIcoMetaString( role, mark.data.colorScheme, false, mark.data.bInWeaknessRadius )
        			end

				end

    			if strRole ~= "" then
    				secondString = string.format( "%s%s", secondString, strRole )
    			end

    		end

			if secondString ~= "" then
    			name = string.format( "%s%s%s", name, name ~= "" and "|" or "", secondString )
			end

		end

		self.nameMetaText.color = self:GetColor( self.layers.NAME )
    	self.nameMetaText:SetText( name, true )

	end

	if bVisible then

		local color = self:GetColor( self.layers.NAME )
		if color ~= self.nameMetaText.color then
    		self.nameMetaText:SetColor( color )
		end

	end

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateAimBorders( oldMode )

	-- видимость 

	local bVisible =
		not self.mark.data.bMyShip
		and not( ( self.mark.data.bBehindObstacle or not self.mark.data.isInFireRange ) and self.optionsSrc.bHideFramesOutOfShot )
		and self.bCustomizableMode
		and self.optionsSrc.marksElements[ self.mark.data.bAlly ][ self.mode ].isFrame
		and not self.mark.data.bCloseDistanceMode

	dymmy =
		self.bAimBorderVisible ~= bVisible
			and self:SetAimBordersVisible( bVisible )

	-- анимация - зависит от цветовой схемы и расстояния

	local animId =
		bVisible
			and
			(
				self.mark.data.isInFireRange
					and ( self.animId_aimBorder_inRange[ self.mark.data.colorScheme ] or -1 )
					or ( self.animId_aimBorder_outRange[ self.mark.data.colorScheme ] or -1 )
			)
			or -1
			
	dymmy =
		( bVisible and animId ~= self.aimBorderAnimId )
			and self:StartAimBordersAnimation( animId )

end


--
function UI.HudObjectMarkWnd_InsideShip:SetAimBordersVisible( bVisible )

	for idx = 1, 4 do

		local layer = self.layers.AIM_BORDER_1_EFFECT + idx - 1

		self:SetLayerVisible( bVisible, layer )

		dymmy =
			bVisible
				and ( self.mainEffect:LinkLayer( self.uiHandle, layer, string.format( "%s%d", self.effectInfo.main.aimBorderLocatorPrefix, idx ), UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
				or self.mainEffect:UnlinkLayer( self.uiHandle, layer, "" )
	end

	self.bAimBorderVisible = bVisible

end


--
function UI.HudObjectMarkWnd_InsideShip:StartAimBordersAnimation( animId )

	for idx = 1, 4 do
		self.aimBorderEffects[ idx ]:StartAnimationById( animId )
	end

	self.aimBorderAnimId = animId

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMyShipIco( oldMode )

	-- видимость

	local bVisible = self.mark.data.bMyShip and ( self.mode == self.modes.FULL or self.mode == self.modes.BRIEF or self.mode == self.modes.LOCK )

	if bVisible ~= self.bMyShipVisible then

		self:SetLayerVisible( bVisible, self.layers.MY_SHIP_EFFECT )
		self.bMyShipVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.MY_SHIP_EFFECT, self.effectInfo.main.myShipLocator, UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.MY_SHIP_EFFECT, "" )
		end

	end

	-- угол поворота

	dummy =
		( bVisible and self.mark.ent ~= nil )
			and self:UpdateMyShipIcoRot()

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMyShipIcoRot()

	local worldDir = UI:Vec3( _G.GetEntityMovementDir3( self.mark.ent ) )
	local viewDir_x, viewDir_y, viewDir_z = _G.World2View( worldDir )

	local angle = -( math.atan2( viewDir_y, viewDir_x ) - self.MY_SHIP_ORIGINAL_ANGLE )

    self.myShipEffect:SetRotation( angle, self.myShipOrgPos )

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMissileIco( oldMode )

	-- видимость

	local bVisible = self.mode == self.modes.FULL or self.mode == self.modes.BRIEF or self.mode == self.modes.LOCK

	if bVisible ~= self.bMyMissileVisible then

		self:SetLayerVisible( bVisible, self.layers.MY_MISSILE_EFFECT )
		self.bMyMissileVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.MY_MISSILE_EFFECT, self.effectInfo.main.myLissileLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.MY_MISSILE_EFFECT, "" )
		end

	end

	-- угол поворота

	dummy =
		( bVisible and self.mark.ent ~= nil )
			and self:UpdateMissileIcoRot()

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMissileIcoRot()

	local worldDir = UI:Vec3( _G.GetEntityMovementDir3( self.mark.ent ) )
	local viewDir_x, viewDir_y, viewDir_z = _G.World2View( worldDir )

	local angle = -( math.atan2( viewDir_y, viewDir_x ) - self.MY_MISSILE_ORIGINAL_ANGLE )

    self.myMissileEffect:SetRotation( angle, self.myMissileOrgPos )

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateBombIco( oldMode )

	-- видимость

	local bVisible = self.mode ~= self.modes.DAMAGE_ONLY

	if bVisible ~= self.bIcoVisible then

		self:SetLayerVisible( bVisible, self.layers.ICO_EFFECT )
		self.bIcoVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.ICO_EFFECT, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.ICO_EFFECT, "" )
		end

	end

	if self.mark.data.bFirstUpdate then

		-- текстура

		local hTex = UI:GetTex( "bomb" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, hTex )

		-- текстура-обводка

		local hTexOutline = UI:GetTex( "bomb_w" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoNameOutline, hTexOutline )	

	end


	if bVisible then

		-- анимация - зависит от цветовой схемы и расстояния

		local animId = self.mark.data.isInFireRange and self.animId_ico_inRange[ self.mark.data.colorScheme ] or self.animId_ico_outRange[ self.mark.data.colorScheme ]
		if animId ~= self.icoAnimId then
			self.icoEffect:StartAnimationById( animId )
			self.icoAnimId = animId
		end

	end

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateJumpGateIco( oldMode )

	-- видимость

	local bVisible = self.mode ~= self.modes.DAMAGE_ONLY

	if bVisible ~= self.bIcoVisible then

		self:SetLayerVisible( bVisible, self.layers.ICO_EFFECT )
		self.bIcoVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.ICO_EFFECT, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.ICO_EFFECT, "" )
		end

	end

	if self.mark.data.bFirstUpdate then

		-- текстура

		local hTex = UI:GetTex( "warpgate" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, hTex )

		-- текстура-обводка

		local hTexOutline = UI:GetTex( "warpgate_w" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoNameOutline, hTexOutline )	

	end

	if bVisible then

		-- анимация - зависит от цветовой схемы и расстояния

		local animId = self.mark.data.isInFireRange and self.animId_ico_inRange[ self.mark.data.colorScheme ] or self.animId_ico_outRange[ self.mark.data.colorScheme ]
		if animId ~= self.icoAnimId then
			self.icoEffect:StartAnimationById( animId )
			self.icoAnimId = animId
		end

	end

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateLootIco( oldMode )

	-- видимость

	local bVisible = self.mode ~= self.modes.DAMAGE_ONLY

	if bVisible ~= self.bIcoVisible then

		self:SetLayerVisible( bVisible, self.layers.ICO_EFFECT )
		self.bIcoVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.ICO_EFFECT, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.ICO_EFFECT, "" )
		end

	end

	if self.mark.data.bFirstUpdate then

		-- текстура

		local hTex = UI:GetTex( "loot" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, hTex )

		-- текстура-обводка

		local hTexOutline = UI:GetTex( "loot_w" )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoNameOutline, hTexOutline )	

	end

	if bVisible then

		-- анимация - зависит от цветовой схемы и расстояния

		local animId = self.mark.data.isInFireRange and self.animId_ico_inRange[ self.mark.data.colorScheme ] or self.animId_ico_outRange[ self.mark.data.colorScheme ]
		if animId ~= self.icoAnimId then
			self.icoEffect:StartAnimationById( animId )
			self.icoAnimId = animId
		end

	end

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateLockUs( oldMode )

	-- видимость

	local bVisible =
		not( ( self.mark.data.bBehindObstacle or not self.mark.data.isInFireRange ) and self.optionsSrc.bHideFramesOutOfShot )
		and self.bCustomizableMode
		and self.optionsSrc.marksElements[ self.mark.data.bAlly ][ self.mode ].isFrame
		and ( self.mark.ent and _G.CL_IsShipLockedMe( self.mark.ent ) )

	dummy =
		self.bLockUsVisible ~= bVisible
			and self:SetLockUsVisible( bVisible )

	-- анимация - зависит от цветовой схемы и расстояния

	local animId =
		bVisible
			and
			(
				self.mark.data.isInFireRange
					and ( self.animId_lockUs_inRange[ self.mark.data.colorScheme ] or -1 )
					or ( self.animId_lockUs_outRange[ self.mark.data.colorScheme ] or -1 )
			)
			or -1

	dummy =
		( bVisible and animId ~= self.lockUsAnimId )
			and self:StartLockUsAnimation( animId )

end


--
function UI.HudObjectMarkWnd_InsideShip:SetLockUsVisible( bVisible )

	for idx = 1, 4 do

		local layer = self.layers.LOCK_US_1_EFFECT + idx - 1

		self:SetLayerVisible( bVisible, layer )

		dummy =
			bVisible
				and ( self.mainEffect:LinkLayer( self.uiHandle, layer, string.format( "%s%d", self.effectInfo.main.lockUsLocatorPrefix, idx ), UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
				or self.mainEffect:UnlinkLayer( self.uiHandle, layer, "" )

	end

	self.bLockUsVisible = bVisible

end


--
function UI.HudObjectMarkWnd_InsideShip:StartLockUsAnimation( animId )

	for idx = 1, 4 do
		self.lockUsEffects[ idx ]:StartAnimationById( animId )
	end

	self.lockUsAnimId = animId

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateDist( oldMode )

	local bVisible = self.fnNeedDist[ self.mark.objType ]( self )

	dummy =
		( bVisible ~= self.bDistanceVisible )
			and self:SetDistVisible( bVisible )

	dummy =
		bVisible
			and self:UpdateDistControls()	

end


--
function UI.HudObjectMarkWnd_InsideShip:NeedDist_JUMP_GATE()

	return self.mark.data.dist >= 0

end


--
function UI.HudObjectMarkWnd_InsideShip:NeedDist_LOOT()

	return
		self.mark.data.dist >= 0	
		and self.mode ~= self.modes.DAMAGE_ONLY

end


--
function UI.HudObjectMarkWnd_InsideShip:NeedDist_default()

	return
		self.mark.data.dist >= 0	
		and not self.mark.data.bMyShip
		and self.bCustomizableMode
		and self.optionsSrc.marksElements[ self.mark.data.bAlly ][ self.mode ].isDist

end


--
function UI.HudObjectMarkWnd_InsideShip:SetDistVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.DISTANCE_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.DISTANCE )

	dummy =
		bVisible
			and ( self.mainEffect:LinkLayer( self.uiHandle, self.layers.DISTANCE_EFFECT, self.effectInfo.main.distanceLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
			or self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.DISTANCE_EFFECT, "" )

	self.bDistanceVisible = bVisible

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateDistControls()

	-- значение

	local dist = math.floor( self.mark.data.dist * 10 )

	dummy =
		dist ~= self.dist
			and self:SetText( string.format( "%d %s", dist, self.strM ), self.layers.DISTANCE )

	self.dist = dist


	-- анимация - зависит цветовой схемы и расстояния

	local animId =
		self.mark.data.isInFireRange
			and ( self.animId_dist_inRange[ self.mark.data.colorScheme ] or -1 )
			or ( self.animId_dist_outRange[ self.mark.data.colorScheme ] or -1 )

	local backColor =
		self.mark.data.isInFireRange
			and ( self.distBackColors[ self.mark.data.colorScheme ] or 0 )
			or 0
		
	dummy =
		( animId ~= self.distEffectAnimId )
			and self.distEffect:StartAnimationById( animId )

	self.distEffectAnimId = animId

	dummy = 
		backColor ~= self.distBackColor
			and self.distLayer:SetBackColor( backColor )

	self.distBackColor = backColor

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateHp( oldMode )

	-- видимость

	local bVisible =
		self.bCustomizableMode
		and self.optionsSrc.marksElements[ self.mark.data.bAlly ][ self.mode ].isHpShield

	dummy =
		( self.bHpVisible and not bVisible )
			and self:RemoveControl( self.hpBarWnd, self.mainEffect )

	dummy =
		( not self.bHpVisible and bVisible )
			and self:AddControl( self.hpBarWnd, self.mainEffect, ( self.mark.bIsShip or self.mark.bIsCargoShip ) and self.effectInfo.main.hpLocatorHasShield or self.effectInfo.main.hpLocatorNoShield )

	self.bHpVisible = bVisible

	-- риски

	dummy =
		self.mark.data.bFirstUpdate
    		and self.hpBarWnd:SetScalable( self.optionsSrc.bScalableHealthBars )

	-- значение

	dummy =
		bVisible
			and self.hpBarWnd:SetVal(
				self.mark.previewHp or ( self.mark.ent and self.mark.ent:GetHealth() or 0 ),
				self.mark.previewMaxHp or ( self.mark.ent and self.mark.ent:GetMaxHealth() or 0 )
			)

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateShield( oldMode )

	-- видимость

	local bVisible =
		self.bCustomizableMode
		and self.optionsSrc.marksElements[ self.mark.data.bAlly ][ self.mode ].isHpShield
		and not( self.mark.bIsCargoShip and ( not self.mark.ent or not self.mark.ent:IsShieldActive() ) )

	dummy =
		( self.bShieldVisible and not bVisible )
			and self:RemoveControl( self.shieldBarWnd, self.mainEffect )

	dummy =
		( not self.bShieldVisible and bVisible )
			and self:AddControl( self.shieldBarWnd, self.mainEffect, self.effectInfo.main.shieldLocator )

	self.bShieldVisible = bVisible

	-- риски

	dummy =
		self.mark.data.bFirstUpdate
    		and self.shieldBarWnd:SetScalable( self.optionsSrc.bScalableHealthBars )

	-- значение, цвет
	-- tODO: оптимизировать код под jit

	if bVisible then

		local val				= 0
		local maxVal			= 0
		local activeShieldEnt	= nil

		if not self.mark.bPreview then

            if self.mark.ent then

        		if self.mark.bIsShip then

            		activeShieldEnt = self.mark.ent:GetActiveShell()

    				if activeShieldEnt then
    					val		= activeShieldEnt:GetHealth()
    					maxVal	= activeShieldEnt:GetMaxHealth()
    				else
    					val		= self.mark.ent:GetShieldVal()
    					maxVal	= self.mark.ent:GetShieldMax()
    				end

        		else
        			val		= self.mark.ent:GetShieldHealth()
    				maxVal	= self.mark.ent:GetShieldMaxHealth()
        		end

			end

		else
			val		= self.mark.previewShield
			maxVal	= self.mark.previewMaxShield
		end

		self.shieldBarWnd:SetVal( val, maxVal )


    	local activeShieldId = activeShieldEnt and activeShieldEnt:GetId() or -1
		if activeShieldId ~= self.activeShieldId then

			self.activeShieldId = activeShieldId

			local customColor = 0

			if activeShieldId ~= -1 then
				local activeShieldDefName = activeShieldEnt:GetDefName()
				customColor = UI:GetActiveShieldColor( activeShieldDefName )
			end

			self.shieldBarWnd:SetCustomColor( customColor )

		end

	end

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateDamageRecords( oldMode )

	-- здесь проверяется только видимость слоя (апдейт самих записей производится в другом месте)

	local bVisible = self.mark.lastDamageRecordIdx ~= -1

	dummy =
		bVisible ~= self.bDamageRecordsVisible
			and self:SetLayerVisible( bVisible, self.layers.DAMAGE_RECORDS )

	self.bDamageRecordsVisible = bVisible

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateVisibleOnlyByLeader( oldMode )

	local bVisible =
		self.mark.data.bVisibleByLeaderOnly
		and ( self.mode == self.modes.BRIEF or self.mode == self.modes.FULL or self.mode == self.modes.LOCK )

	dummy =
		bVisible ~= self.bVisibleByLeaderVisible
			and self:SetLayerVisible( bVisible, self.layers.VISIBLE_BY_LEADER_EFFECT )

	dummy =
		bVisible ~= self.bVisibleByLeaderVisible
    		and
			(
				bVisible
    				and ( self.mainEffect:LinkLayer( self.uiHandle, self.layers.VISIBLE_BY_LEADER_EFFECT, self.effectInfo.main.visibleByLeader, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
    				or self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.VISIBLE_BY_LEADER_EFFECT, "" )
			)

	self.bVisibleByLeaderVisible = bVisible

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMainAnimation( oldMode )

	local bAdaptiveSize = self.optionsSrc.bAdaptiveMarksSize and self.bAimBorderVisible

	local animTime =
		bAdaptiveSize
			and ( ( self.mark.previewSize or UI:YToRel( _G.ProjectSize( self.mark.lastEntPos, self.mark.boundSphereRadius ) ) * 2.0 ) - self.minSize ) / ( self.maxSize - self.minSize )
			or 0

	dummy =
		animTime ~= self.mainAnimTime
			and self.mainEffect:SetAnimationTimeAndUpdate( animTime )

	dummy =
		( animTime ~= self.mainAnimTime and self.bNameVisible )
			and self.nameMetaText:UpdateEffectsPos()

	dummy =
		( animTime ~= self.mainAnimTime and self.bNameVisible )
			and self.nameMetaText:UpdateWindowsPos()

	self.mainAnimTime = animTime

end   


--
function UI.HudObjectMarkWnd_InsideShip:UpdateQuestIco( oldMode )

    local bApplicable = self.mark.quests[ 1 ] ~= nil

	local bVisible =
		bApplicable
		and ( self.mode == self.modes.BRIEF or self.mode == self.modes.FULL or self.mode == self.modes.LOCK )

	dummy =
		( bApplicable and ( self.mark.data.bFirstUpdate or self.mark.data.bNameChanged ) )
			and l_fnDummy(
				self.questIcoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark ) ),
				self.questIcoEffect:StartAnimationById( self.animId_ico_quest )
			)

	dummy =
		bVisible ~= self.bQuestIcoVisible
			and l_fnDummy(
				self:SetLayerVisible( bVisible, self.layers.QUEST_ICO_EFFECT ),
    			bVisible
	    			and ( self.mainEffect:LinkLayer( self.uiHandle, self.layers.QUEST_ICO_EFFECT, self.effectInfo.main.questIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
    				or self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.QUEST_ICO_EFFECT, "" )
			)

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateIco( oldMode )

	local bApplicable = false

	local hTex = UI.INVALID_RESOURCE_HANDLE
	if self.mark.quests[ 1 ] ~= nil then
		hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark )
	elseif self.mark.adventures[ 1 ] ~= nil then
		hTex = UI.HudObjectsMarksWnd:GetMarkAdventureIco( self.mark )
	end

	if hTex ~= UI.INVALID_RESOURCE_HANDLE then
		bApplicable = true
	end

	local bVisible =
		bApplicable
		and ( self.mode == self.modes.BRIEF or self.mode == self.modes.FULL or self.mode == self.modes.LOCK )

	dummy =
		( bApplicable and ( self.mark.data.bFirstUpdate or self.mark.data.bNameChanged ) )
			and l_fnDummy(
				self.questIcoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, hTex ),
				self.questIcoEffect:StartAnimationById( self.animId_ico_quest )
			)

	dummy =
		bVisible ~= self.bQuestIcoVisible
			and l_fnDummy(
				self:SetLayerVisible( bVisible, self.layers.QUEST_ICO_EFFECT ),
				bVisible
					and ( self.mainEffect:LinkLayer( self.uiHandle, self.layers.QUEST_ICO_EFFECT, self.effectInfo.main.questIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA ) or true )
					or self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.QUEST_ICO_EFFECT, "" )
			)

end


--
function UI.HudObjectMarkWnd_InsideShip:UpdateTimer( oldMode )

	local timer = -1

	local endTime = UI.hudMarkTimers[ self.mark.entId ] or -1
	
	if endTime ~= -1 and ( self.mode == self.modes.BRIEF or self.mode == self.modes.FULL or self.mode == self.modes.LOCK ) then
	
		local curTime = _G.TimerGetGameTime()
		if endTime > curTime then
		
			timer = endTime - curTime
			timer = UI:Round( timer * 10 ) / 10
			
		end
	
	end
	
	if timer ~= self.timer then
	
		if timer ~= -1 then
		
			local strTimer = string.format( "%0.1f", timer )
			self:SetText( strTimer, self.layers.TIMER )
			
			self:SetLayerVisible( true, self.layers.TIMER )
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.TIMER, self.effectInfo.main.timer, UI.EffectAnimParams.ALL )
		
		else
		
			self:SetLayerVisible( false, self.layers.TIMER )
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.TIMER, "" )

		end
		
		self.timer = timer
		
	end

end


--
function UI.HudObjectMarkWnd_InsideShip:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.DAMAGE_RECORDS and self.mark and self.mark.lastDamageRecordIdx ~= -1 then
		self:DrawDamageRecords()

	elseif layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.HudObjectMarkWnd_InsideShip:DrawDamageRecords()

	if not self.mark or self.mark.lastDamageRecordIdx == -1 then
		return
	end


	local startPos = self.mode == ( self.modes.FULL or self.mode == self.modes.LOCK ) and self.damageRecordsStart_FULL or self.damageRecordsStart_BRIEF

	local startPos_x = self:XToScreen( startPos.x )
	local startPos_y = self:YToScreen( startPos.y )

	for recordIdx, record in pairs( self.mark.damageRecords ) do

		local pos_rel = UI:PtToRel( record.pos_abs )
		local textSize = record.metaText:GetFormatRectSize()

		record.metaText:SetScreenOrg( UI:Vec2( startPos_x - textSize.x * 0.5 + pos_rel.x, startPos_y + pos_rel.y ) )
		record.metaText:Draw( 0, 0, 1024, 768 )

	end

end    


--
function UI.HudObjectMarkWnd_InsideShip:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )

end


--
function UI.HudObjectMarkWnd_InsideShip:AllowFadeForCurMode()

	return not( self.mode == self.modes.FULL or self.mode == self.modes.LOCK )

end


--
function UI.HudObjectMarkWnd_InsideShip:AddControl( wnd, effect, locatorName )

    effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


--
function UI.HudObjectMarkWnd_InsideShip:RemoveControl( wnd, effect )

	wnd:UnlinkFromParent()
	effect:UnlinkWnd( wnd:GetUiHandle(), "" )

end


--
function UI.HudObjectMarkWnd_InsideShip:GetRoleIcoMetaString( role, colorScheme, bInRange, bWeakness )

	if not self.roleIco then
		self.roleIco = UI:CreateChildWnd( self, UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd, "" )
	end

	self.roleIco:Setup( role, colorScheme, bInRange, bWeakness )
	self:AddChild( self.roleIco )

	return string.format( "$wndk [hWnd %u][alignment CENTER]$", self.roleIco:GetUiHandle() )

end


--
function UI.HudObjectMarkWnd_InsideShip:ResetNameMetaText()

	self.nameMetaText:SetText( "", true )

	if self.roleIco then
		self.roleIco:UnlinkFromParent()
	end

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudObjectMarkWnd_InsideShip_RoleIcoWnd",
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
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideShip_roleIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "indic_weakness",
						layer		= "UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.layers.WEAKNESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_icon4",
						layer		= "UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WEAKNESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_weakness",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
			}}
		},
	}	
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd:Setup( role, colorScheme, bInRange, bWeakness )

	-- иконка

	local texName = UI:GetRoleIcoName( role )

	local hTex = UI:GetTex( texName )
	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )

	-- иконка-"обводка"

	local hTexOutline = UI.INVALID_RESOURCE_HANDLE

	if bInRange then
		local texNameOutline = string.format( "%s_w", texName )
		hTexOutline = UI:GetTex( texNameOutline )
	end

	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.bgSpriteName, hTexOutline )

	-- анимация

	local animName = UI:GetHudMarkSpecIcoAnimName( colorScheme, bInRange )
	self.icoEffect:StartAnimation( animName )

	-- уязвимость

	if self.bWeakness ~= bWeakness then

		self:SetLayerVisible( bWeakness, self.layers.WEAKNESS_EFFECT )

		if bWeakness then
			self.mainEffect:LinkLayer( self:GetUiHandle(), self.layers.WEAKNESS_EFFECT, self.effectInfo.main.weaknessLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		else
			self.mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.WEAKNESS_EFFECT, "" )
		end

		self.bWeakness = bWeakness

	end

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.layers =
{
	MAIN_EFFECT		= 0,
	WEAKNESS_EFFECT	= 1,
	ICO_EFFECT		= 2,
}

UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.effectInfo =
{
	main =
	{
		weaknessLocator	= "indic_weakness",
	},

	ico =
	{
		icoSpriteName	= "ico",
		bgSpriteName	= "ico_bg",
	}
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.mainEffect	= true
UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.icoEffect		= nil
UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd.bWeakness		= true

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.HudObjectMarkWnd_InsideShip_RoleIcoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.icoEffect	= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_InsideShip_BarWnd
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_InsideShip_BarWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_BarWnd.def = 
{
	className = "Wnd",

	props =
	{
		name		= "HudObjectMarkWnd_InsideShip_BarWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT+ UI.WS_NOT_KB_REACT,
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
				defName				= "hud_objectsMark_insideShip_bar",
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

		-- SCALE
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,		-- этот параметр отвечает за то, будут ли эффекты из данного слоя брать альфу из локатора, к которому прилинковано окно
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:Setup( mode )

	self.mode = mode

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:SetScalable( bScalable )

	if bScalable == self.bScalable then
		return
	end
	
	self.bScalable = bScalable
	
	self:UpdateMainAnimation()
	self:UpdateScale()

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:SetVal( val, maxVal )

	self.val = val
	
	local oldMaxVal = self.maxVal
	self.maxVal = maxVal
	
	if self.maxVal ~= oldMaxVal then
	
		self:UpdateGrade()
		self:UpdateColor()
		if self.bScalable then
			self:UpdateScale()
		end
		
	end

	local animTime = maxVal ~= 0 and val / maxVal or 0
	if animTime ~= self.animTime then
		self.mainEffect:SetAnimationTimeAndUpdate( animTime )
		self.animTime = animTime
	end

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:SetCustomColor( color )

	self.customColor = color
	self:UpdateColor()

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:Reset()
	
	self.bScalable		= false
	self.val			= 0
	self.maxVal			= 0
	self.customColor	= 0
	self.animTime		= 0
	self.grade			= 1
	
	self:UpdateColor()
	self:ResetScale()
	self:UpdateMainAnimation()

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_BarWnd.layers =
{
	MAIN_EFFECT	= 0,
	SCALE		= 1,
}

--
UI.HudObjectMarkWnd_InsideShip_BarWnd.effectInfo =
{
	main =
	{
		animSimple		= "idle",
		animScalable	= "idle_2",
	},

	scale =
	{
		effectName		= "hud_objectsMark_insideShip_barScaleSmall",
	}
}

UI.HudObjectMarkWnd_InsideShip_BarWnd.MAX_SCALE_EFFECTS = 20

UI.HudObjectMarkWnd_InsideShip_BarWnd.modes =
{
	HP		= 1,
	SHIELD	= 2,
}

-- Внимание! Используется в optionsdef.lua
UI.HudObjectMarkWnd_InsideShip_BarWnd.grades =
{
	[ UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.HP ] =
	{
		{
			maxVal		= 50000,
			scaleStep	= 5000,
			color		= 0xffff9a00,
		},
		{
			maxVal		= 500000,
			scaleStep	= 50000,
			color		= 0xffff6a00,
		},
		{
			maxVal		= 5000000,
			scaleStep	= 500000,
			color		= 0xffff3a00,
		},
		{
			maxVal		= 50000000,
			scaleStep	= 5000000,
			color		= 0xffff2a00,
		},
		{
			maxVal		= 500000000,
			scaleStep	= 50000000,
			color		= 0xffff1a00,
		},
		{
			maxVal		= 5000000000,
			scaleStep	= 500000000,
			color		= 0xffff0a00,
		},
		{
			maxVal		= -1,		-- от предыдущего значения до бесконечности
			scaleStep	= -1,		-- не рисовать риски
			color		= 0xffff0000,
		}
	},
	
	[ UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.SHIELD ] =
	{
		{
			maxVal		= 50000,
			scaleStep	= 5000,
			color		= 0xff009aff,
		},
		{
			maxVal		= 500000,
			scaleStep	= 50000,
			color		= 0xff006aff,
		},
		{
			maxVal		= 5000000,
			scaleStep	= 500000,
			color		= 0xff003aff,
		},
		{
			maxVal		= 50000000,
			scaleStep	= 5000000,
			color		= 0xff002aff,
		},
		{
			maxVal		= 500000000,
			scaleStep	= 50000000,
			color		= 0xff001aff,
		},
		{
			maxVal		= 5000000000,
			scaleStep	= 500000000,
			color		= 0xff000aff,
		},
		{
			maxVal		= -1,		-- от предыдущего значения до бесконечности
			scaleStep	= -1,		-- не рисовать риски
			color		= 0xff0000ff,
		}
	}
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.HudObjectMarkWnd_InsideShip_BarWnd.mode				= -1
UI.HudObjectMarkWnd_InsideShip_BarWnd.bScalable			= false
UI.HudObjectMarkWnd_InsideShip_BarWnd.val				= 0
UI.HudObjectMarkWnd_InsideShip_BarWnd.maxVal			= 0
UI.HudObjectMarkWnd_InsideShip_BarWnd.customColor		= 0

UI.HudObjectMarkWnd_InsideShip_BarWnd.allScaleEffects	= {}
UI.HudObjectMarkWnd_InsideShip_BarWnd.scaleEffectHeight	= 0
UI.HudObjectMarkWnd_InsideShip_BarWnd.scalePool			= nil
UI.HudObjectMarkWnd_InsideShip_BarWnd.mainEffect		= nil

UI.HudObjectMarkWnd_InsideShip_BarWnd.animTime			= 0
UI.HudObjectMarkWnd_InsideShip_BarWnd.grade				= 1

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.allScaleEffects = {}

	if self:IsPrototype() then
		return
	end

	self.mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.scalePool	= self:GetEffectsPool( self.layers.SCALE )

	self:ObtainFreeScaleElementEffect()
	local scaleEffect = self.allScaleEffects[ 1 ]
	if scaleEffect then
		self.scaleEffectHeight = scaleEffect:GetObjSize( "self" ).y
	end

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:F_Shutdown()

	for idx, scaleEffect in pairs( self.allScaleEffects ) do
		_G.UI_DestroyEffect( scaleEffect )
	end
	self.allScaleEffects = {}

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:ObtainFreeScaleElementEffect()

	local numCurEffects = self.scalePool:GetNumEffects()
	local numAllEffects = #self.allScaleEffects

	if numAllEffects > numCurEffects then
		return self.allScaleEffects[ numCurEffects + 1 ]

	elseif numAllEffects < self.MAX_SCALE_EFFECTS then
		
		local scaleEffect = _G.UI_SpawnEffect( self.effectInfo.scale.effectName, self:GetUiHandle() )
		table.insert( self.allScaleEffects, scaleEffect )
		return scaleEffect

	else
--		sys.log( "UI.HudObjectMarkWnd_InsideShip_BarWnd()[ERROR]: max number of line effects reached" )
		return nil
	end	

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:UpdateGrade()
	
	self.grade = 1
	
	for grade, gradeInfo in ipairs( self.grades[ self.mode ] ) do
		if gradeInfo.maxVal == -1 or self.maxVal <= gradeInfo.maxVal then
			self.grade = grade
			break
		end
	end
	
end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:UpdateColor()
	
	local color = self.customColor ~= 0 and self.customColor or self.grades[ self.mode ][ self.grade ].color
	self.mainEffect:SetColor( color )
	
end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:UpdateScale()
	
	self:ResetScale()
	
	if not self.bScalable then
		return
	end
	
	local scaleStep = self.grades[ self.mode ][ self.grade ].scaleStep
	if scaleStep == -1 then		-- нет рисок
		return
	end
	
	self:SetLayerVisible( true, self.layers.SCALE )
	
	local numScaleElements = math.max( math.ceil( self.maxVal / scaleStep ) - 1, 0 )
	local selfSize_x = self:GetWidth()
	local selfSize_y = self:GetHeight()
	local stepWidth = self.maxVal ~= 0 and selfSize_x * scaleStep / self.maxVal or 0

	for idx = 1, numScaleElements do

		local effect = self:ObtainFreeScaleElementEffect()
		if effect then

			self.scalePool:PushEffect( effect )

			local x = stepWidth * idx
			local y = ( selfSize_y - self.scaleEffectHeight ) * 0.5

			effect:SetPos( UI:Vec2( x, y ) )

		end

	end
	
end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:ResetScale()
	
	self:SetLayerVisible( false, self.layers.SCALE )
	self.scalePool:Clear()

end


--
function UI.HudObjectMarkWnd_InsideShip_BarWnd:UpdateMainAnimation()

	local animName = self.bScalable and self.effectInfo.main.animScalable or self.effectInfo.main.animSimple
	self.mainEffect:StartAnimation( animName )
	
	self.mainEffect:SetAnimationTimeAndUpdate( self.animTime )

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_InsideVp
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_InsideVp = {}
local ivp = UI.HudObjectMarkWnd_InsideVp

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd_InsideVp.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd",

	props =
	{
		name		= "HudObjectMarkWnd_InsideVp",
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
				defName				= "hud_objectsMark_insideVp_main",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.DISTANCE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "dron",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.TURRETS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "base_in",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bomb",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.BOMB_SITE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "name_2",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.NAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "friend_damage",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.HIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "dist",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.HP_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "quest",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.QUEST_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
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
				defName				= "hud_objectsMark_insideVp_frame",
			}}
		},

		-- NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_name",

				links =
				{
					{
						objName		= "val",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},     

		-- DISTANCE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_dist",

				links =
				{
					{
						objName		= "dist",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.DISTANCE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- DISTANCE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- HIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_hit",
				defaultAnimation	= "idle",
			}}
		},

		-- TURRETS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_turrets",
			}}
		},

		-- BOMB_SITE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_bombSite",
			}}
		},

		-- HP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_insideVp_dist",

				links =
				{
					{
						objName		= "dist",
						layer		= "UI.HudObjectMarkWnd_InsideVp.layers.HP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- HP
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- QUEST_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco_centered",
				defaultAnimation	= "white",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideVp:Reset()

	UI.HudObjectMarkWnd.Reset( self )

	for layerIdx = 0, self:GetNumLayers() - 1 do
		if layerIdx ~= self.layers.MAIN_EFFECT then
			self:SetLayerVisible( false, layerIdx )
		end
	end

end


--
function UI.HudObjectMarkWnd_InsideVp:Update()

	UI.HudObjectMarkWnd.Update( self )

	self:UpdateName()
	self:UpdateTurrets()
	self:UpdateFrame()
	self:UpdateHitEffect()
	self:UpdateDistance()
	self:UpdateBombSite()
	self:UpdateHp()
	--self:UpdateQuestIco()
	self:UpdateIco()

end


-- ------------------------------
-- const
-- ------------------------------

ivp.layers =
{
    MAIN_EFFECT				= 0,
	FRAME_EFFECT			= 1,
	NAME_EFFECT				= 2,
	NAME					= 3,
    DISTANCE_EFFECT			= 4,
    DISTANCE				= 5, 
	HIT_EFFECT				= 6,
	TURRETS_EFFECT			= 7, 
    BOMB_SITE_EFFECT		= 8,
    HP_EFFECT				= 9,
    HP						= 10,
	QUEST_ICO_EFFECT		= 11,
}

ivp.effectInfo =
{
	frame =
	{
        anim_friendToNeutral_inRange	= "friend_interac_gr",
        anim_enemyToNeutral_inRange		= "enemy_interac_gr",
        anim_alienToNeutral_inRange		= "alien_interac_gr",
        anim_friendToDark_inRange		= "friend_interact_dgr",
        anim_enemyToDark_inRange		= "enemy_interac_dgr",
        anim_alienToDark_inRange		= "alien_interac_dgr",
        anim_neutralToDark_inRange		= "neutral_interac_gr",
        anim_friendToNeutral_outRange	= "friend_gr",
        anim_alienToNeutral_outRange	= "alien_gr",
        anim_enemyToNeutral_outRange	= "enemy_gr",
        anim_friendToDark_outRange		= "friend_dgr",
        anim_alienToDark_outRange		= "alien_dgr",
        anim_enemyToDark_outRange		= "enemy_dgr",
        anim_neutralToDark_outRange		= "neutral_gr",
        anim_alienToDark_outRange		= "alien_dgr",
	},

	turrets =
	{	
        anim_friend				= "friend",
        anim_enemy				= "enemy",
        anim_neutral			= "neutral",
        anim_alien				= "alien",
	},

	bombSite =
	{
		anim_friend				= "friend",
		anim_enemy				= "enemy",
		anim_neutral			= "neutral",
        anim_alien				= "alien",
	},

	name =
	{
        anim_friend				= "friend",
        anim_enemy				= "enemy",
        anim_neutral			= "neutral",
        anim_alien				= "alien",
	},

	dist =
	{
		backColorEnemyLocator	= "color_intaraction",
		backColorFriendLocator	= "color_intaraction_2",		
		backColorAlienLocator	= "color_intaraction_4",		

        anim_friend_inRange		= "neutral_interac",
        anim_friend_outRange	= "friend",
        anim_enemy_inRange		= "enemy_interac",
        anim_enemy_outRange		= "enemy",
        anim_neutral_inRange	= "neutral_interac",
        anim_neutral_outRange	= "neutral",
        anim_alien_inRange		= "alien_interac",
        anim_alien_outRange		= "alien",
	},

	hp =
	{
		backColorEnemyLocator	= "color_intaraction",
		backColorFriendLocator	= "color_intaraction_2",		
		backColorAlienLocator	= "color_intaraction_4",		

        anim_friend_inRange		= "neutral_interac",
        anim_friend_outRange	= "friend",
        anim_enemy_inRange		= "enemy_interac",
        anim_enemy_outRange		= "enemy",
        anim_neutral_inRange	= "neutral_interac",
        anim_neutral_outRange	= "neutral",
        anim_alien_inRange		= "alien_interac",
        anim_alien_outRange		= "alien",
	},
	
	questIco =
	{
		icoSpriteName	= "ico",
	},
}

ivp.strM				= UI:GetStringByName( "meter" )
ivp.strLabelRegular		= UI:GetStringByName( "hud_vitalPoint" )
ivp.strLabelPve			= UI:GetStringByName( "hud_vitalPoint_PVE_MISSION" )

ivp.wndType = UI.HudObjectsMarksWnd.wndTypes.INSIDE_VITAL_POINT

-- ------------------------------
-- vars
-- ------------------------------

ivp.animId_frame_friendToNeutral_inRange		= -1
ivp.animId_frame_enemyToNeutral_inRange			= -1
ivp.animId_frame_alienToNeutral_inRange			= -1
ivp.animId_frame_friendToDark_inRange			= -1
ivp.animId_frame_enemyToDark_inRange			= -1
ivp.animId_frame_alienToDark_inRange			= -1
ivp.animId_frame_neutralToDark_inRange			= -1
ivp.animId_frame_friendToNeutral_outRange		= -1
ivp.animId_frame_alienToNeutral_outRange		= -1
ivp.animId_frame_enemyToNeutral_outRange		= -1
ivp.animId_frame_friendToDark_outRange			= -1
ivp.animId_frame_alienToDark_outRange			= -1
ivp.animId_frame_enemyToDark_outRange			= -1
ivp.animId_frame_neutralToDark_outRange			= -1
ivp.animId_frame_alienToDark_outRange			= -1
ivp.animId_turrets_friend						= -1
ivp.animId_turrets_enemy						= -1
ivp.animId_turrets_neutral						= -1
ivp.animId_turrets_alien						= -1
ivp.animId_bombSite_friend						= -1
ivp.animId_bombSite_enemy						= -1
ivp.animId_bombSite_neutral						= -1
ivp.animId_bombSite_alien						= -1
ivp.animId_name_friend							= -1
ivp.animId_name_enemy							= -1
ivp.animId_name_neutral							= -1
ivp.animId_name_alien							= -1
ivp.animId_dist_friend_inRange					= -1 
ivp.animId_dist_friend_outRange					= -1 
ivp.animId_dist_enemy_inRange					= -1 
ivp.animId_dist_enemy_outRange					= -1 
ivp.animId_dist_neutral_inRange					= -1 
ivp.animId_dist_neutral_outRange				= -1 
ivp.animId_dist_alien_inRange					= -1 
ivp.animId_dist_alien_outRange					= -1 
ivp.animId_hp_friend_inRange					= -1 
ivp.animId_hp_friend_outRange					= -1 
ivp.animId_hp_enemy_inRange						= -1 
ivp.animId_hp_enemy_outRange					= -1 
ivp.animId_hp_neutral_inRange					= -1 
ivp.animId_hp_neutral_outRange					= -1 
ivp.animId_hp_alien_inRange						= -1 
ivp.animId_hp_alien_outRange					= -1 
ivp.frameEffect									= nil
ivp.frameCapturingEffect						= nil
ivp.turretsEffect								= nil
ivp.hitEffect									= nil
ivp.bombSiteEffect								= nil
ivp.nameEffect									= nil
ivp.questIcoEffect								= nil
ivp.distBackColorEnemy							= 0
ivp.distBackColorFriend							= 0
ivp.distBackColorAlien							= 0
ivp.distLayer									= nil
ivp.hpBackColorEnemy							= 0
ivp.hpBackColorFriend							= 0
ivp.hpBackColorAlien							= 0
ivp.hpLayer										= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideVp:F_PostLoad()

	UI.HudObjectMarkWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end 

	self.frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if self.frameEffect then
        self.animId_frame_friendToNeutral_inRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_friendToNeutral_inRange )
        self.animId_frame_enemyToNeutral_inRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_enemyToNeutral_inRange )	
        self.animId_frame_alienToNeutral_inRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_alienToNeutral_inRange )	
        self.animId_frame_friendToDark_inRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_friendToDark_inRange )
        self.animId_frame_enemyToDark_inRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_enemyToDark_inRange )
        self.animId_frame_neutralToDark_inRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_neutralToDark_inRange )
        self.animId_frame_alienToDark_inRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_alienToDark_inRange )
        self.animId_frame_friendToNeutral_outRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_friendToNeutral_outRange )
        self.animId_frame_enemyToNeutral_outRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_enemyToNeutral_outRange )
        self.animId_frame_alienToNeutral_outRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_alienToNeutral_outRange )
        self.animId_frame_friendToDark_outRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_friendToDark_outRange )
        self.animId_frame_enemyToDark_outRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_enemyToDark_outRange )
        self.animId_frame_neutralToDark_outRange		= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_neutralToDark_outRange )
        self.animId_frame_alienToDark_outRange			= self.frameEffect:GetAnimationId( self.effectInfo.frame.anim_alienToDark_outRange )
	end

	self.turretsEffect = UI:GetEffectFromLayer( self, self.layers.TURRETS_EFFECT )
	if self.turretsEffect then
    	self.animId_turrets_friend		= self.turretsEffect:GetAnimationId( self.effectInfo.turrets.anim_friend )
    	self.animId_turrets_enemy		= self.turretsEffect:GetAnimationId( self.effectInfo.turrets.anim_enemy )
    	self.animId_turrets_neutral		= self.turretsEffect:GetAnimationId( self.effectInfo.turrets.anim_neutral )
    	self.animId_turrets_alien		= self.turretsEffect:GetAnimationId( self.effectInfo.turrets.anim_alien )
	end

	self.hitEffect = UI:GetEffectFromLayer( self, self.layers.HIT_EFFECT )

	self.bombSiteEffect = UI:GetEffectFromLayer( self, self.layers.BOMB_SITE_EFFECT )
	if self.bombSiteEffect then
		self.animId_bombSite_friend		= self.bombSiteEffect:GetAnimationId( self.effectInfo.bombSite.anim_friend )
		self.animId_bombSite_enemy		= self.bombSiteEffect:GetAnimationId( self.effectInfo.bombSite.anim_enemy )
		self.animId_bombSite_neutral	= self.bombSiteEffect:GetAnimationId( self.effectInfo.bombSite.anim_neutral )
		self.animId_bombSite_alien		= self.bombSiteEffect:GetAnimationId( self.effectInfo.bombSite.anim_alien )
	end

	self.nameEffect = UI:GetEffectFromLayer( self, self.layers.NAME_EFFECT )
	if self.nameEffect then
    	self.animId_name_friend		= self.nameEffect:GetAnimationId( self.effectInfo.name.anim_friend )
    	self.animId_name_enemy		= self.nameEffect:GetAnimationId( self.effectInfo.name.anim_enemy )
    	self.animId_name_neutral	= self.nameEffect:GetAnimationId( self.effectInfo.name.anim_neutral )
    	self.animId_name_alien		= self.nameEffect:GetAnimationId( self.effectInfo.name.anim_alien )
	end

	self.distEffect = UI:GetEffectFromLayer( self, self.layers.DISTANCE_EFFECT )
	if self.distEffect then

    	self.animId_dist_friend_inRange		= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_friend_inRange )
    	self.animId_dist_friend_outRange	= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_friend_outRange )
    	self.animId_dist_enemy_inRange		= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_enemy_inRange )
    	self.animId_dist_enemy_outRange		= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_enemy_outRange )
    	self.animId_dist_neutral_inRange	= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_neutral_inRange )
    	self.animId_dist_neutral_outRange	= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_neutral_outRange )
    	self.animId_dist_alien_inRange		= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_alien_inRange )
    	self.animId_dist_alien_outRange		= self.distEffect:GetAnimationId( self.effectInfo.dist.anim_alien_outRange )

        self.distBackColorEnemy				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorEnemyLocator )	
        self.distBackColorFriend			= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorFriendLocator )	
        self.distBackColorAlien				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorAlienLocator )	

	end   

	self.distLayer = self:GetLayer( UI.LAYER_TEXT, self.layers.DISTANCE, 0 )

	self.hpEffect = UI:GetEffectFromLayer( self, self.layers.HP_EFFECT )
	if self.hpEffect then

    	self.animId_hp_friend_inRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_friend_inRange )
    	self.animId_hp_friend_outRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_friend_outRange )
    	self.animId_hp_enemy_inRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_enemy_inRange )
    	self.animId_hp_enemy_outRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_enemy_outRange )
    	self.animId_hp_neutral_inRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_neutral_inRange )
    	self.animId_hp_neutral_outRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_neutral_outRange )
    	self.animId_hp_alien_inRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_alien_inRange )
    	self.animId_hp_alien_outRange		= self.hpEffect:GetAnimationId( self.effectInfo.hp.anim_alien_outRange )

        self.hpBackColorEnemy				= self.hpEffect:GetObjBackColor( self.effectInfo.hp.backColorEnemyLocator )	
        self.hpBackColorFriend				= self.hpEffect:GetObjBackColor( self.effectInfo.hp.backColorFriendLocator )	
        self.hpBackColorAlien				= self.hpEffect:GetObjBackColor( self.effectInfo.hp.backColorAlienLocator )	

	end   

	self.hpLayer = self:GetLayer( UI.LAYER_TEXT, self.layers.HP, 0 )
	
	self.questIcoEffect = UI:GetEffectFromLayer( self, self.layers.QUEST_ICO_EFFECT )
	
	self:Reset()

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateName()

	if self.mark.data.bFirstUpdate then

    	self:SetLayerVisible( true, self.layers.NAME_EFFECT )
    	self:SetLayerVisible( true, self.layers.NAME )

		-- текст

    	local name = UI:GetEntityLocalizedNameByDef( self.mark.defName, false, false, false, false )
        self:SetText( name, self.layers.NAME )

	end

	-- анимация - определяет цвет, который зависит от рилейшеншипа

	local animId = -1

	if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then
    	animId = self.animId_name_alien

	elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then
    	animId = self.animId_name_enemy

	elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
    	animId = self.animId_name_neutral

	elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then
		animId = self.animId_name_friend
	end

	if animId ~= self.nameEffect:GetCurAnimationId() then
		self.nameEffect:StartAnimationById( animId )
	end

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateDistance()

	if self.mark.data.bFirstUpdate then
    	self:SetLayerVisible( true, self.layers.DISTANCE_EFFECT )
    	self:SetLayerVisible( true, self.layers.DISTANCE )
	end

	-- текст

	local strDist = ""
	if self.mark.data.dist >= 0 then
		strDist = string.format( "%d %s", math.floor( self.mark.data.dist * 10 ), self.strM )
	end

	self:SetText( strDist, self.layers.DISTANCE )


	-- анимация - определяет цвет, который зависит от рилейшеншипа и расстояния

	local animId = -1
	local backColor = 0

	if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then

    	animId = self.mark.data.isInFireRange and self.animId_dist_alien_inRange or self.animId_dist_alien_outRange

		if self.mark.data.isInFireRange then
			backColor = self.distBackColorAlien
		end

	elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then

    	animId = self.mark.data.isInFireRange and self.animId_dist_enemy_inRange or self.animId_dist_enemy_outRange

		if self.mark.data.isInFireRange then
			backColor = self.distBackColorEnemy
		end

	elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
    	animId = self.mark.data.isInFireRange and self.animId_dist_neutral_inRange or self.animId_dist_neutral_outRange

	elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then

		animId = self.mark.data.isInFireRange and self.animId_dist_friend_inRange or self.animId_dist_friend_outRange

		if self.mark.data.isInFireRange then
			backColor = self.distBackColorFriend
		end

	end

	if animId ~= self.distEffect:GetCurAnimationId() then
		self.distEffect:StartAnimationById( animId )
	end

	self.distLayer:SetBackColor( backColor )

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateHp()

	local bApplicable = self.mark.objType == UI.HudObjectsMarksWnd.objTypes.VITAL_POINT
	if not bApplicable then
		return
	end

	local bVisible = self:IsUnderMouse() or self:NeedVpHpAlways()

	self:SetLayerVisible( bVisible, self.layers.HP_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.HP )

	if not bVisible then
		return
	end

	-- текст

	local hp = 0
	if self.mark.previewHp then
		hp = self.mark.previewHp
	else
		if self.mark.ent and not self.mark.ent:IsDead() then
			hp = self.mark.ent:GetHealth()
		end
	end

	local maxHp = 0
	if self.mark.previewMaxHp then
		maxHp = self.mark.previewMaxHp
	else
		if self.mark.ent and not self.mark.ent:IsDead() then
			maxHp = self.mark.ent:GetMaxHealth()
		end
	end

	local hpVal = maxHp ~= 0 and hp / maxHp or 0
	hpVal = UI:Round( hpVal * 100 )

	local strHp = tostring( hpVal )
	self:SetText( strHp, self.layers.HP )


	-- анимация - определяет цвет, который зависит от рилейшеншипа и расстояния

	local animId = -1
	local backColor = 0

	if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then

    	animId = self.mark.data.isInFireRange and self.animId_hp_alien_inRange or self.animId_hp_alien_outRange

		if self.mark.data.isInFireRange then
			backColor = self.hpBackColorAlien
		end

	elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then

    	animId = self.mark.data.isInFireRange and self.animId_hp_enemy_inRange or self.animId_hp_enemy_outRange

		if self.mark.data.isInFireRange then
			backColor = self.hpBackColorEnemy
		end

	elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
    	animId = self.mark.data.isInFireRange and self.animId_hp_neutral_inRange or self.animId_hp_neutral_outRange

	elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then

		animId = self.mark.data.isInFireRange and self.animId_hp_friend_inRange or self.animId_hp_friend_outRange

		if self.mark.data.isInFireRange then
			backColor = self.hpBackColorFriend
		end

	end

	if animId ~= self.hpEffect:GetCurAnimationId() then
		self.hpEffect:StartAnimationById( animId )
	end

	self.hpLayer:SetBackColor( backColor )

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateFrame()

	if self.mark.data.bFirstUpdate then
    	self:SetLayerVisible( true, self.layers.FRAME_EFFECT )
	end

	local animId	= -1
	local animTime	= 0

	local hp = 0
	if self.mark.previewHp then
		hp = self.mark.previewHp
	else
		if self.mark.ent and not self.mark.ent:IsDead() then
			hp = self.mark.ent:GetHealth()
		end
	end

	local maxHp = 0
	if self.mark.previewMaxHp then
		maxHp = self.mark.previewMaxHp
	else
		if self.mark.ent and not self.mark.ent:IsDead() then
			maxHp = self.mark.ent:GetMaxHealth()
		end
	end

	local hpCf = maxHp ~= 0 and hp / maxHp or 0

	-- #0034269, комм.(0120447) - отображение белым рамки при приближении отключено на неопределенный период

	local gameplay = _G.GetCurrentGameMode()
	if gameplay == ai.Gameplay.CONTROL or gameplay == ai.Gameplay.APRIL_CONTROL or gameplay == ai.Gameplay.KING_OF_THE_HILL or gameplay == ai.Gameplay.PRACTICE then

		if self.mark.data.relationship == ai.RelatioshipType.FRIEND then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_friendToNeutral_inRange or]] self.animId_frame_friendToNeutral_outRange

		elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_enemyToNeutral_inRange or]] self.animId_frame_enemyToNeutral_outRange

		elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then

			local desiredRelationship = self.mark.data.relationship

			if self.mark.ent then

				local desiredRelationshipGroup	= self.mark.ent:GetDesiredRelationshipGroup()
				local myRelationshipGroup		= _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
				if myRelationshipGroup == 0 then
					myRelationshipGroup = 1
				end
				desiredRelationship				= ai.Relationship:GetRelationship( desiredRelationshipGroup, myRelationshipGroup )

			end      

    		if desiredRelationship == ai.RelatioshipType.FRIEND then
				animId = --[[self.mark.data.isInFireRange and self.animId_frame_friendToNeutral_inRange or]] self.animId_frame_friendToNeutral_outRange

    		elseif desiredRelationship == ai.RelatioshipType.ENEMY then
				animId = --[[self.mark.data.isInFireRange and self.animId_frame_enemyToNeutral_inRange or]] self.animId_frame_enemyToNeutral_outRange

    		elseif desiredRelationship == ai.RelatioshipType.NEUTRAL then
				animId = --[[self.mark.data.isInFireRange and self.animId_frame_neutralToDark_inRange or]] self.animId_frame_neutralToDark_outRange
    		end		

		end
		
	else

		if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_alienToDark_inRange or]] self.animId_frame_alienToDark_outRange

		elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_friendToDark_inRange or]] self.animId_frame_friendToDark_outRange

		elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_enemyToDark_inRange or]] self.animId_frame_enemyToDark_outRange

		elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
			animId = --[[self.mark.data.isInFireRange and self.animId_frame_neutralToDark_inRange or]] self.animId_frame_neutralToDark_outRange
		end

	end

	animTime = hpCf

	if self.frameEffect:GetCurAnimationId() ~= animId then
		self.frameEffect:StartAnimationById( animId )
	end

	self.frameEffect:SetAnimationTimeAndUpdate( animTime )

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateHitEffect()

	local bCanBeVisible = self.mark.data.relationship == ai.RelatioshipType.FRIEND
	if not bCanBeVisible then
    	self:SetLayerVisible( false, self.layers.HIT_EFFECT )
		return
	end

	local bUnderAttack = false

	if self.mark.objType == UI.HudObjectsMarksWnd.objTypes.VITAL_POINT then
		if self.mark.ent then
			bUnderAttack = self.mark.ent:IsUnderAttack()
		end

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.BOMB_SITE then
		if self.mark.ent then
			bUnderAttack = _G.CL_BombTheBaseIsBombSiteUnderAttack( self.mark.ent )
		end
	end

	if bUnderAttack and not self:IsLayerVisible( self.layers.HIT_EFFECT ) then
		self:SetLayerVisible( true, self.layers.HIT_EFFECT )
		self.hitEffect:RestartAnimation()
	end
	
end


--
function UI.HudObjectMarkWnd_InsideVp:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.hitEffect then
		self:SetLayerVisible( false, self.layers.HIT_EFFECT )
	end

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateTurrets()

	local bApplicable = self.mark.objType == UI.HudObjectsMarksWnd.objTypes.VITAL_POINT

	if not bApplicable then

    	if self.mark.data.bFirstUpdate then
    		self:SetLayerVisible( false, self.layers.TURRETS_EFFECT )
    	end

		return

	end

	local bVisible = self.mark.ent and self.mark.ent:GetNumAliveTurrets() > 0
    self:SetLayerVisible( bVisible, self.layers.TURRETS_EFFECT )

	if bVisible then

		-- анимация - определяет цвет, который зависит от рилейшеншипа

    	local animId = -1

		if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then
    		animId = self.animId_turrets_alien

    	elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then
    		animId = self.animId_turrets_enemy

    	elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then
    		animId = self.animId_turrets_friend

    	elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
    		animId = self.animId_turrets_neutral
    	end
    	
    	if animId ~= self.turretsEffect:GetCurAnimationId() then
    		self.turretsEffect:StartAnimationById( animId )
    	end	

	end

end 


--
function UI.HudObjectMarkWnd_InsideVp:UpdateBombSite()

	local bApplicable = self.mark.objType == UI.HudObjectsMarksWnd.objTypes.BOMB_SITE

	if self.mark.data.bFirstUpdate then
    	self:SetLayerVisible( bApplicable, self.layers.BOMB_SITE_EFFECT )
	end

	if not bApplicable then
		return
	end

	-- анимация - определяет цвет, который зависит от рилейшеншипа

	local animId = -1

	if self.mark.data.relationshipGroup == ai.RelationshipGroups.Alien then
		animId = self.animId_bombSite_alien

	elseif self.mark.data.relationship == ai.RelatioshipType.ENEMY then
		animId = self.animId_bombSite_enemy

	elseif self.mark.data.relationship == ai.RelatioshipType.FRIEND then
		animId = self.animId_bombSite_friend

	elseif self.mark.data.relationship == ai.RelatioshipType.NEUTRAL then
		animId = self.animId_bombSite_neutral
	end
	
	if animId ~= self.bombSiteEffect:GetCurAnimationId() then
		self.bombSiteEffect:StartAnimationById( animId )
	end	

end


--
function UI.HudObjectMarkWnd_InsideVp:NeedVpHpAlways()

	return UI.HudObjectsMarksWnd.bVpHpAlways

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateQuestIco()
	
	if self.mark.data.bFirstUpdate then

		if self.mark.quests[ 1 ] ~= nil then

			local hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark )
			self.questIcoEffect:SetSpriteTexture( self.effectInfo.questIco.icoSpriteName, hTex )
			
			self:SetLayerVisible( true, self.layers.QUEST_ICO_EFFECT )
			
		else
			self:SetLayerVisible( false, self.layers.QUEST_ICO_EFFECT )
		end
		
	end

end


--
function UI.HudObjectMarkWnd_InsideVp:UpdateIco()
	
	if self.mark.data.bFirstUpdate then

		local hTex = UI.INVALID_RESOURCE_HANDLE
		if self.mark.quests[ 1 ] ~= nil then
			hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark )
		elseif self.mark.adventures[ 1 ] ~= nil then
			hTex = UI.HudObjectsMarksWnd:GetMarkAdventureIco( self.mark )
		end

		if hTex ~= UI.INVALID_RESOURCE_HANDLE then
			self.questIcoEffect:SetSpriteTexture( self.effectInfo.questIco.icoSpriteName, hTex )
			
			self:SetLayerVisible( true, self.layers.QUEST_ICO_EFFECT )
		else
			self:SetLayerVisible( false, self.layers.QUEST_ICO_EFFECT )
		end
		
	end

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_OutsideShip
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_OutsideShip = {}
local os = UI.HudObjectMarkWnd_OutsideShip

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd_OutsideShip.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd",

	props =
	{
		name		= "HudObjectMarkWnd_OutsideShip",
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
				defName				= "hud_objectsMark_outsideShip",
				defaultAnimation	= "white",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",
						layer		= "UI.HudObjectMarkWnd_OutsideShip.layers.WEAKNESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "ico",
						layer		= "UI.HudObjectMarkWnd_OutsideShip.layers.SPEC_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "ico",
						layer		= "UI.HudObjectMarkWnd_OutsideShip.layers.QUEST_OVERLAY_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		}, 

		-- WEAKNESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_weakness",
				defaultAnimation	= "idle",
			}}
		},

		-- SPEC_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_specIco_centered",
			}}
		},

		-- QUEST_OVERLAY_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hud_objectsMark_specIco_centered",
				defaultAnimation	= "white",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_OutsideShip:Update()

	UI.HudObjectMarkWnd.Update( self )

    self:UpdateMainAnimation()
	self.mainEffect:SetRotation( self.mark.data.angle, self.center )

	dummy =
		( self.mark.data.bFirstUpdateOnCircle or self.mark.data.bNameChanged )
    		and self:InitSpecIco()

	dummy =
		( self.mark.data.bFirstUpdateOnCircle or self.mark.data.bNameChanged )
    		-- and self:InitQuestOverlayIco()
			and self:InitOverlayIco()

	dummy =
		self.bSpecIcoVisible
			and self:UpdateSpecIcoAnim()

	self:UpdateWeakness()

end


--
function UI.HudObjectMarkWnd_OutsideShip:UpdateOnMissedPass()

	self.mainEffect:SetRotation( self.mark.data.angle, self.center )

end


--
function UI.HudObjectMarkWnd_OutsideShip:Reset()

	UI.HudObjectMarkWnd.Reset( self )

	self:SetLayerVisible( false, self.layers.SPEC_ICO_EFFECT )
	self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.SPEC_ICO_EFFECT, "" )
	self.bSpecIcoVisible = false

	self:SetLayerVisible( false, self.layers.QUEST_OVERLAY_ICO_EFFECT )
	self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.QUEST_OVERLAY_ICO_EFFECT, "" )
	self.bQuestOverlayIcoVisible = false

	self:SetLayerVisible( false, self.layers.WEAKNESS_EFFECT )
	self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.WEAKNESS_EFFECT, "" )
	self.bWeaknessVisible = false

	self.mainEffect:StartAnimationById( self.animId_main_idle )
	self.mainAnimId = self.animId_main_idle

	self.specIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	self.specIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteNameOutline, UI.INVALID_RESOURCE_HANDLE )

	self.questOverlayIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	self.questOverlayIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteNameOutline, UI.INVALID_RESOURCE_HANDLE )	

end


-- ------------------------------
-- const
-- ------------------------------

os.layers =
{
    MAIN_EFFECT					= 0,
	WEAKNESS_EFFECT				= 1,
	SPEC_ICO_EFFECT				= 2,
	QUEST_OVERLAY_ICO_EFFECT	= 3,
}

os.effectInfo =
{
	main =
	{
		anims =
		{
            enemyInRange				= "enemy_shot",
            enemyOutRange				= "enemy",
			enemyLock					= "enemy_lock_out",
            friendInRange				= "friend_shot",
            friendOutRange				= "friend",
			friendLock					= "friend_lock_out",
            agressiveInRange			= "agressiv_shot",
            agressiveOutRange			= "agressiv",
			agressiveLock				= "agressiv_lock_out",
            neutralInRange				= "neutral",
			neutralOutRange				= "neutral_shot",			
			neutralLock					= "neutral_lock_out",		-- нет специальной анимации
			alienInRange				= "nlo_shot",
			alienOutRange				= "nlo",
			alienLock					= "nlo_lock_out",
			squad						= "squad",			
			squadLock					= "squad_lock_out",
			friendClanshipVpCapturing	= "ico_blink",
			idle						= "white",
			me							= "me",
			meLock						= "me_lock_out",
		},

		specIcoLocator	= "ico",
	},

	specIco =
	{
		anims =
		{
            enemyInRange			= "enemy_shot",
            enemyOutRange			= "enemy",
			neutralInRange			= "neutral_shot",			
			neutralOutRange			= "neutral",			
            friendInRange			= "friend_shot",
            friendOutRange			= "friend",
            agressiveInRange		= "agressiv_shot",
            agressiveOutRange		= "agressiv",
			alienInRange			= "nlo_shot",
			alienOutRange			= "nlo",
            squad					= "squad",
			white					= "white",
			me						= "me",
		},

		icoSpriteName			= "ico",
		icoSpriteNameOutline	= "ico_bg",
		orgPosLocator			= "center",
	}
}

os.wndType = UI.HudObjectsMarksWnd.wndTypes.OUTSIDE_SHIP

-- ------------------------------
-- vars
-- ------------------------------

os.animId_main =
{
	-- in range
	[ true ] =
	{
    	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
    	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
    	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
    	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
		[ UI.gameObjColorSchemes.ME ]			= -1,
    	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
    	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
	},

	-- out of range
	[ false ] =
	{
    	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
    	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
    	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
    	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
		[ UI.gameObjColorSchemes.ME ]			= -1,
    	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
    	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
	},
}

os.animId_main_lock =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

os.animId_main_clanshipVpCapturing =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
}

os.animId_main_idle							= -1

os.animId_specIco =
{
	-- in range
	[ true ] =	
    {
    	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
    	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
    	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
    	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
		[ UI.gameObjColorSchemes.ME ]			= -1,
    	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
    	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
    },

	-- out of range
	[ false ] =	
    {
    	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
    	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
    	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
    	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
		[ UI.gameObjColorSchemes.ME ]			= -1,
    	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
    	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
    }
}

os.animId_specIco_white					= 1

os.specIcoOrgPos						= Vec2( 0, 0 )
os.specIcoEffect						= nil
os.uiHandle								= UI.INVALID_UI_HANDLE
os.bSpecIcoVisible						= false
os.mainAnimId							= -1
os.icoAnimId							= -1
os.fnGetMainAnimation					= {}
os.bQuestOverlayIcoVisible				= false
os.questOverlayIcoEffect				= nil
os.bWeaknessVisible						= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_OutsideShip:F_PostLoad()

	UI.HudObjectMarkWnd.F_PostLoad( self )

	if self == UI.HudObjectMarkWnd_OutsideShip then

    	self.fnGetMainAnimation =
    	{
    		[ UI.HudObjectsMarksWnd.objTypes.DEFAULT ]				= self.GetMainAnimation_default,
    		[ UI.HudObjectsMarksWnd.objTypes.PLAYER ]				= self.GetMainAnimation_PLAYER,
    		[ UI.HudObjectsMarksWnd.objTypes.VITAL_POINT ]			= self.GetMainAnimation_default,
    		[ UI.HudObjectsMarksWnd.objTypes.BOMB ]					= self.GetMainAnimation_BOMB,
    		[ UI.HudObjectsMarksWnd.objTypes.BOMB_SITE ]			= self.GetMainAnimation_default,
    		[ UI.HudObjectsMarksWnd.objTypes.TARGET ]				= self.GetMainAnimation_TARGET,
    		[ UI.HudObjectsMarksWnd.objTypes.LOOT ]					= self.GetMainAnimation_LOOT,
    		[ UI.HudObjectsMarksWnd.objTypes.JUMP_GATE ]			= self.GetMainAnimation_JUMP_GATE,
    		[ UI.HudObjectsMarksWnd.objTypes.MISSILE ]				= self.GetMainAnimation_default,
    		[ UI.HudObjectsMarksWnd.objTypes.CLANSHIP_VITAL_POINT ]	= self.GetMainAnimation_CLANSHIP_VITAL_POINT,
    	}

	end

	if self:IsPrototype() then
		return
	end 

	self.uiHandle = self:GetUiHandle()

	if self.mainEffect then

        self.animId_main = {}

		self.animId_main[ true ] = {}
		self.animId_main[ true ][ UI.gameObjColorSchemes.FRIEND ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.friendInRange )
		self.animId_main[ true ][ UI.gameObjColorSchemes.ENEMY ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.enemyInRange )
		self.animId_main[ true ][ UI.gameObjColorSchemes.NEUTRAL ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.neutralInRange )
		self.animId_main[ true ][ UI.gameObjColorSchemes.SQUAD ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.squad )	-- одна анимация для inRange/outRange
		self.animId_main[ true ][ UI.gameObjColorSchemes.ME ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.me ) -- одна анимация для inRange/outRange
		self.animId_main[ true ][ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.agressiveInRange )
		self.animId_main[ true ][ UI.gameObjColorSchemes.ALIEN ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.alienInRange )

        self.animId_main[ false ] = {}
		self.animId_main[ false ][ UI.gameObjColorSchemes.FRIEND ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.friendOutRange )
		self.animId_main[ false ][ UI.gameObjColorSchemes.ENEMY ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.enemyOutRange )
		self.animId_main[ false ][ UI.gameObjColorSchemes.NEUTRAL ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.neutralOutRange )
		self.animId_main[ false ][ UI.gameObjColorSchemes.SQUAD ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.squad )	-- одна анимация для inRange/outRange
		self.animId_main[ false ][ UI.gameObjColorSchemes.ME ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.me ) -- одна анимация для inRange/outRange
		self.animId_main[ false ][ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.agressiveOutRange )
		self.animId_main[ false ][ UI.gameObjColorSchemes.ALIEN ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.alienOutRange )

        self.animId_main_lock = {}
		self.animId_main_lock[ UI.gameObjColorSchemes.FRIEND ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.friendLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.ENEMY ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.enemyLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.NEUTRAL ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.neutralLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.SQUAD ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.squadLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.ME ]				= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.meLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.AGGRESSIVE ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.agressiveLock )
		self.animId_main_lock[ UI.gameObjColorSchemes.ALIEN ]			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.alienLock )

		self.animId_main_clanshipVpCapturing = {}
		self.animId_main_clanshipVpCapturing[ UI.gameObjColorSchemes.FRIEND ]		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.friendClanshipVpCapturing )

    	self.animId_main_idle = self.mainEffect:GetAnimationId( self.effectInfo.main.anims.idle )

	end

	self.specIcoEffect = UI:GetEffectFromLayer( self, self.layers.SPEC_ICO_EFFECT )
	if self.specIcoEffect then

        self.animId_specIco = {}

		self.animId_specIco[ true ] = {}
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.FRIEND ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.friendInRange )
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.ENEMY ]			= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.enemyInRange )
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.NEUTRAL ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.neutralInRange )
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.SQUAD ]			= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.squad ) -- одна анимация для inRange/outRange
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.ME ]			= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.me ) -- одна анимация для inRange/outRange
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.agressiveInRange )
		self.animId_specIco[ true ][ UI.gameObjColorSchemes.ALIEN ]			= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.alienInRange )

        self.animId_specIco[ false ] = {}
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.FRIEND ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.friendOutRange )
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.ENEMY ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.enemyOutRange )
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.NEUTRAL ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.neutralOutRange )
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.SQUAD ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.squad ) -- одна анимация для inRange/outRange
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.ME ]			= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.me ) -- одна анимация для inRange/outRange
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.AGGRESSIVE ]	= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.agressiveOutRange )
		self.animId_specIco[ false ][ UI.gameObjColorSchemes.ALIEN ]		= self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.alienOutRange )

		self.animId_specIco_white = self.specIcoEffect:GetAnimationId( self.effectInfo.specIco.anims.white )

		self.specIcoOrgPos = self.specIcoEffect:GetObjPos( self.effectInfo.specIco.orgPosLocator )

	end

	self.questOverlayIcoEffect = UI:GetEffectFromLayer( self, self.layers.QUEST_OVERLAY_ICO_EFFECT )

	self.mainAnimId				= self.mainEffect:GetCurAnimationId()
	self.icoAnimId				= self.specIcoEffect:GetCurAnimationId()

	self:Reset()

end


--
function UI.HudObjectMarkWnd_OutsideShip:UpdateMainAnimation()

	local animId = -1

	animId =
		( self.mark.data.isLock or self.mark.data.isLocking )
			and self.animId_main_lock[ self.mark.data.colorScheme ]
			or self.fnGetMainAnimation[ self.mark.objType ]( self )

	dummy =
		( animId and animId ~= -1 and animId ~= self.mainAnimId )
			and self.mainEffect:StartAnimationById( animId )

	self.mainAnimId = animId

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_PLAYER()

	return self.animId_main_idle

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_CLANSHIP_VITAL_POINT()

	return
		self:NeedShowClanshipVpCapturing()
			and self.animId_main_clanshipVpCapturing[ self.mark.data.colorScheme ]
			or self.animId_main_idle
end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_BOMB()

	return self.animId_main_idle

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_LOOT()

	return self.animId_main_idle

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_JUMP_GATE()

	return self.animId_main_idle

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_TARGET()

	return self.animId_main_lock[ UI.gameObjColorSchemes.ENEMY ]

end


--
function UI.HudObjectMarkWnd_OutsideShip:GetMainAnimation_default()

	return self.animId_main[ self.mark.data.isInFireRange ][ self.mark.data.colorScheme ]

end


--
function UI.HudObjectMarkWnd_OutsideShip:InitSpecIco()

	-- текстура

	local texName = nil

	if ( self.mark.quests[ 1 ] ~= nil or self.mark.adventures[ 1 ] ~= nil ) and self.mark.objType ~= UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then	-- для ворот рисуется одновременно и иконка ворот, и квестовая иконка
		
		if self.mark.quests[ 1 ] ~= nil then
			texName = UI.HudObjectsMarksWnd:GetMarkQuestIcoName( self.mark )
		elseif self.mark.adventures[ 1 ] ~= nil then
			texName = UI.HudObjectsMarksWnd:GetMarkAdventureIcoName( self.mark )
		end

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.DEFAULT then

		if self.mark.icoName ~= "" then
			texName = self.mark.icoName

		elseif self.mark.bEventAgent then
			texName = "eventAgent"
		end

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.BOMB then
		texName = "bomb"

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.LOOT then
		texName = "loot"

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then
		texName = "warpgate"

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.PLAYER then

		if self.mark.data.bLeader then
			texName = "capitan"

		elseif self.mark.data.bBomber then
			texName = "bomb"

		elseif self.mark.bEventAgent then
			texName = "eventAgent"

		else
			local role = UI:GetItemRole( self.mark.defName )
			if role ~= -1 then
				texName = UI:GetRoleIcoName( role )
			end
		end

	elseif self.mark.objType == UI.HudObjectsMarksWnd.objTypes.CLANSHIP_VITAL_POINT then
		texName = UI:GetClanshipVpIcoName( self.mark.defName )
	end

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if texName then

		hTex = UI:GetTex( texName )
		self.specIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteName, hTex )

    	-- иконка-обводка
    	
		local texNameOutline = string.format( "%s_w", texName )
		local hTexOutline = UI:GetTex( texNameOutline )
		self.specIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteNameOutline, hTexOutline )

	end


	-- видимость

	local bVisible = hTex ~= UI.INVALID_RESOURCE_HANDLE

	if bVisible ~= self.bSpecIcoVisible then

		self:SetLayerVisible( bVisible, self.layers.SPEC_ICO_EFFECT )
		self.bSpecIcoVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.SPEC_ICO_EFFECT, self.effectInfo.main.specIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.SPEC_ICO_EFFECT, "" )
		end

	end

end


--
-- function UI.HudObjectMarkWnd_OutsideShip:InitQuestOverlayIco()
function UI.HudObjectMarkWnd_OutsideShip:InitOverlayIco()

	-- текстура

	local texName = nil

	if self.mark.quests[ 1 ] ~= nil and self.mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then
		texName = UI.HudObjectsMarksWnd:GetMarkQuestIcoName( self.mark )
	elseif self.mark.adventures[ 1 ] ~= nil and self.mark.objType == UI.HudObjectsMarksWnd.objTypes.JUMP_GATE then
		texName = UI.HudObjectsMarksWnd:GetMarkAdventureIcoName( self.mark )
	end

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if texName then

		hTex = UI:GetTex( texName )
		self.questOverlayIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteName, hTex )

    	-- иконка-обводка
    	
		local texNameOutline = string.format( "%s_w", texName )
		local hTexOutline = UI:GetTex( texNameOutline )
		self.questOverlayIcoEffect:SetSpriteTexture( self.effectInfo.specIco.icoSpriteNameOutline, hTexOutline )

	end


	-- видимость

	local bVisible = hTex ~= UI.INVALID_RESOURCE_HANDLE

	if bVisible ~= self.bQuestOverlayIcoVisible then

		self:SetLayerVisible( bVisible, self.layers.QUEST_OVERLAY_ICO_EFFECT )
		self.bQuestOverlayIcoVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.QUEST_OVERLAY_ICO_EFFECT, self.effectInfo.main.specIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.QUEST_OVERLAY_ICO_EFFECT, "" )
		end

	end

end


--
function UI.HudObjectMarkWnd_OutsideShip:UpdateSpecIcoAnim()

	local bQuestIco =
		self.mark.quests[ 1 ] ~= nil
		and self.mark.objType ~= UI.HudObjectsMarksWnd.objTypes.JUMP_GATE

	local bAdventureIco =
		self.mark.adventures[ 1 ] ~= nil
		and self.mark.objType ~= UI.HudObjectsMarksWnd.objTypes.JUMP_GATE

	local bUseAnimColor =
		--not bQuestIco
		( not bQuestIco and not bAdventureIco )
		and not
		(
			self.mark.objType == UI.HudObjectsMarksWnd.objTypes.CLANSHIP_VITAL_POINT
			and self:NeedShowClanshipVpCapturing()
		)

	local animId =
		bUseAnimColor
			and self.animId_specIco[ self.mark.data.isInFireRange ][ self.mark.data.colorScheme ]
			or self.animId_specIco_white

	dummy =
		animId ~= self.icoAnimId
			and self.specIcoEffect:StartAnimationById( animId )

	self.icoAnimId = animId

end


--
function UI.HudObjectMarkWnd_OutsideShip:NeedShowClanshipVpCapturing()

	return
		self.mark.data.relationship == ai.RelatioshipType.FRIEND
		and not self.mark.data.isInFireRange
		and ( self.mark.ent ~= nil and self.mark.ent.IsUnderAttack ~= nil and self.mark.ent:IsUnderAttack() )
	
end


--
function UI.HudObjectMarkWnd_OutsideShip:UpdateWeakness()

	local bVisible = self.mark.data.bInWeaknessRadius
	if bVisible ~= self.bWeaknessVisible then

		self:SetLayerVisible( bVisible, self.layers.WEAKNESS_EFFECT )
		self.bWeaknessVisible = bVisible

		if bVisible then
			self.mainEffect:LinkLayer( self.uiHandle, self.layers.WEAKNESS_EFFECT, self.effectInfo.main.specIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
		else
			self.mainEffect:UnlinkLayer( self.uiHandle, self.layers.WEAKNESS_EFFECT, "" )
		end

	end

end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_OutsideVp
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_OutsideVp = {}
local ovp = UI.HudObjectMarkWnd_OutsideVp

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd_OutsideVp.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd",

	props =
	{
		name		= "HudObjectMarkWnd_OutsideVp",
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
				defName				= "hud_objectsMark_outsideVp",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value_outl",
						layer		= "UI.HudObjectMarkWnd_OutsideVp.layers.NAME_INRANGE_OUTL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "value",
						layer		= "UI.HudObjectMarkWnd_OutsideVp.layers.NAME_INRANGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "value_outl2",
						layer		= "UI.HudObjectMarkWnd_OutsideVp.layers.NAME_OUTRANGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "friend_damage",
						layer		= "UI.HudObjectMarkWnd_OutsideVp.layers.HIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
					
					{
						objName		= "quest",
						layer		= "UI.HudObjectMarkWnd_OutsideVp.layers.QUEST_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		}, 

		-- NAME_INRANGE_OUTL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},   

		-- NAME_INRANGE
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},   

		-- NAME_OUTRANGE
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- HIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_outsideVp_hit",
				defaultAnimation	= "idle",
			}}
		},
		
		-- QUEST_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco_centered",
				defaultAnimation	= "white",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_OutsideVp:Update()

	UI.HudObjectMarkWnd.Update( self )

	if self.mark.data.bFirstUpdateOnCircle then
		self:UpdateName( ent )
		--self:UpdateQuestIcoTex()
		self:UpdateIcoTex()
	end

	self:UpdateMainAnimation( self.mark.data.relationshipGroup, self.mark.data.relationship, self.mark.data.isInFireRange )

	if self.mark.objType == UI.HudObjectsMarksWnd.objTypes.VITAL_POINT and self.mark.data.relationship == ai.RelatioshipType.FRIEND then
		local isUnderAttack = self.mark.ent and self.mark.ent:IsUnderAttack()
		self:UpdateHitEffect( isUnderAttack )
	end
	
	--self:UpdateQuestIcoPos()
	self:UpdateIcoPos()

end


--
function UI.HudObjectMarkWnd_OutsideVp:Reset()

	UI.HudObjectMarkWnd.Reset( self )

	self:SetLayerVisible( false, self.layers.HIT_EFFECT )
	self:SetLayerVisible( false, self.layers.QUEST_ICO_EFFECT )

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateOnMissedPass()

	--self:UpdateQuestIcoPos()
	self:UpdateIcoPos()

end


-- ------------------------------
-- const
-- ------------------------------

ovp.layers =
{
    MAIN_EFFECT			= 0,
	NAME_INRANGE_OUTL	= 1,
	NAME_INRANGE		= 2,
	NAME_OUTRANGE		= 3,
	HIT_EFFECT			= 4,
	QUEST_ICO_EFFECT	= 5,
}

ovp.effectInfo =
{
	main =
	{
		anims =
		{
            enemyInRange			= "enemy_shot",
            enemyOutOfRange			= "enemy",
            friend					= "friend",
            neutralInRange			= "neutral_short",
			neutralOutOfRange		= "neutral",
            alienInRange			= "alien_shot",
            alienOutOfRange			= "alien",
		},
		
		centerLocator			= "center",
		questIcoLocator			= "quest",
	},
	
	questIco =
	{
		icoSpriteName	= "ico"
	},
}

ovp.wndType = UI.HudObjectsMarksWnd.wndTypes.OUTSIDE_VP

-- ------------------------------
-- vars
-- ------------------------------

os.animId_main_enemyInRange				= -1
os.animId_main_enemyOutOfRange			= -1
os.animId_main_friend					= -1
os.animId_main_neutralInRange			= -1
os.animId_main_neutralOutOfRange		= -1
os.animId_main_alienInRange				= -1
os.animId_main_alienOutOfRange			= -1
os.hitEffect							= nil
os.questIcoEffect						= nil
os.centerPos_abs						= Vec2( 0, 0 )
os.questIcoOrgPos_abs					= Vec2( 0, 0 )
os.questIcoEffectRes					= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_OutsideVp:F_PostLoad()

	UI.HudObjectMarkWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end 

	if self.mainEffect then
        self.animId_main_enemyInRange			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.enemyInRange )
        self.animId_main_enemyOutOfRange		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.enemyOutOfRange )
        self.animId_main_friend					= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.friend )
		self.animId_main_neutralInRange			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.neutralInRange )
		self.animId_main_neutralOutOfRange		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.neutralOutOfRange )
        self.animId_main_alienInRange			= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.alienInRange )
        self.animId_main_alienOutOfRange		= self.mainEffect:GetAnimationId( self.effectInfo.main.anims.alienOutOfRange )
	end

	self.hitEffect		= UI:GetEffectFromLayer( self, self.layers.HIT_EFFECT )
	self.questIcoEffect	= UI:GetEffectFromLayer( self, self.layers.QUEST_ICO_EFFECT )
	
	self.questIcoEffectRes = self.questIcoEffect:GetResolution()
	
	self.centerPos_abs	= self.mainEffect and self.mainEffect:GetObjPos( self.effectInfo.main.centerLocator ) or Vec2( 0, 0 )
	self.centerPos_abs.x = UI:XToAbs( self.centerPos_abs.x, true, self.questIcoEffectRes )
	self.centerPos_abs.y = UI:YToAbs( self.centerPos_abs.y, true, self.questIcoEffectRes )
	
	self.questIcoOrgPos_abs	= self.mainEffect and self.mainEffect:GetObjPos( self.effectInfo.main.questIcoLocator ) or Vec2( 0, 0 )
	self.questIcoOrgPos_abs.x = UI:XToAbs( self.questIcoOrgPos_abs.x, true, self.questIcoEffectRes )
	self.questIcoOrgPos_abs.y = UI:YToAbs( self.questIcoOrgPos_abs.y, true, self.questIcoEffectRes )

	self:Reset()

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateMainAnimation( relationshipGroup, relationship, isInFireRange )

	local animId = -1

	if relationshipGroup == ai.RelationshipGroups.Alien then

		if isInFireRange then
			animId = self.animId_main_alienInRange
		else
			animId = self.animId_main_alienOutOfRange
		end

	elseif relationship == ai.RelatioshipType.ENEMY then

		if isInFireRange then
			animId = self.animId_main_enemyInRange
		else
			animId = self.animId_main_enemyOutOfRange
		end

	elseif relationship == ai.RelatioshipType.FRIEND then
		animId = self.animId_main_friend

	elseif relationship == ai.RelatioshipType.NEUTRAL then

		if isInFireRange then
			animId = self.animId_main_neutralInRange
		else
			animId = self.animId_main_neutralOutOfRange
		end

	end

	if animId ~= -1 and self.mainEffect:GetCurAnimationId() ~= animId then
		self.mainEffect:StartAnimationById( animId )
	end

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateName()

	local name = self.mark.ent and UI:GetEntityLocalizedName( self.mark.ent, false ) or ""

	self:SetText( name, self.layers.NAME_INRANGE_OUTL )
	self:SetText( name, self.layers.NAME_INRANGE )
	self:SetText( name, self.layers.NAME_OUTRANGE )

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateHitEffect( isUnderAttack )

	if isUnderAttack and not self:IsLayerVisible( self.layers.HIT_EFFECT ) then

		self:SetLayerVisible( true, self.layers.HIT_EFFECT )
		self.hitEffect:RestartAnimation()

	end

end


--
function UI.HudObjectMarkWnd_OutsideVp:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.hitEffect then
		self:SetLayerVisible( false, self.layers.HIT_EFFECT )
	end

end 


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateQuestIcoTex()

	if self.mark.quests[ 1 ] ~= nil then

		local hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark )
		self.questIcoEffect:SetSpriteTexture( self.effectInfo.questIco.icoSpriteName, hTex )
		
		self:SetLayerVisible( true, self.layers.QUEST_ICO_EFFECT )
		
	else
		self:SetLayerVisible( false, self.layers.QUEST_ICO_EFFECT )
	end

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateIcoTex()

	local hTex = UI.INVALID_RESOURCE_HANDLE
	if self.mark.quests[ 1 ] ~= nil then
		hTex = UI.HudObjectsMarksWnd:GetMarkQuestIco( self.mark )
	elseif self.mark.adventures[ 1 ] ~= nil then
		hTex = UI.HudObjectsMarksWnd:GetMarkAdventureIco( self.mark )
	end

	if hTex ~= UI.INVALID_RESOURCE_HANDLE then
		self.questIcoEffect:SetSpriteTexture( self.effectInfo.questIco.icoSpriteName, hTex )
		
		self:SetLayerVisible( true, self.layers.QUEST_ICO_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.QUEST_ICO_EFFECT )
	end

end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateQuestIcoPos()
	
	if self.mark.quests[ 1 ] ~= nil then

		-- в эффекте локатор на воскл. знак стоит над иконкой виталпойнта;
		-- рисовать его надо на внутреннем круге от иконки (на прямой от центра экрана до иконки и сразу перед иконкой)
		
		local pos = UI:Rotate2( self.questIcoOrgPos_abs, self.mark.data.angle + math.pi, self.centerPos_abs.x, self.centerPos_abs.y )
		pos = UI:PtToRel( pos, true, self.questIcoEffectRes )
		
		self.questIcoEffect:SetPos( pos )
		
	end
	
end


--
function UI.HudObjectMarkWnd_OutsideVp:UpdateIcoPos()
	
	if self.mark.quests[ 1 ] ~= nil or self.mark.adventures[ 1 ] ~= nil then

		local pos = UI:Rotate2( self.questIcoOrgPos_abs, self.mark.data.angle + math.pi, self.centerPos_abs.x, self.centerPos_abs.y )
		pos = UI:PtToRel( pos, true, self.questIcoEffectRes )
		
		self.questIcoEffect:SetPos( pos )
		
	end
	
end


-- ------------------------------------------------------------------
-- UI.HudObjectMarkWnd_InsideClanshipVp
-- ------------------------------------------------------------------

UI.HudObjectMarkWnd_InsideClanshipVp = {}
local icvp = UI.HudObjectMarkWnd_InsideClanshipVp

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMarkWnd_InsideClanshipVp.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd",

	props =
	{
		name		= "HudObjectMarkWnd_InsideClanshipVp",
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
				defName				= "hud_objectsMark_insideClanshipVp_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "gmp_icon",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "mark_name",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.NAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "vital_progr",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.HP_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "mark_name1",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.DISTANCE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},  

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName	= "hud_objectsMark_specIco",
			}}
		},

		-- NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName	= "hud_objectsMark_insideShip_name",

				links =
				{
					{
						objName		= "name1",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},    

		-- HP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName	= "hud_objectsMark_insideClanshipVp_hp",
			}}
		}, 

		-- DISTANCE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName	= "hud_objectsMark_insideShip_name",

				links =
				{
					{
						objName		= "name1",
						layer		= "UI.HudObjectMarkWnd_InsideClanshipVp.layers.DISTANCE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- DISTANCE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideClanshipVp:Reset()

	UI.HudObjectMarkWnd.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DISTANCE )

	if self.hpEffect:GetCurAnimationId() ~= -1 then
		self.hpEffect:SetAnimationTimeAndUpdate( 0 )
	end

	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, UI.INVALID_RESOURCE_HANDLE )
	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoNameOutline, UI.INVALID_RESOURCE_HANDLE )

	self.mainEffect:StartAnimationById( self.animId_main_white )

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:Update()

	UI.HudObjectMarkWnd.Update( self )

	self:UpdateMainAnimation()
	self:UpdateIco()
	self:UpdateName()
	self:UpdateHp()
	self:UpdateDistance()

end


-- ------------------------------
-- const
-- ------------------------------

icvp.layers =
{
    MAIN_EFFECT				= 0,
    ICO_EFFECT				= 1,
	NAME_EFFECT				= 2,
	NAME					= 3,
    HP_EFFECT				= 4,
    DISTANCE_EFFECT			= 5,
    DISTANCE				= 6, 
}

icvp.effectInfo =
{
	main =
	{
		animWhite			= "idle",
		animFriendCapturing	= "blink",
	},

	name =
	{
        enemyInRange				= "enemy_shot",
        enemyOutRange				= "enemy",
        friendInRange				= "friend_shot",
        friendOutRange				= "friend",
		backColorEnemyLocator		= "name_outl",
		backColorFriendLocator		= "name_outl2",
	},

	dist =
	{
        enemyInRange				= "enemy_shot",
        enemyOutRange				= "enemy",
        friendInRange				= "friend_shot",
        friendOutRange				= "friend",
		backColorEnemyLocator		= "name_outl",
		backColorFriendLocator		= "name_outl2",
	},

	hp =
	{
        enemyInRange				= "en_shot",
        enemyOutRange				= "en",
        friendInRange				= "fr_shot",
        friendOutRange				= "fr",
		animWhite					= "white",
	},

	ico =
	{
        enemyInRange			= "enemy_shot",
        enemyOutRange			= "enemy",
        friendInRange			= "friend_shot",
        friendOutRange			= "friend",
		spriteIcoName			= "ico",
		spriteIcoNameOutline	= "ico_bg",
		animWhite				= "white",
	},
}

icvp.strM = UI:GetStringByName( "meter" )

icvp.wndType = UI.HudObjectsMarksWnd.wndTypes.INSIDE_CLANSHIP_VITAL_POINT

-- ------------------------------
-- vars
-- ------------------------------

icvp.animId_main_capturing =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
}

icvp.animId_main_white						= -1

icvp.animId_ico_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_ico_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_ico_white						= -1

icvp.animId_hp_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_hp_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_hp_white						= -1

icvp.animId_name_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_name_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_dist_inRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.animId_dist_outRange =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
}

icvp.nameBackColor =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= 0,
	[ UI.gameObjColorSchemes.ENEMY ]		= 0,
}

icvp.distBackColor =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= 0,
	[ UI.gameObjColorSchemes.ENEMY ]		= 0,
}

icvp.mainEffect						= nil
icvp.icoEffect						= nil
icvp.hpEffect						= nil
icvp.nameEffect						= nil
icvp.distEffect                     = nil
icvp.nameLayer						= nil
icvp.distLayer						= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMarkWnd_InsideClanshipVp:F_PostLoad()

	UI.HudObjectMarkWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end 

	if self.mainEffect then

		self.animId_main_white = self.mainEffect:GetAnimationId( self.effectInfo.main.animWhite )

		self.animId_main_capturing = {}
		self.animId_main_capturing[ UI.gameObjColorSchemes.FRIEND ]	= self.mainEffect:GetAnimationId( self.effectInfo.main.animFriendCapturing )

	end

	self.icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if self.icoEffect then

		self.animId_ico_inRange = {}
        self.animId_ico_inRange[ UI.gameObjColorSchemes.FRIEND ]	= self.icoEffect:GetAnimationId( self.effectInfo.ico.friendInRange )
        self.animId_ico_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.icoEffect:GetAnimationId( self.effectInfo.ico.enemyInRange )

		self.animId_ico_outRange = {}
        self.animId_ico_outRange[ UI.gameObjColorSchemes.FRIEND ]	= self.icoEffect:GetAnimationId( self.effectInfo.ico.friendOutRange )
        self.animId_ico_outRange[ UI.gameObjColorSchemes.ENEMY ]	= self.icoEffect:GetAnimationId( self.effectInfo.ico.enemyOutRange )

		self.animId_ico_white = self.icoEffect:GetAnimationId( self.effectInfo.ico.animWhite )

	end   

	self.nameEffect = UI:GetEffectFromLayer( self, self.layers.NAME_EFFECT )
	if self.nameEffect then

		self.animId_name_inRange = {}
        self.animId_name_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.friendInRange )
        self.animId_name_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.enemyInRange )

		self.animId_name_outRange = {}
        self.animId_name_outRange[ UI.gameObjColorSchemes.FRIEND ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.friendOutRange )
        self.animId_name_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.nameEffect:GetAnimationId( self.effectInfo.name.enemyOutRange )

		self.nameBackColor = {}
    	self.nameBackColor[ UI.gameObjColorSchemes.FRIEND ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorFriendLocator )
    	self.nameBackColor[ UI.gameObjColorSchemes.ENEMY ]				= self.nameEffect:GetObjBackColor( self.effectInfo.name.backColorEnemyLocator )

	end

	self.hpEffect = UI:GetEffectFromLayer( self, self.layers.HP_EFFECT )
	if self.hpEffect then

		self.animId_hp_inRange = {}
        self.animId_hp_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.hpEffect:GetAnimationId( self.effectInfo.hp.friendInRange )
        self.animId_hp_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.hpEffect:GetAnimationId( self.effectInfo.hp.enemyInRange )

		self.animId_hp_outRange = {}
        self.animId_hp_outRange[ UI.gameObjColorSchemes.FRIEND ]	= self.hpEffect:GetAnimationId( self.effectInfo.hp.friendOutRange )
        self.animId_hp_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.hpEffect:GetAnimationId( self.effectInfo.hp.enemyOutRange )

		self.animId_hp_white = self.hpEffect:GetAnimationId( self.effectInfo.hp.animWhite )

	end   

	self.distEffect = UI:GetEffectFromLayer( self, self.layers.DISTANCE_EFFECT )
	if self.distEffect then

		self.animId_dist_inRange = {}
        self.animId_dist_inRange[ UI.gameObjColorSchemes.FRIEND ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.friendInRange )
        self.animId_dist_inRange[ UI.gameObjColorSchemes.ENEMY ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.enemyInRange )

		self.animId_dist_outRange = {}
        self.animId_dist_outRange[ UI.gameObjColorSchemes.FRIEND ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.friendOutRange )
        self.animId_dist_outRange[ UI.gameObjColorSchemes.ENEMY ]		= self.distEffect:GetAnimationId( self.effectInfo.dist.enemyOutRange )

		self.distBackColor = {}
    	self.distBackColor[ UI.gameObjColorSchemes.FRIEND ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorFriendLocator )
    	self.distBackColor[ UI.gameObjColorSchemes.ENEMY ]				= self.distEffect:GetObjBackColor( self.effectInfo.dist.backColorEnemyLocator )

	end   

	self.nameLayer = self:GetLayer( UI.LAYER_TEXT, self.layers.NAME, 0 )
	self.distLayer = self:GetLayer( UI.LAYER_TEXT, self.layers.DISTANCE, 0 )

	self:Reset()

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:UpdateMainAnimation()

	local animId = -1

	if self:NeedShowCapturing() then
		animId = self.animId_main_capturing[ self.mark.data.colorScheme ]
	else
		animId = self.animId_main_white
	end

	if animId and animId ~= -1 and animId ~= self.mainEffect:GetCurAnimationId() then
		self.mainEffect:StartAnimationById( animId )
	end

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:UpdateIco()

	if self.mark.data.bFirstUpdate then

		-- иконка

		local hTex = UI:GetClanshipVpIco( self.mark.defName )

		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoName, hTex )
		self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteIcoNameOutline, hTex )

	end

	-- анимация

	local animId = -1

	if self:NeedShowCapturing() then
		animId = self.animId_ico_white

	elseif self.mark.data.isInFireRange then
		animId = self.animId_ico_inRange[ self.mark.data.colorScheme ]
	else
		animId = self.animId_ico_outRange[ self.mark.data.colorScheme ]
	end

	if animId and animId ~= -1 and animId ~= self.icoEffect:GetCurAnimationId() then
		self.icoEffect:StartAnimationById( animId )
	end

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:UpdateName()

	if self.mark.data.bFirstUpdate then

		-- текст

    	local name = UI:GetEntityLocalizedNameByDef( self.mark.defName, false, false, false, false )
        self:SetText( name, self.layers.NAME )

	end

	-- анимация

	local animId = -1
	local backColor = 0

	if self.mark.data.isInFireRange then
		animId		= self.animId_name_inRange[ self.mark.data.colorScheme ] or -1
		backColor	= self.nameBackColor[ self.mark.data.colorScheme ] or 0
	else
		animId		= self.animId_name_outRange[ self.mark.data.colorScheme ] or -1
	end

	if animId ~= -1 and animId ~= self.nameEffect:GetCurAnimationId() then
		self.nameEffect:StartAnimationById( animId )
	end

	self.nameLayer:SetBackColor( backColor )

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:UpdateHp()

	-- анимация

	local animId = -1

	if self:NeedShowCapturing() then
		animId = self.animId_hp_white

	elseif self.mark.data.isInFireRange then
		animId = self.animId_hp_inRange[ self.mark.data.colorScheme ]
	else
		animId = self.animId_hp_outRange[ self.mark.data.colorScheme ]
	end

	if animId and animId ~= -1 and animId ~= self.hpEffect:GetCurAnimationId() then
		self.hpEffect:StartAnimationById( animId )
	end


	-- прогресс

	if animId and animId ~= -1 then

    	local hp = 0
    	if self.mark.previewHp then
    		hp = self.mark.previewHp
    	else
    		if self.mark.ent and not self.mark.ent:IsDead() then
    			hp = self.mark.ent:GetHealth()
    		end
    	end

    	local maxHp = 0
    	if self.mark.previewMaxHp then
    		maxHp = self.mark.previewMaxHp
    	else
    		if self.mark.ent and not self.mark.ent:IsDead() then
    			maxHp = self.mark.ent:GetMaxHealth()
    		end
    	end

    	local animTime = 1 - UI:Clamp( maxHp ~= 0 and hp / maxHp or 0, 0, 1 )

    	self.hpEffect:SetAnimationTimeAndUpdate( animTime )

	end

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:UpdateDistance()

	-- текст

	local strDist = ""
	if self.mark.data.dist >= 0 then
		strDist = string.format( "%d %s", math.floor( self.mark.data.dist * 10 ), self.strM )
	end

	self:SetText( strDist, self.layers.DISTANCE )


	-- анимация

	local animId = -1
	local backColor = 0

	if self.mark.data.isInFireRange then
		animId		= self.animId_dist_inRange[ self.mark.data.colorScheme ] or -1
		backColor	= self.distBackColor[ self.mark.data.colorScheme ] or 0
	else
		animId		= self.animId_dist_outRange[ self.mark.data.colorScheme ] or -1
	end

	if animId ~= -1 and animId ~= self.distEffect:GetCurAnimationId() then
		self.distEffect:StartAnimationById( animId )
	end

	self.distLayer:SetBackColor( backColor )

end


--
function UI.HudObjectMarkWnd_InsideClanshipVp:NeedShowCapturing()

	local bCapturing = false

	if self.mark.data.relationship == ai.RelatioshipType.FRIEND and not self.mark.data.isInFireRange then
		bCapturing = self.mark.ent and self.mark.ent:IsUnderAttack()
	end

	return bCapturing
	
end


-- ------------------------------------------------------------------
-- UI.HudObjectMark_PredictionWnd
-- ------------------------------------------------------------------

UI.HudObjectMark_PredictionWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjectMark_PredictionWnd.def =
{
	className	= "Wnd",
	prototype	= "PredictionWnd",

	props =
	{
		name		= "HudObjectMark_PredictionWnd",
		isPrototype	= true,
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudObjectMark_PredictionWnd:SetupForMark( mark )

	self.mark = mark

end


--
function UI.HudObjectMark_PredictionWnd:Reset()

	self.mark = nil

end


-- ------------------------------
-- vars
-- ------------------------------

UI.HudObjectMark_PredictionWnd.mark	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjectMark_PredictionWnd:GetObjects()

	return UI.HudWnd.myShip, self.mark.ent, self.mark.data.isLock and not self.mark.data.isLocking

end


-- технические окна, помогающие организовать z-order предикшенов
-- ------------------------------------------------------------------
-- UI.HudObjectsMarks_MarksWnd,  UI.HudObjectsMarks_PredictionsWnd
-- ------------------------------------------------------------------

--
UI.HudObjectsMarks_MarksWnd =
{
    def =
    {
    	className	= "Wnd",

    	props =
    	{
    		name	= "HudObjectsMarks_MarksWnd",
    		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
			rectAbs	= Quat( 0, 0, 1024, 768 ),
    	}
    }
}


--
UI.HudObjectsMarks_PredictionsWnd =
{
    def =
    {
    	className	= "Wnd",

    	props =
    	{
    		name	= "HudObjectsMarks_PredictionsWnd",
    		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
			rectAbs	= Quat( 0, 0, 1024, 768 ),
    	}
    }
}