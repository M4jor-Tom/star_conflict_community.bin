-- -----------------------------------------------------------
-- UI.ShipWnd
-- -----------------------------------------------------------

UI.ShipWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

--
UI.ShipWnd.layers =
{
	MAIN_EFFECT	= 0,
	WAIT_EFFECT	= 1,
	WAIT_TEXT	= 2,
}


--
UI.ShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "ship_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ship_info",
						wnd			= "UI.Ship_InfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_prop",
						wnd			= "UI.Ship_MainParamsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_proper",
						wnd			= "UI.Ship_ParamsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "survival",
						wnd			= "UI.Ship_SurvivabilityWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_modules",
						wnd			= "UI.Ship_ItemsSlotsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Ship_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ShipWnd.layers.WAIT_EFFECT",
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
						layer		= "UI.ShipWnd.layers.WAIT_TEXT",
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

	children =
	{
		"UI.Ship_InfoWnd",
		"UI.Ship_MainParamsWnd",
		"UI.Ship_ParamsWnd",
		"UI.Ship_SurvivabilityWnd",
		"UI.Ship_ItemsSlotsWnd",
		"UI.Ship_DlcBtn",
		"UI.Ship_PriceBtn_credits",
		"UI.Ship_PriceBtn_gold",
		"UI.Ship_TestDriveBtn",
		"UI.Ship_CrossBtn",
	}
}

-- ---------------------------
-- interface funcitons
-- ---------------------------

--
function UI.ShipWnd:Setup( shipDefName, launchData )

	self:Reset()

	self.shipDefName	= shipDefName
	self.launchData		= launchData
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ShipWnd:GetShipDefName()

	return self.shipDefName

end


--
function UI.ShipWnd:GetLaunchData()

	return self.launchData

end


--
function UI.ShipWnd:HandleEscape()

	self:Close( true )
	return true

end


--
function UI.ShipWnd:GetItemsSlotsPos()

	local pos = UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		pos = mainEffect:GetObjPos( self.effectInfo.main.itemsSlotsLocator )
	end

	pos.x = self:XToScreen( pos.x )
	pos.y = self:YToScreen( pos.y )

	return pos

end


--
function UI.ShipWnd:OnTradeResult_Buy( shopItem, count, priceType, bBuyForShipParts )

	if UI:IsDefShip( shopItem.defName ) then
		self:DoBuyShip( shopItem, bBuyForShipParts )

	elseif UI:IsDefBundle( shopItem.defName ) then
		self:DoBuyBundle( shopItem )
	end

end


--
function UI.ShipWnd:OnBuyWithInventoryWndResult( result, data )

	if result == true then
		self:BuyInventory( data.inventoryLevels )
	else
		self.itemToBuy			= nil
		self.bToBuyForShipParts	= false
	end

end


--
function UI.ShipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyRequestId						= 0
	self.buyInventoryRequestId				= 0
    self.itemToBuy							= nil
	self.bToBuyForShipParts					= false
	self.bWaitOwnVessels					= false
	self.buyingShipDefName					= ""
	self.battleSlotToInstallNewShip			= -1
	self.changeBattleSlotVesselRequiestId	= 0

	self:UpdateWaitingEffect()

end


--
function UI.ShipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for btnIdx, btn in pairs( self.curBtns ) do
		if UI:IsWndKindOf( btn, "Ship_PriceBtn" ) then
            btn:OnPlayerCreditsChanged()
		end
	end	

end


--
function UI.ShipWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShipWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShipWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShipWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	UI.Ship_TradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.Ship_BuyWithInventoryWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI.Ship_TradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end



--
function UI.ShipWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	UI.Ship_TradeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.Ship_BuyWithInventoryWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.buyRequestId then

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
		
			local shopItem = UI:GetShopItemById( param1 )
			if shopItem then
			
				if UI:IsDefShip( shopItem.defName ) then
				
					local role = UI:GetItemRole( shopItem.defName )
					
					if not UI.RoleInfoWnd:IsRoleShown( role ) then
						UI.RoleInfoWnd:ShowAsNotification( role )
					end
				
				end
			
			else
				sys.log( "UI.ShipWnd:GameStore_OnBuyItem()[ERROR]: no shop item for id %d", param1 )
			end
		
		else

			UI:ShowMsgOnBuyError( result )

			self.bWaitOwnVessels			= false
			self.buyingShipDefName			= ""
			self.battleSlotToInstallNewShip	= -1

		end

		self.buyRequestId = 0
		self:UpdateWaitingEffect()

	end

end


--
function UI.ShipWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if self.buyInventoryRequestId == requestId then

		self.buyInventoryRequestId = 0

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if self:IsOnScreen() then

        		if self.itemToBuy then

                	if UI:IsDefShip( self.itemToBuy.defName ) then
                		self:DoBuyShip( self.itemToBuy, self.bToBuyForShipParts )

                	elseif UI:IsDefBundle( self.itemToBuy.defName ) then
                		self:DoBuyBundle( self.itemToBuy )
                	end

        		end		

			end

    	else

    		UI:ShowMsgOnBuyError( result )

    	end

		self:UpdateWaitingEffect()

        self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

	end

end


--
function UI.ShipWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	local bWasWaitOwnVessels = self.bWaitOwnVessels
	if self.bWaitOwnVessels then
		self.bWaitOwnVessels = false
		self:UpdateWaitingEffect()
	end

	local bChangeSlotError = false

	if result == 0 then

		-- установка вновь созданного корабля в боевой слот

		if bWasWaitOwnVessels then

			local shipItem = UI:GetShipItemByDef( self.buyingShipDefName, false )
			if shipItem then

            	if self.battleSlotToInstallNewShip ~= -1 then
            	
            		self:ChangeShipInBattleSlot( self.battleSlotToInstallNewShip, shipItem.vid, false )
            		self.battleSlotToInstallNewShip	= -1

        			if self.changeBattleSlotVesselRequiestId == 0 then
        				bChangeSlotError = true
        			end

            	end

			else
				sys.log( "UI.ShipWnd:GameStore_OnOwnedVessels()[ERROR]: cannot find ship item for \"%s\" that was supposedly just bought", self.buyingShipDefName )
				self.buyingShipDefName			= ""
				self.battleSlotToInstallNewShip	= -1
			end

		end

	else

		if bWasWaitOwnVessels then

			sys.log( "UI.ShipWnd:GameStore_OnOwnedVessels()[ERROR]: GameStore_OnOwnedVessels() error: %d", result )

			self.buyingShipDefName			= ""
			self.battleSlotToInstallNewShip	= -1

		end

	end


	-- закрытие окна, если есть корабль и нет ожидания установки в слот,
	-- в учебнике закрытие также при ошибке

	if self:IsOnScreen() then

    	if result == 0 then

			local shipItem = UI:GetShipItemByDef( self.shipDefName, false )	
			if shipItem then

    			local bWaitingChangeSlot = self.changeBattleSlotVesselRequiestId ~= 0 and self.buyingShipDefName == self.shipDefName
    			if not bWaitingChangeSlot then
    				self:Close( false )
    			end

			end

    	end

	end
	
	if result == 0 and self:IsOnScreen() then
		self:UpdateBtns()
	end

end


--
function UI.ShipWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if result ~= _G.GameStore.ChangeBSResult.CBSR_OK then		
		if requestId == self.changeBattleSlotVesselRequiestId then
    		UI:ShowMsgOnChangeBatleSlotVesselError( result )
		end
	end

	-- закрытие окна

	if self:IsOnScreen() then

		if requestId == self.changeBattleSlotVesselRequiestId and self.buyingShipDefName == self.shipDefName then
			self:Close( false )
		end

	end

	if requestId == self.changeBattleSlotVesselRequiestId then

		self.changeBattleSlotVesselRequiestId = 0
		self:UpdateWaitingEffect()

		self.buyingShipDefName = ""

	end

end


--
function UI.ShipWnd:OnBuyBundleWndResult( result, defName, data )
end


-- ---------------------------
-- const
-- ---------------------------

UI.ShipWnd.effectInfo =
{
	main =
	{
		itemsSlotsLocator	= "ship_modules",
		btnLocator_1		= "btn_6",
		btnLocator_2		= "btn_7",
		minSizeLocator		= "min_dist",
		maxSizeLocator		= "self",
	}
}

UI.ShipWnd.sounds =
{
	tradeWndShow			= "sound/ui/btnClick",
	changeShipInBattleSlot	= "sound/ui/btnClick",
	tradeWndHide			= "sound/ui/MsgHide",
	buyBundle				= UI.sounds.btnClick,
}

-- ---------------------------
-- vars
-- ---------------------------

UI.ShipWnd.shipDefName						= ""
UI.ShipWnd.launchData						= nil
UI.ShipWnd.infoWnd							= nil
UI.ShipWnd.itemSlotsWnd						= nil
UI.ShipWnd.mainParamsWnd					= nil
UI.ShipWnd.survivabilityWnd					= nil
UI.ShipWnd.paramsWnd						= nil
UI.ShipWnd.minHeight						= 0
UI.ShipWnd.maxHeight						= 0
UI.ShipWnd.space_btns						= 0
UI.ShipWnd.btnsCenterX						= 0
UI.ShipWnd.dlcBtn							= nil
UI.ShipWnd.creditsBtn						= nil
UI.ShipWnd.goldBtn							= nil
UI.ShipWnd.testDriveBtn						= nil
UI.ShipWnd.curBtns							= {}
UI.ShipWnd.buyRequestId						= 0
UI.ShipWnd.buyInventoryRequestId			= 0
UI.ShipWnd.itemToBuy						= nil
UI.ShipWnd.bToBuyForShipParts				= false
UI.ShipWnd.bWaitOwnVessels					= false
UI.ShipWnd.buyingShipDefName				= ""
UI.ShipWnd.battleSlotToInstallNewShip		= -1
UI.ShipWnd.changeBattleSlotVesselRequiestId	= 0

-- ---------------------------
-- work funcitons
-- ---------------------------

--
function UI.ShipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.infoWnd			= UI.Ship_InfoWnd
	self.itemSlotsWnd		= UI.Ship_ItemsSlotsWnd
	self.mainParamsWnd		= UI.Ship_MainParamsWnd
	self.survivabilityWnd	= UI.Ship_SurvivabilityWnd
	self.paramsWnd			= UI.Ship_ParamsWnd
	self.dlcBtn				= UI.Ship_DlcBtn
	self.creditsBtn			= UI.Ship_PriceBtn_credits
	self.goldBtn			= UI.Ship_PriceBtn_gold
	self.testDriveBtn		= UI.Ship_TestDriveBtn

	self.dlcBtn:UnlinkFromParent()
	self.creditsBtn:UnlinkFromParent()
	self.goldBtn:UnlinkFromParent()

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

	self:UpdateWaitingEffect()
	
end


--
function UI.ShipWnd:Reset()

	self.shipDefName	= ""
	self.launchData		= nil

	self:ResetContent()

end


--
function UI.ShipWnd:ResetContent()

	self.infoWnd:Reset()
	self.itemSlotsWnd:Reset()
	self.mainParamsWnd:Reset()
	self.paramsWnd:Reset()
	self.survivabilityWnd:Reset()
	self:ResetBtns()

end


--
function UI.ShipWnd:FullUpdate()

	self:ResetContent()                                             

	if self.shipDefName == "" then
		return
	end

	self.infoWnd:Setup( self.shipDefName )
    self.paramsWnd:Setup( self.shipDefName )
    self.itemSlotsWnd:Setup( self.shipDefName )
    self.mainParamsWnd:Setup( self.shipDefName )
    self.survivabilityWnd:Setup( self.shipDefName )
	self:UpdateBtns()

	self:RecalcLayout()

end


--
function UI.ShipWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local minSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )
	local btnPos1	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.btnLocator_1 ) or Vec2( 0, 0 )
	local btnPos2	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.btnLocator_2 ) or Vec2( 0, 0 )
	local btnWidth	= self.dlcBtn:GetWidth()

	self.minHeight	= minSize.y
	self.maxHeight	= maxSize.y
	
	self.space_btns		= btnPos2.x - ( btnPos1.x + btnWidth )	
	self.btnsCenterX	= btnPos1.x + ( ( btnPos2.x + btnWidth ) - btnPos1.x ) / 2

end


--
function UI.ShipWnd:RecalcLayout()

	-- собственный размер и анимация
	-- (локаторы нижних кнопок смещаются анимацией)

	local selfHeight = UI.HangarWnd:GetBottomPanelY() - self:GetTop()
	self:SetHeight( selfHeight )

	local width = self:XToParent( self:XToWindow( 1024 ) ) - self:GetLeft()		-- ширина на весь экран; на self нельзя расчитывать, т.к. он не увеличивается в зависимости от разрешения, и на больших разрешениях его может не хватить
	self:SetWidth( width )

	local animHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )
	local animTime = ( animHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

	self.itemSlotsWnd:RecalcLayout()
	self.paramsWnd:RecalcLayout()
	self:RecalcBtnsLayout()	

end


--
function UI.ShipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ShipWnd:ResetBtns()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for btnIdx, btn in pairs( self.curBtns ) do	

		btn:UnlinkFromParent()

		if mainEffect then
			mainEffect:UnlinkWnd( btn:GetUiHandle(), "" )
		end

	end

	self.curBtns = {}

end


--
function UI.ShipWnd:UpdateBtns()

	self:ResetBtns()
	
	local shipItem		= UI:GetShipItemByDef( self.shipDefName, true )	
	local bIsBought		= shipItem ~= nil and not shipItem.conserved	-- куплен сейчас
	local bWasBought	= shipItem ~= nil								-- покупался хоть раз

	if UI:IsShipDlc( self.shipDefName ) then
	
		-- dlc можно купить всегда - для них не проверяется ранг и разлочка предыдущих кораблей
		local bCanBuy = not bWasBought

		table.insert( self.curBtns, self.dlcBtn )
		self.dlcBtn:Setup( UI:GetShipDlcName( self.shipDefName ) )
		self.dlcBtn:Enable( bCanBuy ) 

		if UI:IsShipBuildableFromShipParts( self.shipDefName ) then

			table.insert( self.curBtns, self.goldBtn )
			self.goldBtn:SetupShipParts( self.shipDefName )
			self.goldBtn:Enable( bCanBuy ) 

		end

	else
	
		local bCanBuy = true
		
		if bIsBought then
			bCanBuy = false
		else
			if not bWasBought then	-- если был куплен хотя бы раз, то повторно можно купить всегда
				if not UI:IsEnoughAccountRankForItem( self.shipDefName ) or UI:IsShipLockedByDependancy( self.shipDefName ) then
					bCanBuy = false
				end
			end
		end

		if UI:IsShipBuildableFromShipParts( self.shipDefName ) then

			table.insert( self.curBtns, self.goldBtn )
			self.goldBtn:SetupShipParts( self.shipDefName )
			self.goldBtn:Enable( bCanBuy ) 

        else

    		if UI:IsShipGold( self.shipDefName ) then
				table.insert( self.curBtns, self.goldBtn )
				self.goldBtn:SetupPrice( self.shipDefName )
				self.goldBtn:Enable( bCanBuy ) 
			else
				table.insert( self.curBtns, self.creditsBtn )
				self.creditsBtn:SetupPrice( self.shipDefName )
				self.creditsBtn:Enable( bCanBuy ) 
			end

		end

	end
	
	table.insert( self.curBtns, self.testDriveBtn )

	for btnIdx, btn in pairs( self.curBtns ) do
		self:AddChild( btn )
	end
	
	self:RecalcBtnsLayout()	

end


--
function UI.ShipWnd:RecalcBtnsLayout()

	-- позиция y меняется в зависимости от анимации
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local btnsY = ( mainEffect and mainEffect:GetObjPos( self.effectInfo.main.btnLocator_1 ) or Vec2( 0, 0 ) ).y
	
	local btnsWidth = 0	
	for btnIdx, btn in pairs( self.curBtns ) do
		btnsWidth = btnsWidth + btn:GetWidth()
	end	
	btnsWidth = btnsWidth + self.space_btns * ( #self.curBtns - 1 )
	
	local btnsX = self.btnsCenterX - btnsWidth / 2
	
	local x = btnsX
	for btnIdx, btn in ipairs( self.curBtns ) do	
		btn:SetPos( x, btnsY )
		x = x + btn:GetWidth() + self.space_btns
	end

end


--
function UI.ShipWnd:OnAccountAurasChanged()

	for btnIdx, btn in pairs( self.curBtns ) do
		if UI:IsWndKindOf( btn, "Ship_PriceBtn" ) then
            btn:OnAccountAurasChanged()
		end
	end

end


--
function UI.ShipWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == UI.Ship_DlcBtn then

		if not self:IsWaiting() then

			local dlcName = UI:GetShipDlcName( self.shipDefName )

		    if _G.Arc_IsInitialized() then
				self:TryBuyArcDlc( dlcName )
			else
				UI:LaunchDlcLink( dlcName )
			end

		end

	elseif UI:IsWndKindOf( w, "Ship_PriceBtn" ) or UI:HasWndAncestorKindOf( w, "Ship_PriceBtn" ) then

		if not self:IsWaiting() then

			local priceBtn = nil
			if UI:IsWndKindOf( w, "Ship_PriceBtn" ) then
				priceBtn = w
			else
				priceBtn = UI:GetAncestorKindOf( w, "Ship_PriceBtn" )
			end
			
			if priceBtn:IsEnabled() then	-- цена отображается в виде ссылки(окна), поэтому при клике на нее может прийти сюда, даже если сама кнопка залочена

				local mode = priceBtn:GetMode()

				if mode == UI.Ship_PriceBtn.modes.PRICE then

					self:TryBuyShip( false )

				elseif mode == UI.Ship_PriceBtn.modes.SHIP_PARTS then

					if UI:IsEnoughShipPartsForShip( self.shipDefName ) then
						self:TryBuyShip( true )
					else
						local bundleDefName = UI:GetShipPartsBundleForShip( self.shipDefName )
						if bundleDefName ~= "" then
							self:LaunchBuyBundleWnd( bundleDefName, { shipDefName = self.shipDefName } )
						end
					end

				end
				
			end

		end

	elseif w == UI.Ship_CrossBtn then

		self:Close( true )
		
	elseif w == self.testDriveBtn then
	
		UI:LaunchTestDrive( self.shipDefName )
		
	end

	return true

end


--
function UI.ShipWnd:Close( bSound )

	local bHandled = true

	if self.launchData then

		if self.launchData.bShipsTree then

			UI.HangarWnd:OpenShips( self.shipDefName, bSound, false, nil, self.launchData.shipsTreeLaunchData )
			bHandled = true

		elseif self.launchData.bAtlas then

			if type( self.launchData.uid ) == "userdata" then
				UI:ShowProfile( self.launchData.uid, "ATLAS", bSound, self.launchData.restoreData, self.launchData.profileLaunchData )
				bHandled = true
			else
				sys.log( "UI.ShipWnd:Close()[ERROR]: invalid type of launchData.uid for bAtlas data mode; \"userdata\" expected, got \"%s\"", type( self.launchData.uid ) )
			end
			
		elseif self.launchData.bActions then
		
			UI.HangarWnd:OpenAction( self.launchData.selActionId, bSound, self.launchData.marketingLaunchData )
			bHandled = true

		else
			sys.log( "UI.ShipWnd:Close()[ERROR]: unhandled launchData" )
		end

	end

	if not bHandled then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, bSound, false )
	end

end


--
function UI.ShipWnd:TryBuyArcDlc( dlcName )

	if self:IsWaiting() then
		return
	end

	if type( dlcName ) ~= "string" then
		sys.log( "UI.ShipWnd:TryBuyArcDlc()[ERROR]: invalid type of the 1-st parameter (\"dlcName\"); \"string\" expected, got \"%s\"", type( dlcName ) )
		return
	end

	local bundleDefName = UI:GetDlcArcBundle( dlcName )
	if bundleDefName == "" then
		sys.log( "UI.ShipWnd:TryBuyArcDlc()[ERROR]: cannot find arc bundle for dlc \"%s\"", dlcName )
		return
	end

	self:TryBuyBundle( bundleDefName )

end


--
function UI.ShipWnd:TryBuyBundle( bundleDefName )

	if self:IsWaiting() then
		return
	end

	if type( bundleDefName ) ~= "string" then
		sys.log( "UI.ShipWnd:TryBuyBundle()[ERROR]: invalid type of the 1-st parameter (\"bundleDefName\"); \"string\" expected, got \"%s\"", type( bundleDefName ) )
		return
	end

	if UI:IsBundleContentFullyCollected( bundleDefName ) then
		sys.log( "UI.ShipWnd:TryBuyBundle()[ERROR]: bundle \"%s\" is considered to be fully collected", bundleDefName )
		UI:MessageBox( UI:GetStringByName( "msgBundleContentCollected_caption" ), UI:GetStringByName( "msgBundleContentCollected_text" ), UI.MBS_OK )
		return
	end

	local shopItem = UI:GetShopItemByDef( bundleDefName )
	if not shopItem then
		sys.log( "UI.ShipWnd:TryBuyBundle()[ERROR]: cannot find shop item for \"%s\"", bundleDefName )
		return
	end

	if UI:IsEnoughPlaceInInventoryForItem( bundleDefName ) then

		self:LaunchTradeWnd( shopItem )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy			= shopItem
			self.bToBuyForShipParts	= false

    		local needSize		= UI:GetNeedInventorySizeForItem( bundleDefName )
    		local curLevel		= UI:GetInventoryCurLevel()
    		local curUsedSize	= UI:GetInventoryCurSize()

    		local inventoryLevelsToBuy = {}

    		for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do

    			table.insert( inventoryLevelsToBuy, levelToBuy )

    			local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
    			if ( curUsedSize + needSize ) <= newCapacity then
    				break
    			end

    		end		

			self:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.ShipWnd:DoBuyBundle( shopItem )

	if self:IsWaiting() then
		sys.log( "UI.ShipWnd:DoBuyBundle()[ERROR]: still is waiting for some other request" )
		return
	end

	local price, priceType = UI:GetBundleRealBuyPrice( shopItem )

	self.bWaitOwnVessels			= false
	self.buyingShipDefName			= ""
	self.battleSlotToInstallNewShip	= -1

	self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, priceType )

	if self.buyRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipWnd:IsWaiting()

	return
		self.buyRequestId ~= 0
		or self.buyInventoryRequestId ~= 0
		or self.bWaitOwnVessels
		or self.changeBattleSlotVesselRequiestId ~= 0

end


--
function UI.ShipWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ShipWnd:LaunchTradeWnd( shopItem, bBuyForShipParts )

	UI.Ship_TradeWnd:SetupForBuy( shopItem, nil, bBuyForShipParts )
	UI.Ship_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipWnd:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy, bBuyForShipParts )

	UI.Ship_BuyWithInventoryWnd:Setup( shopItem, inventoryLevelsToBuy, bBuyForShipParts )
	UI.Ship_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipWnd:HideChildModals()

	UI.Ship_TradeWnd:UnlinkFromParent()

	UI.Ship_BuyWithInventoryWnd:UnlinkFromParent()
    self.itemToBuy			= nil
	self.bToBuyForShipParts	= false

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		UI.BuyBundleWnd:Hide()
	end

end


--
function UI.ShipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end

end


--
function UI.ShipWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	UI.store.ShipWnd =
	{
		shipDefName							= self.shipDefName,
		launchData							= self.launchData,
		buyRequestId						= self.buyRequestId,
		buyInventoryRequestId				= self.buyInventoryRequestId,
		bWaitOwnVessels						= self.bWaitOwnVessels,
		buyingShipDefName					= self.buyingShipDefName,
		battleSlotToInstallNewShip			= self.battleSlotToInstallNewShip,
		changeBattleSlotVesselRequiestId	= self.changeBattleSlotVesselRequiestId,
	}

end


--
function UI.ShipWnd:F_OnEventRestoreUiState()

	if UI.store.ShipWnd then

		self.shipDefName						= UI.store.ShipWnd.shipDefName
		self.launchData							= UI.store.ShipWnd.launchData
		self.buyRequestId						= UI.store.ShipWnd.buyRequestId
		self.buyInventoryRequestId				= UI.store.ShipWnd.buyInventoryRequestId
		self.bWaitOwnVessels					= UI.store.ShipWnd.bWaitOwnVessels
		self.buyingShipDefName					= UI.store.ShipWnd.buyingShipDefName
		self.battleSlotToInstallNewShip			= UI.store.ShipWnd.battleSlotToInstallNewShip
		self.changeBattleSlotVesselRequiestId	= UI.store.ShipWnd.changeBattleSlotVesselRequiestId

		self:UpdateWaitingEffect()

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.ShipWnd = nil

	end

end


--
function UI.ShipWnd:BuyInventory( inventoryLevels )

	if self:IsWaiting() then

		self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

		sys.log( "UI.ShipWnd:BuyInventory()[ERROR]: is still waiting for some other request" )

		return

	end

	if type( inventoryLevels ) ~= "table" or not next( inventoryLevels ) then

		self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

		sys.log( "UI.ShipWnd:BuyInventory()[ERROR]: invalid \"inventoryLevels\" param" )

		return

	end

	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )

	if self.buyInventoryRequestId == 0 then

    	self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

    	UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )

	end

    self:UpdateWaitingEffect()

end


--
function UI.ShipWnd:TryBuyShip( bForShipParts )

	if self:IsWaiting() then
		return
	end

	local shopItem = UI:GetShopItemByDef( self.shipDefName )
	if not shopItem then
		sys.log( "UI.ShipWnd:TryBuyShip()[ERROR]: cannot find shopItem for \"%s\"", tostring( self.shipDefName ) )
		return
	end

	local bEnoughInventorySize = true
	if not UI:GetShipItemByDef( self.shipDefName, true ) then	-- при расконсервации ранее купленного корабля места на складе не нужно
		bEnoughInventorySize = UI:IsEnoughPlaceInInventoryForItem( self.shipDefName )
	end

	if bEnoughInventorySize then

		self:LaunchTradeWnd( shopItem, bForShipParts )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy			= shopItem
			self.bToBuyForShipParts	= bForShipParts

    		local needSize		= UI:GetNeedInventorySizeForItem( self.shipDefName )
    		local curLevel		= UI:GetInventoryCurLevel()
    		local curUsedSize	= UI:GetInventoryCurSize()

    		local inventoryLevelsToBuy = {}

    		for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do

    			table.insert( inventoryLevelsToBuy, levelToBuy )

    			local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
    			if ( curUsedSize + needSize ) <= newCapacity then
    				break
    			end

    		end		

			self:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy, bForShipParts )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end	


--
function UI.ShipWnd:DoBuyShip( shopItem, bForShipParts )

	if self:IsWaiting() then
		sys.log( "UI.ShipWnd:DoBuyShip()[ERROR]: still is waiting for some other request" )
		return
	end

	self.bWaitOwnVessels			= false
	self.buyingShipDefName			= ""
	self.battleSlotToInstallNewShip	= -1

	if bForShipParts then
		self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1 )
	else
		local bGold = UI:IsShipGold( shopItem.defName )
		local creditsType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS		
		self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, creditsType )
	end

	if self.buyRequestId ~= 0 then

		self.bWaitOwnVessels	= true
		self.buyingShipDefName	= shopItem.defName

		local selSlot = UI.HangarWnd:GetSelShipSlot()	-- не равнозначно UI.HangarWnd:GetSelBattleSlot(), выделенный боевой слот -1 в режиме просмотра корабля
		if selSlot ~= -1 then

			local vidInSelSlot = UI.serverData.battleSlots[ selSlot ]
			if vidInSelSlot == nil or vidInSelSlot == UI.INVALID_U64_ID then
	    		self.battleSlotToInstallNewShip = selSlot
			end

		else
			sys.log( "UI.ShipWnd:DoBuyShip()[ERROR]: cannot find selected slot" )
		end

	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipWnd:ChangeShipInBattleSlot( slotIdx, vid, bSound )

	if self:IsWaiting() then
		sys.log( "UI.ShipWnd:ChangeShipInBattleSlot()[ERROR]: is still waiting for some other request" )
		return false
	end

	self.changeBattleSlotVesselRequiestId = _G.GameStore_ChangeBattleSlotVessel( slotIdx - 1, vid )

	if self.changeBattleSlotVesselRequiestId == 0 then
		UI:ShowMsgOnChangeBatleSlotVesselError( _G.GameStore.ChangeBSResult.CBSR_ERROR )
		return false
	else
    	if bSound then
        	UI:PlayGlobalSound( self.sounds.changeShipInBattleSlot )
    	end
	end

	self:UpdateWaitingEffect()

	return true

end


--
function UI.ShipWnd:LaunchBuyBundleWnd( bundleDefName, data )

	UI.BuyBundleWnd:Setup( bundleDefName, data, self:GetScriptTableName(), false )
	UI.BuyBundleWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipWnd:OnResourcesChanged()

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then

		local shipDefName = UI.BuyBundleWnd:GetData().shipDefName

		if UI:IsShipBuildableFromShipParts( shipDefName ) and UI:IsEnoughShipPartsForShip( shipDefName ) then
			UI.BuyBundleWnd:Hide()
		end		

	end

	for btnIdx, btn in pairs( self.curBtns ) do
		if UI:IsWndKindOf( btn, "Ship_PriceBtn" ) then
            btn:OnResourcesChanged()
		end
	end

end


-- -----------------------------------------------------------
-- UI.Ship_InfoWnd
-- -----------------------------------------------------------

UI.Ship_InfoWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Ship_InfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Ship_InfoWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "ship_info",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру и цвету
					{
						objName		= "name",
						layer		= "UI.Ship_InfoWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",
						layer		= "UI.Ship_InfoWnd.layers.ROLE_ICO_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role_title",
						layer		= "UI.Ship_InfoWnd.layers.ROLE_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sinerg",
						layer		= "UI.Ship_InfoWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ROLE_ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipRole_big_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "role_ico",
						layer		= "UI.Ship_InfoWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- ROLE_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "ship_info_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "role_title1",
						layer		= "UI.Ship_InfoWnd.layers.RANK_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "name7",
						layer		= "UI.Ship_InfoWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role_title2",
						layer		= "UI.Ship_InfoWnd.layers.SYNERGY_LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- RANK_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipInfo_rank" ),
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SYNERGY_LEVEL
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
function UI.Ship_InfoWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self:FullUpdate()

end


--
function UI.Ship_InfoWnd:Reset()

	self.shipDefName	= shipDefName
	self.tooltipData	= nil

	self:SetText( "", self.layers.SHIP_NAME )
	self:SetText( "", self.layers.ROLE_NAME )
	self:SetText( "", self.layers.RANK )
	self:SetText( "", self.layers.SYNERGY_LEVEL )

	local roleIcoMainEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_MAIN_EFFECT )
	if roleIcoMainEffect then
		roleIcoMainEffect:SetSpriteTexture( self.effectInfo.roleIcoMain.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Ship_InfoWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------
-- const
-- ---------------------------

UI.Ship_InfoWnd.layers =
{
    MAIN_EFFECT				= 0,
    SHIP_NAME				= 1,
    ROLE_ICO_MAIN_EFFECT	= 2,
    ROLE_ICO_EFFECT			= 3,
    ROLE_NAME				= 4,
    WORK_EFFECT				= 5,	-- нужен, чтобы не двигать по отдельности элементы в зависимости от длины имени корабля
    RANK_LABEL				= 6,
    RANK					= 7,
    SYNERGY_LEVEL			= 8,
}

UI.Ship_InfoWnd.effectInfo =
{
	main =
	{
		shipNameLocator	= "name",
		roleNameLocator	= "role_title",
		workLocator		= "sinerg",
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	},

	roleIcoMain =
	{
		spriteName = "race_ico9"
	},

	roleIco =
	{
		spriteName = "ico"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Ship_InfoWnd.shipDefName			= ""
UI.Ship_InfoWnd.tooltipData			= nil
UI.Ship_InfoWnd.space_name_work		= 0
UI.Ship_InfoWnd.space_work_right	= 0
UI.Ship_InfoWnd.minWidth			= 0
UI.Ship_InfoWnd.maxWidth			= 0
UI.Ship_InfoWnd.workWidth			= 0

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Ship_InfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()

end


--
function UI.Ship_InfoWnd:FullUpdate()

	self:UpdateShipName()
	self:UpdateRole()
	self:UpdateRank()
	self:UpdateSynergy()
	self:UpdateTooltip()

	self:RecalcLayout()

end


--
function UI.Ship_InfoWnd:UpdateShipName()

	local name = UI:GetEntityLocalizedNameByDef( self.shipDefName, true, false, nil, nil )
	self:SetText( name, self.layers.SHIP_NAME )

end


--
function UI.Ship_InfoWnd:UpdateRole()

	local role = UI:GetItemRole( self.shipDefName )

	-- фон иконки

	local race = UI:GetShipRace( self.shipDefName )
	local raceName = UI:Val2Key( ai.Race, race )

	local texBgName = string.format( "shipRole_bg_%s", raceName )
	local hTexBg = UI:GetTex( texBgName )

	local roleIcoMainEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_MAIN_EFFECT )
	if roleIcoMainEffect then
		roleIcoMainEffect:SetSpriteTexture( self.effectInfo.roleIcoMain.spriteName, hTexBg )
	end

	-- иконка

	local hTexRole = UI:GetRoleIco( role )
	local color = UI:GetItemColor( self.shipDefName, false )

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, hTexRole )
		roleIcoEffect:SetColor( color )
	end

	-- имя

	local strRole = UI:Role2Str( role )
	self:SetText( strRole, self.layers.ROLE_NAME )
	
end


--
function UI.Ship_InfoWnd:UpdateRank()

	local rank = UI:GetShipRank( self.shipDefName )
	self:SetText( tostring( rank ), self.layers.RANK )
	
	local color = UI:GetItemColor( self.shipDefName, false, false--[[НЕ "альтернативный" цвет]] )
	self:SetColor( color, self.layers.RANK )
	
end


--
function UI.Ship_InfoWnd:UpdateSynergy()
	
	local str = ""
	
	if not UI:IsShipEvolving( self.shipDefName ) then -- но в этом окне таких кораблей быть не может

		local level = 1

		local shipItem = UI:GetShipItemByDef( self.shipDefName, true )	-- ранее был куплен, но потом продан
		if shipItem then
			level = UI:GetShipLevel( shipItem )
		else
			level = UI:GetShipDefaultLevel( self.shipDefName )
		end

		str = tostring( level )
		
	end
	
	self:SetText( str, self.layers.SYNERGY_LEVEL )

end


--
function UI.Ship_InfoWnd:UpdateTooltip()

	local shipItem = UI:GetShipItemByDef( self.shipDefName, true )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.SHIP,
		defName		= self.shipDefName,
		vid			= shipItem and shipItem.vid or UI.INVALID_U64_ID,		
	}

end


--
function UI.Ship_InfoWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workEffect	= UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	local shipNamePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipNameLocator ) or Vec2( 0, 0 )
	local shipNameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.shipNameLocator ) or Vec2( 0, 0 )
	local roleNamePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.roleNameLocator ) or Vec2( 0, 0 )
	local roleNameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.roleNameLocator ) or Vec2( 0, 0 )
	local workPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.workLocator ) or Vec2( 0, 0 )
	local workSize		= workEffect and workEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selfMinSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local selfMaxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )

    self.space_name_work	= workPos.x - ( math.max( shipNamePos.x + shipNameSize.x, roleNamePos.x + roleNameSize.x ) )
    self.space_work_right	= selfMinSize.x - ( workPos.x + workSize.x )
    self.minWidth			= selfMinSize.x
    self.maxWidth			= selfMaxSize.x
	self.workWidth			= workSize.x

	self:SetHeight( selfMaxSize.y )
	self:SetLayerHeight( shipNameSize.y, self.layers.SHIP_NAME )

end


--
function UI.Ship_InfoWnd:RecalcLayout()

	-- имя корабля - ширина

    local formatRect = UI:Quat( 0, 0, 10000000, self:GetLayerHeight( self.layers.SHIP_NAME ) )

    local shipNameWidth = _G.MeasureText(
   		self:GetText( self.layers.SHIP_NAME ),
   		self:GetFont( self.layers.SHIP_NAME ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.SHIP_NAME ),
    	formatRect ).z

	self:SetLayerWidth( shipNameWidth, self.layers.SHIP_NAME )


	-- элементы правее имени (WORK_EFFECT с дочерние) - позиция x

	local nameRight = math.max( self:GetLayerLeft( self.layers.SHIP_NAME ) + self:GetLayerWidth( self.layers.SHIP_NAME ), self:GetLayerLeft( self.layers.ROLE_NAME ) + self:GetLayerWidth( self.layers.ROLE_NAME ) )
	local workX = nameRight + self.space_name_work

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetPos( UI:Vec2( workX, workEffect:GetPos().y ) )

	end


	-- собственная ширина и анимация фона

	local selfWidth = workX + self.workWidth + self.space_work_right
	selfWidth = UI:Clamp( selfWidth, self.minWidth, self.maxWidth )
	
	self:SetWidth( selfWidth )

	local animTime = ( selfWidth - self.minWidth ) / ( self.maxWidth - self.minWidth )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ------------------------------------------------------------
-- UI.Ship_MainParamsWnd
-- ------------------------------------------------------------

UI.Ship_MainParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_MainParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Ship_MainParamsWnd"
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
				defName 			= "shipsTree_alienEdit_mainParams",
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
function UI.Ship_MainParamsWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self:FullUpdate()

end


--
function UI.Ship_MainParamsWnd:Reset()

    self.shipDefName = ""
	self:Clear()

end


--
function UI.Ship_MainParamsWnd:GetShipDefName()

	return self.shipDefName

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_MainParamsWnd.btnPrototypeName	= "Ship_MainParamSlotWnd"
UI.Ship_MainParamsWnd.MAX_SLOTS			= 4
UI.Ship_MainParamsWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.Ship_MainParamsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "progr_prop_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.Ship_MainParamsWnd.paramNames =
{
    "hull_health",
    "shield_max",
    "energy_max",
    "max_speed",
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_MainParamsWnd.shipDefName	= ""

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_MainParamsWnd:FullUpdate()

	self:Clear()

	local namesToShowMap = {}
	for paramIdx, paramName in pairs( self.paramNames ) do
		namesToShowMap[ paramName ] = true
	end

	local allParams = UI:GetShipTooltipAllParams()

	local paramsToShowMap = {}
	for paramIdx, paramInfo in pairs( allParams ) do
		if namesToShowMap[ paramInfo.name ] then
			paramsToShowMap[ paramInfo.name ] = paramInfo
		end
	end

	for paramIdx, paramName in ipairs( self.paramNames ) do

		local paramInfo = paramsToShowMap[ paramName ]
		if paramInfo then

			local data = { paramInfo = paramInfo }
			self:AddRecord( { paramInfo = paramInfo } )

		else
			sys.log( "UI.Ship_MainParamsWnd:FullUpdate()[ERROR]; cannot find param info for \"%s\"", paramName )
		end		

	end

end


-- ------------------------------------------------------------
-- UI.Ship_MainParamSlotWnd
-- ------------------------------------------------------------

UI.Ship_MainParamSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_MainParamSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Ship_MainParamSlotWnd",
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
				defName 			= "shipsTree_alienEdit_mainParamSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "slot",
						layer		= "UI.Ship_MainParamSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_3",
						layer		= "UI.Ship_MainParamSlotWnd.layers.BAR_EFFECT",
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
				defName 			= "ship_mainParamSlot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "ship_mainParamSlot_bar",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_MainParamSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local barEffect = UI:GetEffectFromLayer( self, self.layers.BAR_EFFECT ) 
	if barEffect then
		barEffect:SetAnimationTimeAndUpdate( 0 )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_MainParamSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    ICO_EFFECT		= 1,
    BAR_EFFECT		= 2,
}

UI.Ship_MainParamSlotWnd.effectInfo =
{
	ico =
	{
		spriteName	= "ico"
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_MainParamSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateBar( data )

end


--
function UI.Ship_MainParamSlotWnd:UpdateIco( data )

	local hTex = UI:GetShipParamIco( data.paramInfo )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.Ship_MainParamSlotWnd:UpdateBar( data )	

	local barEffect = UI:GetEffectFromLayer( self, self.layers.BAR_EFFECT ) 
	if barEffect then
		barEffect:SetAnimationTimeAndUpdate( 0 )
	end

	local shipDefName = self:GetShipDefName()
	if shipDefName == "" then
		sys.log( "UI.Ship_MainParamSlotWnd:UpdateBar()[ERROR]: no ship def name" )
		return
	end

	-- цвет

	local color = UI:GetItemColor( shipDefName, false )

	if barEffect then
		barEffect:SetColor( color )
	end

	-- значение

	local shipItem = UI:GetShipItemByDef( shipDefName, true )	-- ранее был куплен, но потом продан
	local spawnData = shipItem and UI:GetShipSpawnData( shipItem.vid, true, u64( 0 ) ) or UI:GetShipDefaultSpawnData( shipDefName )
	local paramsData = { params = _G.CL_GetShipParamsFromSpawnData( spawnData ) }

	local vals = UI:GetParamVals( shipDefName, data.paramInfo, UI.paramSrcTypes.SHIP, paramsData, false )
	if #vals ~= 1 then
		sys.log( "UI.Ship_MainParamSlotWnd:UpdateBar()[ERROR]: expected only one val per parameter" )
		return
	end

	local val		= vals[ 1 ]
	local valMax	= UI:GetShipParamMaxVal( shipDefName, data.paramInfo.name )

	local animTime = valMax ~= 0 and val / valMax or 1		

	if barEffect then
		barEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


--
function UI.Ship_MainParamSlotWnd:GetShipDefName()

	local shipDefName = nil

	local parent = self:GetParent()
	if parent then

		if parent.GetShipDefName then			
			shipDefName = parent:GetShipDefName()
		else
			sys.log( "UI.Ship_MainParamSlotWnd:GetShipDefName()[ERROR]: no way to get ship def name - parent doesn't support GetShipDefName()" )
		end

	else
		sys.log( "UI.Ship_MainParamSlotWnd:GetShipDefName()[ERROR]: no way to get ship def name - no parent" )
	end

	return shipDefName

end


-- ------------------------------------------------------------
-- UI.Ship_ParamsWnd
-- ------------------------------------------------------------

UI.Ship_ParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_ParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Ship_ParamsWnd",
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
				defName 			= "shipsTree_alienEdit_params",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ParamsWnd.layers.CAPTION",
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
			text			= UI:GetStringByName( "ship_params" ),
		},
	},

	children = { "UI.Ship_Params_MaskWnd" }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_ParamsWnd:Setup( shipDefName )

	self.bonusesWnd:Setup( shipDefName )
	self:RecalcLayout( false )

end


--
function UI.Ship_ParamsWnd:Reset()

	self.bonusesWnd:Reset()
	self:RecalcLayout( false )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_ParamsWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.Ship_ParamsWnd.SCROLL_STEP				= UI:YTo1024x768( 30, { x = 1280, y = 720 } )
UI.Ship_ParamsWnd.space_controls_scrollBar	= UI:XTo1024x768( 5, { x = 1280, y = 720 } )

UI.Ship_ParamsWnd.effectInfo =
{
	main =
	{
		bonusesLocator		= "proper",
		scrollBarLocator	= "scroll",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_ParamsWnd.maskWnd		= nil
UI.Ship_ParamsWnd.workWnd		= nil	-- для текущего функционала workWnd излишне; скопировано было с окна редактирования нодов зеленого корабля, где workWnd объединяет бонусы и список измененных параметров; возможно, в будущем эти окна объединят, поэтому структура сохраняется
UI.Ship_ParamsWnd.scrollBar		= nil
UI.Ship_ParamsWnd.bonusesWnd	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_ParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.maskWnd	= UI.Ship_Params_MaskWnd
	self.workWnd	= UI.Ship_Params_WorkWnd
	self.bonusesWnd	= UI.Ship_BonusesWnd

	self:InitScrollBar()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.Ship_ParamsWnd:InitScrollBar()	

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_2, "" )
	self.scrollBar:SetStepSize( self.SCROLL_STEP )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.scrollBar:GetUiHandle(), self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.ALL )
	end	

end


--
function UI.Ship_ParamsWnd:RecalcLayout( bSaveScrollPos )

	if not self:IsOnScreen() then
		return
	end


	if bSaveScrollPos == nil then
		bSaveScrollPos = true
	end

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bonusesPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.bonusesLocator ) or Vec2( 0, 0 )


	-- позиция маски

	local maskX = 0
	local maskY = bonusesPos.y
	self.maskWnd:SetPos( maskX, maskY )

	-- позиция скроллируемого окна

	local workX = 0		-- относительно данного окна
	self.workWnd:SetLeft( workX - maskX )

	-- позиции дочерних элементов
	-- позиция бонусов

	self.bonusesWnd:SetPos( bonusesPos.x - workX, 0 )

	-- собственная ширина

	local selfWidth = mainEffect and mainEffect:GetObjSize( "self" ).x or 0
	self:SetWidth( selfWidth )

	-- ширина маски

	local maskWidth = selfWidth
	self.maskWnd:SetWidth( maskWidth )

	-- ширина скроллируемого окна

	local workWidth = selfWidth
	self.workWnd:SetWidth( workWidth )

	-- собственная высота (до нижней панели ангара)

	local parent = self:GetParent()
	local selfHeight = ( parent and parent:GetHeight() or 0 ) - self:GetTop()
	self:SetHeight( selfHeight )

	-- высота маски

	local maskHeight = selfHeight - maskY
	self.maskWnd:SetHeight( maskHeight )

	-- высота скроллируемого окна

	local workHeight = self.bonusesWnd:GetTop() + self.bonusesWnd:GetHeight()
	self.workWnd:SetHeight( workHeight )


	-- скроллбар

	local scrollSize = 0
	if workHeight > maskHeight then
		scrollSize = workHeight - maskHeight
	end

	-- видимость

	local bNeedScrollBar = math.abs( scrollSize ) > 1e-3

	if bNeedScrollBar then

		local oldScrollPos = 0

		if self.scrollBar:IsChildOf( self ) then
			oldScrollPos = self.scrollBar:GetPos()
		else
			self:AddChild( self.scrollBar )
		end

		-- высота

    	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
    	if scrollEffect then

        	local needHeight = selfHeight - self.scrollBar:GetTop()
        	local baseHeight = scrollEffect:GetObjSize( "self" ).y

        	local scale_y = needHeight / baseHeight
        	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )
        	self.scrollBar:SetHeight( needHeight )

    	end

		-- page
		self.scrollBar:SetPageSize( selfHeight )

		-- range
		self.scrollBar:SetRange( 0, scrollSize )

		-- scrollPos
		local scrollPos = bSaveScrollPos and oldScrollPos or 0
		self.scrollBar:SetPos( scrollPos )

	else
		self.scrollBar:UnlinkFromParent()
	end

	self:UpdateWorkWndPosFromScrollBar()

end


--
function UI.Ship_ParamsWnd:UpdateWorkWndPosFromScrollBar()

	local scrollPos = self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0
	self.workWnd:SetTop( UI:YRel2Snapped( -scrollPos ) )	

end


--
function UI.Ship_ParamsWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateWorkWndPosFromScrollBar()

end


--
function UI.Ship_ParamsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

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
function UI.Ship_ParamsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout( false )

end


-- ------------------------------------------------------------
-- UI.Ship_Params_MaskWnd
-- ------------------------------------------------------------

UI.Ship_Params_MaskWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_Params_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Ship_Params_MaskWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	children = { "UI.Ship_Params_WorkWnd" }
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_Params_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.Ship_Params_MaskWnd.parent	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_Params_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.Ship_Params_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого объекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.Ship_Params_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.Ship_Params_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- для текущего функционала Ship_Params_WorkWnd излишне; скопировано было с окна редактирования нодов зеленого корабля, где Ship_Params_WorkWnd объединяет бонусы и список измененных параметров; возможно, в будущем эти окна объединят, поэтому структура сохраняется
-- ------------------------------------------------------------
-- UI.Ship_Params_WorkWnd
-- ------------------------------------------------------------

UI.Ship_Params_WorkWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_Params_WorkWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Ship_Params_WorkWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	children = { "UI.Ship_BonusesWnd" }
}

-- ------------------------------------------------------------
-- UI.Ship_BonusesWnd
-- ------------------------------------------------------------

UI.Ship_BonusesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_BonusesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Ship_BonusesWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_alienEdit_bonuses",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_BonusesWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self:FullUpdate()

end


--
function UI.Ship_BonusesWnd:Reset()

	self.shipDefName = ""
	self:ResetSlots()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_BonusesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Ship_BonusesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "bonus_slot_"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_BonusesWnd.shipDefName		= ""
UI.Ship_BonusesWnd.allSlots			= {}
UI.Ship_BonusesWnd.curSlots			= {}
UI.Ship_BonusesWnd.space_slots		= 0
UI.Ship_BonusesWnd.space_top_slots	= 0
UI.Ship_BonusesWnd.space_slots_btm	= 0
UI.Ship_BonusesWnd.slotsX			= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_BonusesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.Ship_BonusesWnd:CreateControls()

	for slotIdx = 1, 3 do
		self:CreateSlot()
	end

end


--
function UI.Ship_BonusesWnd:FullUpdate()

	self:UpdateSlots()
	self:RecalcLayout()

end


--
function UI.Ship_BonusesWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.Ship_BonusesWnd:UpdateSlots()

	self:ResetSlots()

	local shipSynergyLevel	= -1
	local shipItem			= UI:GetShipItemByDef( self.shipDefName, true )	-- ранее был куплен, но потом продан

	local shipParamsData =
	{
		defName			= self.shipDefName,
		data			= { params = nil },
		synergyLevel	= -1,
		dataType		= UI.paramSrcTypes.SHIP
	}

	if shipItem then
		shipSynergyLevel			= UI:GetShipLevel( shipItem )
		shipParamsData.data.params	= _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( shipItem.vid, true, u64( 0 ) ) )
		shipParamsData.synergyLevel	= shipSynergyLevel
	else
		shipSynergyLevel			= UI:GetShipDefaultLevel( self.shipDefName )
		shipParamsData.data.params	= _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.shipDefName ) )
		shipParamsData.synergyLevel	= shipSynergyLevel
	end

	local bonusesData = UI:GetShipDescParamsEx( shipParamsData )

	for bonusIdx, bonusData in ipairs( bonusesData ) do

		local bonusSynergyLevel = bonusData.synergyLevel or -1
		if bonusSynergyLevel == -1 or bonusSynergyLevel <= shipSynergyLevel then

    		local slotWnd = self:ObtainFreeSlot()
    		if slotWnd then
    			slotWnd:Setup( bonusData, shipParamsData )
    		end

		end

	end

end


--
function UI.Ship_BonusesWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Ship_BonusSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.Ship_BonusesWnd:ObtainFreeSlot()

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
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.Ship_BonusesWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self.allSlots[ 1 ]

	local NUM_SLOTS_IN_EFFECT = 3

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, NUM_SLOTS_IN_EFFECT ) ) or Vec2( 0, 0 )
	local slotSize		= slotWnd and Vec2( slotWnd:GetWidth(), slotWnd:GetBaseHeight() ) or Vec2( 0, 0 )

    self.space_slots		= secondSlotPos.y - ( firstSlotPos.y + slotSize.y )
    self.space_top_slots	= firstSlotPos.y
    self.space_slots_btm	= selfSize.y - ( lastSlotPos.y + slotSize.y )
    self.slotsX				= firstSlotPos.x

	self:SetWidth( selfSize.x )

end


--
function UI.Ship_BonusesWnd:RecalcLayout()

	local slotY = self.space_top_slots

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		slotWnd:SetLeft( self.slotsX )
		slotWnd:SetTop( slotY )

		slotY = slotY + slotWnd:GetHeight() + self.space_slots

	end

	local selfHeight = 0

	if next( self.curSlots ) then
		local lastSlotWnd = self.curSlots[ #self.curSlots ]
		selfHeight = lastSlotWnd:GetTop() + lastSlotWnd:GetHeight() + self.space_slots_btm		
	end

	self:SetHeight( selfHeight )

end


-- ------------------------------------------------------------
-- UI.Ship_BonusSlotWnd
-- ------------------------------------------------------------

UI.Ship_BonusSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_BonusSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Ship_BonusSlotWnd",
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
				defName 			= "shipsTree_alienEdit_bonusSlot",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "title",
						layer		= "UI.Ship_BonusSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_BonusSlotWnd:Setup( bonusData, shipParamsData )

	self:Reset()

	self.bonusData		= bonusData
	self.shipParamsData	= shipParamsData

	self:FullUpdate()

end


--
function UI.Ship_BonusSlotWnd:Reset()

	self.bonusData		= nil
	self.shipParamsData	= nil

	self:SetText( "", self.layers.TEXT )

	self:RacalLayout()

end


--
function UI.Ship_BonusSlotWnd:GetBaseHeight()

	return self.maxHeight

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_BonusSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
}

UI.Ship_BonusSlotWnd.effectInfo =
{
	main =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
		textLocator		= "title",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_BonusSlotWnd.bonusData		= nil
UI.Ship_BonusSlotWnd.shipParamsData	= nil
UI.Ship_BonusSlotWnd.minHeight		= 0
UI.Ship_BonusSlotWnd.maxHeight		= 0
UI.Ship_BonusSlotWnd.space_text_btm	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_BonusSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()

end


--
function UI.Ship_BonusSlotWnd:FullUpdate()

	self:UpdateText()
	self:RacalLayout()

end


--
function UI.Ship_BonusSlotWnd:UpdateText()

	local str = UI:ShipDescParam2Str( self.bonusData, self:GetColor( self.layers.TEXT ), nil, self.shipParamsData.defName, -1, false )	
	self:SetText( str, self.layers.TEXT )

end


--
function UI.Ship_BonusSlotWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local minSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )  or Vec2( 0, 0 )
	local textPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.textLocator )  or Vec2( 0, 0 )
	local textSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.textLocator )  or Vec2( 0, 0 )

	self.minHeight		= minSize.y
	self.maxHeight		= maxSize.y
	self.space_text_btm	= maxSize.y - ( textPos.y + textSize.y )

	self:SetWidth( maxSize.x )
	self:SetLayerWidth( textSize.x, self.layers.TEXT )

end


--
function UI.Ship_BonusSlotWnd:RacalLayout()

	-- высота текстового слоя

	local formatRect = Quat( 0, 0, self:GetLayerWidth( self.layers.TEXT ), 1000000 )

    local textHeight = _G.MeasureText(
   		self:GetText( self.layers.TEXT ),
   		self:GetFont( self.layers.TEXT ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
    	formatRect).w

	self:SetLayerHeight( textHeight, self.layers.TEXT )


	-- собственная высота

	local selfHeight = self:GetLayerTop( self.layers.TEXT ) + textHeight + self.space_text_btm
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ------------------------------------------------------------
-- UI.Ship_SurvivabilityWnd
-- ------------------------------------------------------------

UI.Ship_SurvivabilityWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_SurvivabilityWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Ship_SurvivabilityWnd",
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
				defName 			= "shipsTree_alienEdit_survivability",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_survival",
						layer		= "UI.Ship_SurvivabilityWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "vol_survival",
						layer		= "UI.Ship_SurvivabilityWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
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

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_SurvivabilityWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self:FullUpdate()

end


--
function UI.Ship_SurvivabilityWnd:Reset()

	self.shipDefName = ""
	self:SetText( "", self.layers.VAL )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_SurvivabilityWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    VAL			= 2,
}

UI.Ship_SurvivabilityWnd.paramName = "effective_health"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_SurvivabilityWnd.shipDefName	= ""

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_SurvivabilityWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitCaption()

end


--
function UI.Ship_SurvivabilityWnd:InitCaption()

	local str = UI:ShipParam2StrByName( self.paramName )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.Ship_SurvivabilityWnd:FullUpdate()

	local str = ""

	local paramInfo = nil

	local params = UI:GetShipTooltipAllParams( self.shipDefName )
	for paramIdx, _paramInfo in pairs( params ) do

		if _paramInfo.name == self.paramName then
			paramInfo = _paramInfo
			break
		end

	end

	if paramInfo then		

		local shipItem = UI:GetShipItemByDef( self.shipDefName, true )	-- ранее был куплен, но потом продан
		local spawnData = shipItem and UI:GetShipSpawnData( shipItem.vid, true, u64( 0 ) ) or UI:GetShipDefaultSpawnData( self.shipDefName )
		local paramsData = { params = _G.CL_GetShipParamsFromSpawnData( spawnData ) }

    	local vals = UI:GetParamVals( self.shipDefName, paramInfo, UI.paramSrcTypes.SHIP, paramsData, false )
		local color = UI:GetItemColor( self.shipDefName, false )
		str = UI:ParamVals2Str( paramInfo, vals, nil, false, color, color, false, false )

		if str == "" then
			sys.log( "UI.Ship_SurvivabilityWnd:UpdateVal()[ERROR]: fail to convert vals to string" )
		end

	else
		sys.log( "UI.Ship_SurvivabilityWnd:FullUpdate()[ERROR]: cannot find info for parameter \"%s\"", self.paramName )
	end

	self:SetText( str, self.layers.VAL )

end


-- ------------------------------------------------------------
-- UI.Ship_ItemsSlotsWnd
-- Модифицированный копипаст с UI.EquipmentWnd
-- ------------------------------------------------------------

UI.Ship_ItemsSlotsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_ItemsSlotsWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Ship_ItemsSlotsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
	},

	layers =
	{
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_weapon",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.WEAPON_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title_active_modul",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.ACTIVE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title_passive_modul",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "passive_modules",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_2",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_3",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_4",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_4_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_5",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_5_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modul_special",
						wnd			= "UI.Ship_SpecModuleItemSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WEAPON_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_weapon" ),
		},

		-- ACTIVE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_activeModules" ),
		},

		-- PASSIVE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_passiveModules" ),
		},

        -- PASSIVE_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_1_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PASSIVE_1_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_ENGINE_MOD_tipCaption" ),
		},

        -- PASSIVE_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_2_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PASSIVE_2_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_CAPACITOR_MOD_tipCaption" ),
		},

        -- PASSIVE_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_3_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PASSIVE_3_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_SHIELD_MOD_tipCaption" ),
		},

        -- PASSIVE_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_4_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PASSIVE_4_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_ARMOR_MOD_tipCaption" ),
		},

        -- PASSIVE_5_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Ship_ItemsSlotsWnd.layers.PASSIVE_5_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PASSIVE_5_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_CPU_MOD_tipCaption" ),
		},
	},

	children = { "UI.Ship_SpecModuleItemSlotWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Ship_ItemsSlotsWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self.shipItem = UI:GetShipItemByDef( self.shipDefName, true )

	self:FullUpdate()	

end

-- ------------------------------
-- const
-- ------------------------------

UI.Ship_ItemsSlotsWnd.layers =
{
	WORK_EFFECT			= 0,
    WEAPON_LABEL		= 1,
    ACTIVE_LABEL		= 2,
    PASSIVE_LABEL		= 3,
	PASSIVE_1_EFFECT	= 4,
    PASSIVE_1_LABEL		= 5,
	PASSIVE_2_EFFECT	= 6,
    PASSIVE_2_LABEL		= 7,
	PASSIVE_3_EFFECT	= 8,
    PASSIVE_3_LABEL		= 9,
	PASSIVE_4_EFFECT	= 10,
    PASSIVE_4_LABEL		= 11,
	PASSIVE_5_EFFECT	= 12,
    PASSIVE_5_LABEL		= 13,
}

UI.Ship_ItemsSlotsWnd.shipSlotType2ModuleType =
{
	[ UI.shipSlotTypes.WEAPON ]			= { "PRIMARY_WEAPON_01" },
	[ UI.shipSlotTypes.ACTIVE ]			= { "ACTIVE_01", "ACTIVE_02","ACTIVE_03", "ACTIVE_04" },
	[ UI.shipSlotTypes.ARMOR_MOD ]		= { "ARMOR_MOD_01", "ARMOR_MOD_02", "ARMOR_MOD_03" },
	[ UI.shipSlotTypes.SHIELD_MOD ]		= { "SHIELD_MOD_01", "SHIELD_MOD_02", "SHIELD_MOD_03" },
	[ UI.shipSlotTypes.CAPACITOR_MOD ]	= { "CAPACITOR_MOD_01", "CAPACITOR_MOD_02","CAPACITOR_MOD_03" },
	[ UI.shipSlotTypes.ENGINE_MOD]		= { "ENGINE_MOD_01", "ENGINE_MOD_02", "ENGINE_MOD_03" },
	[ UI.shipSlotTypes.CPU_MOD ]		= { "CPU_MOD_01", "CPU_MOD_02", "CPU_MOD_03" },
	[ UI.shipSlotTypes.SPECIAL ]		= { "SPECIAL" },
}

UI.Ship_ItemsSlotsWnd.shipSlotType2AmmoType =
{
	[ UI.shipSlotTypes.AMMO_PRIMARY ]	= "MBT_PRIMARY",
	[ UI.shipSlotTypes.AMMO_SECONDARY ]	= "MBT_SECONDARY",
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Ship_ItemsSlotsWnd.shipSlots			= {}
UI.Ship_ItemsSlotsWnd.shipDefName		= ""
UI.Ship_ItemsSlotsWnd.shipItem			= nil
UI.Ship_ItemsSlotsWnd.specModuleSlotWnd	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Ship_ItemsSlotsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.specModuleSlotWnd = UI.Ship_SpecModuleItemSlotWnd

end


--
function UI.Ship_ItemsSlotsWnd:CreateShipSlots()

	for slotTypeName, slotType in pairs( UI.shipSlotTypes ) do

		if slotType ~= UI.shipSlotTypes.SPECIAL then

    		local bAmmo = self:IsShipSlotTypeAmmo( slotType )
    		local proto = bAmmo and UI.Ship_AmmoItemSlotWnd or UI.Ship_ModuleItemSlotWnd

    		for inTypeIdx = 1, self:GetMaxShipSlotsOfType( slotType ) do

    			local slotWnd = UI:CreateChildWnd( self, proto, string.format( "%s_%d", slotTypeName, inTypeIdx ) )

    			local slotId = bAmmo and self:ShipSlot2AmmoId( slotType, inTypeIdx ) or self:ShipSlot2ModuleId( slotType, inTypeIdx )
    			slotWnd:Init( slotType, slotId )

    			table.insert( self.shipSlots, slotWnd )

    		end

		end

	end

end


--
function UI.Ship_ItemsSlotsWnd:IsShipSlotTypeAmmo( slotType )

	return slotType == UI.shipSlotTypes.AMMO_PRIMARY or slotType == UI.shipSlotTypes.AMMO_SECONDARY

end


--
function UI.Ship_ItemsSlotsWnd:Reset()

	self.shipDefName	= ""
	self.shipItem		= nil

	self:ResetShipSlots()

end


--
function UI.Ship_ItemsSlotsWnd:ResetShipSlots()

	for idx, slotWnd in pairs( self.shipSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.specModuleSlotWnd:Reset()
	self.specModuleSlotWnd:UnlinkFromParent()

	for layer = self.layers.PASSIVE_1_EFFECT, self.layers.PASSIVE_5_LABEL do
		self:SetLayerVisible( false, layer )
	end

end


--
function UI.Ship_ItemsSlotsWnd:FullUpdate()

	-- здесь, а не в PostLoad, т.к. во время PostLoad еще не загружены скриптовые файлы с константами ai
	if not next( self.shipSlots ) then
		self:CreateShipSlots()
	end

	if self.shipDefName == "" then
		return
	end

	self:ResetShipSlots()

	-- модули

	local slotsMask = UI:GetShipAllPossibleSlotsMask( self.shipDefName )

	for slotId = 0, ai.SpaceShipModuleSlot.NUM - 1 do
		if UI:BitTstU64( slotsMask, slotId ) then
			self:UpdateModuleShipSlot( slotId )
		end
	end

	-- аммуниция

	for ammoIdName, ammoId in pairs( ai.MunitionBayType ) do
		if ammoId ~= ai.MunitionBayType.MBT_NUM then
			self:UpdateAmmoShipSlot( ammoId )
		end
	end

	self:LayoutShipSlots()

end


--
function UI.Ship_ItemsSlotsWnd:UpdateModuleShipSlot( moduleId )

	if moduleId == ai.SpaceShipModuleSlot.SPECIAL then

		local itemDefName = ""

		if self.shipItem then 	-- на проданном корабле сохраняется измененный пользователем спецмодуль
			itemDefName = UI:GetShipSpecModule( self.shipItem )
		else
			itemDefName = UI:GetShipInitialModule( self.shipDefName, ai.SpaceShipModuleSlot.SPECIAL )
			if itemDefName == "" then
				itemDefName = UI:GetShipDefaultModule( self.shipDefName, ai.SpaceShipModuleSlot.SPECIAL )
			end
		end

		if itemDefName ~= "" then
			self:AddChild( self.specModuleSlotWnd )
			self.specModuleSlotWnd:Setup( itemDefName )
		else
			sys.log( "UI.Ship_ItemsSlotsWnd:UpdateModuleShipSlot()[ERROR]: cannot find specmodule for ship %s", self.shipDefName )
		end

	else

    	local slotWnd = self:GetShipSlotForModuleId( moduleId )
    	if not slotWnd then
    		return
    	end

    	self:AddChild( slotWnd )
    	slotWnd:Setup( UI.Equipment_ShipSlotWnd.activeStates.ACTIVE )

    	local itemDefName = ""

		if not self.shipItem then	-- на проданном корабле не сохраняются установленные модули и аммуниция
			itemDefName = UI:GetShipInitialModule( self.shipDefName, moduleId )
		end

    	if itemDefName ~= "" then
    		slotWnd:SetItem( UI.INVALID_U64_ID, itemDefName )
    	end

	end

end


--
function UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot( ammoId )

	local slotWnd = self:GetShipSlotForAmmoId( ammoId )
	if not slotWnd then
		sys.log( "UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot()[ERROR]: cannot find ship slot for ammunition type %s", tostring( ammoId ) )
		return
	end

	local itemDefName = ""

	if not self.shipItem then	-- на проданном корабле не сохраняются установленные модули и аммуниция
		itemDefName = UI:GetShipInitialAmmo( self.shipDefName, ammoId )
	end

	-- Аммуниция для основного оружия должна соответствовать текущему установленному оружию, поэтому если оружия нет, то слот аммуниции для него неактивен.
	-- Исключение - если в слоте уже почему-то стоит неподходящая аммуниция; в этом случае слот не блокируется, чтобы эту аммуницию можно было оттуда снять.

	local slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.ACTIVE

	if ammoId == ai.MunitionBayType.MBT_PRIMARY then

		local curWeaponClass = self:GetCurWeaponClass()
		if curWeaponClass == ai.WeaponClass.UNKNOWN then

			if itemDefName == "" then
				slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_WEAPON
			else
				sys.log( "UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
			end

		else

			if itemDefName ~= "" then
				local itemWeaponClass = UI:GetWeaponClass( itemDefName )
				if itemWeaponClass ~= curWeaponClass then
					sys.log( "UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
				end 
			end

		end


		local curWeaponAmmoSubType = self:GetCurWeaponAmmoSubType()
		if curWeaponAmmoSubType == -1 then

			if itemDefName == "" then
				slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_WEAPON
			else
				sys.log( "UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
			end

		-- если 0 - значит этот параметр не используется для данного оружия
		elseif curWeaponAmmoSubType ~= 0 then

			if itemDefName ~= "" then
				local itemSubType = UI:GetItemSubType( itemDefName )
				if itemSubType ~= curWeaponAmmoSubType then
					sys.log( "UI.Ship_ItemsSlotsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
				end 
			end

		end

	end

	self:AddChild( slotWnd )
	slotWnd:Setup( slotActiveState )

	if itemDefName ~= "" then
		slotWnd:SetItem( itemDefName, 1 )
	end

end


--
function UI.Ship_ItemsSlotsWnd:GetShipSlotForModuleId( moduleId )

	for idx, shipSlot in pairs( self.shipSlots ) do
		if not self:IsShipSlotTypeAmmo( shipSlot:GetShipSlotType() ) and shipSlot:GetSlotId() == moduleId then
			return shipSlot
		end
	end

	return nil

end


--
function UI.Ship_ItemsSlotsWnd:GetShipSlotForAmmoId( ammoId )

	for idx, shipSlot in pairs( self.shipSlots ) do
		if self:IsShipSlotTypeAmmo( shipSlot:GetShipSlotType() ) and shipSlot:GetSlotId() == ammoId then
			return shipSlot
		end
	end

	return nil

end


--
function UI.Ship_ItemsSlotsWnd:ShipSlot2ModuleId( shipSlotType, slotIdx )

	local moduleId = -1	

	local moduleTypes = self.shipSlotType2ModuleType[ shipSlotType ]
	if moduleTypes then

		local moduleIdName = moduleTypes[ slotIdx ]

		if moduleIdName then

			moduleId = ai.SpaceShipModuleSlot[ moduleIdName ]
			if not moduleId then
				sys.log( "UI.Ship_ItemsSlotsWnd:ShipSlot2ModuleId()[ERROR]: invalid module slot name: %s", moduleIdName )
				moduleId = -1
			end

		else
			sys.log( "UI.Ship_ItemsSlotsWnd:ShipSlot2ModuleId()[ERROR]: cannot find UI.Ship_ItemsSlotsWnd.shipSlotType2ModuleType[%d][%s]", shipSlotType, tostring( slotIdx ) )
		end

	else
		sys.log( "UI.Ship_ItemsSlotsWnd:ShipSlot2ModuleId()[ERROR]: cannot find UI.Ship_ItemsSlotsWnd.shipSlotType2ModuleType[%s]", tostring( shipSlotType ) )
	end

	return moduleId

end


--
function UI.Ship_ItemsSlotsWnd:ShipSlot2AmmoId( shipSlotType, slotIdx )

	local ammoId = -1

	local ammoIdName = self.shipSlotType2AmmoType[ shipSlotType ]
	if ammoIdName then

		ammoId = ai.MunitionBayType[ ammoIdName ]
		if not ammoId then
			sys.log( "UI.Ship_ItemsSlotsWnd:ShipSlot2AmmoId()[ERROR]: invalid ammo name: %s", ammoIdName )
			ammoId = -1
		end

	else
		sys.log( "UI.Ship_ItemsSlotsWnd:ShipSlot2AmmoId()[ERROR]: cannot find UI.Ship_ItemsSlotsWnd.shipSlotType2AmmoType[%s]", tostring( shipSlotType ) )
	end

	return ammoId

end


--
function UI.Ship_ItemsSlotsWnd:GetMaxShipSlotsOfType( shipSlotType )

	if self:IsShipSlotTypeAmmo( shipSlotType ) then
		return 1

	else
		local moduleTypes = self.shipSlotType2ModuleType[ shipSlotType ]

		if moduleTypes then
			return #moduleTypes
		else
			sys.log( "UI.Ship_ItemsSlotsWnd:GetMaxShipSlotsOfType()[ERROR]: cannot find UI.Ship_ItemsSlotsWnd.shipSlotType2ModuleType[%s]", tostring( shipSlotType ) )
			return 0
		end
	end	

end


--
function UI.Ship_ItemsSlotsWnd:LayoutShipSlots()

	local passiveSlots = {}

	for idx, slotWnd in pairs( self.shipSlots ) do

		if slotWnd:IsChildOf( self ) then

    		local shipSlotType	= slotWnd:GetShipSlotType()
    		local slotId		= slotWnd:GetSlotId()

    		local layer		= -1
    		local locator	= ""
    	
    		if shipSlotType == UI.shipSlotTypes.WEAPON then

    			layer	= self.layers.WORK_EFFECT
    			locator	= "weap_modules_1"

    		elseif shipSlotType == UI.shipSlotTypes.ACTIVE then

    			layer	= self.layers.WORK_EFFECT
    			locator	= string.format( "active_modules_%d", slotId - ai.SpaceShipModuleSlot.ACTIVE_01 + 1 )

    		elseif shipSlotType == UI.shipSlotTypes.ENGINE_MOD
    			or shipSlotType == UI.shipSlotTypes.CAPACITOR_MOD
    			or shipSlotType == UI.shipSlotTypes.SHIELD_MOD
    			or shipSlotType == UI.shipSlotTypes.ARMOR_MOD
    			or shipSlotType == UI.shipSlotTypes.CPU_MOD then

    				table.insert( passiveSlots, slotWnd )  -- размещение пассивных слотов определяется ниже

    		elseif shipSlotType == UI.shipSlotTypes.AMMO_PRIMARY then

    			layer	= self.layers.WORK_EFFECT
    			locator	= "weap_modules_2"

    		elseif shipSlotType == UI.shipSlotTypes.AMMO_SECONDARY then

    			layer	= self.layers.WORK_EFFECT
    			locator	= "weap_modules_3"

    		elseif shipSlotType == UI.shipSlotTypes.SPECIAL then

    			-- ничего (отдельное окно)

    		else
    			sys.log( "UI.Ship_ItemsSlotsWnd:LayoutShipSlots()[ERROR]: unhandled ship slot type %d", shipSlotType )
    		end

    		if layer ~= -1 and locator ~= "" then

    			local effect = UI:GetEffectFromLayer( self, layer )
    			if effect then
    				effect:LinkWnd( slotWnd:GetUiHandle(), locator, UI.EffectAnimParams.POS )
    			end

    		end

		end

	end

	-- пассивные слоты;
	-- показываются только группы, в которых есть слоты;
	-- существующие группы показываются друг за другом, без пропусков на отсутствующие группы

	local passiveOrder =
	{
		UI.shipSlotTypes.ENGINE_MOD,
		UI.shipSlotTypes.CAPACITOR_MOD,
		UI.shipSlotTypes.SHIELD_MOD,
		UI.shipSlotTypes.ARMOR_MOD,
		UI.shipSlotTypes.CPU_MOD ,
	}

	local slotType2PassiveOrder = {}
	for orderIdx, slotType in pairs( passiveOrder ) do
		slotType2PassiveOrder[ slotType ] = orderIdx
	end

	local slotType2FirstSlotId =
	{
		[ UI.shipSlotTypes.ENGINE_MOD ]		= ai.SpaceShipModuleSlot.ENGINE_MOD_01,
		[ UI.shipSlotTypes.CAPACITOR_MOD ]	= ai.SpaceShipModuleSlot.CAPACITOR_MOD_01,
		[ UI.shipSlotTypes.SHIELD_MOD ]		= ai.SpaceShipModuleSlot.SHIELD_MOD_01,
		[ UI.shipSlotTypes.ARMOR_MOD ]		= ai.SpaceShipModuleSlot.ARMOR_MOD_01,
		[ UI.shipSlotTypes.CPU_MOD ]		= ai.SpaceShipModuleSlot.CPU_MOD_01,
	}

	local function fnSortPassiveByType( slotWnd1, slotWnd2 )

		local slotType1	= slotWnd1:GetShipSlotType()
		local slotType2	= slotWnd2:GetShipSlotType()

		local orderIdx1 = slotType2PassiveOrder[ slotType1 ]
		local orderIdx2 = slotType2PassiveOrder[ slotType2 ]

		return orderIdx1 < orderIdx2

	end

	table.sort( passiveSlots, fnSortPassiveByType )

	local curTypeIdx			= 0
	local curType				= -1
	local NUM_LAYERS_FOR_TYPE	= 2

	for idx, slotWnd in ipairs( passiveSlots ) do

		local slotType		= slotWnd:GetShipSlotType()
		local slotId		= slotWnd:GetSlotId()
		local slotsLayer	= self.layers.PASSIVE_1_EFFECT + NUM_LAYERS_FOR_TYPE * ( curTypeIdx - 1 )		

		-- начинается новая группа
		if slotType ~= curType then

			curType		= slotType
			curTypeIdx	= curTypeIdx + 1

    		local labelLayer = self.layers.PASSIVE_1_LABEL + NUM_LAYERS_FOR_TYPE * ( curTypeIdx - 1 )

			self:SetLayerVisible( true, slotsLayer )
			self:SetLayerVisible( true, labelLayer )
			
			-- заголовок группы

    		local strId = string.format( "equipSlot_%s_tipCaption", UI:Val2Key( UI.shipSlotTypes, slotType ) )
    		local str = UI:GetStringByName( strId )
    		self:SetText( str, labelLayer )

		end

		-- позиции слотов в группе

		local slotsLayer 	= self.layers.PASSIVE_1_EFFECT + NUM_LAYERS_FOR_TYPE * ( curTypeIdx - 1 )		
		local slotLocator	= string.format( "pass_modules_%d", slotId - slotType2FirstSlotId[ slotType ] + 1 )

		local slotsEffect = UI:GetEffectFromLayer( self, slotsLayer )
		local slotsEffectPos = slotsEffect and slotsEffect:GetPos() or UI:ZeroVec2()
		local slotPos = ( slotsEffect and slotsEffect:GetObjPos( slotLocator ) or UI:ZeroVec2() ) + slotsEffectPos
		slotWnd:SetPos( slotPos.x, slotPos.y )

	end

end


--
function UI.Ship_ItemsSlotsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		self:Reset()
	end

end


--
function UI.Ship_ItemsSlotsWnd:GetCurWeaponClass()

	local curWeaponClass = ai.WeaponClass.UNKNOWN

	local slotWnd = self:GetShipSlotForModuleId( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	if slotWnd and slotWnd:IsActive() then

		local defName = slotWnd:GetDefName()
		if defName ~= "" then
		   	curWeaponClass = UI:GetWeaponClass( defName )
		end

	end

	return curWeaponClass

end


--
function UI.Ship_ItemsSlotsWnd:GetCurWeaponAmmoSubType()

	local curWeaponAmmoSubType = -1

	local slotWnd = self:GetShipSlotForModuleId( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	if slotWnd and slotWnd:IsActive() then

		local defName = slotWnd:GetDefName()
		if defName ~= "" then
		   	curWeaponAmmoSubType = UI:GetWeaponAmmoSubType( defName )	-- если без разницы, то вернет 0
		end

	end

	return curWeaponAmmoSubType

end


--
function UI.Ship_ItemsSlotsWnd:RecalcLayout()

	local screenPos = UI.ShipWnd:GetItemsSlotsPos()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetScreenPos( screenPos )
	end

end


-- ********************************************************************************************************************
-- Внимение, хак! "Классы" UI.Equipment_ShipSlotWnd, UI.Equipment_ModuleShipSlotWnd и UI.Equipment_AmmoShipSlotWnd
-- изначально не предназначались для использования за пределами окна UI.EquipmentWnd, и ничего про дерево кораблей не знают.
-- Делая изменения там, надо убедиться, что здесь не сломалось.

-- ********************************************************************************************************************

-- ------------------------------------------------------------
-- UI.Ship_ModuleItemSlotWnd
-- ------------------------------------------------------------

UI.Ship_ModuleItemSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_ModuleItemSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_ModuleShipSlotWnd",

	props =
	{
		name		= "Ship_ModuleItemSlotWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.Ship_ModuleItemSlotWnd:GetShipItem()

	return UI:GetShipItemByDef( self:GetShipDefName(), true )

end


--
function UI.Ship_ModuleItemSlotWnd:GetShipDefName()

	return UI.ShipWnd:GetShipDefName()

end


--
function UI.Ship_ModuleItemSlotWnd:IsItemDragging()

	return false

end


-- ------------------------------------------------------------
-- UI.Ship_AmmoItemSlotWnd
-- ------------------------------------------------------------

UI.Ship_AmmoItemSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_AmmoItemSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_AmmoShipSlotWnd",

	props =
	{
		name		= "Ship_AmmoItemSlotWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.Ship_AmmoItemSlotWnd:GetShipItem()

	return UI:GetShipItemByDef( self:GetShipDefName(), true )

end


--
function UI.Ship_AmmoItemSlotWnd:GetShipDefName()

	return UI.ShipWnd:GetShipDefName()

end


--
function UI.Ship_AmmoItemSlotWnd:IsItemDragging()

	return false

end


-- -------------------------------------------------------------------
-- UI.Ship_SpecModuleItemSlotWnd
-- -------------------------------------------------------------------

UI.Ship_SpecModuleItemSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_SpecModuleItemSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Ship_SpecModuleItemSlotWnd",
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
				defName 			= "shipsTree_alienEdit_specModuleSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "modul_special",
						layer		= "UI.Ship_SpecModuleItemSlotWnd.layers.ICO_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modul_special_title",
						layer		= "UI.Ship_SpecModuleItemSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "modul_special_name",
						layer		= "UI.Ship_SpecModuleItemSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_specModuleSlot_icoMain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "buff_icon",
						layer		= "UI.Ship_SpecModuleItemSlotWnd.layers.ICO_WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICO_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_specModuleSlot_icoWork",
				defaultAnimation	= "color",
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_specModule" ),
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.Ship_SpecModuleItemSlotWnd:Setup( defName )

	self:Reset()

	self.defName = defName
	self:FullUpdate()

end


--
function UI.Ship_SpecModuleItemSlotWnd:Reset()

	self.defName = ""

	UI:ResetItemIco( self, self.layers.ICO_WORK_EFFECT )
	self:SetText( "", self.layers.NAME )
	self.tooltipData = nil

end


--
function UI.Ship_SpecModuleItemSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_SpecModuleItemSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    ICO_MAIN_EFFECT	= 1,
    ICO_WORK_EFFECT	= 2,
    CAPTION			= 3,
    NAME			= 4,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_SpecModuleItemSlotWnd.defName		= ""
UI.Ship_SpecModuleItemSlotWnd.tooltipData	= nil

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.Ship_SpecModuleItemSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateTooltip()

end


--
function UI.Ship_SpecModuleItemSlotWnd:UpdateIco()

	UI:UpdateItemIco( self.defName, self, self.layers.ICO_WORK_EFFECT, false )

end


--
function UI.Ship_SpecModuleItemSlotWnd:UpdateName()

	local name = UI:GetEntityLocalizedNameByDef( self.defName, true, false )
	self:SetText( name, self.layers.NAME )

end


--
function UI.Ship_SpecModuleItemSlotWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType		= UI.tooltipTypes.MODULE,
		defName			= self.defName,
		dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForDef( UI.ShipWnd:GetShipDefName(), ai.SpaceShipModuleSlot.SPECIAL ),
	}

end

-- ------------------------------------------------------------
-- UI.Ship_DlcBtn
-- ------------------------------------------------------------

UI.Ship_DlcBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_DlcBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn13",

	props =
	{
		name		= "Ship_DlcBtn",
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Ship_DlcBtn:Setup( dlcName )

	self:Reset()

	self.dlcName = dlcName
	self:UpdateTooltip()

end


--
function UI.Ship_DlcBtn:Reset()

	self.dlcName		= ""
	self.tooltipData	= nil

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_DlcBtn.textId	= "ships_marketPlace_STEAM_BUNDLE"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_DlcBtn.dlcName = ""

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_DlcBtn:UpdateTooltip()

	if _G.Arc_IsInitialized() then

		local bundleDefName = UI:GetDlcArcBundle( self.dlcName )

		local textColor = UI.TEXT_BASE_COLOR

		local hToltipWnd = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )
		if hToltipWnd ~= UI.INVALID_UI_HANDLE then
			local tooltipWnd = UI:GetUiObjByHandleT( hToltipWnd )
    		if tooltipWnd and tooltipWnd.GetTextColor then
    			textColor = tooltipWnd:GetTextColor()
    		end
		end

		self.tooltipData = {}
		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:GetEntityLocalizedNameByDef( bundleDefName, true, false, true, true )
		self.tooltipData.text			= UI:GetBundleDesc( bundleDefName, false, textColor )

	else

		local dlcLocalizedName = UI:GetDlcLocalizedName( self.dlcName )

		local caption = UI:GetStringByName( "shipDlcTooltip_caption" )
		caption = string.gsub( caption, "%$dlc_name%$", dlcLocalizedName )

		local textId = string.format( "dlc_%s_desc", self.dlcName )
		local text = UI:GetStringByName( textId )

		self.tooltipData = {}
		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= caption
		self.tooltipData.text			= text

	end

end


-- ------------------------------------------------------------
-- UI.Ship_PriceBtn
-- ------------------------------------------------------------

UI.Ship_PriceBtn = {}

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )
                            	
-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Ship_PriceBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Ship_PriceBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- PRICE
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
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
function UI.Ship_PriceBtn:SetupPrice( defName )

	self:Reset()

	self.mode		= self.modes.PRICE
	self.defName	= defName

	self:UpdateText()

end


--
function UI.Ship_PriceBtn:SetupShipParts( defName )

	self:Reset()

	self.mode		= self.modes.SHIP_PARTS
	self.defName	= defName

	self:UpdateText()

end


--
function UI.Ship_PriceBtn:GetMode()

	return self.mode

end


--
function UI.Ship_PriceBtn:Reset()

	self.mode		= -1
	self.defName	= ""

	self.priceMetaText:SetText( "", true )

end


--
function UI.Ship_PriceBtn:OnPlayerCreditsChanged()

	if self.mode ~= self.modes.PRICE then
		return
	end

	self:UpdateText()

end


--
function UI.Ship_PriceBtn:OnAccountAurasChanged()

	if self.mode ~= self.modes.PRICE then
		return
	end

	self:UpdateText()

end


--
function UI.Ship_PriceBtn:OnResourcesChanged()

	if self.mode ~= self.modes.SHIP_PARTS then
		return
	end

	self:UpdateText()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Ship_PriceBtn.layers =
{
    MAIN_EFFECT	= 0,
	DEBUG		= 1,
    PRICE		= 2,
}

UI.Ship_PriceBtn.effectInfo =
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

UI.Ship_PriceBtn.modes =
{
	PRICE		= 1,
	SHIP_PARTS	= 2,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Ship_PriceBtn.defName		= ""
UI.Ship_PriceBtn.priceMetaText	= nil
UI.Ship_PriceBtn.mode			= -1

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Ship_PriceBtn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

end


--
function UI.Ship_PriceBtn:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Ship_PriceBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Ship_PriceBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.Ship_PriceBtn:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.Ship_PriceBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Ship_PriceBtn:UpdateMetaTextColor()

	self.priceMetaText:SetColor( self:GetColor( self.layers.PRICE ) )

end


--
function UI.Ship_PriceBtn:UpdateText()

	self.priceMetaText:SetText( "", true )
	self:UpdateMetaTextColor()

	if self.mode == self.modes.PRICE then

		local price, bGold = UI:GetShopBuyPriceByDef( self.defName, false, true, true )

    	local priceInfo = {}

    	priceInfo.priceType 	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
    	priceInfo.val			= price
    	priceInfo.bIsBuyPrice	= true
    	priceInfo.basePrice		= price

    	local strPrice = UI:PriceInfo2Str( priceInfo, self.priceMetaText:GetColor(), false, nil, true, nil )
    	self.priceMetaText:SetText( strPrice, true )

	elseif self.mode == self.modes.SHIP_PARTS then

		local str = ""

    	local resourceDefName, needRecourceCount = UI:GetShipPartsForShip( self.defName )
    	if resourceDefName ~= "" then

    		local isResourceCount = UI:GetPlayerResourceCount( resourceDefName )

        	local priceInfo = {}

        	priceInfo.priceType 	= UI.exPriceTypes.SHIP_PARTS
        	priceInfo.val			= needRecourceCount
    		priceInfo.defName		= resourceDefName
        	priceInfo.bIsBuyPrice	= true
        	priceInfo.basePrice		= needRecourceCount
    		priceInfo.valAsString	= string.format( "%s/%s", UI:Num2StrSeparatedBy3( isResourceCount ), UI:Num2StrSeparatedBy3( needRecourceCount ) )

        	str = UI:PriceInfo2Str( priceInfo, self.priceMetaText:GetColor(), false, false, true, nil )

    	else
    		sys.log( "UI.Ship_PriceBtn:UpdateText()[ERROR]: no resource price found for ship" )
    	end

		self.priceMetaText:SetText( str, true )

	end

end


-- перегрузка функции из UI.EffectButtonWnd, чтобы наведение на ссылку-цену не сбрасывало выделение с кнопки;
-- а также для апдейта цвета метатекста в зависимости от анимации
function UI.Ship_PriceBtn:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local mouseState = self:GetMouseState()
	local animation = ""
	local curAnimation = mainEffect:GetCurAnimation()
	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

	local bMouseIn = mouseState == UI.MOUSE_IN or mouseState == UI.MOUSE_DOWN
	if not bMouseIn then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseIn = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	end

	if self.pressTimer ~= -1 then
		animation = self.effectInfo.main.animationPressed

	elseif self:HasStyle( UI.WS_GRAYED ) or self:HasStyle( UI.WS_DISABLE ) then
		animation = self.effectInfo.main.animationDisabled

	elseif mouseState == UI.MOUSE_DOWN then
		animation = bHasFocus and self.effectInfo.main.animationPressed_focus or self.effectInfo.main.animationPressed
		self.pressTimer = self.PRESS_TIME

	elseif bMouseIn then
		animation = bHasFocus and self.effectInfo.main.animationSelect_focus or self.effectInfo.main.animationSelect

	else
		animation = bHasFocus and self.effectInfo.main.animationIdle_focus or self.effectInfo.main.animationIdle
	end

	if animation and animation ~= "" and animation ~= curAnimation then
		mainEffect:StartAnimation( animation )
		self:UpdateMetaTextColor()
	end

end


-- ------------------------------------------------------------
-- UI.Ship_PriceBtn_credits, UI.Ship_PriceBtn_gold
-- ------------------------------------------------------------

--
UI.Ship_PriceBtn_credits =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "Ship_PriceBtn",

    	props =
		{
			name		= "Ship_PriceBtn_credits",
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
    						layer		= "UI.Ship_PriceBtn.layers.PRICE",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
    }
}


--
UI.Ship_PriceBtn_gold =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "Ship_PriceBtn",

    	props =
		{
			name		= "Ship_PriceBtn_gold",
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
    				defName 			= "textBtn12",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.Ship_PriceBtn.layers.PRICE",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
    }
}

-- ------------------------------------------------------------
-- UI.Ship_TestDriveBtn
-- ------------------------------------------------------------

--
UI.Ship_TestDriveBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",
	
		props =
		{
			name		= "Ship_TestDriveBtn",
		},
	},
	
	textId = "popUpMenu_testDrive"
	
}

-- ------------------------------------------------------------
-- UI.Ship_CrossBtn
-- ------------------------------------------------------------

UI.Ship_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn2",

    	props =
    	{
    		name = "Ship_CrossBtn"
    	}
	}
}

-- ------------------------------------------------------------
-- UI.Ship_TradeWnd
-- ------------------------------------------------------------

UI.Ship_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "Ship_TradeWnd",
    	},
	},

	mainWndName = "ShipWnd",
}

-- ------------------------------------------------------------
-- UI.Ship_BuyWithInventoryWnd
-- ------------------------------------------------------------

UI.Ship_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "Ship_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "ShipWnd",
}