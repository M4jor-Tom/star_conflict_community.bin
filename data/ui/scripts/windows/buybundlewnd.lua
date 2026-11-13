-- ------------------------------------------------------------
-- UI.BuyBundleWnd
-- ------------------------------------------------------------

UI.BuyBundleWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyBundleWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "BuyBundleWnd",
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
			}}
		},
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.BuyBundleWnd:Setup( defName, data, mainWndName, bCloseAfterBuy )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.BuyBundleWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if mainWndName ~= nil then
    	if type( mainWndName ) ~= "string" then
    		sys.log( "UI.BuyBundleWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"mainWndName\"); \"string\" or \"nil\" expected, got \"%s\"", type( mainWndName ) )
			mainWndName = nil
    	end
	end

	if mainWndName == nil then
		mainWndName = ""
	end

	if bCloseAfterBuy ~= nil then
    	if type( bCloseAfterBuy ) ~= "boolean" then
    		sys.log( "UI.BuyBundleWnd:Setup()[ERROR]: invalid type of the 4-th parameter (\"bCloseAfterBuy\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bCloseAfterBuy ) )
			bCloseAfterBuy = nil
    	end
	end

	if bCloseAfterBuy == nil then
		bCloseAfterBuy = false
	end

	self.defName		= defName
	self.data			= data
	self.mainWndName	= mainWndName
	self.bCloseAfterBuy	= bCloseAfterBuy

	self.workWnd:Setup( defName )

end


--
function UI.BuyBundleWnd:GetDefName()

	return self.defName

end


--
function UI.BuyBundleWnd:GetData()

	return self.data

end


--
function UI.BuyBundleWnd:GetMainWndName()

	return self.mainWndName

end


--
function UI.BuyBundleWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnNotification( notification, params )

end


--
function UI.BuyBundleWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.BuyBundleWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if self:IsOnScreen() then
		self.workWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	end

	if self.buyInventoryRequestId == requestId then

		self.buyInventoryRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
		
			if self.buyAutogenInventoryRequestId == 0 then

				if self.dataInProcess then
					self:DoBuyBundle( UI:GetShopItemByDef( self.dataInProcess.defName ) )
				else
					sys.log( "UI.BuyBundleWnd:GameStore_OnBuyInventoryExtension()[ERROR]: no data to buy stored" )
				end
				
			end

		else
			UI:ShowMsgOnBuyError( result )
			self.dataInProcess = nil
		end

	end

end


--
function UI.BuyBundleWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	if self:IsOnScreen() then
		self.workWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )
	end

	if self.buyAutogenInventoryRequestId == requestId then

		self.buyAutogenInventoryRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if self.buyInventoryRequestId == 0 then
			
				if self.dataInProcess then
					self:DoBuyBundle( UI:GetShopItemByDef( self.dataInProcess.defName ) )
				else
					sys.log( "UI.BuyBundleWnd:GameStore_OnBuyAutogenInventoryExtension()[ERROR]: no data to buy stored" )
				end
				
			end

		else
			UI:ShowMsgOnBuyError( result )
			self.dataInProcess = nil
		end

	end

end


--
function UI.BuyBundleWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	self.workWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

end


--
function UI.BuyBundleWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if self:IsOnScreen() then
		self.workWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	end

end


--
function UI.BuyBundleWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

end


--
function UI.BuyBundleWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI.Ship_TradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

end


--
function UI.BuyBundleWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	
end


--
function UI.BuyBundleWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	
end


--
function UI.BuyBundleWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	
end


--
function UI.BuyBundleWnd:OnTradeResult_Buy( shopItem, count, priceType, bBuyForShipParts )

	self:DoBuyBundle( shopItem )

end


--
function UI.BuyBundleWnd:OnTradeResult_Cancel()

	self.dataInProcess = nil

end


--
function UI.BuyBundleWnd:OnBuyWithInventoryWndResult( result, data )

	if result == true then
	
		if next( data.inventoryLevels ) then
			self:BuyInventory( data.inventoryLevels )
		end
		
		if next( data.autogenInventoryLevels ) then
			self:BuyAutogenInventory( data.autogenInventoryLevels )
		end
		
	else
		self.dataInProcess = nil
	end

end


--
function UI.BuyBundleWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyRequestId					= 0
	self.buyInventoryRequestId			= 0
	self.buyAutogenInventoryRequestId	= 0
    self.dataInProcess					= nil

	self:UpdateWaitingEffect()

end


--
function UI.BuyBundleWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.buyRequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			UI:ShowMsgOnBuyError( result )
		end

		self.buyRequestId = 0
		self:UpdateWaitingEffect()

		-- закрытие окна
		if result == _G.GameStore.StoreBuyResult.SBR_OK then
			self:OnSuccess()
		end

	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.BuyBundleWnd.effectInfo =
{
	main =
	{
		workWndLocator	= "bundle_info"
	}
}


UI.BuyBundleWnd.sounds =
{
	tradeWndShow	= "sound/ui/btnClick",
	hide			= "sound/ui/MsgHide",
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.BuyBundleWnd.defName							= ""
UI.BuyBundleWnd.data							= nil
UI.BuyBundleWnd.mainWndName						= ""
UI.BuyBundleWnd.bCloseAfterBuy					= false
		
UI.BuyBundleWnd.workWnd							= nil
UI.BuyBundleWnd.buyRequestId					= 0
UI.BuyBundleWnd.buyInventoryRequestId			= 0
UI.BuyBundleWnd.buyAutogenInventoryRequestId	= 0
UI.BuyBundleWnd.dataInProcess					= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.BuyBundleWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.BuyBundleWnd:CreateControls()

	self.workWnd = UI:CreateChildWnd( self, UI.BuyBundle_WorkWnd, "" )

	self.workWnd:Init( string.gsub( self:GetScriptTableName(), "^UI%.", "" ), true )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.workWnd, mainEffect, self.effectInfo.main.workWndLocator, UI.EffectAnimParams.POS )

end


--
function UI.BuyBundleWnd:Reset()

	self.defName		= ""
	self.data			= nil
	self.mainWndName	= ""
	self.bCloseAfterBuy	= false

	self.workWnd:Reset()

end


--
function UI.BuyBundleWnd:NotifyMainWnd( result, mainWndName, defName, data )

	if mainWndName == "" then
		return
	end

	local mainWnd = UI:GetValByName( mainWndName )
	if not mainWnd then
		sys.log( "UI.BuyBundleWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%d\"", mainWndName )
		return
	end

	if not mainWnd.OnBuyBundleWndResult then
		sys.log( "UI.BuyBundleWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyBundleWndResult() function in wnd %s", mainWnd:GetScriptTableName() )
		return
	end

	mainWnd:OnBuyBundleWndResult( result, defName, data )

end


--
function UI.BuyBundleWnd:OnCancel()

	local bWaiting = self:IsWaiting() and self.dataInProcess and self.dataInProcess.mainWndName == self.mainWndName and self.dataInProcess.defName == defName
	if not bWaiting then
		self:NotifyMainWnd( false, self.mainWndName )
	end

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

end


--
function UI.BuyBundleWnd:OnSuccess()

	if not self:IsWaiting() then
		sys.log( "UI.BuyBundleWnd:OnSuccess()[ERROR: still in waiting" )
		return
	end

	if self.dataInProcess then

		self:NotifyMainWnd( true, self.dataInProcess.mainWndName, self.dataInProcess.defName, self.dataInProcess.data )

		if self.bCloseAfterBuy and self.dataInProcess.mainWndName == self.mainWndName and self.dataInProcess.defName == self.defName then
			self:Hide()	-- звук закрытия не играется, т.к. был проигран звук покупки в окне покупки
		end

		self.dataInProcess = nil

	else
		sys.log( "UI.BuyBundleWnd:OnSuccess()[ERROR]: no data in process stored" )
	end

end


--
function UI.BuyBundleWnd:OnEscape()

	self:OnCancel()
	return true

end


--
function UI.BuyBundleWnd:OnBuyBundleWndResult( result, bAltBuy, defName )

	if result then
		local bundleDefName = bAltBuy and UI:GetBundleAltBundleForBuy( self.defName ) or self.defName
		self:TryBuyBundle( bundleDefName )
	else
		self:OnCancel()
	end

end


--
function UI.BuyBundleWnd:FullUpdate()

	-- перегрузка функции базовогот "класса", чтобы не вызывался Reset()

end


--
function UI.BuyBundleWnd:TryBuyBundle( bundleDefName )

	if self:IsWaiting() then
		return
	end

	if type( bundleDefName ) ~= "string" then
		sys.log( "UI.BuyBundleWnd:TryBuyBundle()[ERROR]: invalid type of the 1-st parameter (\"bundleDefName\"); \"string\" expected, got \"%s\"", type( bundleDefName ) )
		return
	end

	if UI:IsBundleContentFullyCollected( bundleDefName ) then
		sys.log( "UI.BuyBundleWnd:TryBuyBundle()[ERROR]: bundle \"%s\" is considered to be fully collected", bundleDefName )
		UI:MessageBox( UI:GetStringByName( "msgBundleContentCollected_caption" ), UI:GetStringByName( "msgBundleContentCollected_text" ), UI.MBS_OK )
		return
	end

	local shopItem = UI:GetShopItemByDef( bundleDefName )
	if not shopItem then
		sys.log( "UI.BuyBundleWnd:TryBuyBundle()[ERROR]: cannot find shop item for \"%s\"", bundleDefName )
		return
	end

	self.dataInProcess =
	{
        defName		= self.defName,
        data		= self.data,
        mainWndName	= self.mainWndName,
	}
	
	local bEnoughPlaceInInventory = UI:IsEnoughPlaceInInventoryForItem( bundleDefName )
	local bEnoughPlaceInAutogenInventory = UI:IsEnoughPlaceInAutogenInventoryForItem( bundleDefName )

	if bEnoughPlaceInInventory and bEnoughPlaceInAutogenInventory then

		self:LaunchTradeWnd( shopItem )

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
			
				local needSize		= UI:GetNeedInventorySizeForItem( bundleDefName )
				local curLevel		= UI:GetInventoryCurLevel()
				local curUsedSize	= UI:GetInventoryCurSize()
		
				for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do
		
					table.insert( inventoryLevels, levelToBuy )
		
					local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
					if ( curUsedSize + needSize ) <= newCapacity then
						break
					end
		
				end
				
			end
			
			if not bEnoughPlaceInAutogenInventory then

				local needCommonSize, needAutogenSize = UI:GetNeedInventorySizeForItem( bundleDefName )
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
	
			self:LaunchTradeWithInventoryWnd( shopItem, inventoryLevels, autogenInventoryLevels )

		else
		
			if not bEnoughPlaceInInventory and not UI:CanIncreaseInventory() then
				UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
			elseif not bEnoughPlaceInAutogenInventory and not UI:CanIncreaseAutogenInventory() then
				UI:MessageBox( UI:GetStringByName( "buyAutogenInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseAutogenInventory_AUTO" ), UI.MBS_OK )
			end
			
			self.dataInProcess = nil
			
		end

	end

end


--
function UI.BuyBundleWnd:DoBuyBundle( shopItem )

	if self:IsWaiting() then
		sys.log( "UI.BuyBundleWnd:DoBuyBundle()[ERROR]: still is waiting for some other request" )
		return
	end

	local price, priceType = UI:GetBundleRealBuyPrice( shopItem )

	self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, priceType )

	if self.buyRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
		self.dataInProcess = nil
	end

	self:UpdateWaitingEffect()

end


--
function UI.BuyBundleWnd:BuyInventory( inventoryLevels )

	if self.buyInventoryRequestId ~= 0 then
		sys.log( "UI.BuyBundleWnd:BuyInventory()[ERROR]: is still waiting for some other request" )
		return
	end

	if type( inventoryLevels ) ~= "table" or not next( inventoryLevels ) then
		self.dataInProcess = nil
		sys.log( "UI.BuyBundleWnd:BuyInventory()[ERROR]: invalid \"inventoryLevels\" param" )
		return
	end

	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )

	if self.buyInventoryRequestId == 0 then
		self.dataInProcess = nil
    	UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

    self:UpdateWaitingEffect()

end


--
function UI.BuyBundleWnd:BuyAutogenInventory( autogenInventoryLevels )

	if self.buyAutogenInventoryRequestId ~= 0 then
		sys.log( "UI.BuyBundleWnd:BuyAutogenInventory()[ERROR]: is still waiting for some other request" )
		return
	end

	if type( autogenInventoryLevels ) ~= "table" or not next( autogenInventoryLevels ) then
		self.dataInProcess = nil
		sys.log( "UI.BuyBundleWnd:BuyAutogenInventory()[ERROR]: invalid \"autogenInventoryLevels\" param" )
		return
	end

	local maxLevel = autogenInventoryLevels[ #autogenInventoryLevels ]
	self.buyAutogenInventoryRequestId = _G.GameStore_BuyAutogenInventoryExtension( maxLevel )
	sys.log( "UI.BuyBundleWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", maxLevel )

	if self.buyAutogenInventoryRequestId == 0 then
		self.dataInProcess = nil
    	UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

    self:UpdateWaitingEffect()

end


--
function UI.BuyBundleWnd:LaunchTradeWnd( shopItem, bBuyForShipParts )

	UI.BuyBundle_TradeWnd:SetupForBuy( shopItem, nil, bBuyForShipParts )
	UI.BuyBundle_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.BuyBundleWnd:LaunchTradeWithInventoryWnd( shopItem, inventoryLevels, autogenInventoryLevels )

	UI.BuyBundle_BuyWithInventoryWnd:Setup( shopItem, inventoryLevels, false, autogenInventoryLevels )
	UI.BuyBundle_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.BuyBundleWnd:IsWaiting()

	return
		self.buyRequestId ~= 0
		or self.buyInventoryRequestId ~= 0
		or self.buyAutogenInventoryRequestId ~= 0

end


--
function UI.BuyBundleWnd:UpdateWaitingEffect()

	self.workWnd:SetWaitingEffectVisbility( self:IsWaiting() )

end


--
function UI.BuyBundleWnd:HideChildModals()

	UI.Ship_TradeWnd:UnlinkFromParent()
	UI.Ship_BuyWithInventoryWnd:UnlinkFromParent()

	if not self:IsWaiting() then
		self.dataInProcess = nil
	end

end


--
function UI.BuyBundleWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local defName			= ""
	local data				= nil
	local mainWndName		= ""
	local bCloseAfterBuy	= false

	if self:IsOnScreen() then	
		defName			= self.defName
		data			= self.data
		mainWndName		= self.mainWndName
		bCloseAfterBuy	= self.bCloseAfterBuy
	end

	UI.store.BuyBundleWnd =
	{
		defName							= defName,
		data							= data,
		mainWndName						= mainWndName,
		bCloseAfterBuy					= bCloseAfterBuy,
		buyRequestId					= self.buyRequestId,
		buyInventoryRequestId			= self.buyInventoryRequestId,
		buyAutogenInventoryRequestId	= self.buyAutogenInventoryRequestId,
		dataInProcess					= self.dataInProcess,
	}

end


--
function UI.BuyBundleWnd:F_OnEventRestoreUiState()

	if UI.store.BuyBundleWnd then

		self.buyRequestId					= UI.store.BuyBundleWnd.buyRequestId
		self.buyInventoryRequestId			= UI.store.BuyBundleWnd.buyInventoryRequestId
		self.buyAutogenInventoryRequestId	= UI.store.BuyBundleWnd.buyAutogenInventoryRequestId
		self.dataInProcess					= UI.store.BuyBundleWnd.dataInProcess

		if UI.store.BuyBundleWnd.defName ~= "" then
			self:Setup( UI.store.BuyBundleWnd.defName, UI.store.BuyBundleWnd.data, UI.store.BuyBundleWnd.mainWndName, UI.store.BuyBundleWnd.bCloseAfterBuy )
		end

		self:UpdateWaitingEffect()

		UI.store.BuyBundleWnd = nil

	end

end


--
function UI.BuyBundleWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end

end


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_WorkWnd
-- ----------------------------------------------------------------------------

UI.BuyBundle_WorkWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.BuyBundle_WorkWnd.layers =
{
    MAIN_EFFECT				= 0,
    BUY_PRICE_EFFECT		= 1,
    BUY_PRICE				= 2,
    BUY_PRICE_LINE			= 3,
    MULTIBUY_PRICE_EFFECT	= 4,
    MULTIBUY_PRICE			= 5,
    MULTIBUY_PRICE_LINE		= 6,
	WAIT_EFFECT				= 7,
	WAIT_TEXT				= 8,
}


--
UI.BuyBundle_WorkWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "BuyBundle_WorkWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.BuyBundle_WorkWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "buyBundle",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price_1",	
						layer		= "UI.BuyBundle_WorkWnd.layers.BUY_PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_2",	
						layer		= "UI.BuyBundle_WorkWnd.layers.MULTIBUY_PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.BuyBundle_WorkWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BUY_PRICE_EFFECT
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
						layer		= "UI.BuyBundle_WorkWnd.layers.BUY_PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- BUY_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BUY_PRICE_LINE
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsList_slot_priceLine",
				defaultAnimation	= "white",
			}}
		},

		-- MULTIBUY_PRICE_EFFECT
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
						layer		= "UI.BuyBundle_WorkWnd.layers.MULTIBUY_PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- MULTIBUY_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MULTIBUY_PRICE_LINE
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsList_slot_priceLine",
				defaultAnimation	= "white",
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
						layer		= "UI.BuyBundle_WorkWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
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
			text			= "^hangar_loading",
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.BuyBundle_WorkWnd:Setup( defName )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.BuyBundle_WorkWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	self.defName = defName

	if self.defName ~= "" then
		self:FullUpdate()	
	end

end


--
function UI.BuyBundle_WorkWnd:Reset()

	self.defName = ""

	self.infoWnd:Reset()

	self.buyBtn:UnlinkFromParent()
	self.multiBuyBtn:UnlinkFromParent()

	self.buyPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.BUY_PRICE )
	self:SetLayerVisible( false, self.layers.BUY_PRICE_EFFECT )
	self:SetLayerVisible( false, self.layers.BUY_PRICE_LINE )

	self.multiBuyPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE )
	self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE_EFFECT )
	self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE_LINE )

end


--
function UI.BuyBundle_WorkWnd:SetWaitingEffectVisbility( bVisible )

	self:SetLayerVisible( bVisible, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.WAIT_TEXT )

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE then
		self:OnCollectedItemsChanged()
	end

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_TITLES then
		self:OnCollectedItemsChanged()
	end

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnCollectedItemsChanged()

end


--
function UI.BuyBundle_WorkWnd:Init( mainWndName, bNeedCrossBtn )

	self.mainWndName	= mainWndName
	self.bNeedCrossBtn	= bNeedCrossBtn

	if bNeedCrossBtn then

		if not self.crossBtn then

			self.crossBtn = UI:CreateChildWnd( self, UI.CrossBtn, "" )

			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			UI:AddChildAndLink( self, self.crossBtn, mainEffect, self.effectInfo.main.crossBtnLocator, UI.EffectAnimParams.POS )
		end

	else

		if self.crossBtn then
			UI:RemoveUiObj( self.crossBtn:GetUiHandle() )
			UI:Purge()
		end
		
	end

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self.infoWnd:OnVesselBudgetActivate()

end


--
function UI.BuyBundle_WorkWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrices()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.BuyBundle_WorkWnd.effectInfo =
{
	main =
	{
		infoLocator					= "info_list",
		buyBtnLocator				= "btn_2",
		multiBuyBtnLocator			= "btn_1",
		crossBtnLocator				= "btn_x",
	},

	price =
	{
		colorLocator_credits_old	= "color_2",
		colorLocator_gold_old		= "color_4",
	}
}

UI.BuyBundle_WorkWnd.lineFixYCf = 0.0	-- поправка на местоположение линии зачеркивания по вертикали (0..1 от высоты шрифта)

UI.BuyBundle_WorkWnd.mainWndName	= ""
UI.BuyBundle_WorkWnd.bNeedCrossBtn	= false

-- ---------------------------------
-- vars
-- ---------------------------------

UI.BuyBundle_WorkWnd.defName				= ""
UI.BuyBundle_WorkWnd.infoWnd				= nil
UI.BuyBundle_WorkWnd.buyBtn					= nil
UI.BuyBundle_WorkWnd.multiBuyBtn			= nil
UI.BuyBundle_WorkWnd.crossBtn				= nil
UI.BuyBundle_WorkWnd.buyPriceMetaText		= nil
UI.BuyBundle_WorkWnd.multiBuyPriceMetaText	= nil
UI.BuyBundle_WorkWnd.priceLineBaseSize		= Vec2( 0, 0 )
UI.BuyBundle_WorkWnd.priceColor_credits_old	= UI.WHITE_COLOR
UI.BuyBundle_WorkWnd.priceColor_gold_old	= UI.WHITE_COLOR

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.BuyBundle_WorkWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	local priceEffect = UI:GetEffectFromLayer( self, self.layers.BUY_PRICE_EFFECT )
	if priceEffect then

        self.priceColor_credits_old		= priceEffect:GetObjColor( self.effectInfo.price.colorLocator_credits_old )
		local priceAlpha_credits_old	= priceEffect:GetObjAlpha( self.effectInfo.price.colorLocator_credits_old )
		self.priceColor_credits_old		= UI:SetAlpha( self.priceColor_credits_old, priceAlpha_credits_old )

        self.priceColor_gold_old		= priceEffect:GetObjColor( self.effectInfo.price.colorLocator_gold_old )
		local priceAlpha_gold_old		= priceEffect:GetObjAlpha( self.effectInfo.price.colorLocator_gold_old )
		self.priceColor_gold_old		= UI:SetAlpha( self.priceColor_gold_old, priceAlpha_gold_old )

	end

	self.buyPriceMetaText = UI.MetaText.GetNewInstance()
	self.buyPriceMetaText:InitFromLayer( self, self.layers.BUY_PRICE ) 

	self.multiBuyPriceMetaText= UI.MetaText.GetNewInstance()
	self.multiBuyPriceMetaText:InitFromLayer( self, self.layers.MULTIBUY_PRICE ) 

	local priceLineEffect = UI:GetEffectFromLayer( self, self.layers.BUY_PRICE_LINE )
	if priceLineEffect then
		self.priceLineBaseSize = priceLineEffect:GetObjSize( "self" )
	end

	self:SetWaitingEffectVisbility( false )

end


--
function UI.BuyBundle_WorkWnd:F_Shutdown()

	if self.buyPriceMetaText then
		self.buyPriceMetaText:Clear()
	end

	if self.multiBuyPriceMetaText then
		self.multiBuyPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyBundle_WorkWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.BuyBundle_WorkWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyBundle_WorkWnd:UpdateMetaTextPos()

	self.buyPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.BUY_PRICE )
	self.multiBuyPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.MULTIBUY_PRICE )

	self:UpdatePriceLinePos( self.layers.BUY_PRICE_LINE, self.layers.BUY_PRICE, self.buyPriceMetaText )
	self:UpdatePriceLinePos( self.layers.MULTIBUY_PRICE_LINE, self.layers.MULTIBUY_PRICE, self.multiBuyPriceMetaText )

end


--
function UI.BuyBundle_WorkWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.BUY_PRICE then
		self.buyPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.MULTIBUY_PRICE then
		self.multiBuyPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyBundle_WorkWnd:CreateControls()

	self.infoWnd		= UI:CreateChildWnd( self, UI.BuyBundle_InfoWnd, "" )
	self.buyBtn			= UI:CreateChildWnd( self, UI.BuyBundle_BuyBtn, "" )
	self.multiBuyBtn	= UI:CreateChildWnd( self, UI.BuyBundle_MultiBuyBtn, "" )

	if self.bNeedCrossBtn then
		self.crossBtn = UI:CreateChildWnd( self, UI.CrossBtn, "" )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.infoWnd, mainEffect, self.effectInfo.main.infoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.buyBtn, mainEffect, self.effectInfo.main.buyBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.multiBuyBtn, mainEffect, self.effectInfo.main.multiBuyBtnLocator, UI.EffectAnimParams.POS )

	if self.bNeedCrossBtn then
		UI:AddChildAndLink( self, self.crossBtn, mainEffect, self.effectInfo.main.crossBtnLocator, UI.EffectAnimParams.POS )
	end

end


--
function UI.BuyBundle_WorkWnd:FullUpdate()

	self:UpdateInfo()
	self:UpdateBtns()
	self:UpdatePrices()

end


--
function UI.BuyBundle_WorkWnd:UpdateInfo()

	self.infoWnd:Setup( self.defName )

end


--
function UI.BuyBundle_WorkWnd:UpdateBtns()

	local bFullyCollected	= UI:IsBundleContentFullyCollected( self.defName )
	local bMultiBuy			= not bFullyCollected and UI:GetBundleAltBundleForBuy( self.defName ) ~= ""

	-- кнопка покупки выбранного бандла

	self:AddChild( self.buyBtn )
	local strBuyBtnText = bMultiBuy and UI:GetStringByName( "bundles_buyBtnText_singleBuy" ) or UI:GetStringByName( "shop_buy" )
	self.buyBtn:SetBtnText( strBuyBtnText )
	self.buyBtn:Enable( not bFullyCollected )

	-- кнопка покупки альтернативного бандла

	if bMultiBuy then
		self:AddChild( self.multiBuyBtn )
	else
		self.multiBuyBtn:UnlinkFromParent()
	end

end


--
function UI.BuyBundle_WorkWnd:UpdatePrices()

	-- цена выбранного бандла

	self:SetLayerVisible( true, self.layers.BUY_PRICE )
	self:SetLayerVisible( true, self.layers.BUY_PRICE_EFFECT )

	self:UpdatePrice( self.defName, self.layers.BUY_PRICE_LINE, self.layers.BUY_PRICE, self.buyPriceMetaText )

	-- цена альтернативного бандла

	local altBundleDefName = ""

	local bFullyCollected = UI:IsBundleContentFullyCollected( self.defName )
	if not bFullyCollected then
		altBundleDefName = UI:GetBundleAltBundleForBuy( self.defName )
	end

	if altBundleDefName ~= "" then

		self:SetLayerVisible( true, self.layers.MULTIBUY_PRICE )
		self:SetLayerVisible( true, self.layers.MULTIBUY_PRICE_EFFECT )

		self:UpdatePrice( altBundleDefName, self.layers.MULTIBUY_PRICE_LINE, self.layers.MULTIBUY_PRICE, self.multiBuyPriceMetaText )

	else

		self.multiBuyPriceMetaText:SetText( "", true )
		self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE )
		self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE_EFFECT )
		self:SetLayerVisible( false, self.layers.MULTIBUY_PRICE_LINE )

	end

end


--
function UI.BuyBundle_WorkWnd:UpdatePrice( defName, lineLayer, priceLayer, priceMetaText )

	if not UI:IsBundleContentFullyCollected( defName ) then

    	local price, priceType		= UI:GetBundleRealBuyPriceByDef( defName, true )
    	local basePrice				= UI:GetBundleRealBaseBuyPriceByDef( defName )

    	local bNeedBasePrice		= price < basePrice and price ~= 0

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
    		local strBaseBriceMetaText = string.format( "$text [fontId %d][text %s][alignment BASELINE]$", self:GetFont( priceLayer ), strBasePrice )

    		strPrice = string.format( "%s %s", strBaseBriceMetaText, strPrice )

    	end

    	priceMetaText:SetText( strPrice, true )


    	-- эффект зачеркивания базовой суммарной стоимости итемов

    	if bNeedBasePrice then

        	self:SetLayerVisible( true, lineLayer )

        	local lineEffect = UI:GetEffectFromLayer( self, lineLayer )
        	if lineEffect then

        		local basePriceItem = priceMetaText.items[ 1 ]
        		local basePriceRect = basePriceItem and basePriceItem.rect or UI:ZeroQuat()

        		local lineScale = self.priceLineBaseSize.x ~= 0 and basePriceRect.z / self.priceLineBaseSize.x or 0
        		lineEffect:SetScale( UI:Vec2( lineScale, 1 ) )				

    			local lineColor = ( priceType == _G.GameStore.CreditsType.CT_GOLD ) and self.priceColor_gold_old or self.priceColor_credits_old
    			lineEffect:SetColor( lineColor )
    			lineEffect:SetAlpha( UI:GetAlpha( lineColor ) )

        		self:UpdatePriceLinePos( lineLayer, priceLayer, priceMetaText )

        	end

    	else
        	self:SetLayerVisible( false, lineLayer )
    	end

	else

		local str = string.format( "%s%s", UI:Color2Str( UI.WHITE_COLOR ), UI:GetStringByName( "allBundleItemsCollected" ) )
		priceMetaText:SetText( str, true )

		self:SetLayerVisible( false, lineLayer )

	end

end


--
function UI.BuyBundle_WorkWnd:UpdatePriceLinePos( lineLayer, priceLayer, priceMetaText )

	if not self:IsLayerVisible( lineLayer ) then
		return
	end

	local lineEffect = UI:GetEffectFromLayer( self, lineLayer )
	if not lineEffect then
		return
	end

    local basePriceItem = nil
	for idx, item in pairs( priceMetaText.items ) do
		if item.itemType == priceMetaText.itemTypes.TEXT then
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

	local screenOrg = priceMetaText:GetScreenOrg()
	lineEffect:SetScreenPos( UI:Vec2( lineX + screenOrg.x, lineY + screenOrg.y ) )

end


--
function UI.BuyBundle_WorkWnd:NotifyMainWnd( result, bAltBuy )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.BuyBundle_WorkWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnBuyBundleWndResult then
		sys.log( "UI.BuyBundle_WorkWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyBundleWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnBuyBundleWndResult( result, bAltBuy, self.defName )

end


--
function UI.BuyBundle_WorkWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local bHandled = false

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == self.buyBtn then
		self:NotifyMainWnd( true, false )
		bHandled = true

	elseif w == self.multiBuyBtn then
		self:NotifyMainWnd( true, true )
		bHandled = true

	elseif w == self.crossBtn then
		self:NotifyMainWnd( false )
		bHandled = true
	end

	return bHandled

end


--
function UI.BuyBundle_WorkWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "ShipIcoWnd" ) then
		UI:ShowPopUpMenuForShipInBundle( wnd:GetDefName(), UI.HangarWnd:GetUiHandle() )
	end

	return true

end


--
function UI.BuyBundle_WorkWnd:OnCollectedItemsChanged()

	if self.defName == "" then
		return
	end

	self:UpdateBtns()
	self:UpdatePrices()

end


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_BuyBtn
-- ----------------------------------------------------------------------------

--
UI.BuyBundle_BuyBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn13",
		isPrototype	= true,

		props =
		{
			name	= "BuyBundle_BuyBtn"
		}
	}
}


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_MultiBuyBtn
-- ----------------------------------------------------------------------------

local numTextBtnLayers = UI:GetTableLength( UI.TextBtn.layers )

UI.BuyBundle_MultiBuyBtn = {}

UI.BuyBundle_MultiBuyBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
	SALE_EFFECT		= 3,
}

UI.BuyBundle_MultiBuyBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn11",
	isPrototype	= true,

	props =
	{
		name	= "BuyBundle_MultiBuyBtn"
	},

	layers =
	{
		numLayers = numTextBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "textBtn11",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "sale",
						layer		= "UI.BuyBundle_MultiBuyBtn.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SALE_EFFECT
		{
			id			= UI.BuyBundle_MultiBuyBtn.layers.SALE_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_buyPremiumAccBtn_sale",
				defaultAnimation	= "idle",
			}}
		},			
	}
}

UI.BuyBundle_MultiBuyBtn.textId = "bundles_buyBtnText_multiBuy"


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_InfoWnd
-- ----------------------------------------------------------------------------

UI.BuyBundle_InfoWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.BuyBundle_InfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "BuyBundle_InfoWnd",
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
				defName 			= "buyBundle_info",
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
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.BuyBundle_InfoWnd:Setup( defName )

	self:Reset()

	self.defName = defName
	self:FullUpdate()

end


--
function UI.BuyBundle_InfoWnd:Reset()

	self.defName = ""

	self.scrolledWnd:SetText( "", self.scrolledWnd.layers.NAME )
	
	local icoEffect = UI:GetEffectFromLayer( self.scrolledWnd, self.scrolledWnd.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.scrolledWnd.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.scrolledWnd.descMetaText:SetText( "", true )

	self.scrolledWnd:SetLayerVisible( false, self.scrolledWnd.layers.CONTENT_HEADER )
	self.scrolledWnd.contentListWnd:Reset()
	self.scrolledWnd.contentListWnd:UnlinkFromParent()

	self.scrollBar:UnlinkFromParent()
	self:UpdateMask()

end


--
function UI.BuyBundle_InfoWnd:OnVesselBudgetActivate()

	self.scrolledWnd:OnVesselBudgetActivate()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.BuyBundle_InfoWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.BuyBundle_InfoWnd.effectInfo =
{
	main =
	{
		scrollBarLocator	= "scroll"
	}
}

UI.BuyBundle_InfoWnd.SCROLL_STEP	= UI:YTo1024x768( 30, { x = 1280, y = 720 } )

-- ---------------------------------
-- vars
-- ---------------------------------

UI.BuyBundle_InfoWnd.hTexMask							= UI.INVALID_RESOURCE_HANDLE
UI.BuyBundle_InfoWnd.hSimpleMask						= UI.INVALID_RESOURCE_HANDLE
UI.BuyBundle_InfoWnd.hGradientMask						= UI.INVALID_RESOURCE_HANDLE
UI.BuyBundle_InfoWnd.parent								= nil
UI.BuyBundle_InfoWnd.scrollBar							= nil
UI.BuyBundle_InfoWnd.scrolledWnd						= nil
UI.BuyBundle_InfoWnd.defName							= ""
UI.BuyBundle_InfoWnd.space_desc_contentHeader			= 0
UI.BuyBundle_InfoWnd.space_contentHeader_contentList	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.BuyBundle_InfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	if self:IsPrototype() then
		return
	end

	self.hSimpleMask	= UI:GetTex( "listMask" )
	self.hGradientMask	= UI:GetTex( "bundlesMask" )

	self:CreateControls()
	self:InitScrollBar()
	self:PrepareLayout()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.BuyBundle_InfoWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


--
function UI.BuyBundle_InfoWnd:CreateControls()

	self.scrolledWnd = UI:CreateChildWnd( self, UI.BuyBundle_InfoScrolledWnd, "" )
	self:AddChild( self.scrolledWnd )

end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.BuyBundle_InfoWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.BuyBundle_InfoWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


--
function UI.BuyBundle_InfoWnd:InitScrollBar()	

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_2, "" )	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )

	if mainEffect and scrollEffect then

    	local needSize = mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator )
    	local baseSize = scrollEffect:GetObjSize( "self" )

    	local scale_y = needSize.y / baseSize.y
    	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

    	self.scrollBar:SetWidth( baseSize.x )
    	self.scrollBar:SetHeight( needSize.y )

	end

	self.scrollBar:SetStepSize( self.SCROLL_STEP )
	self.scrollBar:SetPageSize( self:GetHeight() )

end


--
function UI.BuyBundle_InfoWnd:UpdateScrollBar()

	local scrollSize = self.scrolledWnd:GetHeight() - self:GetHeight()
	if scrollSize >= 0 then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )

		self.scrollBar:SetRange( 0, scrollSize )
		self.scrollBar:SetPos( 0 )

	else
		self.scrollBar:UnlinkFromParent()
	end

	self:UpdateScrolledWndPosFromScrollBar()
	self:UpdateMask()

end


--
function UI.BuyBundle_InfoWnd:UpdateScrolledWndPosFromScrollBar()

	local scrollPos = self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0
	self.scrolledWnd:SetTop( UI:YRel2Snapped( -scrollPos ) )	

end


--
function UI.BuyBundle_InfoWnd:FullUpdate()

	self:UpdateName()
	self:UpdateIco()
	self:UpdateDesc()
	self:UpdatesContentList()	

	self:RecalcLayout()

end


--
function UI.BuyBundle_InfoWnd:UpdateName()

	local str = UI:GetEntityLocalizedNameByDef( self.defName, true, false, false, false )
	self.scrolledWnd:SetText( str, self.scrolledWnd.layers.NAME )

end


--
function UI.BuyBundle_InfoWnd:UpdateIco()

	local hTex = UI:GetBundleIcoBig( self.defName )

	local icoEffect = UI:GetEffectFromLayer( self.scrolledWnd, self.scrolledWnd.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.scrolledWnd.effectInfo.ico.spriteName, hTex )
	end	

end


--
function UI.BuyBundle_InfoWnd:UpdateDesc()

	local str = UI:GetBundleDesc( self.defName, true, self.scrolledWnd:GetColor( self.scrolledWnd.layers.DESC ) )
	self.scrolledWnd.descMetaText:SetText( str, true )

end


--
function UI.BuyBundle_InfoWnd:UpdatesContentList()	

	local content = UI:GetBundleUiContent( self.defName )
	if next( content ) then

		self.scrolledWnd:SetLayerVisible( true, self.scrolledWnd.layers.CONTENT_HEADER )

		self.scrolledWnd:AddChild( self.scrolledWnd.contentListWnd )
		self.scrolledWnd.contentListWnd:Setup( self.defName )

	else

		self.scrolledWnd:SetLayerVisible( false, self.scrolledWnd.layers.CONTENT_HEADER )

		self.scrolledWnd.contentListWnd:Reset()
		self.scrolledWnd.contentListWnd:UnlinkFromParent()
	
	end	

end


--
function UI.BuyBundle_InfoWnd:PrepareLayout()

	local scrolledEffect = UI:GetEffectFromLayer( self.scrolledWnd, self.scrolledWnd.layers.MAIN_EFFECT )

	local descPos			= scrolledEffect and scrolledEffect:GetObjPos( self.scrolledWnd.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descSize			= scrolledEffect and scrolledEffect:GetObjSize( self.scrolledWnd.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local contentHeaderPos	= scrolledEffect and scrolledEffect:GetObjPos( self.scrolledWnd.effectInfo.main.contentHeaderLocator ) or Vec2( 0, 0 )
	local contentHeaderSize	= scrolledEffect and scrolledEffect:GetObjSize( self.scrolledWnd.effectInfo.main.contentHeaderLocator ) or Vec2( 0, 0 )
	local contentListPos	= scrolledEffect and scrolledEffect:GetObjPos( self.scrolledWnd.effectInfo.main.contentListLocator ) or Vec2( 0, 0 )

	self.space_desc_contentHeader			= contentHeaderPos.y - ( descPos.y + descSize.y )
	self.space_contentHeader_contentList	= contentListPos.y - ( contentHeaderPos.y + contentHeaderSize.y ) 

	local descFormatRect = self.scrolledWnd.descMetaText:GetFormatRectSize()
	descFormatRect.y = 10000000
	self.scrolledWnd.descMetaText:GetFormatRectSize( descFormatRect, true )

	self.scrolledWnd:SetLayerLeft( contentHeaderPos.x, self.scrolledWnd.layers.CONTENT_HEADER )
	self.scrolledWnd.contentListWnd:SetLeft( contentListPos.x )
	self.scrolledWnd:SetWidth( self:GetWidth() )

end


--
function UI.BuyBundle_InfoWnd:RecalcLayout()

	local descFormatRect = UI:Quat( 0, 0, self.scrolledWnd:GetLayerWidth( self.scrolledWnd.layers.DESC ), 1000000 )

    local descHeight = _G.MeasureText(
   		self.scrolledWnd.descMetaText:GetFormattedText(),
   		self.scrolledWnd:GetFont( self.scrolledWnd.layers.DESC ),
    	descFormatRect,
   		self.scrolledWnd:GetTextFormatFlags( self.scrolledWnd.layers.DESC ),
    	descFormatRect ).w

	local btm = self.scrolledWnd:GetLayerTop( self.scrolledWnd.layers.DESC ) + descHeight


	-- позиция Y заголовка содержимого

	if self.scrolledWnd:IsLayerVisible( self.scrolledWnd.layers.CONTENT_HEADER ) then

		local contentHeaderTop = btm + self.space_desc_contentHeader
		self.scrolledWnd:SetLayerTop( UI:YRel2Snapped( contentHeaderTop ), self.scrolledWnd.layers.CONTENT_HEADER )

		btm = contentHeaderTop + self.scrolledWnd:GetLayerHeight( self.scrolledWnd.layers.CONTENT_HEADER )

	end


	-- позиция Y списка содержимого

	if self.scrolledWnd.contentListWnd:IsChildOf( self ) then

		local contentListTop = btm + self.space_contentHeader_contentList
		self.scrolledWnd.contentListWnd:SetTop( UI:YRel2Snapped( contentListTop ) )

		btm = contentListTop + self.scrolledWnd.contentListWnd:GetHeight()

	end


	-- высота скроллируемого окна

	self.scrolledWnd:SetHeight( btm )
	

	-- скроллбар

	self:UpdateScrollBar()

end


--
function UI.BuyBundle_InfoWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.scrollBar:IsChildOf( self ) then

		local scrollPos = self.scrollBar:GetPos()
		scrollPos = scrollPos - ticks * self.SCROLL_STEP

		self.scrollBar:SetPos( scrollPos )		
		
	end

	return true

end


--
function UI.BuyBundle_InfoWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateScrolledWndPosFromScrollBar()
	self:UpdateMask()

end


--
function UI.BuyBundle_InfoWnd:UpdateMask()

	if self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() < self.scrollBar:GetMax() - 1e-03 then
		self.hTexMask = self.hGradientMask
	else
		self.hTexMask = self.hSimpleMask
	end

end


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_InfoScrolledWnd
-- ----------------------------------------------------------------------------

UI.BuyBundle_InfoScrolledWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.BuyBundle_InfoScrolledWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "BuyBundle_InfoScrolledWnd",
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
				defName 			= "buyBundle_info",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ico_bg",
						layer		= "UI.BuyBundle_InfoScrolledWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title",
						layer		= "UI.BuyBundle_InfoScrolledWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bundle_ico",
						layer		= "UI.BuyBundle_InfoScrolledWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "desription",
						layer		= "UI.BuyBundle_InfoScrolledWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "title_2",
						layer		= "UI.BuyBundle_InfoScrolledWnd.layers.CONTENT_HEADER",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
				defName 			= "buyBundle_info_bg",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "bundleBigIco",
				defaultAnimation	= "idle",
			}}
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- CONTENT_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "bundles_content" ),
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.BuyBundle_InfoScrolledWnd:OnVesselBudgetActivate()

	self.contentListWnd:OnVesselBudgetActivate()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.BuyBundle_InfoScrolledWnd.layers =
{
    MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
    NAME			= 2,
    ICO_EFFECT		= 3,
    DESC			= 4,
	CONTENT_HEADER	= 5,
}

UI.BuyBundle_InfoScrolledWnd.effectInfo =
{
	main =
	{
		descLocator				= "desription",
		contentHeaderLocator	= "title_2",
		contentListLocator		= "content",
	},

	ico =
	{
		spriteName	= "ico1"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.BuyBundle_InfoScrolledWnd.descMetaText	= nil
UI.BuyBundle_InfoScrolledWnd.contentListWnd	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.BuyBundle_InfoScrolledWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.descMetaText = UI.MetaText.GetNewInstance()
	self.descMetaText:InitFromLayer( self, self.layers.DESC )

	self:CreateControls()

end


--
function UI.BuyBundle_InfoScrolledWnd:F_Shutdown()

	if self.descMetaText then
		self.descMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyBundle_InfoScrolledWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.BuyBundle_InfoScrolledWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyBundle_InfoScrolledWnd:UpdateMetaTextPos()

	self.descMetaText:UpdateScreenOrgFromLayer( self, self.layers.DESC )

end


--
function UI.BuyBundle_InfoScrolledWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.DESC then
		self.descMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyBundle_InfoScrolledWnd:CreateControls()

	self.contentListWnd = UI:CreateChildWnd( self, UI.BuyBundle_ContentListWnd, "" )
	self:AddChild( self.contentListWnd )

end



-- ----------------------------------------------------------------------------
-- UI.BuyBundle_ContentListWnd
-- ----------------------------------------------------------------------------

UI.BuyBundle_ContentListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.BuyBundle_ContentListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "BuyBundle_ContentListWnd",	
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
				defName 			= "buyBundle_contentList",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.BuyBundle_ContentListWnd:Setup( defName )

	self:Reset()

	self.defName = defName
	self:FullUpdate()

end


--
function UI.BuyBundle_ContentListWnd:Reset()

	self.defName = ""

	for slotIdx, slotWnd in pairs( self.itemSlots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
	end

	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
	end

	for slotIdx, slotWnd in pairs( self.shipPartSlots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
	end

	for slotIdx, slotWnd in pairs( self.specModulePartSlots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
	end

end


--
function UI.BuyBundle_ContentListWnd:OnVesselBudgetActivate()

	local vid = UI:GetShipForCollectingSpecModuleParts()

	local shipItem = nil
	if vid ~= UI.INVALID_U64_ID then

		shipItem = UI:GetShipItem( vid, true )
		if not shipItem then
			sys.log( "UI.BuyBundle_ContentListWnd:OnVesselBudgetActivate(): cannot find ship item for vid %s", _G.U64ToStr( vid ) )
		end

	end

	local shipDefName = shipItem and shipItem.defName or ""

	for slotIdx, slotWnd in pairs( self.specModulePartSlots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Setup( shipDefName, slotWnd:GetCount() )
		end
	end	

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.BuyBundle_ContentListWnd.layers =
{
	MAIN_EFFECT	= 0,
}


UI.BuyBundle_ContentListWnd.effectInfo =
{
	main =
	{
		slot1Row1Locator	= "module_1",
		slot2Row1Locator	= "module_2",
		slot1Row2Locator	= "module_3",
	}
}


-- ---------------------------------
-- vars
-- ---------------------------------

UI.BuyBundle_ContentListWnd.itemSlots			= {}
UI.BuyBundle_ContentListWnd.shipSlots			= {}
UI.BuyBundle_ContentListWnd.shipPartSlots		= {}
UI.BuyBundle_ContentListWnd.specModulePartSlots	= {}
UI.BuyBundle_ContentListWnd.spaceX_slots		= 0
UI.BuyBundle_ContentListWnd.spaceY_slots		= 0
UI.BuyBundle_ContentListWnd.stickerTextures		= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.BuyBundle_ContentListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.content				= {}
	self.itemSlots				= {}
	self.shipSlots				= {}
	self.shipPartSlots			= {}
	self.specModulePartSlots	= {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.BuyBundle_ContentListWnd:CreateControls()

	for slotIdx = 1, 5 do
		self:CreateItemSlot()
	end

	for slotIdx = 1, 3 do
		self:CreateShipSlot()
	end

	for slotIdx = 1, 3 do
		self:CreateShipPartSlot()
	end

	for slotIdx = 1, 1 do
		self:CreateSpecModulePartSlot()
	end

end


--
function UI.BuyBundle_ContentListWnd:ObtainItemSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.itemSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateItemSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end



--
function UI.BuyBundle_ContentListWnd:ObtainShipSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateShipSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.BuyBundle_ContentListWnd:ObtainShipPartSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.shipPartSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateShipPartSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.BuyBundle_ContentListWnd:ObtainSpecModulePartSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.specModulePartSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSpecModulePartSlot()
	end

	if freeSlotWnd then
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.BuyBundle_ContentListWnd:CreateItemSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.BuyBundle_ContentItemSlotWnd, tostring( #self.itemSlots + 1 ) )
	table.insert( self.itemSlots, slotWnd )

	return slotWnd

end


--
function UI.BuyBundle_ContentListWnd:CreateShipSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipIcoWnd, tostring( #self.shipSlots + 1 ) )
	table.insert( self.shipSlots, slotWnd )

	return slotWnd

end


--
function UI.BuyBundle_ContentListWnd:CreateShipPartSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipPartIcoWnd, tostring( #self.shipPartSlots + 1 ) )
	table.insert( self.shipPartSlots, slotWnd )

	return slotWnd

end


--
function UI.BuyBundle_ContentListWnd:CreateSpecModulePartSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.SpecModulePartIcoWnd, tostring( #self.specModulePartSlots + 1 ) )
	table.insert( self.specModulePartSlots, slotWnd )

	return slotWnd

end


--
function UI.BuyBundle_ContentListWnd:PrepareLayout()

	local mainEffect 	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local itemSlotWnd	= self.itemSlots[ 1 ]

	local slot1Row1Pos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slot1Row1Locator ) or Vec2( 0, 0 )
	local slot2Row1Pos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slot2Row1Locator ) or Vec2( 0, 0 )
	local slot1Row2Pos 	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slot1Row2Locator ) or Vec2( 0, 0 )
	local itemSlotRect	= itemSlotWnd and itemSlotWnd:GetRect() or Quat( 0, 0, 0, 0 )
	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	self.spaceX_slots	= slot2Row1Pos.x - ( slot1Row1Pos.x + itemSlotRect.z )
	self.spaceY_slots   = slot1Row2Pos.y - ( slot1Row1Pos.y + itemSlotRect.w )

	self:SetWidth( selfSize.x )

end


--
function UI.BuyBundle_ContentListWnd:FullUpdate()

	local content		= UI:GetBundleUiContent( self.defName )

	local rowIdx		= 1
	local slotIdx		= 1
	local rowY			= 0
	local selfWidth		= self:GetWidth()
	local selfHeight	= 0

	local blockTypes =
	{
		COMMON	= 1,
		SHIPS	= 2,
		PARTS	= 3,	-- партсы кораблей и спецмодулей; предполагается, что их иконки одного размера
	}

	local function fnGetItemBlockType( itemInfo )

	    local blockType = blockTypes.COMMON

		if itemInfo.type == ai.BundleContent.VESSEL then
			blockType = blockTypes.SHIPS
			
		elseif ( itemInfo.type == ai.BundleContent.CRAFT_RESOURCE and UI:IsDefShipPart( itemInfo.defName ) ) or itemInfo.type == ai.BundleContent.VESSEL_BUDGET then
			blockType = blockTypes.PARTS
		end

		return blockType

	end

	for blockIdx, blockInfo in ipairs( content ) do

		local blockType				= -1
		local bInvalidTypeLogged	= false

		local firstItemInfo = blockInfo[ 1 ]
		if firstItemInfo then
			blockType = fnGetItemBlockType( firstItemInfo )
		end

		local slotWidth		= 0
		local slotHeight	= 0

		if blockType == blockTypes.COMMON then
			local itemSlotWnd	= self.itemSlots[ 1 ]
			slotWidth			= itemSlotWnd:GetWidth()
			slotHeight			= itemSlotWnd:GetHeight()

		elseif blockType == blockTypes.SHIPS then
			local shipSlotWnd	= self.shipSlots[ 1 ]
			slotWidth			= shipSlotWnd:GetWidth()
			slotHeight			= shipSlotWnd:GetHeight()

		elseif blockType == blockTypes.PARTS then
			local partSlotWnd	= self.shipPartSlots[ 1 ]
			slotWidth			= partSlotWnd:GetWidth()
			slotHeight			= partSlotWnd:GetHeight()
		end

		for itemIdx, itemInfo in ipairs( blockInfo ) do

			local itemType = fnGetItemBlockType( itemInfo )

			if itemType == blockType then

    			local slotWnd = nil

    			if blockType == blockTypes.COMMON then

    				slotWnd = self:ObtainItemSlot()
					
					if itemInfo.type == ai.BundleContent.CUSTOM_ELEMENT and UI:GetCustomizationTypeByName( itemInfo.defName ) == ai.VesselCustomElementType.STICKER then
						self:LoadStickerTextures( { itemInfo.defName } )
					end
					
    				slotWnd:Setup( itemInfo )

    			elseif blockType == blockTypes.SHIPS then

    				slotWnd = self:ObtainShipSlot()

    				slotWnd:Setup( itemInfo.defName )

					slotWnd:AnimateBgNoFrame()

					if UI:IsShipPremium( itemInfo.defName ) then
						slotWnd:ShowGoldFrame()
					end

					if itemInfo.bElite then
						slotWnd:ShowBlink()
					end

				elseif blockType == blockTypes.PARTS then

					if itemInfo.type == ai.BundleContent.CRAFT_RESOURCE and UI:IsDefShipPart( itemInfo.defName ) then
    					slotWnd = self:ObtainShipPartSlot()
    					slotWnd:Setup( itemInfo.defName, itemInfo.count, itemInfo.bElite )

					elseif itemInfo.type == ai.BundleContent.VESSEL_BUDGET then
						slotWnd = self:ObtainSpecModulePartSlot()
						slotWnd:Setup( itemInfo.shipDefName, itemInfo.count )

					else
						sys.log( "UI.BuyBundle_ContentListWnd:FullUpdate()[ERROR]: unhandled bundle content type" )
					end

    			end			

    			if slotWnd then

        			local slotX = ( slotIdx - 1 ) * ( slotWidth + self.spaceX_slots )

        			if ( slotX + slotWidth ) > selfWidth and slotIdx > 1 then

        				rowIdx		= rowIdx + 1
        				slotIdx		= 1
        				rowY		= rowY + slotHeight + self.spaceY_slots
        				slotX		= 0

        			end

        			slotWnd:SetLeft( UI:XRel2Snapped( slotX ) )
        			slotWnd:SetTop( UI:YRel2Snapped( rowY ) )

        			slotIdx = slotIdx + 1

        			if rowY + slotHeight > selfHeight then
        				selfHeight = rowY + slotHeight
        			end

    			end

			else

				if not bInvalidTypeLogged then
					sys.log( "UI.BuyBundle_ContentListWnd:FullUpdate()[ERROR]: invalid format of \"ui_content\" for bundle \"%s\"; ships and ship parts expected in separated blocks", self.defName )
					bInvalidTypeLogged = true
				end

			end

		end

		rowIdx		= rowIdx + 1
		slotIdx		= 1
		rowY		= rowY + slotHeight + self.spaceY_slots

	end

	self:SetHeight( selfHeight )	

end


--
function UI.BuyBundle_ContentListWnd:LoadStickerTextures( stickerNames )

	for idx, stickerName in pairs( stickerNames ) do

		if not self.stickerTextures[ stickerName ] then
			local path = UI:GetStickerDecalPath( stickerName )
			self.stickerTextures[ stickerName ] = UI:LoadTexture( string.format( "sticker_%s", stickerName ), path, UI:ZeroQuat() )
		end

	end

end


--
function UI.BuyBundle_ContentListWnd:UnloadStickerTextures()

	for stickerName, hTex in pairs( self.stickerTextures ) do
		UI:UnloadTexture( hTex, true )
	end

	self.stickerTextures = {}

end


--
function UI.BuyBundle_ContentListWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	end
	
	self:UnloadStickerTextures()

end


-- ----------------------------------------------------------------------------
-- UI.BuyBundle_ContentItemSlotWnd
-- ----------------------------------------------------------------------------

UI.BuyBundle_ContentItemSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.BuyBundle_ContentItemSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "BuyBundle_ContentItemSlotWnd",	
		isPrototype	= true,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.BuyBundle_ContentItemSlotWnd:Setup( item )

	self:Reset()

	self.item = item
	self:FullUpdate()
 
end


--
function UI.BuyBundle_ContentItemSlotWnd:Reset()

	self.item = nil

	self.itemIcoWnd:Reset()
	self.itemIcoWnd:HideMain()
	self.itemIcoWnd:HideIcoMain()

end


-- ---------------------------
-- vars
-- ---------------------------

UI.BuyBundle_ContentItemSlotWnd.item		= nil
UI.BuyBundle_ContentItemSlotWnd.itemIcoWnd	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.BuyBundle_ContentItemSlotWnd:F_PostLoad()

    UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()	

end


--
function UI.BuyBundle_ContentItemSlotWnd:CreateControls()	

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self:AddChild( self.itemIcoWnd )

	self:SetWidth( self.itemIcoWnd:GetWidth() )
	self:SetHeight( self.itemIcoWnd:GetHeight() )

end


--
function UI.BuyBundle_ContentItemSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.BuyBundle_ContentItemSlotWnd:UpdateIco()

    if self.item.type == ai.BundleContent.ITEM then

		if self.item.defName ~= "" then

        	self.itemIcoWnd:SetupForItem( self.item.defName, self.item.bEnchanted )

        	if self.item.count > 1 then
        		self.itemIcoWnd:SetCountResources( self.item.count )
        	end

			if self.item.bElite then
				self.itemIcoWnd:ShowBlinkffect()
			end

		end

    elseif self.item.type == ai.BundleContent.EXP then

    	local hTex = UI:GetMailAttachmentSynergyFreeIco()
    	self.itemIcoWnd:SetupIco( hTex )
		self.itemIcoWnd:SetCountResources( self.item.val )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
        -- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

    elseif self.item.type == ai.BundleContent.CUSTOM_ELEMENT then
	
		self.itemIcoWnd:SetupShipCustomuzation( self.item.defName )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

    elseif self.item.type == ai.BundleContent.TITLE then

    	local hTex = UI:GetMailAttachmentTitleIco()
    	self.itemIcoWnd:SetupIco( hTex )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
        -- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

    elseif self.item.type == ai.BundleContent.ACCOUNT_AURA then

    	local hTex = UI:GetTex( "bundleContent_ACCOUNT_AURA" )
    	self.itemIcoWnd:SetupIco( hTex )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
        -- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

    elseif self.item.type == ai.BundleContent.INVENTORY_EXT then

    	local hTex = UI:GetTex( "bundleContent_INVENTORY_EXT" )
    	self.itemIcoWnd:SetupIco( hTex )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
        -- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

    elseif self.item.type == ai.BundleContent.CRAFT_RESOURCE then

		if self.item.defName ~= "" then

        	self.itemIcoWnd:SetupForItem( self.item.defName )

        	if self.item.count > 1 then
        		self.itemIcoWnd:SetCountResources( self.item.count )
        	end

    		if self.item.bElite then
    			self.itemIcoWnd:ShowBlinkffect()
    		end

		end

    elseif self.item.type == ai.BundleContent.BLUEPRINT then

		if self.item.defName ~= "" then

        	self.itemIcoWnd:SetupForItem( self.item.defName )

        	if self.item.count > 1 then
        		self.itemIcoWnd:SetCountResources( self.item.count )
        	end

    		if self.item.bElite then
    			self.itemIcoWnd:ShowBlinkffect()
    		end

		end

    elseif self.item.type == ai.BundleContent.EVENT_CREDITS then

    	local hTex = UI:GetMailAttachmentEventCreditsIco()
    	self.itemIcoWnd:SetupIco( hTex )
		
		if self.item.val > 1 then
        	self.itemIcoWnd:SetCountResources( self.item.val )
        end

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
        -- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end
		
	elseif self.item.type == ai.BundleContent.AVATAR then

		local hTex = UI:GetAvatarTexture( self.item.defName )
		self.itemIcoWnd:SetupIco( hTex )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
		-- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end
		
	elseif self.item.type == ai.BundleContent.MOTTO then

		local hTex = UI:GetMottoIco()
		self.itemIcoWnd:SetupIco( hTex )

		-- #0100859 - без цвета
		-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
		-- self.itemIcoWnd:ShowColorBg2( color )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end
		
	elseif self.item.type == ai.BundleContent.AUTOGEN then

		self.itemIcoWnd:SetupForAutogenItemNotRolled( self.item.autogenClassId, self.item.rank )

		if self.item.count > 1 then
			self.itemIcoWnd:SetCountResources( self.item.count )
		end

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end
		
	elseif self.item.type == ai.BundleContent.PREMIUM then
	
		local hTex = UI:GetMailAttachmentPremiumIco()
		self.itemIcoWnd:SetupIco( hTex )

		if self.item.bElite then
			self.itemIcoWnd:ShowBlinkffect()
		end

	else
		sys.log( "UI.BuyBundle_ContentItemSlotWnd:UpdateIco()[ERROR]: unhandled item type %d", tostring( self.item.type ) )
    end

end


--
function UI.BuyBundle_ContentItemSlotWnd:UpdateTooltip()

	local tooltipData = nil

    if self.item.type == ai.BundleContent.ITEM then

		if UI:IsDefModule( self.item.defName ) or UI:IsDefAmmo( self.item.defName ) then

    		tooltipData = {}

    		tooltipData.tooltipType 	= UI.tooltipTypes.MODULE
    		tooltipData.defName			= self.item.defName
			tooltipData.bEnchanted		= self.item.bEnchanted
			
		else
			tooltipData = UI:GetTooltipForItem( self.item.defName )
		end

	elseif self.item.type == ai.BundleContent.EXP then

		tooltipData = {}
    	tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:MailAttachmentSynergyFree2Str( self.item.val )

	elseif self.item.type == ai.BundleContent.CUSTOM_ELEMENT then

		tooltipData = {}

		tooltipData.tooltipType	= UI.tooltipTypes.CUSTOMIZATION
		tooltipData.defName		= self.item.defName

	elseif self.item.type == ai.BundleContent.TITLE then

    	tooltipData = {}

        tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
    	tooltipData.caption		= UI:MailAttachmentTitle2Str( self.item.id )
    	tooltipData.text		= UI:GetTitleDesc( self.item.id )

	elseif self.item.type == ai.BundleContent.ACCOUNT_AURA then

		tooltipData = {}

		tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		tooltipData.caption		= UI:AccountAura2Str( self.item.defName )
		tooltipData.text		= UI:GetAccountAuraDesc( self.item.defName )

	elseif self.item.type == ai.BundleContent.INVENTORY_EXT then

		tooltipData = {}

		tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		tooltipData.caption		= UI:GetStringByName( "bundleContent_INVENTORY_EXT_tooltipCaption" )
		tooltipData.text		= UI:BundleItem2Str( self.item, false, UI.TooltipWnd_shared:GetTextColor() )

	elseif self.item.type == ai.BundleContent.CRAFT_RESOURCE then

		tooltipData = UI:GetTooltipForItem( self.item.defName )

	elseif self.item.type == ai.BundleContent.BLUEPRINT then

		tooltipData = UI:GetTooltipForItem( self.item.defName )

	elseif self.item.type == ai.BundleContent.EVENT_CREDITS then

    	tooltipData = {}

    	tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:MailAttachmentEventCredits2Str( self.item.val )
		
	elseif self.item.type == ai.BundleContent.AVATAR then

		tooltipData = {}
	
		tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:BundleItem2Str( self.item )
		
	elseif self.item.type == ai.BundleContent.MOTTO then

		tooltipData = {}
	
		tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:BundleItem2Str( self.item )
		
	elseif self.item.type == ai.BundleContent.AUTOGEN then

		tooltipData = {}
	
		tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:BundleItem2Str( self.item )
		
	elseif self.item.type == ai.BundleContent.PREMIUM then
	
		local tooltipData = {}
		tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
		tooltipData.text		= UI:BundleItem2Str( self.item )

	else
		sys.log( "UI.BuyBundle_ContentItemSlotWnd:UpdateTooltip()[ERROR]: unhandled item type %d", tostring( self.item.type ) )
    end


	self.itemIcoWnd:SetTooltipData( tooltipData )

end


-- ------------------------------------------------------------
-- UI.BuyBundle_TradeWnd
-- ------------------------------------------------------------

UI.BuyBundle_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "BuyBundle_TradeWnd",
    	},
	},

	mainWndName = "BuyBundleWnd",
}

-- ------------------------------------------------------------
-- UI.BuyBundle_BuyWithInventoryWnd
-- ------------------------------------------------------------

UI.BuyBundle_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "BuyBundle_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "BuyBundleWnd",
}