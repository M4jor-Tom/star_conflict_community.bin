-- ----------------------------------------------------------------------------
--
-- Workfile: gameplaychoicewnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.GameplayChoiceWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoiceWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "GameplayChoiceWnd",
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
						layer		= "UI.GameplayChoiceWnd.layers.WORK_EFFECT",
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
				defName 			= "gameplayChoice_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title21",
						layer		= "UI.GameplayChoiceWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description7",
						layer		= "UI.GameplayChoiceWnd.layers.SEL_SLOT_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_1",
						wnd			= "UI.GameplayChoice_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "pve_history",
						wnd			= "UI.GameplayChoice_PveMissionInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "black_bg",
						wnd			= "UI.GameplayChoice_DarkeningWnd",
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
			text			= UI:GetStringByName( "gameplayChoice_caption" )
		}, 

		-- SEL_SLOT_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.GameplayChoice_RaidSlotWnd",
		"UI.GameplayChoice_TourSlotWnd",
		"UI.GameplayChoice_PvpSlotWnd",
		"UI.GameplayChoice_PveRandomSlotWnd",
		"UI.GameplayChoice_PveMissionsSlotWnd",
		"UI.GameplayChoice_BrawlSlotWnd",
		"UI.GameplayChoice_OWMapSlotWnd",
		"UI.GameplayChoice_RandomBfsSlotWnd",
		"UI.GameplayChoice_ArenaSlotWnd",
		"UI.GameplayChoice_CoopVsAiSlotWnd",
		"UI.GameplayChoice_DarkeningWnd",
		"UI.GameplayChoice_CloseBtn",
		"UI.GameplayChoice_PveMissionInfoWnd",
		"UI.GameplayChoice_CustomGameSlotWnd",
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoiceWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if UI.serverData.playerCredits.raceRepChanged then
		for slotType, slotWnd in pairs( self.slots ) do
			if slotWnd.OnRepChanged then
				slotWnd:OnRepChanged()
			end
		end
	end

end


--
function UI.GameplayChoiceWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for slotType, slotWnd in pairs( self.slots ) do
		if slotWnd.OnServerInfo then
			slotWnd:OnServerInfo()
		end
	end

end


--
function UI.GameplayChoiceWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for slotType, slotWnd in pairs( self.slots ) do
		if slotWnd.OnAccountAurasChanged then
			slotWnd:OnAccountAurasChanged()
		end
	end

end


--
function UI.GameplayChoiceWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for slotType, slotWnd in pairs( self.slots ) do
		if slotWnd.OnAccountAurasChanged then
			slotWnd:OnAccountAurasChanged()
		end
	end

end


--
function UI.GameplayChoiceWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for slotType, slotWnd in pairs( self.slots ) do
		if slotWnd.OnAccountAurasChanged then
			slotWnd:OnAccountAurasChanged()
		end
	end

end


--
function UI.GameplayChoiceWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateDarkeningWnd()	

end


--
function UI.GameplayChoiceWnd:MasterServer_OnUniverseGet( result, requestId )

	if requestId == self.universeRequestId then

		if result ~= 0 then
    		sys.log( "UI.GameplayChoiceWnd:MasterServer_OnUniverseGet()[ERROR]: error result %d", result )
		end

		self.universeRequestId = 0

	end

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.GameplayChoice_RandomBfsSlotWnd:OnUniverseGet()
	UI.GameplayChoice_ArenaSlotWnd:OnUniverseGet()

end


--
function UI.GameplayChoiceWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.universeRequestId	= 0

end


--
function UI.GameplayChoiceWnd:IsUniverseRequested()

	return self.bUniverseRequested

end


--
function UI.GameplayChoiceWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnBattleShipsChanged()

end


--
function UI.GameplayChoiceWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnBattleShipsChanged()

end


--
function UI.GameplayChoiceWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ChangeBSResult.CBSR_OK then
		return
	end

	self:OnBattleShipsChanged()

end


--
function UI.GameplayChoiceWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ChangeBSResult.CBSR_OK then
		return
	end

	self:OnBattleShipsChanged()

end


--
function UI.GameplayChoiceWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	for slotType, slotWnd in pairs( self.slots ) do
		slotWnd:OnAccountRankChanged()
	end
	
	self:UpdateSelSlotDesc()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoiceWnd.layers =
{
    MAIN_EFFECT		= 0,
	WORK_EFFECT		= 1,
    CAPTION			= 2,
    SEL_SLOT_DESC	= 3,
}

UI.GameplayChoiceWnd.slotTypes =
{
	PVP					= 1,
	PVE_RANDOM			= 2,
	PVE_MISSIONS		= 3,
	BRAWL				= 4,
	OPEN_WORLD_MAP		= 5,
	TOURNAMENT			= 6,
	RANDOM_BFS			= 7,
	RAID				= 8,
	ARENA				= 9,
	COOP_VS_AI			= 10,
	CUSTOM_GAME			= 11,
}

UI.GameplayChoiceWnd.slotParams =
{
	[ UI.GameplayChoiceWnd.slotTypes.PVP ]				= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.PVE_RANDOM ]		= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.PVE_MISSIONS ]		= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.BRAWL ]			= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.OPEN_WORLD_MAP ]	= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.TOURNAMENT ]		= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.RANDOM_BFS ]		= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.RAID ]				= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.ARENA ]			= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.COOP_VS_AI ]		= { bForceDisabled = false },
	[ UI.GameplayChoiceWnd.slotTypes.CUSTOM_GAME ]		= { bForceDisabled = false },
}

UI.GameplayChoiceWnd.effectInfo =
{
	slots =
	{
		[ UI.GameplayChoiceWnd.slotTypes.PVP ]				= { wndName		= "GameplayChoice_PvpSlotWnd",			locator = "btn_1_6" },
		[ UI.GameplayChoiceWnd.slotTypes.PVE_RANDOM ]		= { wndName		= "GameplayChoice_PveRandomSlotWnd",	locator = "btn_1_7" },
		[ UI.GameplayChoiceWnd.slotTypes.PVE_MISSIONS ]		= { wndName		= "GameplayChoice_PveMissionsSlotWnd",	locator = "btn_2_6" },
		[ UI.GameplayChoiceWnd.slotTypes.BRAWL ]			= { wndName		= "GameplayChoice_BrawlSlotWnd",		locator = "btn_2_13" },
		[ UI.GameplayChoiceWnd.slotTypes.OPEN_WORLD_MAP ]	= { wndName		= "GameplayChoice_OWMapSlotWnd",		locator = "btn_2_16" },
		[ UI.GameplayChoiceWnd.slotTypes.TOURNAMENT ]		= { wndName		= "GameplayChoice_TourSlotWnd",			locator = "btn_2_3" },
		[ UI.GameplayChoiceWnd.slotTypes.RANDOM_BFS ]		= { wndName		= "GameplayChoice_RandomBfsSlotWnd",	locator = "btn_2_14" },
		[ UI.GameplayChoiceWnd.slotTypes.RAID ]				= { wndName		= "GameplayChoice_RaidSlotWnd",			locator = "btn_2_5" },
		[ UI.GameplayChoiceWnd.slotTypes.ARENA ]			= { wndName		= "GameplayChoice_ArenaSlotWnd",		locator = "btn_2_2" },
		[ UI.GameplayChoiceWnd.slotTypes.COOP_VS_AI ]		= { wndName		= "GameplayChoice_CoopVsAiSlotWnd",		locator = "btn_1_5" },
		[ UI.GameplayChoiceWnd.slotTypes.CUSTOM_GAME ]		= { wndName		= "GameplayChoice_CustomGameSlotWnd",	locator = "btn_2_17" },
	}
}

UI.GameplayChoiceWnd.sounds =
{
	slotSelect			= UI.sounds.btnMouseOver,
	clickSlot			= UI.sounds.btnClick,
	showPveMissionInfo	= "sound/ui/btnClick",
	hidePveMissionInfo	= "sound/ui/MsgHide",
}

UI.GameplayChoiceWnd.UNIVERSE_UPDATE_INTERVAL = 60

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoiceWnd.slots					= {}
UI.GameplayChoiceWnd.selSlotType			= -1
UI.GameplayChoiceWnd.universeRequestTimer	= -1
UI.GameplayChoiceWnd.universeRequestId		= 0
UI.GameplayChoiceWnd.bUniverseRequested		= false

-- --------------------------------
-- work fucntions
-- --------------------------------

--
function UI.GameplayChoiceWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:InitSlots()

end


--
function UI.GameplayChoiceWnd:InitSlots()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	for slotTypeName, slotType in pairs( self.slotTypes ) do

		local slotWnd = nil

		local wndName = self.effectInfo.slots[ slotType ].wndName
		if wndName then
			slotWnd = UI[ wndName ]
		else
			slotWnd = UI:CreateChildWnd( self, UI[ self.effectInfo.slots[ slotType ].prototype ], slotTypeName )
		end

		UI:AddChildAndLink( self, slotWnd, workEffect, self.effectInfo.slots[ slotType ].locator, UI.EffectAnimParams.POS )
		self.slots[ slotType ] = slotWnd

		slotWnd:Init( slotType )

	end

end


--
function UI.GameplayChoiceWnd:Reset()

	self:SelectSlot( -1 )

	UI.GameplayChoice_PveMissionInfoWnd:UnlinkFromParent()
	UI.GameplayChoice_DarkeningWnd:UnlinkFromParent()

end


--
function UI.GameplayChoiceWnd:FullUpdate()

	self:Reset()

	if not UI.bSavingGameState then

		self.bUniverseRequested = false
		self.universeRequestTimer = 0
		self:UpdateUniverseRequestTimer( 0 )

	end

	self:UpdateDarkeningWnd()
	self:UpdateSelSlot( false )

end


--
function UI.GameplayChoiceWnd:UpdateSelSlot( bSound )

	local selSlotType = -1

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	if wndUnderMouse and wndUnderMouse:IsChildOf( self ) then

		local slotWnd = nil

		if UI:IsWndKindOf( wndUnderMouse, "GameplayChoice_SlotWnd" ) then
			slotWnd = wndUnderMouse
		else
			slotWnd = UI:GetAncestorKindOf( wndUnderMouse, "GameplayChoice_SlotWnd" )
		end

		if slotWnd then
			selSlotType = slotWnd:GetSlotType()
		end

	end

	self:SelectSlot( selSlotType, bSound )

end


--
function UI.GameplayChoiceWnd:SelectSlot( selSlotType, bSound )

	if selSlotType == self.selSlotType then
		return
	end

	self.selSlotType = selSlotType

	for slotType, slotWnd in pairs( self.slots ) do

		local bSelected = slotType == selSlotType

		if slotWnd:IsSelected() ~= bSelected then
			slotWnd:Select( bSelected )
		end

	end

	self:UpdateSelSlotDesc()

	if bSound and self:IsOnScreen() and self.selSlotType ~= -1 then
		UI:PlayGlobalSound( self.sounds.slotSelect )
	end

end


--
function UI.GameplayChoiceWnd:UpdateSelSlotDesc()

	local str = ""

	if self.selSlotType ~= -1 then

		local slotTypeName = UI:Val2Key( self.slotTypes, self.selSlotType )
		local strId = string.format( "gameplayChoice_slotDesc_%s", slotTypeName )
		str = UI:GetStringByName( strId )

	end

	self:SetText( str, self.layers.SEL_SLOT_DESC )	

end


--
function UI.GameplayChoiceWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateSelSlot( true )
	return true

end


--
function UI.GameplayChoiceWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateSelSlot( true )
	return true	

end


--
function UI.GameplayChoiceWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if wnd == UI.GameplayChoice_CloseBtn then

		UI.HangarWnd:HideGameplayChoiceWnd( true )

	elseif wnd == UI.GameplayChoice_RaidSlot_InfoBtn then

		local slotWnd = UI.GameplayChoice_RaidSlot_InfoBtn:GetParent()
		local missionName = slotWnd:GetMissionForDesc()

		if missionName ~= "" then
			self:ShowPveMissionInfoWnd( missionName )
		else
			sys.log( "UI.GameplayChoiceWnd:F_OnMouseLButtonDown()[ERROR]: cannot find mission name for raid desc" )
		end	

	elseif UI:IsWndKindOf( wnd, "GameplayChoice_SlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "GameplayChoice_SlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "GameplayChoice_SlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "GameplayChoice_SlotWnd" )

		if not slotWnd:IsDisabled() and UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then
			UI:PlayGlobalSound( self.sounds.clickSlot )		
			self:Proceed( slotWnd:GetSlotType() )
		end

	end

	return true

end


--
function UI.GameplayChoiceWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	-- перегрузка для того, чтобы всегда возвращало true, чтобы не передавалось в окно затемнения учебника

	self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )
	return true

end


--
function UI.GameplayChoiceWnd:OnEscape()

	if UI.GameplayChoice_PveMissionInfoWnd:IsOnScreen( self ) then

		UI.GameplayChoice_PveMissionInfoWnd:UnlinkFromParent()
		UI:PlayGlobalSound( self.sounds.hidePveMissionInfo )

	else
		UI.HangarWnd:HideGameplayChoiceWnd( true )
	end

	return true

end


--
function UI.GameplayChoiceWnd:Proceed( slotType )

	local slotTypeName = UI:Val2Key( self.slotTypes, slotType )
	local fnName = string.format( "Proceed_%s", slotTypeName )

	local fn = self[ fnName ] 
	if fn then
		fn( self )
	else
		sys.log( "UI.GameplayChoiceWnd:Proceed()[ERROR]: cannot find UI.GameplayChoiceWnd:%s()", fnName )
	end

end


--
function UI.GameplayChoiceWnd:Proceed_PVP()

	if UI:NeedFirstFight() and not UI.Squad:IsInSquad() then
		UI:LaunchFirstFight()
	else
		if UI:CheckSquadStatusBeforeGameplay() then
			UI.GameplayWnd:PrepareAndStartArcade()
		end
	end

end


--
function UI.GameplayChoiceWnd:Proceed_PVE_RANDOM()

	if UI:CheckSquadStatusBeforeGameplay() then
		UI.GameplayWnd:SetGameplay( { mmParams = { pve = 1, pve_mission = "", region = UI:GetGameRegion() }, bGameplayChoiceWnd = true } )
		UI.GameplayWnd:StartMatchMaking()
	end
	
end


--
function UI.GameplayChoiceWnd:Proceed_PVE_MISSIONS()

	UI.HangarWnd:HideGameplayChoiceWnd( false )
	UI.HangarWnd:ShowPveWnd( true )	
	
end


--
function UI.GameplayChoiceWnd:Proceed_BRAWL()
	
	if UI:CheckSquadStatusBeforeGameplay() then
		UI.GameplayWnd:SetGameplay( { mmParams = { brawl = true, region = UI:GetGameRegion()  } } )
		UI.GameplayWnd:StartMatchMaking()
	end

end


--
function UI.GameplayChoiceWnd:Proceed_OPEN_WORLD_MAP()

	UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, false, false )

end


--
function UI.GameplayChoiceWnd:Proceed_CUSTOM_GAME()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.CUSTOM_GAME, false, false )

end


--
function UI.GameplayChoiceWnd:Proceed_TOURNAMENT()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	UI.GameplayWnd:PrepareAndStartCallToArms()

end


--
function UI.GameplayChoiceWnd:Proceed_RAID()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	local shipRank = UI:GetCurrentShipsMaxRank()

	if shipRank == -1 then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_NO_SHIPS_IN_BSLOTS" ), UI.MBS_OK )
		return
	end	

	local missionNameToLaunch	= ""

	local raidLevelName = UI.GameplayChoice_RaidSlotWnd:GetRaidLevelName()
	if raidLevelName ~= "" then
		missionNameToLaunch = UI:GetPveRaidMissionToLaunch( raidLevelName )
	end

	if missionNameToLaunch ~= "" then

		UI.GameplayWnd:SetGameplay( { mmParams = { pve_raid = 1, pve_mission = missionNameToLaunch, region = UI:GetGameRegion() } } )
		UI.GameplayWnd:StartMatchMaking()

	else

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "mmError_MMJR_VESSEL_RANK_INAPPROPRIATE_PVE" ), UI.MBS_OK )

	end

end


--
function UI.GameplayChoiceWnd:Proceed_RANDOM_BFS()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	UI.GameplayWnd:SetGameplay( { mmParams = { universe = true, universeType = _G.MasterServer.UniverseType.UT_BFS } } )
	UI.GameplayWnd:StartMatchMaking()

end


--
function UI.GameplayChoiceWnd:Proceed_ARENA()
	
	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	-- #0108744 сейчас это "псевдо-арена"
	UI.GameplayWnd:SetGameplay( { mmParams = { universe = true, universeType = _G.MasterServer.UniverseType.UT_ARENA } } )
	UI.GameplayWnd:StartMatchMaking()

end


--
function UI.GameplayChoiceWnd:Proceed_COOP_VS_AI()

	if self:CheckShowMsgOnNotSquadLeader() then
		return
	end

	UI.GameplayWnd:SetGameplay( { mmParams = { coop_vs_ai = 1, region = UI:GetGameRegion() } } )
	UI.GameplayWnd:StartMatchMaking()

end


--
function UI.GameplayChoiceWnd:CheckShowMsgOnNotSquadLeader()

	if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then

		local errorName = UI:Val2Key( _G.MasterServer.MMJoinResult, _G.MasterServer.MMJoinResult.MMJR_NOT_SQUAD_LEADER )
		local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", errorName ) )

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), strErrorLocalized , UI.MBS_OK )

		return true

	end

	return false

end


--
function UI.GameplayChoiceWnd:ShowPveMissionInfoWnd( missionName )

	self:AddChild( UI.GameplayChoice_PveMissionInfoWnd )
	UI.GameplayChoice_PveMissionInfoWnd:UpdateForData( missionName )
	UI:PlayGlobalSound( self.sounds.showPveMissionInfo )

end


--
function UI.GameplayChoiceWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.GameplayChoiceWnd:UpdateZOrder()

	if UI.GameplayChoice_DarkeningWnd.w and UI.GameplayChoice_DarkeningWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayChoice_DarkeningWnd )
	end

	if UI.GameplayChoice_CloseBtn.w and UI.GameplayChoice_CloseBtn:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayChoice_CloseBtn )
	end

	if UI.GameplayChoice_PveMissionInfoWnd.w and UI.GameplayChoice_PveMissionInfoWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayChoice_PveMissionInfoWnd )
	end

end


--
function UI.GameplayChoiceWnd:UpdateDarkeningWnd()

	if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then
		UI.GameplayChoice_DarkeningWnd:UnlinkFromParent()
	else
		self:AddChild( UI.GameplayChoice_DarkeningWnd )
	end

end


--
function UI.GameplayChoiceWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateUniverseRequestTimer( dt_sys )

end


--
function UI.GameplayChoiceWnd:UpdateUniverseRequestTimer( dt )

	if self.universeRequestTimer ~= -1 then

		self.universeRequestTimer = self.universeRequestTimer - dt
		if self.universeRequestTimer <= 0 then

			self.universeRequestTimer = self.UNIVERSE_UPDATE_INTERVAL

			if self.universeRequestId == 0 then

    			self.universeRequestId = _G.MasterServer_UniverseRequest()

    			if self.universeRequestId ~= 0 then
					self.bUniverseRequested = true
				else
    				sys.log( "UI.GameplayChoiceWnd:UpdateUniverseRequestTimer()[ERROR]: fail to request universe" )
    			end

			end

		end

	end

end


--
function UI.GameplayChoiceWnd:F_OnEventSaveUiState()

	UI.store.GameplayChoiceWnd =
	{
		universeRequestTimer	= self.universeRequestTimer,
		universeRequestId		= self.universeRequestId,
		bUniverseRequested		= self.bUniverseRequested,
	}

	self:Hide()

end


--
function UI.GameplayChoiceWnd:F_OnEventRestoreUiState()

	if UI.store.GameplayChoiceWnd then

		self.universeRequestTimer	= UI.store.GameplayChoiceWnd.universeRequestTimer
		self.universeRequestId		= UI.store.GameplayChoiceWnd.universeRequestId
		self.bUniverseRequested		= UI.store.GameplayChoiceWnd.bUniverseRequested

		UI.store.GameplayChoiceWnd = nil

	end

end


--
function UI.GameplayChoiceWnd:OnBattleShipsChanged()

	for slotType, slotWnd in pairs( self.slots ) do
		if slotWnd.OnBattleShipsChanged then
			slotWnd:OnBattleShipsChanged()
		end
	end

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_SlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_SlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "GameplayChoice_SlotWnd",
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
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- REQUIREMENTS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
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
function UI.GameplayChoice_SlotWnd:Init( slotType )

	self:Reset()

	self.slotType = slotType

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.GameplayChoice_SlotWnd:Select( bSelected )

	self.bSelected = bSelected
	self:UpdateMainAnimation()

end


--
function UI.GameplayChoice_SlotWnd:GetSlotType()

	return self.slotType

end


--
function UI.GameplayChoice_SlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.GameplayChoice_SlotWnd:IsDisabled()

	return self.bDisabled

end


--
function UI.GameplayChoice_SlotWnd:OnAccountRankChanged()

	local bOldDisabledByRank = self.bDisabledByRank

	self:UpdateDisabledByRankStatus()

	if self.bDisabledByRank == bOldDisabledByRank then
		return
	end

	self:OnDisabledChanged()
	
end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_SlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    REQUIREMENTS	= 2,
}

UI.GameplayChoice_SlotWnd.effectInfo =
{
	main =
	{
		animIdle		= "idle",
		animSel			= "over",
		icoSpriteName	= "ico",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_SlotWnd.slotType				= -1
UI.GameplayChoice_SlotWnd.bSelected				= false
UI.GameplayChoice_SlotWnd.requirementsMetaText	= nil
UI.GameplayChoice_SlotWnd.bDisabled				= true
UI.GameplayChoice_SlotWnd.bForceDisabled		= false
UI.GameplayChoice_SlotWnd.bDisabledByRank		= false

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.requirementsMetaText = UI.MetaText.GetNewInstance()
	self.requirementsMetaText:InitFromLayer( self, self.layers.REQUIREMENTS ) 	

end


--
function UI.GameplayChoice_SlotWnd:F_Shutdown()

	if self.requirementsMetaText then
		self.requirementsMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.GameplayChoice_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

	self:FullUpdate()

end


--
function UI.GameplayChoice_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.GameplayChoice_SlotWnd:UpdateMetaTextPos()

	self.requirementsMetaText:UpdateScreenOrgFromLayer( self, self.layers.REQUIREMENTS )

end


--
function UI.GameplayChoice_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REQUIREMENTS then
		self.requirementsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.GameplayChoice_SlotWnd:Reset()

	self.bSelected				= false
	self.bDisabled				= true
	self.bForceDisabled			= false
	self.bDisabledByRank		= false

	self:UpdateIco()	
	self.requirementsMetaText:SetText( "", true )

end


--
function UI.GameplayChoice_SlotWnd:FullUpdate()

	self:Reset()

	self:UpdateAllDisabledStatuses()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateRequirementsText()
	self:UpdateMainAnimation()

end


--
function UI.GameplayChoice_SlotWnd:UpdateIco()

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if self.slotType ~= -1 then

    	local slotTypeName = UI:Val2Key( UI.GameplayChoiceWnd.slotTypes, self.slotType )
    	local icoName = string.format( "gameplayChoice_%s%s", slotTypeName, self.bDisabled and "_gray" or "" )
    	hTex = UI:GetTex( icoName )

	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )	

end


--
function UI.GameplayChoice_SlotWnd:UpdateName()

	local slotTypeName = UI:Val2Key( UI.GameplayChoiceWnd.slotTypes, self.slotType )
	local strId = string.format( "gameplayChoice_slotName_%s", slotTypeName )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.NAME )

end


--
function UI.GameplayChoice_SlotWnd:UpdateRequirementsText()

	local str = ""

	if self:NeedRequirementsText() then

		local requiredRank = self:GetRequiredRank()

		local strRank = tostring( requiredRank )

		str = UI:GetStringByName( "gameplayChoice_requiredRank" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$rank%$", strRank )

		if numSubst == 0 then
			sys.log( "UI.GameplayChoice_SlotWnd:UpdateRequirementsText()[ERROR]: cannot find placeholder \"$rank$\" in string \"gameplayChoice_requiredRank\"" )
			str = string.format( "[INVALID STRING]required rank %s", strRank )
		end			

		local strLockIco = "$texture [texName lock][ignoreFontSize true][alignment CENTER]$"
		str = string.format( "%s %s", str, strLockIco )

	end

	self.requirementsMetaText:SetText( str, true )	

end


--
function UI.GameplayChoice_SlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local anim = ( self.bSelected and not self.bDisabled ) and self.effectInfo.main.animSel or self.effectInfo.main.animIdle 

	mainEffect:StartAnimation( anim )

end


--
function UI.GameplayChoice_SlotWnd:UpdateAllDisabledStatuses()

	self:UpdateForceDisabledStatus()
	self:UpdateDisabledByRankStatus()

end



-- TODO: заменить на флаги
function UI.GameplayChoice_SlotWnd:UpdateDisabledStatus()

	self.bDisabled = self.bForceDisabled or self.bDisabledByRank

end


--
function UI.GameplayChoice_SlotWnd:UpdateForceDisabledStatus()

	self.bForceDisabled = UI.GameplayChoiceWnd.slotParams[ self.slotType ].bForceDisabled

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_SlotWnd:UpdateDisabledByRankStatus()

	local requiredRank = self:GetRequiredRank()
	self.bDisabledByRank = requiredRank ~= -1 and requiredRank > UI:GetPlayerAccountRank()

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_SlotWnd:GetRequiredRank()

	return -1

end


--
function UI.GameplayChoice_SlotWnd:NeedRequirementsText()

	return not self.bForceDisabled and self.bDisabledByRank

end


--
function UI.GameplayChoice_SlotWnd:OnDisabledChanged()

	self:UpdateIco()
	self:UpdateRequirementsText()
	self:UpdateMainAnimation()

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_SlotWnd_1
-- ---------------------------------------------------------------------

UI.GameplayChoice_SlotWnd_1 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "GameplayChoice_SlotWnd",

		props =
		{
			name		= "GameplayChoice_SlotWnd_1",
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
    				defName 			= "gameplayChoice_slot_1",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "description_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		}
		}		
	}
}


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_SlotWnd_2
-- ---------------------------------------------------------------------

UI.GameplayChoice_SlotWnd_2 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "GameplayChoice_SlotWnd",

		props =
		{
			name		= "GameplayChoice_SlotWnd_2",
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
    				defName 			= "gameplayChoice_slot_2",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "description_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		}
		}		
	}
}


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_SlotWnd_3
-- ---------------------------------------------------------------------

UI.GameplayChoice_SlotWnd_3 =
{
	def =
	{
		className	= "Wnd",
		prototype	= "GameplayChoice_SlotWnd",

		props =
		{
			name		= "GameplayChoice_SlotWnd_3",
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
    				defName 			= "gameplayChoice_slot_3",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "description_1",
    						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		}
		}		
	}
}

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_RaidSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_RaidSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

local l_numBaseSlotLayers = UI:GetTableLength( UI.GameplayChoice_SlotWnd.layers )

UI.GameplayChoice_RaidSlotWnd.layers =
{
	MAIN_EFFECT		= 0,
	NAME			= 1,
	REQUIREMENTS	= 2,
	RANK_EFFECT		= 3,
	RANK			= 4,
}

UI.GameplayChoice_RaidSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name		= "GameplayChoice_RaidSlotWnd",
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "gameplayChoice_slot_3",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "rank",
						layer		= "UI.GameplayChoice_RaidSlotWnd.layers.RANK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "info_mission",
						wnd			= "UI.GameplayChoice_RaidSlot_InfoBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						wnd			= "UI.GameplayChoice_RaidSlot_TimerWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- RANK_EFFECT
		{
			id			= UI.GameplayChoice_RaidSlotWnd.layers.RANK_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_scenario_slot_rank",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_10",
						layer		= "UI.GameplayChoice_RaidSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},

	children = { "UI.GameplayChoice_RaidSlot_InfoBtn", "UI.GameplayChoice_RaidSlot_TimerWnd" }
}

-- --------------------------------
-- interface funcitons
-- --------------------------------

--
function UI.GameplayChoice_RaidSlotWnd:OnRepChanged()

	self:UpdateRank()
	
end


--
function UI.GameplayChoice_RaidSlotWnd:OnServerInfo()

	local bOldbDisabledByCvar = self.bDisabledByCvar

	self:UpdateDisabledByCvarStatus()

	if self.bDisabledByCvar == bOldbDisabledByCvar then
		return
	end

	self:OnDisabledChanged()

end


--
function UI.GameplayChoice_RaidSlotWnd:OnAccountAurasChanged()

	self:UpdateSpecLootPointIco()

end


--
function UI.GameplayChoice_RaidSlotWnd:GetMissionForDesc()

	local missionName = ""

	local raidLevelName	 = self.raidLevelName ~= "" and self.raidLevelName or self.nextRaidLevelName
	if raidLevelName ~= "" then

		local missions = UI:GetPveRaidMissions( raidLevelName )

		if missions[ 1 ] then
			missionName = missions[ 1 ]
		end
		
	end

	return missionName

end


--
function UI.GameplayChoice_RaidSlotWnd:GetRaidLevelName()

	return self.raidLevelName

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_RaidSlotWnd.effectInfo =
{
	main =
	{
		rewardIcoLocator	= "pasted__btn_6",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_RaidSlotWnd.slotType				= UI.GameplayChoiceWnd.slotTypes.RAID
	
UI.GameplayChoice_RaidSlotWnd.raidLevelName			= ""
UI.GameplayChoice_RaidSlotWnd.nextRaidLevelName		= ""
UI.GameplayChoice_RaidSlotWnd.nextRaidTime			= UI.INVALID_U64_ID
UI.GameplayChoice_RaidSlotWnd.bDisabledByTime		= false
UI.GameplayChoice_RaidSlotWnd.bDisabledByCvar		= false
UI.GameplayChoice_RaidSlotWnd.specLootPointIcoWnd	= nil

-- --------------------------------
-- work functions
-- --------------------------------


--
function UI.GameplayChoice_RaidSlotWnd:F_PostLoad()

	UI.GameplayChoice_SlotWnd_3.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.GameplayChoice_RaidSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )
	
	self:SetText( "", self.layers.RANK )

	UI.GameplayChoice_RaidSlot_InfoBtn:UnlinkFromParent()

	UI.GameplayChoice_RaidSlot_TimerWnd:Reset()
	UI.GameplayChoice_RaidSlot_TimerWnd:UnlinkFromParent()

	self.specLootPointIcoWnd:UnlinkFromParent()

	self.raidLevelName		= ""
	self.nextRaidLevelName	= ""
	self.nextRaidTime		= UI.INVALID_U64_ID
	self.bDisabledByTime	= false
	self.bDisabledByCvar	= false

end


--
function UI.GameplayChoice_RaidSlotWnd:CreateControls()

	self.specLootPointIcoWnd = UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "" )

end


--
function UI.GameplayChoice_RaidSlotWnd:FullUpdate()

	self:Reset()

	self:UpdateData()

	self:UpdateAllDisabledStatuses()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateRequirementsText()
	self:UpdateMainAnimation()
	self:UpdateTimer()
	self:UpdateSpecLootPointIco()
	self:UpdateInfoIco()
	self:UpdateRank()

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateData()

	self.raidLevelName		= ""
	self.nextRaidLevelName	= ""
	self.nextRaidTime		= UI.INVALID_U64_ID

	local data = _G.MasterServer_GetRaidSchedule()

	if type( data ) ~= "table" then
		sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateData()[ERROR]: invalid type of return value from MasterServer_GetRaidSchedule(); \"table\" expected, got \"%s\"", type( data ) )
		return
	end

	if data.levelName ~= nil then

		if type( data.levelName ) == "string" then
			self.raidLevelName = data.levelName
		else
			sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateData()[ERROR]: invalid format of _G.MasterServer_GetRaidSchedule().levelName; \"string\" or \"nil\" expected, got \"%s\"", type( data.levelName ) )
		end

	else

		if type( data.nextLevel ) == "string" then
			self.nextRaidLevelName = data.nextLevel
		else
			sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateData()[ERROR]: invalid format of _G.MasterServer_GetRaidSchedule().nextLevel; \"string\" expected, got \"%s\"", type( data.nextLevel ) )
		end

		if type( data.next ) == "userdata" then
			self.nextRaidTime = data.next
		else
			sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateData()[ERROR]: invalid format of _G.MasterServer_GetRaidSchedule().next; \"userdata\" expected, got \"%s\"", type( data.next ) )
		end

	end

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateTimer()

	local time = -1

	if not self.bForceDisabled and not self.bDisabledByCvar and not self.bDisabledByRank and self.bDisabledByTime then

    	if type( self.nextRaidTime ) ~= UI.INVALID_U64_ID then

			time = 0
			local curTime = _G.MasterServer_GetServerTime()

			if self.nextRaidTime > curTime then
        		time = ( ( self.nextRaidTime - curTime ) * 0.001 ).l
			end

    	end

	end

	local bNeedTimer	= time ~= -1
	local bIsTimer		= UI.GameplayChoice_RaidSlot_TimerWnd:IsChildOf( self )

	if bNeedTimer and not bIsTimer then
		self:AddChild( UI.GameplayChoice_RaidSlot_TimerWnd )

	elseif not bNeedTimer and bIsTimer then
		UI.GameplayChoice_RaidSlot_TimerWnd:Reset()
		UI.GameplayChoice_RaidSlot_TimerWnd:UnlinkFromParent()
	end

	if bNeedTimer then
		UI.GameplayChoice_RaidSlot_TimerWnd:SetTime( time )
	end

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateSpecLootPointIco()

	local bHasReward = false

	if not self:IsDisabled() and self.raidLevelName ~= "" then

    	for idx, info in pairs( UI.serverData.accountAuras ) do

			local auraDef = _G.AccountAura[ info.defName ]
			if type( auraDef ) == "table" then
			
				if auraDef.raid_special_loot == true then

					if auraDef.pve_mission ~= nil then

						if type( auraDef.pve_mission ) == "string" then

							if UI:GetPveMissionLevelName( auraDef.pve_mission ) == self.raidLevelName then
								bHasReward = true
								break
							end

						else
							sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateSpecLootPointIco()[ERROR]: invalid type of _G.AccountAura[\"%s\"].pve_mission; \"string\" or \"nil\" expected, got \"%s\"", info.defName, type( auraDef.pve_mission ) )
						end
						
					elseif auraDef.level_name ~= nil then
					
						if type( auraDef.level_name ) == "string" then

							if auraDef.level_name == self.raidLevelName then
								bHasReward = true
								break
							end

						else
							sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateSpecLootPointIco()[ERROR]: invalid type of _G.AccountAura[\"%s\"].level_name; \"string\" or \"nil\" expected, got \"%s\"", info.defName, type( auraDef.level_name ) )
						end
						
					else
						sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateSpecLootPointIco()[ERROR]: neither 'pve_mission' nor 'level_name' dound in aura '%s'", info.defName )
					end
					
				end

			else
    			sys.log( "UI.GameplayChoice_RaidSlotWnd:UpdateSpecLootPointIco()[ERROR]: invalid type of _G.AccountAura[\"%s\"]; \"table\" expected, got \"%s\"", info.defName, type( auraDef ) )
			end

    	end

	end


	if bHasReward then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.specLootPointIcoWnd, mainEffect, self.effectInfo.main.rewardIcoLocator, UI.EffectAnimParams.POS )

    	local hTex = UI:GetTex( "bonus_raid" )
    	self.specLootPointIcoWnd:SetIco( hTex )

    	-- тултип

    	local tooltipData =
    	{
    		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    		text		= UI:GetStringByName( string.format( "tooltip_raid_reward_desc_%s", self.raidLevelName ) ),
    		caption 	= UI:GetStringByName( "tooltip_raid_reward_enable_caption" ),
    	}

    	self.specLootPointIcoWnd:SetTooltipData( tooltipData )		

	else
		self.specLootPointIcoWnd:UnlinkFromParent()
	end

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateInfoIco()

	if not self.bForceDisabled and not self.bDisabledByCvar and not self.bDisabledByRank then
		self:AddChild( UI.GameplayChoice_RaidSlot_InfoBtn )
	else
		UI.GameplayChoice_RaidSlot_InfoBtn:UnlinkFromParent()
	end

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateRank()

	local str = ""

	if not self.bForceDisabled and not self.bDisabledByCvar and not self.bDisabledByRank then

		local minRank	= self:GetRaidMinRank()
		local maxRank	= self:GetRaidMaxRank()

		str = string.format( "%d-%d", minRank, maxRank )

		if minRank > UI:GetPlayerRank() then

			local redColor = UI.PARAM_DELTA_MINUS_COLOR
			str = string.format( "%s%s", UI:Color2Str( redColor ), str )

		end

	end

	self:SetText( str, self.layers.RANK )

end


--
function UI.GameplayChoice_RaidSlotWnd:GetRequiredRank()

	return UI.rankLocks.raid

end


--
function UI.GameplayChoice_RaidSlotWnd:GetRaidMinRank()

	local rank = -1

	local raidLevelName = self.raidLevelName ~= "" and self.raidLevelName or self.nextRaidLevelName

	if raidLevelName ~= "" then
		rank = UI:GetPveRaidRequiredRank( raidLevelName )
	end

	return rank

end


--
function UI.GameplayChoice_RaidSlotWnd:GetRaidMaxRank()

	local rank = -1

	local raidLevelName = self.raidLevelName ~= "" and self.raidLevelName or self.nextRaidLevelName

	if raidLevelName ~= "" then
		rank = UI:GetPveRaidMaxRank( raidLevelName )
	end

	return rank

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_3.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByTimeStatus()
	self:UpdateDisabledByCvarStatus()
	
end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_3.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.bDisabledByTime or self.bDisabledByCvar

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateDisabledByTimeStatus()

	self.bDisabledByTime = self.raidLevelName == ""
	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateDisabledByCvarStatus()

	self.bDisabledByCvar = not _G.MasterServer_GetServerInfo().mmEnablePveRaids

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_RaidSlotWnd:NeedRequirementsText()

	return not self.bForceDisabled and not self.bDisabledByCvar and self.bDisabledByRank

end


--
function UI.GameplayChoice_RaidSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldRaidLevelName		= self.raidLevelName
	local oldNextRaidLevelName	= self.nextRaidLevelName

    self:UpdateData()	

	if oldRaidLevelName ~= self.raidLevelName or oldNextRaidLevelName ~= self.nextRaidLevelName then
		self:OnRaidChanged()
	else
		self:UpdateTimer()
	end

end


--
function UI.GameplayChoice_RaidSlotWnd:OnRaidChanged()

	self:UpdateIco()
	self:UpdateRequirementsText()
	self:UpdateTimer()
	self:UpdateRank()
	self:UpdateSpecLootPointIco()

	local bOldDisabledByTime = self.bDisabledByTime
	self:UpdateDisabledByTimeStatus()

	if self.bDisabledByTime ~= bOldDisabledByTime then
		self:OnDisabledChanged()
	end

end


--
function UI.GameplayChoice_RaidSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )

	self:UpdateTimer()
	self:UpdateSpecLootPointIco()
	self:UpdateInfoIco()
	self:UpdateRank()

end


--
function UI.GameplayChoice_RaidSlotWnd:UpdateIco()

	local hTex = UI.INVALID_RESOURCE_HANDLE

	local levelName = self.raidLevelName ~= "" and self.raidLevelName or self.nextRaidLevelName
	if levelName ~= "" then

        local slotTypeName = UI:Val2Key( UI.GameplayChoiceWnd.slotTypes, self.slotType )
    	local texName = string.format( "gameplayChoice_%s_%s%s", slotTypeName, levelName, self.bDisabled and "_gray" or "" )
		hTex = UI:GetTex( texName )

	else

		hTex = UI:GetTex( "NoData" )

	end

    local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )	

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_RaidSlot_InfoBtn
-- ---------------------------------------------------------------------

UI.GameplayChoice_RaidSlot_InfoBtn = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_RaidSlot_InfoBtn.def = 
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "GameplayChoice_RaidSlot_InfoBtn",
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
				defName				= "gameplay_scenario_info",
				defaultAnimation    = "idle",

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
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_RaidSlot_InfoBtn:GetTooltipData()

	return self.tooltipData

end

-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_RaidSlot_InfoBtn.effectInfo =
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

UI.GameplayChoice_RaidSlot_InfoBtn.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "tooltip_gameplays_scenario_info_caption" ), text = UI:GetStringByName( "tooltip_gameplays_scenario_info_text" ) }

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_TimerWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_TimerWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_TimerWnd.def = 
{
	className	= "Wnd",

	props =
	{
		name		= "GameplayChoice_TimerWnd",
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
				defName				= "gameplayChoice_timer",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title29",
						layer		= "UI.GameplayChoice_TimerWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_TimerWnd:SetTime( time )

	-- (взято из UI.GameplayPveMapRaidWnd)
	-- check server time correction lag 

	if self.time ~= -1 and time > self.time and ( time - self.time ) < 5 then
		--do nothing
		return
	end

	local oldTime = self.time
	self.time = time

	if UI:Round( time ) ~= UI:Round( oldTime ) then
		self:UpdateText()
	end

end


--
function UI.GameplayChoice_TimerWnd:Reset()

	self.time = -1
	self:SetText( "", self.layers.TEXT )

end


--
function UI.GameplayChoice_TimerWnd:GetTooltipData()

	return self.tooltipData

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_TimerWnd.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_TimerWnd.time			= -1
UI.GameplayChoice_TimerWnd.tooltipData	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_TimerWnd:UpdateText()

	local str = ""

	if self.time ~= -1 then	
		str = UI:Time2Str45( self.time )
	end

	self:SetText( str, self.layers.TEXT )

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_RaidSlot_TimerWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_RaidSlot_TimerWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_RaidSlot_TimerWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_TimerWnd",

	props =
	{
		name = "GameplayChoice_RaidSlot_TimerWnd",
	},
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_RaidSlot_TimerWnd.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = UI:GetStringByName( "tooltip_pve_raid_list_empty_text" ), caption = UI:GetStringByName( "tooltip_pve_raid_list_empty_caption" ) }


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_TourSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_TourSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_TourSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    REQUIREMENTS	= 2,
	RANK_EFFECT		= 3,
	RANK			= 4,
}

UI.GameplayChoice_TourSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name		= "GameplayChoice_TourSlotWnd",
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "gameplayChoice_slot_3",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "rank",
						layer		= "UI.GameplayChoice_TourSlotWnd.layers.RANK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "timer",
						wnd			= "UI.GameplayChoice_TourSlot_TimerWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- RANK_EFFECT
		{
			id			= UI.GameplayChoice_TourSlotWnd.layers.RANK_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_scenario_slot_rank",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_10",
						layer		= "UI.GameplayChoice_TourSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},

	children = { "UI.GameplayChoice_TourSlot_TimerWnd" }
}

-- --------------------------------
-- interface funcitons
-- --------------------------------

--
function UI.GameplayChoice_TourSlotWnd:OnAccountRankChanged()

	if self.tourId == -1 then
		return
	end
	
	UI.GameplayChoice_SlotWnd_3.OnAccountRankChanged( self )
	
end


-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_TourSlotWnd.slotType			= UI.GameplayChoiceWnd.slotTypes.TOURNAMENT
UI.GameplayChoice_TourSlotWnd.bDisabledByTime	= false
UI.GameplayChoice_TourSlotWnd.tourId			= -1
UI.GameplayChoice_TourSlotWnd.bTourOngoing		= false
UI.GameplayChoice_TourSlotWnd.nextTourData		= nil
UI.GameplayChoice_TourSlotWnd.tourInfo			= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_TourSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )
	
	self:SetText( "", self.layers.RANK )

	UI.GameplayChoice_TourSlot_TimerWnd:Reset()
	UI.GameplayChoice_TourSlot_TimerWnd:UnlinkFromParent()

	self.bDisabledByTime	= false
	self.tourId				= -1
	self.bTourOngoing		= false
	self.nexTourData		= nil
	self.tourInfo			= nil

end


--
function UI.GameplayChoice_TourSlotWnd:FullUpdate()

	self:Reset()

	self:UpdateData()

	if self.tourId == -1 then
		return
	end

	self:UpdateAllDisabledStatuses()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateRequirementsText()
	self:UpdateMainAnimation()
	self:UpdateTimer()
	self:UpdateRank()

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateData()

	self.tourId				= -1
	self.bTourOngoing		= false
	self.nexTourData		= nil
	self.tourInfo			= nil

	self.tourId = _G.MasterServer_GetTournamentNextRoundTime().idx

	if self.tourId ~= nil then

		self.bTourOngoing = true

	else

		self.nextTourData = _G.MasterServer_GetTournamentNearestStartTime()

		if self.nextTourData then
			self.tourId = self.nextTourData.idx
		end

		if not self.tourId then
			self.tourId = -1
		end

	end

	if self.tourId ~= -1 then
		self.tourInfo = UI:GetTournament( self.tourId )
	end

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateTimer()

	local time = -1

	if not self.bForceDisabled and not self.bDisabledByRank and self.bDisabledByTime then

		local startTime_msec = self.nextTourData and self.nextTourData.startTime

    	if type( startTime_msec ) == "userdata" then

        	local timeLeft_msec = startTime_msec - _G.MasterServer_GetServerTime()
        	time = ( timeLeft_msec * 0.001 ).l

    	end

	end

	local bNeedTimer	= time ~= -1
	local bIsTimer		= UI.GameplayChoice_TourSlot_TimerWnd:IsChildOf( self )

	if bNeedTimer and not bIsTimer then
		self:AddChild( UI.GameplayChoice_TourSlot_TimerWnd )

	elseif not bNeedTimer and bIsTimer then
		UI.GameplayChoice_TourSlot_TimerWnd:Reset()
		UI.GameplayChoice_TourSlot_TimerWnd:UnlinkFromParent()
	end

	if bNeedTimer then
		UI.GameplayChoice_TourSlot_TimerWnd:SetTime( time )
	end

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateRank()

	local str = ""

	if not self.bForceDisabled and not self.bDisabledByRank then

		local minRank	= self:GetRequiredRank()
		local maxRank	= self:GetMaxRank()

		str = string.format( "%d-%d", minRank, maxRank )

	end

	self:SetText( str, self.layers.RANK )

end


--
function UI.GameplayChoice_TourSlotWnd:GetRequiredRank()

	local minRank, maxRank = UI:GetTournamentRanks( self.tourId )
	return minRank

end


--
function UI.GameplayChoice_TourSlotWnd:GetMaxRank()

	local minRank, maxRank = UI:GetTournamentRanks( self.tourId )
	return maxRank

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_3.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByTimeStatus()

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_3.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.tourId == -1 or self.bDisabledByTime

end


--
function UI.GameplayChoice_TourSlotWnd:UpdateDisabledByTimeStatus()

	self.bDisabledByTime = not self.bTourOngoing

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_TourSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldTourId			= self.tourId
	local bOldTourOngoing	= self.bTourOngoing

    self:UpdateData()	

	if self.tourId ~= -1 then

		if self.tourId ~= self.tourId or self.bTourOngoing ~= bOldTourOngoing then
			self:FullUpdate()
		else
			self:UpdateTimer()
		end

	else

		if oldTourId ~= -1 then
			self:Reset()
		end

	end

end


--
function UI.GameplayChoice_TourSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )

	self:UpdateTimer()
	self:UpdateRank()

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_TourSlot_TimerWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_TourSlot_TimerWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_TourSlot_TimerWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_TimerWnd",

	props =
	{
		name = "GameplayChoice_TourSlot_TimerWnd",
	},
}

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_PvpSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_PvpSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_PvpSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_1",

	props =
	{
		name = "GameplayChoice_PvpSlotWnd",
	},
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_PvpSlotWnd:OnAccountAurasChanged()

	self:UpdateBonus()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_PvpSlotWnd.effectInfo =
{
	main =
	{
		bonusIcoLocator			= "pasted__btn_7",
		specLootPointIcoLocator	= "pasted__btn_8",
	},
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_PvpSlotWnd.slotType				= UI.GameplayChoiceWnd.slotTypes.PVP
UI.GameplayChoice_PvpSlotWnd.bonusIcoWnd			= nil
UI.GameplayChoice_PvpSlotWnd.specLootPointIcoWnd	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_PvpSlotWnd:F_PostLoad()

	UI.GameplayChoice_SlotWnd_3.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.GameplayChoice_PvpSlotWnd:CreateControls()

	self.bonusIcoWnd			= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "" )
	self.specLootPointIcoWnd	= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "specLootPoint" )

end


--
function UI.GameplayChoice_PvpSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )

	self.bonusIcoWnd:UnlinkFromParent()
	self.specLootPointIcoWnd:UnlinkFromParent()

end


--
function UI.GameplayChoice_PvpSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_3.FullUpdate( self )

	self:UpdateBonus()

end


--
function UI.GameplayChoice_PvpSlotWnd:UpdateBonus()

	local bHasBonus, bonusCf = self:GetBonus()

	self:UpdateBonusIco( bHasBonus, bonusCf )
	self:UpdateSpecLootPointIco( bHasBonus )

end


--
function UI.GameplayChoice_PvpSlotWnd:GetBonus()

    local bHasBonus = false
	local bonusCf	= 0

	if not self.bDisabled then

    	local accountAuras = _G.MasterServer_GetAccountAuras()
    	for idx, aurInfo in pairs( accountAuras ) do

    		if aurInfo.defName == "Daily_Pvp_2x" then
    			bHasBonus = true
    			break
    		end

    	end

	end

	if bHasBonus then
		bonusCf = cvars.sv_dailyWinPvpExpRewardCf
	end

	return bHasBonus, bonusCf

end


--
function UI.GameplayChoice_PvpSlotWnd:UpdateBonusIco( bHasBonus, bonusCf )

	if not bHasBonus then
		self.bonusIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.bonusIcoWnd, mainEffect, self.effectInfo.main.bonusIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local texName = string.format( "bonus_x%d", bonusCf )
	local hTex = UI:GetTex( texName )

	self.bonusIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:SubstituteValLocalizedByStringId( "tooltip_startBtn_x2", bonusCf, "val" ),
		caption 	= UI:GetStringByName( "tooltip_startBtn_x2_caption" ),
	}

	self.bonusIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_PvpSlotWnd:UpdateSpecLootPointIco( bHasBonus )

	if not bHasBonus then
		self.specLootPointIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.specLootPointIcoWnd, mainEffect, self.effectInfo.main.specLootPointIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local hTex = UI:GetTex( "bonus_pve" )
	self.specLootPointIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipText" ),
		caption 	= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipCaption" ),
	}

	self.specLootPointIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_PvpSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )

	self:UpdateBonus()

end


--
function UI.GameplayChoice_PvpSlotWnd:GetRequiredRank()

	return UI.rankLocks.pvp

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_PveRandomSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_PveRandomSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_PveRandomSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_1",

	props =
	{
		name = "GameplayChoice_PveRandomSlotWnd",
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_PveRandomSlotWnd:OnAccountAurasChanged()

	self:UpdateBonus()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_PveRandomSlotWnd.effectInfo =
{
	main =
	{
		bonusIcoLocator			= "pasted__btn_7",
		specLootPointIcoLocator	= "pasted__btn_8",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_PveRandomSlotWnd.slotType				= UI.GameplayChoiceWnd.slotTypes.PVE_RANDOM
UI.GameplayChoice_PveRandomSlotWnd.bonusIcoWnd			= nil
UI.GameplayChoice_PveRandomSlotWnd.specLootPointIcoWnd	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_PveRandomSlotWnd:F_PostLoad()

	UI.GameplayChoice_SlotWnd_1.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.GameplayChoice_PveRandomSlotWnd:CreateControls()

	self.bonusIcoWnd			= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "bonus" )
	self.specLootPointIcoWnd	= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "specLootPoint" )

end


--
function UI.GameplayChoice_PveRandomSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_1.Reset( self )

	self.bonusIcoWnd:UnlinkFromParent()
	self.specLootPointIcoWnd:UnlinkFromParent()

end


--
function UI.GameplayChoice_PveRandomSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_1.FullUpdate( self )

	self:UpdateBonus()

end


--
function UI.GameplayChoice_PveRandomSlotWnd:UpdateBonus()

	local bHasBonus, bonusCf = self:GetBonus()

	self:UpdateBonusIco( bHasBonus, bonusCf )
	self:UpdateSpecLootPointIco( bHasBonus )

end


--
function UI.GameplayChoice_PveRandomSlotWnd:GetBonus()

	local bHasBonus	= false
	local bonusCf	= 0

	if not self.bDisabled then

    	local accountAuras = _G.MasterServer_GetAccountAuras()
    	for idx, aurInfo in pairs( accountAuras ) do

    		if aurInfo.defName == "Daily_Pve_2x" then
    			bHasBonus = true
    			break
    		end

    	end

	end

	if bHasBonus then
		bonusCf = cvars.sv_dailyWinPveExpRewardCf
	end

	return bHasBonus, bonusCf	

end


--
function UI.GameplayChoice_PveRandomSlotWnd:UpdateBonusIco( bHasBonus, bonusCf )

	if not bHasBonus then
		self.bonusIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.bonusIcoWnd, mainEffect, self.effectInfo.main.bonusIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local texName = string.format( "bonus_x%d", bonusCf )
	local hTex = UI:GetTex( texName )

	self.bonusIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:SubstituteValLocalizedByStringId( "tooltip_startBtn_x2_pve", bonusCf, "val" ),
		caption 	= UI:GetStringByName( "tooltip_startBtn_x2_pve_caption" ),
	}

	self.bonusIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_PveRandomSlotWnd:UpdateSpecLootPointIco( bHasBonus )

	if not bHasBonus then
		self.specLootPointIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.specLootPointIcoWnd, mainEffect, self.effectInfo.main.specLootPointIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local hTex = UI:GetTex( "bonus_pve" )
	self.specLootPointIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipText" ),
		caption 	= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipCaption" ),
	}

	self.specLootPointIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_PveRandomSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_1.OnDisabledChanged( self )

	self:UpdateBonus()

end


--
function UI.GameplayChoice_PveRandomSlotWnd:GetRequiredRank()

	return UI.rankLocks.pve

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_PveMissionsSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_PveMissionsSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_PveMissionsSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_PveMissionsSlotWnd",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_PveMissionsSlotWnd.slotType	= UI.GameplayChoiceWnd.slotTypes.PVE_MISSIONS

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_PveMissionsSlotWnd:GetRequiredRank()

	return UI.rankLocks.pve_missions

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_OWMapSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_OWMapSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_OWMapSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_OWMapSlotWnd",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_OWMapSlotWnd.slotType = UI.GameplayChoiceWnd.slotTypes.OPEN_WORLD_MAP


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_OWMapSlotWnd:GetRequiredRank()

	return UI.rankLocks.openWorldMap

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_RandomBfsSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_RandomBfsSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_RandomBfsSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_RandomBfsSlotWnd",
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "gameplayChoice_slot_3",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description11",
						layer		= "UI.GameplayChoice_RandomBfsSlotWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "btn_help",
						wnd			= "UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TIMER
		{
			id				= l_numBaseSlotLayers,

			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		}, 
	},
	
	children = { "UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd" }
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_RandomBfsSlotWnd:OnUniverseGet()
	
	self:FullUpdate()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_RandomBfsSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    REQUIREMENTS	= 2,
	TIMER			= 3,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_RandomBfsSlotWnd.slotType			= UI.GameplayChoiceWnd.slotTypes.RANDOM_BFS
UI.GameplayChoice_RandomBfsSlotWnd.bDisabledByTime	= false
UI.GameplayChoice_RandomBfsSlotWnd.bHasConflict		= false
UI.GameplayChoice_RandomBfsSlotWnd.startTime		= UI.INVALID_U64_ID


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_RandomBfsSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )

	self.bDisabledByTime	= false
	self.bHasConflict		= false
	self.startTime			= UI.INVALID_U64_ID

	self:SetText( "", self.layers.TIMER )

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_3.FullUpdate( self )
	
	self:UpdateData()

	local bOldDisabledByTime = self.bDisabledByTime
	self:UpdateDisabledByTimeStatus()
	if self.bDisabledByTime ~= bOldDisabledByTime then
		self:OnDisabledChanged()
	end

	self:UpdateTimer()

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:UpdateData()

	self.bHasConflict	= false
	self.startTime		= UI.INVALID_U64_ID

	local data = _G.MasterServer_EnableUniverse( _G.MasterServer.UniverseType.UT_BFS )

	if type( data ) == "table" then

		if type( data.enable ) == "boolean" then
			self.bHasConflict = data.enable
		else
			sys.log( "UI.GameplayChoice_RandomBfsSlotWnd:UpdateData()[ERROR]: invalid type of field \"enable\" in table returned from _G.MasterServer_EnableUniverse(); \"boolean\" expected, got \"%s\"", type( data.enable ) )
		end

		if not self.bHasConflict then

    		if type( data.startTime ) == "userdata" then
    			self.startTime = data.startTime
    		else
    			sys.log( "UI.GameplayChoice_RandomBfsSlotWnd:UpdateData()[ERROR]: invalid type of field \"startTime\" in table returned from _G.MasterServer_EnableUniverse(); \"userdata\" expected, got \"%s\"", type( data.startTime ) )
    		end

		end

	else
		sys.log( "UI.GameplayChoice_RandomBfsSlotWnd:UpdateData()[ERROR]: invalid type of return value from _G.MasterServer_EnableUniverse(); \"table\" expected, got \"%s\"", type( data ) )
	end

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:UpdateTimer()

	local str = ""

	if not self.bForceDisabled and not self.bDisabledByRank then

		if self.bDisabledByTime then

    		local timer = 0

    		if self.startTime ~= UI.INVALID_U64_ID then	

        		local curTime = _G.MasterServer_GetServerTime()
    			if curTime < self.startTime then

    	    		timer = ( self.startTime - curTime ).l * 0.001
        			timer = UI:Round( timer )

    			end

    		end

    		str = UI:Time2Str45( timer )

    	end

	end

	self:SetText( str, self.layers.TIMER )
	
end


--
function UI.GameplayChoice_RandomBfsSlotWnd:GetRequiredRank()

	return UI.rankLocks.randomBfs

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_3.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByTimeStatus()
	
end


--
function UI.GameplayChoice_RandomBfsSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_3.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.bDisabledByTime

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:UpdateDisabledByTimeStatus()

    self.bDisabledByTime = not self.bHasConflict
	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )

	self:UpdateTimer()

end


--
function UI.GameplayChoice_RandomBfsSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer()

end

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "GameplayChoice_RandomBfsSlot_InfoIcoWnd",
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
				defName 			= "helpBtn",
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
	},
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd:GetTooltipData()

	return self.tooltipData

end

-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_RandomBfsSlot_InfoIcoWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "gameplayChoice_slotName_RANDOM_BFS" ),
	text		= UI:GetStringByName( "gameplayChoice_slotDesc_RANDOM_BFS_tooltip" ),
}

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_ArenaSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_ArenaSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_ArenaSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_ArenaSlotWnd",
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "gameplayChoice_slot_3",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_1",
						layer		= "UI.GameplayChoice_SlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description11",
						layer		= "UI.GameplayChoice_ArenaSlotWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIMER
		{
			id				= l_numBaseSlotLayers,

			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		}, 
	},
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_ArenaSlotWnd:OnUniverseGet()
	
	self:FullUpdate()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_ArenaSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    REQUIREMENTS	= 2,
	TIMER			= 3,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_ArenaSlotWnd.slotType			= UI.GameplayChoiceWnd.slotTypes.ARENA
UI.GameplayChoice_ArenaSlotWnd.bDisabledByTime	= false
UI.GameplayChoice_ArenaSlotWnd.bHasConflict		= false
UI.GameplayChoice_ArenaSlotWnd.startTime		= UI.INVALID_U64_ID


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_ArenaSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )

	self.bDisabledByTime	= false
	self.bHasConflict		= false
	self.startTime			= UI.INVALID_U64_ID

	self:SetText( "", self.layers.TIMER )

end


--
function UI.GameplayChoice_ArenaSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_3.FullUpdate( self )
	
	self:UpdateData()

	local bOldDisabledByTime = self.bDisabledByTime
	self:UpdateDisabledByTimeStatus()
	if self.bDisabledByTime ~= bOldDisabledByTime then
		self:OnDisabledChanged()
	end

	self:UpdateTimer()

end


--
function UI.GameplayChoice_ArenaSlotWnd:UpdateData()

	self.bHasConflict	= false
	self.startTime		= UI.INVALID_U64_ID

	local data = _G.MasterServer_EnableUniverse( _G.MasterServer.UniverseType.UT_ARENA )

	if type( data ) == "table" then

		if type( data.enable ) == "boolean" then
			self.bHasConflict = data.enable
		else
			sys.log( "UI.GameplayChoice_ArenaSlotWnd:UpdateData()[ERROR]: invalid type of field \"enable\" in table returned from _G.MasterServer_EnableUniverse(); \"boolean\" expected, got \"%s\"", type( data.enable ) )
		end

		if not self.bHasConflict then

    		if type( data.startTime ) == "userdata" then
    			self.startTime = data.startTime
    		else
    			sys.log( "UI.GameplayChoice_ArenaSlotWnd:UpdateData()[ERROR]: invalid type of field \"startTime\" in table returned from _G.MasterServer_EnableUniverse(); \"userdata\" expected, got \"%s\"", type( data.startTime ) )
    		end

		end

	else
		sys.log( "UI.GameplayChoice_ArenaSlotWnd:UpdateData()[ERROR]: invalid type of return value from _G.MasterServer_EnableUniverse(); \"table\" expected, got \"%s\"", type( data ) )
	end

end


--
function UI.GameplayChoice_ArenaSlotWnd:UpdateTimer()

	local str = ""

	if not self.bForceDisabled and not self.bDisabledByRank then

		if self.bDisabledByTime then

    		local timer = 0

    		if self.startTime ~= UI.INVALID_U64_ID then	

        		local curTime = _G.MasterServer_GetServerTime()
    			if curTime < self.startTime then

    	    		timer = ( self.startTime - curTime ).l * 0.001
        			timer = UI:Round( timer )

    			end

    		end

    		str = UI:Time2Str45( timer )

    	end

	end

	self:SetText( str, self.layers.TIMER )
	
end


--
function UI.GameplayChoice_ArenaSlotWnd:GetRequiredRank()

	return UI.rankLocks.arena

end


--
function UI.GameplayChoice_ArenaSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_3.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByTimeStatus()
	
end


--
function UI.GameplayChoice_ArenaSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_3.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.bDisabledByTime

end


--
function UI.GameplayChoice_ArenaSlotWnd:UpdateDisabledByTimeStatus()

    self.bDisabledByTime = not self.bHasConflict
	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_ArenaSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )

	self:UpdateTimer()

end


--
function UI.GameplayChoice_ArenaSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer()

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_CoopVsAiSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_CoopVsAiSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_CoopVsAiSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    REQUIREMENTS		= 2,
	SHIPS_RANK_EFFECT	= 3,
	SHIPS_RANK			= 4,
}

UI.GameplayChoice_CoopVsAiSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_1",

	props =
	{
		name		= "GameplayChoice_CoopVsAiSlotWnd",
	},

	layers =
	{
		numLayers = l_numBaseSlotLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "gameplayChoice_slot_1",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.GameplayChoice_CoopVsAiSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_1",
						layer		= "UI.GameplayChoice_CoopVsAiSlotWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "rank",
						layer		= "UI.GameplayChoice_CoopVsAiSlotWnd.layers.SHIPS_RANK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SHIPS_RANK_EFFECT
		{
			id			= UI.GameplayChoice_CoopVsAiSlotWnd.layers.SHIPS_RANK_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_scenario_slot_rank",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_10",
						layer		= "UI.GameplayChoice_CoopVsAiSlotWnd.layers.SHIPS_RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SHIPS_RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- --------------------------------
-- const
-- --------------------------------

-- #0059593 - временно, пока не настроено дизайнерами
UI.GameplayChoice_CoopVsAiSlotWnd.SHIPS_MIN_RANK	= -1
UI.GameplayChoice_CoopVsAiSlotWnd.SHIPS_MAX_RANK	= -1 -- #0104965: отключено по просьбе Целищева

UI.GameplayChoice_CoopVsAiSlotWnd.effectInfo =
{
	main =
	{
		bonusIcoLocator			= "pasted__btn_7",
		specLootPointIcoLocator	= "pasted__btn_8",
	},

	shipsRank =
	{
		animIdle		= "idle",
		animDisabled	= "lock",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_CoopVsAiSlotWnd.slotType				= UI.GameplayChoiceWnd.slotTypes.COOP_VS_AI
UI.GameplayChoice_CoopVsAiSlotWnd.bDisabledByCvar		= false
UI.GameplayChoice_CoopVsAiSlotWnd.bDisabledByShipsRank	= false
UI.GameplayChoice_CoopVsAiSlotWnd.bonusIcoWnd			= nil
UI.GameplayChoice_CoopVsAiSlotWnd.specLootPointIcoWnd	= nil

-- --------------------------------
-- interface funcitons
-- --------------------------------

--
function UI.GameplayChoice_CoopVsAiSlotWnd:OnServerInfo()

	local bOldbDisabledByCvar = self.bDisabledByCvar

	self:UpdateDisabledByCvarStatus()

	if self.bDisabledByCvar == bOldbDisabledByCvar then
		return
	end

	self:OnDisabledChanged()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:OnBattleShipsChanged()

	local bOldDisabledByShipsRank = self.bDisabledByShipsRank

	self:UpdateDisabledByShipsRankStatus()

	if self.bDisabledByShipsRank == bOldDisabledByShipsRank then
		return
	end

	self:OnDisabledChanged()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:OnAccountAurasChanged()

	self:UpdateBonus()

end

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_CoopVsAiSlotWnd:F_PostLoad()

	UI.GameplayChoice_SlotWnd_1.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:CreateControls()

	self.bonusIcoWnd			= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "" )
	self.specLootPointIcoWnd	= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "specLootPoint" )

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_1.Reset( self )
	
	self.bDisabledByCvar		= false
	self.bDisabledByShipsRank	= false
	
	self:SetLayerVisible( false, self.layers.SHIPS_RANK_EFFECT )
	self:SetLayerVisible( false, self.layers.SHIPS_RANK )

	self.bonusIcoWnd:UnlinkFromParent()
	self.specLootPointIcoWnd:UnlinkFromParent()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_1.FullUpdate( self )

	self:UpdateShipsRank()
	self:UpdateBonus()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_1.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByCvarStatus()
	self:UpdateDisabledByShipsRankStatus()
	
end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateShipsRank()

	if self.SHIPS_MIN_RANK == -1 or self.SHIPS_MAX_RANK == -1 then
	
		self:SetLayerVisible( false, self.layers.SHIPS_RANK_EFFECT )
		self:SetLayerVisible( false, self.layers.SHIPS_RANK )
		
	else
	
		self:SetLayerVisible( true, self.layers.SHIPS_RANK_EFFECT )
		self:SetLayerVisible( true, self.layers.SHIPS_RANK )

		local str = string.format( "%d-%d", self.SHIPS_MIN_RANK, self.SHIPS_MAX_RANK )
		self:SetText( str, self.layers.SHIPS_RANK )

		local anim = self.bDisabledByShipsRank and self.effectInfo.shipsRank.animDisabled or self.effectInfo.shipsRank.animIdle

		local shipsRankEffect = UI:GetEffectFromLayer( self, self.layers.SHIPS_RANK_EFFECT )
		if shipsRankEffect then
			shipsRankEffect:StartAnimation( anim )
		end
		
	end

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_1.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.bDisabledByCvar or self.bDisabledByShipsRank

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateDisabledByCvarStatus()

	self.bDisabledByCvar = not _G.MasterServer_GetServerInfo().mmEnableCoopVsAi

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateDisabledByShipsRankStatus()

	self.bDisabledByShipsRank = false
	
	if self.SHIPS_MIN_RANK ~= -1 and self.SHIPS_MAX_RANK ~= -1 then

		local curShipsMinRank	= -1
		local curShipsMaxRank	= -1

		for slotIdx, vid in pairs( UI.serverData.battleSlots ) do

			if vid ~= UI.INVALID_U64_ID then

				local shipItem = UI:GetShipItem( vid, false )
				if shipItem then

					local shipRank = UI:GetShipRank( shipItem.defName )

					if shipRank ~= -1 then

						if shipRank < curShipsMinRank or curShipsMinRank == -1 then
							curShipsMinRank = shipRank
						end

						if shipRank > curShipsMaxRank or curShipsMaxRank == -1 then
							curShipsMaxRank = shipRank
						end

					else
						sys.log( "UI.GameplayChoice_CoopVsAiSlotWnd:UpdateDisabledByShipsRankStatus()[ERROR] - invalid rank for ship %s", shipItem.defName )
					end

				else
					sys.log( "UI.GameplayChoice_CoopVsAiSlotWnd:UpdateDisabledByShipsRankStatus()[ERROR] - cannot find ship item" )
				end

			end

		end

		if	curShipsMinRank == -1
			or curShipsMaxRank == -1
			or curShipsMinRank < self.SHIPS_MIN_RANK
			or curShipsMaxRank > self.SHIPS_MAX_RANK then
				self.bDisabledByShipsRank = true
		end
		
	end

	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_1.OnDisabledChanged( self )

	self:UpdateShipsRank()
	self:UpdateBonus()

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateBonus()

	local bHasBonus, bonusCf = self:GetBonus()

	self:UpdateBonusIco( bHasBonus, bonusCf )
	self:UpdateSpecLootPointIco( bHasBonus )

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:GetBonus()

    local bHasBonus = false
	local bonusCf	= 0

	if not self.bDisabled then

    	local accountAuras = _G.MasterServer_GetAccountAuras()
    	for idx, aurInfo in pairs( accountAuras ) do

    		if aurInfo.defName == "Daily_Coop_2x" then
    			bHasBonus = true
    			break
    		end

    	end

	end

	if bHasBonus then
		bonusCf = cvars.sv_dailyWinCoopExpRewardCf
	end

	return bHasBonus, bonusCf

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateBonusIco( bHasBonus, bonusCf )

	if not bHasBonus then
		self.bonusIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.bonusIcoWnd, mainEffect, self.effectInfo.main.bonusIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local texName = string.format( "bonus_x%d", bonusCf )
	local hTex = UI:GetTex( texName )

	self.bonusIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:SubstituteValLocalizedByStringId( "tooltip_startBtn_x2", bonusCf, "val" ),
		caption 	= UI:GetStringByName( "tooltip_startBtn_x2_caption" ),
	}

	self.bonusIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:UpdateSpecLootPointIco( bHasBonus )

	if not bHasBonus then
		self.specLootPointIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.specLootPointIcoWnd, mainEffect, self.effectInfo.main.specLootPointIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local hTex = UI:GetTex( "bonus_pve" )
	self.specLootPointIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipText" ),
		caption 	= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipCaption" ),
	}

	self.specLootPointIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_CoopVsAiSlotWnd:GetRequiredRank()

	return UI.rankLocks.coop_vs_ai

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_BrawlSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_BrawlSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_BrawlSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_BrawlSlotWnd",
	},
	
	children = { "UI.GameplayChoice_BrawlSlot_TimerWnd" }
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_BrawlSlotWnd:OnAccountAurasChanged()

	self:UpdateBonus()

end

-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_BrawlSlotWnd.effectInfo =
{
	main =
	{
		bonusIcoLocator			= "pasted__btn_6",
		specLootPointIcoLocator	= "pasted__btn_20",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_BrawlSlotWnd.slotType				= UI.GameplayChoiceWnd.slotTypes.BRAWL
UI.GameplayChoice_BrawlSlotWnd.BRAWL_data			= nil
UI.GameplayChoice_BrawlSlotWnd.bDisabledByTime		= false
UI.GameplayChoice_BrawlSlotWnd.timerWnd				= nil
UI.GameplayChoice_BrawlSlotWnd.bonusIcoWnd			= nil
UI.GameplayChoice_BrawlSlotWnd.specLootPointIcoWnd	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_BrawlSlotWnd:F_PostLoad()

	UI.GameplayChoice_SlotWnd_3.F_PostLoad( self )
	
	self:CreateControls()
	
end


--
function UI.GameplayChoice_BrawlSlotWnd:CreateControls()

	self.bonusIcoWnd			= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "" )
	self.specLootPointIcoWnd	= UI:CreateChildWnd( self, UI.GameplayChoice_BonusWnd, "specLootPoint" )
	
	self.timerWnd = UI.GameplayChoice_BrawlSlot_TimerWnd
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.timerWnd:GetUiHandle(), "timer", UI.EffectAnimParams.POS )
	end

end


--
function UI.GameplayChoice_BrawlSlotWnd:Reset()

	UI.GameplayChoice_SlotWnd_3.Reset( self )
	
	self.BRAWL_data			= nil
	self.bDisabledByTime	= false
	
	self.timerWnd:Reset()
	self.timerWnd:UnlinkFromParent()
	
	self.bonusIcoWnd:UnlinkFromParent()
	self.specLootPointIcoWnd:UnlinkFromParent()

end


--
function UI.GameplayChoice_BrawlSlotWnd:FullUpdate()

	UI.GameplayChoice_SlotWnd_3.FullUpdate( self )
	
	self:BRAWL_UpdateData()
	
	self:UpdateAllDisabledStatuses()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateRequirementsText()
	self:UpdateMainAnimation()
	self:UpdateTimer()
	self:UpdateBonus()

end


--
function UI.GameplayChoice_BrawlSlotWnd:BRAWL_UpdateData()

	self.BRAWL_data = _G.MasterServer_GetBrawlState()
	
	if	type( self.BRAWL_data ) ~= "table"
		or type( self.BRAWL_data.isActive ) ~= "boolean"
		or type( self.BRAWL_data.gameplay ) ~= "string"
		or type( self.BRAWL_data.timeLeft ) ~= "number" then
			self.BRAWL_data = nil
	end

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateName()

	local str = ""
	
	if self.BRAWL_data ~= nil and self.BRAWL_data.gameplay ~= "" then
		str = UI:GetStringByName( string.format( "gameplayChoice_slotName_%s", self.BRAWL_data.gameplay ) )
	else
		str = UI:GetStringByName( "gameplayChoice_slotName_BRAWL" )
	end

	self:SetText( str, self.layers.NAME )

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateTimer()

	local time = -1

	if not self.bForceDisabled and not self.bDisabledByRank then

		if self.BRAWL_data ~= nil and self.BRAWL_data.gameplay ~= "" then
			time = self.BRAWL_data.timeLeft
		end

	end

	local bNeedTimer	= time ~= -1
	local bIsTimer		= self.timerWnd:IsChildOf( self )

	if bNeedTimer and not bIsTimer then
		self:AddChild( self.timerWnd )

	elseif not bNeedTimer and bIsTimer then
		self.timerWnd:Reset()
		self.timerWnd:UnlinkFromParent()
	end

	if bNeedTimer then
		self.timerWnd:SetTime( time )
	end

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateBonus()

	local bHasBonus, bonusCf = self:GetBonus()

	self:UpdateBonusIco( bHasBonus, bonusCf )
	self:UpdateSpecLootPointIco( bHasBonus )

end


--
function UI.GameplayChoice_BrawlSlotWnd:GetBonus()

    local bHasBonus = false
	local bonusCf	= 0

	if not self.bDisabled then

    	local accountAuras = _G.MasterServer_GetAccountAuras()
    	for idx, aurInfo in pairs( accountAuras ) do

    		if aurInfo.defName == "Daily_Brawl_2x" then
    			bHasBonus = true
    			break
    		end

    	end

	end

	if bHasBonus then
		bonusCf = cvars.sv_dailyWinBrawlExpRewardCf
	end

	return bHasBonus, bonusCf

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateBonusIco( bHasBonus, bonusCf )

	if not bHasBonus then
		self.bonusIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.bonusIcoWnd, mainEffect, self.effectInfo.main.bonusIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local texName = string.format( "bonus_x%d", bonusCf )
	local hTex = UI:GetTex( texName )

	self.bonusIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:SubstituteValLocalizedByStringId( "tooltip_startBtn_x2", bonusCf, "val" ),
		caption 	= UI:GetStringByName( "tooltip_startBtn_x2_caption" ),
	}

	self.bonusIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateSpecLootPointIco( bHasBonus )

	if not bHasBonus then
		self.specLootPointIcoWnd:UnlinkFromParent()
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.specLootPointIcoWnd, mainEffect, self.effectInfo.main.specLootPointIcoLocator, UI.EffectAnimParams.POS )

	-- иконка

	local hTex = UI:GetTex( "bonus_pve" )
	self.specLootPointIcoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipText" ),
		caption 	= UI:GetStringByName( "gameplayChoice_specLootPoint_tooltipCaption" ),
	}

	self.specLootPointIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.GameplayChoice_BrawlSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldGameplay = self.BRAWL_data ~= nil and self.BRAWL_data.gameplay or ""
	self:BRAWL_UpdateData()
	local newGameplay = self.BRAWL_data ~= nil and self.BRAWL_data.gameplay or ""
	
	if newGameplay ~= oldGameplay then
		self:UpdateName()
	end
	
	local bDisabledByTime_old = self.bDisabledByTime
	self:UpdateDisabledByTimeStatus()
	if self.bDisabledByTime ~= bDisabledByTime_old then
		self:OnDisabledChanged()
	end
	
	self:UpdateTimer()

end


--
function UI.GameplayChoice_BrawlSlotWnd:OnDisabledChanged()

	UI.GameplayChoice_SlotWnd_3.OnDisabledChanged( self )
	
	self:UpdateTimer()
	self:UpdateBonus()

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateAllDisabledStatuses()

	UI.GameplayChoice_SlotWnd_3.UpdateAllDisabledStatuses( self )

	self:UpdateDisabledByTimeStatus()
	
end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateDisabledStatus()

	UI.GameplayChoice_SlotWnd_3.UpdateDisabledStatus( self )

	self.bDisabled = self.bDisabled or self.bDisabledByTime

end


--
function UI.GameplayChoice_BrawlSlotWnd:UpdateDisabledByTimeStatus()

	self.bDisabledByTime = self.BRAWL_data == nil or not self.BRAWL_data.isActive
	self:UpdateDisabledStatus()

end


--
function UI.GameplayChoice_BrawlSlotWnd:GetRequiredRank()

	return UI.rankLocks.brawl

end


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_BrawlSlot_TimerWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_BrawlSlot_TimerWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_BrawlSlot_TimerWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_TimerWnd",

	props =
	{
		name = "GameplayChoice_BrawlSlot_TimerWnd",
	},
}

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_CustomGameSlotWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_CustomGameSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_CustomGameSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "GameplayChoice_SlotWnd_3",

	props =
	{
		name = "GameplayChoice_CustomGameSlotWnd",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_CustomGameSlotWnd.slotType = UI.GameplayChoiceWnd.slotTypes.CUSTOM_GAME


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GameplayChoice_CustomGameSlotWnd:GetRequiredRank()

	return UI.rankLocks.custom

end


-- -----------------------------------------------------------
-- UI.GameplayChoice_BonusWnd
-- -----------------------------------------------------------

UI.GameplayChoice_BonusWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GameplayChoice_BonusWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "GameplayChoice_BonusWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE  + UI.WS_NOT_KB_REACT,
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
				defName 			= "gameplayChoice_bonus",
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

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GameplayChoice_BonusWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.GameplayChoice_BonusWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.GameplayChoice_BonusWnd:SetIco( hTex )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )

end


--
function UI.GameplayChoice_BonusWnd:Reset()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )

	self.tooltipData = nil

end


-- --------------------------------
-- const
-- --------------------------------

UI.GameplayChoice_BonusWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.GameplayChoice_BonusWnd.effectInfo =
{
	main =
	{
		spriteName	= "ico13"
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GameplayChoice_BonusWnd.tooltipData	= nil

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_CloseBtn
-- ---------------------------------------------------------------------

UI.GameplayChoice_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn9",

		props =
		{
			name	= "GameplayChoice_CloseBtn"
		}
	},

	textId	= "close"
}


-- ---------------------------------------------------------------------
-- UI.GameplayChoice_PveMissionInfoWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_PveMissionInfoWnd = 
{
	def =
	{
		className	= "Wnd",
		prototype	= "PveMissionInfoWnd",

		props =
		{
			name	= "GameplayChoice_PveMissionInfoWnd",
		},
	}
}

-- ---------------------------------------------------------------------
-- UI.GameplayChoice_DarkeningWnd
-- ---------------------------------------------------------------------

UI.GameplayChoice_DarkeningWnd =
{
    def =
    {
    	className	= "Wnd",

    	props =
    	{
    		name		= "GameplayChoice_DarkeningWnd",
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
    				defName 			= "gameplayChoice_darkening",
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
}