-- ------------------------------------------------------------
-- UI.Marketing_BundlesWnd
-- ------------------------------------------------------------

UI.Marketing_BundlesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.Marketing_BundlesWnd.layers =
{
	MAIN_EFFECT	= 0,
	WAIT_EFFECT	= 1,
	WAIT_TEXT	= 2,
}


--
UI.Marketing_BundlesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_BundlesWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		firstOverlayLayer = UI.Marketing_BundlesWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "marketing_bundles_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "bundle_list2",
						wnd			= "UI.Marketing_Bundles_BundlesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "info1",
						wnd			= "UI.Marketing_Bundles_SelBundleWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.Marketing_BundlesWnd.layers.WAIT_EFFECT",
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
						layer		= "UI.Marketing_BundlesWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		},
	},

	children =
	{
		"UI.Marketing_Bundles_BundlesListWnd",
		"UI.Marketing_Bundles_SelBundleWnd",
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_BundlesWnd:OpenFreeBundle()

	if not self:IsOnScreen() then
		sys.log( "UI.Marketing_BundlesWnd:OpenFreeBundle()[ERROR]: not on screen" )
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OpenFreeBundle()

end


--
function UI.Marketing_BundlesWnd:OpenBundle( defName )

	if not self:IsOnScreen() then
		sys.log( "UI.Marketing_BundlesWnd:OpenBundle()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.Marketing_BundlesWnd:OpenBundle()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.Marketing_BundlesWnd:OpenBundle()[ERROR]: empty bundle def name" )
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:TryOpenBundle( defName )

	if UI.Marketing_Bundles_BundlesListWnd:GetSelBundle() ~= defName then
		sys.log( "UI.Marketing_BundlesWnd:OpenBundle()[ERROR]: cannot open \"%s\"", defName )
	end

end


--
function UI.Marketing_BundlesWnd:GetBundles()

	local bundles = {}

	for defName, item in pairs( UI.serverData.shopByDef ) do

		if UI:IsItemVisibleInBundlesWnd( item ) then
			table.insert( bundles, item )
		end

	end

	UI:SortShop( bundles, false, true )

	return bundles

end


--
function UI.Marketing_BundlesWnd:GetSelBundle()

	return UI.Marketing_Bundles_BundlesListWnd:GetSelBundle()

end


--
function UI.Marketing_BundlesWnd:OnSelBundleSlotChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSelBundle()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Marketing_Bundles_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Marketing_Bundles_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OnPlayerCreditsChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Marketing_Bundles_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Marketing_Bundles_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Marketing_Bundles_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Marketing_Bundles_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Marketing_Bundles_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Marketing_Bundles_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Marketing_BundlesWnd:GameStore_OnSpoiled( result, requestId )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()

end



--
function UI.Marketing_BundlesWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()
	self:FullUpdate()

end


--
function UI.Marketing_BundlesWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.buyRequestId then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnBuyError( result )
    	end

		self.buyRequestId = 0

	end

end


-- вызывается из окна покупки/продажи
function UI.Marketing_BundlesWnd:OnTradeResult_Buy( storeItem, count )

	self:DoBuyBundle( storeItem )

end


-- вызывается из окна покупки вместе с инвентарем
function UI.Marketing_BundlesWnd:OnBuyWithInventoryWndResult( result, data )

	if result == true then

		self.itemToBuy = data.item
		
		if next( data.inventoryLevels ) then
			self:BuyInventory( data.inventoryLevels )
		end
		
		if next( data.autogenInventoryLevels ) then
			self:BuyAutogenInventory( data.autogenInventoryLevels )
		end

	end

end


--
function UI.Marketing_BundlesWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if requestId == self.buyInventoryRequestId then

		if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if self.buyAutogenInventoryRequestId == 0 then
			
				if self.itemToBuy then
					self:DoBuyBundle( self.itemToBuy )
					self.itemToBuy = nil 
				else
					sys.log( "UI.Marketing_BundlesWnd:GameStore_OnBuyInventoryExtension()[ERROR]: no stored item to buy" )
				end
				
			end

		else
			UI:ShowMsgOnBuyError( result )
			self.itemToBuy = nil 
		end
		
		self.buyInventoryRequestId = 0
	
	end
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
		UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()
	end

end


--
function UI.Marketing_BundlesWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	if requestId == self.buyAutogenInventoryRequestId then

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
		
			if self.buyInventoryRequestId == 0 then

				if self.itemToBuy then
					self:DoBuyBundle( self.itemToBuy )
					self.itemToBuy = nil 
				else
					sys.log( "UI.Marketing_BundlesWnd:GameStore_OnBuyAutogenInventoryExtension()[ERROR]: no stored item to buy" )
				end
				
			end

		else
			UI:ShowMsgOnBuyError( result )
			self.itemToBuy = nil 
		end
		
		self.buyAutogenInventoryRequestId = 0
	
	end
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
		UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()
	end

end


--
function UI.Marketing_BundlesWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyRequestId					= 0
	self.buyInventoryRequestId			= 0
	self.buyAutogenInventoryRequestId	= 0
	self.itemToBuy						= nil

end


--
function UI.Marketing_BundlesWnd:OnBuyBundleWndResult( result, bAltBuy, defName )

	if not self:IsOnScreen() then
		sys.log( "UI.Marketing_BundlesWnd:OnBuyBundleWndResult()[ERROR]: not on screen" )
		return
	end

	if not result then
		return
	end

	if self:IsWaiting() then
		return
	end

	if bAltBuy then
		self:TryBuyBundle( UI:GetBundleAltBundleForBuy( defName ) )
	else
		self:TryBuyBundle( defName )
	end

end


--
function UI.Marketing_BundlesWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnNotification( notification, params )

	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE then
		UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()
	end

end


--
function UI.Marketing_BundlesWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_TITLES then
		UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()
	end

end


--
function UI.Marketing_BundlesWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()

end


--
function UI.Marketing_BundlesWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	UI.Marketing_Bundles_SelBundleWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()

end


--
function UI.Marketing_BundlesWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	UI.Marketing_Bundles_SelBundleWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_BundlesWnd.sounds =
{
	tradeWndShow	= "sound/ui/btnClick",
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_BundlesWnd.buyRequestId					= 0
UI.Marketing_BundlesWnd.buyInventoryRequestId			= 0
UI.Marketing_BundlesWnd.buyAutogenInventoryRequestId	= 0
UI.Marketing_BundlesWnd.itemToBuy						= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Marketing_BundlesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.Marketing_BundlesWnd:Reset()

	UI.Marketing_Bundles_BundlesListWnd:Reset()
	UI.Marketing_Bundles_SelBundleWnd:Reset()

end


--
function UI.Marketing_BundlesWnd:FullUpdate()

	self:Reset()

	UI.Marketing_Bundles_BundlesListWnd:FullUpdate()
	self:UpdateWaitEffect()	

end


--
function UI.Marketing_BundlesWnd:UpdateSelBundle()

	local selSlotWnd = UI.Marketing_Bundles_BundlesListWnd:GetSelSlot()

	if selSlotWnd then
		UI.Marketing_Bundles_SelBundleWnd:Setup( selSlotWnd:GetDefName() )
	else
		UI.Marketing_Bundles_SelBundleWnd:Reset()
	end
	
end


--
function UI.Marketing_BundlesWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.Marketing_BundlesWnd:TryBuyBundle( defName )

	if self:IsWaiting() then
		return
	end

	if UI:IsBundleContentFullyCollected( defName ) then
		UI:MessageBox( UI:GetStringByName( "msgBundleContentCollected_caption" ), UI:GetStringByName( "msgBundleContentCollected_text" ), UI.MBS_OK )
		return
	end

	local storeItem = UI:GetShopItemByDef( defName )
	if not storeItem then
		sys.log( "UI.Marketing_BundlesWnd:TryBuyBundle()[ERROR]: no item" )
		return
	end
	
	local bEnoughPlaceInInventory = UI:IsEnoughPlaceInInventoryForItem( defName )
	local bEnoughPlaceInAutogenInventory = UI:IsEnoughPlaceInAutogenInventoryForItem( defName )

	if bEnoughPlaceInInventory and bEnoughPlaceInAutogenInventory then

		local price = UI:GetBundleRealBuyPriceByDef( defName )

		-- #0056413 - если цена на бандл 0, то окошко подтверждения покупки не показывается
		if price == 0 then
			self:DoBuyBundle( storeItem )
		else
			self:LaunchBuyTradeWnd( storeItem )
		end

	else
	
		local bCanIncrease = true
		if not bEnoughPlaceInInventory and not UI:CanIncreaseInventory() then
			bCanIncrease = false
		end
		if not bEnoughPlaceInAutogenInventory and not UI:CanIncreaseAutogenInventory() then
			bCanIncrease = false
		end

		if bCanIncrease then
		
			local inventoryLevels = {}
			local autogenInventoryLevels = {}
			
			if not bEnoughPlaceInInventory then

				local needSize = UI:GetNeedInventorySizeForItem( defName )
				local curLevel = UI:GetInventoryCurLevel()
				local curUsedSize = UI:GetInventoryCurSize()
		
				for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do
		
					table.insert( inventoryLevels, levelToBuy )
		
					local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
					if ( curUsedSize + needSize ) <= newCapacity then
						break
					end
		
				end
				
			end
			
			if not bEnoughPlaceInAutogenInventory then

				local needCommonSize, needAutogenSize = UI:GetNeedInventorySizeForItem( defName )
				local curLevel = UI:GetAutogenInventoryCurLevel()
				local curUsedSize = UI:GetAutogenInventoryCurSize()
		
				for levelToBuy = curLevel + 1, UI:GetAutogenInventoryMaxLevel() do
		
					table.insert( autogenInventoryLevels, levelToBuy )
		
					local newCapacity = UI:GetAutogenInventoryMaxSizeForLevel( levelToBuy )
					if ( curUsedSize + needAutogenSize ) <= newCapacity then
						break
					end
		
				end
				
			end

			self:LaunchBuyWithInventoryWnd( storeItem, inventoryLevels, autogenInventoryLevels )

		else
		
			if not bEnoughPlaceInInventory and not UI:CanIncreaseInventory() then
				UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
			elseif not bEnoughPlaceInAutogenInventory and not UI:CanIncreaseAutogenInventory() then
				UI:MessageBox( UI:GetStringByName( "buyAutogenInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseAutogenInventory_AUTO" ), UI.MBS_OK )
			end
			
		end

	end

end


--
function UI.Marketing_BundlesWnd:DoBuyBundle( item )

	local price, priceType = UI:GetBundleRealBuyPrice( item )
	self.buyRequestId = _G.GameStore_Buy( item.id, 1, priceType )

	if self.buyRequestId ~= 0 then
 		UI:AddWaitingRequest( self.buyRequestId )
	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.Marketing_BundlesWnd:LaunchBuyTradeWnd( shopItem )

	UI.Marketing_Bundles_TradeWnd:SetupForBuy( shopItem )
	UI.Marketing_Bundles_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.Marketing_BundlesWnd:LaunchBuyWithInventoryWnd( shopItem, inventoryLevels, autogenInventoryLevels )

	UI.Marketing_Bundles_BuyWithInventoryWnd:Setup( shopItem, inventoryLevels, false, autogenInventoryLevels )
	UI.Marketing_Bundles_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.Marketing_BundlesWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.Marketing_BundlesWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	UI.Marketing_Bundles_TradeWnd:UnlinkFromParent()
	UI.Marketing_Bundles_BuyWithInventoryWnd:UnlinkFromParent()

end


--
function UI.Marketing_BundlesWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end

end


--
function UI.Marketing_BundlesWnd:OnAccountAurasChanged()

	UI.Marketing_Bundles_BundlesListWnd:OnAccountAurasChanged()

end


--
function UI.Marketing_BundlesWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	UI.store.Marketing_BundlesWnd =
	{
		buyRequestId					= self.buyRequestId,
		buyInventoryRequestId			= self.buyInventoryRequestId,
		buyAutogenInventoryRequestId	= self.buyAutogenInventoryRequestId,
		itemToBuy						= self.itemToBuy,
	}

end


--
function UI.Marketing_BundlesWnd:F_OnEventRestoreUiState()

	if UI.store.Marketing_BundlesWnd then

		self.buyRequestId					= UI.store.Marketing_BundlesWnd.buyRequestId
		self.buyInventoryRequestId			= UI.store.Marketing_BundlesWnd.buyInventoryRequestId
		self.buyAutogenInventoryRequestId	= UI.store.Marketing_BundlesWnd.buyAutogenInventoryRequestId
		self.itemToBuy						= UI.store.Marketing_BundlesWnd.itemToBuy

		UI.store.Marketing_BundlesWnd = nil

	end

end


--
function UI.Marketing_BundlesWnd:IsWaiting()

	return UI:IsWaitingRequests()

end


--
function UI.Marketing_BundlesWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.Marketing_BundlesWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.Marketing_BundlesWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.Marketing_BundlesWnd:BuyInventory( inventoryLevels )

	if not inventoryLevels or not next( inventoryLevels ) then
		self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension()
	else
		local maxLevel = inventoryLevels[ #inventoryLevels ]
		self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )
	end

	if self.buyInventoryRequestId ~= 0 then
		UI:AddWaitingRequest( self.buyInventoryRequestId )
	else
		self.itemToBuy = nil
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.Marketing_BundlesWnd:BuyAutogenInventory( autogenInventoryLevels )

	if not autogenInventoryLevels or not next( autogenInventoryLevels ) then
		self.buyAutogenInventoryRequestId = _G.GameStore_BuyAutogenInventoryExtension()
		sys.log( "UI.Marketing_BundlesWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", _G.GameStore_GetAutogenInventoryExtensionLevel() + 1 )
	else
		local maxLevel = autogenInventoryLevels[ #autogenInventoryLevels ]
		self.buyAutogenInventoryRequestId = _G.GameStore_BuyAutogenInventoryExtension( maxLevel )
		sys.log( "UI.Marketing_BundlesWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", maxLevel )
	end

	if self.buyAutogenInventoryRequestId ~= 0 then
		UI:AddWaitingRequest( self.buyAutogenInventoryRequestId )
	else
		self.itemToBuy = nil
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.Marketing_BundlesWnd:F_OnEventStartWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitEffect()

end


--
function UI.Marketing_BundlesWnd:F_OnEventStopWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

    self:UpdateWaitEffect()

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Bundles_BundlesListWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Bundles_BundlesListWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Marketing_Bundles_BundlesListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_Bundles_BundlesListWnd",
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
				defName 			= "marketing_bundles_bundlesList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "pages",	
						wnd			= "UI.Marketing_Bundles_PagesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}
	},

	children = { "UI.Marketing_Bundles_PagesWnd" }
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Marketing_Bundles_BundlesListWnd:FullUpdate( bRestoreLayout )

	if bRestoreLayout == nil then
		bRestoreLayout = false
	end

	local oldSelBundle	= self:GetSelBundle()
	local oldSelPage	= self.curPage

	self:Reset()

	self.bundles = UI.Marketing_BundlesWnd:GetBundles()
	self.numBundles = #self.bundles

	self:UpdatePagesList()

	if bRestoreLayout then

    	if oldSelBundle ~= "" then

    		self:TryOpenBundle( oldSelBundle )

			if self:GetSelBundle() ~= oldSelBundle then
				if oldSelPage ~= -1 and oldSelPage <= self:GetNumPages() then
					self:SetPage( oldSelPage )
				end
			end

    	end

	end

	if self.curPage == -1 and self.numBundles > 0 then
		self:SetPage( 1 )
	end
	
end


--
function UI.Marketing_Bundles_BundlesListWnd:Reset()

	self.curPage	= -1
	self.bundles	= {}
	self.numBundles	= 0

	self:ResetSlots()
	self:ResetPagesList()

end


--
function UI.Marketing_Bundles_BundlesListWnd:GetSelSlot()

	return self.selSlot

end


--
function UI.Marketing_Bundles_BundlesListWnd:GetSelBundle()

	return self.selSlot and self.selSlot:GetDefName() or ""

end


--
function UI.Marketing_Bundles_BundlesListWnd:OnAccountAurasChanged()

	if UI.serverData.unlockingAccountAurasChanged then

		self:FullUpdate( true )

	else

    	for slotIdx, slotWnd in pairs( self.slots ) do
    		if slotWnd:IsChildOf( self ) then
    			slotWnd:OnAccountAurasChanged()
    		end
    	end

	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:OnCollectedItemsChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:OnCollectedItemsChanged()
		end
	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:OnPlayerCreditsChanged()

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:OnPlayerCreditsChanged()
		end
	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:OpenFreeBundle()	

	local freeBundleDefName = ""

	for idx, shopItem in ipairs( self.bundles ) do

		local defName = shopItem.defName

    	if not UI:IsBundleContentFullyCollected( defName ) then

        	local price = UI:GetBundleRealBuyPriceByDef( defName, true )
			if price == 0 then

				freeBundleDefName = defName
				break

			end

		end

	end	

	if freeBundleDefName ~= "" then

		self:TryOpenBundle( freeBundleDefName )

		if self:GetSelBundle() ~= freeBundleDefName then
			sys.log( "UI.Marketing_Bundles_BundlesListWnd:OpenFreeBundle(): fail to select bundle \"%s\"", freeBundleDefName )
		end

	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:TryOpenBundle( defName )

	local page = -1

	for idx, shopItem in pairs( self.bundles ) do

		if shopItem.defName == defName then
			page = math.floor( ( idx - 1 ) / self.MAX_SLOTS ) + 1
			break
		end

	end

	if page == -1 then
		return
	end

	self:SetPage( page )

	local slotWnd = self:GetSlotForBundle( defName )
	if slotWnd then
		self:SelectSlot( slotWnd, false )
	else
		sys.log( "UI.Marketing_Bundles_PagesWnd:TryOpenBundle()[ERROR]: cannot find slot" )
	end

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_Bundles_BundlesListWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Marketing_Bundles_BundlesListWnd.MAX_SLOTS	= 12

UI.Marketing_Bundles_BundlesListWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "slot_",
	}
}

UI.Marketing_Bundles_BundlesListWnd.sounds =
{
	pageChange		= UI.sounds.btnClick,
	slotSelect		= UI.sounds.btnClick,
	slotMouseOver	= UI.sounds.btnMouseOver,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Marketing_Bundles_BundlesListWnd.bundles		= {}
UI.Marketing_Bundles_BundlesListWnd.numBundles	= 0
UI.Marketing_Bundles_BundlesListWnd.slots		= {}
UI.Marketing_Bundles_BundlesListWnd.curPage		= -1
UI.Marketing_Bundles_BundlesListWnd.selSlot		= nil
UI.Marketing_Bundles_BundlesListWnd.pagesList	= nil

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Marketing_Bundles_BundlesListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.pagesList = UI.Marketing_Bundles_PagesWnd

	self:CreateControls()

end


--
function UI.Marketing_Bundles_BundlesListWnd:CreateControls()

    local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, self.MAX_SLOTS do

    	local slotWnd = UI:CreateChildWnd( self, UI.Marketing_Bundles_BundleSlotWnd, tostring( slotIdx ) )
    	table.insert( self.slots, slotWnd )

    	if mainEffect then
    		mainEffect:LinkWnd( slotWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
    	end

	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:ResetSlots()

	self:SelectSlot( nil, false )

	for slotIdx, slotWnd in pairs( self.slots ) do

		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end

	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:ResetPagesList()

	self.pagesList:Reset()
	self.pagesList:UnlinkFromParent()

end


--
function UI.Marketing_Bundles_BundlesListWnd:SetPage( page )

	if page == self.curPage then
		return
	end

	if page ~= -1 and page < 1 or page > self:GetNumPages() then
		sys.log( "UI.Marketing_Bundles_BundlesListWnd:SetPage()[ERROR]: invalid page: %d", page )
		return
	end

	self.curPage = page

	self:UpdateSlots()
	self:UpdatePagesListForCurPage()

	self:ValidateSelSlot()

end


--
function UI.Marketing_Bundles_BundlesListWnd:GetNumPages()

	return math.ceil( self.numBundles / self.MAX_SLOTS )

end


--
function UI.Marketing_Bundles_BundlesListWnd:UpdateSlots()

	self:ResetSlots()

	if self.numBundles == 0 or self.curPage == -1 then
		return
	end

	local firstVisibleBundleIdx	= ( self.curPage - 1 ) * self.MAX_SLOTS + 1
	local lastVisibleBundleIdx	= math.min( firstVisibleBundleIdx + self.MAX_SLOTS - 1, self.numBundles )

	local slotIdx = 1

	for bundleIdx = firstVisibleBundleIdx, lastVisibleBundleIdx do

		local item = self.bundles[ bundleIdx ]

		local slotWnd = self.slots[ slotIdx ]

		self:AddChild( slotWnd )
		slotWnd:Setup( item.defName, false )

		slotIdx = slotIdx + 1

	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:UpdatePagesList()

	local numPages = self:GetNumPages()

	if numPages > 1 then

		self:AddChild( self.pagesList )
		self.pagesList:Setup( numPages, self.curPage )

	else
		self:ResetPagesList()
	end

end


--
function UI.Marketing_Bundles_BundlesListWnd:UpdatePagesListForCurPage()	

	if not self.pagesList:IsChildOf( self ) then
		return
	end

	self.pagesList:SetSelPage( self.curPage )

end


--
function UI.Marketing_Bundles_BundlesListWnd:SelectSlot( slotWnd, bSound )

	if self.selSlot == slotWnd then
		return
	end

	local selSlotOld = self.selSlot
	self.selSlot = slotWnd

	if selSlotOld then
		selSlotOld:Select( false )
	end

	if self.selSlot then

		self.selSlot:Select( true )

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.slotSelect )
		end

	end

	UI.Marketing_BundlesWnd:OnSelBundleSlotChanged()

end


--
function UI.Marketing_Bundles_BundlesListWnd:ValidateSelSlot()

	if self.selSlot then
		return	
	end

	if self.numBundles == 0 then
		return
	end

	local slotWnd = self.slots[ 1 ]
	self:SelectSlot( slotWnd, false )

end


--
function UI.Marketing_Bundles_BundlesListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Pages_LeftArrowBtn" ) then

		self:SetPage( self.curPage - 1 )
		UI:PlayGlobalSound( self.sounds.pageChange )

	elseif UI:IsWndKindOf( wnd, "Pages_RightArrowBtn" ) then

		self:SetPage( self.curPage + 1 )
		UI:PlayGlobalSound( self.sounds.pageChange )

	elseif UI:IsWndKindOf( wnd, "Pages_SlotWnd" ) then

		local page = wnd:GetPage()
		if page ~= self.curPage then
			self:SetPage( page )
			UI:PlayGlobalSound( self.sounds.pageChange )
		end

	elseif UI:IsWndKindOf( wnd, "Marketing_Bundles_BundleSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Marketing_Bundles_BundleSlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "Marketing_Bundles_BundleSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Marketing_Bundles_BundleSlotWnd" )
		if not slotWnd:IsSelected() then
			self:SelectSlot( slotWnd, true )
		end
		
	end

	return false

end


--
function UI.Marketing_Bundles_BundlesListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.curPage ~= -1 then

		local nextPage = UI:Clamp( self.curPage - ticks, 1, self:GetNumPages() )

		if nextPage ~= self.curPage then
			self:SetPage( nextPage )
			UI:PlayGlobalSound( self.sounds.pageChange )
		end

	end

	return true

end


--
function UI.Marketing_Bundles_BundlesListWnd:GetSlotForBundle( defName )

	local bundleSlotWnd = nil

	for idx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetDefName() == defName then
			bundleSlotWnd = slotWnd
			break
		end
	end

	return bundleSlotWnd

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Bundles_BundleSlotWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Bundles_BundleSlotWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

--
UI.Marketing_Bundles_BundleSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	PRICE_EFFECT		= 1,
    PRICE				= 2,
	PRICE_LINE			= 3,
	ACCOUNT_AURA_TIMER	= 4,
	SEL_EFFECT			= 5,
	MOUSE_OVER_EFFECT	= 6,
    SALE_EFFECT			= 7,
    SALE_VAL			= 8,
}


--
UI.Marketing_Bundles_BundleSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Marketing_Bundles_BundleSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true
	},

	layers =
	{
		firstOverlayLayer = UI.Marketing_Bundles_BundleSlotWnd.layers.SEL_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "marketing_bundles_bundleSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "select",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sale",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price6",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.ACCOUNT_AURA_TIMER",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "price2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_LINE
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsList_slot_priceLine",
				defaultAnimation	= "white",
			}}
		},

		-- ACCOUNT_AURA_TIMER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_bundles_bundleSlot_selection",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "marketing_bundles_bundleSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},

		-- рмсуется поверх , потому что MOUSE_OVER_EFFECT сделан в виде рамки, пересекающей эффект скидки
		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_bundles_bundleSlot_sale",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "sale",	
						layer		= "UI.Marketing_Bundles_BundleSlotWnd.layers.SALE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SALE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}	

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Marketing_Bundles_BundleSlotWnd:Setup( defName, bSelected )

	self:Reset()

	self.defName	= defName
	self.bSelected	= bSelected

	self:FullUpdate()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:GetDefName()

	return self.defName

end


--
function UI.Marketing_Bundles_BundleSlotWnd:Reset()

	self.defName		= ""
	self.bSelected		= false
	self.accountAura	= ""

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.priceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.PRICE_LINE )

	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.SALE_VAL )

	self:SetLayerVisible( false, self.layers.SEL_EFFECT )

	self:SetLayerVisible( false, self.layers.ACCOUNT_AURA_TIMER )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:Select( bSelected )

	self.bSelected = bSelected

	self:UpdateSelEffect()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.Marketing_Bundles_BundleSlotWnd:OnAccountAurasChanged()

	self:UpdatePrice()
	self:UpdateSale()
	self:UpdateAccountAura()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:OnCollectedItemsChanged()

	self:UpdatePrice()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:OnPlayerCreditsChanged()

	self:UpdatePrice()

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_Bundles_BundleSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
	},

	price =
	{
		colorLocator_credits_old	= "color_2",
		colorLocator_gold_old		= "color_4",
	}
}

UI.Marketing_Bundles_BundleSlotWnd.lineFixYCf = 0.0	-- поправка на местоположение линии зачеркивания по вертикали (0..1 от высоты шрифта)

UI.Marketing_Bundles_BundleSlotWnd.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Marketing_Bundles_BundleSlotWnd.defName					= ""
UI.Marketing_Bundles_BundleSlotWnd.bSelected				= false

UI.Marketing_Bundles_BundleSlotWnd.priceMetaText			= nil
UI.Marketing_Bundles_BundleSlotWnd.priceLineBaseSize		= Vec2( 0, 0 )
UI.Marketing_Bundles_BundleSlotWnd.priceColor_credits_old	= UI.WHITE_COLOR
UI.Marketing_Bundles_BundleSlotWnd.priceColor_gold_old		= UI.WHITE_COLOR

UI.Marketing_Bundles_BundleSlotWnd.accountAura				= ""

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Marketing_Bundles_BundleSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
	if priceEffect then

        self.priceColor_credits_old		= priceEffect:GetObjColor( self.effectInfo.price.colorLocator_credits_old )
		local priceAlpha_credits_old	= priceEffect:GetObjAlpha( self.effectInfo.price.colorLocator_credits_old )
		self.priceColor_credits_old		= UI:SetAlpha( self.priceColor_credits_old, priceAlpha_credits_old )

        self.priceColor_gold_old		= priceEffect:GetObjColor( self.effectInfo.price.colorLocator_gold_old )
		local priceAlpha_gold_old		= priceEffect:GetObjAlpha( self.effectInfo.price.colorLocator_gold_old )
		self.priceColor_gold_old		= UI:SetAlpha( self.priceColor_gold_old, priceAlpha_gold_old )

	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self.priceLineBaseSize = Vec2( 0, 0 )

	local priceLineEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_LINE )
	if priceLineEffect then
		self.priceLineBaseSize = priceLineEffect:GetObjSize( "self" )
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Marketing_Bundles_BundleSlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self:UpdatePriceLinePos()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdatePriceLinePos()

	if not self:IsLayerVisible( self.layers.PRICE_LINE ) then
		return
	end

	local lineEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_LINE )
	if not lineEffect then
		return
	end

    local basePriceItem = nil
	for idx, item in pairs( self.priceMetaText.items ) do
		if item.itemType == self.priceMetaText.itemTypes.TEXT then
			basePriceItem = item
			break
		end
	end

	if not basePriceItem then
		return
	end

	local basePriceRect = basePriceItem and basePriceItem.rect or UI:ZeroQuat()
	local basePriceBaseLineOffset = _G.GetFontBaselineOffsetRel( basePriceItem.hFont )
	basePriceRect.w = basePriceBaseLineOffset

	local lineScale = lineEffect:GetScale()
	local lineScaledSize = UI:Vec2( self.priceLineBaseSize.x * lineScale.x, self.priceLineBaseSize.y * lineScale.y )

	local lineX = basePriceRect.x + ( basePriceRect.z - lineScaledSize.x ) * 0.5
	local lineY = basePriceRect.y + ( basePriceRect.w - lineScaledSize.y ) * 0.5 + basePriceRect.w * self.lineFixYCf

	local screenOrg = self.priceMetaText:GetScreenOrg()
	lineEffect:SetScreenPos( UI:Vec2( lineX + screenOrg.x, lineY + screenOrg.y ) )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:FullUpdate()

	self:UpdateSelEffect()
	self:UpdateIco()
	self:UpdatePrice()
	self:UpdateSale()
	self:UpdateAccountAura()

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateIco()

	local hTex = UI:GetBundleIco( self.defName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdatePrice()

	if not UI:IsBundleContentFullyCollected( self.defName ) then

    	local price, priceType	= UI:GetBundleRealBuyPriceByDef( self.defName, true )
    	local basePrice			= UI:GetBundleRealBaseBuyPriceByDef( self.defName )

    	local bNeedBasePrice	= price < basePrice and price ~= 0

    	-- текст

    	local priceInfo = {}
    	priceInfo.priceType 	= priceType
    	priceInfo.val			= price
    	priceInfo.bIsBuyPrice	= true
    	priceInfo.basePrice		= price

    	local strPrice = UI:PriceInfo2Str( priceInfo, nil, false, nil, true, nil )

    	if bNeedBasePrice then

    		local basePriceColor = ( priceType == _G.GameStore.CreditsType.CT_GOLD ) and self.priceColor_gold_old or self.priceColor_credits_old

    		local strBasePrice = string.format( "%s(%s)", UI:Color2Str( basePriceColor ), UI:Num2StrSeparatedBy3( basePrice ) )
    		local strBaseBriceMetaText = string.format( "$text [fontId %d][text %s][alignment BASELINE]$", self:GetFont( self.layers.PRICE ), strBasePrice )

    		strPrice = string.format( "%s %s", strBaseBriceMetaText, strPrice )

    	end

    	self.priceMetaText:SetText( strPrice, true )


    	-- эффект зачеркивания базовой суммарной стоимости итемов

    	if bNeedBasePrice then

        	self:SetLayerVisible( true, self.layers.PRICE_LINE )

        	local lineEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_LINE )
        	if lineEffect then

        		local basePriceItem = self.priceMetaText.items[ 1 ]
        		local basePriceRect = basePriceItem and basePriceItem.rect or UI:ZeroQuat()

        		local lineScale = self.priceLineBaseSize.x ~= 0 and basePriceRect.z / self.priceLineBaseSize.x or 0
        		lineEffect:SetScale( UI:Vec2( lineScale, 1 ) )				

    			local lineColor = ( priceType == _G.GameStore.CreditsType.CT_GOLD ) and self.priceColor_gold_old or self.priceColor_credits_old
    			lineEffect:SetColor( lineColor )
    			lineEffect:SetAlpha( UI:GetAlpha( lineColor ) )

        		self:UpdatePriceLinePos()

        	end

    	else
        	self:SetLayerVisible( false, self.layers.PRICE_LINE )
    	end

	else

		local str = string.format( "%s%s", UI:Color2Str( UI.WHITE_COLOR ), UI:GetStringByName( "allBundleItemsCollected" ) )
		self.priceMetaText:SetText( str, true )

		self:SetLayerVisible( false, self.layers.PRICE_LINE )

	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateSale()

	local price		= 0
	local basePrice	= 0

	local baseTokenPrice = UI:GetShopBaseTokenPriceByDef( self.defName )

	if baseTokenPrice then
		price		= UI:GetShopTokenPriceByDef( self.defName )
		basePrice	= baseTokenPrice
	else
		price		= UI:GetShopBuyPriceByDef( self.defName, false, false, true )
		basePrice	= UI:GetShopBaseBuyPriceByDef( self.defName, false, false )
	end

	if price < basePrice and price ~= 0 then

		self:SetLayerVisible( true, self.layers.SALE_EFFECT )
		self:SetLayerVisible( true, self.layers.SALE_VAL )

		local val = UI:Round( ( basePrice - price ) / basePrice * 100 )
		local strVal = string.format( "%d%%", val )

		self:SetText( strVal, self.layers.SALE_VAL )

	else

		self:SetLayerVisible( false, self.layers.SALE_EFFECT )
		self:SetLayerVisible( false, self.layers.SALE_VAL )

	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateSelEffect()

	self:SetLayerVisible( self.bSelected,self.layers.SEL_EFFECT )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateAccountAura()

    self.accountAura = ""

	local accountAura = UI:GetAccountAuraToUnlockItem( self.defName )
	if accountAura ~= "" then

		local timeDur = UI:GetAccountAuraDuration( accountAura )
		if timeDur ~= nil then

        	if UI:HasAccountAura( accountAura ) then
    			self.accountAura = accountAura
    		end

		end

	end

	if self.accountAura ~= "" then
		self:SetLayerVisible( true, self.layers.ACCOUNT_AURA_TIMER )
		self:UpdateAccountAuraTimer()
	else
		self:SetLayerVisible( false, self.layers.ACCOUNT_AURA_TIMER )
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateAccountAuraTimer()

	local strTimeLeft = ""

	local timeLeft = UI:GetAccountAuraLeftTime( self.accountAura, false )
	if timeLeft ~= nil then
		strTimeLeft = UI:Time2Str45( timeLeft )
	end

	self:SetText( strTimeLeft, self.layers.ACCOUNT_AURA_TIMER )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.accountAura ~= "" then
		self:UpdateAccountAuraTimer()
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Marketing_Bundles_BundleSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Marketing_Bundles_BundleSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Bundles_PagesWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Bundles_PagesWnd =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "PagesWnd",

    	props =
    	{
    		name	= "Marketing_Bundles_PagesWnd",
    	},
	}
}

-- ----------------------------------------------------------------------------
-- UI.Marketing_Bundles_SelBundleWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Bundles_SelBundleWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "BuyBundle_WorkWnd",

    	props =
    	{
    		name	= "Marketing_Bundles_SelBundleWnd",
    	},
    },

	mainWndName = "Marketing_BundlesWnd"
}

-- -------------------------------------------------------------------
-- UI.Marketing_Bundles_TradeWnd
-- -------------------------------------------------------------------

UI.Marketing_Bundles_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "Marketing_Bundles_TradeWnd",
    	},
	},

	mainWndName = "Marketing_BundlesWnd",
}

-- -------------------------------------------------------------------
-- UI.Marketing_Bundles_BuyWithInventoryWnd
-- -------------------------------------------------------------------

UI.Marketing_Bundles_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "Marketing_Bundles_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "Marketing_BundlesWnd",
}