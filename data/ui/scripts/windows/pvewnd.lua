-- -----------------------------------------------------------------------
-- UI.PveWnd
-- -----------------------------------------------------------------------

UI.PveWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.PveWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name = "PveWnd",
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
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "gmp_sel_win",
						layer		= "UI.PveWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "pve_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title21",
						layer		= "UI.PveWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text123",
						layer		= "UI.PveWnd.layers.EASY_MISSIONS_CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "skill_slot",
						wnd			= "UI.Pve_BuffsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "text136",
						layer		= "UI.PveWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "btn",
						wnd			= "UI.Pve_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "history",
						wnd			= "UI.Pve_PveMissionInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
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
			text			= UI:GetStringByName( "pveChoice_caption_choice" ),
		},
		
		-- EASY_MISSIONS_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- INFO
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "pveChoice_info2" )
		},
	},

	children =
	{
		"UI.Pve_EasyMapsListWnd",
		"UI.Pve_ScheduledMapsListWnd",
		"UI.Pve_BuffsWnd",
		"UI.Pve_CloseBtn",
		"UI.Pve_PveMissionInfoWnd",
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.PveWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.Pve_UpgradeBuffsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

    if UI.serverData.playerCredits.raceRepChanged then
		UI.Pve_EasyMapsListWnd:OnRaceRepChanged()
		UI.Pve_ScheduledMapsListWnd:OnRaceRepChanged()
	end

end


--
function UI.PveWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	
	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	self:UpdateScheduledMaps()

end


--
function UI.PveWnd:OnSquadDataChanged()

	if not self:IsOnScreen() then
		return
	end

	UI.Pve_EasyMapsListWnd:OnSquadDataChanged()
	
end


--
function UI.PveWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )

	if not self:IsOnScreen() then
		return
	end

	UI.Pve_EasyMapsListWnd:OnUnlimPveMissionLevelChanged( missionName, level )
	
end


--
function UI.PveWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )

	UI.Pve_UpgradeBuffsWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )

	if not self:IsOnScreen() then
		return
	end
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
		UI.Pve_BuffsWnd:OnUnlimPveUpgradePlayerLevel( levelId, level )
	end	
	
end


--
function UI.PveWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	UI.Pve_BuffsWnd:OnAccountRankChanged()
	UI.Pve_EasyMapsListWnd:OnAccountRankChanged()
	UI.Pve_ScheduledMapsListWnd:OnAccountRankChanged()

end


--
function UI.PveWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Pve_UpgradeBuffsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.PveWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.PveWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.PveWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.PveWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.PveWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.PveWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnResourcesChanged()

end



--
function UI.PveWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.PveWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.PveWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	self:OnResourcesChanged()
	
end


-- -------------------------------------
-- const
-- -------------------------------------

UI.PveWnd.layers =
{
	MAIN_EFFECT				= 0,
	WORK_EFFECT				= 1,
	CAPTION					= 2,
	EASY_MISSIONS_CAPTION	= 3,
	INFO					= 4,
}

UI.PveWnd.sounds =
{
	mapSlotMouseOver	= UI.sounds.btnMouseOver,
	mapSlotClick		= UI.sounds.btnClick,
	showPveMissionInfo	= "sound/ui/btnClick",
	hidePveMissionInfo	= "sound/ui/MsgHide",
	upgradeBuffWndShow	= "sound/ui/btnClick",
}

UI.PveWnd.effectInfo =
{
	work =
	{
		scheduledMapsListLocator	= "maps_3",
		easyMapsListLocator			= "maps",
	}
}

UI.PveWnd.SQUAD_SIZE_FOR_EASY_MISSION = 4

UI.PveWnd.queueTypes =
{
	EASY_MISSION		= 1,
	SCHEDULED_MISSION	= 2,
}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.PveWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	self:UpdateEasyMissionsCaption()
	
end


--
function UI.PveWnd:ResetContent()

	UI.Pve_EasyMapsListWnd:Reset()
	UI.Pve_ScheduledMapsListWnd:Reset()

end


--
function UI.PveWnd:FullUpdate()

	self:ResetContent()

	self:UpdateEasyMaps()
	self:UpdateScheduledMaps()

end


--
function UI.PveWnd:UpdateEasyMaps()

	UI.Pve_EasyMapsListWnd:Update()
	self:RecalcEasyMapsLayout()
	
end


--
function UI.PveWnd:UpdateScheduledMaps()

	UI.Pve_ScheduledMapsListWnd:Update()
	self:RecalcScheduledMapsLayout()

end


--
function UI.PveWnd:UpdateEasyMissionsCaption()
	
	local str = UI:GetStringByName( "pve_easyMissionsCaption" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$num_players%$", tostring( self.SQUAD_SIZE_FOR_EASY_MISSION ) )
	
	if numSubst == 0 then
		sys.log( "UI.PveWnd:UpdateEasyMissionsCaption()[ERROR]: cannot find paceholder '$num_players$' in string 'pve_easyMissionsInfo'" )
		str = string.format( "[INVALID STRING] Only leader of scquad of %d players can start mission", self.SQUAD_SIZE_FOR_EASY_MISSION )
	end
	
	self:SetText( str, self.layers.EASY_MISSIONS_CAPTION )
	
end


--
function UI.PveWnd:F_OnAfterShowOnScreen()

	UI.Pve_PveMissionInfoWnd:UnlinkFromParent()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

end


--
function UI.PveWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Pve_CloseBtn then

		UI.HangarWnd:HidePveWnd( false )
		UI.HangarWnd:ShowGameplayChoiceWnd( true )
				
	elseif UI:IsWndKindOf( wnd, "PveChoice_MapSlotWnd" ) then
	
		if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

			if not wnd:IsLocked() then
				
				self:EnterQueue( wnd:GetMapInfo() )
				UI:PlayGlobalSound( self.sounds.mapSlotClick )
				
			end
			
		end

	elseif UI:IsWndKindOf( wnd, "PveChoice_PveMissionInfoBtn" ) then

		local mapSlotWnd = wnd:GetParent()
		local missionName = mapSlotWnd:GetMissionForDesc()

		if missionName ~= "" then
			self:ShowPveMissionInfoWnd( missionName )
		else
			sys.log( "UI.PveWnd:F_OnMouseLButtonDown()[ERROR]: cannot find mission name for map desc" )
		end
		
	elseif UI:IsWndKindOf( wnd, "Pve_Buffs_UpgradeBtn" ) then
		
		self:TryUpgradeBuff( wnd:GetBuffId() )

	end

	return true

end


--
function UI.PveWnd:RecalcScheduledMapsLayout()

	local mapsWidth		= UI.Pve_ScheduledMapsListWnd:GetWidth()
	local mapsHeight	= UI.Pve_ScheduledMapsListWnd:GetHeight()

	local orgPos		= UI:ZeroVec2()
	local workEffectPos	= UI:ZeroVec2()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		local mapsLocatorPos	= workEffect:GetObjPos( self.effectInfo.work.scheduledMapsListLocator )
		local mapsBaseSize		= UI.Pve_ScheduledMapsListWnd:GetBaseSize()

		orgPos.x = mapsLocatorPos.x + mapsBaseSize.x * 0.5
		orgPos.y = mapsLocatorPos.y + mapsBaseSize.y * 0.5

		workEffectPos = workEffect:GetPos()

	end

	local maps_x = orgPos.x - mapsWidth * 0.5 + workEffectPos.x
	local maps_y = orgPos.y - mapsHeight * 0.5 + workEffectPos.y

	UI.Pve_ScheduledMapsListWnd:SetPos( maps_x, maps_y )

end


--
function UI.PveWnd:RecalcEasyMapsLayout()

	local mapsWidth		= UI.Pve_EasyMapsListWnd:GetWidth()

	local orgPos		= UI:ZeroVec2()
	local workEffectPos	= UI:ZeroVec2()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		local mapsLocatorPos	= workEffect:GetObjPos( self.effectInfo.work.easyMapsListLocator )
		local mapsBaseSize		= UI.Pve_EasyMapsListWnd:GetBaseSize()

		orgPos.x = mapsLocatorPos.x + mapsBaseSize.x * 0.5
		orgPos.y = mapsLocatorPos.y

		workEffectPos = workEffect:GetPos()

	end

	local maps_x = orgPos.x - mapsWidth * 0.5 + workEffectPos.x
	local maps_y = orgPos.y + workEffectPos.y

	UI.Pve_EasyMapsListWnd:SetPos( maps_x, maps_y )

end


--
function UI.PveWnd:EnterQueue( mapInfo )

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end
	
	local missionName = mapInfo.missionName

	-- проверка кораблей
	local shipRank = UI:GetCurrentShipsMaxRank()
	if shipRank == -1 then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_NO_SHIPS_IN_BSLOTS" ), UI.MBS_OK )
		return
	end
	
	local missionMinRank, missionMaxRank = UI:GetPveMissionShipRanks( missionName )
	if missionMinRank == -1 or missionMaxRank == -1 or shipRank < missionMinRank or shipRank > missionMaxRank then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_VESSEL_RANK_INAPPROPRIATE_PVE" ), UI.MBS_OK )
		return
	end
	
	-- миссии из полного спсика миссий может запускать только лидер сквада из 4-х человек (больше тоже нельзя - #0102225(0476169))
	if not mapInfo.bScheduledList then
		if not UI.Squad:IsInSquad() or not UI.Squad:IsLeader() or UI.Squad:GetPilotsCount() ~= UI.PveWnd.SQUAD_SIZE_FOR_EASY_MISSION then
			-- слоты должны быть задисэйблены при этих условиях; т.к. эта ситуация нештатная, то месседжбокс не предусмотрен
			sys.log( "UI.PveWnd:EnterQueue()[ERROR]: player must be leader of squad with %d members", UI.PveWnd.SQUAD_SIZE_FOR_EASY_MISSION )
			return
		end
	end
	
	local bScheduled = mapInfo.bScheduledList and missionName ~= UI:GetWavePveMissionName()	-- волновая пве показывается в списке по расписанию, но реально в расписании не состоит

	UI.GameplayWnd:SetGameplay( { mmParams = { pve = 1, pve_mission = missionName, region = UI:GetGameRegion(), scheduled = bScheduled } } )
	UI.GameplayWnd:StartMatchMaking()

end


-- стандартная проверка, которая проводится во всех геймплеях - рядовой член сквада не может запускать игру
function UI.PveWnd:CheckShowMsgOnNotSquadLeader()

	if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then

		local errorName = UI:Val2Key( _G.MasterServer.MMJoinResult, _G.MasterServer.MMJoinResult.MMJR_NOT_SQUAD_LEADER )
		local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", errorName ) )

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), strErrorLocalized , UI.MBS_OK )

		return true

	end

	return false

end


--
function UI.PveWnd:ShowPveMissionInfoWnd( missionName )

	self:AddChild( UI.Pve_PveMissionInfoWnd )
	UI.Pve_PveMissionInfoWnd:UpdateForData( missionName )
	UI:PlayGlobalSound( self.sounds.showPveMissionInfo )

end


--
function UI.PveWnd:OnEscape()

	if UI.Pve_PveMissionInfoWnd:IsOnScreen( self ) then

		UI.Pve_PveMissionInfoWnd:UnlinkFromParent()
		UI:PlayGlobalSound( self.sounds.hidePveMissionInfo )

	else

		UI.HangarWnd:HidePveWnd( false )
		UI.HangarWnd:ShowGameplayChoiceWnd( true )

	end

	return true

end


--
function UI.PveWnd:OnResourcesChanged()

	UI.Pve_UpgradeBuffsWnd:OnResourcesChanged()

end


--
function UI.PveWnd:TryUpgradeBuff( buffId )	
	
	-- при недостаточном ранге окно баффов должно быть затемнено и заблокировано
	if UI.rankLocks.unlimPveBuffs > UI:GetPlayerAccountRank() then
		sys.log( "UI.PveWnd:TryUpgradeBuff()[ERROR]: low acount rank" )
		return
	end

	self:LaunchUpgradeBuffWnd( buffId )
	
end


--
function UI.PveWnd:LaunchUpgradeBuffWnd( buffId )
	
	UI.Pve_UpgradeBuffsWnd:Setup( buffId )
	UI.Pve_UpgradeBuffsWnd:Show()	
	UI:PlayGlobalSound( self.sounds.upgradeBuffWndShow )

end


--
function UI.PveWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		return
	end
	
	UI.Pve_UpgradeBuffsWnd:Hide()

end


--
function UI.PveWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	self:HideChildModals()

end


--
function UI.PveWnd:F_OnEventSaveUiState()

	self:HideChildModals()

end


-- ----------------------------------------------------------------
-- UI.Pve_CloseBtn
-- ----------------------------------------------------------------

UI.Pve_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn9",
	
		props =
		{
			name	= "Pve_CloseBtn"
		}
	},

	textId = "close"
}

-- ----------------------------------------------------------------
-- UI.Pve_ScheduledMapsListWnd
-- ----------------------------------------------------------------

UI.Pve_ScheduledMapsListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_ScheduledMapsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Pve_ScheduledMapsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "pve_scheduledMapsList",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Pve_ScheduledMapsListWnd:Update()

	self:Reset()
	
	local mapsArr = {}
	
	-- показываются только миссии на картах, запланированных по расписанию
	
	local scheduledLevelNames = _G.MasterServer_GetPveScheduledLevels()
	for levelIdx, levelName in pairs( scheduledLevelNames ) do
	
		local bFound = false
		for storedIdx, storedMapInfo in pairs( mapsArr ) do
			if storedMapInfo.levelName == levelName then
				sys.log( "UI.Pve_ScheduledMapsListWnd:Update()[ERROR]: duplicate levelName \"%s\" in scheduled", levelName )
				bFound = true
				break
			end
		end
		
		if not bFound then
		
			local missions = UI:GetPveMissionsForLevel( levelName, false, true, "easy" )
			if next( missions ) then
				
				for missionIdx, missionName in pairs( missions ) do
				
					local minShipRank, maxShipRank = UI:GetPveMissionShipRanks( missionName )
				
					local mapInfo =
					{
						missionName		= missionName,
						levelName		= levelName,
						minShipRank		= minShipRank,
						maxShipRank		= maxShipRank,
						rank			= UI:GetPveMissionRank( missionName ),
						bEnqueued		= false,
						difficulty		= "easy",
						bScheduledList	= true,
					}
					table.insert( mapsArr, mapInfo )

				end
				
			else
				sys.log( "UI.Pve_ScheduledMapsListWnd:Update()[ERROR]: no available mission for scheduled level \"%s\"", levelName )
			end
			
		end
		
	end
	
	-- SC-111214 слот в этом списке для "волновой" пве, хотя она и не входит в расписание
	local wavePveMissionName = UI:GetWavePveMissionName()
	if wavePveMissionName ~= "" then
		
		local minShipRank, maxShipRank = UI:GetPveMissionShipRanks( wavePveMissionName )
	
		local waveMapInfo =
		{
			missionName		= wavePveMissionName,
			levelName		= UI:GetPveMissionLevelName( wavePveMissionName ),
			minShipRank		= minShipRank,
			maxShipRank		= maxShipRank,
			rank			= UI:GetPveMissionRank( wavePveMissionName ),
			bEnqueued		= false,
			difficulty		= UI:GetPveMissionDifficulty( wavePveMissionName ),
			bScheduledList	= true,
		}
		table.insert( mapsArr, waveMapInfo )
		
	end
	
	local fnSort = function( mapInfo1, mapInfo2 )
	
		-- волновая пве - в конце списка
		local bIsWavePve1 = mapInfo1.missionName == wavePveMissionName
		local bIsWavePve2 = mapInfo2.missionName == wavePveMissionName
		if bIsWavePve1 ~= bIsWavePve2 then
			return not bIsWavePve1
		end

		if mapInfo1.minShipRank ~= mapInfo2.minShipRank then
			return mapInfo1.minShipRank < mapInfo2.minShipRank
		end
		
		if mapInfo1.rank ~= mapInfo2.rank then
			return mapInfo1.rank < mapInfo2.rank
		end

		if mapInfo1.levelName ~= mapInfo2.levelName then
			return mapInfo1.levelName < mapInfo2.levelName
		end
		
		return mapInfo1.missionName < mapInfo2.missionName

	end

	table.sort( mapsArr, fnSort )


	for idx, mapInfo in ipairs( mapsArr ) do
		local slotWnd = self:ObtainSlot()
		slotWnd:Setup( mapInfo )
	end

	self:RecalcLayout()

end


--
function UI.Pve_ScheduledMapsListWnd:Reset()

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.slots = {}

end


--
function UI.Pve_ScheduledMapsListWnd:OnRaceRepChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnRaceRepChanged()
	end

end


--
function UI.Pve_ScheduledMapsListWnd:GetBaseSize()

	return self.baseSize

end


--
function UI.Pve_ScheduledMapsListWnd:OnAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnAccountRankChanged()
	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Pve_ScheduledMapsListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Pve_ScheduledMapsListWnd.effectInfo =
{
	main =
	{
		slotLocator1	= "slot_2_1",
		slotLocator2	= "slot_2_2",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Pve_ScheduledMapsListWnd.allSlots		= {}
UI.Pve_ScheduledMapsListWnd.slots			= {}

UI.Pve_ScheduledMapsListWnd.baseSize		= Vec2( 0, 0 )
UI.Pve_ScheduledMapsListWnd.slotWidth		= 0
UI.Pve_ScheduledMapsListWnd.slots_space		= 0
UI.Pve_ScheduledMapsListWnd.slotsY			= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Pve_ScheduledMapsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.Pve_ScheduledMapsListWnd:InitSlots()

	for idx = 1, 15 do
		self:CreateSlot()
	end

end


--
function UI.Pve_ScheduledMapsListWnd:ObtainSlot()

	local slotWnd = nil

	for idx, wnd in pairs( self.allSlots ) do

		if not wnd:IsChildOf( self ) then
			slotWnd = wnd	
			break
		end

	end

	if not slotWnd then
		slotWnd = self:CreateSlot()
	end

	self:AddChild( slotWnd )
	table.insert( self.slots, slotWnd )

	return slotWnd

end


--
function UI.Pve_ScheduledMapsListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.PveChoice_MapSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.Pve_ScheduledMapsListWnd:PrepareLayout()

	local slotWnd = self.allSlots[ 1 ]
	if slotWnd then
		self.slotWidth = slotWnd:GetWidth()
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local slotPos1	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator1 )
		local slotPos2	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator2 )
		local selfSize	= mainEffect:GetObjSize( "self" )
		
		self.slots_space	= slotPos2.x - ( slotPos1.x + self.slotWidth )
		self.slotsY			= slotPos1.y
		self.baseSize		= selfSize
		
		self:SetHeight( selfSize.y )

	end

end


--
function UI.Pve_ScheduledMapsListWnd:RecalcLayout()

	-- слоты рисуются в один ряд, центрируются по горизонтали
	
	if not next( self.slots ) then
		self:SetWidth( 0 )
		return
	end
	
	for slotIdx, slotWnd in ipairs( self.slots ) do	
		local x = ( self.slotWidth + self.slots_space ) * ( slotIdx - 1 )
		slotWnd:SetPos( x, self.slotsY )
	end
	
	local lasSlotWnd = self.slots[ #self.slots ]
	self:SetWidth( lasSlotWnd:GetLeft() + lasSlotWnd:GetWidth() )

end


-- ----------------------------------------------------------------
-- UI.Pve_EasyMapsListWnd
-- ----------------------------------------------------------------

UI.Pve_EasyMapsListWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_EasyMapsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Pve_EasyMapsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "pve_easyMapsList",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Pve_EasyMapsListWnd:Update()

	self:Reset()
	
	local mapsArr = {}
	local wavePveMissionName = UI:GetWavePveMissionName()

	if type( _G.PvE_Missions ) == "table" then

		for missionName, missionDef in pairs( _G.PvE_Missions ) do
			
			if not UI:IsPveMissionRaid( missionName ) and not UI:IsPveMissionDisabled( missionName ) and ( UI:GetPveMissionDifficulty( missionName ) == "easy" or missionName == wavePveMissionName ) then

				local minShipRank, maxShipRank = UI:GetPveMissionShipRanks( missionName )

				local mapInfo =
				{
					missionName		= missionName,
					levelName		= UI:GetPveMissionLevelName( missionName ),
					minShipRank		= minShipRank,
					maxShipRank		= maxShipRank,
					rank			= UI:GetPveMissionRank( missionName ),
					bEnqueued		= false,
					difficulty		= UI:GetPveMissionDifficulty( missionName ),
					bScheduledList	= false,
				}
				table.insert( mapsArr, mapInfo )

			end

		end

	else
		sys.log( "UI.Pve_EasyMapsListWnd:Update()[ERROR]: invalid type of \"_G.PvE_Missions\"; \"table\" expected, got \"%s\"", type( _G.PvE_Missions ) )
	end
	
	local fnSort = function( mapInfo1, mapInfo2 )
	
		-- волновая пве - в конце списка
		local bIsWavePve1 = mapInfo1.missionName == wavePveMissionName
		local bIsWavePve2 = mapInfo2.missionName == wavePveMissionName
		if bIsWavePve1 ~= bIsWavePve2 then
			return not bIsWavePve1
		end

		if mapInfo1.minShipRank ~= mapInfo2.minShipRank then
			return mapInfo1.minShipRank < mapInfo2.minShipRank
		end
		
		if mapInfo1.rank ~= mapInfo2.rank then
			return mapInfo1.rank < mapInfo2.rank
		end

		if mapInfo1.levelName ~= mapInfo2.levelName then
			return mapInfo1.levelName < mapInfo2.levelName
		end
		
		return mapInfo1.missionName < mapInfo2.missionName

	end

	table.sort( mapsArr, fnSort )


	for idx, mapInfo in ipairs( mapsArr ) do
		local slotWnd = self:ObtainSlot()
		slotWnd:Setup( mapInfo )
	end

	self:RecalcLayout()

end


--
function UI.Pve_EasyMapsListWnd:Reset()

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.slots = {}

end


--
function UI.Pve_EasyMapsListWnd:OnRaceRepChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnRaceRepChanged()
	end

end


--
function UI.Pve_EasyMapsListWnd:OnSquadDataChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnSquadDataChanged()
	end

end


--
function UI.Pve_EasyMapsListWnd:OnUnlimPveMissionLevelChanged( missionName, level )

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetMapInfo().missionName == missionName then
			slotWnd:OnUnlimPveMissionLevelChanged()
			break
		end
	end

end


--
function UI.Pve_EasyMapsListWnd:OnAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnAccountRankChanged()
	end

end


--
function UI.Pve_EasyMapsListWnd:GetBaseSize()

	return self.baseSize
	
end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Pve_EasyMapsListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Pve_EasyMapsListWnd.effectInfo =
{
	main =
	{
		slotLocator11	= "slot_1_1",
		slotLocator12	= "slot_1_2",
		slotLocator21	= "slot_1_3",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Pve_EasyMapsListWnd.allSlots			= {}
UI.Pve_EasyMapsListWnd.slots			= {}
	
UI.Pve_EasyMapsListWnd.baseSize			= Vec2( 0, 0 )
UI.Pve_EasyMapsListWnd.slotSize			= Vec2( 0, 0 )
UI.Pve_EasyMapsListWnd.slots_space_x	= 0
UI.Pve_EasyMapsListWnd.slots_space_y	= 0
UI.Pve_EasyMapsListWnd.firstSlotPos		= Vec2( 0, 0 )

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Pve_EasyMapsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.Pve_EasyMapsListWnd:InitSlots()

	for idx = 1, 15 do
		self:CreateSlot()
	end

end


--
function UI.Pve_EasyMapsListWnd:ObtainSlot()

	local slotWnd = nil

	for idx, wnd in pairs( self.allSlots ) do

		if not wnd:IsChildOf( self ) then
			slotWnd = wnd	
			break
		end

	end

	if not slotWnd then
		slotWnd = self:CreateSlot()
	end

	self:AddChild( slotWnd )
	table.insert( self.slots, slotWnd )

	return slotWnd

end


--
function UI.Pve_EasyMapsListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Pve_EasyMapSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.Pve_EasyMapsListWnd:PrepareLayout()

	local slotWnd = self.allSlots[ 1 ]
	if slotWnd then

		self.slotSize.x = slotWnd:GetWidth()
		self.slotSize.y = slotWnd:GetHeight()

	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local slot11Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator11 )
		local slot12Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator12 )
		local slot21Pos	= mainEffect:GetObjPos( self.effectInfo.main.slotLocator21 )

		self.slots_space_x	= slot12Pos.x - ( slot11Pos.x + self.slotSize.x )
		self.slots_space_y	= slot21Pos.y - ( slot11Pos.y + self.slotSize.y )
		self.baseSize		= mainEffect:GetObjSize( "self" )
		self.firstSlotPos	= slot11Pos

	end

end


--
function UI.Pve_EasyMapsListWnd:RecalcLayout()

	-- слоты рисуются в несколько рядов, центрируются по горизонтали;
	-- в каждом ряду максимум столько слотов, сколько влезает в self эффекта

	local numSlots = #self.slots
	if numSlots == 0 then
		return
	end
	
	local maxCols = math.floor( ( self.baseSize.x + self.slots_space_x ) / ( self.slotSize.x + self.slots_space_x ) )
	maxCols = math.min( maxCols, numSlots )	
	
	local numRows = math.ceil( numSlots / maxCols )
	
	-- собственный размер
	local selfWidth		= self.slotSize.x * maxCols + self.slots_space_x * ( maxCols - 1 )
	local selfHeight	= self.slotSize.y * numRows + self.slots_space_y * ( numRows - 1 ) + self.firstSlotPos.y
	
	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )

	-- позиции слотов
	local centerX = selfWidth / 2
	local slotIdx = 1
	for row = 1, numRows do
	
		local numColsInRow	= ( row == numRows ) and ( numSlots - ( row - 1 ) *  maxCols ) or maxCols
		local rowWidth		= self.slotSize.x * numColsInRow + self.slots_space_x * ( numColsInRow - 1 )
		local rowX			= centerX - rowWidth / 2
		
		for col = 1, numColsInRow do
		
			local x = rowX + ( self.slotSize.x + self.slots_space_x ) * ( col - 1 )
			local y = self.firstSlotPos.y + ( self.slotSize.y + self.slots_space_y ) * ( row - 1 )
			
			local slotWnd = self.slots[ slotIdx ]
			if slotWnd then
				slotWnd:SetPos( x, y )
			end
			
			slotIdx = slotIdx + 1

		end
	
	end

end

-- ----------------------------------------------------------------
-- UI.Pve_EasyMapSlotWnd
-- ----------------------------------------------------------------

UI.Pve_EasyMapSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_EasyMapSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "PveChoice_MapSlotWnd",

	props =
	{
		name		= "Pve_EasyMapSlotWnd",
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
				defName 			= "pve_easyMapSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "disable",
						layer		= "UI.PveChoice_MapSlotWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock1",
						layer		= "UI.PveChoice_MapSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text130",
						layer		= "UI.PveChoice_MapSlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "text137",
						layer		= "UI.PveChoice_MapSlotWnd.layers.MISSION_LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sel",
						layer		= "UI.PveChoice_MapSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.PveChoice_MapSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "skull",
						layer		= "UI.PveChoice_MapSlotWnd.layers.DIFFICULTY_ICO",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- DARKENING_EFFECT
		{
			id			= UI.PveChoice_MapSlotWnd.layers.DARKENING_EFFECT,
			
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pve_easyMapSlot_darkening",
				defaultAnimation	= "idle",
			}}
		},

		-- SEL_EFFECT
		{
			id			= UI.PveChoice_MapSlotWnd.layers.SEL_EFFECT,
		
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pve_easyMapSlot_sel",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			id			= UI.PveChoice_MapSlotWnd.layers.MOUSE_OVER_EFFECT,
			
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "pve_easyMapSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Pve_EasyMapSlotWnd:IsLocked()

	if UI.PveChoice_MapSlotWnd.IsLocked( self ) then
		return true
	end

	-- должен быть лидер сквада из 4-х человек (больше тоже нельзя - #0102225(0476169))
	if not UI.Squad:IsInSquad() or not UI.Squad:IsLeader() or UI.Squad:GetPilotsCount() ~= UI.PveWnd.SQUAD_SIZE_FOR_EASY_MISSION then
		return true
	end
	
	return false

end


--
function UI.Pve_EasyMapSlotWnd:OnSquadDataChanged()

	-- (здесь может измениться залоченное состояние, поэтому надо проапдейтить всё, что от него зависит)
	self:UpdateLockAndRequirements()
	self:UpdateDarkening()
	self:UpdateMouseOver()

end

-- ---------------------------------------------------------------------
-- UI.Pve_PveMissionInfoWnd
-- ---------------------------------------------------------------------

UI.Pve_PveMissionInfoWnd = 
{
	def =
	{
		className	= "Wnd",
		prototype	= "PveMissionInfoWnd",

		props =
		{
			name	= "Pve_PveMissionInfoWnd",
		},
	}
}

-- ---------------------------------------------------------------------
-- UI.Pve_BuffsWnd
-- ---------------------------------------------------------------------

UI.Pve_BuffsWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_BuffsWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Pve_BuffsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "pve_buffs",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title_2",
						layer		= "UI.Pve_BuffsWnd.layers.BUFF_1_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "title_3",
						layer		= "UI.Pve_BuffsWnd.layers.BUFF_2_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "disable",
						wnd			= "UI.Pve_Buffs_DarkeningWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},
		
		-- BUFF_1_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- BUFF_2_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},
	
	children = { "UI.Pve_Buffs_DarkeningWnd" }
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Pve_BuffsWnd:OnUnlimPveUpgradePlayerLevel( levelId, level )

	if levelId == 1 then
		self:UpdateBuff1Ico()
		self:UpdateBuff1Text()
		
	elseif levelId == 2 then
		self:UpdateBuff2Ico()
		self:UpdateBuff2Text()
		
	else
		sys.log( "UI.Pve_BuffsWnd:OnUnlimPveUpgradePlayerLevel()[ERROR]: unjandled levelId (%d); 1 or 2 expected", levelId )
	end
	
end


--
function UI.Pve_BuffsWnd:OnAccountRankChanged()	
	
	self:UpdateDarkening()
	
end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Pve_BuffsWnd.layers =
{
	MAIN_EFFECT	= 0,
	BUFF_1_TEXT	= 1,
	BUFF_2_TEXT	= 2,
}

UI.Pve_BuffsWnd.effectInfo =
{
	main =
	{
		buff1IcoLocator			= "item_slot_2",
		buff2IcoLocator			= "item_slot_3",
		buff1UpgradeBtnLocator	= "niver_btn_1",
		buff2UpgradeBtnLocator	= "niver_btn_2",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Pve_BuffsWnd.buff1IcoWnd		= nil
UI.Pve_BuffsWnd.buff2IcoWnd		= nil
UI.Pve_BuffsWnd.buff1UpgradeBtn	= nil
UI.Pve_BuffsWnd.buff2UpgradeBtn	= nil
UI.Pve_BuffsWnd.darkeningWnd	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Pve_BuffsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self:CreateControls()
	
end


--
function UI.Pve_BuffsWnd:CreateControls()
	
	self.buff1IcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "buff1" )
	self.buff2IcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "buff2" )
	self.buff1UpgradeBtn	= UI:CreateChildWnd( self, UI.Pve_Buffs_UpgradeBtn, "buff1" )
	self.buff2UpgradeBtn	= UI:CreateChildWnd( self, UI.Pve_Buffs_UpgradeBtn, "buff2" )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	
	UI:AddChildAndLink( self, self.buff1IcoWnd,		mainEffect, self.effectInfo.main.buff1IcoLocator,			UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.buff2IcoWnd,		mainEffect, self.effectInfo.main.buff2IcoLocator,			UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.buff1UpgradeBtn,	mainEffect, self.effectInfo.main.buff1UpgradeBtnLocator,	UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.buff2UpgradeBtn,	mainEffect, self.effectInfo.main.buff2UpgradeBtnLocator,	UI.EffectAnimParams.POS )
	
	self.buff1UpgradeBtn:Setup( 1 )
	self.buff2UpgradeBtn:Setup( 2 )
	
	self.darkeningWnd = UI.Pve_Buffs_DarkeningWnd
	self.darkeningWnd:UnlinkFromParent()

end


--
function UI.Pve_BuffsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.Pve_BuffsWnd:FullUpdate()
	
	self:UpdateBuff1Ico()
	self:UpdateBuff2Ico()
	self:UpdateBuff1Text()
	self:UpdateBuff2Text()
	self:UpdateDarkening()

end


--
function UI.Pve_BuffsWnd:UpdateBuff1Ico()

	local hTex = UI:GetUnlimPveBuffIco( 1 )
	self.buff1IcoWnd:SetupIco( hTex )
	
	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetUnlimPveBuffName( 1 ),
		text		= UI:GetUnlimPveBuffDesc( 1, UI.TooltipWnd_shared:GetTextColor() ),
	}
	self.buff1IcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Pve_BuffsWnd:UpdateBuff2Ico()

	local hTex = UI:GetUnlimPveBuffIco( 2 )
	self.buff2IcoWnd:SetupIco( hTex )
	
	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetUnlimPveBuffName( 2 ),
		text		= UI:GetUnlimPveBuffDesc( 2, UI.TooltipWnd_shared:GetTextColor() ),
	}
	self.buff2IcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Pve_BuffsWnd:UpdateBuff1Text()

	local strName = UI:GetUnlimPveBuffName( 1 )
	local level = _G.MasterServer_UnlimPveGetPlayerLevel1()
	
	local strLevel = UI:GetStringByName( "pve_buffs_buffLevel" )
	
	local numSubst = 0
	strLevel, numSubst = string.gsub( strLevel, "%$val%$", tostring( level ) )
	if numSubst == 0 then
		sys.log( "UI.Pve_BuffsWnd:UpdateBuff1Text()[ERROR]: cannot find placeholder '$val$' in string 'pve_buffs_buffLevel'" )
		strLevel = string.format( "[INVALID STRING] lvl %s", tostring( level ) )
	end
	
	local str = string.format( "%s %s", strName, strLevel )
	self:SetText( str, self.layers.BUFF_1_TEXT )
	
end


--
function UI.Pve_BuffsWnd:UpdateBuff2Text()

	local strName = UI:GetUnlimPveBuffName( 2 )
	local level = _G.MasterServer_UnlimPveGetPlayerLevel2()
	
	local strLevel = UI:GetStringByName( "pve_buffs_buffLevel" )
	
	local numSubst = 0
	strLevel, numSubst = string.gsub( strLevel, "%$val%$", tostring( level ) )
	if numSubst == 0 then
		sys.log( "UI.Pve_BuffsWnd:UpdateBuff2Text()[ERROR]: cannot find placeholder '$val$' in string 'pve_buffs_buffLevel'" )
		strLevel = string.format( "[INVALID STRING] lvl %s", tostring( level ) )
	end
	
	local str = string.format( "%s %s", strName, strLevel )
	self:SetText( str, self.layers.BUFF_2_TEXT )
	
end


--
function UI.Pve_BuffsWnd:UpdateDarkening()

	local requiredRank = UI.rankLocks.unlimPveBuffs
	local playerRank = UI:GetPlayerAccountRank()
	
	if requiredRank ~= -1 and requiredRank > playerRank then
		self:AddChild( self.darkeningWnd )
	else
		self.darkeningWnd:UnlinkFromParent()
	end

end


-- ---------------------------------------------------------------------
-- UI.Pve_Buffs_UpgradeBtn
-- ---------------------------------------------------------------------

UI.Pve_Buffs_UpgradeBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_Buffs_UpgradeBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name			= "Pve_Buffs_UpgradeBtn",
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
				defName				= "login_simpleBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Pve_Buffs_UpgradeBtn:Setup( buffId )

	self.buffId = buffId
	
end


--
function UI.Pve_Buffs_UpgradeBtn:GetBuffId()

	return self.buffId
	
end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Pve_Buffs_UpgradeBtn.textId = "pve_buffs_upgradeBtn"

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Pve_Buffs_UpgradeBtn.buffId	= -1

-- ---------------------------------------------------------------------
-- UI.Pve_Buffs_DarkeningWnd
-- ---------------------------------------------------------------------

UI.Pve_Buffs_DarkeningWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Pve_Buffs_DarkeningWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name	= "Pve_Buffs_DarkeningWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "pve_buffs_darkening",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title26",
						layer		= "UI.Pve_Buffs_DarkeningWnd.layers.REQUIRED_RANK",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},
		
		-- REQUIRED_RANK
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- const
-- -------------------------------------

UI.Pve_Buffs_DarkeningWnd.layers =
{
	MAIN_EFFECT		= 0,
	REQUIRED_RANK	= 1,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Pve_Buffs_DarkeningWnd.requiredRankMetaText	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Pve_Buffs_DarkeningWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.requiredRankMetaText = UI.MetaText.GetNewInstance()
	self.requiredRankMetaText:InitFromLayer( self, self.layers.REQUIRED_RANK ) 
	
	self:UpdateRequiredRank()

end


--
function UI.Pve_Buffs_DarkeningWnd:F_Shutdown()

	if self.requiredRankMetaText then
		self.requiredRankMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Pve_Buffs_DarkeningWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Pve_Buffs_DarkeningWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Pve_Buffs_DarkeningWnd:UpdateMetaTextPos()

	self.requiredRankMetaText:UpdateScreenOrgFromLayer( self, self.layers.REQUIRED_RANK )

end


--
function UI.Pve_Buffs_DarkeningWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REQUIRED_RANK then
		self.requiredRankMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Pve_Buffs_DarkeningWnd:UpdateRequiredRank()
	
	local str = UI:GetStringByName( "gameplayChoice_requiredRank" )

	local requiredRank = UI.rankLocks.unlimPveBuffs
	local strRank = tostring( requiredRank )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$rank%$", strRank )
	if numSubst == 0 then
		sys.log( "UI.Pve_Buffs_DarkeningWnd:UpdateRequiredRank()[ERROR]: cannot find placeholder \"$rank$\" in string \"gameplayChoice_requiredRank\"" )
		str = string.format( "[INVALID STRING]required rank %s", strRank )
	end

	local strLockIco = "$texture [texName lock][ignoreFontSize true][alignment CENTER]$"
	str = string.format( "%s %s", str, strLockIco )

	self.requiredRankMetaText:SetText( str, true )	
	
end

-- ---------------------------------------------------------------------
-- UI.Pve_UpgradeBuffsWnd
-- ---------------------------------------------------------------------

UI.Pve_UpgradeBuffsWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.Pve_UpgradeBuffsWnd.layers =
{
	MAIN_EFFECT						= 0,
	BG_EFFECT						= 1,
	WORK_EFFECT						= 2,
	CAPTION							= 3,
	DESC							= 4,
	PRICE							= 5,
	WORK_1_EFFECT					= 6,
	WORK_2_EFFECT					= 7,
	WAIT_EFFECT						= 8,
	WAIT_TEXT						= 9,
}


--
UI.Pve_UpgradeBuffsWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "Pve_UpgradeBuffsWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.Pve_UpgradeBuffsWnd.layers.ANIMATION_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "alienShipCraftWnd_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "whiteBg",
				defaultAnimation	= "idle",
			}},
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "specialShipNodeLearn_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "note",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "loading",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "item_tree1",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.WORK_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_create",
						wnd			= "UI.Pve_UpgradeBuffs_UpgradeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_x",
						wnd			= "UI.Pve_UpgradeBuffs_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 2, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipNodeLearn_desc" ),
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- WORK_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "specialShipNodeLearn_work1",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "item",
						wnd			= "UI.Pve_UpgradeBuffs_BuffIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				
					{
						objName		= "tem_tree",
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.WORK_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},
		
		-- WORK_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "specialShipNodeLearn_resourcesList",
				defaultAnimation	= "1",
				
				links =
				{
					{
						objName		= "item_1",
						wnd			= "UI.Pve_UpgradeBuffs_ResourceIcoWnd",
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
						layer		= "UI.Pve_UpgradeBuffsWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= "^hangar_loading",
		},
	},
	
	children =
	{
		"UI.Pve_UpgradeBuffs_BuffIcoWnd",
		"UI.Pve_UpgradeBuffs_ResourceIcoWnd",
		"UI.Pve_UpgradeBuffs_UpgradeBtn",
		"UI.Pve_UpgradeBuffs_CrossBtn",
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Pve_UpgradeBuffsWnd:Setup( buffId )
	
	self:Reset()
	
	self.buffId = buffId
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Pve_UpgradeBuffsWnd:OnResourcesChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateResourceCount()
	self:UpdateUpgradeBtn()
	
end


-- 
function UI.Pve_UpgradeBuffsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	self:UpdatePrice()
	self:UpdateUpgradeBtn()
	
end


--
function UI.Pve_UpgradeBuffsWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
	
		if self:IsOnScreen() then
		
			if requestId == self.upgradeBuffRequestId and self.bWantHide then
			
				self:Hide()
				UI:PlayGlobalSound( self.sounds.hide )
				
			else
			
				if levelId == self.buffId then
					self:UpdateCaption()
					self:UpdateResourceCount()
					self:UpdatePrice()
					self:UpdateUpgradeBtn()
				end
			
			end
			
		end
		
	else
	
		if requestId == self.upgradeBuffRequestId then
			self:ShowMsgOnUpgradeBuffError( result )
		end
		
	end
	
	if requestId == self.upgradeBuffRequestId then
		self.upgradeBuffRequestId = 0
		self:UpdateWaitingEffect()
		self.bWantHide = false
	end
	
end


--
function UI.Pve_UpgradeBuffsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.upgradeBuffRequestId = 0
	self:UpdateWaitingEffect()

end


-- -------------------------------
-- const
-- -------------------------------

UI.Pve_UpgradeBuffsWnd.sounds =
{
	upgrade		= UI.sounds.btnClick,
	hide		= "sound/ui/MsgHide",
}

-- -------------------------------
-- vars
-- -------------------------------

UI.Pve_UpgradeBuffsWnd.buffId				= -1
	
UI.Pve_UpgradeBuffsWnd.buffIcoWnd			= nil
UI.Pve_UpgradeBuffsWnd.resourceIcoWnd		= nil
UI.Pve_UpgradeBuffsWnd.upgradeBtn			= nil
UI.Pve_UpgradeBuffsWnd.crossBtn				= nil
UI.Pve_UpgradeBuffsWnd.priceMetaText		= nil

UI.Pve_UpgradeBuffsWnd.upgradeBuffRequestId	= 0
UI.Pve_UpgradeBuffsWnd.bWantHide			= false

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Pve_UpgradeBuffsWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	self.buffIcoWnd		= UI.Pve_UpgradeBuffs_BuffIcoWnd
	self.resourceIcoWnd	= UI.Pve_UpgradeBuffs_ResourceIcoWnd
	self.upgradeBtn		= UI.Pve_UpgradeBuffs_UpgradeBtn
	self.crossBtn		= UI.Pve_UpgradeBuffs_CrossBtn
	
	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )
	
	self:UpdateWaitingEffect()
	
end


--
function UI.Pve_UpgradeBuffsWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Pve_UpgradeBuffsWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()
	
	-- если мы открыли окно, а у нас еще продолжает выполняться предыдущий запрос, то по окончании его выполнения автоматического закрытия окна не будет
	if self.bWantHide and not UI.bSavingGameState then
		self.bWantHide = false
	end

end


--
function UI.Pve_UpgradeBuffsWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Pve_UpgradeBuffsWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.Pve_UpgradeBuffsWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Pve_UpgradeBuffsWnd:Reset()
	
	self.buffId = -1
	
	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.DESC )
	
	self.buffIcoWnd:Reset()
	self.buffIcoWnd:HideMain()
	self.buffIcoWnd:HideIcoMain()
	
	self.resourceIcoWnd:Reset()
	self.resourceIcoWnd:HideMain()
	self.resourceIcoWnd:HideIcoMain()
	
	self.priceMetaText:SetText( "", true )
	self.upgradeBtn:Enable( false )
	
end


--
function UI.Pve_UpgradeBuffsWnd:FullUpdate()
	
	self:UpdateCaption()
	self:UpdateDesc()
	self:UpdateBuffIco()
	self:UpdateResourceIco()
	self:UpdatePrice()
	self:UpdateUpgradeBtn()
	
end


--
function UI.Pve_UpgradeBuffsWnd:UpdateCaption()
	
	local newLevel = UI:GetUnlimPveBuffLevel( self.buffId ) + 1
	local strBuffName = UI:GetUnlimPveBuffName( self.buffId )
	
	local tSubst =
	{
		name	= strBuffName,
		level	= tostring( newLevel ),
	}
	
	local str = UI:GetStringByName( "pve_upgtradeBuff_caption" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$([%w_]+)%$", tSubst )
	if numSubst == 0 then
		sys.log( "UI.Pve_UpgradeBuffsWnd:UpdateCaption()[ERROR]: invalid placeholders in string 'pve_upgtradeBuff_caption'; '$name$' and 'level' expected" )
		str = string.format( "[INVALID STRING] Upgrading buff %s up to level %d", strBuffName, newLevel )
	end
	
	self:SetText( str, self.layers.CAPTION )
	
end


--
function UI.Pve_UpgradeBuffsWnd:UpdateDesc()

	local str = UI:GetUnlimPveBuffUpgradeDesc( self.buffId, self:GetColor( self.layers.DESC ) )
	self:SetText( str, self.layers.DESC )

end


--
function UI.Pve_UpgradeBuffsWnd:UpdateBuffIco()

	local hTex = UI:GetUnlimPveBuffIco( self.buffId )
	self.buffIcoWnd:SetupIco( hTex )

end


--
function UI.Pve_UpgradeBuffsWnd:UpdateResourceIco()

	self.resourceIcoWnd:Reset()
	self.resourceIcoWnd:HideMain()
	self.resourceIcoWnd:HideIcoMain()

	local defName = UI:GetUnlimPveBuffResourcePrice( self.buffId )
	if defName == "" then
		sys.log( "UI.Pve_UpgradeBuffsWnd:UpdateResourceIco()[ERROR]: no resource price for buff %d", self.buffId )
		return
	end
	
	self.resourceIcoWnd:SetupForItem( defName )
	
	local tooltipData = UI:GetTooltipForItem( defName )
	self.resourceIcoWnd:SetTooltipData( tooltipData )
	
	self:UpdateResourceCount()

end


--
function UI.Pve_UpgradeBuffsWnd:UpdateResourceCount()

	-- формат и цвета аналогичны тем, что в окне изучения нодов кораблей

	local defName, needCount = UI:GetUnlimPveBuffResourcePrice( self.buffId )
	local isCount = UI:GetPlayerResourceCount( defName )

	local str = ""

	local strNeedCount	= UI:Num2StrSeparatedBy3( needCount )
	local strIsCount	= tostring( math.min( isCount, 999 ) )

	if isCount >= needCount then
		local needCountColor = needCount > 0 and UI.GOLD_COLOR or UI.PARAM_DELTA_MINUS_COLOR
		str = string.format( "%s%s/%s%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strIsCount, UI:Color2Str( needCountColor ), strNeedCount )
	else
		str = string.format( "%s%s/%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), strIsCount, strNeedCount )
	end

	self.resourceIcoWnd:SetCountResourcesText( str )

end


--
function UI.Pve_UpgradeBuffsWnd:UpdatePrice()

	local credits = UI:GetUnlimPveBuffCreditsPrice( self.buffId )
	
	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= credits,
		bIsBuyPrice	= true,
		basePrice	= credits,
	}
	
	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )
	self.priceMetaText:SetText( str, true )
	
end


--
function UI.Pve_UpgradeBuffsWnd:UpdateUpgradeBtn()

	local resourceDefName, needResourceCount = UI:GetUnlimPveBuffResourcePrice( self.buffId )
	local needCredits = UI:GetUnlimPveBuffCreditsPrice( self.buffId )
	
	local isResourceCount = UI:GetPlayerResourceCount( resourceDefName )
	local isCredits = UI:GetPlayerMoney( false )
	
	local bEnableBtn = needResourceCount <= isResourceCount and needCredits <= isCredits
	self.upgradeBtn:Enable( bEnableBtn )
	
end


--
function UI.Pve_UpgradeBuffsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.upgradeBtn then
	
		if not self:IsWaiting() then
			self:DoUpgrade()
			UI:PlayGlobalSound( self.sounds.upgrade )
		end
		
	elseif wnd == self.crossBtn then
	
		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )
		
	end
	
	return true

end


--
function UI.Pve_UpgradeBuffsWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )
	
	return true

end


--
function UI.Pve_UpgradeBuffsWnd:DoUpgrade()

	if self:IsWaiting() then
		sys.log( "UI.Pve_UpgradeBuffsWnd:DoUpgrade()[ERROR]: still waiting for previous request" )
		return
	end
	
	self.upgradeBuffRequestId = _G.MasterServer_UnlimPveUpgradePlayerLevel( self.buffId )
	if self.upgradeBuffRequestId ~= 0 then
		self.bWantHide = true
	else
		self:ShowMsgOnUpgradeBuffError( _G.GameStore.StoreBuyResult.SBR_ERROR )	
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.Pve_UpgradeBuffsWnd:ShowMsgOnUpgradeBuffError( result )
	
	UI:ShowErrorMsg( "msg_unlimPveUpgradeBuffError", result, "_G.GameStore.StoreBuyResult" )
	
end


--
function UI.Pve_UpgradeBuffsWnd:IsWaiting()
	
	return self.upgradeBuffRequestId ~= 0

end


--
function UI.Pve_UpgradeBuffsWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.Pve_UpgradeBuffsWnd:F_OnEventSaveUiState()

	UI.store.Pve_UpgradeBuffsWnd =
	{
		upgradeBuffRequestId	= self.upgradeBuffRequestId,
		bWantHide				= self.bWantHide,
	}
	
	if self:IsOnScreen() then
		UI.store.Pve_UpgradeBuffsWnd.buffId = self.buffId
	end

end


--
function UI.Pve_UpgradeBuffsWnd:F_OnEventRestoreUiState()

	if UI.store.Pve_UpgradeBuffsWnd then

		self.upgradeBuffRequestId = UI.store.Pve_UpgradeBuffsWnd.upgradeBuffRequestId
		self:UpdateWaitingEffect()
		
		self.bWantHide = UI.store.Pve_UpgradeBuffsWnd.bWantHide
		
		if UI.store.Pve_UpgradeBuffsWnd.buffId and UI.store.Pve_UpgradeBuffsWnd.buffId ~= -1 then
			self:Setup( UI.store.Pve_UpgradeBuffsWnd.buffId )
		end

		UI.store.Pve_UpgradeBuffsWnd = nil

	end

end

-- ---------------------------------------------------------------------
-- UI.Pve_UpgradeBuffs_UpgradeBtn
-- ---------------------------------------------------------------------

UI.Pve_UpgradeBuffs_UpgradeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name	= "Pve_UpgradeBuffs_UpgradeBtn",
		},
	},
	
	textId = "pve_upgradeBuff_upgradeBtn"
}


-- ---------------------------------------------------------------------
-- UI.Pve_UpgradeBuffs_BuffIcoWnd
-- ---------------------------------------------------------------------

UI.Pve_UpgradeBuffs_BuffIcoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name	= "Pve_UpgradeBuffs_BuffIcoWnd",
		},
	},
}


-- ---------------------------------------------------------------------
-- UI.Pve_UpgradeBuffs_ResourceIcoWnd
-- ---------------------------------------------------------------------

UI.Pve_UpgradeBuffs_ResourceIcoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name	= "Pve_UpgradeBuffs_ResourceIcoWnd",
		},
	},
}

-- ---------------------------------------------------------------------
-- UI.Pve_UpgradeBuffs_CrossBtn
-- ---------------------------------------------------------------------

UI.Pve_UpgradeBuffs_CrossBtn =
{
	def =
	{
		className	= "Wnd",
		prototype	= "CrossBtn2",

		props =
		{
			name	= "Pve_UpgradeBuffs_CrossBtn",
		},
	},
}