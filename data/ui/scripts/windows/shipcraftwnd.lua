-- ----------------------------------------------------------------------------
--
-- Workfile: shipcraftwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ShipCraftWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ShipCraftWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name	= "ShipCraftWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipCraft_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self90",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ship_name_1",
						layer		= "UI.ShipCraftWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "ship_name_2",
						layer		= "UI.ShipCraftWnd.layers.SHIP_TYPE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "info_ico",	
						wnd			= "UI.ShipCraft_InfoIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "craft_win",	
						wnd			= "UI.ShipCraft_WorkPanelWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "text",
						layer		= "UI.ShipCraftWnd.layers.EARLY_ACCESS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- SHIP_TYPE
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- EARLY_ACCESS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipCraft_earlyAccess" ),
		},

	},

	children =
	{
		"UI.ShipCraft_WorkPanelWnd",
		"UI.ShipCraft_InfoIcoWnd",
		"UI.ShipCraft_ParamsWnd",
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipCraftWnd:Setup( shipDefName, launchData, dataToRestore )

	self:Reset()

	self.shipDefName	= shipDefName
	self.launchData		= launchData
	self.dataToRestore	= dataToRestore

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ShipCraftWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnPlayerResourcesChanged()

end


--
function UI.ShipCraftWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnPlayerResourcesChanged()

end


--
function UI.ShipCraftWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnPlayerResourcesChanged()

end


--
function UI.ShipCraftWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnPlayerResourcesChanged()

end


--
function UI.ShipCraftWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnPlayerResourcesChanged()

end


--
function UI.ShipCraftWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnPlayerResourcesChanged()
	
end


--
function UI.ShipCraftWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnPlayerResourcesChanged()
	
end


--
function UI.ShipCraftWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnPlayerResourcesChanged()
	
end


--
function UI.ShipCraftWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateMoneyPrice()
	self:UpdateCraftBtn()

end


--
function UI.ShipCraftWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

	if requestId ~= self.craftRequestId then
		return
	end

	self.craftRequestId = 0
	self:UpdateWaitEffect()

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then
			self:ReturnToPrevWindow()
		end
		
		if self.shipDefName ~= "" then
		
			local role = UI:GetItemRole( self.shipDefName )
			
			if not UI.RoleInfoWnd:IsRoleShown( role ) then
				UI.RoleInfoWnd:ShowAsNotification( role )
			end
		
		else
			sys.log( "UI.ShipCraftWnd:GameStore_OnCraftVessel()[ERROR]: invalid shipDefName" )
		end

	else
		UI:ShowMsgOnShipCraftError( result )
	end

end


--
function UI.ShipCraftWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2 )

	if requestId ~= self.recraftRequestId then
		return
	end

	self.recraftRequestId = 0
	self:UpdateWaitEffect()

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then
			self:ReturnToPrevWindow()
		end

	else
		UI:ShowMsgOnShipCraftError( result )
	end

end


--
function UI.ShipCraftWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.craftRequestId = 0
	self.recraftRequestId = 0

	self:UpdateWaitEffect()

end


--
function UI.ShipCraftWnd:GetShipDefName()

	return self.shipDefName

end


--
function UI.ShipCraftWnd:IsRecraft()

	return UI:GetShipItemByDef( self.shipDefName, false ) ~= nil

end


--
function UI.ShipCraftWnd:HandleEscape()

	self:ReturnToPrevWindow()
	return true

end


--
function UI.ShipCraftWnd:GetLaunchData()

	return self.launchData

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipCraftWnd.layers =
{
	MAIN_EFFECT		= 0,
	SHIP_NAME		= 1,
	SHIP_TYPE		= 2,
	EARLY_ACCESS	= 3,
}

UI.ShipCraftWnd.moduleSlotTypes =
{
	ENGINE_MOD		= 1, 
	CAPACITOR_MOD	= 2, 
	SHIELD_MOD		= 3, 
	ARMOR_MOD		= 4, 
	CPU_MOD			= 5, 
}

UI.ShipCraftWnd.MAX_MODULE_SLOTS_OF_TYPE = 3

UI.ShipCraftWnd.moduleSlotStates =
{
	INACTIVE	= 1,
	ACTIVE		= 2,
	SELECTED	= 3,
	INVISIBLE	= 4,
}

UI.ShipCraftWnd.sounds =	-- TODO: уточнить звуки
{
	slotMouseOver	= "sound/ui/btnMouseOver",
	slotSelect		= "sound/ui/btnClick",
	slotDeselect	= "sound/ui/btnClick",
	tradeWndShow	= "sound/ui/btnClick",
	craft			= "sound/ui/apply",
}

UI.ShipCraftWnd.effectInfo =
{
	main =
	{
		paramsLocator	= "prop",
	},

	work =
	{
		maxSelectedModuleSlotsColorLocator	= "color_1",
	}
}

UI.ShipCraftWnd.bonusSynergyLevels = { 4, 8 }

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipCraftWnd.specModulesList				= nil
UI.ShipCraftWnd.moduleSlotsList				= nil
UI.ShipCraftWnd.priceResourceWnd			= nil
UI.ShipCraftWnd.craftBtn					= nil
UI.ShipCraftWnd.dlcBtn						= nil
UI.ShipCraftWnd.infoIcoWnd					= nil
UI.ShipCraftWnd.paramsWnd					= nil
UI.ShipCraftWnd.workPanelWnd				= nil
UI.ShipCraftWnd.shipDefName					= ""
UI.ShipCraftWnd.maxSelectedModuleSlotsColor	= UI.TEXT_BASE_COLOR
UI.ShipCraftWnd.hMsgCraft					= UI.INVALID_UI_HANDLE
UI.ShipCraftWnd.craftRequestId				= 0
UI.ShipCraftWnd.recraftRequestId			= 0
UI.ShipCraftWnd.dataToRestore				= nil
UI.ShipCraftWnd.paramsX						= 0
UI.ShipCraftWnd.space_params_btm			= 0
UI.ShipCraftWnd.bonusesLists				= {}
UI.ShipCraftWnd.launchData					= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipCraftWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.specModulesList	= UI.ShipCraft_SpecModulesListWnd
	self.moduleSlotsList 	= UI.ShipCraft_ModuleSlotsListWnd
	self.priceResourceWnd	= UI.ShipCraft_ShipPriceResourceWnd
	self.craftBtn			= UI.ShipCraft_CraftBtn
	self.dlcBtn				= UI.ShipCraft_DlcBtn
	self.infoIcoWnd			= UI.ShipCraft_InfoIcoWnd
	self.paramsWnd			= UI.ShipCraft_ParamsWnd
	self.workPanelWnd		= UI.ShipCraft_WorkPanelWnd

	table.insert( self.bonusesLists, UI.ShipCraft_BonusesList1Wnd )
	table.insert( self.bonusesLists, UI.ShipCraft_BonusesList2Wnd )

	local workEffect = UI:GetEffectFromLayer( self.workPanelWnd, self.workPanelWnd.layers.MAIN_EFFECT )
	if workEffect then
		self.maxSelectedModuleSlotsColor = workEffect:GetObjColor( self.effectInfo.work.maxSelectedModuleSlotsColorLocator )
	end

	self:PrepareLayout()

	self:UpdateBonusesHeaders()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

	self:Reset()

end


--
function UI.ShipCraftWnd:Reset()

	self:ResetContent()
	
	self.shipDefName	= ""
	self.launchData		= nil

	self.craftRequestId = 0
	self.recraftRequestId = 0
	self:HideWaitEffect()

end


--
function UI.ShipCraftWnd:ResetContent()

	self.specModulesList:Clear()
	self.moduleSlotsList:Clear()
	self.priceResourceWnd:Reset()
	self.craftBtn:Enable( false )
	self.dlcBtn:UnlinkFromParent()
	self.paramsWnd:Reset()
	self:SetText( "", self.layers.SHIP_NAME )
	self:SetText( "", self.layers.SHIP_TYPE )
	self.workPanelWnd:SetText( "", self.workPanelWnd.layers.MODULE_SLOTS_HEADER )
	self.workPanelWnd:SetText( "", self.workPanelWnd.layers.NUM_SELECTED_MODULE_SLOTS )
	self.hMsgCraft = UI.INVALID_UI_HANDLE
	self:SetLayerVisible( false, self.layers.EARLY_ACCESS )

	for idx, bonusesList in pairs( self.bonusesLists ) do
		bonusesList:Reset()
	end

end


--
function UI.ShipCraftWnd:FullUpdate()

	self:ResetContent()

	if self.shipDefName == "" then
		return
	end

	self:UpdateShipName()
	self:UpdateShipType()
	self:UpdateSpecModulesList()
	self:UpdateBonusesLists()
	self:UpdateModuleSlotsList()
	self:UpdateResourcePrice()
	self:UpdateMoneyPrice()
	self:UpdateCraftBtn()
	self:UpdateDlcBtn()
	self:UpdateNumSelectedModuleSlots()
	self:UpdateInfoIco()
	self:UpdateParams()
	self:UpdateEarlyAccessText()

	self:RecalcLayout()

	if self.dataToRestore then
		self.dataToRestore = nil
	end

end


--
function UI.ShipCraftWnd:UpdateShipName()

	local strLabel = UI:GetStringByName( "shipCraft_shipNameLabel" )
	local strName = UI:GetEntityLocalizedNameByDef( self.shipDefName, true, false, true, false )

	local str = string.format( "%s: %s", strLabel, strName )
	self:SetText( str, self.layers.SHIP_NAME )

end


--
function UI.ShipCraftWnd:UpdateShipType()

	local text = UI:GetStringByName( "shipTooltip_shipTypeAndRole" )

	local strShipType = ""

	local shipType = UI:GetItemShipType( self.shipDefName ) or -1
	if shipType ~= -1 then
		strShipType = UI:ShipType2Str( shipType )
	else
		sys.log( "UI.ShipCraftWnd:UpdateShipType()[ERROR]: cannot find _G.Def[%s].ship_class", self.shipDefName )
	end

	local strRole = ""
	
	local def = UI:GetDef( self.shipDefName )
	local role = def and def.role or -1

	if role ~= -1 then
		strRole = UI:Role2Str( role )
	else
		sys.log( "UI.ShipCraftWnd:UpdateShipType()[ERROR]: cannot find _G.Def[%s].role", self.shipDefName )
	end

	local subst =
	{
		class	= strShipType,
		role	= strRole,
	}

	text = string.gsub( text, "%$(.-)%$", subst )

	self:SetText( text, self.layers.SHIP_TYPE )

end


--
function UI.ShipCraftWnd:UpdateSpecModulesList()

	self.specModulesList:Clear()

	local specModules = UI:GetCraftableShipSpecModules( self.shipDefName )

	for idx = 1, #specModules do

		local data = { defName = specModules[ idx ] }
		self.specModulesList:AddRecord( data )

	end

	local selRecordIdx = -1

	if self.dataToRestore then

		for recordIdx = 1, self.specModulesList:GetNumRecords() do

			local data = self.specModulesList:GetRecordData( recordIdx )
			if data.defName == self.dataToRestore.selSpecModule then

				selRecordIdx = recordIdx
				break

			end
		end		

	else

    	if self.specModulesList:GetNumRecords() > 0 then
			selRecordIdx = 1
		end

	end

	if selRecordIdx ~= -1 then
		self.specModulesList:SelectRecord( selRecordIdx )		
	else
		sys.log( "UI.ShipCraftWnd:UpdateSpecModulesList()[ERROR]: no selected spec module for ship %s", self.shipDefName )
	end

end


--
function UI.ShipCraftWnd:UpdateBonusesLists()

	for idx, synergyLevel in ipairs( self.bonusSynergyLevels ) do

		local bonusesListWnd = self.bonusesLists[ idx ]
		if bonusesListWnd then

			bonusesListWnd:Setup( synergyLevel )

        	local selRecordIdx = -1

        	if self.dataToRestore then

				local selBonuseName = self.dataToRestore.selBonuses and self.dataToRestore.selBonuses[ synergyLevel ] or ""
				if selBonuseName ~= "" then

            		for recordIdx = 1, bonusesListWnd:GetNumRecords() do

            			local data = bonusesListWnd:GetRecordData( recordIdx )
            			if data.bonusName == selBonuseName then

            				selRecordIdx = recordIdx
            				break

            			end

            		end		

				end

        	else

            	if bonusesListWnd:GetNumRecords() > 0 then
        			selRecordIdx = 1
        		end

        	end

        	if selRecordIdx ~= -1 then
        		bonusesListWnd:SelectRecord( selRecordIdx )		
        	else
        		sys.log( "UI.ShipCraftWnd:UpdateBonusesLists()[ERROR]: no selected bonus for ship %s synergy level %d", self.shipDefName, synergyLevel )
        	end

		else
			sys.log( "UI.ShipCraftWnd:UpdateBonusesLists()[ERROR]: cannot find bonuses list window for synergy level %d", synergyLevel )
		end

	end

end


--
function UI.ShipCraftWnd:UpdateBonusesHeaders()

	for idx, synergyLevel in ipairs( self.bonusSynergyLevels ) do

		local headerLayer = self.workPanelWnd.layers.BONUSES_HEADER_1 + idx - 1

		local str = UI:GetStringByName( "shipCraft_bonuses" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$level%$", tostring( synergyLevel ) )

		if numSubst == 0 then
			sys.log( "UI.ShipCraftWnd:UpdateBonusesHeaders()[ERROR]: cannot find placeholder \"$level$\" in string \"shipCraft_bonuses\"" )
			str = string.format( "[INVALID STRING] Bonuses for level %d", synergyLevel )
		end

		self.workPanelWnd:SetText( str, headerLayer )

	end

end


--
function UI.ShipCraftWnd:UpdateModuleSlotsList()

	self.moduleSlotsList:Clear()

	-- #0084177 - если max_craft_slots=-1, то слоты произвольно выбирать нельзя,
	-- в этом случае все предустановленные слоты сразу показываются как выбранные
	local bCanChoseSlots = UI:CanChoseCraftSlots( self.shipDefName )

	for moduleSlotType = 1, UI:GetTableLength( self.moduleSlotTypes ) do

		local data = {}

		data.moduleSlotType = moduleSlotType

		if self.dataToRestore then
			data.moduleSlotStates = self.dataToRestore.moduleSlotsStates[ moduleSlotType ]

		else

            data.moduleSlotStates = {}

			local numSlotsOfType = #self:GetCraftableModuleSlotsOfType( moduleSlotType )

			for moduleSlotIdx = 1, numSlotsOfType do

				if bCanChoseSlots then

    				if moduleSlotIdx == 1 then
    					data.moduleSlotStates[ moduleSlotIdx ] = self.moduleSlotStates.ACTIVE
    				else
    					data.moduleSlotStates[ moduleSlotIdx ] = self.moduleSlotStates.INACTIVE
    				end

				else
					data.moduleSlotStates[ moduleSlotIdx ] = self.moduleSlotStates.SELECTED 
				end

			end

			for moduleSlotIdx = numSlotsOfType + 1, self.MAX_MODULE_SLOTS_OF_TYPE do
				data.moduleSlotStates[ moduleSlotIdx ] = self.moduleSlotStates.INVISIBLE
			end

		end

		self.moduleSlotsList:AddRecord( data )

	end

end


--
function UI.ShipCraftWnd:UpdateParams()

	self.paramsWnd:Setup( self.shipDefName )

end


--
function UI.ShipCraftWnd:ModuleSlotType2SlotId( moduleSlotType, moduleSlotIdx )

	local slotsOfType = self:GetCraftableModuleSlotsOfType( moduleSlotType )
	return slotsOfType[ moduleSlotIdx ] or -1

end


--
function UI.ShipCraftWnd:GetCraftableModuleSlotsOfType( moduleSlotType )

	local slotsOfType = {}

	local allSlots = UI:GetShipAllPossibleSlotsMask( self.shipDefName )

	local firstModuleSlotId	= -1

	if moduleSlotType == self.moduleSlotTypes.ENGINE_MOD then
		firstModuleSlotId = ai.SpaceShipModuleSlot.ENGINE_MOD_01

	elseif moduleSlotType == self.moduleSlotTypes.CAPACITOR_MOD then
		firstModuleSlotId = ai.SpaceShipModuleSlot.CAPACITOR_MOD_01

	elseif moduleSlotType == self.moduleSlotTypes.SHIELD_MOD then
		firstModuleSlotId = ai.SpaceShipModuleSlot.SHIELD_MOD_01

	elseif moduleSlotType == self.moduleSlotTypes.ARMOR_MOD then
		firstModuleSlotId = ai.SpaceShipModuleSlot.ARMOR_MOD_01

	elseif moduleSlotType == self.moduleSlotTypes.CPU_MOD then
		firstModuleSlotId = ai.SpaceShipModuleSlot.CPU_MOD_01

	else
		sys.log( "UI.ShipCraftWnd:GetCraftableModuleSlotsOfType()[ERROR]: unhandled slot type: %s", tostring( moduleSlotType ) )
	end

	for slotId = firstModuleSlotId, firstModuleSlotId + self.MAX_MODULE_SLOTS_OF_TYPE - 1 do
		if UI:BitTstU64( allSlots, slotId ) then
			table.insert( slotsOfType, slotId )
		end
	end

	return slotsOfType

end


--
function UI.ShipCraftWnd:GetMaxCraftSlotsEx()

	-- #0084177 - если max_craft_slots=-1, то слоты произвольно выбирать нельзя,
	-- в этом случае в качестве максимального количество отображается количество предустановленных слотов

	local maxSlots = 0

	if UI:CanChoseCraftSlots( self.shipDefName ) then
		maxSlots = UI:GetShipMaxCraftSlots( self.shipDefName )
	else

    	local allSlots = UI:GetShipAllPossibleSlotsMask( self.shipDefName )

    	for slotId = ai.SpaceShipModuleSlot.ENGINE_MOD_01, ai.SpaceShipModuleSlot.CPU_MOD_03 do
    		if UI:BitTstU64( allSlots, slotId ) then
				maxSlots = maxSlots + 1
    		end
    	end

	end

	return maxSlots

end


--
function UI.ShipCraftWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "ShipCraft_ModuleSlotWnd" ) then

		if not self:IsWaitingRequest() then

    		local state = wnd:GetState()

    		if state == self.moduleSlotStates.ACTIVE then
    			self:SelectModuleSlot( wnd )

    		elseif state == self.moduleSlotStates.SELECTED then

				if UI:CanChoseCraftSlots( self.shipDefName ) then
    				self:DeselectModuleSlot( wnd )
				end

    		end	

		end

		return true

	elseif wnd == self.craftBtn then

		if not self:IsWaitingRequest() then
			self:TryCraft()
		end

		return true
		
	elseif wnd == self.dlcBtn then
	
		local dlcName = self.dlcBtn:GetDlcName()
	
		if _G.Arc_IsInitialized() then
			self:TryBuyArcDlc( dlcName )
		else
			UI:LaunchDlcLink( dlcName )
		end

	elseif UI:IsWndKindOf( wnd, "ShipCraft_SpecModuleSlotWnd" ) then

		if not self:IsWaitingRequest() then

    		local recordIdx = wnd:GetRecord()
    		if recordIdx ~= self.specModulesList:GetSelectedRecord() then

    			self.specModulesList:SelectRecord( recordIdx )
    			UI:PlayGlobalSound( self.sounds.slotSelect )

    		end

		end

		return true

	elseif UI:IsWndKindOf( wnd, "ShipCraft_BonusSlotWnd" ) then

		if not self:IsWaitingRequest() then

			local bonusesList = wnd:GetParent()
    		local recordIdx = wnd:GetRecord()

    		if recordIdx ~= bonusesList:GetSelectedRecord() then

    			bonusesList:SelectRecord( recordIdx )
    			UI:PlayGlobalSound( self.sounds.slotSelect )

    		end

		end

		return true

	elseif wnd == UI.ShipCraft_CrossBtn then

		self:ReturnToPrevWindow()
		return true

	elseif UI:IsWndKindOf( wnd, "ShipCraft_ResourceSlotWnd" ) then

		local resourceDefName = wnd:GetDefName()
		local blueprintDefName = UI:GetBlueprintForItemCraft( resourceDefName, true ) 

		if blueprintDefName ~= "" then

        	local moduleSlotsStates = {}

        	for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do
        		local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )
    			moduleSlotsStates[ blockRecordIdx ] = blockData.moduleSlotStates
    		end

    		local dataToRestore = {}
    		dataToRestore.selSpecModule		= self:GetSelSpecModule()
    		dataToRestore.selBonuses		= self:GetSelBonuses()
    		dataToRestore.moduleSlotsStates	= moduleSlotsStates

			UI.HangarWnd:ShowItemCraftSingle( resourceDefName, nil, { bShipCraft = true, shipDefName = self.shipDefName, shipCraftLaunchData = self.launchData, dataToRestore = dataToRestore } )

		end

		return true

	end

	return false

end


--
function UI.ShipCraftWnd:SelectModuleSlot( slotWnd )

	if not UI:CanChoseCraftSlots( self.shipDefName ) then
		sys.log( "UI.ShipCraftWnd:SelectModuleSlot()[ERROR]: cannot chose slots" )
		return
	end

	if slotWnd:GetState() ~= self.moduleSlotStates.ACTIVE then
		sys.log( "UI.ShipCraftWnd:SelectModuleSlot()[ERROR]: invalid slot state" )
		return
	end

	local blockRecordIdx	= slotWnd:GetParent():GetRecord()
	local blockData			= self.moduleSlotsList:GetRecordData( blockRecordIdx )
	local slotIdx			= slotWnd:GetIdx()		
	local slotType			= slotWnd:GetSlotType()

	blockData.moduleSlotStates[ slotIdx ] = self.moduleSlotStates.SELECTED		

	if slotIdx < #self:GetCraftableModuleSlotsOfType( slotType ) and self:GetNumSelectedModuleSlots() < UI:GetShipMaxCraftSlots( self.shipDefName ) then
		blockData.moduleSlotStates[ slotIdx + 1 ] = self.moduleSlotStates.ACTIVE
	end

	self.moduleSlotsList:SetRecordData( blockData, blockRecordIdx )	

	self:UpdateNumSelectedModuleSlots()
	self:UpdateCraftBtn()
	self:ValidateActiveModuleSlots()
	self:UpdateInfoIco()

    UI:PlayGlobalSound( self.sounds.slotSelect )

end


--
function UI.ShipCraftWnd:DeselectModuleSlot( slotWnd )

	if not UI:CanChoseCraftSlots( self.shipDefName ) then
		sys.log( "UI.ShipCraftWnd:DeselectModuleSlot()[ERROR]: cannot chose slots" )
		return
	end

	if slotWnd:GetState() ~= self.moduleSlotStates.SELECTED then
		sys.log( "UI.ShipCraftWnd:DeselectModuleSlot()[ERROR]: invalid slot state" )
		return
	end

	local blockRecordIdx	= slotWnd:GetParent():GetRecord()
	local blockData			= self.moduleSlotsList:GetRecordData( blockRecordIdx )
	local slotIdx			= slotWnd:GetIdx()
	local slotType			= slotWnd:GetSlotType()

	blockData.moduleSlotStates[ slotIdx ] = self.moduleSlotStates.ACTIVE

	for idx = slotIdx + 1, #self:GetCraftableModuleSlotsOfType( slotType ) do
		blockData.moduleSlotStates[ idx ] = self.moduleSlotStates.INACTIVE
	end

	self.moduleSlotsList:SetRecordData( blockData, blockRecordIdx )	

	self:UpdateNumSelectedModuleSlots()
	self:UpdateCraftBtn()
	self:ValidateActiveModuleSlots()
	self:UpdateInfoIco()

    UI:PlayGlobalSound( self.sounds.slotDeselect )

end


--
function UI.ShipCraftWnd:ValidateActiveModuleSlots()

	if not UI:CanChoseCraftSlots( self.shipDefName ) then
		sys.log( "UI.ShipCraftWnd:ValidateActiveModuleSlots()[ERROR]: cannot chose slots" )
		return
	end

	local numSelectedSlots	= self:GetNumSelectedModuleSlots()
	local maxSlots			= UI:GetShipMaxCraftSlots( self.shipDefName )
	local bCanActivateSlots = numSelectedSlots < maxSlots

	for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do

		local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )
		local bDataChanged = false

		if bCanActivateSlots then

			local lastSelectedSlotIdx = -1

    		for moduleSlotIdx = self.MAX_MODULE_SLOTS_OF_TYPE, 1, -1 do

				local moduleSlotState = blockData.moduleSlotStates[ moduleSlotIdx ]
				if moduleSlotState == self.moduleSlotStates.SELECTED then
					lastSelectedSlotIdx = moduleSlotIdx
					break
				end
    		end

			local activeSlotIdx = -1

			if lastSelectedSlotIdx == -1 then
				activeSlotIdx = 1

			elseif lastSelectedSlotIdx < #self:GetCraftableModuleSlotsOfType( blockData.moduleSlotType ) then
				activeSlotIdx = lastSelectedSlotIdx + 1
			end

			if activeSlotIdx ~= -1 then

    			if blockData.moduleSlotStates[ activeSlotIdx ] ~= self.moduleSlotStates.ACTIVE then
    				blockData.moduleSlotStates[ activeSlotIdx ] = self.moduleSlotStates.ACTIVE
    				bDataChanged = true
    			end

			end

		else

    		for moduleSlotIdx, moduleSlotState in pairs( blockData.moduleSlotStates ) do

    			if moduleSlotState == self.moduleSlotStates.ACTIVE then
					blockData.moduleSlotStates[ moduleSlotIdx ] = self.moduleSlotStates.INACTIVE
					bDataChanged = true
    			end

    		end

		end

		if bDataChanged then
			self.moduleSlotsList:SetRecordData( blockData, blockRecordIdx )	
		end

	end
	
end


--
function UI.ShipCraftWnd:GetNumSelectedModuleSlots()

	local numSelectedSlots = 0

	for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do

		local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )

		for moduleSlotIdx, moduleSlotState in pairs( blockData.moduleSlotStates ) do
			if moduleSlotState == self.moduleSlotStates.SELECTED then
				numSelectedSlots = numSelectedSlots + 1
			end
		end

	end

	return numSelectedSlots

end


--
function UI.ShipCraftWnd:OnPlayerResourcesChanged()

	self.moduleSlotsList:OnPlayerResourcesChanged()
	self.priceResourceWnd:OnPlayerResourcesChanged()
	self:UpdateCraftBtn()

end


--
function UI.ShipCraftWnd:UpdateResourcePrice()

	local idx = UI:GetTableLength( self.moduleSlotTypes ) + 1
	local resourceDefName, resourceCount = UI:GetShipCraftResourcePriceByIdx( self.shipDefName, idx )

	if self:IsRecraft() then
		resourceCount = 0
	end

	self.priceResourceWnd:Setup( resourceDefName, resourceCount )

end


--
function UI.ShipCraftWnd:UpdateMoneyPrice()

	local price, bGold = UI:GetShipCraftMoneyPrice( self.shipDefName )

	local priceInfo =
	{
		priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}

	local str = UI:PriceInfo2Str( priceInfo, self.workPanelWnd:GetColor( self.workPanelWnd.layers.PRICE ), false, true, true, nil )
	str = string.format( "+ %s", str )

	self.workPanelWnd.priceMetaText:SetText( str, true )

end


--
function UI.ShipCraftWnd:UpdateCraftBtn()

	local bEnableBtn = true
	
	-- корабль доступен для приобретения?
	if bEnableBtn then
		
		-- если был куплен хотя бы раз, то повторно можно купить всегда
		local bWasBought = UI:GetShipItemByDef( self.shipDefName, true ) ~= nil
		if not bWasBought then
		
			if not UI:IsEnoughAccountRankForItem( self.shipDefName ) or UI:IsShipLockedByDependancy( self.shipDefName ) then
				bEnableBtn = false
			end
			
		end
		
	end

	-- выбрано максимально возможное количество слотов для пассивных модулей?
	if bEnableBtn then

		local numSlots	= self:GetNumSelectedModuleSlots()
		local maxSlots	= self:GetMaxCraftSlotsEx()

		if numSlots < maxSlots then
			bEnableBtn = false
		end

	end

	-- выбран спец. модуль?
	if bEnableBtn then

		local selSpecModule = self:GetSelSpecModule()
		if selSpecModule == "" then
			bEnableBtn = false
		end

	end

	-- выбраны бонусы в каждом кастомизируемом уровне синергии?
	if bEnableBtn then

		local selBonuses = self:GetSelBonuses()

		for synergyLevel = 1, UI:GetShipMaxLevel( self.shipDefName ) do

			local bonusesOnLevel = UI:GetCraftShipAvailableBonuses( self.shipDefName, synergyLevel )
			if next( bonusesOnLevel ) then

    			if selBonuses[ synergyLevel ] == nil or selBonuses[ synergyLevel ] == "" then
    				bEnableBtn = false
					break
    			end

			end

		end

	end

	-- хватает денег на корабль?
	if bEnableBtn then

		local price, bGold = UI:GetShipCraftMoneyPrice( self.shipDefName )
		local playerMoney = UI:GetPlayerMoney( bGold )	

		if playerMoney < price then
			bEnableBtn = false
		end	

	end

	-- хватает ресурсов на слоты для пассивных модулей?
	if bEnableBtn then

		-- для рекрафта не требуются ресурсы
		if not self:IsRecraft() then

    		local resources = UI:GetShipCraftResourcePrice( self.shipDefName )
    		for resourceDefName, resourceCount in pairs( resources ) do

    			local playerResourceCount = UI:GetPlayerResourceCount( resourceDefName )
    			if playerResourceCount < resourceCount then

    				bEnableBtn = false
    				break

    			end
    			
    		end

		end

	end

	self.craftBtn:Enable( bEnableBtn )

end


--
function UI.ShipCraftWnd:UpdateDlcBtn()	
	
	local bNeedBtn = false
	local dlcName = ""
	
	if not self:IsRecraft() then
		
		dlcName = UI:GetShipPartsDlcForShip( self.shipDefName )
		if dlcName ~= "" then
			bNeedBtn = true
		end
		
	end

	if bNeedBtn then
		self.workPanelWnd:AddChild( self.dlcBtn )
		self.dlcBtn:Setup( dlcName )
	else
		self.dlcBtn:UnlinkFromParent()
	end

end


--
function UI.ShipCraftWnd:UpdateNumSelectedModuleSlots()

	-- заголовок
	
	local strHeader = UI:CanChoseCraftSlots( self.shipDefName ) and UI:GetStringByName( "shipCraft_moduleSlotsHeader" ) or UI:GetStringByName( "shipCraft_moduleSlotsHeader_presetSlots" )
	self.workPanelWnd:SetText( strHeader, self.workPanelWnd.layers.MODULE_SLOTS_HEADER )


	-- значение

	local numSlots = self:GetNumSelectedModuleSlots()
	local maxSlots = self:GetMaxCraftSlotsEx()
	local str = string.format( "%d/%s%d", numSlots, UI:Color2Str( self.maxSelectedModuleSlotsColor ), maxSlots )

	self.workPanelWnd:SetText( str, self.workPanelWnd.layers.NUM_SELECTED_MODULE_SLOTS )

end


--
function UI.ShipCraftWnd:GetSelSpecModule()

	local selSpecModuleDefName	= ""

	local selSpecModuleRecordIdx = self.specModulesList:GetSelectedRecord()
	if selSpecModuleRecordIdx ~= -1 then
		
		local data = self.specModulesList:GetRecordData( selSpecModuleRecordIdx )
		selSpecModuleDefName = data.defName

	end

	return selSpecModuleDefName

end


--
function UI.ShipCraftWnd:GetSelBonuses()

	local bonuses = {}

	for idx, bonusesList in pairs( self.bonusesLists ) do

		local synergyLevel = bonusesList:GetSynergyLevel()
		local bonusName = ""

		local selRecordIdx = bonusesList:GetSelectedRecord()
		if selRecordIdx ~= -1 then
			local data = bonusesList:GetRecordData( selRecordIdx )
			bonusName = data.bonusName
		end

		bonuses[ synergyLevel ] = bonusName

	end

	return bonuses

end


--
function UI.ShipCraftWnd:TryCraft()

	if self:IsWaitingRequest() then
		return
	end

	local msg = self:IsRecraft() and UI:GetStringByName( "shipCraft_recraftConfirmMsg" ) or UI:GetStringByName( "shipCraft_craftConfirmMsg" )
	self.hMsgCraft = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), msg, UI.MBS_YES_NO )
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipCraftWnd:DoCraft()

	local selSpecModuleDefName = self:GetSelSpecModule()

	local bonusesArr = {}

	local selBonuses = self:GetSelBonuses()
	for synergyLevel = 1, UI.MAX_SHIP_LEVEL do
		bonusesArr[ synergyLevel ] = selBonuses[ synergyLevel ] or ""
	end	

	local moduleSlotsMask = u64( 0 )
    for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do

    	local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )
    	for moduleSlotIdx, moduleSlotState in pairs( blockData.moduleSlotStates ) do

    		if moduleSlotState == self.moduleSlotStates.SELECTED then

    			local moduleSlotId = self:ModuleSlotType2SlotId( blockData.moduleSlotType, moduleSlotIdx )
				moduleSlotsMask = UI:BitSetU64( moduleSlotsMask, moduleSlotId )

			end

		end

	end

	if self:IsRecraft() then

		self.recraftRequestId = _G.GameStore_RecraftVessel( self.shipDefName, selSpecModuleDefName, moduleSlotsMask, bonusesArr )

    	if self.recraftRequestId ~= 0 then
    		UI:PlayGlobalSound( self.sounds.craft )
    	else
    		UI:ShowMsgOnShipCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end

	else

		self.craftRequestId = _G.GameStore_CraftVessel( self.shipDefName, selSpecModuleDefName, moduleSlotsMask, bonusesArr )

    	if self.craftRequestId ~= 0 then
    		UI:PlayGlobalSound( self.sounds.craft )
    	else
    		UI:ShowMsgOnShipCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end

	end

	self:UpdateWaitEffect()

end


--
function UI.ShipCraftWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgCraft then

		self.hMsgCraft = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoCraft()
		end

	end

end  


--
function UI.ShipCraftWnd:ShowWaitEffect()

	self.workPanelWnd:SetLayerVisible( true, self.workPanelWnd.layers.WAIT_EFFECT )
	self.workPanelWnd:SetLayerVisible( true, self.workPanelWnd.layers.WAIT_TEXT )	

end


--
function UI.ShipCraftWnd:HideWaitEffect()

	self.workPanelWnd:SetLayerVisible( false, self.workPanelWnd.layers.WAIT_EFFECT )
	self.workPanelWnd:SetLayerVisible( false, self.workPanelWnd.layers.WAIT_TEXT )	

end


--
function UI.ShipCraftWnd:UpdateWaitEffect()

	if self:IsWaitingRequest() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.ShipCraftWnd:IsWaitingRequest()

	return self.craftRequestId ~= 0 or self.recraftRequestId ~= 0

end


--
function UI.ShipCraftWnd:ReturnToPrevWindow()

	local bHandled = false

	if self.launchData then

		if self.launchData.bShipsTree then

			if self.launchData.shipQuestId ~= -1 then
				UI.HangarWnd:OpenShipsForQuest( self.launchData.shipQuestId, self.launchData.shipsTreeLaunchData, self.launchData.selectedShips, true )
			else
				UI.HangarWnd:OpenShips( "", true, false, nil, self.launchData.shipsTreeLaunchData )
			end

			bHandled = true

    	elseif self.launchData.bAtlas then

			if type( self.launchData.uid ) == "userdata" then
				UI:ShowProfile( self.launchData.uid, "ATLAS", true, self.launchData.restoreData, self.launchData.profileLaunchData )
				bHandled = true
			else
				sys.log( "UI.ShipCraftWnd:ReturnToPrevWindow()[ERROR]: invalid type of launchData.uid for bAtlas data mode; \"userdata\" expected, got \"%s\"", type( self.launchData.uid ) )
			end
			
		elseif self.launchData.bActions then
		
			UI.HangarWnd:OpenAction( self.launchData.selActionId, true, self.launchData.marketingLaunchData )
			bHandled = true
			
		end

	end

	if not bHandled then
    	UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.ShipCraftWnd:F_OnEventSaveUiState()

	if self.shipDefName == "" then
		return
	end

	UI.store.ShipCraftWnd = {}
	
	UI.store.ShipCraftWnd.craftRequestId	= self.craftRequestId
	UI.store.ShipCraftWnd.recraftRequestId	= self.recraftRequestId
	UI.store.ShipCraftWnd.shipDefName		= self.shipDefName
	UI.store.ShipCraftWnd.launchData		= self.launchData
	UI.store.ShipCraftWnd.selSpecModule		= self:GetSelSpecModule()
	UI.store.ShipCraftWnd.selBonuses		= self:GetSelBonuses()

	local moduleSlotsStates = {}

	for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do
		local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )
		moduleSlotsStates[ blockRecordIdx ] = blockData.moduleSlotStates
	end

	UI.store.ShipCraftWnd.moduleSlotsStates = moduleSlotsStates

end


--
function UI.ShipCraftWnd:F_OnEventRestoreUiState()

	if not UI.store.ShipCraftWnd then
		return
	end

	local dataToRestore = {}
	dataToRestore.selSpecModule		= UI.store.ShipCraftWnd.selSpecModule
	dataToRestore.selBonuses		= UI.store.ShipCraftWnd.selBonuses
	dataToRestore.moduleSlotsStates	= UI.store.ShipCraftWnd.moduleSlotsStates

	self:Setup( UI.store.ShipCraftWnd.shipDefName, UI.store.ShipCraftWnd.launchData, dataToRestore )

	self.craftRequestId		= UI.store.ShipCraftWnd.craftRequestId
	self.recraftRequestId	= UI.store.ShipCraftWnd.recraftRequestId
	self:UpdateWaitEffect()

	UI.store.ShipCraftWnd = nil

end


--
function UI.ShipCraftWnd:UpdateInfoIco()

	local selModuleSlots = {}

    for blockRecordIdx = 1, self.moduleSlotsList:GetNumRecords() do

    	local blockData = self.moduleSlotsList:GetRecordData( blockRecordIdx )
    	for moduleSlotIdx, moduleSlotState in pairs( blockData.moduleSlotStates ) do

    		if moduleSlotState == self.moduleSlotStates.SELECTED then

    			local moduleSlotId = self:ModuleSlotType2SlotId( blockData.moduleSlotType, moduleSlotIdx )
				selModuleSlots[ moduleSlotId ] = true

			end

		end

	end

	local selSpecModule = self:GetSelSpecModule()
	local selBonuses = self:GetSelBonuses()

	self.infoIcoWnd:Setup( self.shipDefName, selSpecModule, selModuleSlots, selBonuses )

end


--
function UI.ShipCraftWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.specModulesList:GetUiHandle() then
		self:OnSelSpecModuleChanged()		

	else

		local bBonus = false
		for idx, bonusesList in pairs( self.bonusesLists ) do
			if bonusesList:GetUiHandle() == hSender then
				bBonus = true
				break
			end
		end

		if bBonus then
			self:OnSelBonusChanged()
		end

	end

end


--
function UI.ShipCraftWnd:OnSelSpecModuleChanged()

	self:UpdateInfoIco()

end


--
function UI.ShipCraftWnd:OnSelBonusChanged()

	self:UpdateInfoIco()

end


--
function UI.ShipCraftWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local paramsEffect = UI:GetEffectFromLayer( self.paramsWnd, self.paramsWnd.layers.MAIN_EFFECT )

	local paramsPos		= mainEffect:GetObjPos( self.effectInfo.main.paramsLocator )
	local paramsSize	= paramsEffect and paramsEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selfHeight	= self:GetHeight()

	self.paramsX			= paramsPos.x
	self.space_params_btm	= selfHeight - ( paramsPos.y + paramsSize.y )

end


--
function UI.ShipCraftWnd:RecalcLayout()

	local paramsHeight	= self.paramsWnd:GetHeight()
	local selfHeight	= self:GetHeight()

	local paramsY = selfHeight - self.space_params_btm - paramsHeight
	self.paramsWnd:SetTop( paramsY )

end


--
function UI.ShipCraftWnd:UpdateEarlyAccessText()

	local bNeed = UI:IsShipEarlyAccess( self.shipDefName ) and not self:IsRecraft()
	self:SetLayerVisible( bNeed, self.layers.EARLY_ACCESS )
	
end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_WorkPanelWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_WorkPanelWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ShipCraft_WorkPanelWnd.layers =
{
	MAIN_EFFECT					= 0,
	CAPTION						= 1,
	SPEC_MODULE_HEADER			= 2,
    RESOURCES_HEADER			= 3,
    MODULE_SLOTS_HEADER			= 4,
    NUM_SELECTED_MODULE_SLOTS	= 5,
	PRICE						= 6,
	BONUSES_HEADER_1			= 7,
	BONUSES_HEADER_2			= 8,
	WAIT_EFFECT					= 9,
	WAIT_TEXT					= 10,
}

--
UI.ShipCraft_WorkPanelWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "ShipCraft_WorkPanelWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipCraft_WorkPanelWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipCraft_work1",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "title4",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.SPEC_MODULE_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "title5",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.RESOURCES_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "title6",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.MODULE_SLOTS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "title7",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.NUM_SELECTED_MODULE_SLOTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "price",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "loading",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modu",
						wnd			= "UI.ShipCraft_ModuleSlotsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "special_modul",
						wnd			= "UI.ShipCraft_SpecModulesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon",
						wnd			= "UI.ShipCraft_ShipPriceResourceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.ShipCraft_CraftBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_dlc",
						wnd			= "UI.ShipCraft_DlcBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.ShipCraft_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "special_modul1",	
						wnd			= "UI.ShipCraft_BonusesList1Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "special_modul2",	
						wnd			= "UI.ShipCraft_BonusesList2Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title11",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.BONUSES_HEADER_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "title12",
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.BONUSES_HEADER_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipCraft_caption" ),
		},

		-- SPEC_MODULE_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipCraft_specModuleHeader" ),
		},

		-- RESOURCES_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipCraft_resourcesHeader" ),
		},

		-- MODULE_SLOTS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NUM_SELECTED_MODULE_SLOTS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BONUSES_HEADER_1
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BONUSES_HEADER_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
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
						layer		= "UI.ShipCraft_WorkPanelWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text 			= UI:GetStringByName( "hangar_loading" ),
		},   
	},

	children =
	{
		"UI.ShipCraft_ModuleSlotsListWnd",
		"UI.ShipCraft_ShipPriceResourceWnd",
		"UI.ShipCraft_CraftBtn",
		"UI.ShipCraft_DlcBtn",
		"UI.ShipCraft_SpecModulesListWnd",
		"UI.ShipCraft_CrossBtn",
		"UI.ShipCraft_BonusesList1Wnd",
		"UI.ShipCraft_BonusesList2Wnd",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipCraft_WorkPanelWnd.priceMetaText	= UI.MetaText.GetNewInstance()

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipCraft_WorkPanelWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

end


--
function UI.ShipCraft_WorkPanelWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipCraft_WorkPanelWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipCraft_WorkPanelWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCraft_WorkPanelWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ShipCraft_WorkPanelWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ModuleSlotsListWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ModuleSlotsListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipCraft_ModuleSlotsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipCraft_ModuleSlotsListWnd",
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
				defName 			= "shipCraft_moduleSlotsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self89",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}		
			}}
		}
	}
}

-- -------------------------------
-- interface funtions
-- -------------------------------

--
function UI.ShipCraft_ModuleSlotsListWnd:OnPlayerResourcesChanged()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnPlayerResourcesChanged()
		end

	end

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipCraft_ModuleSlotsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ShipCraft_ModuleSlotsListWnd.btnPrototypeName	= "ShipCraft_ModuleSlotsBlockWnd"
UI.ShipCraft_ModuleSlotsListWnd.MAX_SLOTS			= 5
UI.ShipCraft_ModuleSlotsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ModuleSlotsBlockWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ModuleSlotsBlockWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipCraft_ModuleSlotsBlockWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipCraft_ModuleSlotsBlockWnd",
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
				defName 			= "shipCraft_moduleSlotsBlock",
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
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipCraft_ModuleSlotsBlockWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.resourceSlotWnd:Reset()
	self:ResetModuleSlots()

end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:OnPlayerResourcesChanged()

	self.resourceSlotWnd:OnPlayerResourcesChanged()

end

-- -------------------------------
-- const
-- -------------------------------

UI.ShipCraft_ModuleSlotsBlockWnd.effectInfo =
{
	main =
	{
		resourceLocator		= "slot_1_1",
		moduleSlotPrefix	= "slot_",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipCraft_ModuleSlotsBlockWnd.resourceSlotWnd	= nil
UI.ShipCraft_ModuleSlotsBlockWnd.moduleSlotWnds		= {}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipCraft_ModuleSlotsBlockWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.moduleSlotWnds = {}

	self:CreateControls()

end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.resourceSlotWnd = UI:CreateChildWnd( self, UI.ShipCraft_ResourceSlotWnd, "" )
	UI:AddChildAndLink( self, self.resourceSlotWnd, mainEffect, self.effectInfo.main.resourceLocator, UI.EffectAnimParams.POS )

	for moduleSlotIdx = 1, UI.ShipCraftWnd.MAX_MODULE_SLOTS_OF_TYPE do
		local moduleSlotWnd = UI:CreateChildWnd( self, UI.ShipCraft_ModuleSlotWnd, tostring( moduleSlotIdx ) )
		self.moduleSlotWnds[ moduleSlotIdx ] = moduleSlotWnd
		moduleSlotWnd:Init( moduleSlotIdx )
	end
	
end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateResource( data )
	self:UpdateModuleSlots( data )
	
end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:UpdateResource( data )

	local shipDefName	= UI.ShipCraftWnd:GetShipDefName()
	local idx			= self:GetRecord()

	local resourceDefName, resourceCount = UI:GetShipCraftResourcePriceByIdx( shipDefName, idx )

	if UI.ShipCraftWnd:IsRecraft() then
		resourceCount = 0
	end

	self.resourceSlotWnd:Setup( resourceDefName, resourceCount )

end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:UpdateModuleSlots( data )

	self:ResetModuleSlots()
	
	if not data then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for moduleSlotIdx, moduleSlotWnd in pairs( self.moduleSlotWnds ) do

		local state = data.moduleSlotStates[ moduleSlotIdx ]

		if state ~= UI.ShipCraftWnd.moduleSlotStates.INVISIBLE then
			UI:AddChildAndLink( self, moduleSlotWnd, mainEffect, string.format( "%s%d", self.effectInfo.main.moduleSlotPrefix, moduleSlotIdx ), UI.EffectAnimParams.POS )
			moduleSlotWnd:Setup( data.moduleSlotType, state )
		end
	end	

end


--
function UI.ShipCraft_ModuleSlotsBlockWnd:ResetModuleSlots()

	for moduleSlotIdx, moduleSlotWnd in pairs( self.moduleSlotWnds ) do
		if moduleSlotWnd:IsChildOf( self ) then
			moduleSlotWnd:Reset()
			moduleSlotWnd:UnlinkFromParent()
		end
	end	

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ModuleSlotWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ModuleSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ShipCraft_ModuleSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipCraft_ModuleSlotWnd",
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
				defName 			= "shipCraft_moduleSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",
						layer		= "UI.ShipCraft_ModuleSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCraft_moduleSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ShipCraft_ModuleSlotWnd:Init( idx )

	self.idx = idx

end


--
function UI.ShipCraft_ModuleSlotWnd:Setup( slotType, state )

	self:Reset()

	self.slotType	= slotType
	self.state		= state

	self:FullUpdate()
	
end


--
function UI.ShipCraft_ModuleSlotWnd:SetState( state )

	self.state = state

	self:UpdateIco()
	self:UpdateMouseOver()

end


--
function UI.ShipCraft_ModuleSlotWnd:Reset()

	self.slotType		= -1
	self.state			= -1
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:StartAnimation( self.effectInfo.main.animInactive )
	end

	self:SetMouseOver( false )

end


--
function UI.ShipCraft_ModuleSlotWnd:GetIdx()

	return self.idx

end


--
function UI.ShipCraft_ModuleSlotWnd:GetSlotType()

	return self.slotType

end


--
function UI.ShipCraft_ModuleSlotWnd:GetState()

	return self.state

end


--
function UI.ShipCraft_ModuleSlotWnd:GetTooltipData()

	return self.tooltipData

end



-- ---------------------------------------
-- const
-- ---------------------------------------

UI.ShipCraft_ModuleSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	MOUSE_OVER_EFFECT	= 1,
}

UI.ShipCraft_ModuleSlotWnd.effectInfo =
{
	main =
	{
		animInactive	= "inactive",
		animActive		= "active",
		animSelected	= "select",
		icoSpriteName	= "ico",
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ShipCraft_ModuleSlotWnd.idx			= -1
UI.ShipCraft_ModuleSlotWnd.slotType		= -1
UI.ShipCraft_ModuleSlotWnd.state		= -1
UI.ShipCraft_ModuleSlotWnd.tooltipData	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ShipCraft_ModuleSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()
	self:UpdateMouseOver()

end


--
function UI.ShipCraft_ModuleSlotWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local slotTypeName = UI:Val2Key( UI.ShipCraftWnd.moduleSlotTypes, self.slotType )
	local texName = string.format( "equipSlot_%s", slotTypeName )

	local hTex = UI:GetTex( texName )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

	if self.state == UI.ShipCraftWnd.moduleSlotStates.INACTIVE then
		mainEffect:StartAnimation( self.effectInfo.main.animInactive )

	elseif self.state == UI.ShipCraftWnd.moduleSlotStates.ACTIVE then
		mainEffect:StartAnimation( self.effectInfo.main.animActive )

	elseif self.state == UI.ShipCraftWnd.moduleSlotStates.SELECTED then
		mainEffect:StartAnimation( self.effectInfo.main.animSelected )

	else
		mainEffect:StartAnimation( self.effectInfo.main.animInactive )
		sys.log( "UI.ShipCraft_ModuleSlotWnd:UpdateIco()[ERROR]: unhandled state: %s", tostring( self.state ) )
	end

end


--
function UI.ShipCraft_ModuleSlotWnd:UpdateTooltip()

	local slotTypeName = UI:Val2Key( UI.ShipCraftWnd.moduleSlotTypes, self.slotType )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( string.format( "equipSlot_%s_tipMsg", slotTypeName ) ),
		caption		= UI:GetStringByName( string.format( "equipSlot_%s_tipCaption", slotTypeName ) ),
	}

end


--
function UI.ShipCraft_ModuleSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipCraft_ModuleSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self.state ~= -1 and self.state ~= UI.ShipCraftWnd.moduleSlotStates.INACTIVE and self.state ~= UI.ShipCraftWnd.moduleSlotStates.INVISIBLE and UI:CanChoseCraftSlots( UI.ShipCraftWnd:GetShipDefName() ) then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self

	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipCraft_ModuleSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipCraftWnd.sounds.slotMouseOver )
	end

end


--
function UI.ShipCraft_ModuleSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipCraft_ModuleSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ResourceSlotWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ResourceSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ShipCraft_ResourceSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ItemIcoWnd",

	props =
	{
		name		= "ShipCraft_ResourceSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ShipCraft_ResourceSlotWnd:Setup( defName, count )

	self:Reset()

	self.defName	= defName
	self.count		= count

	self:FullUpdate()

end


--
function UI.ShipCraft_ResourceSlotWnd:Reset()

	UI.ItemIcoWnd.Reset( self )

	self.defName		= ""
	self.count			= 0

end


--
function UI.ShipCraft_ResourceSlotWnd:GetDefName()

	return self.defName

end


--
function UI.ShipCraft_ResourceSlotWnd:GetCount()

	return self.count

end


--
function UI.ShipCraft_ResourceSlotWnd:SetCount( count )

	self.count = count

	self:UpdateCount()
	self:UpdateTooltip()

end


--
function UI.ShipCraft_ResourceSlotWnd:OnPlayerResourcesChanged()

	self:UpdateCount()

end

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ShipCraft_ResourceSlotWnd.defName		= ""
UI.ShipCraft_ResourceSlotWnd.count			= 0

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ShipCraft_ResourceSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateCount()
	self:UpdateTooltip()

end


--
function UI.ShipCraft_ResourceSlotWnd:UpdateIco()

	self:SetupForItem( self.defName )

end


--
function UI.ShipCraft_ResourceSlotWnd:UpdateCount()

	local isCount = UI:GetPlayerResourceCount( self.defName )

	local str = ""

	local strNeedCount = UI:Num2StrSeparatedBy3( self.count )
	local strIsCount = isCount > 999 and "999" or UI:Num2StrSeparatedBy3( isCount )

	if isCount >= self.count then
		local needCountColor = UI.GOLD_COLOR
		str = string.format( "%s/%s%s", strIsCount, UI:Color2Str( needCountColor ), strNeedCount )
	else
		local redColor = UI.PARAM_DELTA_MINUS_COLOR
		str = string.format( "%s%s/%s", UI:Color2Str( redColor ), strIsCount, strNeedCount )
	end

	self:SetCountResourcesText( str )


end


--
function UI.ShipCraft_ResourceSlotWnd:UpdateTooltip()

	local tooltipData = UI:GetTooltipForItem( self.defName )
	self:SetTooltipData( tooltipData )

end


--
function UI.ShipCraft_ResourceSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipCraft_ResourceSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipCraft_ResourceSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsMouseOver()

	if bMouseOver then
		self:ShowMouseOver()
	else
		self:HideMouseOver()
	end

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipCraftWnd.sounds.slotMouseOver )
	end

end


--
function UI.ShipCraft_ResourceSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipCraft_ResourceSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_SpecModulesListWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_SpecModulesListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipCraft_SpecModulesListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipCraft_SpecModulesListWnd",
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
				defName 			= "shipCraft_specModulesList",
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
}

-- -------------------------------
-- const
-- -------------------------------

UI.ShipCraft_SpecModulesListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ShipCraft_SpecModulesListWnd.btnPrototypeName	= "ShipCraft_SpecModuleSlotWnd"
UI.ShipCraft_SpecModulesListWnd.MAX_SLOTS			= 3
UI.ShipCraft_SpecModulesListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- -------------------------------
-- work functions
-- -------------------------------

-- перегрузка базоваой функции
function UI.ShipCraft_SpecModulesListWnd:ShowSlot( slot )
	
	self:AddChild( slot.btn )
	self:RecalcLayout()

end


-- перегрузка базоваой функции
function UI.ShipCraft_SpecModulesListWnd:HideSlot( slot )

	slot.btn:UnlinkFromParent()
	self:RecalcLayout()
	
end


--
function UI.ShipCraft_SpecModulesListWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local firstSlotWnd = self:GetButtonForSlot( 1 )
	
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth		= firstSlotWnd and firstSlotWnd:GetWidth() or 0
	local selfWidth		= self:GetWidth()
	
	local space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	local slotsY		= firstSlotPos.y
	
	local numSlots		= self:GetNumVisibleSlots()
	local slotsWidth	= numSlots * slotWidth + ( numSlots - 1 ) * space_slots
	local slotsX		= ( selfWidth - slotsWidth ) / 2
	
	for slotIdx = 1, numSlots do
		local slotWnd = self:GetButtonForSlot( slotIdx )
		local x = UI:XRel2Snapped( slotsX + ( slotIdx - 1 ) * ( slotWidth + space_slots ) )
		slotWnd:SetPos( x, slotsY )
	end

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_SpecModuleSlotWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_SpecModuleSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ShipCraft_SpecModuleSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipCraft_SpecModuleSlotWnd",
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
				defName 			= "shipCraft_specModuleSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",
						layer		= "UI.ShipCraft_SpecModuleSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCraft_specModuleSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ShipCraft_SpecModuleSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.tooltipData = nil

	self:SetMouseOver( false )

end


--
function UI.ShipCraft_SpecModuleSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateAnimation()

end


--
function UI.ShipCraft_SpecModuleSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.ShipCraft_SpecModuleSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	MOUSE_OVER_EFFECT	= 1,
}

UI.ShipCraft_SpecModuleSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
		animIdle		= "idle",
		animSelected	= "select",
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ShipCraft_SpecModuleSlotWnd.tooltipData = nil

-- ---------------------------------------
-- work funcitons
-- ---------------------------------------

--
function UI.ShipCraft_SpecModuleSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateAnimation()
	self:UpdteIco( data )
	self:UpdateTooltip( data )
	self:UpdateMouseOver()

end


--
function UI.ShipCraft_SpecModuleSlotWnd:UpdateAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = self:IsSelected() and self.effectInfo.main.animSelected or self.effectInfo.main.animIdle
	mainEffect:StartAnimation( anim )

end


--
function UI.ShipCraft_SpecModuleSlotWnd:UpdteIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local hTex = UI:GetShopIco( data.defName )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.ShipCraft_SpecModuleSlotWnd:UpdateTooltip( data )

	self.tooltipData =
	{
		tooltipType		= UI.tooltipTypes.MODULE,
		defName 		= data.defName,
		dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForDef( UI.ShipCraftWnd:GetShipDefName(), ai.SpaceShipModuleSlot.SPECIAL )
	}

end


--
function UI.ShipCraft_SpecModuleSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipCraft_SpecModuleSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipCraft_SpecModuleSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipCraftWnd.sounds.slotMouseOver )
	end

end


--
function UI.ShipCraft_SpecModuleSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipCraft_SpecModuleSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end



-- -------------------------------------------------------------------------
-- UI.ShipCraft_InfoIcoWnd
-- -------------------------------------------------------------------------

UI.ShipCraft_InfoIcoWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ShipCraft_InfoIcoWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "ShipCraft_InfoIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipCraft_infoIco",

				links =
				{
					{
						objName		= "self88",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ShipCraft_InfoIcoWnd:Setup( shipDefName, specModuleDefName, moduleSlots, bonuses )

	self:Reset()

	self.shipDefName		= shipDefName
	self.specModuleDefName	= specModuleDefName
	self.moduleSlots		= moduleSlots
	self.bonuses			= bonuses

	self:UpdateTooltip()

end


--
function UI.ShipCraft_InfoIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.ShipCraft_InfoIcoWnd.effectInfo =
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

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ShipCraft_InfoIcoWnd.shipDefName			= ""
UI.ShipCraft_InfoIcoWnd.specModuleDefName	= ""
UI.ShipCraft_InfoIcoWnd.moduleSlots			= {}
UI.ShipCraft_InfoIcoWnd.bonuses				= {}
UI.ShipCraft_InfoIcoWnd.tooltipData			= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ShipCraft_InfoIcoWnd:Reset()

    self.shipDefName		= ""
    self.specModuleDefName	= ""
    self.moduleSlots		= {}
	self.bonuses			= {}
    self.tooltipData		= nil

end


--
function UI.ShipCraft_InfoIcoWnd:UpdateTooltip()

	self.tooltipData = nil

	if self.shipDefName == "" then
		return
	end

	self.tooltipData =
	{
    	tooltipType			= UI.tooltipTypes.SHIP,
		defName				= self.shipDefName,			
		bCompare			= true,
		craftedSpecModule	= self.specModuleDefName,
		craftedModuleSlots	= self.moduleSlots,
		craftedBonuses		= self.bonuses,
	}	

end

-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ParamsWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ParamsWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ShipCraft_ParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipCraft_ParamsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipCraft_params",
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
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ShipCraft_ParamsWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName

	self:UpdateParams()
	self:RecalcLayout()

end


--
function UI.ShipCraft_ParamsWnd:Reset()

	self.shipDefName = ""

	for idx, paramWnd in pairs( self.curParamWnds ) do

		if paramWnd.Reset then
			paramWnd:Reset()
		end

		paramWnd:UnlinkFromParent()

	end

	self.curParamWnds = {}

end

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.ShipCraft_ParamsWnd.layers =
{
	MAIN_EFFECT = 0
}

UI.ShipCraft_ParamsWnd.effectInfo =
{
	main =
	{
		minSizeLocator				= "dist_min",
		maxSizeLocator				= "self",
		primParamLocator			= "line_1",
		secParamCol1Row1Locator		= "line_2",
		secParamCol2Row1Locator		= "line_3",
		secParamCol1Row2Locator		= "line_4",
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ShipCraft_ParamsWnd.shipDefName 		= ""

UI.ShipCraft_ParamsWnd.allPrimParamWnds	= {}
UI.ShipCraft_ParamsWnd.allSecParamWnds	= {}
UI.ShipCraft_ParamsWnd.curParamWnds		= {}

UI.ShipCraft_ParamsWnd.space_top_params	= 0
UI.ShipCraft_ParamsWnd.space_params_btm	= 0
UI.ShipCraft_ParamsWnd.space_paramsRows	= 0
UI.ShipCraft_ParamsWnd.primParamX		= 0
UI.ShipCraft_ParamsWnd.paramsCol1X		= 0
UI.ShipCraft_ParamsWnd.paramsCol2X		= 0
UI.ShipCraft_ParamsWnd.minHeight		= 0
UI.ShipCraft_ParamsWnd.maxHeight		= 0

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ShipCraft_ParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipCraft_ParamsWnd:CreateControls()

	for paramIdx = 1, 4 do
		self:CreateSecParamWnd()
	end

	for paramIdx = 1, 1 do
		self:CreatePrimParamWnd()
	end
	
end


--
function UI.ShipCraft_ParamsWnd:CreateSecParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ShipTooltip_ParamWnd, tostring( #self.allSecParamWnds ) )
	table.insert( self.allSecParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ShipCraft_ParamsWnd:ObtainFreeSecParamWnd()

	local freeParamWnd = nil

	for idx, paramWnd in pairs( self.allSecParamWnds ) do
		if not paramWnd:IsChildOf( self ) then
			freeParamWnd = paramWnd
			break
		end
	end

	if not freeParamWnd then
		freeParamWnd = self:CreateSecParamWnd()
	end

	table.insert( self.curParamWnds, freeParamWnd )

	self:AddChild( freeParamWnd )

	return freeParamWnd

end


--
function UI.ShipCraft_ParamsWnd:CreatePrimParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ShipTooltip_PrimaryParamWnd, tostring( #self.allPrimParamWnds ) )
	table.insert( self.allPrimParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ShipCraft_ParamsWnd:ObtainFreePrimParamWnd()

	local freeParamWnd = nil

	for idx, paramWnd in pairs( self.allPrimParamWnds ) do
		if not paramWnd:IsChildOf( self ) then
			freeParamWnd = paramWnd
			break
		end
	end

	if not freeParamWnd then
		freeParamWnd = self:CreatePrimParamWnd()
	end

	table.insert( self.curParamWnds, freeParamWnd )

	self:AddChild( freeParamWnd )

	return freeParamWnd

end       


--
function UI.ShipCraft_ParamsWnd:UpdateParams()

	local shipParamsData = self:GetShipParamsData()

	local tooltipParams = UI:GetShipTooltipBriefParams( self.shipDefName )
	if next( tooltipParams ) then

    	for paramIdx = 1, #tooltipParams do

    		local paramInfo = tooltipParams[ paramIdx ]
    		local paramWnd = nil

    		if paramInfo.separator then
				-- разделители в этом окне не поддерживаются

    		elseif paramInfo.large then
    			paramWnd = self:ObtainFreePrimParamWnd()
    			paramWnd:Setup( self.shipDefName, paramInfo, shipParamsData, nil, tooltipParams )

    		else
    			paramWnd = self:ObtainFreeSecParamWnd()
    			paramWnd:Setup( self.shipDefName, paramInfo, shipParamsData, nil, tooltipParams )
    		end

    	end		

	end

end


--
function UI.ShipCraft_ParamsWnd:GetShipParamsData()

	local shipParamsData = { defName = self.shipDefName, data = nil, synergyLevel = UI:GetShipDefaultLevel( self.shipDefName ) }
	shipParamsData.data = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.shipDefName, true, false ) ) }

	return shipParamsData

end    


--
function UI.ShipCraft_ParamsWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local primParamPos 			= mainEffect:GetObjPos( self.effectInfo.main.primParamLocator )
	local secParamCol1Row1Pos	= mainEffect:GetObjPos( self.effectInfo.main.secParamCol1Row1Locator )
	local secParamCol2Row1Pos	= mainEffect:GetObjPos( self.effectInfo.main.secParamCol2Row1Locator )
	local secParamCol1Row2Pos	= mainEffect:GetObjPos( self.effectInfo.main.secParamCol1Row2Locator )

	local secParamWnd = self.allSecParamWnds[ 1 ]
	local secParamSize = Vec2( secParamWnd and secParamWnd:GetWidth() or 0, secParamWnd and secParamWnd:GetHeight() or 0 )

	local primParamWnd = self.allPrimParamWnds[ 1 ]
	local primParamSize = Vec2( primParamWnd and primParamWnd:GetWidth() or 0, primParamWnd and primParamWnd:GetHeight() or 0 )

    self.minHeight				= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y
    self.maxHeight				= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y
    self.space_top_params		= primParamPos.y
    self.space_params_btm		= self.minHeight - ( secParamCol1Row2Pos.y + secParamSize.y )
    self.space_paramsRows		= secParamCol1Row2Pos.y - ( secParamCol1Row1Pos.y + secParamSize.y )
	self.paramsCol1X			= secParamCol1Row1Pos.x
	self.paramsCol2X			= secParamCol2Row1Pos.x
	self.primParamX				= primParamPos.x

	local selfWidth = mainEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )	

end


--
function UI.ShipCraft_ParamsWnd:RecalcLayout()

	-- параметры (позиции)

	local paramsY1 = self.space_top_params

	if next( self.curParamWnds ) then

		local MAX_COLS = 2

		local col = 1
		local prevRowY1 = self.space_top_params
		local rowY0 = prevRowY1

		for paramIdx = 1, #self.curParamWnds do
	
			local paramWnd = self.curParamWnds[ paramIdx ]
			local prevParamWnd = paramIdx > 1 and self.curParamWnds[ paramIdx - 1 ]			

			if UI:IsWndKindOf( paramWnd, "ShipTooltip_PrimaryParamWnd" ) then

				paramWnd:SetLeft( self.primParamX )
		
				local space = 0
				if prevParamWnd then
					space = self.space_paramsRows
				end

				rowY0 = prevRowY1 + space
				prevRowY1 = rowY0 + paramWnd:GetHeight()

				paramWnd:SetTop( rowY0 )

				col = 1				

			else

				paramWnd:SetLeft( col == 1 and self.paramsCol1X or self.paramsCol2X )

				if col == 1 then

    				local space = 0
    				if prevParamWnd then
    					space = self.space_paramsRows 
    				end
				
					rowY0 = prevRowY1 + space
					prevRowY1 = rowY0 + paramWnd:GetHeight()

				end

				paramWnd:SetTop( rowY0 )

				col = math.fmod( col, MAX_COLS ) + 1			
				
			end

		end

		paramsY1 = prevRowY1

	end


	-- собственный размер

	local selfHeight = paramsY1 + self.space_params_btm
	self:SetHeight( selfHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

		mainEffect:SetAnimationTime( animTime )
		mainEffect:Update( 0 )	

	end

end


--
function UI.ShipCraft_ParamsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.ShipCraft_ParamsWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCraft_ParamsWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end   


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_ShipPriceResourceWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_ShipPriceResourceWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ShipCraft_ResourceSlotWnd",

		props =
		{
			name	= "ShipCraft_ShipPriceResourceWnd"
		}
	}
}

-- -----------------------------------------------------------------------------
-- UI.ShipCraft_CraftBtn
-- -----------------------------------------------------------------------------

UI.ShipCraft_CraftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn18",

		props =
		{
			name	= "ShipCraft_CraftBtn"
		}
	},

	textId	= "shipCraft_craftBtn"
}


-- --------------------------------------------------------------------
-- UI.ShipCraft_DlcBtn
-- --------------------------------------------------------------------

UI.ShipCraft_DlcBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_DlcBtn",

		props =
		{
			name	= "ShipCraft_DlcBtn",
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
					defName 			= "shipCraft_dlcBtn",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
}

-- -------------------------------------------------------------------------
-- UI.ShipCraft_CrossBtn
-- -------------------------------------------------------------------------

UI.ShipCraft_CrossBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name		= "ShipCraft_CrossBtn",
    	},
	}
}

-- -----------------------------------------------------------------------------
-- UI.ShipCraft_BonusesListWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_BonusesListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipCraft_BonusesListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipCraft_BonusesListWnd",	
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
				defName 			= "shipCraft_bonusesList",
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
}

-- -------------------------------
-- interface funcitons
-- -------------------------------

--
function UI.ShipCraft_BonusesListWnd:Setup( synergyLevel )

	self:Reset()

	self.synergyLevel = synergyLevel
	self:FullUpdate()

end


--
function UI.ShipCraft_BonusesListWnd:Reset()

	self:Clear()
	self.synergyLevel = -1

end


--
function UI.ShipCraft_BonusesListWnd:GetSynergyLevel()

	return self.synergyLevel

end


-- -------------------------------
-- const
-- -------------------------------


UI.ShipCraft_BonusesListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ShipCraft_BonusesListWnd.btnPrototypeName	= "ShipCraft_BonusSlotWnd"
UI.ShipCraft_BonusesListWnd.MAX_SLOTS			= 3
UI.ShipCraft_BonusesListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipCraft_BonusesListWnd.synergyLevel = -1

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipCraft_BonusesListWnd:FullUpdate()

	self:Clear()

	local bonuses = UI:GetCraftShipAvailableBonuses( UI.ShipCraftWnd:GetShipDefName(), self.synergyLevel )

	if not next( bonuses ) then
		sys.log( "UI.ShipCraft_BonusesListWnd:FullUpdate()[ERROR]: no customized bonuses found for ship \"%s\" synergy level %d", UI.ShipCraftWnd:GetShipDefName(), self.synergyLevel )
	end

	for bonusIdx, bonusName in ipairs( bonuses ) do

		local data = { bonusName = bonusName }
		self:AddRecord( data )

	end

end


-- перегрузка базоваой функции
function UI.ShipCraft_BonusesListWnd:ShowSlot( slot )
	
	self:AddChild( slot.btn )
	self:RecalcLayout()

end


-- перегрузка базоваой функции
function UI.ShipCraft_BonusesListWnd:HideSlot( slot )

	slot.btn:UnlinkFromParent()
	self:RecalcLayout()
	
end


--
function UI.ShipCraft_BonusesListWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local firstSlotWnd = self:GetButtonForSlot( 1 )
	
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth		= firstSlotWnd and firstSlotWnd:GetWidth() or 0
	local selfWidth		= self:GetWidth()
	
	local space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	local slotsY		= firstSlotPos.y
	
	local numSlots		= self:GetNumVisibleSlots()
	local slotsWidth	= numSlots * slotWidth + ( numSlots - 1 ) * space_slots
	local slotsX		= ( selfWidth - slotsWidth ) / 2
	
	for slotIdx = 1, numSlots do
		local slotWnd = self:GetButtonForSlot( slotIdx )
		local x = UI:XRel2Snapped( slotsX + ( slotIdx - 1 ) * ( slotWidth + space_slots ) )
		slotWnd:SetPos( x, slotsY )
	end

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_BonusSlotWnd
-- -----------------------------------------------------------------------------

UI.ShipCraft_BonusSlotWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipCraft_BonusSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipCraft_BonusSlotWnd",	
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
				defName 			= "shipCraft_bonusSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",
						layer		= "UI.ShipCraft_BonusSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shipCraft_bonusSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}		
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipCraft_BonusSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.tooltipData = nil

end


--
function UI.ShipCraft_BonusSlotWnd:Select( bSelect, bAnimated )

	self:UpdateMainAnimation()

end



--
function UI.ShipCraft_BonusSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipCraft_BonusSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    MOUSE_OVER_EFFECT	= 1,
}

UI.ShipCraft_BonusSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
		animIdle		= "idle",
		animSel			= "select",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipCraft_BonusSlotWnd.tooltipData	= nil

-- -------------------------------
-- work sunctions
-- -------------------------------

--
function UI.ShipCraft_BonusSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation()
	self:UpdateIco( data )
	self:UpdateTooltip( data )

end


--
function UI.ShipCraft_BonusSlotWnd:UpdateMainAnimation()

	local anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipCraft_BonusSlotWnd:UpdateIco( data )

	local hTex = UI:GetShipBonusIco( data.bonusName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end	

end


--
function UI.ShipCraft_BonusSlotWnd:UpdateTooltip( data )

	self.tooltipData = {}

	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption		= UI:ShipBonus2Str( data.bonusName )
	self.tooltipData.text			= ""

	-- текст

	local shipDefName	= UI.ShipCraftWnd:GetShipDefName()
	local synergyLevel	= self:GetParent():GetSynergyLevel()

	-- Это сами модификаторы, типа "module_deploy_cooldown_mul"
	local modifiers = {}

	if type( _G.ShipSpecBonus ) == "table" then

		-- Это "спецбонус" - объединение модификаторов, имеющее индекс в таблице _G.ShipSpecBonus, типа ENGINEER_COOLDOWN = { module_deploy_cooldown_mul = -0.25 }
		local bonusInfo = _G.ShipSpecBonus[ data.bonusName ]

		if type( bonusInfo ) == "table" then

			for modifierName, modifierVal in pairs( bonusInfo ) do

				if type( modifierName ) == "string" then
					table.insert( modifiers, modifierName )
				else
					sys.log( "UI.ShipCraft_BonusSlotWnd:UpdateTooltip()[ERROR]: invalid type of key in table _G.ShipSpecBonus[\"%s\"]; \"string\" expected, got \"%s\"", data.bonusName, type( modifierName ) )
				end

			end

		else
			sys.log( "UI.ShipCraft_BonusSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.ShipSpecBonus[\"%s\"]\"; \"table\" expected, got \"%s\"", data.bonusName, type( bonusInfo ) )
		end		

	else
		sys.log( "UI.ShipCraft_BonusSlotWnd:UpdateTooltip()[ERROR]: invalid type of \"_G.ShipSpecBonus\"; \"table\" expected, got \"%s\"", type( _G.ShipSpecBonus ) )
	end	


	-- Это параметры из таблицы _G.ShipTooltipParamsDescription, специально для ui;
	-- с модификаторами типа "module_deploy_cooldown_mul" соотносятся по полю valField;
	-- они нужны, т.к. только через них можно получить локализованную строку для модификатора

	local descParams = {}

	local allDescParams = UI:GetShipDescParams( shipDefName )
	for modifierIdx, modifierName in pairs( modifiers ) do

		for descParamIdx, descParamInfo in pairs( allDescParams ) do

    		if type( descParamInfo ) == "table" then

        		if modifierName == descParamInfo.valField then
        			table.insert( descParams, descParamInfo )
					break
        		end

    		else
    			sys.log( "UI.ShipCraft_BonusSlotWnd:UpdateTooltip()[ERROR]: invalid format of value in table \"_G.ShipTooltipParamsDescription\"; \"table\" expected, got \"%s\"", type( descParamInfo ) )
    		end

		end

	end

	if next( descParams ) then
		
		local strDescParams = ""

    	local shipData = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( shipDefName, true, false ) ) }

    	local function l_fnSortDescParamsByModifierName( paramInfo1, paramInfo2 )
    		return paramInfo1.valField < paramInfo2.valField
    	end
    	table.sort( descParams, l_fnSortDescParamsByModifierName )

		for descParamIdx, descParamInfo in ipairs( descParams ) do

    		local vals = UI:GetParamVals( shipDefName, descParamInfo, UI.paramSrcTypes.SHIP, shipData, false, synergyLevel, data.bonusName )

        	local descParamData =
        	{
        		paramInfo		= descParamInfo,
        		vals			= vals,
        		synergyLevel	= synergyLevel
        	}

			local strParam = UI:ShipDescParam2Str(
        		descParamData,
        		UI.TooltipWnd_shared:GetTextColor(),
        		UI.TEXT_SEL_COLOR,
        		shipDefName,
        		-1,
        		false )	

			if strParam ~= "" then
				strDescParams = string.format( "%s%s%s", strDescParams, strDescParams ~= "" and "|" or "", strParam )
			end

		end

		self.tooltipData.text = strDescParams

	else
		sys.log( "UI.ShipCraft_BonusSlotWnd:UpdateTooltip()[ERROR]: cannot find params to show in tooltip for bonus \"%s\"", data.bonusName )
	end

end


--
function UI.ShipCraft_BonusSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipCraft_BonusSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipCraftWnd.sounds.slotMouseOver )
	end

end


--
function UI.ShipCraft_BonusSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipCraft_BonusSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipCraft_BonusSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- -----------------------------------------------------------------------------
-- UI.ShipCraft_BonusesList1Wnd, UI.ShipCraft_BonusesList2Wnd
-- -----------------------------------------------------------------------------

--
UI.ShipCraft_BonusesList1Wnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ShipCraft_BonusesListWnd",

		props =
		{
			name = "UI.ShipCraft_BonusesList1Wnd"
		}
	}
}


--
UI.ShipCraft_BonusesList2Wnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ShipCraft_BonusesListWnd",

		props =
		{
			name = "UI.ShipCraft_BonusesList2Wnd"
		}
	}
}