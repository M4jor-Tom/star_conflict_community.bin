-- --------------------------------------------------------------
-- UI.Profile_AtlasWnd
-- --------------------------------------------------------------

UI.Profile_AtlasWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_AtlasWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "Profile_AtlasWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		activationOrder	= 0,
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
				defName 			= "profile_atlas",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "radiobtn",	
						wnd			= "UI.Profile_Atlas_ModesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "filter",	
						wnd			= "UI.Profile_Atlas_RolesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down",	
						wnd			= "UI.Profile_Atlas_ModuleTypesCB",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules_list",	
						wnd			= "UI.Profile_Atlas_ModulesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules_list",	
						wnd			= "UI.Profile_Atlas_ShipsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "input_text",	
						wnd			= "UI.Profile_Atlas_NameFilterEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SUMMARY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_summary",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.Profile_AtlasWnd.layers.SUMMARY_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "name9",	
						layer		= "UI.Profile_AtlasWnd.layers.SUMMARY_CUR_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "lvl_val3",	
						layer		= "UI.Profile_AtlasWnd.layers.SUMMARY_MAX_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- SUMMARY_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "atlas_summary" ),
		},

		-- SUMMARY_CUR_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SUMMARY_MAX_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.Profile_Atlas_ModesWnd",
		"UI.Profile_Atlas_RolesWnd",
		"UI.Profile_Atlas_ModuleTypesCB",
		"UI.Profile_Atlas_NameFilterEditWnd",
		"UI.Profile_Atlas_ModulesListWnd",
		"UI.Profile_Atlas_ShipsListWnd",
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_AtlasWnd:Setup( uid )

	self:Reset()

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Profile_AtlasWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if uid == UI.INVALID_U64_ID then
		sys.log( "UI.Profile_AtlasWnd:Setup()[ERROR]: invalid uid" )
		return
	end

	self.uid = uid

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Profile_AtlasWnd:GetUid()

	return self.uid

end


--
function UI.Profile_AtlasWnd:GetModulesListAvailableHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local selfBaseSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local modulesListPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.modulesLocator ) or Vec2( 0, 0 )
	local modulesListBaseHeight = self.modulesList:GetBaseHeight()

	local space_modulesList_btm = selfBaseSize.y - ( modulesListPos.y + modulesListBaseHeight )

	local modulesListAvailableHeight = self:GetHeight() - modulesListPos.y - space_modulesList_btm
	modulesListAvailableHeight = math.max( modulesListAvailableHeight, 0 )

	return modulesListAvailableHeight

end


--
function UI.Profile_AtlasWnd:GetShipsListAvailableHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local selfBaseSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local shipsListPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipsLocator ) or Vec2( 0, 0 )
	local shipsListBaseHeight = self.shipsList:GetBaseHeight()

	local space_shipsList_btm = selfBaseSize.y - ( shipsListPos.y + shipsListBaseHeight )

	local shipsListAvailableHeight = self:GetHeight() - shipsListPos.y - space_shipsList_btm
	shipsListAvailableHeight = math.max( shipsListAvailableHeight, 0 )

	return shipsListAvailableHeight

end


--
function UI.Profile_AtlasWnd:GetSelMode()

	return self.modesWnd:GetSelMode()

end


--
function UI.Profile_AtlasWnd:SelectMode( mode )

	return self.modesWnd:SelectMode( mode )

end


--
function UI.Profile_AtlasWnd:GetSelRole()

	return self.rolesWnd:GetSelRole()

end


--
function UI.Profile_AtlasWnd:GetSelModuleType()

	return self.moduleTypesCB:GetSelModuleType()

end


--
function UI.Profile_AtlasWnd:GetNameFilter()

	return _G.Utf8CaseFold_Transform( self.nameFilterEditWnd:GetEditText() )
	
end


--
function UI.Profile_AtlasWnd:GetAtlas()

	return UI.ProfileWnd_new:GetAtlas()

end


--
function UI.Profile_AtlasWnd:GetRoles()

	return self.rolesWnd:GetRoles()

end


--
function UI.Profile_AtlasWnd:GetShips( bFiltered )

	local ships = {}

	if bFiltered ~= nil then
		if type( bFiltered ) ~= "boolean" then
			sys.log( "UI.Profile_AtlasWnd:GetShips()[ERROR]: invalid type of the 1-st parameter (\"bFiltered\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bFiltered ) )
			return ships
		end
	else
		bFiltered = false
	end
	
	local role = bFiltered and self:GetSelRole() or self.ROLE_ALL
	
	if role == -1 then
		return ships
	end
	
	local nameFilter = self:GetNameFilter()

	for idx, shopItem in pairs( UI.serverData.shop ) do

		if shopItem.type == _G.GameStore.ItemType.IT_VESSEL then

			local bFit = true

			if bFit then
				if not UI:IsItemVisibleInAtlas( shopItem.defName ) then
					bFit = false
				end
			end

			if bFit then
    			if role ~= self.ROLE_ALL and UI:GetItemRole( shopItem.defName ) ~= role then
    				bFit = false
    			end
			end

			if bFit then
    			if UI:IsShipEvolving( shopItem.defName ) then
    				if shopItem.defName ~= UI:GetEvolvingShipBaseDef( shopItem.defName ) then
    					bFit = false
    				end
    			end
			end
			
			if bFit then

				if nameFilter ~= "" then

					local itemName = UI:GetEntityLocalizedNameByDef( shopItem.defName, false )
					local itemName_low = _G.Utf8CaseFold_Transform( itemName )

					if not string.find( itemName_low, nameFilter, 1, true ) then
						bFit = false
					end

				end

			end

			if bFit then
				table.insert( ships, shopItem.defName )
			end

		end

	end

	return ships

end


--
function UI.Profile_AtlasWnd:OnAtlasChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self.nameFilterTimer = -1

	self:UpdateSummary()
	self.modulesList:OnAtlasChanged()
	self.shipsList:OnAtlasChanged()

end


--
function UI.Profile_AtlasWnd:OnSelModeChanged()

	self.nameFilterTimer = -1

	self.modulesList:UnlinkFromParent()
	self.shipsList:UnlinkFromParent()
	self.moduleTypesCB:UnlinkFromParent()

	local mode = self:GetSelMode()

	if mode == self.modes.MODULES then

		self:AddChild( self.moduleTypesCB )
		self:AddChild( self.modulesList )

	elseif mode == self.modes.SHIPS then
		self:AddChild( self.shipsList )

	else
		sys.log( "UI.Profile_AtlasWnd:OnSelModeChanged()[ERROR]: invalid mode %d", mode )
	end

	self:UpdateSummary()

end


--
function UI.Profile_AtlasWnd:OnSelRoleChanged()

	self:OnFiltersChanged()

end


-- дополнительные параметры, которые не отражены в Setup и могут не храниться в профиле игрока (_G.GetProfileTable());
-- используется для восстановления состояния окна, например, после выхода из режима превью или покупки корабля
function UI.Profile_AtlasWnd:GetRestoreStateData()

	local mode = self:GetSelMode()

	local restoreData =
	{
		mode			= mode,
		selRole			= self:GetSelRole(),
		selModuleType	= -1,
		nameFilterText	= self.nameFilterEditWnd:GetEditText(),
		scrollPos		= -1
	}

	if mode == self.modes.MODULES then
		restoreData.scrollPos		= self.modulesList:GetScrollPos()
		restoreData.selModuleType	= self:GetSelModuleType()

	elseif mode == self.modes.SHIPS then
		restoreData.scrollPos = self.shipsList:GetScrollPos()
	end

	return restoreData

end


-- дополнительные параметры, которые не отражены в Setup и могут не храниться в профиле игрока (_G.GetProfileTable());
-- используется для восстановления состояния окна, например, после выхода из режима превью или покупки корабля
function UI.Profile_AtlasWnd:RestoreState( restoreData )

	if restoreData == nil then
		return
	end

	if type( restoreData ) ~= "table" then
		sys.log( "UI.Profile_AtlasWnd:RestoreState()[ERROR]: invalid type of the 1-st parameter (\"restoreData\"); \"table\" or \"nil\" expected, got \"%s\"", type( restoreData ) )
		return
	end
	
	if	type( restoreData.mode ) ~= "number"
		or type( restoreData.selRole ) ~= "number"
		or type( restoreData.selModuleType ) ~= "number"
		or type( restoreData.scrollPos ) ~= "number"
		or type( restoreData.nameFilterText ) ~= "string" then
			sys.log( "UI.Profile_AtlasWnd:RestoreState()[ERROR]: invalid format of restoreData" )
			return
	end

	local mode = self:GetSelMode()

	if restoreData.mode ~= mode then
		self:SelectMode( restoreData.mode )
		mode = restoreData.mode
	end

	if restoreData.selRole ~= self:GetSelRole() then
		self.rolesWnd:SelectRole( restoreData.selRole )
	end
	
	if restoreData.nameFilterText ~= self.nameFilterEditWnd:GetEditText() then
		self.nameFilterEditWnd:SetEditText( restoreData.nameFilterText )
	end

	if mode == self.modes.MODULES then
			
		if restoreData.selModuleType ~= self:GetSelModuleType() then
			self.moduleTypesCB:SelectModuleType( restoreData.selModuleType )
		end

		if restoreData.scrollPos ~= -1 then
			self.modulesList:SetScrollPos( restoreData.scrollPos )
		end

	elseif mode == self.modes.SHIPS then

		if restoreData.scrollPos ~= -1 then
    		self.shipsList:SetScrollPos( restoreData.scrollPos )
		end

	end

end


--
function UI.Profile_AtlasWnd:ShowItem( defName, bShowItemCraftWnd )

	if not self:IsOnScreen() then
		sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: not on screen" )
		return
	end
	
	if type( defName ) ~= "string" then
		sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end
	
	if UI:IsDefModule( defName ) then
	
		if bShowItemCraftWnd ~= nil then
			if type( bShowItemCraftWnd ) ~= "boolean" then
				sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: invalid type of the 2-nd parameter (\"bShowItemCraftWnd\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bShowItemCraftWnd ) )
				bShowItemCraftWnd = nil
			end
		end
		
		if bShowItemCraftWnd == nil then
			bShowItemCraftWnd = false
		end

	end
	
	if UI:IsDefModule( defName ) then
	
		self:SelectMode( self.modes.MODULES )
		
		local bItemFound = true
		
		if not self.modulesList:TryShowItem( defName ) then
			
			self.rolesWnd:SelectRole( self.ROLE_ALL )
			self.moduleTypesCB:SelectModuleType( self.moduleTypes.ALL )
			
			if not self.modulesList:TryShowItem( defName ) then
				sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: cannot find %s", defName )
				bItemFound = false
			end
		
		end
		
		if bItemFound and bShowItemCraftWnd then
			self:LaunchItemCraftWnd( UI:GetItemUpgradeBaseDef( defName ) )
		end
		
	elseif UI:IsDefShip( defName ) then
	
		self:SelectMode( self.modes.SHIPS )
		
		if not self.shipsList:TryShowItem( defName ) then
			
			self.rolesWnd:SelectRole( self.ROLE_ALL )
			
			if not self.shipsList:TryShowItem( defName ) then
				sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: cannot find %s", defName )
			end
		
		end

	else
		sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: unsupported item type (def %s)", defName )
	end

end


--
function UI.Profile_AtlasWnd:ShowItemSubType( itemSubType, bShowItemCraftWnd )

	if not self:IsOnScreen() then
		sys.log( "UI.Profile_AtlasWnd:ShowItemSubType()[ERROR]: not on screen" )
		return
	end
	
	if type( itemSubType ) ~= "number" then
		sys.log( "UI.Profile_AtlasWnd:ShowItem()[ERROR]: invalid type of the 1-st parameter (\"itemSubType\"); \"number\" expected, got \"%s\"", type( itemSubType ) )
		return
	end
	
	if UI:Val2Key( _G.ItemSubtype, itemSubType ) == "" then
		sys.log( "UI.Profile_AtlasWnd:ShowItemSubType()[ERROR]: invalid item subtype; one of the \"_G.ItemSubtype\" members expected, got \"%d\"", itemSubType )
		return
	end
	
	if bShowItemCraftWnd ~= nil then
		if type( bShowItemCraftWnd ) ~= "boolean" then
			sys.log( "UI.Profile_AtlasWnd:ShowItemSubType()[ERROR]: invalid type of the 2-nd parameter (\"bShowItemCraftWnd\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bShowItemCraftWnd ) )
			bShowItemCraftWnd = nil
		end
	end
	
	if bShowItemCraftWnd == nil then
		bShowItemCraftWnd = false
	end

	
	self:SelectMode( self.modes.MODULES )
	
	local defName = self.modulesList:TryShowItemSubType( itemSubType )
	if defName == "" then
		
		self.rolesWnd:SelectRole( self.ROLE_ALL )
		self.moduleTypesCB:SelectModuleType( self.moduleTypes.ALL )
	
		defName = self.modulesList:TryShowItemSubType( itemSubType )
		if defName == "" then
			sys.log( "UI.Profile_AtlasWnd:ShowItemSubType()[ERROR]: cannot find item for subtype %d(%s)", itemSubType, UI:Val2Key( _G.ItemSubtype, itemSubType ) )
		end
	
	end
	
	if defName ~= "" and bShowItemCraftWnd then
		self:LaunchItemCraftWnd( UI:GetItemUpgradeBaseDef( defName ) )
	end

end


--
function UI.Profile_AtlasWnd:OnEditMissMouse( editWnd )

	if UI:GetKeyboardFocus() == editWnd:GetUiHandle() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end
	
end


--
function UI.Profile_AtlasWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end
	
	if self:GetSelMode() ~= self.modes.MODULES then
		return
	end

	self.modulesList:OnLearnBlueprint( defName )

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_AtlasWnd.layers =
{
	MAIN_EFFECT			= 0,
	SUMMARY_EFFECT		= 1,
	SUMMARY_LABEL		= 2,
	SUMMARY_CUR_VAL		= 3,
	SUMMARY_MAX_VAL		= 4,
}

UI.Profile_AtlasWnd.effectInfo =
{
	main =
	{
		modulesLocator	= "modules_list",
		shipsLocator	= "modules_list",
		summaryLocator	= "lern_progr",
	}
}

UI.Profile_AtlasWnd.ROLE_ALL = -2

UI.Profile_AtlasWnd.moduleTypes =
{
	ALL		= 1,
	WEAPON	= 2,
	ACTIVE	= 3,
	PASSIVE	= 4,
}

UI.Profile_AtlasWnd.modes =
{
	MODULES	= 1,
	SHIPS	= 2,
}

UI.Profile_AtlasWnd.NAME_FILTER_DELAY = 0.5

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_AtlasWnd.uid					= UI.INVALID_U64_ID

UI.Profile_AtlasWnd.modesWnd			= nil
UI.Profile_AtlasWnd.rolesWnd			= nil
UI.Profile_AtlasWnd.moduleTypesCB		= nil
UI.Profile_AtlasWnd.nameFilterEditWnd	= nil
UI.Profile_AtlasWnd.modulesList			= nil
UI.Profile_AtlasWnd.shipsList			= nil
UI.Profile_AtlasWnd.nameFilterTimer		= -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_AtlasWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.modesWnd			= UI.Profile_Atlas_ModesWnd
	self.rolesWnd			= UI.Profile_Atlas_RolesWnd
	self.moduleTypesCB		= UI.Profile_Atlas_ModuleTypesCB
	self.nameFilterEditWnd	= UI.Profile_Atlas_NameFilterEditWnd
	self.modulesList		= UI.Profile_Atlas_ModulesListWnd
	self.shipsList			= UI.Profile_Atlas_ShipsListWnd

	self.modulesList:UnlinkFromParent()
	self.shipsList:UnlinkFromParent()
	self.moduleTypesCB:UnlinkFromParent()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

end


--
function UI.Profile_AtlasWnd:Reset()

	self.uid = UI.INVALID_U64_ID
	self.nameFilterTimer = -1
	self.modulesList:Clear()
	self.shipsList:Clear()

end


--
function UI.Profile_AtlasWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		Profile:Save()
	end

	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.Profile_AtlasWnd:F_OnAfterShowOnScreen()

	-- вызвается ДО того, как будет вызван OnAfterShowOnScreen дочерних элементов,
	-- т.к. их размер может зависеть от размера главного окна
	self:InitLayout()
	
	self:OnAfterShowOnScreen()
	
	self:FullUpdate()

end


--
function UI.Profile_AtlasWnd:FullUpdate()

	self:UpdateSummary()

end


--
function UI.Profile_AtlasWnd:UpdateSummary()

	self:SetText( "", self.layers.SUMMARY_CUR_VAL )
	self:SetText( "", self.layers.SUMMARY_MAX_VAL )	

	local mode = self:GetSelMode()

	if mode == self.modes.MODULES then

    	local numModulesMax	= 0
    	local numModulesCur	= 0

    	local atlas = UI.ProfileWnd_new:GetAtlas()
    	if atlas then

    		if type( atlas.modules ) == "table" then

            	if type( atlas.modules.num ) == "number" then
            		numModulesMax = atlas.modules.num
            	else
            		sys.log( "UI.Profile_AtlasWnd:UpdateSummary()[ERROR]: invalid typpe of atlas.modules.num; \"number\" expected, got \"%s\"", type( atlas.modules.num ) )
            	end

            	if type( atlas.modules.lvls ) == "table" then
            		numModulesCur = UI:GetTableLength( atlas.modules.lvls )
            	else
            		sys.log( "UI.Profile_AtlasWnd:UpdateSummary()[ERROR]: invalid typpe of atlas.modules.lvls; \"table\" expected, got \"%s\"", type( atlas.modules.lvls ) )
            	end

    		else
            	sys.log( "UI.Profile_AtlasWnd:UpdateSummary()[ERROR]: invalid typpe of atlas.modules; \"table\" expected, got \"%s\"", type( atlas.modules ) )
    		end

    	end

    	self:SetText( UI:Num2StrSeparatedBy3( numModulesCur ), self.layers.SUMMARY_CUR_VAL )
    	self:SetText( UI:Num2StrSeparatedBy3( numModulesMax ), self.layers.SUMMARY_MAX_VAL )	

	elseif mode == self.modes.SHIPS then

    	local numShipsMax	= 0
    	local numShipsCur	= 0

		local allShips = self:GetShips( false )
		numShipsMax = #allShips

    	local atlas = UI.ProfileWnd_new:GetAtlas()
    	if atlas then

    		if type( atlas.vesselsProgress ) == "table" then
            	numShipsCur = UI:GetTableLength( atlas.vesselsProgress )
    		else
            	sys.log( "UI.Profile_AtlasWnd:UpdateSummary()[ERROR]: invalid typpe of atlas.vesselsProgress; \"table\" expected, got \"%s\"", type( atlas.vesselsProgress ) )
    		end

    	end

    	self:SetText( UI:Num2StrSeparatedBy3( numShipsCur ), self.layers.SUMMARY_CUR_VAL )
    	self:SetText( UI:Num2StrSeparatedBy3( numShipsMax ), self.layers.SUMMARY_MAX_VAL )

	else
		sys.log( "UI.Profile_AtlasWnd:UpdateSummary()[ERROR]: unhandled mode %d", mode )
	end

end


--
function UI.Profile_AtlasWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.moduleTypesCB:GetUiHandle() then
		self:OnFiltersChanged()
	end

end


--
function UI.Profile_AtlasWnd:InitLayout()

	if self:GetHeight() ~= 0 then
		return
	end

	-- собственный размер

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local selfBaseSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local selfHeight = UI.ProfileWnd_new:GetWorkWndAvailableHeight()

	self:SetWidth( selfBaseSize.x )
	self:SetHeight( selfHeight )


	-- позиция итогов

	local summaryBasePos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.summaryLocator ) or Vec2( 0, 0 )

	local summaryEffect = UI:GetEffectFromLayer( self, self.layers.SUMMARY_EFFECT )
	local summarySize = summaryEffect and summaryEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local space_summary_btm = selfBaseSize.y - ( summaryBasePos.y + summarySize.y )
	local summaryY = selfHeight - space_summary_btm - summarySize.y

	if summaryEffect then
		summaryEffect:SetPos( UI:Vec2( summaryBasePos.x, summaryY ) )
	end

end


--
function UI.Profile_AtlasWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

    local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.modulesList or wnd:IsChildOf( self.modulesList ) then
		self.modulesList:Scroll( ticks < 0, math.abs( ticks ) )

	elseif wnd == self.shipsList or wnd:IsChildOf( self.shipsList ) then
		self.shipsList:Scroll( ticks < 0, math.abs( ticks ) )
	end

	return true

end


--
function UI.Profile_AtlasWnd:F_OnEventSaveUiState()

	if self.uid == UI.INVALID_U64_ID then
		return
	end

	UI.store.Profile_AtlasWnd =
	{
		uid = self.uid,
	}

end


--
function UI.Profile_AtlasWnd:F_OnEventRestoreUiState()

	if UI.store.Profile_AtlasWnd then

    	self.uid = UI.store.Profile_AtlasWnd.uid

		UI.store.Profile_AtlasWnd = nil

	end

end


--
function UI.Profile_AtlasWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Profile_Atlas_ModuleSlotWnd" ) then

		if not UI.ProfileWnd_new:IsWaiting() then

    		if wnd:CanClick() then
    			self:LaunchItemCraftWnd( wnd:GetBaseDefName() )
    		end

		end

	elseif UI:IsWndKindOf( wnd, "Profile_Atlas_ShipSlotWnd" ) then

		if not UI.ProfileWnd_new:IsWaiting() then

    		if wnd:CanClick() then
				self:OnShipSlotClick( wnd:GetBaseDefName() )
    		end

		end

	end

	return true

end


--
function UI.Profile_AtlasWnd:LaunchItemCraftWnd( defName )

	local launchData =
	{
		bAtlas				= true,
		uid					= self.uid,
		profileLaunchData	= UI.ProfileWnd_new:GetLaunchData(),
	}

	UI.HangarWnd:ShowItemCraftSingle( defName, false, launchData )

end


--
function UI.Profile_AtlasWnd:OnShipSlotClick( defName )

	local shipItem = nil

	if UI:IsShipEvolving( defName ) then
		shipItem = UI:GetEvolvingShipItem( defName )
	else
		shipItem = UI:GetShipItemByDef( defName, true )
	end

	local bIsBought			= shipItem ~= nil and not shipItem.conserved	-- куплен сейчас
	local bWasBought		= shipItem ~= nil								-- покупался хоть раз
	local bDlc				= UI:IsShipDlc( defName )
	local bEvolving			= UI:IsShipEvolving( defName )
	local bCraftable		= UI:IsShipCraftable( defName )
	local bVisibleInTree	= UI:IsShipVisibleInShipsTree( defName )

	if bIsBought or not bVisibleInTree then

		local defNameToShow = defName

		if bEvolving and shipItem then
			defNameToShow = shipItem.defName
		end

		UI.HangarWnd:ShowShipPreview( defNameToShow )

	else

    	local launchData =
    	{
    		bAtlas				= true,
    		uid					= self.uid,
			restoreData			= self:GetRestoreStateData(),
			profileLaunchData	= UI.ProfileWnd_new:GetLaunchData(),
    	}

		if bCraftable then
			UI.HangarWnd:ShowShipCraft( defName, launchData )

		elseif bEvolving then

			launchData.bReturnFromEvolvingEdit = true
			UI.HangarWnd:OpenShips( defName, true, true, nil, launchData )

		else
			UI.HangarWnd:ShowShipBuyWnd( defName, launchData, true )
		end

	end

end


--
function UI.Profile_AtlasWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender == self.nameFilterEditWnd:GetUiHandle() then
		if self:IsOnScreen() then
			self.nameFilterTimer = self.NAME_FILTER_DELAY
		end
	end

end


--
function UI.Profile_AtlasWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateNameFilterTimer( dt_sys )

end


--
function UI.Profile_AtlasWnd:UpdateNameFilterTimer( dt )

	if self.nameFilterTimer ~= -1 then

		self.nameFilterTimer = self.nameFilterTimer - dt

		if self.nameFilterTimer <= 0 then

			self.nameFilterTimer = -1
			self:OnFiltersChanged()

		end

	end

end


--
function UI.Profile_AtlasWnd:OnFiltersChanged()

	self.nameFilterTimer = -1

	if self.modulesList:IsChildOf( self ) then
		self.modulesList:OnFiltersChanged()
	end
	
	if self.shipsList :IsChildOf( self ) then
		self.shipsList:OnFiltersChanged()
	end

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_RolesWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_RolesWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_RolesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Profile_Atlas_RolesWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "profile_atlas_roles",
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
function UI.Profile_Atlas_RolesWnd:GetSelRole()

	return self.selRole

end


--
function UI.Profile_Atlas_RolesWnd:SelectRole( role )

	if role == self.selRole then
		return
	end

	self.selRole = role

	self:SaveSelRole()
	self:UpdateBtnsStates()
	UI.Profile_AtlasWnd:OnSelRoleChanged()

end


--
function UI.Profile_Atlas_RolesWnd:GetRoles()

	local roles = {}

	for roleName, role in pairs( ai.ShipRoles ) do
		if role ~= ai.ShipRoles.NONE then
			table.insert( roles, role )
		end
	end

	-- сортируются в том же порядке, что и в дереве кораблей - #0081865,комм.(0359639)

	local role2SortOrder = nil

	if type( _G.ship_roles ) == "table" then

		role2SortOrder = {}

		for sortOrder, roleName in pairs( _G.ship_roles ) do

			if type( sortOrder ) == "number" and type( roleName ) == "string" then

				local role = ai.ShipRoles[ roleName ]
				if role then
					role2SortOrder[ role ] = sortOrder
				else
					sys.log( "UI.Profile_Atlas_RolesWnd:GetRoles()[ERROR]: invalid role name \"%s\" in _G.ship_roles", roleName )
				end

			else

				sys.log( "UI.Profile_Atlas_RolesWnd:GetRoles()[ERROR]: invalid format of table _G.ship_roles; <number>=<string> expected, got <%s>=<%s>", type( sortOrder ), type( roleName ) )
				role2SortOrder = nil
				break

			end

		end

		if role2SortOrder then
        	for roleName, role in pairs( ai.ShipRoles ) do
        		if role ~= ai.ShipRoles.NONE then
					if role2SortOrder[ role ] == nil then
						sys.log( "UI.Profile_Atlas_RolesWnd:GetRoles()[ERROR]: cannot find role %d(%s) in _G.ship_roles", role, roleName )
						role2SortOrder = nil
						break
					end
        		end
        	end
		end

	else
		sys.log( "UI.Profile_Atlas_RolesWnd:GetRoles()[ERROR]: invalid type of _G.ship_roles; \"table\" expected, got \"%s\"", type( _G.ship_roles ) )
	end

	if role2SortOrder then

		local function fnSort( role1, role2 )			
			local sortOrder1 = role2SortOrder[ role1 ] or -1
			local sortOrder2 = role2SortOrder[ role2 ] or -1
			return sortOrder1 < sortOrder2
		end

		table.sort( roles, fnSort )

	else
		table.sort( roles )
	end

	table.insert( roles, 1, UI.Profile_AtlasWnd.ROLE_ALL )

	return roles

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_RolesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Profile_Atlas_RolesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "checkbox_"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_RolesWnd.btns		= {}
UI.Profile_Atlas_RolesWnd.selRole	= -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_RolesWnd:Init()

	if next( self.btns ) then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	local roles = self:GetRoles()
	for idx, role in ipairs( roles ) do

    	local btn = UI:CreateChildWnd( self, UI.Profile_Atlas_RoleBtn, tostring( UI:GetTableLength( self.btns ) + 1 ) )
    	if btn then

        	UI:AddChildAndLink( self, btn, mainEffect, string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, idx ), UI.EffectAnimParams.POS )
    		btn:Init( role )
    		self.btns[ role ] = btn

		else
    		sys.log( "UI.Profile_Atlas_RolesWnd:Init()[ERROR]: cannot create btn" )
		end

	end	

	self:ValidateSelRole()

end


--
function UI.Profile_Atlas_RolesWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Init()

end


--
function UI.Profile_Atlas_RolesWnd:ValidateSelRole()

	if not self:RestoreSelRole() then
		self:SelectDefaultRole()
	end

end


--
function UI.Profile_Atlas_RolesWnd:RestoreSelRole()

	local selRole = -1

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) == "table" and type( profile.atlas.selRole ) == "string" then

		if profile.atlas.selRole == "ALL" then
			selRole = UI.Profile_AtlasWnd.ROLE_ALL
		else
			if ai.ShipRoles[ profile.atlas.selRole ] and ai.ShipRoles[ profile.atlas.selRole ] ~= ai.ShipRoles.NONE then
				selRole = ai.ShipRoles[ profile.atlas.selRole ]
			end
		end

	end

	if selRole ~= -1 then
		self:SelectRole( selRole )
		return true
	else
		return false
	end

end


--
function UI.Profile_Atlas_RolesWnd:SaveSelRole()

	if self.selRole == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) ~= "table" then
		profile.atlas = {}
	end

	local roleName = self.selRole == UI.Profile_AtlasWnd.ROLE_ALL and "ALL" or UI:Val2Key( ai.ShipRoles, self.selRole )
	profile.atlas.selRole = roleName

end


--
function UI.Profile_Atlas_RolesWnd:SelectDefaultRole()

	self:SelectRole( UI.Profile_AtlasWnd.ROLE_ALL )

end


--
function UI.Profile_Atlas_RolesWnd:UpdateBtnsStates()

	for role, btn in pairs( self.btns ) do
		btn:Check( role == self.selRole )
	end

end


--
function UI.Profile_Atlas_RolesWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Profile_Atlas_RoleBtn" ) then

		if not wnd:IsChecked() then
			self:SelectRole( wnd:GetRole() )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	end

	return true

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_RoleBtn
-- --------------------------------------------------------------

UI.Profile_Atlas_RoleBtn = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_RoleBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Profile_Atlas_RoleBtn",
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
				defName 			= "profile_atlas_roleBtn",
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
function UI.Profile_Atlas_RoleBtn:Init( role )

	self.role = role

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.Profile_Atlas_RoleBtn:GetRole()

	return self.role

end


--
function UI.Profile_Atlas_RoleBtn:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_RoleBtn.effectInfo =
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
		animationIdle 		= "check",
		animationSelect		= "check_over",
		animationPressed	= "check_over",
		animationDisabled	= "check",
	},

	icoSpriteName_unchecked	= "ico_idle",
	icoSpriteName_checked	= "ico_check",
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_RoleBtn.role			= -1
UI.Profile_Atlas_RoleBtn.tooltipData	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_RoleBtn:UpdateIco()

	local hTex_unchecked	= UI.INVALID_RESOURCE_HANDLE
	local hTex_checked		= UI.INVALID_RESOURCE_HANDLE

	if self.role == UI.Profile_AtlasWnd.ROLE_ALL then
		hTex_unchecked	= UI:GetTex( "shipRoles_ALL_filter_idle" )
		hTex_checked	= UI:GetTex( "shipRoles_ALL_filter_select" )
	else
		local roleName = UI:Val2Key( ai.ShipRoles, self.role )
		hTex_unchecked	= UI:GetTex( string.format( "shipRoles_%s_filter_idle", roleName ) )
		hTex_checked	= UI:GetTex( string.format( "shipRoles_%s_filter_select", roleName ) )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_unchecked, hTex_unchecked )
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName_checked, hTex_checked )
	end	

end


--
function UI.Profile_Atlas_RoleBtn:UpdateTooltip()

	if self.role == UI.Profile_AtlasWnd.ROLE_ALL then

    	self.tooltipData =
    	{
    		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:GetStringByName( "atlas_roles_all_tooltip_caption" ),
    		text		= UI:GetStringByName( "atlas_roles_all_tooltip_text" ),
    	}

	else

    	self.tooltipData =
    	{
    		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:Role2Str( self.role ),
    		text		= UI:GetRoleDesc( self.role ),
    	}

	end

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModuleTypesCB
-- --------------------------------------------------------------

UI.Profile_Atlas_ModuleTypesCB = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ModuleTypesCB.def =
{
	className	= "Wnd",
	prototype	= "ComboBox3",

	props =
	{
		name	= "Profile_Atlas_ModuleTypesCB"
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ModuleTypesCB:GetSelModuleType()

	local moduleType = -1

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		moduleType = self:GetRecordData( selRecordIdx ).moduleType
	end

	return moduleType
	
end


--
function UI.Profile_Atlas_ModuleTypesCB:SelectModuleType( moduleType )

	if type( moduleType ) ~= "number" then
		sys.log( "UI.Profile_Atlas_ModuleTypesCB:SelectModuleType()[ERROR]: invalid type of the 1-st parameter (\"moduleType\"), \"number\" expected, ot \"%s\"", type( moduleType ) )
		return
	end
	
	if UI:Val2Key( UI.Profile_AtlasWnd.moduleTypes, moduleType ) == "" then	
		sys.log( "UI.Profile_Atlas_ModuleTypesCB:SelectModuleType()[ERROR]: invalid moduleType %d", moduleType )
		return
	end

	local selRecordIdx = -1

	for recordIdx = 1, self:GetNumRecords() do
		if self:GetRecordData( recordIdx ).moduleType == moduleType then
			selRecordIdx = recordIdx
			break
		end
	end

	if selRecordIdx ~= -1 then
		self:SelectRecord( selRecordIdx )
	else
		sys.log( "UI.Profile_Atlas_ModuleTypesCB:SelectModuleType()[ERROR]: cannot find record for moduleType %d", moduleType )
	end
	
end


-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ModuleTypesCB:Init()

	if self:GetNumRecords() > 0 then
		return
	end

	local moduleTypesSorted = {}
	for moduleTypeName, moduleType in pairs( UI.Profile_AtlasWnd.moduleTypes ) do
		table.insert( moduleTypesSorted, moduleType )
	end
	table.sort( moduleTypesSorted )

	for idx, moduleType in ipairs( moduleTypesSorted ) do

		local moduleTypeName = UI:Val2Key( UI.Profile_AtlasWnd.moduleTypes, moduleType )
		local strId = string.format( "atlas_itemTypes_%s", moduleTypeName )

		local data =
		{
			moduleType	= moduleType,
			text		= UI:GetStringByName( strId ),
		}

		self:AddRecord( data )

	end

	self:ValidateSelModuleType()

end


--
function UI.Profile_Atlas_ModuleTypesCB:ValidateSelModuleType()

	if not self:RestoreSelModuleType() then
		self:SelectDefaultModuleType()
	end

end


--
function UI.Profile_Atlas_ModuleTypesCB:RestoreSelModuleType()

	local selModuleType = -1

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) == "table" and type( profile.atlas.selModuleType ) == "string" then
		if UI.Profile_AtlasWnd.moduleTypes[ profile.atlas.selModuleType ] then
			selModuleType = UI.Profile_AtlasWnd.moduleTypes[ profile.atlas.selModuleType ]
		end
	end

	if selModuleType ~= -1 then
		self:SelectModuleType( selModuleType )
		return true
	else
		return false
	end

end


--
function UI.Profile_Atlas_ModuleTypesCB:SaveSelModuleType()

	local selModuleType = self:GetSelModuleType()

	if selModuleType == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) ~= "table" then
		profile.atlas = {}
	end

	local selModuleTypeName = UI:Val2Key( UI.Profile_AtlasWnd.moduleTypes, selModuleType )
	profile.atlas.selModuleType = selModuleTypeName

end


--
function UI.Profile_Atlas_ModuleTypesCB:SelectDefaultModuleType()

	self:SelectModuleType( UI.Profile_AtlasWnd.moduleTypes.ALL )

end


--
function UI.Profile_Atlas_ModuleTypesCB:SelectRecord( recordIdx )

	UI.ComboBox3.SelectRecord( self, recordIdx )
	self:SaveSelModuleType()

end


--
function UI.Profile_Atlas_ModuleTypesCB:F_OnAfterShowOnScreen()

	UI.ComboBox3.F_OnAfterShowOnScreen( self )
	self:Init()

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ItemsListWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ItemsListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ItemsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "Profile_Atlas_ItemsListWnd",
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
		},		
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ItemsListWnd:GetBaseHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjSize( "self" ).y or 0

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ItemsListWnd.scrollBarPrototypeName	= "ButtonsList3Wnd_ScrollBarWnd_3"
UI.Profile_Atlas_ItemsListWnd.listStyle					= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.Profile_Atlas_ItemsListWnd.MAX_SLOTS					= 0	-- сколько окон-слотов создавать (при этом в видимую область может помещаться не кратное число слотов - см. max_slots_real, которое используется для скроллирования)
UI.Profile_Atlas_ItemsListWnd.slotEffectName			= ""

UI.Profile_Atlas_ItemsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "",
		scrollObjName		= "",
		animIdle			= "",
		minSizeLocator		= "",
		maxSizeLocator		= "",
		baseSizeLocator		= "",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ItemsListWnd.max_slots_real	= 0	-- сколько точно слотов помещается в видимую область (может помещаться не кратное число слотов)

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ItemsListWnd:F_OnAfterShowOnScreen()

	-- вызвается ДО того, как будет вызван OnAfterShowOnScreen дочерних элементов,
	-- т.к. их размер может зависеть от размера главного окна
	self:InitLayout()

	self:OnAfterShowOnScreen()

end


--
function UI.Profile_Atlas_ItemsListWnd:InitLayout()

	if self.MAX_SLOTS > 0 then
		return
	end

	if self:GetNumRecords() > 0 then
		sys.log( "UI.Profile_Atlas_ItemsListWnd:InitLayout()[ERROR]: not empty" )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	-- высота слота

	local slotHeight = 0

	local slotEffect = _G.UI_SpawnEffect( self.slotEffectName, self:GetUiHandle() )
	if slotEffect then
		slotHeight = slotEffect:GetObjSize( "self" ).y
		_G.UI_DestroyEffect( slotEffect )
	end

	self.slotHeight = slotHeight


	-- расстояние между слотами

	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	self.slotsSpace = secondSlotPos.y - firstSlotPos.y - self.slotHeight


	-- размер области слотов

	local selfBaseSize = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.baseSizeLocator ) or Vec2( 0, 0 )

	local space_slots_btm = firstSlotPos.y
	local availableHeight = self:GetAvailableHeight()
	local slotsHeight = availableHeight - firstSlotPos.y - space_slots_btm

	self.slotsRect.x = 0
	self.slotsRect.y = firstSlotPos.y
	self.slotsRect.z = selfBaseSize.x
	self.slotsRect.w = slotsHeight
	self.slotsWnd:SetRect( self.slotsRect )


	-- максимальное количество слотов

	self.max_slots_real = ( self.slotHeight + self.slotsSpace ) ~= 0 and ( slotsHeight + self.slotsSpace ) / ( self.slotHeight + self.slotsSpace ) or 0
	self.MAX_SLOTS = math.ceil( self.max_slots_real )


	-- собственный размер и анимация фона

	local selfHeight = self.slotsRect.y + self.slotsRect.w + space_slots_btm
	self:SetWidth( selfBaseSize.x )
	self:SetHeight( selfHeight )

	local minHeight = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y or 0 
	local maxHeight = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y or 0

	local animTime = ( maxHeight ~= minHeight ) and ( selfHeight - minHeight ) / ( maxHeight - minHeight ) or 0
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

	
	-- создание и позиционирование слотов

	self:InitSlots()

	local slotX = firstSlotPos.x - self.slotsWnd:GetLeft()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			slot.btn:SetLeft( slotX )
		end
	end


	-- размер скроллбара

	self.scrollBar:SetPageSize( self.max_slots_real )

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	local scrollEffectSize = scrollEffect and scrollEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local scrollPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollObjName ) or Vec2( 0, 0 )
	local scrollBaseSize = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollObjName ) or Vec2( 0, 0 )
	local scpace_scroll_btm = selfBaseSize.y - ( scrollPos.y + scrollBaseSize.y )
	local scrollHeight = selfHeight - scrollPos.y - scpace_scroll_btm

	if scrollEffect then
		scrollEffect:SetScale( UI:Vec2( 1, scrollHeight / scrollEffectSize.y ) )
	end

	self.scrollBar:SetWidth( scrollEffectSize.x )
	self.scrollBar:SetHeight( scrollHeight )

	self:UpdateScrollBarVisibility()	

end


-- для перегрузки
function UI.Profile_Atlas_ItemsListWnd:GetAvailableHeight()

	return 0

end


-- перегрузка базовой функции - ее функционал перенесен в новую функцию InitLayout()
-- (названа по другому, т.к. точки вызова из базового класса не подходят)
function UI.Profile_Atlas_ItemsListWnd:RecalcLayout()
	-- ничего
end


-- перегрузка базовой функции - настройка скроллбара перенесена в новую функцию InitLayout(), здесь только создание
function UI.Profile_Atlas_ItemsListWnd:InitScrollBar()	

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	

end


-- перегрузка базовой функции, с учетом max_slots_real
function UI.Profile_Atlas_ItemsListWnd:GetMaxScrollPos()

	if self.numRecords == 0 or self.MAX_SLOTS == 0 then
		return -1
	end

	return math.max( self.numRecords - self.max_slots_real + 1, 1 )

end


-- перегрузка базовой функции, с учетом max_slots_real
function UI.Profile_Atlas_ItemsListWnd:GetLastVisibleRecordIdx()

	if self.scrollPos == -1 then
		return -1
	end

	return UI:Clamp( math.ceil( self.scrollPos + self.max_slots_real - 1 ), 1, self.numRecords )

end


-- перегрузка базовой функции, с учетом max_slots_real
function UI.Profile_Atlas_ItemsListWnd:SetLastVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	local scrollPos = -1

	if recordIdx ~= -1 then
		scrollPos = math.max( recordIdx - self.max_slots_real + 1, 1 )
	end

	self:SetScrollPos( scrollPos, bUpdateScrollBar, bAnimated )

end


-- перегрузка базовой функции, с учетом max_slots_real
function UI.Profile_Atlas_ItemsListWnd:UpdateScrollBarVisibility()	

	local bNeedScrollBar = not self:HasListStyle( self.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED ) or self.numRecords > self.max_slots_real

	if bNeedScrollBar then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollObjName, UI.EffectAnimParams.POS )
		end

		self:UpdateScrollBarRange()
		self:UpdateScrollBarPos()

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )
	
	end

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ItemsRowWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ItemsRowWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ItemsRowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Profile_Atlas_ItemsRowWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		}
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ItemsRowWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	for idx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
	end

end


--
function UI.Profile_Atlas_ItemsRowWnd:GetSlotWnd( slotIdx )

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.Profile_Atlas_ItemsRowWnd:GetSlotWnd()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return nil
	end
	
	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.Profile_Atlas_ItemsRowWnd:GetSlotWnd()[ERROR]: cannot find slot %d", slotIdx )
		return nil
	end

	return slotWnd

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ItemsRowWnd.MAX_SLOTS			= 0
UI.Profile_Atlas_ItemsRowWnd.slotPrototypeName	= ""

UI.Profile_Atlas_ItemsRowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix = ""
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ItemsRowWnd.slots = {}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ItemsRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateControls()

end


--
function UI.Profile_Atlas_ItemsRowWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local slotProto = UI[ self.slotPrototypeName ]
	if not slotProto then
		sys.log( "UI.Profile_Atlas_ItemsRowWnd:CreateControls()[ERROR]: invalid slotPrototypeName (\"%s\")", self.slotPrototypeName )
		return
	end

	for slotIdx = 1, self.MAX_SLOTS do

		local slotWnd = UI:CreateChildWnd( self, slotProto, tostring( #self.slots + 1 ) ) 

		if slotWnd then

			table.insert( self.slots, slotWnd )

			if mainEffect then
				mainEffect:LinkWnd( slotWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
			end

		else
			sys.log( "UI.Profile_Atlas_ItemsRowWnd:CreateControls()[ERROR]: cannot create slot" )
		end

	end

end


--
function UI.Profile_Atlas_ItemsRowWnd:UpdateForData( data, bAnimated )

	self:Reset()

	for slotIdx, slotData in pairs( data.slots ) do

		local slotWnd = self.slots[ slotIdx ]

		if slotWnd then
			slotWnd:Setup( slotData )
			self:AddChild( slotWnd )
		else
			sys.log( "UI.Profile_Atlas_ItemsRowWnd:UpdateForData()[ERROR]: cannot find slot #%d", slotIdx )
		end

	end

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ItemSlotWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ItemSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ItemSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Profile_Atlas_ItemSlotWnd",
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
		}
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

-- для перегрузки
function UI.Profile_Atlas_ItemSlotWnd:Setup( data )
end


-- для перегрузки
function UI.Profile_Atlas_ItemSlotWnd:Reset()
end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ItemSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
}

-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModulesListWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ModulesListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ModulesListWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemsListWnd",

	props =
	{
		name		= "Profile_Atlas_ModulesListWnd",
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
				defName 			= "profile_atlas_modulesList",
				defaultAnimation	= "idle",
			}}
		},		
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ModulesListWnd:OnFiltersChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.MAX_SLOTS > 0 then	-- функция может быть вызвана до инициализации (если фильтр при показе атласа инициализируется раньше)
		self:FullUpdate( false )
	end

end


--
function UI.Profile_Atlas_ModulesListWnd:OnAtlasChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.MAX_SLOTS > 0 then
		self:FullUpdate( true )
	else
		sys.log( "UI.Profile_Atlas_ModulesListWnd:OnAtlasChanged()[ERROR]: not inited" )
	end

end


--
function UI.Profile_Atlas_ModulesListWnd:TryShowItem( defName )

	if not UI:IsDefModule( defName ) then
		sys.log( "UI.Profile_Atlas_ModulesListWnd:TryShowItem()[ERROR]: %s is not module", defName )
		return false
	end
	
	local baseDefName = UI:GetItemUpgradeBaseDef( defName )
	local foundRowIdx = -1 
	
	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
		
			if slotData.baseDefName == baseDefName then
				foundRowIdx = rowIdx
				break
			end
			
		end
		
		if foundRowIdx ~= -1 then
			break
		end
	
	end
	
	if foundRowIdx ~= -1 then
		self:SetScrollPos( foundRowIdx )
		return true
	else
		return false
	end

end


--
function UI.Profile_Atlas_ModulesListWnd:TryShowItemSubType( itemSubType )
	
	local foundRowIdx = -1
	local foundDefName = ""
	
	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
		
			if UI:GetItemSubType( slotData.baseDefName ) == itemSubType then
				foundRowIdx = rowIdx
				foundDefName = slotData.baseDefName
				break
			end
			
		end
		
		if foundRowIdx ~= -1 then
			break
		end
	
	end
	
	if foundRowIdx ~= -1 then
		self:SetScrollPos( foundRowIdx )
	end
	
	return foundDefName

end


--
function UI.Profile_Atlas_ModulesListWnd:OnLearnBlueprint( blueprintDefName )
	
	local craftResultDefName = UI:GetResourceCraftResult( blueprintDefName )
	local craftResultBaseDefName = UI:GetItemUpgradeBaseDef( craftResultDefName )  
	
	local foundRowIdx = -1
	local foundSlotIdx = -1
	
	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
		
			if slotData.baseDefName == craftResultBaseDefName then
				foundRowIdx = rowIdx
				foundSlotIdx = slotIdx
				break
			end
			
		end
		
		if foundRowIdx ~= -1 then
			break
		end
	
	end
	
	if foundRowIdx ~= -1 then
	
		local rowWnd = self:GetButtonForRecord( foundRowIdx )
		if rowWnd then
			local slotWnd = rowWnd:GetSlotWnd( foundSlotIdx )
			if slotWnd then
				slotWnd:OnLearnBlueprint()
			end
		end
	
	end
	
end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ModulesListWnd.btnPrototypeName		= "Profile_Atlas_ModulesRowWnd"
UI.Profile_Atlas_ModulesListWnd.scrollBarPrototypeName	= "ButtonsList3Wnd_ScrollBarWnd_3"
UI.Profile_Atlas_ModulesListWnd.slotEffectName			= "profile_atlas_moduleSlot"

UI.Profile_Atlas_ModulesListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "modules_line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
		minSizeLocator		= "min_dist",
		maxSizeLocator		= "max_dist",
		baseSizeLocator		= "self",
	}
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ModulesListWnd:FullUpdate( bRestoreScrollPos )

	if self.MAX_SLOTS == 0 then
		sys.log( "UI.Profile_Atlas_ModulesListWnd:FullUpdate()[ERROR]: not inited" )
		return
	end
	
	local scrollPos = self:GetScrollPos()

	self:Clear()

	local shopItems = self:GetShopItems()
	UI:SortShop( shopItems, false, false )

	local atlasModules = nil

	local atlas = UI.Profile_AtlasWnd:GetAtlas()
	if atlas then

		if type( atlas.modules ) == "table" then

        	if type( atlas.modules.lvls ) == "table" then
        		atlasModules = atlas.modules.lvls
        	else
        		sys.log( "UI.Profile_Atlas_ModulesListWnd:FullUpdate()[ERROR]: invalid typpe of atlas.modules.lvls; \"table\" expected, got \"%s\"", type( atlas.modules.lvls ) )
        	end

		else
        	sys.log( "UI.Profile_Atlas_ModulesListWnd:FullUpdate()[ERROR]: invalid typpe of atlas.modules; \"table\" expected, got \"%s\"", type( atlas.modules ) )
		end

	end

	local rowData		= { slots = {} }
	local numSlotsInRow	= 0

	for idx, shopItem in ipairs( shopItems ) do

		local atlasId = UI:GetItemAtlasId( shopItem.defName )

		local level = -1

		if atlasModules then
			if atlasModules[ atlasId ] ~= nil then
				if type( atlasModules[ atlasId ] ) == "number" then
					level = atlasModules[ atlasId ]
				else
					sys.log( "UI.Profile_Atlas_ModulesListWnd:FullUpdate()[ERROR]: invalid format of atlas.modules.lvls[%d]; \"number\" or \"nil\" expected, got \"%s\"", atlasId, type( atlasModules[ atlasId ] ) )
				end
			end
		end

		local slotData =
		{
			baseDefName	= shopItem.defName,
			bUnlocked	= level ~= -1,
			curLevel	= level,
		}			

		if numSlotsInRow >= UI.Profile_Atlas_ModulesRowWnd.MAX_SLOTS then
			self:AddRecord( rowData )
			rowData = { slots = {} }
			numSlotsInRow= 0	
		end

		table.insert( rowData.slots, slotData )			
		numSlotsInRow = numSlotsInRow + 1

	end

	if next( rowData.slots ) then
		self:AddRecord( rowData )
	end
	
	if bRestoreScrollPos and scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end

end


--
function UI.Profile_Atlas_ModulesListWnd:GetShopItems()

	local shopItems = {}

	local selRole			= UI.Profile_AtlasWnd:GetSelRole()
	local selRoleShipClass	= ( selRole ~= -1 and selRole ~= UI.Profile_AtlasWnd.ROLE_ALL ) and UI:GetRoleShipClass( selRole ) or -1
	local selModuleType		= UI.Profile_AtlasWnd:GetSelModuleType()
	local nameFilter		= UI.Profile_AtlasWnd:GetNameFilter()

	if selRole == -1 or selModuleType == -1 then
		return shopItems
	end

	local moduleTypeConvertMap =
	{
		[ ai.ModuleType.WEAPON ]		= UI.Profile_AtlasWnd.moduleTypes.WEAPON,
		[ ai.ModuleType.ACTIVE ]		= UI.Profile_AtlasWnd.moduleTypes.ACTIVE,
		[ ai.ModuleType.ENGINE_MOD ]	= UI.Profile_AtlasWnd.moduleTypes.PASSIVE,
		[ ai.ModuleType.CAPACITOR_MOD ]	= UI.Profile_AtlasWnd.moduleTypes.PASSIVE,
		[ ai.ModuleType.SHIELD_MOD ]	= UI.Profile_AtlasWnd.moduleTypes.PASSIVE,
		[ ai.ModuleType.ARMOR_MOD ]		= UI.Profile_AtlasWnd.moduleTypes.PASSIVE,
		[ ai.ModuleType.CPU_MOD ]		= UI.Profile_AtlasWnd.moduleTypes.PASSIVE,
	}

	for idx, shopItem in pairs( UI.serverData.shop ) do

		local bFit = true

		-- только модулм

		if bFit then
    		if shopItem.type ~= _G.GameStore.ItemType.IT_MODULE then
    			bFit = false
    		end
		end

		-- показывается только первый деф в цепочке апгрейда

		if bFit then
			if UI:GetItemUpgradePrevDef( shopItem.defName ) ~= "" then
				bFit = false
			end
		end
		
		-- показываютя только модули, у которых в дефе прописан is_atlas_entity
		
		if bFit then
			if not UI:IsItemVisibleInAtlas( shopItem.defName ) then
				bFit = false
			end
		end

		-- показываются только модули, у которых есть atlasId

		if bFit then
			if UI:GetItemAtlasId( shopItem.defName ) == -1 then
				bFit = false
			end
		end

		-- фильтр по роли
		-- правила фильтрации по роли здесь: #0085777

		if bFit then

			if selRole ~= UI.Profile_AtlasWnd.ROLE_ALL then

				local itemRole = UI:GetItemRole( shopItem.defName )
				if itemRole ~= -1 and itemRole ~= selRole then
					bFit = false
				end
				
				-- проверка типа корабля, т.к. он связан с ролью
				
				if bFit then
					if selRoleShipClass ~= -1 then
						if not UI:IsItemFitForShipClass( shopItem.defName, selRoleShipClass ) then
							bFit = false
						end
					end
				end

			end

		end

		-- фильтр по типу модуля

		if bFit then
		
			if selModuleType ~= UI.Profile_AtlasWnd.moduleTypes.ALL then
			
				local globalModuleType = UI:GetModuleType( shopItem.defName )
				local localModuleType = globalModuleType and moduleTypeConvertMap[ globalModuleType ]
				
				if not localModuleType or localModuleType ~= selModuleType then
					bFit = false
				end
				
			end
			
		end
		
		-- фильтр по имени
		
		if bFit then

			if nameFilter ~= "" then

				local itemName = UI:GetEntityLocalizedNameByDef( shopItem.defName, false )
				local itemName_low = _G.Utf8CaseFold_Transform( itemName )

				if not string.find( itemName_low, nameFilter, 1, true ) then
					bFit = false
				end

			end

		end

		-- ок, добавление
		
		if bFit then
			table.insert( shopItems, shopItem )
		end

	end

	return shopItems

end


--
function UI.Profile_Atlas_ModulesListWnd:F_OnAfterShowOnScreen()

	UI.Profile_Atlas_ItemsListWnd.F_OnAfterShowOnScreen( self )

	self:FullUpdate( false )

end


-- перегрузка базовой функции
function UI.Profile_Atlas_ModulesListWnd:GetAvailableHeight()

	return UI.Profile_AtlasWnd:GetModulesListAvailableHeight()

end

-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModulesRowWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ModulesRowWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ModulesRowWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemsRowWnd",

	props =
	{
		name		= "Profile_Atlas_ModulesRowWnd",
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
				defName 			= "profile_atlas_modulesRow",
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

-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ModulesRowWnd.MAX_SLOTS			= 7
UI.Profile_Atlas_ModulesRowWnd.slotPrototypeName	= "Profile_Atlas_ModuleSlotWnd"

UI.Profile_Atlas_ModulesRowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix = "module_slot_"
	}
}

-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModuleSlotWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ModuleSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ModuleSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemSlotWnd",

	props =
	{
		name		= "Profile_Atlas_ModuleSlotWnd",
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
				defName 			= "profile_atlas_moduleSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "bg",	
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.COLOR_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bg_2",
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.COLOR_FRAME_MAXED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "decor",
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.COLOR_FRAME_MAXED_DECOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "module_ico",	
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lvl",	
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "over1",
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				
					{
						objName		= "bg_3",
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.INFLUENCE_COLOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},
		
		-- INFLUENCE_COLOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_influenceColor",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_ico",
				defaultAnimation	= "idle",
			}}
		},
		
		-- COLOR_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_colorBg",
				defaultAnimation	= "idle",
			}}
		},
		
		-- COLOR_FRAME_MAXED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_colorBgMaxed",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "text",
						layer		= "UI.Profile_Atlas_ModuleSlotWnd.layers.LEVEL_MAXED",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},
		
		-- COLOR_FRAME_MAXED_DECOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_colorBgMaxed_flash",
				defaultAnimation	= "idle",
			}}
		},
			
		-- LEVEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- LEVEL_MAXED
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "profile_atlas_moduleSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ModuleSlotWnd:Setup( data )

	self:Reset()	

	self.baseDefName	= data.baseDefName
	self.bUnlocked		= data.bUnlocked
	self.curLevel		= data.curLevel	-- это не порядковый уровень (от 1 до количество_уровней), а который прописан в current_upgade_level и соответствует марку; этого уровня может не быть (-1), если предмет не апгрейдится

	if self.bUnlocked and self.curLevel ~= -1 then
		self.defNameToShow = UI:GetItemUpgradeDefForLevel( self.baseDefName, self.curLevel, true ) -- #0097990 - в атласе могут показываться и уровни улучшения, которые на данный момент уже отсутствуют
	else
		self.defNameToShow = self.baseDefName
	end

	self:FullUpdate()

end


--
function UI.Profile_Atlas_ModuleSlotWnd:Reset()

	self.baseDefName	= ""
	self.bUnlocked		= false
	self.curLevel		= -1
	self.defNameToShow	= ""
	self.tooltipData	= nil

	self:SetLayerVisible( true, self.layers.COLOR_FRAME_EFFECT )
	
	self:SetLayerVisible( false, self.layers.COLOR_FRAME_MAXED_EFFECT )
	self:SetLayerVisible( false, self.layers.COLOR_FRAME_MAXED_DECOR_EFFECT )
	self:SetLayerVisible( false, self.layers.LEVEL )
	self:SetLayerVisible( false, self.layers.LEVEL_MAXED )
	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )
	
	local colorBgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME_EFFECT )
	if colorBgEffect then
		colorBgEffect:StartAnimation( self.effectInfo.colorBg.animLocked )
		colorBgEffect:SetColor( UI.WHITE_COLOR )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	
	self:SetMouseOver( false )

end


--
function UI.Profile_Atlas_ModuleSlotWnd:GetBaseDefName()

	return self.baseDefName

end


--
function UI.Profile_Atlas_ModuleSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Profile_Atlas_ModuleSlotWnd:CanClick()

	return
		UI.Profile_AtlasWnd:GetUid() == UI:GetLocalPlayerUid()
		and _G.GetCurrentGameMode() == ai.Gameplay.NONE
		and not UI.DebriefingWnd:IsOnScreen()
		and not UI.DebriefingOWWnd:IsOnScreen()

end


--
function UI.Profile_Atlas_ModuleSlotWnd:OnLearnBlueprint()

	self:UpdateColorFrame()
	self:UpdateLevel()

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ModuleSlotWnd.layers =
{
	MAIN_EFFECT						= 0,
	INFLUENCE_COLOR_EFFECT			= 1,
	ICO_EFFECT						= 2,
	COLOR_FRAME_EFFECT				= 3,
	COLOR_FRAME_MAXED_EFFECT		= 4,
	COLOR_FRAME_MAXED_DECOR_EFFECT	= 5,
	LEVEL							= 6,
	LEVEL_MAXED						= 7,
	MOUSE_OVER_EFFECT				= 8,
}

UI.Profile_Atlas_ModuleSlotWnd.effectInfo =
{
	main =
	{
		colorLevelGrayLocator	= "lvl_olor",
	},

	colorBg =
	{
		animLocked		= "not_purch",
		animUnlocked	= "idle",
	},

	ico =
	{
		spriteName	= "objectName332",
	}
}

UI.Profile_Atlas_ModuleSlotWnd.colors =
{
	[ 0 ] = 0xffa8a8a8,		-- mk0,		серый
	[ 1 ] = 0xffcccccc,		-- mk1,		белый
	[ 2 ] = 0xffcccccc,		-- mk2,		белый
	[ 4 ] = 0xffe5ce33,		-- Premium,	желтый
	[ 6 ] = 0xff219e61,		-- Rare,	зеленый
	[ 3 ] = 0xff3799e6,		-- mk3,		синий
	[ 7 ] = 0xff764fd0,		-- Epic,	фиолетовый
	[ 5 ] = 0xffdf8423,		-- Relic,	оранжевый
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ModuleSlotWnd.baseDefName		= ""
UI.Profile_Atlas_ModuleSlotWnd.bUnlocked		= false
UI.Profile_Atlas_ModuleSlotWnd.curLevel			= -1

UI.Profile_Atlas_ModuleSlotWnd.defNameToShow	= ""
UI.Profile_Atlas_ModuleSlotWnd.tooltipData		= nil
UI.Profile_Atlas_ModuleSlotWnd.colorLevelGray	= 0xff555555

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ModuleSlotWnd:F_PostLoad()

	UI.Profile_Atlas_ItemSlotWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.colorLevelGray = mainEffect:GetObjColor( self.effectInfo.main.colorLevelGrayLocator )
	end

end


--
function UI.Profile_Atlas_ModuleSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateColorFrame()
	self:UpdateInfluenceColor()
	self:UpdateLevel()
	self:UpdateTooltip()
	self:UpdateMouseOver()

end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateIco()

	-- текстура

	local hTex = UI:GetShopIco2( self.defNameToShow )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

	-- залоченное состояние - иконка превращается в черный силуэт

	local color	= self.bUnlocked and UI.WHITE_COLOR or 0x8C000000

	if icoEffect then
		icoEffect:SetColor( color )
		icoEffect:SetAlpha( UI:GetAlpha( color ) )
	end

end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateColorFrame()

	local bMaxed = false
	
	if self.bUnlocked then
    	bMaxed = self.curLevel == -1 or self.curLevel >= UI:GetItemUpgradeMaxLevel( self.baseDefName )
	end

	local color = self:GetItemQualityColor()
	
	if bMaxed then
	
		self:SetLayerVisible( false, self.layers.COLOR_FRAME_EFFECT )
		
		self:SetLayerVisible( true, self.layers.COLOR_FRAME_MAXED_EFFECT )
		self:SetLayerVisible( true, self.layers.COLOR_FRAME_MAXED_DECOR_EFFECT )
	
		local colorBgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME_MAXED_EFFECT )
		if colorBgEffect then
			colorBgEffect:SetColor( color )
		end

	else
	
		self:SetLayerVisible( false, self.layers.COLOR_FRAME_MAXED_EFFECT )
		self:SetLayerVisible( false, self.layers.COLOR_FRAME_MAXED_DECOR_EFFECT )
	
		self:SetLayerVisible( true, self.layers.COLOR_FRAME_EFFECT )
		
		local anim = self.bUnlocked and self.effectInfo.colorBg.animUnlocked or self.effectInfo.colorBg.animLocked
	
		local colorBgEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME_EFFECT )
		if colorBgEffect then
			colorBgEffect:SetColor( color )
			colorBgEffect:StartAnimation( anim )
		end

	end

end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateInfluenceColor()

	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )

	if self.bUnlocked then

		local color = UI:GetItemInfluenceColor( self.defNameToShow )
		if color then
		
			self:SetLayerVisible( true, self.layers.INFLUENCE_COLOR_EFFECT )
			
			local influenceColorEffect = UI:GetEffectFromLayer( self, self.layers.INFLUENCE_COLOR_EFFECT )
			if influenceColorEffect then
				influenceColorEffect:SetColor( color )
			end
			
		end
		
	end
	
end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateLevel()

	self:SetLayerVisible( false, self.layers.LEVEL )
	self:SetLayerVisible( false, self.layers.LEVEL_MAXED )

	local numLevels_sequential = 1

	local minLevel	= UI:GetItemUpgradeMinLevel( self.baseDefName )
	local maxLevel 	= UI:GetItemUpgradeMaxLevel( self.baseDefName )

	if minLevel ~= -1 and maxLevel ~= -1 then
		numLevels_sequential = maxLevel - minLevel + 1
	end

	if self.bUnlocked then
	
		local bMaxLevel = self.curLevel == -1 or self.curLevel >= maxLevel
		if bMaxLevel then
		
			-- #0086835,комм.(0389022) - для максимально прокачанных модулей пишется только одна цифра уровня, белым цветом
			local str = tostring( math.max( numLevels_sequential, self.curLevel ) )	-- #0097990 - в аласе может быть зафиксирован уровень выше, чем есть сейчас
			self:SetText( str, self.layers.LEVEL_MAXED )
			self:SetLayerVisible( true, self.layers.LEVEL_MAXED )
		
		else
			
			-- отображается число порядкового уровня (от 1 до количество_уровней), а не того, который прописан в поле current_upgade_level и связан с марком - #0081865,комм.(0359840),
			-- а цвет отображается не для порядкового уровня, а для того, который связан с марком - #0081865,комм.(0360002)
		
			local level_sequential = self.curLevel - minLevel + 1
			local color = self:GetItemQualityColor()
			
			local str = string.format( "%s%d%s|%d", UI:Color2Str( color ), level_sequential, UI:Color2Str( self.colorLevelGray ), numLevels_sequential )
			self:SetText( str, self.layers.LEVEL )
			self:SetLayerVisible( true, self.layers.LEVEL )
			
		end
		
	else
	
		-- для залоченных предметов вместо текущего уровня пишется 0 (#0081865,комм.(0359840)),
		-- цифра текущего уровня цветом не выделяется (комм.(0360002))
		local str = string.format( "%s0|%d", UI:Color2Str( self.colorLevelGray ), numLevels_sequential )
		self:SetText( str, self.layers.LEVEL )
		self:SetLayerVisible( true, self.layers.LEVEL )
		
	end

end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType = UI.tooltipTypes.MODULE,
		defName		= self.defNameToShow,
	}

end


--
function UI.Profile_Atlas_ModuleSlotWnd:GetItemQualityColor()

	local quality = UI:GetItemQuality( self.defNameToShow )

	if quality == -1 then
		quality = UI.MK1_QUALITY
	end

	local color = self.colors[ quality ]
	if color == nil then
		sys.log( "UI.Profile_Atlas_ModuleSlotWnd:GetItemQualityColor()[ERROR]: cannot find color for quality %d", quality )
		color = UI.WHITE_COLOR
	end

	return color

end


--
function UI.Profile_Atlas_ModuleSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self:CanClick() then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Profile_Atlas_ModuleSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Profile_Atlas_ModuleSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Profile_Atlas_ModuleSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Profile_Atlas_ModuleSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ShipsListWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ShipsListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ShipsListWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemsListWnd",

	props =
	{
		name		= "Profile_Atlas_ShipsListWnd",
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
				defName 			= "profile_atlas_shipsList",
				defaultAnimation	= "idle",
			}}
		},		
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ShipsListWnd:OnFiltersChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.MAX_SLOTS > 0 then	-- функция может быть вызвана до инициализации (если фильтр при показе атласа инициализируется раньше)
		self:FullUpdate( false )
	end

end


--
function UI.Profile_Atlas_ShipsListWnd:OnAtlasChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.MAX_SLOTS > 0 then
		self:FullUpdate( true )
	else
		sys.log( "UI.Profile_Atlas_ShipsListWnd:OnAtlasChanged()[ERROR]: not inited" )
	end

end


--
function UI.Profile_Atlas_ShipsListWnd:TryShowItem( defName )

	if not UI:IsDefShip( defName ) then
		sys.log( "UI.Profile_Atlas_ShipsListWnd:TryShowItem()[ERROR]: %s is not ship", defName )
		return false
	end

	local baseDefName = UI:IsShipEvolving( defName ) and UI:GetEvolvingShipBaseDef( defName ) or defName
	local foundRowIdx = -1 
	
	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
		
			if slotData.baseDefName == baseDefName then
				foundRowIdx = rowIdx
				break
			end
			
		end
	
	end
	
	if foundRowIdx ~= -1 then
		self:SetScrollPos( foundRowIdx )
		return true
	else
		return false
	end

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ShipsListWnd.btnPrototypeName			= "Profile_Atlas_ShipsRowWnd"
UI.Profile_Atlas_ShipsListWnd.scrollBarPrototypeName	= "ButtonsList3Wnd_ScrollBarWnd_3"
UI.Profile_Atlas_ShipsListWnd.slotEffectName			= "profile_atlas_shipSlot"

UI.Profile_Atlas_ShipsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "ship_line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
		minSizeLocator		= "min_dist",
		maxSizeLocator		= "max_dist",
		baseSizeLocator		= "self",
	}
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ShipsListWnd:FullUpdate( bRestoreScrollPos )

	if self.MAX_SLOTS == 0 then
		sys.log( "UI.Profile_Atlas_ShipsListWnd:FullUpdate()[ERROR]: not inited" )
		return
	end
	
	local scrollPos = self:GetScrollPos()

	self:Clear()

	local allShips = UI.Profile_AtlasWnd:GetShips( true )
	if not next( allShips ) then
		return
	end

	local allShipsInfo = {}
	for idx, defName in pairs( allShips ) do

		local shipInfo =
		{
			defName				= defName,
			bEvolving			= UI:IsShipEvolving( defName ),			
			localizedNameLow	= _G.Utf8CaseFold_Transform( UI:GetEntityLocalizedNameByDef( defName ) ),
			rank				= -1,
			role				= -1,
			race				= -1,
		}

		if not shipInfo.bEvolving then
			shipInfo.rank	= UI:GetShipRank( defName )
			shipInfo.role	= UI:GetItemRole( defName )
			shipInfo.race	= UI:GetShipRace( defName )
		end

		table.insert( allShipsInfo, shipInfo )

	end

	local rolesSorted = UI.Profile_AtlasWnd:GetRoles()
	local role2SortOrder = {}
	for idx, role in pairs( rolesSorted ) do
		role2SortOrder[ role ] = idx
	end

	local racesSorted = UI:GetRaces()
	local race2SortOrder = {}
	for idx, race in pairs( racesSorted ) do
		race2SortOrder[ race ] = idx
	end

	local function fnSort( shipInfo1, shipInfo2 )

		-- вначале незеленые корабли по рангам от меньшего к большему (внутри ранга по ролям, затем по расам, затем по алфавиту)
		-- потом зеленые корабли по алфавиту.

		if shipInfo1.bEvolving ~= shipInfo2.bEvolving then
			return not shipInfo1.bEvolving
		else
			if shipInfo1.bEvolving then
				return shipInfo1.localizedNameLow < shipInfo2.localizedNameLow
			else
				if shipInfo1.rank ~= shipInfo2.rank then
					return shipInfo1.rank < shipInfo2.rank
				else
					if shipInfo1.role ~= shipInfo2.role then
						local roleSortOrder1 = role2SortOrder[ shipInfo1.role ] or -1
						local roleSortOrder2 = role2SortOrder[ shipInfo2.role ] or -1
						return roleSortOrder1 < roleSortOrder2
					else
						if shipInfo1.race ~= shipInfo2.race then
							local raceSortOrder1 = race2SortOrder[ shipInfo1.race ] or -1
							local raceSortOrder2 = race2SortOrder[ shipInfo2.race ] or -1
							return raceSortOrder1 < raceSortOrder2							
						else
							return shipInfo1.localizedNameLow < shipInfo2.localizedNameLow
						end
					end
				end
			end
		end

	end

	table.sort( allShipsInfo, fnSort )


	local atlasShips = nil

	local atlas = UI.Profile_AtlasWnd:GetAtlas()
	if atlas then
		if type( atlas.vesselsProgress ) == "table" then
        	atlasShips = atlas.vesselsProgress
		else
        	sys.log( "UI.Profile_Atlas_ShipsListWnd:FullUpdate()[ERROR]: invalid typpe of atlas.vesselsProgress; \"table\" expected, got \"%s\"", type( atlas.vesselsProgress ) )
		end
	end

	local rowData		= { slots = {} }
	local numSlotsInRow	= 0

	for idx, shipInfo in ipairs( allShipsInfo ) do

		local progress = -1

		if atlasShips then
			if atlasShips[ shipInfo.defName ] ~= nil then
				if type( atlasShips[ shipInfo.defName ] ) == "number" then
					progress = atlasShips[ shipInfo.defName ]
				else
    				sys.log( "UI.Profile_Atlas_ShipsListWnd:FullUpdate()[ERROR]: invalid format of atlas.vesselsProgress[%s]; \"number\" or \"nil\" expected, got \"%s\"", shipInfo.defName, type( atlasShips[ shipInfo.defName ] ) )
				end
			end
		end

		local slotData =
		{
			baseDefName	= shipInfo.defName,
			bUnlocked	= progress ~= -1,
			progress	= progress,
		}			

		if numSlotsInRow >= UI.Profile_Atlas_ShipsRowWnd.MAX_SLOTS then
			self:AddRecord( rowData )
			rowData = { slots = {} }
			numSlotsInRow= 0	
		end

		table.insert( rowData.slots, slotData )			
		numSlotsInRow = numSlotsInRow + 1

	end

	if next( rowData.slots ) then
		self:AddRecord( rowData )
	end
	
	if bRestoreScrollPos and scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end

end


--
function UI.Profile_Atlas_ShipsListWnd:F_OnAfterShowOnScreen()

	UI.Profile_Atlas_ItemsListWnd.F_OnAfterShowOnScreen( self )

	self:FullUpdate( false )

end


-- перегрузка базовой функции
function UI.Profile_Atlas_ShipsListWnd:GetAvailableHeight()

	return UI.Profile_AtlasWnd:GetShipsListAvailableHeight()

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ShipsRowWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ShipsRowWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ShipsRowWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemsRowWnd",

	props =
	{
		name		= "Profile_Atlas_ShipsRowWnd",
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
				defName 			= "profile_atlas_shipsRow",
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

-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ShipsRowWnd.MAX_SLOTS			= 3
UI.Profile_Atlas_ShipsRowWnd.slotPrototypeName	= "Profile_Atlas_ShipSlotWnd"

UI.Profile_Atlas_ShipsRowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix = "ship_slot_"
	}
}

-- --------------------------------------------------------------
-- UI.Profile_Atlas_ShipSlotWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ShipSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ShipSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Profile_Atlas_ItemSlotWnd",

	props =
	{
		name		= "Profile_Atlas_ShipSlotWnd",
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
				defName 			= "profile_atlas_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "bg",	
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.PREMIUM_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_ico",	
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lvl2",	
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "name",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.NAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bg_2",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.COLOR_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bg_2_1",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.MAXED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PREMIUM_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_goldBg",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_ico",
				defaultAnimation	= "idle",
			}}
		},
		
		-- COLOR_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_colorFrame",
				defaultAnimation	= "idle",
			}}
		},
		
		-- MAXED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_maxed",
				defaultAnimation	= "idle",
			}}
		},

		-- RACE_ROLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipRole_big_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "role_ico",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.ROLE_EFFECT",
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
				defName 			= "hud_objectsMark_specIco_1080",
				defaultAnimation	= "white",
			}}
		},
			
		-- LEVEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_name",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "name",
						layer		= "UI.Profile_Atlas_ShipSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "profile_atlas_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Profile_Atlas_ShipSlotWnd:Setup( data )

	self:Reset()	

	self.baseDefName	= data.baseDefName
	self.bUnlocked		= data.bUnlocked
	self.progress		= data.progress

	if self.bUnlocked and UI.Profile_AtlasWnd:GetUid() == UI:GetLocalPlayerUid() then

		local shipItem = nil

		if UI:IsShipEvolving( self.baseDefName ) then
			shipItem = UI:GetEvolvingShipItem( self.baseDefName )
		else
			shipItem = UI:GetShipItemByDef( self.baseDefName, true )
		end

		if shipItem then
			self.vid			= shipItem.vid
			self.defNameToShow	= shipItem.defName
		else
			sys.log( "UI.Profile_Atlas_ShipSlotWnd:Setup()[ERROR]: cannot find ship item for %s", self.baseDefName )
		end

	end

	if self.defNameToShow == "" then
		self.defNameToShow = self.baseDefName
	end
	
	if UI:IsShipEvolving( self.baseDefName ) then
	
		local nodes = UI:GetEvolvingShipNodes( self.baseDefName )
		
		for nodeName, node in pairs( nodes ) do
			if not UI:CantBeBoughtEvolvingShipNode( nodeName ) and not UI:IsEvolvingShipNodeHidden( nodeName, true, self.baseDefName, nodes ) then
				self.progressMax = self.progressMax + 1
			end
		end
		
	else	
		self.progressMax = UI:GetShipMaxLevel( self.baseDefName )
	end	

	self:FullUpdate()

end


--
function UI.Profile_Atlas_ShipSlotWnd:Reset()

	self.baseDefName	= ""
	self.bUnlocked		= false
	self.progress		= -1
	self.defNameToShow	= ""
	self.vid			= UI.INVALID_U64_ID
	self.progressMax	= 0
	self.tooltipData	= nil

	self:SetLayerVisible( false, self.layers.PREMIUM_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.LEVEL )
	self:SetLayerVisible( false, self.layers.COLOR_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.MAXED_EFFECT )

	self:SetText( "", self.layers.NAME )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local raceRoleEffect = UI:GetEffectFromLayer( self, self.layers.RACE_ROLE_EFFECT )
	if raceRoleEffect then
		raceRoleEffect:SetSpriteTexture( self.effectInfo.raceRole.raceSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if roleEffect then
		roleEffect:SetSpriteTexture( self.effectInfo.role.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetMouseOver( false )

end


--
function UI.Profile_Atlas_ShipSlotWnd:GetBaseDefName()

	return self.baseDefName

end


--
function UI.Profile_Atlas_ShipSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Profile_Atlas_ShipSlotWnd:CanClick()

	return
		UI.Profile_AtlasWnd:GetUid() == UI:GetLocalPlayerUid()
		and _G.GetCurrentGameMode() == ai.Gameplay.NONE
		and not UI.DebriefingWnd:IsOnScreen()
		and not UI.DebriefingOWWnd:IsOnScreen()

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ShipSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    PREMIUM_BG_EFFECT	= 1,
    ICO_EFFECT			= 2,
	COLOR_FRAME_EFFECT	= 3,
	MAXED_EFFECT		= 4,
    RACE_ROLE_EFFECT	= 5,
    ROLE_EFFECT			= 6,
    LEVEL				= 7,
	NAME_EFFECT			= 8,
    NAME				= 9,
	MOUSE_OVER_EFFECT	= 10,
}

UI.Profile_Atlas_ShipSlotWnd.effectInfo =
{
	main =
	{
		colorCurLevelLocator	= "lvl2",
		colorMaxLevelLocator	= "lvl2_color",
		raceLocator				= "role",
	},

	raceRole =
	{
		raceSpriteName	= "race_ico9"
	},

	role =
	{
		spriteName = "ico"
	},

	ico =
	{
		spriteName = "objectName332",
	},

	name =
	{
		animLocked		= "disable",
		animUnlocked	= "idle",
	},
	
	maxed =
	{
		raceLocator	= "role1",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ShipSlotWnd.baseDefName	= ""
UI.Profile_Atlas_ShipSlotWnd.bUnlocked		= false
UI.Profile_Atlas_ShipSlotWnd.progress		= -1
UI.Profile_Atlas_ShipSlotWnd.defNameToShow	= ""
UI.Profile_Atlas_ShipSlotWnd.vid			= UI.INVALID_U64_ID
UI.Profile_Atlas_ShipSlotWnd.progressMax	= 0
UI.Profile_Atlas_ShipSlotWnd.tooltipData	= nil
UI.Profile_Atlas_ShipSlotWnd.colorCurLevel	= UI.WHITE_COLOR
UI.Profile_Atlas_ShipSlotWnd.colorMaxLevel	= UI.WHITE_COLOR

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ShipSlotWnd:F_PostLoad()

	UI.Profile_Atlas_ItemSlotWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.colorCurLevel	= mainEffect:GetObjColor( self.effectInfo.main.colorCurLevelLocator )
		self.colorMaxLevel	= mainEffect:GetObjColor( self.effectInfo.main.colorMaxLevelLocator )
	end	

end


--
function UI.Profile_Atlas_ShipSlotWnd:FullUpdate()
	
	self:UpdatePremiumBg()
	self:UpdateIco()
	self:UpdateColorFrame()
	self:UpdateRace()
	self:UpdateRole()
	self:UpdateProgress()
	self:UpdateName()
	self:UpdateTooltip()
	self:UpdateMouseOver()
	
end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdatePremiumBg()

	local bGold = UI:IsShipPremium( self.baseDefName )
	self:SetLayerVisible( bGold, self.layers.PREMIUM_BG_EFFECT )
	
end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateIco()

	-- текстура

	local hTex = UI:GetShipAtlasIco( self.defNameToShow )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

	-- залоченное состояние - иконка превращается в черный силуэт

	local color	= self.bUnlocked and UI.WHITE_COLOR or 0x8C000000

	if icoEffect then
		icoEffect:SetColor( color )
		icoEffect:SetAlpha( UI:GetAlpha( color ) )
	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateColorFrame()
	
	if self.bUnlocked and self.progress >= self.progressMax then
	
		self:SetLayerVisible( true, self.layers.COLOR_FRAME_EFFECT )
		self:SetLayerVisible( true, self.layers.MAXED_EFFECT )
		
		local bAltColor = not UI:IsShipEvolving( self.baseDefName )
		local color = UI:GetItemColor( self.baseDefName, false, bAltColor )
		
		local frameEffect = UI:GetEffectFromLayer( self, self.layers.COLOR_FRAME_EFFECT )
		if frameEffect then
			frameEffect:SetColor( color )
		end
	
	else
		self:SetLayerVisible( false, self.layers.COLOR_FRAME_EFFECT )
		self:SetLayerVisible( false, self.layers.MAXED_EFFECT )
	end
	
end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateRace()

	local race = UI:GetShipRace( self.baseDefName )
	local raceName = UI:Val2Key( ai.Race, race )

	local texName = string.format( "shipRole_bg_%s", raceName )
	local hTex = UI:GetTex( texName )

	local raceRoleEffect = UI:GetEffectFromLayer( self, self.layers.RACE_ROLE_EFFECT )
	if raceRoleEffect then
		raceRoleEffect:SetSpriteTexture( self.effectInfo.raceRole.raceSpriteName, hTex )
	end
	
	-- позиция
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local maxedEffect = UI:GetEffectFromLayer( self, self.layers.MAXED_EFFECT )
	
	if mainEffect and maxedEffect then
	
		if self.bUnlocked and self.progress >= self.progressMax then
			mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.RACE_ROLE_EFFECT, "" )
			maxedEffect:LinkLayer( self:GetUiHandle(), self.layers.RACE_ROLE_EFFECT, self.effectInfo.maxed.raceLocator, UI.EffectAnimParams.POS )
		else
			maxedEffect:UnlinkLayer( self:GetUiHandle(), self.layers.RACE_ROLE_EFFECT, "" )
			mainEffect:LinkLayer( self:GetUiHandle(), self.layers.RACE_ROLE_EFFECT, self.effectInfo.main.raceLocator, UI.EffectAnimParams.POS )
		end
		
	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateRole()

	local role = UI:GetItemRole( self.baseDefName )

	local hTex = UI:GetRoleIco( role )
	local color = UI:GetItemColor( self.baseDefName, false )

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if roleEffect then
		roleEffect:SetSpriteTexture( self.effectInfo.role.spriteName, hTex )
		roleEffect:SetColor( color )
	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateProgress()

	self:SetLayerVisible( false, self.layers.LEVEL )

	if UI:IsShipEvolving( self.baseDefName ) then
	
		local numNodesMax = self.progressMax

		local numNodesLearned = 0
		if self.bUnlocked then
			numNodesLearned = self.progress
		end

		if numNodesLearned < numNodesMax then
			self:SetLayerVisible( true, self.layers.LEVEL )
			local str = string.format( "%s%s%s#|%d", UI:Color2Str( self.colorCurLevel ), numNodesLearned, UI:Color2Str( self.colorMaxLevel ), numNodesMax )
			self:SetText( str, self.layers.LEVEL )
		end

	else

		local maxLevel = UI:GetShipMaxLevel( self.baseDefName )

		local curLevel = 0
		if self.bUnlocked then
			curLevel = self.progress
		end

		if curLevel < maxLevel then
			self:SetLayerVisible( true, self.layers.LEVEL )
			local str = string.format( "%s%s%s#|%d", UI:Color2Str( self.colorCurLevel ), curLevel, UI:Color2Str( self.colorMaxLevel ), maxLevel )
			self:SetText( str, self.layers.LEVEL )
		end

	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateName()

	local str = UI:GetEntityLocalizedNameByDef( self.defNameToShow, false )
	self:SetText( str, self.layers.NAME )

	local color = UI:GetItemColor( self.baseDefName )
	self:SetColor( color, self.layers.NAME )

	local anim = self.bUnlocked and self.effectInfo.name.animUnlocked or self.effectInfo.name.animLocked
	local nameEffect = UI:GetEffectFromLayer( self, self.layers.NAME_EFFECT )
	if nameEffect then
		nameEffect:StartAnimation( anim )
	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.SHIP,
		defName		= self.defNameToShow,
		vid			= self.vid,
	}

end


--
function UI.Profile_Atlas_ShipSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self:CanClick() then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Profile_Atlas_ShipSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Profile_Atlas_ShipSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Profile_Atlas_ShipSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Profile_Atlas_ShipSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModesWnd
-- --------------------------------------------------------------

UI.Profile_Atlas_ModesWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Profile_Atlas_ModesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Profile_Atlas_ModesWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "profile_atlas_modes",
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
function UI.Profile_Atlas_ModesWnd:GetSelMode()

	return self.selMode

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ModesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Profile_Atlas_ModesWnd.effectInfo =
{
	main =
	{
		btnLocatorPrefix	= "checkbox_",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ModesWnd.btns		= {}
UI.Profile_Atlas_ModesWnd.selMode	= -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ModesWnd:Init()

	if next( self.btns ) then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local modesSorted = {}
	for modeName, mode in pairs( UI.Profile_AtlasWnd.modes ) do
		table.insert( modesSorted, mode )
	end
	table.sort( modesSorted )

	for idx, mode in pairs( modesSorted ) do

		local btn = UI:CreateChildWnd( self, UI.Profile_Atlas_ModeBtn, tostring( UI:GetTableLength( self.btns ) + 1 ) )
		if btn then

			UI:AddChildAndLink( self, btn, mainEffect, string.format( "%s%d", self.effectInfo.main.btnLocatorPrefix, idx ), UI.EffectAnimParams.POS )
			btn:Init( mode )
			self.btns[ mode ] = btn

		end

	end

	self:ValidateSelMode()

end


--
function UI.Profile_Atlas_ModesWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Init()

end


--
function UI.Profile_Atlas_ModesWnd:ValidateSelMode()

	if not self:RestoreSelMode() then
		self:SelectDefaultMode()
	end

end


--
function UI.Profile_Atlas_ModesWnd:RestoreSelMode()

	local selMode = -1

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) == "table" and type( profile.atlas.selMode ) == "string" then
		if UI.Profile_AtlasWnd.modes[ profile.atlas.selMode ] then
			selMode = UI.Profile_AtlasWnd.modes[ profile.atlas.selMode ]
		end
	end

	if selMode ~= -1 then
		self:SelectMode( selMode )
		return true
	else
		return false
	end

end


--
function UI.Profile_Atlas_ModesWnd:SaveSelMode()

	if self.selMode == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) ~= "table" then
		profile.atlas = {}
	end

	local modeName = UI:Val2Key( UI.Profile_AtlasWnd.modes, self.selMode )
	profile.atlas.selMode = modeName

end


--
function UI.Profile_Atlas_ModesWnd:SelectDefaultMode()

	self:SelectMode( UI.Profile_AtlasWnd.modes.MODULES )

end


--
function UI.Profile_Atlas_ModesWnd:SelectMode( mode )

	if mode == self.selMode then
		return
	end

	self.selMode = mode

	self:SaveSelMode()
	self:UpdateBtnsStates()
	UI.Profile_AtlasWnd:OnSelModeChanged()

end


--
function UI.Profile_Atlas_ModesWnd:UpdateBtnsStates()

	for mode, btn in pairs( self.btns ) do
		btn:Check( mode == self.selMode )
	end

end


--
function UI.Profile_Atlas_ModesWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Profile_Atlas_ModeBtn" ) then

		if not wnd:IsChecked() then
			self:SelectMode( wnd:GetMode() )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	end

	return true

end


-- --------------------------------------------------------------
-- UI.Profile_Atlas_ModeBtn
-- --------------------------------------------------------------

UI.Profile_Atlas_ModeBtn = {}

-- ---------------------------
-- window definition
-- ---------------------------

--
UI.Profile_Atlas_ModeBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

--
UI.Profile_Atlas_ModeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Profile_Atlas_ModeBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Profile_Atlas_ModeBtn.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "profile_atlas_modeBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Profile_Atlas_ModeBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= UI.Profile_Atlas_ModeBtn.layers.TEXT,

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
function UI.Profile_Atlas_ModeBtn:Init( mode )

	self.mode = mode
	self:UpdateText()

end


--
function UI.Profile_Atlas_ModeBtn:GetMode()

	return self.mode

end


-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_ModeBtn.effectInfo =
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
		animationIdle 		= "check",
		animationSelect		= "check_over",
		animationPressed	= "check_over",
		animationDisabled	= "check",
	},
}


-- ---------------------------
-- vars
-- ---------------------------

UI.Profile_Atlas_ModeBtn.mode = -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_ModeBtn:UpdateText()

	local modeName = UI:Val2Key( UI.Profile_AtlasWnd.modes, self.mode )
	local str = UI:GetStringByName( string.format( "atlas_mode_%s", modeName ) )
	self:SetText( str, self.layers.TEXT )

end


-- -------------------------------------------------------------------
-- UI.Profile_Atlas_NameFilterEditWnd
-- -------------------------------------------------------------------

UI.Profile_Atlas_NameFilterEditWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

--
UI.Profile_Atlas_NameFilterEditWnd.layers =
{
    MAIN_EFFECT		= 0,
    SELECTION		= 1,
    TEXT			= 2,
    CURSOR			= 3,
	DUMMY_TEXT		= 4,
}

--
UI.Profile_Atlas_NameFilterEditWnd.def =
{
	className	= "EditWnd",
	prototype	= "EffectEditWnd",

	props =
	{
		name			= "Profile_Atlas_NameFilterEditWnd",
		symbolsLimit	= 12,
		editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL,
		activationOrder	= -1,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Profile_Atlas_NameFilterEditWnd.layers ),
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "profile_atlas_nameFilterEdit",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "simple_color2",
						layer		= "UI.Profile_Atlas_NameFilterEditWnd.layers.DUMMY_TEXT",
						animParams	= UI.EffectAnimParams.COLOR,
					},

				}
			}}			
		},
		
		-- DUMMY_TEXT
		{
			id				= UI.Profile_Atlas_NameFilterEditWnd.layers.DUMMY_TEXT,
			
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "atlas_nameFilter" ),
		},

	}
}

-- ---------------------------
-- const
-- ---------------------------

UI.Profile_Atlas_NameFilterEditWnd.effectInfo =
{
	main =
	{
		textObjName				= "text\\",
		selectionColorObjName	= "select_color",
		cursorColorObjName		= "cursor",
		animActive				= "select",
		animInactive			= "idle",
		animDisabled			= "daseble",
	}
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Profile_Atlas_NameFilterEditWnd:F_PostLoad()

	UI.EffectEditWnd.F_PostLoad( self )
	
	local textRect = self:GetLayerRect( self.layers.TEXT )
	self:SetLayerRect( textRect, self.layers.DUMMY_TEXT )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
	
end


--
function UI.Profile_Atlas_NameFilterEditWnd:RestoreText()

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) == "table" and type( profile.atlas.nameFilterText ) == "string" then
		self:SetEditText( profile.atlas.nameFilterText )
		return true
	end

	return false

end


--
function UI.Profile_Atlas_NameFilterEditWnd:SaveText()

	local profile = _G.GetProfileTable()

	if type( profile.atlas ) ~= "table" then
		profile.atlas = {}
	end
	
	profile.atlas.nameFilterText = self:GetEditText()

end


--
function UI.Profile_Atlas_NameFilterEditWnd:F_OnAfterShowOnScreen()

	UI.EffectEditWnd.F_OnAfterShowOnScreen( self )
	
	if not self:RestoreText() then
		self:SetEditText( "" )
	end

end


--
function UI.Profile_Atlas_NameFilterEditWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender ~= self:GetUiHandle() then
		return
	end
	
	self:SaveText()
	self:UpdateDummyText()

end


--
function UI.Profile_Atlas_NameFilterEditWnd:UpdateDummyText()

	local bVisible = self:GetEditText() == "" and UI:GetKeyboardFocus() ~= self:GetUiHandle()
	self:SetLayerVisible( bVisible, self.layers.DUMMY_TEXT )

end



--
function UI.Profile_Atlas_NameFilterEditWnd:F_OnObtainKeyboardFocus()

	UI.EffectEditWnd.F_OnObtainKeyboardFocus( self )
	
	self:UpdateDummyText()

end


--
function UI.Profile_Atlas_NameFilterEditWnd:F_OnLostKeyboardFocus()

	UI.EffectEditWnd.F_OnLostKeyboardFocus( self )
	
	self:UpdateDummyText()

end