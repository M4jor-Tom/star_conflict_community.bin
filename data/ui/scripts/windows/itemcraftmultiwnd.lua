-- ----------------------------------------------------------------------------
--
-- Workfile: itemcraftmultiwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.ItemCraftMultiWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ItemCraftMultiWnd.layers =
{
	MAIN_EFFECT							= 0,
	BG_EFFECT							= 1,
	WORK_EFFECT							= 2,
	CAPTION								= 3,
	PARAMS_WARNING						= 4,
	FILTERS_WORK_EFFECT					= 5,
	FILTERS_WORK_2_EFFECT				= 6,  
	INVENTOTY_SIZE_EFFECT   			= 7, 
	INVENTOTY_SIZE_VAL      			= 8, 
	INVENTOTY_SIZE_VAL_FULL				= 9, 
	PRICE_EFFECT						= 10,
	PRICE								= 11, 
	NO_BLUEPRINTS_EFFECT				= 12, 
	NO_BLUEPRINTS_TEXT					= 13, 
	WAIT_EFFECT							= 14,
	WAIT_TEXT							= 15, 
}

--
UI.ItemCraftMultiWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name	= "ItemCraftMultiWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
	},

	layers =
	{
		firstOverlayLayer = UI.ItemCraftMultiWnd.layers.NO_BLUEPRINTS_EFFECT,

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
						layer		= "UI.ItemCraftMultiWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- legacy from FullScreenSelectionWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemCraft_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.ItemCraftMultiWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",	
						layer		= "UI.ItemCraftMultiWnd.layers.PARAMS_WARNING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "filter",	
						layer		= "UI.ItemCraftMultiWnd.layers.FILTERS_WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "add_slot",	
						layer		= "UI.ItemCraftMultiWnd.layers.INVENTOTY_SIZE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_text",	
						layer		= "UI.ItemCraftMultiWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "resources",	
						wnd			= "UI.ItemCraftMulti_SelItemWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "tree",	
						wnd			= "UI.ItemCraftMulty_CategoriesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "craft_draw_list",	
						wnd			= "UI.ItemCraftMulti_BluePrintsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn",	
						wnd			= "UI.ItemCraftMulti_ActionBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.ItemCraftMulti_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "load_modules",	
						layer		= "UI.ItemCraftMultiWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "craft_draw_list",	
						layer		= "UI.ItemCraftMultiWnd.layers.NO_BLUEPRINTS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_not_found",	
						layer		= "UI.ItemCraftMultiWnd.layers.NO_BLUEPRINTS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "buy_btn8",	
						wnd			= "UI.ItemCraftMulti_TradingBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "button_5",
						wnd			= "UI.ItemCraftMulti_TransferToZoneBtn",
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
			text			= UI:GetStringByName( "itemCraft_caption" )
		},

		-- PARAMS_WARNING
		{
			layerType		= UI.LAYER_TEXT,			            	
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shop_paramsWarning" )
		},

		-- FILTERS_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemCraft_filters_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "slot_4",	
						layer		= "UI.ItemCraftMultiWnd.layers.FILTERS_WORK_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_5",	
						wnd			= "UI.ItemCraftMulti_FilterComboBox_Rank",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "slot_18",
						wnd			= "UI.ItemCraftMulti_FilterCheckBox_CanLearn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- FILTERS_WORK_2_EFFECT
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
						objName		= "slot_1",	
						wnd			= "UI.ItemCraftMulti_FilterCheckBox_FitForSelShip",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_2",	
						wnd			= "UI.ItemCraftMulti_FilterCheckBox_EnoughIngredients",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
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
						wnd			= "UI.ItemCraftMulti_InventorySizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value",	
						layer		= "UI.ItemCraftMultiWnd.layers.INVENTOTY_SIZE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_left",	
						layer		= "UI.ItemCraftMultiWnd.layers.INVENTOTY_SIZE_VAL_FULL",
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

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemCraft_craftPrice",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price13",
						layer		= "UI.ItemCraftMultiWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NO_BLUEPRINTS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemCraft_noBluePrints",
				defaultAnimation	= "idle",
			}}
		},

		-- NO_BLUEPRINTS_TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_noItems" ),
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
						layer		= "UI.ItemCraftMultiWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
			text 			= UI:GetStringByName( "hangar_loading" ),
		},
	},

	children =
	{
		"UI.ItemCraftMulty_CategoriesListWnd",
		"UI.ItemCraftMulti_FilterCheckBox_FitForSelShip",
		"UI.ItemCraftMulti_FilterCheckBox_EnoughIngredients",
		"UI.ItemCraftMulti_FilterCheckBox_CanLearn",
		"UI.ItemCraftMulti_FilterComboBox_Rank",
		"UI.ItemCraftMulti_BluePrintsListWnd",
		"UI.ItemCraftMulti_SelItemWnd",
		"UI.ItemCraftMulti_InventorySizeBtn",
		"UI.ItemCraftMulti_ActionBtn",
		"UI.ItemCraftMulti_CrossBtn",
		"UI.ItemCraftMulti_TradingBtn",
		"UI.ItemCraftMulti_TransferToZoneBtn",
	}
}

-- ------------------------------
-- interface funtions
-- ------------------------------

--
function UI.ItemCraftMultiWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

    if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

			self:UpdateInventorySize()

    		if requestId == self.requestId_buyInventory then
			
        		if self.blueprintToCraftData then
					self:LaunchCraftWnd( self.blueprintToCraftData.defName, self.blueprintToCraftData.bEnchanted, self.blueprintToCraftData.count )
					
				elseif self.itemToBuy then
					self:LaunchTradeWnd( self.itemToBuy )
        		end
				
			end

		end

	else

		if requestId == self.requestId_buyInventory then
    		UI:ShowMsgOnBuyError( result )
		end

	end

	if requestId == self.requestId_buyInventory then

		self.blueprintToCraftData = nil
		self.itemToBuy = nil

		self.requestId_buyInventory = 0
	    self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ItemCraftMulti_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftMulti_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftMulti_CraftConfirmWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateActionBtn()

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftMulti_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ItemCraftMulti_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftMulti_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftMulti_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftMulti_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftMulti_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftMultiWnd:GameStore_OnSpoiled( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self.blueprintToCraftData = nil
	self.itemToBuy = nil

	UI.ItemCraftMulti_BuyWnd:UnlinkFromParent()
	UI.ItemCraftMulti_TradeWnd:UnlinkFromParent()
	UI.ItemCraftMulti_CraftConfirmWnd:UnlinkFromParent()

end


--
function UI.ItemCraftMultiWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()
	self.dataToRestore = self:GetDataToRestore()
	self:FullUpdate()

end


--
function UI.ItemCraftMultiWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.INVENTORY_USER or mode == UI.BuyWnd.modes.INVENTORY_AUTO then
			self:BuyInventory()

		else
			sys.log( "UI.ItemCraftMultiWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
			self.blueprintToCraftData = nil
			self.itemToBuy = nil
		end

	else
		self.blueprintToCraftData = nil
		self.itemToBuy = nil
	end

end  


--
function UI.ItemCraftMultiWnd:OnTradeResult_Buy( shopItem, count, priceType )

	if not UI:IsDefBundle( shopItem.defName ) and not UI:IsDefAmmo( shopItem.defName ) then
		self.requestId_buy = _G.GameStore_Buy( shopItem.id, count, priceType, 1 )	-- #0072739,(0309199) и #0095267,(0439872) - 1 нужна для сбора статистики, 
	else
		self.requestId_buy = _G.GameStore_Buy( shopItem.id, count, priceType )
	end
	
	if self.requestId_buy ~= 0 then

		UI:AddWaitingRequest( self.requestId_buy )
		
		if UI:IsDefBlueprint( shopItem.defName ) then
			self.bWaitingLearnedBlueprints = true
			UI:PlayGlobalSound( self.sounds.learnBlueprint )
		end

	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

    self:UpdateWaitEffect()

end


-- нет самостоятельной подписки, вызывается из UI.HangarWnd
function UI.ItemCraftMultiWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.blueprintToCraftData		= nil
	self.itemToBuy					= nil

    self.requestId_buyInventory		= 0
    self.requestId_learnBlueprint	= 0
    self.requestId_buy				= 0
    self.requestId_craft			= 0
    self.bWaitingLearnedBlueprints	= false
	self.requestId_craftUpgradeItem	= 0
	self.bToCloseAfterEquip			= false
	self.bWaitingInventory			= false
	self.itemToEquipInfo			= nil
	self.requestId_changeMunition	= 0
	self.requestId_changeEquipment	= 0

	if self:IsOnScreen() then
	    self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

	if self.bWaitingLearnedBlueprints then
		self.bWaitingLearnedBlueprints = false
	    self:UpdateWaitEffect()
	end

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateBluePrintsList( true )

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	-- апдейт списка происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_learnBlueprint then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnLearnBlueprintError( result )
    	end

		self.requestId_learnBlueprint = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	-- апдейт списка происходит в F_OnEventInvItemsChanged()

	if requestId ~= 0 and requestId == self.requestId_buy then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnBuyError( result )
    	end

		self.requestId_buy = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:OnCraftWndResult( result, data )

	if result then
		self:DoCraft( data.blueprintDefName, data.bEnchanted, data.count )
	end

end


--
function UI.ItemCraftMultiWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	-- апдейт списка происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_craft then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

    		UI:ShowMsgOnItemCraftError( result )

			self.itemToEquipInfo = nil
			self.bWaitingInventory = false

    	end

		self.requestId_craft = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	-- апдейт списка происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_craftUpgradeItem then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

    		UI:ShowMsgOnItemCraftError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_craftUpgradeItem = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:ShowAndSelectBlueprint( defName )

	if type( defName ) ~= "string" then
		sys.log( "UI.ItemCraftMultiWnd:ShowAndSelectBlueprint()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	self.bLockBlueprintsUpdate = true

	self.categoriesList:SelectMainCategory( "", false, false )

	self.fitForShipCheckBox:Check( false )
	self.enoughIngredientsCheckBox:Check( false )
	self.canLearnCheckBox:Check( false )
	self:SetFilterRank( -1 )

	self.bLockBlueprintsUpdate = false

	self:UpdateBluePrintsList( false )

	local blueprintRecordIdx = self:GetBluePrintRecordByDefName( defName )
	if blueprintRecordIdx ~= -1 then

		self.bluePrintsList:SelectRecord( blueprintRecordIdx )
		self.bluePrintsList:SetScrollPos( blueprintRecordIdx )

	else

		sys.log( "UI.ItemCraftMultiWnd:ShowAndSelectBlueprint( defName )[ERROR]: cannot find record for blueprint \"%s\"", defName )

		if self.bluePrintsList:GetNumRecords() > 0 then
			self.bluePrintsList:SelectRecord( 1 )
		end

	end

end


--
function UI.ItemCraftMultiWnd:SetLaunchData( launchData, dataToRestore )

	if launchData ~= nil then
		if type( launchData ) ~= "table" then
			sys.log( "UI.ItemCraftMultiWnd:SetLaunchData()[ERROR]: invalid type of the 1-st parameter (\"launchData\"); \"table\" or \"nil\" expected, got \"%s\"", type( launchData ) )
			return
		end
	end

	self.launchData		= launchData
    self.dataToRestore	= dataToRestore

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ItemCraftMultiWnd:OnEditMissMouse( editWnd )

	if editWnd:GetUiHandle() == UI:GetKeyboardFocus() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end


--
function UI.ItemCraftMultiWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if self.bWaitingInventory then

		if result ~= 0 then		
			self.bToCloseAfterEquip = false
			self.itemToEquipInfo = nil
		end

		self.bWaitingInventory = false
	    self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	if requestId == self.requestId_changeMunition then

    	if result ~= _G.GameStore.MunitionResult.MR_OK then

    		UI:ShowMessageOnChangeMunitionError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_changeMunition = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	if requestId == self.requestId_changeEquipment then

    	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then

    		UI:ShowMessageOnEquipError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_changeEquipment = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftMultiWnd:OnCraftCountChanged()

	if self.selItemDefName == "" then
		return
	end

	self:UpdatePrice()
	self:UpdateActionBtn()

end


-- показ крафта для ингредиента, необходимого для крафта текущего предмета (продвижение по цепочке крафтов вправо)
function UI.ItemCraftMultiWnd:OnShowIngreditentCraft( data )

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftMultiWnd:OnShowIngreditentCraft()[ERROR]: not on screen" )
		return
	end	

	table.insert( self.prevItems, { defName = self.selItemDefName, bEnchanted = self.bSelItemEnchanted, launchData = self.launchData } )

	self.launchData =
	{
		bItemCraftMulti	= true,
	}

	self:SetSelItem( data.itemDefName, data.bEnchanted, true )

end


-- возвращение к одному из предыдущих крафтов (продвижение по цепочке крафтов влево)
function UI.ItemCraftMultiWnd:OnSelectChainItem( data )

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftMultiWnd:OnSelectChainItem()[ERROR]: not on screen" )
		return
	end

	local selChainItem = self.prevItems[ data.chainIdx ]
	if not selChainItem then
		sys.log( "UI.ItemCraftMultiWnd:OnSelectChainItem()[ERROR]: invalid chain item idx" )
		return		
	end

	for idx = data.chainIdx, #self.prevItems do
		self.prevItems[ idx ] = nil
	end

	self.launchData = selChainItem.launchData

	self:SetSelItem( selChainItem.defName, selChainItem.bEnchanted, true )

end


--
function UI.ItemCraftMultiWnd:HandleEscape()

	self:ReturnToPrevWindow( false )
	return true

end


-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraftMultiWnd.DEFAULT_FILTER_RANK				= -1
UI.ItemCraftMultiWnd.DEFAULT_FILTER_FIT_FOR_SHIP		= false
UI.ItemCraftMultiWnd.DEFAULT_FILTER_ENOUGH_INGREDIENTS	= false
UI.ItemCraftMultiWnd.DEFAULT_FILTER_CAN_LEARN			= false

UI.ItemCraftMultiWnd.effectInfo =
{
	inventorySize =
	{
		btnLocator = "btn"
	},

	craftPrice =
	{
		animDisabled	= "disable",
		animEnabled		= "idle",
	},
}

UI.ItemCraftMultiWnd.sounds =
{
	tradeWndShow				= "sound/ui/btnClick",
	learnBlueprint				= "sound/ui/apply",
	blueprintSlotMouseOver		= "sound/ui/btnMouseOver",
	blueprintSelect				= "sound/ui/btnClick",
	blueprintsScrollRange		= "sound/ui/btnMouseOver",
	craft						= "sound/ui/apply",
	buyInventory				= "sound/ui/apply",
	itemSelect					= UI.sounds.btnClick,
}

UI.ItemCraftMultiWnd.MAX_CRAFT_COUNT	= 99

-- ------------------------------
-- vars
-- ------------------------------

UI.ItemCraftMultiWnd.categoriesList				= nil
UI.ItemCraftMultiWnd.fitForShipCheckBox			= nil
UI.ItemCraftMultiWnd.enoughIngredientsCheckBox	= nil
UI.ItemCraftMultiWnd.canLearnCheckBox			= nil
UI.ItemCraftMultiWnd.ranksComboBox				= nil
UI.ItemCraftMultiWnd.bluePrintsList				= nil
UI.ItemCraftMultiWnd.iventorySizeBtn			= nil
UI.ItemCraftMultiWnd.actionBtn					= nil
UI.ItemCraftMultiWnd.bLockBlueprintsUpdate		= false
UI.ItemCraftMultiWnd.requestId_buyInventory		= 0
UI.ItemCraftMultiWnd.requestId_learnBlueprint	= 0
UI.ItemCraftMultiWnd.requestId_buy				= 0
UI.ItemCraftMultiWnd.requestId_craft			= 0
UI.ItemCraftMultiWnd.bWaitingLearnedBlueprints	= false
UI.ItemCraftMultiWnd.priceMetaText				= nil
UI.ItemCraftMultiWnd.blueprintToCraftData		= nil
UI.ItemCraftMultiWnd.itemToBuy					= nil
UI.ItemCraftMultiWnd.launchData					= nil
UI.ItemCraftMultiWnd.dataToRestore				= nil
UI.ItemCraftMultiWnd.itemToEquipInfo			= nil
UI.ItemCraftMultiWnd.requestId_craftUpgradeItem	= 0
UI.ItemCraftMultiWnd.bToCloseAfterEquip			= false
UI.ItemCraftMultiWnd.bWaitingInventory			= false
UI.ItemCraftMultiWnd.requestId_changeMunition	= 0
UI.ItemCraftMultiWnd.requestId_changeEquipment	= 0
UI.ItemCraftMultiWnd.selItemWnd					= nil
UI.ItemCraftMultiWnd.selItemDefName				= ""
UI.ItemCraftMultiWnd.bSelItemEnchanted			= ""
UI.ItemCraftMultiWnd.prevItems					= {}
UI.ItemCraftMultiWnd.bLockSelItemUpdate			= false
UI.ItemCraftMultiWnd.tradingBtn					= nil
UI.ItemCraftMultiWnd.transferToZoneBtn			= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ItemCraftMultiWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.categoriesList				= UI.ItemCraftMulty_CategoriesListWnd
	self.fitForShipCheckBox			= UI.ItemCraftMulti_FilterCheckBox_FitForSelShip
	self.enoughIngredientsCheckBox	= UI.ItemCraftMulti_FilterCheckBox_EnoughIngredients
	self.canLearnCheckBox			= UI.ItemCraftMulti_FilterCheckBox_CanLearn
	self.ranksComboBox				= UI.ItemCraftMulti_FilterComboBox_Rank
	self.bluePrintsList				= UI.ItemCraftMulti_BluePrintsListWnd
	self.actionBtn					= UI.ItemCraftMulti_ActionBtn
	self.iventorySizeBtn			= UI.ItemCraftMulti_InventorySizeBtn
	self.selItemWnd					= UI.ItemCraftMulti_SelItemWnd
	self.tradingBtn					= UI.ItemCraftMulti_TradingBtn
	self.transferToZoneBtn			= UI.ItemCraftMulti_TransferToZoneBtn

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

	self.fitForShipCheckBox:Setup( nil, UI:GetStringByName( "shop_filters_fitForSelShip" ) )
	self.enoughIngredientsCheckBox:Setup( nil, UI:GetStringByName( "itemCraft_filters_enoughIngredients" ) )
	self.canLearnCheckBox:Setup( nil, UI:GetStringByName( "itemCraft_filters_canLearn" ) )

	self:SetDefaultActivatableChild( self.selItemWnd:GetName() )

	self:Reset()
	self:HideWaitEffect()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )

end


--
function UI.ItemCraftMultiWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraftMultiWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:UpdateWaitEffect()
	self:UpdateMetaTextPos()

end


--
function UI.ItemCraftMultiWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ItemCraftMultiWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ItemCraftMultiWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ItemCraftMultiWnd:Reset()

	self.selItemDefName		= ""
	self.bSelItemEnchanted	= ""
	self.prevItems			= {}

	self:ResetInventorySize()

	self.bLockBlueprintsUpdate = true

	self.categoriesList:Reset()
	self.fitForShipCheckBox:Check( false )
	self.enoughIngredientsCheckBox:Check( false )
	self.canLearnCheckBox:Check( false )
	self.ranksComboBox:Reset()

	self.bLockBlueprintsUpdate = false

	self.bLockSelItemUpdate = true
	self.bluePrintsList:Clear()
	self.bLockSelItemUpdate = false

	self:SetLayerVisible( true, self.layers.NO_BLUEPRINTS_TEXT )
	self:SetLayerVisible( true, self.layers.NO_BLUEPRINTS_EFFECT )

	self:ResetSelItemInfo()

end


--
function UI.ItemCraftMultiWnd:ResetSelItemInfo()

	self.selItemWnd:Reset()
	self:ResetActionBtn()
	self.priceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.PRICE )
	self.tradingBtn:UnlinkFromParent()
	self.transferToZoneBtn:UnlinkFromParent()

end     


--
function UI.ItemCraftMultiWnd:FullUpdate()

	self:Reset()

	self.bLockBlueprintsUpdate = true

	self:UpdateCategories()
	self:ValidateSelCategory()
	self:UpdateFilterRank()

	if self.dataToRestore then

		self.fitForShipCheckBox:Check( self.dataToRestore.filter_fitForShip )
		self.enoughIngredientsCheckBox:Check( self.dataToRestore.filter_enoughIngredients )
		self.canLearnCheckBox:Check( self.dataToRestore.filter_canLearn )
		self:SetFilterRank( self.dataToRestore.filter_rank )

	else

		self.fitForShipCheckBox:Check( self.DEFAULT_FILTER_FIT_FOR_SHIP )
		self.enoughIngredientsCheckBox:Check( self.DEFAULT_FILTER_ENOUGH_INGREDIENTS )
		self.canLearnCheckBox:Check( self.DEFAULT_FILTER_CAN_LEARN )
		self:SetFilterRank( self.DEFAULT_FILTER_RANK )

	end

	self.bLockBlueprintsUpdate = false
	
	self:UpdateBluePrintsList( false )

	if self.dataToRestore then

		if self.dataToRestore.selBlueprint ~= "" then

        	local blueprintRecordIdx = self:GetBluePrintRecordByDefName( self.dataToRestore.selBlueprint )
        	if blueprintRecordIdx ~= -1 then

				self.bLockSelItemUpdate = true
        		self.bluePrintsList:SelectRecord( blueprintRecordIdx )
				self.bLockSelItemUpdate = false

			end

		end

		if self.dataToRestore.scrollPos ~= -1 then
			self.bluePrintsList:SetScrollPos( self.dataToRestore.scrollPos )
		end

		self.prevItems = self.dataToRestore.prevItems
		self:SetSelItem( self.dataToRestore.selItemDefName, self.dataToRestore.bSelItemEnchanted, false )

		self.selItemWnd:SetCraftCount( self.dataToRestore.craftCount )

		self.dataToRestore = nil

	end

	self:UpdateInventorySize()
	self:UpdateWaitEffect()

end


-- Апдейтится только при открытии окна, хотя на состав категорий влияют изученные чертежи и чертежи в "инвентаре" игрока.
-- Предполагается, что в естественных условиях не может быть такой ситуации, когда бы на данные коллбэки изменилось бы
-- дерево категорий в то время, пока данное окно на экране.

function UI.ItemCraftMultiWnd:UpdateCategories()

	self.categoriesList:Reset()

	if type( _G.StoreInfo ) ~= "table" then
		sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo\"; \"table\" expected, got \"%s\"", type( _G.StoreInfo ) )
		return
	end

	local categories = _G.StoreInfo.categories
	if type( categories ) ~= "table" then
		sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories\"; \"table\" expected, got \"%s\"", type( categories ) )
		return
	end


	local usedCategoriesMap = {}

	for itemDefName, blueprintsForItem in pairs( UI.serverData.craftResult2Blueprints ) do
	
		for blueprintIdx, blueprintDefName in pairs( blueprintsForItem ) do

			if UI:CanBlueprintBeShownInCraft( blueprintDefName ) then

				local mainCategory, subCategory = UI:GetItemShopCategory( blueprintDefName )
				if mainCategory ~= "" then

					local mainCategoryInfo = usedCategoriesMap[ mainCategory ]
					if not mainCategoryInfo then
						mainCategoryInfo = {}
						usedCategoriesMap[ mainCategory ] = mainCategoryInfo
					end

					if subCategory ~= "" then
						mainCategoryInfo[ subCategory ] = true
					end

				end

			end
			
		end

	end


	for categoryIdx = 1, #_G.StoreInfo.categories do

		-- главная категория

		local categoryInfo = _G.StoreInfo.categories[ categoryIdx ]
		if type( categoryInfo ) == "table" then

			local category = categoryInfo.name
			if type( category ) == "string" then

				local usedCategoryInfo = usedCategoriesMap[ category ]
				if usedCategoryInfo then

					-- добавление главной категории

            		local categoryData = {}

            		categoryData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
            		categoryData.categoryInfo		= categoryInfo

            		self.categoriesList:AddRecord( categoryData )


					-- подкатегории

					if categoryInfo.subCategories ~= nil then

    					if type( categoryInfo.subCategories ) == "table" then

    					    for subCategoryIdx = 1, #categoryInfo.subCategories do

    							local subCategoryInfo = categoryInfo.subCategories[ subCategoryIdx ]
    							if type( subCategoryInfo ) == "table" then

    								local subCategory = subCategoryInfo.name
    								if type( subCategory ) == "string" then

    									local usedSubCategoryInfo = usedCategoryInfo[ subCategory ]
    									if usedSubCategoryInfo then

    										-- добавление подкатегории

                                    		local subCategoryData = {}

                                    		subCategoryData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.SUB
                                    		subCategoryData.categoryInfo		= subCategoryInfo
    				        				subCategoryData.parentCategoryInfo	= categoryInfo

                                    		self.categoriesList:AddRecord( subCategoryData )

    									end

    								else
    									sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories[%d].name\"; \"string\" expected, got \"%s\"", categoryIdx, subCategoryIdx, type( subCategory ) )
    								end

    							else
    								sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories[%d]\"; \"table\" expected, got \"%s\"", categoryIdx, subCategoryIdx, type( subCategoryInfo ) )
    							end
    						end							

    					else
    						sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories\"; \"table\" or \"nil\" expected, got \"%s\"", categoryIdx, type( categoryInfo.subCategories ) )
    					end
					end

				end

			else
				sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].name\"; \"string\" expected, got \"%s\"", categoryIdx, type( category ) )
			end
		else
			sys.log( "UI.ItemCraftMultiWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d]\"; \"table\" expected, got \"%s\"", categoryIdx, type( categoryInfo ) )
		end

	end	

	self.categoriesList:UpdateVisibleRecordsImmediate()

end


--
function UI.ItemCraftMultiWnd:ValidateSelCategory()

    if not self:RestoreSelCategory() then
    	self:SetDefaultSelCategory()
	end

end


--
function UI.ItemCraftMultiWnd:RestoreSelCategory()

	local profile = _G.GetProfileTable()
	
	if type( profile.ItemCraftMultiWnd ) ~= "table" then	
		return false
	end

	local mainCategory	= profile.ItemCraftMultiWnd.mainCategory
	local subCategory	= profile.ItemCraftMultiWnd.subCategory

	if type( mainCategory ) ~= "string" or type( subCategory ) ~= "string" then
		return false		
	end

	if mainCategory ~= "" and self.categoriesList:FindRecordByCategoryName( mainCategory, UI.StoreCategoriesListWnd.categoryTypes.MAIN ) ~= -1 then

		self.categoriesList:SelectMainCategory( mainCategory, false, false )

	    if subCategory ~= "" and self.categoriesList:FindRecordByCategoryName( subCategory, UI.StoreCategoriesListWnd.categoryTypes.SUB, mainCategory ) ~= -1 then
			self.categoriesList:SelectSubCategory( subCategory, mainCategory, false )
		end

	else
		self.categoriesList:SelectMainCategory( "", false, false )
	end

	return true

end


--
function UI.ItemCraftMultiWnd:SetDefaultSelCategory()
                        	
	self.categoriesList:SelectMainCategory( "", false, false )

end


--
function UI.ItemCraftMultiWnd:SaveSelCategory()

	local profile = _G.GetProfileTable()
	
	if type( profile.ItemCraftMultiWnd ) ~= "table" then	
		profile.ItemCraftMultiWnd = {}
	end

	profile.ItemCraftMultiWnd.mainCategory	= self.categoriesList:GetSelectedMainCategory()
	profile.ItemCraftMultiWnd.subCategory	= self.categoriesList:GetSelectedSubCategory()

end


function UI.ItemCraftMultiWnd:UpdateFilterRank()

	self.ranksComboBox:Reset()

	local allRanksData =
	{
		rank	= -1,
		text	= UI:GetStringByName( "shop_filters_ranksAll" )
	}
	self.ranksComboBox:AddRecord( allRanksData )

	for rank = 1, UI:GetMaxRank() do

		local strRank = tostring( rank )

		local data =
		{
			rank 	= rank,
			text	= strRank,
		}
		self.ranksComboBox:AddRecord( data )

	end

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "shop_rankFilterTooltip" )
	}

    self.ranksComboBox:SetTooltipData( tooltipData )

end


--
function UI.ItemCraftMultiWnd:SetFilterRank( rank )

	for recordIdx = 1, self.ranksComboBox:GetNumRecords() do

		local data = self.ranksComboBox:GetRecordData( recordIdx )
		if data.rank == rank then

			self.ranksComboBox:SelectRecord( recordIdx )
			break		

		end

	end

end


--
function UI.ItemCraftMultiWnd:GetFilterRank()

	local selRankRecordIdx = self.ranksComboBox:GetSelectedRecord()
	if selRankRecordIdx ~= -1 then

		local data = self.ranksComboBox:GetRecordData( selRankRecordIdx )
		return data.rank

	end

	return -1

end


--
function UI.ItemCraftMultiWnd:UpdateBluePrintsList( bRestoreSel )

	if self.bLockBlueprintsUpdate then
		return
	end

	local oldSelBlueprintDefName	= ""
	local oldScrollDelta			= 0

	if bRestoreSel then
		
		oldSelBlueprintDefName = self:GetSelBlueprint()
		if oldSelBlueprintDefName ~= "" then
			oldScrollDelta = self.bluePrintsList:GetScrollPos() - self.bluePrintsList:GetSelectedRecord()
		end

	end

	self.bLockSelItemUpdate = true
	self.bluePrintsList:Clear()
	self.bLockSelItemUpdate = false

	self:SetLayerVisible( true, self.layers.NO_BLUEPRINTS_TEXT )
	self:SetLayerVisible( true, self.layers.NO_BLUEPRINTS_EFFECT )

	local targetBlueprintDefName	= self:GetTargetBlueprint()
	local bTargetUpgrade			= self:IsTargetUpgradeItemMode()

	local bTargetEnchanted = false
	if bTargetUpgrade then

    	local targetIid = self:GetTargetItemId()
    	if targetIid ~= UI.INVALID_U64_ID then

    		local targetInventoryItem = UI:GetInventoryItem( targetIid )
    		if targetInventoryItem then
    			bTargetEnchanted = UI:IsInventoryItemEnchanted( targetInventoryItem )
    		else
    			sys.log( "UI.ItemCraftMultiWnd:UpdateBluePrintsList()[ERROR]: cannot find target inventory item" )
    		end

    	else
    		sys.log( "UI.ItemCraftMultiWnd:UpdateBluePrintsList()[ERROR]: invalid target iid" )
    	end

	end


	local shopItems = {}

	for itemDefName, blueprintsForItem in pairs( UI.serverData.craftResult2Blueprints ) do
	
		for blueprintIdx, blueprintDefName in pairs( blueprintsForItem ) do
		
			local shopItem = UI:GetShopItemByDef( blueprintDefName )

			if self:TestItem( shopItem ) then
				table.insert( shopItems, shopItem )
			end

		end

	end

	self:SortBlueprints( shopItems )	

	for itemIdx = 1, #shopItems do

		local shopItem = shopItems[ itemIdx ]

		local bLearned = UI:IsBluePrintLearned( shopItem.defName )

		local bDisabled = false

		if not bLearned then

			local requiredNodeName, requiredShipDefName = self:GetRequiredNode( shopItem.defName )

			if requiredNodeName == "" then

				if not UI:CanLearnBluePrint( shopItem.defName ) then
					bDisabled = true
				end

			else

				if not UI:IsShipVisibleInShipsTree( requiredShipDefName ) then

					sys.log( "UI.ItemCraftMultiWnd:UpdateBluePrintsList()[ERROR]: ship %s that is required to learn blueprint %s is not visible in ships tree", requiredShipDefName, shopItem.defName )
					bDisabled = true

				else

					local shipItem = UI:GetEvolvingShipItem( requiredShipDefName )
					if not shipItem then

    					local bAdvert, bByFlag = UI:IsShipAdvert( requiredShipDefName )
    					if bAdvert and not bByFlag then

    						sys.log( "UI.ItemCraftMultiWnd:UpdateBluePrintsList()[ERROR]: ship %s that is required to learn blueprint %s is advert and cannot be shown in nodes editor", requiredShipDefName, shopItem.defName )
    						bDisabled = true

    					end

					end
					
				end

			end

		end

		local bEnchanted = false
		if bTargetUpgrade and shopItem.defName == targetBlueprintDefName then
			bEnchanted = bTargetEnchanted
		else
			bEnchanted = UI:IsBlueprintEnchanted( shopItem.defName )
		end

		local data =
		{
			defName		= shopItem.defName,
			bLearned	= bLearned,
			bDisabled	= bDisabled,
			bEnchanted	= bEnchanted,
		}

		self.bluePrintsList:AddRecord( data )

	end


	local selRecordIdx			= -1
	local scrollPos				= -1
	local bSelectionRestored	= false

	if bRestoreSel then

		if oldSelBlueprintDefName ~= "" then

			local recordIdx = self:GetBluePrintRecordByDefName( oldSelBlueprintDefName )			
			if recordIdx ~= -1 then

				selRecordIdx		= recordIdx
				scrollPos			= recordIdx + oldScrollDelta
				bSelectionRestored	= true

			end

		end

	end

	if selRecordIdx == -1 then
		if self.bluePrintsList:GetNumRecords() > 0 then
			selRecordIdx = 1
		end
	end

	if selRecordIdx ~= -1 then
		self.bLockSelItemUpdate = true
		self.bluePrintsList:SelectRecord( selRecordIdx )
		self.bLockSelItemUpdate = false
	end

	if bSelectionRestored then
		self:UpdateSelItemInfo( true )
	else
		self:OnSelBlueprintChanged()
	end

	if scrollPos ~= -1 then
		self.bluePrintsList:SetScrollPos( scrollPos )
	end

	local bNoBluePrintVisible = self.bluePrintsList:GetNumRecords() == 0
	self:SetLayerVisible( bNoBluePrintVisible, self.layers.NO_BLUEPRINTS_TEXT )
	self:SetLayerVisible( bNoBluePrintVisible, self.layers.NO_BLUEPRINTS_EFFECT )

end


--
function UI.ItemCraftMultiWnd:TestItem( shopItem )

	if not UI:CanBlueprintBeShownInCraft( shopItem.defName ) then
    	return false
	end

	-- категория	

	local itemCategory, itemSubCategory = UI:GetItemShopCategory( shopItem.defName )

	if itemCategory == "" then
    	return false
	end

	if self.categoriesList:FindRecordByCategoryName( itemCategory, UI.StoreCategoriesListWnd.categoryTypes.MAIN, "" ) == -1 then
    	return false
	end

	if itemSubCategory ~= "" then
    	if self.categoriesList:FindRecordByCategoryName( itemSubCategory, UI.StoreCategoriesListWnd.categoryTypes.SUB, itemCategory ) == -1 then
        	return false
    	end
	end

	local selCategory		= self.categoriesList:GetSelectedMainCategory()
	local selSubCategory	= self.categoriesList:GetSelectedSubCategory()

	if selCategory ~= "" then
		if itemCategory ~= selCategory then
			return false
		end
	end

	if selSubCategory ~= "" then
		if itemSubCategory ~= selSubCategory then
			return false
		end
	end


	local craftResultDefName = UI:GetResourceCraftResult( shopItem.defName ) 

	-- фильтр: ранг

	local selRank = self:GetFilterRank()
	if selRank ~= -1 then

		-- #0055484,комм.(0227827) - если у вещи не прописан ранг, то она считается подходяшей под корабль любого ранга
		-- #0056733,комм.(0226608) - вещь с непрописанным рангом показывается при любом выбраном ранге, поскольку она подходит любому рангу

		local minRank = UI:GetItemEquipMinRank( craftResultDefName )
		local maxRank = UI:GetItemEquipMaxRank( craftResultDefName )

		if minRank ~= -1 and maxRank ~= -1 then
			if selRank < minRank or selRank > maxRank then
				return false
			end
		end

	end


	-- фильтр: предмет-результат крафта можно одеть на корабль в выбранном боевом слоте

	local bSelFitForShip = self.fitForShipCheckBox:IsChecked()
	if bSelFitForShip then

		local bItemFitForShip = false

		if UI:IsDefModule( craftResultDefName ) or UI:IsDefAmmo( craftResultDefName ) then

    		local selShipItem = UI.HangarWnd:GetSelShipItem()
    		if selShipItem then
    			bItemFitForShip = UI:IsItemFitForShip( craftResultDefName, selShipItem )
    		end

		end

		if not bItemFitForShip then
			return false
		end

	end


	-- фильтр: хватает ингредиентов (кроме денег) для изученных ресурсов; не изученные не показывются

	local bCheckEnoughIngredients = self.enoughIngredientsCheckBox:IsChecked()
	if bCheckEnoughIngredients then

		if UI:IsBluePrintLearned( shopItem.defName ) then

			local targetInventroryItem = nil

			if shopItem.defName == self:GetTargetBlueprint() and self:IsTargetUpgradeItemMode() then
				local targetIid = self:GetTargetItemId()
				targetInventroryItem = UI:GetInventoryItem( targetIid )
			end

        	local ingredients = UI:GetResourceCraftIngredients( shopItem.defName )
    		for ingredientIdx, ingredientInfo in pairs( ingredients ) do

    			if ingredientInfo.type ~= UI.resourceIngredientTypes.CREDITS and
    				ingredientInfo.type ~= UI.resourceIngredientTypes.TOKENS and
    				ingredientInfo.type ~= UI.resourceIngredientTypes.GOLD then

						local bEnough = false

						if ingredientInfo.type == UI.resourceIngredientTypes.MODULE and targetInventroryItem and ingredientInfo.defName == targetInventroryItem.defName then
							bEnough = true
						else
    						bEnough = UI:IsEnoughIngredient( ingredientInfo, 1 )
						end

    					if not bEnough then
    						return false
    					end

    			end
    			
    		end

		else
			return false
		end

	end
	
	
	-- фильтр: хватает средств для изучения (показываются только не изученные)

	local bCheckCanLearn = self.canLearnCheckBox:IsChecked()
	if bCheckCanLearn then

		if not UI:IsBluePrintLearned( shopItem.defName ) then

			if UI:GetPlayerResourceCount( shopItem.defName ) == 0 then
			
				local requiredNodeName, requiredShipDefName = self:GetRequiredNode( shopItem.defName )
				if requiredNodeName == "" then
				
					if not UI:CantItemBeBoughtByDef( shopItem.defName ) then
					
						local bEnoughFunds = true
						
						local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAlt( shopItem )
						
						if altPriceType then
							bEnoughFunds = UI:GetPlayerFunds( altPriceType ) >= altPrice
						else
							bEnoughFunds = UI:GetPlayerFunds( priceType ) >= price
						end
						
						if not bEnoughFunds then
							return false
						end
						
					else
						return false
					end
					
				else
					return false
				end
			
			end

		else
			return false
		end

	end
	

	return true

end


--
function UI.ItemCraftMultiWnd:SortBlueprints( shopItems )

	local SortObjPred = {}

	function SortObjPred:GetCompareFn( bDesc, bIgnoreCategories )

		local fnCompare = function( item1, item2 )

			local bLearned1 = UI:IsBluePrintLearned( item1.defName )
			local bLearned2 = UI:IsBluePrintLearned( item2.defName )
			
			if bLearned1 ~= bLearned2 then
				return bLearned1
			end
			
			-- #0111179(0521189) один предмет может крафтить несколько чертежей;
			-- чтобы они были вместе, сортировка идет по предмету, а не по чертежу
			local itemDefName1 = UI:GetResourceCraftResult( item1.defName )
			local itemDefName2 = UI:GetResourceCraftResult( item2.defName )
			
			if itemDefName1 ~= itemDefName2 then
				return UI:CompareDefs( itemDefName1, itemDefName2, bDesc, bIgnoreCategories )
			end
			
			-- череижи, которые крафтают один предмет, между собой сортируются по своему дефу
			return item1.defName < item2.defName

		end

		return fnCompare
		
	end
	
    UI:SortShop( shopItems, false, false, SortObjPred )

end


--
function UI.ItemCraftMultiWnd:GetBluePrintRecordByDefName( defName )

	for recordIdx = 1, self.bluePrintsList:GetNumRecords() do

		local data = self.bluePrintsList:GetRecordData( recordIdx )
		if data.defName == defName then
			return recordIdx
		end

	end 

	return -1

end


--
function UI.ItemCraftMultiWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

	if not UI:IsInShutdown() then

		self:SaveSelCategory()
		Profile:Save()

	end

	self.launchData = nil

end


--
function UI.ItemCraftMultiWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.categoriesList:GetUiHandle() then
		self:OnSelCategoryChanged()

	elseif hSender == self.bluePrintsList:GetUiHandle() then
		self:OnSelBlueprintChanged()
	end	

end


--
function UI.ItemCraftMultiWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.ranksComboBox:GetUiHandle() then
		self:OnFiltersChanged()
	end

end     


--
function UI.ItemCraftMultiWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

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

	elseif wnd == self.iventorySizeBtn then

		if not self:IsWaiting() then
		
    		if UI:CanIncreaseInventory() then
    			self:LaunchBuyWnd( UI.BuyWnd.modes.INVENTORY_USER )
			else
				UI:MessageBox( UI:GetStringByName( "buyInventory_caption_USER" ), UI:GetStringByName( "msg_cannotIncreaseInventory_USER" ), UI.MBS_OK )
    		end

		end

	elseif wnd == self.actionBtn then

		if not self:IsWaiting() then

			local blueprintDefName = self:GetBlueprintForSelItem()
			if blueprintDefName ~= "" then

				if UI:IsBluePrintLearned( blueprintDefName ) then
	
					self:TryCraft( blueprintDefName, self.bSelItemEnchanted, self.selItemWnd:GetCraftCount() )
	
				else
	
					local requiredNodeName, requiredShipDefName = self:GetRequiredNode( blueprintDefName )
					if requiredNodeName ~= "" then					
	
						local launchData =
						{
							bItemCraftMulti			= true,
							blueprintDefName		= blueprintDefName,
							itemCraftLaunchData		= self.launchData,
							bReturnFromEvolvingEdit	= true,
							dataToRestore			= self:GetDataToRestore(),
						}
	
						UI.HangarWnd:OpenShips( requiredShipDefName, true, true, nil, launchData )
						UI.ShipsTreeWnd:ShowNoticeOnNode( requiredNodeName )

					else
						self:TryLearnBlueprint( blueprintDefName )
					end
	
				end
	
			elseif self.selItemDefName ~= "" then
				-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
				local baseDefName = UI:GetItemUpgradeBaseDef( self.selItemDefName )
				self:TryBuyItem( baseDefName )
				
			else
				sys.log( "UI.ItemCraftMultiWnd:F_OnMouseLButtonDown()[ERROR]: neither sel blueprint nor item" )
			end

		end

	elseif wnd == UI.ItemCraftMulti_CrossBtn then

		self:ReturnToPrevWindow( true )

	elseif wnd == self.tradingBtn then

		if not self:IsWaiting() then
			self:LaunchTradingAdvertsWnd( self:GetDefForTrading() )
		end
		
	elseif wnd == self.transferToZoneBtn then
	
		if not self:IsWaiting() then
		
			local zoneId = UI:GetItemSourceZone( self.itemDefName )
			
			UI.GameplayShipSelectWnd:Setup( zoneId )
			UI.GameplayShipSelectWnd:Show()
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end

	else

		local blueprintSlotWnd = nil

		if UI:IsWndKindOf( wnd, "ItemCraftMulti_BluePrintSlotWnd" ) then
			blueprintSlotWnd = wnd
		else
			blueprintSlotWnd = UI:GetAncestorKindOf( wnd, "ItemCraftMulti_BluePrintSlotWnd" )
		end

		if blueprintSlotWnd then

			local recordIdx = blueprintSlotWnd:GetRecord()
			if self.bluePrintsList:GetSelectedRecord() ~= recordIdx then

				self.bluePrintsList:SelectRecord( recordIdx )
				UI:PlayGlobalSound( self.sounds.blueprintSelect )

			end

		end

	end

	return true

end


-- если bSkipChain=true, то не будет возврата к предыдущему крафту, а будет сразу возврат в ангар или другое окно, из которого крафт был вызван
function UI.ItemCraftMultiWnd:ReturnToPrevWindow( bSkipCraftChain )

	if bSkipCraftChain == nil then
		bSkipCraftChain = false
	end

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftMultiWnd:ReturnToPrevWindow()[ERROR]: not on screen" )
		return
	end

	local bHandled = false

	if self.launchData then

		if self.launchData.bItemCraftMulti then

			if not bSkipCraftChain then

    			local prevItem = self.prevItems[ #self.prevItems ]
    			if prevItem then

    	        	self.launchData = prevItem.launchData

    				self.prevItems[ #self.prevItems ] = nil
    				self:SetSelItem( prevItem.defName, prevItem.bEnchanted, true )

        	    	bHandled = true

    			else
    				sys.log( "UI.ItemCraftMultiWnd:ReturnToPrevWindow()[ERROR]: no prev item" )
    			end

			end

		else
			sys.log( "UI.ItemCraftMultiWnd:ReturnToPrevWindow()[ERROR]: unhandled type of launch data" )
		end

	end

	if not bHandled then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.ItemCraftMultiWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

    local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if not( wnd == self.bluePrintsList or wnd:IsChildOf( self.bluePrintsList ) ) then
		return true
	end	

	self.timeSinceMouseWheel = 0

	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self.bluePrintsList:GetVisibleRange()

	self.bluePrintsList:ScrollVisibleRange( ticks < 0 )

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self.bluePrintsList:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.blueprintsScrollRange )
	end

	return true

end


--
function UI.ItemCraftMultiWnd:OnSelCategoryChanged()

	self:UpdateBluePrintsList( false )

end


--
function UI.ItemCraftMultiWnd:OnFiltersChanged()

	self:UpdateBluePrintsList( true )

end


--
function UI.ItemCraftMultiWnd:UpdateInventorySize()

	self:ResetInventorySize()

	local curSize	= UI:GetInventoryCurSize()
	local maxSize	= UI:GetInventoryMaxSizeForCurLevel()

	local str = string.format( "%s: %s/%s", UI:GetStringByName( "equipment_inventorySize" ), UI:Num2StrSeparatedBy3( curSize ), UI:Num2StrSeparatedBy3( maxSize ) )

	if UI:CanIncreaseInventory() then

		self:SetText( str, self.layers.INVENTOTY_SIZE_VAL )
        self:AddControl( self.iventorySizeBtn, self.layers.INVENTOTY_SIZE_EFFECT, self.effectInfo.inventorySize.btnLocator )

	else
		self:SetText( str, self.layers.INVENTOTY_SIZE_VAL_FULL )
	end

end


--
function UI.ItemCraftMultiWnd:ResetInventorySize()

	self:SetText( "", self.layers.INVENTOTY_SIZE_VAL )
	self:SetText( "", self.layers.INVENTOTY_SIZE_VAL_FULL )

	self:RemoveControl( self.iventorySizeBtn, self.layers.INVENTOTY_SIZE_EFFECT )
	
end   


--
function UI.ItemCraftMultiWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ItemCraftMultiWnd:RemoveControl( wnd, effectLayer )

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
function UI.ItemCraftMultiWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.ItemCraftMultiWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.ItemCraftMultiWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.ItemCraftMultiWnd:IsWaiting()

	return
		UI:IsWaitingRequests()
		or self.requestId_buyInventory ~= 0
		or self.requestId_learnBlueprint ~= 0
		or self.requestId_buy ~= 0
		or self.requestId_craft ~= 0
		or self.bWaitingLearnedBlueprints
		or self.requestId_craftUpgradeItem ~= 0
		or self.bWaitingInventory
		or self.requestId_changeMunition ~= 0
		or self.requestId_changeEquipment ~= 0

end


--
function UI.ItemCraftMultiWnd:LaunchBuyWnd( mode, data )

	UI.ItemCraftMulti_BuyWnd:Setup( mode, true, data, true )
	UI.ItemCraftMulti_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftMultiWnd:LaunchCraftWnd( blueprintDefName, bEnchanted, count )

	UI.ItemCraftMulti_CraftConfirmWnd:Setup( blueprintDefName, bEnchanted, count )
	UI.ItemCraftMulti_CraftConfirmWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftMultiWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.ItemCraftMultiWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	UI.ItemCraftMulti_BuyWnd:UnlinkFromParent()
	UI.ItemCraftMulti_TradeWnd:UnlinkFromParent()
	UI.ItemCraftMulti_CraftConfirmWnd:UnlinkFromParent()
	self:HideTradingAdvertsWnd()

end


--
function UI.ItemCraftMultiWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local dataToRestore = nil
	if self:IsOnScreen() then
		dataToRestore = self:GetDataToRestore()
	end

	UI.store.ItemCraftMultiWnd =
	{
		requestId_buyInventory		= self.requestId_buyInventory,
		requestId_learnBlueprint	= self.requestId_learnBlueprint,
		requestId_buy				= self.requestId_buy,
        requestId_craft				= self.requestId_craft,
        bWaitingLearnedBlueprints	= self.bWaitingLearnedBlueprints,
		launchData					= self.launchData,
		dataToRestore				= dataToRestore,
		requestId_craftUpgradeItem	= self.requestId_craftUpgradeItem,
		bToCloseAfterEquip			= self.bToCloseAfterEquip,
		bWaitingInventory			= self.bWaitingInventory,
		itemToEquipInfo				= self.itemToEquipInfo,
		requestId_changeMunition	= self.requestId_changeMunition,
		requestId_changeEquipment	= self.requestId_changeEquipment,
	}

end


--
function UI.ItemCraftMultiWnd:F_OnEventRestoreUiState()

	if UI.store.ItemCraftMultiWnd then

		self.requestId_buyInventory		= UI.store.ItemCraftMultiWnd.requestId_buyInventory
		self.requestId_learnBlueprint	= UI.store.ItemCraftMultiWnd.requestId_learnBlueprint
		self.requestId_buy				= UI.store.ItemCraftMultiWnd.requestId_buy
        self.requestId_craft			= UI.store.ItemCraftMultiWnd.requestId_craft
        self.bWaitingLearnedBlueprints	= UI.store.ItemCraftMultiWnd.bWaitingLearnedBlueprints
		self.launchData					= UI.store.ItemCraftMultiWnd.launchData
		self.dataToRestore				= UI.store.ItemCraftMultiWnd.dataToRestore
		self.requestId_craftUpgradeItem	= UI.store.ItemCraftMultiWnd.requestId_craftUpgradeItem
		self.bToCloseAfterEquip			= UI.store.ItemCraftMultiWnd.bToCloseAfterEquip
		self.bWaitingInventory			= UI.store.ItemCraftMultiWnd.bWaitingInventory
		self.itemToEquipInfo			= UI.store.ItemCraftMultiWnd.itemToEquipInfo
		self.requestId_changeMunition	= UI.store.ItemCraftMultiWnd.requestId_changeMunition
		self.requestId_changeEquipment	= UI.store.ItemCraftMultiWnd.requestId_changeEquipment

		if self:IsOnScreen() then
	    	self:UpdateWaitEffect()
		end

		UI.store.ItemCraftMultiWnd = nil

	end
	
end


--
function UI.ItemCraftMultiWnd:GetDataToRestore()

	local dataToRestore =
	{
		filter_fitForShip			= self.fitForShipCheckBox:IsChecked(),
		filter_enoughIngredients	= self.enoughIngredientsCheckBox:IsChecked(),
		filter_canLearn				= self.canLearnCheckBox:IsChecked(),
		filter_rank					= self:GetFilterRank(),
		selBlueprint				= self:GetSelBlueprint(),			
		scrollPos					= self.bluePrintsList:GetScrollPos(),
		craftCount					= self.selItemWnd:GetCraftCount(),
		selItemDefName				= self.selItemDefName,
		bSelItemEnchanted			= self.bSelItemEnchanted,
		prevItems					= self.prevItems,
	}

	return dataToRestore

end


--
function UI.ItemCraftMultiWnd:BuyInventory()

	self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension()

	if self.requestId_buyInventory ~= 0 then
		UI:PlayGlobalSound( self.sounds.buyInventory )
	else
		self.blueprintToCraftData = nil
		self.itemToBuy = nil
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.ItemCraftMultiWnd:F_OnEventStopWaitingRequests()

	self.bWaitingLearnedBlueprints = false

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftMultiWnd:F_OnEventStartWaitingRequests()

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftMultiWnd:TryLearnBlueprint( defName )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftMultiWnd:TryLearnBlueprint()[ERROR]: is waiting another request" )
		return
	end

	if type( defName ) ~= "string" or defName == "" then
		sys.log( "UI.ItemCraftMultiWnd:TryLearnBlueprint()[ERROR]: invalid defName" )
		return	
	end

	if UI:IsBluePrintLearned( defName ) then
		sys.log( "UI.ItemCraftMultiWnd:TryLearnBlueprint()[ERROR]: already learned" )
		return	
	end

	if not UI:CanLearnBluePrint( defName ) then
		sys.log( "UI.ItemCraftMultiWnd:TryLearnBlueprint()[ERROR]: cannot learn" )
		return	
	end

	local bHasBlueprint = UI:GetPlayerResourceCount( defName ) > 0

	if bHasBlueprint then
		self:DoLearnBlueprint( defName )
	else
		self:LaunchTradeWnd( defName )
	end

end


--
function UI.ItemCraftMultiWnd:DoLearnBlueprint( defName )

	self.requestId_learnBlueprint = _G.MasterServer_LearnBlueprint( defName )

	if self.requestId_learnBlueprint ~= 0 then

		UI:AddWaitingRequest( self.requestId_learnBlueprint )
		UI:PlayGlobalSound( self.sounds.learnBlueprint )

	else
		UI:ShowMsgOnLearnBlueprintError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.ItemCraftMultiWnd:LaunchTradeWnd( defName )

	local shopItem = UI:GetShopItemByDef( defName )
	if not shopItem then
		sys.log( "UI.ItemCraftMultiWnd:LaunchTradeWnd()[ERROR]: cannot find shop item" )
		return
	end

	UI.ItemCraftMulti_TradeWnd:SetupForBuy( shopItem, nil, nil )
	UI.ItemCraftMulti_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftMultiWnd:F_OnEventInvItemsChanged()

	if self:IsOnScreen() then

		self:UpdateBluePrintsList( true )
		self:UpdateInventorySize()

	end

	if self.bToCloseAfterEquip then

		self.bToCloseAfterEquip = false

		if self:IsOnScreen() then
			self:ReturnToPrevWindow( true )
		end

	end

	if self.itemToEquipInfo then
		self:EquipItem( self.itemToEquipInfo )
		self.itemToEquipInfo = nil
	end

end


--
function UI.ItemCraftMultiWnd:OnSelBlueprintChanged()

	if self.bLockSelItemUpdate then
		return
	end

	if next( self.prevItems ) then
		self.launchData = self.prevItems[ 1 ].launchData
		self.prevItems = {}
	end

	local selItemDefName	= ""
	local bSelItemEnchanted	= false

	local selBlueprintRecordIdx = self.bluePrintsList:GetSelectedRecord()
	if selBlueprintRecordIdx ~= -1 then

		local blueprintData = self.bluePrintsList:GetRecordData( selBlueprintRecordIdx )
		local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( blueprintData.defName )	

		selItemDefName		= craftResultDefName
		bSelItemEnchanted	= blueprintData.bEnchanted

	end

	self:SetSelItem( selItemDefName, bSelItemEnchanted, false )

end


--
function UI.ItemCraftMultiWnd:UpdateSelItemInfo( bResoreCraftCount )

	if bResoreCraftCount == nil then
		bResoreCraftCount = false
	end

	local oldItemDefName	= self.selItemWnd:GetItem()
	local oldCraftCount		= self.selItemWnd:GetCraftCount()

	self:ResetSelItemInfo()

	if self.selItemDefName == "" then
		return
	end

	self.selItemWnd:Setup( self.selItemDefName, self:GetBlueprintForSelItem(), self.bSelItemEnchanted, self:GetTargetItemId(), self:GetTargetShip(), self:GetTargetShipSlot(), self.prevItems )

	if bResoreCraftCount then
    	if self.selItemDefName ~= "" and oldItemDefName == self.selItemDefName then
    		self.selItemWnd:SetCraftCount( oldCraftCount )
		end
	end

	self:UpdatePrice()
	self:UpdateActionBtn()
	self:UpdateTradingBtn()
	self:UpdateTransferToZoneBtn()

end


--
function UI.ItemCraftMultiWnd:UpdatePrice()

	self.priceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.PRICE )
	
	local blueprintDefName = self:GetBlueprintForSelItem()
	
	local str = ""

	-- если отображаются данные для чертежа
	if blueprintDefName ~= "" then
	
		-- цена крафта

		if UI:IsBluePrintLearned( blueprintDefName ) then

			local craftCount = self.selItemWnd:GetCraftCount()
			if craftCount > 0 then

				local priceInfos = UI:GetResourceCraftPrice( blueprintDefName, craftCount )
				for priceInfoIdx, priceInfo in ipairs( priceInfos ) do

					local priceInfo = priceInfos[ priceInfoIdx ]
					local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, nil, true, nil )

					if str ~= "" then
						str = string.format( "%s ", str )
					end
					str = str .. strPrice

				end

			end


		-- цена изучения чертежа

		else

			local bNeedBlueprintIco		= false
			local requiredNodeName		= ""
			local requiredShipDefName	= ""

			local blueprintsCount = UI:GetPlayerResourceCount( blueprintDefName )

			if blueprintsCount > 0 then

				bNeedBlueprintIco = true

			else

				requiredNodeName, requiredShipDefName = self:GetRequiredNode( blueprintDefName )

				if requiredNodeName == "" then
					bNeedBlueprintIco = UI:CantItemBeBoughtByDef( blueprintDefName )
				end

			end		

			if bNeedBlueprintIco then

				local color = UI.WHITE_COLOR

				if blueprintsCount > 0 then
					str = string.format( "%s1$link [type CUSTOM_ICO] [params {texName=\"bluePrint\", tooltipTextId=\"blueprintIcoTooltip_text\", tooltipCaptionId=\"blueprintIcoTooltip_caption\", colorSel=UI.WHITE_COLOR, colorUnsel=UI.WHITE_COLOR}]$", UI:Color2Str( color ) )
				else
					color = UI.PARAM_DELTA_MINUS_COLOR
					local tooltipText = UI:GetItemSourceDesc( blueprintDefName, UI.TooltipWnd_shared:GetTextColor() )
					str = string.format( "%s1$link [type CUSTOM_ICO] [params {texName=\"bluePrint\", tooltipText=\"%s\", tooltipCaptionId=\"blueprintIcoTooltip_caption\", colorSel=UI.WHITE_COLOR, colorUnsel=UI.WHITE_COLOR}]$", UI:Color2Str( color ), tooltipText )
				end

			elseif requiredNodeName ~= "" then

				local baseColor = UI.PARAM_DELTA_MINUS_COLOR
				
				local shipName = UI:GetEntityLocalizedNameByDef( requiredShipDefName, true, false, nil, nil )
				shipName = string.format( "%s%s", shipName, UI:Color2Str( baseColor ) )

				str = UI:GetStringByName( "itemCraft_nodeRequired" )

				local numSubst = 0
				str, numSubst = string.gsub( str, "%$ship%$", shipName )

				if numSubst == 0 then
					sys.log( "UI.ItemCraftMultiWnd:UpdatePrice()[ERROR]: cannot find placeholder \"$ship$\" in string \"itemCraft_nodeRequired\"" )
					str = string.format( "[INVALID STRING] Required node in ship %s", shipName )
				end

				str = string.format( "%s%s", UI:Color2Str( baseColor ), str )

			else			

				local priceInfos = {}
				
				local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAltByDef( blueprintDefName )
				
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

				str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), true, nil, true, nil )

			end

		end
		
	-- если отображаются данные для предмета (без чертежа)
	elseif self.selItemDefName ~= "" then
		
		-- цена покупки
		-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
		local baseDefName = UI:GetItemUpgradeBaseDef( self.selItemDefName )
		
		if not UI:CantItemBeBoughtByDef( baseDefName ) then
	
			local priceInfos = {}
			
			local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAltByDef( baseDefName )
			
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
			
    		str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), true, nil, true, nil )
			
		end

	end

	if str ~= "" then
		self:SetLayerVisible( true, self.layers.PRICE )
		self.priceMetaText:SetText( str, true )
	end

end


--
function UI.ItemCraftMultiWnd:UpdateActionBtn()

	self:ResetActionBtn()
	
	local blueprintDefName = self:GetBlueprintForSelItem()

	-- если отображаются данные для чертежа
	if blueprintDefName ~= "" then

		self:AddChild( self.actionBtn )

		-- крафт

		if UI:IsBluePrintLearned( blueprintDefName ) then

			self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_craftBtn" ) )

			local craftCount = self.selItemWnd:GetCraftCount()

			local targetIid = UI.INVALID_U64_ID
			if blueprintDefName == self:GetTargetBlueprint() and self:IsTargetUpgradeItemMode() then
				targetIid = self:GetTargetItemId()
			end			

			bEnable = craftCount > 0 and UI:IsEnoughIngredientsForCraftFromResource( blueprintDefName, craftCount, true, targetIid )

			self.actionBtn:Enable( bEnable )

		else

			local requiredNodeName, requiredShipDefName = self:GetRequiredNode( blueprintDefName )

			-- переход к ноду

			if requiredNodeName ~= "" then

				self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_goToNode" ) )

				local bEnable = true

				if not UI:IsShipVisibleInShipsTree( requiredShipDefName ) then

					sys.log( "UI.ItemCraftMultiWnd:UpdateActionBtn()[ERROR]: ship %s that is required to learn blueprint %s is not visible in ships tree", requiredShipDefName, blueprintDefName )
					bEnable = false

				else

					local shipItem = UI:GetEvolvingShipItem( requiredShipDefName )
					if not shipItem then

						local bAdvert, bByFlag = UI:IsShipAdvert( requiredShipDefName )
						if bAdvert and not bByFlag then

							sys.log( "UI.ItemCraftMultiWnd:UpdateActionBtn()[ERROR]: ship %s that is required to learn blueprint %s is advert and cannot be shown in nodes editor", requiredShipDefName, blueprintDefName )
							bEnable = false

						end

					end
					
				end

				self.actionBtn:Enable( bEnable )

			-- изучение

			else

				self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_learnBtn" ) )

				local bEnable = UI:CanLearnBluePrint( blueprintDefName )
				self.actionBtn:Enable( bEnable )

			end

		end
		
	-- если отображаются данные для предмета (без чертежа)
	elseif self.selItemDefName ~= "" then
	
		-- купить		
		-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
		local baseDefName = UI:GetItemUpgradeBaseDef( self.selItemDefName )
		
		if not UI:CantItemBeBoughtByDef( baseDefName ) then
		
			self:AddChild( self.actionBtn )
			
			self.actionBtn:SetBtnText( UI:GetStringByName( "shop_buy" ) )
			self.actionBtn:Enable( true )
			
		end
		
	end

end


--
function UI.ItemCraftMultiWnd:ResetActionBtn()

	if self.actionBtn:IsChildOf( self ) then
		self.actionBtn:Reset()
		self.actionBtn:UnlinkFromParent()
	end

end


--
function UI.ItemCraftMultiWnd:UpdateTradingBtn()

	local bNeedTradingBtn = self:GetDefForTrading() ~= ""
	
	if bNeedTradingBtn then
		self:AddChild( self.tradingBtn )
	else
		self.tradingBtn:UnlinkFromParent()
	end

end


--
function UI.ItemCraftMultiWnd:GetDefForTrading()
	
	local defNameForTrading = ""

	if self.selItemDefName ~= "" then
		
		local blueprintDefName = self:GetBlueprintForSelItem()
		
		-- #0106973
		-- если чертеж не изучен, то торговля чертежом
		if blueprintDefName ~= "" and not UI:IsBluePrintLearned( blueprintDefName ) then
			if UI:IsItemTrading( blueprintDefName ) and UI:GetPlayerResourceCount( blueprintDefName ) == 0 then
				defNameForTrading = blueprintDefName
			end
			
		-- торговля предметом
		else
			if UI:IsItemTrading( self.selItemDefName ) then
				defNameForTrading = self.selItemDefName
			end
		end
		
	end
	
	return defNameForTrading

end


--
function UI.ItemCraftMultiWnd:UpdateTransferToZoneBtn()

	local bNeedBtn = self.selItemDefName ~= "" and self:GetBlueprintForSelItem() == "" and UI:GetItemSourceZone( self.selItemDefName ) ~= -1

	if bNeedBtn then
		self:AddChild( self.transferToZoneBtn )
	else
		self.transferToZoneBtn:UnlinkFromParent()
	end	

end


--
function UI.ItemCraftMultiWnd:GetSelBlueprint()

	local selRecordIdx = self.bluePrintsList:GetSelectedRecord()
	if selRecordIdx ~= -1 then

		local data = self.bluePrintsList:GetRecordData( selRecordIdx )
		return data.defName

	end

	return ""

end


--
function UI.ItemCraftMultiWnd:GetBlueprintForSelItem()

	local blueprintDefName = ""
	
	if not next( self.prevItems ) then
	
		-- Для главного предмета возвращается выделенный чертеж из списка
		local selBlueprintRecordIdx = self.bluePrintsList:GetSelectedRecord()
		if selBlueprintRecordIdx ~= -1 then
			local data = self.bluePrintsList:GetRecordData( selBlueprintRecordIdx )
			blueprintDefName = data.defName
		end
		
	else
	
		-- для ингредиентов возвращается дефолтный чертеж (если их несколько)
		if self.selItemDefName ~= "" then
			blueprintDefName = UI:GetBlueprintForItemCraft( self.selItemDefName, true )	-- #0100835(0469490) - если чертеж скрыт от игрока, то его не показывать нигде, в т.ч. нельзя изучить
		end

	end
	
	return blueprintDefName

end


--
function UI.ItemCraftMultiWnd:TryCraft( blueprintDefName, bEnchanted, craftCount )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftMultiWnd:TryCraft()[ERROR]: is waiting for another request" )
		return
	end

	if blueprintDefName == "" then
		sys.log( "UI.ItemCraftMultiWnd:TryCraft()[ERROR]: invalid blueprintDefName" )
		return
	end

	if craftCount <= 0 then
		sys.log( "UI.ItemCraftMultiWnd:TryCraft()[ERROR]: invalid craftCount" )
		return
	end

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( blueprintDefName )

	local itemsInventorySize	= UI:GetNeedInventorySizeForItem( craftResultDefName, craftResultCount * craftCount )
	local usedInventorySize		= UI:GetInventoryCurSize()
	local inventoryCapacity		= UI:GetInventoryMaxSizeForCurLevel()

	local bEnoughInventorySize = ( usedInventorySize + itemsInventorySize ) <= inventoryCapacity	
    if bEnoughInventorySize then

		self:LaunchCraftWnd( blueprintDefName, bEnchanted, craftCount )

	else

		if UI:CanIncreaseInventory() then

    		local curInventoryLevel = UI:GetInventoryCurLevel()

    	   	local inventoryLevelsToBuy = {}

           	for levelToBuy = curInventoryLevel + 1, UI:GetInventoryMaxLevel() do

           		table.insert( inventoryLevelsToBuy, levelToBuy )

           		local newInventoryCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
           		if ( usedInventorySize + itemsInventorySize ) <= newInventoryCapacity then
           			break
           		end

           	end		

    		self.blueprintToCraftData = { defName = blueprintDefName, bEnchanted = bEnchanted, count = craftCount }
    		self:LaunchBuyWnd( UI.BuyWnd.modes.INVENTORY_AUTO, { inventoryLevels = inventoryLevelsToBuy } )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.ItemCraftMultiWnd:DoCraft( blueprintDefName, bEnchanted, count )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftMultiWnd:DoCraft()[ERROR]: still waiting for another request" )
		return
	end

	if self:GetTargetBlueprint() == blueprintDefName then

		if self:IsTargetUpgradeItemMode() then

			self.requestId_craftUpgradeItem = _G.GameStore_CraftUpgradeItem( blueprintDefName, self:GetTargetItemId() )

        	if self.requestId_craftUpgradeItem ~= 0 then

        		UI:AddWaitingRequest( self.requestId_craftUpgradeItem )
        		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
				self.bWaitingInventory = true

        		UI:PlayGlobalSound( self.sounds.craft )

				self.bToCloseAfterEquip = true

        	else
        		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
        	end

		else

        	self.requestId_craft = _G.MasterServer_UseCraftResource( blueprintDefName, count )

        	if self.requestId_craft ~= 0 then

        		UI:AddWaitingRequest( self.requestId_craft )
        		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
				self.bWaitingInventory = true

        		UI:PlayGlobalSound( self.sounds.craft )

				local vid			= self:GetTargetShip()
				local slotId		= self:GetTargetShipSlot()
				local itemDefName	= UI:GetResourceCraftResult( blueprintDefName )

				if vid ~= UI.INVALID_U64_ID and slotId ~= -1 and itemDefName ~= "" then				

            		self.itemToEquipInfo =
    				{
						defName		= itemDefName,
						bEnchanted	= bEnchanted,
						vid			= vid,
						slotId		= slotId,
    				}

				else
					sys.log( "UI.ItemCraftMultiWnd:DoCraft()[ERROR]: invalis params for equip" )
				end

        	else
        		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
        	end			

		end

	else

    	self.requestId_craft = _G.MasterServer_UseCraftResource( blueprintDefName, count )

    	if self.requestId_craft ~= 0 then

    		UI:AddWaitingRequest( self.requestId_craft )
    		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

    		UI:PlayGlobalSound( self.sounds.craft )

    	else
    		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end

	end

end


--
function UI.ItemCraftMultiWnd:EquipItem( itemToEquipInfo )

	local bHasInInventory	= false
	local iid				= UI.INVALID_U64_ID

	local inventoryItems = UI:GetInventoryItemsByDef( itemToEquipInfo.defName )
	for idx, item in pairs( inventoryItems ) do

		if UI:IsInventoryItemEnchanted( item ) == itemToEquipInfo.bEnchanted and item.amount > 0 then

			if UI:IsDefModule( item.defName ) then
				if UI:GetEquippedShipItem( item.iid ) == nil then
					bHasInInventory = true
					iid = item.iid
				end
			else
				bHasInInventory = true
			end

			if bHasInInventory then			
				break
			end

		end

	end

	if not bHasInInventory then
		sys.log( "UI.ItemCraftMultiWnd:EquipItem()[ERROR]: cannot find item in inventory" )
		return
	end	


	if UI:IsDefAmmo( itemToEquipInfo.defName ) then
    	
    	local priceType = UI:GetShopSmartBuyPriceOneByDef( itemToEquipInfo.defName )

		-- TODO: уточнить, что будет, если передать невалидную цену
		self.requestId_changeMunition, bForbidden = UI:SafeChangeMunition( itemToEquipInfo.vid, itemToEquipInfo.slotId, priceType, itemToEquipInfo.defName )

		if self.requestId_changeMunition ~= 0 then

			UI:AddWaitingRequest( self.requestId_changeMunition )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

			self.bToCloseAfterEquip = true

		elseif not bForbidden then
			UI:ShowMessageOnChangeMunitionError( _G.GameStore.MunitionResult.MR_ERROR )
		end

	elseif UI:IsDefModule( itemToEquipInfo.defName ) then

		self.requestId_changeEquipment, bForbidden = UI:SafeChangeEquipment( itemToEquipInfo.vid, itemToEquipInfo.slotId, iid )

		if self.requestId_changeEquipment ~= 0 then

			UI:AddWaitingRequest( self.requestId_changeEquipment )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

			self.bToCloseAfterEquip = true

        	if itemToEquipInfo.slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 then
        		self:CheckShowMsgOnUnequipPrimaryAmmo( UI:GetShipItem( itemToEquipInfo.vid ), UI:GetWeaponClass( itemToEquipInfo.defName ) )
			end

		elseif not bForbidden then
			UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
		end

	else
		sys.log( "UI.ItemCraftMultiWnd:EquipItem()[ERROR]: unhandled item type (def \"%s\")", itemToEquipInfo.defName )
	end

end


--
function UI.ItemCraftMultiWnd:CheckShowMsgOnUnequipPrimaryAmmo( shipItem, dstWeaponClass )

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

   	UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_unfitModsDrop" ), UI.MBS_OK )

end


--
function UI.ItemCraftMultiWnd:GetTargetBlueprint()

	local defName = ""

	if not self.launchData or not self.launchData.bEquipment then
		return defName
	end

	if self.launchData.blueprintDefName ~= nil then
    	if type( self.launchData.blueprintDefName ) == "string" then
    		defName = self.launchData.blueprintDefName
    	else
    		sys.log( "UI.ItemCraftMultiWnd:GetTargetBlueprint()[ERROR]: invalid type of self.launchData.blueprintDefName; \"string\" or \"nil\" expected, got \"%s\"", type( self.launchData.blueprintDefName ) )
    	end
	end

	return defName

end


--
function UI.ItemCraftMultiWnd:GetTargetShip()

	local vid = UI.INVALID_U64_ID

	if not self.launchData or not self.launchData.bEquipment then
		return vid
	end

	if self.launchData.bUpgrade then

		if type( self.launchData.iid ) == "userdata" then

			local shipItem = UI:GetEquippedShipItem( self.launchData.iid )
			if shipItem then
				vid = shipItem.vid
			else
				sys.log( "UI.ItemCraftMultiWnd:GetTargetShip()[ERROR]: item is not equipped" )
			end

		else
			sys.log( "UI.ItemCraftMultiWnd:GetTargetShip()[ERROR]: invalid type of self.launchData.iid; \"userdata\" expected, got \"%s\"", type( self.launchData.iid ) )
		end

	else

		if type( self.launchData.vid ) == "userdata" then
			vid = self.launchData.vid
		else
			sys.log( "UI.ItemCraftMultiWnd:GetTargetShip()[ERROR]: invalid type of self.launchData.vid; \"userdata\" expected, got \"%s\"", type( self.launchData.vid ) )
		end

	end

	return vid

end


--
function UI.ItemCraftMultiWnd:GetTargetItemId()

	local iid = UI.INVALID_U64_ID

	if not self.launchData or not self.launchData.bEquipment or not self.launchData.bUpgrade then
		return iid
	end

	if type( self.launchData.iid ) == "userdata" then
		iid = self.launchData.iid
	else
		sys.log( "UI.ItemCraftMultiWnd:GetTargetItemId()[ERROR]: invalid type of self.launchData.iid; \"userdata\" expected, got \"%s\"", type( self.launchData.iid ) )
	end

	return iid	

end


--
function UI.ItemCraftMultiWnd:GetTargetShipSlot()

	local slotId = -1

	if not self.launchData or not self.launchData.bEquipment or self.launchData.bUpgrade then
		return slotId
	end

	if type( self.launchData.slotId ) == "number" then
		slotId = self.launchData.slotId
	else
		sys.log( "UI.ItemCraftMultiWnd:GetTargetItemId()[ERROR]: invalid type of self.launchData.slotId; \"number\" expected, got \"%s\"", type( self.launchData.slotId ) )
	end

	return slotId

end


--
function UI.ItemCraftMultiWnd:IsTargetUpgradeItemMode()

	return self.launchData ~= nil and self.launchData.bEquipment == true and self.launchData.bUpgrade == true

end


--
function UI.ItemCraftMultiWnd:OnAccountAurasChanged()

	self:UpdatePrice()
	self:UpdateActionBtn()

end


--
function UI.ItemCraftMultiWnd:LaunchBundlesWnd( bundleDefName, data )

	UI.BuyBundleWnd:Setup( bundleDefName, data, nil, false )
	UI.BuyBundleWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftMultiWnd:LaunchTradingAdvertsWnd( defName )

	UI.Trading_AdvertsWnd:Setup( defName, self:GetName() )
	UI.Trading_AdvertsWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftMultiWnd:HideTradingAdvertsWnd()

	if UI.Trading_AdvertsWnd:IsOnScreen() and UI.Trading_AdvertsWnd:GetMainWndName() == self:GetName() then
		UI.Trading_AdvertsWnd:Hide()		
	end

end


--
function UI.ItemCraftMultiWnd:GetRequiredNode( blueprintDefName )

	local nodeName		= ""
	local shipDefName	= ""

	if UI:GetPlayerResourceCount( blueprintDefName ) == 0 then

		nodeName, shipDefName = UI:GetBlueprintRequiredNode( blueprintDefName )
		if nodeName ~= "" then

			local bNodeUnlocked = false

			local shipItem = UI:GetEvolvingShipItem( shipDefName )
			if shipItem then
				bNodeUnlocked = UI:IsEvolvingShipNodeUnlocked( nodeName, shipItem.vid )					
			end

			if bNodeUnlocked then
				nodeName	= ""
				shipDefName	= ""
			end

		end

	end		

	return nodeName, shipDefName

end


--
function UI.ItemCraftMultiWnd:SetSelItem( itemDefName, bEnchanted, bSound )

	self.selItemDefName		= itemDefName
	self.bSelItemEnchanted	= bEnchanted

	self:UpdateSelItemInfo()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.itemSelect )
	end

end


--
function UI.ItemCraftMultiWnd:TryBuyItem( defName )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftMultiWnd:TryBuyItem()[ERROR]: is waiting another request" )
		return
	end

	if type( defName ) ~= "string" or defName == "" then
		sys.log( "UI.ItemCraftMultiWnd:TryLearnBlueprint()[ERROR]: invalid defName" )
		return	
	end
	
	if UI:IsEnoughPlaceInInventoryForItem( defName ) then
		self:LaunchTradeWnd( defName )
	else
		if UI:CanIncreaseInventory() then
			self.itemToBuy = defName
			self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.INVENTORY_AUTO )
		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end
	end

end


-- --------------------------------------------------------------------------
-- UI.ItemCraftMulti_BluePrintsListWnd
-- --------------------------------------------------------------------------

UI.ItemCraftMulti_BluePrintsListWnd =
{
    def =
    {
    	className	= "Wnd",
		prototype	= "ButtonsList3Wnd",
    	
    	props =
    	{
    		name	= "ItemCraftMulti_BluePrintsListWnd",
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
    				defName 			= "itemCraft_bluePrintsList",
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
	},

	listStyle 			= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION,
	MAX_SLOTS 			= 5,
	btnPrototypeName	= "ItemCraftMulti_BluePrintSlotWnd",

	effectInfo =
	{
    	main =
    	{
    		slotObjNamePrefix	= "slot_",
    		scrollObjName		= "scroll_max",
    		animIdle			= "idle",
    	}
	}
}

-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_BluePrintSlotWnd
-- -------------------------------------------------------------------

UI.ItemCraftMulti_BluePrintSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ItemCraftMulti_BluePrintSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	SEL_EFFECT			= 1,
	NOT_LEARNED_EFFECT	= 2,
	NOT_LEARNED_TEXT    = 3,
    NAME				= 4,
    COUNT				= 5,
    MOUSE_OVER_EFFECT	= 6,
}

--
UI.ItemCraftMulti_BluePrintSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "ItemCraftMulti_BluePrintSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ItemCraftMulti_BluePrintSlotWnd.layers.MOUSE_OVER_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "itemCraft_bluePrintSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over6",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "product_name",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	

					{
						objName		= "text",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "over",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "unstudied",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.NOT_LEARNED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemCraft_bluePrintSlot_sel",
				defaultAnimation	= "idle",
			}}
		},

		-- NOT_LEARNED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemCraft_bluePrintSlot_notLearned",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_text",	
						layer		= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.NOT_LEARNED_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	
				}
			}}
		},

		-- NOT_LEARNED_TEXT
		{
			layerType		= UI.LAYER_ETEXT,			            	
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_notLearned" ),

			spriteName			= "etext_text_sprite",
			spriteEffectLayer	= "UI.ItemCraftMulti_BluePrintSlotWnd.layers.NOT_LEARNED_EFFECT",
		},		

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,			            	
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,			            	
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "itemCraft_bluePrintSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface funtions
-- ------------------------------

--
function UI.ItemCraftMulti_BluePrintSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.COUNT )
	self.countMetaText:SetText( "", true )
	self.icoWnd:Reset()
	self:RemoveControl( self.darkeningWnd, self.layers.MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )	
	self:SetLayerVisible( false, self.layers.NOT_LEARNED_EFFECT )
	self:SetLayerVisible( false, self.layers.NOT_LEARNED_TEXT )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList3_Btn.Select( self, bSelect, bAnimated )

	self:UpdateSelection()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraftMulti_BluePrintSlotWnd.effectInfo =
{
	main =
	{
		icoLocator			= "icon",
		darkeningLocator	= "blackout",
		priceLocator		= "price",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ItemCraftMulti_BluePrintSlotWnd.countMetaText			= nil
UI.ItemCraftMulti_BluePrintSlotWnd.icoWnd					= nil
UI.ItemCraftMulti_BluePrintSlotWnd.darkeningWnd				= nil 

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.countMetaText = UI.MetaText.GetNewInstance()
	self.countMetaText:InitFromLayer( self, self.layers.COUNT ) 	

	self:CreateControls()

	self:Reset()

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_Shutdown()

	if self.countMetaText then
		self.countMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMetaTextPos()
	end

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateMetaTextPos()

	self.countMetaText:UpdateScreenOrgFromLayer( self, self.layers.COUNT )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos( 0 )
	end

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.COUNT then
		self.countMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.NOT_LEARNED_TEXT then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ), layerIdx )
	end

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ItemCraftMultiWnd.sounds.blueprintSlotMouseOver )
	end

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:CreateControls()

	self.icoWnd			= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.darkeningWnd	= UI:CreateChildWnd( self, UI.ItemCraftMulti_BluePrintSlot_DarkeningWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ItemCraftMulti_BluePrintSlotWnd:RemoveControl( wnd, effectLayer )

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
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateSelection()
	self:UpdateIco( data )
	self:UpdateName( data )
	self:UpdateCount( data )
	self:UpdateDarkening( data )
	self:UpdateNotLearnedEffect( data )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateSelection()

	self:SetLayerVisible( self:IsSelected(), self.layers.SEL_EFFECT )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateIco( data )

	self.icoWnd:Reset()

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( data.defName )

	self.icoWnd:SetupForItem( craftResultDefName, data.bEnchanted )

	local tooltipData = nil

	if UI:IsDefModule( craftResultDefName ) or UI:IsDefAmmo( craftResultDefName ) then

		tooltipData = {}

    	tooltipData.tooltipType = UI.tooltipTypes.MODULE
    	tooltipData.defName		= craftResultDefName
		tooltipData.bEnchanted	= data.bEnchanted

	else
		tooltipData = UI:GetTooltipForItem( craftResultDefName )
	end

	self.icoWnd:SetTooltipData( tooltipData )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateName( data )

	local strName				= ""
	local strCraftResultCount	= ""
	local strMark				= ""

	local baseColor = self:GetColor( self.layers.NAME )
	local strBaseColor = UI:Color2Str( baseColor )

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( data.defName ) 


	-- собственно имя

	strName = UI:GetEntityLocalizedNameByDef( craftResultDefName, true, false, true, true )
	strName = string.format( "%s%s", strName, strBaseColor )


	-- количечество создаваемых предметов

	if craftResultCount > 1 then
		strCraftResultCount = string.format( "(%d %s)", craftResultCount, UI:GetStringByName( "equipment_itemsUnits" ) )
	end


	-- все вместе

	local str = strName

	if strCraftResultCount ~= "" then
		str = string.format( "%s %s", str, strCraftResultCount )
	end

	self:SetText( str, self.layers.NAME )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateCount( data )

	self.countMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.COUNT )

	if not data.bLearned then
		return
	end

	self:SetLayerVisible( true, self.layers.COUNT )

    local craftResultDefName = UI:GetResourceCraftResult( data.defName )
	local countTotal, storageData = UI:GetItemCount( craftResultDefName )

	local str = UI:MakeItemStorageString( true, storageData.inventory_total, storageData.inventory_max, storageData.equipped_total, nil, true, self:GetColor( self.layers.COUNT ) )
	self.countMetaText:SetText( str, true )	

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateDarkening( data )

	if data.bLearned then
		self:RemoveControl( self.darkeningWnd, self.layers.MAIN_EFFECT )
	else
        self:AddControl( self.darkeningWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.darkeningLocator )
	end

	self:UpdateZOrder()

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateNotLearnedEffect( data )

	self:SetLayerVisible( not data.bLearned, self.layers.NOT_LEARNED_EFFECT )
	self:SetLayerVisible( not data.bLearned, self.layers.NOT_LEARNED_TEXT )

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ItemCraftMulti_BluePrintSlotWnd:UpdateZOrder()

	if self.darkeningWnd and self.darkeningWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( self.darkeningWnd )
	end

end

-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_BluePrintSlot_DarkeningWnd
-- -------------------------------------------------------------------

UI.ItemCraftMulti_BluePrintSlot_DarkeningWnd =
{
    def =
    {
    	className	= "Wnd",

    	props =
    	{
    		name		= "ItemCraftMulti_BluePrintSlot_DarkeningWnd",
    		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
    		isPrototype	= true,
    	},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
    			main		= true,

    			effects =
    			{{
    				defName 			= "itemCraft_bluePrintSlot_darkening",
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
}

-- ---------------------------------------------------------------
-- UI.ItemCraftMulty_CategoriesListWnd
-- ---------------------------------------------------------------

UI.ItemCraftMulty_CategoriesListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "StoreCategoriesListWnd",

		props =
		{
			name	= "ItemCraftMulty_CategoriesListWnd",
		}
	}
}

-- ---------------------------------------------------------------
-- UI.ItemCraftMulti_FilterCheckBox_FitForSelShip
-- ---------------------------------------------------------------

UI.ItemCraftMulti_FilterCheckBox_FitForSelShip =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "ItemCraftMulti_FilterCheckBox_FitForSelShip",
    	},
	}
}

-- ---------------------------------------------------------------
-- UI.ItemCraftMulti_FilterCheckBox_EnoughIngredients
-- ---------------------------------------------------------------

UI.ItemCraftMulti_FilterCheckBox_EnoughIngredients =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "ItemCraftMulti_FilterCheckBox_EnoughIngredients",
    	},
	}
}

-- ---------------------------------------------------------------
-- UI.ItemCraftMulti_FilterCheckBox_CanLearn
-- ---------------------------------------------------------------

UI.ItemCraftMulti_FilterCheckBox_CanLearn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Shop_FilterCheckBox",

    	props =
    	{
    		name		= "ItemCraftMulti_FilterCheckBox_CanLearn",
    	},
	}
}

-- ---------------------------------------------------------------
-- UI.ItemCraftMulti_FilterComboBox_Rank
-- ---------------------------------------------------------------

UI.ItemCraftMulti_FilterComboBox_Rank =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Shop_FilterComboBoxWnd",

    	props =
    	{
    		name	= "ItemCraftMulti_FilterComboBox_Rank"
    	}
	},
}

-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_InventorySizeBtn
-- -------------------------------------------------------------------

UI.ItemCraftMulti_InventorySizeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ItemCraftMulti_InventorySizeBtn",
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

-- ------------------------------------------------------------------------
-- UI.ItemCraftMulti_ActionBtn
-- ------------------------------------------------------------------------

UI.ItemCraftMulti_ActionBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

		props =
		{
			name	= "ItemCraftMulti_ActionBtn",
		}
	},
}

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.ItemCraftMulti_ActionBtn:Reset()

	self:SetBtnText( "" )
	self:Enable( false )

end


-- ------------------------------------------------------------------------
-- UI.ItemCraftMulti_TradingBtn
-- ------------------------------------------------------------------------

UI.ItemCraftMulti_TradingBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn17",

    	props =
    	{
    		name		= "ItemCraftMulti_TradingBtn",
    	}
    },

	textId = "itemCraft_tradingBtn"
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftMulti_TransferToZoneBtn
-- ------------------------------------------------------------------------

UI.ItemCraftMulti_TransferToZoneBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn19",

		props =
		{
			name		= "ItemCraftMulti_TransferToZoneBtn",
		}
	},
	
	textId = "hangar_undock_btn_text"
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftMulti_CrossBtn
-- ------------------------------------------------------------------------

UI.ItemCraftMulti_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "ItemCraftMulti_CrossBtn"
		}
	}
}

-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_BuyWnd
-- -------------------------------------------------------------------

UI.ItemCraftMulti_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ItemCraftMulti_BuyWnd",
    	},
	},

	mainWndName = "ItemCraftMultiWnd",
}


-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_TradeWnd
-- -------------------------------------------------------------------

UI.ItemCraftMulti_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "ItemCraftMulti_TradeWnd",
    	},
	},

	mainWndName = "ItemCraftMultiWnd",
}

-- -------------------------------------------------------------------
-- UI.ItemCraftMulti_CraftConfirmWnd
-- -------------------------------------------------------------------

UI.ItemCraftMulti_CraftConfirmWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemCraft_CraftConfirmWnd",

		props =
		{
			name	= "ItemCraftMulti_CraftConfirmWnd"
		}
	},

	mainWndName = "ItemCraftMultiWnd",
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftMulti_SelItemWnd
-- ------------------------------------------------------------------------

UI.ItemCraftMulti_SelItemWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemCraft_WorkWnd",

		props =
		{
			name	= "ItemCraftMulti_SelItemWnd",
		}
	}
}