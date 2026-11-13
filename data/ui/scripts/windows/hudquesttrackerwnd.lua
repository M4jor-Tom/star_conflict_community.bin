-- ----------------------------------------------------------------------------
--
-- Workfile: hudquesttrackerwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudQuestTrackerWnd = {}

-- ----------------------------------------
-- window definition
-- ----------------------------------------

UI.HudQuestTrackerWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudQuestTrackerWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "hud_questTracker",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value28",
						layer		= "UI.HudQuestTrackerWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
		},  
	},

	children = { "UI.HudQuestTracker_StateBtn" }
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.HudQuestTrackerWnd:Reset()

	self:SetState( self.states.NO_QUESTS )
	self.quests = {}
	self.bListDirty = false

	self.adventures = {}

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_QUEST_PROGRESS then
		if type( params.questId ) == "number" then

			local slotWnd = self:FindSlotByQuestId( params.questId, UI.questTypes.REGULAR )
			if slotWnd then
				slotWnd:OnQuestProgressChanged()
				self:RecalcLayout()
			end
	
		else
			sys.log( "UI.HudQuestTrackerWnd:MasterServer_OnNotification()[ERROR]: invalid type of \"params.questId\" in notification \"SN_QUEST_PROGRESS\"; \"number\" expected, got \"%s\"", type( params.questId ) )
		end
	elseif notification == _G.MasterServer.ServerNotification.SN_ADVENTURE_PROGRESS then
		if type( params.aiid ) == "userdata" then
			
			local slotWnd = self:FindSlotByAiid( params.aiid )
			if slotWnd then
				slotWnd:OnAdventureProgressChanged()
				self:RecalcLayout()
			end

		end
	end

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnAdventureStageChange( param )

	if not self:IsOnScreen() then
		return
	end

	local slotWnd = self:FindSlotByAiid( param.aiid )
	if slotWnd then

		slotWnd:OnAdventureProgressChanged()
		self:RecalcLayout()

	end

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	local questId = param1

	local slotWnd = self:FindSlotByQuestId( questId, UI.questTypes.REGULAR )
	if slotWnd then

		slotWnd:OnQuestCompleted()
		self:RecalcLayout()

	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnAdventureFinal( param )

	if not self:IsOnScreen() then
		return
	end

	local slotWnd = self:FindSlotByAiid( param.aiid )
	if slotWnd then

		slotWnd:OnAdventureFinal( param.finish )
		self:RecalcLayout()

	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnNewAdventure( param )

	if not self:IsOnScreen() then
		return
	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.HudQuestTrackerWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.HudQuestTrackerWnd:OnSlotAnimatingCompleteEnded( slot )

	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:OnSlotAnimatingCompleteStageEnded( slot )

	self:RecalcLayout()

end


--
function UI.HudQuestTrackerWnd:GetState()

	return self.state

end


--
function UI.HudQuestTrackerWnd:OnInvasionInfo( spawned, killed )

	if not self:IsOnScreen() then
		return
	end

	local bRecalcLayout = false

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		local bSlotRecalcLayout = slotWnd:OnInvasionInfoChanged()

		if bSlotRecalcLayout then
			bRecalcLayout = true
		end

	end

	if bRecalcLayout then
		self:RecalcLayout()
	end

end


--
function UI.HudQuestTrackerWnd:OnPveEventAcivate( id )

	if not self:IsOnScreen() then
		return
	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:OnPveEventComplete( id )

	if not self:IsOnScreen() then
		return
	end

	local slotWnd = self:FindSlotByQuestId( id, UI.questTypes.PVE_EVENT )
	if slotWnd then

		slotWnd:OnQuestCompleted()
		self:RecalcLayout()

	end

	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:OnPveEventProgress( id )

	if not self:IsOnScreen() then
		return
	end

	local slotWnd = self:FindSlotByQuestId( id, UI.questTypes.PVE_EVENT )
	if slotWnd then
		slotWnd:OnQuestProgressChanged()
		self:RecalcLayout()
	end

end


--
function UI.HudQuestTrackerWnd:OnBindsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	for slotIdx, slotWnd in ipairs( self.curSlots ) do
		slotWnd:OnBindsChanged()
	end

	self:RecalcLayout()
	
end


--
function UI.HudQuestTrackerWnd:OnScriptedQuestAdd( questId )
	
	if not self:IsOnScreen() then
		return
	end
	
	self.bListDirty = true
	self:CheckFullUpdate()

end


--
function UI.HudQuestTrackerWnd:OnScriptedQuestRemove( questId )
	
	if not self:IsOnScreen() then
		return
	end

	self.bListDirty = true
	self:CheckFullUpdate()
	
end


--
function UI.HudQuestTrackerWnd:OnScriptedQuestProgress( questId )
	
	if not self:IsOnScreen() then
		return
	end
	
	local slotWnd = self:FindSlotByQuestId( questId, UI.questTypes.SCRIPTED )
	if slotWnd then
		slotWnd:OnQuestProgressChanged()
		self:RecalcLayout()
	end
	
end


-- ----------------------------------------
-- const
-- ----------------------------------------

UI.HudQuestTrackerWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.HudQuestTrackerWnd.effectInfo = 
{
	main =
	{
		slotLocatorPrefix	= "slot_",
		closedSizeLocator	= "self_2",
		stateBtnLocator		= "btn",
	}
}

UI.HudQuestTrackerWnd.MAX_SLOTS = 4

UI.HudQuestTrackerWnd.states =
{
	OPEN		= 1,
	CLOSED		= 2,
	NO_QUESTS	= 3,
}

UI.HudQuestTrackerWnd.defaultState	= UI.HudQuestTrackerWnd.states.OPEN

-- ----------------------------------------
-- vars
-- ----------------------------------------

UI.HudQuestTrackerWnd.state			= UI.HudQuestTrackerWnd.states.NO_QUESTS
UI.HudQuestTrackerWnd.allSlots		= {} 
UI.HudQuestTrackerWnd.curSlots		= {} 
UI.HudQuestTrackerWnd.stateBtn		= nil
UI.HudQuestTrackerWnd.quests		= {}
UI.HudQuestTrackerWnd.space_slots	= 0
UI.HudQuestTrackerWnd.closedHeight	= 0
UI.HudQuestTrackerWnd.firstSlotPos	= Vec2( 0, 0 )
UI.HudQuestTrackerWnd.bListDirty	= false

-- ----------------------------------------
-- vars
-- ----------------------------------------

--
function UI.HudQuestTrackerWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudQuestTrackerWnd:CreateControls()

	for slotIdx = 1, self.MAX_SLOTS do
		local slotWnd = UI:CreateChildWnd( self, UI.HudQuestTracker_SlotWnd, tostring( slotIdx ) )
		table.insert( self.allSlots, slotWnd )
	end

	self.stateBtn = UI.HudQuestTracker_StateBtn

end


--
function UI.HudQuestTrackerWnd:ResetSlots()

	for slotIdx, slotWnd in ipairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.HudQuestTrackerWnd:FullUpdate()

	self:UpdateQuests()
	self:UpdateAdventures()
	self:ValidateState()

end


--
function UI.HudQuestTrackerWnd:UpdateQuests()

	self.quests = self:GetQuests()
	self.bListDirty = false

end


--
function UI.HudQuestTrackerWnd:UpdateAdventures()

	self.adventures = self:GetAdventures()
	self.bListDirty = false

end


--
function UI.HudQuestTrackerWnd:GetQuests()

	local fitQuests = {}

	local gameplay = _G.GetCurrentGameMode()
	
	-- регулярные квесты
	if gameplay == ai.Gameplay.FREE_SPACE or gameplay == ai.Gameplay.PVE_MISSION or UI:IsPvpGameplay( gameplay ) then

		for idx, questInfo in ipairs( UI.serverData.activeQuests ) do
			if self:IsQuestFit( questInfo.id, UI.questTypes.REGULAR ) then
				table.insert( fitQuests, { questId = questInfo.id, questType = UI.questTypes.REGULAR } )
			end
		end
		
	end
		
	-- квесты из PveEvents
	if gameplay == ai.Gameplay.PVE_MISSION then

		for questId, questInfo in pairs( _G.PvE_Common.UI.PveEvents:GetEvents() ) do
			if questInfo.bActive and self:IsQuestFit( questId, UI.questTypes.PVE_EVENT ) then
				table.insert( fitQuests, { questId = questId, questType = UI.questTypes.PVE_EVENT } )
			end
		end

	end
	
	-- скриптовые квесты
	for idx, questData in ipairs( UI.scriptedQuests ) do
		if self:IsQuestFit( questId, UI.questTypes.SCRIPTED ) then
			table.insert( fitQuests, { questId = questData.questId, questType = UI.questTypes.SCRIPTED } )
		end
	end

	self:SortQuests( fitQuests )

	local visibleQuests = {}
	-- for idx = 1, math.min( #fitQuests, self.MAX_SLOTS ) do
	for idx = 1, math.min( #fitQuests, self.MAX_SLOTS - #self.adventures ) do
		table.insert( visibleQuests, fitQuests[ idx ] )
	end

	return visibleQuests

end


--
function UI.HudQuestTrackerWnd:GetAdventures()

	local fitAdventures = {}

	-- регулярные квесты
	if _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then

		for idx, adventureInfo in ipairs( UI.serverData.activeAdventures ) do
			if self:IsAdventureFit( adventureInfo.aiid ) then
				-- table.insert( fitAdventures, { aiid = adventureInfo.aiid } )
				table.insert( fitAdventures, { 	aiid 	= adventureInfo.aiid,
												atid 	= adventureInfo.atid,
												params 	= adventureInfo.params,
											} )
			end
		end

	end

	--self:SortQuests( fitAdventures )

	local visibleAdventures = {}
	for idx = 1, math.min( #fitAdventures, self.MAX_SLOTS - #self.quests ) do
		table.insert( visibleAdventures, fitAdventures[ idx ] )
	end

	return visibleAdventures

end


--
function UI.HudQuestTrackerWnd:IsQuestFit( questId, questType )

	if questType == UI.questTypes.REGULAR then
	
		if not UI:IsQuestUnlockedByRank( questId ) then
			return false
		end
	
		local gameplay = _G.GetCurrentGameMode()
		if gameplay == ai.Gameplay.FREE_SPACE then

			if not UI:IsQuestOpenWorld( questId ) or UI:IsQuestHidden( questId ) then
				return false
			end
		
			local bAuto = UI:IsQuestAuto( questId )
		
			if bAuto then
		
				local stage = UI:GetQuestStage( questId )
				local questZones = UI:GetQuestZonesForStage( questId, stage )
				local curZoneId = UI:GetCurZone()
				
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
		
			local questHangarRace	= UI:GetQuestHangarRace( questId )
			local hangarRace		= UI:GetCurSpaceStationRace()
		
			if not( questHangarRace == -1 or questHangarRace == hangarRace ) then
				return false
			end
			
		-- Для пве и пвп проверяем, что квест выполняется в этом режиме и на этой карте (#0099658)
		elseif gameplay == ai.Gameplay.PVE_MISSION or UI:IsPvpGameplay( gameplay ) then
		
			local bIsQuestFitByRestrictions = false
		
			local stage = UI:GetQuestStage( questId )
			local stageInfo = UI:GetQuestStageInfo( questId, stage )
			if stageInfo then
			
				-- должен быть один из допустимых ивентов
				local fitGameEvents =
				{
					ai.GameEvent.PLAY_GAME,
					ai.GameEvent.HEAL,
					ai.GameEvent.GAIN_MEDAL,
					ai.GameEvent.EFFECTIVE_POINTS,
					ai.GameEvent.DEAL_DAMAGE,
					ai.GameEvent.TAKEDOWN,
					ai.GameEvent.GAMEPLAY_ACTION,
					ai.GameEvent.KILL_OBJECT,
				}
				
				local bIsGameEventFit = false
				for gameEventIdx, gameEventId in pairs( fitGameEvents ) do
					if stageInfo.game_event == gameEventId then
						bIsGameEventFit = true
						break
					end
				end
			
				if bIsGameEventFit and type( stageInfo.restrictions ) == "table" then
				
					local battleType = _G.GetCurrentBattleType()
					local levelName = UI:GetCurLevelName()
				
					-- хотя бы один рестрикшен из необходимых должен быть прописан в квесте, для того, чтобы квест показывался;
					-- все из прописанных должны выполняться
					local bHasNeedRestrictions = false
					local bAllRestrictionsSucceed = true
				
					for restrictionIdx, restrictionInfo in pairs( stageInfo.restrictions ) do
					
						local bIsRestrictionNeed = false
						local isRestrictionSucceed = false
					
						if type( restrictionInfo ) == "table" then
							
							if restrictionInfo.param == ai.GameEventParam.GAMEPLAY then
							
								bIsRestrictionNeed = true
							
								if type( restrictionInfo.num_value ) == "table" then
									for gameplayIdx, _gameplay in pairs( restrictionInfo.num_value ) do
										if _gameplay == gameplay then
											isRestrictionSucceed = true
											break
										end
									end
								end
								
							elseif restrictionInfo.param == ai.GameEventParam.BATTLE_TYPE then
							
								bIsRestrictionNeed = true
								
								if type( restrictionInfo.num_value ) == "table" then
									for battleTypeIdx, _battleType in pairs( restrictionInfo.num_value ) do
										if _battleType == battleType then
											isRestrictionSucceed = true
											break
										end
									end
								end
								
							elseif restrictionInfo.param == ai.GameEventParam.LEVEL_NAME then
							
								bIsRestrictionNeed = true
								
								if type( restrictionInfo.str_value ) == "table" then
									for levelNameIdx, _levelName in pairs( restrictionInfo.str_value ) do
										if _levelName == levelName then
											isRestrictionSucceed = true
											break
										end
									end
								end
								
							end
						
						end
						
						if bIsRestrictionNeed then
						
							bHasNeedRestrictions = true
							
							if not isRestrictionSucceed then
								bAllRestrictionsSucceed = false
								break
							end

						end
					
					end
					
					if bHasNeedRestrictions and bAllRestrictionsSucceed then
						bIsQuestFitByRestrictions = true
					end
					
				end
			
			else
				sys.log( "UI.HudQuestTrackerWnd:IsQuestFit()[ERROR]: cannot find stage info for quest %d stage %d", questId, stage )
			end
			
			if not bIsQuestFitByRestrictions then
				return false
			end
		
		else
			sys.log( "UI.HudQuestTrackerWnd:IsQuestFit()[ERROR]: unhandled gameplay %d for regular quest", gameplay )
			return false
		end

		return true

	elseif questType == UI.questTypes.PVE_EVENT then
		return true
		
	elseif questType == UI.questTypes.SCRIPTED then
		return true
		
	else
		sys.log( "UI.HudQuestTrackerWnd:IsQuestFit()[ERROR]: unhandled quest type: %s", tostring( questType ) )
		return false
	end

end


--
function UI.HudQuestTrackerWnd:IsAdventureFit( aiid )

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return false
	end

	if not UI:IsAdventureTaken( aiid ) then
		return false
	end

	local adventureZones = UI:GetAdventureZonesForStageT( aiid )
	local curZoneId = UI:GetCurZone()

	local bCurZone = false

	for idx, zoneId in ipairs( adventureZones ) do
		if zoneId == curZoneId then
			bCurZone = true
			break
		end
	end

	if not bCurZone then
		return false
	end

	return true

end


--
function UI.HudQuestTrackerWnd:SortQuests( quests )

	local regularQuestsOrder = {}

	for idx, questInfo in ipairs( UI.serverData.activeQuests ) do
		regularQuestsOrder[ questInfo.id ] = idx
	end   

	local function fnSort( quest1, quest2 )

		if quest1.questType ~= quest2.questType then

			if quest1.questType == UI.questTypes.REGULAR then
				return true
			elseif quest2.questType == UI.questTypes.REGULAR then
				return false
			else
				return quest1.questType < quest2.questType
			end

		end

		if quest1.questType == UI.questTypes.REGULAR then

    		local bAuto1 = UI:IsQuestAuto( quest1.questId )
    		local bAuto2 = UI:IsQuestAuto( quest2.questId )

    		if not bAuto1 and bAuto2 then
    			return true
    		end

    		if bAuto1 and not bAuto2 then
    			return false
    		end

    		local takeOrder1 = regularQuestsOrder[ quest1.questId ] or -1
    		local takeOrder2 = regularQuestsOrder[ quest2.questId ] or -1

    		return takeOrder1 < takeOrder2

		elseif quest1.questType == UI.questTypes.PVE_EVENT then

			local startTime1 = _G.PvE_Common.UI.PveEvents:GetEventStarTime( quest1.questId )
			local startTime2 = _G.PvE_Common.UI.PveEvents:GetEventStarTime( quest2.questId )

			if startTime1 ~= startTime2 then
				return startTime1 > startTime2
			end

			return quest1.questId < quest2.questId
			
		elseif quest1.questType == UI.questTypes.SCRIPTED then
		
			return quest1.questId < quest2.questId

		end

		return false

	end

	table.sort( quests, fnSort )

end


--
function UI.HudQuestTrackerWnd:ValidateState()

	local state = self.state

	if self.quests[ 1 ] or self.adventures[ 1 ] then

		if state == self.states.NO_QUESTS then

			state = self:GetRestoredState()

			if state == -1 then
				state = self.defaultState
			end

		end

	else
		state = self.states.NO_QUESTS
	end

	self:SetState( state )

end


--
function UI.HudQuestTrackerWnd:GetRestoredState()

	local profile = _G.GetProfileTable()

	local state = profile.questTrackerState

	if type( state ) ~= "number" or UI:Val2Key( self.states, state ) == "" or state == self.states.NO_QUESTS then
		state = -1
	end

	return state

end


--
function UI.HudQuestTrackerWnd:SaveState()

	if self.state == -1 or self.state == self.states.NO_QUESTS then
		return
	end 

	local profile = _G.GetProfileTable()

	local savedState = profile.questTrackerState
	if savedState ~= self.state then

		profile.questTrackerState = self.state
		Profile:Save()

	end

end


--
function UI.HudQuestTrackerWnd:SetState( state )

	if self.bListDirty then
		self:UpdateQuests()
		self:UpdateAdventures()
	end

	self.state = state

	if self.state == self.states.OPEN then

		self:RemoveStyle( UI.WS_NOT_DRAW )		
		self:AddControl( self.stateBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.stateBtnLocator )
		self.stateBtn:Check( false )
		self:UpdateSlots()
		self:UpdateCaption()

	elseif self.state == self.states.CLOSED then

		self:RemoveStyle( UI.WS_NOT_DRAW )		
		self:AddControl( self.stateBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.stateBtnLocator )
		self.stateBtn:Check( true )
		self:ResetSlots()
		self:UpdateCaption()

	elseif self.state == self.states.NO_QUESTS then

		self:AddStyle( UI.WS_NOT_DRAW )
		self:RemoveControl( self.stateBtn, self.layers.MAIN_EFFECT )
		self:ResetSlots()

	end

	self:RecalcLayout()

	self:SaveState()

end


--
function UI.HudQuestTrackerWnd:UpdateSlots()

	self:ResetSlots()

	for slotIdx, quest in ipairs( self.quests ) do
		
		local slotWnd = self:GetFreeSlot()
		if slotWnd then

			self:AddChild( slotWnd )
			slotWnd:Setup( quest.questId, quest.questType )

			table.insert( self.curSlots, slotWnd )

		end

	end

	for slotIdx, adventure in ipairs( self.adventures ) do
		
		local slotWnd = self:GetFreeSlot()
		if slotWnd then

			self:AddChild( slotWnd )
			-- slotWnd:SetupAdventure( adventure.aiid )
			slotWnd:SetupAdventure( adventure )

			table.insert( self.curSlots, slotWnd )

		end

	end

	self:RecalcLayout()

end


--
function UI.HudQuestTrackerWnd:GetFreeSlot()

	for slotIdx, slotWnd in ipairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	sys.log( "UI.HudQuestTrackerWnd:GetFreeSlot()[ERROR]: no free slots" )
	return nil

end


--
function UI.HudQuestTrackerWnd:UpdateCaption()

	local str = UI:GetStringByName( "hudQuestTracker_caption" )

	local bNeedShowNuQuests = self.state == self.states.CLOSED
	if bNeedShowNuQuests then
		-- str = string.format( "%s (%d)", str, #self.quests )
		str = string.format( "%s (%d)", str, #self.quests + #self.adventures )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.HudQuestTrackerWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local slotWnd = self.allSlots[ 1 ]
	local slotMainEffect = slotWnd and UI:GetEffectFromLayer( slotWnd, slotWnd.layers.MAIN_EFFECT )

	local selfSize		= mainEffect:GetObjSize( "self" )
	local closedSize    = mainEffect:GetObjSize( self.effectInfo.main.closedSizeLocator )
	local firstSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) )
	local secondSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) )
	local slotSize		= slotMainEffect and slotMainEffect:GetObjSize( "self" )

	self.space_slots	= secondSlotPos.y - ( firstSlotPos.y + slotSize.y )
	self.closedHeight	= closedSize.y
	self.firstSlotPos	= firstSlotPos

	self:SetWidth( selfSize.x ) 

end


--
function UI.HudQuestTrackerWnd:RecalcLayout()

	local numSlots = #self.curSlots

	if numSlots > 0 then

		local y = self.firstSlotPos.y

		for slotIdx = 1, numSlots do

			local slotWnd = self.curSlots[ slotIdx ]
			slotWnd:SetPos( self.firstSlotPos.x, y )

			y = y + slotWnd:GetHeight() + self.space_slots			

		end
		
		local lastSlotWnd = self.curSlots[ numSlots ]
		local lastSlotRect = lastSlotWnd:GetRect()
		local selfHeight = lastSlotRect.y + lastSlotRect.w

		self:SetHeight( selfHeight )

	else

		self:SetHeight( self.closedHeight )

	end
	
end


--
function UI.HudQuestTrackerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()
	self:UpdateEffects()

end


--
function UI.HudQuestTrackerWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.HudQuestTrackerWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		mainEffect:UpdatePos()
	end

end


--
function UI.HudQuestTrackerWnd:FindSlotByQuestId( questId, questType )

	for slotIdx, slotWnd in ipairs( self.curSlots ) do
		if slotWnd:GetQuestType() == questType and slotWnd:GetQuestId() == questId then
			return slotWnd
		end
	end

	return nil

end


--
function UI.HudQuestTrackerWnd:FindSlotByAiid( aiid )

	for slotIdx, slotWnd in ipairs( self.curSlots ) do
		if slotWnd:GetAiid() == aiid then
			return slotWnd
		end
	end

	return nil

end


--
function UI.HudQuestTrackerWnd:F_OnEventSaveUiState()

	if not UI.HudWnd:IsOnScreen() then
		return
	end 

	UI.store.HudQuestTrackerWnd =
	{
		state = self.state
	}

end


--
function UI.HudQuestTrackerWnd:F_OnEventRestoreUiState()

	if UI.store.HudQuestTrackerWnd then

		self.state = UI.store.HudQuestTrackerWnd.state

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.HudQuestTrackerWnd = nil

	end

end


--[[
function UI.HudQuestTrackerWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.stateBtn then
		self:ToggleState()

	elseif UI:IsWndKindOf( wnd, "HudQuestTracker_SlotWnd" ) then

		if wnd:GetQuestType() == UI.questTypes.REGULAR then
			UI.QuestInfoWnd:Show()
			UI.QuestInfoWnd:Setup( wnd:GetQuestId(), UI.questTypes.REGULAR )
		end

	end

	return true

end]]


--
function UI.HudQuestTrackerWnd:ToggleState()

	if self.state == self.states.NO_QUESTS then
		sys.log( "UI.HudQuestTrackerWnd:ToggleState()[ERROR]: invlid state" )
		return
	end

	self:SetState( self.state == self.states.OPEN and self.states.CLOSED or self.states.OPEN )

end


--
function UI.HudQuestTrackerWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.HudQuestTrackerWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end  


--
function UI.HudQuestTrackerWnd:IsAnimatingComplete()

	for slotIdx, slotWnd in ipairs( self.curSlots ) do
		if slotWnd:IsAnimatingComplete() then
			return true
		end
	end

	return false

end


--
function UI.HudQuestTrackerWnd:CheckFullUpdate()

	if not self.bListDirty then
		return
	end

	if self:IsAnimatingComplete() then
		return
	end

	self:FullUpdate()

end


-- --------------------------------------------------------------------------
-- UI.HudQuestTracker_SlotWnd
-- --------------------------------------------------------------------------

UI.HudQuestTracker_SlotWnd = {}

-- ----------------------------------------
-- window definition
-- ----------------------------------------

UI.HudQuestTracker_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudQuestTracker_SlotWnd",
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
				defName 			= "hud_questTracker_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "desript_1",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.STAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "desript_2",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.STAGE_NEW_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bg",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}		
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_questTracker_slot_bg",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "timer",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.TIME_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TIME_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- STAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_questTracker_slot_stage",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "text18",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "text17",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.STATE_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},     
				}
			}}
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},  

		-- STATE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_questTracker_slot_questState",
			}}
		},

		-- STAGE_NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_questTracker_slot_stage",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "text18",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.DESC_NEW",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "text17",
						layer		= "UI.HudQuestTracker_SlotWnd.layers.STATE_NEW_EFFECT",
						animParams	= UI.EffectAnimParams.ALPHA,
					},     
				}
			}}
		},    

		-- DESC_NEW
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},  

		-- STATE_NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_questTracker_slot_questState",
			}}
		},
	}
}

-- ----------------------------------------
-- interface functions
-- ----------------------------------------

--
function UI.HudQuestTracker_SlotWnd:Setup( questId, questType )

	self:Reset()

	self.questId		= questId
	self.questType		= questType

	-- self.questStage 	= self:GetQuestStage()
	self.stage 			= self:GetQuestStage()

	self:FullUpdate()

end


--
function UI.HudQuestTracker_SlotWnd:SetupAdventure( adventure )

	self:Reset()

	--self.aiid 			= aiid
	self.adventure		= adventure
	self.stage 			= self:GetAdventureStage()

	self:FullUpdate()

end


--
function UI.HudQuestTracker_SlotWnd:IsAdventure()

	-- return self.aiid ~= -1
	return self.adventure ~= nil

end


--
function UI.HudQuestTracker_SlotWnd:GetQuestId()

	return self.questId

end


--
function UI.HudQuestTracker_SlotWnd:GetQuestType()

	return self.questType

end


--
function UI.HudQuestTracker_SlotWnd:GetAiid()

	return self.adventure and self.adventure.aiid or -1

end


--
function UI.HudQuestTracker_SlotWnd:OnQuestProgressChanged()

	local curStage = self:GetQuestStage()

	-- if curStage == self.questStage then
	if curStage == self.stage then

    	self:UpdateDesc()
    	self:UpdateState( false, true )

	else

		self.timerAfterStageComplete = self.TIME_AFTER_COMPLETE

		self:UpdateDesc()
		self:UpdateState( true, true )

		self:SetStageNewVisible( true )
		self:StageNewAnimateShow()
    	self:UpdateDescNew()

	end

	self:RecalcLayout()

end


--
function UI.HudQuestTracker_SlotWnd:OnAdventureProgressChanged()

	local curStage = self:GetAdventureStage()

	if curStage == self.stage then

		self:UpdateDesc()
		self:UpdateState( false, true )

	else

		if not self:IsAnimatingCompleteStage() then
			self.timerAfterStageComplete = self.TIME_AFTER_COMPLETE
		end

		self:UpdateDesc()
		self:UpdateState( true, true )

		self:SetStageNewVisible( true )
		self:StageNewAnimateShow()
		self:UpdateDescNew()

	end

	self:RecalcLayout()

end


--
function UI.HudQuestTracker_SlotWnd:OnInvasionInfoChanged()

	local bRecalcLayout = false

	if self.questType ~= UI.questTypes.REGULAR then
		return bRecalcLayout
	end 

	-- local event = UI:GetQuestEventForStage( self.questId, self.questStage )
	local event = UI:GetQuestEventForStage( self.questId, self.stage )
	if event == ai.GameEvent.REPEL_INVASION then

    	self:UpdateDesc()
		bRecalcLayout = true

	end

	if self:IsStageNewVisible() then

		local newStage = self:GetQuestStage()

    	local newEvent = UI:GetQuestEventForStage( self.questId, newStage )
    	if newEvent == ai.GameEvent.REPEL_INVASION then

        	self:UpdateDescNew()
			bRecalcLayout = true

    	end

	end

	if bRecalcLayout then
		self:RecalcLayout()
	end

	return bRecalcLayout

end


--
function UI.HudQuestTracker_SlotWnd:OnQuestCompleted()

	self:SetStageNewVisible( false )
	self.timerAfterStageComplete = -1
	-- self.questStage = self:GetQuestStage()
	self.stage = self:GetQuestStage()

	self.timerAfterComplete = self.TIME_AFTER_COMPLETE

	self:UpdateDesc()
	self:UpdateState( false, true )

	self:RecalcLayout()

end


--
function UI.HudQuestTracker_SlotWnd:OnAdventureFinal( stage )

	self:SetStageNewVisible( false )
	self.timerAfterStageComplete = -1

	self.stage = stage

	self.timerAfterComplete = self.TIME_AFTER_COMPLETE

	self:UpdateDesc()
	self:UpdateState( true, true )

	self:RecalcLayout()

end


--
function UI.HudQuestTracker_SlotWnd:IsAnimatingComplete()

	if self.timerAfterComplete ~= -1 then
		return true
	end

	if self.mainEffect and self.mainEffect:GetCurAnimation() == self.effectInfo.main.animHide then
		return true
	end

	if self.stateEffect and self.stateEffect:GetCurAnimation() == self.effectInfo.state.animCompleteShow then

    	local curStage = -1
		if self:IsAdventure() then
			curStage = self:GetAdventureStage()
		else
			curStage = self:GetQuestStage()
		end
		
    	-- if curStage == self.questStage then
		if curStage == self.stage then
			return true
		end

	end

	return false

end


--
function UI.HudQuestTracker_SlotWnd:OnBindsChanged()
	
	self:UpdateDesc()
	
	if self:IsStageNewVisible() then
		self:UpdateDescNew()
	end
	
	self:RecalcLayout()
	
end


-- ----------------------------------------
-- const
-- ----------------------------------------

UI.HudQuestTracker_SlotWnd.layers =
{
    MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
    TIME_VAL				= 2,
	STAGE_EFFECT			= 3,
    DESC					= 4,
    STATE_EFFECT			= 5,
	STAGE_NEW_EFFECT		= 6,
    DESC_NEW				= 7,
    STATE_NEW_EFFECT		= 8,
}

UI.HudQuestTracker_SlotWnd.effectInfo =
{
	main =
	{
		descSelColorLocator			= "color_1",
		stageLocatorPrefix			= "desript_",
		animIdle					= "idle",
		animHide					= "hide",
		bgLocator					= "bg",
	},

	bg =
	{
		maxSizeLocator	= "self",
		minSizeLocator	= "dist_min",
	},

	state =
	{
		animSuccess				= "complite",
		animSuccessShow			= "show",
		animFail				= "lose",
		animFailShow			= "lose_show",
		animNotComplete			= "q_1",
		animNotComplete_auto	= "q_2",
		sizeLocator				= "self95",
	},

	stage =
	{
		descLocator					= "text18",
		stateLocator				= "text17",
		animIdle					= "idle",
		animHide					= "hide",
		animShow					= "show",
		descCompletedColorLocator	= "color_1",
		descProgressColorLocator	= "color_2",
	},
}

UI.HudQuestTracker_SlotWnd.TIME_AFTER_COMPLETE			= 2		-- сек

-- ----------------------------------------
-- vars
-- ----------------------------------------

UI.HudQuestTracker_SlotWnd.questId					= -1
UI.HudQuestTracker_SlotWnd.questType				= -1

UI.HudQuestTracker_SlotWnd.questStage				= -1
UI.HudQuestTracker_SlotWnd.bNeedQuestTime			= false
UI.HudQuestTracker_SlotWnd.pveEventDuration			= -1

UI.HudQuestTracker_SlotWnd.timerAfterComplete		= -1
UI.HudQuestTracker_SlotWnd.timerAfterStageComplete	= -1

UI.HudQuestTracker_SlotWnd.descSelColor				= UI.TEXT_SEL_COLOR
UI.HudQuestTracker_SlotWnd.descCompletedColor		= 0xff555555
UI.HudQuestTracker_SlotWnd.descProgressColor		= UI.GOLD_COLOR
UI.HudQuestTracker_SlotWnd.space_desc_btm_noTimer	= 0
UI.HudQuestTracker_SlotWnd.space_desc_btm_timer		= 0
UI.HudQuestTracker_SlotWnd.space_desc_stageNew		= 0
UI.HudQuestTracker_SlotWnd.stageNewX				= 0
UI.HudQuestTracker_SlotWnd.maxBgHeight				= 0
UI.HudQuestTracker_SlotWnd.minBgHeight				= 0
UI.HudQuestTracker_SlotWnd.stateX					= 0
UI.HudQuestTracker_SlotWnd.stateNewX				= 0
UI.HudQuestTracker_SlotWnd.stateHeight				= 0
UI.HudQuestTracker_SlotWnd.space_top_bg				= 0
UI.HudQuestTracker_SlotWnd.space_bg_btm				= 0

UI.HudQuestTracker_SlotWnd.mainEffect				= nil
UI.HudQuestTracker_SlotWnd.bgEffect					= nil
UI.HudQuestTracker_SlotWnd.stageEffect				= nil
UI.HudQuestTracker_SlotWnd.stageNewEffect 			= nil
UI.HudQuestTracker_SlotWnd.stateEffect				= nil
UI.HudQuestTracker_SlotWnd.stateNewEffect			= nil
UI.HudQuestTracker_SlotWnd.mainIdleAnimId			= -1
UI.HudQuestTracker_SlotWnd.stageIdleAnimId			= -1

--UI.HudQuestTracker_SlotWnd.aiid						= 0
UI.HudQuestTracker_SlotWnd.stage					= -1
UI.HudQuestTracker_SlotWnd.adventure				= nil


-- ----------------------------------------
-- work functions
-- ----------------------------------------

--
function UI.HudQuestTracker_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect				= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.bgEffect				= UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	self.stageEffect			= UI:GetEffectFromLayer( self, self.layers.STAGE_EFFECT )
	self.stageNewEffect 		= UI:GetEffectFromLayer( self, self.layers.STAGE_NEW_EFFECT )
	self.stateEffect			= UI:GetEffectFromLayer( self, self.layers.STATE_EFFECT )
	self.stateNewEffect			= UI:GetEffectFromLayer( self, self.layers.STATE_NEW_EFFECT )

	if self.mainEffect then
		self.mainIdleAnimId = self.mainEffect:GetAnimationId( self.effectInfo.main.animIdle )
	end

	if self.stageEffect then
		self.stageIdleAnimId	= self.stageEffect:GetAnimationId( self.effectInfo.stage.animIdle )
		self.descCompletedColor	= self.stageEffect:GetObjColor( self.effectInfo.stage.descCompletedColorLocator )
		self.descProgressColor	= self.stageEffect:GetObjColor( self.effectInfo.stage.descProgressColorLocator )
	end

	self:PrepareLayout()

end


--
function UI.HudQuestTracker_SlotWnd:Reset()

	self.questId					= -1
	self.questType					= -1
	-- self.questStage					= -1
	self.bNeedQuestTime				= false
	self.pveEventDuration			= -1
	self.timerAfterComplete			= -1
	self.timerAfterStageComplete	= -1

	self.stage						= -1
	self.adventure					= nil

	self:SetText( "", self.layers.DESC )

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end		

	if self.stateEffect then
		self.stateEffect:StartAnimation( self.effectInfo.state.animNotComplete )
	end

	if self.stageEffect then
		self.stageEffect:StartAnimation( self.effectInfo.stage.animIdle )
	end

	if self.stageNewEffect then
		self.stageNewEffect:StartAnimation( self.effectInfo.stage.animIdle )
	end

	self:SetStageNewVisible( false )

	self:SetLayerVisible( false, self.layers.TIME_VAL )

end


--
function UI.HudQuestTracker_SlotWnd:SetStageNewVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.STAGE_NEW_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.DESC_NEW )
	self:SetLayerVisible( bVisible, self.layers.STATE_NEW_EFFECT )

end


--
function UI.HudQuestTracker_SlotWnd:IsStageNewVisible()

	return self:IsLayerVisible( self.layers.STAGE_NEW_EFFECT )

end


--
function UI.HudQuestTracker_SlotWnd:FullUpdate()

	self:UpdateDesc()
	self:UpdateState( false, false )

	self:InitQuestTime()
	self:UpdateQuestTime( true )

	self:RecalcLayout()

end


--
function UI.HudQuestTracker_SlotWnd:UpdateDesc()

	if self:IsAdventure() and UI:IsAdventureStageFinal( self.stage ) then
		return
	end

	-- self:UpdateDescInternal( self.questStage, self.layers.DESC )
	self:UpdateDescInternal( self.stage, self.layers.DESC )

end


--
function UI.HudQuestTracker_SlotWnd:UpdateDescNew()

	local curStage = -1
	if self:IsAdventure() then
		curStage = self:GetAdventureStage()

		if curStage == -1 then return end

	else
		curStage = self:GetQuestStage()
	end

	self:UpdateDescInternal( curStage, self.layers.DESC_NEW )

end


--
function UI.HudQuestTracker_SlotWnd:UpdateDescInternal( stage, layer )

	local str = ""

	if self.questType == UI.questTypes.REGULAR then

		local bShowCompletedSpecDesc = false
	
		if not UI:IsQuestAuto( self.questId ) then
	
			local bCompleted = false
	
			if stage == UI:GetQuestNumStages( self.questId ) then
				bCompleted = self:IsQuestCompleted() or UI:CanQuestBeCompleted( self.questId )
			end
	
			if bCompleted then
				bShowCompletedSpecDesc = true
			end
	
		end
	
		if bShowCompletedSpecDesc then
	
			local hangarRace = UI:GetQuestHangarRace( self.questId )
	
			if hangarRace == -1 then
				hangarRace = UI:GetCurSpaceStationRace()
			end
	
			local hangarZoneName = UI:GetZoneNameForStationByRace( hangarRace )
			local hangarNameLocalized = UI:ZoneStation2Str( hangarZoneName )
			
			local tSubst =
			{
				station	= hangarNameLocalized,
			}
	
			str = UI:GetStringByName( "questTracker_goToStation" )
			
			local numSubst = 0
			str, numSubst = string.gsub( str, "%$(.-)%$", tSubst )
			
			if numSubst < 1 then
				sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: cannot find placeholder(s) in string \"questTracker_goToStation\"; $station$ expected" )
				str = string.format( "[INVALID STRING] Return to %s", hangarNameLocalized )
			end

		else
	
			local bOtherZoneSpecDesc = false
	
			local eventId = UI:GetQuestEventForStage( self.questId, stage )
			if eventId ~= ai.GameEvent.ENTER_ZONE then 
	
				local curZoneId		= UI:GetCurZone()
				local questZones	= UI:GetQuestZonesForStage( self.questId, stage )
	
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
	
					local minPathLength	= math.huge
					local minZoneId		= -1
	
					for idx, zoneId in ipairs( questZones ) do
	
						local gateId, pathLength = UI:GetNearestGateToZone( curZoneId, zoneId )
	
						if gateId ~= -1 then
	
							if pathLength < minPathLength then
								minPathLength = pathLength
								minZoneId = zoneId
							end
	
						end
	
					end
	
					local questZoneId = minZoneId
					
					-- #0091143,комм.(0414063) - если нет пути к зоне, то сразу пишется зона, куда нужно прилететь
					if questZoneId == -1 then
						questZoneId = questZones[ 1 ] or -1
					end

					local questZoneName = UI:ZoneId2Name( questZoneId )
					local questZoneLocalizedName = UI:Zone2Str( questZoneName )
	
					str = UI:GetStringByName( "questTracker_goToZone" )
					str = string.gsub( str, "%$zone%$", questZoneLocalizedName )
	
					bOtherZoneSpecDesc = true
	
				end
	
			end
	
			if not bOtherZoneSpecDesc then
				str = UI:GetQuestTaskDesc2( self.questId, self:GetColor( layer ), self.descSelColor, stage, false )
			end
	
		end

	elseif self.questType == UI.questTypes.PVE_EVENT then
	
		local eventInfo = _G.PvE_Common.UI.PveEvents:GetEvent( self.questId )
		if not eventInfo then
			sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: cannot find info for event \"%s\"", self.questId )
		end

		-- описание
		-- в описание подставляются определяемые дезайнерами параметры (формат параметров - как в ShowGameMsg())
		local descParams = nil
		
		if eventInfo then
			if eventInfo.descParams ~= nil then
				if type( eventInfo.descParams ) == "table" then
					descParams = eventInfo.descParams					
				else
					sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: invalid type of field \"descParams\" for event \"%s\"; \"table\" or \"nil\" expected, got \"%s\"", self.questId, type( eventInfo.descParams ) )
				end
			end
		end
		
		local deescStrId = UI:GetPveEventTaskDescStrId( self.questId )
		local desc = UI:SubstituteHudMsgParams( deescStrId, descParams )

		-- награда

		local strReward = ""
		
		if eventInfo then
	
			local reward = eventInfo.reward
			if type( reward ) == "number" then

				if reward > 0 then

					reward = reward * 100
    				strReward = string.format( "%s: %d%%", UI:GetStringByName( "questTracker_pveEventReward" ), reward )

				end

			else
				sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: invalid type of field \"reward\" for event \"%s\"; \"number\" expected, got \"%s\"", self.questId, type( reward ) )
			end
			
		end


		local valCur	= _G.PvE_Common.UI.PveEvents:GetEventValCur( self.questId )
		local valMax	= _G.PvE_Common.UI.PveEvents:GetEventValMax( self.questId )

		-- прогресс

		local strProgress = string.format( "%s: %s/%s", UI:GetStringByName( "questProgress" ), UI:Num2StrSeparatedBy3( valCur ), UI:Num2StrSeparatedBy3( valMax ) )

		-- всё вместе

		if self:IsQuestCompleted() then
			str = string.format( "%s%s%s%s|%s", UI:Color2Str( self.descCompletedColor ), desc, strReward ~= "" and "|" or "", strReward, strProgress )
		else
			str = string.format( "%s%s%s|%s%s", desc, strReward ~= "" and "|" or "", strReward, UI:Color2Str( self.descProgressColor ), strProgress )
		end		
		
	elseif self.questType == UI.questTypes.SCRIPTED then
		
		local curVal = 0
		local maxVal = 0
		local textId = ""
		
		local questData = UI:GetScriptedQuestData( self.questId )
		if questData then
			curVal = questData.curVal
			maxVal = questData.maxVal
			textId = questData.textId
		else
			sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: no data for scripted quest %d", self.questId )
		end
		
		local baseColor = self:GetColor( layer )
		local selColor = self.descSelColor
		
		local strCurVal = string.format( "%s%d%s", UI:Color2Str( selColor ), curVal, UI:Color2Str( baseColor ) )
		local strMaxVal = string.format( "%s%d%s", UI:Color2Str( selColor ), maxVal, UI:Color2Str( baseColor ) )
		
		str = string.format( "%s: %s/%s", UI:GetStringByName( textId ), strCurVal, strMaxVal )
		
	elseif self:IsAdventure() then

		if UI:IsAdventureTaken( self.adventure.aiid ) then
			str = UI:GetAdventureTaskDesc2( self.adventure.aiid, self:GetColor( layer ), self.descSelColor, stage )
		else
			str = UI:GetAdventureTaskDesc2ByAtid( self.adventure.atid, self.adventure.params, self:GetColor( layer ), self.descSelColor, stage )
		end

	else
		sys.log( "UI.HudQuestTracker_SlotWnd:UpdateDescInternal()[ERROR]: unhandled quest type: %s", tostring( self.questType ) )
	end

	self:SetText( str, layer )

end


--
function UI.HudQuestTracker_SlotWnd:StageNewAnimateShow()

	if self.stageNewEffect then
		self.stageNewEffect:StartAnimation( self.effectInfo.stage.animShow )
	end

end


-- bForceComplete - нужен при смене стадии регулярного квеста, когда весь квест еще не завершен, но надо показать галочку для завершенной стадии
function UI.HudQuestTracker_SlotWnd:UpdateState( bForceComplete, bAnimated )

	if bForceComplete == nil then
		bForceComplete = false
	end
	
	if bAnimated == nil then
		bAnimated = false
	end

	if not self.stateEffect then
		return
	end

	local anim = ""
	local curAnim = self.stateEffect:GetCurAnimation()
	local animFit = false

	local bCompleted = false
	if self:IsAdventure() then
		bCompleted = not UI:IsAdventureTaken( self.adventure.aiid )
	else
		bCompleted = self:IsQuestCompleted()
	end

	if bForceComplete then
		bCompleted = true
	end

	if not bCompleted then
		if self.questType == UI.questTypes.REGULAR and UI:CanQuestBeCompleted( self.questId ) then
			bCompleted = true
		end
	end

	if bCompleted then

		local bSuccess = true
		
		if self.questType == UI.questTypes.PVE_EVENT then
			bSuccess = _G.PvE_Common.UI.PveEvents:IsEventCompletedSuccessfull( self.questId )
			
		elseif self.questType == UI.questTypes.SCRIPTED then
			local questData = UI:GetScriptedQuestData( self.questId )
			bSuccess = questData.bSuccess
		elseif self:IsAdventure() and UI:IsAdventureStageFinal( self.stage ) then
			bSuccess = UI:IsAdventureRewardFinal( self.adventure.atid, self.stage )
		end

		if bAnimated then
			anim = bSuccess and self.effectInfo.state.animSuccessShow or self.effectInfo.state.animFailShow
		else
			anim = bSuccess and self.effectInfo.state.animSuccess or self.effectInfo.state.animFail
		end
		
		if bSuccess then
			animFit = curAnim == self.effectInfo.state.animSuccess or curAnim == self.effectInfo.state.animSuccessShow
		else
			animFit = curAnim == self.effectInfo.state.animFail or curAnim == self.effectInfo.state.animFailShow
		end

	else
	
		local bAuto = true
		
		if self.questType == UI.questTypes.REGULAR then
			bAuto = UI:IsQuestAuto( self.questId )
			
		elseif self.questType == UI.questTypes.SCRIPTED then
			local questData = UI:GetScriptedQuestData( self.questId )
			bAuto = questData.icoType == UI.questIcoTypes.BLUE
		end
		
		anim = bAuto and self.effectInfo.state.animNotComplete_auto or self.effectInfo.state.animNotComplete
		animFit = curAnim == anim
		
	end

	if not animFit then	-- проверка animFit нужна для дого, чобы анимация галочки не прерывалась, если будет еще апдейт
		self.stateEffect:StartAnimation( anim )
	end

end


--
function UI.HudQuestTracker_SlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.mainEffect then

		if animName == self.effectInfo.main.animHide then
			self:CheckAnimatingCompleteEnd()
		end
	
	elseif effect == self.stateEffect then

		if animName == self.effectInfo.state.animSuccessShow then
			effect:StartAnimation( self.effectInfo.state.animSuccess )
			self:CheckAnimatingCompleteEnd()

		elseif animName == self.effectInfo.state.animFailShow then
			effect:StartAnimation( self.effectInfo.state.animFail )
			self:CheckAnimatingCompleteEnd()
		end

	elseif effect == self.stageNewEffect then

		if animName == self.effectInfo.stage.animShow then
			effect:StartAnimation( self.effectInfo.stage.animIdle )
			self:UpdateDescNewAlpha()
		end

	elseif effect == self.stageEffect then

		if animName == self.effectInfo.stage.animHide then
			self:CheckAnimatingCompleteStageEnd()
		end

	end

end


--
function UI.HudQuestTracker_SlotWnd:PrepareLayout()

	local selfSize		= self.mainEffect and self.mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local stagePos1		= self.mainEffect and self.mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.stageLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local stagePos2		= self.mainEffect and self.mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.stageLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local stagePos3		= self.mainEffect and self.mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.stageLocatorPrefix, 3 ) ) or Vec2( 0, 0 )
	local descPos		= self.stageEffect and self.stageEffect:GetObjPos( self.effectInfo.stage.descLocator ) or Vec2( 0, 0 )
	local descSize		= self.stageEffect and self.stageEffect:GetObjSize( self.effectInfo.stage.descLocator ) or Vec2( 0, 0 )
	local statePos		= self.stageEffect and self.stageEffect:GetObjPos( self.effectInfo.stage.stateLocator ) or Vec2( 0, 0 )
	local stateSize		= self.stateEffect and self.stateEffect:GetObjSize( self.effectInfo.state.sizeLocator ) or Vec2( 0, 0 )
	local bgPos			= self.mainEffect and self.mainEffect:GetObjPos( self.effectInfo.main.bgLocator ) or Vec2( 0, 0 )
	local bgMaxSize		= self.bgEffect and self.bgEffect:GetObjSize( self.effectInfo.bg.maxSizeLocator ) or Vec2( 0, 0 )
	local bgMinSize		= self.bgEffect and self.bgEffect:GetObjSize( self.effectInfo.bg.minSizeLocator ) or Vec2( 0, 0 )

	self.space_desc_btm_noTimer	= stagePos1.y 	
	self.space_desc_btm_timer	= selfSize.y - ( stagePos3.y + descPos.y + descSize.y )
	self.space_desc_stageNew	= stagePos2.y - ( stagePos1.y + descPos.y + descSize.y )
	self.stageNewX				= stagePos2.x
	self.descSelColor			= self.mainEffect and self.mainEffect:GetObjColor( self.effectInfo.main.descSelColorLocator ) or UI.WHITE_COLOR
	self.maxBgHeight			= bgMaxSize.y
	self.minBgHeight			= bgMinSize.y
	self.stateX					= statePos.x + stagePos1.x
	self.stateNewX				= statePos.x + stagePos2.x
	self.stateHeight			= stateSize.y
	self.space_top_bg			= bgPos.y
	self.space_bg_btm			= selfSize.y - ( bgPos.y + bgMaxSize.y )

	self:SetWidth( selfSize.x )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC_NEW )

end


--
function UI.HudQuestTracker_SlotWnd:RecalcLayout()

	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 1000000 )

	-- описание (высота)

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	formatRect ).w

	self:SetLayerHeight( descHeight, self.layers.DESC )

	local descTop = self:GetLayerTop( self.layers.DESC )
	local descBtm = descTop + descHeight

	-- состояние (позиция - по верт. центру описания)

	local stateY = descTop + ( descHeight - self.stateHeight ) * 0.5
	self.stateEffect:SetPos( UI:Vec2( self.stateX, stateY ) )

	-- элементы другой стадии квеста

	if self:IsLayerVisible( self.layers.STAGE_NEW_EFFECT ) then

		-- общий эффект (позиция)

		if self.stageNewEffect then
	
			local stageNewPos = UI:ZeroVec2()
			stageNewPos.x = self.stageNewX
			stageNewPos.y = descBtm + self.space_desc_stageNew

			self.stageNewEffect:SetPos( stageNewPos )

		end

		-- описание (высота)

        local descNewHeight = _G.MeasureText(
       		self:GetText( self.layers.DESC_NEW ),
       		self:GetFont( self.layers.DESC_NEW ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.DESC_NEW ),
        	formatRect ).w

    	self:SetLayerHeight( descNewHeight, self.layers.DESC_NEW )

		local descNewTop = self:GetLayerTop( self.layers.DESC_NEW )
		descBtm = descNewTop + descNewHeight 

		-- состояние (позиция - по верт. центру описания )

		local stateNewY = descNewTop + ( descNewHeight - self.stateHeight ) * 0.5
		self.stateNewEffect:SetPos( UI:Vec2( self.stateNewX, stateNewY ) )

	end

	-- собственная высота и фон

	local space_desc_btm = self.bNeedQuestTime and self.space_desc_btm_timer or self.space_desc_btm_noTimer
	local selfHeight = descBtm + space_desc_btm

	local bgHeight = selfHeight - self.space_top_bg - self.space_bg_btm
	bgHeight = UI:Clamp( bgHeight, self.minBgHeight, self.maxBgHeight )

	selfHeight = bgHeight + self.space_top_bg + self.space_bg_btm

	self:SetHeight( selfHeight )

	local animTime = ( bgHeight - self.minBgHeight ) / ( self.maxBgHeight - self.minBgHeight )
	self.bgEffect:SetAnimationTimeAndUpdate( animTime )

end


--
function UI.HudQuestTracker_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.HudQuestTracker_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.HudQuestTracker_SlotWnd:UpdateEffects()

	if self.mainEffect then
		self.mainEffect:UpdatePos()
	end

	if self:IsLayerVisible( self.layers.STAGE_NEW_EFFECT ) then
		if self.stageNewEffect then
			self.stageNewEffect:UpdatePos()
		end
	end

end


--
function UI.HudQuestTracker_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.bNeedQuestTime then
		self:UpdateQuestTime( false )
	end

	self:UpdateAfterCompleteTimer( dt_sys )
	self:UpdateAfterCompleteStageTimer( dt_sys )
	self:UpdateTextAlphaIfAnimating( false )

end


--
function UI.HudQuestTracker_SlotWnd:UpdateAfterCompleteTimer( dt )

	if self.timerAfterComplete == -1 then
		return
	end

	self.timerAfterComplete = self.timerAfterComplete - dt
	if self.timerAfterComplete <= 0 then

		self.timerAfterComplete = -1

		if self.mainEffect then
			self.mainEffect:StartAnimation( self.effectInfo.main.animHide )
		end		

		self:CheckAnimatingCompleteEnd()

	end	

end


--
function UI.HudQuestTracker_SlotWnd:UpdateAfterCompleteStageTimer( dt )

	if self.timerAfterStageComplete == -1 then
		return
	end

	self.timerAfterStageComplete = self.timerAfterStageComplete - dt
	if self.timerAfterStageComplete <= 0 then

		self.timerAfterStageComplete = -1

		if self.stageEffect then
			self.stageEffect:StartAnimation( self.effectInfo.stage.animHide )
		end

		self:CheckAnimatingCompleteStageEnd()

	end

end


--
function UI.HudQuestTracker_SlotWnd:CheckAnimatingCompleteEnd()

	if self:IsAnimatingComplete() then
		return
	end

	local parent = self:GetParent()
	if parent then
		parent:OnSlotAnimatingCompleteEnded( self )
	end

end


--
function UI.HudQuestTracker_SlotWnd:CheckAnimatingCompleteStageEnd()

	if self:IsAnimatingCompleteStage() then
		return
	end

	-- self.questStage = self:GetQuestStage()
	if self:IsAdventure() then
		self.stage = self:GetAdventureStage()
	else
		self.stage = self:GetQuestStage()
	end

	self:SetStageNewVisible( false )

	if self.stageEffect then
		self.stageEffect:StartAnimation( self.effectInfo.stage.animIdle )
		self:UpdateDescAlpha()
	end

	self:UpdateDesc()
	self:UpdateState( false, false )

	self:RecalcLayout()

	local parent = self:GetParent()
	if parent then
		parent:OnSlotAnimatingCompleteStageEnded( self )
	end	

end


--
function UI.HudQuestTracker_SlotWnd:IsAnimatingCompleteStage()

	if self.timerAfterStageComplete ~= -1 then
		return true
	end

	if self.stageEffect and self.stageEffect:GetCurAnimation() == self.effectInfo.stage.animHide then
		return true
	end

	if self.stateEffect then

		local curAnim = self.stateEffect:GetCurAnimation()
		if curAnim == self.effectInfo.state.animSuccessShow or curAnim == self.effectInfo.state.animFailShow then

			local curStage = -1
			if self:IsAdventure() then
				curStage = self:GetAdventureStage()
			else
				curStage = self:GetQuestStage()
			end
			
			-- if curStage ~= self.questStage then
			if curStage ~= self.stage then
				return true
			end

		end

	end

	return false

end


--
function UI.HudQuestTracker_SlotWnd:UpdateTextAlphaIfAnimating()

	local bMainAnimating = self.mainEffect and self.mainEffect:GetCurAnimationId() ~= self.mainIdleAnimId
	local bStageAnimating = self.stageEffect and self.stageEffect:GetCurAnimationId() ~= self.stageIdleAnimId

	if bMainAnimating or bStageAnimating then
		self:UpdateDescAlpha()
	end

	if self:IsLayerVisible( self.layers.STAGE_NEW_EFFECT ) then

		local bStageNewAnimating = self.stageNewEffect and self.stageNewEffect:GetCurAnimationId() ~= self.stageIdleAnimId
		if bMainAnimating or bStageNewAnimating then
			self:UpdateDescNewAlpha()
		end

	end

end


--
function UI.HudQuestTracker_SlotWnd:UpdateDescAlpha()

	local descAlpha = UI:GetAlpha( self:GetColor( self.layers.DESC ) )

	local strDesc = _G.SetInternalTextAlpha( self:GetText( self.layers.DESC ), descAlpha )
	if strDesc then
		self:SetText( strDesc, self.layers.DESC )
	end	

end


--
function UI.HudQuestTracker_SlotWnd:UpdateDescNewAlpha()

	local descNewAlpha = UI:GetAlpha( self:GetColor( self.layers.DESC_NEW ) )

	local strDescNew = _G.SetInternalTextAlpha( self:GetText( self.layers.DESC_NEW ), descNewAlpha )
	if strDescNew then
		self:SetText( strDescNew, self.layers.DESC_NEW )
	end	

end


-- Используется вместо UI:GetQuestStage();
-- завершенные повторяемые квесты не присутствуют в массиве завершенных,
-- поэтому UI:GetQuestStage() вернет ошибку при завершенном повторяемом квесте;
-- завершенным уже отображаемый повторяемый квест считается если не присутствует ни в списке завершенных, ни в списке взятых (#0062610,комм.(0256142))

function UI.HudQuestTracker_SlotWnd:GetQuestStage()

	local stage = -1

	if self.questType == UI.questTypes.REGULAR then

    	if UI:IsQuestTaken( self.questId ) or UI:IsQuestCompleted( self.questId ) then
    		stage = UI:GetQuestStage( self.questId )
    	else
    		if UI:IsQuestRecurrent( self.questId ) then
    			stage = UI:GetQuestNumStages( self.questId )
    		else
    			sys.log( "UI.HudQuestTracker_SlotWnd:GetQuestStage()[ERROR]: cannot detect stage for quest %d; the non-recurrent quest is neither completed nor taken", self.questId )
    		end
    	end

	end

	return stage

end


--
function UI.HudQuestTracker_SlotWnd:GetAdventureStage()

	local stage = -1

	if UI:IsAdventureTaken( self.adventure.aiid ) then
		stage = UI:GetAdventureStage( self.adventure.aiid )
	end

	return stage

end


-- Используется вместо UI:IsQuestCompleted();
-- завершенные повторяемые квесты не присутствуют в массиве завершенных,
-- поэтому UI:IsQuestCompleted() вернет false;
-- завершенным уже отображаемый повторяемый квест считается если не присутствует ни в списке завершенных, ни в списке взятых (#0062610,комм.(0256142))

--
function UI.HudQuestTracker_SlotWnd:IsQuestCompleted()

	local bCompleted = false

	if self.questType == UI.questTypes.REGULAR then

		if UI:IsQuestCompleted( self.questId ) then
			bCompleted = true
		else
			if UI:IsQuestRecurrent( self.questId ) then
				if not UI:IsQuestTaken( self.questId ) then
					bCompleted = true
				end
			end
		end

	elseif self.questType == UI.questTypes.PVE_EVENT then
	
		bCompleted = _G.PvE_Common.UI.PveEvents:IsEventCompleted( self.questId )
		
	elseif self.questType == UI.questTypes.SCRIPTED then
		
		local questData = UI:GetScriptedQuestData( self.questId )
		bCompleted = questData.bCompleted

	else
		sys.log( "UI.HudQuestTracker_SlotWnd:IsQuestCompleted()[ERROR]: unhandled quest type: %s", tostring( self.questType ) )
	end

	return bCompleted

end


--
function UI.HudQuestTracker_SlotWnd:InitQuestTime()

	self.bNeedQuestTime		= false
	self.pveEventDuration	= -1

	if self.questType == UI.questTypes.PVE_EVENT then
		self.pveEventDuration	= _G.PvE_Common.UI.PveEvents:GetEventDuration( self.questId, true )
		self.bNeedQuestTime		= self.pveEventDuration ~= -1
	end

	self:SetLayerVisible( self.bNeedQuestTime, self.layers.TIME_VAL )

end


--
function UI.HudQuestTracker_SlotWnd:UpdateQuestTime( bLogErrors )

	if not self.bNeedQuestTime then
		return
	end

	if self.questType == UI.questTypes.PVE_EVENT then

    	local timeLeft = _G.PvE_Common.UI.PveEvents:GetEventLeftTime( self.questId, bLogErrors )

    	local strTime = UI:Time2Str45( timeLeft )
    	self:SetText( strTime, self.layers.TIME_VAL )

	end

end


-- --------------------------------------------------------------------------
-- UI.HudQuestTracker_StateBtn
-- --------------------------------------------------------------------------

UI.HudQuestTracker_StateBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "HudQuestTracker_StateBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
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
    				defName 			= "hud_questTracker_stateBtn",

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
	},

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "close_idle",
    		animationSelect		= "close_over",
    		animationPressed	= "close_over",
    		animationDisabled	= "close_idle",
    	},

    	main_checked =
    	{
    		animationIdle 		= "open_idle",
    		animationSelect		= "open_over",
    		animationPressed	= "open_over",
    		animationDisabled	= "open_idle",
    	},
    }
}