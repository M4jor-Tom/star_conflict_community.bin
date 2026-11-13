-- ------------------------------------------------------------
-- UI.MarketingWnd
-- ------------------------------------------------------------

UI.MarketingWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.MarketingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "MarketingWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= 0,
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
				defName 			= "marketing_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.MarketingWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bookmarks",
						wnd			= "UI.Marketing_TabsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Marketing_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_action",
						wnd			= "UI.Marketing_ActionsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_bundle",
						wnd			= "UI.Marketing_BundlesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_bundle",
						wnd			= "UI.Marketing_VouchersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_premium",
						wnd			= "UI.Marketing_LicensesWnd",
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
		},
	},

	children =
	{
		"UI.Marketing_CrossBtn",
		"UI.Marketing_TabsListWnd",
		"UI.Marketing_ActionsWnd",
		"UI.Marketing_BundlesWnd",
		"UI.Marketing_VouchersWnd",
		"UI.Marketing_LicensesWnd",
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.MarketingWnd:SetMode( mode )

	if type( mode ) ~= "number" then
		sys.log( "UI.MarketingWnd:SetMode()[ERROR]: invalid type of the 1-st parameter (\"mode\"); \"number\" expected, got \"%s\"", type( mode ) )
		return
	end

	if mode ~= -1 and UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.MarketingWnd:SetMode()[ERROR]: invalid mode %d", mode )
		return
	end

	if mode == self.mode then
		return
	end

	if mode ~= -1 and not self:IsOnScreen() then
		self.modeToSet = mode
		return
	end

	if mode ~= -1 then

    	local bAvailable = false

    	for idx, availableMode in pairs( self.availableModes ) do
    		if availableMode == mode then
    			bAvailable = true
    			break
    		end		
    	end

    	if not bAvailable then
    		sys.log( "UI.MarketingWnd:SetMode()[ERROR]: mode %s is not currently available", UI:Val2Key( self.modes, mode ) )
    		return
    	end

	end

	local newWorkWnd = nil

	if mode ~= -1 then

		newWorkWnd = self:GetWorkWndForMode( mode )

		if not newWorkWnd then
			sys.log( "UI.MarketingWnd:SetMode()[ERROR]: no work wnd for mode %d", mode )
			return
		end

	end


	self.mode = mode

	if self.workWnd then
		self.workWnd:UnlinkFromParent()
	end

	self.workWnd = newWorkWnd
	self:AddChild( self.workWnd )

	self:UpdateForMode()

end


--
function UI.MarketingWnd:GetMode()

	return self.mode

end


--
function UI.MarketingWnd:Mode2Str( mode )

	local str = ""

	if type( mode ) ~= "number" then
		sys.log( "UI.MarketingWnd:Mode2Str()[ERROR]: invalid type of the 1-st parameter (\"mode\"); \"number\" expected, got \"%s\"", type( mode ) )
		return str
	end

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.MarketingWnd:Mode2Str()[ERROR]: invalid mode %d", mode )
		return str
	end

	if mode == self.modes.ACTIONS then
		str = UI:GetStringByName( "hangar_saleadvert_btn_text" )

	elseif mode == self.modes.BUNDLES then
		str = UI:GetStringByName( "bundles_caption" )

	elseif mode == self.modes.VOUCHERS then
		str = UI:GetStringByName( "vouchers_caption" )

	elseif mode == self.modes.LICENSES then
		str = UI:GetStringByName( "licenses_caption" )

	else
		sys.log( "UI.MarketingWnd:Mode2Str()[ERROR]: unhandled mode %d", mode )
	end

	return str

end


--
function UI.MarketingWnd:SetLaunchData( launchData )

	if not self:IsOnScreen() then
		sys.log( "UI.MarketingWnd:SetLaunchData()[ERROR]: not on screen" )
		return
	end

	if launchData ~= nil then
		if type( launchData ) ~= "table" then
			sys.log( "UI.MarketingWnd:SetLaunchData()[ERROR]: invalid type of the 1-st parameter (\"launchData\"); \"table\" or \"nil\" expected, got \"%s\"", type( launchData ) )
			return
		end
	end

	self.launchData = launchData	

end


--
function UI.MarketingWnd:GetLaunchData()

	return self.launchData

end


--
function UI.MarketingWnd:OpenFreeBundle()

	if not self:IsOnScreen() then
		sys.log( "UI.MarketingWnd:OpenFreeBundle()[ERROR]: not on screen" )
		return
	end

	if self.mode ~= self.modes.BUNDLES then
		self:SetMode( self.modes.BUNDLES )
	end

	UI.Marketing_BundlesWnd:OpenFreeBundle()

end


--
function UI.MarketingWnd:OpenBundle( defName )

	if not self:IsOnScreen() then
		sys.log( "UI.MarketingWnd:OpenBundle()[ERROR]: not on screen" )
		return
	end

	if self.mode ~= self.modes.BUNDLES then
		self:SetMode( self.modes.BUNDLES )
	end

	UI.Marketing_BundlesWnd:OpenBundle( defName )

end


--
function UI.MarketingWnd:OpenAction( actionId )

	if not self:IsOnScreen() then
		sys.log( "UI.MarketingWnd:OpenAction()[ERROR]: not on screen" )
		return
	end

	if self.mode ~= self.modes.ACTIONS then
		self:SetMode( self.modes.ACTIONS )
	end

	UI.Marketing_ActionsWnd:OpenAction( actionId )

end


--
function UI.MarketingWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Marketing_LicensesWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Marketing_VouchersWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if self:IsOnScreen() then
    	if result == 0 then
			UI.Marketing_TabsListWnd:OnAccountAuras( UI.serverData.unlockingAccountAurasChanged )
    	end
	end

end


--
function UI.MarketingWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Marketing_VouchersWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if self:IsOnScreen() then
    	if result == 0 then
			UI.Marketing_TabsListWnd:OnAccountAuras( UI.serverData.unlockingAccountAurasChanged )
    	end
	end

end


--
function UI.MarketingWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Marketing_VouchersWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if self:IsOnScreen() then
    	if result == 0 then
			UI.Marketing_TabsListWnd:OnAccountAuras( UI.serverData.unlockingAccountAurasChanged )
    	end
	end

end


--
function UI.MarketingWnd:GameStore_OnSpoiled( result, requestId )

	UI.Marketing_BundlesWnd:GameStore_OnSpoiled( result, requestId )

end


--
function UI.MarketingWnd:GameStore_OnLoadingComplete( storeSize )

	UI.Marketing_BundlesWnd:GameStore_OnLoadingComplete( storeSize )
	UI.Marketing_LicensesWnd:GameStore_OnLoadingComplete( storeSize )

	if self:IsOnScreen() then
		UI.Marketing_TabsListWnd:OnLoadingComplete()
	end

end


--
function UI.MarketingWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	UI.Marketing_BundlesWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

end


--
function UI.MarketingWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Marketing_BundlesWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.MarketingWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:MasterServer_OnNotification( notification, params )

	UI.Marketing_BundlesWnd:MasterServer_OnNotification( notification, params )

	if self:IsOnScreen() then
		if notification == _G.MasterServer.ServerNotification.SN_ITEM_PURCHASED then
			self:CheckTwinkleVouchersTabOnBuyItem( params )
		end
	end

end


--
function UI.MarketingWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	UI.Marketing_BundlesWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.MarketingWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	UI.Marketing_BundlesWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	UI.Marketing_BundlesWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

end


--
function UI.MarketingWnd:OnSaleAdvertLoaded()

	if not self:IsOnScreen() then
		return
	end

	local oldMode = self.mode

	self:UpdateAvailableModes()
	self:UpdateTabs()
	self:ValidateSelMode()

	if self.mode == self.modes.ACTIONS and self.mode == oldMode then
		UI.Marketing_ActionsWnd:OnSaleAdvertLoaded()
	end

end


--
function UI.MarketingWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )

	UI.Marketing_LicensesWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )

end


--
function UI.MarketingWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )

	UI.Marketing_LicensesWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )
	
end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.MarketingWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.MarketingWnd.effectInfo =
{
	main =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
	}
}

UI.MarketingWnd.modes =
{
	ACTIONS		= 1,
	BUNDLES		= 2,
	LICENSES	= 3,
	VOUCHERS	= 4,
}

UI.MarketingWnd.sounds =
{	
	tabSelect	= UI.sounds.btnClick,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.MarketingWnd.minHeight			= 0
UI.MarketingWnd.maxHeight			= 0
UI.MarketingWnd.mode				= -1
UI.MarketingWnd.availableModes		= {}
UI.MarketingWnd.workWnd				= nil
UI.MarketingWnd.modeToSet			= nil
UI.MarketingWnd.launchData			= nil
UI.MarketingWnd.launchDataToSet		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.MarketingWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()

	UI.Marketing_ActionsWnd:UnlinkFromParent()
	UI.Marketing_BundlesWnd:UnlinkFromParent()
	UI.Marketing_VouchersWnd:UnlinkFromParent()
	UI.Marketing_LicensesWnd:UnlinkFromParent()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.MarketingWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfMinSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local selfMaxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )

	self.minHeight	= selfMinSize.y
	self.maxHeight	= selfMaxSize.y

	self:SetWidth( selfMaxSize.x )
	
end


--
function UI.MarketingWnd:RecalcLayoutForCurResolution()

	-- собственная высота

	local selfY			= self:GetTop()
	local bottomPanelY	= UI.HangarWnd:GetBottomPanelY()

	local selfHeight = bottomPanelY - selfY
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


--
function UI.MarketingWnd:Reset()

	self:SetMode( -1 )

	self.availableModes	= {}
	UI.Marketing_TabsListWnd:Clear()

end


--
function UI.MarketingWnd:FullUpdate()

	self:Reset()

	if self.launchDataToSet then
		self.launchData = self.launchDataToSet
		self.launchDataToSet = nil
	end

	self:UpdateAvailableModes()
	self:UpdateTabs()

	local mode = -1

	if self.modeToSet ~= nil then
		mode = self.modeToSet
		self.modeToSet = nil
	else
		mode = self.availableModes[ 1 ] or -1
	end

	if mode ~= -1 then
		self:SetMode( mode )
	end

end


--
function UI.MarketingWnd:UpdateAvailableModes()

	self.availableModes = {}

	for modeName, mode in pairs( self.modes ) do

		local bFit = true

		if mode == self.modes.ACTIONS then
        	if not UI.SaleAdvert:IsLoaded() or UI.SaleAdvert:GetNumData() == 0 then
				bFit = false
        	end
		end

		if bFit then
			table.insert( self.availableModes, mode )
		end

	end

	table.sort( self.availableModes )

end


--
function UI.MarketingWnd:UpdateTabs()

	UI.Marketing_TabsListWnd:Clear()

	for idx, mode in ipairs( self.availableModes ) do
		local data = { mode = mode }
		UI.Marketing_TabsListWnd:AddRecord( data )
	end

	self:UpdateSelTab()

end


--
function UI.MarketingWnd:UpdateSelTab()

	local recordIdx = self:GetTabForMode( self.mode )
	UI.Marketing_TabsListWnd:SelectRecord( recordIdx )

end


--
function UI.MarketingWnd:UpdateForMode()

	self:UpdateCaption()
	self:UpdateSelTab()

    if self.mode == self.modes.VOUCHERS then
		self:TwinkleVouchersTab( false )
	end

end


--
function UI.MarketingWnd:UpdateCaption()

	local str = ""

	if self.mode ~= -1 then
		str = self:Mode2Str( self.mode )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.MarketingWnd:GetWorkWndForMode( mode )

	if mode == self.modes.ACTIONS then
		return UI.Marketing_ActionsWnd

	elseif mode == self.modes.BUNDLES then
		return UI.Marketing_BundlesWnd

	elseif mode == self.modes.VOUCHERS then
		return UI.Marketing_VouchersWnd

	elseif mode == self.modes.LICENSES then
		return UI.Marketing_LicensesWnd

	else
		sys.log( "UI.MarketingWnd:GetWorkWndForMode()[ERROR]: unhandled mode %d", mode )
		return nil
	end

end


--
function UI.MarketingWnd:GetTabForMode( mode )

	local modeRecordIdx = -1

	if mode ~= -1 then

    	for recordIdx = 1, UI.Marketing_TabsListWnd:GetNumRecords() do

    		local data = UI.Marketing_TabsListWnd:GetRecordData( recordIdx )
    		if data.mode == mode then

    			modeRecordIdx = recordIdx
    			break

    		end
    	end

	end

	return modeRecordIdx

end


--
function UI.MarketingWnd:ValidateSelMode()

	local selMode = self.mode

	if selMode ~= -1 then

    	local bFound = false

    	for idx, mode in pairs( self.availableModes ) do
			if mode == selMode then
				bFound = true	
				break
			end
    	end

		if not bFound then
			selMode = -1
		end

	end

	if selMode == -1 then
		if next( self.availableModes ) then
			selMode = self.availableModes[ 1 ]
		end
	end

	self:SetMode( selMode )

end


--
function UI.MarketingWnd:F_OnAfterShowOnScreen()

	-- вызвается ДО того, как будет вызван OnAfterShowOnScreen дочерних элементов,
	-- т.к. их размер может зависеть от размера главного окна
	self:RecalcLayoutForCurResolution()

	self:OnAfterShowOnScreen()

	self.launchData = nil

	self:FullUpdate()

end


--
function UI.MarketingWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.MarketingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Marketing_CrossBtn then
		self:Close( true )

	elseif UI:IsWndKindOf( wnd, "Marketing_TabSlotWnd" ) then

		local mode = wnd:GetRecordData().mode
		if mode ~= self.mode then

			self:SetMode( mode )
			UI:PlayGlobalSound( self.sounds.tabSelect )

    		if mode == self.modes.ACTIONS then
    			UI.SaleAdvert:SetAlreadyShow()
    		end
			
		end

	end

	return true

end


--
function UI.MarketingWnd:HandleEscape()

	self:Close( true )
	return true	

end


--
function UI.MarketingWnd:Close( bSound )

	UI.HangarWnd:HideMarketingWnd( bSound and self.launchData == nil )

	if self.launchData then

		if self.launchData.bItemCraftMulti == true then

			UI.HangarWnd:ShowItemCraftMulti( self.launchData.itemCraftLaunchData, self.launchData.dataToRestore )

		elseif self.launchData.bItemCraftSingle == true then

			if type( self.launchData.itemDefName ) == "string" then
				UI.HangarWnd:ShowItemCraftSingle( self.launchData.itemDefName, self.launchData.bEnchanted, self.launchData.itemCraftLaunchData, nil, self.launchData.dataToRestore )
			else
				sys.log( "UI.MarketingWnd:Close()[ERROR]: invalid type of launchData.itemDefName for itemcraft data mode; \"string\" expected, got \"%s\"", type( self.launchData.itemDefName ) )
			end

    	elseif self.launchData.bEvolvingShipCraftWnd then

			if type( self.launchData.shipDefName ) == "string" then

				UI.HangarWnd:OpenShips( self.launchData.shipDefName, true, self.launchData.bEvolvingEdit, self.launchData.evolvingEditParams, self.launchData.shipsTreeLaunchData )

				if UI.HangarWnd:GetMenuTab() == UI.HangarWnd.menuTabs.SHIPS then

					if type( self.launchData.craftWndTableName ) == "string" then

    					local craftWnd = UI:GetValByName( self.launchData.craftWndTableName )
						if craftWnd then
    						craftWnd:Setup( self.launchData.shipDefName )
    						craftWnd:Show()
						else
							sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid craftWndTableName=%s for bEvolvingShipCraftWnd data mode", self.launchData.craftWndTableName )
						end

					else
						sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.craftWndTableName for bEvolvingShipCraftWnd data mode; \"string\" expected, got \"%s\"", type( self.launchData.craftWndTableName ) )
					end

				else
					sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: cannot show ships tree right now" )
				end				

			else
				sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.shipDefName for bEvolvingShipCraftWnd data mode; \"string\" expected, got \"%s\"", type( self.launchData.shipDefName ) )
			end

		elseif self.launchData.bGameplayPveMap == true then

			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, bSound, false )

			if type( self.launchData.mode ) == "number" then
				if UI.GameplayPveMapWnd:GetMode() ~= self.launchData.mode then
					UI.GameplayPveMapWnd:SetMode( self.launchData.mode )
				end
			else
				sys.log( "UI.MarketingWnd:Close()[ERROR]: invalid type of launchData.mode for bGameplayPveMap data mode; \"number\" expected, got \"%s\"", type( self.launchData.mode ) )
			end

			if self.launchData.questId ~= nil then
				if type( self.launchData.questId ) == "number" then
					if type( self.launchData.questType ) == "number" then
						UI.GameplayPveMapWnd:ShowQuest( self.launchData.questId, self.launchData.questType )
					else
						sys.log( "UI.MarketingWnd:Close()[ERROR]: invalid type of launchData.questType for bGameplayPveMap data mode; \"number\" expected, got \"%s\"", type( self.launchData.questType ) )
					end
				else
					sys.log( "UI.MarketingWnd:Close()[ERROR]: invalid type of launchData.questId for bGameplayPveMap data mode; \"number\" or \"nil\" expected, got \"%s\"", type( self.launchData.questId ) )
				end
			end

		else
			sys.log( "UI.MarketingWnd:Close()[ERROR]: unhandled type of launch data" )
		end

	end

end


--
function UI.MarketingWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end
	
	UI.store.MarketingWnd =
	{
		mode		= self.mode,
		launchData	= self.launchData,
	}

end


--
function UI.MarketingWnd:F_OnEventRestoreUiState()

	if UI.store.MarketingWnd then

		if UI.store.MarketingWnd.launchData then
			if self:IsOnScreen() then
				self.launchData = UI.store.MarketingWnd.launchData
			else
				self.launchDataToSet = UI.store.MarketingWnd.launchData
			end
		end

		if UI.store.MarketingWnd.mode ~= -1 then
			self:SetMode( UI.store.MarketingWnd.mode )
		end

		UI.store.MarketingWnd = nil

	end

end


--
function UI.MarketingWnd:CheckTwinkleVouchersTabOnBuyItem( ntfParams )

	if self.mode == self.modes.VOUCHERS then
		return
	end

	local bundleItems = UI:GetBundleItemsFromNotification( ntfParams, false )
	if not next( bundleItems ) then
		return
	end

	for idx, item in pairs( bundleItems ) do

		if item.type == ai.BundleContent.ACCOUNT_AURA and UI:IsAccountAuraVoucher( item.defName ) then

			self:TwinkleVouchersTab( true )
			break

		end

	end

end


--
function UI.MarketingWnd:TwinkleVouchersTab( bTwinkle )

	local vouchersTabRecordIdx = self:GetTabForMode( self.modes.VOUCHERS )
	if vouchersTabRecordIdx ~= -1 then

		local vouchersTabBtn = UI.Marketing_TabsListWnd:GetButtonForRecord( vouchersTabRecordIdx )
		if vouchersTabBtn then
			vouchersTabBtn:Twinkle( bTwinkle )
		end

	end

end


-- ------------------------------------------------------------
-- UI.Marketing_TabsListWnd
-- ------------------------------------------------------------

UI.Marketing_TabsListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_TabsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Marketing_TabsListWnd",
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
				defName 			= "marketing_tabsList",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_TabsListWnd:OnAccountAuras( unlockingAccountAurasChanged )

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnAccountAuras( unlockingAccountAurasChanged )
		end

	end

end


--
function UI.Marketing_TabsListWnd:OnLoadingComplete()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnLoadingComplete()
		end

	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Marketing_TabsListWnd.btnPrototypeName	= "Marketing_TabSlotWnd"
UI.Marketing_TabsListWnd.MAX_SLOTS			= 4
UI.Marketing_TabsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.Marketing_TabsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- ------------------------------------------------------------
-- UI.Marketing_TabSlotWnd
-- ------------------------------------------------------------

UI.Marketing_TabSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_TabSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Marketing_TabSlotWnd",
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
				defName 			= "marketing_tabSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.Marketing_TabSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title30",
						layer		= "UI.Marketing_TabSlotWnd.layers.NUM_ITEMS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NUM_ITEMS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}	
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_TabSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.anim_unsel )
	end

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.NUM_ITEMS )

end


--
function UI.Marketing_TabSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, false, false )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


--
function UI.Marketing_TabSlotWnd:OnAccountAuras( unlockingAccountAurasChanged )

	local data = self:GetRecordData()

	if data.mode == UI.MarketingWnd.modes.BUNDLES then

		if unlockingAccountAurasChanged then
			self:UpdateNumItems( data )
		end

	elseif data.mode == UI.MarketingWnd.modes.VOUCHERS then

		self:UpdateNumItems( data )

	end

end


--
function UI.Marketing_TabSlotWnd:OnLoadingComplete()

	local data = self:GetRecordData()

	if data.mode == UI.MarketingWnd.modes.BUNDLES then
		self:UpdateNumItems( data )
	end

end


--
function UI.Marketing_TabSlotWnd:Twinkle( bTwinkle )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if not mainEffect then
		return
	end

	if bTwinkle then
		mainEffect:StartAnimation( self.effectInfo.main.anim_twinkle )
	else
		if mainEffect:GetCurAnimation() == self.effectInfo.main.anim_twinkle then
			mainEffect:StopAnimation()
			self:UpdateMainAnimation( self:GetRecordData() )
		end
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Marketing_TabSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    NUM_ITEMS			= 2,
    MOUSE_OVER_EFFECT	= 3,
}

UI.Marketing_TabSlotWnd.effectInfo =
{
	main =
	{
		anim_unsel				= "idle",
		anim_unsel_mouseOver	= "over",
		anim_sel				= "select",
		anim_sel_mouseOver		= "select",
		anim_twinkle			= "blink",
	}
}

UI.Marketing_TabSlotWnd.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_TabSlotWnd.bMouseOver	= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Marketing_TabSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateName( data )
	self:UpdateNumItems( data )

end


--
function UI.Marketing_TabSlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if not mainEffect then
		return
	end

	if mainEffect:GetCurAnimation() ~= self.effectInfo.main.anim_twinkle then

    	local anim = ""

    	if self:IsSelected() then
    		anim = self.bMouseOver and self.effectInfo.main.anim_sel_mouseOver or self.effectInfo.main.anim_sel
    	else
    		anim = self.bMouseOver and self.effectInfo.main.anim_unsel_mouseOver or self.effectInfo.main.anim_unsel
    	end

		mainEffect:StartAnimation( anim )

	end

end


--
function UI.Marketing_TabSlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) then
		self:UpdateMainAnimation( self:GetRecordData() )
	end

end


--
function UI.Marketing_TabSlotWnd:UpdateName( data )

	local str = UI.MarketingWnd:Mode2Str( data.mode )
	self:SetText( str, self.layers.NAME )
	
end


--
function UI.Marketing_TabSlotWnd:UpdateNumItems( data )

	local str = ""

	if data.mode == UI.MarketingWnd.modes.ACTIONS then
		local numItems = UI.SaleAdvert:GetNumData()
		str = UI:Num2StrSeparatedBy3( numItems )

	elseif data.mode == UI.MarketingWnd.modes.BUNDLES then
		local numItems = #UI.Marketing_BundlesWnd:GetBundles()
		str = UI:Num2StrSeparatedBy3( numItems )

	elseif data.mode == UI.MarketingWnd.modes.VOUCHERS then
		local numItems = #UI.Marketing_VouchersWnd:GetVouchers()
		str = UI:Num2StrSeparatedBy3( numItems )

	elseif data.mode == UI.MarketingWnd.modes.LICENSES then
		-- ничего

	else
		sys.log( "UI.Marketing_TabSlotWnd:UpdateNumItems()[ERROR]: unhandled mode %d", data.mode )
	end

	self:SetText( str, self.layers.NUM_ITEMS )

end


--
function UI.Marketing_TabSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.Marketing_TabSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Marketing_TabSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.bMouseOver
	self.bMouseOver = bMouseOver

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Marketing_TabSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Marketing_TabSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ------------------------------------------------------------
-- UI.Marketing_CrossBtn
-- ------------------------------------------------------------

UI.Marketing_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn3_720",

    	props =
    	{
    		name = "Marketing_CrossBtn"
    	}
	}
}