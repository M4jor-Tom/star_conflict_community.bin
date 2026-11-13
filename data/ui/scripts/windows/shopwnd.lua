-- ----------------------------------------------------------------------------
--
-- Workfile: shopwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.ShopWnd = {}
local sw = UI.ShopWnd

sw.layers =
{
	MAIN_EFFECT						= 0,
	BG_EFFECT						= 1,
	WORK_EFFECT						= 2,
	CAPTION							= 3,
	FILTERS_EFFECT					= 4,
	FILTERS_BASE_GROUP_EFFECT		= 5,
	DECOR_EFFECT					= 6,
	PARAMS_WARNING					= 7,
	NO_ITEMS_TEXT					= 8,
	INVENTOTY_SIZE_EFFECT			= 9,
	INVENTOTY_SIZE_VAL				= 10,
	INVENTOTY_SIZE_VAL_FULL			= 11,
	AUTOGEN_INVENTOTY_SIZE_EFFECT	= 12,
	AUTOGEN_INVENTOTY_SIZE_VAL		= 13,
	AUTOGEN_INVENTOTY_SIZE_VAL_FULL	= 14,
	WAIT_EFFECT						= 15,
	WAIT_TEXT						= 16,
}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShopWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name	= "ShopWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
	},

	layers =
	{
		firstOverlayLayer = sw.layers.NO_ITEMS_TEXT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shop_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "win",	
						layer		= "UI.ShopWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- legacy from FullScreenWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tree",	
						wnd			= "UI.Shop_CategoriesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "filter",	
						layer		= "UI.ShopWnd.layers.FILTERS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "search",	
						layer		= "UI.ShopWnd.layers.DECOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "product_list",	
						wnd			= "UI.Shop_ItemsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "product_list",	
						wnd			= "UI.Shop_ItemsGridWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn",	
						wnd			= "UI.Shop_TradeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn_2",	
						wnd			= "UI.Shop_SalvageBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn_2",	
						wnd			= "UI.Shop_CraftBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "load_modules",	
						layer		= "UI.ShopWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "empty",	
						layer		= "UI.ShopWnd.layers.NO_ITEMS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.Shop_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "btn_help",	
						wnd			= "UI.Shop_HelpBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "title",	
						layer		= "UI.ShopWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "sort_btn1",	
						wnd			= "UI.Shop_SortBtn_Asc",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "sort_btn2",	
						wnd			= "UI.Shop_SortBtn_Desc",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "add_slot",	
						layer		= "UI.ShopWnd.layers.INVENTOTY_SIZE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "add_slot1",
						layer		= "UI.ShopWnd.layers.AUTOGEN_INVENTOTY_SIZE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",	
						layer		= "UI.ShopWnd.layers.PARAMS_WARNING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 3, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "shop_caption" )
		},

		-- FILTERS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_filters_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "slot_4",	
						layer		= "UI.ShopWnd.layers.FILTERS_BASE_GROUP_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					}, 

					{
						objName		= "slot_5",	
						wnd			= "UI.Shop_FilterComboBox_Rank",
						animParams	= UI.EffectAnimParams.POS,
					}, 


					{
						objName		= "slot_6",	
						wnd			= "UI.Shop_FilterComboBox_Quality",
						animParams	= UI.EffectAnimParams.POS,
					}, 
				}
			}}
		},

		-- FILTERS_BASE_GROUP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_filters_baseGroup",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "slot_3",	
						wnd			= "UI.Shop_FilterCheckBox_FitForSelShip",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_1",	
						wnd			= "UI.Shop_FilterCheckBox_UnfitForShips",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_2",	
						wnd			= "UI.Shop_FilterCheckBox_NotOnShips",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- DECOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_decor",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "view_btn1",	
						wnd			= "UI.Shop_ItemsModeListBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "view_btn2",	
						wnd			= "UI.Shop_ItemsModeGridBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},		

		-- PARAMS_WARNING
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 5, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "shop_paramsWarning" )
		},

		-- NO_ITEMS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 3, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_noItems"
		},

		-- INVENTOTY_SIZE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "equipment_inventorySize",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn",	
						wnd			= "UI.Shop_InventorySizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value",	
						layer		= "UI.ShopWnd.layers.INVENTOTY_SIZE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_left",	
						layer		= "UI.ShopWnd.layers.INVENTOTY_SIZE_VAL_FULL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- INVENTOTY_SIZE_VAL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- INVENTOTY_SIZE_VAL_FULL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- AUTOGEN_INVENTOTY_SIZE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "equipment_inventorySize",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn",	
						wnd			= "UI.Shop_AutogenInventorySizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value",	
						layer		= "UI.ShopWnd.layers.AUTOGEN_INVENTOTY_SIZE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_left",	
						layer		= "UI.ShopWnd.layers.AUTOGEN_INVENTOTY_SIZE_VAL_FULL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- AUTOGEN_INVENTOTY_SIZE_VAL
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- AUTOGEN_INVENTOTY_SIZE_VAL_FULL
		{
			layerType		= UI.LAYER_TEXT,

			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
						layer		= "UI.ShopWnd.layers.WAIT_TEXT",
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
		"UI.Shop_CategoriesListWnd",
		"UI.Shop_FilterCheckBox_FitForSelShip",
		"UI.Shop_FilterCheckBox_UnfitForShips",
		"UI.Shop_FilterCheckBox_NotOnShips",
		"UI.Shop_FilterComboBox_Rank",
		"UI.Shop_FilterComboBox_Quality",
		"UI.Shop_ItemsModeListBtn",
		"UI.Shop_ItemsModeGridBtn",
		"UI.Shop_ItemsListWnd",
		"UI.Shop_ItemsGridWnd",
		"UI.Shop_TradeBtn",
		"UI.Shop_CrossBtn",
		"UI.Shop_HelpBtn",
		"UI.Shop_SortBtn_Asc",
		"UI.Shop_SortBtn_Desc",
		"UI.Shop_InventorySizeBtn",
		"UI.Shop_AutogenInventorySizeBtn",
		"UI.Shop_SalvageBtn",
		"UI.Shop_CraftBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShopWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Shop_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Shop_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Shop_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Shop_UpgradeItemWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:UpdateOnPlayerCreditsChanged()

end


--
function UI.ShopWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountRankChanged()

end


--
function UI.ShopWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Shop_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Shop_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Shop_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShopWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Shop_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Shop_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Shop_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShopWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Shop_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Shop_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Shop_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ShopWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 0 then

		if self.tradeMode == self.tradeModes.SELL then
			self:UpdateInBattleState()
		end

	elseif result == 1 then
		self:ShowMessageOnTimeOut()
	end

end


--
function UI.ShopWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self.tradeMode == self.tradeModes.SELL then
			self:UpdateInBattleState()
		end

	end

end


--
function UI.ShopWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self.tradeMode == self.tradeModes.SELL then
			self:UpdateInBattleState()
		end

	end

end


--
function UI.ShopWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self.tradeMode == self.tradeModes.SELL then
			self:UpdateInBattleState()
		end

	end

end


--
function UI.ShopWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	elseif result == 2 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShopWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	UI.Shop_SalvageWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	elseif result == 2 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShopWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	UI.Shop_SalvageWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI.ShopWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 0 then

		if self.tradeMode == self.tradeModes.SELL then
			self:UpdateInBattleState()
		end

	end

end


--
function UI.ShopWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	end

end


--
function UI.ShopWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	end

end


-- коллбэк, вызывается из окна покупки/продажи
function UI.ShopWnd:OnTradeResult_Buy( storeItem, count, priceType )

	if not UI:IsDefBundle( storeItem.defName ) and not UI:IsDefAmmo( storeItem.defName ) then
		UI:AddWaitingRequest( _G.GameStore_Buy( storeItem.id, count, priceType, 1 ) )	-- #0072739, (0309199) - 1 нужна для сбора статистики
	else
		UI:AddWaitingRequest( _G.GameStore_Buy( storeItem.id, count, priceType ) )
	end

	-- TODO: припокупке ресурсов и чертежей ждать коллбэк для них

	self.itemToBuy = nil

end


-- коллбэк, вызывается из окна покупки/продажи
function UI.ShopWnd:OnTradeResult_Sell( invItem, count )

	if invItem.itemType == UI.invItemTypes.MODULE then

		local iids = {}
		for i = 1, count do
			table.insert( iids, invItem.iids[ i ] )
		end

		local sellRequestId = _G.GameStore_SellItems( iids )

		if sellRequestId ~= 0 then

			UI:AddWaitingRequest( sellRequestId )

    		if invItem.equipShipItem then
    			
    			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )

    			if UI:GetModuleType( invItem.defName ) == ai.ModuleType.WEAPON then
    				self:CheckShowMsgOnUnequipPrimaryAmmo( invItem.equipShipItem, ai.WeaponClass.UNKNOWN )
    			end

    		end

		else
			UI:ShowMsgOnSellError()
		end


	elseif invItem.itemType == UI.invItemTypes.AMMO then

		if invItem.equipShipItem then

			sys.log( "UI.ShopWnd:OnTradeResult_Sell()[ERROR]: trying to sell equipped ammo" )

		else

			local sellRequestId = _G.GameStore_SellItem( invItem.iids[ 1 ], count )

    		if sellRequestId ~= 0 then
    			UI:AddWaitingRequest( sellRequestId )
    		else
    			UI:ShowMsgOnSellError()
    		end

		end

	elseif invItem.itemType == UI.invItemTypes.RESOURCE or invItem.itemType == UI.invItemTypes.BLUEPRINT then

		local sellRequestId = _G.MasterServer_SellCraftResource( invItem.defName, count )

		if sellRequestId ~= 0 then
			UI:AddWaitingRequest( sellRequestId )
		else
			UI:ShowMsgOnSellError()
		end

	else
		sys.log( "UI.ShopWnd:OnTradeResult_Sell()[ERROR]: unhandled item type: %s", tostring( invItem.itemType ) )
	end

	self.itemToSell = nil

end


--
function UI.ShopWnd:OnTradeResult_Cancel()

	self.itemToBuy = nil
	self.itemToSell = nil

end


--
function UI.ShopWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.INVENTORY_USER or mode == UI.BuyWnd.modes.INVENTORY_AUTO then

			self:BuyInventory()
			
			
		elseif mode == UI.BuyWnd.modes.AUTOGEN_INVENTORY_USER then

			self:BuyAutogenInventory()


    	elseif mode == UI.BuyWnd.modes.SALVAGE then

    		self:DoSalvageItem2( data.iid )


    	elseif mode == UI.BuyWnd.modes.SELL_ITEMS then

			local bError = false

			if data.iids and next( data.iids ) then

				local requestId = _G.GameStore_SellItems( data.iids )

        		if requestId ~= 0 then

        			UI:AddWaitingRequest( requestId )

					if data.numUnequippedShips == 1 then
		    			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )

					elseif data.numUnequippedShips > 1 then
		    			UI:AddWaitingRequest( UI.VESSELS_EQUIPMENT_REQUEST_ID )
					end

					if data.bHasUnequppedAmmo then
						self:ShowMsgOnUnequipPrimaryAmmo()
					end

        		else
					bError = true
        		end

			end

			if data.resources and next( data.resources ) then

        		local requestId = _G.MasterServer_SellCraftResources( data.resources )

        		if requestId ~= 0 then
        			UI:AddWaitingRequest( requestId )
        		else
					bError = true
        		end

			end

			if bError then
				UI:ShowMsgOnSellError()
			end

		else
			sys.log( "UI.ShopWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
			self.itemToBuy = nil
			self.resourceToCraftFrom = nil
		end

	else

		self.itemToBuy = nil
		self.resourceToCraftFrom = nil

	end

end


--
function UI.ShopWnd:OnBuyWithInventoryWndResult( result, data )

	if result == true then
		self:BuyInventory( data.inventoryLevels )
	else
		self.itemToBuy = nil
	end

end


-- магазин сейчас убран из публичного доступа, может вызываться только вручную разработчиками
function UI.ShopWnd:ShowAndSelectItem( defName )

	if not self:IsOnScreen() then
		sys.log( "UI.ShopWnd:ShowAndSelectItem()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.ShopWnd:ShowAndSelectItem()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	local mainCategory, subCategory = UI:GetItemShopCategory( defName )
	if mainCategory == "" then
		sys.log( "UI.ShopWnd:ShowAndSelectItem()[ERROR]: cannot find shop main category for item %s", defName )		
		return
	end

	self.bLockItemsUpdate = true

	self:SetTradeMode( self.tradeModes.BUY )

	self:RemoveBuyFiltersRestrictions()

	self.categoriesList:SelectMainCategory( mainCategory, false, false )

	if subCategory ~= "" then
		self.categoriesList:SelectSubCategory( subCategory, mainCategory, false )
	end

	self.bLockItemsUpdate = false

	self:UpdateItems( { { defName = defName } }, false )

	-- проверка
	local selItem = self:GetSelItems()[ 1 ]
	if not selItem or selItem.defName ~= defName then
		sys.log( "UI.ShopWnd:ShowAndSelectItem()[ERROR]: cannot find record for %s", defName )
	else
		return true
	end

end


-- вызывается из окна ангара
function UI.ShopWnd:ShowAndSelectStoreItem( defName, iid )

	if not self:IsOnScreen() then
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	local def = UI:GetDef( defName )
	if not def then
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: cannot find _G.Def[%s]", defName )
		return
	end

	if iid ~= nil then
    	if type( iid ) ~= "userdata" then
    		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: invalid type of the 2-nd parameter (\"iid\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( iid ) )
    		return
    	end
	end

	local mainCategory = def.shopCategory
	if not mainCategory then
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: cannot find _G.Def[%s].shopCategory", defName )		
		return
	end

	local subCategory = def.shopSubCategory
	if not subCategory then
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: cannot find _G.Def[%s].shopSubCategory", defName )
		return
	end

	local bFound = false

	if self.tradeMode == self.tradeModes.SELL then

    	local recordIdx, slotIdx = self:FindItemRecordByItemInfo( { defName = defName, iid = iid } )
    	if recordIdx ~= -1 then

			bFound = true

    		if self.itemsMode == self.itemsModes.LIST then
    			self.itemsListWnd:SelectSingleRecord( recordIdx )		

    		elseif self.itemsMode == self.itemsModes.GRID then
    			self.itemsListWnd:SelectSingleSlot( recordIdx, slotIdx )
    		end

		end

	end

	if not bFound then

		self.bLockItemsUpdate = true

		self:SetTradeMode( self.tradeModes.SELL )

    	self:RemoveSellFiltersRestrictions()

    	self.categoriesList:SelectMainCategory( mainCategory, false, false )
    	self.categoriesList:SelectSubCategory( subCategory, mainCategory, false )

    	self.bLockItemsUpdate = false

    	self:UpdateItems( { { defName = defName, iid = iid } }, false )

	end

	-- проверка

	local bSuccess = false

	local selItem = self:GetSelItems()[ 1 ]
	if selItem then
		if selItem.defName == defName then
			if iid ~= nil then
				for idx, itemIid in pairs( selItem.iids ) do
					if itemIid == iid then
						bSuccess = true
						break
					end
				end
			else
				bSuccess = true
			end
		end
	end

	if not bSuccess then
		local strIid = iid and string.format( "(iid %s)", _G.U64ToStr( iid ) ) or ""
		sys.log( "UI.ShopWnd:ShowAndSelectStoreItem()[ERROR]: cannot find record for %s%s", defName, strIid )
	end


	-- установка скролла на слот

	local selRecordIdx = -1

    if self.itemsMode == self.itemsModes.LIST then
		selRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()
    elseif self.itemsMode == self.itemsModes.GRID then
    	selRecordIdx = self.itemsListWnd:GetSingleSelectedSlot()
	end

	if selRecordIdx ~= -1 then
		self.itemsListWnd:SetScrollPos( selRecordIdx )
	end

end


--
function UI.ShopWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if requestId == self.requestId_buyInventory then

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then

    		if self.itemToBuy then
	    	    self:LaunchBuyTradeWnd( self.itemToBuy )

			elseif self.resourceToCraftFrom then
		    	self:DoCraftFromResource( self.resourceToCraftFrom )
    		end

    	else
    		self:ShowBuyErrorMsg( result )
    	end

    	self.itemToBuy = nil
		self.resourceToCraftFrom = nil
		self.requestId_buyInventory = 0

	end

    if result == _G.GameStore.StoreBuyResult.SBR_OK then
		self:UpdateInventorySize()
	end

end



--
function UI.ShopWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if requestId == self.requestId_buyAutogenInventory then

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
	
			if self.itemToBuy then
				self:LaunchBuyTradeWnd( self.itemToBuy )
	
			elseif self.resourceToCraftFrom then
				self:DoCraftFromResource( self.resourceToCraftFrom )
			end
	
		else
			self:ShowBuyErrorMsg( result )
		end
	
		self.itemToBuy = nil
		self.resourceToCraftFrom = nil
		self.requestId_buyAutogenInventory = 0
	
	end
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
		self:UpdateAutogenInventorySize()
	end

end


--
function UI.ShopWnd:GameStore_OnSpoiled( result, requestId )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self.itemToBuy = nil
	self.itemToSell = nil
	self.resourceToCraftFrom = nil

	UI.Shop_TradeWnd:UnlinkFromParent()
	UI.Shop_BuyWnd:UnlinkFromParent()
	UI.Shop_BuyWithInventoryWnd:UnlinkFromParent()
	UI.Shop_SalvageWnd:UnlinkFromParent()
	UI.Shop_UpgradeItemWnd:UnlinkFromParent()
	
	if UI.AutogenUpgradeWnd:GetMainWndName() == self:GetName() then
		UI.AutogenUpgradeWnd:Hide()
	end

end


--
function UI.ShopWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()
	self:FullUpdate()

end


--
function UI.ShopWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	UI.Shop_UpgradeItemWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.ShopWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	UI.Shop_UpgradeItemWnd:GameStore_OnUpgradeItems( result, requestId, iids )

end


-- called from UI.HangarWnd
function UI.ShopWnd:OnHangarSelShipChanged()

	if not self:IsOnScreen() then
		return
	end

	self.selShipItem = UI.HangarWnd:GetSelShipItem()

	if UI.Shop_FilterCheckBox_FitForSelShip:IsChildOf( self ) and UI.Shop_FilterCheckBox_FitForSelShip:IsChecked() then
		self:UpdateItems( self:GetSelItemsInfo(), false )

	else
    	if self.itemsListWnd then

			if self.itemsMode == self.itemsModes.LIST then

        		for slotIdx = 1, self.itemsListWnd:GetNumVisibleSlots() do

        			local slotWnd = self.itemsListWnd:GetButtonForSlot( slotIdx )
					if slotWnd then
	        			slotWnd:OnSelShipItemChanged()
					end

        		end

			elseif self.itemsMode == self.itemsModes.GRID then

				local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

				if firstVisibleRecordIdx ~= -1 then
					for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

						local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
						local recordData = self.itemsListWnd:GetRecordData( recordIdx )

						for slotIdx, slotData in pairs( recordData.slots ) do
							local slotWnd = rowWnd:GetSlotWnd( slotIdx )
			        		slotWnd:OnSelShipItemChanged()							
						end
					end

				end
			end

    	end
	end

end


--
function UI.ShopWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		UI:ShowMsgOnItemCraftError( result )
	end

end


--
function UI.ShopWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShopWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShopWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

	if requestId == self.salvage2RequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			UI:ShowMsgOnSalvage2Error( result )
		end

		self.salvage2RequestId = 0

	end

end


--
function UI.ShopWnd:GetSelShipItem()

	return self.selShipItem

end


--
function UI.ShopWnd:OnUpgradeItemWndResult( result, iid, vid, equipSlot, customData )

	if not self:IsOnScreen() then
		sys.log( "UI.ShopWnd:OnUpgradeItemWndResult()[ERROR]: not on screen" )
		return
	end

	if result == false then
		return
	end

	if self.tradeMode == self.tradeModes.SELL then

		local inventoryItem = UI:GetInventoryItem( iid )

    	local recordIdx, slotIdx = self:FindItemRecordByItemInfo( { defName = inventoryItem.defName, iid = iid } )
    	if recordIdx ~= -1 then

    		if self.itemsMode == self.itemsModes.LIST then

    			local slotWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
        			slotWnd:ShowUpgradeItemWowEffect()
				end

    		elseif self.itemsMode == self.itemsModes.GRID then

				local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
				local slotWnd = rowWnd and rowWnd:GetSlotWnd( slotIdx )

				if slotWnd then
	        		slotWnd:ShowUpgradeItemWowEffect()							
				end

    		end

		end

	end

end


--
function UI.ShopWnd:GetRestoreStateData()

	local state = nil

	if not self:IsOnScreen() then
		sys.log( "UI.ShopWnd:GetRestoreStateData()[ERROR]: not on screen" )
		return state
	end

	state = {}

	state.tradeMode			= self.tradeMode
	state.itemsMode			= self.itemsMode
	state.sortMode			= self.sortMode
	state.selMainCategory	= self.categoriesList:GetSelectedMainCategory()
	state.selSubCategory	= self.categoriesList:GetSelectedSubCategory()
	state.filters			= self:GetFilters()
	state.selItemsInfo		= self:GetSelItemsInfo()
	state.scrollPos			= self.itemsListWnd:GetScrollPos()

	return state

end


--
function UI.ShopWnd:RestoreState( state )

	if not self:IsOnScreen() then
		sys.log( "UI.ShopWnd:RestoreState()[ERROR]: not on screen" )
		return
	end

	if type( state ) ~= "table" then
		sys.log( "UI.ShopWnd:RestoreState()[ERROR]: invalid type of the 1-st parameter (\"state\"); \"table\" expected, got \"%s\"", type( state ) )
		return
	end

	self.bLockItemsUpdate = true

	self:SetTradeMode( state.tradeMode )
	self:SetItemsMode( state.itemsMode )
	self:SetSortMode( state.sortMode )

	self.categoriesList:SelectMainCategory( state.selMainCategory, false, false )

	if state.selMainCategory ~= "" then
		self.categoriesList:SelectSubCategory( state.selSubCategory, state.selMainCategory, false )
	end

	if UI.Shop_FilterCheckBox_FitForSelShip:IsChildOf( self ) then
		UI.Shop_FilterCheckBox_FitForSelShip:Check( state.filters.bFitForSelShip )
	end

	if UI.Shop_FilterCheckBox_UnfitForShips:IsChildOf( self ) then
		UI.Shop_FilterCheckBox_UnfitForShips:Check( state.filters.bUnfitForShipsOnly )
	end

	if UI.Shop_FilterCheckBox_NotOnShips:IsChildOf( self ) then
		UI.Shop_FilterCheckBox_NotOnShips:Check( state.filters.bNotOnShips )
	end

	if UI.Shop_FilterComboBox_Rank:IsChildOf( self ) then
		for recordIdx = 1, UI.Shop_FilterComboBox_Rank:GetNumRecords() do
			local data = UI.Shop_FilterComboBox_Rank:GetRecordData( recordIdx )
			if data.rank == state.filters.rank then
				UI.Shop_FilterComboBox_Rank:SelectRecord( recordIdx )
				break
			end
		end
	end

	if UI.Shop_FilterComboBox_Quality:IsChildOf( self ) then
		for recordIdx = 1, UI.Shop_FilterComboBox_Quality:GetNumRecords() do
			local data = UI.Shop_FilterComboBox_Quality:GetRecordData( recordIdx )
			if data.quality == state.filters.quality then
				UI.Shop_FilterComboBox_Quality:SelectRecord( recordIdx )
				break
			end
		end
	end

	self.bLockItemsUpdate = false
	self:UpdateItems( state.selItemsInfo, false )

	self.itemsListWnd:SetScrollPos( state.scrollPos )

end


--
function UI.ShopWnd:OnAutogenUnequipWnd( items, cancelMode, customData )

	if not self:IsOnScreen() then
		return
	end

	-- проверяем, что всё, что нужно было снять, было снято
	if cancelMode == UI.AutogenUnequipWnd.cancelModes.BREAK then
	
		local bAllUnequipped = true
		for itemIdx, item in pairs( items ) do
			if not( item.result == UI.AutogenUnequipWnd.itemResults.DESTROYED or item.result == UI.AutogenUnequipWnd.itemResults.DISMANTLED ) then
				bAllUnequipped = false
				break
			end
		end
		
		if not bAllUnequipped then
			return
		end
		
	end
	
	-- вызываем снова ту же функцию и с теми же параметрами, которую пытались вызвать до показа окна снятия автогена
	if customData.fnName and customData.fnName ~= "" then
		self[ customData.fnName ]( self, unpack( customData.params ) )
	end

end


--
function UI.ShopWnd:GameStore_OnAutogenDestroy( result, requestId, params )

	-- здесь только показ сообщения оьб ошибке, апдейт будет в F_OnEventInvItemsChanged()
	
	if requestId == self.autogenDestroyRequestId then

		if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
			self:ShowMsgOnAutogenDestroyError( result )
		end
		
		self.autogenDestroyRequestId = 0
		self:UpdateWaitEffect()
		
	end

end


-- ------------------------------
-- const
-- ------------------------------

sw.IS_FULL_SCREEN	= false

sw.MAX_FILTER_CUSTOM_GROUPS		= 3
sw.MAX_FILTERS_IN_CUSTOM_GROUP	= 6

sw.effectInfo =
{
	work =
	{
		itemsWndObjName			= "product_list",
		chestsBtnLocator		= "chest_btn",
		categoriesLocator_buy	= "tree",
		categoriesLocator_sell	= "tree_2",
		craftBtnLocator			= "buy_btn_2",
		salvageBtnLocator		= "buy_btn_2",
		tradeBtnLocator			= "buy_btn",
	},

	inventorySize =
	{
		btnLocator = "btn"
	},

	filters =
	{
		rankLocator		= "slot_5",
		qualityLocator	= "slot_6",
	},

	filtersBase =
	{
     	fitForShipsLocator		= "slot_3",
     	unfitForShipsLocator 	= "slot_1",
     	notOnShipsLocator		= "slot_2",
	},

	decor =
	{
		itemsModeListBtnLocator	= "view_btn1",
		itemsModeGridBtnLocator	= "view_btn2",
	},
}

sw.itemsModes =
{
	LIST	= 1,
	GRID	= 2,
}

sw.sounds =
{
	categoryMouseOver			= UI.sounds.btnMouseOver,
	categorySelect				= "sound/ui/btnClick",
	categoryDeselect			= "sound/ui/commonListClose",
	categorySelectAnimated		= "sound/ui/commonListOpen",
	categoryDeselectAnimated	= "sound/ui/commonListClose",
	categoryChangeAnimated		= "sound/ui/commonListOpen",
	itemMouseOver				= "sound/ui/btnMouseOver",
	itemSelect					= "sound/ui/btnClick",
	itemsScrollRange			= "sound/ui/btnMouseOver",
	itemsModeChange				= "sound/ui/btnClick",
	tradeWndShow				= "sound/ui/btnClick",
	cannotTrade					= UI.sounds.invalid,
	sortModeChange				= "sound/ui/btnClick",
	chestSelect					= UI.sounds.btnClick,
	craft						= "sound/ui/apply",
	salvage						= "sound/ui/lootScanSuccess",	-- TODO: звук
}

sw.tradeModes =
{
	BUY		= 1,
	SELL	= 2,
}

sw.TEXT_BASE_COLOR	= UI.TEXT_BASE_COLOR
sw.TEXT_SEL_COLOR	= UI.TEXT_SEL_COLOR

sw.sortModes =
{
	ASC		= 1,
	DESC	= 2,
}

sw.qualityOrder = { 1, 6, 3, 7, 5 }	-- соответствует { MK1, Rare, MK3, Epic, Relic }		см. #0020132, комм.(0093889);  MK2, Premium в списке нет - см.#0033873


sw.itemUnavailableReasons =
{
	NONE		= 1,
	BUY_RANK	= 2,
}

sw.multiSelectionKey		= UI.Keys.KEY_CONTROL
sw.MAX_ITEMS_FOR_SELL		= 255
sw.MAX_RESOURCES_FOR_SELL	= 255

-- ------------------------------
-- vars
-- ------------------------------

sw.categoriesList						= nil
sw.itemsMode							= -1
sw.itemsListWnd							= nil
sw.selShipItem							= nil
sw.bLockItemsUpdate						= false
sw.hMsgTimeOut							= UI.INVALID_UI_HANDLE
sw.hMsgBuyError							= UI.INVALID_UI_HANDLE
sw.hSellError							= UI.INVALID_UI_HANDLE
sw.hMsgUneqipAmmo						= UI.INVALID_UI_HANDLE
sw.inventoryItemsCount					= {}
sw.equipmentItemsCount					= {}
sw.tradeMode							= -1
sw.itemToSell							= nil
sw.itemToBuy							= nil
sw.resourceToCraftFrom					= nil
sw.requestId_buyInventory				= 0
sw.requestId_buyAutogenInventory		= 0
sw.sortMode								= -1
sw.chestRequestId						= 0
sw.salvage2RequestId					= 0
sw.autogenDestroyRequestId				= 0
sw.autogenIidToDestroy					= nil
sw.hMsgAutogenDestroy					= UI.INVALID_UI_HANDLE

-- локальная переменная для хранения (с целью восстановления при апдейте) режима торговли (BUY/SELL);
-- не член UI.ShopWnd, чтобы не затиралась при перегрузке ресурсов;
-- введена как замена хранению в профиле, с целью минимизировать переделки после того, как запретили для публичного использования режим BUY;
-- позволяет сохранять выбранный режим торговли до закрытия приложения
if l_storedTradeMode == nil then
	l_storedTradeMode = -1
end

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShopWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.categoriesList = UI.Shop_CategoriesListWnd	

	self:HideItemsWndInternal( UI.Shop_ItemsListWnd )
	self:HideItemsWndInternal( UI.Shop_ItemsGridWnd )

	self:UpdateTradeBtnState()
	self:UpdateSalvageBtn()
	self:UpdateCraftBtn()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_ACTIVATE_RECORD )	

end


--
function UI.ShopWnd:InitFilters()

	if UI.Shop_FilterComboBox_Rank:GetNumRecords() > 0 then
		return
	end

	UI.Shop_FilterCheckBox_FitForSelShip:Setup( nil, UI:GetStringByName( "shop_filters_fitForSelShip" ) )	
	UI.Shop_FilterCheckBox_UnfitForShips:Setup( nil, UI:GetStringByName( "shop_filters_unfitForShipsOnly" ) )	
	UI.Shop_FilterCheckBox_NotOnShips:Setup( nil, UI:GetStringByName( "shop_filters_notOnShips" ) )


	-- список рангов

	local allRanksData =
	{
		rank	= -1,
		text	= UI:GetStringByName( "shop_filters_ranksAll" )
	}
	UI.Shop_FilterComboBox_Rank:AddRecord( allRanksData )

	for rank = 1, UI:GetMaxRank() do

		local strRank = tostring( rank )

		local data =
		{
			rank 	= rank,
			text	= strRank,
		}
		UI.Shop_FilterComboBox_Rank:AddRecord( data )

	end

	local ranksTooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "shop_rankFilterTooltip" )
	}
	UI.Shop_FilterComboBox_Rank:SetTooltipData( ranksTooltipData )



	-- список категорий качества

	local allQualitiesData =
	{
		quality	= -1,
		text	= UI:GetStringByName( "shop_filters_qualitiesAll" ),
	}
	UI.Shop_FilterComboBox_Quality:AddRecord( allQualitiesData )

	for qualityIdx = 1, #self.qualityOrder do

		local quality = self.qualityOrder[ qualityIdx ]

		local strQuality = UI:GetStringByName( string.format( "mark_%d", quality ) )
		local color = UI.itemsColors[ quality ] and UI.itemsColors[ quality ].base or UI.WHITE_COLOR

		local data =
		{
			quality		= quality,
			text		= strQuality,
			color		= color,
		}
		UI.Shop_FilterComboBox_Quality:AddRecord( data )		

	end

	local qualityTooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "shop_qualityFilterTooltip" )
	}
	UI.Shop_FilterComboBox_Quality:SetTooltipData( qualityTooltipData )

end


--
function UI.ShopWnd:Reset()

	self.bLockItemsUpdate = true

	self.categoriesList:Reset()
	self:ResetFilters()
	self:ResetItemsList()
	self:SetItemsMode( -1, false )
	self:SetTradeMode( -1 )
	self:SetSortMode( -1 )
	self:HideWaitEffect()
	self:HideNoItemsText()
	self:ResetInventorySize()
	self:ResetAutogenInventorySize()
	self:RemoveControl( UI.Shop_SalvageBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( UI.Shop_CraftBtn, self.layers.WORK_EFFECT )
	UI.Shop_TradeBtn:SetBtnText( "" )
	self:RemoveControl( UI.Shop_TradeBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( UI.Shop_ItemsModeListBtn, self.layers.DECOR_EFFECT )
	self:RemoveControl( UI.Shop_ItemsModeGridBtn, self.layers.DECOR_EFFECT )

	self.selShipItem					= nil
	self.bLockItemsUpdate				= false
	self.inventoryItemsCount			= {}
	self.equipmentItemsCount			= {}
	self.itemToSell						= nil
	self.itemToBuy						= nil
	self.resourceToCraftFrom			= nil
	self.requestId_buyInventory			= 0
	self.requestId_buyAutogenInventory	= 0

end


--
function UI.ShopWnd:ResetFilters()

	UI.Shop_FilterCheckBox_FitForSelShip:Check( false )	
	UI.Shop_FilterCheckBox_UnfitForShips:Check( false )	
	UI.Shop_FilterCheckBox_NotOnShips:Check( false )	
	UI.Shop_FilterComboBox_Rank:SelectRecord( -1 )
	UI.Shop_FilterComboBox_Quality:SelectRecord( -1 )

	self:RemoveControl( UI.Shop_FilterComboBox_Rank, self.layers.FILTERS_EFFECT )
	self:RemoveControl( UI.Shop_FilterComboBox_Quality, self.layers.FILTERS_EFFECT )
 	self:RemoveControl( UI.Shop_FilterCheckBox_FitForSelShip, self.layers.FILTERS_BASE_GROUP_EFFECT )
 	self:RemoveControl( UI.Shop_FilterCheckBox_UnfitForShips, self.layers.FILTERS_BASE_GROUP_EFFECT )
 	self:RemoveControl( UI.Shop_FilterCheckBox_NotOnShips, self.layers.FILTERS_BASE_GROUP_EFFECT )

end


--
function UI.ShopWnd:FullUpdate()

	self:Reset()

	self.bLockItemsUpdate = true

	self:InitFilters()

	self.selShipItem = UI.HangarWnd:GetSelShipItem()

    local specCategoriesInfo = self:GetSpecialCategoriesInfo()

	self:ValidateTradeMode( specCategoriesInfo )
	self:UpdateCategories( self.tradeMode, specCategoriesInfo )
	self:ValidateCategoriesSelection()
	self:ValidateItemsMode( false )
	self:ValidateSortMode()
	self:CalcItemsCount()
	self:UpdateInventorySize()
	self:UpdateAutogenInventorySize()
	self:UpdateWaitEffect()

	self.bLockItemsUpdate = false

	self:UpdateItemsControls( nil )

end


--
function UI.ShopWnd:UpdateCategories( tradeMode, specCategoriesInfo )

	local oldSelMainCategory = self.categoriesList:GetSelectedMainCategory()
	local oldSelSubCategory = self.categoriesList:GetSelectedSubCategory()

	self.categoriesList:Reset()

	local categories = _G.StoreInfo and _G.StoreInfo.categories
	if not categories then
		return
	end

	local saleCategories = nil

	if tradeMode == self.tradeModes.BUY then

    	if not specCategoriesInfo then
    		specCategoriesInfo = self:GetSpecialCategoriesInfo()
    	end

		saleCategories = specCategoriesInfo.saleCategories
		local bHasSale = next( saleCategories ) ~= nil

    	if bHasSale then

    		local saleData = {}
    		saleData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
    		saleData.categoryInfo		= { name = "sale" }
    		saleData.sale				= true

        	self.categoriesList:AddRecord( saleData )

		end
		
	end

	for mainCategoryIdx = 1, #categories do		

		local mainCategoryInfo = categories[ mainCategoryIdx ]

		if mainCategoryInfo.shop ~= false and not( tradeMode ~= self.tradeModes.SELL and mainCategoryInfo.sellOnly == true ) then

			local mainSaleInfo = saleCategories and saleCategories[ mainCategoryInfo.name ]

    		local mainData = {}

    		mainData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
    		mainData.categoryInfo		= mainCategoryInfo
			mainData.sale				= mainSaleInfo ~= nil
    		mainData.filters			= mainCategoryInfo.filters
    		mainData.bGold				= mainCategoryInfo.gold == true

    		self.categoriesList:AddRecord( mainData )

    		local subCategories = mainCategoryInfo.subCategories
    		if subCategories then

    			for subCategoryIdx = 1, #subCategories do

    				local subCategoryInfo = subCategories[ subCategoryIdx ]

					if subCategoryInfo.shop ~= false and not( tradeMode ~= self.tradeModes.SELL and subCategoryInfo.sellOnly == true ) then

                		local subData = {}

                		subData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.SUB
        				subData.categoryInfo		= subCategoryInfo
        				subData.parentCategoryInfo	= mainCategoryInfo
						subData.sale				= mainSaleInfo ~= nil and mainSaleInfo[ subCategoryInfo.name ] ~= nil
        				subData.filters				= subCategoryInfo.filters or mainCategoryInfo.filters
						subData.bGold				= subCategoryInfo.gold

        				self.categoriesList:AddRecord( subData )

					end

    			end

    		end				

		end

	end	

	self.categoriesList:UpdateVisibleRecordsImmediate()

	if oldSelMainCategory ~= "" then

		if self.categoriesList:FindRecordByCategoryName( oldSelMainCategory, UI.StoreCategoriesListWnd.categoryTypes.MAIN ) ~= -1 then

			self.categoriesList:SelectMainCategory( oldSelMainCategory, false, false )

    		if oldSelSubCategory ~= "" then

				if self.categoriesList:FindRecordByCategoryName( oldSelSubCategory, UI.StoreCategoriesListWnd.categoryTypes.SUB, oldSelMainCategory ) ~= -1 then
	    			self.categoriesList:SelectSubCategory( oldSelSubCategory, oldSelMainCategory, false )
				end

    		end

		end
		
	end	

end


--
function UI.ShopWnd:GetSpecialCategoriesInfo()

	local saleCategories = {}

	for defName, shopItem in pairs( UI.serverData.shopByDef ) do

		if UI:IsItemVisibleInShop( shopItem ) then

			if UI:IsItemSale( shopItem ) then

				local mainCategory	= ""
				local subCategory	= ""

    			local def = UI:GetDef( shopItem.defName )
    			if def and def.shopCategory and def.shopSubCategory then
					mainCategory	= def.shopCategory
					subCategory		= def.shopSubCategory
    			end

				if mainCategory ~= "" then

    				local mainCategoryInfo = saleCategories[ mainCategory ]
    				if not mainCategoryInfo then
    					mainCategoryInfo = {}
    					saleCategories[ mainCategory ] = mainCategoryInfo
    				end

					if subCategory ~= "" then
        				if not mainCategoryInfo[ subCategory ] then
        					mainCategoryInfo[ subCategory ] = true
        				end
					end

				end

			end

		end

	end

	local info =
	{
		saleCategories	= saleCategories,
	}

	return info

end


--
function UI.ShopWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.CATEGORY_SLOT then

		if not self.categoriesList:IsAnimating() then

    		local recordIdx = wnd:GetRecord()
			local bIsSelected = self.categoriesList:IsRecordSelected( recordIdx )

			self.categoriesList:SelectRecord( recordIdx, not bIsSelected, true, true )

		end


	elseif wnd.FILTER_CB then

		wnd:Check( not wnd:IsChecked() )
		self:OnFiltersChanged()


	elseif wnd == UI.Shop_ItemsModeListBtn then

		if not wnd:IsChecked() then
			self:SetItemsMode( self.itemsModes.LIST )
			UI:PlayGlobalSound( self.sounds.itemsModeChange )
		end


	elseif wnd == UI.Shop_ItemsModeGridBtn then

		if not wnd:IsChecked() then
			self:SetItemsMode( self.itemsModes.GRID )
			UI:PlayGlobalSound( self.sounds.itemsModeChange )
		end

	elseif wnd.ITEM_SLOT or wnd.ITEM_CONTROL then

		local slotWnd = wnd.ITEM_SLOT and wnd or self:GetSlotByInput( wnd )

		if slotWnd.ITEM_LIST_SLOT then

        	local recordIdx = slotWnd:GetRecord()

			if self:IsMultiSelectionAllowed() and _G.Input_IsKeyPressed( self.multiSelectionKey ) then

				if self.itemsListWnd:IsRecordSelected( recordIdx ) then

					if recordIdx ~= self.itemsListWnd:GetSingleSelectedRecord() then

						self.itemsListWnd:RemoveSelectedRecord( recordIdx )
    					UI:PlayGlobalSound( self.sounds.itemSelect )

					end

				else
					self.itemsListWnd:AddSelectedRecord( recordIdx )
    				UI:PlayGlobalSound( self.sounds.itemSelect )
				end

			else

				local singleSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()
				if recordIdx ~= singleSelRecordIdx then

	        		self.itemsListWnd:SelectSingleRecord( recordIdx )
    				UI:PlayGlobalSound( self.sounds.itemSelect )

				end

			end

		elseif slotWnd.ITEM_GRID_SLOT then

			local rowWnd	= slotWnd:GetParent()

			local recordIdx	= rowWnd:GetRecord()
			local slotIdx	= slotWnd:GetSlot()

			if self:IsMultiSelectionAllowed() and _G.Input_IsKeyPressed( self.multiSelectionKey ) then

				if self.itemsListWnd:IsSlotSelected( recordIdx, slotIdx ) then

    				local singleSelRecordIdx, singleSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
    				if recordIdx ~= singleSelRecordIdx or slotIdx ~= singleSelSlotIdx then

						self.itemsListWnd:RemoveSelectedSlot( recordIdx, slotIdx )
    					UI:PlayGlobalSound( self.sounds.itemSelect )

					end

				else
					self.itemsListWnd:AddSelectedSlot( recordIdx, slotIdx )
    				UI:PlayGlobalSound( self.sounds.itemSelect )
				end

			else

    			local singleSelRecordIdx, singleSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()

    			if recordIdx ~= singleSelRecordIdx or slotIdx ~= singleSelSlotIdx then
    				self.itemsListWnd:SelectSingleSlot( recordIdx, slotIdx )
    				UI:PlayGlobalSound( self.sounds.itemSelect )
    			end

			end

		end

	elseif UI:IsWndKindOf( wnd, "EffectEditWnd" ) then
		
		self:SetDefaultActivatableChild( wnd:GetName() )
		UI:ValidateKeyboardFocus()

	elseif wnd == UI.Shop_TradeBtn then

		if not UI.Shop_TradeBtn:IsGray() then

    		if self.tradeMode == self.tradeModes.BUY then
    			self:TryBuySelItem()

    		elseif self.tradeMode == self.tradeModes.SELL then
    			self:TrySellSelItems()
    		end

		end

	elseif wnd == UI.Shop_CrossBtn then

		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )

	elseif wnd == UI.Shop_SortBtn_Asc then

		if not UI.Shop_SortBtn_Asc:IsChecked() then
			self:SetSortMode( self.sortModes.ASC )
			UI:PlayGlobalSound( self.sounds.sortModeChange )
		end

	elseif wnd == UI.Shop_SortBtn_Desc then

		if not UI.Shop_SortBtn_Desc:IsChecked() then
			self:SetSortMode( self.sortModes.DESC )
			UI:PlayGlobalSound( self.sounds.sortModeChange )
		end

	elseif wnd == UI.Shop_InventorySizeBtn then

		if not self:IsWaitingRequests() then
		
    		if UI:CanIncreaseInventory() then
    			self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.INVENTORY_USER )
			else
				UI:MessageBox( UI:GetStringByName( "buyInventory_caption_USER" ), UI:GetStringByName( "msg_cannotIncreaseInventory_USER" ), UI.MBS_OK )			
    		end

		end
		
	elseif wnd == UI.Shop_AutogenInventorySizeBtn then

		if not self:IsWaitingRequests() then
		
			if UI:CanIncreaseAutogenInventory() then
				self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.AUTOGEN_INVENTORY_USER )
			else
				UI:MessageBox( UI:GetStringByName( "buyAutogenInventory_caption_USER" ), UI:GetStringByName( "msg_cannotIncreaseAutogenInventory_USER" ), UI.MBS_OK )			
			end

		end

	elseif wnd == UI.Shop_SalvageBtn then

		self:TrySalvageSelItem()

	elseif wnd == UI.Shop_CraftBtn then

		self:TryCraftFromSelItem()

	end

	return true

end


--
function UI.ShopWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.ITEM_SLOT or wnd.ITEM_CONTROL then

		local slotWnd = wnd.ITEM_SLOT and wnd or self:GetSlotByInput( wnd )

		if slotWnd.ITEM_LIST_SLOT then

    		local recordIdx = slotWnd:GetRecord()
    		if self.itemsListWnd:GetSingleSelectedRecord() ~= recordIdx then
    			self.itemsListWnd:SelectSingleRecord( recordIdx )
    		end

		elseif slotWnd.ITEM_GRID_SLOT then			

			local rowWnd	= slotWnd:GetParent()

			local recordIdx	= rowWnd:GetRecord()
			local slotIdx	= slotWnd:GetSlot()

			local oldRecordIdx, oldSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()

			if recordIdx ~= oldRecordIdx or slotIdx ~= oldSlotIdx then
				self.itemsListWnd:SelectSingleSlot( recordIdx, slotIdx )
			end

		end

		if UI.Shop_TradeBtn:IsChildOf( self ) and not UI.Shop_TradeBtn:IsGray() then

    		if self.tradeMode == self.tradeModes.BUY then
    			self:TryBuySelItem()

    		elseif self.tradeMode == self.tradeModes.SELL then
    			self:TrySellSelItems()
    		end

		end

	end

	return true

end


--
function UI.ShopWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.ITEM_SLOT or wnd.ITEM_CONTROL then

		if not self:IsWaitingRequests() then

			local menuDatas = {}
			local item = nil

			local slotWnd = wnd.ITEM_SLOT and wnd or self:GetSlotByInput( wnd )
			if slotWnd then

    			if slotWnd.ITEM_LIST_SLOT then

    	    		local recordIdx = slotWnd:GetRecord()
    				local data = self.itemsListWnd:GetRecordData( recordIdx )
    				item = data.item

    			elseif slotWnd.ITEM_GRID_SLOT then

             		local rowWnd = slotWnd:GetParent()

             		local recordIdx = rowWnd:GetRecord()
             		local slotIdx = slotWnd:GetSlot()

    				local data = self.itemsListWnd:GetRecordData( recordIdx )
            		item = data.slots[ slotIdx ].item

    			end

			end

			if item then

				local bInBattle = self.tradeMode == self.tradeModes.SELL and ( self:IsItemInBattle( item ) or self:IsItemOnShipQuest( item ) )

    			-- купить

    			if self.tradeMode == self.tradeModes.BUY then

					local unavailableReason = self:GetItemUnavailableReason( item )
					if unavailableReason == self.itemUnavailableReasons.NONE then

        				local buyData = {}

                		buyData.slotType	= UI.popUpMenuSlotTypes.BUY_ITEM
        				buyData.text		= UI:GetStringByName( "popUpMenu_buyItem" )
        				buyData.shopItem	= item

        				table.insert( menuDatas, buyData )

					end

    			end


    			-- снять

    			if self.tradeMode == self.tradeModes.SELL and not bInBattle then

        			if item.equipShipItem then

    					-- установленная аммуниция не продается, поэтому в этом окне ее и не дожно быть
    					if UI:IsDefModule( item.defName ) then

            				local unequipData = {}

                    		unequipData.slotType	= UI.popUpMenuSlotTypes.REMOVE_EQUIPPED_ITEM
            				unequipData.text		= UI:GetStringByName( "popUpMenu_unequipItem" )
            				unequipData.vid			= item.equipShipItem.vid
            				unequipData.defName 	= item.defName

        					local idx, iid = next( item.iids )
        					unequipData.iid = iid
    						unequipData.slotId = UI:GetEquippedSlot( iid )

    						table.insert( menuDatas, unequipData )

    					end

    				end

    			end


    			-- продать (кроме установленного автогена)

    			if self.tradeMode == self.tradeModes.SELL and not bInBattle and not ( UI:IsDefAutogen( item.defName ) and item.equipShipItem ) then

    				local sellData = {}

        			sellData.slotType	= UI.popUpMenuSlotTypes.SELL_ITEM
					sellData.text		= UI:GetStringByName( "popUpMenu_sellItem" )
					sellData.vid		= item.equipShipItem and item.equipShipItem.vid or UI.INVALID_U64_ID
					sellData.defName	= item.defName
					sellData.count		= item.count
					sellData.iids		= item.iids

					table.insert( menuDatas, sellData )

    			end
				
				
				-- уничтожить установленный автоген
				
				if self.tradeMode == self.tradeModes.SELL and not bInBattle and ( UI:IsDefAutogen( item.defName ) and item.equipShipItem ) then
				
					local destroyData = {}

					destroyData.slotType	= UI.popUpMenuSlotTypes.AUTOGEN_DESTROY
					destroyData.text		= UI:GetStringByName( "popUpMenu_autogenDestroy" )
					destroyData.iid			= item.iids[1]

					table.insert( menuDatas, destroyData )

				end
				
				
    			-- разобрать

    			if self.tradeMode == self.tradeModes.SELL and not bInBattle then

    				if UI:CanItemBeSalvaged( item.defName ) or UI:CanItemBeSalvaged2( item.defName ) then

    					local salvageData = {}

            			salvageData.slotType	= UI.popUpMenuSlotTypes.SALVAGE_ITEM
    					salvageData.text		= UI:GetStringByName( "popUpMenu_salvageItem" )

    					local idx, iid = next( item.iids )
        				salvageData.iid = iid

    					table.insert( menuDatas, salvageData )

    				end    

    			end


    			-- апгрейдить

    			if self.tradeMode == self.tradeModes.SELL and not bInBattle then

    				if UI:IsItemUpgradable( item.defName ) then

        				local iid = item.iids[ 1 ]

        				local upgradeData = UI:GetItemPopUpMenuDataForUpgrade( iid )
        				if upgradeData then
    						table.insert( menuDatas, upgradeData )
        				end

    				end

    			end


				-- крафтить

    			if self.tradeMode == self.tradeModes.SELL and not bInBattle then

					-- в окне магазина крафитить можно только из ресурса, из чертежа не нужно - #0042610, комм.(0158091)
					if UI:IsDefResource( item.defName ) and UI:CanResourceBeUsed( item.defName ) and UI:IsEnoughIngredientsForCraftFromResource( item.defName, 1 ) then

        				local craftData = {}

            			craftData.slotType	= UI.popUpMenuSlotTypes.CRAFT_ITEM
        				craftData.text		= UI:GetStringByName( "popUpMenu_craftItem" )
						craftData.defName	= item.defName

    					table.insert( menuDatas, craftData )

					end

				end		


				-- открыть в верфи

    			if self.tradeMode == self.tradeModes.SELL then

					if UI:IsDefModule( item.defName ) and item.equipShipItem then

        				local iid = item.iids[ 1 ]

        				local menuData = {}

            			menuData.slotType	= UI.popUpMenuSlotTypes.SHOW_EQUIPPED_MODULE
        				menuData.text		= UI:GetStringByName( "popUpMenu_showEquippedModule" )
						menuData.iid		= iid

    					table.insert( menuDatas, menuData )
						
					end			

				end
				
				
				-- показать в атласе
				
				if UI:IsItemVisibleInAtlas( UI:GetItemUpgradeBaseDef( item.defName ) ) then
				
					local atlasData = {}

					atlasData.slotType	= UI.popUpMenuSlotTypes.SHOW_ATLAS
					atlasData.text		= UI:GetStringByName( "popUpMenu_showAtlas" )
					atlasData.defName	= item.defName

					table.insert( menuDatas, atlasData )

				end
				
				
				-- открыть окно торговли с другими игроками
				
				if UI:IsItemTrading( item.defName ) then
				
					local tradingData = {}

					tradingData.slotType	= UI.popUpMenuSlotTypes.TRADING_ITEM
					tradingData.text		= UI:GetStringByName( "popUpMenu_tradingItem" )
					tradingData.defName		= item.defName

					table.insert( menuDatas, tradingData )

				end


    			-- все вместе

    			if next( menuDatas ) then

    	        	UI.PopUpMenuWnd:Setup( self:GetUiHandle(), UI.popUpMenuTypes.ITEM, UI:GetEntityLocalizedNameByDef( item.defName, true, false, true ) )

    				for idx = 1, #menuDatas do
            			UI.PopUpMenuWnd:AddRecord( menuDatas[idx ] )
    				end

    			end

			end

		end

	end

	return true

end


--
function UI.ShopWnd:F_OnEventListActivateRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.PopUpMenuWnd:GetUiHandle() and UI.PopUpMenuWnd:GetOwner() == self:GetUiHandle() then

    	local menuType = UI.PopUpMenuWnd:GetMenuType()
    	if menuType == UI.popUpMenuTypes.ITEM then
    		self:OnItemPopUpMenu( iParam0 )
    	else
    		sys.log( "UI.ShopWnd:F_OnEventListActivateRecord()[ERROR]: unhandled pop-up menu type: \"%s\"", tostring( menuType ) )
    	end

	end

end  


--
function UI.ShopWnd:OnItemPopUpMenu( recordIdx )

	local data = UI.PopUpMenuWnd:GetRecordData( recordIdx )
	if not data then
		sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: cannot find pop-up menu data for record %d", recordIdx )
		return
	end

	if data.slotType == UI.popUpMenuSlotTypes.BUY_ITEM then
		self:TryBuyItem( data.shopItem )

	elseif data.slotType == UI.popUpMenuSlotTypes.REMOVE_EQUIPPED_ITEM then

		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then

			if UI:IsDefModule( data.defName ) then

				local curIid = shipItem.equipModules[ data.slotId ] or UI.INVALID_U64_ID

				if curIid == data.iid then
	    			self:UnequipModuleInternal( data.vid, data.slotId )
				else
					sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: cannot remove - module iid mismatch; probably equipment has been changed since initiation of poup menu" )
				end					

			else
				sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: unsupported item type" )
        	end

		else
    		sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: cannot find ship item" )
		end  

	elseif data.slotType == UI.popUpMenuSlotTypes.SELL_ITEM then

		local invItem = self:MakeInvItemForSell( data.defName, data.count, data.iids, data.vid )
		if invItem then
			self:LaunchSellTradeWnd( invItem )
		else
			sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: cannot create invItem for %s", data.defName )
		end
		
	elseif data.slotType == UI.popUpMenuSlotTypes.AUTOGEN_DESTROY then
	
		self:TryDestroyAutogen( data.iid )

	elseif data.slotType == UI.popUpMenuSlotTypes.SALVAGE_ITEM then

		local invItem = UI:GetInventoryItem( data.iid )
		if UI:CanItemBeSalvaged( invItem.defName ) then
			self:LaunchSalvageWnd( data.iid )
		else
			self:LaunchSalvage2Wnd( data.iid )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.UPGRADE_ITEM then

		if UI:GetAutogenInventoryItem( data.iid ) then
			self:LaunchAutogenUpgradeWnd( data.iid )
		else
			self:LaunchUpgradeItemWnd( data.iid )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.CRAFT_ITEM then
		self:TryCraftFromRersource( data.defName )

	elseif data.slotType == UI.popUpMenuSlotTypes.SHOW_EQUIPPED_MODULE then	
		UI.HangarWnd:ShowEquippedModule( data.iid )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.SHOW_ATLAS then
	
		UI.HangarWnd:ShowProfile( UI:GetLocalPlayerUid(), "ATLAS", true, nil, { bShop = true, restoreData = self:GetRestoreStateData() } )
		UI.Profile_AtlasWnd:ShowItem( data.defName )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.TRADING_ITEM then
	
		UI.TradingWnd:Setup( UI.TradingWnd.modes.COMMON, self:GetName() )
		UI.TradingWnd:Show()
		UI.TradingWnd:ShowItem( data.defName )

	else
		sys.log( "UI.ShopWnd:OnItemPopUpMenu()[ERROR]: unhandled slot type: \"%s\"", tostring( data.slotType ) )
	end

end


--
function UI.ShopWnd:UnequipModuleInternal( vid, slotId )

	local iid = UI:GetShipItem( vid, false ).equipModules[ slotId ]
	if UI:GetAutogenInventoryItem( iid ) then
	
		UI.AutogenUnequipWnd:Setup( { { iid = iid, actions = UI.AutogenUnequipWnd.actions.DESTROY + UI.AutogenUnequipWnd.actions.DISMNANTLE } }, UI.AutogenUnequipWnd.cancelModes.BREAK, self:GetName(), {} )
		UI.AutogenUnequipWnd:Show()
		return
		
	end

	local changeEquipmentRequestId, bForbidden = UI:SafeChangeEquipment( vid, slotId, UI.INVALID_U64_ID )
	if changeEquipmentRequestId ~= 0 then

		UI:AddWaitingRequest( changeEquipmentRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID ) -- ждем апдейта инвентаря, который будет вызван из кода cpp

		if slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 then
			self:CheckShowMsgOnUnequipPrimaryAmmo( UI:GetShipItem( vid ), ai.WeaponClass.UNKNOWN )
		end
		
	end

end


--
function UI.ShopWnd:LaunchUpgradeItemWnd( iid )
                                                                           	
	UI.Shop_UpgradeItemWnd:Setup( iid, UI.INVALID_U64_ID, -1, true )
	UI.Shop_UpgradeItemWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShopWnd:LaunchAutogenUpgradeWnd( iid )

	UI.AutogenUpgradeWnd:Setup( iid, self:GetName() )
	UI.AutogenUpgradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShopWnd:MakeInvItemForSell( defName, count, iids, equipVid )

	local invItemType = -1

	if UI:IsDefAmmo( defName ) then
		invItemType = UI.invItemTypes.AMMO

	elseif UI:IsDefModule( defName ) then
		invItemType = UI.invItemTypes.MODULE

	elseif UI:IsDefResource( defName ) then
		invItemType = UI.invItemTypes.RESOURCE

	elseif UI:IsDefBlueprint( defName ) then
		invItemType = UI.invItemTypes.BLUEPRINT
	end

	if invItemType == -1 then
		sys.log( "UI.ShopWnd:MakeInvItemForSell()[ERROR]: unhanlded item type for %s", defName )
		return nil
	end

	local equipShipItem = nil
	if equipVid ~= UI.INVALID_U64_ID then
		equipShipItem = UI:GetShipItem( equipVid )
	end

	local invItem = UI:CreateInvItem( invItemType, defName, equipShipItem, count, nil, nil, nil )
	invItem.iids = iids

	return invItem

end


--
function UI.ShopWnd:OnEditMissMouse( editWnd )

	if self:GetDefaultActivatableChildName() == editWnd:GetName() then
		self:SetDefaultActivatableChild( "" )
		UI:ValidateKeyboardFocus()
	end
	
end


--
function UI.ShopWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end
	
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

    local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if not self.itemsListWnd then
		return true
	end	

	if not( wnd == self.itemsListWnd or wnd:IsChildOf( self.itemsListWnd ) ) then
		return true
	end	

	self.timeSinceMouseWheel = 0

	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

	self.itemsListWnd:ScrollVisibleRange( ticks < 0 )

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.itemsScrollRange )
	end

	return true

end


--
function UI.ShopWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.Shop_CategoriesListWnd:GetUiHandle() then
		self:OnSelCategoryChanged()

	elseif self.itemsListWnd and hSender == self.itemsListWnd:GetUiHandle() then
		self:OnSelItemChanged()
	end	

end


--
function UI.ShopWnd:OnSelCategoryChanged()

	self:ValidateItemsMode( false )
	self:UpdateItemsControls( nil )

end


--
function UI.ShopWnd:OnSelItemChanged()

	self:UpdateTradeBtnState()
	self:UpdateSalvageBtn()
	self:UpdateCraftBtn()

end


--
function UI.ShopWnd:SetDefaultFilterVals()

	UI.Shop_FilterCheckBox_FitForSelShip:Check( false )
	UI.Shop_FilterCheckBox_UnfitForShips:Check( false )
	UI.Shop_FilterCheckBox_NotOnShips:Check( false )

	local defaultRank = -1
	for rankRecordIdx = 1, UI.Shop_FilterComboBox_Rank:GetNumRecords() do
		local rankData = UI.Shop_FilterComboBox_Rank:GetRecordData( rankRecordIdx )
		if rankData.rank == defaultRank then
			UI.Shop_FilterComboBox_Rank:SelectRecord( rankRecordIdx )
			break		
		end
	end

	local defaultQuality = -1
	for qualityRecordIdx = 1, UI.Shop_FilterComboBox_Quality:GetNumRecords() do
		local qualityData = UI.Shop_FilterComboBox_Quality:GetRecordData( qualityRecordIdx )
		if qualityData.quality == defaultQuality then
			UI.Shop_FilterComboBox_Quality:SelectRecord( qualityRecordIdx )
			break		
		end
	end

end


--
function UI.ShopWnd:SaveSelCategory()

	local profile = _G.GetProfileTable()

	if not profile.shop then
		profile.shop = {}
	end

	profile.shop.mainCategory	= self.categoriesList:GetSelectedMainCategory()
	profile.shop.subCategory	= self.categoriesList:GetSelectedSubCategory()

end



--
function UI.ShopWnd:RestoreSelCategory()

	local profile = _G.GetProfileTable()
	
	if not profile.shop then	
		return false
	end

	if not profile.shop.mainCategory or not profile.shop.subCategory then
		return false		
	end

	if profile.shop.mainCategory ~= "" and self.categoriesList:FindRecordByCategoryName( profile.shop.mainCategory, UI.StoreCategoriesListWnd.categoryTypes.MAIN ) ~= -1 then

		self.categoriesList:SelectMainCategory( profile.shop.mainCategory, false, false )

	    if profile.shop.subCategory ~= "" and self.categoriesList:FindRecordByCategoryName( profile.shop.subCategory, UI.StoreCategoriesListWnd.categoryTypes.SUB, profile.shop.mainCategory ) ~= -1 then
			self.categoriesList:SelectSubCategory( profile.shop.subCategory, profile.shop.mainCategory, false )
		end

	else
		self.categoriesList:SelectMainCategory( "", false, false )
	end

	return true

end


--
function UI.ShopWnd:SetDefaultSelCategory()

	-- no category by default

end


--
function UI.ShopWnd:ValidateCategoriesSelection()

	if not self:RestoreSelCategory() then
		self:SetDefaultSelCategory()
	end

end


--
function UI.ShopWnd:SaveItemsMode()

	if self.itemsMode == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if not profile.shop then
		profile.shop = {}
	end

	profile.shop.itemsMode = self.itemsMode

end


--
function UI.ShopWnd:RestoreItemsMode( bUpdateControls )

	local profile = _G.GetProfileTable()

	if not profile.shop then	
		return false
	end
	
	if not profile.shop.itemsMode then	
		return false
	end

	if profile.shop.itemsMode ~= self.itemsModes.LIST and profile.shop.itemsMode ~= self.itemsModes.GRID then
		return false
	end

	self:SetItemsMode( profile.shop.itemsMode, bUpdateControls )

	return true

end


--
function UI.ShopWnd:SetDefaultItemsMode( bUpdateControls )

	self:SetItemsMode( self.itemsModes.LIST, bUpdateControls )

end


--
function UI.ShopWnd:ValidateItemsMode( bUpdateControls )

	if not self:RestoreItemsMode( bUpdateControls ) then
		self:SetDefaultItemsMode( bUpdateControls )
	end

end 


--
function UI.ShopWnd:SaveTradeMode()

	-- не сохраняется в профиле, т.к. для публичного использования сейчас доступен только режим SELL,
	-- однако BUY по-прежнему доступен для разработчиков (можно включить вручную);
	-- сохраняется локально - это позволяет выбранному режиму не сбрасываться до закрытия приложения
	
	if self.tradeMode == -1 then
		return
	end

	l_storedTradeMode = self.tradeMode

end


--
function UI.ShopWnd:RestoreTradeMode()

	-- не сохраняется в профиле, т.к. для публичного использования сейчас доступен только режим SELL,
	-- однако BUY по-прежнему доступен для разработчиков (можно включить вручную);
	-- сохраняется локально - это позволяет выбранному режиму не сбрасываться до закрытия приложения
	
	if UI:Val2Key( self.tradeModes, l_storedTradeMode ) == "" then
		return false
	end

	self:SetTradeMode( l_storedTradeMode )

	return true

end


--
function UI.ShopWnd:SetDefaultTradeMode()

	self:SetTradeMode( self.tradeModes.SELL )

end


--
function UI.ShopWnd:ValidateTradeMode( specCategoriesInfo )

	if not self:RestoreTradeMode() then
		self:SetDefaultTradeMode()
	end

end


--
function UI.ShopWnd:SaveSortMode()

	if self.sortMode == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if not profile.shop then
		profile.shop = {}
	end

	profile.shop.sortMode = self.sortMode

end


--
function UI.ShopWnd:RestoreSortMode()

	local profile = _G.GetProfileTable()

	if not profile.shop then	
		return false
	end
	
	if not profile.shop.sortMode then	
		return false
	end

	if UI:Val2Key( self.sortModes, profile.shop.sortMode ) == "" then
		return false
	end

	self:SetSortMode( profile.shop.sortMode )

	return true

end


--
function UI.ShopWnd:SetDefaultSortMode()

	self:SetSortMode( self.sortModes.ASC )

end


--
function UI.ShopWnd:ValidateSortMode()

	if not self:RestoreSortMode() then
		self:SetDefaultSortMode()
	end

end


--
function UI.ShopWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

	if not UI:IsInShutdown() then

		self:SaveSelCategory()
		self:SaveItemsMode()
		self:SaveTradeMode()
		self:SaveSortMode()

		Profile:Save()

	end

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		self:Reset()		-- чтобы не хранилась большая таблица с товарами
	end

	self.hMsgTimeOut				= UI.INVALID_UI_HANDLE
	self.hMsgBuyError				= UI.INVALID_UI_HANDLE
	self.hSellError					= UI.INVALID_UI_HANDLE
	self.hMsgUneqipAmmo				= UI.INVALID_UI_HANDLE
	
	if not UI:IsInRemovingAllWindows() then
		if self.hMsgAutogenDestroy ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgAutogenDestroy )
			UI:Purge()
			self.hMsgAutogenDestroy = UI.INVALID_UI_HANDLE
			self.autogenIidToDestroy = nil
		end
	end

end


--
function UI.ShopWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.ShopWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	UI.Shop_TradeWnd:UnlinkFromParent()
	UI.Shop_BuyWnd:UnlinkFromParent()
	UI.Shop_BuyWithInventoryWnd:UnlinkFromParent()
	UI.Shop_SalvageWnd:UnlinkFromParent()
	UI.Shop_UpgradeItemWnd:UnlinkFromParent()
	
	if UI.AutogenUpgradeWnd:GetMainWndName() == self:GetName() then
		UI.AutogenUpgradeWnd:Hide()
	end
	
	if self.hMsgAutogenDestroy ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgAutogenDestroy )
		UI:Purge()
		self.hMsgAutogenDestroy = UI.INVALID_UI_HANDLE
		self.autogenIidToDestroy = nil
	end
	
end


--
function UI.ShopWnd:OnFiltersChanged()

	self:UpdateItems( self:GetSelItemsInfo(), false )

end


--
function UI.ShopWnd:SetItemsMode( itemsMode, bUpdateControls )

	if bUpdateControls == nil then
		bUpdateControls = true
	end

	if itemsMode == self.itemsMode then
		return
	end

	local selItemsInfo = self:GetSelItemsInfo()

	if self.itemsListWnd then
		self:HideItemsWndInternal( self.itemsListWnd )
		self.itemsListWnd = nil
	end

	self.itemsMode = itemsMode
	self:SaveItemsMode()

	if bUpdateControls then
		self:UpdateItemsControls( selItemsInfo )
	end

end   


--
function UI.ShopWnd:SetTradeMode( tradeMode )

	if tradeMode == self.tradeMode then
		return
	end

	local selItemsInfo = self:GetSelItemsInfo()

	local bOldLockItemsUpdate = self.bLockItemsUpdate
	self.bLockItemsUpdate = true

	self:UpdateCategories( tradeMode )
	self:SetDefaultFilterVals()

	self.bLockItemsUpdate = bOldLockItemsUpdate

	self.tradeMode = tradeMode

	self:ValidateItemsMode( false )
	self:UpdateItemsControls( selItemsInfo )

end


--
function UI.ShopWnd:UpdateItemsControls( selItemsInfo )	

	self:UpdateFilters()

	if self.itemsListWnd then
		self:HideItemsWndInternal( self.itemsListWnd )
		self.itemsListWnd = nil
	end

	if self.tradeMode ~= -1 then

    	if self.itemsMode == self.itemsModes.LIST then
    		self.itemsListWnd = UI.Shop_ItemsListWnd

    	elseif self.itemsMode == self.itemsModes.GRID then
    		self.itemsListWnd = UI.Shop_ItemsGridWnd
    	end

	end

	if self.itemsListWnd then
		self:ShowItemsWndInternal( self.itemsListWnd )
		self:UpdateItems( selItemsInfo, false )
	end
	
	self:UpdateTradeBtnState()
	self:UpdateTradeBtnText()
	self:UpdateSalvageBtn()
	self:UpdateCraftBtn()
	self:UpdateWaitEffect()
	self:UpdateNoItemsText() 
	self:UpdateCategoriesPos()
	self:UpdateItemsModeBtnStates()	

end


--
function UI.ShopWnd:UpdateFilters()

	if self.tradeMode == self.tradeModes.BUY then

		self:AddControl( UI.Shop_FilterComboBox_Rank, self.layers.FILTERS_EFFECT, self.effectInfo.filters.rankLocator )
		self:RemoveControl( UI.Shop_FilterComboBox_Quality, self.layers.FILTERS_EFFECT, self.effectInfo.filters.qualityLocator )
     	self:AddControl( UI.Shop_FilterCheckBox_FitForSelShip, self.layers.FILTERS_BASE_GROUP_EFFECT, self.effectInfo.filtersBase.fitForShipsLocator )
     	self:RemoveControl( UI.Shop_FilterCheckBox_UnfitForShips, self.layers.FILTERS_BASE_GROUP_EFFECT )
     	self:RemoveControl( UI.Shop_FilterCheckBox_NotOnShips, self.layers.FILTERS_BASE_GROUP_EFFECT )

	elseif self.tradeMode == self.tradeModes.SELL then

		self:AddControl( UI.Shop_FilterComboBox_Rank, self.layers.FILTERS_EFFECT, self.effectInfo.filters.rankLocator )
		self:AddControl( UI.Shop_FilterComboBox_Quality, self.layers.FILTERS_EFFECT, self.effectInfo.filters.qualityLocator )	
     	self:AddControl( UI.Shop_FilterCheckBox_UnfitForShips, self.layers.FILTERS_BASE_GROUP_EFFECT, self.effectInfo.filtersBase.unfitForShipsLocator )
     	self:AddControl( UI.Shop_FilterCheckBox_NotOnShips, self.layers.FILTERS_BASE_GROUP_EFFECT, self.effectInfo.filtersBase.notOnShipsLocator )
     	self:RemoveControl( UI.Shop_FilterCheckBox_FitForSelShip, self.layers.FILTERS_BASE_GROUP_EFFECT )

	end

	-- т.к. на момент написания этого комбобоксы налезают на чекбоксы
	if UI.Shop_FilterComboBox_Rank:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Shop_FilterComboBox_Rank )
	end

	if UI.Shop_FilterComboBox_Quality:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Shop_FilterComboBox_Quality )
	end

end


--
function UI.ShopWnd:ShowItemsWndInternal( itemsWnd )

	self:AddControl( itemsWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemsWndObjName )

end


--
function UI.ShopWnd:HideItemsWndInternal( itemsWnd )

	itemsWnd:Clear()
	self:RemoveControl( itemsWnd, self.layers.MAIN_EFFECT )

end


--
function UI.ShopWnd:UpdateItemsModeBtnStates()

	self:AddControl( UI.Shop_ItemsModeListBtn, self.layers.DECOR_EFFECT, self.effectInfo.decor.itemsModeListBtnLocator )
	self:AddControl( UI.Shop_ItemsModeGridBtn, self.layers.DECOR_EFFECT, self.effectInfo.decor.itemsModeGridBtnLocator )

	UI.Shop_ItemsModeListBtn:Check( self.itemsMode == self.itemsModes.LIST )
	UI.Shop_ItemsModeGridBtn:Check( self.itemsMode == self.itemsModes.GRID )

	if self.itemsListWnd then
		self:MoveChildToLastPosition( self.itemsListWnd )
	end

end


--
function UI.ShopWnd:ResetItemsList()

	if self.itemsListWnd then
		self.itemsListWnd:Clear()
	end

end


--
function UI.ShopWnd:UpdateItems( selItemsInfo, bRestoreSelIdx )

	if self.bLockItemsUpdate then
		return
	end

	local items = self:GetItemsFiltered()
	self:FillItemsList( items, selItemsInfo, bRestoreSelIdx )

	self:UpdateNoItemsText() 

end  


--
function UI.ShopWnd:FillItemsList( items, selItemsInfo, bRestoreSelIdx )

	if self.bLockItemsUpdate then
		return
	end

	if self.itemsMode == self.itemsModes.LIST then
		self:FillItemsList_LIST( items, selItemsInfo, bRestoreSelIdx )

	elseif self.itemsMode == self.itemsModes.GRID then
		self:FillItemsList_GRID( items, selItemsInfo, bRestoreSelIdx )
	end

end


--
function UI.ShopWnd:FillItemsList_LIST( items, selItemsInfo, bRestoreSelIdx )

	if selItemsInfo and bRestoreSelIdx then
		sys.log( "UI.ShopWnd:FillItemsList_LIST()[ERROR]: selItemsInfo and bRestoreSelIdx are both not nil" )
	end

	local oldSingleSelRecordIdx	= self.itemsListWnd:GetSingleSelectedRecord()
	local oldScrollPos			= self.itemsListWnd:GetScrollPos()

	self:ResetItemsList()
	
	for idx = 1, #items do

		local data = {}
		data.item = items[ idx ]

		self.itemsListWnd:AddRecord( data )

	end

	local numSelItems = selItemsInfo and #selItemsInfo or 0

	if numSelItems > 1 then

        if not self:IsMultiSelectionAllowed() then
        	selItemsInfo = nil
			numSelItems = 0
        end

		bRestoreSelIdx = false

	end

	if selItemsInfo then

		local selRecords = {}

		for idx, selItemInfo in pairs( selItemsInfo ) do

    		local recordIdx = self:FindItemRecordByItemInfo( selItemInfo )

			if recordIdx ~= -1 then
				table.insert( selRecords, recordIdx )
			end

		end

		table.sort( selRecords )

		for idx, recordIdx in pairs( selRecords ) do
    		self.itemsListWnd:AddSelectedRecord( recordIdx, idx == 1 )
		end	

		local numSelRecords = #selRecords		

		if numSelRecords > 1 then
			self.itemsListWnd:SetScrollPos( selRecords[ 1 ] )
		end

		if numSelItems == 1 and numSelRecords == 0 then

			local selItemInfo = selItemsInfo[ 1 ]

			if selItemInfo.equipShipId ~= nil or selItemInfo.iid ~= nil then

    			selItemInfo.equipShipId	= nil
				selItemInfo.iid			= nil

            	local recordIdx = self:FindItemRecordByItemInfo( selItemInfo )

        		if recordIdx ~= -1 then
        			self.itemsListWnd:SelectSingleRecord( recordIdx )
        		end

			end
			
		end

	elseif bRestoreSelIdx then

		if oldSingleSelRecordIdx ~= -1 then

			local numRecords = self.itemsListWnd:GetNumRecords()
			if numRecords > 0 then
				self.itemsListWnd:SelectSingleRecord( math.min( oldSingleSelRecordIdx, numRecords ) )
			end

			if oldScrollPos ~= -1 then
				self.itemsListWnd:SetScrollPos( oldScrollPos )
			end

		end

	end

	if self.itemsListWnd:GetNumSelectedRecords() == 0 then
		self:ValidateItemSelection()
	end

end


--
function UI.ShopWnd:FillItemsList_GRID( items, selItemsInfo, bRestoreSelIdx )

	if selItemsInfo and bRestoreSelIdx then
		sys.log( "UI.ShopWnd:FillItemsList_GRID()[ERROR]: selItemsInfo and bRestoreSelIdx are both not nil" )
	end

	local oldSingleSelRecordIdx, oldSingleSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
	local oldScrollPos = self.itemsListWnd:GetScrollPos()

	self:ResetItemsList()

	local recordData = { slots = {} }
	local slotIdx = 1

	for idx = 1, #items do

		local slotData = {}
		slotData.item = items[ idx ]

		recordData.slots[ slotIdx ] = slotData		

		slotIdx = slotIdx + 1
		if slotIdx > self.itemsListWnd:GetMaxSlotForRecord() then

			self.itemsListWnd:AddRecord( recordData )

			slotIdx = 1
			recordData = { slots = {} }
		end

	end

	if next( recordData.slots ) then
		self.itemsListWnd:AddRecord( recordData )
	end

	local numSelItems = selItemsInfo and #selItemsInfo or 0

	if numSelItems > 1 then

        if not self:IsMultiSelectionAllowed() then
        	selItemsInfo = nil
			numSelItems = 0
        end

		bRestoreSelIdx = false

	end

	if selItemsInfo then

		local selSlots = {}

		for idx, selItemInfo in pairs( selItemsInfo ) do

    		local recordIdx, slotIdx = self:FindItemRecordByItemInfo( selItemInfo )

			if recordIdx ~= -1 and slotIdx ~= -1 then
				table.insert( selSlots, { recordIdx = recordIdx, slotIdx = slotIdx } )
    		end

		end

		local function fnSort( slotInfo1, slotInfo2 )
			return slotInfo1.recordIdx < slotInfo2.recordIdx
		end

		table.sort( selSlots, fnSort )

		for idx, slotInfo in pairs( selSlots ) do
    		self.itemsListWnd:AddSelectedSlot( slotInfo.recordIdx, slotInfo.slotIdx, idx == 1 )
		end

		local numSelSlots = #selSlots

		if numSelSlots > 1 then
			self.itemsListWnd:SetScrollPos( selSlots[ 1 ].recordIdx )
		end

		if numSelItems == 1 and numSelSlots == 0 then

			local selItemInfo = selItemsInfo[ 1 ]

			if selItemInfo.equipShipId ~= nil then

    			selItemInfo.equipShipId = nil
            	local recordIdx, slotIdx = self:FindItemRecordByItemInfo( selItemInfo )

				if recordIdx ~= -1 and slotIdx ~= -1 then
        			self.itemsListWnd:SelectSingleSlot( recordIdx, slotIdx )
        		end

			end
			
		end


	elseif bRestoreSelIdx then

    	if oldSingleSelRecordIdx ~= -1 and oldSingleSelSlotIdx ~= -1 then

			local numRecords = self.itemsListWnd:GetNumRecords()
			if oldSingleSelRecordIdx <= numRecords then

        		local data = self.itemsListWnd:GetRecordData( oldSingleSelRecordIdx )
        		self.itemsListWnd:SelectSingleSlot( oldSingleSelRecordIdx, math.min( oldSingleSelSlotIdx, #data.slots ) )

			elseif numRecords > 0 then

        		local data = self.itemsListWnd:GetRecordData( numRecords )
        		self.itemsListWnd:SelectSingleSlot( numRecords, #data.slots )

			end

    	end  

		if oldScrollPos ~= -1 then
			self.itemsListWnd:SetScrollPos( oldScrollPos )
		end

	end

	if self.itemsListWnd:GetNumSelectedSlots() == 0 then
		self:ValidateItemSelection()
	end

end


--
function UI.ShopWnd:GetSelItems( bSorted )

	if bSorted == nil then
		bSorted = false
	end

	local items = {}

	if not self.itemsListWnd then
		return items
	end

    if self.itemsMode == self.itemsModes.LIST then

		local selRecords = self.itemsListWnd:GetSelectedRecords()

		if bSorted then

			local selRecordsArr = {}

			for recordIdx, dummy in pairs( selRecords ) do
				table.insert( selRecordsArr, recordIdx )
			end

			table.sort( selRecordsArr )			

    		for recordVisIdx, recordIdx in ipairs( selRecordsArr ) do
        		local data = self.itemsListWnd:GetRecordData( recordIdx )
        		table.insert( items, data.item )
    		end

		else

    		for recordIdx, dummy in pairs( selRecords ) do
        		local data = self.itemsListWnd:GetRecordData( recordIdx )
        		table.insert( items, data.item )
    		end

		end

    	
    elseif self.itemsMode == self.itemsModes.GRID then

		local selSlots = self.itemsListWnd:GetSelectedSlots()

		if bSorted then

			local selRecordsArr = {}

			for recordIdx, recordSlots in pairs( selSlots ) do
				table.insert( selRecordsArr, { recordIdx = recordIdx, slots = recordSlots } )
			end

			local function fnSort( record1, record2 )
				return record1.recordIdx < record2.recordIdx
			end

			table.sort( selRecordsArr, fnSort )

			for recordVisIdx, record in ipairs( selRecordsArr ) do

    			local rowData = self.itemsListWnd:GetRecordData( record.recordIdx )

				local slotsArr = {}

    			for slotIdx, dummy in pairs( record.slots ) do
    				table.insert( slotsArr, slotIdx )
    			end

				table.sort( slotsArr )

				for slotVisIdx, slotIdx in ipairs( slotsArr ) do
					table.insert( items, rowData.slots[ slotIdx ].item )
				end

			end

		else

    		for recordIdx, recordSlots in pairs( selSlots ) do

    			local rowData = self.itemsListWnd:GetRecordData( recordIdx )

    			for slotIdx, dummy in pairs( recordSlots ) do
    				table.insert( items, rowData.slots[ slotIdx ].item )
    			end

    		end

		end

	end

	return items

end


--
function UI.ShopWnd:GetSelItemsInfo()

	local itemsInfo = {}

	local selItems = self:GetSelItems()
	for itemIdx, item in pairs( selItems ) do

		local itemInfo =
		{
    		defName		= item.defName,
    		equipShipId	= nil,
			iid			= nil,
		}

    	if self.tradeMode == self.tradeModes.SELL then
    		itemInfo.equipShipId	= item.equipShipItem and item.equipShipItem.vid or UI.INVALID_U64_ID
    		itemInfo.iid			= item.iids and item.iids[ 1 ]
    	end

		table.insert( itemsInfo, itemInfo )

	end

	return itemsInfo

end


--
function UI.ShopWnd:FindItemRecordByStoreId( id )

	local recordIdx	= -1
	local slotIdx	= -1

	if self.tradeMode ~= self.tradeModes.BUY then
		return recordIdx, slotIdx
	end

	if not self.itemsListWnd then
		return recordIdx, slotIdx
	end

	if self.itemsMode == self.itemsModes.LIST then

    	for ridx = 1, self.itemsListWnd:GetNumRecords() do
    		local data = self.itemsListWnd:GetRecordData( ridx )

    		if data.item.id == id then
    			recordIdx = ridx
    			break
    		end
    	end

	elseif self.itemsMode == self.itemsModes.GRID then	

		local bFound = false

    	for ridx = 1, self.itemsListWnd:GetNumRecords() do
    		local recordData = self.itemsListWnd:GetRecordData( ridx )

			for sidx, slotData in pairs( recordData.slots ) do

        		if slotData.item.id == id then
        			recordIdx	= ridx
					slotIdx		= sidx
					bFound = true
        			break
        		end

			end

			if bFound then
				break
			end
		end
	end

	return recordIdx, slotIdx

end


--
function UI.ShopWnd:FindItemRecordByItemInfo( itemInfo )

	local recordIdx	= -1
	local slotIdx	= -1

	if not self.itemsListWnd then
		return recordIdx, slotIdx
	end

	if self.itemsMode == self.itemsModes.LIST then

    	for ridx = 1, self.itemsListWnd:GetNumRecords() do
    		local data = self.itemsListWnd:GetRecordData( ridx )

    		if self:IsItemFitForItemInfo( data.item, itemInfo ) then
    			recordIdx = ridx
    			break
    		end
    	end

	elseif self.itemsMode == self.itemsModes.GRID then	

		local bFound = false

    	for ridx = 1, self.itemsListWnd:GetNumRecords() do
    		local recordData = self.itemsListWnd:GetRecordData( ridx )

			for sidx, slotData in pairs( recordData.slots ) do

        		if self:IsItemFitForItemInfo( slotData.item, itemInfo ) then
        			recordIdx	= ridx
					slotIdx		= sidx
					bFound = true
        			break
        		end

			end

			if bFound then
				break
			end
		end
	end

	return recordIdx, slotIdx

end


--
function UI.ShopWnd:IsItemFitForItemInfo( item, itemInfo )

	local bFit = false

	if self.tradeMode == self.tradeModes.BUY then

		bFit = item.defName == itemInfo.defName

	elseif self.tradeMode == self.tradeModes.SELL then

		if item.defName == itemInfo.defName then

			if itemInfo.iid ~= nil then

				for idx, iid in pairs( item.iids ) do
					if iid == itemInfo.iid then
						bFit = true
						break
					end
				end

			elseif itemInfo.equipShipId ~= nil then

				local shipId = item.equipShipItem and item.equipShipItem.vid or UI.INVALID_U64_ID
				if shipId == itemInfo.equipShipId then
					bFit = true
				end

			else
				bFit = true
			end

		end

	end

	return bFit

end


--
function UI.ShopWnd:ValidateItemSelection()

	if not self.itemsListWnd then
		return
	end

	if self.itemsListWnd:GetNumRecords() == 0 then
		return
	end

	if self.itemsMode == self.itemsModes.LIST then
		self.itemsListWnd:SelectSingleRecord( 1 )

	elseif self.itemsMode == self.itemsModes.GRID then

		local data = self.itemsListWnd:GetRecordData( 1 )

		if #data.slots > 0 then
			self.itemsListWnd:SelectSingleSlot( 1, 1 )
		end

	end

end


--
function UI.ShopWnd:GetItemsFiltered()

	local items = {}

	local filterInfo = {}
	filterInfo.mainCategory	= self.categoriesList:GetSelectedMainCategory()
	filterInfo.subCategory	= self.categoriesList:GetSelectedSubCategory()	
	filterInfo.filters		= self:GetFilters()

	-- do test

	local srcItems = {}

	if self.tradeMode == self.tradeModes.BUY then
		srcItems = UI.serverData.shopByDef

	elseif self.tradeMode == self.tradeModes.SELL then
		srcItems = UI.serverData.invItems
	end

	for key, item in pairs( srcItems ) do

		if self:TestItem( item, filterInfo ) then
			table.insert( items, item )
		end

	end

	self:SortItems( items )

	return items	

end


--
function UI.ShopWnd:GetFilters()

	local filters = {}

	if self.tradeMode == self.tradeModes.BUY then
		filters.bAvailableOnly		= false	-- #0034375 галка была убрана
		filters.bFitForSelShip		= UI.Shop_FilterCheckBox_FitForSelShip:IsChildOf( self ) and UI.Shop_FilterCheckBox_FitForSelShip:IsChecked()
		filters.bUnfitForShipsOnly	= false
		filters.bNotOnShips			= false

	elseif self.tradeMode == self.tradeModes.SELL then
		filters.bUnfitForShipsOnly	= UI.Shop_FilterCheckBox_UnfitForShips:IsChildOf( self ) and UI.Shop_FilterCheckBox_UnfitForShips:IsChecked()
		filters.bNotOnShips			= UI.Shop_FilterCheckBox_NotOnShips:IsChildOf( self ) and UI.Shop_FilterCheckBox_NotOnShips:IsChecked()
		filters.bAvailableOnly		= false
		filters.bFitForSelShip		= false
	end

	filters.rank = -1
	if UI.Shop_FilterComboBox_Rank:IsChildOf( self ) then
    	local selRankRecordIdx = UI.Shop_FilterComboBox_Rank:GetSelectedRecord()
    	if selRankRecordIdx ~= -1 then
    		local rankData = UI.Shop_FilterComboBox_Rank:GetRecordData( selRankRecordIdx )
    		filters.rank = rankData.rank
    	end
	end

	filters.quality = -1
	if UI.Shop_FilterComboBox_Quality:IsChildOf( self ) then
    	local selQualityRecordIdx = UI.Shop_FilterComboBox_Quality:GetSelectedRecord()
    	if selQualityRecordIdx ~= -1 then
    		local qualityData = UI.Shop_FilterComboBox_Quality:GetRecordData( selQualityRecordIdx )
    		filters.quality = qualityData.quality
    	end
	end

	return filters

end


--
function UI.ShopWnd:TestItem( item, filterInfo )

	local bAutogen = UI:IsDefAutogen( item.defName )

	local def = UI:GetDef( item.defName )

	if not def then
		sys.log( "UI.ShopWnd:TestItem()[ERROR]: cannot find def \"%s\"", item.defName )
		return false
	end

	-- товар не должен отображаться в магазине
	if self.tradeMode == self.tradeModes.BUY and not UI:IsItemVisibleForBuy( item, false ) then
        return false
	end

	local storeItemType = _G.GetStoreItemTypeByDef( item.defName )

	-- некоторые товары не могут быть куплены, но могут быть проданы
	if self.tradeMode == self.tradeModes.BUY and UI:CantItemBeBought( item ) then
		return false
	end

	-- аммуниция может быть куплена только в экране эквипмента, а здесь не может
	if storeItemType == _G.GameStore.ItemType.IT_ROCKET and self.tradeMode ~= self.tradeModes.SELL then
		return false
	end

	-- чертежи могут быть куплены только в экране крафта предметов, а здесь не могут
	if storeItemType == _G.GameStore.ItemType.IT_BLUEPRINT and self.tradeMode ~= self.tradeModes.SELL then
		return false
	end

	-- аммуницию, установленную на корабль, нельзя продавать
	if storeItemType == _G.GameStore.ItemType.IT_ROCKET and item.equipShipItem then
		return false
	end     


	-- категория	

	-- показываются только товары валидных категорий (для которых есть информация в _G.StoreInfo );

	local mainCategoryIdxInfo = def.shopCategory and _G.StoreInfo.categoryName2Idx[ def.shopCategory ]
	if not mainCategoryIdxInfo then
		return false
	end		

	local subCategoryIdx = def.shopSubCategory and mainCategoryIdxInfo.sub[ def.shopSubCategory ]

	-- не показываются те товары, для категории которых указан специальный флаг, запрещающий показ в магазине

	local mainCategoryInfo = _G.StoreInfo.categories[ mainCategoryIdxInfo.idx ]
	if mainCategoryInfo.shop == false then
		return false
	end

	if subCategoryIdx then
    	if mainCategoryInfo.subCategories[ subCategoryIdx ].shop == false then
    		return false
    	end
	end

	-- не показываются для покупки те товары, для категории которых указан специальный флаг только для продажи

	if self.tradeMode == self.tradeModes.BUY then

		if mainCategoryInfo.sellOnly == true then
			return false
		end

		if subCategoryIdx then
        	if mainCategoryInfo.subCategories[ subCategoryIdx ].sellOnly == true then
        		return false
        	end
		end

	end


	-- проверка соответсвия категории товара и выбранной категории

	if not( filterInfo.mainCategory == "" and filterInfo.subCategory == "" ) then

		if filterInfo.mainCategory == "sale" then

			if self.tradeMode ~= self.tradeModes.BUY or not UI:IsItemSale( item ) then
        		return false
			end

		else

        	if def.shopCategory ~= filterInfo.mainCategory then
        		return false
        	end
        	
        	if filterInfo.subCategory ~= "" and def.shopSubCategory ~= filterInfo.subCategory then
        		return false
        	end

		end

	end


	-- фильтры

	-- только доступные
	if filterInfo.filters.bAvailableOnly then

		if not self:IsItemAvailable( item ) then
			return false
		end

	end  


	-- только которые можно одеть на корабль в выбранном боевом слоте

	if filterInfo.filters.bFitForSelShip then

		local bFit = false

		if storeItemType == _G.GameStore.ItemType.IT_MODULE or storeItemType == _G.GameStore.ItemType.IT_ROCKET then
			if self.selShipItem and UI:IsItemFitForShip( item.defName, self.selShipItem ) then
    			bFit = true
    		end
		end

		if not bFit then
    		return false
		end

	end

	-- только которые нельзя одеть ни на один корабль игрока (одевать при этом можно только модули и ракеты);
	-- никогда не бывает одновременно с фильтром bFitForSelShip
	if filterInfo.filters.bUnfitForShipsOnly then

		if not( storeItemType == _G.GameStore.ItemType.IT_MODULE or storeItemType == _G.GameStore.ItemType.IT_ROCKET ) then
			return false
		end

		local bFitForShips = false
		for shipIdx, shipItem in pairs( UI.serverData.ships ) do
    		if UI:IsItemFitForShip( item.defName, shipItem ) then
				bFitForShips = true
				break
    		end
		end

		if bFitForShips then
			return false
		end

	end 

	-- только не установленные на корабль
	if filterInfo.filters.bNotOnShips then

		if item.equipShipItem then
			return false
		end

	end

	-- подходит ранг
	if filterInfo.filters.rank ~= -1 then

		local minRank = UI:GetItemEquipMinRank( item.defName )
		local maxRank = UI:GetItemEquipMaxRank( item.defName )

		-- #0055484,комм.(0227827) - если у вещи не прописан ранг, то она считается подходяшей под корабль любого ранга
		-- #0056733,комм.(0226608) - вещь с непрописанным рангом показывается при любом выбраном ранге, поскольку она подходит любому рангу
		-- Однако см. в #0082990,комм.(0377570) - переделали, что ранг всегда должен быть, так что ситуация невалидного ранга просто не должна возникнуть никогда

		if minRank ~= -1 and maxRank ~= -1 then
			if filterInfo.filters.rank < minRank or filterInfo.filters.rank > maxRank then
				return false
			end
		end
		
	end

	-- подходит качество
	if filterInfo.filters.quality ~= -1 then

		local itemQuality = UI:GetItemQuality( item.defName ) or -1
		if itemQuality ~= -1 and itemQuality ~= filterInfo.filters.quality then
			return false
		end

	end


	-- OK, тест пройден, предмет можно показывать в списке
	return true

end


--
function UI.ShopWnd:UpdateOnPlayerCreditsChanged()

	if self.tradeMode ~= self.tradeModes.BUY then
		return
	end

	if self.itemsListWnd then

		if self.itemsMode == self.itemsModes.LIST then

    		for slotIdx = 1, self.itemsListWnd:GetNumVisibleSlots() do

    			local slotWnd = self.itemsListWnd:GetButtonForSlot( slotIdx )
				if slotWnd then
        			slotWnd:OnPlayerCreditsChanged()
				end

    		end

		elseif self.itemsMode == self.itemsModes.GRID then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			if firstVisibleRecordIdx ~= -1 then
				for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

					local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
					local recordData = self.itemsListWnd:GetRecordData( recordIdx )

					for slotIdx, slotData in pairs( recordData.slots ) do
						local slotWnd = rowWnd:GetSlotWnd( slotIdx )
		        		slotWnd:OnPlayerCreditsChanged()							
					end
				end

			end
		end

	end

end


--
function UI.ShopWnd:OnAccountRankChanged()

	if self.tradeMode ~= self.tradeModes.BUY then
		return
	end

	if self.itemsListWnd then

		if self.itemsMode == self.itemsModes.LIST then

    		for slotIdx = 1, self.itemsListWnd:GetNumVisibleSlots() do

    			local slotWnd = self.itemsListWnd:GetButtonForSlot( slotIdx )
				if slotWnd then
        			slotWnd:OnAccountRankChanged()
				end

    		end

		elseif self.itemsMode == self.itemsModes.GRID then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			if firstVisibleRecordIdx ~= -1 then
				for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

					local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
					local recordData = self.itemsListWnd:GetRecordData( recordIdx )

					for slotIdx, slotData in pairs( recordData.slots ) do
						local slotWnd = rowWnd:GetSlotWnd( slotIdx )
		        		slotWnd:OnAccountRankChanged()							
					end
				end

			end
		end

	end

	self:UpdateTradeBtnState()

end


--
function UI.ShopWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgTimeOut then
		self.hMsgTimeOut = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgBuyError then
		self.hMsgBuyError = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgUneqipAmmo then
		self.hMsgUneqipAmmo = UI.INVALID_UI_HANDLE
		
	elseif boxHandle == self.hMsgAutogenDestroy then
	
		self.hMsgAutogenDestroy = UI.INVALID_UI_HANDLE
		
		if retCode == UI.MBRET_YES then
		
			if self.autogenIidToDestroy then
				self:DoDestroyAutogen( self.autogenIidToDestroy )
				self.autogenIidToDestroy = nil
			else
				sys.log( "UI.ShopWnd:F_OnEventMsgBoxRet no autogenIidToDestroy" )
			end
			
		end
		
	end

end


--
function UI.ShopWnd:ShowMessageOnTimeOut()

	if self.hMsgTimeOut ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgTimeOut = UI:ShowMessageOnTimeOut()

end


--
function UI.ShopWnd:IsItemAvailable( item )

	return self:GetItemUnavailableReason( item ) == self.itemUnavailableReasons.NONE

end


--
function UI.ShopWnd:GetItemUnavailableReason( item )

	if self.tradeMode == self.tradeModes.SELL then
		return self.itemUnavailableReasons.NONE
	end

	-- достаточный аккаунт-ранг
	if not UI:IsEnoughAccountRankForItem( item.defName ) then
		return self.itemUnavailableReasons.BUY_RANK
	end

	return self.itemUnavailableReasons.NONE

end


--
function UI.ShopWnd:CalcItemsCount()

	self:CalcInventoryItemsCount()
	self:CalcEquipmentItemsCount()

end


--
function UI.ShopWnd:CalcInventoryItemsCount()

	self.inventoryItemsCount = {}

	-- модули и аммуниция
	for defName, itemsByDef in pairs( UI.serverData.inventoryByDef ) do

    	local count = 0
    	for idx, item in pairs( itemsByDef ) do
		
			-- #0098460 - предметы, которые выставлены на продажу между игроками, не должны показываться больше нигде
			local bAdverted = UI:IsItemAdverted( item.iid )
			if not bAdverted then
				count = count + item.amount
			end
			
    	end

    	self.inventoryItemsCount[ defName ] = count

	end

	-- корабли
	for hangarSlotId, shipItem in pairs( UI.serverData.ships ) do

		local count = self.inventoryItemsCount[ shipItem.defName ] or 0
		count = count + 1
		self.inventoryItemsCount[ shipItem.defName ] = count
		
	end

end


--
function UI.ShopWnd:CalcEquipmentItemsCount()

	self.equipmentItemsCount = {}

	for idx, shipItem in pairs( UI.serverData.ships ) do

		-- модули
    	for slotId, iid in pairs( shipItem.equipModules ) do

			if iid ~= UI.INVALID_U64_ID then

    			local moduleItem = UI:GetInventoryItem( iid )

				-- мб это сид-чип?
				-- SC-116185. Добавил проверку на сид-чип, так как в shipItem.equipModules имеются iid сид-чипов.
				-- Иначе будем получать ошибку за каждый установленный сид-чип на корабле
				if not moduleItem then
					moduleItem = UI:GetAutogenInventoryItem( iid )
				end

    			local defName = moduleItem and moduleItem.defName

    			if defName then
        			local count = self.equipmentItemsCount[ defName ] or 0
        			count = count + 1

        			self.equipmentItemsCount[ defName ] = count
    			else
    				sys.log( "UI.ShopWnd:CalcEquipmentItemsCount()[ERROR]: cannot find def for iid %s", _G.U64ToStr( iid ) )
    			end

			end

    	end

		-- аммуниция
    	for slotId, ammo in pairs( shipItem.equipAmmo ) do

			local count = self.equipmentItemsCount[ ammo.def ] or 0
			count = count + ammo.amount

			self.equipmentItemsCount[ ammo.def ] = count

    	end

	end

end


--
function UI.ShopWnd:GetStoreItemCount( storeItem )

	local countInventory	= self.inventoryItemsCount[ storeItem.defName ] or 0
	local countEquipped		= self.equipmentItemsCount[ storeItem.defName ] or 0

	if UI:IsDefAmmo( storeItem.defName ) then
		return countInventory, countEquipped

	else
		return countInventory - countEquipped, countEquipped
	end

end


--
function UI.ShopWnd:F_OnEventInvItemsChanged()

	-- TODO: если это пришло во время, пока на экране окно мульти-продажи, то данные в нем делаются невалидными

	if not self:IsOnScreen() then
		return
	end

	self:CalcItemsCount()

	if self.tradeMode == self.tradeModes.BUY then
		self:UpdateSlotsOnCountChanged()

	elseif self.tradeMode == self.tradeModes.SELL then

		local selItemsInfo = self:GetSelItemsInfo()
		if #selItemsInfo > 1 then
			self:UpdateItems( selItemsInfo, false )
		else
			self:UpdateItems( nil, true )
		end

	end

	self:UpdateInventorySize()
	self:UpdateAutogenInventorySize()
	self:UpdateCraftBtn()

end


--
function UI.ShopWnd:UpdateSlotsOnCountChanged()

	if self.tradeMode ~= self.tradeModes.BUY then
		sys.log( "UI.ShopWnd:UpdateSlotsOnCountChanged()[ERROR]: wrong mode" )
		return
	end

	if self.itemsMode == self.itemsModes.LIST then
		
    	local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()
    	if firstVisibleRecordIdx ~= -1 then

    		for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

    			local slotWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
        		if slotWnd then
        			slotWnd:OnCountChanged()
        		end		

    		end
    	end

	elseif self.itemsMode == self.itemsModes.GRID then

		local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

		if firstVisibleRecordIdx ~= -1 then
			for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

				local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
				local recordData = self.itemsListWnd:GetRecordData( recordIdx )

				for slotIdx, slotData in pairs( recordData.slots ) do
					local slotWnd = rowWnd:GetSlotWnd( slotIdx )
	        		slotWnd:OnCountChanged()							
				end
			end

		end		

	end

end


--
function UI.ShopWnd:OnUp( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()
		if oldSelRecordIdx ~= -1 then

			local newSelRecordIdx = oldSelRecordIdx - 1
			if newSelRecordIdx >= 1 then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

    		local newSelRecordIdx = oldSelRecordIdx - 1
    		if newSelRecordIdx >= 1 then

    			local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

    			self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
    			UI:PlayGlobalSound( self.sounds.itemSelect )

    		end

		end

	end

	return true

end


--
function UI.ShopWnd:OnDown( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()
		if oldSelRecordIdx ~= -1 then

			local newSelRecordIdx = oldSelRecordIdx + 1
			if newSelRecordIdx <= self.itemsListWnd:GetNumRecords() then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

			local newSelRecordIdx = oldSelRecordIdx + 1
			if newSelRecordIdx <= self.itemsListWnd:GetNumRecords() then

				local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

				self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	end

	return true

end


--
function UI.ShopWnd:OnLeft( key, controllerIdx )

	if self.itemsMode ~= self.itemsModes.GRID then
		return false
	end

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	local selRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
	if selRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

    	local newSelSlotIdx = oldSelSlotIdx - 1
    	if newSelSlotIdx >= 1 then

    		self.itemsListWnd:SelectSingleSlot( selRecordIdx, newSelSlotIdx )
    		UI:PlayGlobalSound( self.sounds.itemSelect )

    	end

	end

	return true

end   


--
function UI.ShopWnd:OnRight( key, controllerIdx )

	if self.itemsMode ~= self.itemsModes.GRID then
		return false
	end

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	local selRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
	if selRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

    	local newSelSlotIdx = oldSelSlotIdx + 1
    	if newSelSlotIdx <= self.itemsListWnd:GetNumSlotsForRecord( selRecordIdx ) then

    		self.itemsListWnd:SelectSingleSlot( selRecordIdx, newSelSlotIdx )
    		UI:PlayGlobalSound( self.sounds.itemSelect )

    	end

	end

	return true

end   


--
function UI.ShopWnd:OnHome( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()		
		if oldSelRecordIdx ~= -1 then

			local newSelRecordIdx = 1
			if newSelRecordIdx ~= oldSelRecordIdx then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

			local newSelRecordIdx = 1
			if newSelRecordIdx ~= oldSelRecordIdx then

				local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

				self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	end

	return true

end


--
function UI.ShopWnd:OnEnd( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()		
		if oldSelRecordIdx ~= -1 then

			local newSelRecordIdx = self.itemsListWnd:GetNumRecords()
			if newSelRecordIdx ~= oldSelRecordIdx then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

			local newSelRecordIdx = self.itemsListWnd:GetNumRecords()
			if newSelRecordIdx ~= oldSelRecordIdx then

				local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

				self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	end

	return true

end


--
function UI.ShopWnd:OnPageUp( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()		
		if oldSelRecordIdx ~= -1 then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			local newSelRecordIdx = firstVisibleRecordIdx
			if newSelRecordIdx ~= oldSelRecordIdx then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			local newSelRecordIdx = firstVisibleRecordIdx
			if newSelRecordIdx ~= oldSelRecordIdx then

				local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

				self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	end

	return true

end


--
function UI.ShopWnd:OnPageDown( key, controllerIdx )

	if not self.itemsListWnd then
		return false
	end

	if self:IsInputBlocked() then
		return true
	end

	if self.itemsMode == self.itemsModes.LIST then

		local oldSelRecordIdx = self.itemsListWnd:GetSingleSelectedRecord()		
		if oldSelRecordIdx ~= -1 then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			local newSelRecordIdx = lastVisibleRecordIdx
			if newSelRecordIdx ~= oldSelRecordIdx then

				self.itemsListWnd:SelectSingleRecord( newSelRecordIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	elseif self.itemsMode == self.itemsModes.GRID then

		local oldSelRecordIdx, oldSelSlotIdx = self.itemsListWnd:GetSingleSelectedSlot()
		if oldSelRecordIdx ~= -1 and oldSelSlotIdx ~= -1 then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			local newSelRecordIdx = lastVisibleRecordIdx
			if newSelRecordIdx ~= oldSelRecordIdx then

				local newSelSlotIdx = math.min( oldSelSlotIdx, self.itemsListWnd:GetNumSlotsForRecord( newSelRecordIdx ) )

				self.itemsListWnd:SelectSingleSlot( newSelRecordIdx, newSelSlotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )

			end

		end

	end

	return true

end


--
function UI.ShopWnd:UpdateTradeBtnState()

	self:AddControl( UI.Shop_TradeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.tradeBtnLocator )

	local bGray = false

	local selItems = self:GetSelItems()
	if next( selItems ) then

		if self.tradeMode == self.tradeModes.BUY then

			if #selItems == 1 then

				local selItem = selItems[ 1 ]

        		local itemRank = UI:GetItemRequiredAccountRank( selItem.defName )
        		if itemRank ~= -1 then

        			local playerRank = UI:GetPlayerAccountRank()

    				if playerRank < itemRank then
    					bGray = true
    				end

        		end

			else
				sys.log( "UI.ShopWnd:UpdateTradeBtnState()[ERROR]: multiselection in BUY mode is not supported" )
				bGray = true
			end

		end

	else
		bGray = true
	end

	if bGray then
		UI.Shop_TradeBtn:AddStyle( UI.WS_GRAYED )
	else
		UI.Shop_TradeBtn:RemoveStyle( UI.WS_GRAYED )
	end		

end


--
function UI.ShopWnd:UpdateTradeBtnText()

	local strId = ""

	if self.tradeMode == self.tradeModes.BUY then
		strId = "shop_buy"

	elseif self.tradeMode == self.tradeModes.SELL then
		strId = "shop_sell"
	end

	local text = strId ~= "" and UI:GetStringByName( strId ) or ""
	UI.Shop_TradeBtn:SetBtnText( text )

end


--
function UI.ShopWnd:UpdateSalvageBtn()

	local bCanSalvage = false

	if self.tradeMode == self.tradeModes.SELL then

		local selItems = self:GetSelItems()

		if #selItems == 1 then

			local selItem = selItems[ 1 ]

    		if UI:CanItemBeSalvaged( selItem.defName ) or UI:CanItemBeSalvaged2( selItem.defName ) then
    			bCanSalvage = true
    		end

		end

	end

	if bCanSalvage then
    	self:AddControl( UI.Shop_SalvageBtn, self.layers.WORK_EFFECT, self.effectInfo.work.salvageBtnLocator )
	else
    	self:RemoveControl( UI.Shop_SalvageBtn, self.layers.WORK_EFFECT )
	end

end


--
function UI.ShopWnd:UpdateCraftBtn()

	local resourceDefName = ""

	if self.tradeMode == self.tradeModes.SELL then

		local selItem = self:GetSelItems()[ 1 ]

		-- в окне магазина крафитить можно только из ресурса, из чертежа не нужно - #0042610, комм.(0158091)
		if selItem and UI:IsDefResource( selItem.defName ) and UI:CanResourceBeUsed( selItem.defName ) then
			resourceDefName = selItem.defName
		end

	end

	if resourceDefName ~= "" then	

    	self:AddControl( UI.Shop_CraftBtn, self.layers.WORK_EFFECT, self.effectInfo.work.craftBtnLocator )
		local bEnoughIngredients = UI:IsEnoughIngredientsForCraftFromResource( resourceDefName, 1 )
		UI.Shop_CraftBtn:Enable( bEnoughIngredients )

	else
    	self:RemoveControl( UI.Shop_CraftBtn, self.layers.WORK_EFFECT )
	end

end


--
function UI.ShopWnd:TryBuySelItem()

	if self.tradeMode ~= self.tradeModes.BUY then
		sys.log( "UI.ShopWnd:TryBuySelItem()[ERROR]: wrong trade mode" )
		return
	end

	local storeItem = self:GetSelItems()[ 1 ]
	self:TryBuyItem( storeItem )

end


--
function UI.ShopWnd:TryBuyItem( storeItem )

	if not storeItem then
		UI:PlayGlobalSound( self.sounds.cannotTrade )
		return
	end

	local unavailableReason = self:GetItemUnavailableReason( storeItem )
	if unavailableReason ~= self.itemUnavailableReasons.NONE then
		self:ShowCannotBuyMsg( unavailableReason, storeItem )
		return
	end

	if UI:IsEnoughPlaceInInventoryForItem( storeItem.defName ) then

		self:LaunchBuyTradeWnd( storeItem )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy = storeItem
			self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.INVENTORY_AUTO )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.ShopWnd:ShowCannotBuyMsg( reason, storeItem )

	local msg = ""

	sys.log( "UI.ShopWnd:ShowCannotBuyMsg()[ERROR]: unhandled item unavailable reason: %s", tostring( reason ) )

	if msg ~= "" then
		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotBuy" ), msg, UI.MBS_OK )
	end

end  


--
function UI.ShopWnd:TrySellSelItems()

	if self.tradeMode ~= self.tradeModes.SELL then
		sys.log( "UI.ShopWnd:TrySellSelItems()[ERROR]: wrong trade mode" )
		return
	end

	local selItems = self:GetSelItems( true )

	if not next( selItems ) then
		sys.log( "UI.ShopWnd:TrySellSelItems()[ERROR]: no selected items" )
		return
	end

	if self:IsWaitingRequests() then
		UI:PlayGlobalSound( self.sounds.cannotTrade )
		return
	end

	if #selItems == 1 then

    	local invItem = selItems[ 1 ]

    	if self:IsItemInBattle( invItem ) then
    		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotSell" ), UI:GetStringByName( "msg_cannotSellInBattle" ), UI.MBS_OK )
    		return		
    	end

    	if self:IsItemOnShipQuest( invItem ) then
    		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotSell" ), UI:GetStringByName( "msg_cannotSellOnQuest" ), UI.MBS_OK )
    		return		
    	end
		
		-- SC-112173 установленный автоген нельзя продать, вместо продажи показываем для него окно уничтожения
		if UI:IsDefAutogen( invItem.defName ) and UI:GetEquippedShipItem( invItem.iids[ 1 ] ) then
			UI.AutogenUnequipWnd:Setup( { { iid = invItem.iids[ 1 ], actions = UI.AutogenUnequipWnd.actions.DESTROY --[[DISMANTLE нет, т.к. бессмыссленно демонтировать за золото и потом продать за копейку]] } }, UI.AutogenUnequipWnd.cancelModes.BREAK, self:GetName(), {} )
			UI.AutogenUnequipWnd:Show()
		else
			self:LaunchSellTradeWnd( invItem )
		end

	else
		self:TryMultiSellItems( selItems, false )
	end

end


--
function UI.ShopWnd:TryMultiSellItems( items, bSellAll )

	if not next( items ) then
		sys.log( "UI.ShopWnd:TryMultiSellItems(): no items specified" )
		return
	end

	local sellData = self:MakeMultiSellData( items, bSellAll )

	if sellData.bHasInvalidItems then
		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotSell" ), UI:GetStringByName( "multiSell_msg_invalidItems" ), UI.MBS_OK )
		return
	end

	if not next( sellData.iids ) and not next( sellData.resources ) and not next( sellData.equippedAutogenIids ) then
		sys.log( "UI.ShopWnd:TryMultiSellItems()[ERROR]: no items" )
		return
	end
	
	-- SC-112173 для экипированного автогена вместо продажи показывается специальное окно снятия автогена
	if next( sellData.equippedAutogenIids ) then
	
		local autogenItems = {}
		for itemIdx, iid in ipairs( sellData.equippedAutogenIids ) do
			table.insert( autogenItems, { iid = iid, actions = UI.AutogenUnequipWnd.actions.DESTROY --[[DISMANTLE нет, т.к. бессмыссленно демонтировать за золото и потом продать за копейку]] } )
		end
		
		local customData = {}
		if next( sellData.iids ) or next( sellData.resources ) then
			customData = { fnName = "LaunchBuyWnd", params = { UI.BuyWnd.modes.SELL_ITEMS, sellData } }
		end
	
		UI.AutogenUnequipWnd:Setup( autogenItems, UI.AutogenUnequipWnd.cancelModes.CONTINUE--[[можно снять выборочно]], self:GetName(), customData )
		UI.AutogenUnequipWnd:Show()
		
	else
		self:LaunchBuyWnd( UI.BuyWnd.modes.SELL_ITEMS, sellData )
	end

end


--
function UI.ShopWnd:MakeMultiSellData( selItems, bSellAll )

	local sellData =
	{
		bHasInvalidItems		= false,
		iids					= {},	-- не включает экипированный автоген; он в поле equippedAutogenIids
		equippedAutogenIids		= {},
		bHasUnequppedAmmo		= false,
		unequippedAmmoSold		= {},
		numUnequippedShips		= 0,
		resources				= {},
		bSellAll				= bSellAll,
	}

	local bAllowEquipped		= not bSellAll
	local numIids				= 0
	local numResources			= 0
	local ammoItemsSold			= {}
	local unequippedAmmo		= {}
	local unequippedShips		= {}

	for invItemIdx, invItem in ipairs( selItems ) do

		if invItem.itemType == UI.invItemTypes.MODULE or invItem.itemType == UI.invItemTypes.AMMO then

			local bInvalidItem = false

			if invItem.equipShipItem ~= nil and bAllowEquipped then
				bInvalidItem = self:IsItemInBattle( invItem ) or self:IsItemOnShipQuest( invItem )
			end

			if bInvalidItem then
				sellData.bHasInvalidItems = true
			end
			
			if not( invItem.equipShipItem ~= nil and not bAllowEquipped ) and not bInvalidItem then

				-- всё, кроме экипированного автогена (его нельзя продавать, для него вместо продажи показывается отдельное окно уничтожения)
				if not( UI:IsDefAutogen( invItem.defName ) and invItem.equipShipItem ~= nil ) then
				
					if numIids < self.MAX_ITEMS_FOR_SELL then

						if next( invItem.iids ) then

							for iidIdx, iid in ipairs( invItem.iids ) do

								table.insert( sellData.iids, iid )
								numIids = numIids + 1

								if numIids >= self.MAX_ITEMS_FOR_SELL then
									break
								end

							end

							if invItem.itemType == UI.invItemTypes.MODULE then

								if invItem.equipShipItem then
									unequippedShips[ invItem.equipShipItem.defName ] = true
								end

								if UI:GetModuleType( invItem.defName ) == ai.ModuleType.WEAPON and invItem.equipShipItem then

									local shipAmmo = invItem.equipShipItem.equipAmmo[ ai.MunitionBayType.MBT_PRIMARY ]
									if shipAmmo and shipAmmo.def ~= "" and shipAmmo.amount > 0 then

										if not unequippedAmmo[ shipAmmo.def ] then
											unequippedAmmo[ shipAmmo.def ] = 0
										end

										unequippedAmmo[ shipAmmo.def ] = unequippedAmmo[ shipAmmo.def ] + shipAmmo.amount
										
									end

								end

							elseif invItem.itemType == UI.invItemTypes.AMMO then

								ammoItemsSold[ invItem.defName ] = true

							end

						else
							-- торетически могут быть invItem для AMMO, где нет iid - для установленной аммуниции, но сейчас они в окне магазина не показываются
							sys.log( "UI.ShopWnd:MakeMultiSellData()[ERROR]: no iids" )
						end
						
					end

				-- экипированный автоген (его нельзя продавать, для него вместо продажи показывается отдельное окно уничтожения)
				else
					table.insert( sellData.equippedAutogenIids, invItem.iids[ 1 ] )
				end
			
			end

		elseif invItem.itemType == UI.invItemTypes.RESOURCE or invItem.itemType == UI.invItemTypes.BLUEPRINT then

			if numResources < self.MAX_RESOURCES_FOR_SELL then

				table.insert( sellData.resources, invItem.defName )
				numResources = numResources + 1					

			end

		else
			sys.log( "UI.ShopWnd:MakeMultiSellData()[ERROR]: unhandled invItem type %d (%s)", invItem.itemType, UI:Val2Key( UI.invItemTypes, invItem.itemType ) )
		end			

		if numIids >= self.MAX_ITEMS_FOR_SELL and numResources >= self.MAX_RESOURCES_FOR_SELL then
			break
		end

	end

	-- если аммуниция снимается с корабля из-за того, что связанная с ней пушка продается,
	-- и одновременнно в этой же выборке продается слот с самой этой аммуницией в инвентаре,
	-- то снятая аммуниция также продается (автоматически)
	-- см. #0059931, комм.(0245055)

	for defName, count in pairs( unequippedAmmo ) do

		if ammoItemsSold[ defName ] then
			sellData.unequippedAmmoSold[ defName ] = count
		end

	end

	sellData.bHasUnequppedAmmo	= next( unequippedAmmo ) ~= nil
	sellData.numUnequippedShips	= UI:GetTableLength( unequippedShips )

	return sellData

end


--
function UI.ShopWnd:TrySalvageSelItem()

	if self.tradeMode ~= self.tradeModes.SELL then
		sys.log( "UI.ShopWnd:TrySalvageSelItem()[ERROR]: wrong trade mode" )
		return
	end

	local invItem = self:GetSelItems()[ 1 ]
	if not invItem then
		sys.log( "UI.ShopWnd:TrySalvageSelItem()[ERROR]: no selected item" )
		return
	end

	local bCanSalvage	= UI:CanItemBeSalvaged( invItem.defName )
	local bCanSalvage2	= UI:CanItemBeSalvaged2( invItem.defName )

	if not bCanSalvage and not bCanSalvage2 then
		sys.log( "UI.ShopWnd:TrySalvageSelItem()[ERROR]: cannot be salvaged" )
		return
	end

	if self:IsWaitingRequests() then
		UI:PlayGlobalSound( self.sounds.cannotTrade )
		return
	end

	if self:IsItemInBattle( invItem ) then
		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotSell" ), UI:GetStringByName( "msg_cannotSalvageInBattle" ), UI.MBS_OK )
		return		
	end

	if self:IsItemOnShipQuest( invItem ) then
		UI:MessageBox( UI:GetStringByName( "msgCapt_cannotSell" ), UI:GetStringByName( "msg_cannotSalvageOnQuest" ), UI.MBS_OK )
		return		
	end

	local idx, iid = next( invItem.iids )

	if bCanSalvage then
		self:LaunchSalvageWnd( iid )

	elseif bCanSalvage2 then
		self:LaunchSalvage2Wnd( iid )
	end 

end


--
function UI.ShopWnd:DoSalvageItem2( iid )

	self.salvage2RequestId = _G.MasterServer_DisassembleItem( iid, 1 )
	if self.salvage2RequestId ~= 0 then

		UI:AddWaitingRequest( self.salvage2RequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
		UI:AddWaitingRequest( UI.RESOURCES_REQUEST_ID )

		local bEquipped = UI:GetEquippedShipItem( iid ) ~= nil
		if bEquipped then
			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )
		end

		UI:PlayGlobalSound( self.sounds.salvage )

	else
		UI:ShowMsgOnSalvage2Error( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShopWnd:TryCraftFromSelItem()

	if self.tradeMode ~= self.tradeModes.SELL then
		sys.log( "UI.ShopWnd:TryCraftFromSelItem()[ERROR]: wrong trade mode" )
		return
	end

	local invItem = self:GetSelItems()[ 1 ]
	if not invItem then
		sys.log( "UI.ShopWnd:TryCraftFromSelItem()[ERROR]: no selected item" )
		return
	end

	self:TryCraftFromRersource( invItem.defName )

end


--
function UI.ShopWnd:TryCraftFromRersource( defName )

	-- в окне магазина крафитить можно только из ресурса, из чертежа не нужно - #0042610, комм.(0158091)
	if not UI:IsDefResource( defName ) or not UI:CanResourceBeUsed( defName ) then
		sys.log( "UI.ShopWnd:TryCraftFromSelItem()[ERROR]: cannot craft from \"%s\"", defName )
		return
	end

	if self:IsWaitingRequests() then
		UI:PlayGlobalSound( self.sounds.cannotTrade )
		return
	end

	local craftResultDefName, count = UI:GetResourceCraftResult( defName )

	if UI:IsEnoughPlaceInInventoryForItem( craftResultDefName ) then

    	self:DoCraftFromResource( defName )

	else

		if UI:CanIncreaseInventory() then
			self.resourceToCraftFrom = defName
			self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.INVENTORY_AUTO )
		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end   


--
function UI.ShopWnd:DoCraftFromResource( defName )

	local craftRequestId = _G.MasterServer_UseCraftResource( defName )

	if craftRequestId ~= 0 then

		UI:AddWaitingRequest( craftRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )

		UI:PlayGlobalSound( self.sounds.craft )			

	else
		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShopWnd:UpdateWaitEffect()

	self:HideWaitEffect()

	if self.tradeMode == self.tradeModes.SELL then

		if self:IsWaitingRequests() then
			self:ShowWaitEffect()
		end

	end

end


--
function UI.ShopWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.ShopWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.ShopWnd:F_OnEventStartWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	if self.tradeMode == self.tradeModes.SELL then
		self:UpdateWaitEffect()
	end

end


--
function UI.ShopWnd:F_OnEventStopWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	if self.tradeMode == self.tradeModes.SELL then
    	self:UpdateWaitEffect()
	end

end


--
function UI.ShopWnd:HideNoItemsText()

	self:SetLayerVisible( false, self.layers.NO_ITEMS_TEXT )

end


--
function UI.ShopWnd:ShowNoItemsText()

	self:SetLayerVisible( true, self.layers.NO_ITEMS_TEXT )

end


--
function UI.ShopWnd:UpdateNoItemsText() 

	if not self.itemsListWnd or self.itemsListWnd:GetNumRecords() == 0 then
		self:ShowNoItemsText()
	else
		self:HideNoItemsText()
	end

end


--
function UI.ShopWnd:UpdateInBattleState()

	if self.tradeMode ~= self.tradeModes.SELL then
		return
	end

	if self.itemsListWnd then

		if self.itemsMode == self.itemsModes.LIST then

    		for slotIdx = 1, self.itemsListWnd:GetNumVisibleSlots() do

    			local slotWnd = self.itemsListWnd:GetButtonForSlot( slotIdx )
				if slotWnd then
	    			slotWnd:OnInBattleStateChanged()
				end

    		end

		elseif self.itemsMode == self.itemsModes.GRID then

			local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()

			if firstVisibleRecordIdx ~= -1 then
				for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

					local rowWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )
					local recordData = self.itemsListWnd:GetRecordData( recordIdx )

					for slotIdx, slotData in pairs( recordData.slots ) do
						local slotWnd = rowWnd:GetSlotWnd( slotIdx )
		        		slotWnd:OnInBattleStateChanged()
					end
				end

			end
		end

	end
	
end


--
function UI.ShopWnd:IsItemInBattle( invItem )

	local bInBattle = false

	if invItem.equipShipItem then
		bInBattle = UI:IsShipInBattle( invItem.equipShipItem )
	end		

	return bInBattle

end


--
function UI.ShopWnd:IsItemOnShipQuest( invItem )

	return self:GetItemShipQuest( invItem ) ~= -1

end  


--
function UI.ShopWnd:GetItemShipQuest( invItem )

	local questId = -1

	if invItem.equipShipItem then
		questId = UI:GetShipQuestForShip( invItem.equipShipItem )
	end		

	return questId

end


--
function UI.ShopWnd:LaunchBuyTradeWnd( shopItem )

	UI.Shop_TradeWnd:SetupForBuy( shopItem, nil, nil )
	UI.Shop_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShopWnd:LaunchSellTradeWnd( invItem )

	UI.Shop_TradeWnd:SetupForSell( invItem )
	UI.Shop_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShopWnd:LaunchBuyWnd( mode, data )

	UI.Shop_BuyWnd:Setup( mode, nil, data )
	UI.Shop_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShopWnd:LaunchSalvageWnd( iid )

	UI.Shop_SalvageWnd:Setup( iid )
	UI.Shop_SalvageWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShopWnd:LaunchSalvage2Wnd( iid )

	local data =
	{
		price	= 0,
		bGold	= false,
		iid		= iid,
	}

	self:LaunchBuyWnd( UI.BuyWnd.modes.SALVAGE, data )

end


--
function UI.ShopWnd:LaunchCraftBuyWnd( defName )

	-- TODO: сделать окнго подтверждения крафта
--[[
	UI.Shop_CraftBuyWnd:Setup( defName )
	UI.Shop_CraftBuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )
]]

end


--
function UI.ShopWnd:LaunchBuyWithInventoryWnd( shopItem, inventoryLevels )

	UI.Shop_BuyWithInventoryWnd:Setup( shopItem, inventoryLevels, nil )	
	UI.Shop_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShopWnd:ShowBuyErrorMsg( result )

	-- #0056553, комм.(0228526)
	if result == _G.GameStore.StoreBuyResult.SBR_NO_DISCOUNT then
		return
	end

	local msg = UI:GetStringByName( "msg_buyError" )

	local resultName = UI:Val2Key( _G.GameStore.StoreBuyResult, result )
	local resultStr = UI:GetStringByName( string.format( "buyError_%s", resultName ) )
	
	msg = string.format( msg, resultStr )
	self.hMsgBuyError = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end


--
function UI.ShopWnd:BuyInventory( inventoryLevels )

	if not inventoryLevels or not next( inventoryLevels ) then
		self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension()
	else
		local maxLevel = inventoryLevels[ #inventoryLevels ]
		self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension( maxLevel )
	end

	if self.requestId_buyInventory ~= 0 then
		UI:AddWaitingRequest( self.requestId_buyInventory )
	else
		self.itemToBuy = nil
		self.resourceToCraftFrom = nil
		self:ShowBuyErrorMsg( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShopWnd:BuyAutogenInventory( autogenInventoryLevels )

	if not autogenInventoryLevels or not next( autogenInventoryLevels ) then
		self.requestId_buyAutogenInventory = _G.GameStore_BuyAutogenInventoryExtension()
		sys.log( "UI.ShopWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", _G.GameStore_GetAutogenInventoryExtensionLevel() + 1 )
	else
		local maxLevel = autogenInventoryLevels[ #autogenInventoryLevels ]
		self.requestId_buyAutogenInventory = _G.GameStore_BuyAutogenInventoryExtension( maxLevel )
		sys.log( "UI.ShopWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", maxLevel )
	end

	if self.requestId_buyAutogenInventory ~= 0 then
		UI:AddWaitingRequest( self.requestId_buyAutogenInventory )
	else
		self.itemToBuy = nil
		self.resourceToCraftFrom = nil
		self:ShowBuyErrorMsg( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShopWnd:SetSortMode( sortMode )

	if sortMode == self.sortMode then
		return
	end

	self.sortMode = sortMode

	local selItemsInfo = self:GetSelItemsInfo()
	local items = self:CollectItems()

	-- если товары были уже отфильтрованы, то повторно при смене режима просмотра эта операция не делается
	if items then

		self:SortItems( items )
		self:FillItemsList( items, selItemsInfo, false )

	else
		self:UpdateItems( selItemsInfo, false )
	end

	self:UpdateSortModeBtns()

end


--
function UI.ShopWnd:SortItems( items )

	if self.tradeMode == self.tradeModes.BUY then
		UI:SortShop( items, self.sortMode == self.sortModes.DESC, false )

	elseif self.tradeMode == self.tradeModes.SELL then
		UI:SortInvItems( items, self.sortMode == self.sortModes.DESC, false )
	end

end


--
function UI.ShopWnd:UpdateSortModeBtns()	

	UI.Shop_SortBtn_Asc:Check( false )
	UI.Shop_SortBtn_Desc:Check( false )	

	if self.sortMode == self.sortModes.ASC then
		UI.Shop_SortBtn_Asc:Check( true )

	elseif self.sortMode == self.sortModes.DESC then
		UI.Shop_SortBtn_Desc:Check( true )	

	elseif self.sortMode ~= -1 then
		sys.log( "UI.ShopWnd:UpdateSortModeBtns()[ERROR]: unhanlded sort mode: %s", tostring( self.sortMode ) )
	end

end


--
function UI.ShopWnd:CollectItems()

	local items = nil

	if self.itemsListWnd then

		items = {}

		for recordIdx = 1, self.itemsListWnd:GetNumRecords() do
			local data = self.itemsListWnd:GetRecordData( recordIdx )

			if data.slots then
				for slotIdx = 1, #data.slots do
					table.insert( items, data.slots[ slotIdx ].item )
				end
			else
				table.insert( items, data.item )
			end
		end

	end

	return items

end  


--
function UI.ShopWnd:CheckShowMsgOnUnequipPrimaryAmmo( shipItem, dstWeaponClass )

	local bHasPrimaryAmmo = false

	local primaryAmmoInfo = shipItem.equipAmmo[ ai.MunitionBayType.MBT_PRIMARY ]
	if primaryAmmoInfo and primaryAmmoInfo.def ~= "" and primaryAmmoInfo.amount > 0 then
		bHasPrimaryAmmo = true
	end

	if not bHasPrimaryAmmo then
		return
	end

	local ammoWeaponClass = UI:GetWeaponClass( primaryAmmoInfo.def )
	if ammoWeaponClass == dstWeaponClass then
		return
	end

	self:ShowMsgOnUnequipPrimaryAmmo()

end  


--
function UI.ShopWnd:ShowMsgOnUnequipPrimaryAmmo()

   	if self.hMsgUneqipAmmo == UI.INVALID_UI_HANDLE then
   		self.hMsgUneqipAmmo = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_unfitModsDrop" ), UI.MBS_OK )
   	end

end


--
function UI.ShopWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.Shop_FilterComboBox_Rank:GetUiHandle() or hSender == UI.Shop_FilterComboBox_Quality:GetUiHandle() then
		self:OnFiltersChanged()
	end

end     


--
function UI.ShopWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	UI.store.ShopWnd =
	{
		salvage2RequestId		= self.salvage2RequestId,
		autogenDestroyRequestId	= self.autogenDestroyRequestId,
	}

end


--
function UI.ShopWnd:F_OnEventRestoreUiState()

	if UI.store.ShopWnd then

		self.salvage2RequestId			= UI.store.ShopWnd.salvage2RequestId
		self.autogenDestroyRequestId	= UI.store.ShopWnd.autogenDestroyRequestId

		self:UpdateWaitEffect()

		UI.store.ShopWnd = nil

	end

end


--
function UI.ShopWnd:UpdateInventorySize()

	self:ResetInventorySize()

	local curSize	= UI:GetInventoryCurSize()
	local maxSize	= UI:GetInventoryMaxSizeForCurLevel()
	local str = string.format( "%s: %s/%s", UI:GetStringByName( "equipment_inventorySize" ), UI:Num2StrSeparatedBy3( curSize ), UI:Num2StrSeparatedBy3( maxSize ) )

	if UI:CanIncreaseInventory() then

		self:SetText( str, self.layers.INVENTOTY_SIZE_VAL )

        self:AddControl( UI.Shop_InventorySizeBtn, self.layers.INVENTOTY_SIZE_EFFECT, self.effectInfo.inventorySize.btnLocator )

	else
		self:SetText( str, self.layers.INVENTOTY_SIZE_VAL_FULL )
	end

end


--
function UI.ShopWnd:UpdateAutogenInventorySize()

	self:ResetAutogenInventorySize()

	local curSize	= UI:GetAutogenInventoryCurSize()
	local maxSize	= UI:GetAutogenInventoryMaxSizeForCurLevel()
	local str = string.format( "%s: %s/%s", UI:GetStringByName( "equipment_autogenIventorySize" ), UI:Num2StrSeparatedBy3( curSize ), UI:Num2StrSeparatedBy3( maxSize ) )

	if UI:CanIncreaseAutogenInventory() then

		self:SetText( str, self.layers.AUTOGEN_INVENTOTY_SIZE_VAL )

        self:AddControl( UI.Shop_AutogenInventorySizeBtn, self.layers.AUTOGEN_INVENTOTY_SIZE_EFFECT, self.effectInfo.inventorySize.btnLocator )

	else
		self:SetText( str, self.layers.AUTOGEN_INVENTOTY_SIZE_VAL_FULL )
	end

end


--
function UI.ShopWnd:ResetInventorySize()

	self:SetText( "", self.layers.INVENTOTY_SIZE_VAL )
	self:SetText( "", self.layers.INVENTOTY_SIZE_VAL_FULL )
	
	self:RemoveControl( UI.Shop_InventorySizeBtn, self.layers.INVENTOTY_SIZE_EFFECT )
	
end    


--
function UI.ShopWnd:ResetAutogenInventorySize()
	
	self:SetText( "", self.layers.AUTOGEN_INVENTOTY_SIZE_VAL )
	self:SetText( "", self.layers.AUTOGEN_INVENTOTY_SIZE_VAL_FULL )
	
	self:RemoveControl( UI.Shop_AutogenInventorySizeBtn, self.layers.AUTOGEN_INVENTOTY_SIZE_EFFECT )
	
end    


--
function UI.ShopWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ShopWnd:RemoveControl( wnd, effectLayer )

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
function UI.ShopWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Shop_UpgradeItemWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.salvage2RequestId = 0
	self.autogenDestroyRequestId = 0
	self.autogenIidToDestroy = nil

end



-- убираются все возможные ограниченмя, из-за которых предмет может не показаться в списке
function UI.ShopWnd:RemoveBuyFiltersRestrictions()

	UI.Shop_FilterCheckBox_FitForSelShip:Check( false )	

	for rankRecordIdx = 1, UI.Shop_FilterComboBox_Rank:GetNumRecords() do
		local rankData = UI.Shop_FilterComboBox_Rank:GetRecordData( rankRecordIdx )
		if rankData.rank == -1  then
			UI.Shop_FilterComboBox_Rank:SelectRecord( rankRecordIdx )
			break		
		end
	end

end


-- убираются все возможные ограниченмя, из-за которых предмет может не показаться в списке
function UI.ShopWnd:RemoveSellFiltersRestrictions()

	UI.Shop_FilterCheckBox_UnfitForShips:Check( false )
	UI.Shop_FilterCheckBox_NotOnShips:Check( false )	

	for rankRecordIdx = 1, UI.Shop_FilterComboBox_Rank:GetNumRecords() do
		local rankData = UI.Shop_FilterComboBox_Rank:GetRecordData( rankRecordIdx )
		if rankData.rank == -1  then
			UI.Shop_FilterComboBox_Rank:SelectRecord( rankRecordIdx )
			break		
		end
	end

	local defaultQuality = -1
	for qualityRecordIdx = 1, UI.Shop_FilterComboBox_Quality:GetNumRecords() do
		local qualityData = UI.Shop_FilterComboBox_Quality:GetRecordData( qualityRecordIdx )
		if qualityData.quality == -1 then
			UI.Shop_FilterComboBox_Quality:SelectRecord( qualityRecordIdx )
			break		
		end
	end

end   


--
function UI.ShopWnd:FindDefaultItemForItemSubType( itemSubType )

	local defName = ""
	local itemsOfSubType = {}

	for defName, shopItem in pairs( UI.serverData.shopByDef ) do	

		if UI:GetItemSubType( defName ) == itemSubType then

			if not UI:CantItemBeBought( shopItem ) then
				table.insert( itemsOfSubType, shopItem )
			end

		end

	end

	if next( itemsOfSubType ) then
		UI:SortShop( itemsOfSubType, self.sortMode == self.sortModes.DESC, true )	
		defName = itemsOfSubType[ 1 ].defName
	else
		sys.log( "UI.ShopWnd:FindDefaultItemForItemSubType()[ERROR]: cannot find item to show for subtype %d", itemSubType )
	end

	return defName

end


--
function UI.ShopWnd:UpdateCategoriesPos()

	self:RemoveControl( self.categoriesList, self.layers.WORK_EFFECT )

	local locator = self.tradeMode == self.tradeModes.SELL and self.effectInfo.work.categoriesLocator_sell or self.effectInfo.work.categoriesLocator_buy
	self:AddControl( self.categoriesList, self.layers.WORK_EFFECT, locator )

	if UI.Shop_InventorySizeBtn:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Shop_InventorySizeBtn )
	end
	
	if UI.Shop_AutogenInventorySizeBtn:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Shop_AutogenInventorySizeBtn )
	end

end


--
function UI.ShopWnd:OnAccountAurasChanged()

	if self.tradeMode ~= self.tradeModes.BUY then
		return
	end

    local specCategoriesInfo = self:GetSpecialCategoriesInfo()

	local bNeedSaleCategory	= next( specCategoriesInfo.saleCategories ) ~= nil
	local bIsSaleCategory	= self.categoriesList:FindRecordByCategoryName( "sale", UI.StoreCategoriesListWnd.categoryTypes.MAIN ) ~= -1

	if bNeedSaleCategory ~= bIsSaleCategory then

		local selItemsInfo = self:GetSelItemsInfo()

		self.bLockItemsUpdate = true
		self:UpdateCategories( self.tradeMode, specCategoriesInfo )
		self.bLockItemsUpdate = false

		self:UpdateItems( selItemsInfo, false )

	else

        for recordIdx = 1, self.categoriesList:GetNumTotalRecords() do

			local data = self.categoriesList:GetRecordData( recordIdx )

			local bSale = false

			if data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
				bSale = specCategoriesInfo.saleCategories[ data.categoryInfo.name ] ~= nil

			elseif data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
				local mainSaleInfo = specCategoriesInfo.saleCategories[ data.parentCategoryInfo.name ]
				bSale = mainSaleInfo ~= nil and mainSaleInfo[ data.categoryInfo.name ] ~= nil
			end

			if bSale ~= data.sale then

				data.sale = bSale

				local slotWnd = self.categoriesList:GetSlotWndForRecord( recordIdx )
				if slotWnd then
					slotWnd:OnSaleStateChanged()
				end

			end

		end

		self:UpdateItems( nil, true )

	end

end


--
function UI.ShopWnd:IsMultiSelectionAllowed()

	return self.tradeMode == self.tradeModes.SELL

end


--
function UI.ShopWnd:IsWaitingRequests()

	return UI:IsWaitingRequests()

end


--
function UI.ShopWnd:TryDestroyAutogen( iid )
	
	if self:IsWaitingRequests() then
		sys.log( "UI.ShopWnd:TryDestroyAutogen()[ERROR]: still waiting for another request" )
		return
	end
	
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.ShopWnd:TryDestroyAutogen()[ERROR]: invalid iid" )
		return
	end
	
	local defName = UI:Iid2DefName( iid )
	local strNameLink = string.format( "$link [type ITEM][params {defName=\"%s\"}]$", defName )
	
	local str = UI:GetStringByName( "autogenUnequip_destroyConfirm_text" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$name%$", strNameLink )
	
	if numSubst == 0 then
		sys.log( "UI.ShopWnd:UpdateMsg()[ERROR]: cannot find placeholder '$name$' in string 'autogenUnequip_destroyMsg_text'" )
		str = string.format( "[INVALID STRING] Unequipping item %s", strNameLink )
	end
	
	self.autogenIidToDestroy = iid
	self.hMsgAutogenDestroy = UI:MessageBox( UI:GetStringByName( "autogenUnequip_destroyConfirm_caption" ), str, UI.MBS_YES_NO )

end


--
function UI.ShopWnd:DoDestroyAutogen( iid )

	if self:IsWaitingRequests() then
		sys.log( "UI.ShopWnd:DoDestroyAutogen()[ERROR]: still waiting for another request" )
		return
	end
	
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.ShopWnd:DoDestroyAutogen()[ERROR]: invalid iid" )
		return
	end
	
	self.autogenDestroyRequestId = _G.GameStore_AutogenDestroy( iid )
	
	if self.autogenDestroyRequestId ~= 0 then
		UI:AddWaitingRequest( self.autogenDestroyRequestId )
	else
		self:ShowMsgOnAutogenDestroyError( _G.GameStore.ModuleEquipResult.MER_ERROR )
	end
	
	self:UpdateWaitEffect()
	
end


--
function UI.ShopWnd:ShowMsgOnAutogenDestroyError( result )

	UI:ShowErrorMsg( "msg_autogenDestroyError", result, "_G.GameStore.ModuleEquipResult" )
	
end


-- -------------------------------------------------------------------
-- UI.StoreCategoriesListWnd
-- -------------------------------------------------------------------

UI.StoreCategoriesListWnd = {}
local scl = UI.StoreCategoriesListWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.StoreCategoriesListWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "StoreCategoriesListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "shop_categories_list",
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

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.StoreCategoriesListWnd:AddRecord( data )

	local numRecords = #self.records
	local recordIdx = numRecords + 1

	local record = {}
	record.idx		= recordIdx
	record.data		= data

	local slotWnd = self:ObtainFreeSlotWnd( data.categoryType )
	if not slotWnd then
		sys.log( "UI.StoreCategoriesListWnd:AddRecord()[ERROR]: cannot create slot for record" )
		return -1
	end
	slotWnd:SetupForRecord( self, recordIdx )	
	record.slotWnd = slotWnd

	table.insert( self.records, record )

	slotWnd:FullUpdate()

	return recordIdx

end


--
function UI.StoreCategoriesListWnd:GetRecordData( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.data

end


--
function UI.StoreCategoriesListWnd:GetNumTotalRecords()

	return #self.records

end


--
function UI.StoreCategoriesListWnd:GetNumVisibleRecords()

	return #self.visibleRecordIds

end


--
function UI.StoreCategoriesListWnd:IsAnimating()

    return self.state ~= self.states.IDLE	

end


--
function UI.StoreCategoriesListWnd:GetSelectedMainCategoryRecord()

	return self.selMainCategoryRecordIdx

end


--
function UI.StoreCategoriesListWnd:GetSelectedSubCategoryRecord()

	return self.selSubCategoryRecordIdx

end


--
function UI.StoreCategoriesListWnd:GetSelectedMainCategory()

	local data = self:GetRecordData( self.selMainCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""

end


--
function UI.StoreCategoriesListWnd:GetSelectedSubCategory()

	local data = self:GetRecordData( self.selSubCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""

end


--
function UI.StoreCategoriesListWnd:SelectMainCategory( name, bAnimated, bSound )

	local recordIdx = -1

	if name ~= "" then

		recordIdx = self:FindRecordByCategoryName( name, UI.StoreCategoriesListWnd.categoryTypes.MAIN )
		if recordIdx == -1 then
			sys.log( "UI.StoreCategoriesListWnd:SelectedMainCategory()[ERROR]: cannot find record for category %s", tostring( name ) )
			return
		end

	end

	self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )	

end


--
function UI.StoreCategoriesListWnd:SelectSubCategory( name, parentName, bSound )

	local recordIdx = -1

	if name ~= "" then

		recordIdx = self:FindRecordByCategoryName( name, UI.StoreCategoriesListWnd.categoryTypes.SUB, parentName )

		if recordIdx == -1 then
			sys.log( "UI.StoreCategoriesListWnd:SelectedSubCategory()[ERROR]: cannot find record for subcategory \"%s.%s\"", tostring( parentName ), tostring( name ) )
			return
		end

		local selMainCategory = self:GetSelectedMainCategory() 
		if selMainCategory == "" or selMainCategory ~= parentName then
			sys.log( "UI.StoreCategoriesListWnd:SelectedSubCategory()[ ERROR]: cannot select a subcategory with the parent category not being selected" )
			return
		end

	end

	self:SelectSubCategoryRecordInternal( recordIdx, bSound )

end


--
function UI.StoreCategoriesListWnd:SelectRecord( recordIdx, bSelect, bAnimated, bSound )

	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.StoreCategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return
	end

	local data = self:GetRecordData( recordIdx )
	if data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
	                                                              	
		if bSelect then
			self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )	

		elseif recordIdx == self.selMainCategoryRecordIdx then
			self:SelectMainCategoryRecordInternal( -1, bAnimated, bSound )							
		end

	elseif data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then

		if bSelect then
			self:SelectSubCategoryRecordInternal( recordIdx, bSound )	

		elseif recordIdx == self.selSubCategoryRecordIdx then
			self:SelectSubCategoryRecordInternal( -1, bSound )							
		end

	end

end


--
function UI.StoreCategoriesListWnd:IsRecordSelected( recordIdx )

	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.StoreCategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return false
	end

	return recordIdx == self.selMainCategoryRecordIdx or recordIdx == self.selSubCategoryRecordIdx

end 


--
function UI.StoreCategoriesListWnd:Reset()

	for recordIdx, record in pairs( self.records ) do
		record.slotWnd:FullReset()
		record.slotWnd:UnlinkFromParent()		
	end

	self.records					= {}
	self.visibleRecordIds			= {}
	self.selMainCategoryRecordIdx	= -1
	self.selSubCategoryRecordIdx	= -1
	self.state						= self.states.IDLE

	self:ResetAnimInfo()

end


--
function UI.StoreCategoriesListWnd:UpdateVisibleRecordsImmediate()

	self:ResetVisibleRecords()

	self.state = self.states.IDLE

	local selMainCategory = self:GetSelectedMainCategory()

	for recordIdx = 1, #self.records do

		local record = self.records[ recordIdx ]

		if record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
			table.insert( self.visibleRecordIds, recordIdx )

		elseif record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
			if record.data.parentCategoryInfo.name == selMainCategory then
    			table.insert( self.visibleRecordIds, recordIdx )
			end
		end

	end
	
	for visIdx, recordIdx in pairs( self.visibleRecordIds ) do

		local record = self.records[ recordIdx ]
		local slotWnd = record.slotWnd

		self:AddChild( slotWnd )

		slotWnd:Select( recordIdx == self.selMainCategoryRecordIdx or recordIdx == self.selSubCategoryRecordIdx )
		slotWnd:SetAlpha( 1 )

		local y = self:GetAnchorPos( visIdx )
		slotWnd:SetTop( y )
		
	end	

end


--
function UI.StoreCategoriesListWnd:FindRecordByCategoryName( name, categoryType, parentName )

	for recordIdx, record in pairs( self.records ) do
		if record.data.categoryType == categoryType and record.data.categoryInfo.name == name and ( categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN or record.data.parentCategoryInfo.name == parentName ) then
			return recordIdx
		end
	end

	return 	-1

end


-- ------------------------------
-- const
-- ------------------------------

scl.categoryTypes =
{
	MAIN	= 1,
	SUB		= 2,
}

scl.layers =
{
	MAIN_EFFECT	= 0,
}

scl.states =
{
	IDLE		= 1,
	SHOW_SUB	= 2,
	HIDE_SUB	= 3,	
}

scl.effectInfo =
{
	main =
	{
		firstRecordObjName		= "button_1",
		secondRecordObjName		= "button_2",		
	}
}

scl.SHOW_SPEED	= 40	-- слотов/сек
scl.HIDE_SPEED	= 60	-- слотов/сек

scl.slotPrototypeMain	= "StoreCategoriesSlotWnd_main"
scl.slotPrototypeSub	= "StoreCategoriesSlotWnd_sub"

-- ------------------------------
-- vars
-- ------------------------------

scl.records						= {}
scl.visibleRecordIds			= {}
scl.selMainCategoryRecordIdx	= -1
scl.selSubCategoryRecordIdx		= -1
scl.state						= scl.states.IDLE
scl.allSlots					= {}
scl.firstRecordPos				= Vec2( 0, 0 )
scl.recordsDist					= 0

scl.animInfo =
{
    maxTime	 			= 0,
    elapsedTime			= 0,	
	mainRecordIdx		= -1,
    firstSubRecordIdx	= -1,
    lastSubRecordIdx	= -1,
    lastIdx				= -1,
    nextMainVisIdx		= -1,
	nextMainSrcPos		= 0,
	nextMainDstPos		= 0,
	bReversed			= false,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.StoreCategoriesListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.records			= {}
    self.visibleRecordIds	= {}
    self.allSlots			= {}
    self.firstRecordPos		= Vec2( 0, 0 )

    self.animInfo =
    {
        maxTime	 			= 0,
        elapsedTime			= 0,	
    	mainRecordIdx		= -1,
        firstSubRecordIdx	= -1,
        lastSubRecordIdx	= -1,
        lastIdx				= -1,
        nextMainVisIdx		= -1,
    	nextMainSrcPos		= 0,
    	nextMainDstPos		= 0,
    	bReversed			= false,
    }

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.firstRecordPos = mainEffect:GetObjPos( self.effectInfo.main.firstRecordObjName )
		local secondRecordPos = mainEffect:GetObjPos( self.effectInfo.main.secondRecordObjName )

		self.recordsDist = secondRecordPos.y - self.firstRecordPos.y

	end

end


--
function UI.StoreCategoriesListWnd:ObtainFreeSlotWnd( categoryType )

	local slotsByCategory = self.allSlots[ categoryType ]

	if not slotsByCategory then
		slotsByCategory = {}
		self.allSlots[ categoryType ] = slotsByCategory
	end

	local slotWnd = nil

	for idx, slot in pairs( slotsByCategory ) do
		if slot.recordIdx == -1 then
			slotWnd = slot
			break
		end
	end

	if not slotWnd then
		slotWnd = self:CreateSlotWnd( categoryType )

		if slotWnd then
			table.insert( slotsByCategory, slotWnd )
		end
	end

	return slotWnd

end


--
function UI.StoreCategoriesListWnd:CreateSlotWnd( categoryType )

	local proto = nil

	if categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
		proto = UI[ self.slotPrototypeMain ]

	elseif categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
		proto = UI[ self.slotPrototypeSub ]

	else
		sys.log( "UI.StoreCategoriesListWnd:CreateSlotWnd()[ERROR]: cannot find prototype slot for category %s", tostring( categoryType ) )
		return nil
	end

	local slotsByCategory = self.allSlots[ categoryType ]
	local numSlots = slotsByCategory and #slotsByCategory or 0

	local slotWnd = UI:CreateChildWnd( self, proto, numSlots + 1 )
	slotWnd:SetLeft( self.firstRecordPos.x )

	return slotWnd

end


--
function UI.StoreCategoriesListWnd:SelectSubCategoryRecordInternal( recordIdx, bSound )

	if recordIdx == self.selSubCategoryRecordIdx then
		return
	end	

	local oldRecordIdx = self.selSubCategoryRecordIdx
	self.selSubCategoryRecordIdx = recordIdx

	if oldRecordIdx ~= -1 then
		self.records[ oldRecordIdx ].slotWnd:Select( false )
	end

	if self.selSubCategoryRecordIdx ~= -1 then
		self.records[ self.selSubCategoryRecordIdx ].slotWnd:Select( true )
	end

	if bSound and self:IsOnScreen() then
		local sound = recordIdx == -1 and UI.ShopWnd.sounds.categoryDeselect or UI.ShopWnd.sounds.categorySelect
		UI:PlayGlobalSound( sound )
	end

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selSubCategoryRecordIdx, oldRecordIdx, 0, 0 )	

end


--
function UI.StoreCategoriesListWnd:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )

	if recordIdx == self.selMainCategoryRecordIdx then
		return
	end

	-- по умолчанию при выборе главной категории ни одна подкатегория не выбрана;
	-- при развыборе выделение с подкатегории также снимается
	self:SelectSubCategoryRecordInternal( -1 )	

	-- немедленно завершается предыдущая анимация, если была;
	-- но вообще-то такой ситуаии нельзя допускать

	if self:IsAnimating() then
		sys.log( "UI.StoreCategoriesListWnd:SelectMainCategoryRecordInternal()[WARNING]: already animating")
		self:UpdateVisibleRecordsImmediate()
	end

	local oldRecordIdx = self.selMainCategoryRecordIdx
	self.selMainCategoryRecordIdx = recordIdx

	local sound = ""

	if not bAnimated then
		self:UpdateVisibleRecordsImmediate()

	else

		local bHasNewSubCategories = false
		local bHasOldSubCategories = false

		if recordIdx ~= -1 then
			local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( recordIdx )
			bHasNewSubCategories = firstSubRecordIdx ~= -1
		end

		if oldRecordIdx ~= -1 then
			local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( oldRecordIdx )
			bHasOldSubCategories = firstSubRecordIdx ~= -1
		end

		-- показать
		if oldRecordIdx == -1 then
			self:ShowSubCategoriesAnimated( recordIdx )
			sound = bHasNewSubCategories and UI.ShopWnd.sounds.categorySelectAnimated or UI.ShopWnd.sounds.categorySelect

		-- скрыть
		elseif recordIdx == -1 then
			self:HideSubCategoriesAnimated( oldRecordIdx )
			sound = bHasOldSubCategories and UI.ShopWnd.sounds.categoryDeselectAnimated or UI.ShopWnd.sounds.categoryDeselect

		-- сменить; для этого сначала скрыть предыдущее
		else
			self:HideSubCategoriesAnimated( oldRecordIdx )
			sound = bHasNewSubCategories and UI.ShopWnd.sounds.categoryChangeAnimated or UI.ShopWnd.sounds.categorySelect
		end	
	end

	if bSound and self:IsOnScreen() and sound ~= "" then
		UI:PlayGlobalSound( sound )
	end

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selMainCategoryRecordIdx, oldRecordIdx, 0, 0 )		

end


--
function UI.StoreCategoriesListWnd:ShowSubCategoriesAnimated( mainRecordIdx )

	if mainRecordIdx == -1 then
		sys.log( "UI.StoreCategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: invalid record index" )
		return
	end

	self:ResetAnimInfo()	

	self.state = self.states.SHOW_SUB
	self.animInfo.mainRecordIdx = mainRecordIdx

	-- выделение сллота категории
	local selSlotWnd = self:GetSlotWndForRecord( mainRecordIdx )
	selSlotWnd:Select( true )

	local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( mainRecordIdx )

	-- нет подкатегорий
	if firstSubRecordIdx == -1 then		
		self:OnStopAnimation()
		return
	end

	-- подкатегории уже открыты - ошибка!
	local firstSubVisIdx = self:Record2VisIdx( firstSubRecordIdx )
	if firstSubVisIdx ~= -1 then
		sys.log( "UI.StoreCategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: subcategories are already open" )
		self:OnStopAnimation()
		return
	end

	local mainVisIdx = self:Record2VisIdx( mainRecordIdx ) 
	for subRecordIdx = firstSubRecordIdx, lastSubRecordIdx do

		local subVisIdx = mainVisIdx + ( subRecordIdx - mainRecordIdx )
		table.insert( self.visibleRecordIds, subVisIdx, subRecordIdx )

		local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
		self:AddChild( subSlotWnd )

		subSlotWnd:SetAlpha( 0 )
		subSlotWnd:Enable( false )

		local y = self:GetAnchorPos( subVisIdx )
		subSlotWnd:SetTop( y )

	end

	local numSubCategories = ( lastSubRecordIdx - firstSubRecordIdx + 1 )

	self.animInfo.maxTime	 		= numSubCategories / self.SHOW_SPEED
	self.animInfo.elapsedTime		= 0
	self.animInfo.mainRecordIdx		= mainRecordIdx
	self.animInfo.firstSubRecordIdx	= firstSubRecordIdx
	self.animInfo.lastSubRecordIdx	= lastSubRecordIdx
	self.animInfo.lastIdx			= 1
	self.animInfo.nextMainVisIdx	= self:Record2VisIdx( nextMainRecordIdx ) 
	self.animInfo.bReversed			= false

	if nextMainRecordIdx ~= -1 then
    	self.animInfo.nextMainSrcPos	= self:GetAnchorPos( self:Record2VisIdx( firstSubRecordIdx ) )
    	self.animInfo.nextMainDstPos	= self:GetAnchorPos( self.animInfo.nextMainVisIdx )
	end

end


--
function UI.StoreCategoriesListWnd:HideSubCategoriesAnimated( mainRecordIdx )

	if mainRecordIdx == -1 then
		sys.log( "UI.StoreCategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: invalid record index" )
		return
	end


	self:ResetAnimInfo()	

	self.state = self.states.HIDE_SUB
	self.animInfo.mainRecordIdx = mainRecordIdx

	local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( mainRecordIdx )

	-- нет подкатегорий
	if firstSubRecordIdx == -1 then		
		self:OnStopAnimation()
		return
	end

	-- подкатегории уже скрыты - ошибка!
	local firstSubVisIdx = self:Record2VisIdx( firstSubRecordIdx )
	if firstSubVisIdx == -1 then
		sys.log( "UI.StoreCategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: subcategories are not open" )
		self:OnStopAnimation()
		return
	end

	for subRecordIdx = firstSubRecordIdx, lastSubRecordIdx do
		local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
		subSlotWnd:Enable( false )
	end

	local numSubCategories = ( lastSubRecordIdx - firstSubRecordIdx + 1 )

	self.animInfo.maxTime	 		= numSubCategories / self.HIDE_SPEED
	self.animInfo.elapsedTime		= 0	
	self.animInfo.mainRecordIdx		= mainRecordIdx
	self.animInfo.firstSubRecordIdx	= firstSubRecordIdx
	self.animInfo.lastSubRecordIdx	= lastSubRecordIdx
	self.animInfo.lastIdx			= numSubCategories
	self.animInfo.nextMainVisIdx	= self:Record2VisIdx( nextMainRecordIdx ) 
	self.animInfo.bReversed			= true

	if nextMainRecordIdx ~= -1 then
    	self.animInfo.nextMainSrcPos	= self:GetAnchorPos( self.animInfo.nextMainVisIdx )
    	self.animInfo.nextMainDstPos	= self:GetAnchorPos( self:Record2VisIdx( firstSubRecordIdx ) )
	end

end


--
function UI.StoreCategoriesListWnd:UpdateAnimation( dt )

	self.animInfo.elapsedTime = self.animInfo.elapsedTime + dt

	local t0 = UI:Clamp( self.animInfo.elapsedTime / self.animInfo.maxTime, 0, 1 )
	local t = self.animInfo.bReversed and 1 - t0 or t0

	local numSubRecords = self.animInfo.lastSubRecordIdx - self.animInfo.firstSubRecordIdx + 1
	local records_t = numSubRecords * t

	local prevIdx = math.floor( records_t )
	local curIdx = UI:Clamp( prevIdx + 1, 1, numSubRecords )

	-- предыдущие субкатегории полностью выводятся из альфы

	if curIdx ~= self.animInfo.lastIdx then

		for idx = self.animInfo.lastIdx, prevIdx do
			local recordIdx = self.animInfo.firstSubRecordIdx + idx - 1
			local record = self.records[ recordIdx ]
			record.slotWnd:SetAlpha( 1 )
		end

		self.animInfo.lastIdx = curIdx

	end

	-- альфа текущей субкатегории

	local curRecord_t = UI:Clamp( records_t - ( curIdx - 1 ), 0, 1 )
	local curRecordIdx = self.animInfo.firstSubRecordIdx + curIdx - 1
	local curRecord = self.records[ curRecordIdx ]
	curRecord.slotWnd:SetAlpha( curRecord_t )

	-- позиция всех нижележащих слотов

	if self.animInfo.nextMainVisIdx ~= -1 then
    	local y = UI:Lerp( self.animInfo.nextMainSrcPos, self.animInfo.nextMainDstPos, t0 )
    	self:SetUnderlyingRecordsPos( self.animInfo.nextMainVisIdx, y )
	end

	-- завершение анимации
	if t0 >= 1 then
		self:OnStopAnimation()
	end

end


--
function UI.StoreCategoriesListWnd:OnStopAnimation()

	if self.state == self.states.SHOW_SUB then

		self.state = self.states.IDLE

		-- возвращение возможности слотам подкатегорий реагировать на инпут
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do
    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			subSlotWnd:Enable( true ) 
    		end

		end


	elseif self.state == self.states.HIDE_SUB then

		self.state = self.states.IDLE

		-- развыделение старого слота категории
		if self.animInfo.mainRecordIdx ~= -1 then
	    	local oldSelSlotWnd = self:GetSlotWndForRecord( self.animInfo.mainRecordIdx )
			oldSelSlotWnd:Select( false )
		else
    		sys.log( "UI.StoreCategoriesListWnd:OnStopAnimation()[ERROR]: invalid old sel record index" )
		end

		-- подкатегории убираются из визуального списка
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do

    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			subSlotWnd:PartialReset()
				subSlotWnd:UnlinkFromParent()

    		end

			local newVisibleRecordIds = {}

    		for visIdx = 1, #self.visibleRecordIds do
				local recordIdx = self.visibleRecordIds[ visIdx ]

    			if not( recordIdx >= self.animInfo.firstSubRecordIdx and recordIdx <= self.animInfo.lastSubRecordIdx ) then
					table.insert( newVisibleRecordIds, recordIdx )
    			end
    		end

			self.visibleRecordIds = newVisibleRecordIds

		end	

		-- разворачивание подгатегорий для новой выбранной категории
    	if self.selMainCategoryRecordIdx ~= -1 then			
			self:ShowSubCategoriesAnimated( self.selMainCategoryRecordIdx )
		end

	end

	if self.state == self.states.IDLE then
		self:ResetAnimInfo()	
	end

end   


--
function UI.StoreCategoriesListWnd:ResetAnimInfo()

	self.animInfo =
	{
        maxTime	 			= 0,
        elapsedTime			= 0,	
    	mainRecordIdx		= -1,
        firstSubRecordIdx	= -1,
        lastSubRecordIdx	= -1,
        lastIdx				= -1,
        nextMainVisIdx		= -1,
    	nextMainSrcPos		= 0,
    	nextMainDstPos		= 0,
    	bReversed			= false,
	}

end


--
function UI.StoreCategoriesListWnd:ResetVisibleRecords()

	for visIdx, recordIdx in pairs( self.visibleRecordIds ) do

		local record = self.records[ recordIdx ]
		local slotWnd = record.slotWnd

		slotWnd:PartialReset()
		slotWnd:UnlinkFromParent()

	end

	self.visibleRecordIds = {}

end


--
function UI.StoreCategoriesListWnd:GetAnchorPos( visIdx )

    return self.firstRecordPos.y + self.recordsDist * ( visIdx - 1 )

end


--
function UI.StoreCategoriesListWnd:Record2VisIdx( recordIdx )

	if recordIdx == -1 then
		return -1
	end

	for visIdx, _recordIdx in pairs( self.visibleRecordIds ) do
		if _recordIdx == recordIdx then
			return visIdx
		end
		
	end

	return -1

end


--
function UI.StoreCategoriesListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.state ~= self.states.IDLE then
		self:UpdateAnimation( dt_sys )		
	end

end


--
function UI.StoreCategoriesListWnd:SetUnderlyingRecordsPos( topVisIdx, y )

	for visIdx = topVisIdx, #self.visibleRecordIds do

		local recordIdx = self.visibleRecordIds[ visIdx ]
		local record = self.records[ recordIdx ]

		local recordY = y + ( visIdx - topVisIdx ) * self.recordsDist
		record.slotWnd:SetTop( recordY )	

	end

end


--
function UI.StoreCategoriesListWnd:GetRecordsForAnimating( mainRecordIdx )

	local firstSubRecordIdx		= -1
	local lastSubRecordIdx		= -1
	local nextMainRecordIdx		= -1

	if mainRecordIdx == -1 then
		return firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx
	end

	for recordIdx = mainRecordIdx + 1, #self.records do

		local record = self.records[ recordIdx ]

		if record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
			nextMainRecordIdx = recordIdx
			break
		end

		if firstSubRecordIdx == -1 then
			firstSubRecordIdx = recordIdx
		end

		lastSubRecordIdx = recordIdx

	end

	return firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx

end


--
function UI.StoreCategoriesListWnd:GetSlotWndForRecord( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.slotWnd

end

-- -------------------------------------------------------------------
-- UI.StoreCategoriesSlotWnd
-- -------------------------------------------------------------------

UI.StoreCategoriesSlotWnd = {}
local scs = UI.StoreCategoriesSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

local l_numCheckBoxBaseLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.StoreCategoriesSlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",
	
	props =
	{
		name		= "StoreCategoriesSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numCheckBoxBaseLayers + 3,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- GOLD_EFFECT
		{
			id			= l_numCheckBoxBaseLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_gold",
				defaultAnimation	= "idle",
			}}
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_sale",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
} 

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.StoreCategoriesSlotWnd:SetupForRecord( parentListWnd, recordIdx )

	self.parentListWnd	= parentListWnd
	self.recordIdx		= recordIdx

end


--
function UI.StoreCategoriesSlotWnd:GetRecord()
         	
	return self.recordIdx

end


--
function UI.StoreCategoriesSlotWnd:FullUpdate()

	local data = self:GetRecordData()
	if not data then
		sys.log( "UI.StoreCategoriesSlotWnd:FullUpdate()[ERROR]: nil data" )
		return
	end

	self:UpdateName( data )
	self:UpdateIco( data )
	self:UpdateSaleState( data )
	self:UpdateTooltip( data )
	self:UpdateGoldEffect( data )

end


--
function UI.StoreCategoriesSlotWnd:FullReset()

	self.parentListWnd	= nil
	self.recordIdx		= -1

	self:SetText( "", self.layers.NAME )

	self:SetLayerVisible( flase, self.layers.SALE_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

	self:SetTooltipData( {} )

end


--
function UI.StoreCategoriesSlotWnd:PartialReset()

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

end


--
function UI.StoreCategoriesSlotWnd:Select( bSelect )

	self:Check( bSelect )

end


--
function UI.StoreCategoriesSlotWnd:IsSelected()

	return self:IsChecked()

end


-- alpha - от 0 до 1
function UI.StoreCategoriesSlotWnd:SetAlpha( alpha )

	-- спрайт, использующийся для обозначения наведения мышью, рисуется с блендом COLOR_ADD, поэтому смена альфы на него не повлияет;
	-- однако во время анимации слотов, в кооторой и задействована смена альфы, у слота должен быть предварительно выставлен
	-- стиль WS_DISABLE, поэтому проблемы с данным спрайтом не должно возникнуть

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAlpha( alpha * 255 )
	end

end


--
function UI.StoreCategoriesSlotWnd:OnSaleStateChanged()

	local data = self:GetRecordData()
	self:UpdateSaleState( data )

end


-- ------------------------------
-- const
-- ------------------------------

scs.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
	GOLD_EFFECT		= 2,
	SALE_EFFECT		= 3,
    NAME			= 4,
}

scs.effectInfo =
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
		animationIdle 		= "select",
		animationSelect		= "sel_over",
		animationPressed	= "sel_over",
		animationDisabled	= "select",
	},

	icoSpriteName	= "ico"
}

scs.CATEGORY_SLOT = true

-- ------------------------------
-- vars
-- ------------------------------

scs.parentListWnd	= nil
scs.recordIdx		= -1
scs.tooltipData		= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.StoreCategoriesSlotWnd:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end
	
	self:FullReset()

end


--
function UI.StoreCategoriesSlotWnd:GetRecordData()

	local data = self.parentListWnd and self.parentListWnd:GetRecordData( self.recordIdx )
	return data

end


--
function UI.StoreCategoriesSlotWnd:UpdateName( data )

	local localizedName = UI:ShopCategory2Str( data.categoryInfo.name )
	self:SetText( localizedName, self.layers.NAME )

end


--
function UI.StoreCategoriesSlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end	

	local hTex = UI:GetShopCategoryIco( data.categoryInfo.name )
	mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, hTex )

end


--
function UI.StoreCategoriesSlotWnd:UpdateSaleState( data )

	self:SetLayerVisible( data.sale, self.layers.SALE_EFFECT )

end


--
function UI.StoreCategoriesSlotWnd:UpdateTooltip( data )

	self:SetTooltipData( UI:GetShopCategoryTooltipData( data.categoryInfo.name ) )

end


--
function UI.StoreCategoriesSlotWnd:UpdateGoldEffect( data )

	-- сейчас не предусмотрено, что этот эффект будет на подкатегории;
	-- для корректного отображения на подкатегории нужна отдельная анимация + прилинковать эффект в дочернем классе субкатегории

	local bGold = data.bGold == true
	self:SetLayerVisible( bGold, self.layers.GOLD_EFFECT )	

end


--
function UI.StoreCategoriesSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self:IsOnScreen() and not self.parentListWnd:IsAnimating() then
		UI:PlayGlobalSound( UI.ShopWnd.sounds.categoryMouseOver )
	end

	return true

end


--
function UI.StoreCategoriesSlotWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.StoreCategoriesSlotWnd:GetTooltipData()

	return self.tooltipData
	
end


-- -------------------------------------------------------------------
-- UI.StoreCategoriesSlotWnd_main
-- -------------------------------------------------------------------

UI.StoreCategoriesSlotWnd_main =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "StoreCategoriesSlotWnd",
    	
    	props =
    	{
    		name		= "StoreCategoriesSlotWnd_main",
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
    				defName 			= "shop_categories_slotMain",
    				defaultAnimation	= "idle",


    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "sale",	
    						layer		= "UI.StoreCategoriesSlotWnd.layers.SALE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.StoreCategoriesSlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "gold",	
    						layer		= "UI.StoreCategoriesSlotWnd.layers.GOLD_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},
		}
	}
}


-- -------------------------------------------------------------------
-- UI.StoreCategoriesSlotWnd_sub
-- -------------------------------------------------------------------

UI.StoreCategoriesSlotWnd_sub =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "StoreCategoriesSlotWnd",
    	
    	props =
    	{
    		name		= "StoreCategoriesSlotWnd_sub",
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
    				defName 			= "shop_categories_slotSub",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "sale",	
    						layer		= "UI.StoreCategoriesSlotWnd.layers.SALE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.StoreCategoriesSlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},
		}
	}
}

-- -------------------------------------------------------------------
-- UI.Shop_CategoriesListWnd
-- -------------------------------------------------------------------

UI.Shop_CategoriesListWnd =
{
	def =
	{
		className	= "Wnd",
	    prototype	= "StoreCategoriesListWnd",

		props =
		{
			name	= "Shop_CategoriesListWnd"
		}		
	}
}

-- -------------------------------------------------------------------
-- UI.Shop_FilterCheckBox
-- -------------------------------------------------------------------

UI.Shop_FilterCheckBox = {}
local sfc = UI.Shop_FilterCheckBox

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Shop_FilterCheckBox.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Shop_FilterCheckBox",
		selectSound	= UI.sounds.btnMouseOver,
		clickSound	= UI.sounds.checkBox,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numCheckBoxBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shop_filterCheckBox",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.Shop_FilterCheckBox.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id			= l_numCheckBoxBaseLayers,

			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Shop_FilterCheckBox:Setup( data, text )

	self.data = data	
	self:SetText( text, self.layers.TEXT )

end


--
function UI.Shop_FilterCheckBox:GetData()

	return self.data

end


--
function UI.Shop_FilterCheckBox:Reset()

	self.data = nil
	self:SetText( "", self.layers.TEXT )
	self:Check( false )

end


-- -----------------------------------
-- const
-- -----------------------------------

sfc.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
    TEXT			= 2,
}

sfc.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "idle_over",
		animationDisabled	= "idle",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "chek_over",
		animationDisabled	= "chek",
	},
}

sfc.FILTER_CB = true

-- -----------------------------------
-- vars
-- -----------------------------------

sfc.data	= nil

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- UI.Shop_FilterCheckBox_FitForSelShip,
-- UI.Shop_FilterCheckBox_UnfitForShips, UI.Shop_FilterCheckBox_NotOnShips
-- ------------------------------------------------------------------------------------------------------------------------------------------

--
UI.Shop_FilterCheckBox_FitForSelShip =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "Shop_FilterCheckBox_FitForSelShip",
    	},
	}
}


--
UI.Shop_FilterCheckBox_UnfitForShips =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "Shop_FilterCheckBox_UnfitForShips",
    	},
	}
}


--
UI.Shop_FilterCheckBox_NotOnShips =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "Shop_FilterCheckBox_NotOnShips",
    	},
	}
}

-- -------------------------------------------------------------------
-- UI.Shop_ItemsModeListBtn
-- -------------------------------------------------------------------

UI.Shop_ItemsModeListBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "EffectCheckBoxWnd",

     	props =
     	{
     		name			= "Shop_ItemsModeListBtn",
			selectSound		= UI.sounds.btnMouseOver,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "shop_itemsMode_listBtn",
    				defaultAnimation    = "idle",

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
	},

    effectInfo =
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
    		animationIdle 		= "select",
    		animationSelect		= "sel_over",
    		animationPressed	= "sel_over",
    		animationDisabled	= "select",
    	},
    }
}


-- -------------------------------------------------------------------
-- UI.Shop_ItemsModeGridBtn
-- -------------------------------------------------------------------

UI.Shop_ItemsModeGridBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "EffectCheckBoxWnd",

     	props =
     	{
     		name			= "Shop_ItemsModeGridBtn",
			selectSound		= UI.sounds.btnMouseOver,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "shop_itemsMode_gridBtn",
    				defaultAnimation    = "idle",

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
	},

    effectInfo =
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
    		animationIdle 		= "select",
    		animationSelect		= "sel_over",
    		animationPressed	= "sel_over",
    		animationDisabled	= "select",
    	},
    }
}  

-- ----------------------------------------------------------------------------
-- UI.Shop_Items_SlotWnd
-- ----------------------------------------------------------------------------

UI.Shop_Items_SlotWnd = {}
local sis = UI.Shop_Items_SlotWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.Shop_Items_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "Shop_Items_SlotWnd",
		isPrototype		= true,
	},
}

-- --------------------------------------
-- interface funcitons
-- --------------------------------------

--
function UI.Shop_Items_SlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.PRICE_VAL )
	self:SetLayerVisible( false, self.layers.RANK_REQUIRED )
	self:SetLayerVisible( false, self.layers.MOUSE_OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.NEW_EFFECT )

	self:SetText( "", self.layers.NAME )

	self.itemIcoWnd:Reset()

	-- TODO: хак, сделать красивое наследование
	if self.mode == self.modes.FULL then

		self:SetText( "", self.layers.DESC )
		self:RemoveControl( self.itemTypeWnd, self.layers.MAIN_EFFECT )

	end

	if self.priceMetaText then
		self.priceMetaText:SetText( "", true )
	end

	self:SetLayerVisible( false, self.layers.COUNT )
	self.countMetaText:SetText( "", true )

end


--
function UI.Shop_Items_SlotWnd:Select( bSelect, bAnimated )

	local data = self:GetRecordData()

	self:UpdateMainAnimation( data )
	self:UpdateIcoAnimation( data )
	self:UpdateDesc( data )	-- из-за того, что цвет текста меняется для выделенного слота, и при этом внутрь описания вставляются цветные подстроки, приходится обновлять всю строку

end


--
function UI.Shop_Items_SlotWnd:OnCountChanged()

	local data = self:GetRecordData()
	self:UpdateCount( data )

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
		self:UpdateInactiveEffect( data )
		self:UpdatePrice( data )	
	end

end


--
function UI.Shop_Items_SlotWnd:OnPlayerCreditsChanged()

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.BUY then
		return
	end

	local data = self:GetRecordData()

	self:UpdateMainAnimation( data )
	self:UpdateInactiveEffect( data )
	self:UpdatePrice( data )	

end


--
function UI.Shop_Items_SlotWnd:OnAccountRankChanged()

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.BUY then
		return
	end

	local data = self:GetRecordData()
	self:UpdatePrice( data )	

end


--
function UI.Shop_Items_SlotWnd:OnAccountAurasChanged()

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.BUY then
		return
	end

	local data = self:GetRecordData()

	self:UpdatePrice( data )	
	self:UpdateItemType( data )
	self:UpdateSaleState( data )

end


--
function UI.Shop_Items_SlotWnd:OnInBattleStateChanged()

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.SELL then
		return
	end

	local data = self:GetRecordData()

	self:UpdateInBattleEffect( data )	
	self:UpdateInactiveEffect( data )

end


--
function UI.Shop_Items_SlotWnd:OnSelShipItemChanged()

	local data = self:GetRecordData()
	self:UpdateTooltip( data )

end


--
function UI.Shop_Items_SlotWnd:ShowUpgradeItemWowEffect()

	self.itemIcoWnd:ShowUpgradeItemWowEffect()

end


-- --------------------------------------
-- const
-- --------------------------------------

sis.effectInfo =
{
	main =
	{
		itemTypeObjName				= "type",
		itemTypeObjName_sale		= "type_2",
		itemTypeObjName_new			= "type_3",
		animUnsel					= "idle",
		animSel						= "select",
		itemIcoObjName				= "icon",
		priceLocator				= "price",
		priceLocator_sale			= "price_2",
		soldLocator					= "text",
		soldLocator_sale			= "text_2",
	},

	price =
	{
		animIdle		= "idle",
		animNoMoney		= "nomaney",
		animSale		= "sale",
		valLocator		= "price",
		baseValLocator	= "price_sale",
		saleValLocator	= "price_new",
	},	

	priceIco =
	{
		animCredits			= "money",
		animCreditsPremium	= "gold",
	},

	countSell =
	{
		animInventory	= "in_warehouse",
		animEquipped	= "set",
	},

	new =
	{
		anim_ru = "new_ru",
		anim_en = "new_en",
	}
}

sis.ITEM_SLOT = true

sis.modes =
{
	FULL	= 1,
	BRIEF	= 2,
}

-- --------------------------------------
-- vars
-- --------------------------------------

sys.itemIcoWnd		= nil
sis.itemTypeWnd		= nil
sis.mode			= -1
sis.priceMetaText	= nil
sis.countMetaText	= nil

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.Shop_Items_SlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL ) 

	self.countMetaText = UI.MetaText.GetNewInstance()
	self.countMetaText:InitFromLayer( self, self.layers.COUNT ) 

	self:Reset()

end


--
function UI.Shop_Items_SlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.countMetaText then
		self.countMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Shop_Items_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Shop_Items_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Shop_Items_SlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )
	self.countMetaText:UpdateScreenOrgFromLayer( self, self.layers.COUNT )

end


--
function UI.Shop_Items_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.COUNT then
		self.countMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Shop_Items_SlotWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

	self.itemIcoWnd.ITEM_CONTROL = true
	self:AddControl( self.itemIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.itemIcoObjName )

	if self.mode == self.modes.FULL then
    	self.itemTypeWnd = UI:CreateChildWnd( self, UI.ItemControl_ItemTypeWnd, "" )
	end

end


--
function UI.Shop_Items_SlotWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.Shop_Items_SlotWnd:RemoveControl( wnd, effectLayer )

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
function UI.Shop_Items_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateMainAnimation( data )
	self:UpdateName( data )
	self:UpdateIcoAnimation( data )
	self:UpdateItemIco( data )
	self:UpdateShipTypeAndTier( data )
	self:UpdatePrice( data )
	self:UpdateTooltip( data )
    self:UpdateCount( data )
	self:UpdateInBattleEffect( data )
	self:UpdateInactiveEffect( data )
	self:UpdateMouseOverState()
	self:UpdateNewState( data )

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
		self:UpdateSaleState( data )
	end

	if self.mode == self.modes.FULL then

    	self:UpdateDesc( data )
    	self:UpdateItemType( data )

	end

end


--
function UI.Shop_Items_SlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()

	local anim = isSelected and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel
	mainEffect:StartAnimation( anim )

end


--
function UI.Shop_Items_SlotWnd:UpdateIcoAnimation( data )

	local isSelected = self:IsSelected()

	if isSelected then
		self.itemIcoWnd:AnimateIcoSel()
	else
		self.itemIcoWnd:AnimateIcoIdle()
	end

end


--
function UI.Shop_Items_SlotWnd:UpdateInactiveEffect( data )

	local bActive = true

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
		local unavailableReason = UI.ShopWnd:GetItemUnavailableReason( data.item )
		bActive = unavailableReason == UI.ShopWnd.itemUnavailableReasons.NONE or unavailableReason == UI.ShopWnd.itemUnavailableReasons.BUY_RANK

	elseif UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.SELL then
		bActive = not UI.ShopWnd:IsItemInBattle( data.item ) and not UI.ShopWnd:IsItemOnShipQuest( data.item )
	end

	self:SetLayerVisible( not bActive, self.layers.INACTIVE_EFFECT )

end


--
function UI.Shop_Items_SlotWnd:UpdateName( data )
	-- to override
end


--
function UI.Shop_Items_SlotWnd:UpdateDesc( data )

	if self.mode ~= self.modes.FULL then
		return
	end

	local desc = ""

	if data then

		if UI:IsDefTokenItem( data.item.defName ) then

			local color = self:GetColor( self.layers.DESC )
			local fitModulesInfos = UI:GetTokenItemAllSrcInventoryInfo( data.item.defName, false )

			desc = UI:TokenItemSrcInventoryInfo2Str( fitModulesInfos, color, true, true, true )

		elseif UI:IsDefModule( data.item.defName ) or UI:IsDefAmmo( data.item.defName ) then
			desc = UI:GetItemDescEx( { defName = data.item.defName }, nil, UI.TEXT_SEL_COLOR, self:GetColor( self.layers.DESC ) )

		else
    		desc = UI:GetEntityDescByDef( data.item.defName )
    	end

	end
	
	if desc ~= "" then
		desc = UI:GetCutTextWithEllipsesMultiline( desc, self:GetLayerRect( self.layers.DESC ), self:GetFont( self.layers.DESC ), self:GetTextFormatFlags( self.layers.DESC ) )
	end

	self:SetDescText( desc )

end


--
function UI.Shop_Items_SlotWnd:SetDescText( text )

	self:SetText( text, self.layers.DESC )

end


--
function UI.Shop_Items_SlotWnd:UpdateItemIco( data )

	local bEnchanted = false

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.SELL then
		if data.item.iids then
			local idx, iid = next( data.item.iids )
			if iid then
				bEnchanted = UI:IsInventoryItemEnchantedById( iid )
			end
		end		
	end

	self.itemIcoWnd:SetupForItem( data.item.defName, bEnchanted )
end


--
function UI.Shop_Items_SlotWnd:UpdateShipTypeAndTier( data )
	
	self.itemIcoWnd:SetupRank( data.item.defName, true, nil )

end


--
function UI.Shop_Items_SlotWnd:UpdatePrice( data )

	self.priceMetaText:SetText( "", true )

	self:SetLayerVisible( false, self.layers.PRICE_VAL )
	self:SetLayerVisible( false, self.layers.RANK_REQUIRED )	

	local bRankFit = true
	local itemRank = -1

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
		itemRank = UI:GetItemRequiredAccountRank( data.item.defName )
	end		

	if itemRank ~= -1 then
		local playerRank = UI:GetPlayerAccountRank()
		bRankFit = playerRank >= itemRank
	end

	-- цена

	if bRankFit then

		self:SetLayerVisible( true, self.layers.PRICE_VAL )

		local strPrice = ""	

    	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then	

    		local priceInfos = {}
			
			local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAlt( data.item )
			
			local priceInfo =
			{
				priceType	= priceType,
				val			= price,
				bIsBuyPrice	= true,
				basePrice	= basePrice,
			}
			table.insert( priceInfos, priceInfo )
			
			
			if altPriceType then
			
				local altPriceInfo =
				{
					priceType	= altPriceType,
					val			= altPrice,
					bIsBuyPrice	= true,
					basePrice	= altBasePrice,
				}
				table.insert( priceInfos, altPriceInfo )

			end

    		strPrice = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE_VAL ), true, nil, true, nil )


    	elseif UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.SELL then	

			local price, bGold = UI:GetShopSellPriceByDef( data.item.defName )

			local sellPriceInfo = {}

			sellPriceInfo.priceType		= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
			sellPriceInfo.val			= price
			sellPriceInfo.bIsBuyPrice	= false

			strPrice = UI:PriceInfo2Str( sellPriceInfo, self:GetColor( self.layers.PRICE_VAL ), nil, nil, true, nil )

		end

		-- позиция - зависит от наличия иконки скидки

		if self.mode == self.modes.FULL then

			local bIsSaleEffect = UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY and UI:IsItemSale( data.item )

        	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
        	if mainEffect then

    			mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.PRICE_VAL, "" )
    			mainEffect:LinkLayer( self:GetUiHandle(), self.layers.PRICE_VAL, bIsSaleEffect and self.effectInfo.main.priceLocator_sale or self.effectInfo.main.priceLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )

    			if self:IsOnScreen() then
    				self:UpdateMetaTextPos()
    			end

    		end

		end     

		self.priceMetaText:SetText( strPrice, true )

	-- требуемый ранг
	else

		self:SetLayerVisible( true, self.layers.RANK_REQUIRED )	

		local str = UI:GetStringByName( "shop_requiredRank" )
		str = string.gsub( str, "%$rank%$", tostring( itemRank ) )

		self:SetText( str, self.layers.RANK_REQUIRED )
		
	end

end


--
function UI.Shop_Items_SlotWnd:UpdateTooltip( data )

	local tooltipData = nil

	if UI:IsDefModule( data.item.defName ) or UI:IsDefAmmo( data.item.defName ) then
	
		tooltipData = {}
    	tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
    	tooltipData.defName				= data.item.defName
    	tooltipData.iid					= UI.INVALID_U64_ID
    	tooltipData.isSelected			= false
		tooltipData.dstShipData			= nil
		tooltipData.compareShipData		= nil
		tooltipData.bEnchanted			= false

    	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.SELL then

    		if data.item.iids and #data.item.iids == 1 then
    			tooltipData.iid = data.item.iids[ 1 ]
    		end

        	local bEnchanted = false

           	if data.item.iids then
           		local idx, iid = next( data.item.iids )
           		if iid then
           			bEnchanted = UI:IsInventoryItemEnchantedById( iid )
           		end
           	end		        	                      

			tooltipData.bEnchanted = bEnchanted

    	end

		local selShipItem = UI.ShopWnd:GetSelShipItem()
		if selShipItem then
			tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
		end

	else
		tooltipData = UI:GetTooltipForItem( data.item.defName )
	end

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Shop_Items_SlotWnd:UpdateCount( data )

	self.countMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.COUNT )


	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then

		if self.mode == self.modes.FULL then

	    	self:SetLayerVisible( true, self.layers.COUNT )
			local str = ""

    		if UI:IsDefResource( data.item.defName ) or UI:IsDefBlueprint( data.item.defName ) then

				local count		= UI:GetPlayerResourceCount( data.item.defName )
				local maxCount	= UI:GetPlayerResourceMaxCount( data.item.defName )

				str = UI:MakeItemStorageString( true, count, maxCount, 0, nil, true, self:GetColor( self.layers.COUNT ) )
    		
    		else

    	        local countInventory, countEquipped = UI.ShopWnd:GetStoreItemCount( data.item )
				str = UI:MakeItemStorageString( true, countInventory, -1, countEquipped, nil, true, self:GetColor( self.layers.COUNT ) )

    		end

			self.countMetaText:SetText( str, true )

		end

	else

	    self:SetLayerVisible( true, self.layers.COUNT )
		local str = ""

		local bStacked = not UI:IsDefModule( data.item.defName ) and data.item.equipShipItem == nil

		if bStacked then

			local maxCount = -1
	    	if UI:IsDefResource( data.item.defName ) or UI:IsDefBlueprint( data.item.defName ) then
				maxCount = UI:GetPlayerResourceMaxCount( data.item.defName )
			end

			str = UI:MakeItemStorageString( true, data.item.count, maxCount, 0, nil, true, self:GetColor( self.layers.COUNT ) )

		else
			str = UI:MakeItemStorageString( false, nil, nil, nil, data.item.equipShipItem, true, self:GetColor( self.layers.COUNT ) )
		end

		self.countMetaText:SetText( str, true )

	end

end


--
function UI.Shop_Items_SlotWnd:UpdateItemType( data )

	if self.mode ~= self.modes.FULL then
		return
	end
	
	local itemType= nil

	if UI:IsDefModule( data.item.defName ) then
		itemType = UI:GetModuleType( data.item.defName )
	end

	if itemType then

    	local bSale = false
    	local bNew = false

    	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
    		bSale = UI:IsItemSale( data.item )
    		bNew = UI:IsItemNew( data.item )
    	end

    	local locator = self.effectInfo.main.itemTypeObjName

		-- #0045869(0175551) - утверждается, что sale и new одновременно не могут быть
		if bSale then
			locator = self.effectInfo.main.itemTypeObjName_sale
		elseif bNew then
			locator = self.effectInfo.main.itemTypeObjName_new
		end

		self:AddControl( self.itemTypeWnd, self.layers.MAIN_EFFECT, locator )
		self.itemTypeWnd:Setup( itemType )

	else
		self:RemoveControl( self.itemTypeWnd, self.layers.MAIN_EFFECT )
	end

end


--
function UI.Shop_Items_SlotWnd:UpdateSaleState( data )

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.BUY then
		return
	end

	local isSale = UI:IsItemSale( data.item )
	self:SetLayerVisible( isSale, self.layers.SALE_EFFECT )

end


--
function UI.Shop_Items_SlotWnd:UpdateInBattleEffect( data )

	if UI.ShopWnd.tradeMode ~= UI.ShopWnd.tradeModes.SELL then
		return
	end

	self.itemIcoWnd:HideInBattleEffect()
	self.itemIcoWnd:HideInBattleText()
	self.itemIcoWnd:HideOnShipQuestEffect()

	if UI.ShopWnd:IsItemInBattle( data.item ) then
		self.itemIcoWnd:ShowInBattleEffect()
		self.itemIcoWnd:ShowInBattleText()

	elseif UI.ShopWnd:IsItemOnShipQuest( data.item ) then
		self.itemIcoWnd:ShowOnShipQuestEffect()
	end	

end


--
function UI.Shop_Items_SlotWnd:UpdateNewState( data )

	local bNew = false

	if UI.ShopWnd.tradeMode == UI.ShopWnd.tradeModes.BUY then
		bNew = UI:IsItemNew( data.item )
	end

	if bNew then

		self:SetLayerVisible( true, self.layers.NEW_EFFECT )

    	local newEffect = UI:GetEffectFromLayer( self, self.layers.NEW_EFFECT )
    	if newEffect then

    		local bRussian = UI:GetLanguage() == "RUSSIAN"
    		local anim = bRussian and self.effectInfo.new.anim_ru or self.effectInfo.new.anim_en

    		newEffect:StartAnimation( anim )					

    	end

	else
		self:SetLayerVisible( false, self.layers.NEW_EFFECT )
	end

end


--
function UI.Shop_Items_SlotWnd:UpdateMouseOverState()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse and wndUnderMouse == self or wndUnderMouse:IsChildOf( self )
	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShopWnd.sounds.itemMouseOver )
	end

end


--
function UI.Shop_Items_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOverState()
	return true

end


--
function UI.Shop_Items_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOverState()
	return true	

end

-- ----------------------------------------------------------------------------
-- UI.Shop_ItemsListWnd
-- ----------------------------------------------------------------------------

UI.Shop_ItemsListWnd = {}
local sil = UI.Shop_ItemsListWnd

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Shop_ItemsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "Shop_ItemsListWnd",
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
				defName 			= "shop_itemsList",
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

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Shop_ItemsListWnd:AddSelectedRecord( recordIdx, bEnsureVisible )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_ItemsListWnd:AddSelectedRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if bEnsureVisible ~= nil then
    	if type( bEnsureVisible ) ~= "boolean" then
    		sys.log( "UI.Shop_ItemsListWnd:AddSelectedRecord()[ERROR]: invalid type of the 2-nd parameter (\"bEnsureVisible\"), \"boolean\" or \"nil\" expected, got \"%s\"", type( bEnsureVisible ) )
    		bEnsureVisible = nil
    	end
	end

	if bEnsureVisible == nil then
    	bEnsureVisible = true
	end

	if self:IsRecordSelected( recordIdx ) then
		return
	end

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		sys.log( "UI.Shop_ItemsListWnd:AddSelectedRecord()[ERROR]: invalid recordIdx %d; from 1 to %d expected", recordIdx, self:GetNumRecords() )
		return
	end

	self:SelectRecordsInternal( { [ recordIdx ] = true }, true )

	if bEnsureVisible then
		self:EnsureRecordIsVisible_adaptVisibleRange( recordIdx, false )
	end

end


--
function UI.Shop_ItemsListWnd:RemoveSelectedRecord( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_ItemsListWnd:RemoveSelectedRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if not self:IsRecordSelected( recordIdx ) then
		return
	end

	self:SelectRecordsInternal( { [ recordIdx ] = true }, false )

end


--
function UI.Shop_ItemsListWnd:ResetSelectedRecords()

	if not next( self.selectedRecords ) then
		return
	end

	self:SelectRecordsInternal( self.selectedRecords, false )

end


--
function UI.Shop_ItemsListWnd:GetSelectedRecords()

	return self.selectedRecords

end


--
function UI.Shop_ItemsListWnd:GetNumSelectedRecords()

	return UI:GetTableLength( self.selectedRecords )

end


--
function UI.Shop_ItemsListWnd:IsRecordSelected( recordIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_ItemsListWnd:IsRecordSelected()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return false
	end

	return self.selectedRecords[ recordIdx ] == true

end


--
function UI.Shop_ItemsListWnd:SelectSingleRecord( recordIdx, bEnsureVisible )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_ItemsListWnd:SelectSingleRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if bEnsureVisible ~= nil then
    	if type( bEnsureVisible ) ~= "boolean" then
    		sys.log( "UI.Shop_GridWnd:SelectSingleRecord()[ERROR]: invalid type of the 2-nd parameter (\"bEnsureVisible\"), \"boolean\" expected, got \"%s\"", type( bEnsureVisible ) )
			bEnsureVisible = nil
    	end
	end

	if bEnsureVisible == nil then
		bEnsureVisible = true
	end

	if recordIdx == -1 then
		if self:GetNumSelectedRecords() == 0 then
			return
		end
	else
		if self:GetSingleSelectedRecord() == recordIdx then
			return
		end
	end

	self:ResetSelectedRecords()

	if recordIdx ~= -1 then
		self:AddSelectedRecord( recordIdx, bEnsureVisible )
	end

end


--
function UI.Shop_ItemsListWnd:GetSingleSelectedRecord()

	if self:GetNumSelectedRecords() ~= 1 then
		return -1
	end

	local selRecords = self:GetSelectedRecords()
	local recordIdx, dummy = next( selRecords )

	return recordIdx

end


--
function UI.Shop_ItemsListWnd:SelectRecord( recordIdx, bAnimated )

	sys.log( "UI.Shop_ItemsListWnd:SelectRecord()[ERROR]: not supported" )

end


--
function UI.Shop_ItemsListWnd:GetSelectedRecord()

	sys.log( "UI.Shop_ItemsListWnd:GetSelectedRecord()[ERROR]: not supported" )
	return -1

end


--
function UI.Shop_ItemsListWnd:Clear()

	self:ResetSelectedRecords()
	UI.ButtonsList3Wnd.Clear( self )

end


-- -----------------------------------------
-- const
-- -----------------------------------------

sil.btnPrototypeName = "Shop_ItemsList_SlotWnd"

sil.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

sil.MAX_SLOTS = 5

sil.listStyle = UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Shop_ItemsListWnd.selectedRecords	= {}

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Shop_ItemsListWnd:SelectRecordsInternal( records, bSelect )

	local bChanged = false

	for recordIdx, dummy in pairs( records ) do

    	local bWasSelected = self.selectedRecords[ recordIdx ] == true
    	if bSelect ~= bWasSelected then

        	if bSelect then
        		self.selectedRecords[ recordIdx ] = true
        	else
        		self.selectedRecords[ recordIdx ] = nil
        	end

        	local slotWnd = self:GetButtonForRecord( recordIdx )
        	if slotWnd then
        		slotWnd:Select( bSelect, false )
        	end

			bChanged = true

		end

	end

	if bChanged then
		self:NotifyOnSelectionChanged()
	end

end


--
function UI.Shop_ItemsListWnd:NotifyOnSelectionChanged()

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, -1, -1, 1, 0 )

end


-- ----------------------------------------------------------------------------
-- UI.Shop_ItemsList_SlotWnd
-- ----------------------------------------------------------------------------

UI.Shop_ItemsList_SlotWnd = {}
local sils = UI.Shop_ItemsList_SlotWnd

sils.layers =
{
    MAIN_EFFECT			= 0,
    SALE_EFFECT			= 1,
    NAME				= 2,
    DESC				= 3,
    COUNT				= 4,
    PRICE_VAL			= 5,
	RANK_REQUIRED		= 6,
	NEW_EFFECT			= 7,
	INACTIVE_EFFECT		= 8,
	MOUSE_OVER_EFFECT	= 9,
}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.Shop_ItemsList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "Shop_Items_SlotWnd",

	props =
	{
		name			= "Shop_ItemsList_SlotWnd",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = sils.layers.INACTIVE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shop_itemsList_slot_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "product_name",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS,	-- по позиции линкуется к другому локатору
					},
					
					{
						objName		= "fraction",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "description",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sale",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по цвету; цвет красный
					{
						objName		= "text",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.RANK_REQUIRED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "labe",
						layer		= "UI.Shop_ItemsList_SlotWnd.layers.NEW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsList_slot_sale",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- DESC
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 2, 5 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- COUNT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  

		-- PRICE_VAL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- RANK_REQUIRED
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			color		= UI.PARAM_DELTA_MINUS_COLOR,
		},

		-- NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "ships_shipSlot_action",
			}}
		},

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shop_itemsList_slot_inactive",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shop_itemsList_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.Shop_ItemsList_SlotWnd:IsSelected()	

	local list = self:GetList()
	if not list then
		return false
	end

	return list:IsRecordSelected( self:GetRecord() )

end


-- --------------------------------------
-- const
-- --------------------------------------

sils.ITEM_LIST_SLOT	= true
sils.mode			= sis.modes.FULL

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.Shop_ItemsList_SlotWnd:UpdateName( data )

	self:SetText( UI:GetEntityLocalizedNameByDef( data.item.defName, true, false ), self.layers.NAME )

end    


-- ----------------------------------------------------------------------------
-- UI.Shop_GridWnd
-- ----------------------------------------------------------------------------

UI.Shop_GridWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Shop_GridWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "Shop_GridWnd",
		isPrototype		= true,
	},
} 

-- ------------------------------------
-- interface funcitons
-- ------------------------------------

--
function UI.Shop_GridWnd:Clear()

	self:ResetSelectedSlots()
	UI.ButtonsList3Wnd.Clear( self )

end


--
function UI.Shop_GridWnd:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowData = self:GetRecordData( recordIdx )

	if rowData and rowData.slots then
		return #rowData.slots
	else
		return 0
	end

end


--
function UI.Shop_GridWnd:GetMaxSlotForRecord()

	local hProtoSlotWnd = UI:GetPrototypeByName( self.btnPrototypeName )
	local protoSlotWnd = UI:GetUiObjByHandleT( hProtoSlotWnd ) 

	return protoSlotWnd.MAX_SLOTS

end


--
function UI.Shop_GridWnd:AddSelectedSlot( recordIdx, slotIdx, bEnsureVisible )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:AddSelectedSlot()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:AddSelectedSlot()[ERROR]: invalid type of the 2-nd parameter (\"slotIdx\"), \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	if bEnsureVisible ~= nil then
    	if type( bEnsureVisible ) ~= "boolean" then
    		sys.log( "UI.Shop_GridWnd:AddSelectedSlot()[ERROR]: invalid type of the 3-rd parameter (\"bEnsureVisible\"), \"boolean\" or \"nil\" expected, got \"%s\"", type( bEnsureVisible ) )
    		bEnsureVisible = nil
    	end
	end

	if bEnsureVisible == nil then
    	bEnsureVisible = true
	end

	if self:IsSlotSelected( recordIdx, slotIdx ) then
		return
	end

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		sys.log( "UI.Shop_GridWnd:AddSelectedSlot()[ERROR]: invalid recordIdx %d; from 1 to %d expected", recordIdx, self:GetNumRecords() )
		return
	end

	local numRowSlots = 0

	local rowData = self:GetRecordData( recordIdx )
	if rowData and type( rowData.slots ) == "table" then
		numRowSlots = #rowData.slots
	end	

	if slotIdx < 1 or slotIdx > numRowSlots then
		sys.log( "UI.Shop_GridWnd:AddSelectedSlot()[ERROR]: invalid slotIdx %d for record %d; from 1 to %d expected", slotIdx, recordIdx, numRowSlots )
		return
	end

	self:SelectSlotsInternal( { [ recordIdx ] = { [ slotIdx ] = true } }, true )

	if bEnsureVisible then
		self:EnsureRecordIsVisible_adaptVisibleRange( recordIdx, false )
	end

end


--
function UI.Shop_GridWnd:RemoveSelectedSlot( recordIdx, slotIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:RemoveSelectedRecord()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:RemoveSelectedSlot()[ERROR]: invalid type of the 2-nd parameter (\"slotIdx\"), \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	if not self:IsSlotSelected( recordIdx, slotIdx ) then
		return
	end

	self:SelectSlotsInternal( { [ recordIdx ] = { [ slotIdx ] = true } }, false )

end


--
function UI.Shop_GridWnd:ResetSelectedSlots()

	if not next( self.selectedSlots ) then
		return
	end

	self:SelectSlotsInternal( self.selectedSlots, false )

end


--
function UI.Shop_GridWnd:GetSelectedSlots()

	return self.selectedSlots

end


--
function UI.Shop_GridWnd:GetNumSelectedSlots()

	local numSlots = 0

	for recordIdx, slots in pairs( self.selectedSlots ) do
		numSlots = numSlots + UI:GetTableLength( slots )
	end

	return numSlots

end


--
function UI.Shop_GridWnd:IsSlotSelected( recordIdx, slotIdx )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:IsSlotSelected()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return false
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:IsSlotSelected()[ERROR]: invalid type of the 2-nd parameter (\"slotIdx\"), \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	return self.selectedSlots[ recordIdx ] ~= nil and self.selectedSlots[ recordIdx ][ slotIdx ] == true

end


--
function UI.Shop_GridWnd:SelectSingleSlot( recordIdx, slotIdx, bEnsureVisible )

	if type( recordIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:SelectSingleSlot()[ERROR]: invalid type of the 1-st parameter (\"recordIdx\"), \"number\" expected, got \"%s\"", type( recordIdx ) )
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.Shop_GridWnd:SelectSingleSlot()[ERROR]: invalid type of the 2-nd parameter (\"slotIdx\"), \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	if bEnsureVisible ~= nil then
    	if type( bEnsureVisible ) ~= "boolean" then
    		sys.log( "UI.Shop_GridWnd:SelectSingleSlot()[ERROR]: invalid type of the 3-rd parameter (\"bEnsureVisible\"), \"boolean\" expected, got \"%s\"", type( bEnsureVisible ) )
			bEnsureVisible = nil
    	end
	end

	if bEnsureVisible == nil then
		bEnsureVisible = true
	end

	if recordIdx == -1 and slotIdx == -1 then
		if self:GetSelectedSlots() == 0 then
			return
		end
	else
		local oldRecordIdx, oldSlotIdx = self:GetSingleSelectedSlot() 
		if recordIdx == oldRecordIdx and slotIdx == oldSlotIdx then
			return
		end
	end

	self:ResetSelectedSlots()

	if recordIdx ~= -1 and slotIdx ~= -1 then
		self:AddSelectedSlot( recordIdx, slotIdx, bEnsureVisible )
	end

end


--
function UI.Shop_GridWnd:GetSingleSelectedSlot()

	if self:GetNumSelectedSlots() ~= 1 then
		return -1, -1
	end

	local selSlots = self:GetSelectedSlots()

	local recordIdx, recordSlots = next( selSlots )
	local slotIdx, dummy = next( recordSlots )

	return recordIdx, slotIdx

end


--
function UI.Shop_GridWnd:SelectRecord( recordIdx, bAnimated )

	sys.log( "UI.Shop_GridWnd:SelectRecord()[ERROR]: not supported" )

end


--
function UI.Shop_GridWnd:GetSelectedRecord()

	sys.log( "UI.Shop_GridWnd:GetSelectedRecord()[ERROR]: not supported" )
	return -1

end


-- ------------------------------------
-- vars
-- ------------------------------------

UI.Shop_GridWnd.selectedSlots	= {}

-- ------------------------------------
-- work functions
-- ------------------------------------   

--
function UI.Shop_GridWnd:SelectSlotsInternal( slots, bSelect )

	local bChanged = false

	for recordIdx, recordSlots in pairs( slots ) do

		for slotIdx, dummy in pairs( recordSlots ) do

        	local bWasSelected = self.selectedSlots[ recordIdx ] ~= nil and self.selectedSlots[ recordIdx ][ slotIdx ] == true
        	if bSelect ~= bWasSelected then

            	if bSelect then

					if not self.selectedSlots[ recordIdx ] then
						self.selectedSlots[ recordIdx ] = {}
					end

            		self.selectedSlots[ recordIdx ][ slotIdx ] = true

            	else

					if self.selectedSlots[ recordIdx ] then

						self.selectedSlots[ recordIdx ][ slotIdx ] = nil

						if not next( self.selectedSlots[ recordIdx ] ) then
            				self.selectedSlots[ recordIdx ] = nil
						end

					end

            	end

            	local rowWnd = self:GetButtonForRecord( recordIdx )
            	if rowWnd then
					rowWnd:OnSelectSlot( slotIdx )
            	end

    			bChanged = true

    		end

		end

	end

	if bChanged then
		self:NotifyOnSelectionChanged()
	end

end


--
function UI.Shop_GridWnd:NotifyOnSelectionChanged()

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, -1, -1, 1, 0 )

end


-- ----------------------------------------------------------------------------
-- UI.Shop_GridRowWnd
-- ----------------------------------------------------------------------------

UI.Shop_GridRowWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Shop_GridRowWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "Shop_GridRowWnd",
		isPrototype		= true,
	},
}


-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Shop_GridRowWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx, slotWnd in pairs( self.slots ) do

		if slotWnd:IsChildOf( self ) then
		
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()

			if mainEffect then
				mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
			end

		end

	end

end


--
function UI.Shop_GridRowWnd:Select( bSelect, bAnimated )

	self:UpdateSlotSelection()

end


--
function UI.Shop_GridRowWnd:OnSelectSlot( slotIdx )

	self:UpdateSlotSelection()

end


--
function UI.Shop_GridRowWnd:GetSelectedSlots()

	local list = self:GetList()
	if not list then
		return {}
	end

	local selectedSlots = list:GetSelectedSlots()
	return selectedSlots[ self:GetRecord() ] or {}

end


--
function UI.Shop_GridRowWnd:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.Shop_GridRowWnd:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.Shop_GridRowWnd:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Shop_GridRowWnd.slotPrototypeName = ""

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Shop_GridRowWnd.slots		= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Shop_GridRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.Shop_GridRowWnd:CreateSlots()

	local hProtoWnd = UI:GetPrototypeByName( self.slotPrototypeName )
	local protoWnd = UI:GetUiObjByHandleT( hProtoWnd )

	for slotIdx = 1, self.MAX_SLOTS do

		local slotWnd = UI:CreateChildWnd( self, protoWnd, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx, self )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.Shop_GridRowWnd:UpdateForData( data, bAnimated )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, self.MAX_SLOTS do

		local slotWnd = self.slots[ slotIdx ]
		local isVisible = slotWnd:IsChildOf( self )

		local slotData = data.slots[ slotIdx ]

		if slotData then

			if not isVisible then
				local objName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )
				UI:AddChildAndLink( self, slotWnd, mainEffect, objName, UI.EffectAnimParams.POS )
			end

			slotWnd:UpdateForData( slotData, bAnimated )

		else

			if isVisible then

				slotWnd:Reset()
				slotWnd:UnlinkFromParent()

				if mainEffect then
					mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
				end

			end

		end

	end	

	self:UpdateSlotSelection()

end


--
function UI.Shop_GridRowWnd:UpdateSlotSelection()

	local selectedSlots = self:GetSelectedSlots()

	for slotIdx = 1, self.MAX_SLOTS do

		local slotWnd = self.slots[ slotIdx ]

		if slotWnd:IsChildOf( self ) then
			slotWnd:Select( selectedSlots[ slotIdx ] == true )
		end

	end

end


--
function UI.Shop_GridRowWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.Shop_GridRowWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Shop_GridRowWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:UpdateMouseOverState()
		end
	end

end   


-- ----------------------------------------------------------------------------
-- UI.Shop_ItemsGridWnd
-- ----------------------------------------------------------------------------

UI.Shop_ItemsGridWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Shop_ItemsGridWnd.def =
{
	className 	= "Wnd",
	prototype	= "Shop_GridWnd",

	props =
	{
		name			= "Shop_ItemsGridWnd",
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
				defName 			= "shop_itemsGrid",
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
-- ------------------------------------
-- const
-- ------------------------------------

UI.Shop_ItemsGridWnd.btnPrototypeName = "Shop_ItemsGrid_RowWnd"

UI.Shop_ItemsGridWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

UI.Shop_ItemsGridWnd.MAX_SLOTS	= 3
UI.Shop_ItemsGridWnd.listStyle	= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED

-- ----------------------------------------------------------------------------
-- UI.Shop_ItemsGrid_RowWnd
-- ----------------------------------------------------------------------------

UI.Shop_ItemsGrid_RowWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Shop_ItemsGrid_RowWnd.def =
{
	className 	= "Wnd",
	prototype	= "Shop_GridRowWnd",

	props =
	{
		name			= "Shop_ItemsGrid_RowWnd",
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
				defName 			= "shop_itemsGrid_row",
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
-- -----------------------------------
-- const
-- -----------------------------------

UI.Shop_ItemsGrid_RowWnd.effectInfo =
{
	main =
	{
		slotPrefix	= "slot_"
	}
}

UI.Shop_ItemsGrid_RowWnd.MAX_SLOTS = 4
UI.Shop_ItemsGrid_RowWnd.slotPrototypeName = "Shop_ItemsGrid_SlotWnd"

-- ----------------------------------------------------------------------------
-- UI.Shop_ItemsGrid_SlotWnd
-- ----------------------------------------------------------------------------

UI.Shop_ItemsGrid_SlotWnd = {}
local sigs = UI.Shop_ItemsGrid_SlotWnd

sigs.layers =
{
    MAIN_EFFECT				= 0,
    SALE_EFFECT				= 1,
    NAME					= 2,
    PRICE_VAL				= 3,
	RANK_REQUIRED			= 4,
	COUNT					= 5,
	NEW_EFFECT				= 6,
	INACTIVE_EFFECT			= 7,
	MOUSE_OVER_EFFECT		= 8,
}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.Shop_ItemsGrid_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "Shop_Items_SlotWnd",

	props =
	{
		name			= "Shop_ItemsGrid_SlotWnd",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = sigs.layers.INACTIVE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shop_itemsGrid_slot_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "product_name",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "sale",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по цвету; цвет красный
					{
						objName		= "text",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.RANK_REQUIRED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count_2",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "labe",
						layer		= "UI.Shop_ItemsGrid_SlotWnd.layers.NEW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsGrid_slot_sale",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 3, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PRICE_VAL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- RANK_REQUIRED
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			color	= UI.PARAM_DELTA_MINUS_COLOR,
		},

		-- COUNT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  

		-- NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "ships_shipSlot_action",
			}}
		},

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shop_itemsGrid_slot_inactive",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shop_itemsGrid_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- --------------------------------------
-- interface funcitons
-- --------------------------------------

--
function UI.Shop_ItemsGrid_SlotWnd:GetRecord()

	return self.slotIdx

end


--
function UI.Shop_ItemsGrid_SlotWnd:Update( bAnimated )
	
	sys.log( "UI.Shop_ItemsGrid_SlotWnd:Update()[ERROR]: not supported" )

end


--
function UI.Shop_ItemsGrid_SlotWnd:IsSelected()

	if not self.parent then
		return false
	end

	return self.parent:GetSelectedSlots()[ self.slotIdx ] == true

end


-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.Shop_ItemsGrid_SlotWnd:GetRecordData()

	if not self.parent then
		return nil
	end

	return self.parent:GetSlotData( self.slotIdx )

end


--
function UI.Shop_ItemsGrid_SlotWnd:GetList()

	sys.log( "UI.Shop_ItemsGrid_SlotWnd:GetList()[ERROR]: not supported" )
	return nil

end


--
function UI.Shop_ItemsGrid_SlotWnd:UpdateName( data )

	local color = UI:GetItemColor( data.item.defName )
	local strColor = UI:Color2Str( color )

	local str = UI:GetCutTextWithEllipsesMultiline( UI:GetEntityLocalizedNameByDef( data.item.defName, true ), self:GetLayerRect( self.layers.NAME ), self:GetFont( self.layers.NAME ), self:GetTextFormatFlags( self.layers.NAME ) )
	self:SetText( str, self.layers.NAME )

end    


-- --------------------------------------
-- const
-- --------------------------------------

sigs.ITEM_GRID_SLOT	= true
sigs.mode			= sis.modes.BRIEF

-- -------------------------------------------------------------------
-- UI.Shop_TradeBtn
-- -------------------------------------------------------------------

local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Shop_TradeBtn = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.Shop_TradeBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

 	props =
 	{
 		name			= "Shop_TradeBtn",
		selectSound		= UI.sounds.btnMouseOver,
 	},

 	layers =
 	{
		numLayers = l_numBtnBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "shop_buyBtn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Shop_TradeBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}			
		},

		-- TEXT
		{
			id			= l_numBtnBaseLayers,

			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
 	},
}

-- --------------------------------
-- const
-- --------------------------------

UI.Shop_TradeBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
	}
}

UI.Shop_TradeBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.Shop_TradeBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end

-- --------------------------------
-- UI.Shop_SalvageBtn
-- --------------------------------

UI.Shop_SalvageBtn =
{
	def =
	{
    	className = "ButtonWnd",
    	prototype = "TextBtn3",

    	props =
    	{
    		name = "Shop_SalvageBtn"
    	}
	},

	textId = "shop_salvageBtn",
}

-- --------------------------------
-- UI.Shop_CraftBtn
-- --------------------------------

UI.Shop_CraftBtn =
{
	def =
	{
    	className = "ButtonWnd",
    	prototype = "TextBtn3",

    	props =
    	{
    		name = "Shop_CraftBtn"
    	}
	},

	textId = "shop_craftBtn",
}

-- -------------------------------------------------------------------
-- UI.Shop_TradeWnd
-- -------------------------------------------------------------------

UI.Shop_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "Shop_TradeWnd",
    	},
	},

	mainWndName = "ShopWnd",
}


-- -------------------------------------------------------------------
-- UI.Shop_BuyWnd
-- -------------------------------------------------------------------

UI.Shop_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "Shop_BuyWnd",
    	},
	},

	mainWndName = "ShopWnd",
}

-- -------------------------------------------------------------------
-- UI.Shop_BuyWithInventoryWnd
-- -------------------------------------------------------------------

UI.Shop_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "Shop_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "ShopWnd",
}

-- -------------------------------------------------------------------
-- UI.Shop_SalvageWnd
-- -------------------------------------------------------------------

UI.Shop_SalvageWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "SalvageWnd",

    	props =
    	{
    		name	= "Shop_SalvageWnd",
    	},
	},
}


-- -------------------------------------------------------------------
-- UI.Shop_UpgradeItemWnd
-- -------------------------------------------------------------------

UI.Shop_UpgradeItemWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "UpgradeItemWnd",

    	props =
    	{
    		name	= "Shop_UpgradeItemWnd",
    	},
	},

	mainWndName = "ShopWnd",
}


-- ------------------------------------------------------------------------
-- UI.Shop_CrossBtn
-- ------------------------------------------------------------------------

UI.Shop_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Shop_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.Shop_HelpBtn
-- ------------------------------------------------------------------------

UI.Shop_HelpBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "HelpBtn",

		props =
		{
			name	= "Shop_HelpBtn"
		}
	},

	theme = "shop"
}

-- ------------------------------------------------------------------------
-- UI.Shop_SortBtn_Asc
-- ------------------------------------------------------------------------

UI.Shop_SortBtn_Asc =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name	= "Shop_SortBtn_Asc",
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
    				defName 			= "sortBtn_asc",
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
	},

    effectInfo =
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
    		animationIdle 		= "select",
    		animationSelect		= "sel_over",
    		animationPressed	= "sel_over",
    		animationDisabled	= "select",
    	},
    },

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "sortAsc" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

-- ------------------------------------------------------------------------
-- UI.Shop_SortBtn_Desc
-- ------------------------------------------------------------------------

UI.Shop_SortBtn_Desc =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name	= "Shop_SortBtn_Desc",
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
    				defName 			= "sortBtn_desc",
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
	},

    effectInfo =
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
    		animationIdle 		= "select",
    		animationSelect		= "sel_over",
    		animationPressed	= "sel_over",
    		animationDisabled	= "select",
    	},
    },

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "sortDesc" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}



-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBoxWnd
-- ---------------------------------------------------------------------------

UI.Shop_FilterComboBoxWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Shop_FilterComboBoxWnd.def =
{
	className	= "Wnd",
	prototype	= "EffectComboBoxWnd",

	props =
	{
		name		= "Shop_FilterComboBoxWnd",
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
				defName				= "shop_filterComboBox_main",
				defaultAnimation	= "deselect",

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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Shop_FilterComboBoxWnd:Reset()

	UI.EffectComboBoxWnd.Reset( self )
	self.stateBtn:SetTooltipData( nil )

end


--
function UI.Shop_FilterComboBoxWnd:SetTooltipData( tooltipData )

	self.stateBtn:SetTooltipData( tooltipData )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Shop_FilterComboBoxWnd.selItemPrototypeName	= "Shop_FilterComboBox_EditWnd"
UI.Shop_FilterComboBoxWnd.listPrototypeName		= "Shop_FilterComboBox_ListWnd"
UI.Shop_FilterComboBoxWnd.stateBtnPrototypeName	= "Shop_FilterComboBox_StateBtn"

UI.Shop_FilterComboBoxWnd.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ UI.EffectComboBoxWnd.orientations.DONW ]	= "deselect",
			[ UI.EffectComboBoxWnd.orientations.UP ]	= "",
		},

		selItemObjName		= "drop_down_text",
		listObjName			= "list",
		stateBtnObjName		= "drop_down_btn",
	}
}

UI.Shop_FilterComboBoxWnd.MAX_VISIBLE_RECORDS = 16

-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBox_ListWnd
-- ---------------------------------------------------------------------------

UI.Shop_FilterComboBox_ListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ComboBox_ListWnd",

    	props =
    	{
    		name		= "Shop_FilterComboBox_ListWnd",
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
    				defName				= "shop_filterComboBox_list",
					defaultAnimation	= "open",

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

    btnPrototypeName	= "Shop_FilterComboBox_ListSlot",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll",
    		animIdle			= "open",
    	}
    }
}

-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBox_ListSlot
-- ---------------------------------------------------------------------------

UI.Shop_FilterComboBox_ListSlot = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Shop_FilterComboBox_ListSlot.def =
{
	className 	= "Wnd",
	prototype	= "ComboBox_ListSlot",

	props =
	{
		name			= "Shop_FilterComboBox_ListSlot",
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
				defName				= "shop_filterComboBox_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Shop_FilterComboBox_ListSlot.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},
	}
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.Shop_FilterComboBox_ListSlot.effectInfo =
{
	main =
	{
		animUnsel	= "idle",
		animSel		= "select",
		textLocator	= "text",
	}
}

-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBox_EditWnd
-- ---------------------------------------------------------------------------

UI.Shop_FilterComboBox_EditWnd = {}

-- ---------------------------------
-- window definitions
-- ---------------------------------

UI.Shop_FilterComboBox_EditWnd.def =
{   	
 	className	= "EditWnd",
	prototype	= "ComboBox_EditWnd",

 	props =
 	{
 		name		= "Shop_FilterComboBox_EditWnd",
		isPrototype	= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shop_filterComboBox_edit",
				defaultAnimation	= "deselect",

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

-- ---------------------------------
-- const
-- ---------------------------------

UI.Shop_FilterComboBox_EditWnd.effectInfo =
{
	main =
	{
		textObjName				= "login",
		selectionColorObjName	= "select_color",
		cursorColorObjName		= "cursor",
		animActive				= "select",
		animInactive			= "deselect",
	}
}

-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBox_StateBtn
-- ---------------------------------------------------------------------------

UI.Shop_FilterComboBox_StateBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Shop_FilterComboBox_StateBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "ComboBox_StateBtn",

 	props =
 	{
 		name		= "Shop_FilterComboBox_StateBtn",
		isPrototype	= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "shop_filterComboBox_btn",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Shop_FilterComboBox_StateBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Shop_FilterComboBox_StateBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Shop_FilterComboBox_StateBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "disable",
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Shop_FilterComboBox_StateBtn.tooltipData = nil


-- ---------------------------------------------------------------------------
-- UI.Shop_FilterComboBox_Rank, UI.Shop_FilterComboBox_Quality
-- ---------------------------------------------------------------------------

--
UI.Shop_FilterComboBox_Rank =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Shop_FilterComboBoxWnd",

    	props =
    	{
    		name	= "Shop_FilterComboBox_Rank"
    	}
	}
}


--
UI.Shop_FilterComboBox_Quality =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Shop_FilterComboBoxWnd",

    	props =
    	{
    		name	= "Shop_FilterComboBox_Quality"
    	}
	}
}


--
function UI.Shop_FilterComboBox_Quality:F_PostLoad()

	UI.EffectComboBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

end


-- -------------------------------------------------------------------
-- UI.Shop_InventorySizeBtn
-- -------------------------------------------------------------------

UI.Shop_InventorySizeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Shop_InventorySizeBtn",
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
    				defName 			= "equipment_inventorySize_btn",
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
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "idle_over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
    },

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "increaseInventoryTooltip" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- -------------------------------------------------------------------
-- UI.Shop_AutogenInventorySizeBtn
-- -------------------------------------------------------------------

UI.Shop_AutogenInventorySizeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Shop_AutogenInventorySizeBtn",
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
    				defName 			= "equipment_inventorySize_btn",
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
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "idle_over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
    },

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "increaseAutogenInventoryTooltip" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}